@implementation STDowntimeOverride

- (id)_initWithType:(int64_t)a3 state:(int64_t)a4 creationDate:(id)a5 calendar:(id)a6 endDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  STDowntimeOverride *v14;
  uint64_t v15;
  NSDate *creationDate;
  uint64_t v17;
  NSCalendar *calendar;
  uint64_t v19;
  NSDate *endDate;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STDowntimeOverride;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = -[STDowntimeOverride init](&v22, sel_init);
  v14->_type = a3;
  v14->_state = a4;
  v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  creationDate = v14->_creationDate;
  v14->_creationDate = (NSDate *)v15;

  v17 = objc_msgSend(v12, "copy");
  calendar = v14->_calendar;
  v14->_calendar = (NSCalendar *)v17;

  v19 = objc_msgSend(v11, "copy");
  endDate = v14->_endDate;
  v14->_endDate = (NSDate *)v19;

  return v14;
}

+ (STDowntimeOverride)overrideWithState:(int64_t)a3 creationDate:(id)a4 calendar:(id)a5 fixedDuration:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a6, "doubleValue");
  objc_msgSend(v11, "dateByAddingTimeInterval:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:state:creationDate:calendar:endDate:", 1, a3, v11, v10, v12);

  return (STDowntimeOverride *)v13;
}

+ (STDowntimeOverride)overrideWithState:(int64_t)a3 creationDate:(id)a4 calendar:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:state:creationDate:calendar:endDate:", 0, a3, v12, v11, v10);

  return (STDowntimeOverride *)v13;
}

- (BOOL)isActiveAtDate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[STDowntimeOverride creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", v4) == 1)
  {
    v6 = 0;
  }
  else
  {
    -[STDowntimeOverride endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "compare:", v4) != -1;

  }
  return v6;
}

- (BOOL)isExpiredAtDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[STDowntimeOverride endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v4);

  return v6 != 1;
}

- (int64_t)modificationBasedOnScheduleChangeAtDate:(id)a3
{
  return !-[STDowntimeOverride isExpiredAtDate:](self, "isExpiredAtDate:", a3)
      && -[STDowntimeOverride state](self, "state") == 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[STDowntimeOverride type](self, "type") == 1)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[STDowntimeOverride endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDowntimeOverride creationDate](self, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    objc_msgSend(v3, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  if (-[STDowntimeOverride type](self, "type"))
    v9 = CFSTR("FixedDuration");
  else
    v9 = CFSTR("Automatic");
  if (-[STDowntimeOverride state](self, "state") == 1)
    v10 = CFSTR("Enabled");
  else
    v10 = CFSTR("Disabled");
  -[STDowntimeOverride creationDate](self, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDowntimeOverride calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendarIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDowntimeOverride endDate](self, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p { Type: %@, State: %@, CreationDate: %@, Calendar: %@, FixedDuration: %@, EndDate: %@ }>"), v8, self, v9, v10, v11, v13, v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithType:state:creationDate:calendar:endDate:", self->_type, self->_state, self->_creationDate, self->_calendar, self->_endDate);
}

- (BOOL)isEqual:(id)a3
{
  STDowntimeOverride *v4;
  BOOL v5;

  v4 = (STDowntimeOverride *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STDowntimeOverride isEqualToDowntimeOverride:](self, "isEqualToDowntimeOverride:", v4);
  }

  return v5;
}

- (BOOL)isEqualToDowntimeOverride:(id)a3
{
  STDowntimeOverride *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (STDowntimeOverride *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    v5 = -[STDowntimeOverride type](self, "type");
    if (v5 == -[STDowntimeOverride type](v4, "type")
      && (v6 = -[STDowntimeOverride state](self, "state"), v6 == -[STDowntimeOverride state](v4, "state")))
    {
      -[STDowntimeOverride creationDate](self, "creationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDowntimeOverride creationDate](v4, "creationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToDate:", v8))
      {
        -[STDowntimeOverride calendar](self, "calendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "calendarIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[STDowntimeOverride calendar](v4, "calendar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "calendarIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v12))
        {
          -[STDowntimeOverride endDate](self, "endDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[STDowntimeOverride endDate](v4, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToDate:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[STDowntimeOverride type](self, "type");
  v4 = -[STDowntimeOverride state](self, "state") ^ v3;
  -[STDowntimeOverride calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[STDowntimeOverride creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[STDowntimeOverride endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSCalendar)calendar
{
  return (NSCalendar *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
