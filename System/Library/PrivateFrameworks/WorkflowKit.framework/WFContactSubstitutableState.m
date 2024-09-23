@implementation WFContactSubstitutableState

- (WFContactSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  WFContactSubstitutableState *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  WFCommunicationMethod *communicationMethod;
  WFContactSubstitutableState *v17;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFContactSubstitutableState;
  v9 = -[WFVariableSubstitutableParameterState initWithSerializedRepresentation:variableProvider:parameter:](&v19, sel_initWithSerializedRepresentation_variableProvider_parameter_, v8, a4, a5);
  if (v9)
  {
    v10 = v8;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFCommunicationMethodValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13E60]), "initWithSerializedRepresentation:", v14);
          communicationMethod = v9->_communicationMethod;
          v9->_communicationMethod = (WFCommunicationMethod *)v15;

        }
      }
    }

    v17 = v9;
  }

  return v9;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)WFContactSubstitutableState;
  -[WFVariableSubstitutableParameterState serializedRepresentation](&v15, sel_serializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
    goto LABEL_11;
  }
  -[WFContactSubstitutableState communicationMethod](self, "communicationMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_11:
    v13 = v3;
    goto LABEL_12;
  }
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  v16 = CFSTR("WFCommunicationMethodValue");
  -[WFContactSubstitutableState communicationMethod](self, "communicationMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serializedRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_dictionaryByAddingEntriesFromDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("Value"));

  v13 = (id)objc_msgSend(v8, "copy");
LABEL_12:

  return v13;
}

- (WFContactSubstitutableState)initWithValue:(id)a3
{
  void *v4;
  WFContactSubstitutableState *v5;
  objc_super v7;

  objc_msgSend(a3, "if_map:", &__block_literal_global_125_64662);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)WFContactSubstitutableState;
  v5 = -[WFMultipleValueParameterState initWithValue:](&v7, sel_initWithValue_, v4);

  return v5;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__WFContactSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v12[3] = &unk_1E7AF97E0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[WFContactSubstitutableState processIntoEntriesWithContext:userInputRequiredHandler:valueHandler:](self, "processIntoEntriesWithContext:userInputRequiredHandler:valueHandler:", v11, a4, v12);

}

- (void)processIntoEntriesWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

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
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v22[3] = &unk_1E7AF9A98;
      v24 = v10;
      v22[4] = self;
      v23 = v8;
      objc_msgSend(v14, "getContentWithContext:completionHandler:", v23, v22);

      v12 = v24;
    }

  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v20[3] = &unk_1E7AF9808;
    v20[4] = self;
    v21 = v8;
    objc_msgSend(v15, "if_map:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0D14060]);
    -[WFContactSubstitutableState communicationMethod](self, "communicationMethod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithEntries:attributionSet:communicationMethod:", v16, 0, v18);

    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v19, 0);
  }

}

