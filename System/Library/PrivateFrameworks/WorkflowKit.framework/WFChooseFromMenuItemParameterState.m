@implementation WFChooseFromMenuItemParameterState

- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4 synonyms:(id)a5 subtitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  WFChooseFromMenuItemParameterState *v15;
  uint64_t v16;
  NSArray *synonyms;
  WFChooseFromMenuItemParameterState *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFChooseFromMenuItemParameterState.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("synonyms"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFChooseFromMenuItemParameterState.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtitle"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)WFChooseFromMenuItemParameterState;
  v15 = -[WFVariableStringParameterState initWithVariableString:userInputInsertionIndex:](&v22, sel_initWithVariableString_userInputInsertionIndex_, v11, a4);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    synonyms = v15->_synonyms;
    v15->_synonyms = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_subtitle, a6);
    v18 = v15;
  }

  return v15;
}

- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 synonyms:(id)a4 subtitle:(id)a5
{
  return -[WFChooseFromMenuItemParameterState initWithVariableString:userInputInsertionIndex:synonyms:subtitle:](self, "initWithVariableString:userInputInsertionIndex:synonyms:subtitle:", a3, -1, a4, a5);
}

- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4
{
  id v6;
  WFVariableString *v7;
  WFChooseFromMenuItemParameterState *v8;

  v6 = a3;
  v7 = objc_alloc_init(WFVariableString);
  v8 = -[WFChooseFromMenuItemParameterState initWithVariableString:userInputInsertionIndex:synonyms:subtitle:](self, "initWithVariableString:userInputInsertionIndex:synonyms:subtitle:", v6, a4, MEMORY[0x1E0C9AA60], v7);

  return v8;
}

- (WFChooseFromMenuItemParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFVariableString *v11;
  WFChooseFromMenuItemParameterState *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  WFVariableString *v22;
  uint64_t v23;
  uint64_t v24;
  WFChooseFromMenuItemSynonym *(*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (WFVariableString *)v8;
      WFDeserializedVariableObject(v11, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[WFVariableString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("Synonyms"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_class();
        WFEnforceClass(v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = MEMORY[0x1E0C809B0];
          v24 = 3221225472;
          v25 = __98__WFChooseFromMenuItemParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
          v26 = &unk_1E7AEEBC0;
          v27 = v9;
          v28 = v10;
          objc_msgSend(v16, "if_map:", &v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = (void *)MEMORY[0x1E0C9AA60];
        }
        -[WFVariableString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("Subtitle"), v23, v24, v25, v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_opt_class();
        WFEnforceClass(v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21
          || (v22 = -[WFVariableString initWithSerializedRepresentation:variableProvider:parameter:]([WFVariableString alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v21, v9, v10)) == 0)
        {
          v22 = objc_alloc_init(WFVariableString);
        }
        self = -[WFChooseFromMenuItemParameterState initWithVariableString:synonyms:subtitle:](self, "initWithVariableString:synonyms:subtitle:", v13, v17, v22);

        goto LABEL_3;
      }

    }
    v12 = 0;
    goto LABEL_10;
  }
  v11 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v8);
  self = -[WFVariableStringParameterState initWithVariableString:](self, "initWithVariableString:", v11);
LABEL_3:

  v12 = self;
LABEL_10:

  return v12;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  -[WFVariableStringParameterState variableString](self, "variableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedVariableObject(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[WFChooseFromMenuItemParameterState synonyms](self, "synonyms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[WFChooseFromMenuItemParameterState synonyms](self, "synonyms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "if_map:", &__block_literal_global_20067);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("Synonyms"));

  }
  -[WFChooseFromMenuItemParameterState subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEmpty");

  if ((v11 & 1) == 0)
  {
    -[WFChooseFromMenuItemParameterState subtitle](self, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serializedRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Subtitle"));

  }
  return v5;
}

- (BOOL)shouldSerializeAsPlainString
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFChooseFromMenuItemParameterState;
  if (!-[WFVariableStringParameterState shouldSerializeAsPlainString](&v7, sel_shouldSerializeAsPlainString))
    return 0;
  -[WFChooseFromMenuItemParameterState synonyms](self, "synonyms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[WFChooseFromMenuItemParameterState subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEmpty");

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WFChooseFromMenuItemParameterState *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (WFChooseFromMenuItemParameterState *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableStringParameterState variableString](v4, "variableString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariableStringParameterState variableString](self, "variableString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[WFChooseFromMenuItemParameterState synonyms](v4, "synonyms");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFChooseFromMenuItemParameterState synonyms](self, "synonyms");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v8))
        {
          -[WFChooseFromMenuItemParameterState subtitle](v4, "subtitle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFChooseFromMenuItemParameterState subtitle](self, "subtitle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFVariableStringParameterState variableString](self, "variableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFChooseFromMenuItemParameterState synonyms](self, "synonyms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[WFChooseFromMenuItemParameterState subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash") ^ 0x5068BE73;

  return v8;
}

- (id)containedVariables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[WFVariableStringParameterState variableString](self, "variableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "variables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFChooseFromMenuItemParameterState synonyms](self, "synonyms", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "synonym");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "variables");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[WFChooseFromMenuItemParameterState subtitle](self, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "variables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  return v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFVariableStringParameterState variableString](self, "variableString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableStringParameterState variableString](self, "variableString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v13[3] = &unk_1E7AEEC78;
    v15 = v9;
    v13[4] = self;
    v16 = v10;
    v14 = v8;
    objc_msgSend(v12, "processWithContext:completionHandler:", v14, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (WFVariableString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(id *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, void *);
  id v17;
  WFVariableString *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_msgSend(a1[4], "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v22[3] = &unk_1E7AEEC50;
    v13 = a1[5];
    v14 = a1[6];
    v15 = a1[4];
    v25 = v14;
    v22[4] = v15;
    v23 = v9;
    v26 = a1[7];
    v24 = a1[5];
    objc_msgSend(v12, "processWithContext:completionHandler:", v13, v22);

  }
  else if (a3 == -1)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v16 = (void (**)(id, id, void *))a1[6];
    v17 = objc_alloc((Class)objc_opt_class());
    v18 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", 0);
    objc_msgSend(a1[4], "synonyms");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "subtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithVariableString:userInputInsertionIndex:synonyms:subtitle:", v18, a3, v19, v20);
    v16[2](v16, v10, v21);

  }
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  WFVariableString *v16;
  void *v17;
  WFVariableString *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "synonyms");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
    v24[3] = &unk_1E7AEEC28;
    v25 = *(id *)(a1 + 48);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5;
    v20[3] = &unk_1E7AF7FC8;
    v21 = *(id *)(a1 + 40);
    v22 = v9;
    v23 = *(id *)(a1 + 64);
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v24, v20);

  }
  else if (a3 == -1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    v15 = objc_alloc((Class)objc_opt_class());
    v16 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "synonyms");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", 0);
    v19 = (void *)objc_msgSend(v15, "initWithVariableString:userInputInsertionIndex:synonyms:subtitle:", v16, a3, v17, v18);
    (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v10, v19);

  }
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a2, "synonym");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4;
  v10[3] = &unk_1E7AEEDA8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "processWithContext:completionHandler:", v8, v10);

}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFChooseFromMenuItem *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[WFChooseFromMenuItem initWithString:synonyms:subtitle:]([WFChooseFromMenuItem alloc], "initWithString:synonyms:subtitle:", a1[4], v6, a1[5]);

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __62__WFChooseFromMenuItemParameterState_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "synonym");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

WFChooseFromMenuItemSynonym *__98__WFChooseFromMenuItemParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFVariableString *v4;
  WFChooseFromMenuItemSynonym *v5;
  void *v6;
  WFChooseFromMenuItemSynonym *v7;

  v3 = a2;
  v4 = -[WFVariableString initWithSerializedRepresentation:variableProvider:parameter:]([WFVariableString alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v5 = [WFChooseFromMenuItemSynonym alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFChooseFromMenuItemSynonym initWithIdentity:synonym:](v5, "initWithIdentity:synonym:", v6, v4);

  return v7;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
