import supabase from './supabase';
import 'dotenv/config';

const email = process.env.EMAIL;
const password = process.env.PASSWORD;

export async function login(){
  if(email && password){
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });
  console.log("login successful")
  if (error) {throw new Error(error.message);}
  return data;
  
}else{
  throw new Error('Missing email or password in environment variables');}
}
export async function logout(){
  const { error } = await supabase.auth.signOut();
  console.log("logout successful")
  if (error) throw new Error(error.message);
}

