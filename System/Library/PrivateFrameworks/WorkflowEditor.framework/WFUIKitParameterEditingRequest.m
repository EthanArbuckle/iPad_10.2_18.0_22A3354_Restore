@implementation WFUIKitParameterEditingRequest

- (WFUIKitParameterEditingRequest)initWithParameter:(id)a3 currentState:(id)a4
{
  id v8;
  id v9;
  WFUIKitParameterEditingRequest *v10;
  WFUIKitParameterEditingRequest *v11;
  WFUIKitParameterEditingRequest *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIKitParameterEditingRequest.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFUIKitParameterEditingRequest;
  v10 = -[WFUIKitParameterEditingRequest init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameter, a3);
    objc_storeStrong((id *)&v11->_currentState, a4);
    v12 = v11;
  }

  return v11;
}

- (WFUIKitParameterEditingRequest)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  WFUIKitParameterEditingRequest *v21;
  objc_class *v22;
  WFUIKitParameterEditingRequest *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  NSString *v28;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterClass"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("parameterDefinition"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateClass"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v19, CFSTR("state"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  if (v28 && v11)
  {
    v22 = NSClassFromString(v28);
    v23 = self;
    if (v22)
    {
      v24 = (void *)objc_msgSend([v22 alloc], "initWithDefinition:", v11);
      v25 = 0;
      if (v12 && v20)
      {
        v26 = NSClassFromString(v12);
        if (v26)
          v25 = (void *)objc_msgSend([v26 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v20, 0, 0);
        else
          v25 = 0;
      }
      v23 = -[WFUIKitParameterEditingRequest initWithParameter:currentState:](self, "initWithParameter:currentState:", v24, v25);

      v21 = v23;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v23 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[WFUIKitParameterEditingRequest parameter](self, "parameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("parameterClass"));

  -[WFUIKitParameterEditingRequest parameter](self, "parameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "definition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("parameterDefinition"));

  -[WFUIKitParameterEditingRequest currentState](self, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFUIKitParameterEditingRequest currentState](self, "currentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("stateClass"));

    -[WFUIKitParameterEditingRequest currentState](self, "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serializedRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("state"));

  }
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (WFParameterState)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
