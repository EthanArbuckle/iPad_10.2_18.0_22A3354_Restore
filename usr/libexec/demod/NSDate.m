@implementation NSDate

- (id)startOfDay
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startOfDayForDate:", self));

  return v4;
}

- (id)endOfDay
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", 23, 59, 59, self, 0));

  return v4;
}

- (id)newDateByAddingOneWeek
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 7, self, 0));

  return v4;
}

- (id)newDateByAddingOneDay
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, self, 0));

  return v4;
}

- (BOOL)isLaterDateThan:(id)a3
{
  NSDate *v3;
  void *v4;

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](self, "laterDate:", a3));
  LOBYTE(v3) = objc_msgSend(v4, "isEqualToDate:", v3);

  return (char)v3;
}

- (BOOL)isEarlierDateThan:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](self, "laterDate:", v4));
  v6 = objc_msgSend(v5, "isEqualToDate:", v4);

  return v6;
}

+ (id)dateFromString:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v3));

  return v5;
}

- (id)toString
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  if (-[NSDate isEqualToDate:](self, "isEqualToDate:", v4))
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v6 = -[NSDate isEqualToDate:](self, "isEqualToDate:", v5);

  if ((v6 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    objc_msgSend(v3, "setTimeZone:", v4);
LABEL_4:

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", self));

  return v7;
}

- (id)timeZoneFromISO8601DateString:(id)a3
{
  id v3;
  char *v4;
  char *v5;
  void *v6;
  char *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "length");
  v5 = v4 - 6;
  if ((unint64_t)v4 < 6)
    goto LABEL_2;
  v7 = v4;
  if (objc_msgSend(v3, "characterAtIndex:", v4 - 1) == 90)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
    goto LABEL_13;
  }
  v8 = objc_msgSend(v3, "characterAtIndex:", v5);
  if (v8 == 43)
  {
    v9 = 1;
  }
  else
  {
    if (v8 != 45)
    {
LABEL_2:
      v6 = 0;
      goto LABEL_13;
    }
    v9 = -1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v7 - 5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":")));

  if (objc_msgSend(v11, "count") == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v13 = objc_msgSend(v12, "integerValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
    v15 = objc_msgSend(v14, "integerValue");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", (3600 * (_QWORD)v13 + 60 * (_QWORD)v15) * v9));
  }
  else
  {
    v6 = 0;
  }

LABEL_13:
  return v6;
}

@end
