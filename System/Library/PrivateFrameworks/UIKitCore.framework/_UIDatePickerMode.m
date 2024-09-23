@implementation _UIDatePickerMode

+ (void)initialize
{
  if (initialize_componentsUnitOrder_onceToken != -1)
    dispatch_once(&initialize_componentsUnitOrder_onceToken, &__block_literal_global_434);
}

+ (id)newDateFromGregorianYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 timeZone:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  CFAbsoluteTime v15;
  CFDateRef v16;

  v9 = (objc_class *)MEMORY[0x1E0C99D78];
  v10 = a6;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setYear:", a3);
  objc_msgSend(v11, "setMonth:", a4);
  objc_msgSend(v11, "setDay:", a5);
  objc_msgSend(v11, "setTimeZone:", v10);

  v12 = objc_alloc(MEMORY[0x1E0C99D48]);
  v13 = (void *)objc_msgSend(v12, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v13, "dateFromComponents:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x186DC5AC4]();
  v16 = CFDateCreate(0, v15);

  return v16;
}

+ (int64_t)datePickerMode
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDatePickerMode.m"), 161, CFSTR("%s must be overridden by subclasses"), "+[_UIDatePickerMode datePickerMode]");

  return 0;
}

+ (id)_datePickerModeWithMode:(int64_t)a3 datePickerView:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;

  v5 = a4;
  v6 = 0;
  if (a3 > 4268)
  {
    if (a3 == 4269 || a3 == 4270 || a3 == 4271)
LABEL_6:
      v6 = (objc_class *)objc_opt_class();
  }
  else
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        goto LABEL_6;
      default:
        break;
    }
  }
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setDatePickerView:", v5);
  objc_msgSend(v7, "noteCalendarChanged");

  return v7;
}

+ (id)_datePickerModeWithFormatString:(id)a3 datePickerView:(id)a4
{
  id v5;
  id v6;
  _UIDatePickerMode_Custom *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_UIDatePickerMode_Custom initWithFormatString:datePickerView:]([_UIDatePickerMode_Custom alloc], "initWithFormatString:datePickerView:", v6, v5);

  -[_UIDatePickerMode_Custom noteCalendarChanged](v7, "noteCalendarChanged");
  return v7;
}

- (_UIDatePickerMode)init
{
  _UIDatePickerMode *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode;
  v3 = -[_UIDatePickerMode init](&v10, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    if (v4 == objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("_UIDatePickerMode.m"), 202, CFSTR("%@ is an abstract class. You must instantiate on of its subclasses instead."), v8);

      return 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__shouldReset_, CFSTR("_UIDatePickerModeShouldResetNotification"), 0);

      -[_UIDatePickerMode setMinuteInterval:](v3, "setMinuteInterval:", 1);
    }
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  unint64_t *elements;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIDatePickerModeShouldResetNotification"), 0);

  elements = self->_elements;
  if (elements)
  {
    free(elements);
    self->_elements = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerMode;
  -[_UIDatePickerMode dealloc](&v5, sel_dealloc);
}

- (int64_t)_yearlessYearForMonth:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_UIDatePickerMode calendar](self, "calendar", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C996D0]) & 1) != 0)
  {
    v5 = 6;
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("islamic")))
  {
    v5 = 7;
  }
  else
  {
    v5 = 1604;
  }

  return v5;
}

- (BOOL)followsSystemHourCycle
{
  void *v2;
  void *v3;
  char v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "followsSystemHourCycle");

  return v4;
}

- (id)calendar
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)calendarForFormatters
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattingCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)locale
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timeZone
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_style
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_shouldReset:(id)a3
{
  NSArray *dateFormatters;
  UIFont *font;
  UIFont *amPmFont;
  UIFont *defaultTimeFont;
  unint64_t *elements;
  NSString *localizedFormatString;

  dateFormatters = self->_dateFormatters;
  self->_dateFormatters = 0;

  font = self->_font;
  self->_font = 0;

  amPmFont = self->_amPmFont;
  self->_amPmFont = 0;

  defaultTimeFont = self->_defaultTimeFont;
  self->_defaultTimeFont = 0;

  elements = self->_elements;
  if (elements)
  {
    free(elements);
    self->_elements = 0;
  }
  self->_numberOfComponents = 0;
  localizedFormatString = self->_localizedFormatString;
  self->_localizedFormatString = 0;

  -[_UIDatePickerMode resetComponentWidths](self, "resetComponentWidths");
}

- (double)componentWidthForTwoDigitCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v9, "rangeOfUnit:inUnit:forDate:", a3, a3 >> 1, v10);
  v13 = v12;
  objc_msgSend(v9, "components:fromDate:", 766, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0.0;
  if (v13 >= (int)v11)
  {
    v11 = (int)v11;
    v27 = *(_QWORD *)off_1E1678D90;
    do
    {
      _UIDateComponentsSetValue(v14, a3, v11);
      objc_msgSend(v9, "dateFromComponents:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringFromDate:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v19 = v13;
      v20 = a3;
      v21 = v9;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeWithAttributes:", v23);
      v25 = v24;

      v8 = v22;
      v9 = v21;
      a3 = v20;
      v13 = v19;
      if (v25 >= v16)
        v16 = v25;

      ++v11;
      v10 = v17;
    }
    while (v19 >= v11);
  }
  else
  {
    v17 = v10;
  }
  if (v16 < a5)
    a5 = v16;

  return a5;
}

- (BOOL)is24Hour
{
  return -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 0x10000) == 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)datePickerMode
{
  return objc_msgSend((id)objc_opt_class(), "datePickerMode");
}

