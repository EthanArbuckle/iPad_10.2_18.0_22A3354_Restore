@implementation PXContextualMemoriesTimeSetting

- (PXContextualMemoriesTimeSetting)init
{
  PXContextualMemoriesTimeSetting *v2;
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXContextualMemoriesTimeSetting;
  v2 = -[PXContextualMemoriesTimeSetting init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    -[NSDateFormatter setDateStyle:](v2->_dateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v2->_dateFormatter, "setTimeStyle:", 0);
  }
  return v2;
}

- (NSString)headerTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Time"), &stru_1E5149688, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[PXContextualMemoriesTimeSetting date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXContextualMemoriesTimeSetting dateFormatter](self, "dateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContextualMemoriesTimeSetting date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E5149688;
  }

  return (NSString *)v6;
}

- (void)resetToDefault
{
  NSDate *date;

  -[PXContextualMemoriesTimeSetting willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("date"));
  date = self->_date;
  self->_date = 0;

  -[PXContextualMemoriesTimeSetting didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("date"));
}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;

  if (self->_date != a3)
  {
    -[PXContextualMemoriesTimeSetting _forceMiddayDateForDate:](self, "_forceMiddayDateForDate:");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v4;

  }
}

- (NSDate)date
{
  NSDate *date;
  NSDate *v3;
  void *v5;

  date = self->_date;
  if (date)
  {
    v3 = date;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContextualMemoriesTimeSetting _forceMiddayDateForDate:](self, "_forceMiddayDateForDate:", v5);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_forceMiddayDateForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHour:", 12);
  objc_msgSend(v6, "setMinute:", 0);
  objc_msgSend(v6, "setSecond:", 0);
  objc_msgSend(v6, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v5, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
