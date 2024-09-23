@implementation SPCacheManager

void __32__SPCacheManager_defaultManager__block_invoke()
{
  SPCacheManager *v0;
  void *v1;

  v0 = objc_alloc_init(SPCacheManager);
  v1 = (void *)defaultManager___DefaultManager;
  defaultManager___DefaultManager = (uint64_t)v0;

}

+ (id)defaultProperties
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Recents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaults
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  +[SPCacheManager identifier](SPCacheManager, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  return v4;
}

+ (id)identifier
{
  return CFSTR("com.apple.SpotlightFoundation");
}

+ (id)defaultValueWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)recentResultsWithOptions:(id)a3 rankAndDeduplicate:(id)a4
{
  id v6;
  id v7;
  PARSession *session;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  PARSession *v15;
  NSObject *v16;
  NSObject *v17;
  PARSession *v18;
  dispatch_time_t v19;
  id v20;
  _QWORD v22[5];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD v26[5];
  NSObject *v27;
  NSObject *v28;
  uint64_t *v29;
  uint64_t v30;
  uint8_t buf[16];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  session = self->_session;
  if (session && -[PARSession enabledStatus](session, "enabledStatus") == 1)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SPSpotlightRecentsCacheOptionMaxCountKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v10 = (int)objc_msgSend(v9, "intValue");
    else
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    logForSPLogCategoryRecents();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SPCacheManager recentResultsWithOptions:rankAndDeduplicate:].cold.1();

    if ((v7 == 0) | ((objc_opt_respondsToSelector() & 1) == 0))
    {
      logForSPLogCategoryRecents();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7DE000, v17, OS_LOG_TYPE_DEFAULT, "spotlight cache: getting top engaged results", buf, 2u);
      }

      v18 = self->_session;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke_50;
      v22[3] = &unk_1E60048D0;
      v24 = &v32;
      v25 = v10;
      v22[4] = self;
      v23 = v12;
      -[PARSession topEngagedResultsForInput:maxAmount:completion:](v18, "topEngagedResultsForInput:maxAmount:completion:", &stru_1E6004970, 10, v22);
      v16 = v23;
    }
    else
    {
      logForSPLogCategoryRecents();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7DE000, v14, OS_LOG_TYPE_DEFAULT, "spotlight cache: ranking, getting all engaged results", buf, 2u);
      }

      v15 = self->_session;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke;
      v26[3] = &unk_1E60048A8;
      v28 = v7;
      v29 = &v32;
      v26[4] = self;
      v30 = v10;
      v27 = v12;
      -[PARSession allEngagedResultsForInput:maxAmount:completion:](v15, "allEngagedResultsForInput:maxAmount:completion:", &stru_1E6004970, 100, v26);

      v16 = v28;
    }

    v19 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v12, v19))
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v20 = (id)v33[5];
    v11 = v20;

  }
  else
  {
    v11 = (id)v33[5];
  }
  _Block_object_dispose(&v32, 8);

  return v11;
}

- (SPCacheManager)init
{
  SPCacheManager *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  PARSession *session;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SPCacheManager;
  v2 = -[SPCacheManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:factory:", CFSTR("com.apple.spotlight"), CFSTR("spotlight/1.0"), 0);
    logForSPLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1AF7DE000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: initializing session with configuration: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (PARSession *)v5;

    if (+[SPCacheManager version](SPCacheManager, "version") != 25)
      -[SPCacheManager deleteAllResults](v2, "deleteAllResults");
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));

  }
  return v2;
}

+ (int64_t)version
{
  void *v2;
  void *v3;
  int64_t v4;

  +[SPCacheManager defaultValueWithKey:](SPCacheManager, "defaultValueWithKey:", CFSTR("Version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (SPCacheManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  return (SPCacheManager *)(id)defaultManager___DefaultManager;
}

+ (void)setDefaultWithKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "defaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "defaultProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v9, "setObject:forKey:", v5, v6);
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("Recents"));

}

