@implementation PKDateComponentsRangeFormatter

- (id)stringFromDateComponentsRange:(id)a3
{
  id v4;
  NSDateIntervalFormatter *dateIntervalFormatter;
  NSDateIntervalFormatter *v6;
  NSDateIntervalFormatter *v7;
  void *v8;
  NSDateIntervalFormatter *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDateIntervalFormatter *v13;
  void *v14;
  void *v15;

  v4 = a3;
  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v6 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E0CB3590]);
    v7 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v6;

    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  -[PKDateComponentsRangeFormatter _formatForDateComponentsRange:](self, "_formatForDateComponentsRange:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateIntervalFormatter setDateTemplate:](dateIntervalFormatter, "setDateTemplate:", v8);

  v9 = self->_dateIntervalFormatter;
  objc_msgSend(v4, "startDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSDateIntervalFormatter setCalendar:](v9, "setCalendar:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setCalendar:](v9, "setCalendar:", v12);

  }
  v13 = self->_dateIntervalFormatter;
  objc_msgSend(v4, "dateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateIntervalFormatter stringFromDateInterval:](v13, "stringFromDateInterval:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_formatForDateComponentsRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  -[PKDateComponentsRangeFormatter _currentDateComponents](self, "_currentDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("MMM d"));
  if (-[PKDateComponentsRangeFormatter _isSameDayInDateComponentsRange:](self, "_isSameDayInDateComponentsRange:", v4))
    v7 = -[PKDateComponentsRangeFormatter _areHoursDefinedInDateComponentsRange:](self, "_areHoursDefinedInDateComponentsRange:", v4);
  else
    v7 = 0;
  if (!-[PKDateComponentsRangeFormatter _isSameYearInDateComponentsRange:currentDateComponents:](self, "_isSameYearInDateComponentsRange:currentDateComponents:", v4, v5))objc_msgSend(v6, "appendString:", CFSTR(" yyyy"));
  if (!-[PKDateComponentsRangeFormatter _isSameEraInDateComponentsRange:currentDateComponents:](self, "_isSameEraInDateComponentsRange:currentDateComponents:", v4, v5))objc_msgSend(v6, "appendString:", CFSTR(" G"));
  if (v7)
    objc_msgSend(v6, "appendString:", CFSTR(" HH:mm"));

  return v6;
}

- (id)_currentDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 94, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_areHoursDefinedInDateComponentsRange:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "startDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "endDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hour") != 0x7FFFFFFFFFFFFFFFLL;

  }
  return v5;
}

- (BOOL)_isSameDayInDateComponentsRange:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;

  v3 = a3;
  objc_msgSend(v3, "startDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "day");
  objc_msgSend(v3, "endDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == objc_msgSend(v6, "day"))
  {
    objc_msgSend(v3, "startDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "month");
    objc_msgSend(v3, "endDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == objc_msgSend(v9, "month"))
    {
      objc_msgSend(v3, "startDateComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "year");
      objc_msgSend(v3, "endDateComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == objc_msgSend(v12, "year"))
      {
        objc_msgSend(v3, "startDateComponents");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "era");
        objc_msgSend(v3, "endDateComponents");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14 == objc_msgSend(v15, "era");

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_isSameYearInDateComponentsRange:(id)a3 currentDateComponents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "year");
  objc_msgSend(v6, "endDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == objc_msgSend(v10, "year"))
  {
    objc_msgSend(v6, "startDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "year");
    v13 = v12 == objc_msgSend(v7, "year")
       && -[PKDateComponentsRangeFormatter _isSameEraInDateComponentsRange:currentDateComponents:](self, "_isSameEraInDateComponentsRange:currentDateComponents:", v6, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_isSameEraInDateComponentsRange:(id)a3 currentDateComponents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  BOOL v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKDateComponentsRangeFormatter _resolvedEraFromEra:currentEra:](self, "_resolvedEraFromEra:currentEra:", objc_msgSend(v8, "era"), objc_msgSend(v6, "era"));

  objc_msgSend(v7, "endDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PKDateComponentsRangeFormatter _resolvedEraFromEra:currentEra:](self, "_resolvedEraFromEra:currentEra:", objc_msgSend(v10, "era"), objc_msgSend(v6, "era"));
  v12 = v9 == v11 && v9 == objc_msgSend(v6, "era");

  return v12;
}

- (int64_t)_resolvedEraFromEra:(int64_t)a3 currentEra:(int64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return a4;
  else
    return a3;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  return self->_dateIntervalFormatter;
}

- (void)setDateIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateIntervalFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
}

@end
