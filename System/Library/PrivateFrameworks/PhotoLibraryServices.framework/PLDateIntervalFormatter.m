@implementation PLDateIntervalFormatter

- (PLDateIntervalFormatter)init
{
  PLDateIntervalFormatter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLDateIntervalFormatter;
  result = -[PLDateIntervalFormatter init](&v3, sel_init);
  if (result)
    result->_alwaysShowYear = 1;
  return result;
}

- (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5
{
  return -[PLDateIntervalFormatter stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:](self, "stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:", a3, a4, a5, 0);
}

- (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 showLongMonthFormatIfNeeded:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  v13 = 0;
  if (v10 && a5)
  {
    if (v11)
      v14 = v11;
    else
      v14 = v10;
    v15 = v14;
    v16 = -[PLDateIntervalFormatter alwaysShowYear](self, "alwaysShowYear")
       || -[PLDateIntervalFormatter _yearIsNeededForDisplayingDate:](self, "_yearIsNeededForDisplayingDate:", v15);
    objc_msgSend((id)objc_opt_class(), "_dateFormatForDateFormatterType:displayYear:displayLongMonth:", a5, v16, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDateIntervalFormatter dateIntervalFormatter](self, "dateIntervalFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDateTemplate:", v17);

    -[PLDateIntervalFormatter dateIntervalFormatter](self, "dateIntervalFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate:toDate:", v10, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (BOOL)_yearIsNeededForDisplayingDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_currentLocalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDateIntervalFormatter gmtCalendar](self, "gmtCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compareDate:toDate:toUnitGranularity:", v5, v4, 4);

  return v7 != 0;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  NSDateIntervalFormatter *dateIntervalFormatter;
  NSDateIntervalFormatter *v4;
  NSDateIntervalFormatter *v5;
  void *v6;
  void *v7;

  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v4 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E0CB3590]);
    v5 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v4;

    -[PLDateIntervalFormatter locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setLocale:](self->_dateIntervalFormatter, "setLocale:", v6);

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setTimeZone:](self->_dateIntervalFormatter, "setTimeZone:", v7);

    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  return dateIntervalFormatter;
}

- (NSCalendar)gmtCalendar
{
  NSCalendar *gmtCalendar;
  NSCalendar *v4;
  NSCalendar *v5;
  void *v6;

  gmtCalendar = self->_gmtCalendar;
  if (!gmtCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    v5 = self->_gmtCalendar;
    self->_gmtCalendar = v4;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](self->_gmtCalendar, "setTimeZone:", v6);

    gmtCalendar = self->_gmtCalendar;
  }
  return gmtCalendar;
}

- (NSLocale)locale
{
  NSLocale *locale;

  locale = self->_locale;
  if (locale)
    return locale;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  return (NSLocale *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocale:(id)a3
{
  NSLocale *v5;

  v5 = (NSLocale *)a3;
  if (self->_locale != v5)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    -[NSDateIntervalFormatter setLocale:](self->_dateIntervalFormatter, "setLocale:", v5);
  }

}

- (BOOL)alwaysShowYear
{
  return self->_alwaysShowYear;
}

- (void)setAlwaysShowYear:(BOOL)a3
{
  self->_alwaysShowYear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_gmtCalendar, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
}

+ (id)_dateFormatForDateFormatterType:(unint64_t)a3 displayYear:(BOOL)a4 displayLongMonth:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  NSObject *v14;
  uint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v5 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@"), a4, a5, CFSTR("MMM"), CFSTR("d"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      if (a5)
        v9 = CFSTR("MMMM");
      else
        v9 = CFSTR("MMM");
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v9);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v7;
      v8 = 1;
      if (!v7)
        goto LABEL_18;
      goto LABEL_21;
    case 4uLL:
      v11 = CFSTR("MMM");
      if (a5)
        v11 = CFSTR("MMMM");
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("d"));
      goto LABEL_17;
    case 5uLL:
      v12 = (void *)MEMORY[0x1E0CB37A0];
      v13 = CFSTR("d");
      goto LABEL_16;
    case 6uLL:
      v12 = (void *)MEMORY[0x1E0CB37A0];
      v13 = CFSTR("MMMM");
LABEL_16:
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13, v16);
LABEL_17:
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      if (!v10)
        goto LABEL_18;
      goto LABEL_21;
    default:
      v8 = 1;
LABEL_18:
      PLMomentsGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v18 = a3;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Couldn't find dateFormat for type %lu", buf, 0xCu);
      }

      v10 = 0;
LABEL_21:
      if (v8 && v5)
        objc_msgSend(v10, "appendString:", CFSTR("y"));
      return v10;
  }
}

+ (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:", a3, a4, a5, 0);
}

+ (id)stringFromStartDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 showLongMonthFormatIfNeeded:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  PLDateIntervalFormatter *v11;
  void *v12;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PLDateIntervalFormatter);
  -[PLDateIntervalFormatter stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:](v11, "stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:", v10, v9, a5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_currentLocalDate
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "secondsFromGMTForDate:", v2);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
