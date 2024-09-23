@implementation WFCreateFolderMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1106")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.file.createfolder"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  id obj;
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
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isEqualToString:", CFSTR("is.workflow.actions.file.createfolder")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFFileStorageService"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v13 = v12;
            else
              v13 = 0;
          }
          else
          {
            v13 = 0;
          }
          v14 = v13;

          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Dropbox"));
          if (v15)
          {
            -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", CFSTR("is.workflow.actions.dropbox.createfolder"), v16);

          }
          objc_msgSend(v11, "removeObjectForKey:", CFSTR("WFFileStorageService"));

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
