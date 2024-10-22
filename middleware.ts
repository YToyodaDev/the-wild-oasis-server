import  {  Request, Response, NextFunction } from 'express';
import 'dotenv/config';

const isValidToken = (token: string): boolean => {
    return token === process.env.TOKEN; 
  };
  
 export  const basicAuth = (req: Request, res: Response, next: NextFunction) => {
    const authHeader = req.headers['authorization'];
    if (!authHeader) {
       res.sendStatus(401); 
    }else{
    const token = authHeader.split(' ')[1]; 
    const [username, password] = Buffer.from(token, 'base64').toString().split(':');
    if (username === process.env.USERNAME && password === process.env.PASSWORD) {
      next(); 
    } else {
       res.sendStatus(403); 
    }
  }
  }
  
  // Bearer Token Authentication Middleware
  export const bearerAuth = (req: Request, res: Response, next: NextFunction) => {
    next();
    const authHeader = req.headers['authorization'];
  
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
       res.status(401).send('Unauthorized');
    }else{
  
    const token = authHeader.split(' ')[1]; 
    if (isValidToken(token)) {
      next(); 
    } else {
       res.status(403).send('Forbidden'); 
    }}
  };
  
  