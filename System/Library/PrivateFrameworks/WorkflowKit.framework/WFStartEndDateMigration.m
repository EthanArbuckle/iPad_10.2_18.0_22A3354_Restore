@implementation WFStartEndDateMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("128")) == 3)
  {
    if ((WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.getstartdate"), v5) & 1) != 0)
      HasActionsWithIdentifier = 1;
    else
      HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.getenddate"), v5);
  }
  else
  {
    HasActionsWithIdentifier = 0;
  }

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
  const __CFString *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WFWorkflowMigration actions](self, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.getstartdate")))
        {
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.properties.calendarevents"), v11);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v13;
          v15 = CFSTR("Start Date");
        }
        else
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.getenddate")))
            goto LABEL_11;
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.properties.calendarevents"), v16);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v13;
          v15 = CFSTR("End Date");
        }
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("WFContentItemPropertyName"));

LABEL_11:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
