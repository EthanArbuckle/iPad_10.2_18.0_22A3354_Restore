@implementation WFUIKitParameterEditingResponse

- (WFUIKitParameterEditingResponse)initWithParameterState:(id)a3
{
  id v5;
  WFUIKitParameterEditingResponse *v6;
  WFUIKitParameterEditingResponse *v7;
  WFUIKitParameterEditingResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFUIKitParameterEditingResponse;
  v6 = -[WFUIKitParameterEditingResponse init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameterState, a3);
    v8 = v7;
  }

  return v7;
}

- (WFUIKitParameterEditingResponse)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  WFUIKitParameterEditingResponse *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateClass"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v5 && v13)
  {
    v15 = NSClassFromString(v5);
    if (v15)
      v14 = (void *)objc_msgSend([v15 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v13, 0, 0);
    else
      v14 = 0;
  }
  v16 = -[WFUIKitParameterEditingResponse initWithParameterState:](self, "initWithParameterState:", v14);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WFUIKitParameterEditingResponse parameterState](self, "parameterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFUIKitParameterEditingResponse parameterState](self, "parameterState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("stateClass"));

    -[WFUIKitParameterEditingResponse parameterState](self, "parameterState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serializedRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("state"));

  }
}

- (WFParameterState)parameterState
{
  return self->_parameterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
