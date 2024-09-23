@implementation PKDatePickerImpl_CCExpiryPickerView

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v49;
  char *v50;
  char v51;
  objc_super v52;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v14 = a7;
  v52.receiver = self;
  v52.super_class = (Class)PKDatePickerImpl_CCExpiryPickerView;
  v15 = -[PKDatePickerImpl_CCExpiryPickerView init](&v52, sel_init);
  if (v15)
  {
    v49 = v14;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.366, 0.366, 0.366, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", v16);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setTextColor:", v17);

    }
    objc_msgSend(v15, "setDelegate:", v15);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 640;
    v20 = (void *)*((_QWORD *)v15 + 80);
    *((_QWORD *)v15 + 80) = v18;

    objc_storeStrong((id *)v15 + 81, a7);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 23.5);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = 656;
    v23 = (void *)*((_QWORD *)v15 + 82);
    *((_QWORD *)v15 + 82) = v21;

    if (v11 && v10 && !a3)
    {
      *(_OWORD *)(v15 + 552) = xmmword_19DF17820;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99768];
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "raise:format:", v25, CFSTR("%@ does not support the specified flags."), v27);

    }
    v28 = 0;
    v29 = v15 + 552;
    v30 = v15 + 568;
    v31 = 1;
    v32 = 0x1E0CB3000uLL;
    v50 = v15;
    do
    {
      v51 = v31;
      v33 = *(_QWORD *)&v29[8 * v28];
      v34 = &v30[16 * v28];
      *(_QWORD *)v34 = objc_msgSend(*(id *)&v15[v19], "maximumRangeOfUnit:", v33);
      *((_QWORD *)v34 + 1) = v35;
      if (v33 == 4)
      {
        v36 = *(void **)&v15[v19];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v37 = v32;
        v38 = v19;
        v39 = v30;
        v40 = v29;
        v41 = v22;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v34 = objc_msgSend(v36, "component:fromDate:", 4, v42) - 1;

        v22 = v41;
        v29 = v40;
        v30 = v39;
        v19 = v38;
        v32 = v37;
        v15 = v50;
        *((_QWORD *)v34 + 1) = 32;
      }
      v43 = objc_alloc_init(*(Class *)(v32 + 1400));
      v44 = *(void **)&v15[8 * v28 + 616];
      *(_QWORD *)&v15[8 * v28 + 616] = v43;

      objc_msgSend(*(id *)&v15[8 * v28 + 616], "setDateStyle:", 4);
      objc_msgSend(*(id *)&v15[8 * v28 + 616], "setCalendar:", *(_QWORD *)&v15[v19]);
      objc_msgSend(*(id *)&v15[8 * v28 + 616], "setFormattingContext:", 3);
      v45 = *(void **)&v15[8 * v28 + 616];
      objc_msgSend(v15, "_dateFormatForCalendarUnit:", v33);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setDateFormat:", v46);

      objc_msgSend(v15, "_calculateWidthForComponent:usingFont:", v28, *(_QWORD *)&v15[v22]);
      v31 = 0;
      *(_QWORD *)&v15[8 * v28 + 600] = v47;
      v28 = 1;
    }
    while ((v51 & 1) != 0);
    objc_msgSend(v15, "reloadAllComponents");
    objc_msgSend(v15, "selectRow:inComponent:animated:", objc_msgSend(v15, "_defaultIndexForComponent:", 0), 0, 0);
    objc_msgSend(v15, "selectRow:inComponent:animated:", objc_msgSend(v15, "_defaultIndexForComponent:", 1), 1, 0);
    v14 = v49;
  }

  return v15;
}

- (NSDate)date
{
  id v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setCalendar:", self->_calendar);
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    objc_msgSend(v3, "setValue:forComponent:", self->_possibleRange[v4].location+ -[PKDatePickerImpl_CCExpiryPickerView selectedRowInComponent:](self, "selectedRowInComponent:", v4), self->_calendarUnit[v4]);
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v7;
}