- (id)dateFormatterForCalendarUnit:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *dateFormatters;
  void *v14;

  v4 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", a3);
  if (!self->_dateFormatters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"))
    {
      v6 = 0;
      do
      {
        v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v7, "setDateStyle:", 2);
        objc_msgSend(v7, "setTimeStyle:", 0);
        -[_UIDatePickerMode locale](self, "locale");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLocale:", v8);

        -[_UIDatePickerMode calendarForFormatters](self, "calendarForFormatters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCalendar:", v9);

        -[_UIDatePickerMode timeZone](self, "timeZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTimeZone:", v10);

        objc_msgSend(v7, "setFormattingContext:", 2);
        -[_UIDatePickerMode dateFormatForCalendarUnit:](self, "dateFormatForCalendarUnit:", -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", v6));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDateFormat:", v11);
        objc_msgSend(v5, "addObject:", v7);

        ++v6;
      }
      while (v6 < -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"));
    }
    v12 = (NSArray *)objc_msgSend(v5, "copy");
    dateFormatters = self->_dateFormatters;
    self->_dateFormatters = v12;

  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || v4 >= -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"))
  {
    v14 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_dateFormatters, "objectAtIndex:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (void)setTodayDateComponents:(id)a3
{
  NSDateComponents *v5;
  NSDateComponents *v6;

  v5 = (NSDateComponents *)a3;
  if (self->_todayDateComponents != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_todayDateComponents, a3);
    v5 = v6;
    self->_yearsSinceBaseDate = 0;
  }

}

- (NSDateComponents)todayDateComponents
{
  NSDateComponents *todayDateComponents;
  void *v4;
  void *v5;
  NSDateComponents *v6;
  NSDateComponents *v7;

  todayDateComponents = self->_todayDateComponents;
  if (!todayDateComponents)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 766, v5);
    v6 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    v7 = self->_todayDateComponents;
    self->_todayDateComponents = v6;

    -[NSDateComponents setHour:](self->_todayDateComponents, "setHour:", 12);
    -[NSDateComponents setMinute:](self->_todayDateComponents, "setMinute:", 0);
    -[NSDateComponents setSecond:](self->_todayDateComponents, "setSecond:", 0);
    -[_UIDatePickerMode setTodaySinceReferenceDate:](self, "setTodaySinceReferenceDate:", 0.0);
    self->_yearsSinceBaseDate = 0;

    todayDateComponents = self->_todayDateComponents;
  }
  return todayDateComponents;
}

- (double)todaySinceReferenceDate
{
  double result;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  result = self->_todaySinceReferenceDate;
  if (result == 0.0)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode todayDateComponents](self, "todayDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    self->_todaySinceReferenceDate = v7;

    return self->_todaySinceReferenceDate;
  }
  return result;
}

- (NSDate)originatingDate
{
  NSDate *originatingDate;
  void *v4;

  originatingDate = self->_originatingDate;
  if (!originatingDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode setOriginatingDate:](self, "setOriginatingDate:", v4);

    originatingDate = self->_originatingDate;
  }
  return originatingDate;
}

- (void)clearBaseDate
{
  -[_UIDatePickerMode setBaseDateComponents:](self, "setBaseDateComponents:", 0);
  -[_UIDatePickerMode setBaseDate:](self, "setBaseDate:", 0);
  -[_UIDatePickerMode setYearsSinceBaseDate:](self, "setYearsSinceBaseDate:", 0);
}

- (void)setBaseDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_baseDateComponents, a3);
  -[_UIDatePickerMode setBaseDate:](self, "setBaseDate:", 0);
}

- (NSDateComponents)baseDateComponents
{
  NSDateComponents *baseDateComponents;
  NSDateComponents *v4;
  NSDateComponents *v5;

  baseDateComponents = self->_baseDateComponents;
  if (!baseDateComponents)
  {
    v4 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    v5 = self->_baseDateComponents;
    self->_baseDateComponents = v4;

    -[NSDateComponents setEra:](self->_baseDateComponents, "setEra:", 1);
    -[NSDateComponents setYear:](self->_baseDateComponents, "setYear:", 1);
    -[NSDateComponents setMonth:](self->_baseDateComponents, "setMonth:", 1);
    -[NSDateComponents setDay:](self->_baseDateComponents, "setDay:", 1);
    -[NSDateComponents setHour:](self->_baseDateComponents, "setHour:", 12);
    -[NSDateComponents setMinute:](self->_baseDateComponents, "setMinute:", 0);
    -[NSDateComponents setSecond:](self->_baseDateComponents, "setSecond:", 0);
    baseDateComponents = self->_baseDateComponents;
  }
  return baseDateComponents;
}

- (NSDate)baseDate
{
  NSDate *baseDate;
  void *v4;
  void *v5;
  void *v6;

  baseDate = self->_baseDate;
  if (!baseDate)
  {
    -[_UIDatePickerMode baseDateComponents](self, "baseDateComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode setBaseDate:](self, "setBaseDate:", v6);

    baseDate = self->_baseDate;
  }
  return baseDate;
}

- (int64_t)yearsSinceBaseDate
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  result = self->_yearsSinceBaseDate;
  if (!result)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode baseDate](self, "baseDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:toDate:options:", 4, v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    self->_yearsSinceBaseDate = objc_msgSend(v7, "year");
    return self->_yearsSinceBaseDate;
  }
  return result;
}

- (NSString)amString
{
  NSString *amString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  amString = self->_amString;
  if (!amString)
  {
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 0x10000);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "AMSymbol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_amString;
    self->_amString = v6;

    amString = self->_amString;
  }
  return amString;
}

- (NSString)pmString
{
  NSString *pmString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  pmString = self->_pmString;
  if (!pmString)
  {
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 0x10000);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PMSymbol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_pmString;
    self->_pmString = v6;

    pmString = self->_pmString;
  }
  return pmString;
}

- (id)fontForCalendarUnit:(unint64_t)a3
{
  if (a3 == 0x10000)
    -[_UIDatePickerMode amPmFont](self, "amPmFont");
  else
    -[_UIDatePickerMode font](self, "font");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)font
{
  UIFont *font;
  UIFont *v4;
  UIFont *v5;

  font = self->_font;
  if (!font)
  {
    -[_UIDatePickerMode sizedFont](self, "sizedFont");
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_font;
    self->_font = v4;

    font = self->_font;
  }
  return font;
}

