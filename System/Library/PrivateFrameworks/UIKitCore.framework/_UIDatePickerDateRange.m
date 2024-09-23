@implementation _UIDatePickerDateRange

- (_UIDatePickerDateRange)init
{
  return -[_UIDatePickerDateRange initWithStartDate:endDate:](self, "initWithStartDate:endDate:", 0, 0);
}

- (_UIDatePickerDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  _UIDatePickerDateRange *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerDateRange;
  v9 = -[_UIDatePickerDateRange init](&v11, sel_init);
  if (v9)
  {
    if (v7 && v8 && objc_msgSend(v7, "compare:", v8) == 1)
      *(_BYTE *)&v9->_flags |= 1u;
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v9->_endDate, a4);
  }

  return v9;
}

- (id)copyWithStartDate:(id)a3
{
  id v4;
  _UIDatePickerDateRange *v5;

  v4 = a3;
  v5 = -[_UIDatePickerDateRange initWithStartDate:endDate:]([_UIDatePickerDateRange alloc], "initWithStartDate:endDate:", v4, self->_endDate);

  return v5;
}

- (id)copyWithEndDate:(id)a3
{
  id v4;
  _UIDatePickerDateRange *v5;

  v4 = a3;
  v5 = -[_UIDatePickerDateRange initWithStartDate:endDate:]([_UIDatePickerDateRange alloc], "initWithStartDate:endDate:", self->_startDate, v4);

  return v5;
}

- (BOOL)containsDate:(id)a3
{
  id v5;
  NSDate *startDate;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerDateRange.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    startDate = self->_startDate;
    if (startDate)
      v7 = -[NSDate compare:](startDate, "compare:", v5) != NSOrderedDescending;
    else
      v7 = 1;
    if (self->_endDate && objc_msgSend(v5, "compare:") == 1)
      v7 = 0;
  }

  return v7;
}

- (BOOL)_containsDate:(id)a3 withAccuracy:(unint64_t)a4 inCalendar:(id)a5
{
  id v9;
  id v10;
  BOOL v11;
  char v12;
  id v13;
  NSDate *startDate;
  void *v15;
  void *v17;
  id v18;
  double v19;

  v9 = a3;
  v10 = a5;
  if (-[_UIDatePickerDateRange containsDate:](self, "containsDate:", v9))
  {
    v11 = 1;
  }
  else
  {
    v18 = 0;
    v19 = 0.0;
    v12 = objc_msgSend(v10, "rangeOfUnit:startDate:interval:forDate:", a4, &v18, &v19, v9);
    v13 = v18;
    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerDateRange.m"), 80, CFSTR("Unable to calculate range for date %@ in calendar %@ with accuracy %tu."), v9, v10, a4);

    }
    startDate = self->_startDate;
    if (startDate)
    {
      objc_msgSend(v13, "dateByAddingTimeInterval:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSDate compare:](startDate, "compare:", v15) == NSOrderedAscending;

    }
    else
    {
      v11 = 1;
    }
    if (self->_endDate && objc_msgSend(v13, "compare:") == 1)
      v11 = 0;

  }
  return v11;
}

- (id)dateInRangeForDate:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate *endDate;
  void *v8;
  NSDate *startDate;
  NSDate *v10;

  v5 = a3;
  if (!-[_UIDatePickerDateRange containsDate:](self, "containsDate:", v5))
  {
    if (self->_startDate && objc_msgSend(v5, "compare:") == -1)
    {
      startDate = self->_startDate;
    }
    else
    {
      endDate = self->_endDate;
      if (!endDate || -[NSDate compare:](endDate, "compare:", v5) != NSOrderedAscending)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerDateRange.m"), 102, CFSTR("Invalid state. Unable to find closest valid date to date %@ with lower bounds %@ and upper bounds %@."), v5, self->_startDate, self->_endDate);

        v6 = (NSDate *)objc_opt_new();
        goto LABEL_11;
      }
      startDate = self->_endDate;
    }
    v6 = startDate;
    goto LABEL_11;
  }
  v6 = (NSDate *)v5;
LABEL_11:
  v10 = v6;

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (BOOL)containsMonth:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[_UIDatePickerDateRange _containsDate:withAccuracy:inCalendar:](self, "_containsDate:withAccuracy:inCalendar:", v5, 8, v6);
  return (char)self;
}

- (BOOL)containsDay:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[_UIDatePickerDateRange _containsDate:withAccuracy:inCalendar:](self, "_containsDate:withAccuracy:inCalendar:", v5, 16, v6);
  return (char)self;
}

@end
