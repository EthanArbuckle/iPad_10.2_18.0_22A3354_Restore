@implementation WFBundledActionProvider

- (NSSet)identifiersOfActionsDisabledOnWatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)os_transaction_create();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1C3BB3598]();
  -[WFBundledActionProvider actionDefinitionsWithIdentifiers:](self, "actionDefinitionsWithIdentifiers:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__WFBundledActionProvider_DisabledOnWatch__identifiersOfActionsDisabledOnWatch__block_invoke;
  v9[3] = &unk_1E7AEA178;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_autoreleasePoolPop(v5);
  return (NSSet *)v7;
}

void __79__WFBundledActionProvider_DisabledOnWatch__identifiersOfActionsDisabledOnWatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(v5, "objectForKey:", CFSTR("DisabledOnPlatforms"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = objc_msgSend(v9, "containsObject:", CFSTR("Watch"));
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  objc_autoreleasePoolPop(v6);

}

- (id)actionDefinitionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  WFBundledActionProvider *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  id v29;
  id obj;
  id obja;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[WFActionDefinitionRegistry registeredDefinitions](WFActionDefinitionRegistry, "registeredDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = v6;
  v29 = v4;
  if (v4)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v8)
    {
      v9 = v8;
      v32 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v11);
          v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[WFActionProvider defaultActionDefinition](self, "defaultActionDefinition");
            v13 = v7;
            v14 = self;
            v15 = v5;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v12[2](v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "definitionByMergingWithDefinition:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v15;
            self = v14;
            v7 = v13;
            objc_msgSend(v13, "setObject:forKey:", v18, v11);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v9);
    }

    v4 = v29;
  }
  else
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60__WFBundledActionProvider_actionDefinitionsWithIdentifiers___block_invoke;
    v37[3] = &unk_1E7AF7378;
    v37[4] = self;
    v38 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v37);

  }
  WFActionSkipList();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    v28 = v19;
    obja = v5;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    WFActionSkipList();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          getWFActionRegistryLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[WFBundledActionProvider actionDefinitionsWithIdentifiers:]";
            v45 = 2114;
            v46 = v25;
            _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_INFO, "%s Skipping action with identifier: %{public}@", buf, 0x16u);
          }

          objc_msgSend(v7, "removeObjectForKey:", v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      }
      while (v22);
    }

    v4 = v29;
    v5 = obja;
    v19 = v28;
  }

  return v7;
}

- (id)availableActionIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[WFBundledActionProvider actionDefinitionsWithIdentifiers:](self, "actionDefinitionsWithIdentifiers:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (id)createActionWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 fallbackToMissing:(BOOL)a6 isForLocalization:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  WFMissingAction *v17;
  NSString *v18;
  objc_class *v19;
  id v20;
  void *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v7 = a7;
  v8 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  WFActionSkipList();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v12);

  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("ActionClass"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = NSClassFromString(v18);

    if (-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()))
    {
      v20 = [v19 alloc];
      -[WFActionProvider stringLocalizer](self, "stringLocalizer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (WFMissingAction *)objc_msgSend(v20, "initWithIdentifier:definition:serializedParameters:stringLocalizer:", v12, v13, v14, v21);

      if (v17)
        goto LABEL_14;
    }
    else if (-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()))
    {
      v17 = (WFMissingAction *)objc_msgSend([v19 alloc], "initWithIdentifier:definition:serializedParameters:", v12, v13, v14);
      if (v17)
        goto LABEL_14;
    }
    else
    {
      v17 = 0;
    }
    if (v8)
    {
      getWFActionRegistryLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315394;
        v25 = "-[WFBundledActionProvider createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isF"
              "orLocalization:]";
        v26 = 2114;
        v27 = v12;
        _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Action %{public}@ is missing", (uint8_t *)&v24, 0x16u);
      }

      v17 = -[WFAction initWithIdentifier:definition:serializedParameters:]([WFMissingAction alloc], "initWithIdentifier:definition:serializedParameters:", v12, v13, v14);
      -[WFMissingAction setIsForLocalization:](v17, "setIsForLocalization:", v7);
    }
  }
LABEL_14:

  return v17;
}

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "actionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v8);
  }

  v25 = v5;
  -[WFBundledActionProvider actionDefinitionsWithIdentifiers:](self, "actionDefinitionsWithIdentifiers:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getWFActionRegistryLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFBundledActionProvider createActionsForRequests:forceLocalActionsOnly:]";
    v38 = 2114;
    v39 = v14;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEFAULT, "%s Found actions: %{public}@", buf, 0x16u);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v20, "actionIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v20, "serializedParameters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFBundledActionProvider createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:](self, "createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:", v21, v22, v23, 1, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend(v20, "setResult:", v24);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }

}

- (id)createAllAvailableActions
{
  return -[WFBundledActionProvider createAllAvailableActionsIncludingMissingActions:](self, "createAllAvailableActionsIncludingMissingActions:", 0);
}

- (id)createAllAvailableActionsIncludingMissingActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[WFBundledActionProvider actionDefinitionsWithIdentifiers:](self, "actionDefinitionsWithIdentifiers:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFBundledActionProvider createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:](self, "createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:", v12, v13, 0, v3, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)createAllAvailableActionsForLocalization
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[WFBundledActionProvider actionDefinitionsWithIdentifiers:](self, "actionDefinitionsWithIdentifiers:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFBundledActionProvider createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:](self, "createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:", v10, v11, 0, 1, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

void __60__WFBundledActionProvider_actionDefinitionsWithIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "defaultActionDefinition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "definitionByMergingWithDefinition:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7);
}

@end
