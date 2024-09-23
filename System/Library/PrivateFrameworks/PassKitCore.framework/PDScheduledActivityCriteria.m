@implementation PDScheduledActivityCriteria

+ (id)priorityActivityCriteriaWithStartDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPriorityKey:gracePeriod:startDate:", v6, 1, v4);

  return v7;
}

+ (id)maintenanceActivityCriteriaWithStartDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80880]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPriorityKey:gracePeriod:startDate:", v6, 5, v4);

  return v7;
}

- (PDScheduledActivityCriteria)init
{
  void *v3;
  PDScheduledActivityCriteria *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80880]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PDScheduledActivityCriteria initWithPriorityKey:gracePeriod:startDate:](self, "initWithPriorityKey:gracePeriod:startDate:", v3, 5, 0);

  return v4;
}

- (PDScheduledActivityCriteria)initWithPriorityKey:(id)a3 gracePeriod:(int64_t)a4 startDate:(id)a5
{
  id v8;
  id v9;
  PDScheduledActivityCriteria *v10;
  uint64_t v11;
  NSString *priorityKey;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PDScheduledActivityCriteria;
  v10 = -[PDScheduledActivityCriteria init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    priorityKey = v10->_priorityKey;
    v10->_priorityKey = (NSString *)v11;

    v10->_gracePeriod = a4;
    objc_storeStrong((id *)&v10->_startDate, a5);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDScheduledActivityCriteria)initWithCoder:(id)a3
{
  id v4;
  PDScheduledActivityCriteria *v5;
  uint64_t v6;
  NSString *priorityKey;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  NSString *reason;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDScheduledActivityCriteria;
  v5 = -[PDScheduledActivityCriteria init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
    v6 = objc_claimAutoreleasedReturnValue();
    priorityKey = v5->_priorityKey;
    v5->_priorityKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v5->_requireMainsPower = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireMainsPower"));
    v5->_requireScreenSleep = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireScreenSleep"));
    v5->_requireNetworkConnectivity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireNetworkConnectivity"));
    v5->_repeating = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("repeating"));
    v5->_repeatInterval = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("repeatInterval"));
    v5->_gracePeriod = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("gracePeriod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v12 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *priorityKey;
  id v5;

  priorityKey = self->_priorityKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", priorityKey, CFSTR("priority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requireMainsPower, CFSTR("requireMainsPower"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requireScreenSleep, CFSTR("requireScreenSleep"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requireNetworkConnectivity, CFSTR("requireNetworkConnectivity"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_repeating, CFSTR("repeating"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_repeatInterval, CFSTR("repeatInterval"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_gracePeriod, CFSTR("gracePeriod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PDScheduledActivityCriteria *v5;
  uint64_t v6;
  NSString *priorityKey;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  NSString *reason;

  v5 = -[PDScheduledActivityCriteria init](+[PDScheduledActivityCriteria allocWithZone:](PDScheduledActivityCriteria, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_priorityKey, "copyWithZone:", a3);
  priorityKey = v5->_priorityKey;
  v5->_priorityKey = (NSString *)v6;

  v8 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v8;

  v10 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v10;

  v5->_requireMainsPower = self->_requireMainsPower;
  v5->_requireScreenSleep = self->_requireScreenSleep;
  v5->_requireNetworkConnectivity = self->_requireNetworkConnectivity;
  v5->_repeating = self->_repeating;
  v5->_repeatInterval = self->_repeatInterval;
  v5->_gracePeriod = self->_gracePeriod;
  v12 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  reason = v5->_reason;
  v5->_reason = (NSString *)v12;

  return v5;
}

- (id)debugDescription
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; \n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("priorityKey: '%@'; "), self->_priorityKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), self->_startDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%@'; "), self->_endDate);
  if (self->_requireMainsPower)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requireMainsPower: '%@'; "), v4);
  if (self->_requireScreenSleep)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requireScreenSleep: '%@'; "), v5);
  if (self->_requireNetworkConnectivity)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requireNetworkConnectivity: '%@'; "), v6);
  if (self->_repeating)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("repeating: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("repeatInterval: '%ld'; "), (uint64_t)self->_repeatInterval);
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%ld'; "), self->_gracePeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), self->_reason);
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_priorityKey);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_reason);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_requireMainsPower - v4 + 32 * v4;
  v6 = self->_requireScreenSleep - v5 + 32 * v5;
  v7 = self->_requireNetworkConnectivity - v6 + 32 * v6;
  v8 = self->_repeating - v7 + 32 * v7;
  v9 = (unint64_t)self->_repeatInterval - v8 + 32 * v8;
  v10 = self->_gracePeriod - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PDScheduledActivityCriteria *v4;
  PDScheduledActivityCriteria *v5;
  BOOL v6;

  v4 = (PDScheduledActivityCriteria *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PDScheduledActivityCriteria isEqualToScheduledAcivityCriteria:](self, "isEqualToScheduledAcivityCriteria:", v5);

  return v6;
}

- (BOOL)isEqualToScheduledAcivityCriteria:(id)a3
{
  double *v4;
  NSString *priorityKey;
  NSString *v6;
  BOOL v7;
  NSDate *startDate;
  NSDate *v9;
  NSDate *endDate;
  NSDate *v11;
  NSString *reason;
  NSString *v13;
  char v14;

  v4 = (double *)a3;
  priorityKey = self->_priorityKey;
  v6 = (NSString *)*((_QWORD *)v4 + 1);
  if (priorityKey)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (priorityKey != v6)
      goto LABEL_28;
  }
  else if ((-[NSString isEqual:](priorityKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_28;
  }
  startDate = self->_startDate;
  v9 = (NSDate *)*((_QWORD *)v4 + 4);
  if (startDate && v9)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_28;
  }
  else if (startDate != v9)
  {
    goto LABEL_28;
  }
  endDate = self->_endDate;
  v11 = (NSDate *)*((_QWORD *)v4 + 5);
  if (!endDate || !v11)
  {
    if (endDate == v11)
      goto LABEL_19;
LABEL_28:
    v14 = 0;
    goto LABEL_29;
  }
  if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0)
    goto LABEL_28;
LABEL_19:
  if (self->_requireMainsPower != *((unsigned __int8 *)v4 + 24)
    || self->_requireScreenSleep != *((unsigned __int8 *)v4 + 25)
    || self->_requireNetworkConnectivity != *((unsigned __int8 *)v4 + 26)
    || self->_repeating != *((unsigned __int8 *)v4 + 27)
    || self->_repeatInterval != v4[6]
    || self->_gracePeriod != *((_QWORD *)v4 + 2))
  {
    goto LABEL_28;
  }
  reason = self->_reason;
  v13 = (NSString *)*((_QWORD *)v4 + 7);
  if (reason && v13)
    v14 = -[NSString isEqual:](reason, "isEqual:");
  else
    v14 = reason == v13;
LABEL_29:

  return v14;
}

- (id)xpcActivityCriteria
{
  xpc_object_t v3;
  void *v4;
  const char *v5;
  double v6;
  double v7;
  int64_t v8;
  double repeatInterval;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], !self->_requireMainsPower);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808D8], self->_requireScreenSleep);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808D0], self->_requireNetworkConnectivity);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], self->_repeating);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], -[NSString UTF8String](self->_priorityKey, "UTF8String"));
    v5 = (const char *)*MEMORY[0x1E0C80760];
    -[NSDate timeIntervalSinceNow](self->_startDate, "timeIntervalSinceNow");
    if (v6 <= 0.0)
    {
      v8 = 0;
    }
    else
    {
      -[NSDate timeIntervalSinceNow](self->_startDate, "timeIntervalSinceNow");
      v8 = (uint64_t)v7;
    }
    xpc_dictionary_set_int64(v4, v5, v8);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80790], self->_gracePeriod);
    if (self->_repeating)
    {
      repeatInterval = self->_repeatInterval;
      if (repeatInterval > 0.0)
        xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], (uint64_t)repeatInterval);
    }
  }
  return v4;
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

- (BOOL)requireMainsPower
{
  return self->_requireMainsPower;
}

- (void)setRequireMainsPower:(BOOL)a3
{
  self->_requireMainsPower = a3;
}

- (BOOL)requireScreenSleep
{
  return self->_requireScreenSleep;
}

- (void)setRequireScreenSleep:(BOOL)a3
{
  self->_requireScreenSleep = a3;
}

- (BOOL)requireNetworkConnectivity
{
  return self->_requireNetworkConnectivity;
}

- (void)setRequireNetworkConnectivity:(BOOL)a3
{
  self->_requireNetworkConnectivity = a3;
}

- (BOOL)isRepeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->_repeatInterval = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_priorityKey, 0);
}

@end
