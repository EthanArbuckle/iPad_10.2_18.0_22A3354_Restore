@implementation PLDateRangeFormatter

- (PLDateRangeFormatter)initWithPreset:(int64_t)a3
{
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;
  uint64_t v6;
  NSLocale *locale;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLDateRangeFormatter;
  v4 = -[PLDateRangeFormatter init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_preset = a3;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    *(_WORD *)&v5->_allowUseTime = 257;
    -[PLDateRangeFormatter _handlePresetDidChange](v5, "_handlePresetDidChange");
    -[PLDateRangeFormatter _handleUseLocalDatesDidChange](v5, "_handleUseLocalDatesDidChange");
  }
  return v5;
}

- (PLDateRangeFormatter)init
{
  return -[PLDateRangeFormatter initWithPreset:](self, "initWithPreset:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PLDateRangeFormatter _resetFormatters](self, "_resetFormatters");
  v3.receiver = self;
  v3.super_class = (Class)PLDateRangeFormatter;
  -[PLDateRangeFormatter dealloc](&v3, sel_dealloc);
}

- (void)_currentLocaleDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDateRangeFormatter setLocale:](self, "setLocale:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PLDateRangeFormatterChangedNotification"), self);

}

- (void)_systemTimeZoneDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PLDateRangeFormatter _resetFormatters](self, "_resetFormatters");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PLDateRangeFormatterChangedNotification"), self);

}

- (void)_significantTimeChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PLDateRangeFormatterChangedNotification"), self);

}

- (void)_handlePresetDidChange
{
  switch(self->_preset)
  {
    case 0:
      *(_WORD *)&self->_useShortDaysInRanges = 257;
      *(_DWORD *)&self->_includeDayNumbers = 16843009;
      *(_DWORD *)&self->_yearOnly = 0;
      goto LABEL_6;
    case 1:
      *(_WORD *)&self->_useShortDaysInRanges = 257;
      *(_DWORD *)&self->_includeDayNumbers = 16843009;
      *(_DWORD *)&self->_yearOnly = 0x1000000;
      goto LABEL_6;
    case 2:
      *(_WORD *)&self->_includeDayNumbers = 257;
      self->_useRelativeDayFormatting = 1;
      *(_QWORD *)&self->_useShortMonths = 0;
      goto LABEL_8;
    case 3:
      *(_WORD *)&self->_includeDayNumbers = 257;
      *(_QWORD *)&self->_useRelativeDayFormatting = 0;
LABEL_6:
      *(_WORD *)&self->_monthWithDelimiterAndYear = 0;
      return;
    case 4:
      *(_WORD *)&self->_useShortDaysInRanges = 0;
      *(_DWORD *)&self->_includeDayNumbers = 0;
      self->_yearOnly = 1;
      *(_DWORD *)&self->_monthOnly = 0;
LABEL_8:
      self->_monthWithYear = 0;
      return;
    case 5:
      *(_DWORD *)&self->_useShortMonths = 0;
      *(_DWORD *)&self->_includeDayNumbers = 0;
      self->_monthOnly = 1;
      goto LABEL_11;
    case 6:
      *(_QWORD *)&self->_includeDayNumbers = 0x100000001000000;
LABEL_11:
      *(_DWORD *)&self->_timeOnly = 0;
      break;
    case 7:
      *(_QWORD *)&self->_includeDayNumbers = 0;
      *(_DWORD *)&self->_timeOnly = 1;
      break;
    case 8:
      *(_QWORD *)&self->_includeDayNumbers = 0;
      *(_DWORD *)&self->_timeOnly = 0x10000;
      break;
    case 9:
      *(_DWORD *)&self->_includeDayNumbers = 0x1000000;
      *(_QWORD *)&self->_useShortDaysInRanges = 0x1000000000000;
      break;
    case 0xALL:
      *(_DWORD *)&self->_includeDayNumbers = 0x1000000;
      *(_DWORD *)&self->_useShortDaysInRanges = 0;
      *(_DWORD *)&self->_monthOnly = 0;
      self->_monthWithYear = 1;
      break;
    default:
      return;
  }
}

- (void)_handleUseLocalDatesDidChange
{
  NSTimeZone *v3;
  NSTimeZone *timeZone;

  if (self->_useLocalDates)
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  else
    -[PLDateRangeFormatter localTimeZone](self, "localTimeZone");
  v3 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  self->_timeZone = v3;

}

