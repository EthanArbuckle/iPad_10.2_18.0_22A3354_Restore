@implementation USDeviceActivitySchedule

- (USDeviceActivitySchedule)initWithIntervalStart:(id)a3 intervalEnd:(id)a4 repeats:(BOOL)a5 warningTime:(id)a6
{
  id v9;
  id v10;
  id v11;
  USDeviceActivitySchedule *v12;
  uint64_t v13;
  NSDateComponents *intervalStart;
  uint64_t v15;
  NSDateComponents *intervalEnd;
  uint64_t v17;
  NSDateComponents *warningTime;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)USDeviceActivitySchedule;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[USDeviceActivitySchedule init](&v20, sel_init);
  v13 = objc_msgSend(v11, "copy", v20.receiver, v20.super_class);

  intervalStart = v12->_intervalStart;
  v12->_intervalStart = (NSDateComponents *)v13;

  v15 = objc_msgSend(v10, "copy");
  intervalEnd = v12->_intervalEnd;
  v12->_intervalEnd = (NSDateComponents *)v15;

  v12->_repeats = a5;
  v17 = objc_msgSend(v9, "copy");

  warningTime = v12->_warningTime;
  v12->_warningTime = (NSDateComponents *)v17;

  return v12;
}

- (USDeviceActivitySchedule)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  USDeviceActivitySchedule *v9;
  uint64_t v10;
  NSDateComponents *intervalStart;
  uint64_t v12;
  NSDateComponents *intervalEnd;
  uint64_t v14;
  NSDateComponents *warningTime;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IntervalStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IntervalEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WarningTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || !objc_msgSend(v4, "containsValueForKey:", CFSTR("Repeats")))
  {

    v9 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)USDeviceActivitySchedule;
    v9 = -[USDeviceActivitySchedule init](&v17, sel_init);
    v10 = objc_msgSend(v5, "copy");
    intervalStart = v9->_intervalStart;
    v9->_intervalStart = (NSDateComponents *)v10;

    v12 = objc_msgSend(v6, "copy");
    intervalEnd = v9->_intervalEnd;
    v9->_intervalEnd = (NSDateComponents *)v12;

    v9->_repeats = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Repeats"));
    v14 = objc_msgSend(v7, "copy");
    warningTime = v9->_warningTime;
    v9->_warningTime = (NSDateComponents *)v14;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateComponents *intervalStart;
  id v5;

  intervalStart = self->_intervalStart;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", intervalStart, CFSTR("IntervalStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intervalEnd, CFSTR("IntervalEnd"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_repeats, CFSTR("Repeats"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_warningTime, CFSTR("WarningTime"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateInterval)nextInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[USDeviceActivitySchedule intervalStart](self, "intervalStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USDeviceActivitySchedule intervalEnd](self, "intervalEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextIntervalForStartComponents:endComponents:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateInterval *)v6;
}

+ (id)nextIntervalForStartComponents:(id)a3 endComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v5, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "setTimeZone:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v13);

  }
  objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v7, v5, 516);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(v6, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v18, "setTimeZone:", v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimeZone:", v20);

  }
  objc_msgSend(v18, "nextDateAfterDate:matchingComponents:options:", v7, v6, 516);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v14 && (!v21 || objc_msgSend(v14, "compare:", v21) == 1))
  {
    v23 = v14;
  }
  else
  {
    objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v7, v5, 512);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v25 = 0;
      goto LABEL_23;
    }
  }
  objc_msgSend(v18, "nextDateAfterDate:matchingComponents:options:", v23, v6, 512);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v23, v24);
  else
    v25 = 0;

LABEL_23:
  return v25;
}

+ (id)nextWarningDateForComponents:(id)a3 referenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v5, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "setTimeZone:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeZone:", v12);

  }
  objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_11:
    v13 = v13;
    v16 = v13;
    goto LABEL_15;
  }
  objc_msgSend(v6, "timeIntervalSinceDate:", v13);
  if (v14 != 0.0)
  {
    if (v14 < 0.0)
    {
      objc_msgSend(v6, "dateByAddingTimeInterval:");
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v15;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[USDeviceActivitySchedule nextWarningDateForComponents:referenceDate:].cold.1((uint64_t)v5);
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[USDeviceActivitySchedule warningTime](self, "warningTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    objc_msgSend(v6, "warningTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[USDeviceActivitySchedule intervalStart](self, "intervalStart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intervalStart");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[USDeviceActivitySchedule intervalEnd](self, "intervalEnd");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intervalEnd");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11)
        && (v12 = -[USDeviceActivitySchedule repeats](self, "repeats"), v12 == objc_msgSend(v6, "repeats")))
      {
        if (v5 == v7)
          v13 = 1;
        else
          v13 = objc_msgSend(v5, "isEqual:", v7);
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[USDeviceActivitySchedule intervalStart](self, "intervalStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[USDeviceActivitySchedule intervalEnd](self, "intervalEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[USDeviceActivitySchedule repeats](self, "repeats");
  -[USDeviceActivitySchedule warningTime](self, "warningTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)USDeviceActivitySchedule;
  -[USDeviceActivitySchedule description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USDeviceActivitySchedule intervalStart](self, "intervalStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USDeviceActivitySchedule intervalEnd](self, "intervalEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[USDeviceActivitySchedule repeats](self, "repeats");
  -[USDeviceActivitySchedule warningTime](self, "warningTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nIntervalStart: %@\nIntervalEnd: %@\nRepeats: %d\nWarningTime: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDateComponents)intervalStart
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (NSDateComponents)intervalEnd
{
  return (NSDateComponents *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (NSDateComponents)warningTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningTime, 0);
  objc_storeStrong((id *)&self->_intervalEnd, 0);
  objc_storeStrong((id *)&self->_intervalStart, 0);
}

+ (void)nextWarningDateForComponents:(uint64_t)a1 referenceDate:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Tried to create a 0-length warning interval with components %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