+ (void)removeKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", v3);
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("Recents"));

}

+ (void)removeDefaults
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPCacheManager identifier](SPCacheManager, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePersistentDomainForName:", v3);

  objc_msgSend(MEMORY[0x1E0C99EA0], "resetStandardUserDefaults");
}

+ (void)setVersionWithValue:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultWithKey:value:", CFSTR("Version"), v5);

}

- (void)updateRecentsWithBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  SPCacheManager *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = self;
  -[SPCacheManager recentResultsWithOptions:](self, "recentResultsWithOptions:", MEMORY[0x1E0C9AA70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v9 = 0x1E0D8C000uLL;
    do
    {
      v10 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        objc_msgSend(v11, "topic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v11, "topic");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          searchResultWithTopicIdentifier(v15, 1.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "type") == 2)
          {
            objc_msgSend(v16, "resultBundleId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(":"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lastObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v4, "containsObject:", v20) & 1) == 0)
            {
              objc_msgSend(v16, "identifier");
              v21 = v8;
              v22 = v9;
              v23 = v5;
              v24 = v4;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SPCacheManager deleteLocalResult:identifier:bundleIdentifier:protectionClass:](v27, "deleteLocalResult:identifier:bundleIdentifier:protectionClass:", v16, v25, v20, v19);

              v4 = v24;
              v5 = v23;
              v9 = v22;
              v8 = v21;
              v7 = v28;
            }

          }
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

}

- (void)cacheResult:(id)a3 title:(id)a4 searchString:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPCachedResult *v11;
  void *v12;
  SPCachedResult *v13;
  void *v14;
  NSObject *v15;
  PARSession *session;
  char *v17;
  SPCachedResult *v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = [SPCachedResult alloc];
  objc_msgSend(v8, "normalizedTopic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SPCachedResult initWithResult:topic:title:searchString:](v11, "initWithResult:topic:title:searchString:", v8, v12, v10, v9);

  if (!v13)
  {
    logForSPLogCategoryCaching();
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      -[SPCacheManager cacheResult:title:searchString:].cold.1(v8, v17);
    goto LABEL_10;
  }
  -[SPCachedResult encodedNormalizedTopic](v13, "encodedNormalizedTopic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (objc_msgSend(v9, "length"))
      -[PARSession clearEngagementsWithTitle:type:](self->_session, "clearEngagementsWithTitle:type:", v9, &unk_1E6005D40);
    logForSPLogCategoryCaching();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = objc_msgSend(v8, "type");
      _os_log_impl(&dword_1AF7DE000, v15, OS_LOG_TYPE_DEFAULT, "spotlight cache: spotlight cache: caching result with type: %d", buf, 8u);
    }

    session = self->_session;
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    -[PARSession addEngagedResults:completion:](session, "addEngagedResults:completion:", v17, &__block_literal_global_27);
LABEL_10:

  }
}

void __49__SPCacheManager_cacheResult_title_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __49__SPCacheManager_cacheResult_title_searchString___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)cacheLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SPCachedResult *v17;
  NSObject *v18;
  PARSession *session;
  char *v20;
  SPCachedResult *v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Preferences"))
    || (objc_msgSend(v13, "containsString:", CFSTR("SAFETY_CHECK")) & 1) == 0)
  {
    v17 = -[SPCachedResult initWithResult:identifier:bundleIdentifier:protectionClass:searchString:]([SPCachedResult alloc], "initWithResult:identifier:bundleIdentifier:protectionClass:searchString:", v12, v13, v14, v15, v16);
    if (v17)
    {
      if (objc_msgSend(v16, "length"))
        -[PARSession clearEngagementsWithTitle:type:](self->_session, "clearEngagementsWithTitle:type:", v16, &unk_1E6005D40);
      logForSPLogCategoryCaching();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v23 = objc_msgSend(v12, "type");
        _os_log_impl(&dword_1AF7DE000, v18, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching result with type: %d", buf, 8u);
      }

      session = self->_session;
      v21 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      -[PARSession addEngagedResults:completion:](session, "addEngagedResults:completion:", v20, &__block_literal_global_32);
    }
    else
    {
      logForSPLogCategoryCaching();
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
        -[SPCacheManager cacheResult:title:searchString:].cold.1(v12, v20);
    }

  }
}

