import { Sequelize } from 'sequelize';
import { AppError } from '../utils/index.js';

export const sequelize = process.env.DATABASE_URL
  ? new Sequelize(process.env.DATABASE_URL, {
      dialect: 'postgres',
    })
  : new Sequelize('mtrr_unefa_db', 'postgres', 'tu_clave_local', {
      host: '127.0.0.1',
      dialect: 'postgres'
    });

export async function connectionDatabase() {
    return sequelize.authenticate()
        .then(() => sequelize.sync({ alter: true }))
        .catch((err) => { throw new AppError(err.message, 500) });
}

export default sequelize;