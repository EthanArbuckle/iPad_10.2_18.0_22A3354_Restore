@implementation NSDate(MTAdditions)

- (BOOL)inSameYearAs:()MTAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 4, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "year");
  v10 = v9 == objc_msgSend(v8, "year");

  return v10;
}

- (id)verboseDisplayStringWithoutTime
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "mt_verboseDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mt_verboseDateFormatter
{
  if (mt_verboseDateFormatter_onceToken != -1)
    dispatch_once(&mt_verboseDateFormatter_onceToken, &__block_literal_global_35);
  return (id)mt_verboseDateFormatter__s__dateFormatterWithYear;
}

- (id)microDateString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYearAbbrevMonth");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mt_dateFormatterNoYearAbbrevMonth
{
  if (mt_dateFormatterNoYearAbbrevMonth_onceToken != -1)
    dispatch_once(&mt_dateFormatterNoYearAbbrevMonth_onceToken, &__block_literal_global_32);
  return (id)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth;
}

- (id)verboseDisplayStringWithoutTimeAndCurrentYear
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isThisYear"))
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYear");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_verboseDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)isThisYear
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "inSameYearAs:", v2);

  return v3;
}

- (id)friendlyDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToDate:", v5))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterRelativeDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
LABEL_9:
    objc_msgSend(v6, "stringFromDate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v5, "mt_dateWithDeltaDays:", -7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "compare:", v9);

  if (v10 != 1)
  {
    if (objc_msgSend(v3, "isThisYear"))
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYear");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterWithYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v3;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dayOfWeekFromDate:abbreviated:", v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (id)yearString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterJustYear");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)abbreviatedFriendlyDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToDate:", v5))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterRelativeDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
LABEL_9:
    objc_msgSend(v6, "stringFromDate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v5, "mt_dateWithDeltaDays:", -7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "compare:", v9);

  if (v10 != 1)
  {
    if (objc_msgSend(v3, "isThisYear"))
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYearAbbrevMonth");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterWithYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v3;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dayOfWeekFromDate:abbreviated:", v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (uint64_t)microFriendlyDisplayString
{
  return objc_msgSend(a1, "microFriendlyDisplayString:", 1);
}

- (uint64_t)microUnabbreviatedFriendlyDisplayString
{
  return objc_msgSend(a1, "microFriendlyDisplayString:", 0);
}

- (id)microFriendlyDisplayString:()MTAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToDate:", v8))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterRelativeDay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v8;
LABEL_9:
    objc_msgSend(v9, "stringFromDate:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v8, "mt_dateWithDeltaDays:", -7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "compare:", v12);

  if (v13 != 1)
  {
    if (objc_msgSend(v6, "isThisYear"))
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYearAbbrevMonth");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoDayWithYear");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v6;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dayOfWeekFromDate:abbreviated:", v6, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v14;
}

- (id)nanoFriendlyDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToDate:", v5))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterRelativeDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
LABEL_9:
    objc_msgSend(v6, "stringFromDate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v5, "mt_dateWithDeltaDays:", -7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "compare:", v9);

  if (v10 != 1)
  {
    if (objc_msgSend(v3, "isThisYear"))
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYearAbbrevMonth");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterShortStyleWithYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v3;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dayOfWeekFromDate:abbreviated:", v3, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

+ (id)dayOfWeekFromDate:()MTAdditions abbreviated:
{
  id v5;
  uint64_t *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (a4)
  {
    if (dayOfWeekFromDate_abbreviated__onceToken != -1)
      dispatch_once(&dayOfWeekFromDate_abbreviated__onceToken, &__block_literal_global_10);
    v6 = &dayOfWeekFromDate_abbreviated__formatterAbbrev;
  }
  else
  {
    if (dayOfWeekFromDate_abbreviated__onceToken_5 != -1)
      dispatch_once(&dayOfWeekFromDate_abbreviated__onceToken_5, &__block_literal_global_6);
    v6 = &dayOfWeekFromDate_abbreviated__formatterVerbose;
  }
  v7 = (id)*v6;
  objc_msgSend(v7, "stringFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)verboseDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_AT_TIME"), &stru_1E5500770, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "mt_verboseDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@ %@"), 0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lessVerboseDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_AT_TIME"), &stru_1E5500770, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "mt_lessVerboseDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@ %@"), 0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lessVerboseDisplayStringWithoutTime
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "mt_lessVerboseDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lessVerboseDisplayStringWithoutTimeAndCurrentYear
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isThisYear"))
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_dateFormatterNoYearAbbrevMonth");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "mt_lessVerboseDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)timeString
{
  if (timeString_onceToken[0] != -1)
    dispatch_once(timeString_onceToken, &__block_literal_global_17_1);
  return objc_msgSend((id)timeString_fmt, "stringFromDate:", a1);
}

- (BOOL)isSameDayOfWeekAs:()MTAdditions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "component:fromDate:", 512, a1);
  v8 = objc_msgSend(v6, "component:fromDate:", 512, v5);

  return v7 == v8;
}

+ (id)mt_dateFormatterRelativeDay
{
  if (mt_dateFormatterRelativeDay_onceToken[0] != -1)
    dispatch_once(mt_dateFormatterRelativeDay_onceToken, &__block_literal_global_18_0);
  return (id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay;
}

+ (id)mt_dateFormatterWithYear
{
  if (mt_dateFormatterWithYear_onceToken[0] != -1)
    dispatch_once(mt_dateFormatterWithYear_onceToken, &__block_literal_global_19);
  return (id)mt_dateFormatterWithYear__s__dateFormatterWithYear;
}

+ (id)mt_dateFormatterJustYear
{
  if (mt_dateFormatterJustYear_onceToken != -1)
    dispatch_once(&mt_dateFormatterJustYear_onceToken, &__block_literal_global_22);
  return (id)mt_dateFormatterJustYear_justYearFormatter;
}

+ (id)mt_dateFormatterNoDayWithYear
{
  if (mt_dateFormatterNoDayWithYear_onceToken != -1)
    dispatch_once(&mt_dateFormatterNoDayWithYear_onceToken, &__block_literal_global_25);
  return (id)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear;
}

+ (id)mt_dateFormatterShortStyleWithYear
{
  if (mt_dateFormatterShortStyleWithYear_onceToken != -1)
    dispatch_once(&mt_dateFormatterShortStyleWithYear_onceToken, &__block_literal_global_28);
  return (id)mt_dateFormatterShortStyleWithYear_dateFormatter;
}

+ (id)mt_dateFormatterNoYear
{
  if (mt_dateFormatterNoYear_onceToken != -1)
    dispatch_once(&mt_dateFormatterNoYear_onceToken, &__block_literal_global_29);
  return (id)mt_dateFormatterNoYear__s__dateFormatterNoYear;
}

+ (id)mt_lessVerboseDateFormatter
{
  if (mt_lessVerboseDateFormatter_onceToken[0] != -1)
    dispatch_once(mt_lessVerboseDateFormatter_onceToken, &__block_literal_global_38);
  return (id)mt_lessVerboseDateFormatter__s__dateFormatterWithYear;
}

- (BOOL)isLessThanDaysOld:()MTAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mt_dateWithDeltaDays:", -a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9) == 1;

  return v10;
}

- (uint64_t)isLessThanWeekOld
{
  return objc_msgSend(a1, "isLessThanDaysOld:", 7);
}

- (id)mt_dateWithDeltaDays:()MTAdditions
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

@end