- (UIFont)sizedFont
{
  _UIDatePickerView **p_datePickerView;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  UIFont **p_amPmFont;
  UIFont *amPmFont;
  void *v31;

  p_datePickerView = &self->_datePickerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
  objc_msgSend(WeakRetained, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v31 = v6;
  objc_msgSend(v6, "pickerHorizontalEdgeInset");
  v11 = v9 - (v10 + v10);

  v12 = objc_loadWeakRetained((id *)p_datePickerView);
  objc_msgSend(v12, "_style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)p_datePickerView);
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerCellFontWithTraitCollection:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointSize");
  v18 = (uint64_t)v17;

  v19 = 0;
  v20 = v18 + 1;
  do
  {
    v21 = objc_loadWeakRetained((id *)p_datePickerView);
    objc_msgSend(v21, "_style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)p_datePickerView);
    objc_msgSend(v23, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerCellFontWithTraitCollection:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v19;

    v19 = v25;
    -[_UIDatePickerMode totalComponentWidthWithFont:](self, "totalComponentWidthWithFont:", v19);
    if (v27 <= v11)
      break;
    -[_UIDatePickerMode resetComponentWidths](self, "resetComponentWidths");
    --v20;
  }
  while (v20 > 14);
  if (!-[_UIDatePickerMode is24Hour](self, "is24Hour"))
  {
    amPmFont = self->_amPmFont;
    p_amPmFont = &self->_amPmFont;
    if ((objc_msgSend(v19, "isEqual:", amPmFont) & 1) == 0)
      objc_storeStrong((id *)p_amPmFont, v25);
  }

  return (UIFont *)v19;
}

- (UIFont)defaultTimeFont
{
  UIFont *defaultTimeFont;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  UIFont *v8;
  UIFont *v9;

  defaultTimeFont = self->_defaultTimeFont;
  if (!defaultTimeFont)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
    objc_msgSend(WeakRetained, "_style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)&self->_datePickerView);
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerCellFontWithTraitCollection:", v7);
    v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v9 = self->_defaultTimeFont;
    self->_defaultTimeFont = v8;

    defaultTimeFont = self->_defaultTimeFont;
  }
  return defaultTimeFont;
}

- (UIFont)amPmFont
{
  UIFont *amPmFont;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  UIFont *v8;
  UIFont *v9;

  amPmFont = self->_amPmFont;
  if (!amPmFont)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
    objc_msgSend(WeakRetained, "_style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)&self->_datePickerView);
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerCellFontWithTraitCollection:", v7);
    v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v9 = self->_amPmFont;
    self->_amPmFont = v8;

    amPmFont = self->_amPmFont;
  }
  return amPmFont;
}

- (double)rowHeight
{
  return 32.0;
}

- (UIColor)todayTextColor
{
  UIColor *todayTextColor;
  id WeakRetained;
  UIColor *v5;
  UIColor *v6;

  todayTextColor = self->_todayTextColor;
  if (!todayTextColor)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
    objc_msgSend(WeakRetained, "_textColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v6 = self->_todayTextColor;
    self->_todayTextColor = v5;

    todayTextColor = self->_todayTextColor;
  }
  return todayTextColor;
}

- (void)invalidateTodayTextColor
{
  UIColor *todayTextColor;

  todayTextColor = self->_todayTextColor;
  self->_todayTextColor = 0;

}

- (unint64_t)numberOfComponents
{
  unint64_t result;

  result = self->_numberOfComponents;
  if (!result)
  {
    -[_UIDatePickerMode elements](self, "elements");
    return self->_numberOfComponents;
  }
  return result;
}

- (double)widthForComponent:(int64_t)a3 maxWidth:(double)a4
{
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v13;

  if (a3 < 0 || -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("component >= 0 && component < [self numberOfComponents]"));

  }
  v8 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a3);
  -[_UIDatePickerMode font](self, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode widthForCalendarUnit:font:maxWidth:](self, "widthForCalendarUnit:font:maxWidth:", v8, v9, a4);
  v11 = v10;

  return v11;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 523, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode widthForCalendarUnit:font:maxWidth:]");

  return 0.0;
}

+ (unint64_t)extractableCalendarUnits
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDatePickerMode.m"), 530, CFSTR("%s must be overridden by subclasses"), "+[_UIDatePickerMode extractableCalendarUnits]");

  return 0;
}

- (BOOL)isTimeIntervalMode
{
  return 0;
}

- (void)setElements:(unint64_t *)a3
{
  unint64_t *elements;

  elements = self->_elements;
  if (elements != a3)
  {
    if (elements)
    {
      free(elements);
      self->_elements = 0;
      -[_UIDatePickerMode setNumberOfComponents:](self, "setNumberOfComponents:", 0);
    }
    self->_elements = a3;
  }
}

