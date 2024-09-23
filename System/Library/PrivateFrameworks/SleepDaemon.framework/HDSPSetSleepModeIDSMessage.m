@implementation HDSPSetSleepModeIDSMessage

- (HDSPSetSleepModeIDSMessage)initWithSleepModeOn:(BOOL)a3
{
  HDSPSetSleepModeIDSMessage *v4;
  HDSPSetSleepModeIDSMessage *v5;
  HDSPSetSleepModeIDSMessage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDSPSetSleepModeIDSMessage;
  v4 = -[HDSPSetSleepModeIDSMessage init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sleepModeOn = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_sleepModeOn, CFSTR("sleepModeOn"));
}

- (HDSPSetSleepModeIDSMessage)initWithCoder:(id)a3
{
  id v4;
  HDSPSetSleepModeIDSMessage *v5;
  HDSPSetSleepModeIDSMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSPSetSleepModeIDSMessage;
  v5 = -[HDSPSetSleepModeIDSMessage init](&v8, sel_init);
  if (v5)
  {
    v5->_sleepModeOn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sleepModeOn"));
    v6 = v5;
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HDSPSetSleepModeIDSMessage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HDSPSetSleepModeIDSMessage sleepModeOn](self, "sleepModeOn"), CFSTR("sleepModeOn"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPSetSleepModeIDSMessage descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)sleepModeOn
{
  return self->_sleepModeOn;
}

@end
