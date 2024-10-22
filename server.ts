import cors from 'cors';
import 'dotenv/config';
import express, { Request, Response } from 'express';
import { createBookings, createCabins, deleteAll, deleteAllUsersExceptOne, deleteBookings, deleteCabins, resetAll, resetSetting } from './data/uploader.js';
import { bearerAuth } from './middleware.js';
import { login, logout } from './services/apiAuth.js';
import { api } from './services/axios.js';
import supabase from './services/supabase.js';

const sec =  Number(process.env.INTERVAL) || 1;
const interval = sec * 1000; 

const app = express();
const port = process.env.PORT || 4000;

app.use(express.json());
app.use(cors());

const makeRequest = async (req: Request, res: Response,fn: ()=>void,task: string)=>{
  try {
    await login()
    console.log(`Performing ${task}...`);
    await fn()
    res.status(200).json({ message: `${task} successful!` });
  } catch (error) {
    console.error(`Error during ${task}`, error);
    res.status(500).json({ message: `Error during ${task}`, error: error });
  }
  finally{
    await logout();
  }
}


app.get('/api/check-connection',bearerAuth, async (req, res) => {
  try {
    const { data, error } = await supabase.from('settings').select('*').limit(1);
    if (error) {
      console.error('Error connecting to Supabase:', error.message);
       res.status(500).json({ message: 'Error connecting to Supabase', error: error.message });
    }
    if (data && data.length > 0) {
       res.status(200).json({ message: 'Connection successful', data: data[0] });
    } else {
       res.status(200).json({ message: 'Connection successful, but no data found in the database' });
    }
  } catch (error) {
    console.error('Unexpected error:', error);
     res.status(500).json({ message: 'Unexpected error occurred', error: error });
  }
  
  
})

app.get('/pin',(req, res)=>{
  res.send();
})

app.get('/api/all/reset',bearerAuth, async (req, res) => {
  await makeRequest(req,res,resetAll,'reset data')
});
app.get('/api/all/delete',bearerAuth, async (req, res) => {
  await makeRequest(req,res,deleteAll,'delete all data')
});

app.get('/api/cabins/delete/all',bearerAuth, async (req, res) => {

  await makeRequest(req,res,deleteCabins,'delete all cabin data')
});
app.get('/api/cabins/reset',bearerAuth, async (req, res) => {
  await makeRequest(req,res,createCabins,'reset cabin data')
});

app.get('/api/bookings/delete/all',bearerAuth, async (req, res) => {
  await makeRequest(req,res,deleteBookings,'delete all booking data')
});
app.get('/api/bookings/reset',bearerAuth, async (req, res) => {
  await makeRequest(req,res,createBookings,'reset booking data')
});

app.get('/api/settings/reset',bearerAuth, async (req, res) => {
  await makeRequest(req,res,resetSetting,'reset settings data')
});

app.get('/api/users/reset',bearerAuth, async (req, res) => {
  await makeRequest(req,res,deleteAllUsersExceptOne,'reset users data')
});

app.listen(port, async () => {
  console.log(`server started on localhost:${port}`);
});

function reloadWebsite() {
  api.get('/pin')
    .then(response => {
      console.log(`Reloaded at ${new Date().toISOString()}: Status Code ${response.status}`);
    })
    .catch(error => {
      console.error(`Error reloading at ${new Date().toISOString()}:`, error.message);
    })}

setInterval(reloadWebsite, interval);

