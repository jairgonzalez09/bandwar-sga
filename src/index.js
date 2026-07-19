import express from 'express';
import 'dotenv/config';
import path from 'path';

import morgan from 'morgan';
import routes from './routes/directory.js';
import loadMiddlewares from './middlewares/index.js';
import { errorHandler } from './middlewares/errorHandling.js';
import startServer from './server.js';
import './models/index.js';

const app = express();

loadMiddlewares(app);
app.use(morgan('dev'));

const fontPackages = {
    'plus-jakarta-sans': '@fontsource/plus-jakarta-sans',
    'inter': '@fontsource/inter',
    'hanken-grotesk': '@fontsource/hanken-grotesk',
    'archivo-narrow': '@fontsource/archivo-narrow',
    'jetbrains-mono': '@fontsource/jetbrains-mono',
    'material-symbols-outlined': '@fontsource/material-symbols-outlined',
};

for (const [route, pkg] of Object.entries(fontPackages)) {
    app.use(`/fonts/${route}`, express.static(
        path.join(process.cwd(), 'node_modules', pkg)
    ));
}

app.use('/', routes);
app.use('/uploads', express.static(path.join(process.cwd(), 'uploads')));
// REQUISITO OBLIGATORIO: Ruta de verificación de salud (Self-Healing)
app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'UP',
        timestamp: new Date(),
        environment: process.env.NODE_ENV || 'production'
    });
});

app.use(errorHandler);

startServer(app);

process.on('uncaughtException', (error) => {
    console.error(`[CRITICAL RUNBOOK] Excepción no controlada: ${error.message}`);
    process.exit(1); 
});

export default app;