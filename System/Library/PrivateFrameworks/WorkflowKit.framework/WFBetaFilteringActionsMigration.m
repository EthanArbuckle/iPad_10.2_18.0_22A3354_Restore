@implementation WFBetaFilteringActionsMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a4;
  v5 = WFCompareBundleVersions(v4, CFSTR("121")) - 1;
  v6 = WFCompareBundleVersions(v4, CFSTR("123"));

  return v5 < 2 && v6 == 3;
}

+ (id)actionIdentifierMapping
{
  return &unk_1E7B8DEF0;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "actionIdentifierMapping");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v20 = v3;
        v4 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v3);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v19, "allKeys");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v22 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
              -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isEqualToString:", v10);

              if (v13)
              {
                objc_msgSend(v19, "objectForKeyedSubscript:", v10);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

                goto LABEL_16;
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_16:

        v3 = v20 + 1;
      }
      while (v20 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
