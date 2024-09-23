@implementation REMRecurrenceDayOfWeek

+ (id)dayOfWeek:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDayOfTheWeek:weekNumber:", a3, 0);
}

+ (id)dayOfWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDayOfTheWeek:weekNumber:", a3, a4);
}

- (REMRecurrenceDayOfWeek)initWithDayOfTheWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  REMRecurrenceDayOfWeek *result;
  objc_super v8;

  if (a3 < 1 || (int)a3 >= 8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid day number"));
  v8.receiver = self;
  v8.super_class = (Class)REMRecurrenceDayOfWeek;
  result = -[REMRecurrenceDayOfWeek init](&v8, sel_init);
  if (result)
  {
    result->_dayOfTheWeek = a3;
    result->_weekNumber = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRecurrenceDayOfWeek)initWithCoder:(id)a3
{
  id v4;
  REMRecurrenceDayOfWeek *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRecurrenceDayOfWeek;
  v5 = -[REMRecurrenceDayOfWeek init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dayOfTheWeek"));
    if ((unint64_t)(v6 - 1) >= 7)
    {
      v7 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[REMRecurrenceDayOfWeek initWithCoder:].cold.1(v6, v7);

      v6 = 1;
    }
    v5->_dayOfTheWeek = v6;
    v5->_weekNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weekNumber"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek"), CFSTR("dayOfTheWeek"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceDayOfWeek weekNumber](self, "weekNumber"), CFSTR("weekNumber"));

}

- (id)iCalendarValueFromDayOfTheWeek:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return &stru_1E67FB1F0;
  else
    return off_1E67F7DA8[a3 - 1];
}

- (id)iCalendarDescription
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  if (-[REMRecurrenceDayOfWeek weekNumber](self, "weekNumber"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = -[REMRecurrenceDayOfWeek weekNumber](self, "weekNumber");
    -[REMRecurrenceDayOfWeek iCalendarValueFromDayOfTheWeek:](self, "iCalendarValueFromDayOfTheWeek:", -[REMRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld%@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[REMRecurrenceDayOfWeek iCalendarValueFromDayOfTheWeek:](self, "iCalendarValueFromDayOfTheWeek:", -[REMRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMRecurrenceDayOfWeek iCalendarDescription](self, "iCalendarDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <0x%x> { %@ }"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[REMRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek");
  return -[REMRecurrenceDayOfWeek weekNumber](self, "weekNumber") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  REMRecurrenceDayOfWeek *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (REMRecurrenceDayOfWeek *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (v6 = -[REMRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek"),
          v6 == -[REMRecurrenceDayOfWeek dayOfTheWeek](v4, "dayOfTheWeek")))
    {
      v7 = -[REMRecurrenceDayOfWeek weekNumber](self, "weekNumber");
      v8 = v7 == -[REMRecurrenceDayOfWeek weekNumber](v4, "weekNumber");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)dayOfTheWeek
{
  return self->_dayOfTheWeek;
}

- (int64_t)weekNumber
{
  return self->_weekNumber;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMWeekday %ld", (uint8_t *)&v2, 0xCu);
}

@end
