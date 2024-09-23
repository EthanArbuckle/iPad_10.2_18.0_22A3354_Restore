@implementation REMAlarmVehicleTrigger

+ (id)cdEntityName
{
  return CFSTR("REMCDAlarmVehicleTrigger");
}

- (REMAlarmVehicleTrigger)initWithObjectID:(id)a3 event:(int64_t)a4
{
  REMAlarmVehicleTrigger *v5;
  REMAlarmVehicleTrigger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REMAlarmVehicleTrigger;
  v5 = -[REMAlarmTrigger initWithObjectID:](&v8, sel_initWithObjectID_, a3);
  v6 = v5;
  if (v5)
    -[REMAlarmVehicleTrigger setEvent:](v5, "setEvent:", a4);
  return v6;
}

- (REMAlarmVehicleTrigger)initWithEvent:(int64_t)a3
{
  REMAlarmVehicleTrigger *v4;
  REMAlarmVehicleTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMAlarmVehicleTrigger;
  v4 = -[REMAlarmTrigger init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[REMAlarmVehicleTrigger setEvent:](v4, "setEvent:", a3);
  return v5;
}

- (REMAlarmVehicleTrigger)initWithCoder:(id)a3
{
  id v4;
  REMAlarmVehicleTrigger *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REMAlarmVehicleTrigger;
  v5 = -[REMAlarmTrigger initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("event"));
    if (v6 >= 3)
    {
      v7 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[REMAlarmVehicleTrigger initWithCoder:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

      v6 = 0;
    }
    -[REMAlarmVehicleTrigger setEvent:](v5, "setEvent:", v6);
  }

  return v5;
}

- (id)_deepCopy
{
  return -[REMAlarmVehicleTrigger initWithEvent:]([REMAlarmVehicleTrigger alloc], "initWithEvent:", -[REMAlarmVehicleTrigger event](self, "event"));
}

- (BOOL)isEqual:(id)a3
{
  REMAlarmVehicleTrigger *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (REMAlarmVehicleTrigger *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[REMAlarmVehicleTrigger event](v4, "event");
      v6 = v5 == -[REMAlarmVehicleTrigger event](self, "event");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isTemporal
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmVehicleTrigger;
  -[REMAlarmVehicleTrigger description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMAlarmVehicleTrigger event](self, "event");
  if (v5 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown REMAlarmVehicleTriggerEvent %ld"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E67F8F40[v5];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {event = %@}"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v5.super_class = (Class)REMAlarmVehicleTrigger;
  v4 = a3;
  -[REMAlarmTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAlarmVehicleTrigger event](self, "event", v5.receiver, v5.super_class), CFSTR("event"));

}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Unknown REMAlarmVehicleTriggerEvent %ld", a5, a6, a7, a8, 0);
}

@end
