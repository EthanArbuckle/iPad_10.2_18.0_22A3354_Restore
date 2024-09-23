@implementation _UIDatePickerMode_Date

+ (int64_t)datePickerMode
{
  return 1;
}

+ (unint64_t)extractableCalendarUnits
{
  return 28;
}

- (int64_t)displayedCalendarUnits
{
  return 30;
}

- (void)_shouldReset:(id)a3
{
  NSString *yearFormat;
  NSString *monthFormat;
  NSString *dayFormat;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerMode_Date;
  -[_UIDatePickerMode _shouldReset:](&v7, sel__shouldReset_, a3);
  yearFormat = self->_yearFormat;
  self->_yearFormat = 0;

  monthFormat = self->_monthFormat;
  self->_monthFormat = 0;

  dayFormat = self->_dayFormat;
  self->_dayFormat = 0;

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
    _UIDatePickerDateFormatFromTemplate(CFSTR("dMMMMy"), v4, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode setLocalizedFormatString:](self, "setLocalizedFormatString:", v5);
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  NSString **p_yearFormat;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  NSString *v20;
  int *v21;
  NSString **v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_yearFormat = &self->_yearFormat;
  if (!self->_yearFormat)
  {
    v23 = &self->_yearFormat;
    v24 = a3;
    -[_UIDatePickerMode_Date localizedFormatString](self, "localizedFormatString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDatePickerComponent componentsFromDateFormatString:locale:followsSystemHourCycle:](_UIDatePickerComponent, "componentsFromDateFormatString:locale:followsSystemHourCycle:", v5, v6, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (!v9)
    {
      v11 = 0;
      goto LABEL_22;
    }
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v14, "calendarUnit") == 4 || objc_msgSend(v14, "calendarUnit") == 2)
        {
          objc_msgSend(v14, "formatString");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (!v11)
          {
            v11 = (void *)v15;
            continue;
          }
          objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" %@"), v15);
          v17 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v17;
        }
        else
        {
          if (objc_msgSend(v14, "calendarUnit") == 8)
          {
            objc_msgSend(v14, "formatString");
            v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v19 = 272;
          }
          else
          {
            if (objc_msgSend(v14, "calendarUnit") != 16)
              continue;
            objc_msgSend(v14, "formatString");
            v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v19 = 280;
          }
          v16 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v10)
      {
LABEL_22:

        p_yearFormat = v23;
        v20 = *v23;
        *v23 = (NSString *)v11;

        a3 = v24;
        break;
      }
    }
  }
  switch(a3)
  {
    case 4uLL:
      return *p_yearFormat;
    case 8uLL:
      v21 = &OBJC_IVAR____UIDatePickerMode_Date__monthFormat;
      goto LABEL_28;
    case 0x10uLL:
      v21 = &OBJC_IVAR____UIDatePickerMode_Date__dayFormat;
LABEL_28:
      p_yearFormat = (NSString **)((char *)self + *v21);
      return *p_yearFormat;
  }
  return 0;
}

- (void)resetComponentWidths
{
  self->_dateYearWidth = 0.0;
  self->_dateMonthWidth = 0.0;
  self->_dateDayWidth = 0.0;
}