- (unint64_t)elements
{
  unint64_t *result;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  result = self->_elements;
  if (!result)
  {
    v6 = 0;
    -[_UIDatePickerMode localizedFormatString](self, "localizedFormatString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)objc_opt_class(), "extractableCalendarUnits");
    -[_UIDatePickerMode setElements:](self, "setElements:", _UICopyCalendarUnitsFromFormatString(v4, v5, &v6));

    -[_UIDatePickerMode setNumberOfComponents:](self, "setNumberOfComponents:", v6);
    -[_UIDatePickerMode fixUpElementsForRTL](self, "fixUpElementsForRTL");
    return self->_elements;
  }
  return result;
}

- (void)fixUpElementsForRTL
{
  id WeakRetained;
  int v4;
  unint64_t v5;
  int v6;
  int v7;
  unint64_t v8;

  if (self->_elements)
  {
    if (!-[_UIDatePickerMode isTimeIntervalMode](self, "isTimeIntervalMode"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
      v4 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");

      if (v4)
      {
        if (-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"))
        {
          v5 = 0;
          v6 = -1;
          v7 = -1;
          do
          {
            v8 = self->_elements[v5];
            if (v8 == 32)
              v6 = v5;
            if (v8 == 64)
              v7 = v5;
            ++v5;
          }
          while (-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents") > v5);
          if ((v7 & 0x80000000) == 0 && (v6 & 0x80000000) == 0)
          {
            self->_elements[v6] = 64;
            self->_elements[v7] = 32;
          }
        }
      }
    }
  }
}

- (int64_t)displayedCalendarUnits
{
  unint64_t *v3;
  unint64_t v4;
  int64_t v5;

  v3 = -[_UIDatePickerMode elements](self, "elements");
  if (!-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"))
    return 0;
  v4 = 0;
  v5 = 0;
  do
    v5 |= v3[v4++];
  while (v4 < -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents"));
  return v5;
}

- (NSString)localizedFormatString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 589, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode localizedFormatString]");

  return 0;
}

- (unint64_t)calendarUnitForComponent:(int64_t)a3
{
  if (-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents") <= a3)
    return 0;
  else
    return -[_UIDatePickerMode elements](self, "elements")[8 * a3];
}

- (int64_t)componentForCalendarUnit:(unint64_t)a3
{
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  int64_t result;

  v5 = -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents");
  v6 = -[_UIDatePickerMode elements](self, "elements");
  if (v5 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6;
  result = 0;
  while (v7[result] != a3)
  {
    if (v5 == ++result)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)numberOfRowsInComponent:(int64_t)a3
{
  return -[_UIDatePickerMode numberOfRowsForCalendarUnit:](self, "numberOfRowsForCalendarUnit:", -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a3));
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 613, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode numberOfRowsForCalendarUnit:]");

  return 0;
}

- (void)noteCalendarChanged
{
  NSArray *dateFormatters;
  NSString *amString;
  NSString *pmString;
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  id v13;

  dateFormatters = self->_dateFormatters;
  self->_dateFormatters = 0;

  amString = self->_amString;
  self->_amString = 0;

  pmString = self->_pmString;
  self->_pmString = 0;

  -[_UIDatePickerMode resetComponentWidths](self, "resetComponentWidths");
  -[_UIDatePickerMode clearBaseDate](self, "clearBaseDate");
  -[_UIDatePickerMode setElements:](self, "setElements:", 0);
  -[_UIDatePickerMode setLocalizedFormatString:](self, "setLocalizedFormatString:", 0);
  -[_UIDatePickerMode setTodayDateComponents:](self, "setTodayDateComponents:", 0);
  -[_UIDatePickerMode calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  -[_UIDatePickerMode calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_maxDayRange.location = objc_msgSend(v8, "maximumRangeOfUnit:", 16);
  self->_maxDayRange.length = v9;

  -[_UIDatePickerMode calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_maxMonthRange.location = objc_msgSend(v10, "maximumRangeOfUnit:", 8);
  self->_maxMonthRange.length = v11;

  -[_UIDatePickerMode calendar](self, "calendar");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendarIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isUsingJapaneseCalendar = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C99708]);

}

- (void)resetComponentWidths
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 643, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode resetComponentWidths]");

}

- (double)totalComponentWidth
{
  void *v3;
  double v4;
  double v5;

  -[_UIDatePickerMode font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode totalComponentWidthWithFont:](self, "totalComponentWidthWithFont:", v3);
  v5 = v4;

  return v5;
}

- (double)totalComponentWidthWithFont:(id)a3
{
  id v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;

  v4 = a3;
  v5 = -[_UIDatePickerMode elements](self, "elements");
  v6 = -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents");
  if (v6)
  {
    v7 = v6;
    v8 = 0.0;
    do
    {
      v9 = *v5++;
      -[_UIDatePickerMode widthForCalendarUnit:font:maxWidth:](self, "widthForCalendarUnit:font:maxWidth:", v9, v4, 1.79769313e308);
      v8 = v8 + v10;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (int64_t)_incrementForStaggeredTimeIntervals
{
  void *v3;
  int v4;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "staggerTimeIntervals");

  if (v4)
    return -[_UIDatePickerMode minuteInterval](self, "minuteInterval");
  else
    return 1;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 668, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode nextUnitLargerThanUnit:]");

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 673, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode nextUnitSmallerThanUnit:]");

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_dateByEnsuringValue:(int64_t)a3 forCalendarUnit:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  if (a4 != 8)
    goto LABEL_3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setDay:", 1);
  objc_msgSend(v7, "setMonth:", a3);
  objc_msgSend(v7, "setYear:", -[_UIDatePickerMode _yearlessYearForMonth:](self, "_yearlessYearForMonth:", a3));
  -[_UIDatePickerMode calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    -[_UIDatePickerMode todayDateComponents](self, "todayDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = -[_UIDatePickerMode nextUnitSmallerThanUnit:](self, "nextUnitSmallerThanUnit:", a4);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v12;
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = -[_UIDatePickerMode nextUnitSmallerThanUnit:](self, "nextUnitSmallerThanUnit:", i))
      {
        -[_UIDatePickerMode calendar](self, "calendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "maximumRangeOfUnit:", i);

        _UIDateComponentsSetValue(v11, i, v15);
      }
    }
    v16 = -[_UIDatePickerMode nextUnitLargerThanUnit:](self, "nextUnitLargerThanUnit:", a4);
    -[_UIDatePickerMode calendar](self, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "maximumRangeOfUnit:", v16);
    v20 = v19;

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _UIDateComponentsSetValue(v11, a4, a3);
      -[_UIDatePickerMode calendar](self, "calendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dateFromComponents:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v16 == 4)
      {
        v18 = objc_msgSend(v11, "year");
        v20 = 30;
      }
      if (v18 >= v18 + v20)
      {
        v9 = 0;
      }
      else
      {
        v9 = 0;
        v21 = v20 - 1;
        do
        {
          v22 = v11;
          v23 = v9;
          v24 = v21;
          _UIDateComponentsSetValue(v11, a4, a3);
          _UIDateComponentsSetValue(v11, v16, v18);
          -[_UIDatePickerMode calendar](self, "calendar");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dateFromComponents:", v22);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UIDatePickerMode calendar](self, "calendar");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "components:fromDate:", a4, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (_UIDateComponentsGetValue(v11, a4) == a3)
            break;
          ++v18;
          v21 = v24 - 1;
        }
        while (v24);
      }
    }

  }
  return v9;
}

- (id)_dateForYearRow:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setYear:", a3);
  -[_UIDatePickerMode calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode baseDate](self, "baseDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)secondForRow:(int64_t)a3
{
  uint64_t v5;
  unint64_t v6;

  v5 = -[_UIDatePickerMode rangeForCalendarUnit:](self, "rangeForCalendarUnit:", 128);
  return -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals") * a3 % v6
       + v5;
}

- (int64_t)minuteForRow:(int64_t)a3
{
  uint64_t v5;
  unint64_t v6;

  v5 = -[_UIDatePickerMode rangeForCalendarUnit:](self, "rangeForCalendarUnit:", 64);
  return -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals") * a3 % v6
       + v5;
}

- (int64_t)hourForRow:(int64_t)a3
{
  uint64_t v4;
  unint64_t v5;

  v4 = -[_UIDatePickerMode rangeForCalendarUnit:](self, "rangeForCalendarUnit:", 32);
  if (a3 % v5 + v4 == 24)
    return 0;
  else
    return a3 % v5 + v4;
}

- (int64_t)dayForRow:(int64_t)a3
{
  return self->_maxDayRange.location + a3 % self->_maxDayRange.length;
}

- (int64_t)monthForRow:(int64_t)a3
{
  return self->_maxMonthRange.location + a3 % self->_maxMonthRange.length;
}

- (int64_t)yearForRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[_UIDatePickerMode _dateForYearRow:](self, "_dateForYearRow:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "year");
  return v7;
}

- (int64_t)eraForYearRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[_UIDatePickerMode _dateForYearRow:](self, "_dateForYearRow:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "era");
  return v7;
}

- (int64_t)valueForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  void *v9;

  if ((uint64_t)a4 <= 31)
  {
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
        return -[_UIDatePickerMode monthForRow:](self, "monthForRow:", a3);
      if (a4 == 16)
        return -[_UIDatePickerMode dayForRow:](self, "dayForRow:", a3);
    }
    else
    {
      if (a4 == 2)
        return -[_UIDatePickerMode eraForYearRow:](self, "eraForYearRow:", a3);
      if (a4 == 4)
        return -[_UIDatePickerMode yearForRow:](self, "yearForRow:", a3);
    }
    goto LABEL_19;
  }
  if ((uint64_t)a4 <= 127)
  {
    if (a4 == 32)
      return -[_UIDatePickerMode hourForRow:](self, "hourForRow:", a3);
    if (a4 == 64)
      return -[_UIDatePickerMode minuteForRow:](self, "minuteForRow:", a3);
    goto LABEL_19;
  }
  if (a4 != 0x10000)
  {
    if (a4 == 128)
      return -[_UIDatePickerMode secondForRow:](self, "secondForRow:", a3);
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 813, CFSTR("attempt to get value for row (%ld) of invalid calendar unit (%lu)"), a3, a4);

  }
  return a3;
}

- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  void *v4;

  if (a4 == 4 || a4 == 2)
  {
    -[_UIDatePickerMode _dateForYearRow:](self, "_dateForYearRow:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIDatePickerMode _dateByEnsuringValue:forCalendarUnit:](self, "_dateByEnsuringValue:forCalendarUnit:", -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", a3, a4), a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 831, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode dateFormatForCalendarUnit:]");

  return 0;
}

- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  if (a3 < 0 || -[_UIDatePickerMode numberOfRowsInComponent:](self, "numberOfRowsInComponent:", a4) < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 836, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row >= 0 && row <= [self numberOfRowsInComponent:component]"));

  }
  v8 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4);
  if (v8 == 0x10000)
  {
    if (a3)
      -[_UIDatePickerMode pmString](self, "pmString");
    else
      -[_UIDatePickerMode amString](self, "amString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
    -[_UIDatePickerMode dateForRow:inCalendarUnit:](self, "dateForRow:inCalendarUnit:", a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3
{
  int64_t v5;
  _BOOL8 v6;
  void *v7;
  int64_t v8;

  v5 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 16);
  v6 = v5 < -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 8);
  -[_UIDatePickerMode _style](self, "_style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "titleAlignmentForCalendarUnit:datePickerMode:dayIsBeforeMonth:", a3, -[_UIDatePickerMode datePickerMode](self, "datePickerMode"), v6);

  return v8;
}

- (_NSRange)rangeForCalendarUnit:(unint64_t)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64 || a3 == 128)
    {
      location = 0;
      length = 60;
      goto LABEL_17;
    }
    if (a3 == 0x10000)
    {
      location = 0;
      length = 2;
      goto LABEL_17;
    }
LABEL_16:
    location = 0;
    length = 10000;
    goto LABEL_17;
  }
  if (a3 == 8)
  {
    location = self->_maxMonthRange.location;
    length = self->_maxMonthRange.length;
    goto LABEL_17;
  }
  if (a3 == 16)
  {
    location = self->_maxDayRange.location;
    length = self->_maxDayRange.length;
    goto LABEL_17;
  }
  if (a3 != 32)
    goto LABEL_16;
  if (-[_UIDatePickerMode is24Hour](self, "is24Hour"))
    length = 24;
  else
    length = 12;
  location = 1;
