@implementation NSDate

- (id)stringFromDate
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateFormatter](NSDate, "dateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f (%@)"), v4, v6));

  return v7;
}

- (BOOL)betweenDate:(id)a3 andDate:(id)a4
{
  BOOL result;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  result = 0;
  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v9 = v8;
    -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v13 = v12;

    if (v9 <= v13)
    {
      v14 = v9 <= v11;
      v15 = v11 > v13;
    }
    else
    {
      v14 = v13 <= v11;
      v15 = v11 > v9;
    }
    return !v15 && v14;
  }
  return result;
}

- (BOOL)isBeforeDate:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) == NSOrderedAscending;
}

- (BOOL)isOnOrBefore:(id)a3
{
  return (id)-[NSDate compare:](self, "compare:", a3) != (id)1;
}

- (BOOL)isAfterDate:(id)a3
{
  return (id)-[NSDate compare:](self, "compare:", a3) == (id)1;
}

- (BOOL)isOnOrAfter:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) != NSOrderedAscending;
}

- (id)snapToTheDay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 60, self));

  if ((uint64_t)objc_msgSend(v4, "hour") > 2)
  {
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "setHour:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v4));

    v7 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0));
  }

  return v7;
}

- (BOOL)isSameDayWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setTimeZone:", v7);
  v10 = objc_msgSend(v9, "isDate:inSameDayAsDate:", self, v6);

  return v10;
}

- (BOOL)isSameDayWithDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:inSameDayAsDate:", self, v4);

  return (char)self;
}

- (BOOL)isFollowingDayAfterDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dateByAddingTimeInterval:", 86400.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:inSameDayAsDate:", self, v4);

  return (char)self;
}

- (BOOL)isSameWeekWithDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", self, v4, 0x2000);

  return (char)self;
}

- (BOOL)isFollowingWeekAfterDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dateByAddingTimeInterval:", 604800.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", self, v4, 0x2000);

  return (char)self;
}

- (BOOL)isSameMonthWithDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", self, v4, 8);

  return (char)self;
}

- (BOOL)isFollowingMonthAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  char *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 12, self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 12, v4));

  v9 = objc_msgSend(v6, "month");
  v10 = (char *)objc_msgSend(v6, "year");
  if (v9 != (id)1)
  {
    if (v10 == objc_msgSend(v8, "year"))
    {
      v11 = (char *)objc_msgSend(v6, "month") - 1;
      v12 = (uint64_t)objc_msgSend(v8, "month");
      goto LABEL_6;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if (v10 - 1 != objc_msgSend(v8, "year"))
    goto LABEL_7;
  v11 = (char *)objc_msgSend(v8, "month");
  v12 = 1;
LABEL_6:
  v13 = v11 == (char *)v12;
LABEL_8:

  return v13;
}

- (BOOL)isSameYearWithDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", self, v4, 4);

  return (char)self;
}

- (BOOL)isFollowingYearAfterDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dateByAddingTimeInterval:", 31536000.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v5, "isDate:equalToDate:toUnitGranularity:", self, v4, 4);

  return (char)self;
}

- (id)startOfDay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v4));

  return v6;
}

- (id)startOfDayWithBoundaryOfADay:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self, "dateByAddingTimeInterval:", -a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startOfDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", a3));

  return v6;
}

- (unint64_t)hours
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = objc_msgSend(v3, "component:fromDate:", 32, self);

  return (unint64_t)v4;
}

- (unint64_t)minutes
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = objc_msgSend(v3, "component:fromDate:", 64, self);

  return (unint64_t)v4;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_27);
  return (id)dateFormatter_dateFormatter;
}

void __37__NSDate_MOExtensions__dateFormatter__block_invoke(id a1)
{
  NSDateFormatter *v1;
  void *v2;
  void *v3;

  v1 = objc_opt_new(NSDateFormatter);
  v2 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  objc_msgSend((id)dateFormatter_dateFormatter, "setLocale:", v3);

  objc_msgSend((id)dateFormatter_dateFormatter, "setDateStyle:", 1);
  objc_msgSend((id)dateFormatter_dateFormatter, "setTimeStyle:", 3);
}

