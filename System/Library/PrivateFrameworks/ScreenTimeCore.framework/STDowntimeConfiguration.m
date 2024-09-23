@implementation STDowntimeConfiguration

- (STDowntimeConfiguration)initWithCurrentState:(int64_t)a3 currentDate:(id)a4 nextState:(int64_t)a5 nextStateChangeDate:(id)a6 calendar:(id)a7
{
  id v11;
  id v12;
  id v13;
  STDowntimeConfiguration *v14;
  uint64_t v15;
  NSDate *currentDate;
  uint64_t v17;
  NSDate *nextStateChangeDate;
  uint64_t v19;
  NSCalendar *calendar;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STDowntimeConfiguration;
  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = -[STDowntimeConfiguration init](&v22, sel_init);
  v14->_currentState = a3;
  v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  currentDate = v14->_currentDate;
  v14->_currentDate = (NSDate *)v15;

  v14->_nextState = a5;
  v17 = objc_msgSend(v12, "copy");

  nextStateChangeDate = v14->_nextStateChangeDate;
  v14->_nextStateChangeDate = (NSDate *)v17;

  v19 = objc_msgSend(v11, "copy");
  calendar = v14->_calendar;
  v14->_calendar = (NSCalendar *)v19;

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[STDowntimeConfiguration currentState](self, "currentState") - 1;
  if (v5 > 3)
    v6 = CFSTR("Disabled");
  else
    v6 = off_1E93715B8[v5];
  v7 = -[STDowntimeConfiguration nextState](self, "nextState") - 1;
  if (v7 > 3)
    v8 = CFSTR("Disabled");
  else
    v8 = off_1E93715B8[v7];
  -[STDowntimeConfiguration currentDate](self, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDowntimeConfiguration nextStateChangeDate](self, "nextStateChangeDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDowntimeConfiguration calendar](self, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calendarIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { Current: %@, Next: %@, CurrentDate: %@, NextDate: %@, Calendar: %@ }>"), v4, self, v6, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:", self->_currentState, self->_currentDate, self->_nextState, self->_nextStateChangeDate, self->_calendar);
}

- (BOOL)isEqual:(id)a3
{
  STDowntimeConfiguration *v4;
  BOOL v5;

  v4 = (STDowntimeConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STDowntimeConfiguration isEqualToDowntimeState:](self, "isEqualToDowntimeState:", v4);
  }

  return v5;
}

- (BOOL)isEqualToDowntimeState:(id)a3
{
  STDowntimeConfiguration *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = (STDowntimeConfiguration *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    v5 = -[STDowntimeConfiguration currentState](self, "currentState");
    if (v5 == -[STDowntimeConfiguration currentState](v4, "currentState"))
    {
      v6 = -[STDowntimeConfiguration nextState](self, "nextState");
      if (v6 == -[STDowntimeConfiguration nextState](v4, "nextState"))
      {
        -[STDowntimeConfiguration currentDate](self, "currentDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[STDowntimeConfiguration currentDate](v4, "currentDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "isEqualToDate:", v8))
        {
          v13 = 0;
LABEL_17:

          goto LABEL_18;
        }
        -[STDowntimeConfiguration nextStateChangeDate](self, "nextStateChangeDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[STDowntimeConfiguration nextStateChangeDate](v4, "nextStateChangeDate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {
          -[STDowntimeConfiguration calendar](self, "calendar", v20, v22);
        }
        else
        {
          -[STDowntimeConfiguration nextStateChangeDate](self, "nextStateChangeDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[STDowntimeConfiguration nextStateChangeDate](v4, "nextStateChangeDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqualToDate:", v12))
          {
            v13 = 0;
LABEL_15:

            v18 = (void *)v10;
LABEL_16:

            goto LABEL_17;
          }
          -[STDowntimeConfiguration calendar](self, "calendar", v12, v11);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "calendarIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STDowntimeConfiguration calendar](v4, "calendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "calendarIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v15, "isEqualToString:", v17);

        v18 = v9;
        v12 = v21;
        v11 = v23;
        if (v9 == (void *)v10)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    v13 = 0;
  }
LABEL_18:

  return v13;
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

  v3 = -[STDowntimeConfiguration currentState](self, "currentState");
  v4 = -[STDowntimeConfiguration nextState](self, "nextState") ^ v3;
  -[STDowntimeConfiguration currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[STDowntimeConfiguration nextStateChangeDate](self, "nextStateChangeDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[STDowntimeConfiguration calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (NSDate)currentDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)nextState
{
  return self->_nextState;
}

- (NSDate)nextStateChangeDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSCalendar)calendar
{
  return (NSCalendar *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_nextStateChangeDate, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end
