@implementation WFInputParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return WFCompareBundleVersions(a4, CFSTR("994")) & 1;
}

- (void)migrateWorkflow
{
  WFWorkflowFile *v3;
  void *v4;
  WFWorkflowFile *v5;
  void *v6;
  id v7;
  WFWorkflow *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  WFWorkflow *v31;
  void *v32;
  WFWorkflowFile *v33;
  _QWORD v34[4];
  id v35;
  WFInputParameterMigration *v36;
  WFWorkflow *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = [WFWorkflowFile alloc];
  -[WFWorkflowMigration workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFWorkflowFile initWithDictionary:name:performMigration:](v3, "initWithDictionary:name:performMigration:", v4, CFSTR("Migrating Workflow"), 0);

  v40 = 0;
  -[WFWorkflowFile recordRepresentationWithError:](v5, "recordRepresentationWithError:", &v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v40;
  if (v6)
  {
    v39 = v7;
    v8 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v6, 0, 0, 0, 0, &v39);
    v9 = v39;

    if (v8)
    {
      v30 = v9;
      v32 = v6;
      v33 = v5;
      v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      -[WFWorkflow actions](v8, "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __44__WFInputParameterMigration_migrateWorkflow__block_invoke;
      v34[3] = &unk_1E7AF9298;
      v12 = v11;
      v35 = v12;
      v36 = self;
      v31 = v8;
      v37 = v8;
      v29 = v10;
      v38 = v29;
      -[WFWorkflow performBatchOperation:](v37, "performBatchOperation:", v34);
      v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      if (objc_msgSend(v12, "count"))
      {
        v14 = 0;
        do
        {
          objc_msgSend(v12, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowMigration actions](self, "actions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v15, "UUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("UUID"));

          }
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("is.workflow.actions.getvariable")))
            objc_msgSend(v13, "addIndex:", v14);

          ++v14;
        }
        while (v14 < objc_msgSend(v12, "count"));
      }
      objc_msgSend(v13, "removeIndexes:", v29);
      if (objc_msgSend(v13, "count"))
      {
        -[WFWorkflowMigration actions](self, "actions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObjectsAtIndexes:", v13);

      }
      -[WFWorkflowMigration finish](self, "finish");

      v6 = v32;
      v5 = v33;
      v9 = v30;
      v8 = v31;
    }
    else
    {
      getWFWorkflowMigrationLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v9, "localizedDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v42 = "-[WFInputParameterMigration migrateWorkflow]";
        v43 = 2114;
        v44 = v28;
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s WFInputParameterMigration failed to open workflow with error: %{public}@", buf, 0x16u);

      }
      -[WFWorkflowMigration finish](self, "finish");
    }

    v7 = v9;
  }
  else
  {
    getWFWorkflowMigrationLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "-[WFInputParameterMigration migrateWorkflow]";
      v43 = 2114;
      v44 = v26;
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s WFInputParameterMigration failed to open record with error: %{public}@", buf, 0x16u);

    }
    -[WFWorkflowMigration finish](self, "finish");
  }

}

