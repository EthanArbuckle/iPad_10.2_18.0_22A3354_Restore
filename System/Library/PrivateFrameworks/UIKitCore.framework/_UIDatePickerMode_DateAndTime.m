@implementation _UIDatePickerMode_DateAndTime

+ (int64_t)datePickerMode
{
  return 2;
}

+ (unint64_t)extractableCalendarUnits
{
  return 66168;
}

- (void)_shouldReset:(id)a3
{
  NSDateFormatter *relativeFormatter;
  NSDateFormatter *weekdayFormatter;
  NSString *weekdayFormat;
  NSString *monthDayFormat;
  NSString *hourFormat;
  NSString *minuteFormat;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode_DateAndTime;
  -[_UIDatePickerMode _shouldReset:](&v10, sel__shouldReset_, a3);
  relativeFormatter = self->_relativeFormatter;
  self->_relativeFormatter = 0;

  weekdayFormatter = self->_weekdayFormatter;
  self->_weekdayFormatter = 0;

  weekdayFormat = self->_weekdayFormat;
  self->_weekdayFormat = 0;

  monthDayFormat = self->_monthDayFormat;
  self->_monthDayFormat = 0;

  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;

}

- (void)resetComponentWidths
{
  self->_wmdWeekMonthDayWidth = 0.0;
  self->_wmdHourWidth = 0.0;
  self->_wmdMinuteWidth = 0.0;
  self->_wmdAMPMWidth = 0.0;
}

- (void)noteCalendarChanged
{
  NSString *weekdayFormat;
  NSString *monthDayFormat;
  NSString *hourFormat;
  NSString *minuteFormat;
  NSDateFormatter *weekdayFormatter;
  NSDateFormatter *relativeFormatter;
  objc_super v9;

  weekdayFormat = self->_weekdayFormat;
  self->_weekdayFormat = 0;

  monthDayFormat = self->_monthDayFormat;
  self->_monthDayFormat = 0;

  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;

  weekdayFormatter = self->_weekdayFormatter;
  self->_weekdayFormatter = 0;

  relativeFormatter = self->_relativeFormatter;
  self->_relativeFormatter = 0;

  v9.receiver = self;
  v9.super_class = (Class)_UIDatePickerMode_DateAndTime;
  -[_UIDatePickerMode noteCalendarChanged](&v9, sel_noteCalendarChanged);
}