LABEL_17:
  result.length = length;
  result.location = location;
  return result;
}

- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  int64_t v13;

  v10 = a4;
  v11 = a3;
  v12 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a5);
  v13 = -[_UIDatePickerMode valueForDate:dateComponents:calendarUnit:](self, "valueForDate:dateComponents:calendarUnit:", v11, v10, v12);

  return -[_UIDatePickerMode rowForValue:forCalendarUnit:currentRow:](self, "rowForValue:forCalendarUnit:currentRow:", v13, v12, a6);
}

- (int64_t)valueForDate:(id)a3 dateComponents:(id)a4 calendarUnit:(unint64_t)a5
{
  int64_t Value;
  uint64_t v8;

  Value = _UIDateComponentsGetValue(a4, a5);
  if (a5 == 128 || a5 == 64)
  {
    v8 = -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals");
    if (v8 >= 2)
      return Value / v8 * v8;
  }
  return Value;
}

- (int64_t)rowForValue:(int64_t)a3 forCalendarUnit:(unint64_t)a4 currentRow:(int64_t)a5
{
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t result;

  v9 = -[_UIDatePickerMode numberOfRowsForCalendarUnit:](self, "numberOfRowsForCalendarUnit:", a4);
  v10 = -[_UIDatePickerMode rangeForCalendarUnit:](self, "rangeForCalendarUnit:", a4);
  v12 = v11;
  v13 = a3 - v10;
  if (a4 == 128 || a4 == 64)
  {
    v12 = v11 / -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals");
    v13 /= -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals");
  }
  if (v9 != 10000)
    return v13;
  if (v12 <= 1)
    v14 = 1;
  else
    v14 = v12;
  v15 = a5 / v14 * v14;
  v16 = v15 + v13;
  v17 = v15 - v14 + v13;
  v18 = v13 + v14 + v15;
  v19 = a5 - v16;
  if (a5 - v16 < 0)
    v19 = v16 - a5;
  v20 = a5 - v17;
  if (a5 - v17 < 0)
    v20 = v17 - a5;
  v21 = a5 - v18;
  if (a5 - v18 < 0)
    v21 = v18 - a5;
  if (v20 <= v21 && v20 <= v19)
    v18 = v17;
  if (v19 > v20 || v19 > v21)
    result = v18;
  else
    result = v16;
  if (result < 10 * v14 || result >= (unint64_t)(10000 - 10 * v14))
    return v13 + 5000 / v14 * v14;
  return result;
}

- (int64_t)validateValue:(int64_t)a3 forCalendarUnit:(unint64_t)a4
{
  return a3;
}

