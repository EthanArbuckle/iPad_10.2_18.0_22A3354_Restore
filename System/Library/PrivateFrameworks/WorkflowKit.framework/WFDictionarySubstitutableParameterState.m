@implementation WFDictionarySubstitutableParameterState

- (WFDictionarySubstitutableParameterState)initWithKeyValuePairs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFDictionarySubstitutableParameterState *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFDictionarySubstitutableParameterState initWithKeyValuePairs:identity:](self, "initWithKeyValuePairs:identity:", v5, v6);

  return v7;
}

- (WFDictionarySubstitutableParameterState)initWithKeyValuePairs:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFDictionarySubstitutableParameterState *v10;
  WFDictionarySubstitutableParameterState *v11;
  WFDictionarySubstitutableParameterState *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDictionarySubstitutableParameterState.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyValuePairs"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDictionarySubstitutableParameterState.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFDictionarySubstitutableParameterState;
  v10 = -[WFVariableSubstitutableParameterState initWithValue:](&v16, sel_initWithValue_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identity, a4);
    v12 = v11;
  }

  return v11;
}

- (WFDictionarySubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
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
      objc_msgSend(v11, "keyValuePairs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[WFDictionarySubstitutableParameterState initWithKeyValuePairs:](self, "initWithKeyValuePairs:", v12);

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
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identity = self->_identity;
  self->_identity = v16;

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
  v9.super_class = (Class)WFDictionarySubstitutableParameterState;
  -[WFVariableSubstitutableParameterState containedVariables](&v9, sel_containedVariables);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[WFDictionarySubstitutableParameterState keyValuePairs](self, "keyValuePairs");
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
  v11[2] = __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke;
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
    v14.super_class = (Class)WFDictionarySubstitutableParameterState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v14, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    v12 = (void *)objc_opt_class();
    -[WFVariableSubstitutableParameterState value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processValues:context:processingClass:userInputRequiredHandler:valueHandler:", v13, v8, objc_opt_class(), v9, v10);

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

void __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2;
  v5[3] = &unk_1E7AF7100;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "generateCollectionByCoercingToItemClass:completionHandler:", v4, v5);

}

void __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v6);

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
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("Value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  WFEnforceClass(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", CFSTR("WFDictionaryFieldValueItems"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  WFEnforceClass(v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __104__WFDictionarySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke;
    v20[3] = &unk_1E7AF7098;
    v21 = v7;
    v22 = v8;
    objc_msgSend(v17, "if_compactMap:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "if_map:", &__block_literal_global_55605);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v9[0] = CFSTR("WFSerializationType");
  v9[1] = CFSTR("Value");
  v10[0] = CFSTR("WFDictionaryFieldValue");
  v7 = CFSTR("WFDictionaryFieldValueItems");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __77__WFDictionarySubstitutableParameterState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

WFDictionaryParameterKeyValuePair *__104__WFDictionarySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFDictionaryParameterKeyValuePair *v4;

  v3 = a2;
  v4 = -[WFDictionaryParameterKeyValuePair initWithSerializedRepresentation:variableProvider:parameter:]([WFDictionaryParameterKeyValuePair alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v4;
}

@end
