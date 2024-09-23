@implementation _UIDatePickerMode_Time

+ (int64_t)datePickerMode
{
  return 0;
}

+ (unint64_t)extractableCalendarUnits
{
  return 65632;
}

- (int64_t)displayedCalendarUnits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerMode_Time;
  return (unint64_t)-[_UIDatePickerMode displayedCalendarUnits](&v3, sel_displayedCalendarUnits) | 0x1E;
}

- (void)_shouldReset:(id)a3
{
  NSString *hourFormat;
  NSString *minuteFormat;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerMode_Time;
  -[_UIDatePickerMode _shouldReset:](&v6, sel__shouldReset_, a3);
  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;

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
    _UIDatePickerDateFormatFromTemplate(CFSTR("j:m"), v4, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode setLocalizedFormatString:](self, "setLocalizedFormatString:", v5);
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  id *p_hourFormat;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSString *minuteFormat;
  NSString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_hourFormat = (id *)&self->_hourFormat;
  if (!self->_hourFormat)
  {
    -[_UIDatePickerMode_Time localizedFormatString](self, "localizedFormatString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDatePickerComponent componentsFromDateFormatString:locale:followsSystemHourCycle:](_UIDatePickerComponent, "componentsFromDateFormatString:locale:followsSystemHourCycle:", v6, v7, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v10)
      goto LABEL_14;
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "calendarUnit", (_QWORD)v19) == 32)
        {
          objc_msgSend(v14, "formatString");
          v15 = objc_claimAutoreleasedReturnValue();
          minuteFormat = (NSString *)*p_hourFormat;
          *p_hourFormat = (id)v15;
        }
        else
        {
          if (objc_msgSend(v14, "calendarUnit") != 64)
            continue;
          objc_msgSend(v14, "formatString");
          v17 = (NSString *)objc_claimAutoreleasedReturnValue();
          minuteFormat = self->_minuteFormat;
          self->_minuteFormat = v17;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
  if (a3 == 32)
    return *p_hourFormat;
  if (a3 == 64)
  {
    p_hourFormat = (id *)&self->_minuteFormat;
    return *p_hourFormat;
  }
  return 0;
}

- (double)rowHeight
{
  return 32.0;
}

- (void)resetComponentWidths
{
  self->_timeHourWidth = 0.0;
  self->_timeMinuteWidth = 0.0;
  self->_timeAMPMWidth = 0.0;
}

- (void)noteCalendarChanged
{
  NSString *hourFormat;
  NSString *minuteFormat;
  objc_super v5;

  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerMode_Time;
  -[_UIDatePickerMode noteCalendarChanged](&v5, sel_noteCalendarChanged);
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  if (a3 == 0x10000)
    return 2;
  else
    return 10000;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  id v8;
  double *p_timeHourWidth;
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
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double timeAMPMWidth;
  double v34;
  double v35;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  int *v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  p_timeHourWidth = &self->_timeHourWidth;
  if (self->_timeHourWidth == 0.0)
  {
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
    objc_msgSend(v15, "horizontalTimeColumnPadding");
    *p_timeHourWidth = v14 + v16 + v16;

    -[_UIDatePickerMode componentWidthForTwoDigitCalendarUnit:font:maxWidth:](self, "componentWidthForTwoDigitCalendarUnit:font:maxWidth:", 64, v8, a5);
    v18 = ceil(v17);
    -[_UIDatePickerMode _style](self, "_style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "horizontalWeekdayTimePadding");
    self->_timeMinuteWidth = v18 + v20 + v20;

    v43 = v10;
    if (v10)
    {
      v46 = *(_QWORD *)off_1E1678D90;
      v21 = v46;
      v47[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeWithAttributes:", v22);
      v24 = v23;

      v44 = v21;
      v45 = v12;
      v25 = (void *)v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sizeWithAttributes:", v26);
      v28 = v27;

      if (v24 >= v28)
        v29 = v24;
      else
        v29 = v28;
      v30 = ceil(v29);
      -[_UIDatePickerMode _style](self, "_style");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "horizontalTimeColumnPadding");
      self->_timeAMPMWidth = v30 + v32 + v32;

    }
    else
    {
      v25 = (void *)v12;
    }
    timeAMPMWidth = self->_timeAMPMWidth;
    v34 = *p_timeHourWidth + self->_timeMinuteWidth + timeAMPMWidth;
    if (v34 > a5)
    {
      v35 = v34 - a5;
      v36 = timeAMPMWidth <= 0.0;
      v37 = 2.0;
      if (!v36)
        v37 = 3.0;
      v38 = round(v35 / v37);
      *p_timeHourWidth = *p_timeHourWidth - v38;
      self->_timeMinuteWidth = self->_timeMinuteWidth - v38;
      v39 = self->_timeAMPMWidth;
      if (v39 <= 0.0)
        v38 = 0.0;
      self->_timeAMPMWidth = v39 - v38;
    }

  }
  if (a3 == 32)
    goto LABEL_21;
  if (a3 == 64)
  {
    v41 = &OBJC_IVAR____UIDatePickerMode_Time__timeMinuteWidth;
    goto LABEL_20;
  }
  v40 = 0.0;
  if (a3 == 0x10000)
  {
    v41 = &OBJC_IVAR____UIDatePickerMode_Time__timeAMPMWidth;
LABEL_20:
    p_timeHourWidth = (double *)((char *)self + *v41);
LABEL_21:
    v40 = *p_timeHourWidth;
  }

  return v40;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  BOOL v18;

  -[_UIDatePickerMode selectedDateComponents](self, "selectedDateComponents", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDatePickerMode_Time displayedCalendarUnits](self, "displayedCalendarUnits");
  if (a5 == 0x10000)
  {
    v15 = v9;
    v16 = a3;
    goto LABEL_7;
  }
  if (a5 == 64)
  {
    objc_msgSend(v9, "setMinute:", -[_UIDatePickerMode minuteForRow:](self, "minuteForRow:", a3));
    goto LABEL_11;
  }
  if (a5 != 32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 1751, CFSTR("Unknown calendar unit: %lu"), a5);

    goto LABEL_11;
  }
  objc_msgSend(v9, "setHour:", -[_UIDatePickerMode hourForRow:](self, "hourForRow:", a3));
  objc_msgSend(v9, "setMinute:", 0);
  v11 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 0x10000);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectedRowInComponent:", v12);

    v15 = v9;
    v16 = v14;
LABEL_7:
    _UIDateComponentsSetValue(v15, 0x10000, v16);
  }
  v10 &= ~0x40uLL;
LABEL_11:
  v18 = -[_UIDatePickerMode areValidDateComponents:comparingUnits:](self, "areValidDateComponents:comparingUnits:", v9, v10);

  return v18;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  unint64_t v3;

  v3 = 16;
  if (a3 != 32)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 64)
    return 32;
  else
    return v3;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if (a3 == 32)
    return 64;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minuteFormat, 0);
  objc_storeStrong((id *)&self->_hourFormat, 0);
}

@end