- (void)loadDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSDate *v6;
  NSDate *minimumDate;
  NSDate *v8;
  NSDate *v9;
  NSDate *maximumDate;
  NSDate *v11;
  NSDate *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSDate *v28;
  NSDate *v29;

  v4 = a4;
  v6 = (NSDate *)a3;
  minimumDate = self->_minimumDate;
  if (minimumDate)
  {
    v28 = v6;
    -[NSDate earlierDate:](minimumDate, "earlierDate:", v6);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();

    v6 = v28;
    if (v8 == v28)
    {
      v9 = self->_minimumDate;

      v6 = v9;
    }
  }
  maximumDate = self->_maximumDate;
  v29 = v6;
  if (maximumDate)
  {
    -[NSDate laterDate:](maximumDate, "laterDate:", v6);
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

    if (v11 == v29)
    {
      v12 = self->_maximumDate;

      v29 = v12;
    }
  }
  -[_UIDatePickerMode calendar](self, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "components:fromDate:", -[_UIDatePickerMode displayedCalendarUnits](self, "displayedCalendarUnits"), v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerMode setOriginatingDate:](self, "setOriginatingDate:", v29);
  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_soundsEnabled");

  if (!v4)
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSoundsEnabled:", 0);

  }
  v18 = -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents");
  if (v18 >= 1)
  {
    v19 = v18;
    for (i = 0; i != v19; ++i)
    {
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "selectedRowInComponent:", i);

      v23 = -[_UIDatePickerMode rowForDate:dateComponents:component:currentRow:](self, "rowForDate:dateComponents:component:currentRow:", v29, v14, i, v22);
      v24 = v23 & ~(v23 >> 63);
      -[_UIDatePickerMode datePickerView](self, "datePickerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "selectRow:inComponent:animated:", v24, i, v4);

    }
  }
  -[_UIDatePickerMode setSelectedDateComponents:](self, "setSelectedDateComponents:", 0);
  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSoundsEnabled:", v16);

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_updateLabels:", v4);

}

- (void)updateSelectedDateComponentsWithNewValueInComponent:(int64_t)a3
{
  -[_UIDatePickerMode _updateSelectedDateComponentsWithNewValueInComponent:usingSelectionBarValue:](self, "_updateSelectedDateComponentsWithNewValueInComponent:usingSelectionBarValue:", a3, 0);
}

- (void)resetSelectedDateComponentsWithValuesUnderSelectionBars
{
  -[_UIDatePickerMode _updateSelectedDateComponentsWithNewValueInComponent:usingSelectionBarValue:](self, "_updateSelectedDateComponentsWithNewValueInComponent:usingSelectionBarValue:", 0x7FFFFFFFFFFFFFFFLL, 1);
}

- (void)_updateSelectedDateComponentsWithNewValueInComponent:(int64_t)a3 usingSelectionBarValue:(BOOL)a4
{
  NSDateComponents **p_selectedDateComponents;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  NSDateComponents *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t Value;
  NSDateComponents *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  NSDateComponents *obj;

  v34 = a4;
  p_selectedDateComponents = &self->_selectedDateComponents;
  obj = self->_selectedDateComponents;
  if (!obj)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode originatingDate](self, "originatingDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 254, v8);
    obj = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v13 = v12;
      if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 != v11)
        goto LABEL_24;
      v15 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", v11);
      v12 = v11;
      if (v15 != 0x10000)
        break;
LABEL_25:
      if (v10 == ++v11)
      {
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[_UIDatePickerMode datePickerView](self, "datePickerView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "selectedRowInComponent:", v12);

          _UIDateComponentsSetValue(obj, 0x10000, v32);
        }
        goto LABEL_31;
      }
    }
    v16 = v15;
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v34)
      v19 = objc_msgSend(v17, "_selectionBarRowInComponent:", v11);
    else
      v19 = objc_msgSend(v17, "selectedRowInComponent:", v11);
    v20 = v19;

    -[_UIDatePickerMode dateForRow:inCalendarUnit:](self, "dateForRow:inCalendarUnit:", v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == 536)
    {
      -[_UIDatePickerMode calendar](self, "calendar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "components:fromDate:", 30, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDateComponents setEra:](obj, "setEra:", objc_msgSend(v23, "era"));
      -[NSDateComponents setYear:](obj, "setYear:", objc_msgSend(v23, "year"));
      -[NSDateComponents setMonth:](obj, "setMonth:", objc_msgSend(v23, "month"));
      -[NSDateComponents setDay:](obj, "setDay:", objc_msgSend(v23, "day"));
    }
    else
    {
      if (v16 != 4)
      {
        v25 = -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", v20, v16);
        if (v16 == 32 && !-[_UIDatePickerMode is24Hour](self, "is24Hour"))
        {
          Value = _UIDateComponentsGetValue(obj, 0x10000);
          v30 = obj;
          -[NSDateComponents setHour:](v30, "setHour:", v25);

          if (Value == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_23;
          v26 = v30;
          v27 = 0x10000;
          v28 = Value;
        }
        else
        {
          v26 = obj;
          v27 = v16;
          v28 = v25;
        }
        _UIDateComponentsSetValue(v26, v27, v28);
LABEL_23:

LABEL_24:
        v12 = v13;
        goto LABEL_25;
      }
      -[_UIDatePickerMode calendar](self, "calendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "components:fromDate:", 6, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDateComponents setYear:](obj, "setYear:", objc_msgSend(v23, "year"));
      -[NSDateComponents setEra:](obj, "setEra:", objc_msgSend(v23, "era"));
    }

    goto LABEL_23;
  }
LABEL_31:
  -[_UIDatePickerMode timeZone](self, "timeZone");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents setTimeZone:](obj, "setTimeZone:", v33);

  if (!self->_selectedDateComponents)
    objc_storeStrong((id *)p_selectedDateComponents, obj);

}

- (NSDateComponents)selectedDateComponents
{
  NSDateComponents *selectedDateComponents;

  selectedDateComponents = self->_selectedDateComponents;
  if (!selectedDateComponents)
  {
    -[_UIDatePickerMode updateSelectedDateComponentsWithNewValueInComponent:](self, "updateSelectedDateComponentsWithNewValueInComponent:", 0x7FFFFFFFFFFFFFFFLL);
    selectedDateComponents = self->_selectedDateComponents;
  }
  return (NSDateComponents *)(id)-[NSDateComponents copy](selectedDateComponents, "copy");
}

- (BOOL)hasSelectedDateComponents
{
  return self->_selectedDateComponents != 0;
}