- (id)localTimeZone
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
}

- (void)_resetFormatters
{
  NSDateFormatter *sameDayDateFormatter;
  NSDateFormatter *sameDayNoYearDateFormatter;
  NSDateFormatter *dayOfTheWeekDateFormatter;
  NSDateFormatter *yearDateFormatter;
  NSDateFormatter *monthDateFormatter;
  NSDateFormatter *monthYearDateFormatter;
  NSDateFormatter *relativeDateFormatter;

  sameDayDateFormatter = self->_sameDayDateFormatter;
  self->_sameDayDateFormatter = 0;

  sameDayNoYearDateFormatter = self->_sameDayNoYearDateFormatter;
  self->_sameDayNoYearDateFormatter = 0;

  dayOfTheWeekDateFormatter = self->_dayOfTheWeekDateFormatter;
  self->_dayOfTheWeekDateFormatter = 0;

  yearDateFormatter = self->_yearDateFormatter;
  self->_yearDateFormatter = 0;

  monthDateFormatter = self->_monthDateFormatter;
  self->_monthDateFormatter = 0;

  monthYearDateFormatter = self->_monthYearDateFormatter;
  self->_monthYearDateFormatter = 0;

  relativeDateFormatter = self->_relativeDateFormatter;
  self->_relativeDateFormatter = 0;

  if (self->_monthDayIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthDayIntervalFormat = 0;
  }
  if (self->_monthDayNoYearIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthDayNoYearIntervalFormat = 0;
  }
  if (self->_differentMonthDayIntervalFormat)
  {
    udtitvfmt_close();
    self->_differentMonthDayIntervalFormat = 0;
  }
  if (self->_differentMonthDayNoYearIntervalFormat)
  {
    udtitvfmt_close();
    self->_differentMonthDayNoYearIntervalFormat = 0;
  }
  if (self->_dayOfTheWeekIntervalFormat)
  {
    udtitvfmt_close();
    self->_dayOfTheWeekIntervalFormat = 0;
  }
  if (self->_timeIntervalFormat)
  {
    udtitvfmt_close();
    self->_timeIntervalFormat = 0;
  }
  if (self->_monthIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthIntervalFormat = 0;
  }
  if (self->_monthYearIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthYearIntervalFormat = 0;
  }
  if (self->_yearIntervalFormat)
  {
    udtitvfmt_close();
    self->_yearIntervalFormat = 0;
  }
}

- (id)_sameMonthTemplate
{
  __CFString *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_useShortMonths)
    v3 = CFSTR("MMM");
  else
    v3 = CFSTR("MMMM");
  return v3;
}

- (id)_dayTemplate
{
  __CFString *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_includeDayNumbers)
    v3 = CFSTR("d");
  else
    v3 = &stru_1E36789C0;
  return v3;
}

- (id)_dayDifferentMonthsTemplate
{
  __CFString *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = &stru_1E36789C0;
  if (self->_includeDayNumbers && self->_includeDayNumbersWhenMonthsDiffer)
    v3 = CFSTR("d");
  return v3;
}

- (id)_sameDayDateFormatter
{
  NSDateFormatter *sameDayDateFormatter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDateFormatter *v9;
  NSDateFormatter *v10;

  os_unfair_lock_assert_owner(&self->_lock);
  sameDayDateFormatter = self->_sameDayDateFormatter;
  if (!sameDayDateFormatter)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateRangeFormatter _dayTemplate](self, "_dayTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@y"), v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v7, 0, self->_locale);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setTimeStyle:](v9, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", v8);
    -[NSDateFormatter setLocale:](v9, "setLocale:", self->_locale);
    -[NSDateFormatter setTimeZone:](v9, "setTimeZone:", self->_timeZone);
    -[NSDateFormatter setFormattingContext:](v9, "setFormattingContext:", 4);
    v10 = self->_sameDayDateFormatter;
    self->_sameDayDateFormatter = v9;

    sameDayDateFormatter = self->_sameDayDateFormatter;
  }
  return sameDayDateFormatter;
}

