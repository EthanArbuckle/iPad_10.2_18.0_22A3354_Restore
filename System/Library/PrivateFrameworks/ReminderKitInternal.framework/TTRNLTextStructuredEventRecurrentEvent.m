@implementation TTRNLTextStructuredEventRecurrentEvent

- (TTRNLTextStructuredEventRecurrentEvent)initWithRange:(_NSRange)a3 startDate:(id)a4 endDate:(id)a5 isAllDay:(BOOL)a6 frequency:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  TTRNLTextStructuredEventRecurrentEvent *v17;
  TTRNLTextStructuredEventRecurrentEvent *v18;
  objc_super v20;

  length = a3.length;
  location = a3.location;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TTRNLTextStructuredEventRecurrentEvent;
  v17 = -[TTRNLTextStructuredEventRecurrentEvent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_range.location = location;
    v17->_range.length = length;
    objc_storeStrong((id *)&v17->_startDate, a4);
    objc_storeStrong((id *)&v18->_endDate, a5);
    v18->_isAllDay = a6;
    objc_storeStrong((id *)&v18->_frequency, a7);
  }

  return v18;
}

- (TTRNLTextStructuredEventRecurrentEvent)initWithRange:(_NSRange)a3 startDate:(id)a4 endDate:(id)a5 isAllDay:(BOOL)a6 startComponents:(id)a7 endComponents:(id)a8 frequencyComponents:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  TTRNLTextStructuredEventRecurrentEvent *v17;
  TTRNLTextStructuredEventRecurrentEvent *v18;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  length = a3.length;
  location = a3.location;
  v23 = a4;
  v22 = a5;
  v21 = a7;
  v15 = a8;
  v16 = a9;
  v24.receiver = self;
  v24.super_class = (Class)TTRNLTextStructuredEventRecurrentEvent;
  v17 = -[TTRNLTextStructuredEventRecurrentEvent init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_range.location = location;
    v17->_range.length = length;
    objc_storeStrong((id *)&v17->_startDate, a4);
    objc_storeStrong((id *)&v18->_endDate, a5);
    v18->_isAllDay = a6;
    objc_storeStrong((id *)&v18->_startDateComponents, a7);
    objc_storeStrong((id *)&v18->_endDateComponents, a8);
    objc_storeStrong((id *)&v18->_frequencyComponents, a9);
  }

  return v18;
}

- (int64_t)hourFrequency
{
  if (self->_frequencyComponents)
    return -[NSDateComponents hour](self->_frequencyComponents, "hour");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513C0]);
}

- (int64_t)dayFrequency
{
  if (self->_frequencyComponents)
    return -[NSDateComponents day](self->_frequencyComponents, "day");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513B8]);
}

- (int64_t)monthFrequency
{
  if (self->_frequencyComponents)
    return -[NSDateComponents month](self->_frequencyComponents, "month");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513C8]);
}

- (int64_t)weekOfMonthFrequency
{
  if (self->_frequencyComponents)
    return -[NSDateComponents weekOfMonth](self->_frequencyComponents, "weekOfMonth");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513D0]);
}

- (int64_t)weekDay
{
  if (self->_startDateComponents)
    return -[NSDateComponents weekday](self->_startDateComponents, "weekday");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513E8]);
}

- (int64_t)weekdayOrdinal
{
  if (self->_startDateComponents)
    return -[NSDateComponents weekdayOrdinal](self->_startDateComponents, "weekdayOrdinal");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513F0]);
}

- (int64_t)weekdayStart
{
  if (self->_startDateComponents)
    return -[NSDateComponents weekday](self->_startDateComponents, "weekday");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513F8]);
}

- (int64_t)weekdayEnd
{
  if (self->_endDateComponents)
    return -[NSDateComponents weekday](self->_endDateComponents, "weekday");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513E0]);
}

- (int64_t)weekOfYear
{
  if (self->_frequencyComponents)
    return -[NSDateComponents weekOfYear](self->_frequencyComponents, "weekOfYear");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D513D8]);
}

- (int64_t)yearFrequency
{
  if (self->_frequencyComponents)
    return -[NSDateComponents year](self->_frequencyComponents, "year");
  else
    return -[TTRNLTextStructuredEventRecurrentEvent frequencyForKey:](self, "frequencyForKey:", *MEMORY[0x1E0D51400]);
}

- (int64_t)frequencyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[TTRNLTextStructuredEventRecurrentEvent frequency](self, "frequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v7 = objc_msgSend(v6, "integerValue"), v7 <= 0))
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSRange v37;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37.location = -[TTRNLTextStructuredEventRecurrentEvent range](self, "range");
  NSStringFromRange(v37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ range=%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[TTRNLTextStructuredEventRecurrentEvent startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3578];
    -[TTRNLTextStructuredEventRecurrentEvent startDate](self, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v11, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("start=\"%@\"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  -[TTRNLTextStructuredEventRecurrentEvent endDate](self, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3578];
    -[TTRNLTextStructuredEventRecurrentEvent endDate](self, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringFromDate:dateStyle:timeStyle:", v16, 1, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end=\"%@\"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  -[TTRNLTextStructuredEventRecurrentEvent startDate](self, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

  }
  else
  {
    -[TTRNLTextStructuredEventRecurrentEvent endDate](self, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_9;
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TTRNLTextStructuredEventRecurrentEvent isAllDay](self, "isAllDay"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("isAllDay=%@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

LABEL_9:
  if (-[TTRNLTextStructuredEventRecurrentEvent hourFrequency](self, "hourFrequency") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hourFrequency=%ld"), -[TTRNLTextStructuredEventRecurrentEvent hourFrequency](self, "hourFrequency"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent dayFrequency](self, "dayFrequency") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dayFrequency=%ld"), -[TTRNLTextStructuredEventRecurrentEvent dayFrequency](self, "dayFrequency"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent monthFrequency](self, "monthFrequency") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("monthFrequency=%ld"), -[TTRNLTextStructuredEventRecurrentEvent monthFrequency](self, "monthFrequency"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent weekOfMonthFrequency](self, "weekOfMonthFrequency") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weekOfMonthFrequency=%ld"), -[TTRNLTextStructuredEventRecurrentEvent weekOfMonthFrequency](self, "weekOfMonthFrequency"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent weekDay](self, "weekDay") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weekDay=%ld"), -[TTRNLTextStructuredEventRecurrentEvent weekDay](self, "weekDay"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent weekOfYear](self, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weekOfYear=%ld"), -[TTRNLTextStructuredEventRecurrentEvent weekOfYear](self, "weekOfYear"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent weekdayOrdinal](self, "weekdayOrdinal") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weekdayOrdinal=%ld"), -[TTRNLTextStructuredEventRecurrentEvent weekdayOrdinal](self, "weekdayOrdinal"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent weekdayStart](self, "weekdayStart") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weekdayStart=%ld"), -[TTRNLTextStructuredEventRecurrentEvent weekdayStart](self, "weekdayStart"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent weekdayEnd](self, "weekdayEnd") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weekdayEnd=%ld"), -[TTRNLTextStructuredEventRecurrentEvent weekdayEnd](self, "weekdayEnd"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v32);

  }
  if (-[TTRNLTextStructuredEventRecurrentEvent yearFrequency](self, "yearFrequency") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("yearFrequency=%ld"), -[TTRNLTextStructuredEventRecurrentEvent yearFrequency](self, "yearFrequency"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v33);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByAppendingString:", CFSTR(">"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (NSDictionary)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (void)setEndDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDateComponents)frequencyComponents
{
  return self->_frequencyComponents;
}

- (void)setFrequencyComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequencyComponents, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
