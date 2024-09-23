@implementation UICalendarSelectionSingleDate

- (UICalendarSelectionSingleDate)initWithDelegate:(id)delegate
{
  id v4;
  id *v5;
  id *v6;
  char v7;
  objc_super v9;

  v4 = delegate;
  v9.receiver = self;
  v9.super_class = (Class)UICalendarSelectionSingleDate;
  v5 = -[UICalendarSelection _init](&v9, sel__init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(v5 + 3, v4);
    *((_BYTE *)v6 + 16) = (_BYTE)v6[2] & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)v6 + 16) = (_BYTE)v6[2] & 0xFD | v7;
  }

  return (UICalendarSelectionSingleDate *)v6;
}

- (void)setSelectedDate:(NSDateComponents *)selectedDate
{
  -[UICalendarSelectionSingleDate setSelectedDate:animated:](self, "setSelectedDate:animated:", selectedDate, 0);
}

- (void)setSelectedDate:(NSDateComponents *)selectedDate animated:(BOOL)animated
{
  _BOOL8 v4;
  NSDateComponents *v7;
  NSDateComponents *v8;
  NSDateComponents *v9;
  NSDateComponents *v10;
  int v11;
  NSDateComponents *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDateComponents *v19;
  NSDateComponents *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDateComponents *v24;
  _QWORD v25[2];

  v4 = animated;
  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = selectedDate;
  v8 = self->_selectedDate;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (!v9 || !v8)
  {

    if (!v10)
      goto LABEL_14;
    goto LABEL_9;
  }
  v11 = -[NSDateComponents isEqual:](v8, "isEqual:", v9);

  if (v11)
  {
LABEL_7:
    -[UICalendarSelectionSingleDate selectAllDatesAnimated:](self, "selectAllDatesAnimated:", v4);
    goto LABEL_18;
  }
LABEL_9:
  v12 = v10;
  if (-[NSDateComponents year](v12, "year") == 0x7FFFFFFFFFFFFFFFLL
    || -[NSDateComponents month](v12, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {

  }
  else
  {
    v14 = -[NSDateComponents day](v12, "day");

    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarSelectionSingleDate.m"), 50, CFSTR("dateComponents (%@) is invalid. It requires at least [.year, .month, .day]"), v12);

LABEL_14:
  if (self->_selectedDate)
  {
    -[UICalendarSelection view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = self->_selectedDate;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_deselectDates:animated:", v16, v4);

  }
  -[UICalendarSelection view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarSanitizeWithCalendar(v10, v18);
  v19 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  v20 = self->_selectedDate;
  self->_selectedDate = v19;

  if (self->_selectedDate)
  {
    -[UICalendarSelection view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self->_selectedDate;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_selectDates:animated:", v22, v4);

    -[UICalendarSelection view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setVisibleDateComponents:animated:", self->_selectedDate, v4);

  }
LABEL_18:

}

- (void)willMoveToCalendarView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UICalendarSelection view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    if (self->_selectedDate)
    {
      -[UICalendarSelection view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = self->_selectedDate;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_deselectDates:animated:", v7, 0);

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
  NSDateComponents *selectedDate;
  id v9;

  -[UICalendarSelection view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);

  -[UICalendarSelectionSingleDate selectedDate](self, "selectedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarSanitizeWithCalendar(v4, v6);
  v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedDate = self->_selectedDate;
  self->_selectedDate = v7;

  -[UICalendarSelectionSingleDate selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
  if (self->_selectedDate)
  {
    -[UICalendarSelection view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVisibleDateComponents:animated:", self->_selectedDate, 0);

  }
}

- (void)didChangeCalendar:(id)a3
{
  id v4;
  NSDateComponents *v5;
  NSDateComponents *selectedDate;
  id v7;

  v4 = a3;
  -[UICalendarSelectionSingleDate selectedDate](self, "selectedDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _UICalendarSanitizeWithCalendar(v7, v4);
  v5 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

  selectedDate = self->_selectedDate;
  self->_selectedDate = v5;

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
  NSDateComponents *selectedDate;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_selectedDate)
  {
    v4 = a3;
    -[UICalendarSelectionSingleDate selectedDate](self, "selectedDate");
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

      selectedDate = self->_selectedDate;
      self->_selectedDate = 0;

    }
  }
}

- (void)didChangeVisibleMonth:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIDatePickerCalendarMonth *v7;
  void *v8;
  _UIDatePickerCalendarMonth *v9;
  _UIDatePickerCalendarDay *v10;
  void *v11;
  _UIDatePickerCalendarDay *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UIDatePickerCalendarDay *v19;
  void *v20;
  id v21;

  v21 = a3;
  if (self->_selectedDate
    && -[UICalendarSelectionSingleDate _selectionFollowsMonthSelection](self, "_selectionFollowsMonthSelection"))
  {
    -[UICalendarSelection view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_dataModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [_UIDatePickerCalendarMonth alloc];
    objc_msgSend(v6, "dateFromComponents:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v7, "initWithDate:calendar:", v8, v6);

    v10 = [_UIDatePickerCalendarDay alloc];
    -[NSDateComponents date](self->_selectedDate, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v10, "initWithDate:calendar:", v11, v6);

    -[_UIDatePickerCalendarMonth dayMatchingOrdinalDay:](v9, "dayMatchingOrdinalDay:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalendarSelection view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_dataModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "availableDateRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "_ui_containsDay:", v13) & 1) == 0)
    {
      objc_msgSend(v13, "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_ui_dateInRangeForDate:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[_UIDatePickerCalendarDay initWithDate:calendar:]([_UIDatePickerCalendarDay alloc], "initWithDate:calendar:", v18, v6);
      v13 = v19;
    }
    objc_msgSend(v13, "components");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalendarSelectionSingleDate setSelectedDate:](self, "setSelectedDate:", v20);
    -[UICalendarSelectionSingleDate didSelectDate:](self, "didSelectDate:", v20);

  }
}

- (BOOL)canSelectDate:(id)a3
{
  UICalendarSelectionSingleDate *v4;
  id v5;
  void *v6;

  if ((*(_BYTE *)&self->_delegateImplements & 1) == 0)
    return 1;
  v4 = self;
  v5 = a3;
  -[UICalendarSelectionSingleDate delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "dateSelection:canSelectDate:", v4, v5);

  return (char)v4;
}

- (void)didSelectDate:(id)a3
{
  NSDateComponents *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDateComponents *selectedDate;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (NSDateComponents *)a3;
  -[UICalendarSelectionSingleDate selectedDate](self, "selectedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UICalendarSelection view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = self->_selectedDate;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_deselectDates:animated:", v7, 0);

  }
  selectedDate = self->_selectedDate;
  self->_selectedDate = v4;

  -[UICalendarSelectionSingleDate _sendDelegateForSelectedDateChange](self, "_sendDelegateForSelectedDateChange");
}

- (BOOL)shouldDeselectDate:(id)a3
{
  UICalendarSelectionSingleDate *v4;
  void *v5;

  if ((*(_BYTE *)&self->_delegateImplements & 1) == 0)
    return 0;
  v4 = self;
  -[UICalendarSelectionSingleDate delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "dateSelection:canSelectDate:", v4, 0);

  return (char)v4;
}

- (void)didDeselectDate:(id)a3
{
  NSDateComponents *selectedDate;

  selectedDate = self->_selectedDate;
  self->_selectedDate = 0;

  -[UICalendarSelectionSingleDate _sendDelegateForSelectedDateChange](self, "_sendDelegateForSelectedDateChange");
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_selectedDate)
  {
    v3 = a3;
    -[UICalendarSelection view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = self->_selectedDate;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_selectDates:animated:", v6, v3);

  }
}

- (void)_sendDelegateForSelectedDateChange
{
  id v3;

  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    -[UICalendarSelectionSingleDate delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateSelection:didSelectDate:", self, self->_selectedDate);

  }
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDateComponents)selectedDate
{
  return self->_selectedDate;
}

- (BOOL)_selectionFollowsMonthSelection
{
  return self->__selectionFollowsMonthSelection;
}

- (void)set_selectionFollowsMonthSelection:(BOOL)a3
{
  self->__selectionFollowsMonthSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
