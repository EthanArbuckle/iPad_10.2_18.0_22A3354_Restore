@implementation NSDate(TADateFormat)

- (__CFString)getDateString
{
  id v2;
  __CFString *v3;

  if (a1)
  {
    if (getDateString_onceTokenForDateFormatter != -1)
      dispatch_once(&getDateString_onceTokenForDateFormatter, &__block_literal_global_1);
    v2 = (id)gTADateFormatDateFormatter;
    objc_sync_enter(v2);
    objc_msgSend((id)gTADateFormatDateFormatter, "stringFromDate:", a1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v2);

  }
  else
  {
    v3 = CFSTR("-");
  }
  return v3;
}

- (id)getNextDateAtHour:()TADateFormat
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextDateAfterDate:matchingHour:minute:second:options:", a1, a3, 0, 0, 512);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)getMinutesSinceStartOfDay
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v3);
  v5 = (uint64_t)v4 / 60;

  return v5;
}

@end
