import { formatDistance, parseISO, differenceInDays } from 'date-fns';
// import { differenceInDays } from 'date-fns/esm';
type DateInput = string | Date;

export const subtractDates = (
  dateStr1: DateInput,
  dateStr2: DateInput
): number =>
  differenceInDays(parseISO(String(dateStr1)), parseISO(String(dateStr2)));

export const formatDistanceFromNow = (dateStr: DateInput) =>
  formatDistance(parseISO(dateStr as string), new Date(), {
    addSuffix: true,
  })
    .replace('about ', '')
    .replace('in', 'In');

// Define the function with TypeScript types
export const getToday = (options: { end?: boolean } = {}): string => {
  const today = new Date();

  // Check if the 'end' option is true
  if (options.end) {
    // Set to the last second of the day (23:59:59.999)
    today.setUTCHours(23, 59, 59, 999);
  } else {
    // Set to the start of the day (00:00:00.000)
    today.setUTCHours(0, 0, 0, 0);
  }

  return today.toISOString();
};

export const formatCurrency = (value: number) =>
  new Intl.NumberFormat('en', { style: 'currency', currency: 'USD' }).format(
    value
  );