- (id)findActionProvidingInputToActionAtIndex:(unint64_t)a3 inWorkflow:(id)a4 reachedBeginning:(BOOL *)a5 inputActionIndex:(unint64_t *)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  WFInputMigrationUUIDProvider *v18;
  void *v19;

  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v7, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  objc_msgSend(v10, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  while (1)
  {
    v13 = (void *)MEMORY[0x1C3BB3598]();
    v14 = objc_msgSend(v10, "indexOfObject:", v11);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
    v15 = v14;
    if (!v14)
    {
      if (a5)
      {
        v16 = 0;
        *a5 = 1;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if ((objc_msgSend(v12, "containsObject:", v11) & 1) != 0)
      goto LABEL_13;
    objc_msgSend(v12, "addObject:", v11);
    objc_msgSend(v11, "inputSourceInWorkflow:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16
      || (v17 = objc_msgSend(v10, "indexOfObject:", v16), v17 == v15 - 1)
      && (objc_msgSend(v11, "legacyBehaviorIgnoresOutputFromAction:inWorkflow:", v16, v7) & 1) != 0)
    {

LABEL_13:
      v16 = 0;
      goto LABEL_14;
    }
    v18 = -[WFInputMigrationUUIDProvider initWithAction:atPosition:]([WFInputMigrationUUIDProvider alloc], "initWithAction:atPosition:", v16, v17);
    objc_msgSend(v16, "outputVariableWithVariableProvider:UUIDProvider:", v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      break;

    objc_autoreleasePoolPop(v13);
    v11 = v16;
  }
  if (a6)
    *a6 = v17;

LABEL_14:
  objc_autoreleasePoolPop(v13);

  return v16;
}

- (id)findGetVariableActionProvidingInputToActionAtIndex:(int64_t)a3 inWorkflow:(id)a4
{
  id v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = a3 - 1;
    objc_msgSend(v6, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("is.workflow.actions.getvariable"));

    if (v13)
    {
      v8 = v11;
    }
    else if (objc_msgSend(v11, "inputPassthrough"))
    {
      -[WFInputParameterMigration findActionProvidingInputToActionAtIndex:inWorkflow:reachedBeginning:inputActionIndex:](self, "findActionProvidingInputToActionAtIndex:inWorkflow:reachedBeginning:inputActionIndex:", v9, v7, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("is.workflow.actions.getvariable"));

      v8 = 0;
      if (v16)
        v8 = v14;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)recursivelyFindDictionaryWithKey:(id)a3 inObject:(id)a4 then:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFInputParameterMigration recursivelyFindDictionaryWithKey:inDictionary:then:](self, "recursivelyFindDictionaryWithKey:inDictionary:then:", v10, v8, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFInputParameterMigration recursivelyFindDictionaryWithKey:inArray:then:](self, "recursivelyFindDictionaryWithKey:inArray:then:", v10, v8, v9);
  }

}

- (void)recursivelyFindDictionaryWithKey:(id)a3 inDictionary:(id)a4 then:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  objc_msgSend(v9, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v10[2](v10, v9);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFInputParameterMigration recursivelyFindDictionaryWithKey:inObject:then:](self, "recursivelyFindDictionaryWithKey:inObject:then:", v8, v17, v10);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)recursivelyFindDictionaryWithKey:(id)a3 inArray:(id)a4 then:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v9);
        -[WFInputParameterMigration recursivelyFindDictionaryWithKey:inObject:then:](self, "recursivelyFindDictionaryWithKey:inObject:then:", v8, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v10);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)migrateLegacyInputVariablesInParameterDictionary:(id)a3 toVariable:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke;
  v8[3] = &unk_1E7AF0F58;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WFInputParameterMigration recursivelyFindDictionaryWithKey:inDictionary:then:](self, "recursivelyFindDictionaryWithKey:inDictionary:then:", CFSTR("WFSerializationType"), a3, v8);

}

void __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke_2;
  v4[3] = &unk_1E7AF0F30;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "recursivelyFindDictionaryWithKey:inDictionary:then:", CFSTR("Type"), a2, v4);

}

void __89__WFInputParameterMigration_migrateLegacyInputVariablesInParameterDictionary_toVariable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("Type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Input"));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "serializedRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v12 = 136315906;
        v13 = "WFEnforceClass";
        v14 = 2114;
        v15 = v8;
        v16 = 2114;
        v17 = (id)objc_opt_class();
        v18 = 2114;
        v19 = v7;
        v11 = v17;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v12, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    objc_msgSend(v3, "setDictionary:", v9);
  }

}

