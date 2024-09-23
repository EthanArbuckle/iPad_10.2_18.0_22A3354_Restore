@implementation _UIDatePickerMode_TimeInterval

+ (int64_t)datePickerMode
{
  return 3;
}

+ (unint64_t)extractableCalendarUnits
{
  return 96;
}

- (BOOL)isTimeIntervalMode
{
  return 1;
}

- (id)localizedFormatString
{
  NSString *localizedFormatString;

  localizedFormatString = self->super._localizedFormatString;
  if (!localizedFormatString)
  {
    -[_UIDatePickerMode setLocalizedFormatString:](self, "setLocalizedFormatString:", CFSTR("HH:mm"));
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (double)rowHeight
{
  return 32.0;
}

- (void)resetComponentWidths
{
  self->_componentWidth = 0.0;
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  if (a3 == 32)
    return 24;
  else
    return 10000;
}

- (int64_t)hourForRow:(int64_t)a3
{
  return a3;
}

- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  NSNumberFormatter *formatter;
  NSNumberFormatter *v10;
  NSNumberFormatter *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4);
  v8 = v7;
  if (v7 == 64 || v7 == 32)
  {
    formatter = self->super._formatter;
    if (!formatter)
    {
      v10 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v11 = self->super._formatter;
      self->super._formatter = v10;

      -[NSNumberFormatter setFormatterBehavior:](self->super._formatter, "setFormatterBehavior:", 1040);
      -[NSNumberFormatter setNumberStyle:](self->super._formatter, "setNumberStyle:", 0);
      formatter = self->super._formatter;
    }
    -[_UIDatePickerMode locale](self, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](formatter, "setLocale:", v12);

    v13 = -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", a3, v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](self->super._formatter, "stringFromNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_UIDatePickerMode_TimeInterval;
    -[_UIDatePickerMode titleForRow:inComponent:](&v17, sel_titleForRow_inComponent_, a3, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (_NSRange)rangeForCalendarUnit:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 64)
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 64)
    v3 = 60;
  if (a3 == 32)
    v5 = 0;
  else
    v5 = v4;
  if (a3 == 32)
    v6 = 24;
  else
    v6 = v3;
  result.length = v6;
  result.location = v5;
  return result;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  double result;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  _QWORD v46[4];
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  result = self->_componentWidth;
  if (result == 0.0)
  {
    v8 = *(_QWORD *)off_1E1678D90;
    v47 = *(_QWORD *)off_1E1678D90;
    -[_UIDatePickerMode fontForCalendarUnit:](self, "fontForCalendarUnit:", 32, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("00"), "sizeWithAttributes:", v10);
    v12 = v11;

    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_minutesStringForHour:minutes:", 1, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v38;
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_minutesStringForHour:minutes:", 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v15;
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_hoursStringForHour:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v17;
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_hoursStringForHour:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      v25 = 0.0;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v43 = v8;
          -[_UIDatePickerMode datePickerView](self, "datePickerView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_hrMinFont");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sizeWithAttributes:", v30);
          v32 = v31;

          if (v25 < v32)
            v25 = v32;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v23);
    }
    else
    {
      v25 = 0.0;
    }

    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "traitCollection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v34, "userInterfaceIdiom"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "pickerHorizontalEdgeInset");
    v37 = v12 + 6.0 + v25 + v36 + v36;
    self->_componentWidth = v37;
    if (v37 * (double)-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents") > a5)
      self->_componentWidth = floor(a5 / (double)-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"));

    return self->_componentWidth;
  }
  return result;
}

- (BOOL)areValidDateComponents:(id)a3 comparingUnits:(int64_t)a4
{
  char v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v10;
  BOOL result;
  void *v12;
  char v13;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "hour");
  v8 = objc_msgSend(v6, "minute");

  v10 = (v4 & 0x20) == 0 || v7 < 0x18;
  if ((v4 & 0x40) != 0)
  {
    if (v8 >= 0x3C)
      LOBYTE(v10) = 0;
    if (!v10)
      return 0;
  }
  else if (!v10)
  {
    return 0;
  }
  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_allowsZeroTimeInterval");

  result = 1;
  if ((~v4 & 0x60) == 0)
    return (v13 & 1) != 0 || (v7 | v8) != 0;
  return result;
}

- (id)dateComponentsByRestrictingSelectedComponents:(id)a3 withLastManipulatedColumn:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_allowsZeroTimeInterval") & 1) != 0 || objc_msgSend(v5, "hour"))
  {

  }
  else
  {
    v8 = objc_msgSend(v5, "minute");

    if (!v8)
    {
      v9 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v9, "setMinute:", -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals"));
      v5 = v9;
    }
  }
  return v5;
}

- (int64_t)valueForDate:(id)a3 dateComponents:(id)a4 calendarUnit:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int64_t v13;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerMode_TimeInterval;
  v9 = -[_UIDatePickerMode valueForDate:dateComponents:calendarUnit:](&v14, sel_valueForDate_dateComponents_calendarUnit_, a3, v8, a5);
  v10 = objc_msgSend((id)objc_opt_class(), "datePickerMode");
  if (a5 == 64 && v10 == 3)
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "_allowsZeroTimeInterval") & 1) != 0 || objc_msgSend(v8, "hour"))
    {

    }
    else
    {
      v13 = -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals");

      if ((uint64_t)v9 < v13)
        v9 = -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals");
    }
  }

  return (int64_t)v9;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  void *v7;
  char v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;

  if (a5 == 32)
  {
    LOBYTE(v12) = 1;
  }
  else if (a5 == 64)
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_allowsZeroTimeInterval");

    if ((v8 & 1) != 0
      || -[_UIDatePickerMode minuteForRow:](self, "minuteForRow:", a3)
      || (v9 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 32),
          -[_UIDatePickerMode datePickerView](self, "datePickerView"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "selectedRowInComponent:", v9),
          v10,
          (v12 = -[_UIDatePickerMode_TimeInterval hourForRow:](self, "hourForRow:", v11)) != 0))
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  if (a3 == 64)
    return 32;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if (a3 == 32)
    return 64;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

@end
