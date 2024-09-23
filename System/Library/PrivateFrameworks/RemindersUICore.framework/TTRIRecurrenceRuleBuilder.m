@implementation TTRIRecurrenceRuleBuilder

- (TTRIRecurrenceRuleBuilder)init
{
  TTRIRecurrenceRuleBuilder *v2;
  TTRIRecurrenceRuleBuilder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TTRIRecurrenceRuleBuilder;
  v2 = -[TTRIRecurrenceRuleBuilder init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TTRIRecurrenceRuleBuilder _setDefaultValues](v2, "_setDefaultValues");
  return v3;
}

- (void)_setDefaultValues
{
  self->_interval = 1;
}

+ (id)calStringForDayOfWeek:(int)a3
{
  return (id)CUIKStringForDayOfWeek();
}

- (id)recurrenceRule
{
  return -[TTRIRecurrenceRuleBuilder recurrenceRuleWithFirstDayOfTheWeek:](self, "recurrenceRuleWithFirstDayOfTheWeek:", 0);
}

- (id)recurrenceRuleWithFirstDayOfTheWeek:(int64_t)a3
{
  int64_t v5;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  uint64_t v32;
  int64_t v33;

  v5 = -[TTRIRecurrenceRuleBuilder _frequencyToUse](self, "_frequencyToUse");
  if (-[TTRIRecurrenceRuleBuilder count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D845C8], "recurrenceEndWithOccurrenceCount:", -[TTRIRecurrenceRuleBuilder count](self, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[TTRIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count")
    || -[TTRIRecurrenceRuleBuilder days](self, "days")
    || -[TTRIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue"))
  {

  }
  else
  {
    -[TTRIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (!v23)
    {
      v32 = 0;
      v33 = a3;
      v9 = 0;
      goto LABEL_30;
    }
  }
  switch(v5)
  {
    case 3:
      -[TTRIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIRecurrenceRuleBuilder setPositions](self, "setPositions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      v33 = a3;
      if (!v16 || !-[TTRIRecurrenceRuleBuilder days](self, "days"))
      {
        v9 = 0;
        v20 = 0;
        v32 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        if (-[TTRIRecurrenceRuleBuilder days](self, "days"))
          goto LABEL_35;
        goto LABEL_33;
      }
      -[TTRIRecurrenceRuleBuilder daysOfTheWeekWithWeek:](self, "daysOfTheWeekWithWeek:", v16);
      v32 = objc_claimAutoreleasedReturnValue();
      v9 = 0;
      goto LABEL_32;
    case 2:
      -[TTRIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[TTRIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue")
        || !-[TTRIRecurrenceRuleBuilder days](self, "days")
        || (-[TTRIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "count"),
            v17,
            v18))
      {
        -[TTRIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "count"))
        {
          v20 = 0;
          v21 = 0;
          v13 = 0;
LABEL_34:

          v11 = (void *)v20;
          v12 = v21;
          goto LABEL_35;
        }
        v19 = -[TTRIRecurrenceRuleBuilder days](self, "days");

        if (v19)
          goto LABEL_14;
        v33 = a3;
        -[TTRIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
        v20 = objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v32 = 0;
LABEL_33:
        v24 = objc_alloc(MEMORY[0x1E0D845D0]);
        v25 = v10;
        v26 = v6;
        v27 = (void *)objc_msgSend(MEMORY[0x1E0D845D0], "newObjectID");
        v28 = (void *)objc_msgSend(MEMORY[0x1E0D84440], "newObjectID");
        v29 = (void *)objc_msgSend(MEMORY[0x1E0D845E0], "newObjectID");
        v30 = -[TTRIRecurrenceRuleBuilder interval](self, "interval");
        v21 = (void *)v32;
        v13 = (void *)objc_msgSend(v24, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v27, v28, v29, v5, v30, v33, v32, v20, v25, 0, 0, v9, v26);

        v6 = v26;
        v10 = v25;
        goto LABEL_34;
      }
      v33 = a3;
      -[TTRIRecurrenceRuleBuilder setPositions](self, "setPositions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIRecurrenceRuleBuilder daysOfTheWeek](self, "daysOfTheWeek");
      v32 = objc_claimAutoreleasedReturnValue();
LABEL_32:
      v20 = 0;
      goto LABEL_33;
    case 1:
      if (-[TTRIRecurrenceRuleBuilder days](self, "days"))
      {
        -[TTRIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "count");

        if (!v9)
        {
          v33 = a3;
          -[TTRIRecurrenceRuleBuilder daysOfTheWeek](self, "daysOfTheWeek");
          v32 = objc_claimAutoreleasedReturnValue();
LABEL_30:
          v10 = 0;
          goto LABEL_32;
        }
      }
      break;
  }
  v10 = 0;
LABEL_14:
  v11 = 0;
  v12 = 0;
  v13 = 0;
LABEL_35:

  return v13;
}

- (int64_t)_frequencyToUse
{
  int64_t result;

  result = -[TTRIRecurrenceRuleBuilder frequency](self, "frequency");
  if (result == 3)
  {
    if (-[TTRIRecurrenceRuleBuilder days](self, "days") == 127
      || -[TTRIRecurrenceRuleBuilder days](self, "days") == 62
      || -[TTRIRecurrenceRuleBuilder days](self, "days") == 65)
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (id)daysOfTheWeek
{
  return -[TTRIRecurrenceRuleBuilder daysOfTheWeekWithWeek:](self, "daysOfTheWeekWithWeek:", 0);
}

- (id)daysOfTheWeekWithWeek:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)objc_opt_new();
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 3, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 4, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 5, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 6, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  if ((-[TTRIRecurrenceRuleBuilder days](self, "days") & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:weekNumber:", 7, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  if (objc_msgSend(v5, "count"))
    v13 = v5;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (id)setPositions
{
  int v2;

  v2 = -[TTRIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue") - 1;
  if (v2 > 5)
    return 0;
  else
    return (id)qword_1E6783E48[v2];
}

- (id)description
{
  __CFString *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v16;

  -[TTRIRecurrenceRuleBuilder recurrenceRule](self, "recurrenceRule");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[TTRIRecurrenceRuleBuilder frequency](self, "frequency");
  v6 = -[TTRIRecurrenceRuleBuilder interval](self, "interval");
  v7 = -[TTRIRecurrenceRuleBuilder count](self, "count");
  -[TTRIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TTRIRecurrenceRuleBuilder days](self, "days");
  v10 = -[TTRIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue");
  -[TTRIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("NO VALID RULE");
  if (v3)
    v13 = v3;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p> {\n\tFrequency: %ld\n\tInterval: %ld\n\tCount: %tu\n\tDay Number: %@\n\tDays: %u\n\tOrdinal: %u\n\tMonth Numbers: %@\n\tCurrent Rule: %@\n}"), v4, self, v5, v6, v7, v8, v9, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSArray)dayNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDayNumbers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)days
{
  return self->_days;
}

- (void)setDays:(int)a3
{
  self->_days = a3;
}

- (int)ordinalValue
{
  return self->_ordinalValue;
}

- (void)setOrdinalValue:(int)a3
{
  self->_ordinalValue = a3;
}

- (NSArray)monthNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonthNumbers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthNumbers, 0);
  objc_storeStrong((id *)&self->_dayNumbers, 0);
}

@end
