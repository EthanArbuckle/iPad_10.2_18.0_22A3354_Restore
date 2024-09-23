@implementation WFHomePickerParameter

- (WFHomePickerParameter)initWithDefinition:(id)a3
{
  WFHomePickerParameter *v3;
  WFHomePickerParameter *v4;
  WFHomePickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHomePickerParameter;
  v3 = -[WFEnumerationParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a5;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__WFHomePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v8[3] = &unk_1E7AF8F48;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "ensureHomesAreLoadedWithCompletionHandler:", v8);

}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__WFHomePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v7[3] = &unk_1E7AF8F48;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "ensureHomesAreLoadedWithCompletionHandler:", v7);

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "homeWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __93__WFHomePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  WFStringSubstitutableState *v3;
  void *v4;
  WFStringSubstitutableState *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryHome");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v3 = [WFStringSubstitutableState alloc];
    WFSerializableHomeIdentifier(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFVariableSubstitutableParameterState initWithValue:](v3, "initWithValue:", v4);

    v6 = *(_QWORD *)(a1 + 32);
    -[WFVariableSubstitutableParameterState serializedRepresentation](v5, "serializedRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __87__WFHomePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WFStringSubstitutableState *v11;
  void *v12;
  WFStringSubstitutableState *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = [WFStringSubstitutableState alloc];
        WFSerializableHomeIdentifier(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[WFVariableSubstitutableParameterState initWithValue:](v11, "initWithValue:", v12);
        objc_msgSend(v3, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA20]), "initWithTitle:items:", 0, v3);
  objc_msgSend(v2, "addObject:", v14);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithSections:", v2);
  (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

}

@end