- (id)relativeFormatter
{
  NSDateFormatter *relativeFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;
  NSDateFormatter *v8;
  void *v9;
  NSDateFormatter *v10;
  void *v11;

  relativeFormatter = self->_relativeFormatter;
  if (!relativeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_relativeFormatter;
    self->_relativeFormatter = v4;

    v6 = self->_relativeFormatter;
    -[_UIDatePickerMode calendarForFormatters](self, "calendarForFormatters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v6, "setCalendar:", v7);

    v8 = self->_relativeFormatter;
    -[_UIDatePickerMode locale](self, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v8, "setLocale:", v9);

    v10 = self->_relativeFormatter;
    -[_UIDatePickerMode timeZone](self, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v10, "setTimeZone:", v11);

    -[NSDateFormatter setFormattingContext:](self->_relativeFormatter, "setFormattingContext:", 2);
    -[NSDateFormatter setDoesRelativeDateFormatting:](self->_relativeFormatter, "setDoesRelativeDateFormatting:", 1);
    -[NSDateFormatter setTimeStyle:](self->_relativeFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](self->_relativeFormatter, "setDateStyle:", 2);
    relativeFormatter = self->_relativeFormatter;
  }
  return relativeFormatter;
}

- (id)weekdayFormatter
{
  NSDateFormatter *weekdayFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;
  NSDateFormatter *v8;
  void *v9;
  NSDateFormatter *v10;
  void *v11;
  NSDateFormatter *v12;
  void *v13;

  weekdayFormatter = self->_weekdayFormatter;
  if (!weekdayFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_weekdayFormatter;
    self->_weekdayFormatter = v4;

    v6 = self->_weekdayFormatter;
    -[_UIDatePickerMode calendarForFormatters](self, "calendarForFormatters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v6, "setCalendar:", v7);

    v8 = self->_weekdayFormatter;
    -[_UIDatePickerMode locale](self, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v8, "setLocale:", v9);

    v10 = self->_weekdayFormatter;
    -[_UIDatePickerMode timeZone](self, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v10, "setTimeZone:", v11);

    -[NSDateFormatter setFormattingContext:](self->_weekdayFormatter, "setFormattingContext:", 2);
    -[NSDateFormatter setTimeStyle:](self->_weekdayFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](self->_weekdayFormatter, "setDateStyle:", 0);
    v12 = self->_weekdayFormatter;
    -[_UIDatePickerMode_DateAndTime dateFormatForCalendarUnit:](self, "dateFormatForCalendarUnit:", 512);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", v13);

    weekdayFormatter = self->_weekdayFormatter;
  }
  return weekdayFormatter;
}

- (id)localizedFormatString
{
  NSString *localizedFormatString;
  void *v4;
  void *v5;

  localizedFormatString = self->super._localizedFormatString;
  if (!localizedFormatString)
  {
    -[_UIDatePickerMode locale](self, "locale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerDateFormatFromTemplate(CFSTR("EEE, d MMM y j:m"), v4, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode setLocalizedFormatString:](self, "setLocalizedFormatString:", v5);
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  id *p_weekdayFormat;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString **p_minuteFormat;
  uint64_t v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSString *v30;
  NSString *monthDayFormat;
  id v32;
  int *v33;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  p_weekdayFormat = (id *)&self->_weekdayFormat;
  if (!self->_weekdayFormat)
  {
    v35 = a3;
    -[_UIDatePickerMode_DateAndTime localizedFormatString](self, "localizedFormatString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDatePickerComponent componentsFromDateFormatString:locale:followsSystemHourCycle:desiredUnits:](_UIDatePickerComponent, "componentsFromDateFormatString:locale:followsSystemHourCycle:desiredUnits:", v5, v6, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"), 96);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v13, "calendarUnit") != 32 || (p_minuteFormat = &self->_hourFormat, self->_hourFormat))
          {
            if (objc_msgSend(v13, "calendarUnit") != 64)
              continue;
            p_minuteFormat = &self->_minuteFormat;
            if (self->_minuteFormat)
              continue;
          }
          objc_msgSend(v13, "formatString");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *p_minuteFormat;
          *p_minuteFormat = (NSString *)v15;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v10);
    }

    -[_UIDatePickerMode locale](self, "locale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerDateFormatFromTemplate(CFSTR("EEE, d MMM"), v17, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode locale](self, "locale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDatePickerComponent componentsFromDateFormatString:locale:followsSystemHourCycle:desiredUnits:](_UIDatePickerComponent, "componentsFromDateFormatString:locale:followsSystemHourCycle:desiredUnits:", v18, v19, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"), 512);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if (objc_msgSend(v26, "calendarUnit") == 512)
          {
            objc_msgSend(v26, "formatString");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *p_weekdayFormat;
            *p_weekdayFormat = (id)v27;

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v23);
    }

    -[_UIDatePickerMode locale](self, "locale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerDateFormatFromTemplate(CFSTR("d MMM"), v29, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    monthDayFormat = self->_monthDayFormat;
    self->_monthDayFormat = v30;

    a3 = v35;
  }
  v32 = 0;
  if ((uint64_t)a3 > 511)
  {
    if (a3 == 512)
    {
LABEL_33:
      v32 = *p_weekdayFormat;
      return v32;
    }
    if (a3 == 536)
    {
      v33 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__monthDayFormat;
      goto LABEL_32;
    }
  }
  else
  {
    if (a3 == 32)
    {
      v33 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__hourFormat;
      goto LABEL_32;
    }
    if (a3 == 64)
    {
      v33 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__minuteFormat;
LABEL_32:
      p_weekdayFormat = (id *)((char *)&self->super.super.isa + *v33);
      goto LABEL_33;
    }
  }
  return v32;
}

