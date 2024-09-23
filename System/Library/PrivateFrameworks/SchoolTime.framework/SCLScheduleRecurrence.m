@implementation SCLScheduleRecurrence

- (SCLScheduleRecurrence)initWithTimeInterval:(id)a3 day:(int64_t)a4
{
  id v6;
  SCLScheduleRecurrence *v7;
  uint64_t v8;
  SCLTimeInterval *timeInterval;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLScheduleRecurrence;
  v7 = -[SCLScheduleRecurrence init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    timeInterval = v7->_timeInterval;
    v7->_timeInterval = (SCLTimeInterval *)v8;

    v7->_day = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLScheduleRecurrence)initWithCoder:(id)a3
{
  id v4;
  SCLScheduleRecurrence *v5;
  uint64_t v6;
  SCLTimeInterval *timeInterval;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLScheduleRecurrence;
  v5 = -[SCLScheduleRecurrence init](&v9, sel_init);
  if (v5)
  {
    v5->_day = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("day"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    timeInterval = v5->_timeInterval;
    v5->_timeInterval = (SCLTimeInterval *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t day;
  id v5;

  day = self->_day;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", day, CFSTR("day"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeInterval, CFSTR("timeInterval"));

}

- (BOOL)isEqual:(id)a3
{
  SCLScheduleRecurrence *v4;
  SCLScheduleRecurrence *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (SCLScheduleRecurrence *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SCLScheduleRecurrence day](v5, "day");
      if (v6 == -[SCLScheduleRecurrence day](self, "day"))
      {
        -[SCLScheduleRecurrence timeInterval](v5, "timeInterval");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
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
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SCLScheduleRecurrence day](self, "day");
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v20 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_opt_class();
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "startTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v22, "hour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v19, "minute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "hour"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "minute"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringForSCLDay(-[SCLScheduleRecurrence day](self, "day"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@ %p; startTime: %@:%@; endTime: %@:%@; %@>"),
    v18,
    self,
    v4,
    v6,
    v10,
    v14,
    v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (SCLTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (int64_t)day
{
  return self->_day;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
}

- (BOOL)isActiveAtDate:(id)a3 calendar:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SCLScheduleRecurrence dateIntervalForActiveScheduleOnOrAfterDate:calendar:](self, "dateIntervalForActiveScheduleOnOrAfterDate:calendar:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsDate:", v6);

  return (char)self;
}

- (id)dateIntervalForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t Day;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    Day = -[SCLScheduleRecurrence day](self, "day");
    v11 = objc_msgSend(v8, "component:fromDate:", 512, v6);
    -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setWeekday:", Day);
    -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v18, "crossesDayBoundary");

    if ((_DWORD)v15)
      Day = SCLGetNextDay(v11);
    objc_msgSend(v17, "setWeekday:", Day);
    objc_msgSend(MEMORY[0x24BDD1508], "SCL_dateIntervalForActiveScheduleOnOrAfterDate:calendar:startComponents:endComponents:", v6, v8, v14, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)intersectsRecurrence:(id)a3
{
  SCLScheduleRecurrence *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t Day;
  uint64_t v12;
  SCLScheduleRecurrence *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = (SCLScheduleRecurrence *)a3;
  v5 = -[SCLScheduleRecurrence day](v4, "day");
  v6 = -[SCLScheduleRecurrence day](self, "day");
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 != v6)
  {
    if (objc_msgSend(v7, "crossesDayBoundary"))
    {
      Day = SCLGetNextDay(-[SCLScheduleRecurrence day](self, "day"));
      v12 = -[SCLScheduleRecurrence day](v4, "day");

      if (Day == v12)
      {
        -[SCLScheduleRecurrence timeInterval](v4, "timeInterval");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self;
LABEL_10:
        -[SCLScheduleRecurrence timeInterval](v13, "timeInterval");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startTime");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "compare:", v17) == -1;

        goto LABEL_11;
      }
    }
    else
    {

    }
    -[SCLScheduleRecurrence timeInterval](v4, "timeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "crossesDayBoundary"))
    {
      v10 = 0;
      goto LABEL_12;
    }
    v14 = SCLGetPreviousDay(-[SCLScheduleRecurrence day](self, "day"));
    v15 = -[SCLScheduleRecurrence day](v4, "day");

    if (v14 != v15)
    {
      v10 = 0;
      goto LABEL_13;
    }
    -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    goto LABEL_10;
  }
  -[SCLScheduleRecurrence timeInterval](v4, "timeInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "intersectsTimeInterval:", v9);
LABEL_11:

LABEL_12:
LABEL_13:

  return v10;
}

- (BOOL)isContiguousWithRecurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t Day;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "day");
  if (v7 == -[SCLScheduleRecurrence day](self, "day"))
  {
    -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "crossesDayBoundary");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v4, "timeInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v6, "isEqual:", v13);
LABEL_10:

      goto LABEL_11;
    }
  }
  -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "crossesDayBoundary") & 1) != 0 || !objc_msgSend(v6, "hour") && !objc_msgSend(v6, "minute"))
  {
    Day = SCLGetNextDay(-[SCLScheduleRecurrence day](self, "day"));
    v12 = objc_msgSend(v4, "day");

    if (Day != v12)
    {
      v16 = 0;
      goto LABEL_13;
    }
    -[SCLScheduleRecurrence timeInterval](self, "timeInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqual:", v15);

    goto LABEL_10;
  }
  v16 = 0;
LABEL_11:

LABEL_13:
  return v16;
}

+ (id)dayOfWeekAndStartTimeComparator
{
  return &__block_literal_global;
}

uint64_t __66__SCLScheduleRecurrence_Extended__dayOfWeekAndStartTimeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "day"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "day"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "timeInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "compare:", v12);

  }
  return v8;
}

@end
