@implementation _UIDatePickerCalendarMonth

+ (unint64_t)representedCalendarUnits
{
  return 14;
}

- (id)dayWithDate:(id)a3 assignedMonth:(id)a4
{
  id v6;
  id v7;
  _UIDatePickerCalendarDay *v8;
  void *v9;
  _UIDatePickerCalendarDay *v10;

  v6 = a4;
  v7 = a3;
  v8 = [_UIDatePickerCalendarDay alloc];
  -[NSDateComponents calendar](self->super._components, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDatePickerCalendarDay initWithDate:calendar:month:assignedMonth:](v8, "initWithDate:calendar:month:assignedMonth:", v7, v9, self, v6);

  return v10;
}

- (id)dayMatchingOrdinalDay:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(a3, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarDateComponent components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarDateComponent calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarDateComponent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeOfUnit:inUnit:forDate:", 16, 8, v7);
  v10 = v9;

  v11 = objc_msgSend(v4, "day");
  v12 = v10 + v8 - 1;
  if (v11 < v12)
    v12 = v11;
  if (v8 <= v12)
    v13 = v12;
  else
    v13 = v8;
  objc_msgSend(v5, "setDay:", v13);
  -[_UIDatePickerCalendarDateComponent calendar](self, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerCalendarMonth dayWithDate:assignedMonth:](self, "dayWithDate:assignedMonth:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_monthWithOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIDatePickerCalendarMonth *v9;

  if (a3)
  {
    -[NSDateComponents calendar](self->super._components, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setMonth:", a3);
    -[_UIDatePickerCalendarDateComponent date](self, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:]([_UIDatePickerCalendarMonth alloc], "initWithDate:calendar:", v8, v5);
  }
  else
  {
    v9 = self;
  }
  return v9;
}

- (_UIDatePickerCalendarMonth)previousMonth
{
  _UIDatePickerCalendarMonth *previousMonth;
  _UIDatePickerCalendarMonth *v4;
  _UIDatePickerCalendarMonth *v5;

  previousMonth = self->_previousMonth;
  if (!previousMonth)
  {
    -[_UIDatePickerCalendarMonth _monthWithOffset:](self, "_monthWithOffset:", -1);
    v4 = (_UIDatePickerCalendarMonth *)objc_claimAutoreleasedReturnValue();
    v5 = self->_previousMonth;
    self->_previousMonth = v4;

    previousMonth = self->_previousMonth;
  }
  return previousMonth;
}

- (_UIDatePickerCalendarMonth)nextMonth
{
  _UIDatePickerCalendarMonth *nextMonth;
  _UIDatePickerCalendarMonth *v4;
  _UIDatePickerCalendarMonth *v5;

  nextMonth = self->_nextMonth;
  if (!nextMonth)
  {
    -[_UIDatePickerCalendarMonth _monthWithOffset:](self, "_monthWithOffset:", 1);
    v4 = (_UIDatePickerCalendarMonth *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nextMonth;
    self->_nextMonth = v4;

    nextMonth = self->_nextMonth;
  }
  return nextMonth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextMonth, 0);
  objc_storeStrong((id *)&self->_previousMonth, 0);
}

@end
