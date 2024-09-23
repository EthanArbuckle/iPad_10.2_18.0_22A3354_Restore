@implementation WFInputContentClassesMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("327")) == 3)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("WFWorkflowInputContentItemClasses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)addedContentItemClassesByVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E7B8B2F0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WFSafariWebPageContentItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = &unk_1E7B8B308;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WFArticleContentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = &unk_1E7B8B320;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("WFiTunesProductContentItem"), CFSTR("WFAppStoreAppContentItem"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = &unk_1E7B8B338;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WFFolderContentItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)migrateWorkflow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  -[WFWorkflowMigration workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFWorkflowInputContentItemClasses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "containsObject:", CFSTR("WFAudiovisualContentItem")))
  {
    objc_msgSend(v4, "removeObject:", CFSTR("WFAudiovisualContentItem"));
    objc_msgSend(v4, "addObject:", CFSTR("WFAVAssetContentItem"));
  }
  -[WFWorkflowMigration workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFWorkflowClientVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend((id)objc_opt_class(), "addedContentItemClassesByVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__WFInputContentClassesMigration_migrateWorkflow__block_invoke;
  v10[3] = &unk_1E7AEDD78;
  v11 = v4;
  v12 = v7;
  v9 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  -[WFWorkflowMigration finish](self, "finish");
}

void __49__WFInputContentClassesMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 < objc_msgSend(a2, "integerValue"))
  {
    +[WFWorkflow supportedInputClassNames](WFWorkflow, "supportedInputClassNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "removeObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToSet:", v9);

    if (v16)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v23;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v23 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), (_QWORD)v22);
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v19);
      }

    }
  }

}

@end
