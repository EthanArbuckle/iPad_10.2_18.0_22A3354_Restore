@implementation WFCurrentDateActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("128")) == 3)
  {
    if ((WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.currentdate"), v5) & 1) != 0)
      HasActionsWithIdentifier = 1;
    else
      HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.date"), v5);
  }
  else
  {
    HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 1);
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t i;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v24 = *(_QWORD *)v26;
    v5 = CFSTR("WFDateActionDate");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        v7 = v5;
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.currentdate")) & 1) != 0)
          goto LABEL_7;
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.date")))
          goto LABEL_10;
        -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
LABEL_7:
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.date"), v11);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Current Date"), CFSTR("WFDateActionMode"));
        }
        else
        {
LABEL_10:
          v5 = v7;
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.date")))
            goto LABEL_14;
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Specified Date"), CFSTR("WFDateActionMode"));
          objc_msgSend(v13, "objectForKeyedSubscript:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[WFCurrentDateActionMigration dateFormatter](self, "dateFormatter");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v7);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringFromDate:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v7);

          }
        }

        v5 = v7;
LABEL_14:

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
