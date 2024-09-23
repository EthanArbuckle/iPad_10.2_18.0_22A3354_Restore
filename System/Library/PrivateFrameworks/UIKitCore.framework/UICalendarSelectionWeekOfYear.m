@implementation UICalendarSelectionWeekOfYear

- (UICalendarSelectionWeekOfYear)initWithDelegate:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICalendarSelectionWeekOfYear;
  v5 = -[UICalendarSelection _init](&v9, sel__init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(v5 + 5, v4);
    *((_BYTE *)v6 + 16) = (_BYTE)v6[2] & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)v6 + 16) = (_BYTE)v6[2] & 0xFD | v7;
  }

  return (UICalendarSelectionWeekOfYear *)v6;
}

- (void)setSelectedWeekOfYear:(id)a3
{
  -[UICalendarSelectionWeekOfYear setSelectedWeekOfYear:animated:](self, "setSelectedWeekOfYear:animated:", a3, 0);
}

- (void)setSelectedWeekOfYear:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSDateComponents **p_selectedWeekOfYear;
  NSDateComponents *v8;
  NSDateComponents *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *dateComponentsForWeekOfYear;
  void *v19;
  void *v20;
  NSDateComponents *v21;

  v4 = a4;
  v6 = a3;
  p_selectedWeekOfYear = &self->_selectedWeekOfYear;
  v8 = self->_selectedWeekOfYear;
  v9 = (NSDateComponents *)v6;
  v21 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (v9 && v8)
  {
    v10 = -[NSDateComponents isEqual:](v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_9;
LABEL_7:
    -[UICalendarSelectionWeekOfYear selectAllDatesAnimated:](self, "selectAllDatesAnimated:", v4);
    goto LABEL_14;
  }

LABEL_9:
  if (*p_selectedWeekOfYear)
  {
    -[UICalendarSelectionWeekOfYear _dateComponentsForWeekOfYear:](self, "_dateComponentsForWeekOfYear:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalendarSelection view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_deselectDates:animated:", v11, v4);

  }
  -[UICalendarSelectionWeekOfYear _weekOfYearComponentsForDateComponents:](self, "_weekOfYearComponentsForDateComponents:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelection view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarSanitizeWithCalendar(v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_selectedWeekOfYear, v16);
  -[UICalendarSelectionWeekOfYear _dateComponentsForWeekOfYear:](self, "_dateComponentsForWeekOfYear:", v16);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dateComponentsForWeekOfYear = self->_dateComponentsForWeekOfYear;
  self->_dateComponentsForWeekOfYear = v17;

  if (self->_dateComponentsForWeekOfYear)
  {
    -[UICalendarSelection view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_selectDates:animated:", self->_dateComponentsForWeekOfYear, v4);

    -[UICalendarSelection view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setVisibleDateComponents:animated:", *p_selectedWeekOfYear, v4);

  }
LABEL_14:

}

- (void)willMoveToCalendarView:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[UICalendarSelection view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    if (self->_dateComponentsForWeekOfYear)
    {
      -[UICalendarSelection view](self, "view");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_deselectDates:animated:", self->_dateComponentsForWeekOfYear, 0);

    }
  }
}

- (void)didMoveToCalendarView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDateComponents *v7;
  NSDateComponents *selectedWeekOfYear;
  id v9;

  -[UICalendarSelection view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);

  -[UICalendarSelectionWeekOfYear selectedWeekOfYear](self, "selectedWeekOfYear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarSanitizeWithCalendar(v4, v6);
  v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = v7;

  -[UICalendarSelectionWeekOfYear selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
  if (self->_selectedWeekOfYear)
  {
    -[UICalendarSelection view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVisibleDateComponents:animated:", self->_selectedWeekOfYear, 0);

  }
}

- (void)didChangeCalendar:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *selectedWeekOfYear;

  _UICalendarSanitizeWithCalendar(self->_selectedWeekOfYear, a3);
  v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = v4;

}

- (void)didChangeAvailableDateRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDateComponents *selectedWeekOfYear;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_selectedWeekOfYear)
  {
    v4 = a3;
    -[UICalendarSelectionWeekOfYear selectedWeekOfYear](self, "selectedWeekOfYear");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalendarSelection view](self, "view");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = objc_msgSend(v4, "containsDate:", v8);
    if ((v6 & 1) == 0)
    {
      -[UICalendarSelection view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_deselectDates:animated:", v10, 0);

      selectedWeekOfYear = self->_selectedWeekOfYear;
      self->_selectedWeekOfYear = 0;

    }
  }
}

- (BOOL)canSelectDate:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[UICalendarSelectionWeekOfYear _weekOfYearComponentsForDateComponents:](self, "_weekOfYearComponentsForDateComponents:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_delegateImplements & 1) != 0)
  {
    -[UICalendarSelectionWeekOfYear delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "weekOfYearSelection:canSelectWeekOfYear:", self, v4);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)didSelectDate:(id)a3
{
  void *v4;
  NSDateComponents *v5;
  NSDateComponents *selectedWeekOfYear;
  NSDateComponents *v7;
  NSArray *v8;
  NSArray *dateComponentsForWeekOfYear;
  id v10;

  v10 = a3;
  if (self->_dateComponentsForWeekOfYear)
  {
    -[UICalendarSelection view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deselectDates:animated:", self->_dateComponentsForWeekOfYear, 0);

  }
  -[UICalendarSelectionWeekOfYear _weekOfYearComponentsForDateComponents:](self, "_weekOfYearComponentsForDateComponents:", v10);
  v5 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = v5;
  v7 = v5;

  -[UICalendarSelectionWeekOfYear _dateComponentsForWeekOfYear:](self, "_dateComponentsForWeekOfYear:", v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dateComponentsForWeekOfYear = self->_dateComponentsForWeekOfYear;
  self->_dateComponentsForWeekOfYear = v8;

  -[UICalendarSelectionWeekOfYear selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
  -[UICalendarSelectionWeekOfYear _sendDelegateForSelectedDateChange](self, "_sendDelegateForSelectedDateChange");

}

- (BOOL)shouldDeselectDate:(id)a3
{
  UICalendarSelectionWeekOfYear *v4;
  void *v5;

  if ((*(_BYTE *)&self->_delegateImplements & 1) == 0)
    return 0;
  v4 = self;
  -[UICalendarSelectionWeekOfYear delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "weekOfYearSelection:canSelectWeekOfYear:", v4, 0);

  return (char)v4;
}

- (void)didDeselectDate:(id)a3
{
  NSDateComponents *selectedWeekOfYear;

  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = 0;

  -[UICalendarSelectionWeekOfYear _sendDelegateForSelectedDateChange](self, "_sendDelegateForSelectedDateChange");
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_dateComponentsForWeekOfYear)
  {
    v3 = a3;
    -[UICalendarSelection view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_selectDates:animated:", self->_dateComponentsForWeekOfYear, v3);

  }
}

- (BOOL)renderOverhangDays
{
  return 1;
}

- (unint64_t)roundedEdgeForDate:(id)a3
{
  id v4;
  NSArray *dateComponentsForWeekOfYear;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  dateComponentsForWeekOfYear = self->_dateComponentsForWeekOfYear;
  if (dateComponentsForWeekOfYear && -[NSArray count](dateComponentsForWeekOfYear, "count") != 1)
  {
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_dateComponentsForWeekOfYear, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray lastObject](self->_dateComponentsForWeekOfYear, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEqual:", v7) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v11, "isEqual:", v7))
    {
      v6 = 2;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UICalendarSelectionWeekOfYear;
    v6 = -[UICalendarSelection roundedEdgeForDate:](&v13, sel_roundedEdgeForDate_, v4);
  }

  return v6;
}

- (void)_sendDelegateForSelectedDateChange
{
  id v3;

  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    -[UICalendarSelectionWeekOfYear delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "weekOfYearSelection:didSelectWeekOfYear:", self, self->_selectedWeekOfYear);

  }
}

- (id)_weekOfYearComponentsForDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[UICalendarSelection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICalendarSelection view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 1073154, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_dateComponentsForWeekOfYear:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  -[UICalendarSelectionWeekOfYear _weekOfYearComponentsForDateComponents:](self, "_weekOfYearComponentsForDateComponents:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL)
  {

  }
  else
  {
    v6 = objc_msgSend(v5, "yearForWeekOfYear");

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarSelectionWeekOfYear.m"), 205, CFSTR("Week of year components (%@) must include [.weekOfYear, .yearForWeekOfYear]"), v5);

LABEL_3:
  -[UICalendarSelection view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "weekdaySymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  objc_msgSend(v8, "dateFromComponents:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v14;
  if (objc_msgSend(v14, "compare:", v13) == -1)
  {
    v16 = v14;
    do
    {
      objc_msgSend(v8, "components:fromDate:", 1048606, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v17);
      objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v16, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15;
    }
    while (objc_msgSend(v15, "compare:", v13) == -1);
  }

  return v11;
}

- (NSDateComponents)selectedWeekOfYear
{
  return self->_selectedWeekOfYear;
}

- (UICalendarSelectionWeekOfYearDelegate)delegate
{
  return (UICalendarSelectionWeekOfYearDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedWeekOfYear, 0);
  objc_storeStrong((id *)&self->_dateComponentsForWeekOfYear, 0);
}

@end
