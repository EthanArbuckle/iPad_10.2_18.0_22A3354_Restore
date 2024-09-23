@implementation REMDueDateDeltaInterval

- (REMDueDateDeltaInterval)initWithUnit:(int64_t)a3 count:(int64_t)a4
{
  REMDueDateDeltaInterval *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMDueDateDeltaInterval;
  result = -[REMDueDateDeltaInterval init](&v7, sel_init);
  if (result)
  {
    result->_unit = a3;
    result->_count = a4;
  }
  return result;
}

- (REMDueDateDeltaInterval)initWithUnitInteger:(int64_t)a3 count:(int64_t)a4
{
  REMDueDateDeltaInterval *v6;
  REMDueDateDeltaInterval *v7;
  int64_t v8;
  REMDueDateDeltaInterval *v9;
  NSObject *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMDueDateDeltaInterval;
  v6 = -[REMDueDateDeltaInterval init](&v12, sel_init);
  v7 = v6;
  if ((unint64_t)a3 <= 4 && v6)
  {
    if ((unint64_t)(a3 - 1) >= 4)
      v8 = 0;
    else
      v8 = a3;
    v6->_unit = v8;
    v6->_count = a4;
    v9 = v6;
  }
  else
  {
    +[REMLog utility](REMLog, "utility");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaInterval initWithUnitInteger:count:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BOOL)isEmpty
{
  return -[REMDueDateDeltaInterval count](self, "count") == 0;
}

- (id)addedTo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  switch(-[REMDueDateDeltaInterval unit](self, "unit"))
  {
    case 0:
      objc_msgSend(v5, "setMinute:", -[REMDueDateDeltaInterval count](self, "count"));
      break;
    case 1:
      objc_msgSend(v5, "setHour:", -[REMDueDateDeltaInterval count](self, "count"));
      break;
    case 2:
      v7 = -[REMDueDateDeltaInterval count](self, "count");
      goto LABEL_9;
    case 3:
      v7 = 7 * -[REMDueDateDeltaInterval count](self, "count");
LABEL_9:
      objc_msgSend(v5, "setDay:", v7);
      break;
    case 4:
      objc_msgSend(v5, "setMonth:", -[REMDueDateDeltaInterval count](self, "count"));
      break;
    default:
      +[REMLog utility](REMLog, "utility");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[REMDueDateDeltaInterval addedTo:].cold.2(self, v6);

      break;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    +[REMLog utility](REMLog, "utility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaInterval addedTo:].cold.1(v8, self, v11);

    v10 = v4;
  }
  v12 = v10;

  return v12;
}

- (id)inverted
{
  return -[REMDueDateDeltaInterval initWithUnit:count:]([REMDueDateDeltaInterval alloc], "initWithUnit:count:", -[REMDueDateDeltaInterval unit](self, "unit"), --[REMDueDateDeltaInterval count](self, "count"));
}

- (id)description
{
  unint64_t unit;
  const __CFString *v4;
  NSObject *v5;

  unit = self->_unit;
  if (unit >= 5)
  {
    +[REMLog utility](REMLog, "utility");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaInterval description].cold.1(self, v5);

    v4 = CFSTR("ERROR-UNIT");
  }
  else
  {
    v4 = off_1E67FA2B0[unit];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%@"), self->_count, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  BOOL v9;

  if (a3 == self)
    return 1;
  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REMDueDateDeltaInterval count](self, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = -[REMDueDateDeltaInterval unit](self, "unit");
    v9 = v8 == objc_msgSend(v6, "unit");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t count;
  uint64_t v3;
  int64_t v4;

  count = self->_count;
  v3 = ((unint64_t)count >> 36) & 0x8000000 | (self->_unit << 28);
  if (count >= 0)
    LODWORD(v4) = count;
  else
    v4 = -count;
  return v3 & 0xFFFFFFFFFC000000 | v4 & 0x3FFFFFF;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDueDateDeltaInterval)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  REMDueDateDeltaInterval *v7;
  NSObject *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unit"));
  v6 = v5;
  if (v5 >= 5)
  {
    +[REMLog utility](REMLog, "utility");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaInterval initWithCoder:].cold.1();

    v7 = 0;
  }
  else
  {
    if (v5 - 1 >= 4)
      v6 = 0;
    self = -[REMDueDateDeltaInterval initWithUnit:count:](self, "initWithUnit:count:", v6, (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("count")));
    v7 = self;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMDueDateDeltaInterval unit](self, "unit"), CFSTR("unit"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMDueDateDeltaInterval count](self, "count"), CFSTR("count"));

}

- (int64_t)unit
{
  return self->_unit;
}

- (int64_t)count
{
  return self->_count;
}

- (void)initWithUnitInteger:count:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "-[REMDueDateDeltaInterval initWithUnitInteger:count:] failed: either [super init] failed or {unit: %ld} is invalid", v2);
}

- (void)addedTo:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "-[REMDueDateDeltaInterval addedTo:] failed during call to -[NSCalendar dateByAddingComponents:toDate:options:] {currentCalendar: %{public}@, self: %@}", (uint8_t *)&v7, 0x16u);

}

- (void)addedTo:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unit");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v3, "-[REMDueDateDeltaInterval addedTo:] called with invalid self.unit {unit: %ld}", v4);
  OUTLINED_FUNCTION_2_2();
}

- (void)description
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unit");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v3, "-[REMDueDateDeltaInterval description:] called with invalid self.unit {unit: %ld}", v4);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "-[REMDueDateDeltaInterval initWithCoder:] failed due to invalid unit: %ld", v2);
}

@end
