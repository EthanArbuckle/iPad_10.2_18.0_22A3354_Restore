@implementation SVXModule

- (SVXModule)initWithIdentifier:(id)a3 instanceClass:(Class)a4 instanceContext:(id)a5 preferences:(id)a6 analytics:(id)a7 performer:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SVXModule *v18;
  uint64_t v19;
  NSString *identifier;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  objc_super v31;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  obj = a8;
  v17 = a8;
  if (v13)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXModule.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

    if (a4)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXModule.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instanceClass != Nil"));

  if (v14)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXModule.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instanceContext != nil"));

  if (v15)
  {
LABEL_5:
    if (v16)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXModule.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("analytics != nil"));

    if (v17)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXModule.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

  if (!v16)
    goto LABEL_14;
LABEL_6:
  if (v17)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXModule.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("performer != nil"));

LABEL_7:
  v31.receiver = self;
  v31.super_class = (Class)SVXModule;
  v18 = -[SVXModule init](&v31, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_instanceContext, a5);
    objc_storeStrong((id *)&v18->_preferences, a6);
    objc_storeStrong((id *)&v18->_analytics, a7);
    objc_storeStrong((id *)&v18->_performer, obj);
    v18->_instanceClass = a4;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SVXModule;
  -[SVXModule description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  NSStringFromClass(self->_instanceClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {identifier = %@, instanceClass = %@, instanceContext = %@, performer = %@}"), v4, identifier, v6, self->_instanceContext, self->_performer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (Class)instanceClass
{
  return self->_instanceClass;
}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (AFAnalytics)analytics
{
  return self->_analytics;
}

- (SVXPerforming)performer
{
  return self->_performer;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
