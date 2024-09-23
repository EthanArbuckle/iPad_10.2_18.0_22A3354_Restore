@implementation WFThingsTaskActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("128")) == 3)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("com.culturedcode.ThingsTouch.addtask"), v5);
  else
    HasActionsWithIdentifier = 0;

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
    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 0);
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)migrateWorkflow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  WFVariableString *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v22 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v6);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.culturedcode.ThingsTouch.addtask"));

        if (v10)
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("thingsDueDate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[WFThingsTaskActionMigration dateFormatter](self, "dateFormatter");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("thingsDueDate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringFromDate:", v16);
            v17 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("thingsDueDate"));
            goto LABEL_9;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("thingsDueDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();

          if ((v19 & 1) != 0)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("thingsDueDate"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            WFDeserializedVariableObject(v15, 0, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[WFVariableString initWithVariable:]([WFVariableString alloc], "initWithVariable:", v16);
              WFSerializedVariableObject(v17);
              v20 = v3;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("thingsDueDate"));

              v3 = v20;
LABEL_9:

            }
          }

        }
        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
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
