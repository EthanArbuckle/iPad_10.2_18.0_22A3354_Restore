@implementation SCLScheduleTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLScheduleTime)init
{
  return -[SCLScheduleTime initWithHour:minute:](self, "initWithHour:minute:", 0, 0);
}

- (SCLScheduleTime)initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  SCLScheduleTime *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCLScheduleTime;
  result = -[SCLScheduleTime init](&v7, sel_init);
  if (result)
  {
    result->_hour = a3;
    result->_minute = a4;
  }
  return result;
}

- (SCLScheduleTime)initWithCoder:(id)a3
{
  id v4;
  SCLScheduleTime *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCLScheduleTime;
  v5 = -[SCLScheduleTime init](&v7, sel_init);
  if (v5)
  {
    v5->_minute = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minute"));
    v5->_hour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hour"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t minute;
  id v5;

  minute = self->_minute;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", minute, CFSTR("minute"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_hour, CFSTR("hour"));

}

- (SCLScheduleTime)initWithScheduleTime:(id)a3
{
  id v4;
  SCLScheduleTime *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCLScheduleTime;
  v5 = -[SCLScheduleTime init](&v7, sel_init);
  if (v5)
  {
    v5->_minute = objc_msgSend(v4, "minute");
    v5->_hour = objc_msgSend(v4, "hour");
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SCLScheduleTime initWithScheduleTime:]([SCLMutableScheduleTime alloc], "initWithScheduleTime:", self);
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCLScheduleTime hour](self, "hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCLScheduleTime minute](self, "minute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateComponents)dateComponents
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v3, "setHour:", -[SCLScheduleTime hour](self, "hour"));
  objc_msgSend(v3, "setMinute:", -[SCLScheduleTime minute](self, "minute"));
  return (NSDateComponents *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "hour");
    if (v6 == -[SCLScheduleTime hour](self, "hour"))
    {
      v7 = objc_msgSend(v5, "minute");
      v8 = v7 == -[SCLScheduleTime minute](self, "minute");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SCLScheduleTime hour](self, "hour");
  return -[SCLScheduleTime minute](self, "minute") ^ v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  v5 = -[SCLScheduleTime hour](self, "hour");
  if (v5 == objc_msgSend(v4, "hour"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCLScheduleTime minute](self, "minute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = objc_msgSend(v4, "minute");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCLScheduleTime hour](self, "hour"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = objc_msgSend(v4, "hour");
  }
  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

@end
