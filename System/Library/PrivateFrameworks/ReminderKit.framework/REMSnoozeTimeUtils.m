@implementation REMSnoozeTimeUtils

+ (int64_t)nextThirdsHourFromHour:(int64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t result;

  if ((unint64_t)(a3 % 24) <= 0xFFFFFFFFFFFFFFE7)
    v3 = a3 % 24;
  else
    v3 = a3 % 24 + 24;
  v4 = REMLocalizedTimeOfDayCreationHour(0);
  v5 = REMLocalizedTimeOfDayCreationHour(2uLL);
  v6 = REMLocalizedTimeOfDayCreationHour(5uLL);
  result = 0;
  if (v3 >= v4)
  {
    if (v3 >= v5)
    {
      if (v3 < v6)
        return 2;
      else
        return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

+ (int64_t)nextThirdsHour:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      result = REMLocalizedTimeOfDayCreationHour(0);
      break;
    case 1:
      result = REMLocalizedTimeOfDayCreationHour(2uLL);
      break;
    case 2:
      result = REMLocalizedTimeOfDayCreationHour(5uLL);
      break;
    case 3:
      result = REMLocalizedTimeOfDayCreationHour(0) + 24;
      break;
    default:
      return result;
  }
  return result;
}

@end
