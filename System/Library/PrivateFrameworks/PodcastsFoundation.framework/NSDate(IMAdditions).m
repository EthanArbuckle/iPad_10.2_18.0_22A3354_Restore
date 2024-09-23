@implementation NSDate(IMAdditions)

- (id)dateForBeginningOfHour
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 60, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setHour:", objc_msgSend(v3, "hour"));
  objc_msgSend(v3, "setMinute:", 0);
  objc_msgSend(v3, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)isEqualToDay:()IMAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 30, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 30, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToDate:", v10);

  return v11;
}

- (BOOL)isEqualToWeek:()IMAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 8198, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "components:fromDate:", 8198, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "year");
  if (v9 == objc_msgSend(v8, "year"))
  {
    v10 = objc_msgSend(v7, "weekOfYear");
    v11 = v10 == objc_msgSend(v8, "weekOfYear");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToYear:()IMAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "components:fromDate:", 6, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "era");
  if (v9 == objc_msgSend(v8, "era"))
  {
    v10 = objc_msgSend(v7, "year");
    v11 = v10 == objc_msgSend(v8, "year");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dateWithDeltaDays:()IMAdditions
{
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", a3);
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateWithDeltaWeeks:()IMAdditions
{
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setWeekOfYear:", a3);
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToDay:", v2);

  return v3;
}

- (BOOL)isFuture
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2);

  return v3 == 1;
}

- (uint64_t)wasYesterday
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithDeltaDays:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isEqualToDay:", v3);

  return v4;
}

- (uint64_t)isThisWeek
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToWeek:", v2);

  return v3;
}

- (uint64_t)wasLastWeek
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithDeltaWeeks:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isEqualToWeek:", v3);

  return v4;
}

- (BOOL)wasLessThanAWeekAgo
{
  void *v3;
  void *v4;
  uint64_t v5;

  if ((objc_msgSend(a1, "isFuture") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithDeltaWeeks:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "compare:", v4);

  return v5 == 1;
}

- (uint64_t)isNextWeek
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithDeltaWeeks:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isEqualToWeek:", v3);

  return v4;
}

- (id)dateAtWeekStart
{
  void *v2;
  id v3;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v5, 0, a1);
  v3 = v5;

  return v3;
}

+ (id)dateFormatter
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.itunesmobile.nsdate-imadditions.nsdateformatter"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLocale:", v3);

    objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("com.apple.itunesmobile.nsdate-imadditions.nsdateformatter"));
  }

  return v2;
}

+ (id)dateStringFromDate:()IMAdditions withDateStyle:timeStyle:isRelative:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "threadDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("com.apple.itunesmobile.nsdate-imadditions.datestringformatters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("com.apple.itunesmobile.nsdate-imadditions.datestringformatters"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu-%d"), a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLocale:", v15);

    objc_msgSend(v14, "setDateStyle:", a4);
    objc_msgSend(v14, "setTimeStyle:", a5);
    objc_msgSend(v14, "setDoesRelativeDateFormatting:", a6);
    objc_msgSend(v12, "setObject:forKey:", v14, v13);
  }
  objc_msgSend(v14, "stringFromDate:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)shortDateStringFromDateNoRel:()IMAdditions
{
  return objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 1, 0, 0);
}

+ (uint64_t)shortDateStringFromDate:()IMAdditions
{
  return objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 1, 0, 1);
}

+ (uint64_t)mediumDateStringFromDate:()IMAdditions
{
  return objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 2, 0, 1);
}

+ (uint64_t)longDateStringFromDate:()IMAdditions
{
  return objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 3, 0, 1);
}

+ (uint64_t)shortTimeStringFromDate:()IMAdditions
{
  return objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 0, 1, 1);
}

