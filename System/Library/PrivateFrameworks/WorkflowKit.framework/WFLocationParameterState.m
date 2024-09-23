@implementation WFLocationParameterState

- (WFLocationParameterState)initWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFLocationParameterState *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "legacyVariableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "representsSingleContentVariable"))
  {
    objc_msgSend(v6, "variables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFLocationParameterState;
    v9 = -[WFVariableSubstitutableParameterState initWithValue:](&v11, sel_initWithValue_, v4);
  }

  return v9;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v11, "prompt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12, 0);

  }
  else
  {

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v13[3] = &unk_1E7AF6F98;
    v15 = v10;
    v14 = v8;
    -[WFLocationParameterState getContentCollectionWithContext:completionHandler:](self, "getContentCollectionWithContext:completionHandler:", v14, v13);

    v11 = v15;
  }

}

- (void)getContentCollectionWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getContentWithContext:completionHandler:", v7, v6);

  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__WFLocationParameterState_getContentCollectionWithContext_completionHandler___block_invoke;
    v11[3] = &unk_1E7AEE8F8;
    v12 = v6;
    -[WFLocationParameterState getContentItemFromValue:withContext:completionHandler:](self, "getContentItemFromValue:withContext:completionHandler:", v10, v7, v11);

  }
}

- (void)getContentItemFromValue:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "parameter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "allowsCurrentLocation") || !objc_msgSend(v7, "isCurrentLocation"))
  {
    objc_msgSend(v7, "legacyVariableString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "legacyVariableString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke_2;
      v25[3] = &unk_1E7AEEDA8;
      v26 = v9;
      objc_msgSend(v18, "processWithContext:completionHandler:", v8, v25);

      v16 = v26;
      goto LABEL_7;
    }
    objc_msgSend(v7, "placemark");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0D13EC0];
      objc_msgSend(v7, "placemark");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "allowsTextOnlyLocations"))
        goto LABEL_14;
      objc_msgSend(v7, "locationName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_14;
      v20 = (void *)MEMORY[0x1E0D13EC0];
      objc_msgSend(v7, "locationName");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    objc_msgSend(v20, "itemWithObject:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v23, 0);
    goto LABEL_15;
  }
  if (objc_msgSend(v12, "skipsProcessingCurrentLocation"))
  {
LABEL_14:
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    goto LABEL_15;
  }
  v13 = objc_msgSend(v8, "environment");
  objc_msgSend(v12, "currentLocationAccuracy");
  v15 = v14;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke;
  v27[3] = &unk_1E7AEE920;
  v28 = v9;
  +[WFLocator determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:](WFLocator, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", v13, v27, v15);
  v16 = v28;
LABEL_7:

LABEL_15:
}

void __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = (void *)MEMORY[0x1E0D13FD8];
    objc_msgSend(MEMORY[0x1E0D13EE0], "locationLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemWithObject:origin:disclosureLevel:", v6, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __78__WFLocationParameterState_getContentCollectionWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0D13EA8];
    v9 = a2;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionWithItems:", v7, v9, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a3);
    v8 = 0;
  }

}

void __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    WFEnforceClass(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "allowsTextOnlyLocations"))
    {
      v11[0] = objc_opt_class();
      v11[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v9[3] = &unk_1E7AF7100;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "generateCollectionByCoercingToItemClasses:completionHandler:", v7, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  WFVariableString *v10;
  WFLocationValue *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFDeserializedVariableObject(v7, v8, v9);
    v10 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_7:
      v11 = -[WFLocationValue initWithSerializedRepresentation:variableProvider:parameter:]([WFLocationValue alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v7, v8, v9);
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v10 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v7);
  }
  v11 = -[WFLocationValue initWithLegacyVariableString:]([WFLocationValue alloc], "initWithLegacyVariableString:", v10);

LABEL_8:
  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "serializedRepresentation");
}

@end
