@implementation STDeleteAlarmAction

- (id)_initWithAlarmIds:(id)a3
{
  id v6;
  STDeleteAlarmAction *v7;
  STDeleteAlarmAction *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STDeleteAlarmAction.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarmIds"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STDeleteAlarmAction;
  v7 = -[STDeleteAlarmAction init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_alarmIds, a3);

  return v8;
}

- (id)alarmIds
{
  return self->_alarmIds;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STDeleteAlarmAction;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIds, CFSTR("_alarmIds"), v5.receiver, v5.super_class);

}

- (STDeleteAlarmAction)initWithCoder:(id)a3
{
  id v4;
  STDeleteAlarmAction *v5;
  uint64_t v6;
  NSArray *alarmIds;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STDeleteAlarmAction;
  v5 = -[STSiriModelObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alarmIds"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarmIds = v5->_alarmIds;
    v5->_alarmIds = (NSArray *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmIds, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
