@implementation WFNumberStringSubstitutableState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WFNumberStringSubstitutableState;
    objc_msgSendSuper2(&v14, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v8, v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (WFNumberStringSubstitutableState)initWithValue:(id)a3
{
  id v4;
  void *v5;
  WFNumberStringSubstitutableState *v6;
  WFNumberStringSubstitutableState *v7;
  WFNumberStringSubstitutableState *v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
    v4 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFNumberStringSubstitutableState;
  v6 = -[WFVariableSubstitutableParameterState initWithValue:](&v10, sel_initWithValue_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_legacyNumber, v4);
    v8 = v7;
  }

  return v7;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  objc_super v6;

  -[WFNumberStringSubstitutableState legacyNumber](self, "legacyNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFNumberStringSubstitutableState legacyNumber](self, "legacyNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFNumberStringSubstitutableState;
    -[WFVariableSubstitutableParameterState serializedRepresentation](&v6, sel_serializedRepresentation);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSDecimalNumber)decimalNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setNumberStyle:", 1);
    objc_msgSend(v3, "setUsesGroupingSeparator:", 0);
    objc_msgSend(v3, "setGeneratesDecimalNumbers:", 1);
    objc_msgSend(v3, "numberFromString:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v2, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "numberFromString:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if ((v8 & 1) != 0)
      v9 = 0;
    else
      v9 = v4;

  }
  else
  {
    v9 = 0;
  }

  return (NSDecimalNumber *)v9;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  int v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)WFNumberStringSubstitutableState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v19, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    -[WFNumberStringSubstitutableState legacyNumber](self, "legacyNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3598];
      -[WFNumberStringSubstitutableState legacyNumber](self, "legacyNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "decimalValue");
      }
      else
      {
        v17[0] = 0;
        v17[1] = 0;
        v18 = 0;
      }
      objc_msgSend(v13, "decimalNumberWithDecimal:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v16, 0);

    }
    else
    {
      -[WFNumberStringSubstitutableState decimalNumber](self, "decimalNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v15, 0);
    }

  }
}

- (NSNumber)legacyNumber
{
  return self->_legacyNumber;
}

- (void)setLegacyNumber:(id)a3
{
  objc_storeStrong((id *)&self->_legacyNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNumber, 0);
}

@end