void __92__SPCacheManager_cacheLocalResult_identifier_bundleIdentifier_protectionClass_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __92__SPCacheManager_cacheLocalResult_identifier_bundleIdentifier_protectionClass_searchString___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)cachePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPCachedResult *v14;
  NSObject *v15;
  PARSession *session;
  NSObject *v17;
  uint8_t v18[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SPCachedResult initWithPersonName:personQueryIdentifier:score:searchString:]([SPCachedResult alloc], "initWithPersonName:personQueryIdentifier:score:searchString:", v13, v12, v11, v10);

  if (v14)
  {
    if (objc_msgSend(v10, "length"))
      -[PARSession clearEngagementsWithTitle:type:](self->_session, "clearEngagementsWithTitle:type:", v10, &unk_1E6005D40);
    logForSPLogCategoryCaching();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AF7DE000, v15, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching person with type", v18, 2u);
    }

    session = self->_session;
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    -[PARSession addEngagedResults:completion:](session, "addEngagedResults:completion:", v17, &__block_literal_global_33);
  }
  else
  {
    logForSPLogCategoryCaching();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SPCacheManager cachePerson:personQueryIdentifier:score:searchString:].cold.1();
  }

}

void __71__SPCacheManager_cachePerson_personQueryIdentifier_score_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __71__SPCacheManager_cachePerson_personQueryIdentifier_score_searchString___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)cacheContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPCachedResult *v14;
  NSObject *v15;
  PARSession *session;
  NSObject *v17;
  uint8_t v18[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SPCachedResult initWithContactName:contactIdentifier:score:searchString:]([SPCachedResult alloc], "initWithContactName:contactIdentifier:score:searchString:", v13, v12, v11, v10);

  if (v14)
  {
    if (objc_msgSend(v10, "length"))
      -[PARSession clearEngagementsWithTitle:type:](self->_session, "clearEngagementsWithTitle:type:", v10, &unk_1E6005D40);
    logForSPLogCategoryCaching();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AF7DE000, v15, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching contact with type", v18, 2u);
    }

    session = self->_session;
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    -[PARSession addEngagedResults:completion:](session, "addEngagedResults:completion:", v17, &__block_literal_global_34);
  }
  else
  {
    logForSPLogCategoryCaching();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SPCacheManager cacheContact:contactIdentifier:score:searchString:].cold.1();
  }

}

void __68__SPCacheManager_cacheContact_contactIdentifier_score_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __68__SPCacheManager_cacheContact_contactIdentifier_score_searchString___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)cacheSuggestion:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  SPCachedResult *v13;
  NSObject *v14;
  PARSession *session;
  NSObject *v16;
  SPCachedResult *v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v7 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[SPCachedResult initWithTitle:type:score:searchString:]([SPCachedResult alloc], "initWithTitle:type:score:searchString:", v12, v7, v11, v10);

  if (v13)
  {
    if (objc_msgSend(v10, "length"))
      -[PARSession clearEngagementsWithTitle:type:](self->_session, "clearEngagementsWithTitle:type:", v10, &unk_1E6005D40);
    logForSPLogCategoryCaching();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v7;
      _os_log_impl(&dword_1AF7DE000, v14, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching suggestion with type: %d", buf, 8u);
    }

    session = self->_session;
    v17 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    -[PARSession addEngagedResults:completion:](session, "addEngagedResults:completion:", v16, &__block_literal_global_35);
  }
  else
  {
    logForSPLogCategoryCaching();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SPCacheManager cacheSuggestion:type:score:searchString:].cold.1();
  }

}