+ (id)longDayStringFromDate:()IMAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3578];
  v5 = (void *)MEMORY[0x1E0C99DC8];
  v6 = a3;
  objc_msgSend(v5, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDateFormat:", v8);
  objc_msgSend(v9, "stringFromDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)dateFormatterWithTemplate:()IMAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(CFSTR("com.apple.itunesmobile.nsdate-imadditions.nsdateformatter"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.itunesmobile.nsdate-imadditions.nsdateformatter.locale"), "stringByAppendingString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v7, "removeObjectForKey:", v4);
      objc_msgSend(v7, "removeObjectForKey:", v5);
    }
    objc_msgSend(v7, "objectForKey:", v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v12, "setLocale:", v9);
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v3, 0, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDateFormat:", v13);
      objc_msgSend(v7, "setObject:forKey:", v12, v4);
      objc_msgSend(v9, "localeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v14, v5);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)monthYearFromDate:()IMAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "dateFormatterWithTemplate:", CFSTR("MMMM yyyy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dayOfWeekFromDate:()IMAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3578];
  v5 = (void *)MEMORY[0x1E0C99DC8];
  v6 = a3;
  objc_msgSend(v5, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDateFormat:", v8);
  objc_msgSend(v9, "stringFromDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)postTimeStringFromDate:()IMAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isToday"))
  {
    objc_msgSend(a1, "shortTimeStringFromDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v4, "wasYesterday") & 1) != 0 || (objc_msgSend(v4, "thisWeek") & 1) == 0)
  {
    objc_msgSend(a1, "mediumDateStringFromDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "longDayStringFromDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)amPMStringFromDate:()IMAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFormatFromTemplate:options:locale:", CFSTR("hh:mma"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("a"));
  if (v9)
  {
    objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", 0, v8, &stru_1E5500770);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDateFormat:", v10);
    objc_msgSend(v11, "stringFromDate:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)shortStandardTimeStringFromDate:()IMAdditions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)shortStandardTimeStringFromDate__sDateFormatter;
  if (!shortStandardTimeStringFromDate__sDateFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)shortStandardTimeStringFromDate__sDateFormatter;
    shortStandardTimeStringFromDate__sDateFormatter = (uint64_t)v5;

    v7 = (void *)shortStandardTimeStringFromDate__sDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v8);

    objc_msgSend((id)shortStandardTimeStringFromDate__sDateFormatter, "setTimeStyle:", 1);
    v4 = (void *)shortStandardTimeStringFromDate__sDateFormatter;
  }
  objc_msgSend(v4, "stringFromDate:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mailLikeDescriptionFromDate:()IMAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isFuture"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "shortDateStringFromDateNoRel:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isToday"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "shortTimeStringFromDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "wasLessThanAWeekAgo") && (objc_msgSend(v4, "wasYesterday") & 1) == 0)
  {
    objc_msgSend(a1, "dayOfWeekFromDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "shortDateStringFromDate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)dateForBeginningOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDay:", objc_msgSend(v3, "day"));
  objc_msgSend(v3, "setHour:", 0);
  objc_msgSend(v3, "setMinute:", 0);
  objc_msgSend(v3, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateForEndOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDay:", objc_msgSend(v3, "day"));
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateForBeginningOfMonth
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDay:", 1);
  objc_msgSend(v3, "setHour:", 0);
  objc_msgSend(v3, "setMinute:", 0);
  objc_msgSend(v3, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateForBeginningOfYear
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setMonth:", 1);
  objc_msgSend(v3, "setDay:", 1);
  objc_msgSend(v3, "setHour:", 0);
  objc_msgSend(v3, "setMinute:", 0);
  objc_msgSend(v3, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)inSameWeekAs:()IMAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 8196, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 8196, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "year");
  if (v9 == objc_msgSend(v8, "year"))
  {
    v10 = objc_msgSend(v7, "weekOfYear");
    v11 = v10 == objc_msgSend(v8, "weekOfYear");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)lastWeek
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "inSameWeekAs:", v2);

  return v3;
}

- (uint64_t)thisWeek
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "inSameWeekAs:", v2);

  return v3;
}

- (uint64_t)nextWeek
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 604800.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "inSameWeekAs:", v2);

  return v3;
}

@end
