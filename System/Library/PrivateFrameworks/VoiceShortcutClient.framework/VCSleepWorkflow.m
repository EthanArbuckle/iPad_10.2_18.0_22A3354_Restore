@implementation VCSleepWorkflow

- (VCSleepWorkflow)initWithActions:(id)a3
{
  id v4;
  VCSleepWorkflow *v5;
  uint64_t v6;
  NSArray *actions;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *name;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  VCSleepWorkflow *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCSleepWorkflow;
  v5 = -[VCSleepWorkflow init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      WFLocalizedString(CFSTR("New Shortcut"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    name = v5->_name;
    v5->_name = v11;

    objc_msgSend(v4, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subtitle");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (__CFString *)v14;
    else
      v16 = &stru_1E5FC92C0;
    objc_storeStrong((id *)&v5->_summaryString, v16);

    v17 = v5;
  }

  return v5;
}

- (NSString)bundleIdentifierForDisplay
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  -[VCSleepWorkflow actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[VCSleepWorkflow actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifierForDisplay");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("com.apple.shortcuts");
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

  }
  else
  {
    v10 = CFSTR("com.apple.shortcuts");
    v11 = CFSTR("com.apple.shortcuts");
  }
  return (NSString *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[VCSleepWorkflow actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actions"));

  -[VCSleepWorkflow bundleIdentifierForDisplay](self, "bundleIdentifierForDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifierForDisplay"));

  -[VCSleepWorkflow summaryString](self, "summaryString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("summaryString"));

}

- (VCSleepWorkflow)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  VCSleepWorkflow *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("actions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self = -[VCSleepWorkflow initWithActions:](self, "initWithActions:", v11);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