- (void)noteCalendarChanged
{
  NSString *yearFormat;
  NSString *monthFormat;
  NSString *dayFormat;
  objc_super v6;

  yearFormat = self->_yearFormat;
  self->_yearFormat = 0;

  monthFormat = self->_monthFormat;
  self->_monthFormat = 0;

  dayFormat = self->_dayFormat;
  self->_dayFormat = 0;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerMode_Date;
  -[_UIDatePickerMode noteCalendarChanged](&v6, sel_noteCalendarChanged);
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  return 10000;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  id v8;
  double *p_dateYearWidth;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double dateDayWidth;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double dateMonthWidth;
  double v48;
  double v49;
  double v50;
  int *v51;
  void *v53;
  double *v54;
  unint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  p_dateYearWidth = &self->_dateYearWidth;
  if (self->_dateYearWidth <= 0.0)
  {
    v55 = a3;
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend((id)objc_opt_class(), "newDateFromGregorianYear:month:day:timeZone:", 2007, 1, 28, 0);
    objc_msgSend(v10, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)off_1E1678D90;
    v60 = *(_QWORD *)off_1E1678D90;
    v61[0] = v8;
    v14 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v12;
    objc_msgSend(v12, "sizeWithAttributes:", v15);
    v17 = ceil(v16);
    -[_UIDatePickerMode _style](self, "_style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "horizontalDatePadding");
    v54 = &self->_dateYearWidth;
    *p_dateYearWidth = v17 + v19 + v19;

    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode calendar](self, "calendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "maximumRangeOfUnit:", 16);
    v24 = v23;

    if (v22 < v22 + v24)
    {
      do
      {
        -[_UIDatePickerMode _dateByEnsuringValue:forCalendarUnit:](self, "_dateByEnsuringValue:forCalendarUnit:", v22, 16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringFromDate:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v13;
        v59 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sizeWithAttributes:", v27);
        v29 = v28;
        -[_UIDatePickerMode _style](self, "_style");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "horizontalDatePadding");
        v32 = ceil(v29 + v31 + v31);

        v14 = 0x1E0C99000uLL;
        dateDayWidth = self->_dateDayWidth;
        if (dateDayWidth < v32)
          dateDayWidth = v32;
        self->_dateDayWidth = dateDayWidth;

        ++v22;
        --v24;
      }
      while (v24);
    }
    -[_UIDatePickerMode dateFormatterForCalendarUnit:](self, "dateFormatterForCalendarUnit:", 8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode calendar](self, "calendar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "maximumRangeOfUnit:", 8);
    v38 = v37;

    if (v36 < v36 + v38)
    {
      do
      {
        -[_UIDatePickerMode _dateByEnsuringValue:forCalendarUnit:](self, "_dateByEnsuringValue:forCalendarUnit:", v36, 8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringFromDate:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v13;
        v57 = v8;
        objc_msgSend(*(id *)(v14 + 3456), "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sizeWithAttributes:", v41);
        v43 = v42;
        -[_UIDatePickerMode _style](self, "_style");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "horizontalDatePadding");
        v46 = ceil(v43 + v45 + v45);

        v14 = 0x1E0C99000;
        dateMonthWidth = self->_dateMonthWidth;
        if (dateMonthWidth < v46)
          dateMonthWidth = v46;
        self->_dateMonthWidth = dateMonthWidth;

        ++v36;
        --v38;
      }
      while (v38);
    }
    p_dateYearWidth = &self->_dateYearWidth;
    a3 = v55;
    v48 = *v54 + self->_dateMonthWidth + self->_dateDayWidth;
    if (v48 > a5)
    {
      v49 = round((v48 - a5) * 0.5);
      *v54 = *v54 - v49;
      self->_dateMonthWidth = self->_dateMonthWidth - v49;
    }

  }
  if (a3 == 4)
    goto LABEL_19;
  if (a3 == 8)
  {
    v51 = &OBJC_IVAR____UIDatePickerMode_Date__dateMonthWidth;
    goto LABEL_18;
  }
  v50 = 0.0;
  if (a3 == 16)
  {
    v51 = &OBJC_IVAR____UIDatePickerMode_Date__dateDayWidth;
LABEL_18:
    p_dateYearWidth = (double *)((char *)self + *v51);
LABEL_19:
    v50 = *p_dateYearWidth;
  }

  return v50;
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
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a5) == 4)
  {
    -[_UIDatePickerMode baseDate](self, "baseDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode calendar](self, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components:fromDate:", 6, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode baseDateComponents](self, "baseDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v16, "setEra:", objc_msgSend(v14, "era"));
    objc_msgSend(v16, "setYear:", objc_msgSend(v14, "year"));
    -[_UIDatePickerMode calendar](self, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateFromComponents:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode calendar](self, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "components:fromDate:toDate:options:", 4, v12, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (id)objc_msgSend(v20, "year");
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIDatePickerMode_Date;
    v21 = -[_UIDatePickerMode rowForDate:dateComponents:component:currentRow:](&v23, sel_rowForDate_dateComponents_component_currentRow_, v10, v11, a5, a6);
  }

  return (int64_t)v21;
}

- (id)_dateForYearRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UIDatePickerMode_Date;
  -[_UIDatePickerMode _dateForYearRow:](&v18, sel__dateForYearRow_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", -[_UIDatePickerMode_Date displayedCalendarUnits](self, "displayedCalendarUnits"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 8);
  -[_UIDatePickerMode datePickerView](self, "datePickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selectedRowInComponent:", v7);

  objc_msgSend(v6, "setMonth:", -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", v9, 8));
  v10 = -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 16);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 1;
  }
  else
  {
    v12 = v10;
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectedRowInComponent:", v12);

    v11 = -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", v14, 16);
  }
  objc_msgSend(v6, "setDay:", v11);
  -[_UIDatePickerMode calendar](self, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateFromComponents:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;

  -[_UIDatePickerMode selectedDateComponents](self, "selectedDateComponents", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a5)
  {
    case 0x10uLL:
      v13 = -[_UIDatePickerMode dayForRow:](self, "dayForRow:", a3);
      v14 = v9;
LABEL_7:
      objc_msgSend(v14, "setDay:", v13);
      goto LABEL_10;
    case 8uLL:
      objc_msgSend(v9, "setMonth:", -[_UIDatePickerMode monthForRow:](self, "monthForRow:", a3));
      v14 = v9;
      v13 = 1;
      goto LABEL_7;
    case 4uLL:
      -[_UIDatePickerMode_Date _dateForYearRow:](self, "_dateForYearRow:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerMode calendar](self, "calendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 6, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setEra:", objc_msgSend(v12, "era"));
      objc_msgSend(v9, "setYear:", objc_msgSend(v12, "year"));

      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerMode.m"), 1564, CFSTR("Unknown calendar unit: %lu"), a5);

  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    v16 = 0;
    do
    {
      v16 |= a5;
      a5 = -[_UIDatePickerMode_Date nextUnitLargerThanUnit:](self, "nextUnitLargerThanUnit:", a5);
    }
    while (a5 != 0x7FFFFFFFFFFFFFFFLL);
    goto LABEL_12;
  }
  v16 = 0;
LABEL_12:
  if (self->super._isUsingJapaneseCalendar)
    v17 = v16 | 6;
  else
    v17 = v16;
  v18 = -[_UIDatePickerMode areValidDateComponents:comparingUnits:](self, "areValidDateComponents:comparingUnits:", v9, v17);

  return v18;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  unint64_t v3;

  v3 = 4;
  if (a3 != 8)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 16)
    return 8;
  else
    return v3;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  unint64_t v3;

  v3 = 16;
  if (a3 != 8)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 4)
    return 8;
  else
    return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayFormat, 0);
  objc_storeStrong((id *)&self->_monthFormat, 0);
  objc_storeStrong((id *)&self->_yearFormat, 0);
}

@end
