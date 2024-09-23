@implementation SYItemIndexingManager

+ (void)fetchIdentifiersLinkedToUserActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SYItemIndexingManager_fetchIdentifiersLinkedToUserActivity_completion___block_invoke;
  v8[3] = &unk_1E757B5F8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:", a3, 0, v8);

}

+ (void)_fetchIndexedActivitiesWithActivityType:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[8];

  v34[7] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYItemIndexingManager.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYItemIndexingManager.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ == 1"), CFSTR("sy_isLinkItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    _escapedSearchString(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(" && (%@ == \"%@\")"), CFSTR("sy_activityType"), v11);

  }
  NSStringFromSelector(sel_URL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  NSStringFromSelector(sel_containerIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v13;
  NSStringFromSelector(sel_domainIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v14;
  v34[3] = CFSTR("sy_canonicalURL");
  v34[4] = CFSTR("sy_activityType");
  v34[5] = CFSTR("sy_activityPersistentID");
  v34[6] = CFSTR("sy_activityTargetContentID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v16, "setFetchAttributes:", v15);
  objc_msgSend(v16, "setReason:", CFSTR("System Paper Backlinks"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v10, v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setPrivateQuery:", 1);
  objc_msgSend(a1, "_coreSpotlightIndexBundleID");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
  {
    v33 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBundleIDs:", v20);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke;
  v31[3] = &unk_1E757B4D8;
  v23 = v21;
  v32 = v23;
  objc_msgSend(v17, "setFoundItemsHandler:", v31);
  v28[0] = v22;
  v28[1] = 3221225472;
  v28[2] = __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke_2;
  v28[3] = &unk_1E757BB90;
  v29 = v23;
  v30 = v9;
  v24 = v23;
  v25 = v9;
  objc_msgSend(v17, "setCompletionHandler:", v28);
  objc_msgSend(v17, "start");

}

+ (void)_fetchIndexedItemsLinkedToUserActivity:(id)a3 extraFetchAttributes:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  void (**v35)(_QWORD, _QWORD);
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[9];

  v41[7] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD, _QWORD))v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYItemIndexingManager.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYItemIndexingManager.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v13 = os_log_create("com.apple.synapse", "ItemIndexing");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[SYItemIndexingManager _fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:].cold.2((uint64_t)v9, v10, v13);

  if (SYIsLinkableUserActivity(v9))
  {
    objc_msgSend(a1, "_queryStringForMatchingUserActivityInfo:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_URL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v15;
    NSStringFromSelector(sel_containerIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v16;
    NSStringFromSelector(sel_domainIdentifier);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v17;
    v41[3] = CFSTR("sy_canonicalURL");
    v41[4] = CFSTR("sy_activityType");
    v41[5] = CFSTR("sy_activityPersistentID");
    v41[6] = CFSTR("sy_activityTargetContentID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v10);
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
    v20 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
    objc_msgSend(v20, "setFetchAttributes:", v18);
    objc_msgSend(v20, "setReason:", CFSTR("System Paper Backlinks"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v14, v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v21, "setPrivateQuery:", 1);
    v32 = (void *)v14;
    objc_msgSend(a1, "_coreSpotlightIndexBundleID");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
    {
      v40 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBundleIDs:", v24);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke;
    v36[3] = &unk_1E757C330;
    v37 = v9;
    v39 = a1;
    v27 = v25;
    v38 = v27;
    objc_msgSend(v21, "setFoundItemsHandler:", v36);
    v33[0] = v26;
    v33[1] = 3221225472;
    v33[2] = __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_116;
    v33[3] = &unk_1E757BB90;
    v34 = v27;
    v35 = v12;
    v28 = v27;
    objc_msgSend(v21, "setCompletionHandler:", v33);
    objc_msgSend(v21, "start");

  }
  else
  {
    v29 = os_log_create("com.apple.synapse", "ItemIndexing");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      +[SYItemIndexingManager _fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:].cold.1();

    v12[2](v12, MEMORY[0x1E0C9AA60]);
  }

}

+ (id)_coreSpotlightIndexBundleID
{
  void *v2;
  __CFString *v3;

  if (_SYUseLocalSearchIndex == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("com.apple.mobilenotes");
  }
  return v3;
}

+ (id)_queryStringForMatchingUserActivityInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ == 1"), CFSTR("sy_isLinkItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v3, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _escapedSearchString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "appendFormat:", CFSTR(" && (%@ == \"%@\" || %@ == \"\")"), CFSTR("sy_activityType"), v8, CFSTR("sy_activityType"));
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webpageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    _searchableDomainNameForURL(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL == \"*%@*\"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

  }
  objc_msgSend(v3, "canonicalURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    _searchableDomainNameForURL(v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"*%@*\"), CFSTR("sy_canonicalURL"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

  }
  objc_msgSend(v3, "persistentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    objc_msgSend(v3, "persistentIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _escapedSearchString(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), CFSTR("sy_activityPersistentID"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v24);

  }
  objc_msgSend(v3, "targetContentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v26)
  {
    objc_msgSend(v3, "targetContentIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _escapedSearchString(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), CFSTR("sy_activityTargetContentID"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v29);

  }
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" || "));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" && (%@)"), v30);

  v31 = (void *)objc_msgSend(v4, "copy");
  return v31;
}

void __73__SYItemIndexingManager_fetchIdentifiersLinkedToUserActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "attributeSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "domainIdentifier");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "attributeSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "containerIdentifier");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v13 = v10;
        else
          v13 = &stru_1E757CA18;
        if (v12)
          v14 = v12;
        else
          v14 = &stru_1E757CA18;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v16 = v12 == 0;
        else
          v16 = 1;
        if (!v16 && (objc_msgSend(v3, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v19, "addObject:", v10);
          objc_msgSend(v18, "addObject:", v12);
          objc_msgSend(v3, "addObject:", v15);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "ItemIndexing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_116_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__SYItemIndexingManager_fetchActivitiesWithActivityType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)fetchActivitiesWithActivityType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SYItemIndexingManager_fetchActivitiesWithActivityType_completion___block_invoke;
  v8[3] = &unk_1E757B5F8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_fetchIndexedActivitiesWithActivityType:completion:", a3, v8);

}

+ (id)_customKeyForKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _customKeyForKey__onceTokenCustomAttributeKeys;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_customKeyForKey__onceTokenCustomAttributeKeys, &__block_literal_global_9);
  objc_msgSend((id)_customKeyForKey___customAttributeKeys, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __42__SYItemIndexingManager__customKeyForKey___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("sy_isLinkItem");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("sy_isLinkItem"), 1, 0, 0, 0);
  v9[0] = v0;
  v8[1] = CFSTR("sy_activityType");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("sy_activityType"), 1, 0, 0, 0);
  v9[1] = v1;
  v8[2] = CFSTR("sy_canonicalURL");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("sy_canonicalURL"), 1, 0, 0, 0);
  v9[2] = v2;
  v8[3] = CFSTR("sy_activityPersistentID");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("sy_activityPersistentID"), 1, 0, 0, 0);
  v9[3] = v3;
  v8[4] = CFSTR("sy_activityTargetContentID");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("sy_activityTargetContentID"), 1, 0, 0, 0);
  v9[4] = v4;
  v8[5] = CFSTR("sy_linkContextInfoData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("sy_linkContextInfoData"), 0, 0, 0, 0);
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_customKeyForKey___customAttributeKeys;
  _customKeyForKey___customAttributeKeys = v6;

}