unint64_t __44__WFInputParameterMigration_migrateWorkflow__block_invoke(id *a1)
{
  id *v1;
  unint64_t result;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  objc_class *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFInputMigrationUUIDProvider *v16;
  WFInputMigrationUUIDProvider *v17;
  WFShortcutInputVariable *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  char *v38;
  id *v39;
  void *v40;
  objc_class *v41;
  int v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  char v55;
  _BYTE v56[128];
  uint64_t v57;

  v1 = a1;
  v57 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1[4], "count");
  if (result)
  {
    v3 = 0;
    v44 = *MEMORY[0x1E0DC8500];
    v38 = sel_initWithVariable_;
    v39 = v1;
    while (1)
    {
      v4 = (void *)MEMORY[0x1C3BB3598]();
      objc_msgSend(v1[4], "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("is.workflow.actions.conditional"));

      if (v7)
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = CFSTR("WFInput");
      }
      else
      {
        objc_msgSend(v5, "inputParameter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "keyForSerialization");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_msgSend(v10, "stateClass");

      }
      objc_msgSend(v1[5], "actions", v38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1[5], "actionParametersKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v12;
      objc_msgSend(v12, "objectForKey:", v13);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "inputPassthrough") && !v9)
      {
        objc_msgSend(v1[5], "findGetVariableActionProvidingInputToActionAtIndex:inWorkflow:", v3, v1[6]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v1[7], "addIndex:", objc_msgSend(v1[4], "indexOfObject:", v14));

      }
      v55 = 0;
      v54 = 0;
      objc_msgSend(v1[5], "findActionProvidingInputToActionAtIndex:inWorkflow:reachedBeginning:inputActionIndex:", v3, v1[6], &v55, &v54);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = [WFInputMigrationUUIDProvider alloc];
        v17 = -[WFInputMigrationUUIDProvider initWithAction:atPosition:](v16, "initWithAction:atPosition:", v15, v54);
        objc_msgSend(v15, "outputVariableWithVariableProvider:UUIDProvider:", v5, v17);
        v18 = (WFShortcutInputVariable *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }
      if (v55)
        break;
LABEL_21:
      if (v18)
      {
        v47 = v4;
        if (v9 && v8)
        {
          objc_msgSend(v49, "objectForKeyedSubscript:", v9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v5, "inputRequired") & 1) != 0)
          {
            if (!v23)
              goto LABEL_40;
LABEL_46:
            objc_msgSend(v1[5], "migrateLegacyInputVariablesInParameterDictionary:toVariable:", v49, v18);
            v4 = v47;
            goto LABEL_47;
          }
          v40 = v23;
          v41 = v8;
          v43 = v15;
          v46 = v9;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v5, "containedVariables");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v51;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v51 != v31)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "UUID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFVariable UUID](v18, "UUID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v33, "isEqualToString:", v34);

                if (v35)
                {

                  v1 = v39;
                  v9 = v46;
                  v15 = v43;
                  goto LABEL_46;
                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
              if (v30)
                continue;
              break;
            }
          }

          v1 = v39;
          v9 = v46;
          v8 = v41;
          v15 = v43;
          if (v40)
            goto LABEL_46;
LABEL_40:
          if (-[objc_class instancesRespondToSelector:](v8, "instancesRespondToSelector:", v38))
          {
            v36 = v15;
            v37 = (void *)objc_msgSend([v8 alloc], "initWithVariable:", v18);
            objc_msgSend(v37, "serializedRepresentation");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v36;
          }
          else
          {
            v24 = 0;
          }
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v24, v9);
        }
        else
        {
          objc_msgSend(v15, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("is.workflow.actions.getvariable"))
            && !objc_msgSend(v5, "inputPassthrough"))
          {
            objc_msgSend(v5, "inputTypes");
            v25 = v15;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");

            v15 = v25;
            if (v27)
              objc_msgSend(v1[7], "addIndex:", objc_msgSend(v1[4], "indexOfObject:", v25));
            goto LABEL_46;
          }
        }

        goto LABEL_46;
      }
LABEL_47:

      objc_autoreleasePoolPop(v4);
      ++v3;
      result = objc_msgSend(v1[4], "count");
      if (v3 >= result)
        return result;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1[6], "workflowTypes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "containsObject:", v44))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v1[6], "effectiveInputClasses");
      v45 = v9;
      v20 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputContentClasses");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v5, "canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:", v21, v22, 1);

      v4 = v20;
      v9 = v45;

      if (!v42)
        goto LABEL_21;
    }
    v19 = v18;
    v18 = -[WFShortcutInputVariable initWithVariableProvider:aggrandizements:]([WFShortcutInputVariable alloc], "initWithVariableProvider:aggrandizements:", v5, 0);
    goto LABEL_20;
  }
  return result;
}

@end