void __58__SPCacheManager_cacheSuggestion_type_score_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __58__SPCacheManager_cacheSuggestion_type_score_searchString___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)deleteResult:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  SPCachedResult *v8;
  void *v9;
  SPCachedResult *v10;
  NSObject *v11;
  PARSession *session;
  _QWORD v13[4];
  id v14;
  id v15;
  SPCacheManager *v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [SPCachedResult alloc];
  objc_msgSend(v6, "normalizedTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SPCachedResult initWithResult:topic:title:searchString:](v8, "initWithResult:topic:title:searchString:", v6, v9, v7, 0);

  if (v10)
  {
    logForSPLogCategoryCaching();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = objc_msgSend(v6, "type");
      _os_log_impl(&dword_1AF7DE000, v11, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting result with type: %d", buf, 8u);
    }

    session = self->_session;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__SPCacheManager_deleteResult_title___block_invoke;
    v13[3] = &unk_1E6004860;
    v14 = v6;
    v15 = v7;
    v16 = self;
    -[PARSession clearEngagedResult:completion:](session, "clearEngagedResult:completion:", v10, v13);

  }
}

void __37__SPCacheManager_deleteResult_title___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  SPCachedResult *v5;
  void *v6;
  void *v7;
  SPCachedResult *v8;
  NSObject *v9;
  int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __37__SPCacheManager_deleteResult_title___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestedTopic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [SPCachedResult alloc];
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "requestedTopic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SPCachedResult initWithResult:topic:title:searchString:](v5, "initWithResult:topic:title:searchString:", v6, v7, *(_QWORD *)(a1 + 40), 0);

      if (v8)
      {
        logForSPLogCategoryCaching();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend(*(id *)(a1 + 32), "type");
          v11[0] = 67109120;
          v11[1] = v10;
          _os_log_impl(&dword_1AF7DE000, v9, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting result with type: %d", (uint8_t *)v11, 8u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "clearEngagedResult:completion:", v8, &__block_literal_global_37);
      }

    }
    else
    {
      notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
    }
  }
}

void __37__SPCacheManager_deleteResult_title___block_invoke_36(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __37__SPCacheManager_deleteResult_title___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)deleteLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPCachedResult *v14;
  NSObject *v15;
  NSObject *v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = -[SPCachedResult initWithResult:identifier:bundleIdentifier:protectionClass:searchString:]([SPCachedResult alloc], "initWithResult:identifier:bundleIdentifier:protectionClass:searchString:", v10, v13, v12, v11, 0);

  logForSPLogCategoryCaching();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = objc_msgSend(v10, "type");
      _os_log_impl(&dword_1AF7DE000, v16, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting local result with type: %d", (uint8_t *)v17, 8u);
    }

    -[PARSession clearEngagedResult:completion:](self->_session, "clearEngagedResult:completion:", v14, &__block_literal_global_38);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SPCacheManager deleteLocalResult:identifier:bundleIdentifier:protectionClass:].cold.1(v10, (const char *)v16);

  }
}

void __80__SPCacheManager_deleteLocalResult_identifier_bundleIdentifier_protectionClass___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    logForSPLogCategoryCaching();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __37__SPCacheManager_deleteResult_title___block_invoke_cold_1();

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
}

- (void)deletePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPCachedResult *v11;
  NSObject *v12;
  NSObject *v13;
  PARSession *session;
  void *v15;
  PARSession *v16;
  void *v17;
  uint8_t v18[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SPCachedResult initWithPersonName:personQueryIdentifier:score:searchString:]([SPCachedResult alloc], "initWithPersonName:personQueryIdentifier:score:searchString:", v10, v9, v8, 0);

  logForSPLogCategoryCaching();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AF7DE000, v13, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting person with type", v18, 2u);
    }

    session = self->_session;
    -[SPCachedResult title](v11, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARSession clearEngagementsWithTitle:type:](session, "clearEngagementsWithTitle:type:", v15, &unk_1E6005D58);

    v16 = self->_session;
    -[SPCachedResult title](v11, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARSession clearEngagementsWithTitle:type:](v16, "clearEngagementsWithTitle:type:", v17, &unk_1E6005D70);

    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SPCacheManager deletePerson:personQueryIdentifier:score:].cold.1();

  }
}