- (int64_t)_numberOfDaysInDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "setDay:", 1);
  -[_UIDatePickerMode calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 16, 8, v6);
  v8 = v7;
  if (v7 == 1)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v9, "setMonth:", 1);
    objc_msgSend(v9, "setDay:", -1);
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v9, v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 16, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "day");

  }
  return v8;
}

- (BOOL)_monthExists:(int64_t)a3 inYear:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setMonth:", a3);
  objc_msgSend(v7, "setYear:", a4);
  objc_msgSend(v7, "setDay:", 1);
  -[_UIDatePickerMode calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerMode calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v11, "month") == a3;
  return a3;
}

- (id)dateComponentsByRestrictingSelectedComponents:(id)a3 withLastManipulatedColumn:(int64_t)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDateComponents *v14;
  NSDateComponents *minimumDateComponents;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    v8 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4);
  -[_UIDatePickerMode calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_minimumDate)
  {
    objc_msgSend(v10, "earlierDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v10)
    {
      minimumDateComponents = self->_minimumDateComponents;
LABEL_13:
      v14 = minimumDateComponents;

      goto LABEL_14;
    }
  }
  if (self->_maximumDate)
  {
    objc_msgSend(v10, "laterDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v10)
    {
      minimumDateComponents = self->_maximumDateComponents;
      goto LABEL_13;
    }
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || self->_isUsingJapaneseCalendar)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components:fromDate:", -[_UIDatePickerMode displayedCalendarUnits](self, "displayedCalendarUnits"), v10);
    v14 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    goto LABEL_14;
  }
  if (v8 == 8 || v8 == 4)
  {
    if (-[_UIDatePickerMode _monthExists:inYear:](self, "_monthExists:inYear:", objc_msgSend(v7, "month"), objc_msgSend(v7, "year")))
    {
      v8 = 16;
    }
    else
    {
      v8 = 8;
    }
  }
  if ((-[_UIDatePickerMode displayedCalendarUnits](self, "displayedCalendarUnits") & v8) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 1160, CFSTR("attempting to manipulate unknown unit: %lu in mode: %@"), v8, self);

  }
  if (v8 == 8)
  {
    v20 = objc_msgSend(v7, "month");
    v14 = (NSDateComponents *)objc_msgSend(v7, "copy");

    -[NSDateComponents setMonth:](v14, "setMonth:", v20 - 1);
    goto LABEL_14;
  }
  if (v8 != 16)
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastSelectedDateComponents");
    v14 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v17 = objc_msgSend(v7, "day");
  v18 = -[_UIDatePickerMode _numberOfDaysInDateComponents:](self, "_numberOfDaysInDateComponents:", v7);
  v14 = (NSDateComponents *)objc_msgSend(v7, "copy");

  if (v17 <= v18)
  {
    v19 = v17 - 1;
    if (v17 < 1)
      v19 = v17;
  }
  else
  {
    v19 = v18;
  }
  -[NSDateComponents setDay:](v14, "setDay:", v19);
LABEL_14:

  return v14;
}

- (void)updateDateForNewDateRange
{
  _UIDatePickerView **p_datePickerView;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSDateComponents *minimumDateComponents;
  NSDate *minimumDate;
  NSDateComponents *maximumDateComponents;
  NSDate *maximumDate;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *v20;
  void *v21;
  NSDate *v22;
  NSDate *v23;
  id v24;

  p_datePickerView = &self->_datePickerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
  objc_msgSend(WeakRetained, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumDate");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_datePickerView);
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maximumDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  minimumDateComponents = self->_minimumDateComponents;
  self->_minimumDateComponents = 0;

  minimumDate = self->_minimumDate;
  self->_minimumDate = 0;

  maximumDateComponents = self->_maximumDateComponents;
  self->_maximumDateComponents = 0;

  maximumDate = self->_maximumDate;
  self->_maximumDate = 0;

  v13 = -[_UIDatePickerMode displayedCalendarUnits](self, "displayedCalendarUnits");
  if (v24)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "components:fromDate:", v13, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_3:
      -[_UIDatePickerMode calendar](self, "calendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "components:fromDate:", v13, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && v17 && (unint64_t)(_UIDatePickerCompareDateComponents(v15, v17, v13) + 1) > 1)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if (v8)
      goto LABEL_3;
  }
  v17 = 0;
LABEL_9:
  objc_storeStrong((id *)&self->_minimumDateComponents, v15);
  objc_storeStrong((id *)&self->_maximumDateComponents, v17);
  if (self->_minimumDateComponents)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateFromComponents:", self->_minimumDateComponents);
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v20 = self->_minimumDate;
    self->_minimumDate = v19;

  }
  if (self->_maximumDateComponents)
  {
    -[_UIDatePickerMode calendar](self, "calendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFromComponents:", self->_maximumDateComponents);
    v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v23 = self->_maximumDate;
    self->_maximumDate = v22;

  }
LABEL_13:

}

