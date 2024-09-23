@implementation WFConditionallyCompiledActionProvider

- (id)allActionDefinitionsByIdentifier
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)actionDefinitionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[WFConditionallyCompiledActionProvider allActionDefinitionsByIdentifier](self, "allActionDefinitionsByIdentifier", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[WFConditionallyCompiledActionProvider allActionDefinitionsByIdentifier](self, "allActionDefinitionsByIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v15, v11);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v4, "count", (_QWORD)v19))
  {
    v16 = v5;
  }
  else
  {
    -[WFConditionallyCompiledActionProvider allActionDefinitionsByIdentifier](self, "allActionDefinitionsByIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  return v17;
}

- (id)availableActionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[WFConditionallyCompiledActionProvider allActionDefinitionsByIdentifier](self, "allActionDefinitionsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)createActionsForRequests:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  WFAction *v25;
  void *v26;
  WFAction *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFConditionallyCompiledActionProvider allActionDefinitionsByIdentifier](self, "allActionDefinitionsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "actionIdentifier", v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v10);
    }

    -[WFConditionallyCompiledActionProvider actionDefinitionsWithIdentifiers:](self, "actionDefinitionsWithIdentifiers:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    getWFActionRegistryLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFConditionallyCompiledActionProvider createActionsForRequests:]";
      v41 = 2114;
      v42 = v16;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEFAULT, "%s Found conditionally compiled actions: %{public}@", buf, 0x16u);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v8;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v21, "actionIdentifier", v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v22);
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)v23;
            v25 = [WFAction alloc];
            objc_msgSend(v21, "serializedParameters");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[WFAction initWithIdentifier:definition:serializedParameters:](v25, "initWithIdentifier:definition:serializedParameters:", v22, v24, v26);

            if (!v27)
            {

              goto LABEL_23;
            }
            objc_msgSend(v21, "setResult:", v27);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_23:

    v4 = v28;
  }

}

@end
