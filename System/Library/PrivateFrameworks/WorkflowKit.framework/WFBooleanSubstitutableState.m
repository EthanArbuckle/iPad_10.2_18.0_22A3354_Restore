@implementation WFBooleanSubstitutableState

+ (Class)processingValueClass
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (WFBooleanSubstitutableState)initWithBoolValue:(BOOL)a3
{
  void *v4;
  WFBooleanSubstitutableState *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFNumberSubstitutableState initWithNumber:](self, "initWithNumber:", v4);

  return v5;
}

- (id)numberSubstitutableState
{
  void *v3;
  WFNumberSubstitutableState *v4;
  WFNumberSubstitutableState *v5;
  WFNumberSubstitutableState *v6;
  void *v7;

  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [WFNumberSubstitutableState alloc];
  v5 = v4;
  if (v3)
  {
    v6 = -[WFVariableSubstitutableParameterState initWithVariable:](v4, "initWithVariable:", v3);
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFVariableSubstitutableParameterState initWithValue:](v5, "initWithValue:", v7);

  }
  return v6;
}

- (WFBooleanSubstitutableState)initWithNumberSubstitutableState:(id)a3
{
  id v4;
  void *v5;
  WFBooleanSubstitutableState *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v5);
  }
  else
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFVariableSubstitutableParameterState initWithValue:](self, "initWithValue:", v7);

  }
  return v6;
}

@end
