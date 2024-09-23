@implementation _SUAutoInstallForecastDateCache

- (_SUAutoInstallForecastDateCache)initWithForecast:(id)a3
{
  id v4;
  _SUAutoInstallForecastDateCache *v5;
  _SUAutoInstallForecastDateCache *v6;
  uint64_t v7;
  NSCalendar *calendar;
  NSCalendar *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SUAutoInstallForecastDateCache;
  v5 = -[_SUAutoInstallForecastDateCache init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_forecast, v4);
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v7 = objc_claimAutoreleasedReturnValue();
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v7;

    v9 = v6->_calendar;
    objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v9, "setTimeZone:", v10);

    -[_SUAutoInstallForecastDateCache _parseForecast](v6, "_parseForecast");
  }

  return v6;
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (NSDate)roundedStartTime
{
  return self->_roundedStartDate;
}

- (NSDate)roundedEndTime
{
  return self->_roundedEndDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[<_SUAutoInstallForecastDateCache:%p> "), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  SUStringForAutoInstallForecastScheduleType(self->_scheduleType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("ForecastScheduleType=%@, "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_forecast);
  objc_msgSend(WeakRetained, "suStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("startDate=%@, "), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", self->_roundedStartDate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("startDateRounded=%@, "), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v17);

  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained((id *)&self->_weak_forecast);
  objc_msgSend(v20, "suEndDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("endDate=%@, "), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v23);

  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", self->_roundedEndDate);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("endDateRounded=%@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v27);

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (void)_parseForecast
{
  SUAutoInstallForecast **p_weak_forecast;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *v10;
  NSDate *roundedStartDate;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *v15;
  NSDate *roundedEndDate;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  int64_t v29;
  id v30;
  _BOOL4 v31;
  int v32;
  _BOOL4 v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  p_weak_forecast = &self->_weak_forecast;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_forecast);
  objc_msgSend(WeakRetained, "suStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_weak_forecast);
  objc_msgSend(v6, "suEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUAutoInstallForecastDateCache _componentsFromDate:](self, "_componentsFromDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinute:", 0);
  objc_msgSend(v9, "setSecond:", 0);
  objc_msgSend(v9, "setNanosecond:", 0);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v9);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  roundedStartDate = self->_roundedStartDate;
  self->_roundedStartDate = v10;

  -[_SUAutoInstallForecastDateCache _componentsFromDate:](self, "_componentsFromDate:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "minute"))
  {
    -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 32, 1, v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUAutoInstallForecastDateCache _componentsFromDate:](self, "_componentsFromDate:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(v12, "setMinute:", 0);
  objc_msgSend(v12, "setSecond:", 0);
  objc_msgSend(v12, "setNanosecond:", 0);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v12);
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  roundedEndDate = self->_roundedEndDate;
  self->_roundedEndDate = v15;

  objc_msgSend(MEMORY[0x24BE0BE00], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v18 = objc_msgSend(v17, "isToday:");

  objc_msgSend(MEMORY[0x24BE0BE00], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v20 = objc_msgSend(v19, "isTomorrow:");

  -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 16, 2, v8, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isAfterDate:", v21)
    && v5
    && v7
    && self->_roundedStartDate
    && self->_roundedEndDate)
  {
    v42 = 0;
    v43 = 0;
    -[_SUAutoInstallForecastDateCache _computeTonightRangeRelativeToDate:extraDayOffset:outStart:outEnd:](self, "_computeTonightRangeRelativeToDate:extraDayOffset:outStart:outEnd:", v8, -1, &v43, &v42);
    v37 = v43;
    v22 = v42;
    v40 = 0;
    v41 = 0;
    -[_SUAutoInstallForecastDateCache _computeTonightRangeRelativeToDate:extraDayOffset:outStart:outEnd:](self, "_computeTonightRangeRelativeToDate:extraDayOffset:outStart:outEnd:", v8, 0, &v41, &v40);
    v34 = v41;
    v36 = v40;
    v38 = 0;
    v39 = 0;
    -[_SUAutoInstallForecastDateCache _computeTonightRangeRelativeToDate:extraDayOffset:outStart:outEnd:](self, "_computeTonightRangeRelativeToDate:extraDayOffset:outStart:outEnd:", v8, 1, &v39, &v38);
    v35 = v39;
    v23 = v38;
    v24 = v23;
    self->_scheduleType = 3;
    if (v18)
    {
      v25 = v23;
      v26 = v22;
      if (-[_SUAutoInstallForecastDateCache _isStart:end:withinDateRange:end:](self, "_isStart:end:withinDateRange:end:", v5, v7, v37, v22))
      {
        v27 = objc_msgSend(v8, "isBeforeDate:", v22);
        v28 = v34;
        v24 = v25;
        if ((v27 & 1) != 0)
        {
          v29 = 1;
LABEL_23:
          self->_scheduleType = v29;
        }
      }
      else
      {
        v28 = v34;
        v31 = -[_SUAutoInstallForecastDateCache _isStart:end:withinDateRange:end:](self, "_isStart:end:withinDateRange:end:", v5, v7, v34, v36);
        v24 = v25;
        if (v31)
        {
          v32 = objc_msgSend(v8, "isBeforeDate:", v26);
          v24 = v25;
          v29 = 1;
          if (v32)
            v29 = 2;
          goto LABEL_23;
        }
      }
    }
    else
    {
      v26 = v22;
      v28 = v34;
      if (v20)
      {
        v30 = v23;
        if (-[_SUAutoInstallForecastDateCache _isStart:end:withinDateRange:end:](self, "_isStart:end:withinDateRange:end:", v5, v7, v34, v36))
        {
          v29 = 1;
          v24 = v30;
          goto LABEL_23;
        }
        v33 = -[_SUAutoInstallForecastDateCache _isStart:end:withinDateRange:end:](self, "_isStart:end:withinDateRange:end:", v5, v7, v35, v30);
        v24 = v30;
        if (v33)
        {
          v29 = 2;
          goto LABEL_23;
        }
      }
    }

    goto LABEL_13;
  }
  self->_scheduleType = 0;
LABEL_13:

}

- (BOOL)_isStart:(id)a3 end:(id)a4 withinDateRange:(id)a5 end:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char v12;

  v9 = a4;
  v10 = a6;
  v11 = v10;
  v12 = 0;
  if (a3 && v9 && a5 && v10)
  {
    if (objc_msgSend(a3, "isAfterDate:", a5))
      v12 = objc_msgSend(v9, "isBeforeDate:", v11);
    else
      v12 = 0;
  }

  return v12;
}

- (void)_computeTonightRangeRelativeToDate:(id)a3 extraDayOffset:(int64_t)a4 outStart:(id *)a5 outEnd:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = v10;
  v19 = v10;
  if (a4)
  {
    -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 16, a4, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v19;
  }
  if (v11)
  {
    -[_SUAutoInstallForecastDateCache _componentsFromDate:](self, "_componentsFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHour:", 20);
    objc_msgSend(v12, "setMinute:", 0);
    objc_msgSend(v12, "setSecond:", 0);
    objc_msgSend(v12, "setNanosecond:", 0);
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 64, -5, v13, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

    v10 = v19;
  }
  v14 = v10;
  v15 = a4 + 1;
  if (a4 != -1)
  {
    -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 16, v15, v19, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v14)
  {
    -[_SUAutoInstallForecastDateCache _componentsFromDate:](self, "_componentsFromDate:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHour:", 5);
    objc_msgSend(v16, "setMinute:", 0);
    objc_msgSend(v16, "setSecond:", 0);
    objc_msgSend(v16, "setNanosecond:", 0);
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 64, 5, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

    if (!a5)
      goto LABEL_19;
  }
  else
  {
    v18 = 0;
    if (!a5)
      goto LABEL_19;
  }
  if (v11)
    *a5 = objc_retainAutorelease(v11);
LABEL_19:
  if (a6 && v18)
    *a6 = objc_retainAutorelease(v18);

}

- (id)_componentsFromDate:(id)a3
{
  return -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 254, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedEndDate, 0);
  objc_storeStrong((id *)&self->_roundedStartDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_weak_forecast);
}

@end
