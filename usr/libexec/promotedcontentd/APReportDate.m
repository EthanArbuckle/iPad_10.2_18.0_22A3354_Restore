@implementation APReportDate

- (APReportDate)initWithDate:(id)a3
{
  id v5;
  APReportDate *v6;
  APReportDate *v7;
  NSCalendar *v8;
  NSCalendar *gregorianCalendar;
  NSDateFormatter *v10;
  NSDateFormatter *dateFormatter;
  void *v12;
  NSDateFormatter *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APReportDate;
  v6 = -[APReportDate init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v8 = (NSCalendar *)objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSGregorianCalendar);
    gregorianCalendar = v7->_gregorianCalendar;
    v7->_gregorianCalendar = v8;

    v10 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
    -[NSDateFormatter setLocale:](v7->_dateFormatter, "setLocale:", v12);

    v13 = v7->_dateFormatter;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", CFSTR("UTC")));
    -[NSDateFormatter setTimeZone:](v13, "setTimeZone:", v14);

    -[NSDateFormatter setDateFormat:](v7->_dateFormatter, "setDateFormat:", CFSTR("MMdd"));
    -[NSDateFormatter setCalendar:](v7->_dateFormatter, "setCalendar:", v7->_gregorianCalendar);
  }

  return v7;
}

- (int64_t)monthDayInteger
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  v4 = -[APReportDate _dayOfYearForDate:](self, "_dayOfYearForDate:", v3);

  return v4;
}

- (int64_t)reportEndDay
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate _addDays:toDate:](self, "_addDays:toDate:", -1, v3));

  v5 = -[APReportDate _dayOfYearForDate:](self, "_dayOfYearForDate:", v4);
  return v5;
}

- (int64_t)weekStartDay
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate _addDays:toDate:](self, "_addDays:toDate:", -8, v3));

  v5 = -[APReportDate _dayOfYearForDate:](self, "_dayOfYearForDate:", v4);
  return v5;
}

- (BOOL)lastYearLeap
{
  void *v3;
  void *v4;
  char *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate gregorianCalendar](self, "gregorianCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  v5 = (char *)objc_msgSend(v3, "component:fromDate:", 4, v4) - 1;

  return __ROR8__(0x8F5C28F5C28F5C29 * (_QWORD)v5 + 0x51EB851EB851EB8, 2) >= 0x28F5C28F5C28F5DuLL
      && (v5 & 3) == 0
      || __ROR8__(0x8F5C28F5C28F5C29 * (_QWORD)v5 + 0x51EB851EB851EB0, 4) < 0xA3D70A3D70A3D7uLL;
}

- (NSString)reportDayString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APReportDate reportEndDay](self, "reportEndDay")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));

  if (objc_msgSend(v3, "length") == (id)3)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0%@"), v3));
  else
    v4 = v3;
  v5 = v4;

  return (NSString *)v5;
}

- (int64_t)reportDayMinus:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = ~a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate _addDays:toDate:](self, "_addDays:toDate:", v4, v5));

  v7 = -[APReportDate _dayOfYearForDate:](self, "_dayOfYearForDate:", v6);
  return v7;
}

- (int64_t)numberOfDaysSinceDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate gregorianCalendar](self, "gregorianCalendar"));
  v13 = 0;
  objc_msgSend(v5, "rangeOfUnit:startDate:interval:forDate:", 16, &v13, 0, v4);

  v6 = v13;
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  objc_msgSend(v5, "rangeOfUnit:startDate:interval:forDate:", 16, &v12, 0, v7);
  v8 = v12;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v6, v8, 0));
  v10 = objc_msgSend(v9, "day");

  return (int64_t)v10;
}

- (id)currentDateMinusDays:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v5, "setDay:", -(uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate gregorianCalendar](self, "gregorianCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate date](self, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v7, 0));

  return v8;
}

- (int64_t)_dayOfYearForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate dateFormatter](self, "dateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));

  v7 = objc_msgSend(v6, "integerValue");
  return (int64_t)v7;
}

- (id)_addDays:(int64_t)a3 toDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v7, "setDay:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDate gregorianCalendar](self, "gregorianCalendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0));

  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
