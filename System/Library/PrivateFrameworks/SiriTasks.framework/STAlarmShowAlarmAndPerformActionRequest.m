@implementation STAlarmShowAlarmAndPerformActionRequest

- (id)_initWithAction:(id)a3
{
  id v6;
  STAlarmShowAlarmAndPerformActionRequest *v7;
  STAlarmShowAlarmAndPerformActionRequest *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAlarmShowAlarmAndPerformActionRequest.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STAlarmShowAlarmAndPerformActionRequest;
  v7 = -[AFSiriRequest init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_action, a3);

  return v8;
}

- (id)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAlarmShowAlarmAndPerformActionRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, CFSTR("_action"), v5.receiver, v5.super_class);

}

- (STAlarmShowAlarmAndPerformActionRequest)initWithCoder:(id)a3
{
  id v4;
  STAlarmShowAlarmAndPerformActionRequest *v5;
  uint64_t v6;
  STAlarmAction *action;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAlarmShowAlarmAndPerformActionRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_action"));
    v6 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (STAlarmAction *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
