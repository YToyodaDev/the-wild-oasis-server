import { createClient } from '@supabase/supabase-js';
import 'dotenv/config';
import { Database } from '../supabase/database.types';
export const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
if (!supabaseUrl || !supabaseKey) {
    throw new Error('Missing Supabase URL or key in environment variables');
}
  
const supabase = createClient<Database>(supabaseUrl, supabaseKey);

export default supabase;