- (int64_t)displayedCalendarUnits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerMode_DateAndTime;
  return -[_UIDatePickerMode displayedCalendarUnits](&v3, sel_displayedCalendarUnits) & 0xFFFFFFFFFFFFFDE1 | 0x1E;
}

- (unint64_t)elements
{
  unint64_t *result;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  unint64_t v19;

  result = self->super._elements;
  if (!result)
  {
    v19 = 0;
    -[_UIDatePickerMode_DateAndTime localizedFormatString](self, "localizedFormatString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend((id)objc_opt_class(), "extractableCalendarUnits");
    v7 = _UICopyCalendarUnitsFromFormatString(v5, v6, &v19);
    v8 = v19;
    if (v19 <= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 1911, CFSTR("unexpected number of calendar units: %ld for format: %@ (expecting at least 5 elements)"), v19, v5);

      v8 = v19;
    }
    v9 = v8 - 2;
    v10 = malloc_type_calloc(v8 - 2, 8uLL, 0x100004000313F17uLL);
    if (v19)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = v7[v11];
        if ((v15 & v14) == 0)
        {
          if ((v15 & 0x218) != 0)
            v16 = 536;
          else
            v16 = v7[v11];
          v10[v13++] = v16;
          v14 |= v16;
        }
        if (v15 == 512 || v15 == 16)
        {
          if ((v12 & 1) == 0)
            self->_weekdayLast = v15 == 16;
          v12 = 1;
        }
        ++v11;
      }
      while (v11 < v19);
    }
    -[_UIDatePickerMode setElements:](self, "setElements:", v10);
    -[_UIDatePickerMode setNumberOfComponents:](self, "setNumberOfComponents:", v9);
    -[_UIDatePickerMode fixUpElementsForRTL](self, "fixUpElementsForRTL");
    free(v7);

    return self->super._elements;
  }
  return result;
}

- (void)loadDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[_UIDatePickerMode_DateAndTime _resetBaseDateComponentsIfNecessaryFromDate:](self, "_resetBaseDateComponentsIfNecessaryFromDate:", v6);
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerMode_DateAndTime;
  -[_UIDatePickerMode loadDate:animated:](&v7, sel_loadDate_animated_, v6, v4);

}

- (void)_resetBaseDateComponentsIfNecessaryFromDate:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v4 = (uint64_t)(double)(-[_UIDatePickerMode_DateAndTime numberOfRowsForCalendarUnit:](self, "numberOfRowsForCalendarUnit:", 536)/ 4);
  -[_UIDatePickerMode baseDate](self, "baseDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", v4);
  -[_UIDatePickerMode calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDay:", 3 * v4);
  -[_UIDatePickerMode calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "earlierDate:", v13);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v13)
  {

LABEL_5:
    -[_UIDatePickerMode_DateAndTime _takeBaseDateComponentsFromDate:](self, "_takeBaseDateComponentsFromDate:", v13);
    goto LABEL_6;
  }
  objc_msgSend(v10, "laterDate:", v13);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
    goto LABEL_5;
LABEL_6:

}

- (void)_takeBaseDateComponentsFromDate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = -[_UIDatePickerMode_DateAndTime numberOfRowsForCalendarUnit:](self, "numberOfRowsForCalendarUnit:", 536);
  if (v5 >= 0)
    v6 = v5;
  else
    v6 = v5 + 1;
  v7 = (uint64_t)(double)(v6 >> 1);
  v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v13, "setDay:", -v7);
  -[_UIDatePickerMode calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v13, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_UIDatePickerMode_DateAndTime displayedCalendarUnits](self, "displayedCalendarUnits");
  -[_UIDatePickerMode calendar](self, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHour:", 12);
  objc_msgSend(v12, "setMinute:", 0);
  objc_msgSend(v12, "setSecond:", 0);
  -[_UIDatePickerMode setBaseDateComponents:](self, "setBaseDateComponents:", v12);

}

- (id)baseDateComponents
{
  NSDateComponents *baseDateComponents;
  void *v4;
  void *v5;
  void *v6;

  baseDateComponents = self->super._baseDateComponents;
  if (!baseDateComponents)
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode_DateAndTime _takeBaseDateComponentsFromDate:](self, "_takeBaseDateComponentsFromDate:", v6);

    baseDateComponents = self->super._baseDateComponents;
  }
  return baseDateComponents;
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  if (a3 == 0x10000)
    return 2;
  else
    return 10000;
}