- (id)_sameDayNoYearDateFormatter
{
  NSDateFormatter *sameDayNoYearDateFormatter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDateFormatter *v9;
  NSDateFormatter *v10;

  os_unfair_lock_assert_owner(&self->_lock);
  sameDayNoYearDateFormatter = self->_sameDayNoYearDateFormatter;
  if (!sameDayNoYearDateFormatter)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateRangeFormatter _dayTemplate](self, "_dayTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v7, 0, self->_locale);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setTimeStyle:](v9, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", v8);
    -[NSDateFormatter setLocale:](v9, "setLocale:", self->_locale);
    -[NSDateFormatter setTimeZone:](v9, "setTimeZone:", self->_timeZone);
    -[NSDateFormatter setFormattingContext:](v9, "setFormattingContext:", 4);
    v10 = self->_sameDayNoYearDateFormatter;
    self->_sameDayNoYearDateFormatter = v9;

    sameDayNoYearDateFormatter = self->_sameDayNoYearDateFormatter;
  }
  return sameDayNoYearDateFormatter;
}

- (id)_dayOfTheWeekDateFormatter
{
  NSDateFormatter *dayOfTheWeekDateFormatter;
  void *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  dayOfTheWeekDateFormatter = self->_dayOfTheWeekDateFormatter;
  if (!dayOfTheWeekDateFormatter)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, self->_locale);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setDateStyle:](v5, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v4);
    -[NSDateFormatter setLocale:](v5, "setLocale:", self->_locale);
    -[NSDateFormatter setTimeZone:](v5, "setTimeZone:", self->_timeZone);
    -[NSDateFormatter setFormattingContext:](v5, "setFormattingContext:", 4);
    v6 = self->_dayOfTheWeekDateFormatter;
    self->_dayOfTheWeekDateFormatter = v5;

    dayOfTheWeekDateFormatter = self->_dayOfTheWeekDateFormatter;
  }
  return dayOfTheWeekDateFormatter;
}

- (id)_yearDateFormatter
{
  NSDateFormatter *yearDateFormatter;
  void *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  yearDateFormatter = self->_yearDateFormatter;
  if (!yearDateFormatter)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("y"), 0, self->_locale);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v4);
    -[NSDateFormatter setLocale:](v5, "setLocale:", self->_locale);
    -[NSDateFormatter setTimeZone:](v5, "setTimeZone:", self->_timeZone);
    -[NSDateFormatter setFormattingContext:](v5, "setFormattingContext:", 4);
    v6 = self->_yearDateFormatter;
    self->_yearDateFormatter = v5;

    yearDateFormatter = self->_yearDateFormatter;
  }
  return yearDateFormatter;
}

- (id)_monthDateFormatter
{
  NSDateFormatter *monthDateFormatter;
  void *v4;
  void *v5;
  NSDateFormatter *v6;
  NSDateFormatter *v7;

  os_unfair_lock_assert_owner(&self->_lock);
  monthDateFormatter = self->_monthDateFormatter;
  if (!monthDateFormatter)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v4, 0, self->_locale);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setTimeStyle:](v6, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", v5);
    -[NSDateFormatter setLocale:](v6, "setLocale:", self->_locale);
    -[NSDateFormatter setTimeZone:](v6, "setTimeZone:", self->_timeZone);
    -[NSDateFormatter setFormattingContext:](v6, "setFormattingContext:", 4);
    v7 = self->_monthDateFormatter;
    self->_monthDateFormatter = v6;

    monthDateFormatter = self->_monthDateFormatter;
  }
  return monthDateFormatter;
}

- (id)_monthYearDateFormatter
{
  NSDateFormatter *monthYearDateFormatter;
  void *v4;
  void *v5;
  void *v6;
  NSDateFormatter *v7;
  NSDateFormatter *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  monthYearDateFormatter = self->_monthYearDateFormatter;
  if (!monthYearDateFormatter)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ y"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v5, 0, self->_locale);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setTimeStyle:](v7, "setTimeStyle:", 0);
    -[NSDateFormatter setDateFormat:](v7, "setDateFormat:", v6);
    -[NSDateFormatter setLocale:](v7, "setLocale:", self->_locale);
    -[NSDateFormatter setTimeZone:](v7, "setTimeZone:", self->_timeZone);
    -[NSDateFormatter setFormattingContext:](v7, "setFormattingContext:", 4);
    v8 = self->_monthYearDateFormatter;
    self->_monthYearDateFormatter = v7;

    monthYearDateFormatter = self->_monthYearDateFormatter;
  }
  return monthYearDateFormatter;
}

