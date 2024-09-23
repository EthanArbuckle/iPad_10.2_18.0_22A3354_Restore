@implementation SCLHistoryGroupKey

- (SCLHistoryGroupKey)initWithCalendar:(id)a3 referenceDate:(id)a4
{
  id v7;
  id v8;
  SCLHistoryGroupKey *v9;
  SCLHistoryGroupKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLHistoryGroupKey;
  v9 = -[SCLHistoryGroupKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_referenceDate, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SCLHistoryGroupKey *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (SCLHistoryGroupKey *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SCLHistoryGroupKey calendar](v4, "calendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLHistoryGroupKey calendar](self, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[SCLHistoryGroupKey referenceDate](v4, "referenceDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLHistoryGroupKey referenceDate](self, "referenceDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SCLHistoryGroupKey calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SCLHistoryGroupKey referenceDate](self, "referenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar calendarIdentifier](self->_calendar, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@; %@; referenceDate=%@>"),
    v5,
    self,
    v6,
    v7,
    self->_referenceDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
