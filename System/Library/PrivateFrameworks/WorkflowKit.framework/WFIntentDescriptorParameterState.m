@implementation WFIntentDescriptorParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  WFLocalizedString(CFSTR("Select an app"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableSubstitutableParameterState value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "requiresUserConfirmation");

  if (v13)
    goto LABEL_7;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v17.receiver = self;
    v17.super_class = (Class)WFIntentDescriptorParameterState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v17, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
    goto LABEL_9;
  }
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_7:
    v9[2](v9, v11, 0);
    goto LABEL_9;
  }
  objc_msgSend(v15, "prompt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v16, 0);

LABEL_9:
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v5;
  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315906;
      v15 = "WFEnforceClass";
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v6;
      v12 = v19;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v14, 0x2Au);

    }
    goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithSerializedRepresentation:", v7);
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedIntentMatchingDescriptor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v10;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAppDescriptorParameterState.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[INIntentDescriptor class]]"));

  }
  v6 = v5;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "serializedRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
