@implementation WFDictionaryParameterState

- (WFDictionaryParameterState)initWithKeyValuePairs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFDictionaryParameterState *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFDictionaryParameterState initWithKeyValuePairs:identity:](self, "initWithKeyValuePairs:identity:", v5, v6);

  return v7;
}

- (WFDictionaryParameterState)initWithKeyValuePairs:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFDictionaryParameterState *v10;
  uint64_t v11;
  NSArray *keyValuePairs;
  WFDictionaryParameterState *v13;
  void *v15;
  void *v16;
  objc_super v17;

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
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDictionaryParameterState.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyValuePairs"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDictionaryParameterState.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFDictionaryParameterState;
  v10 = -[WFDictionaryParameterState init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    keyValuePairs = v10->_keyValuePairs;
    v10->_keyValuePairs = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_identity, a4);
    v13 = v10;
  }

  return v10;
}

- (WFDictionaryParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  WFDictionaryParameterState *v20;
  uint64_t v22;
  uint64_t v23;
  WFDictionaryParameterKeyValuePair *(*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", CFSTR("Value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKey:", CFSTR("WFDictionaryFieldValueItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  WFEnforceClass(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __90__WFDictionaryParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v25 = &unk_1E7AF7098;
    v26 = v8;
    v27 = v9;
    objc_msgSend(v18, "if_compactMap:", &v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFDictionaryParameterState initWithKeyValuePairs:](self, "initWithKeyValuePairs:", v19, v22, v23, v24, v25);

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[WFDictionaryParameterState keyValuePairs](self, "keyValuePairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_9295);
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

  return (WFPropertyListObject *)v5;
}

- (BOOL)isEqual:(id)a3
{
  WFDictionaryParameterState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFDictionaryParameterState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFDictionaryParameterState keyValuePairs](v4, "keyValuePairs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDictionaryParameterState keyValuePairs](self, "keyValuePairs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToArray:", v6);

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

  -[WFDictionaryParameterState keyValuePairs](self, "keyValuePairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;

  -[WFDictionaryParameterState keyValuePairs](self, "keyValuePairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("@unionOfArrays.containedVariables"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  -[WFDictionaryParameterState keyValuePairs](self, "keyValuePairs");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processValues:context:processingClass:userInputRequiredHandler:valueHandler:", v12, v10, objc_opt_class(), v9, v8);

}

- (NSArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
}

uint64_t __54__WFDictionaryParameterState_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

WFDictionaryParameterKeyValuePair *__90__WFDictionaryParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFDictionaryParameterKeyValuePair *v4;

  v3 = a2;
  v4 = -[WFDictionaryParameterKeyValuePair initWithSerializedRepresentation:variableProvider:parameter:]([WFDictionaryParameterKeyValuePair alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (void)processValues:(id)a3 context:(id)a4 processingClass:(Class)a5 userInputRequiredHandler:(id)a6 valueHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  Class v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[3];
  char v44;

  v23 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__9378;
  v41[4] = __Block_byref_object_dispose__9379;
  v42 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke;
  v34[3] = &unk_1E7AED0D0;
  v35 = v13;
  v36 = v14;
  v37 = v15;
  v39 = v43;
  v40 = v41;
  v17 = v10;
  v38 = v17;
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_4;
  v25[3] = &unk_1E7AED0F8;
  v31 = v43;
  v18 = v11;
  v29 = v18;
  v32 = v41;
  v33 = a5;
  v19 = v37;
  v26 = v19;
  v20 = v36;
  v27 = v20;
  v21 = v35;
  v28 = v21;
  v22 = v12;
  v30 = v22;
  objc_msgSend(v23, "if_enumerateAsynchronouslyInSequence:completionHandler:", v34, v25);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;

  v6 = a2;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_2;
  v18[3] = &unk_1E7AED080;
  v23 = v7;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v21 = v6;
  v22 = *(id *)(a1 + 48);
  v24 = *(_OWORD *)(a1 + 64);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_3;
  v13[3] = &unk_1E7AED0A8;
  v14 = v21;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v17 = *(_OWORD *)(a1 + 64);
  v15 = v10;
  v16 = v23;
  v11 = v23;
  v12 = v21;
  objc_msgSend(v12, "getProcessedPair:context:userInputRequiredHandler:", v18, v9, v13);

}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v6 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 88)), "initWithKeyValuePairs:", *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14028]), "initWithObjects:forKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v6, v7);
  }

}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  WFVariableString *v11;
  WFPropertyListParameterValue *v12;
  WFPropertyListParameterValue *v13;
  WFPropertyListParameterValue *v14;
  WFPropertyListParameterValue *v15;
  void *v16;
  WFDictionaryParameterKeyValuePair *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a5;
  if (v18 && v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v11 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v18);
    v12 = -[WFPropertyListParameterValue initWithObject:]([WFPropertyListParameterValue alloc], "initWithObject:", v9);
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "value");
      v14 = (WFPropertyListParameterValue *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v16 = *(void **)(a1 + 56);
    v17 = -[WFDictionaryParameterKeyValuePair initWithKey:value:]([WFDictionaryParameterKeyValuePair alloc], "initWithKey:value:", v11, v15);
    objc_msgSend(v16, "addObject:", v17);

    if (a4 != -1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a5);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  WFVariableString *v9;
  void *v10;
  WFPropertyListParameterValue *v11;
  void *v12;
  WFPropertyListParameterValue *v13;
  void *v14;
  WFDictionaryParameterKeyValuePair *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v19 = a4;
  v8 = a2;
  v9 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v8);

  if (!v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFPropertyListParameterValue defaultStateForValueType:](WFPropertyListParameterValue, "defaultStateForValueType:", objc_msgSend(v10, "valueType"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = [WFPropertyListParameterValue alloc];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFPropertyListParameterValue initWithType:state:](v11, "initWithType:state:", objc_msgSend(v12, "valueType"), v19);

  v14 = *(void **)(a1 + 40);
  v15 = -[WFDictionaryParameterKeyValuePair initWithKey:value:]([WFDictionaryParameterKeyValuePair alloc], "initWithKey:value:", v9, v13);
  objc_msgSend(v14, "addObject:", v15);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v7;
  v18 = v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