- (id)viewForRow:(int64_t)a3 inComponent:(int64_t)a4 reusingView:(id)a5
{
  id v8;
  UIDatePickerContentView *v9;
  UIDatePickerContentView *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int64_t v25;
  void *v26;
  uint64_t Value;
  int64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;

  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (UIDatePickerContentView *)v8;
  else
    v9 = -[UIDatePickerContentView initWithMode:]([UIDatePickerContentView alloc], "initWithMode:", self);
  v10 = v9;
  v11 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4);
  -[UIDatePickerContentView setUseDigitFont:](v10, "setUseDigitFont:", (v11 & 0xE0) != 0);
  -[UIDatePickerContentView titleLabel](v10, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode fontForCalendarUnit:](self, "fontForCalendarUnit:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  -[UIDatePickerContentView setTitleAlignment:](v10, "setTitleAlignment:", -[_UIDatePickerMode titleAlignmentForCalendarUnit:](self, "titleAlignmentForCalendarUnit:", v11));
  -[UIDatePickerContentView titleLabel](v10, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode titleForRow:inComponent:](self, "titleForRow:inComponent:", a3, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

  -[UIDatePickerContentView titleLabel](v10, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePickerView);
  objc_msgSend(WeakRetained, "_textColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v18);

  -[UIDatePickerContentView titleLabel](v10, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained((id *)&self->_datePickerView);
  objc_msgSend(v20, "_textShadowColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShadowColor:", v21);

  if (v11 != 32)
  {
    if (v11 == 0x10000)
      -[UIDatePickerContentView setIsAmPm:](v10, "setIsAmPm:", 1);
    goto LABEL_8;
  }
  if (!-[_UIDatePickerMode isTimeIntervalMode](self, "isTimeIntervalMode"))
  {
LABEL_8:
    -[UIDatePickerContentView titleLabel](v10, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEnabled:", -[_UIDatePickerMode _shouldEnableValueForRow:column:](self, "_shouldEnableValueForRow:column:", a3, a4));

  }
  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "highlightsToday");

  if (v24 && v11 <= 0x10 && ((1 << v11) & 0x10110) != 0)
  {
    v25 = -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", a3, v11);
    -[_UIDatePickerMode todayDateComponents](self, "todayDateComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    Value = _UIDateComponentsGetValue(v26, v11);

    if (v11 == 4)
    {
      v28 = -[_UIDatePickerMode eraForYearRow:](self, "eraForYearRow:", a3);
      -[_UIDatePickerMode todayDateComponents](self, "todayDateComponents");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "era");

      if (v25 != Value || v28 != v30)
        goto LABEL_18;
    }
    else if (v25 != Value)
    {
      goto LABEL_18;
    }
    -[UIDatePickerContentView titleLabel](v10, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode todayTextColor](self, "todayTextColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextColor:", v32);

  }
LABEL_18:

  return v10;
}

- (BOOL)areValidDateComponents:(id)a3 comparingUnits:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSDateComponents *minimumDateComponents;
  NSDateComponents *maximumDateComponents;

  v6 = a3;
  -[_UIDatePickerMode calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 & 0x10000) != 0)
    v9 = a4 & 0xFFFFFFFFFFFEFFDFLL | 0x20;
  else
    v9 = a4;
  -[_UIDatePickerMode calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = _UIDatePickerCompareDateComponents(v6, v11, a4);
  v13 = v12 == 0;
  minimumDateComponents = self->_minimumDateComponents;
  if (minimumDateComponents && !v12)
    v13 = (unint64_t)(_UIDatePickerCompareDateComponents(minimumDateComponents, v6, a4) + 1) < 2;
  maximumDateComponents = self->_maximumDateComponents;
  if (maximumDateComponents && v13)
    LOBYTE(v13) = (unint64_t)_UIDatePickerCompareDateComponents(maximumDateComponents, v6, a4) < 2;

  return v13;
}

- (BOOL)_isComponentScrolling:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableViewForColumn:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isDragging") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isDecelerating");

  return v6;
}

- (BOOL)_scrollingAnyColumnExcept:(int)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = -[_UIDatePickerMode numberOfComponents](self, "numberOfComponents");
  if (v5)
  {
    v6 = 0;
    while (a3 == v6 || !-[_UIDatePickerMode _isComponentScrolling:](self, "_isComponentScrolling:", v6))
    {
      if (-[_UIDatePickerMode numberOfComponents](self, "numberOfComponents") <= ++v6)
      {
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 column:(int64_t)a4
{
  unint64_t v7;
  char v8;
  __int128 v9;
  BOOL v10;
  int64_t v12;

  v7 = -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4);
  v8 = -[_UIDatePickerMode _shouldEnableValueForRow:inComponent:calendarUnit:](self, "_shouldEnableValueForRow:inComponent:calendarUnit:", a3, a4, v7);
  *((_QWORD *)&v9 + 1) = v7;
  *(_QWORD *)&v9 = v7 - 8;
  switch((unint64_t)(v9 >> 3))
  {
    case 0uLL:
      v12 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 4);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = -[_UIDatePickerMode _isComponentScrolling:](self, "_isComponentScrolling:", v12);
        goto LABEL_3;
      }
      break;
    case 1uLL:
    case 3uLL:
    case 7uLL:
      goto LABEL_2;
    default:
      if (v7 == 0x10000)
      {
LABEL_2:
        v10 = -[_UIDatePickerMode _scrollingAnyColumnExcept:](self, "_scrollingAnyColumnExcept:", a4);
LABEL_3:
        v8 |= v10;
      }
      break;
  }
  return v8;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 1347, CFSTR("%s must be overridden by subclasses"), "-[_UIDatePickerMode _shouldEnableValueForRow:inComponent:calendarUnit:]");

  return 0;
}

- (void)updateEnabledStateOfViewForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForRow:forComponent:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEnabled:", -[_UIDatePickerMode _shouldEnableValueForRow:column:](self, "_shouldEnableValueForRow:column:", a3, a4));

    }
  }

}

- (void)setNumberOfComponents:(unint64_t)a3
{
  self->_numberOfComponents = a3;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (void)setMinuteInterval:(int64_t)a3
{
  self->_minuteInterval = a3;
}

- (void)setTodaySinceReferenceDate:(double)a3
{
  self->_todaySinceReferenceDate = a3;
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (NSDateComponents)minimumDateComponents
{
  return self->_minimumDateComponents;
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (NSDateComponents)maximumDateComponents
{
  return self->_maximumDateComponents;
}

- (void)setSelectedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDateComponents, a3);
}

- (_UIDatePickerView)datePickerView
{
  return (_UIDatePickerView *)objc_loadWeakRetained((id *)&self->_datePickerView);
}

- (void)setDatePickerView:(id)a3
{
  objc_storeWeak((id *)&self->_datePickerView, a3);
}

- (void)setLocalizedFormatString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFormatString, a3);
}

- (void)setBaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_baseDate, a3);
}

- (void)setYearsSinceBaseDate:(int64_t)a3
{
  self->_yearsSinceBaseDate = a3;
}

- (void)setOriginatingDate:(id)a3
{
  objc_storeStrong((id *)&self->_originatingDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDate, 0);
  objc_storeStrong((id *)&self->_baseDate, 0);
  objc_storeStrong((id *)&self->_maximumDateComponents, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDateComponents, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_destroyWeak((id *)&self->_datePickerView);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_todayDateComponents, 0);
  objc_storeStrong((id *)&self->_pmString, 0);
  objc_storeStrong((id *)&self->_amString, 0);
  objc_storeStrong((id *)&self->_defaultTimeFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_amPmFont, 0);
  objc_storeStrong((id *)&self->_todayTextColor, 0);
  objc_storeStrong((id *)&self->_dateFormatters, 0);
  objc_storeStrong((id *)&self->_localizedFormatString, 0);
  objc_storeStrong((id *)&self->_baseDateComponents, 0);
  objc_storeStrong((id *)&self->_selectedDateComponents, 0);
}

@end
