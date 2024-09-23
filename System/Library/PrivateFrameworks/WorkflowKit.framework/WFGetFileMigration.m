@implementation WFGetFileMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1106.1")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.documentpicker.open"), v5);
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
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[WFWorkflowMigration actions](self, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.documentpicker.open")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFFileStorageService"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = v13;
            else
              v14 = 0;
          }
          else
          {
            v14 = 0;
          }
          v15 = v14;

          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Dropbox"));
          if (v16)
          {
            -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", CFSTR("is.workflow.actions.dropbox.open"), v17);
LABEL_21:

            objc_msgSend(v12, "removeObjectForKey:", CFSTR("WFFileStorageService"));
            goto LABEL_22;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFShowFilePicker"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (!objc_msgSend(v17, "BOOLValue"))
            {
              objc_msgSend(v12, "removeObjectForKey:", CFSTR("SelectMultiple"));
LABEL_20:
              objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WFGetFolderContents"));
              goto LABEL_21;
            }
          }
          else
          {

            v17 = 0;
          }
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", CFSTR("is.workflow.actions.file.select"), v18);

          goto LABEL_20;
        }
LABEL_22:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
