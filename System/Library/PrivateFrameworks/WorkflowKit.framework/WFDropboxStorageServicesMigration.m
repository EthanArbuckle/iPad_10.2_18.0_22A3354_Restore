@implementation WFDropboxStorageServicesMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("is.workflow.actions.dropbox.append"), CFSTR("is.workflow.actions.dropbox.createfolder"), CFSTR("is.workflow.actions.dropbox.delete2"), CFSTR("is.workflow.actions.dropbox.getlink"), CFSTR("is.workflow.actions.dropbox.pick"), CFSTR("is.workflow.actions.dropbox.save"), 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "objectForKey:", CFSTR("WFWorkflowActions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKey:", CFSTR("WFWorkflowActionIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "containsObject:", v11);

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)migrationClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)migrateWorkflow
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", CFSTR("WFWorkflowActionIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.append")))
        {
          v9 = v7;
          v10 = CFSTR("is.workflow.actions.file.append");
          v11 = &unk_1E7B8DD88;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.createfolder")))
        {
          v9 = v7;
          v10 = CFSTR("is.workflow.actions.file.createfolder");
          v11 = &unk_1E7B8DDB0;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.delete2")))
        {
          v9 = v7;
          v10 = CFSTR("is.workflow.actions.file.delete");
          v11 = &unk_1E7B8DDD8;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.getlink")))
        {
          v9 = v7;
          v10 = CFSTR("is.workflow.actions.file.getlink");
          v11 = (void *)MEMORY[0x1E0C9AA70];
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.pick")))
        {
          v9 = v7;
          v10 = CFSTR("is.workflow.actions.documentpicker.open");
          v11 = &unk_1E7B8DE00;
        }
        else
        {
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.dropbox.save")))
            goto LABEL_19;
          v9 = v7;
          v10 = CFSTR("is.workflow.actions.documentpicker.save");
          v11 = &unk_1E7B8DE28;
        }
        WFMigrateDropboxAction(v9, (uint64_t)v10, v11);
LABEL_19:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