- (id)_relativeDateFormatter
{
  NSDateFormatter *relativeDateFormatter;
  NSDateFormatter *v4;
  _BOOL8 v5;
  NSDateFormatter *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  relativeDateFormatter = self->_relativeDateFormatter;
  if (!relativeDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 0);
    v5 = self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting;
    -[NSDateFormatter setDoesRelativeDateFormatting:](v4, "setDoesRelativeDateFormatting:", v5);
    -[NSDateFormatter setLocale:](v4, "setLocale:", self->_locale);
    -[NSDateFormatter setFormattingContext:](v4, "setFormattingContext:", 4);
    v6 = self->_relativeDateFormatter;
    self->_relativeDateFormatter = v4;

    relativeDateFormatter = self->_relativeDateFormatter;
  }
  return relativeDateFormatter;
}

- (UDateIntervalFormat)_monthDayIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;
  void *v5;
  NSLocale *locale;
  NSTimeZone *timeZone;
  void *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_monthDayIntervalFormat;
  if (!result)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateRangeFormatter _dayTemplate](self, "_dayTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    timeZone = self->_timeZone;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@y"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_monthDayIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_monthDayIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_monthDayNoYearIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;
  void *v5;
  NSLocale *locale;
  NSTimeZone *timeZone;
  void *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_monthDayNoYearIntervalFormat;
  if (!result)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateRangeFormatter _dayTemplate](self, "_dayTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    timeZone = self->_timeZone;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_monthDayNoYearIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_monthDayNoYearIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_differentMonthDayIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;
  void *v5;
  NSLocale *locale;
  NSTimeZone *timeZone;
  void *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_differentMonthDayIntervalFormat;
  if (!result)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateRangeFormatter _dayDifferentMonthsTemplate](self, "_dayDifferentMonthsTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    timeZone = self->_timeZone;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@y"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_differentMonthDayIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_differentMonthDayIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_differentMonthDayNoYearIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;
  void *v5;
  NSLocale *locale;
  NSTimeZone *timeZone;
  void *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_differentMonthDayNoYearIntervalFormat;
  if (!result)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateRangeFormatter _dayDifferentMonthsTemplate](self, "_dayDifferentMonthsTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    timeZone = self->_timeZone;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_differentMonthDayNoYearIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_differentMonthDayNoYearIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_dayOfTheWeekIntervalFormat
{
  UDateIntervalFormat *result;
  __CFString *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_dayOfTheWeekIntervalFormat;
  if (!result)
  {
    if (self->_useShortDaysInRanges)
      v4 = CFSTR("EEE");
    else
      v4 = CFSTR("EEEE");
    result = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v4);
    self->_dayOfTheWeekIntervalFormat = result;
  }
  return result;
}

