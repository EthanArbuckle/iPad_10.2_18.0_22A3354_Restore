@implementation WFHomeAreaPickerParameter

- (WFHomeAreaPickerParameter)initWithDefinition:(id)a3
{
  WFHomeAreaPickerParameter *v3;
  WFHomeAreaPickerParameter *v4;
  WFHomeAreaPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHomeAreaPickerParameter;
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
  v8[2] = __91__WFHomeAreaPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
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
  v7[2] = __97__WFHomeAreaPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v7[3] = &unk_1E7AF8F48;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "ensureHomesAreLoadedWithCompletionHandler:", v7);

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a4;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areaType");

  if (v6)
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "areaType") == 2)
    {

    }
    else
    {
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "areaType");

      if (v12 != 1)
      {
        v13 = 0;
        goto LABEL_8;
      }
    }
    v8 = objc_alloc(MEMORY[0x1E0DC7DB0]);
    objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("square.split.bottomrightquarter");
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0DC7DB0]);
    objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("house");
  }
  v13 = (void *)objc_msgSend(v8, "initWithSymbolName:background:", v10, v9);

LABEL_8:
  return v13;
}

void __97__WFHomeAreaPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  WFHMHomeAreaSubstitutableState *v3;
  WFHMHomeAreaDescriptor *v4;
  WFHMHomeAreaSubstitutableState *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryHome");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v3 = [WFHMHomeAreaSubstitutableState alloc];
    v4 = -[WFHMHomeAreaDescriptor initWithHome:]([WFHMHomeAreaDescriptor alloc], "initWithHome:", v8);
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

void __91__WFHomeAreaPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  WFHMHomeAreaSubstitutableState *v12;
  WFHMHomeAreaDescriptor *v13;
  WFHMHomeAreaSubstitutableState *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  WFHMHomeAreaSubstitutableState *v21;
  WFHMHomeAreaDescriptor *v22;
  WFHMHomeAreaSubstitutableState *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  WFHMHomeAreaSubstitutableState *v30;
  WFHMHomeAreaDescriptor *v31;
  WFHMHomeAreaSubstitutableState *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99DE8];
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  getWFActionsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v59 = "-[WFHomeAreaPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
    v60 = 2048;
    v61 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEBUG, "%s Found %lu homes in WFHomeManager", buf, 0x16u);

  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v52;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(v8);
        v42 = v9;
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [WFHMHomeAreaSubstitutableState alloc];
        v13 = -[WFHMHomeAreaDescriptor initWithHome:]([WFHMHomeAreaDescriptor alloc], "initWithHome:", v10);
        v14 = -[WFVariableSubstitutableParameterState initWithValue:](v12, "initWithValue:", v13);
        objc_msgSend(v11, "addObject:", v14);

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v10, "zones");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v48 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              v21 = [WFHMHomeAreaSubstitutableState alloc];
              v22 = -[WFHMHomeAreaDescriptor initWithZone:inHome:]([WFHMHomeAreaDescriptor alloc], "initWithZone:inHome:", v20, v10);
              v23 = -[WFVariableSubstitutableParameterState initWithValue:](v21, "initWithValue:", v22);
              objc_msgSend(v11, "addObject:", v23);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v17);
        }

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v10, "rooms");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v44 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              v30 = [WFHMHomeAreaSubstitutableState alloc];
              v31 = -[WFHMHomeAreaDescriptor initWithRoom:inHome:]([WFHMHomeAreaDescriptor alloc], "initWithRoom:inHome:", v29, v10);
              v32 = -[WFVariableSubstitutableParameterState initWithValue:](v30, "initWithValue:", v31);
              objc_msgSend(v11, "addObject:", v32);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v26);
        }

        v33 = objc_alloc(MEMORY[0x1E0CBDA20]);
        objc_msgSend(v10, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v33, "initWithTitle:items:", v34, v11);

        objc_msgSend(v40, "addObject:", v35);
        v9 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v41);
  }

  v36 = *(_QWORD *)(a1 + 32);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithSections:", v40);
  (*(void (**)(uint64_t, void *, _QWORD))(v36 + 16))(v36, v37, 0);

}

@end
