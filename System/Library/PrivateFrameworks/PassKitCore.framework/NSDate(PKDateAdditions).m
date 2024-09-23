@implementation NSDate(PKDateAdditions)

+ (id)dateWithDaysFromNow:()PKDateAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)dateWithDaysBeforeNow:()PKDateAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithDaysFromNow:", -a3);
}

+ (uint64_t)dateForTomorrow
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithDaysFromNow:", 1);
}

+ (uint64_t)dateForYesterday
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithDaysBeforeNow:", 1);
}

- (BOOL)isDateEqualToDateIgnoringTime:()PKDateAdditions
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

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 9980, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 9980, v5);
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

- (BOOL)isDateAtLeastNDays:()PKDateAdditions afterDate:
{
  void *v5;
  _BOOL8 v6;

  if (!a4)
    return 0;
  objc_msgSend(a4, "dateByAddingTimeInterval:", (double)a3 * 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", a1) != 1;

  return v6;
}

- (BOOL)isDateLessThanNDays:()PKDateAdditions afterDate:
{
  void *v5;
  _BOOL8 v6;

  if (!a4)
    return 0;
  objc_msgSend(a4, "dateByAddingTimeInterval:", (double)a3 * 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", a1) != -1;

  return v6;
}

- (uint64_t)isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isDateEqualToDateIgnoringTime:", v2);

  return v3;
}

- (uint64_t)isTomorrow
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateForTomorrow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isDateEqualToDateIgnoringTime:", v2);

  return v3;
}

- (uint64_t)isYesterday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateForYesterday");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isDateEqualToDateIgnoringTime:", v2);

  return v3;
}

- (id)dateWithoutTime
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 9756, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)numberOfWeeksFromNow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithoutTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateWithoutTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:toDate:options:", 0x2000, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "weekOfYear");
  return v7;
}

- (uint64_t)numberOfMonthsFromNow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithoutTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateWithoutTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:toDate:options:", 8, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "month");
  return v7;
}

- (uint64_t)numberOfYearsFromNow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithoutTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateWithoutTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:toDate:options:", 4, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "year");
  return v7;
}

@end
