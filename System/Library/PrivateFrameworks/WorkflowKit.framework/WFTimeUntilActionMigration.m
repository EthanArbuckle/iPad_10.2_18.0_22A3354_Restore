@implementation WFTimeUntilActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.gettimebetweendates"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int isKindOfClass;
  WFCurrentDateVariable *v16;
  WFVariableStringParameterState *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v20 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.gettimebetweendates")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKey:", CFSTR("WFTimeUntilFromDate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFTimeUntilReferenceDate"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            if (!v14 || (isKindOfClass & 1) != 0)
            {
              if (v14
                && ((isKindOfClass ^ 1) & 1) == 0
                && objc_msgSend(v14, "isEqualToString:", CFSTR("Other")))
              {
                objc_msgSend(v12, "objectForKey:", CFSTR("WFTimeUntilCustomDate"));
                v16 = (WFCurrentDateVariable *)objc_claimAutoreleasedReturnValue();
                if (v16)
                  objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("WFTimeUntilFromDate"));
              }
              else
              {
                v16 = objc_alloc_init(WFCurrentDateVariable);
                v17 = -[WFVariableStringParameterState initWithVariable:]([WFVariableStringParameterState alloc], "initWithVariable:", v16);
                -[WFVariableStringParameterState serializedRepresentation](v17, "serializedRepresentation");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("WFTimeUntilFromDate"));

                v3 = v20;
              }

            }
            else
            {
              objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("WFTimeUntilFromDate"));
            }
            v25[0] = CFSTR("WFTimeUntilReferenceDate");
            v25[1] = CFSTR("WFTimeUntilCustomDate");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObjectsForKeys:", v19);

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
