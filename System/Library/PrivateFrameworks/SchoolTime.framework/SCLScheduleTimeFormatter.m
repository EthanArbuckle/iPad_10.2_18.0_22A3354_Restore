@implementation SCLScheduleTimeFormatter

- (SCLScheduleTimeFormatter)init
{
  SCLScheduleTimeFormatter *v2;
  NSCalendar *v3;
  void *v4;
  void *v5;
  NSCalendar *calendar;
  NSCalendar *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v10;
  void *v11;
  NSDateFormatter *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCLScheduleTimeFormatter;
  v2 = -[SCLScheduleTimeFormatter init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA28]);
    v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v3, "setTimeZone:", v4);

    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setLocale:](v3, "setLocale:", v5);

    calendar = v2->_calendar;
    v2->_calendar = v3;
    v7 = v3;

    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v8;

    v10 = v2->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v10, "setLocale:", v11);

    -[NSDateFormatter setDateStyle:](v2->_dateFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v2->_dateFormatter, "setTimeStyle:", 1);
    v12 = v2->_dateFormatter;
    -[NSCalendar timeZone](v7, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v12, "setTimeZone:", v13);

    -[NSDateFormatter setCalendar:](v2->_dateFormatter, "setCalendar:", v7);
  }
  return v2;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCLScheduleTimeFormatter stringForScheduleTime:](self, "stringForScheduleTime:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringForScheduleTime:(id)a3
{
  NSCalendar *calendar;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  calendar = self->_calendar;
  v5 = a3;
  v6 = objc_msgSend(v5, "hour");
  v7 = objc_msgSend(v5, "minute");

  -[NSCalendar dateWithEra:year:month:day:hour:minute:second:nanosecond:](calendar, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", 1, 2019, 1, 1, v6, v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
