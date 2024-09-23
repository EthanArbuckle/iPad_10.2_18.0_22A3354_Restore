@implementation WFArraySubstitutableParameterState

- (WFArraySubstitutableParameterState)initWithValues:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFArraySubstitutableParameterState *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFArraySubstitutableParameterState initWithValues:identity:](self, "initWithValues:identity:", v5, v6);

  return v7;
}

- (WFArraySubstitutableParameterState)initWithValues:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFArraySubstitutableParameterState *v10;
  WFArraySubstitutableParameterState *v11;
  WFArraySubstitutableParameterState *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFArraySubstitutableParameterState.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFArraySubstitutableParameterState.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFArraySubstitutableParameterState;
  v10 = -[WFVariableSubstitutableParameterState initWithValue:](&v16, sel_initWithValue_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identity, a4);
    v12 = v11;
  }

  return v11;
}

- (WFArraySubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *v16;
  NSUUID *identity;
  WFArraySubstitutableParameterState *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFDeserializedVariableObject(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "values");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[WFArraySubstitutableParameterState initWithValues:](self, "initWithValues:", v12);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "representsSingleContentVariable"))
      {
        objc_msgSend(v11, "stringsAndVariables");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v14);

      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "valueFromSerializedRepresentation:variableProvider:parameter:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    self = -[WFVariableSubstitutableParameterState initWithValue:](self, "initWithValue:", v15);
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    identity = self->_identity;
    self->_identity = v16;

    v18 = self;
  }

  return self;
}

- (id)containedVariables
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v9.receiver = self;
  v9.super_class = (Class)WFArraySubstitutableParameterState;
  -[WFVariableSubstitutableParameterState containedVariables](&v9, sel_containedVariables);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[WFArraySubstitutableParameterState values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("@unionOfArrays.containedVariables"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  return v5;
}

- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a3;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke;
  v11[3] = &unk_1E7AF7128;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "getContentWithContext:completionHandler:", v8, v11);

}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFArraySubstitutableParameterState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v14, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    v12 = (void *)objc_opt_class();
    -[WFVariableSubstitutableParameterState value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processValues:context:processingClass:userInputRequiredHandler:valueHandler:processSingleVariableStringsAsContentItems:", v13, v8, objc_opt_class(), v9, v10, 0);

  }
}

- (NSUUID)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

void __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2;
  v5[3] = &unk_1E7AF7100;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "generateCollectionByCoercingToItemClasses:completionHandler:", v4, v5);

}

void __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_131_12343);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "string");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "dictionary");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v4 = 0;
          goto LABEL_9;
        }
      }
      objc_msgSend(v2, "number");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v4 = (void *)v3;
LABEL_9:

  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class();
  v11 = v7;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __99__WFArraySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke;
      v16[3] = &unk_1E7AF6E68;
      v17 = v8;
      v18 = v9;
      objc_msgSend(v11, "if_compactMap:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v17;
    }
    else
    {
      getWFGeneralLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "WFEnforceClass";
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = (id)objc_opt_class();
        v25 = 2114;
        v26 = v10;
        v14 = v24;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_12368);
}

id __72__WFArraySubstitutableParameterState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "valueType") && objc_msgSend(v2, "valueType") != 6)
    goto LABEL_6;
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "shouldSerializeAsPlainString"))
  {

LABEL_6:
    objc_msgSend(v2, "serializedRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v3, "variableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingVariables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v5;
}

WFPropertyListParameterValue *__99__WFArraySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFPropertyListParameterValue *v4;
  WFPropertyListParameterValue *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[WFPropertyListParameterValue initWithString:]([WFPropertyListParameterValue alloc], "initWithString:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = -[WFPropertyListParameterValue initWithSerializedRepresentation:variableProvider:parameter:]([WFPropertyListParameterValue alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v5 = v4;
LABEL_7:

  return v5;
}

@end
