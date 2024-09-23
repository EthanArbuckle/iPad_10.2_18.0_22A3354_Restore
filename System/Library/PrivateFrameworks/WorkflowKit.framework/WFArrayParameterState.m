@implementation WFArrayParameterState

- (WFArrayParameterState)initWithValues:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFArrayParameterState *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFArrayParameterState initWithValues:identity:](self, "initWithValues:identity:", v5, v6);

  return v7;
}

- (WFArrayParameterState)initWithValues:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFArrayParameterState *v10;
  uint64_t v11;
  NSArray *values;
  WFArrayParameterState *v13;
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFArrayParameterState.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFArrayParameterState.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFArrayParameterState;
  v10 = -[WFArrayParameterState init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    values = v10->_values;
    v10->_values = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_identity, a4);
    v13 = v10;
  }

  return v10;
}

- (WFArrayParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WFArrayParameterState *v14;
  uint64_t v16;
  uint64_t v17;
  WFPropertyListParameterValue *(*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __85__WFArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v19 = &unk_1E7AF6E68;
    v20 = v8;
    v21 = v9;
    objc_msgSend(v12, "if_compactMap:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFArrayParameterState initWithValues:](self, "initWithValues:", v13, v16, v17, v18, v19);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v2;
  void *v3;

  -[WFArrayParameterState values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_55298);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFArrayParameterState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFArrayParameterState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFArrayParameterState values](v4, "values");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArrayParameterState values](self, "values");
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

  -[WFArrayParameterState values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;

  -[WFArrayParameterState values](self, "values");
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
  -[WFArrayParameterState values](self, "values");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processValues:context:processingClass:userInputRequiredHandler:valueHandler:processSingleVariableStringsAsContentItems:", v12, v10, objc_opt_class(), v9, v8, 0);

}

- (NSArray)values
{
  return self->_values;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

id __49__WFArrayParameterState_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
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

WFPropertyListParameterValue *__85__WFArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
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

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (void)processValues:(id)a3 context:(id)a4 processingClass:(Class)a5 userInputRequiredHandler:(id)a6 valueHandler:(id)a7 processSingleVariableStringsAsContentItems:(BOOL)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
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
  _QWORD *v38;
  _QWORD *v39;
  BOOL v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[3];
  char v44;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__55398;
  v41[4] = __Block_byref_object_dispose__55399;
  v18 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke;
  v34[3] = &unk_1E7AF6F20;
  v40 = a8;
  v19 = v13;
  v35 = v19;
  v36 = v16;
  v37 = v17;
  v38 = v43;
  v39 = v41;
  v26[0] = v18;
  v20 = v12;
  v26[1] = 3221225472;
  v26[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_4;
  v26[3] = &unk_1E7AF6F48;
  v31 = v43;
  v21 = v14;
  v29 = v21;
  v32 = v41;
  v33 = a5;
  v22 = v37;
  v27 = v22;
  v23 = v15;
  v30 = v23;
  v24 = v36;
  v28 = v24;
  objc_msgSend(v20, "if_enumerateAsynchronouslyInSequence:completionHandler:", v34, v26);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v6 = a2;
  v7 = a4;
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_7;
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = v6;
  v11 = v8;
  v12 = v9;
  v13 = v7;
  if (objc_msgSend(v10, "valueType"))
  {
LABEL_6:

LABEL_7:
    v19 = *(_QWORD *)(a1 + 32);
    v20 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_2;
    v26[3] = &unk_1E7AF6ED0;
    v27 = v6;
    v28 = *(id *)(a1 + 48);
    v30 = *(_OWORD *)(a1 + 56);
    v29 = v7;
    v22[0] = v20;
    v22[1] = 3221225472;
    v22[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_3;
    v22[3] = &unk_1E7AF6EF8;
    v25 = v29;
    v23 = *(id *)(a1 + 40);
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v27, "processWithContext:userInputRequiredHandler:valueHandler:", v19, v26, v22);

    goto LABEL_8;
  }
  objc_msgSend(v10, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "variableString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "representsSingleContentVariable"))
  {

    goto LABEL_6;
  }
  objc_msgSend(v15, "variables");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __WFProcessStringValueVariableContent_block_invoke;
  v31[3] = &unk_1E7AF6F98;
  v32 = v12;
  v33 = v13;
  v17 = v13;
  v18 = v12;
  objc_msgSend(v16, "getContentWithContext:completionHandler:", v11, v31);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
LABEL_8:

}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v1 = *(_QWORD *)(a1 + 48);
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v3 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 80)), "initWithValues:", *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFPropertyListParameterValue *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[WFPropertyListParameterValue defaultStateForValueType:](WFPropertyListParameterValue, "defaultStateForValueType:", objc_msgSend(*(id *)(a1 + 32), "valueType"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v6;
  v7 = -[WFPropertyListParameterValue initWithType:state:]([WFPropertyListParameterValue alloc], "initWithType:state:", objc_msgSend(*(id *)(a1 + 32), "valueType"), v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  WFPropertyListParameterValue *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v4 = *(void **)(a1 + 40);
    v5 = -[WFPropertyListParameterValue initWithObject:]([WFPropertyListParameterValue alloc], "initWithObject:", v6);
    objc_msgSend(v4, "addObject:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
