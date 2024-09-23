@implementation WFICAppPrefixMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)(WFCompareBundleVersions(a4, CFSTR("128")) - 1) >= 2)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v5, "objectForKey:", CFSTR("WFWorkflowActions"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectForKey:", CFSTR("WFWorkflowActionIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "hasPrefix:", CFSTR("com.tapbots.Tweetbot3")) & 1) != 0
            || (objc_msgSend(v12, "hasPrefix:", CFSTR("com.tapbots.TweetbotPad")) & 1) != 0
            || (objc_msgSend(v12, "hasPrefix:", CFSTR("com.flexibits.fantastical2.ipad")) & 1) != 0
            || (objc_msgSend(v12, "hasPrefix:", CFSTR("com.flexibits.fantastical2.iphone")) & 1) != 0)
          {

            v6 = 1;
            goto LABEL_17;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v6 = 0;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_17:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)migrateWorkflow
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[4];
  _QWORD v31[4];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v19 = v2;
        v3 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v2);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = CFSTR("com.tapbots.Tweetbot3");
        v30[1] = CFSTR("com.tapbots.TweetbotPad");
        v31[0] = CFSTR("com.tapbots.Tweetbot");
        v31[1] = CFSTR("com.tapbots.Tweetbot");
        v30[2] = CFSTR("com.flexibits.fantastical2.ipad");
        v30[3] = CFSTR("com.flexibits.fantastical2.iphone");
        v31[2] = CFSTR("com.flexibits.fantastical2");
        v31[3] = CFSTR("com.flexibits.fantastical2");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v6, "allKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
              if (objc_msgSend(v5, "hasPrefix:", v12))
              {
                objc_msgSend(v6, "objectForKey:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v12, v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

        v2 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v18);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
