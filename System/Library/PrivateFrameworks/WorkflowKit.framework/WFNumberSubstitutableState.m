@implementation WFNumberSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFNumberSubstitutableState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v13, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    -[WFNumberSubstitutableState number](self, "number");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12, 0);

  }
}

- (WFNumberSubstitutableState)initWithNumber:(id)a3
{
  void *v4;
  WFNumberSubstitutableState *v5;

  +[WFNumberWrapper wrapperWithNumber:](WFNumberWrapper, "wrapperWithNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFVariableSubstitutableParameterState initWithValue:](self, "initWithValue:", v4);

  return v5;
}

- (NSNumber)number
{
  void *v2;
  void *v3;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "number");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = objc_opt_class();
    v8 = v5;
    if (v8)
    {
      v9 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[WFNumberWrapper wrapperWithNumber:](WFNumberWrapper, "wrapperWithNumber:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v13 = 136315906;
        v14 = "WFEnforceClass";
        v15 = 2114;
        v16 = v9;
        v17 = 2114;
        v18 = (id)objc_opt_class();
        v19 = 2114;
        v20 = v7;
        v11 = v18;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);

      }
    }
    v6 = 0;
    goto LABEL_10;
  }
  +[WFNumberWrapper wrapperWithNumber:](WFNumberWrapper, "wrapperWithNumber:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v6;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFNumberSubstitutableState.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFNumberWrapper class]]"));

  }
  objc_msgSend(v5, "number");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_1E7AFA810;
  v8 = v6;

  return v8;
}

+ (id)serializedRepresentationFromNumber:(id)a3
{
  void *v4;
  void *v5;

  +[WFNumberWrapper wrapperWithNumber:](WFNumberWrapper, "wrapperWithNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serializedRepresentationFromValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
