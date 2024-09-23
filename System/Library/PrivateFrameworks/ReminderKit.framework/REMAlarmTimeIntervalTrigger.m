@implementation REMAlarmTimeIntervalTrigger

+ (id)cdEntityName
{
  return CFSTR("REMCDAlarmTimeIntervalTrigger");
}

- (REMAlarmTimeIntervalTrigger)initWithObjectID:(id)a3 timeInterval:(double)a4
{
  REMAlarmTimeIntervalTrigger *v5;
  REMAlarmTimeIntervalTrigger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v5 = -[REMAlarmTrigger initWithObjectID:](&v8, sel_initWithObjectID_, a3);
  v6 = v5;
  if (v5)
    -[REMAlarmTimeIntervalTrigger setTimeInterval:](v5, "setTimeInterval:", a4);
  return v6;
}

- (REMAlarmTimeIntervalTrigger)initWithTimeInterval:(double)a3
{
  REMAlarmTimeIntervalTrigger *v4;
  REMAlarmTimeIntervalTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v4 = -[REMAlarmTrigger init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[REMAlarmTimeIntervalTrigger setTimeInterval:](v4, "setTimeInterval:", a3);
  return v5;
}

- (REMAlarmTimeIntervalTrigger)initWithCoder:(id)a3
{
  id v4;
  REMAlarmTimeIntervalTrigger *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v5 = -[REMAlarmTrigger initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeInterval"));
    -[REMAlarmTimeIntervalTrigger setTimeInterval:](v5, "setTimeInterval:");
  }

  return v5;
}

- (id)_deepCopy
{
  REMAlarmTimeIntervalTrigger *v3;

  v3 = [REMAlarmTimeIntervalTrigger alloc];
  -[REMAlarmTimeIntervalTrigger timeInterval](self, "timeInterval");
  return -[REMAlarmTimeIntervalTrigger initWithTimeInterval:](v3, "initWithTimeInterval:");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[REMAlarmTimeIntervalTrigger timeInterval](self, "timeInterval");
    v7 = v6;
    objc_msgSend(v5, "timeInterval");
    v9 = v8;

    v10 = v7 == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isTemporal
{
  return 1;
}

- (unint64_t)hash
{
  double v2;

  -[REMAlarmTimeIntervalTrigger timeInterval](self, "timeInterval");
  return (unint64_t)v2;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmTimeIntervalTrigger;
  -[REMAlarmTimeIntervalTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmTimeIntervalTrigger timeInterval](self, "timeInterval");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v4 = a3;
  -[REMAlarmTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[REMAlarmTimeIntervalTrigger timeInterval](self, "timeInterval", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeInterval"));

}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

@end
