@implementation SCLState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLState)initWithActiveState:(unint64_t)a3 scheduleEnabled:(BOOL)a4 inSchedule:(BOOL)a5
{
  SCLState *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCLState;
  result = -[SCLState init](&v9, sel_init);
  if (result)
  {
    result->_activeState = a3;
    result->_scheduleEnabled = a4;
    result->_inSchedule = a5;
  }
  return result;
}

- (SCLState)initWithActive:(BOOL)a3 scheduleEnabled:(BOOL)a4 inSchedule:(BOOL)a5
{
  uint64_t v5;

  if (a3)
    v5 = 2;
  else
    v5 = 0;
  return -[SCLState initWithActiveState:scheduleEnabled:inSchedule:](self, "initWithActiveState:scheduleEnabled:inSchedule:", v5, a4, a5);
}

- (SCLState)initWithCoder:(id)a3
{
  id v4;
  SCLState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCLState;
  v5 = -[SCLState init](&v7, sel_init);
  if (v5)
  {
    v5->_activeState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeState"));
    v5->_scheduleEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("scheduleEnabled"));
    v5->_inSchedule = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inSchedule"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activeState;
  id v5;

  activeState = self->_activeState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", activeState, CFSTR("activeState"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SCLState isScheduleEnabled](self, "isScheduleEnabled"), CFSTR("scheduleEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SCLState isInSchedule](self, "isInSchedule"), CFSTR("inSchedule"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLState activeState](self, "activeState");
  if (v6 > 2)
    v7 = 0;
  else
    v7 = off_24E29BDE0[v6];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@; scheduleEnabled=%u; inSchedule=%u>"),
    v5,
    self,
    v7,
    -[SCLState isScheduleEnabled](self, "isScheduleEnabled"),
    -[SCLState isInSchedule](self, "isInSchedule"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isActive
{
  return -[SCLState activeState](self, "activeState") == 2;
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;

  v3 = -[SCLState activeState](self, "activeState");
  v4 = -[SCLState isScheduleEnabled](self, "isScheduleEnabled");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 ^ v3;
  v7 = -[SCLState isInSchedule](self, "isInSchedule");
  v8 = 4;
  if (!v7)
    v8 = 0;
  return v6 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[SCLState activeState](self, "activeState");
    if (v6 == objc_msgSend(v5, "activeState")
      && (v7 = -[SCLState isScheduleEnabled](self, "isScheduleEnabled"),
          v7 == objc_msgSend(v5, "isScheduleEnabled")))
    {
      v9 = -[SCLState isInSchedule](self, "isInSchedule");
      v8 = v9 ^ objc_msgSend(v5, "isInSchedule") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isScheduleEnabled
{
  return self->_scheduleEnabled;
}

- (BOOL)isInSchedule
{
  return self->_inSchedule;
}

- (unint64_t)activeState
{
  return self->_activeState;
}

@end