- (UDateIntervalFormat)_timeIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_timeIntervalFormat;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("jm"), 0, self->_locale);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_timeIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v4);

    return self->_timeIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_monthIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_monthIntervalFormat;
  if (!result)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_monthIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v4);

    return self->_monthIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_monthYearIntervalFormat
{
  UDateIntervalFormat *result;
  void *v4;
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_monthYearIntervalFormat;
  if (!result)
  {
    -[PLDateRangeFormatter _sameMonthTemplate](self, "_sameMonthTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ y"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_monthYearIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v5);

    return self->_monthYearIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_yearIntervalFormat
{
  UDateIntervalFormat *result;

  os_unfair_lock_assert_owner(&self->_lock);
  result = self->_yearIntervalFormat;
  if (!result)
  {
    result = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, CFSTR("y"));
    self->_yearIntervalFormat = result;
  }
  return result;
}

- (id)_stringFromDate:(id)a3 toDate:(id)a4 currentDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSTimeZone *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _BOOL4 v55;
  id v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  UDateIntervalFormat *v67;
  double v68;
  id v69;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[4];
  id v110;
  uint8_t *v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  id v115;
  uint8_t *v116;
  uint8_t buf[8];
  uint8_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint8_t v123[4];
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  -[PLDateRangeFormatter localTimeZone](self, "localTimeZone");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v108, "secondsFromGMT");
  v12 = v11;
  if (self->_useLocalDates)
  {
    objc_msgSend(v10, "dateByAddingTimeInterval:", (double)v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_timeZone;
  objc_msgSend(v14, "setTimeZone:", v15);
  objc_msgSend(v14, "components:fromDate:", 124, v8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_omitYear)
  {
    v105 = 0;
    v16 = 1;
  }
  else if (self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting)
  {
    objc_msgSend(v14, "components:fromDate:", 124, v10);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v105, "year");
    v16 = v17 == objc_msgSend(v107, "year");
  }
  else
  {
    v16 = 0;
    v105 = 0;
  }
  objc_msgSend(v8, "dateByAddingTimeInterval:", (double)-v12);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (self->_useLocalDates)
    v20 = (void *)v18;
  else
    v20 = v8;
  v104 = v20;
  if (!v9)
  {
    v106 = 0;
    goto LABEL_44;
  }
  objc_msgSend(v14, "components:fromDate:", 124, v9);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-v12);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (self->_useLocalDates)
    v23 = (void *)v21;
  else
    v23 = v9;
  v102 = v23;
  if (self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting)
  {
    v24 = objc_msgSend(v107, "day");
    if (v24 != objc_msgSend(v106, "day")
      && _DateIsInThePastNumberOfDays(v8, 6, v15, v108, self->_useLocalDates)
      && _DateIsInThePastNumberOfDays(v9, 6, v15, v108, self->_useLocalDates))
    {
      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _dayOfTheWeekIntervalFormat](self, "_dayOfTheWeekIntervalFormat"), v8, v9);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (!v25)
        goto LABEL_89;
      v27 = objc_msgSend(v25, "isEqualToString:", &stru_1E36789C0);

      if ((v27 & 1) != 0 || !_DateIsInThePastNumberOfDays(v9, 1, v15, v108, self->_useLocalDates))
        goto LABEL_89;
      -[PLDateRangeFormatter _relativeDateFormatter](self, "_relativeDateFormatter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringFromDate:", v102);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_useShortDaysInRanges && (unint64_t)objc_msgSend(v100, "length") > 0xF)
        goto LABEL_119;
      *(_QWORD *)buf = 0;
      v118 = buf;
      v119 = 0x3032000000;
      v120 = __Block_byref_object_copy__87886;
      v121 = __Block_byref_object_dispose__87887;
      v122 = 0;
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke;
      v114[3] = &unk_1E3673C88;
      v97 = v26;
      v115 = v97;
      v116 = buf;
      objc_msgSend(&unk_1E3764010, "enumerateObjectsUsingBlock:", v114);
      if (objc_msgSend(*((id *)v118 + 5), "count") != 2)
      {
        v26 = v97;
LABEL_118:

        _Block_object_dispose(buf, 8);
LABEL_119:

        goto LABEL_89;
      }
      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _dayOfTheWeekIntervalFormat](self, "_dayOfTheWeekIntervalFormat"), v9, v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lowercaseStringWithLocale:", self->_locale);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = objc_msgSend(v95, "length");
      objc_msgSend(*((id *)v118 + 5), "objectAtIndexedSubscript:", 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "stringByTrimmingCharactersInSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "lowercaseStringWithLocale:", self->_locale);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v97, "lowercaseStringWithLocale:", self->_locale);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v92, "isEqualToString:", v95);
      if (v84)
      {
        v33 = objc_msgSend(v89, "rangeOfString:options:range:", v95, 8, objc_msgSend(v89, "length") - v86);
        v34 = 0;
      }
      else
      {
        objc_msgSend(*((id *)v118 + 5), "objectAtIndexedSubscript:", 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "stringByTrimmingCharactersInSet:", v71);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v81, "isEqualToString:", v95))
        {
          v33 = objc_msgSend(v89, "rangeOfString:options:range:", v95, 8, 0, v86);
        }
        else
        {
          v32 = 0;
          v33 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v34 = 1;
        v92 = v81;
      }
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v88 = v92;
        v26 = v97;
