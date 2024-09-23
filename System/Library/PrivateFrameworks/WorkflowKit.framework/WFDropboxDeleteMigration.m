@implementation WFDropboxDeleteMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("142")) == 3)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.dropbox.delete"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v29 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      v30 = v6;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey", v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.delete"));

        if (v12)
        {
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.dropbox.delete2"), v13);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)objc_opt_new();
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("WFDropboxFilePath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setValue:forKey:", v19, CFSTR("WFDropboxFilePath"));

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", CFSTR("WFDropboxShowPicker"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setValue:forKey:", v22, CFSTR("WFDropboxShowPicker"));

          objc_msgSend(v15, "removeObjectForKey:", CFSTR("WFDropboxFilePath"));
          objc_msgSend(v15, "removeObjectForKey:", CFSTR("WFDropboxShowPicker"));
          v23 = (void *)objc_opt_new();
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.dropbox.pick"), v24);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v16, v25);

          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("WFActionUUID"));

          -[WFWorkflowMigration actions](self, "actions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowMigration actions](self, "actions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "insertObject:atIndex:", v23, objc_msgSend(v28, "indexOfObject:", v9));

          v7 = v29;
          v6 = v30;
          objc_msgSend(v9, "removeObjectForKey:", CFSTR("WFActionUUID"));

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v6);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
