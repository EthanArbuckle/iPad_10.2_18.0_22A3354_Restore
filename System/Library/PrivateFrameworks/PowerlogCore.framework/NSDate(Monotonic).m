@implementation NSDate(Monotonic)

- (id)convertFromMonotonicToSystem
{
  void *v2;
  void *v3;

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromTimeReference:toTimeReference:", a1, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)convertFromBasebandToMonotonic
{
  void *v2;
  void *v3;

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromTimeReference:toTimeReference:", a1, 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)convertFromSystemToMonotonic
{
  void *v2;
  void *v3;

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromTimeReference:toTimeReference:", a1, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isInMonotonicFutureWithDistance:()Monotonic
{
  void *v4;
  double v5;
  _BOOL8 v6;

  objc_msgSend((id)objc_opt_class(), "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v4);
  v6 = v5 > fabs(a2);

  return v6;
}

+ (id)monotonicDate
{
  void *v0;
  void *v1;

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentTimeFromTimeReference:toTimeReference:", 2, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)isInMonotonicPastWithDistance:()Monotonic
{
  void *v4;
  double v5;
  _BOOL8 v6;

  objc_msgSend((id)objc_opt_class(), "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v4);
  v6 = v5 < -fabs(a2);

  return v6;
}

- (double)timeIntervalSinceMonitonicNow
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v2);
  v4 = v3;

  return v4;
}

+ (id)monotonicDateWithTimeIntervalSinceNow:()Monotonic
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)convertFromMonotonicToBaseband
{
  void *v2;
  void *v3;

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromTimeReference:toTimeReference:", a1, 0, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isInMonotonicFuture
{
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend((id)objc_opt_class(), "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v2);
  v4 = v3 > 60.0;

  return v4;
}

+ (BOOL)dateIsMidnightLocalTime:()Monotonic
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  double v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "nearestMidnightBeforeDate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nearestMidnightAfterDate:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    if (fabs(v6) >= 600.0)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", v3);
      v7 = fabs(v8) < 600.0;
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)nearestMidnightBeforeDate:()Monotonic
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)nearestMidnightAfterDate:()Monotonic
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setHour:", 0);
  objc_msgSend(v6, "setMinute:", 0);
  objc_msgSend(v6, "setSecond:", 0);
  objc_msgSend(v5, "nextDateAfterDate:matchingComponents:options:", v4, v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (__CFString)filenameDateStringWithStartDate:()Monotonic endDate:
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  _BOOL4 v20;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = &stru_1E6A56538;
  if (v5 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "nearestMidnightAfterDate:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v5);
    if (v10 < 600.0)
    {
      v11 = v9;

      v5 = v11;
    }
    objc_msgSend((id)objc_opt_class(), "nearestMidnightAfterDate:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v7);
    if (v13 < 600.0)
    {
      v14 = v12;

      v7 = v14;
    }
    objc_msgSend((id)objc_opt_class(), "defaultDateFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", v16);
    if (objc_msgSend((id)objc_opt_class(), "dateIsMidnightLocalTime:", v7))
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", v5);
      v20 = v19 <= 86400.0;
    }
    else
    {
      v20 = 0;
    }
    if ((v18 | v20) == 1)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v16, v22);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v16, v17);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)defaultDateFormatter
{
  if (defaultDateFormatter_onceToken != -1)
    dispatch_once(&defaultDateFormatter_onceToken, &__block_literal_global_5);
  return (id)defaultDateFormatter_f;
}

@end