LABEL_117:

        goto LABEL_118;
      }
      objc_msgSend(v97, "stringByReplacingCharactersInRange:withString:", v33, v32, v100);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_DateIsInThePastNumberOfDays(v8, 1, v15, v108, self->_useLocalDates))
      {
        v88 = v92;
        goto LABEL_117;
      }
      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _dayOfTheWeekIntervalFormat](self, "_dayOfTheWeekIntervalFormat"), v8, v8);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v118 + 5), "objectAtIndexedSubscript:", v34);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "stringByTrimmingCharactersInSet:", v72);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v88, "isEqualToString:", v99))
      {
        v73 = v99;
        v74 = objc_msgSend(v99, "length");
        if (v84)
          v75 = 12;
        else
          v75 = 8;
        v76 = objc_msgSend(v26, "rangeOfString:options:range:", v99, v75, 0, v74, v81);
        v94 = v77;
        v85 = v76;
        if (v76 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_115;
        -[PLDateRangeFormatter _relativeDateFormatter](self, "_relativeDateFormatter");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "stringFromDate:", v104);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "stringByReplacingCharactersInRange:withString:", v85, v94, v79);
        v80 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v80;
      }
      v73 = v99;
LABEL_115:

      goto LABEL_117;
    }
  }
  if (self->_yearOnly)
  {
    v35 = objc_msgSend(v107, "year");
    if (v35 != objc_msgSend(v106, "year"))
    {
      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _yearIntervalFormat](self, "_yearIntervalFormat"), v8, v9);
      v36 = objc_claimAutoreleasedReturnValue();
LABEL_88:
      v26 = (void *)v36;
LABEL_89:

      goto LABEL_90;
    }
    goto LABEL_43;
  }
  if (self->_monthOnly)
  {
    v37 = objc_msgSend(v107, "month");
    if (v37 != objc_msgSend(v106, "month"))
    {
      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _monthIntervalFormat](self, "_monthIntervalFormat"), v8, v9);
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_88;
    }
    goto LABEL_43;
  }
  if (self->_monthWithDelimiterAndYear)
  {
    v38 = objc_msgSend(v107, "month");
    if (v38 != objc_msgSend(v106, "month"))
    {
      PLBackendGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "[PLDateRangeFormatter] From and to date months are not equal, which should not happen for month highlight. Cannot get attributed string with UDateIntervalFormat formatter", buf, 2u);
      }

      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _monthYearIntervalFormat](self, "_monthYearIntervalFormat"), v8, v9);
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_88;
    }
    goto LABEL_43;
  }
  if (self->_monthWithYear)
  {
    v40 = objc_msgSend(v107, "month");
    if (v40 != objc_msgSend(v106, "month"))
    {
      _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _monthYearIntervalFormat](self, "_monthYearIntervalFormat"), v8, v9);
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_88;
    }
    goto LABEL_43;
  }
  v64 = objc_msgSend(v107, "year");
  if (v64 != objc_msgSend(v106, "year") || (v65 = objc_msgSend(v107, "month"), v65 != objc_msgSend(v106, "month")))
  {
    if (v16)
      v67 = -[PLDateRangeFormatter _differentMonthDayNoYearIntervalFormat](self, "_differentMonthDayNoYearIntervalFormat");
    else
      v67 = -[PLDateRangeFormatter _differentMonthDayIntervalFormat](self, "_differentMonthDayIntervalFormat");
    goto LABEL_87;
  }
  v66 = objc_msgSend(v107, "day");
  if (v66 != objc_msgSend(v106, "day"))
  {
    if (v16)
      v67 = -[PLDateRangeFormatter _monthDayNoYearIntervalFormat](self, "_monthDayNoYearIntervalFormat");
    else
      v67 = -[PLDateRangeFormatter _monthDayIntervalFormat](self, "_monthDayIntervalFormat");
LABEL_87:
    _FormattedDateWithUDateFormatter((uint64_t)v67, v8, v9);
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_88;
  }
LABEL_43:

