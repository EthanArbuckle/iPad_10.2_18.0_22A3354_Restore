@implementation _UICalendarDateRange

- (_UICalendarDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  _UICalendarDateRange *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_UICalendarDateRange;
  v10 = -[_UICalendarDateRange init](&v26, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateComponents calendar](v10->_startDate, "calendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateComponents calendar](v10->_endDate, "calendar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_UICalendarRangeSelection.m"), 22, CFSTR("startDate.calendar and endDate.calendar must match. Start (%@) != End (%@)"), v23, v24);

    }
    objc_msgSend(v8, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v17, "dateFromComponents:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateFromComponents:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "compare:", v19);

    if (v20 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_UICalendarRangeSelection.m"), 25, CFSTR("Start Date (%@) must be before End Date (%@)"), v8, v9);

    }
    objc_storeStrong((id *)&v10->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);

  }
  return v10;
}

- (id)allDatesInRangeForCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "dateFromComponents:", self->_startDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", self->_endDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", v6) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICalendarDateRange allDatesInRangeForCalendar:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_UICalendarRangeSelection.m"), 37, CFSTR("Start date must be before the end date"));

  }
  v7 = (void *)objc_opt_new();
  v8 = v5;
  v9 = v8;
  if (objc_msgSend(v8, "compare:", v6) != 1)
  {
    v10 = v8;
    do
    {
      objc_msgSend(v4, "components:fromDate:", 1048606, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);
      objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, 1, v10, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v9;
    }
    while (objc_msgSend(v9, "compare:", v6) != 1);
  }

  return v7;
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (NSDateComponents)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
