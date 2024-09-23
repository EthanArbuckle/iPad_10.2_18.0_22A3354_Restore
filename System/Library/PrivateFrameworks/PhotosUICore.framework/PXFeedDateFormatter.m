@implementation PXFeedDateFormatter

- (PXFeedDateFormatter)init
{
  return -[PXFeedDateFormatter initWithLocale:ignoreWhitelist:](self, "initWithLocale:ignoreWhitelist:", 0, 0);
}

- (PXFeedDateFormatter)initWithLocale:(id)a3 ignoreWhitelist:(BOOL)a4
{
  id v7;
  PXFeedDateFormatter *v8;
  PXFeedDateFormatter *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXFeedDateFormatter;
  v8 = -[PXFeedDateFormatter init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_ignoreWhitelist = a4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__calendarDayChanged_, *MEMORY[0x1E0C99690], 0);

    if (!v9->_locale)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__currentLocaleChanged_, *MEMORY[0x1E0C99720], 0);

    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXFeedDateFormatter;
  -[PXFeedDateFormatter dealloc](&v4, sel_dealloc);
}

- (id)stringFromDate:(id)a3
{
  id v4;
  NSString *todayString;
  NSString *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PXFeedDateFormatter _prepare](self, "_prepare");
  if (-[NSCalendar isDate:inSameDayAsDate:](self->_calendar, "isDate:inSameDayAsDate:", v4, self->_today))
  {
    todayString = self->_todayString;
LABEL_5:
    v6 = todayString;
    goto LABEL_9;
  }
  if (-[NSCalendar isDate:inSameDayAsDate:](self->_calendar, "isDate:inSameDayAsDate:", v4, self->_yesterday))
  {
    todayString = self->_yesterdayString;
    goto LABEL_5;
  }
  v7 = -[NSCalendar isDate:equalToDate:toUnitGranularity:](self->_calendar, "isDate:equalToDate:toUnitGranularity:", v4, self->_today, 4);
  v8 = 80;
  if (v7)
    v8 = 72;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "stringFromDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_stringByApplyingCapitalization:", 3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v6;
}

- (BOOL)isDateInToday:(id)a3
{
  id v4;

  v4 = a3;
  -[PXFeedDateFormatter _prepare](self, "_prepare");
  LOBYTE(self) = -[NSCalendar isDate:inSameDayAsDate:](self->_calendar, "isDate:inSameDayAsDate:", v4, self->_today);

  return (char)self;
}

- (BOOL)isDateInFuture:(id)a3
{
  id v4;
  NSComparisonResult v5;

  v4 = a3;
  -[PXFeedDateFormatter _prepare](self, "_prepare");
  v5 = -[NSCalendar compareDate:toDate:toUnitGranularity:](self->_calendar, "compareDate:toDate:toUnitGranularity:", self->_today, v4, 16);

  return v5 == NSOrderedAscending;
}

- (void)_invalidate
{
  PXFeedDateFormatter *v2;

  v2 = self;
  objc_sync_enter(v2);
  v2->_prepared = 0;
  objc_sync_exit(v2);

  px_dispatch_on_main_queue();
}