- (void)deleteContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPCachedResult *v11;
  NSObject *v12;
  NSObject *v13;
  PARSession *session;
  void *v15;
  PARSession *v16;
  void *v17;
  uint8_t v18[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SPCachedResult initWithContactName:contactIdentifier:score:searchString:]([SPCachedResult alloc], "initWithContactName:contactIdentifier:score:searchString:", v10, v9, v8, 0);

  logForSPLogCategoryCaching();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AF7DE000, v13, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting contact with type", v18, 2u);
    }

    session = self->_session;
    -[SPCachedResult title](v11, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARSession clearEngagementsWithTitle:type:](session, "clearEngagementsWithTitle:type:", v15, &unk_1E6005D88);

    v16 = self->_session;
    -[SPCachedResult title](v11, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARSession clearEngagementsWithTitle:type:](v16, "clearEngagementsWithTitle:type:", v17, &unk_1E6005DA0);

    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SPCacheManager deleteContact:contactIdentifier:score:].cold.1();

  }
}

- (void)deleteSuggestion:(id)a3 type:(int)a4 score:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  SPCachedResult *v10;
  PARSession *session;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = -[SPCachedResult initWithTitle:type:score:searchString:]([SPCachedResult alloc], "initWithTitle:type:score:searchString:", v9, v5, v8, 0);

  if (v10)
  {
    session = self->_session;
    -[SPCachedResult title](v10, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARSession clearEngagementsWithTitle:type:](session, "clearEngagementsWithTitle:type:", v12, v13);

    notify_post((const char *)objc_msgSend(CFSTR("SPSpotlightRecentsCacheDidChange"), "UTF8String"));
  }
  else
  {
    logForSPLogCategoryCaching();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SPCacheManager deleteSuggestion:type:score:].cold.1();

  }
}

- (void)deleteAllResults
{
  PARSession *session;
  void *v3;
  void *v4;

  session = self->_session;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PARSession clearEngagementsFromDate:toDate:](session, "clearEngagementsFromDate:toDate:", v3, v4);

  +[SPCacheManager removeDefaults](SPCacheManager, "removeDefaults");
  +[SPCacheManager setVersionWithValue:](SPCacheManager, "setVersionWithValue:", 25);
}

- (id)recentResultsWithOptions:(id)a3
{
  return -[SPCacheManager recentResultsWithOptions:rankAndDeduplicate:](self, "recentResultsWithOptions:rankAndDeduplicate:", a3, 0);
}

