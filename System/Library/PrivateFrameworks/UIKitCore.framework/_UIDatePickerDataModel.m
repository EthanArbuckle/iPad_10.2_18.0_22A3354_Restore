@implementation _UIDatePickerDataModel

- (_UIDatePickerDataModel)init
{
  _UIDatePickerDataModel *v2;
  _UIDatePickerDataModel *v3;
  _UIDatePickerDateRange *v4;
  _UIDatePickerDateRange *dateRange;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerDataModel;
  v2 = -[_UIDatePickerDataModel init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_datePickerStyle = xmmword_1866691E0;
    v2->_minuteInterval = 1;
    v2->_roundsToMinuteInterval = 1;
    v4 = objc_alloc_init(_UIDatePickerDateRange);
    dateRange = v3->_dateRange;
    v3->_dateRange = v4;

  }
  return v3;
}

- (void)_setupDerivedLocaleAndCalendars
{
  NSCalendar *v3;
  NSCalendar *v4;
  NSCalendar *v5;
  NSLocale *locale;
  NSLocale *v7;
  NSLocale *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLocale *v12;
  void *v13;
  NSLocale *v14;
  NSLocale *effectiveLocale;
  NSLocale *v16;
  void *v17;
  int v18;
  uint64_t v19;
  _UIDatePickerChineseCalendar *chineseWrapperCalendar;
  _UIDatePickerChineseCalendar *v21;
  _UIDatePickerChineseCalendar *v22;
  NSCalendar *calendar;
  NSCalendar *v24;
  void *v25;
  NSCalendar *v26;
  void *v27;
  NSCalendar *effectiveCalendar;
  NSCalendar *v29;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v29 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  v3 = (NSCalendar *)-[NSCalendar copy](self->_calendar, "copy");
  if (v3)
    v4 = v3;
  else
    v4 = v29;
  v5 = v4;

  locale = self->_locale;
  if (locale)
  {
    v7 = locale;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (self->_calendar)
  {
    v9 = (void *)MEMORY[0x1E0C99DC8];
    -[NSLocale localeIdentifier](v7, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsFromLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSLocale *)objc_msgSend(v11, "mutableCopy");

    -[NSLocale removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("calendar"));
    -[NSLocale setObject:forKey:](v12, "setObject:forKey:", self->_calendar, *MEMORY[0x1E0C99790]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
    v14 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    effectiveLocale = self->_effectiveLocale;
    self->_effectiveLocale = v14;

  }
  else
  {
    v16 = v7;
    v12 = self->_effectiveLocale;
    self->_effectiveLocale = v16;
  }

  -[NSCalendar calendarIdentifier](v5, "calendarIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C996A0]);

  if (v18)
  {
    v19 = -[NSCalendar firstWeekday](v5, "firstWeekday");
    -[NSCalendar setLocale:](v5, "setLocale:", self->_effectiveLocale);
    -[NSCalendar setFirstWeekday:](v5, "setFirstWeekday:", v19);
    chineseWrapperCalendar = self->_chineseWrapperCalendar;
    if (chineseWrapperCalendar)
    {
      -[_UIDatePickerChineseCalendar setRealCalendar:](chineseWrapperCalendar, "setRealCalendar:", v5);
      goto LABEL_16;
    }
    v22 = -[_UIDatePickerChineseCalendar initWithCalendar:]([_UIDatePickerChineseCalendar alloc], "initWithCalendar:", v5);
    v21 = self->_chineseWrapperCalendar;
    self->_chineseWrapperCalendar = v22;
  }
  else
  {
    v21 = self->_chineseWrapperCalendar;
    self->_chineseWrapperCalendar = 0;
  }

LABEL_16:
  calendar = self->_calendar;
  if (!calendar)
    calendar = v29;
  v24 = calendar;
  -[_UIDatePickerDataModel timeZone](self, "timeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (NSCalendar *)-[NSCalendar copy](v24, "copy");

    -[_UIDatePickerDataModel timeZone](self, "timeZone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v26, "setTimeZone:", v27);

    v24 = v26;
  }
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = v24;

}

- (void)setLocale:(id)a3
{
  NSLocale *effectiveLocale;
  id v6;

  objc_storeStrong((id *)&self->_locale, a3);
  v6 = a3;
  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;

}

- (void)setCalendar:(id)a3
{
  NSCalendar *v4;
  NSCalendar *calendar;
  NSLocale *effectiveLocale;
  NSCalendar *effectiveCalendar;

  v4 = (NSCalendar *)objc_msgSend(a3, "copy");
  calendar = self->_calendar;
  self->_calendar = v4;

  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;

  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;

}

- (void)setTimeZone:(id)a3
{
  NSCalendar *effectiveCalendar;
  id v6;

  objc_storeStrong((id *)&self->_timeZone, a3);
  v6 = a3;
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;

}

- (NSLocale)effectiveLocale
{
  NSLocale *effectiveLocale;

  effectiveLocale = self->_effectiveLocale;
  if (!effectiveLocale || !self->_effectiveCalendar)
  {
    -[_UIDatePickerDataModel _setupDerivedLocaleAndCalendars](self, "_setupDerivedLocaleAndCalendars");
    effectiveLocale = self->_effectiveLocale;
  }
  return effectiveLocale;
}

- (NSCalendar)effectiveCalendar
{
  _UIDatePickerDataModel *v3;
  _UIDatePickerChineseCalendar *effectiveCalendar;
  _UIDatePickerChineseCalendar *v5;

  if (!self->_effectiveLocale || !self->_effectiveCalendar)
    -[_UIDatePickerDataModel _setupDerivedLocaleAndCalendars](self, "_setupDerivedLocaleAndCalendars");
  v3 = self;
  if (-[_UIDatePickerDataModel datePickerStyle](v3, "datePickerStyle") != 1
    || (effectiveCalendar = v3->_chineseWrapperCalendar) == 0)
  {
    effectiveCalendar = (_UIDatePickerChineseCalendar *)v3->_effectiveCalendar;
  }
  v5 = effectiveCalendar;

  return (NSCalendar *)v5;
}

- (NSCalendar)formattingCalendar
{
  _UIDatePickerDataModel *v2;
  _UIDatePickerChineseCalendar *chineseWrapperCalendar;
  NSCalendar *v4;
  NSCalendar *v5;

  v2 = self;
  if (-[_UIDatePickerDataModel datePickerStyle](v2, "datePickerStyle") == 1
    && (chineseWrapperCalendar = v2->_chineseWrapperCalendar) != 0)
  {
    -[_UIDatePickerChineseCalendar realCalendar](chineseWrapperCalendar, "realCalendar");
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2->_effectiveCalendar;
  }
  v5 = v4;

  return v5;
}

- (void)setLastSelectedDateComponents:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *v5;
  void *v6;
  NSCalendar *lastSelectedDateComponentsCalendar;
  NSCalendar *v8;
  NSDateComponents *lastSelectedDateComponents;

  v4 = (NSDateComponents *)a3;
  v5 = v4;
  if (v4
    && (-[NSDateComponents calendar](v4, "calendar"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    -[_UIDatePickerDataModel effectiveCalendar](self, "effectiveCalendar");
    v8 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    lastSelectedDateComponentsCalendar = self->_lastSelectedDateComponentsCalendar;
    self->_lastSelectedDateComponentsCalendar = v8;
  }
  else
  {
    lastSelectedDateComponentsCalendar = self->_lastSelectedDateComponentsCalendar;
    self->_lastSelectedDateComponentsCalendar = 0;
  }

  lastSelectedDateComponents = self->_lastSelectedDateComponents;
  self->_lastSelectedDateComponents = v5;

}

- (void)resetForCurrentLocaleOrCalendarChange
{
  NSLocale *effectiveLocale;
  NSCalendar *effectiveCalendar;

  if (!self->_locale || !self->_calendar)
  {
    effectiveLocale = self->_effectiveLocale;
    self->_effectiveLocale = 0;

    effectiveCalendar = self->_effectiveCalendar;
    self->_effectiveCalendar = 0;

  }
}

- (void)setDate:(id)a3
{
  NSDate *v4;
  uint64_t v5;
  NSDate *date;

  v4 = (NSDate *)a3;
  if (-[_UIDatePickerDataModel roundsToMinuteInterval](self, "roundsToMinuteInterval"))
  {
    -[_UIDatePickerDataModel _dateForRoundingDateToMinuteInterval:](self, "_dateForRoundingDateToMinuteInterval:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (NSDate *)v5;
  }
  date = self->_date;
  self->_date = v4;

}

- (NSDate)effectiveDate
{
  NSDate *date;
  NSDate *v4;
  void *v5;
  uint64_t v6;
  _UIDatePickerDateRange *dateRange;
  uint64_t v8;
  NSDateComponents *lastSelectedDateComponents;
  void *v11;
  NSCalendar *lastSelectedDateComponentsCalendar;
  NSCalendar *v13;
  NSCalendar *v14;

  date = self->_date;
  if (date)
  {
    v4 = date;
LABEL_3:
    v5 = v4;
    goto LABEL_4;
  }
  lastSelectedDateComponents = self->_lastSelectedDateComponents;
  if (!lastSelectedDateComponents)
  {
    v4 = (NSDate *)objc_opt_new();
    goto LABEL_3;
  }
  -[NSDateComponents calendar](lastSelectedDateComponents, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSDateComponents date](self->_lastSelectedDateComponents, "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  lastSelectedDateComponentsCalendar = self->_lastSelectedDateComponentsCalendar;
  if (lastSelectedDateComponentsCalendar)
  {
    v13 = lastSelectedDateComponentsCalendar;
  }
  else
  {
    -[_UIDatePickerDataModel effectiveCalendar](self, "effectiveCalendar");
    v13 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  -[NSCalendar dateFromComponents:](v13, "dateFromComponents:", self->_lastSelectedDateComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  if (-[_UIDatePickerDataModel roundsToMinuteInterval](self, "roundsToMinuteInterval"))
  {
    -[_UIDatePickerDataModel _dateForRoundingDateToMinuteInterval:](self, "_dateForRoundingDateToMinuteInterval:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (dyld_program_sdk_at_least())
  {
    dateRange = self->_dateRange;
    if (dateRange)
    {
      -[_UIDatePickerDateRange dateInRangeForDate:](dateRange, "dateInRangeForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }
  return (NSDate *)v5;
}

- (id)_dateForRoundingDateToMinuteInterval:(id)a3
{
  id v4;
  _UIDatePickerDataModel *v5;
  _UIDatePickerChineseCalendar *effectiveCalendar;
  _UIDatePickerChineseCalendar *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (v4 && -[_UIDatePickerDataModel minuteInterval](self, "minuteInterval") >= 2)
  {
    if (!self->_effectiveLocale || !self->_effectiveCalendar)
      -[_UIDatePickerDataModel _setupDerivedLocaleAndCalendars](self, "_setupDerivedLocaleAndCalendars");
    v5 = self;
    if (-[_UIDatePickerDataModel datePickerStyle](v5, "datePickerStyle") != 1
      || (effectiveCalendar = v5->_chineseWrapperCalendar) == 0)
    {
      effectiveCalendar = (_UIDatePickerChineseCalendar *)v5->_effectiveCalendar;
    }
    v7 = effectiveCalendar;

    -[_UIDatePickerChineseCalendar components:fromDate:](v7, "components:fromDate:", 766, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "minute");
    if (v9 % -[_UIDatePickerDataModel minuteInterval](v5, "minuteInterval"))
    {
      v10 = objc_msgSend(v8, "minute");
      v11 = -[_UIDatePickerDataModel minuteInterval](v5, "minuteInterval");
      objc_msgSend(v8, "setMinute:", (uint64_t)(floor((double)v10 / (double)v11) * (double)v11));
      -[_UIDatePickerChineseCalendar dateFromComponents:](v7, "dateFromComponents:", v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v12;
    }

  }
  return v4;
}

- (NSDateComponents)effectiveDateComponents
{
  _UIDatePickerDataModel *v3;
  _UIDatePickerChineseCalendar *effectiveCalendar;
  _UIDatePickerChineseCalendar *v5;
  void *v6;
  NSDateComponents *lastSelectedDateComponents;
  _UIDatePickerDataModel *v8;
  _UIDatePickerChineseCalendar *chineseWrapperCalendar;
  _UIDatePickerChineseCalendar *v10;
  void *v11;
  void *v12;
  _UIDatePickerDataModel *v13;
  _UIDatePickerChineseCalendar *v14;
  _UIDatePickerChineseCalendar *v15;

  if (!self->_effectiveLocale || !self->_effectiveCalendar)
    -[_UIDatePickerDataModel _setupDerivedLocaleAndCalendars](self, "_setupDerivedLocaleAndCalendars");
  if (!self->_date)
    goto LABEL_9;
  v3 = self;
  if (-[_UIDatePickerDataModel datePickerStyle](v3, "datePickerStyle") != 1
    || (effectiveCalendar = v3->_chineseWrapperCalendar) == 0)
  {
    effectiveCalendar = (_UIDatePickerChineseCalendar *)v3->_effectiveCalendar;
  }
  v5 = effectiveCalendar;

  -[_UIDatePickerChineseCalendar components:fromDate:](v5, "components:fromDate:", 766, self->_date);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_9:
    lastSelectedDateComponents = self->_lastSelectedDateComponents;
    if (!lastSelectedDateComponents
      || (v6 = (void *)-[NSDateComponents copy](lastSelectedDateComponents, "copy")) == 0)
    {
      v8 = self;
      if (-[_UIDatePickerDataModel datePickerStyle](v8, "datePickerStyle") != 1
        || (chineseWrapperCalendar = v8->_chineseWrapperCalendar) == 0)
      {
        chineseWrapperCalendar = (_UIDatePickerChineseCalendar *)v8->_effectiveCalendar;
      }
      v10 = chineseWrapperCalendar;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerChineseCalendar components:fromDate:](v10, "components:fromDate:", 766, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v6, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = self;
    if (-[_UIDatePickerDataModel datePickerStyle](v13, "datePickerStyle") != 1
      || (v14 = v13->_chineseWrapperCalendar) == 0)
    {
      v14 = (_UIDatePickerChineseCalendar *)v13->_effectiveCalendar;
    }
    v15 = v14;

    objc_msgSend(v6, "setCalendar:", v15);
  }
  return (NSDateComponents *)v6;
}

- (void)setMinuteInterval:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x1E && ((1 << a3) & 0x4010947E) != 0)
    self->_minuteInterval = a3;
}

- (void)setMinimumDate:(id)a3
{
  _UIDatePickerDateRange *dateRange;
  _UIDatePickerDateRange *v5;
  _UIDatePickerDateRange *v6;

  dateRange = self->_dateRange;
  if ((unint64_t)a3 | (unint64_t)dateRange)
  {
    v5 = -[_UIDatePickerDateRange copyWithStartDate:](dateRange, "copyWithStartDate:");
    v6 = self->_dateRange;
    self->_dateRange = v5;

  }
}

- (NSDate)minimumDate
{
  return -[_UIDatePickerDateRange startDate](self->_dateRange, "startDate");
}

- (void)setMaximumDate:(id)a3
{
  _UIDatePickerDateRange *dateRange;
  _UIDatePickerDateRange *v5;
  _UIDatePickerDateRange *v6;

  dateRange = self->_dateRange;
  if ((unint64_t)a3 | (unint64_t)dateRange)
  {
    v5 = -[_UIDatePickerDateRange copyWithEndDate:](dateRange, "copyWithEndDate:");
    v6 = self->_dateRange;
    self->_dateRange = v5;

  }
}

- (NSDate)maximumDate
{
  return -[_UIDatePickerDateRange endDate](self->_dateRange, "endDate");
}

- (void)setDatePickerStyle:(int64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerDataModel.m"), 283, CFSTR("date picker style can not be .automatic after being resolved."));

  }
  self->_datePickerStyle = a3;
}

- (int64_t)datePickerMode
{
  if (self->_datePickerMode != 4272 || self->_datePickerStyle == 3)
    return self->_datePickerMode;
  else
    return 2;
}

- (BOOL)followsSystemHourCycle
{
  return self->_locale == 0;
}

- (id)createDatePickerRepresentingDataModel
{
  return -[_UIDatePickerDataModel createDatePickerRepresentingDataModelForMode:style:](self, "createDatePickerRepresentingDataModelForMode:style:", -[_UIDatePickerDataModel datePickerMode](self, "datePickerMode"), -[_UIDatePickerDataModel datePickerStyle](self, "datePickerStyle"));
}

- (id)createDatePickerRepresentingDataModelForMode:(int64_t)a3 style:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDatePickerMode:", a3);
  objc_msgSend(v7, "setPreferredDatePickerStyle:", a4);
  -[_UIDatePickerDataModel calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCalendar:", v8);

  -[_UIDatePickerDataModel locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v9);

  -[_UIDatePickerDataModel timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v10);

  -[_UIDatePickerDataModel minimumDate](self, "minimumDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumDate:", v11);

  -[_UIDatePickerDataModel maximumDate](self, "maximumDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumDate:", v12);

  -[_UIDatePickerDataModel effectiveDate](self, "effectiveDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDate:", v13);

  objc_msgSend(v7, "setMinuteInterval:", -[_UIDatePickerDataModel minuteInterval](self, "minuteInterval"));
  -[_UIDatePickerDataModel customFontDesign](self, "customFontDesign");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setCustomFontDesign:", v14);

  objc_msgSend(v7, "setRoundsToMinuteInterval:", -[_UIDatePickerDataModel roundsToMinuteInterval](self, "roundsToMinuteInterval"));
  return v7;
}

- (int64_t)datePickerStyle
{
  return self->_datePickerStyle;
}

- (void)setDatePickerMode:(int64_t)a3
{
  self->_datePickerMode = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDateComponents)lastSelectedDateComponents
{
  return self->_lastSelectedDateComponents;
}

- (_UIDatePickerDateRange)dateRange
{
  return self->_dateRange;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (BOOL)roundsToMinuteInterval
{
  return self->_roundsToMinuteInterval;
}

- (void)setRoundsToMinuteInterval:(BOOL)a3
{
  self->_roundsToMinuteInterval = a3;
}

- (NSString)customFontDesign
{
  return self->_customFontDesign;
}

- (void)setCustomFontDesign:(id)a3
{
  objc_storeStrong((id *)&self->_customFontDesign, a3);
}

- (UIColor)customTextColor
{
  return self->_customTextColor;
}

- (void)setCustomTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_customTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTextColor, 0);
  objc_storeStrong((id *)&self->_customFontDesign, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_lastSelectedDateComponents, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lastSelectedDateComponentsCalendar, 0);
  objc_storeStrong((id *)&self->_chineseWrapperCalendar, 0);
  objc_storeStrong((id *)&self->_effectiveCalendar, 0);
  objc_storeStrong((id *)&self->_effectiveLocale, 0);
}

@end
