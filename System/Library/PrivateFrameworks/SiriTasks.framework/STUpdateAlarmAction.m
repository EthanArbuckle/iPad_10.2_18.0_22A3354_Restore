@implementation STUpdateAlarmAction

- (id)_initWithModifications:(id)a3
{
  id v6;
  STUpdateAlarmAction *v7;
  STUpdateAlarmAction *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUpdateAlarmAction.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifications"));

  }
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUpdateAlarmAction.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modifications count] > 0"));

  }
  v12.receiver = self;
  v12.super_class = (Class)STUpdateAlarmAction;
  v7 = -[STUpdateAlarmAction init](&v12, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_modifications, a3);

  return v8;
}

- (id)modifications
{
  return self->_modifications;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUpdateAlarmAction;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_modifications, CFSTR("_modifications"), v5.receiver, v5.super_class);

}

- (STUpdateAlarmAction)initWithCoder:(id)a3
{
  id v4;
  STUpdateAlarmAction *v5;
  uint64_t v6;
  NSArray *modifications;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUpdateAlarmAction;
  v5 = -[STSiriModelObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modifications"));
    v6 = objc_claimAutoreleasedReturnValue();
    modifications = v5->_modifications;
    v5->_modifications = (NSArray *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifications, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
