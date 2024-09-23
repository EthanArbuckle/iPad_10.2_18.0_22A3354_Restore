@implementation WFBooksSydneyEActionIdentifiersMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1400")) & 1) != 0)
  {
    if ((WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooks.OpenRecentBookIntent"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooks.PlayRecentAudiobookIntent"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooksX.OpenRecentBookIntent"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooksX.PlayRecentAudiobookIntent"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooks.OpenBookIntent"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooks.PlayAudiobookIntent"), v5) & 1) != 0
      || (WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooksX.OpenBookIntent"), v5) & 1) != 0)
    {
      HasActionsWithIdentifier = 1;
    }
    else
    {
      HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.iBooksX.PlayAudiobookIntent"), v5);
    }
  }
  else
  {
    HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooks.OpenBookIntent")) & 1) != 0
          || (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooks.PlayAudiobookIntent")) & 1) != 0
          || (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooksX.OpenBookIntent")) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooksX.PlayAudiobookIntent")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("target"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("specific"), CFSTR("mode"));

          }
        }
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooks.OpenRecentBookIntent")) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooksX.OpenRecentBookIntent")))
        {
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.iBooks.OpenBookIntent"), v15);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AppIntentDescriptor"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          v20 = CFSTR("OpenBookIntent");
LABEL_15:
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("AppIntentIdentifier"));

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("AppIntentDescriptor"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("com.apple.iBooks"), CFSTR("BundleIdentifier"));

          goto LABEL_16;
        }
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooks.PlayRecentAudiobookIntent")) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.iBooksX.PlayRecentAudiobookIntent")))
        {
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.iBooks.PlayAudiobookIntent"), v24);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AppIntentDescriptor"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          v20 = CFSTR("PlayAudiobookIntent");
          goto LABEL_15;
        }
LABEL_16:

        ++v6;
      }
      while (v4 != v6);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v4 = v25;
    }
    while (v25);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