void __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  logForSPLogCategoryRecents();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AF7DE000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found all %ld engaged results", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  logForSPLogCategoryRecents();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    v11 = 134217984;
    v12 = v7;
    _os_log_impl(&dword_1AF7DE000, v6, OS_LOG_TYPE_DEFAULT, "spotlight cache: filtered to %ld engaged results", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_createRecentsFromEngagedResults:maxCount:", v5, *(_QWORD *)(a1 + 64));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  logForSPLogCategoryRecents();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AF7DE000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found top %ld engaged results", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_createRecentsFromEngagedResults:maxCount:", v3, *(_QWORD *)(a1 + 56));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_createRecentsFromEngagedResults:(id)a3 maxCount:(unint64_t)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SPCachedResult *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  id v51;
  id v52;
  id v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73;
  _BYTE v74[15];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  uint64_t v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v76;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v76 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v11);
        v13 = -[SPCachedResult initWithEngagedResult:]([SPCachedResult alloc], "initWithEngagedResult:", v12);
        if (!v13)
        {
          logForSPLogCategoryRecents();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SPCacheManager _createRecentsFromEngagedResults:maxCount:].cold.1(&v73, v74, v14);
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "type") == 36 || objc_msgSend(v12, "type") == 32)
        {
          objc_msgSend(v12, "title", v51);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v54;
          goto LABEL_10;
        }
        if (objc_msgSend(v12, "type") == 37 || objc_msgSend(v12, "type") == 38)
        {
          objc_msgSend(v12, "title", v51);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v6;
LABEL_10:
          objc_msgSend(v15, "setObject:forKey:", v13, v14);
LABEL_13:

          goto LABEL_14;
        }
        if (objc_msgSend(v12, "type") == 34
          || objc_msgSend(v12, "type") == 16
          || objc_msgSend(v12, "type") == 17
          || objc_msgSend(v12, "type") == 15
          || objc_msgSend(v12, "type") == 31)
        {
          -[SPCachedResult title](v13, "title", v51);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lowercaseString");
          v14 = objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
            objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v7, "addObject:", v14);
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "type") == 30)
          v17 = v52;
        else
          v17 = v5;
        objc_msgSend(v17, "addObject:", v13, v51);
LABEL_14:

        ++v11;
      }
      while (v9 != v11);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      v9 = v18;
    }
    while (v18);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v55 = v52;
  v19 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v70 != v21)
          objc_enumerationMutation(v55);
        v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v23, "title", v51);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lowercaseString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v7, "containsObject:", v25);

        if ((v26 & 1) == 0)
          objc_msgSend(v5, "addObject:", v23);
      }
      v20 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
    }
    while (v20);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v27 = v54;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v66 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
        objc_msgSend(v6, "objectForKey:", v32, v51);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v34);

        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
    }
    while (v29);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v35 = v6;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v35, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k), v51);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
    }
    while (v37);
  }

  logForSPLogCategoryRecents();
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v51;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v43 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v81 = v43;
    _os_log_impl(&dword_1AF7DE000, v41, OS_LOG_TYPE_DEFAULT, "spotlight cache: returning %ld engaged completions", buf, 0xCu);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_52);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v44 = v5;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v58;
    while (2)
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v58 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "recentTopic", v51);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
          objc_msgSend(v42, "addObject:", v49);
        if (a4 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v42, "count") >= a4)
        {

          goto LABEL_72;
        }

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
      if (v46)
        continue;
      break;
    }
  }
LABEL_72:

  return v42;
}

