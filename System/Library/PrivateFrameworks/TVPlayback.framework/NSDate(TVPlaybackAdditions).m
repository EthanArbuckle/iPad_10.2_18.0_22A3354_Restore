@implementation NSDate(TVPlaybackAdditions)

+ (BOOL)tvp_networkTimeIsApproximatelyCorrect
{
  double v0;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return v0 >= 465771728.0;
}

+ (id)tvp_dateWithMillisecondsSince1970:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend([a1 alloc], "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue") / 1000.0);
  else
    v5 = 0;

  return v5;
}

- (id)tvp_dateFlooredToNearestMinute:()TVPlaybackAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32960, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "minute");
  v8 = v7;
  v9 = v7 / a3;
  v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v10, "setMinute:", (int)v9 * a3 - v8);
  objc_msgSend(v10, "setSecond:", -objc_msgSend(v6, "second"));
  objc_msgSend(v10, "setNanosecond:", -objc_msgSend(v6, "nanosecond"));
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v10, a1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tvp_dateCeiledToNearestMinute:()TVPlaybackAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32960, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "minute");
  v8 = objc_msgSend(v6, "second");
  v9 = objc_msgSend(v6, "nanosecond");
  v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v11 = v10;
  if (v7 % a3)
    v12 = 0;
  else
    v12 = v8 <= 0;
  if (!v12 || !v8 && v9 >= 1)
    objc_msgSend(v10, "setMinute:", a3 + a3 * (v7 / a3) - v7);
  objc_msgSend(v11, "setSecond:", -v8);
  objc_msgSend(v11, "setNanosecond:", -v9);
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v11, a1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)tvp_dateByAddingDays:()TVPlaybackAdditions
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setDay:", a3);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)tvp_dateBySubtractingDays:()TVPlaybackAdditions
{
  return objc_msgSend(a1, "tvp_dateByAddingDays:", -a3);
}

- (uint64_t)tvp_isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_isEqualToDateIgnoringTime:", v2);

  return v3;
}

- (uint64_t)tvp_isTomorrow
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvp_dateByAddingDays:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "_isEqualToDateIgnoringTime:", v3);

  return v4;
}

- (uint64_t)tvp_isYesterday
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvp_dateBySubtractingDays:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "_isEqualToDateIgnoringTime:", v3);

  return v4;
}

- (BOOL)_isEqualToDateIgnoringTime:()TVPlaybackAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;

  v4 = (void *)MEMORY[0x24BDBCE48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "year");
  if (v9 == objc_msgSend(v8, "year") && (v10 = objc_msgSend(v7, "month"), v10 == objc_msgSend(v8, "month")))
  {
    v11 = objc_msgSend(v7, "day");
    v12 = v11 == objc_msgSend(v8, "day");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
