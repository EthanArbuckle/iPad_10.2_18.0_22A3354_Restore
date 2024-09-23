@implementation WFUnitQuantityFieldParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("996")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.searchlocalbusinesses"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  WFUnitQuantityFieldParameterMigration *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  WFUnitQuantityFieldParameterMigration *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("is.workflow.actions.searchlocalbusinesses");
    v7 = *(_QWORD *)v25;
    v22 = v2;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", v6))
        {
          -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKey:", CFSTR("WFSearchRadius"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if (v14 && (isKindOfClass & 1) != 0)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFSearchRadius"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = CFSTR("Magnitude");
            v28[1] = CFSTR("Unit");
            v29[0] = v23;
            v29[1] = CFSTR("km");
            v30[0] = CFSTR("Value");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v30[1] = CFSTR("WFSerializationType");
            v31[0] = v16;
            v31[1] = CFSTR("WFQuantityFieldValue");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
            v17 = v7;
            v18 = v5;
            v19 = v6;
            v20 = v3;
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v2 = v22;
            objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("WFSearchRadius"));

            v3 = v20;
            v6 = v19;
            v5 = v18;
            v7 = v17;

          }
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](v2, "finish");
}

@end
