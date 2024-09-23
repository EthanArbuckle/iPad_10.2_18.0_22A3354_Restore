@implementation NSDate

- (BOOL)isEqualToDay:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 28, self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 28, v4));

  v8 = objc_msgSend(v7, "year");
  if (v8 == objc_msgSend(v6, "year") && (v9 = objc_msgSend(v7, "month"), v9 == objc_msgSend(v6, "month")))
  {
    v10 = objc_msgSend(v7, "day");
    v11 = v10 == objc_msgSend(v6, "day");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToWeek:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 8196, self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 8196, v4));

  v8 = objc_msgSend(v7, "year");
  if (v8 == objc_msgSend(v6, "year"))
  {
    v9 = objc_msgSend(v7, "weekOfYear");
    v10 = v9 == objc_msgSend(v6, "weekOfYear");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDate)dateWithDeltaDays:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v6, "setDay:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, self, 0));

  return (NSDate *)v7;
}

- (NSDate)dateWithDeltaWeeks:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v6, "setWeekOfYear:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, self, 0));

  return (NSDate *)v7;
}

- (BOOL)isToday
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v3 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, v5));

  v7 = objc_msgSend(v6, "year");
  if (v7 == objc_msgSend(v4, "year") && (v8 = objc_msgSend(v6, "month"), v8 == objc_msgSend(v4, "month")))
  {
    v9 = objc_msgSend(v6, "day");
    v10 = v9 == objc_msgSend(v4, "day");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isFuture
{
  void *v3;
  NSComparisonResult v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = -[NSDate compare:](self, "compare:", v3);

  return v4 == NSOrderedDescending;
}

- (BOOL)wasYesterday
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateWithDeltaDays:", -1));
  LOBYTE(self) = -[NSDate isEqualToDay:](self, "isEqualToDay:", v4);

  return (char)self;
}

- (BOOL)wasLessThanAWeekAgo
{
  void *v4;
  void *v5;
  NSComparisonResult v6;

  if (-[NSDate isFuture](self, "isFuture"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateWithDeltaWeeks:", -1));
  v6 = -[NSDate compare:](self, "compare:", v5);

  return v6 == NSOrderedDescending;
}

+ (id)dateFormatter
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "threadDictionary"));

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.itunesmobile.nsdate-imadditions.nsdateformatter")));
  if (!v4)
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("com.apple.itunesmobile.nsdate-imadditions.nsdateformatter"));
  }

  return v4;
}

+ (id)dateStringFromDate:(id)a3 withDateStyle:(unint64_t)a4 timeStyle:(unint64_t)a5 isRelative:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a6;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "threadDictionary"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("com.apple.itunesmobile.nsdate-imadditions.datestringformatters")));
  if (!v12)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("com.apple.itunesmobile.nsdate-imadditions.datestringformatters"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%lu-%d"), a4, a5, v6));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v13));
  if (!v14)
  {
    v14 = objc_alloc_init((Class)NSDateFormatter);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    objc_msgSend(v14, "setLocale:", v15);

    objc_msgSend(v14, "setDateStyle:", a4);
    objc_msgSend(v14, "setTimeStyle:", a5);
    objc_msgSend(v14, "setDoesRelativeDateFormatting:", v6);
    objc_msgSend(v12, "setObject:forKey:", v14, v13);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v9));

  return v16;
}

+ (id)shortDateStringFromDateNoRel:(id)a3
{
  return _objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 1, 0, 0);
}

+ (id)longDateStringFromDateNoRel:(id)a3
{
  return _objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 3, 0, 0);
}

+ (id)shortDateStringFromDate:(id)a3
{
  return _objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 1, 0, 1);
}

+ (id)shortTimeStringFromDate:(id)a3
{
  return _objc_msgSend(a1, "dateStringFromDate:withDateStyle:timeStyle:isRelative:", a3, 0, 1, 1);
}

+ (id)dayOfWeekFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateFormatter"));
  objc_msgSend(v7, "setDateFormat:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v4));

  return v8;
}

+ (id)mailLikeDescriptionFromDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isFuture"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSDate shortDateStringFromDateNoRel:](NSDate, "shortDateStringFromDateNoRel:", v4));
  }
  else if (objc_msgSend(v4, "isToday"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSDate shortTimeStringFromDate:](NSDate, "shortTimeStringFromDate:", v4));
  }
  else if (objc_msgSend(v4, "wasLessThanAWeekAgo")
         && (objc_msgSend(v4, "wasYesterday") & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayOfWeekFromDate:", v4));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSDate shortDateStringFromDate:](NSDate, "shortDateStringFromDate:", v4));
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)accessibleMailLikeDescriptionFromDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isFuture"))
  {
LABEL_6:
    v5 = objc_claimAutoreleasedReturnValue(+[NSDate longDateStringFromDateNoRel:](NSDate, "longDateStringFromDateNoRel:", v4));
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "isToday"))
  {
    if (objc_msgSend(v4, "wasLessThanAWeekAgo")
      && (objc_msgSend(v4, "wasYesterday") & 1) == 0)
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayOfWeekFromDate:", v4));
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSDate shortTimeStringFromDate:](NSDate, "shortTimeStringFromDate:", v4));
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

@end
