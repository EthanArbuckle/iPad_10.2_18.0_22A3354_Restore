@implementation WFPodcastSearchMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.searchitunes"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  WFPodcastSearchMigration *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFPodcastSearchMigration *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id obj;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = self;
  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    v6 = CFSTR("is.workflow.actions.searchitunes");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[WFWorkflowMigration actionParametersKey](v2, "actionParametersKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", v6) & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFMediaType"));
          v13 = v10;
          v14 = v2;
          v15 = v4;
          v16 = v5;
          v17 = v6;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v18, "isEqualToString:", CFSTR("Podcasts"));

          v6 = v17;
          v5 = v16;
          v4 = v15;
          v2 = v14;
          v10 = v13;

          if (v21)
          {
            -[WFWorkflowMigration actionIdentifierKey](v2, "actionIdentifierKey");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.searchpodcasts"), v19);

            objc_msgSend(v10, "removeObjectForKey:", CFSTR("WFMediaType"));
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](v2, "finish");
}

@end
