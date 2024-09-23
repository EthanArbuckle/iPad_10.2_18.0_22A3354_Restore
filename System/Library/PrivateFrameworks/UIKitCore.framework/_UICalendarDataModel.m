@implementation _UICalendarDataModel

- (_UICalendarDataModel)init
{
  _UICalendarDataModel *v2;
  uint64_t v3;
  NSLocale *locale;
  uint64_t v5;
  NSCalendar *calendar;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDateInterval *availableDateRange;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UICalendarDataModel;
  v2 = -[_UICalendarDataModel init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    objc_storeStrong((id *)&v2->_fontDesign, *(id *)off_1E167DBF8);
    v7 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);
    availableDateRange = v2->_availableDateRange;
    v2->_availableDateRange = (NSDateInterval *)v10;

  }
  return v2;
}

- (void)setCalendar:(id)a3
{
  NSCalendar *effectiveCalendar;
  NSLocale *effectiveLocale;
  id v7;

  objc_storeStrong((id *)&self->_calendar, a3);
  v7 = a3;
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;

  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;

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

- (void)setTimeZone:(id)a3
{
  NSCalendar *effectiveCalendar;
  id v6;

  objc_storeStrong((id *)&self->_timeZone, a3);
  v6 = a3;
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;

}

- (NSCalendar)effectiveCalendar
{
  -[_UICalendarDataModel _deriveEffectiveLocaleAndCalendarIfNeeded](self, "_deriveEffectiveLocaleAndCalendarIfNeeded");
  return self->_effectiveCalendar;
}

- (NSLocale)effectiveLocale
{
  -[_UICalendarDataModel _deriveEffectiveLocaleAndCalendarIfNeeded](self, "_deriveEffectiveLocaleAndCalendarIfNeeded");
  return self->_effectiveLocale;
}

- (NSTimeZone)effectiveTimeZone
{
  void *v2;
  void *v3;

  -[_UICalendarDataModel effectiveCalendar](self, "effectiveCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTimeZone *)v3;
}

- (_UIDatePickerCalendarMonth)visibleMonth
{
  _UIDatePickerCalendarMonth *v3;
  void *v4;
  char v5;
  _UIDatePickerCalendarMonth *visibleMonth;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _UIDatePickerCalendarMonth *v20;
  void *v21;
  _UIDatePickerCalendarMonth *v22;
  _UIDatePickerCalendarMonth *v23;

  if (!self->_effectiveCalendar
    || (v3 = self->_visibleMonth) == 0
    || (-[_UIDatePickerCalendarDateComponent calendar](v3, "calendar"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", self->_effectiveCalendar),
        v4,
        (v5 & 1) == 0))
  {
    visibleMonth = self->_visibleMonth;
    if (visibleMonth)
    {
      -[_UIDatePickerCalendarDateComponent calendar](visibleMonth, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICalendarDataModel effectiveTimeZone](self, "effectiveTimeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      if (v10 == v11)
      {

      }
      else
      {
        v12 = v11;
        if (v10 && v11)
        {
          v13 = objc_msgSend(v10, "isEqual:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
        -[_UIDatePickerCalendarDateComponent components](self->_visibleMonth, "components");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICalendarDataModel effectiveTimeZone](self, "effectiveTimeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTimeZone:", v15);

        objc_msgSend(v14, "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
LABEL_17:
          v20 = [_UIDatePickerCalendarMonth alloc];
          -[_UICalendarDataModel effectiveCalendar](self, "effectiveCalendar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v20, "initWithDate:calendar:", v16, v21);
          v23 = self->_visibleMonth;
          self->_visibleMonth = v22;

          return self->_visibleMonth;
        }
      }
    }
LABEL_13:
    -[_UIDatePickerCalendarDateComponent date](self->_visibleMonth, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v19;

    goto LABEL_17;
  }
  return self->_visibleMonth;
}

- (void)_deriveEffectiveLocaleAndCalendarIfNeeded
{
  NSLocale *v3;
  void *v4;
  NSCalendar *v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSCalendar *effectiveCalendar;
  NSLocale *effectiveLocale;
  NSCalendar *v11;

  if (!self->_effectiveLocale || !self->_effectiveCalendar)
  {
    -[_UICalendarDataModel locale](self, "locale");
    v3 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarDataModel calendar](self, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSCalendar *)objc_msgSend(v4, "copy");

    -[NSCalendar locale](v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v3);

    if ((v7 & 1) == 0)
    {
      v8 = -[NSCalendar firstWeekday](v5, "firstWeekday");
      -[NSCalendar setLocale:](v5, "setLocale:", v3);
      -[NSCalendar setFirstWeekday:](v5, "setFirstWeekday:", v8);
    }
    if (self->_timeZone)
      -[NSCalendar setTimeZone:](v5, "setTimeZone:");
    effectiveCalendar = self->_effectiveCalendar;
    self->_effectiveCalendar = v5;
    v11 = v5;

    effectiveLocale = self->_effectiveLocale;
    self->_effectiveLocale = v3;

  }
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

- (void)setVisibleMonth:(id)a3
{
  objc_storeStrong((id *)&self->_visibleMonth, a3);
}

- (NSDateInterval)availableDateRange
{
  return self->_availableDateRange;
}

- (void)setAvailableDateRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)fontDesign
{
  return self->_fontDesign;
}

- (void)setFontDesign:(id)a3
{
  objc_storeStrong((id *)&self->_fontDesign, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDesign, 0);
  objc_storeStrong((id *)&self->_availableDateRange, 0);
  objc_storeStrong((id *)&self->_visibleMonth, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_effectiveLocale, 0);
  objc_storeStrong((id *)&self->_effectiveCalendar, 0);
}

@end
