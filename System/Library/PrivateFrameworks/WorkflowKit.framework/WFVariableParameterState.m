@implementation WFVariableParameterState

- (WFVariableParameterState)initWithVariable:(id)a3
{
  id v6;
  WFVariableParameterState *v7;
  WFVariableParameterState *v8;
  WFVariableParameterState *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableParameterState.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variable"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFVariableParameterState;
  v7 = -[WFVariableParameterState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_variable, a3);
    v9 = v8;
  }

  return v8;
}

- (WFVariableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  WFVariableParameterState *v14;
  NSObject *v15;
  id v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v8;
  if (!v12)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v18 = 136315906;
      v19 = "WFEnforceClass";
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v11;
      v16 = v23;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v18, 0x2Au);

    }
    goto LABEL_8;
  }
  WFDeserializedVariableObject(v12, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[WFVariableParameterState initWithVariable:](self, "initWithVariable:", v13);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

LABEL_11:
  return v14;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v2;
  void *v3;

  -[WFVariableParameterState variable](self, "variable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedVariableObject(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  WFVariableParameterState *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = (WFVariableParameterState *)a3;
  if (self == v5)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableParameterState variable](self, "variable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[WFVariableParameterState variable](v5, "variable"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[WFVariableParameterState variable](self, "variable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFVariableParameterState variable](v5, "variable");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v9 = 1;
      }

      goto LABEL_11;
    }
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFVariableParameterState variable](self, "variable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0xADFAF12DLL;

  return v3;
}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[WFVariableParameterState variable](self, "variable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v11, "prompt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12, 0);

  }
  else
  {

    -[WFVariableParameterState variable](self, "variable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__WFVariableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v14[3] = &unk_1E7AF7128;
    v15 = v10;
    objc_msgSend(v13, "getContentWithContext:completionHandler:", v8, v14);

    v11 = v15;
  }

}

- (WFVariable)variable
{
  return self->_variable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
}

uint64_t __85__WFVariableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