LABEL_44:
  if (self->_yearOnly)
  {
    -[PLDateRangeFormatter _yearDateFormatter](self, "_yearDateFormatter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringFromDate:", v8);
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_48:
    v26 = (void *)v42;

    goto LABEL_90;
  }
  if (self->_monthOnly)
  {
    -[PLDateRangeFormatter _monthDateFormatter](self, "_monthDateFormatter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringFromDate:", v8);
    v42 = objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  if (!self->_monthWithDelimiterAndYear)
  {
    if (self->_monthWithYear)
    {
      -[PLDateRangeFormatter _monthYearDateFormatter](self, "_monthYearDateFormatter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringFromDate:", v8);
      v42 = objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
    if (self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting)
    {
      if (self->_allowUseTime && self->_useTime)
      {
        v59 = objc_msgSend(v105, "year");
        if (v59 == objc_msgSend(v107, "year"))
        {
          v60 = objc_msgSend(v105, "month");
          if (v60 == objc_msgSend(v107, "month"))
          {
            v61 = objc_msgSend(v105, "day");
            if (v61 == objc_msgSend(v107, "day"))
            {
              if (v9)
              {
                objc_msgSend(v9, "timeIntervalSinceDate:", v8);
                if (fabs(v62) > 900.0)
                {
LABEL_71:
                  _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _timeIntervalFormat](self, "_timeIntervalFormat"), v8, v9);
                  v63 = objc_claimAutoreleasedReturnValue();
LABEL_92:
                  v26 = (void *)v63;
                  goto LABEL_90;
                }
              }
LABEL_91:
              _FormattedDateWithUDateFormatter((uint64_t)-[PLDateRangeFormatter _timeIntervalFormat](self, "_timeIntervalFormat"), v8, v8);
              v63 = objc_claimAutoreleasedReturnValue();
              goto LABEL_92;
            }
          }
        }
      }
      if (_DateIsInThePastNumberOfDays(v8, 1, v15, v108, self->_useLocalDates))
      {
        -[PLDateRangeFormatter _relativeDateFormatter](self, "_relativeDateFormatter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringFromDate:", v104);
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      }
      if (_DateIsInThePastNumberOfDays(v8, 6, v15, v108, self->_useLocalDates))
      {
        -[PLDateRangeFormatter _dayOfTheWeekDateFormatter](self, "_dayOfTheWeekDateFormatter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringFromDate:", v8);
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      }
    }
    else if (self->_timeOnly)
    {
      if (v9)
      {
        objc_msgSend(v9, "timeIntervalSinceDate:", v8);
        if (fabs(v68) > 900.0)
          goto LABEL_71;
      }
      goto LABEL_91;
    }
    if (v16)
      -[PLDateRangeFormatter _sameDayNoYearDateFormatter](self, "_sameDayNoYearDateFormatter");
    else
      -[PLDateRangeFormatter _sameDayDateFormatter](self, "_sameDayDateFormatter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringFromDate:", v8);
    v42 = objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  -[PLDateRangeFormatter _monthYearDateFormatter](self, "_monthYearDateFormatter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_attributedStringWithFieldsFromDate:", v8);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v103, "string");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDateRangeFormatter _monthDateFormatter](self, "_monthDateFormatter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringFromDate:", v8);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend(v98, "localizedStandardRangeOfString:", v93);
  v47 = v46;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
  v49 = *MEMORY[0x1E0C99728];
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_55;
  v112[3] = &unk_1E3673CB0;
  v96 = v48;
  v113 = v96;
  v87 = v45;
  v90 = v49;
  objc_msgSend(v103, "enumerateAttribute:inRange:options:usingBlock:", v49, v45, v47, 0, v112);
  v101 = (void *)objc_msgSend(v98, "mutableCopy");
  *(_QWORD *)buf = 0;
  v118 = buf;
  v119 = 0x2020000000;
  v120 = 0;
  if (objc_msgSend(v96, "count") == 1
    && (objc_msgSend(v96, "anyObject"),
        v50 = (void *)objc_claimAutoreleasedReturnValue(),
        v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("M")),
        v50,
        v51))
  {
    objc_msgSend(v101, "insertString:atIndex:", CFSTR(""), v87 + v47);
    objc_msgSend(v101, "insertString:atIndex:", CFSTR(""), v87);
    *((_QWORD *)v118 + 3) += 2;
  }
  else
  {
    v52 = objc_msgSend(v103, "length");
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_2;
    v109[3] = &unk_1E3673CD8;
    v110 = v101;
    v111 = buf;
    objc_msgSend(v103, "enumerateAttribute:inRange:options:usingBlock:", v90, 0, v52, 2, v109);

  }
  objc_msgSend(v101, "componentsSeparatedByString:", CFSTR(""));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");
  v55 = v54 == *((_QWORD *)v118 + 3) + 1;

  if (v55)
  {
    v56 = (id)objc_msgSend(v101, "copy");
  }
  else
  {
    PLBackendGetLog();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v123 = 138543874;
      v124 = v98;
      v125 = 2114;
      v126 = v58;
      v127 = 2114;
      v128 = v101;
      _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_FAULT, "-[PLDateRangeFormatter _stringFromDate:toDate:currentDate:] Failed to retrieve back one or more delimiters we inserted in montYearString \"%{public}@\" using locale: %{public}@. Resulting in \"%{public}@\".", v123, 0x20u);

    }
    v56 = v98;
  }
  v26 = v56;
  _Block_object_dispose(buf, 8);

