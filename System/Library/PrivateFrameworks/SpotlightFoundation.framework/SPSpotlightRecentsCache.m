@implementation SPSpotlightRecentsCache

+ (id)recentResultsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentResultsWithOptions:rankAndDeduplicate:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)updateApplicationContexts:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateRecentsWithBundleIdentifiers:", v3);

}

+ (id)recentResults
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("SPSpotlightRecentsCacheOptionMaxCountKey");
  v6[0] = &unk_1E6005DB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPSpotlightRecentsCache recentResultsWithOptions:](SPSpotlightRecentsCache, "recentResultsWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recentResultsWithOptions:(id)a3 rankAndDeduplicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentResultsWithOptions:rankAndDeduplicate:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)enumerateRecentResultsUsingBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateRecentResultsUsingBlock:", v3);

}

+ (void)enumerateRecentCompletionsWithSearchString:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateRecentCompletionsWithSearchString:usingBlock:", v6, v5);

}

+ (void)cacheResult:(id)a3 title:(id)a4 searchString:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheResult:title:searchString:", v9, v8, v7);

}

+ (void)cacheLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cacheLocalResult:identifier:bundleIdentifier:protectionClass:searchString:", v15, v14, v13, v12, v11);

}

+ (void)cachePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cachePerson:personQueryIdentifier:score:searchString:", v12, v11, v10, v9);

}

+ (void)cacheContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cacheContact:contactIdentifier:score:searchString:", v12, v11, v10, v9);

}

+ (void)cacheSuggestion:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cacheSuggestion:type:score:searchString:", v11, v7, v10, v9);

}

+ (void)deleteResult:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteResult:title:", v6, v5);

}

+ (void)deleteLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteLocalResult:identifier:bundleIdentifier:protectionClass:", v12, v11, v10, v9);

}

+ (void)deletePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deletePerson:personQueryIdentifier:score:", v9, v8, v7);

}

+ (void)deleteContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteContact:contactIdentifier:score:", v9, v8, v7);

}

+ (void)deleteSuggestion:(id)a3 type:(int)a4 score:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteSuggestion:type:score:", v8, v5, v7);

}

+ (void)deleteAllRecentResults
{
  id v2;

  +[SPCacheManager defaultManager](SPCacheManager, "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAllResults");

}

+ (BOOL)topic:(id)a3 isSameAsTopic:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_14;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v8) = 0;
  if (!v6 || (isKindOfClass & 1) == 0)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    LOBYTE(v8) = 0;
    goto LABEL_17;
  }
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  attributesForTopicIdentifier(v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  attributesForTopicIdentifier(v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v12;
  v8 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v14 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v13);
        if ((objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_16:

LABEL_17:
  return v8;
}

+ (id)filteredTopics:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char v19;
  void *v20;
  uint64_t v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      v22 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = 0;
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          attributesForTopicIdentifier(v10, &v29);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v12 = v7;
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v13 = v11;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v26;
              while (2)
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v26 != v16)
                    objc_enumerationMutation(v13);
                  if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i)) & 1) != 0)
                  {

                    v7 = v12;
                    v6 = v22;
                    goto LABEL_22;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
                if (v15)
                  continue;
                break;
              }
            }

            v7 = v12;
            v6 = v22;
          }
          objc_msgSend(v24, "addObject:", v9);
          if (!v29)
            objc_msgSend(v4, "addObjectsFromArray:", v11);
LABEL_22:

        }
        else
        {
          objc_msgSend(v9, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v4, "containsObject:", v18);

          if ((v19 & 1) == 0)
          {
            objc_msgSend(v24, "addObject:", v9);
            objc_msgSend(v9, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v20);

          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  return v24;
}

+ (id)resultFromTopic:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    searchResultWithTopicIdentifier(v3, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
