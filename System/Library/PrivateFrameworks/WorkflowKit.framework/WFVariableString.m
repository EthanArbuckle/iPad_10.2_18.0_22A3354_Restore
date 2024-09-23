@implementation WFVariableString

- (WFVariableString)init
{
  return -[WFVariableString initWithStringsAndVariables:](self, "initWithStringsAndVariables:", MEMORY[0x1E0C9AA60]);
}

- (WFVariableString)initWithVariable:(id)a3
{
  id v5;
  void *v6;
  WFVariableString *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableString.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[variable isKindOfClass:[WFVariable class]]"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFVariableString initWithStringsAndVariables:](self, "initWithStringsAndVariables:", v6);

  return v7;
}

- (WFVariableString)initWithString:(id)a3
{
  id v5;
  void *v6;
  WFVariableString *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableString.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[string isKindOfClass:[NSString class]]"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFVariableString initWithStringsAndVariables:](self, "initWithStringsAndVariables:", v6);

  return v7;
}

- (WFVariableString)initWithStringsAndVariables:(id)a3
{
  id v5;
  WFVariableString *v6;
  uint64_t v7;
  NSArray *stringsAndVariables;
  WFVariableString *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableString.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[stringsAndVariables isKindOfClass:[NSArray class]]"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFVariableString;
  v6 = -[WFVariableString init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    stringsAndVariables = v6->_stringsAndVariables;
    v6->_stringsAndVariables = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  WFVariableString *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFVariableString *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariableString stringsAndVariables](v4, "stringsAndVariables");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

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

  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0xD1DEFC;

  return v3;
}

- (WFVariableString)initWithAttachmentCharacterString:(id)a3 variableGetter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  WFVariableString *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[4];
  __int16 v22;

  v6 = a3;
  v7 = a4;
  v22 = -4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = (void *)objc_opt_new();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__WFVariableString_initWithAttachmentCharacterString_variableGetter___block_invoke;
  v16[3] = &unk_1E7AEAEE0;
  v12 = v11;
  v17 = v12;
  v19 = v21;
  v20 = v10;
  v13 = v7;
  v18 = v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
  v14 = -[WFVariableString initWithStringsAndVariables:](self, "initWithStringsAndVariables:", v12);

  _Block_object_dispose(v21, 8);
  return v14;
}

- (WFVariableString)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  WFVariableString *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("string"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("attachmentsByRange"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__WFVariableString_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v15[3] = &unk_1E7AEAF08;
    v16 = v12;
    v17 = v8;
    v18 = v9;
    self = -[WFVariableString initWithAttachmentCharacterString:variableGetter:](self, "initWithAttachmentCharacterString:variableGetter:", v11, v15);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  const __CFString **v16;
  uint64_t v17;
  void *v18;
  __int16 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;
  NSRange v31;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "appendString:", v10);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "serializedRepresentation");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v31.location = objc_msgSend(v4, "length");
            v31.length = 1;
            NSStringFromRange(v31);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v11, v12);

            v20 = -4;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v20, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendString:", v13);

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
  {
    v27[0] = CFSTR("string");
    v27[1] = CFSTR("attachmentsByRange");
    v28[0] = v4;
    v28[1] = v3;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (void **)v28;
    v16 = (const __CFString **)v27;
    v17 = 2;
  }
  else
  {
    v25 = CFSTR("string");
    v26 = v4;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v26;
    v16 = &v25;
    v17 = 1;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v18;
}

- (void)processWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = -1;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__3036;
  v21[4] = __Block_byref_object_dispose__3037;
  v22 = 0;
  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__WFVariableString_processWithContext_completionHandler___block_invoke;
  v17[3] = &unk_1E7AEAF30;
  v19 = v23;
  v20 = v21;
  v18 = v6;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __57__WFVariableString_processWithContext_completionHandler___block_invoke_3;
  v12[3] = &unk_1E7AEAF58;
  v10 = v7;
  v14 = v10;
  v15 = v23;
  v11 = v18;
  v13 = v11;
  v16 = v21;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v17, v12);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

}

- (void)processIntoContentItemsWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke;
  v13[3] = &unk_1E7AEAF80;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke_2;
  v11[3] = &unk_1E7AF6C78;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v13, v11);

}

- (void)processIntoStringsAndAttachmentsWithContext:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke;
  v24[3] = &unk_1E7AEAFF8;
  v25 = v8;
  v26 = v11;
  v27 = v12;
  v28 = v9;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_5;
  v20[3] = &unk_1E7AF8350;
  v22 = v26;
  v23 = v10;
  v21 = v27;
  v15 = v26;
  v16 = v27;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  objc_msgSend(v13, "if_enumerateAsynchronouslyInSequence:completionHandler:", v24, v20);

}

- (NSString)stringByRemovingVariables
{
  void *v2;
  void *v3;
  void *v4;

  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_3021);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E7AFA810);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)stringByReplacingVariablesWithNames
{
  void *v2;
  void *v3;
  void *v4;

  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_146);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E7AFA810);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)variables
{
  return (NSArray *)-[WFVariableString variablesOfType:](self, "variablesOfType:", 0);
}

- (NSString)description
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
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v21.receiver = self;
  v21.super_class = (Class)WFVariableString;
  -[WFVariableString description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "appendString:", v11);
        }
        else
        {
          v12 = v11;
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("<%@: %p, name: %@>"), v14, v12, v15);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSArray)stringsAndVariables
{
  return self->_stringsAndVariables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsAndVariables, 0);
}

id __55__WFVariableString_stringByReplacingVariablesWithNames__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "nameIncludingPropertyName");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

