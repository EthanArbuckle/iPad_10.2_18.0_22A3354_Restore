@implementation _UICalendarRangeSelection

- (_UICalendarRangeSelection)init
{
  return -[_UICalendarRangeSelection initWithDelegate:](self, "initWithDelegate:", 0);
}

- (_UICalendarRangeSelection)initWithDelegate:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  char v7;
  char v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICalendarRangeSelection;
  v5 = -[UICalendarSelection _init](&v11, sel__init);
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
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *((_BYTE *)v6 + 16) = (_BYTE)v6[2] & 0xFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *((_BYTE *)v6 + 16) = (_BYTE)v6[2] & 0xF7 | v9;
  }

  return (_UICalendarRangeSelection *)v6;
}

- (void)setDateRange:(id)a3
{
  -[_UICalendarRangeSelection setDateRange:animated:](self, "setDateRange:animated:", a3, 0);
}

- (void)setDateRange:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _UICalendarDateRange *dateRange;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _UICalendarDateRange *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSDateComponents *pendingStartDate;
  void *v28;
  _UICalendarDateRange *v29;
  id v30;

  v4 = a4;
  v30 = a3;
  -[UICalendarSelection view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    dateRange = self->_dateRange;
    -[UICalendarSelection view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarDateRange allDatesInRangeForCalendar:](dateRange, "allDatesInRangeForCalendar:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E0C9AA60];
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalendarSelection view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarRangeSelection _sanitizedDateRange:calendar:](self, "_sanitizedDateRange:calendar:", v30, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICalendarSelection view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allDatesInRangeForCalendar:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = (void *)MEMORY[0x1E0C9AA60];
    if (v20)
      v22 = (void *)v20;
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minusSet:", v24);

    -[UICalendarSelection view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_deselectDates:animated:", v26, v4);

    objc_storeStrong((id *)&self->_dateRange, v17);
    pendingStartDate = self->_pendingStartDate;
    self->_pendingStartDate = 0;

    -[UICalendarSelection view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_selectDates:animated:", v23, v4);

    v30 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarRangeSelection _sanitizedDateRange:calendar:](self, "_sanitizedDateRange:calendar:", v30, v14);
    v29 = (_UICalendarDateRange *)objc_claimAutoreleasedReturnValue();
    v13 = self->_dateRange;
    self->_dateRange = v29;
  }

}

- (void)willMoveToCalendarView:(id)a3
{
  -[_UICalendarRangeSelection _deselectDatesInRange:animated:](self, "_deselectDatesInRange:animated:", self->_dateRange, 0);
}

- (void)didMoveToCalendarView
{
  void *v3;
  _UICalendarDateRange *dateRange;
  _UICalendarDateRange *v5;
  void *v6;
  void *v7;
  _UICalendarDateRange *v8;
  _UICalendarDateRange *v9;
  void *v10;

  -[UICalendarSelection view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dateRange = self->_dateRange;

    if (dateRange)
    {
      v5 = self->_dateRange;
      -[UICalendarSelection view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICalendarRangeSelection _sanitizedDateRange:calendar:](self, "_sanitizedDateRange:calendar:", v5, v7);
      v8 = (_UICalendarDateRange *)objc_claimAutoreleasedReturnValue();
      v9 = self->_dateRange;
      self->_dateRange = v8;

    }
  }
  -[UICalendarSelection view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsMultipleSelection:", 1);

  -[_UICalendarRangeSelection selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
}

- (id)_sanitizedDateRange:(id)a3 calendar:(id)a4
{
  _UICalendarDateRange *v4;
  id v5;
  _UICalendarDateRange *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (_UICalendarDateRange *)a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    -[_UICalendarDateRange startDate](v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UICalendarSanitizeWithCalendar(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICalendarDateRange endDate](v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _UICalendarSanitizeWithCalendar(v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = -[_UICalendarDateRange initWithStartDate:endDate:]([_UICalendarDateRange alloc], "initWithStartDate:endDate:", v8, v10);
  }
  return v4;
}

- (BOOL)canSelectDate:(id)a3
{
  _UICalendarRangeSelection *v4;
  id v5;
  void *v6;

  if ((*(_BYTE *)&self->_delegateImplements & 1) == 0)
    return 1;
  v4 = self;
  v5 = a3;
  -[_UICalendarRangeSelection delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_calendarSelection:canSelectDate:", v4, v5);

  return (char)v4;
}

- (BOOL)shouldDeselectDate:(id)a3
{
  return 1;
}

- (void)didSelectDate:(id)a3
{
  NSDateComponents **p_pendingStartDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDateComponents *v12;
  uint64_t v13;
  _UICalendarDateRange *v14;
  _UICalendarDateRange *v15;
  _UICalendarDateRange *dateRange;
  NSDateComponents *v17;
  NSDateComponents *v18;
  void *v19;
  _UICalendarDateRange *v20;
  _UICalendarDateRange *v21;
  _UICalendarDateRange *v22;
  NSDateComponents *v23;
  char delegateImplements;
  void *v25;
  void *v26;
  id v27;

  p_pendingStartDate = &self->_pendingStartDate;
  v27 = a3;
  if (*p_pendingStartDate)
  {
    -[UICalendarSelection view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", *p_pendingStartDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICalendarSelection view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (NSDateComponents *)v27;
    v13 = objc_msgSend(v8, "compare:", v11);
    v14 = [_UICalendarDateRange alloc];
    if (v13 == 1)
    {
      v15 = -[_UICalendarDateRange initWithStartDate:endDate:](v14, "initWithStartDate:endDate:", v12, *p_pendingStartDate);
      dateRange = self->_dateRange;
      self->_dateRange = v15;

      v17 = *p_pendingStartDate;
      *p_pendingStartDate = 0;

      v18 = *p_pendingStartDate;
      -[_UICalendarRangeSelection selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
      if (v12 && (*(_BYTE *)&self->_delegateImplements & 2) != 0)
      {
        -[_UICalendarRangeSelection delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_calendarRangeSelection:didBeginSelectionWithDate:", self, v12);

      }
    }
    else
    {
      v21 = -[_UICalendarDateRange initWithStartDate:endDate:](v14, "initWithStartDate:endDate:", *p_pendingStartDate, v12);
      v22 = self->_dateRange;
      self->_dateRange = v21;

      v23 = *p_pendingStartDate;
      *p_pendingStartDate = 0;

      -[_UICalendarRangeSelection selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
      v18 = v12;
      v12 = 0;
    }
    delegateImplements = (char)self->_delegateImplements;
    if ((delegateImplements & 4) != 0)
    {
      -[_UICalendarRangeSelection delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_calendarRangeSelection:didEndSelectionWithDate:", self, v18);

      delegateImplements = (char)self->_delegateImplements;
    }
    if ((delegateImplements & 8) != 0)
    {
      -[_UICalendarRangeSelection delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_calendarRangeSelection:didSelectDateRange:", self, self->_dateRange);

    }
    goto LABEL_14;
  }
  -[_UICalendarRangeSelection _deselectDatesInRange:animated:](self, "_deselectDatesInRange:animated:", self->_dateRange, 0);
  v20 = self->_dateRange;
  self->_dateRange = 0;

  objc_storeStrong((id *)&self->_pendingStartDate, a3);
  -[_UICalendarRangeSelection selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    -[_UICalendarRangeSelection delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_calendarRangeSelection:didBeginSelectionWithDate:", self, v27);
LABEL_14:

  }
}

- (void)didDeselectDate:(id)a3
{
  NSDateComponents **p_pendingStartDate;
  NSDateComponents *pendingStartDate;
  NSDateComponents *v7;
  _UICalendarDateRange *v8;
  _UICalendarDateRange *dateRange;
  NSDateComponents *v10;
  char delegateImplements;
  void *v12;
  void *v13;
  _UICalendarDateRange *v14;
  id v15;

  v15 = a3;
  p_pendingStartDate = &self->_pendingStartDate;
  pendingStartDate = self->_pendingStartDate;
  if (pendingStartDate)
  {
    v7 = pendingStartDate;
    v8 = -[_UICalendarDateRange initWithStartDate:endDate:]([_UICalendarDateRange alloc], "initWithStartDate:endDate:", v7, v7);
    dateRange = self->_dateRange;
    self->_dateRange = v8;

    v10 = *p_pendingStartDate;
    *p_pendingStartDate = 0;

    -[_UICalendarRangeSelection selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
    delegateImplements = (char)self->_delegateImplements;
    if ((delegateImplements & 4) != 0)
    {
      -[_UICalendarRangeSelection delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_calendarRangeSelection:didEndSelectionWithDate:", self, v7);

      delegateImplements = (char)self->_delegateImplements;
    }
    if ((delegateImplements & 8) != 0)
    {
      -[_UICalendarRangeSelection delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_calendarRangeSelection:didSelectDateRange:", self, self->_dateRange);

    }
    goto LABEL_8;
  }
  -[_UICalendarRangeSelection _deselectDatesInRange:animated:](self, "_deselectDatesInRange:animated:", self->_dateRange, 0);
  v14 = self->_dateRange;
  self->_dateRange = 0;

  objc_storeStrong((id *)&self->_pendingStartDate, a3);
  -[_UICalendarRangeSelection selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    -[_UICalendarRangeSelection delegate](self, "delegate");
    v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    -[NSDateComponents _calendarRangeSelection:didBeginSelectionWithDate:](v7, "_calendarRangeSelection:didBeginSelectionWithDate:", self, v15);
LABEL_8:

  }
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _UICalendarDateRange *dateRange;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[UICalendarSelection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11 = (id)objc_opt_new();
    dateRange = self->_dateRange;
    if (dateRange)
    {
      -[UICalendarSelection view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICalendarDateRange allDatesInRangeForCalendar:](dateRange, "allDatesInRangeForCalendar:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v9);

    }
    if (self->_pendingStartDate)
      objc_msgSend(v11, "addObject:");
    -[UICalendarSelection view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_selectDates:animated:", v11, v3);

  }
}

- (void)didChangeCalendar:(id)a3
{
  _UICalendarDateRange *v4;
  _UICalendarDateRange *dateRange;

  -[_UICalendarRangeSelection _sanitizedDateRange:calendar:](self, "_sanitizedDateRange:calendar:", self->_dateRange, a3);
  v4 = (_UICalendarDateRange *)objc_claimAutoreleasedReturnValue();
  dateRange = self->_dateRange;
  self->_dateRange = v4;

}

- (void)didChangeAvailableDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _UICalendarDateRange *v15;
  void *v16;
  _UICalendarDateRange *v17;
  _UICalendarDateRange *v18;
  void *v19;
  _UICalendarDateRange *v20;
  _UICalendarDateRange *dateRange;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _UICalendarDateRange *v30;
  void *v31;
  _UICalendarDateRange *v32;
  _UICalendarDateRange *v33;
  void *v34;
  _UICalendarDateRange *v35;
  _UICalendarDateRange *v36;
  id v37;

  v4 = a3;
  if (self->_dateRange)
  {
    v37 = v4;
    -[UICalendarSelection view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICalendarDateRange startDate](self->_dateRange, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (v10 == -1)
    {
      -[UICalendarSelection view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "calendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 1048606, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = [_UICalendarDateRange alloc];
      -[_UICalendarDateRange startDate](self->_dateRange, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_UICalendarDateRange initWithStartDate:endDate:](v15, "initWithStartDate:endDate:", v16, v14);

      -[_UICalendarRangeSelection _deselectDatesInRange:animated:](self, "_deselectDatesInRange:animated:", v17, 0);
      v18 = [_UICalendarDateRange alloc];
      -[_UICalendarDateRange endDate](self->_dateRange, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[_UICalendarDateRange initWithStartDate:endDate:](v18, "initWithStartDate:endDate:", v14, v19);
      dateRange = self->_dateRange;
      self->_dateRange = v20;

    }
    -[_UICalendarDateRange startDate](self->_dateRange, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "endDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "compare:", v24);

    if (v25 == 1)
    {
      -[UICalendarSelection view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "calendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "endDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "components:fromDate:", 1048606, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = [_UICalendarDateRange alloc];
      -[_UICalendarDateRange endDate](self->_dateRange, "endDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[_UICalendarDateRange initWithStartDate:endDate:](v30, "initWithStartDate:endDate:", v29, v31);

      -[_UICalendarRangeSelection _deselectDatesInRange:animated:](self, "_deselectDatesInRange:animated:", v32, 0);
      v33 = [_UICalendarDateRange alloc];
      -[_UICalendarDateRange startDate](self->_dateRange, "startDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[_UICalendarDateRange initWithStartDate:endDate:](v33, "initWithStartDate:endDate:", v34, v29);
      v36 = self->_dateRange;
      self->_dateRange = v35;

    }
    v4 = v37;
  }

}

- (void)_deselectDatesInRange:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UICalendarSelection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v5)
  {
    -[UICalendarSelection view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allDatesInRangeForCalendar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICalendarSelection view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_deselectDates:animated:", v8, 0);

  }
}

- (_UICalendarDateRange)dateRange
{
  return self->_dateRange;
}

- (_UICalendarRangeSelectionDelegate)delegate
{
  return (_UICalendarRangeSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_pendingStartDate, 0);
}

@end
