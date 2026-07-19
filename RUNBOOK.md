# 📑 RUNBOOK.md: SOPORTE OPERATIVO COMO CÓDIGO (DOC-AS-CODE)
**Sistema:** Plataforma Web de Caracterización de Fortificaciones y Obstáculos en MTRR
**Institución:** UNEFA - Ingeniería de Sistemas
**Materia:** Implantación de Sistemas

---

## 🔍 FASE #1: DIAGNÓSTICO (VERIFICACIÓN DE SALUD)
Ante la sospecha de degradación o caída del servicio, el operador debe validar el estado del sistema utilizando los siguientes puntos de verificación exactos:

### 1.1 Verificación de Salud de la API (Health Check)
* **URL de Producción:** `https://fortificaciones-y-obstaculos-production.up.railway.app/health`
* **Comando CLI de Diagnóstico:**
  ```bash
  curl -i [https://fortificaciones-y-obstaculos-production.up.railway.app/health](https://fortificaciones-y-obstaculos-production.up.railway.app/health)


```markdown
## 🚨 FASE #2: PROTOCOLO ANTE CAÍDAS Y ESCALADO (CONTENCIÓN DEL SLA)
Si el diagnóstico confirma una degradación del servicio, se aplicará el siguiente procedimiento mecánico de contención estructurado en tres niveles de soporte:

### Nivel 1 (L1) - Soporte Automatizado e Infraestructura Base
* **Acción:** Mitigación por reinicio de contenedores desatendidos (*Auto-healing*).
* **Procedimiento:** El código base en `src/index.js` intercepta fallas críticas mediante `process.on('uncaughtException')`. El proceso se cierra con código de salida `1`, forzando a la orquestación de Railway a levantar automáticamente una instancia limpia en menos de 30 segundos.
* **Intervención Manual L1:** Si el bucle persiste, el operador L1 debe ingresar al dashboard web de Railway, seleccionar el backend y presionar el botón **"Redeploy"** para vaciar la memoria caché del contenedor.

### Nivel 2 (L2) - Soporte de Aplicación y Base de Datos (Ingeniero Implantador)
* **Acción:** Fallo en la capa de persistencia de datos (PostgreSQL).
* **Procedimiento:** Si el frontend arroja errores en la carga de los obstáculos del manual interactivo, el ingeniero L2 debe validar las variables de entorno (`DATABASE_URL`) y forzar un reinicio del nodo de base de datos en Railway para liberar el pool de conexiones saturadas.

### Nivel 3 (L3) - Soporte de Infraestructura Crítica y CI/CD (Administrador de Sistemas)
* **Acción:** Corrupción de la tubería de despliegue automatizado (GitHub Actions bloqueado por reglas del Blue Team).
* **Procedimiento:** Si el despliegue es rechazado o el pipeline falla, el ingeniero L3 debe resolver conflictos en local mediante `git pull origin main`, y realizar un empuje corregido a la rama correspondiente para restablecer la disponibilidad.

---

## 💾 FASE #3: RECUPERACIÓN ANTE DESASTRES (REGLA DE RESPALDOS 3-2-1)
En caso de una corrupción total de datos, eliminación accidental de la base de datos PostgreSQL en la nube, o compromiso del entorno de producción, se ejecutará el siguiente plan de restauración absoluta basado en la **Estrategia 3-2-1**:

### 3.1 Arquitectura del Respaldo (Regla 3-2-1)
1. **3 Copias de Datos:** Se mantiene la base de datos de producción activa, un clon local de respaldo (`backup_db.sql`), y copias de seguridad de los archivos de configuración (`.env`).
2. **2 Medios Diferentes:** Los respaldos se guardan en el volumen de disco local del administrador (disco duro SSD) y copias en el repositorio privado redundante.
3. **1 Copia Fuera de Línea / Fuera del Sitio (Offsite):** Un archivo comprimido mensual con la base de datos estructurada y los esquemas se exporta a una cuenta de almacenamiento externa aislada (Google Drive) fuera de la infraestructura de Railway.

### 3.2 Procedimiento de Restauración desde Cero
Si el entorno de producción es destruido por completo, el protocolo de recuperación secuencial es:

1. **Aprovisionamiento:** Crear una nueva base de datos PostgreSQL vacía en Railway.
2. **Inyección de Esquema:** Levantar el backend de Express en local apuntando a la nueva URL y ejecutar las migraciones mediante Sequelize para levantar las tablas.
3. **Restauración de Datos:** Ejecutar el volcado del último respaldo válido (`.sql`) descargado desde el almacenamiento externo usando la herramienta de terminal:
   ```bash
   psql -h URL_NUEVA_BASE_DATOS -U usuario -d nombre_bd -f backup_db.sql