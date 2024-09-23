@implementation RCDateFormatter

- (RCDateFormatter)init
{
  RCDateFormatter *v2;
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *dateItemCache;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCDateFormatter;
  v2 = -[RCDateFormatter init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_setupLocale", NSCurrentLocaleDidChangeNotification, 0);

    v4 = objc_opt_new(NSMutableDictionary);
    dateItemCache = v2->_dateItemCache;
    v2->_dateItemCache = v4;

  }
  return v2;
}

- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dateItemCache, "objectForKeyedSubscript:", v7));
    if (v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
          objc_msgSend(v9, "timeIntervalSince1970"),
          v11 = v10,
          v9,
          objc_msgSend(v8, "expiration"),
          v11 <= v12))
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "formattedDate"));
    }
    else
    {
      v13 = -[RCDateFormatter _newFormattedDateStringFromDate:forUUID:](self, "_newFormattedDateStringFromDate:forUUID:", v6, v7);
    }
    v14 = v13;

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _formattedDateStringFromDate:remainingTimeValid:](self, "_formattedDateStringFromDate:remainingTimeValid:", v6, 0));
  }

  return v14;
}

- (id)_newFormattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  RCFormattedDateItem *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(RCFormattedDateItem);
  v15 = 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _formattedDateStringFromDate:remainingTimeValid:](self, "_formattedDateStringFromDate:remainingTimeValid:", v7, &v15));

  -[RCFormattedDateItem setFormattedDate:](v8, "setFormattedDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;

  -[RCFormattedDateItem setExpiration:](v8, "setExpiration:", v12 + v15);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dateItemCache, "setObject:forKeyedSubscript:", v8, v6);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFormattedDateItem formattedDate](v8, "formattedDate"));
  return v13;
}

- (id)_formattedDateStringFromDate:(id)a3 remainingTimeValid:(double *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  if (objc_msgSend(v7, "isDateInToday:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _todayDateFormatter](self, "_todayDateFormatter"));
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isDateInYesterday:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _yesterdayDateFormatter](self, "_yesterdayDateFormatter"));
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingDays:", -7));
  v11 = objc_msgSend(v7, "compareDate:toDate:toUnitGranularity:", v6, v10, 16);

  if (v11 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _thisWeekDateFormatter](self, "_thisWeekDateFormatter"));
LABEL_7:
    v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v6));

    if (a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingDays:", 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startOfDayForDate:", v15));

      objc_msgSend(v17, "timeIntervalSinceDate:", v14);
      *(_QWORD *)a4 = v18;

    }
    goto LABEL_9;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _defaultDateFormatter](self, "_defaultDateFormatter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringFromDate:", v6));

  if (a4)
    *a4 = 1.79769313e308;
LABEL_9:

  return v13;
}

- (id)_defaultDateFormatter
{
  NSDateFormatter *defaultDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;

  defaultDateFormatter = self->__defaultDateFormatter;
  if (!defaultDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__defaultDateFormatter;
    self->__defaultDateFormatter = v4;

    -[NSDateFormatter setTimeStyle:](self->__defaultDateFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](self->__defaultDateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setDoesRelativeDateFormatting:](self->__defaultDateFormatter, "setDoesRelativeDateFormatting:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    -[NSDateFormatter setLocale:](self->__defaultDateFormatter, "setLocale:", v6);

    defaultDateFormatter = self->__defaultDateFormatter;
  }
  return defaultDateFormatter;
}

+ (id)sharedDateFormatter
{
  if (qword_1001ED978 != -1)
    dispatch_once(&qword_1001ED978, &stru_1001AD468);
  return (id)qword_1001ED970;
}

- (void)_setupLocale
{
  -[NSMutableDictionary removeAllObjects](self->_dateItemCache, "removeAllObjects");
}

- (id)dateFormatterForStyle:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _todayDateFormatter](self, "_todayDateFormatter", v3, v4));
      break;
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _yesterdayDateFormatter](self, "_yesterdayDateFormatter", v3, v4));
      break;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _thisWeekDateFormatter](self, "_thisWeekDateFormatter", v3, v4));
      break;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCDateFormatter _defaultDateFormatter](self, "_defaultDateFormatter", v3, v4));
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_todayDateFormatter
{
  NSDateFormatter *todayDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;

  todayDateFormatter = self->__todayDateFormatter;
  if (!todayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__todayDateFormatter;
    self->__todayDateFormatter = v4;

    -[NSDateFormatter setTimeStyle:](self->__todayDateFormatter, "setTimeStyle:", 1);
    -[NSDateFormatter setDateStyle:](self->__todayDateFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setDoesRelativeDateFormatting:](self->__todayDateFormatter, "setDoesRelativeDateFormatting:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    -[NSDateFormatter setLocale:](self->__todayDateFormatter, "setLocale:", v6);

    todayDateFormatter = self->__todayDateFormatter;
  }
  return todayDateFormatter;
}

- (id)_yesterdayDateFormatter
{
  NSDateFormatter *yesterdayDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;

  yesterdayDateFormatter = self->__yesterdayDateFormatter;
  if (!yesterdayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__yesterdayDateFormatter;
    self->__yesterdayDateFormatter = v4;

    -[NSDateFormatter setTimeStyle:](self->__yesterdayDateFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](self->__yesterdayDateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setDoesRelativeDateFormatting:](self->__yesterdayDateFormatter, "setDoesRelativeDateFormatting:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    -[NSDateFormatter setLocale:](self->__yesterdayDateFormatter, "setLocale:", v6);

    yesterdayDateFormatter = self->__yesterdayDateFormatter;
  }
  return yesterdayDateFormatter;
}

- (id)_thisWeekDateFormatter
{
  NSDateFormatter *thisWeekDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;

  thisWeekDateFormatter = self->__thisWeekDateFormatter;
  if (!thisWeekDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5 = self->__thisWeekDateFormatter;
    self->__thisWeekDateFormatter = v4;

    -[NSDateFormatter setTimeStyle:](self->__thisWeekDateFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](self->__thisWeekDateFormatter, "setDateFormat:", CFSTR("EEEE"));
    -[NSDateFormatter setDoesRelativeDateFormatting:](self->__thisWeekDateFormatter, "setDoesRelativeDateFormatting:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    -[NSDateFormatter setLocale:](self->__thisWeekDateFormatter, "setLocale:", v6);

    thisWeekDateFormatter = self->__thisWeekDateFormatter;
  }
  return thisWeekDateFormatter;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_dateItemCache, 0);
  objc_storeStrong((id *)&self->__defaultDateFormatter, 0);
  objc_storeStrong((id *)&self->__thisWeekDateFormatter, 0);
  objc_storeStrong((id *)&self->__yesterdayDateFormatter, 0);
  objc_storeStrong((id *)&self->__todayDateFormatter, 0);
}

@end
