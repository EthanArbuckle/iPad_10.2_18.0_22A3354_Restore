@implementation WFWorkflowParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFWorkflowParameterState.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFWorkflowParameterStateDescriptor class]]"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  +[MTLJSONAdapter JSONDictionaryFromModel:error:](WFPropertyListJSONAdapter, "JSONDictionaryFromModel:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  id v6;
  WFWorkflowParameterStateDescriptor *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  WFWorkflowParameterStateDescriptor *v12;
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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[WFWorkflowParameterStateDescriptor initWithWorkflowName:workflowIdentifier:isSelf:]([WFWorkflowParameterStateDescriptor alloc], "initWithWorkflowName:workflowIdentifier:isSelf:", v6, 0, 0);
  }
  else
  {
    v8 = objc_opt_class();
    v9 = v5;
    if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v14 = 136315906;
        v15 = "WFEnforceClass";
        v16 = 2114;
        v17 = v9;
        v18 = 2114;
        v19 = (id)objc_opt_class();
        v20 = 2114;
        v21 = v8;
        v11 = v19;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v14, 0x2Au);

      }
      v6 = 0;
    }
    else
    {
      v6 = v9;
    }

    if (!objc_msgSend(v6, "count"))
    {
      v12 = 0;
      goto LABEL_12;
    }
    +[MTLJSONAdapter modelOfClass:fromJSONDictionary:error:](WFPropertyListJSONAdapter, "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v6, 0);
    v7 = (WFWorkflowParameterStateDescriptor *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v7;
LABEL_12:

  return v12;
}

- (id)legacySerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workflowName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFVariableSubstitutableParameterState serializedRepresentation](self, "serializedRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v15[3] = &unk_1E7AF9A98;
      v17 = v10;
      v15[4] = self;
      v16 = v8;
      objc_msgSend(v14, "getContentWithContext:completionHandler:", v16, v15);

      v12 = v17;
    }
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowParameterState processValue:withContext:valueHandler:](self, "processValue:withContext:valueHandler:", v12, v8, v10);
  }

}

- (void)processValue:(id)a3 withContext:(id)a4 valueHandler:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void (**)(id, void *, _QWORD))a5;
  v8 = a3;
  objc_msgSend(a4, "parameter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchingWorkflowInDatabase:containingWorkflow:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v12, 0);
}

void __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "numberOfItems"))
  {
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v9[3] = &unk_1E7AF9A70;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "generateCollectionByCoercingToItemClasses:completionHandler:", v7, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __85__WFWorkflowParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  WFWorkflowParameterStateDescriptor *v14;
  WFWorkflowParameterStateDescriptor *v15;
  id v16;

  v16 = a4;
  objc_msgSend(a2, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v8)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v10)
  {
    if (v13)
    {
      objc_msgSend(v13, "string");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = -[WFWorkflowParameterStateDescriptor initWithWorkflowName:workflowIdentifier:isSelf:]([WFWorkflowParameterStateDescriptor alloc], "initWithWorkflowName:workflowIdentifier:isSelf:", v13, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "processValue:withContext:valueHandler:", v14, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      goto LABEL_12;
    }
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  objc_msgSend(v10, "workflowReference");
  v14 = (WFWorkflowParameterStateDescriptor *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFWorkflowParameterStateDescriptor initWithWorkflowReference:isSelf:]([WFWorkflowParameterStateDescriptor alloc], "initWithWorkflowReference:isSelf:", v14, 0);
  objc_msgSend(*(id *)(a1 + 32), "processValue:withContext:valueHandler:", v15, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

LABEL_12:
LABEL_14:

}

@end
