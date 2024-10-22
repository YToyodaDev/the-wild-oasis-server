import axios from "axios";
import 'dotenv/config';

export const api = axios.create({
    baseURL: process.env.SERVER_URL,
  })