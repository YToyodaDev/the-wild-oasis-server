import { isFuture, isPast, isToday } from 'date-fns';
import supabase from '../services/supabase';
import { subtractDates } from '../utils/helpers';

import { bookings } from './data-bookings';
import { cabins } from './data-cabins';
import { guests } from './data-guests';
import { login, logout } from '../services/apiAuth';

// const originalSettings = {
//   minBookingLength: 3,
//   maxBookingLength: 30,
//   maxGuestsPerBooking: 10,
//   breakfastPrice: 15,
// };

// async function handleDatabaseOperation(operation, tableName, data = null) {
//   try {
//     let result;

//     if (operation === 'delete') {
//       result = await supabase.from(tableName).delete().gt('id', 0);
//     } else if (operation === 'insert') {
//       result = await supabase.from(tableName).insert(data);
//     } else {
//       throw new Error('Invalid operation');
//     }

//     if (result.error) {
//       console.log(`Error in ${operation} operation on ${tableName}: ${result.error.message}`);
//     } else {
//       console.log(`${operation.charAt(0).toUpperCase() + operation.slice(1)} operation successful on ${tableName}`);
//     }
//   } catch (error) {
//     console.log(`Caught an error: ${error.message}`);
//   }
// }


export async function deleteGuests() {
  const { error } = await supabase.from('guests').delete().gt('id', 0);
  if (error) console.log(error.message);
}

export async function deleteCabins() {
  const { error } = await supabase.from('cabins').delete().gt('id', 0);
  if (error) console.log(error.message);
}

export async function deleteBookings() {
  const { error } = await supabase.from('bookings').delete().gt('id', 0);
  if (error) console.log(error.message);
}

export async function createGuests() {
  const { error } = await supabase.from('guests').insert(guests);
  if (error) console.log(error.message);
}

export async function createCabins() {
  const { error } = await supabase.from('cabins').insert(cabins);
  if (error) console.log(error.message);
}

export async function createBookings() {

  const { data: guestsIds } = await supabase
    .from('guests')
    .select('id')
    .order('id');
  const allGuestIds = guestsIds?.map((cabin) => cabin.id);
  const { data: cabinsIds } = await supabase
    .from('cabins')
    .select('id')
    .order('id');
  const allCabinIds = cabinsIds?.map((cabin) => cabin.id);
  
  
if(!allCabinIds || !allGuestIds){return null;}
const finalBookings = bookings?.map((booking) => {
  // Here relying on the order of cabins, as they don't have an ID yet
  const cabin = cabins.at(booking.cabinId - 1);
  if (!cabin) {
    console.error(`Cabin not found for cabinId: ${booking.cabinId}`);
    return null; 
  }

  const numNights = subtractDates(booking.endDate, booking.startDate);
  const cabinPrice = numNights * (cabin.regularPrice - cabin.discount);
  const extrasPrice = booking.hasBreakfast
    ? numNights * 15 * booking.numGuests
    : 0; // hardcoded breakfast price
  const totalPrice = cabinPrice + extrasPrice;

  let status;
  if (
    isPast(new Date(booking.endDate)) &&
    !isToday(new Date(booking.endDate))
  )
    status = 'checked-out';
  if (
    isFuture(new Date(booking.startDate)) ||
    isToday(new Date(booking.startDate))
  )
    status = 'unconfirmed';
  if (
    (isFuture(new Date(booking.endDate)) ||
      isToday(new Date(booking.endDate))) &&
    isPast(new Date(booking.startDate)) &&
    !isToday(new Date(booking.startDate))
  )
    status = 'checked-in';

  return {
    ...booking,
    numNights,
    cabinPrice,
    extrasPrice,
    totalPrice,
    guestId: allGuestIds.at(booking.guestId - 1),
    cabinId: allCabinIds.at(booking.cabinId - 1),
    status,
  };
}).filter((booking): booking is NonNullable<typeof booking> => booking !== null); 

try{
  await supabase.from('bookings').insert(finalBookings);
}catch(error){
 console.log("error", error);
}
}




export const resetAll = async ()=>{
  await login()
  
    // Perform deletions first
    await deleteBookings();
    await deleteGuests();
    await deleteCabins();
    // Perform creations last
    await createGuests();
    await createCabins();
    await createBookings();
    
    await logout()
  }
  
export  async function resetBookings() {
    await deleteBookings();
    await createBookings();
  }