- (void)_prepare
{
  PXFeedDateFormatter *v2;
  uint64_t v3;
  NSCalendar *calendar;
  uint64_t v5;
  NSDate *today;
  id v7;
  uint64_t v8;
  NSDate *yesterday;
  NSLocale *locale;
  NSLocale *v11;
  NSLocale *v12;
  NSDateFormatter *v13;
  NSDateFormatter *dateFormatterForCurrentYear;
  NSDateFormatter *v15;
  void *v16;
  NSDateFormatter *v17;
  NSDateFormatter *dateFormatterForNoncurrentYears;
  uint64_t v19;
  NSString *todayString;
  uint64_t v21;
  NSString *yesterdayString;
  PXFeedDateFormatter *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_prepared)
  {
    obj->_prepared = 1;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = obj->_calendar;
    obj->_calendar = (NSCalendar *)v3;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    today = obj->_today;
    obj->_today = (NSDate *)v5;

    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setDay:", -1);
    -[NSCalendar dateByAddingComponents:toDate:options:](obj->_calendar, "dateByAddingComponents:toDate:options:", v7, obj->_today, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    yesterday = obj->_yesterday;
    obj->_yesterday = (NSDate *)v8;

    locale = obj->_locale;
    if (locale)
    {
      v11 = locale;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v11 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatterForCurrentYear = obj->_dateFormatterForCurrentYear;
    obj->_dateFormatterForCurrentYear = v13;

    -[NSDateFormatter setLocale:](obj->_dateFormatterForCurrentYear, "setLocale:", v12);
    v15 = obj->_dateFormatterForCurrentYear;
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEE, MMMM d"), 0, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v15, "setDateFormat:", v16);

    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatterForNoncurrentYears = obj->_dateFormatterForNoncurrentYears;
    obj->_dateFormatterForNoncurrentYears = v17;

    -[NSDateFormatter setLocale:](obj->_dateFormatterForNoncurrentYears, "setLocale:", v12);
    -[NSDateFormatter setDateStyle:](obj->_dateFormatterForNoncurrentYears, "setDateStyle:", 4);
    -[PXFeedDateFormatter _completeRelativeStringForDate:dateFormatter:](obj, "_completeRelativeStringForDate:dateFormatter:", obj->_today, obj->_dateFormatterForCurrentYear);
    v19 = objc_claimAutoreleasedReturnValue();
    todayString = obj->_todayString;
    obj->_todayString = (NSString *)v19;

    -[PXFeedDateFormatter _completeRelativeStringForDate:dateFormatter:](obj, "_completeRelativeStringForDate:dateFormatter:", obj->_yesterday, obj->_dateFormatterForCurrentYear);
    v21 = objc_claimAutoreleasedReturnValue();
    yesterdayString = obj->_yesterdayString;
    obj->_yesterdayString = (NSString *)v21;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (id)_completeRelativeStringForDate:(id)a3 dateFormatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v10, "setLocale:", v9);
  objc_msgSend(v10, "setDateStyle:", 4);
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v11, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v11, "stringFromDate:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0)
  {
    if (-[PXFeedDateFormatter _canSubstitueDateStringsWithLocale:](self, "_canSubstitueDateStringsWithLocale:", v9))
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v14, "setLocale:", v9);
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDateFormat:", v15);

      objc_msgSend(v14, "stringFromDate:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v8, "rangeOfString:options:", v16, 1);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v17, v18, v12);
        v19 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v19;
      }
      v20 = v8;

      v8 = v14;
    }
    else
    {
      v20 = v12;
    }

    v8 = v20;
  }
  objc_msgSend(v8, "px_stringByApplyingCapitalization:", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_canSubstitueDateStringsWithLocale:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;

  v4 = a3;
  if (self->_ignoreWhitelist)
    goto LABEL_5;
  if (_canSubstitueDateStringsWithLocale__onceToken != -1)
    dispatch_once(&_canSubstitueDateStringsWithLocale__onceToken, &__block_literal_global_16_269155);
  v5 = _canSubstitueDateStringsWithLocale__whitelistedLanguageCodes;
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) != 0)
  {
LABEL_5:
    v7 = 1;
  }
  else
  {
    v9 = (void *)_canSubstitueDateStringsWithLocale__whitelistedLocaleIdentifiers;
    objc_msgSend(v4, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", v10);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterForNoncurrentYears, 0);
  objc_storeStrong((id *)&self->_dateFormatterForCurrentYear, 0);
  objc_storeStrong((id *)&self->_yesterdayString, 0);
  objc_storeStrong((id *)&self->_todayString, 0);
  objc_storeStrong((id *)&self->_yesterday, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

void __58__PXFeedDateFormatter__canSubstitueDateStringsWithLocale___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ar"), CFSTR("de"), CFSTR("el"), CFSTR("en"), CFSTR("es"), CFSTR("he"), CFSTR("hr"), CFSTR("id"), CFSTR("ko"), CFSTR("nl"), CFSTR("pl"), CFSTR("pt"), CFSTR("ro"), CFSTR("ru"), CFSTR("sk"), CFSTR("sv"), CFSTR("uk"),
    CFSTR("vi"),
    CFSTR("yue"),
    CFSTR("zh"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_canSubstitueDateStringsWithLocale__whitelistedLanguageCodes;
  _canSubstitueDateStringsWithLocale__whitelistedLanguageCodes = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ms"), CFSTR("ms_BN"), CFSTR("ms_MY"), CFSTR("ms_SG"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_canSubstitueDateStringsWithLocale__whitelistedLocaleIdentifiers;
  _canSubstitueDateStringsWithLocale__whitelistedLocaleIdentifiers = v2;

}

void __34__PXFeedDateFormatter__invalidate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PXFeedDateFormatterChangedNotification"), *(_QWORD *)(a1 + 32));

}

+ (id)defaultFeedSectionDateFormatter
{
  if (defaultFeedSectionDateFormatter_onceToken != -1)
    dispatch_once(&defaultFeedSectionDateFormatter_onceToken, &__block_literal_global_269223);
  return (id)defaultFeedSectionDateFormatter_defaultFeedSectionDateFormatter;
}

void __54__PXFeedDateFormatter_defaultFeedSectionDateFormatter__block_invoke()
{
  PXFeedDateFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(PXFeedDateFormatter);
  v1 = (void *)defaultFeedSectionDateFormatter_defaultFeedSectionDateFormatter;
  defaultFeedSectionDateFormatter_defaultFeedSectionDateFormatter = (uint64_t)v0;

}

@end
