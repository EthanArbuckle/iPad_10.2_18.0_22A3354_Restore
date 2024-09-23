@implementation PPEventRankerDateUtils

+ (id)dateTwoWeeksPriorToDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -1209600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

+ (double)secondsFromMidnight:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 224, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 3600 * objc_msgSend(v6, "hour");
  v8 = v7 + 60 * objc_msgSend(v6, "minute");
  v9 = (double)(v8 + objc_msgSend(v6, "second"));

  return v9;
}

@end
