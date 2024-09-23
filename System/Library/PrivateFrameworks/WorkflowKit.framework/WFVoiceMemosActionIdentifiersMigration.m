@implementation WFVoiceMemosActionIdentifiersMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1200")) & 1) != 0)
  {
    if ((WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.VoiceMemos.PlayRecording"), v5) & 1) != 0)
      HasActionsWithIdentifier = 1;
    else
      HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("com.apple.VoiceMemos.CreateRecording"), v5);
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
  void *v15;
  const __CFString *v16;
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
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.VoiceMemos.PlayRecording")))
        {
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.VoiceMemos.PlaybackVoiceMemoIntent"), v11);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppIntentDescriptor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = CFSTR("PlaybackVoiceMemoIntent");
        }
        else
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.VoiceMemos.CreateRecording")))
            goto LABEL_11;
          -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.VoiceMemos.RecordVoiceMemoIntent"), v17);

          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppIntentDescriptor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = CFSTR("RecordVoiceMemoIntent");
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("AppIntentIdentifier"));

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
