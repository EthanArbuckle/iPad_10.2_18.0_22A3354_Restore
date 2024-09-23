@implementation _UIDatePickerComponent

+ (id)componentsFromDateFormatString:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5
{
  return (id)objc_msgSend(a1, "componentsFromDateFormatString:locale:followsSystemHourCycle:desiredUnits:", a3, a4, a5, 0x7FFFFFFFFFFFFFFFLL);
}

+ (id)componentsFromDateFormatString:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 desiredUnits:(int64_t)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unsigned __int16 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unsigned __int16 v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  uint64_t *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t *);
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  int64_t v41;
  SEL v42;
  id v43;
  BOOL v44;
  _QWORD v45[4];
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v11 = a3;
  v12 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __100___UIDatePickerComponent_componentsFromDateFormatString_locale_followsSystemHourCycle_desiredUnits___block_invoke;
  v36 = &unk_1E16DB638;
  v40 = v45;
  v41 = a6;
  v37 = v11;
  v32 = v12;
  v38 = v32;
  v44 = a5;
  v31 = v13;
  v39 = v31;
  v42 = a2;
  v43 = a1;
  v14 = v37;
  v15 = &v33;
  v16 = objc_msgSend(v14, "length");
  if (!v16)
    goto LABEL_21;
  v30 = v15;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v23 = objc_msgSend(v14, "characterAtIndex:", v17, v30, v31, v32, v33, v34);
    v24 = v23;
    if (v23 == 39)
    {
      v18 ^= 1u;
      goto LABEL_18;
    }
    if ((v18 & 1) != 0)
    {
      v18 = 1;
      goto LABEL_18;
    }
    if (v23 == 46)
    {
      if (v22 <= 0x10 && ((1 << v22) & 0x10110) != 0 || v22 == 0x4000)
      {
LABEL_11:
        v18 = 0;
        ++v21;
        goto LABEL_18;
      }
    }
    else if ((v23 & 0xFFFE) == 0x28)
    {
      goto LABEL_11;
    }
    v25 = _UICalendarUnitForFormatCharacter(v23);
    if (v25 == v22)
    {
      v18 = 0;
      ++v21;
      v19 = v24;
    }
    else
    {
      v26 = v25;
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v46 = v22;
        v47 = v19;
        v48 = v20;
        v49 = v21;
        v35((uint64_t)v30, (uint64_t *)&v46);
      }
      v18 = 0;
      v21 = 1;
      v20 = v17;
      v19 = v24;
      v22 = v26;
    }
LABEL_18:
    ++v17;
  }
  while (v16 != v17);
  v15 = v30;
  if (v22 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = v22;
    v47 = v19;
    v48 = v20;
    v49 = v21;
    v35((uint64_t)v30, (uint64_t *)&v46);
  }
LABEL_21:

  v27 = v39;
  v28 = v31;

  _Block_object_dispose(v45, 8);
  return v28;
}

- (id)_initWithFormatString:(id)a3 calendarUnit:(unint64_t)a4
{
  id v7;
  _UIDatePickerComponent *v8;
  _UIDatePickerComponent *v9;
  _UIDatePickerComponent *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDatePickerComponent;
  v8 = -[_UIDatePickerComponent init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_formatString, a3);
    v9->_calendarUnit = a4;
    v9->_equivalentUnit = _UIDateComponentsEquivalentUnit(a4);
    v9->_width = 0.0;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t calendarUnit;
  NSString *formatString;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerComponent;
  -[_UIDatePickerComponent description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  formatString = self->_formatString;
  calendarUnit = self->_calendarUnit;
  if (calendarUnit <= 511)
  {
    if (calendarUnit <= 15)
    {
      switch(calendarUnit)
      {
        case 2:
          v7 = CFSTR("Era");
          goto LABEL_40;
        case 4:
          v7 = CFSTR("Year");
          goto LABEL_40;
        case 8:
          v7 = CFSTR("Month");
          goto LABEL_40;
      }
    }
    else if (calendarUnit > 63)
    {
      if (calendarUnit == 64)
      {
        v7 = CFSTR("Minute");
        goto LABEL_40;
      }
      if (calendarUnit == 128)
      {
        v7 = CFSTR("Second");
        goto LABEL_40;
      }
    }
    else
    {
      if (calendarUnit == 16)
      {
        v7 = CFSTR("Day");
        goto LABEL_40;
      }
      if (calendarUnit == 32)
      {
        v7 = CFSTR("Hour");
        goto LABEL_40;
      }
    }
  }
  else if (calendarUnit >= 0x2000)
  {
    if (calendarUnit >= 0x100000)
    {
      if (calendarUnit == 0x100000)
      {
        v7 = CFSTR("Calendar");
        goto LABEL_40;
      }
      if (calendarUnit == 0x200000)
      {
        v7 = CFSTR("TimeZone");
        goto LABEL_40;
      }
    }
    else
    {
      if (calendarUnit == 0x2000)
      {
        v7 = CFSTR("Week of Year");
        goto LABEL_40;
      }
      if (calendarUnit == 0x4000)
      {
        v7 = CFSTR("Year for Week of Year");
        goto LABEL_40;
      }
    }
  }
  else if (calendarUnit > 2047)
  {
    if (calendarUnit == 2048)
    {
      v7 = CFSTR("Quarter");
      goto LABEL_40;
    }
    if (calendarUnit == 4096)
    {
      v7 = CFSTR("Week of Month");
      goto LABEL_40;
    }
  }
  else
  {
    if (calendarUnit == 512)
    {
      v7 = CFSTR("Weekday");
      goto LABEL_40;
    }
    if (calendarUnit == 1024)
    {
      v7 = CFSTR("Weekday°");
      goto LABEL_40;
    }
  }
  if (calendarUnit == 0x10000)
    v7 = CFSTR("AM/PM");
  else
    v7 = &stru_1E16EDF20;
LABEL_40:
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@ => %@)"), v4, formatString, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)equivalentUnit
{
  return self->_equivalentUnit;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (unint64_t)calendarUnit
{
  return self->_calendarUnit;
}

- (_NSRange)unitRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_unitRange.length;
  location = self->_unitRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setUnitRange:(_NSRange)a3
{
  self->_unitRange = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end