- (double)componentWidthForDateTimeCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  id v8;
  double *p_wmdWeekMonthDayWidth;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double wmdWeekdayWidth;
  void *v40;
  double v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  id WeakRetained;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double wmdAMPMWidth;
  double v64;
  double v65;
  double v66;
  BOOL v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  int *v73;
  void *v75;
  void *v76;
  double *v77;
  void *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  p_wmdWeekMonthDayWidth = &self->_wmdWeekMonthDayWidth;
  if (self->_wmdWeekMonthDayWidth == 0.0)
  {
    v77 = &self->_wmdWeekMonthDayWidth;
    -[_UIDatePickerMode amString](self, "amString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode pmString](self, "pmString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode amPmFont](self, "amPmFont");
    v12 = objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode componentWidthForTwoDigitCalendarUnit:font:maxWidth:](self, "componentWidthForTwoDigitCalendarUnit:font:maxWidth:", 32, v8, a5);
    v14 = ceil(v13);
    -[_UIDatePickerMode _style](self, "_style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalWeekdayTimePadding");
    self->_wmdHourWidth = v14 + v16 + v16;

    -[_UIDatePickerMode componentWidthForTwoDigitCalendarUnit:font:maxWidth:](self, "componentWidthForTwoDigitCalendarUnit:font:maxWidth:", 64, v8, a5);
    v18 = ceil(v17);
    -[_UIDatePickerMode _style](self, "_style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "horizontalWeekdayTimePadding");
    self->_wmdMinuteWidth = v18 + v20 + v20;

    self->_wmdAMPMWidth = 0.0;
    v21 = *(_QWORD *)off_1E1678D90;
    if (v10)
    {
      v87 = *(_QWORD *)off_1E1678D90;
      v88[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeWithAttributes:", v22);
      v24 = v23;

      v85 = v21;
      v86 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sizeWithAttributes:", v25);
      v27 = v26;

      if (v24 >= v27)
        v28 = v24;
      else
        v28 = v27;
      v29 = ceil(v28);
      -[_UIDatePickerMode _style](self, "_style");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "horizontalPaddingForAMPM");
      self->_wmdAMPMWidth = v29 + v31 + v31;

    }
    v75 = (void *)v12;
    v76 = v10;
    self->_wmdWeekdayWidth = 0.0;
    -[_UIDatePickerMode_DateAndTime weekdayFormatter](self, "weekdayFormatter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i != 8; ++i)
    {
      v34 = (void *)objc_msgSend((id)objc_opt_class(), "newDateFromGregorianYear:month:day:timeZone:", 2007, 1, i, 0);
      objc_msgSend(v32, "stringFromDate:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v21;
      v84 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sizeWithAttributes:", v36);
      v38 = v37;

      wmdWeekdayWidth = self->_wmdWeekdayWidth;
      if (v38 >= wmdWeekdayWidth)
        wmdWeekdayWidth = v38;
      self->_wmdWeekdayWidth = ceil(wmdWeekdayWidth);

    }
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 536);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0.0;
    for (j = 1; j != 13; ++j)
    {
      v43 = (void *)objc_msgSend((id)objc_opt_class(), "newDateFromGregorianYear:month:day:timeZone:", 2007, j, 28, 0);
      objc_msgSend(v40, "stringFromDate:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v21;
      v82 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sizeWithAttributes:", v45);
      v47 = v46;

      if (v47 >= v41)
        v41 = v47;

    }
    v48 = v41 + self->_wmdWeekdayWidth;
    -[_UIDatePickerMode _style](self, "_style");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "horizontalWeekMonthDayPadding");
    *v77 = v48 + v50;

    *v77 = ceil(*v77);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._datePickerView);
    objc_msgSend(WeakRetained, "traitCollection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v52, "userInterfaceIdiom"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    _UINSLocalizedStringWithDefaultValue(CFSTR("Today"), CFSTR("Today"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v21;
    v80 = v8;
    p_wmdWeekMonthDayWidth = &self->_wmdWeekMonthDayWidth;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "sizeWithAttributes:", v54);
    v56 = v55;
    -[_UIDatePickerMode _style](self, "_style");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "horizontalWeekMonthDayPadding");
    v59 = v56 + v58;
    objc_msgSend(v78, "pickerHorizontalEdgeInset");
    v61 = v59 + v60;

    v62 = *v77;
    if (*v77 < v61)
      v62 = v61;
    *v77 = v62;
    wmdAMPMWidth = self->_wmdAMPMWidth;
    v64 = v62 + self->_wmdHourWidth + self->_wmdMinuteWidth + wmdAMPMWidth;
    if (v64 > a5)
    {
      v65 = v64 - a5;
      if (self->_weekdayLast)
      {
        v66 = fmin(v65, 10.0);
        self->_wmdWeekdayWidth = self->_wmdWeekdayWidth - v66;
        v65 = v65 - v66;
        wmdAMPMWidth = self->_wmdAMPMWidth;
        v62 = *v77;
      }
      v67 = wmdAMPMWidth <= 0.0;
      v68 = 3.0;
      if (!v67)
        v68 = 4.0;
      v69 = round(fmin(v65 / v68, 16.0));
      *v77 = v62 - v69;
      v70 = round((v65 - v69) / (v68 + -1.0));
      self->_wmdHourWidth = self->_wmdHourWidth - v70;
      self->_wmdMinuteWidth = self->_wmdMinuteWidth - v70;
      v71 = self->_wmdAMPMWidth;
      if (v71 > 0.0)
        self->_wmdAMPMWidth = v71 - v70;
    }

  }
  v72 = 0.0;
  if ((uint64_t)a3 > 535)
  {
    if (a3 == 536)
    {
LABEL_34:
      v72 = *p_wmdWeekMonthDayWidth;
      goto LABEL_35;
    }
    if (a3 == 0x10000)
    {
      v73 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__wmdAMPMWidth;
      goto LABEL_33;
    }
  }
  else
  {
    if (a3 == 32)
    {
      v73 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__wmdHourWidth;
      goto LABEL_33;
    }
    if (a3 == 64)
    {
      v73 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__wmdMinuteWidth;
LABEL_33:
      p_wmdWeekMonthDayWidth = (double *)((char *)self + *v73);
      goto LABEL_34;
    }
  }
