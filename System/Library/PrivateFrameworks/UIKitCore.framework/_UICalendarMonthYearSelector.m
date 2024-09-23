@implementation _UICalendarMonthYearSelector

- (_UICalendarMonthYearSelector)initWithDataModel:(id)a3
{
  id v5;
  _UICalendarMonthYearSelector *v6;
  _UICalendarMonthYearSelector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICalendarMonthYearSelector;
  v6 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataModel, a3);
    -[_UICalendarMonthYearSelector _setupViewHierarchy](v7, "_setupViewHierarchy");
  }

  return v7;
}

- (void)_setupViewHierarchy
{
  UIDatePicker *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIDatePicker *datePicker;

  -[UIView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  v3 = (UIDatePicker *)objc_opt_new();
  -[UIDatePicker setPreferredDatePickerStyle:](v3, "setPreferredDatePickerStyle:", 1);
  -[UIDatePicker setDatePickerMode:](v3, "setDatePickerMode:", 4);
  -[UIDatePicker _setSelectionBarIgnoresInset:](v3, "_setSelectionBarIgnoresInset:", 1);
  -[_UICalendarDataModel calendar](self->_dataModel, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setCalendar:](v3, "setCalendar:", v4);

  -[_UICalendarDataModel locale](self->_dataModel, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setLocale:](v3, "setLocale:", v5);

  -[_UICalendarDataModel timeZone](self->_dataModel, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setTimeZone:](v3, "setTimeZone:", v6);

  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setMinimumDate:](v3, "setMinimumDate:", v8);

  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setMaximumDate:](v3, "setMaximumDate:", v10);

  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setDate:](v3, "setDate:", v12);

  -[UIControl addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__didSelectDate_, 4096);
  -[UIView addSubview:](self, "addSubview:", v3);
  datePicker = self->_datePicker;
  self->_datePicker = v3;

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UICalendarMonthYearSelector;
  -[UIView layoutSubviews](&v17, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView layoutMargins](self, "layoutMargins");
  v9 = v4 - (v7 + v8);
  v12 = v6 - (v10 + v11);
  -[UIDatePicker sizeThatFits:](self->_datePicker, "sizeThatFits:", v9, v12);
  v14 = v13;
  v15 = (v12 - v13) * 0.5;
  -[UIView layoutMargins](self, "layoutMargins");
  -[UIDatePicker setFrame:](self->_datePicker, "setFrame:", v16, v15, v9, v14);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICalendarMonthYearSelector;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)didUpdateCalendar
{
  id v3;

  -[_UICalendarDataModel calendar](self->_dataModel, "calendar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setCalendar:](self->_datePicker, "setCalendar:", v3);

}

- (void)didUpdateLocale
{
  id v3;

  -[_UICalendarDataModel locale](self->_dataModel, "locale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setLocale:](self->_datePicker, "setLocale:", v3);

}

- (void)didUpdateTimeZone
{
  id v3;

  -[_UICalendarDataModel timeZone](self->_dataModel, "timeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setTimeZone:](self->_datePicker, "setTimeZone:", v3);

}

- (void)didUpdateVisibleMonth
{
  id v3;

  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICalendarMonthYearSelector setSelectedMonth:](self, "setSelectedMonth:", v3);

}

- (void)setSelectedMonth:(id)a3
{
  -[_UICalendarMonthYearSelector setSelectedMonth:animated:](self, "setSelectedMonth:animated:", a3, 0);
}

- (void)setSelectedMonth:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  char v8;
  UIDatePicker *datePicker;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_ui_containsMonth:", v12);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICalendarMonthYearSelector.m"), 96, CFSTR("Unable to set a selected month that is before the minimum or after the maximum date."));

  }
  datePicker = self->_datePicker;
  objc_msgSend(v12, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setDate:animated:](datePicker, "setDate:animated:", v10, v4);

}

- (void)_didSelectDate:(id)a3
{
  id v4;
  _UIDatePickerCalendarMonth *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIDatePickerCalendarMonth *v9;

  v4 = a3;
  v5 = [_UIDatePickerCalendarMonth alloc];
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v5, "initWithDate:calendar:", v6, v7);

  -[_UICalendarMonthYearSelector delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "monthYearSelector:didSelectMonth:", self, v9);

}

- (_UICalendarMonthYearSelectorDelegate)delegate
{
  return (_UICalendarMonthYearSelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UICalendarDataModel)dataModel
{
  return self->_dataModel;
}

- (void)setDataModel:(id)a3
{
  objc_storeStrong((id *)&self->_dataModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
