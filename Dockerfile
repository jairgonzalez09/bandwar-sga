# 1. Usar una imagen limpia de Node.js en su versión LTS
FROM node:20-alpine

# 2. Crear y definir el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# 3. Copiar los archivos de dependencias
COPY package*.json ./

# 4. Instalar solo las dependencias de producción (evita herramientas de desarrollo pesadas)
RUN npm ci --only=production

# 5. Copiar el resto del código de la aplicación
COPY . .

# 6. Exponer el puerto en el que escucha tu servidor Express
EXPOSE 3000

# 7. Comando para arrancar la aplicación en modo producción
CMD ["node", "src/app.js"]