- (id)processedEntriesFromCoercionResult:(id)a3 allowsCustomHandles:(BOOL)a4
{
  void *v6;
  void *v7;
  _QWORD v9[5];
  BOOL v10;

  objc_msgSend(a3, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__WFContactSubstitutableState_processedEntriesFromCoercionResult_allowsCustomHandles___block_invoke;
  v9[3] = &unk_1E7AF9830;
  v9[4] = self;
  v10 = a4;
  objc_msgSend(v6, "if_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)processContentCollection:(id)a3 context:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, void *);
  void *v23;
  WFContactSubstitutableState *v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[WFContactSubstitutableState valueItemClasses](self, "valueItemClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFContactSubstitutableState reinterpretsStringsAsContactHandlesFromVariable:](self, "reinterpretsStringsAsContactHandlesFromVariable:", 1))
  {
    objc_msgSend(v11, "arrayByAddingObject:", objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E0D13E58];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __77__WFContactSubstitutableState_processContentCollection_context_valueHandler___block_invoke;
  v23 = &unk_1E7AF9A70;
  v25 = v8;
  v26 = v9;
  v24 = self;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v13, "requestForCoercingToContentClasses:completionHandler:", v11, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D13E50];
  v27 = *MEMORY[0x1E0D14168];
  v28[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v20, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "optionsWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOptions:", v19);

  objc_msgSend(v10, "performCoercion:", v16);
}

- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3
{
  return 0;
}

- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4
{
  return 0;
}

- (id)valueItemClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WFCommunicationMethod)communicationMethod
{
  return self->_communicationMethod;
}

- (void)setCommunicationMethod:(id)a3
{
  objc_storeStrong((id *)&self->_communicationMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationMethod, 0);
}

void __77__WFContactSubstitutableState_processContentCollection_context_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v6 = a4;
  if (objc_msgSend(v21, "numberOfItems"))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "parameter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v11 = objc_msgSend(v10, "allowsCustomHandles");
    objc_msgSend(v7, "processedEntriesFromCoercionResult:allowsCustomHandles:", v21, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "parameter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isRangedSizeArray"))
    {
      v14 = objc_msgSend(v12, "count");
      v15 = objc_msgSend(*(id *)(a1 + 40), "maximumItemCount");

      if (v14 <= v15)
      {
LABEL_12:
        v17 = objc_alloc(MEMORY[0x1E0D14060]);
        objc_msgSend(v21, "attributionSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "communicationMethod");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v17, "initWithEntries:attributionSet:communicationMethod:", v12, v18, v19);

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "maximumItemCount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectsAtIndexes:", v13);
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v16;
    }

    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:

}

id __86__WFContactSubstitutableState_processedEntriesFromCoercionResult_allowsCustomHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringInterpretedAsContactHandle:allowsCustomHandles:", v5, *(unsigned __int8 *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc(MEMORY[0x1E0D13E78]);
      objc_msgSend(v3, "emailAddress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "initWithEmailAddress:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_alloc(MEMORY[0x1E0D13E78]);
        objc_msgSend(v3, "phoneNumber");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "initWithPhoneNumber:", v5);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = 0;
          goto LABEL_10;
        }
        v9 = objc_alloc(MEMORY[0x1E0D13E78]);
        objc_msgSend(v3, "contact");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "initWithContact:", v5);
      }
    }
  }
  v10 = (void *)v6;

LABEL_10:
  return v10;
}

void __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "numberOfItems"))
    objc_msgSend(*(id *)(a1 + 32), "processContentCollection:context:valueHandler:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(a2, "parameterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "reinterpretsStringsAsContactHandlesFromVariable:", 0)
    && objc_msgSend(v3, "type") == 3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "customHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "parameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
    v9 = v7;

    v10 = objc_msgSend(v9, "allowsCustomHandles");
    objc_msgSend(v4, "stringInterpretedAsContactHandle:allowsCustomHandles:", v5, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

void __88__WFContactSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "isInputParameter");
  v8 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v6, "contentCollection");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v10);

}

WFMultipleValueParameterStateEntry *__45__WFContactSubstitutableState_initWithValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  WFMultipleValueParameterStateEntry *v15;
  void *v16;
  void *v17;
  WFMultipleValueParameterStateEntry *v18;

  v2 = a2;
  objc_msgSend(v2, "parameterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type")
    || (objc_msgSend(v3, "contact"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    v18 = (WFMultipleValueParameterStateEntry *)v2;
  }
  else
  {
    objc_msgSend(v3, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "wfSerializedRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D13E68], "objectWithWFSerializedRepresentation:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_class();
      WFEnforceClass(v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = [WFMultipleValueParameterStateEntry alloc];
        objc_msgSend(v2, "identity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithContact:", v14);
        v18 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v15, "initWithIdentity:parameterState:", v16, v17);

      }
      else
      {
        v18 = (WFMultipleValueParameterStateEntry *)v2;
      }

    }
    else
    {
      v18 = (WFMultipleValueParameterStateEntry *)v2;
    }

  }
  return v18;
}

+ (id)processingValueClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
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
  objc_super v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("WFContactFieldValues"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      WFEnforceClass(v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v21.receiver = a1;
        v21.super_class = (Class)&OBJC_METACLASS___WFContactSubstitutableState;
        objc_msgSendSuper2(&v21, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v18, v8, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
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
  objc_msgSend(a3, "if_compactMap:", &__block_literal_global_64679);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v9[0] = CFSTR("WFSerializationType");
  v9[1] = CFSTR("Value");
  v10[0] = CFSTR("WFContactFieldValue");
  v7 = CFSTR("WFContactFieldValues");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__WFContactSubstitutableState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "parameterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
