@implementation STCreateAlarmAction

- (id)_initWithAlarm:(id)a3
{
  id v6;
  STCreateAlarmAction *v7;
  STCreateAlarmAction *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCreateAlarmAction.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarm"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STCreateAlarmAction;
  v7 = -[STCreateAlarmAction init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_alarm, a3);

  return v8;
}

- (id)alarm
{
  return self->_alarm;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCreateAlarmAction;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarm, CFSTR("_alarm"), v5.receiver, v5.super_class);

}

- (STCreateAlarmAction)initWithCoder:(id)a3
{
  id v4;
  STCreateAlarmAction *v5;
  uint64_t v6;
  STAlarm *alarm;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STCreateAlarmAction;
  v5 = -[STSiriModelObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alarm"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarm = v5->_alarm;
    v5->_alarm = (STAlarm *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