uint64_t __45__WFVariableString_stringByRemovingVariables__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_2;
  v9[3] = &unk_1E7AF7F50;
  v10 = v7;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v14 = v6;
  v13 = *(id *)(a1 + 56);
  v8 = v6;
  objc_msgSend(a2, "wf_getContentItemsWithContext:completionHandler:", v10, v9);

}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13EA0], "attributionSetByMergingAttributionSets:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = a1;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:attributionSet:", v11, v4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addItem:", v12);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v5, "addItems:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(v13 + 48) + 16))();
  }
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WFVariableStringInferredContentTypeForItem(v7);

    if (!v8)
    {
      objc_msgSend(v5, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_3;
      v19[3] = &unk_1E7AEAFA8;
      v20 = *(id *)(a1 + 32);
      v21 = *(id *)(a1 + 40);
      v22 = *(id *)(a1 + 48);
      v23 = v5;
      v24 = *(id *)(a1 + 64);
      objc_msgSend(v13, "getObjectRepresentation:forClass:options:", v19, objc_opt_class(), *(_QWORD *)(a1 + 56));

      v12 = v20;
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WFVariableStringInferredContentTypeForItem(v9);

    if (v10 == 1)
    {
      objc_msgSend(v5, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_4;
      v14[3] = &unk_1E7AEAFD0;
      v15 = *(id *)(a1 + 40);
      v16 = *(id *)(a1 + 48);
      v17 = v5;
      v18 = *(id *)(a1 + 64);
      objc_msgSend(v11, "getObjectRepresentation:forClass:options:", v14, objc_opt_class(), *(_QWORD *)(a1 + 56));

      v12 = v15;
LABEL_10:

      goto LABEL_11;
    }
  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_11:

}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (!v17)
  {
    v13 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "stripsTTSHints"))
    goto LABEL_5;
  v10 = objc_msgSend(*(id *)(a1 + 32), "environment");

  if (v10 != 3)
  {
    objc_msgSend(MEMORY[0x1E0DC7DC0], "parseAnnotatedString:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayString");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = v17;
    v17 = (id)v12;
LABEL_5:

  }
  v13 = v17;
LABEL_8:
  v18 = v13;
  WFAppendStringToVariableContentConcatenatingStringsIfNecessary(*(void **)(a1 + 40), v13);
  v14 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributionSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a2, "wf_contentAsStringsAndAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          WFAppendStringToVariableContentConcatenatingStringsIfNecessary(*(void **)(a1 + 32), v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = *(void **)(a1 + 32);
            v22 = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributionSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_getContentItemsWithContext:completionHandler:", *(_QWORD *)(a1 + 32));
}

void __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __57__WFVariableString_processWithContext_completionHandler___block_invoke(uint64_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void (**v8)(id, id, _QWORD);
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, id, _QWORD);

  v7 = a2;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[2](v8, v7, 0);
  }
  else
  {
    v9 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
      objc_msgSend(v9, "prompt");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v8[2](v8, &stru_1E7AFA810, 0);
      v13 = v9;
    }
    else
    {

      v14 = objc_opt_class();
      v15 = a1[4];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__WFVariableString_processWithContext_completionHandler___block_invoke_2;
      v16[3] = &unk_1E7AEEF80;
      v18 = v8;
      v17 = (id)a1[4];
      objc_msgSend(v9, "getObjectRepresentationForClass:context:completionHandler:", v14, v15, v16);

      v13 = v18;
    }

  }
}

void __57__WFVariableString_processWithContext_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (!v5)
  {
    v6 = v14;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != -1)
    {
      objc_msgSend(v14, "subarrayWithRange:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "integerValue");

      v6 = v14;
    }
    objc_msgSend(v6, "componentsJoinedByString:", &stru_1E7AFA810);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "stripsTTSHints"))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "environment");

      if (v11 == 3)
      {
LABEL_9:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0DC7DC0], "parseAnnotatedString:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayString");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = v9;
      v9 = (void *)v13;
    }

    goto LABEL_9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_10:

}

void __57__WFVariableString_processWithContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(void);
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "addContentAttributionSet:", v10);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();

}

WFVariable *__80__WFVariableString_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(_QWORD *a1, NSRange range)
{
  void *v3;
  void *v4;
  void *v5;
  WFVariable *v6;
  NSRange v8;

  v3 = (void *)a1[4];
  v8.location = range.location;
  v8.length = 1;
  NSStringFromRange(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[WFVariable initWithSerializedRepresentation:variableProvider:parameter:]([WFVariable alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v5, a1[5], a1[6]);
  else
    v6 = 0;

  return v6;
}

void __69__WFVariableString_initWithAttachmentCharacterString_variableGetter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(v8, "length");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v6;
  }
  if (*(_QWORD *)(a1 + 56) - 1 != a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }

  }
}

- (id)variablesOfType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__WFVariableString_Convenience__variablesOfType___block_invoke;
  v9[3] = &unk_1E7AEB0A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)representsSingleContentVariable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[WFVariableString variables](self, "variables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFVariableString stringsAndVariables](self, "stringsAndVariables");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v4, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Ask")) ^ 1;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[WFVariableString variables](self, "variables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[WFVariableString stringByRemovingVariables](self, "stringByRemovingVariables");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") == 0;

  }
  return v4;
}

- (void)addVariableDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFVariableString variables](self, "variables", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addDelegate:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeVariableDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFVariableString variables](self, "variables", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeDelegate:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

uint64_t __49__WFVariableString_Convenience__variablesOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v3, "type");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