+ (id)searchableItemLinkingContentItem:(id)a3 toContainerIdentifier:(id)a4 uniqueIdentifier:(id)a5 relatedIdentifier:(id)a6 domainIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v57;
  id v58;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYItemIndexingManager.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentifier"));

    if (v15)
      goto LABEL_4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYItemIndexingManager.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItem"));

  if (!v14)
    goto LABEL_6;
LABEL_3:
  if (v15)
  {
LABEL_4:
    v18 = v15;
    goto LABEL_8;
  }
LABEL_7:
  objc_msgSend(v13, "itemIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  v22 = objc_alloc(MEMORY[0x1E0CA6B50]);
  v23 = (void *)objc_msgSend(v22, "initWithContentType:", *MEMORY[0x1E0CEC528]);
  objc_msgSend(v13, "displayTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDisplayName:", v24);

  objc_msgSend(v23, "setIdentifier:", v18);
  +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_isLinkItem"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v23, "setValue:forCustomKey:", MEMORY[0x1E0C9AAB0], v25);

  objc_msgSend(v23, "setTrashed:", v26);
  objc_msgSend(v23, "setContainerIdentifier:", v14);
  objc_msgSend(v23, "setRelatedUniqueIdentifier:", v16);
  objc_msgSend(v23, "setDeletedWithRelatedUniqueIdentifier:", v26);
  objc_msgSend(v13, "activityType");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  v29 = &stru_1E757CA18;
  if (v27)
    v29 = (__CFString *)v27;
  v30 = v29;

  +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_activityType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forCustomKey:", v30, v31);

  objc_msgSend(v13, "itemURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setURL:", v32);

  objc_msgSend(v13, "activityCanonicalURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v13, "activityCanonicalURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "absoluteString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_canonicalURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forCustomKey:", v35, v36);

  }
  objc_msgSend(v13, "activityPersistentIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v38)
  {
    objc_msgSend(v13, "activityPersistentIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_activityPersistentID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forCustomKey:", v39, v40);

  }
  objc_msgSend(v13, "activityTargetContentIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (v42)
  {
    objc_msgSend(v13, "activityTargetContentIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_activityTargetContentID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forCustomKey:", v43, v44);

  }
  objc_msgSend(v13, "userActivity");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_linkContextInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v57 = v18;
    v58 = 0;
    v47 = v17;
    v48 = v14;
    v49 = v15;
    v50 = v16;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v46, 1, &v58);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v58;
    if (v51)
    {
      +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_linkContextInfoData"));
      v53 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:forCustomKey:", v51, v53);
    }
    else
    {
      v53 = os_log_create("com.apple.synapse", "ItemIndexing");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        +[SYItemIndexingManager searchableItemLinkingContentItem:toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:].cold.1(v13, (uint64_t)v52, v53);

    }
    v16 = v50;
    v15 = v49;
    v14 = v48;
    v17 = v47;
    v18 = v57;
  }

  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v18, v17, v23);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setExpirationDate:", v55);

  return v54;
}