uint64_t __60__SPCacheManager__createRecentsFromEngagedResults_maxCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "engagementTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)enumerateRecentResultsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *, char *);
  void *v5;
  PARSession *session;
  NSObject *v7;
  NSObject *v8;
  PARSession *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  dispatch_group_t group;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  dispatch_group_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  char v100;
  uint8_t v101[128];
  uint8_t buf[4];
  uint64_t v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *, char *))a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 1;
  session = self->_session;
  if (session && -[PARSession enabledStatus](session, "enabledStatus") == 1)
  {
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy_;
    v98 = __Block_byref_object_dispose_;
    v99 = 0;
    v99 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy_;
    v92 = __Block_byref_object_dispose_;
    v93 = 0;
    v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v82 = 0;
    v83 = &v82;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy_;
    v86 = __Block_byref_object_dispose_;
    v87 = 0;
    v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy_;
    v80 = __Block_byref_object_dispose_;
    v81 = 0;
    v81 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy_;
    v74 = __Block_byref_object_dispose_;
    v75 = 0;
    v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy_;
    v68 = __Block_byref_object_dispose_;
    v69 = 0;
    v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    logForSPLogCategoryRecents();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7DE000, v8, OS_LOG_TYPE_DEFAULT, "spotlight cache: getting top engaged results", buf, 2u);
    }

    v9 = self->_session;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __51__SPCacheManager_enumerateRecentResultsUsingBlock___block_invoke;
    v56[3] = &unk_1E6004918;
    v58 = &v70;
    v59 = &v64;
    v60 = &v82;
    v61 = &v76;
    v62 = &v88;
    v63 = &v94;
    group = v7;
    v57 = group;
    -[PARSession topEngagedResultsForInput:maxAmount:completion:](v9, "topEngagedResultsForInput:maxAmount:completion:", &stru_1E6004970, 10, v56);
    v10 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(group, v10))
    {
      v4[2](v4, 0, v5, &v100);
    }
    else
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v11 = (id)v71[5];
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v105, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v53 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend((id)v83[5], "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              objc_msgSend((id)v71[5], "objectForKeyedSubscript:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v65[5], "objectForKeyedSubscript:", v15);
              v18 = objc_claimAutoreleasedReturnValue();

              v19 = objc_msgSend((id)v89[5], "count");
              objc_msgSend((id)v89[5], "addObject:", v17);
              v20 = (void *)v95[5];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", v18, v21);

              v5 = (void *)v18;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v105, 16);
        }
        while (v12);
      }

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v22 = (id)v83[5];
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v104, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v49;
        do
        {
          v25 = 0;
          v26 = v5;
          do
          {
            if (*(_QWORD *)v49 != v24)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v25);
            objc_msgSend((id)v83[5], "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v77[5], "objectForKeyedSubscript:", v27);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = objc_msgSend((id)v89[5], "count");
            objc_msgSend((id)v89[5], "addObject:", v28);
            v30 = (void *)v95[5];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v5, v31);

            ++v25;
            v26 = v5;
          }
          while (v23 != v25);
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v104, 16);
        }
        while (v23);
      }

      logForSPLogCategoryRecents();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_msgSend((id)v95[5], "count");
        *(_DWORD *)buf = 134217984;
        v103 = v33;
        _os_log_impl(&dword_1AF7DE000, v32, OS_LOG_TYPE_DEFAULT, "spotlight cache: returning %ld engaged completions", buf, 0xCu);
      }

      objc_msgSend((id)v95[5], "keysSortedByValueUsingSelector:", sel_compare_);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v34, "reverseObjectEnumerator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v101, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v45;
LABEL_28:
        v38 = 0;
        v39 = v5;
        while (1)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v38);
          objc_msgSend((id)v95[5], "objectForKeyedSubscript:", v40);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v89[5], "objectAtIndex:", (int)objc_msgSend(v40, "intValue"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *, char *))v4)[2](v4, v41, v5, &v100);
          v42 = v100 == 0;

          if (!v42)
            break;
          ++v38;
          v39 = v5;
          if (v36 == v38)
          {
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v101, 16);
            if (v36)
              goto LABEL_28;
            break;
          }
        }
      }

    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v88, 8);

    _Block_object_dispose(&v94, 8);
  }
  else
  {
    v4[2](v4, 0, v5, &v100);
  }

}

void __51__SPCacheManager_enumerateRecentResultsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SPCachedResult *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  logForSPLogCategoryRecents();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AF7DE000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found %ld engaged results", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v27 = &buf[1];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v11 = -[SPCachedResult initWithEngagedResult:]([SPCachedResult alloc], "initWithEngagedResult:", v10);
        -[SPCachedResult searchResult](v11, "searchResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (objc_msgSend(v10, "type") == 36 || objc_msgSend(v10, "type") == 32)
          {
            v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(v10, "title", v27);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v12, v14);

            v15 = *(_QWORD *)(a1 + 48);
            goto LABEL_12;
          }
          if (objc_msgSend(v10, "type") == 37 || objc_msgSend(v10, "type") == 38)
          {
            v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            objc_msgSend(v10, "title", v27);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v12, v22);

            v15 = *(_QWORD *)(a1 + 64);