+ (id)firstSaturdayBeforeReferenceDate:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v5 = objc_msgSend(v3, "isEqualToDate:", v4);

    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      v9 = objc_msgSend(v3, "isEqualToDate:", v8);

      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 512, v3));
        v12 = (uint64_t)objc_msgSend(v11, "weekday");
        v13 = objc_alloc_init((Class)NSDateComponents);
        objc_msgSend(v13, "setDay:", 7 * (v12 / 7) - v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v13, v3, 0));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 28, v14));
        objc_msgSend(v15, "setHour:", 0);
        objc_msgSend(v15, "setMinute:", 0);
        objc_msgSend(v15, "setSecond:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateFromComponents:", v15));

        goto LABEL_9;
      }
      v6 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (id)dayNameFormatterInEnglish
{
  if (dayNameFormatterInEnglish_onceToken != -1)
    dispatch_once(&dayNameFormatterInEnglish_onceToken, &__block_literal_global_7);
  return (id)dayNameFormatterInEnglish_dateFormatter;
}

void __49__NSDate_MOExtensions__dayNameFormatterInEnglish__block_invoke(id a1)
{
  NSDateFormatter *v1;
  void *v2;
  id v3;

  v1 = objc_opt_new(NSDateFormatter);
  v2 = (void *)dayNameFormatterInEnglish_dateFormatter;
  dayNameFormatterInEnglish_dateFormatter = (uint64_t)v1;

  objc_msgSend((id)dayNameFormatterInEnglish_dateFormatter, "setDateFormat:", CFSTR("EEEE"));
  v3 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend((id)dayNameFormatterInEnglish_dateFormatter, "setLocale:", v3);

}

+ (id)relativeBundleDateFormatter
{
  if (relativeBundleDateFormatter_onceToken != -1)
    dispatch_once(&relativeBundleDateFormatter_onceToken, &__block_literal_global_12);
  return (id)relativeBundleDateFormatter_dateFormatter;
}

void __51__NSDate_MOExtensions__relativeBundleDateFormatter__block_invoke(id a1)
{
  NSDateFormatter *v1;
  void *v2;
  void *v3;

  v1 = objc_opt_new(NSDateFormatter);
  v2 = (void *)relativeBundleDateFormatter_dateFormatter;
  relativeBundleDateFormatter_dateFormatter = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setLocale:", v3);

  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setDateStyle:", 4);
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setFormattingContext:", 5);
}

+ (id)monthDayFormatter
{
  if (monthDayFormatter_onceToken != -1)
    dispatch_once(&monthDayFormatter_onceToken, &__block_literal_global_13);
  return (id)monthDayFormatter_dateFormatter;
}

void __41__NSDate_MOExtensions__monthDayFormatter__block_invoke(id a1)
{
  NSDateFormatter *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_opt_new(NSDateFormatter);
  v2 = (void *)monthDayFormatter_dateFormatter;
  monthDayFormatter_dateFormatter = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("MM/dd"), 0, v3));

  objc_msgSend((id)monthDayFormatter_dateFormatter, "setDateFormat:", v4);
}

- (id)getBundleRelativeDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  double v10;
  void *v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dayNameFormatterInEnglish](NSDate, "dayNameFormatterInEnglish"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dayNameFormatterInEnglish](NSDate, "dayNameFormatterInEnglish"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "bundleDay: %@, nowDay: %@", (uint8_t *)&v15, 0x16u);
  }

  -[NSDate timeIntervalSinceNow](self, "timeIntervalSinceNow");
  if (v10 < 0.0)
    v10 = -v10;
  if (v10 > 604800.0 || v4 == v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate monthDayFormatter](NSDate, "monthDayFormatter"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", self));

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

@end