LABEL_90:
  v69 = v26;

  return v69;
}

- (int64_t)preset
{
  os_unfair_lock_s *p_lock;
  int64_t preset;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preset = self->_preset;
  os_unfair_lock_unlock(p_lock);
  return preset;
}

- (void)setPreset:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_preset != a3)
  {
    self->_preset = a3;
    -[PLDateRangeFormatter _handlePresetDidChange](self, "_handlePresetDidChange");
    -[PLDateRangeFormatter _resetFormatters](self, "_resetFormatters");
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowUseTime
{
  PLDateRangeFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowUseTime;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowUseTime:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowUseTime = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowUseRelativeDayFormatting
{
  PLDateRangeFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowUseRelativeDayFormatting;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowUseRelativeDayFormatting:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowUseRelativeDayFormatting = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSLocale)locale
{
  os_unfair_lock_s *p_lock;
  NSLocale *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_locale;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLocale:(id)a3
{
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDateRangeFormatter.m"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

  }
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSLocale isEqual:](self->_locale, "isEqual:", v7) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    -[PLDateRangeFormatter _resetFormatters](self, "_resetFormatters");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)useLocalDates
{
  PLDateRangeFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_useLocalDates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUseLocalDates:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_useLocalDates != v3)
  {
    self->_useLocalDates = v3;
    -[PLDateRangeFormatter _handleUseLocalDatesDidChange](self, "_handleUseLocalDatesDidChange");
    -[PLDateRangeFormatter _resetFormatters](self, "_resetFormatters");
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)stringFromDate:(id)a3 toDate:(id)a4 currentDate:(id)a5
{
  __CFString *v5;
  os_unfair_lock_s *p_lock;
  id v10;
  id v11;
  id v12;

  v5 = &stru_1E36789C0;
  if (a3 && a5)
  {
    p_lock = &self->_lock;
    v10 = a5;
    v11 = a4;
    v12 = a3;
    os_unfair_lock_lock(p_lock);
    -[PLDateRangeFormatter _stringFromDate:toDate:currentDate:](self, "_stringFromDate:toDate:currentDate:", v12, v11, v10);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
  }
  return v5;
}

- (id)stringFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDateRangeFormatter stringFromDate:toDate:currentDate:](self, "stringFromDate:toDate:currentDate:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringFromDate:(id)a3
{
  return -[PLDateRangeFormatter stringFromDate:toDate:](self, "stringFromDate:toDate:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthYearDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthDateFormatter, 0);
  objc_storeStrong((id *)&self->_yearDateFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfTheWeekDateFormatter, 0);
  objc_storeStrong((id *)&self->_sameDayNoYearDateFormatter, 0);
  objc_storeStrong((id *)&self->_sameDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

void __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "componentsSeparatedByString:", a2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "count") == 2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }

}

uint64_t __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_55(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", CFSTR("M"));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "insertString:atIndex:", CFSTR(""), a3 + a4);
    result = objc_msgSend(*(id *)(a1 + 32), "insertString:atIndex:", CFSTR(""), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += 2;
  }
  return result;
}

+ (id)autoupdatingFormatterWithPreset:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPreset:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__currentLocaleDidChange_, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__systemTimeZoneDidChange_, *MEMORY[0x1E0C998A0], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__significantTimeChange_, CFSTR("UIApplicationSignificantTimeChangeNotification"), 0);

  return v3;
}

@end