LABEL_12:
            v16 = *(void **)(*(_QWORD *)(v15 + 8) + 40);
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "freshnessScore");
            objc_msgSend(v17, "numberWithDouble:");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "title");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v16;
          }
          else
          {
            v28 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v12);
            v23 = v5;
            v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "freshnessScore");
            objc_msgSend(v25, "numberWithDouble:");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v24;
            v5 = v23;
          }
          objc_msgSend(v20, "setObject:forKey:", v18, v19, v27);

          goto LABEL_16;
        }
        logForSPLogCategoryRecents();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SPCacheManager _createRecentsFromEngagedResults:maxCount:].cold.1(buf, v27, v18);
LABEL_16:

        ++v9;
      }
      while (v7 != v9);
      v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v7 = v26;
    }
    while (v26);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)enumerateRecentCompletionsWithSearchString:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PARSession *session;
  PARSession *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  logForSPLogCategoryRecents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7DE000, v8, OS_LOG_TYPE_DEFAULT, "spotlight cache: getting top engaged results", buf, 2u);
  }

  session = self->_session;
  if (session && -[PARSession enabledStatus](session, "enabledStatus") == 1)
  {
    v10 = self->_session;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__SPCacheManager_enumerateRecentCompletionsWithSearchString_usingBlock___block_invoke;
    v11[3] = &unk_1E6004940;
    v12 = v7;
    -[PARSession topEngagedResultsForInput:maxAmount:completion:](v10, "topEngagedResultsForInput:maxAmount:completion:", v6, 10, v11);

  }
}

void __72__SPCacheManager_enumerateRecentCompletionsWithSearchString_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  logForSPLogCategoryRecents();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AF7DE000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found %ld engaged results", buf, 0xCu);
  }

  v21 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      if (resultIsSuggestionType(objc_msgSend(v11, "type", (_QWORD)v17)))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v11, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "score");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, uint64_t, char *))(v12 + 16))(v12, v13, v15, objc_msgSend(v11, "type"), &v21);

        ++v8;
        if (v21)
          break;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  logForSPLogCategoryRecents();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v8;
    _os_log_impl(&dword_1AF7DE000, v16, OS_LOG_TYPE_DEFAULT, "spotlight cache: returning %ld engaged completions", buf, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)cacheResult:(void *)a1 title:(const char *)a2 searchString:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1AF7DE000, v2, v3, "spotlight cache: could not create cached result with result: %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6();
}

void __49__SPCacheManager_cacheResult_title_searchString___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not add result to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __92__SPCacheManager_cacheLocalResult_identifier_bundleIdentifier_protectionClass_searchString___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not add local result to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cachePerson:personQueryIdentifier:score:searchString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not create cached person result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__SPCacheManager_cachePerson_personQueryIdentifier_score_searchString___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not add person result to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cacheContact:contactIdentifier:score:searchString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not create cached contact result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__SPCacheManager_cacheContact_contactIdentifier_score_searchString___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not add contact result to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cacheSuggestion:type:score:searchString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1AF7DE000, v0, v1, "spotlight cache: could not create cached result with suggestion: %d", v2);
  OUTLINED_FUNCTION_2();
}

void __58__SPCacheManager_cacheSuggestion_type_score_searchString___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not add suggestion to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__SPCacheManager_deleteResult_title___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not delete cached result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteLocalResult:(void *)a1 identifier:(const char *)a2 bundleIdentifier:protectionClass:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1AF7DE000, v2, v3, "spotlight cache: could not delete cached result with result: %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6();
}

- (void)deletePerson:personQueryIdentifier:score:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not delete cached person result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteContact:contactIdentifier:score:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: could not delete cached contact result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteSuggestion:type:score:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1AF7DE000, v0, v1, "spotlight cache: could not delete cached result with suggestion: %d", v2);
  OUTLINED_FUNCTION_2();
}

- (void)recentResultsWithOptions:rankAndDeduplicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, v0, v1, "spotlight cache: meh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createRecentsFromEngagedResults:(NSObject *)a3 maxCount:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1(&dword_1AF7DE000, a3, (uint64_t)a3, "spotlight cache: could not create search result with engaged result", a1);
}

@end
