@implementation NSDate(RCAdditions)

- (double)rc_timeIntervalUntilNow
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return -v1;
}

+ (id)rc_dateFromString:()RCAdditions possibleFormats:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[NSDate(RCAdditions) rc_dateFromString:possibleFormats:].cold.2();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSDate(RCAdditions) rc_dateFromString:possibleFormats:].cold.1();
LABEL_6:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_8:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1A8581434](v8);
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatterWithFormat:forReuse:", v12, 0, (_QWORD)v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateFromString:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v13);
      if (v15)
        break;
      if (v9 == ++v11)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v8;
        if (v8)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v15 = 0;
  }

  return v15;
}

+ (id)rc_dateFromStringWithISO8601Format:()RCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("yyyy-MM-dd'T'HH:mm:ssZZ");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rc_dateFromString:possibleFormats:", v5, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)rc_dateFromStringWithHTTPHeaderFormat:()RCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("EEE, dd MMM yyyy HH:mm:ss z");
  v9[1] = CFSTR("EEEE, dd-MMM-yy HH:mm:ss z");
  v9[2] = CFSTR("EEE MMM d HH:mm:ss yyyy");
  v9[3] = CFSTR("EEE MMM dd HH:mm:ss z yyyy");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rc_dateFromString:possibleFormats:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)rc_isEarlierThan:()RCAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)rc_isEarlierThanOrEqualTo:()RCAdditions
{
  return (unint64_t)(objc_msgSend(a1, "compare:") + 1) < 2;
}

- (BOOL)rc_isEarlierThan:()RCAdditions withPrecision:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  if (v8 >= v10)
    return 0;
  v11 = 0.001;
  if (a4 != 1)
    v11 = 0.0;
  if (a4 == 2)
    v11 = 1.0;
  return vabdd_f64(v8, v10) >= v11;
}

- (BOOL)rc_isLaterThan:()RCAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)rc_isLaterThanOrEqualTo:()RCAdditions
{
  return (unint64_t)objc_msgSend(a1, "compare:") < 2;
}

- (BOOL)rc_isLaterThan:()RCAdditions withPrecision:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  if (v8 <= v10)
    return 0;
  v11 = 0.001;
  if (a4 != 1)
    v11 = 0.0;
  if (a4 == 2)
    v11 = 1.0;
  return vabdd_f64(v8, v10) >= v11;
}

- (BOOL)rc_isWithinTimeInterval:()RCAdditions ofDate:
{
  double v3;

  objc_msgSend(a1, "timeIntervalSinceDate:");
  return fabs(v3) <= a2;
}

- (uint64_t)rc_dateBySubtractingTimeInterval:()RCAdditions
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:", -a3);
}

+ (uint64_t)rc_dateWithMillisecondTimeIntervalSince1970:()RCAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3 / 1000.0);
}

- (unint64_t)rc_millisecondTimeIntervalSince1970
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (unint64_t)(fmax(v1, 0.0) * 1000.0);
}

- (unint64_t)rc_millisecondTimeIntervalSinceDate:()RCAdditions
{
  id v4;
  double v5;
  unint64_t v6;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSDate(RCAdditions) rc_millisecondTimeIntervalSinceDate:].cold.1();
  objc_msgSend(a1, "timeIntervalSinceDate:", v4);
  v6 = (unint64_t)(fmax(v5, 0.0) * 1000.0);

  return v6;
}

- (id)rc_dateOfEarliestGregorianCalendarDay
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  v7 = 0;
  objc_msgSend(v3, "rangeOfUnit:startDate:interval:forDate:", 16, &v7, 0, a1);
  v5 = v7;

  return v5;
}

- (uint64_t)rc_GregorianCalendarDaysSinceDate:()RCAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSDate(RCAdditions) rc_GregorianCalendarDaysSinceDate:].cold.1();
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v4, "rc_dateOfEarliestGregorianCalendarDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rc_dateOfEarliestGregorianCalendarDay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "day");

  return v11;
}

- (uint64_t)isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateInToday:", a1);

  return v3;
}

- (BOOL)rc_isWeekend
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C99790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 524, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "weekday") == 1 || objc_msgSend(v4, "weekday") == 7;
  return v5;
}

- (uint64_t)rc_isSameDayAs:()RCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "isEqual:", v9);
  return v10;
}

+ (id)rc_earlierDateAllowingNilWithDate:()RCAdditions andDate:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "earlierDate:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

+ (id)rc_laterDateAllowingNilWithDate:()RCAdditions andDate:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "laterDate:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)rc_stringWithISO8601Format
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatterWithFormat:forReuse:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZ"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rc_stringWithYearAndMonthFormat
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_fr_sharedYearAndMonthDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_fr_sharedYearAndMonthDateFormatter
{
  if (_fr_sharedYearAndMonthDateFormatter_once != -1)
    dispatch_once(&_fr_sharedYearAndMonthDateFormatter_once, &__block_literal_global);
  return (id)_fr_sharedYearAndMonthDateFormatter_sharedDateFormatter;
}

+ (void)rc_dateFromString:()RCAdditions possibleFormats:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"formats != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)rc_dateFromString:()RCAdditions possibleFormats:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"string != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)rc_millisecondTimeIntervalSinceDate:()RCAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)rc_GregorianCalendarDaysSinceDate:()RCAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
