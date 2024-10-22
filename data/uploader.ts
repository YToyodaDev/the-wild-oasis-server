import { isFuture, isPast, isToday } from 'date-fns';
import supabase from '../services/supabase';
import { subtractDates } from '../utils/helpers';

import { bookings } from './data-bookings';
import { cabins } from './data-cabins';
import { guests } from './data-guests';
const authUser = process.env.AUTH_USER = "authuser@example.com"

const originalSettings = {
  minBookingLength: 3,
  maxBookingLength: 30,
  maxGuestsPerBooking: 10,
  breakfastPrice: 15,
};


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


export async function deleteAllUsersExceptOne(keepEmail = authUser) {
  try {
    const { data: users, error: listError } = await supabase.auth.admin.listUsers();
    if (listError) throw new Error(`Error fetching users: ${listError.message}`);
    const usersToDelete = users?.users.filter((user) => user.email !== keepEmail);

    if (!usersToDelete || usersToDelete.length === 0) {
      console.log('No users to delete, or only the specified user remains.');
      return;
    }

    for (const user of usersToDelete) {
      const { error: deleteError } = await supabase.auth.admin.deleteUser(user.id);
      if (deleteError) {
        console.error(`Failed to delete user with ID ${user.id}: ${deleteError.message}`);
      } else {
        console.log(`Successfully deleted user with ID ${user.id}`);
      }
    }
  } catch (error) {
    console.error(`Error occurred: ${error}`);
  }
}


export async function resetSetting() {
  const { data, error } = await supabase
    .from('settings')
    .update(originalSettings)
    .eq('id', 1)
    .single();

  if (error) {
    console.error(error);
    throw new Error('Settings could not be updated');
  }
  return data;
}
export const deleteAll = async()=>{
  await deleteBookings();
  await deleteGuests();
  await deleteCabins();

}


export const resetAll = async ()=>{
  
    // Perform deletions first
    await deleteAll()
    // Perform creations last
    await createGuests();
    await createCabins();
    await createBookings();
  
    await resetSetting();
    await deleteAllUsersExceptOne();
  }
  
export  async function resetBookings() {
    await deleteBookings();
    await createBookings();
  }

