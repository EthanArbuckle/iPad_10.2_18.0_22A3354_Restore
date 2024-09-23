@implementation WFSetFlashlightMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("1050.8")) == 3)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.flashlight"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  WFSetFlashlightMigration *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  WFSetFlashlightMigration *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v2 = self;
  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("is.workflow.actions.flashlight");
    v7 = CFSTR("WFFlashlightSetting");
    v8 = *(_QWORD *)v31;
    v29 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      v28 = v5;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isEqualToString:", v6))
        {
          -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectForKeyedSubscript:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v15;
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("Off")))
            {
              objc_msgSend(v14, "setObject:forKey:", CFSTR("set"), CFSTR("operation"));
              v17 = v14;
              v18 = (const __CFString *)MEMORY[0x1E0C9AAA0];
              goto LABEL_15;
            }
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("On")))
            {
              objc_msgSend(v14, "setObject:forKey:", CFSTR("set"), CFSTR("operation"));
              v17 = v14;
              v18 = (const __CFString *)MEMORY[0x1E0C9AAB0];
LABEL_15:
              v25 = CFSTR("state");
LABEL_16:
              objc_msgSend(v17, "setObject:forKey:", v18, v25);
              objc_msgSend(v14, "removeObjectForKey:", v7);
            }
            else if (objc_msgSend(v16, "isEqualToString:", CFSTR("Toggle")))
            {
              v17 = v14;
              v18 = CFSTR("toggle");
              v25 = CFSTR("operation");
              goto LABEL_16;
            }
LABEL_17:

            v5 = v28;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v15;
              -[__CFString objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("WFSerializationType"));
              v19 = v2;
              v20 = v7;
              v21 = v6;
              v22 = v3;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqual:", CFSTR("WFTextTokenAttachment"));

              v3 = v22;
              v6 = v21;
              v7 = v20;
              v2 = v19;
              if (v24)
              {
                v17 = v14;
                v18 = v27;
                goto LABEL_15;
              }
              goto LABEL_17;
            }
          }

          v8 = v29;
        }

        ++v9;
      }
      while (v5 != v9);
      v26 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v5 = v26;
    }
    while (v26);
  }

  -[WFWorkflowMigration finish](v2, "finish");
}

@end
