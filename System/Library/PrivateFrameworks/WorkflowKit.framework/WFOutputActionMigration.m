@implementation WFOutputActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1123")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.exit"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  WFOutputActionMigration *v2;
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
  WFVariableParameterState *v15;
  WFVariableString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  WFOutputActionMigration *v22;
  void *v23;
  void *v24;
  WFVariableStringParameterState *v25;
  WFVariableString *v26;
  uint64_t v27;
  uint64_t v28;
  WFVariableParameterState *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  const __CFString *v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("is.workflow.actions.exit");
    v7 = *(_QWORD *)v31;
    v24 = v3;
    v27 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      v28 = v5;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey", v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", v6))
        {
          -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFResult"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = -[WFVariableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFVariableParameterState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v14, 0, 0);
            if (v15)
            {
              v29 = v15;
              v16 = [WFVariableString alloc];
              -[WFVariableParameterState variable](v29, "variable");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[WFVariableString initWithVariable:](v16, "initWithVariable:", v17);

              v25 = -[WFVariableStringParameterState initWithVariableString:]([WFVariableStringParameterState alloc], "initWithVariableString:", v26);
              -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.output"), v18);

              v34 = CFSTR("WFOutput");
              -[WFVariableStringParameterState serializedRepresentation](v25, "serializedRepresentation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
              v20 = v6;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
              v22 = v2;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v23);

              v2 = v22;
              v6 = v20;

              v3 = v24;
              v15 = v29;
            }

          }
          v7 = v27;
          v5 = v28;
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](v2, "finish");
}

@end
