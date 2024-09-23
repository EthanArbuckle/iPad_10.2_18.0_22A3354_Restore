@implementation WFNumberParameterState

- (WFNumberParameterState)initWithNumber:(id)a3
{
  id v6;
  WFNumberParameterState *v7;
  WFNumberParameterState *v8;
  WFNumberParameterState *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFNumberParameterState.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("number != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFNumberParameterState;
  v7 = -[WFNumberParameterState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_number, a3);
    v9 = v8;
  }

  return v8;
}

- (WFNumberParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  WFNumberParameterState *v7;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[WFNumberParameterState initWithNumber:](self, "initWithNumber:", v6);
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
  WFNumberParameterState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFNumberParameterState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFNumberParameterState number](v4, "number");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNumberParameterState number](self, "number");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

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

  -[WFNumberParameterState number](self, "number");
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
  -[WFNumberParameterState number](self, "number");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

}

- (NSNumber)number
{
  return self->_number;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number, 0);
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