+ (id)searchableItemLinkingContentItem:(id)a3 toContainerIdentifier:(id)a4 relatedIdentifier:(id)a5 domainIdentifier:(id)a6
{
  return (id)objc_msgSend(a1, "searchableItemLinkingContentItem:toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:", a3, a4, 0, a5, a6);
}

+ (void)indexedContentItemsDidChange
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "ItemIndexing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "IndexingManager: indexedContentItemsDidChange", v4, 2u);
  }

  +[SYActivityObserver sharedInstance](SYActivityObserver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexedContentItemsDidChange");

}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "ItemIndexing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_cold_1(v3, a1, v4);

  objc_msgSend(*(id *)(a1 + 48), "_postFilteredItems:matchingUserActivityInfo:", v3, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "ItemIndexing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_116_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SYAttributeSetActivityInfo *v9;
  void *v10;
  SYAttributeSetActivityInfo *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = [SYAttributeSetActivityInfo alloc];
        objc_msgSend(v8, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SYAttributeSetActivityInfo initWithAttributeSet:](v9, "initWithAttributeSet:", v10);

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

+ (void)fetchLinkContextsDataForUserActivity:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13[0] = CFSTR("sy_linkContextInfoData");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SYItemIndexingManager_fetchLinkContextsDataForUserActivity_completion___block_invoke;
  v11[3] = &unk_1E757B5F8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(a1, "_fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:", v8, v9, v11);

}

void __73__SYItemIndexingManager_fetchLinkContextsDataForUserActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v11 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "attributeSet", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SYItemIndexingManager _customKeyForKey:](SYItemIndexingManager, "_customKeyForKey:", CFSTR("sy_linkContextInfoData"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForCustomKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "addObject:", v10);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(v11 + 32) + 16))();
}

+ (id)_postFilteredItems:(id)a3 matchingUserActivityInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  SYAttributeSetActivityInfo *v16;
  void *v17;
  SYAttributeSetActivityInfo *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "attributeSet", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15
          || (v16 = [SYAttributeSetActivityInfo alloc],
              objc_msgSend(v13, "attributeSet"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = -[SYAttributeSetActivityInfo initWithAttributeSet:](v16, "initWithAttributeSet:", v17),
              v17,
              LODWORD(v17) = SYEquivalentUserActivities(v18, v6),
              v18,
              (_DWORD)v17))
        {
          objc_msgSend(v7, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)setUseLocalSearchIndex
{
  _SYUseLocalSearchIndex = 1;
}

+ (void)searchableItemLinkingContentItem:(NSObject *)a3 toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_ERROR, "Error encoding linkContextInfo dictionary for item %@, ignoring: %@", v6, 0x16u);

}

+ (void)_fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1BCC38000, v0, OS_LOG_TYPE_DEBUG, "Can't search indexed linked items for invalid activity: %p", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_fetchIndexedItemsLinkedToUserActivity:(uint64_t)a1 extraFetchAttributes:(void *)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "count") != 0;
  _os_log_debug_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_DEBUG, "Search indexed linked items for activity: %p, has extra fetch attributes: %d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_0();
  v6 = 2048;
  v7 = v4;
  _os_log_debug_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_DEBUG, "Process %ld indexed linked item(s) found for activity: %p", v5, 0x16u);
  OUTLINED_FUNCTION_3_0();
}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_116_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, v0, v1, "Error executing search query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