- (void)setDate:(id)a3
{
  uint64_t v5;
  unint64_t *calendarUnit;
  char v7;
  char v8;
  unint64_t v9;
  _NSRange *v10;
  BOOL v11;
  uint64_t v12;
  NSUInteger length;
  uint64_t v15;

  v5 = 0;
  calendarUnit = self->_calendarUnit;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = -[NSCalendar component:fromDate:](self->_calendar, "component:fromDate:", calendarUnit[v5], a3);
    v10 = &self->_possibleRange[v5];
    v11 = v9 >= v10->location;
    v12 = v9 - v10->location;
    if (v12 >= 0)
    {
      length = v10->length;
      if (v11
        && v12 < length
        && v12 < -[PKDatePickerImpl_CCExpiryPickerView _numberOfItemsForComponent:](self, "_numberOfItemsForComponent:", v5))
      {
        v15 = -[PKDatePickerImpl_CCExpiryPickerView selectedRowInComponent:](self, "selectedRowInComponent:", v5);
        if (v15 == -1 || v12 != v15)
          -[PKDatePickerImpl_CCExpiryPickerView selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", v12, v5, 0);
      }
    }
    v7 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
}

- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4
{
  objc_storeStrong(&self->_changeTarget, a3);
  self->_changeAction = a4;
}

- (void)prepareToDie
{
  -[PKDatePickerImpl_CCExpiryPickerView setDateValueChangedTarget:action:](self, "setDateValueChangedTarget:action:", 0, 0);
}

- (id)_dateFormatForCalendarUnit:(unint64_t)a3
{
  __CFString *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3 == 4)
  {
    v4 = CFSTR("yyyy");
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocaleWithOverriddenCalendar();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v4, 0, v10);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if (a3 != 8)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ does not support the specified calendar unit."), v8);

    v4 = &stru_1E3E7D690;
    goto LABEL_8;
  }
  if (!-[PKDatePickerImpl_CCExpiryPickerView _useDoubleMonthStyle](self, "_useDoubleMonthStyle"))
  {
    v4 = CFSTR("LLLL");
    goto LABEL_8;
  }
  v3 = CFSTR("LL '-' LLLL");
  return v3;
}

- (BOOL)_useDoubleMonthStyle
{
  NSNumber *useDoubleMonthStyle;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSObject *v10;
  _BOOL4 v11;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  useDoubleMonthStyle = self->_useDoubleMonthStyle;
  if (!useDoubleMonthStyle)
  {
    -[PKDatePickerImpl_CCExpiryPickerView _dateWithCalendarUnit:value:](self, "_dateWithCalendarUnit:value:", 8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v5, "setDateStyle:", 4);
    objc_msgSend(v5, "setCalendar:", self->_calendar);
    objc_msgSend(v5, "setFormattingContext:", 3);
    objc_msgSend(v5, "setDateFormat:", CFSTR("LLLL"));
    objc_msgSend(v5, "stringFromDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateFormat:", CFSTR("L"));
    objc_msgSend(v5, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "containsString:", v7) ^ 1);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_useDoubleMonthStyle;
    self->_useDoubleMonthStyle = v8;

    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[NSNumber BOOLValue](self->_useDoubleMonthStyle, "BOOLValue");
      v13[0] = 67109634;
      v13[1] = v11;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKDatePicker: useDoubleMonthStyle: %i (long:'%@' short:'%@')", (uint8_t *)v13, 0x1Cu);
    }

    useDoubleMonthStyle = self->_useDoubleMonthStyle;
  }
  return -[NSNumber BOOLValue](useDoubleMonthStyle, "BOOLValue");
}