LABEL_35:

  return v72;
}

- (double)weekdayWidth
{
  return self->_wmdWeekdayWidth;
}

- (BOOL)isWeekdayLast
{
  return self->_weekdayLast;
}

- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  objc_super v8;

  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4) == 536)
    return &stru_1E16EDF20;
  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerMode_DateAndTime;
  -[_UIDatePickerMode titleForRow:inComponent:](&v8, sel_titleForRow_inComponent_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  void *v4;
  objc_super v6;

  if (a4 == 536)
  {
    -[_UIDatePickerMode_DateAndTime _dateForWeekMonthDayRow:](self, "_dateForWeekMonthDayRow:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIDatePickerMode_DateAndTime;
    -[_UIDatePickerMode dateForRow:inCalendarUnit:](&v6, sel_dateForRow_inCalendarUnit_, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a5) == 536)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:", 30, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setHour:", 12);
    objc_msgSend(v13, "setMinute:", 0);
    objc_msgSend(v13, "setSecond:", 0);
    -[_UIDatePickerMode calendar](self, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateFromComponents:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode calendar](self, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode baseDate](self, "baseDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "components:fromDate:toDate:options:", 16, v15, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "day");
    -[_UIDatePickerMode baseDate](self, "baseDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v15, "compare:", v20);

    if (v21 == -1 && v19 > 0 || v21 == 1 && v19 < 0)
      v19 = -v19;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIDatePickerMode_DateAndTime;
    v19 = -[_UIDatePickerMode rowForDate:dateComponents:component:currentRow:](&v23, sel_rowForDate_dateComponents_component_currentRow_, v10, v11, a5, a6);
  }

  return v19;
}

- (id)_dateForWeekMonthDayRow:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", a3);
  -[_UIDatePickerMode calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode baseDate](self, "baseDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldEnableWeekMonthDayForRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  -[_UIDatePickerMode_DateAndTime _dateForWeekMonthDayRow:](self, "_dateForWeekMonthDayRow:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerMode minimumDateComponents](self, "minimumDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode maximumDateComponents](self, "maximumDateComponents");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    v10 = (unint64_t)(_UIDatePickerCompareDateComponents(v7, v6, 30) + 1) < 2;
    if (!v9)
      goto LABEL_5;
  }
  else
  {
    v10 = 1;
    if (!v8)
      goto LABEL_5;
  }
  if ((unint64_t)_UIDatePickerCompareDateComponents(v9, v6, 30) >= 2)
    v10 = 0;
LABEL_5:

  return v10;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  BOOL v20;

  if (a5 == 536)
    return -[_UIDatePickerMode_DateAndTime _shouldEnableWeekMonthDayForRow:](self, "_shouldEnableWeekMonthDayForRow:", a3, a4);
  -[_UIDatePickerMode selectedDateComponents](self, "selectedDateComponents", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  switch(a5)
  {
    case 0x10000uLL:
      v16 = a3;
      goto LABEL_9;
    case 0x40uLL:
      objc_msgSend(v10, "setMinute:", -[_UIDatePickerMode minuteForRow:](self, "minuteForRow:", a3));
      v17 = 64;
      goto LABEL_13;
    case 0x20uLL:
      objc_msgSend(v10, "setHour:", -[_UIDatePickerMode hourForRow:](self, "hourForRow:", a3));
      objc_msgSend(v11, "setMinute:", 0);
      v12 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 0x10000);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_10:
        v17 = 32;
        goto LABEL_13;
      }
      v13 = v12;
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "selectedRowInComponent:", v13);

      v10 = v11;
      v16 = v15;
