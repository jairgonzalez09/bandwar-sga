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