- (id)_dateWithCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  id v7;
  void *v8;

  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setCalendar:", self->_calendar);
  objc_msgSend(v7, "setValue:forComponent:", a4, a3);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)_calculateWidthForComponent:(int64_t)a3 usingFont:(id)a4
{
  id v6;
  unint64_t v7;
  _NSRange *v8;
  NSUInteger location;
  NSUInteger length;
  NSDateFormatter *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  NSDateFormatter *v19;
  unint64_t v20;
  PKDatePickerImpl_CCExpiryPickerView *v21;
  id v22;
  void *v23;
  double v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = self->_calendarUnit[a3];
  v8 = &self->_possibleRange[a3];
  location = v8->location;
  length = v8->length;
  v11 = self->_dateFormatter[a3];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = 0.0;
  if (location < length + location)
  {
    v26 = (void *)v12;
    v27 = *MEMORY[0x1E0DC1138];
    do
    {
      -[NSCalendar dateBySettingUnit:value:ofDate:options:](self->_calendar, "dateBySettingUnit:value:ofDate:options:", v7, location, v13, 0, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[NSDateFormatter stringFromDate:](v11, "stringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v27;
        v31[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sizeWithAttributes:", v17);
        if (v18 > v14)
        {
          v28 = v27;
          v29 = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v19 = v11;
          v20 = v7;
          v21 = self;
          v22 = v6;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sizeWithAttributes:", v23);
          v14 = v24;

          v6 = v22;
          self = v21;
          v7 = v20;
          v11 = v19;
          v13 = v26;
        }

      }
      ++location;
      --length;
    }
    while (length);
  }

  return ceil(v14) + 2.0;
}

- (int64_t)_numberOfItemsForComponent:(int64_t)a3
{
  return self->_possibleRange[a3].length;
}

- (unint64_t)_defaultIndexForComponent:(int64_t)a3
{
  unint64_t v5;
  NSCalendar *calendar;
  void *v7;
  unint64_t v8;

  v5 = self->_calendarUnit[a3];
  calendar = self->_calendar;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSCalendar component:fromDate:](calendar, "component:fromDate:", v5, v7) - self->_possibleRange[a3].location;

  return v8;
}

- (id)_dateForComponent:(int64_t)a3 index:(unint64_t)a4
{
  return -[PKDatePickerImpl_CCExpiryPickerView _dateWithCalendarUnit:value:](self, "_dateWithCalendarUnit:value:", self->_calendarUnit[a3], self->_possibleRange[a3].location + a4);
}

- (id)_stringForComponent:(int64_t)a3 index:(unint64_t)a4
{
  void *v6;
  __CFString *v7;

  -[PKDatePickerImpl_CCExpiryPickerView _dateForComponent:index:](self, "_dateForComponent:index:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSDateFormatter stringFromDate:](self->_dateFormatter[a3], "stringFromDate:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("-");
  }

  return v7;
}

- (double)_widthForComponent:(int64_t)a3
{
  return self->_width[a3] + 10.0 + 5.0;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[PKDatePickerImpl_CCExpiryPickerView _numberOfItemsForComponent:](self, "_numberOfItemsForComponent:", a4);
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double result;

  -[PKDatePickerImpl_CCExpiryPickerView _widthForComponent:](self, "_widthForComponent:", a4);
  return result;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  PKDatePickerLabel *v9;
  PKDatePickerLabel *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v9 = (PKDatePickerLabel *)a6;
  v10 = v9;
  if (!v9)
    v10 = objc_alloc_init(PKDatePickerLabel);
  -[PKDatePickerImpl_CCExpiryPickerView _stringForComponent:index:](self, "_stringForComponent:index:", a5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDatePickerLabel setText:](v10, "setText:", v11);
  if (a5)
    v12 = 10.0;
  else
    v12 = 5.0;
  if (a5)
    v13 = 5.0;
  else
    v13 = 10.0;
  -[PKDatePickerLabel setTextAlignment:](v10, "setTextAlignment:", 2 * (a5 != 0));
  -[PKDatePickerLabel setFont:](v10, "setFont:", self->_font);
  -[PKDatePickerImpl_CCExpiryPickerView _textColor](self, "_textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDatePickerLabel setTextColor:](v10, "setTextColor:", v14);

  -[PKDatePickerLabel setContentInset:](v10, "setContentInset:", 0.0, v12, 0.0, v13);
  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;
  char v7;
  id v8;

  v6 = a3;
  if (self->_changeTarget)
  {
    if (self->_changeAction)
    {
      v8 = v6;
      v7 = objc_opt_respondsToSelector();
      v6 = v8;
      if ((v7 & 1) != 0)
      {
        objc_msgSend(self->_changeTarget, "performSelector:withObject:", self->_changeAction, self);
        v6 = v8;
      }
    }
  }

}

- (void).cxx_destruct
{
  NSDateFormatter **dateFormatter;
  uint64_t i;

  objc_storeStrong(&self->_changeTarget, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_useDoubleMonthStyle, 0);
  dateFormatter = self->_dateFormatter;
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&dateFormatter[i], 0);
}

@end