LABEL_9:
      _UIDateComponentsSetValue(v10, 0x10000, v16);
      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 2197, CFSTR("Unknown calendar unit: %lu"), a5);

  v19 = 0x7FFFFFFFFFFFFFFFLL;
  v17 = a5;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_13:
    v19 = a5;
    do
    {
      v19 |= v17;
      v17 = -[_UIDatePickerMode_DateAndTime nextUnitLargerThanUnit:](self, "nextUnitLargerThanUnit:");
    }
    while (v17 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v20 = -[_UIDatePickerMode areValidDateComponents:comparingUnits:](self, "areValidDateComponents:comparingUnits:", v11, v19);

  return v20;
}

- (id)viewForRow:(int64_t)a3 inComponent:(int64_t)a4 reusingView:(id)a5
{
  id v8;
  UIDatePickerWeekMonthDayView *v9;
  UIDatePickerWeekMonthDayView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  int64_t v55;
  objc_super v56;

  v8 = a5;
  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4) == 536)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (UIDatePickerWeekMonthDayView *)v8;
    }
    else
    {
      v10 = [UIDatePickerWeekMonthDayView alloc];
      v9 = -[UIDatePickerWeekMonthDayView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_textColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextColor:", v13);

      -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_textShadowColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShadowColor:", v16);

      -[UIDatePickerWeekMonthDayView weekdayLabel](v9, "weekdayLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_textColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTextColor:", v19);

      -[UIDatePickerWeekMonthDayView weekdayLabel](v9, "weekdayLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_textShadowColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setShadowColor:", v22);

    }
    -[_UIDatePickerMode_DateAndTime _dateForWeekMonthDayRow:](self, "_dateForWeekMonthDayRow:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 536);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode calendar](self, "calendar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "components:fromDate:", 766, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setHour:", 12);
    objc_msgSend(v26, "setMinute:", 0);
    objc_msgSend(v26, "setSecond:", 0);
    -[_UIDatePickerMode calendar](self, "calendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateFromComponents:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "stringFromDate:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v29;
    v55 = a3;
    if (objc_msgSend(v30, "highlightsToday"))
    {
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      v32 = v31;
      -[_UIDatePickerMode todaySinceReferenceDate](self, "todaySinceReferenceDate");
      v34 = v32 - v33;
      if (v34 >= 0.0)
        v35 = v34;
      else
        v35 = -v34;

      if (v35 <= 0.1)
      {
        -[_UIDatePickerMode_DateAndTime relativeFormatter](self, "relativeFormatter");
        v36 = objc_claimAutoreleasedReturnValue();

        -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIDatePickerMode todayTextColor](self, "todayTextColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTextColor:", v38);

        -[UIDatePickerWeekMonthDayView weekdayLabel](v9, "weekdayLabel");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setText:", 0);
        v24 = (void *)v36;
LABEL_14:

        -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringFromDate:", v28);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setText:", v49);

        -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIDatePickerMode fontForCalendarUnit:](self, "fontForCalendarUnit:", 536);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setFont:", v51);

        -[UIDatePickerWeekMonthDayView setWeekdayLast:](v9, "setWeekdayLast:", -[_UIDatePickerMode_DateAndTime isWeekdayLast](self, "isWeekdayLast"));
        -[_UIDatePickerMode_DateAndTime weekdayWidth](self, "weekdayWidth");
        -[UIDatePickerWeekMonthDayView setWeekdayWidth:](v9, "setWeekdayWidth:");
        -[UIDatePickerWeekMonthDayView setFormattedDateString:](v9, "setFormattedDateString:", v54);
        -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setEnabled:", -[_UIDatePickerMode_DateAndTime _shouldEnableWeekMonthDayForRow:](self, "_shouldEnableWeekMonthDayForRow:", v55));

        return v9;
      }
    }
    else
    {

    }
    -[_UIDatePickerMode_DateAndTime weekdayFormatter](self, "weekdayFormatter", v29);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePickerWeekMonthDayView weekdayLabel](v9, "weekdayLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringFromDate:", v28);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setText:", v41);

    -[UIDatePickerWeekMonthDayView dateLabel](v9, "dateLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_textColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextColor:", v44);

    -[UIDatePickerWeekMonthDayView weekdayLabel](v9, "weekdayLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_textColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTextColor:", v47);

    goto LABEL_14;
  }
  v56.receiver = self;
  v56.super_class = (Class)_UIDatePickerMode_DateAndTime;
  -[_UIDatePickerMode viewForRow:inComponent:reusingView:](&v56, sel_viewForRow_inComponent_reusingView_, a3, a4, v8);
  v9 = (UIDatePickerWeekMonthDayView *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateEnabledStateOfViewForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4) == 536)
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewForRow:forComponent:", a3, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "dateLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEnabled:", -[_UIDatePickerMode_DateAndTime _shouldEnableWeekMonthDayForRow:](self, "_shouldEnableWeekMonthDayForRow:", a3));

      }
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIDatePickerMode_DateAndTime;
    -[_UIDatePickerMode updateEnabledStateOfViewForRow:inComponent:](&v10, sel_updateEnabledStateOfViewForRow_inComponent_, a3, a4);
  }
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  if ((uint64_t)a3 <= 15)
  {
    if (a3 == 4)
      return 2;
    if (a3 == 8)
      return 4;
  }
  else
  {
    switch(a3)
    {
      case 0x10uLL:
        return 8;
      case 0x40uLL:
        return 32;
      case 0x20uLL:
        return 16;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if ((uint64_t)a3 <= 7)
  {
    if (a3 == 2)
      return 4;
    if (a3 == 4)
      return 8;
  }
  else
  {
    switch(a3)
    {
      case 8uLL:
        return 16;
      case 0x10uLL:
        return 32;
      case 0x20uLL:
        return 64;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);
  objc_storeStrong((id *)&self->_relativeFormatter, 0);
  objc_storeStrong((id *)&self->_minuteFormat, 0);
  objc_storeStrong((id *)&self->_hourFormat, 0);
  objc_storeStrong((id *)&self->_monthDayFormat, 0);
  objc_storeStrong((id *)&self->_weekdayFormat, 0);
}

@end
