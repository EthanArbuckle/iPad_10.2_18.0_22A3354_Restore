@implementation PKDatePickerImpl_PickerView

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v15;
  id v16;
  PKDatePickerImpl_PickerView *v17;
  void *v18;
  void *v19;
  id *p_calendar;
  uint64_t v21;
  NSUInteger v22;
  NSDateFormatter *v23;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  void *v31;
  objc_super v32;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v15 = a7;
  v16 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PKDatePickerImpl_PickerView;
  v17 = -[PKDatePickerImpl_PickerView init](&v32, sel_init);
  if (v17)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.366, 0.366, 0.366, 1.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDatePickerImpl_PickerView setBackgroundColor:](v17, "setBackgroundColor:", v18);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDatePickerImpl_PickerView _setTextColor:](v17, "_setTextColor:", v19);

    }
    -[PKDatePickerImpl_PickerView setDelegate:](v17, "setDelegate:", v17);
    p_calendar = (id *)&v17->_calendar;
    objc_storeStrong((id *)&v17->_calendar, a8);
    objc_storeStrong((id *)&v17->_locale, a7);
    if (!v13 || v12 || v11)
    {
      if (!v12 || v13 || v11)
      {
        if (!v11 || v12 || v13)
        {
          v28 = (void *)MEMORY[0x1E0C99DA0];
          v29 = *MEMORY[0x1E0C99768];
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "raise:format:", v29, CFSTR("%@ does not support the specified flags."), v31);

          goto LABEL_17;
        }
        v21 = 4;
      }
      else
      {
        v21 = 8;
      }
    }
    else
    {
      v21 = 16;
    }
    v17->_calendarUnit = v21;
LABEL_17:
    v17->_possibleRange.location = objc_msgSend(*p_calendar, "maximumRangeOfUnit:");
    v17->_possibleRange.length = v22;
    v23 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v17->_dateFormatter;
    v17->_dateFormatter = v23;

    -[NSDateFormatter setDateStyle:](v17->_dateFormatter, "setDateStyle:", 3);
    -[NSDateFormatter setCalendar:](v17->_dateFormatter, "setCalendar:", *p_calendar);
    v25 = v17->_dateFormatter;
    -[PKDatePickerImpl_PickerView _dateFormatForCalendarUnit:](v17, "_dateFormatForCalendarUnit:", v17->_calendarUnit);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v25, "setDateFormat:", v26);

    -[NSDateFormatter setFormattingContext:](v17->_dateFormatter, "setFormattingContext:", 3);
    -[PKDatePickerImpl_PickerView reloadAllComponents](v17, "reloadAllComponents");
    -[PKDatePickerImpl_PickerView selectRow:inComponent:animated:](v17, "selectRow:inComponent:animated:", -[PKDatePickerImpl_PickerView _defaultIndex](v17, "_defaultIndex"), 0, 0);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKDatePickerImpl_PickerView;
  -[PKDatePickerImpl_PickerView dealloc](&v2, sel_dealloc);
}

- (NSDate)date
{
  return (NSDate *)-[PKDatePickerImpl_PickerView _dateForIndex:](self, "_dateForIndex:", -[PKDatePickerImpl_PickerView selectedRowInComponent:](self, "selectedRowInComponent:", 0));
}

- (void)setDate:(id)a3
{
  NSUInteger v4;
  id v5;

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", self->_calendarUnit, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "valueForComponent:", self->_calendarUnit) - self->_possibleRange.location;
  if (v4 < -[PKDatePickerImpl_PickerView _numberOfItems](self, "_numberOfItems"))
    -[PKDatePickerImpl_PickerView selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", v4, 0, 0);

}

- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4
{
  objc_storeStrong(&self->_changeTarget, a3);
  self->_changeAction = a4;
}

- (void)prepareToDie
{
  -[PKDatePickerImpl_PickerView setDateValueChangedTarget:action:](self, "setDateValueChangedTarget:action:", 0, 0);
}

- (id)_dateFormatForCalendarUnit:(unint64_t)a3
{
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  switch(a3)
  {
    case 4uLL:
      v3 = CFSTR("yyyy");
      break;
    case 0x10uLL:
      v3 = CFSTR("dd");
      break;
    case 8uLL:
      v3 = CFSTR("LLLL");
      break;
    default:
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99768];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support the specified calendar unit."), v7);

      v3 = &stru_1E3E7D690;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocaleWithOverriddenCalendar();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v3, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_dateComponentsForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setCalendar:", self->_calendar);
  objc_msgSend(v7, "setValue:forComponent:", a4, a3);
  return v7;
}

- (unint64_t)_defaultIndex
{
  NSCalendar *calendar;
  unint64_t calendarUnit;
  void *v4;
  unint64_t v5;

  calendar = self->_calendar;
  calendarUnit = self->_calendarUnit;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSCalendar component:fromDate:](calendar, "component:fromDate:", calendarUnit, v4);

  return v5;
}

- (unint64_t)_numberOfItems
{
  return self->_possibleRange.length;
}

- (id)_dateForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[PKDatePickerImpl_PickerView _dateComponentsForCalendarUnit:value:](self, "_dateComponentsForCalendarUnit:value:", self->_calendarUnit, self->_possibleRange.location + a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringForIndex:(unint64_t)a3
{
  void *v4;
  __CFString *v5;

  -[PKDatePickerImpl_PickerView _dateForIndex:](self, "_dateForIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("-");
  }

  return v5;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double v4;

  -[PKDatePickerImpl_PickerView bounds](self, "bounds", a3, a4);
  return v4;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[PKDatePickerImpl_PickerView _stringForIndex:](self, "_stringForIndex:", a4);
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
  objc_storeStrong(&self->_changeTarget, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
