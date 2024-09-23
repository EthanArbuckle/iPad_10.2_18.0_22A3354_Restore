@implementation _UIDatePickerCalendarDay

+ (unint64_t)representedCalendarUnits
{
  return 30;
}

- (_UIDatePickerCalendarDay)initWithDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  _UIDatePickerCalendarMonth *v8;
  _UIDatePickerCalendarDay *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:]([_UIDatePickerCalendarMonth alloc], "initWithDate:calendar:", v7, v6);
  v9 = -[_UIDatePickerCalendarDay initWithDate:calendar:month:assignedMonth:](self, "initWithDate:calendar:month:assignedMonth:", v7, v6, v8, 0);

  return v9;
}

- (_UIDatePickerCalendarDay)initWithDate:(id)a3 calendar:(id)a4 month:(id)a5 assignedMonth:(id)a6
{
  id v11;
  id v12;
  _UIDatePickerCalendarDay *v13;
  _UIDatePickerCalendarDay *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_UIDatePickerCalendarDay;
  v13 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](&v16, sel_initWithDate_calendar_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_month, a5);
    objc_storeStrong((id *)&v14->_assignedMonth, a6);
  }

  return v14;
}

- (id)copyWithAssignedMonth:(id)a3
{
  _UIDatePickerCalendarMonth *v4;
  _UIDatePickerCalendarDay *v5;
  _UIDatePickerCalendarMonth *v6;
  _UIDatePickerCalendarMonth *v7;
  _UIDatePickerCalendarMonth *v8;
  _BOOL4 v9;

  v4 = (_UIDatePickerCalendarMonth *)a3;
  if (self->_assignedMonth != v4)
  {
    v5 = (_UIDatePickerCalendarDay *)-[_UIDatePickerCalendarDay copy](self, "copy");
    v6 = self->_month;
    v7 = v4;
    v8 = v7;
    if (v6 == v7)
    {

    }
    else
    {
      if (!v7 || !v6)
      {

        goto LABEL_11;
      }
      v9 = -[_UIDatePickerCalendarDateComponent isEqual:](v6, "isEqual:", v7);

      if (!v9)
        goto LABEL_11;
    }
    v8 = 0;
LABEL_11:
    objc_storeStrong((id *)&v5->_assignedMonth, v8);
    goto LABEL_12;
  }
  v5 = self;
LABEL_12:

  return v5;
}

- (BOOL)isToday
{
  void *v3;
  void *v4;
  char v5;

  -[NSDateComponents calendar](self->super._components, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarDateComponent date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDateInToday:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerCalendarDay;
  v4 = -[_UIDatePickerCalendarDateComponent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_month);
  objc_storeStrong(v4 + 4, self->_assignedMonth);
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  _UIDatePickerCalendarMonth *assignedMonth;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarDay;
  v3 = -[_UIDatePickerCalendarDateComponent hash](&v7, sel_hash);
  v4 = -[_UIDatePickerCalendarDateComponent hash](self->_month, "hash") ^ v3;
  assignedMonth = self->_assignedMonth;
  if (assignedMonth)
    v4 ^= -[_UIDatePickerCalendarDateComponent hash](assignedMonth, "hash");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _UIDatePickerCalendarMonth *v7;
  _UIDatePickerCalendarMonth *v8;
  _UIDatePickerCalendarMonth *v9;
  BOOL v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerCalendarDay;
  if (-[_UIDatePickerCalendarDateComponent isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    if (-[_UIDatePickerCalendarDateComponent isEqual:](self->_month, "isEqual:", v5[3]))
    {
      v6 = (void *)v5[4];
      v7 = self->_assignedMonth;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        if (v7)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (v10)
          v11 = 0;
        else
          v11 = -[_UIDatePickerCalendarDateComponent isEqual:](v7, "isEqual:", v8);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inlineDescriptionForComponents:", self->super._components);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; components: %@; month: %@; assignedMonth: %@>"),
    v5,
    self,
    v6,
    self->_month,
    self->_assignedMonth);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_UIDatePickerCalendarMonth)month
{
  return self->_month;
}

- (_UIDatePickerCalendarMonth)assignedMonth
{
  return self->_assignedMonth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignedMonth, 0);
  objc_storeStrong((id *)&self->_month, 0);
}

@end
