@implementation WFStringParameterState

- (WFStringParameterState)initWithString:(id)a3
{
  id v5;
  WFStringParameterState *v6;
  uint64_t v7;
  NSString *string;
  WFStringParameterState *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStringParameterState.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFStringParameterState;
  v6 = -[WFStringParameterState init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    string = v6->_string;
    v6->_string = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (WFStringParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  WFStringParameterState *v7;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[WFStringParameterState initWithString:](self, "initWithString:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WFStringParameterState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFStringParameterState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFStringParameterState string](v4, "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStringParameterState string](self, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFStringParameterState string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[WFStringParameterState string](self, "string");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
