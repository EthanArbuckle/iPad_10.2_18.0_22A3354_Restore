@implementation PRSRankingItemRanker

+ (void)preheat
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PRSRankingItemRanker_preheat__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)sPreheatQueue, block);
}

uint64_t __31__PRSRankingItemRanker_preheat__block_invoke()
{
  uint64_t result;
  id v1;

  result = _os_feature_enabled_impl();
  if ((result & 1) == 0)
  {
    v1 = (id)objc_msgSend((id)objc_opt_class(), "englishEmbedding");
    return (uint64_t)(id)objc_msgSend((id)objc_opt_class(), "preferredEmbedding");
  }
  return result;
}

+ (id)preferredEmbedding
{
  if (preferredEmbedding_onceToken != -1)
    dispatch_once(&preferredEmbedding_onceToken, &__block_literal_global_558);
  return (id)preferredEmbedding_preferredEmbedding;
}

+ (id)englishEmbedding
{
  if (englishEmbedding_onceToken != -1)
    dispatch_once(&englishEmbedding_onceToken, &__block_literal_global_547);
  return (id)englishEmbedding_englishEmbedding;
}

+ (_LanguageModel)languageModel
{
  if (languageModel_onceToken != -1)
    dispatch_once(&languageModel_onceToken, &__block_literal_global_545);
  return (_LanguageModel *)languageModel_languageModel;
}

+ (void)initialize
{
  uint64_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("Ranking preheat queue", v3);
    v5 = (void *)sPreheatQueue;
    sPreheatQueue = (uint64_t)v4;

  }
}

+ (id)sortedUniqueBundleFeatureValuesFromBundleFeatures:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v3 = (void *)objc_opt_new();
  v4 = 46;
  do
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "addObject:", v5);

    --v4;
  }
  while (v4);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v20, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(v20, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != 46; ++i)
        {
          if (i < 0x18 || i <= 0x2B && ((1 << i) & 0x9F000000000) != 0)
          {
            objc_msgSend(v3, "objectAtIndexedSubscript:", i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v14 = objc_msgSend(v3, "count");
  if (v14)
  {
    v15 = v14;
    for (j = 0; j != v15; ++j)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", j);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sortWithOptions:usingComparator:", 1, &__block_literal_global_533);

    }
  }

  return v3;
}

uint64_t __74__PRSRankingItemRanker_sortedUniqueBundleFeatureValuesFromBundleFeatures___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

+ (void)clearState
{
  void *v2;

  pthread_mutex_lock(&sVIPLock_0);
  v2 = (void *)sMeCardEmailsQuery;
  sMeCardEmailsQuery = 0;

  pthread_mutex_unlock(&sVIPLock_0);
}

+ (BOOL)isCJK
{
  if (isCJK_onceToken != -1)
    dispatch_once(&isCJK_onceToken, &__block_literal_global_534);
  return isCJK_sIsCJK;
}

void __29__PRSRankingItemRanker_isCJK__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v2, "hasPrefix:", CFSTR("ko")))
  {
    isCJK_sIsCJK = 1;
  }

}

+ (BOOL)isKeywordsHidingEnabled
{
  if (isKeywordsHidingEnabled_onceToken[0] != -1)
    dispatch_once(isKeywordsHidingEnabled_onceToken, &__block_literal_global_542);
  return +[SSRankingManager isKeywordsHidingEnabledForLanguage:]((uint64_t)SSRankingManager, (void *)isKeywordsHidingEnabled_language);
}

void __47__PRSRankingItemRanker_isKeywordsHidingEnabled__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isKeywordsHidingEnabled_language;
  isKeywordsHidingEnabled_language = v0;

}

+ (unint64_t)spellCorrectedAppMinQueryLen
{
  if (spellCorrectedAppMinQueryLen_onceToken[0] != -1)
    dispatch_once(spellCorrectedAppMinQueryLen_onceToken, &__block_literal_global_544);
  return +[SSRankingManager getMinMisspellingLengthForLanguage:]((uint64_t)SSRankingManager, (void *)spellCorrectedAppMinQueryLen_language);
}

void __52__PRSRankingItemRanker_spellCorrectedAppMinQueryLen__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spellCorrectedAppMinQueryLen_language;
  spellCorrectedAppMinQueryLen_language = v0;

}

void __37__PRSRankingItemRanker_languageModel__block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(9, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_546);

}

void __37__PRSRankingItemRanker_languageModel__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DA9C58];
  v4[0] = *MEMORY[0x1E0DA9C50];
  v4[1] = v0;
  v5[0] = MEMORY[0x1E0C9AAB0];
  v5[1] = MEMORY[0x1E0C9AAB0];
  v4[2] = *MEMORY[0x1E0DA9C60];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  v4[3] = *MEMORY[0x1E0DA9C68];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  languageModel_languageModel = SILanguageModelCreateWithOptions();
}

void __40__PRSRankingItemRanker_englishEmbedding__block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(9, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_548);

}

void __40__PRSRankingItemRanker_englishEmbedding__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CCE128], "wordEmbeddingForLanguage:", *MEMORY[0x1E0CCDEF8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)englishEmbedding_englishEmbedding;
  englishEmbedding_englishEmbedding = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)englishEmbedding_preferredLanguage;
  englishEmbedding_preferredLanguage = v4;

  if ((objc_msgSend((id)englishEmbedding_preferredLanguage, "hasPrefix:", CFSTR("en")) & 1) == 0)
  {
    if ((objc_msgSend((id)englishEmbedding_preferredLanguage, "hasPrefix:", CFSTR("fr")) & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CCDF08];
    }
    else if ((objc_msgSend((id)englishEmbedding_preferredLanguage, "hasPrefix:", CFSTR("de")) & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CCDF10];
    }
    else
    {
      if (!objc_msgSend((id)englishEmbedding_preferredLanguage, "hasPrefix:", CFSTR("es")))
        return;
      v6 = (_QWORD *)MEMORY[0x1E0CCDF80];
    }
    objc_msgSend(MEMORY[0x1E0CCE128], "wordEmbeddingForLanguage:", *v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)englishEmbedding_preferredEmbedding;
    englishEmbedding_preferredEmbedding = v7;

  }
}

void __42__PRSRankingItemRanker_preferredEmbedding__block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(9, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_559);

}

void __42__PRSRankingItemRanker_preferredEmbedding__block_invoke_2()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("en")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("fr")) & 1) != 0)
    {
      v2 = (_QWORD *)MEMORY[0x1E0CCDF08];
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CCE128], "wordEmbeddingForLanguage:", *v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)preferredEmbedding_preferredEmbedding;
      preferredEmbedding_preferredEmbedding = v3;

      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("de")) & 1) != 0)
    {
      v2 = (_QWORD *)MEMORY[0x1E0CCDF10];
      goto LABEL_8;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("es")))
    {
      v2 = (_QWORD *)MEMORY[0x1E0CCDF80];
      goto LABEL_8;
    }
  }
LABEL_9:

}

+ (id)embeddingForLanguage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  if (embeddingForLanguage__onceToken != -1)
    dispatch_once(&embeddingForLanguage__onceToken, &__block_literal_global_560);
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("en")))
  {
    +[PRSRankingItemRanker englishEmbedding](PRSRankingItemRanker, "englishEmbedding");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "hasPrefix:", v7);

    if (!v8)
    {
      v9 = 0;
      goto LABEL_9;
    }
    +[PRSRankingItemRanker preferredEmbedding](PRSRankingItemRanker, "preferredEmbedding");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v4;
LABEL_9:

  return v9;
}

void __45__PRSRankingItemRanker_embeddingForLanguage___block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(9, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_561);

}

void __45__PRSRankingItemRanker_embeddingForLanguage___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CCE128], "wordEmbeddingForLanguage:", *MEMORY[0x1E0CCDEF8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)embeddingForLanguage__englishEmbedding;
  embeddingForLanguage__englishEmbedding = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)embeddingForLanguage__preferredLanguage;
  embeddingForLanguage__preferredLanguage = v4;

  if ((objc_msgSend((id)embeddingForLanguage__preferredLanguage, "hasPrefix:", CFSTR("en")) & 1) == 0)
  {
    if ((objc_msgSend((id)embeddingForLanguage__preferredLanguage, "hasPrefix:", CFSTR("fr")) & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CCDF08];
    }
    else if ((objc_msgSend((id)embeddingForLanguage__preferredLanguage, "hasPrefix:", CFSTR("de")) & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CCDF10];
    }
    else
    {
      if (!objc_msgSend((id)embeddingForLanguage__preferredLanguage, "hasPrefix:", CFSTR("es")))
        return;
      v6 = (_QWORD *)MEMORY[0x1E0CCDF80];
    }
    objc_msgSend(MEMORY[0x1E0CCE128], "wordEmbeddingForLanguage:", *v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)embeddingForLanguage__preferredEmbedding;
    embeddingForLanguage__preferredEmbedding = v7;

  }
}

+ (BOOL)isBlendingScoreDemoted:(float)a3
{
  return a3 < -100.0;
}

+ (BOOL)isContentWordQuery:(id)a3 queryTermCount:(int64_t)a4 keyboardLanguage:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99DC8];
  v9 = a5;
  objc_msgSend(v8, "preferredLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v13, "hasPrefix:", CFSTR("en")))
    {
      v14 = objc_msgSend(v12, "hasPrefix:", v13);
      if (a4 == 1
        && v7
        && v14
        && +[PRSRankingItemRanker languageModel](PRSRankingItemRanker, "languageModel"))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        SILanguageModelIsContentTokenInString();
      }
    }
  }

  return 1;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 userQueryString:(id)a4 queryID:(int64_t)a5 language:(id)a6 currentTime:(double)a7
{
  id v12;
  id v13;
  id v14;
  PRSRankingItemRanker *v15;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[PRSRankingItemRanker initWithSearchString:userQueryString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:](self, "initWithSearchString:userQueryString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:", v14, v13, a5, v12, +[PRSRankingItemRanker isCJK](PRSRankingItemRanker, "isCJK"), 0.0, 0.0, a7);

  return v15;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 userQueryString:(id)a4 queryID:(int64_t)a5 language:(id)a6 isCJK:(BOOL)a7 experimentalWeight1:(double)a8 experimentalWeight2:(double)a9 currentTime:(double)a10
{
  id v19;
  id v20;
  id v21;
  PRSRankingItemRanker *v22;
  PRSRankingItemRanker *v23;
  int v24;
  float v25;
  uint64_t v26;
  NSMapTable *bundleFeatures;
  NSArray *rankCategories;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *queryTerms;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  NSObject *v46;
  NSObject *v47;
  void *v49;
  id *p_searchString;
  id v51;
  id v52;
  Boolean keyExistsAndHasValidFormat;
  objc_super v54;

  v19 = a3;
  v20 = a4;
  v21 = a6;
  v54.receiver = self;
  v54.super_class = (Class)PRSRankingItemRanker;
  v22 = -[PRSRankingItemRanker init](&v54, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_userQueryString, a4);
    v23->_queryID = a5;
    objc_storeStrong((id *)&v23->_searchString, a3);
    objc_storeStrong((id *)&v23->_keyboardLanguage, a6);
    if (objc_msgSend(v19, "length"))
    {
      v24 = SSStringEndsWithSpace(v19);
      v25 = 0.0;
      if (v24)
        v25 = 1.0;
    }
    else
    {
      v25 = 0.0;
    }
    v23->_lastIsSpaceFeature = v25;
    v23->_isCJK = a7;
    *(_OWORD *)&v23->_countQPUSpecialToken = xmmword_1B87E0E40;
    objc_msgSend(CFSTR("com.apple.searchd"), "UTF8String");
    v23->_isInternalDevice = os_variant_has_internal_diagnostics();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v26 = objc_claimAutoreleasedReturnValue();
    bundleFeatures = v23->_bundleFeatures;
    v23->_bundleFeatures = (NSMapTable *)v26;

    rankCategories = v23->_rankCategories;
    v23->_rankCategories = 0;

    v23->_experimentalWeight1 = a8;
    v23->_experimentalWeight2 = a9;
    +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23->_policyDisabled = objc_msgSend(v29, "disablePolicy");

    if (v23->_isInternalDevice)
    {
      keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(CFSTR("SearchRankingDisablePolicy"), CFSTR("com.apple.searchd"), &keyExistsAndHasValidFormat))
      {
        v23->_policyDisabled = keyExistsAndHasValidFormat != 0;
      }
    }
    p_searchString = (id *)&v23->_searchString;
    v51 = v21;
    v52 = v20;
    v23->_currentTime = a10;
    *(_DWORD *)&v23->_hasPolicyMultipleTermsPhraseMatch = 0;
    v23->_isContentWord = 0;
    SSPhraseQueryUnquoteString(v23->_searchString);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:fuzzyThreshold:options:", v30, v23->_keyboardLanguage, 0, 0);
    objc_msgSend(v31, "setMatchOncePerTerm:", 0);
    objc_msgSend(v31, "queryTerms");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v23->_queryTermCount = objc_msgSend(v32, "count");

    v23->_queryTermLength = objc_msgSend(v30, "length");
    v23->_containsEnglishAlphabetInQuery = +[PRSRankingUtilities aToZInString:](PRSRankingUtilities, "aToZInString:", v23->_searchString);
    v23->_containsDigitInQuery = +[PRSRankingUtilities digitInString:](PRSRankingUtilities, "digitInString:", v23->_searchString);
    objc_msgSend(v31, "queryTerms");
    v33 = objc_claimAutoreleasedReturnValue();
    queryTerms = v23->_queryTerms;
    v23->_queryTerms = (NSArray *)v33;

    *(_WORD *)&v23->_isPeopleSearch = 0;
    v23->_isNLSearch = 0;
    v23->_topHitMaxCount = 0;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    while (objc_msgSend(v36, "caseInsensitiveCompare:", sSpecialAltNamePrefixMatchQueriesList[v37]))
    {
      if (++v37 == 5)
        goto LABEL_15;
    }
    v23->_isAltNamePrefixMatchOnlyTopHitExcludedQuery = 1;
LABEL_15:
    if (!objc_msgSend(v36, "caseInsensitiveCompare:", CFSTR("aapl")))
      v23->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery = 1;
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0DA9B90], "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38 && objc_msgSend(*p_searchString, "length"))
      {
        objc_msgSend(v38, "getTokenIDsForText:", *p_searchString);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }
      objc_msgSend(v31, "setQueryTokenCount:", 0);
      objc_msgSend(v31, "setQueryID:", a5);
      if (objc_msgSend(v39, "count"))
      {
        v49 = v38;
        v40 = objc_msgSend(v39, "count");
        objc_msgSend(v39, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToNumber:", &unk_1E6E9A110);

        v43 = v40 - v42;
        if ((unint64_t)objc_msgSend(v39, "count") >= 2)
        {
          objc_msgSend(v39, "lastObject");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isEqualToNumber:", &unk_1E6E9A110);

          v43 -= v45;
        }
        v38 = v49;
        if (!v43)
        {
          SSGeneralLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[PRSRankingItemRanker initWithSearchString:userQueryString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:].cold.2((uint64_t)&v23->_queryID, (uint64_t)p_searchString);

        }
        v23->_queryTokenCount = v43;
      }
      else
      {
        SSGeneralLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[PRSRankingItemRanker initWithSearchString:userQueryString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:].cold.1((uint64_t)&v23->_queryID, (uint64_t)p_searchString);

      }
    }

    v21 = v51;
    v20 = v52;
  }

  return v23;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 queryID:(int64_t)a4 language:(id)a5 currentTime:(double)a6
{
  id v10;
  id v11;
  PRSRankingItemRanker *v12;

  v10 = a5;
  v11 = a3;
  v12 = -[PRSRankingItemRanker initWithSearchString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:](self, "initWithSearchString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:", v11, a4, v10, +[PRSRankingItemRanker isCJK](PRSRankingItemRanker, "isCJK"), 0.0, 0.0, a6);

  return v12;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 queryID:(int64_t)a4 language:(id)a5 isCJK:(BOOL)a6 experimentalWeight1:(double)a7 experimentalWeight2:(double)a8 currentTime:(double)a9
{
  return -[PRSRankingItemRanker initWithSearchString:userQueryString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:](self, "initWithSearchString:userQueryString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:", a3, a3, a4, a5, a6, a7, a8, a9);
}

- (void)resetWithSearchString:(id)a3
{
  -[PRSRankingItemRanker resetWithSearchString:userQueryString:](self, "resetWithSearchString:userQueryString:", a3, a3);
}

- (void)resetWithSearchString:(id)a3 userQueryString:(id)a4
{
  id v7;
  int v8;
  float v9;
  NSMapTable *v10;
  NSMapTable *bundleFeatures;
  NSArray *rankCategories;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *queryTerms;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_userQueryString, a4);
  objc_storeStrong((id *)&self->_searchString, a3);
  if (objc_msgSend(v21, "length"))
  {
    v8 = SSStringEndsWithSpace(v21);
    v9 = 0.0;
    if (v8)
      v9 = 1.0;
  }
  else
  {
    v9 = 0.0;
  }
  self->_lastIsSpaceFeature = v9;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  bundleFeatures = self->_bundleFeatures;
  self->_bundleFeatures = v10;

  rankCategories = self->_rankCategories;
  self->_rankCategories = 0;

  self->_isContentWord = 0;
  *(_DWORD *)&self->_hasPolicyMultipleTermsPhraseMatch = 0;
  SSPhraseQueryUnquoteString(self->_searchString);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:fuzzyThreshold:options:", v13, self->_keyboardLanguage, 0, 0);
  objc_msgSend(v14, "setMatchOncePerTerm:", 0);
  objc_msgSend(v14, "queryTerms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_queryTermCount = objc_msgSend(v15, "count");

  self->_queryTermLength = objc_msgSend(v13, "length");
  self->_containsEnglishAlphabetInQuery = +[PRSRankingUtilities aToZInString:](PRSRankingUtilities, "aToZInString:", self->_searchString);
  self->_containsDigitInQuery = +[PRSRankingUtilities digitInString:](PRSRankingUtilities, "digitInString:", self->_searchString);
  objc_msgSend(v14, "queryTerms");
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  queryTerms = self->_queryTerms;
  self->_queryTerms = v16;

  *(_WORD *)&self->_isPeopleSearch = 0;
  self->_isNLSearch = 0;
  self->_topHitMaxCount = 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  while (objc_msgSend(v19, "caseInsensitiveCompare:", sSpecialAltNamePrefixMatchQueriesList[v20]))
  {
    if (++v20 == 5)
      goto LABEL_11;
  }
  self->_isAltNamePrefixMatchOnlyTopHitExcludedQuery = 1;
LABEL_11:
  if (!objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("aapl")))
    self->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery = 1;

}

- (void)parseQUQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  NSArray *v23;
  NSArray *itemQPQUOutputTokenInfo;
  NSArray *v25;
  NSArray *quIntentScores;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  NSArray *v34;
  NSArray *quIntentLabels;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  float v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  unsigned int v48;
  void *v49;
  float v50;
  float v51;
  char v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  float v74;
  double v75;
  int v76;
  int v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t k;
  void *v98;
  float v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t m;
  void *v106;
  NSObject *v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  float v112;
  double v113;
  double v114;
  int v115;
  int v116;
  char v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v123;
  __CFString *v124;
  NSObject *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  id obj;
  id v139;
  id v140;
  int64_t v141;
  void *v142;
  void *v143;
  uint64_t v144;
  id v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint8_t buf[4];
  void *v168;
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  double v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  int v176;
  __int16 v177;
  int v178;
  __int16 v179;
  void *v180;
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    if (parseQUQuery__onceToken != -1)
      dispatch_once(&parseQUQuery__onceToken, &__block_literal_global_575);
    objc_msgSend(v3, "queryUnderstandingOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEarliestTokenFromQU:", 0);
    objc_msgSend(v3, "setLatestTokenFromQU:", 0);
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kQPQUIntentScores"));
      v125 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kQPQUIntentIds"));
      v139 = (id)objc_claimAutoreleasedReturnValue();
      v121 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = (void *)objc_opt_new();
      v163 = 0u;
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      obj = v5;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v185, 16);
      if (v6)
      {
        v7 = v6;
        v141 = 0;
        v144 = *(_QWORD *)v164;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v164 != v144)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
            v10 = (void *)objc_opt_new();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUOutputToken"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("kQPQUOutputToken"));
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgScores"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgLabels"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "count");
            v15 = objc_msgSend(v13, "count");
            if (v14 >= v15)
              v16 = v15;
            else
              v16 = v14;
            if (v16)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v17)
                v20 = v18 == 0;
              else
                v20 = 1;
              if (!v20)
                v141 += objc_msgSend(v18, "isEqualToString:", CFSTR("ARG_UNSPECIFIED")) ^ 1;
              objc_msgSend(v10, "setObject:forKey:", v17, CFSTR("kQPQUOutputTokenArgScores"));
              objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("kQPQUOutputTokenArgLabels"));

            }
            v21 = (void *)objc_msgSend(v10, "copy");
            objc_msgSend(v143, "addObject:", v21);

          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v185, 16);
        }
        while (v7);
      }
      else
      {
        v141 = 0;
      }

      v23 = (NSArray *)objc_msgSend(v143, "copy");
      itemQPQUOutputTokenInfo = self->_itemQPQUOutputTokenInfo;
      self->_itemQPQUOutputTokenInfo = v23;

      self->_countQPUSpecialToken = v141;
      v25 = -[NSObject copy](v125, "copy");
      quIntentScores = self->_quIntentScores;
      self->_quIntentScores = v25;

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v139, "count"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = 0u;
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v140 = v139;
      v27 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v159, v184, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v160;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v160 != v29)
              objc_enumerationMutation(v140);
            v31 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * j);
            v32 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v31, "intValue");
            v33 = (void *)objc_msgSend(v32, "initWithUTF8String:", intentLabel());
            objc_msgSend(v142, "addObject:", v33);

          }
          v28 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v159, v184, 16);
        }
        while (v28);
      }

      v34 = (NSArray *)objc_msgSend(v142, "copy");
      quIntentLabels = self->_quIntentLabels;
      self->_quIntentLabels = v34;

      if (-[NSObject count](v125, "count") && objc_msgSend(v140, "count"))
      {
        v36 = -[NSObject count](v125, "count");
        v37 = objc_msgSend(v140, "count");
        if (v36 >= v37)
          v36 = v37;
        if (v36)
        {
          v38 = 0;
          while (1)
          {
            v126 = v38;
            SSGeneralLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v3, "searchString");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "objectAtIndexedSubscript:", v38);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "intValue");
              v60 = intentLabel();
              -[NSObject objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v126);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v168 = v58;
              v169 = 2080;
              v170 = v60;
              v171 = 2112;
              v172 = *(double *)&v61;
              _os_log_debug_impl(&dword_1B86C5000, v39, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [QU] query=%@ QU_Intent=%s Score=%@", buf, 0x20u);

            }
            -[NSObject objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v126);
            v40 = objc_claimAutoreleasedReturnValue();
            -[NSObject floatValue](v40, "floatValue");
            if (v41 <= 0.1 || (objc_msgSend(v3, "earliestTokenFromQU") & 1) != 0)
              goto LABEL_43;
            v52 = objc_msgSend(v3, "latestTokenFromQU");

            if ((v52 & 1) == 0)
            {
              objc_msgSend(v140, "objectAtIndexedSubscript:", v126);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "intValue");
              v54 = isEventSearchIntent();

              if (v54)
              {
                objc_msgSend(v3, "searchString");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v55, "rangeOfString:", CFSTR(" next ")) == 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v3, "searchString");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v56, "rangeOfString:", CFSTR(" upcoming ")) == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v3, "searchString");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v3, "setEarliestTokenFromQU:", objc_msgSend(v57, "rangeOfString:", CFSTR(" earliest ")) != 0x7FFFFFFFFFFFFFFFLL);

                  }
                  else
                  {
                    objc_msgSend(v3, "setEarliestTokenFromQU:", 1);
                  }
                  v62 = v134;

                }
                else
                {
                  objc_msgSend(v3, "setEarliestTokenFromQU:", 1);
                  v62 = v134;
                }

                objc_msgSend(v3, "searchString");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v63, "rangeOfString:", CFSTR(" last ")) == 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v3, "searchString");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v64, "rangeOfString:", CFSTR(" previous ")) == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v3, "searchString");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v3, "setLatestTokenFromQU:", objc_msgSend(v65, "rangeOfString:", CFSTR(" latest ")) != 0x7FFFFFFFFFFFFFFFLL);

                  }
                  else
                  {
                    objc_msgSend(v3, "setLatestTokenFromQU:", 1);
                  }

                }
                else
                {
                  objc_msgSend(v3, "setLatestTokenFromQU:", 1);
                }

                if ((objc_msgSend(v3, "earliestTokenFromQU") & 1) != 0
                  || objc_msgSend(v3, "latestTokenFromQU"))
                {
                  break;
                }
              }
            }
LABEL_44:
            v42 = (void *)parseQUQuery__sQUIntentThresholds;
            objc_msgSend(v140, "objectAtIndexedSubscript:", v126);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v123 = v44;
            if (v44)
            {
              objc_msgSend(v44, "floatValue");
              v46 = v45;
            }
            else
            {
              objc_msgSend(v140, "objectAtIndexedSubscript:", v126);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "intValue");
              v48 = isEventSearchIntent();

              if (v48)
                v46 = 0.6;
              else
                v46 = 0.9;
            }
            -[NSObject objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v126);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "floatValue");
            v51 = v50;

            if (v51 > v46)
            {
              objc_msgSend(v140, "objectAtIndexedSubscript:", v126);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setIntentFromQU:", objc_msgSend(v79, "intValue"));

              v157 = 0u;
              v158 = 0u;
              v155 = 0u;
              v156 = 0u;
              v80 = obj;
              v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v155, v183, 16);
              if (!v81)
              {
                v124 = &stru_1E6E549F0;
                goto LABEL_119;
              }
              v82 = v81;
              v83 = *(_QWORD *)v156;
              v124 = &stru_1E6E549F0;
              v127 = *(_QWORD *)v156;
              v128 = v80;
              while (1)
              {
                v84 = 0;
                v130 = v82;
                do
                {
                  if (*(_QWORD *)v156 != v83)
                    objc_enumerationMutation(v80);
                  v136 = v84;
                  v85 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v84);
                  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("kQPQUOutputToken"));
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgScores"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgIds"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v132 = v86;
                  v133 = v87;
                  if (!objc_msgSend(v86, "length"))
                    goto LABEL_114;
                  v89 = v136;
                  if (objc_msgSend(v87, "count") && objc_msgSend(v88, "count"))
                  {
                    objc_msgSend(v88, "objectAtIndexedSubscript:", 0);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v90, "intValue") == 1)
                      goto LABEL_90;
                    objc_msgSend(v88, "objectAtIndexedSubscript:", 0);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    v92 = objc_msgSend(v91, "intValue");

                    if (v92)
                    {
                      if (-[__CFString length](v124, "length"))
                      {
                        -[__CFString stringByAppendingString:](v124, "stringByAppendingString:", CFSTR(" "));
                        v90 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v90 = v124;
                      }
                      objc_msgSend(v90, "stringByAppendingString:", v86);
                      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_90:
                      v93 = v87;

                    }
                    else
                    {
                      v93 = v87;
                    }
                    v153 = 0u;
                    v154 = 0u;
                    v151 = 0u;
                    v152 = 0u;
                    v145 = v93;
                    v94 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v151, v182, 16);
                    if (v94)
                    {
                      v95 = v94;
                      v96 = *(_QWORD *)v152;
                      do
                      {
                        for (k = 0; k != v95; ++k)
                        {
                          if (*(_QWORD *)v152 != v96)
                            objc_enumerationMutation(v145);
                          v98 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * k);
                          if (v98)
                          {
                            objc_msgSend(v98, "floatValue");
                            if (v99 > 0.8)
                            {
                              v149 = 0u;
                              v150 = 0u;
                              v147 = 0u;
                              v148 = 0u;
                              v100 = v88;
                              v101 = v88;
                              v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v147, v181, 16);
                              if (v102)
                              {
                                v103 = v102;
                                v104 = *(_QWORD *)v148;
                                do
                                {
                                  for (m = 0; m != v103; ++m)
                                  {
                                    if (*(_QWORD *)v148 != v104)
                                      objc_enumerationMutation(v101);
                                    v106 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * m);
                                    if (v106)
                                    {
                                      if (objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * m), "intValue") == 51)
                                      {
                                        objc_msgSend(v3, "setEarliestTokenFromQU:", 1);
                                      }
                                      else if (objc_msgSend(v106, "intValue") == 52)
                                      {
                                        objc_msgSend(v3, "setLatestTokenFromQU:", 1);
                                      }
                                    }
                                  }
                                  v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v147, v181, 16);
                                }
                                while (v103);
                              }

                              v88 = v100;
                            }
                          }
                        }
                        v95 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v151, v182, 16);
                      }
                      while (v95);
                    }

                    v83 = v127;
                    v80 = v128;
                    v82 = v130;
LABEL_114:
                    v89 = v136;
                  }

                  v84 = v89 + 1;
                }
                while (v84 != v82);
                v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v155, v183, 16);
                if (!v82)
                {
LABEL_119:

                  if (-[__CFString length](v124, "length"))
                  {
                    -[PRSRankingItemRanker setParsedQueryFromQU:](self, "setParsedQueryFromQU:", v124);
                    objc_msgSend(v3, "setParsedQueryFromQU:", v124);
                  }
                  SSGeneralLog();
                  v107 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                  {
                    v108 = _os_feature_enabled_impl();
                    objc_msgSend(v3, "searchString");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    v110 = v109;
                    v146 = v109;
                    if ((v108 & 1) == 0)
                    {
                      SSRedactString(v109, 1);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v3, "intentFromQU");
                    v137 = intentLabel();
                    -[NSObject objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v126);
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "floatValue");
                    v113 = v112;
                    v114 = v46;
                    v115 = objc_msgSend(v3, "earliestTokenFromQU");
                    v116 = objc_msgSend(v3, "latestTokenFromQU");
                    v117 = _os_feature_enabled_impl();
                    -[PRSRankingItemRanker parsedQueryFromQU](self, "parsedQueryFromQU");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    v119 = v118;
                    v120 = v118;
                    if ((v117 & 1) == 0)
                    {
                      SSRedactString(v118, 1);
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    *(_DWORD *)buf = 138413826;
                    v168 = v146;
                    v169 = 2080;
                    v170 = v137;
                    v171 = 2048;
                    v172 = v113;
                    v173 = 2048;
                    v174 = *(_QWORD *)&v114;
                    v175 = 1024;
                    v176 = v115;
                    v177 = 1024;
                    v178 = v116;
                    v179 = 2112;
                    v180 = v120;
                    _os_log_impl(&dword_1B86C5000, v107, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] query=%@ QU_Intent=%s detected score=%f threshold=%f earliest=%i latest=%i parsedQueryFromQU=%@", buf, 0x40u);
                    if ((v117 & 1) == 0)

                    if ((v108 & 1) == 0)
                  }

                  goto LABEL_132;
                }
              }
            }

            v38 = v126 + 1;
            if (v36 == v126 + 1)
              goto LABEL_132;
          }
          SSGeneralLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v66 = _os_feature_enabled_impl();
            objc_msgSend(v3, "searchString");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67;
            v135 = v66;
            if ((v66 & 1) != 0)
            {
              v69 = v67;
              v70 = v140;
            }
            else
            {
              SSRedactString(v67, 1);
              v129 = v68;
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v131;
              v70 = v140;
              v69 = v62;
            }
            objc_msgSend(v70, "objectAtIndexedSubscript:", v126);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "intValue");
            v72 = intentLabel();
            -[NSObject objectAtIndexedSubscript:](v125, "objectAtIndexedSubscript:", v126);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "floatValue");
            v75 = v74;
            v76 = objc_msgSend(v3, "earliestTokenFromQU");
            v77 = objc_msgSend(v3, "latestTokenFromQU");
            *(_DWORD *)buf = 138413570;
            v168 = v68;
            v169 = 2080;
            v170 = v72;
            v171 = 2048;
            v172 = v75;
            v173 = 2048;
            v174 = 0x3FB99999A0000000;
            v175 = 1024;
            v176 = v76;
            v177 = 1024;
            v178 = v77;
            _os_log_impl(&dword_1B86C5000, v40, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] query=%@ QU Event Token Intent detected %s crossed confidence threshold with score = %f (threshold = %f) and found lexical match for earliest=%i latest=%i", buf, 0x36u);

            v78 = v69;
            if ((v135 & 1) == 0)
            {

              v78 = v129;
            }
            v134 = v69;

          }
LABEL_43:

          goto LABEL_44;
        }
      }
LABEL_132:

      v4 = v121;
      v22 = v125;
    }
    else
    {
      SSGeneralLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B86C5000, v22, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] No QU available, queryUnderstandingOutput empty", buf, 2u);
      }
    }

  }
}

void __37__PRSRankingItemRanker_parseQUQuery___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", &unk_1E6E9A3E0, &unk_1E6E9A128, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)parseQUQuery__sQUIntentThresholds;
  parseQUQuery__sQUIntentThresholds = v0;

}

- (void)serializeAnonymousQueryLogFeaturesToJSONWithWriter:(void *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  float v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  float v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_currentTime);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v7;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  json_writer_add_key((uint64_t)a3, "queryTokenCount", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_int64((uint64_t)a3, self->_queryTokenCount);
  json_writer_add_key((uint64_t)a3, "queryDate", 0xFFFFFFFFFFFFFFFFLL, 1);
  v34 = objc_retainAutorelease(v9);
  json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v34, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_key((uint64_t)a3, "queryHour", 0xFFFFFFFFFFFFFFFFLL, 1);
  v33 = objc_retainAutorelease(v11);
  json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v33, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_key((uint64_t)a3, "keyboardLanguage", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_string((uint64_t)a3, (char *)-[NSString UTF8String](self->_keyboardLanguage, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_key((uint64_t)a3, "isCJK", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_uint64((uint64_t)a3, self->_isCJK);
  v12 = objc_msgSend(MEMORY[0x1E0DA9B88], "version");
  json_writer_add_key((uint64_t)a3, "embeddingModelVersion", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_uint64((uint64_t)a3, v12);
  if (-[NSArray count](self->_quIntentLabels, "count"))
  {
    json_writer_add_key((uint64_t)a3, "quIntentLabels", 0xFFFFFFFFFFFFFFFFLL, 1);
    -[NSArray objectAtIndexedSubscript:](self->_quIntentLabels, "objectAtIndexedSubscript:", 0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v13, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  if (-[NSArray count](self->_quIntentScores, "count"))
  {
    json_writer_add_key((uint64_t)a3, "quIntentScores", 0xFFFFFFFFFFFFFFFFLL, 1);
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray objectAtIndexedSubscript:](self->_quIntentScores, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%0.4f"), v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v17, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[NSArray valueForKey:](self->_itemQPQUOutputTokenInfo, "valueForKey:", CFSTR("kQPQUOutputTokenArgLabels"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKey:](self->_itemQPQUOutputTokenInfo, "valueForKey:", CFSTR("kQPQUOutputTokenArgScores"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  json_writer_add_key((uint64_t)a3, "tokenParseLabel", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_begin_array((uint64_t)a3);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v42;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v20);
        json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v24++)), "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v22);
  }

  json_writer_end_array((uint64_t)a3);
  json_writer_add_key((uint64_t)a3, "tokenParseScore", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_begin_array((uint64_t)a3);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v19;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v29), "floatValue");
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%0.4f"), v31);
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v32, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v27);
  }

  json_writer_end_array((uint64_t)a3);
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PRSRankingItemRanker;
  -[PRSRankingItemRanker dealloc](&v2, sel_dealloc);
}

- (id)userQuery
{
  return self->_userQueryString;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)isContentWord
{
  return self->_isContentWord;
}

- (unint64_t)queryTermCount
{
  return self->_queryTermCount;
}

- (unint64_t)queryTermLength
{
  return self->_queryTermLength;
}

- (BOOL)isAltNamePrefixMatchOnlyTopHitExcludedQuery
{
  return self->_isAltNamePrefixMatchOnlyTopHitExcludedQuery;
}

- (BOOL)isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery
{
  return self->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery;
}

- (BOOL)containsEnglishAlphabetInQuery
{
  return self->_containsEnglishAlphabetInQuery;
}

- (BOOL)containsDigitInQuery
{
  return self->_containsDigitInQuery;
}

- (BOOL)isPeopleSearch
{
  return self->_isPeopleSearch;
}

- (BOOL)isNLSearch
{
  return self->_isNLSearch;
}

- (BOOL)isFuzzySearch
{
  return self->_isFuzzySearch;
}

- (void)setRankCategories:(id)a3
{
  objc_storeStrong((id *)&self->_rankCategories, a3);
}

- (void)setQueryTerms:(id)a3
{
  objc_storeStrong((id *)&self->_queryTerms, a3);
}

- (void)setIsNLSearch:(BOOL)a3
{
  self->_isNLSearch = a3;
}

- (void)setIsPeopleSearch:(BOOL)a3
{
  self->_isPeopleSearch = a3;
}

- (void)setIsFuzzySearch:(BOOL)a3
{
  self->_isFuzzySearch = a3;
}

- (NSArray)rankCategories
{
  return (NSArray *)(id)-[NSArray copy](self->_rankCategories, "copy");
}

- (NSArray)queryTerms
{
  return (NSArray *)(id)-[NSArray copy](self->_queryTerms, "copy");
}

- (void)setTopHitMaxCount:(unint64_t)a3
{
  self->_topHitMaxCount = a3;
}

- (id)rankingConfiguration
{
  PRSQueryRankingConfiguration *rankingConfiguration;
  PRSQueryRankingConfiguration *v4;
  PRSQueryRankingConfiguration *v5;
  uint64_t v7;

  rankingConfiguration = self->_rankingConfiguration;
  if (!rankingConfiguration)
  {
    LOBYTE(v7) = 0;
    -[PRSRankingItemRanker rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:](self, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", 0, 0, 0, 0, 0, 0, &stru_1E6E549F0, self->_searchString, 0, 0, v7, 0);
    v4 = (PRSQueryRankingConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rankingConfiguration;
    self->_rankingConfiguration = v4;

    rankingConfiguration = self->_rankingConfiguration;
  }
  return rankingConfiguration;
}

- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 spotlightQuery:(id)a9 keyboardLanguage:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[PRSRankingItemRanker rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:](self, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", a3, a4, a5, a6, a7, a8, a9, self->_searchString, 0, 0, v11, a10);
}

- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 isAdvancedSyntax:(BOOL)a9 spotlightQuery:(id)a10 userQuery:(id)a11 tokenString:(id)a12 queryKind:(unint64_t)a13 isPeopleSearch:(BOOL)a14 keyboardLanguage:(id)a15
{
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  PRSRankingItemRanker *v25;
  id v26;
  PRSQueryRankingConfiguration *v27;
  void *v28;
  void *v29;
  NSString *v31;
  NSString *searchString;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  NSString *v36;
  __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  __CFString *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  PRSRankingItemRanker *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  int v90;
  uint32_t v91;
  id *p_rankingConfiguration;
  PRSQueryRankingConfiguration *rankingConfiguration;
  void *v94;
  void *v95;
  NSString *v96;
  id v97;
  PRSRankingItemRanker *v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  _BOOL4 v105;
  __CFString *v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  _BYTE v116[128];
  uint64_t v117;

  v105 = a8;
  v117 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v109 = a7;
  v23 = (__CFString *)a10;
  v108 = a11;
  v24 = a12;
  v25 = self;
  v26 = a15;
  v107 = v24;
  if ((-[NSString length](v25->_searchString, "length") || a9 || v105) && !v25->_isCancelled)
  {
    v106 = v23;
    -[PRSRankingItemRanker setMeContactIdentifier:](v25, "setMeContactIdentifier:", v110);
    -[PRSRankingItemRanker setClientBundle:](v25, "setClientBundle:", v109);
    if (a14)
      v31 = 0;
    else
      v31 = v25->_searchString;
    v102 = v26;
    v115 = 0;
    v96 = v31;
    SSPhraseQueryEscapeString(v31, &v115);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v115;
    searchString = v25->_searchString;
    if (searchString)
    {
      v33 = SSStringStartsWithDoubleQuote(searchString);
      v34 = SSStringEndsWithDoubleQuote(v25->_searchString);
      v35 = v33 & (v34 | SSStringEndsWithSpace(v25->_searchString));
      v36 = v25->_searchString;
    }
    else
    {
      v36 = 0;
      LOBYTE(v35) = 0;
    }
    if ((a13 & 0xFFFFFFFFFFFFFFFELL) == 4)
      LOBYTE(v35) = 1;
    v25->_exact = v35;
    v25->_isPeopleSearch = a14;
    v25->_isContentWord = +[PRSRankingItemRanker isContentWordQuery:queryTermCount:keyboardLanguage:](PRSRankingItemRanker, "isContentWordQuery:queryTermCount:keyboardLanguage:", v36, objc_msgSend(v100, "count"), v102);
    if (v23)
      v37 = v23;
    else
      v37 = &stru_1E6E549F0;
    v97 = v22;
    v99 = v20;
    v104 = v21;
    PRSRankingQueriesWithUserQuery(v24, v25->_searchString, v37, v101, v100, v20, v110, v21, v22, v108, a13, a14, v102, v109);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v25;
    -[PRSRankingItemRanker setQueryKind:](v25, "setQueryKind:", a13);
    v27 = objc_alloc_init(PRSQueryRankingConfiguration);
    -[PRSQueryRankingConfiguration setRankingQueries:](v27, "setRankingQueries:", v38);
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
    if (v40)
    {
      v41 = v40;
      v42 = 0;
      v43 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v112 != v43)
            objc_enumerationMutation(v39);
          v45 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            ++v42;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v45, "objectForKey:", CFSTR("kCIBitCount"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v42 += objc_msgSend(v46, "integerValue");

            }
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
      }
      while (v41);
    }
    else
    {
      v42 = 0;
    }

    -[PRSQueryRankingConfiguration setRankingBitCount:](v27, "setRankingBitCount:", v42);
    PRSRankingQueryIndexDictionary();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_alloc(MEMORY[0x1E0C99E40]);
    PRSRankingItemRequiredAttributes();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v48, "initWithArray:", v49);
    -[PRSQueryRankingConfiguration setRequiredAttributes:](v27, "setRequiredAttributes:", v50);

    -[PRSQueryRankingConfiguration setStrongRankingQueryCount:](v27, "setStrongRankingQueryCount:", 1);
    objc_msgSend(v47, "objectForKey:", CFSTR("PRSRankingTCNearMatch"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setDominantRankingQueryCount:](v27, "setDominantRankingQueryCount:", v42 - objc_msgSend(v51, "integerValue"));

    objc_msgSend(v47, "objectForKey:", CFSTR("PRSRankingRecency365Days"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setDominatedRankingQueryCount:](v27, "setDominatedRankingQueryCount:", objc_msgSend(v52, "integerValue") - 1);

    objc_msgSend(v47, "objectForKey:", CFSTR("kMDItemShortcutWithinBagParamValue"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setShortcutBit:](v27, "setShortcutBit:", objc_msgSend(v53, "integerValue"));

    objc_msgSend(v47, "objectForKey:", CFSTR("PRSPolicyFieldsExactPhraseMatchBit"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setHighMatchBit:](v27, "setHighMatchBit:", objc_msgSend(v54, "integerValue"));

    objc_msgSend(v47, "objectForKey:", CFSTR("PRSRankingTCNearMatch"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setLowMatchBit:](v27, "setLowMatchBit:", objc_msgSend(v55, "integerValue"));

    objc_msgSend(v47, "objectForKey:", CFSTR("PRSRankingRecency1Days"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setHighRecencyBit:](v27, "setHighRecencyBit:", objc_msgSend(v56, "integerValue"));

    objc_msgSend(v47, "objectForKey:", CFSTR("PRSRankingRecency365Days"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSQueryRankingConfiguration setLowRecencyBit:](v27, "setLowRecencyBit:", objc_msgSend(v57, "integerValue"));

    objc_msgSend(v47, "objectForKey:", CFSTR("kMDItemEscapedWord"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "integerValue");
    if ((v59 & 0x40) != 0)
      v60 = 1 << v59;
    else
      v60 = 0;
    if ((v59 & 0x40) != 0)
      v61 = 0;
    else
      v61 = 1 << v59;
    objc_msgSend(v47, "objectForKey:", CFSTR("kMDItemDisplayNameCorrections"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "integerValue");
    v64 = 1 << v63;
    if ((v63 & 0x40) != 0)
      v65 = 1 << v63;
    else
      v65 = 0;
    if ((v63 & 0x40) != 0)
      v64 = 0;
    -[PRSQueryRankingConfiguration setFuzzyMatchMask:](v27, "setFuzzyMatchMask:", v64 | v61, v65 | v60);

    objc_msgSend(v47, "objectForKey:", CFSTR("kMDItemDisplayNameCorrections"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "integerValue");
    if ((v67 & 0x40) != 0)
      v68 = 0;
    else
      v68 = 1 << v67;
    if ((v67 & 0x40) != 0)
      v69 = 1 << v67;
    else
      v69 = 0;
    -[PRSQueryRankingConfiguration setFuzzyMatchCheck:](v27, "setFuzzyMatchCheck:", v68, v69);

    PRSLogCategoryDefault();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      -[PRSRankingItemRanker rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:isAdvancedSyntax:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:].cold.1(v27, v70);

    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    v29 = v109;
    v72 = CFSTR("engagementCount");
    v21 = v104;
    if (objc_msgSend(v109, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("engagementCount"), v109);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v103 = v71;
    objc_msgSend(v71, "objectForKey:", v72);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = (void *)v73;
    v75 = &unk_1E6E9A140;
    if (v73)
      v75 = (void *)v73;
    v76 = v75;

    v77 = objc_msgSend(v76, "integerValue");
    v78 = v98;
    if (-[PRSRankingItemRanker isInternalDevice](v98, "isInternalDevice"))
    {
      v79 = 1;
    }
    else
    {
      v80 = v77 + 1;
      if (objc_msgSend(v109, "isEqualToString:", CFSTR("com.apple.searchd")))
      {
        +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "collectAnonymousData");

        if (v82)
        {
          v83 = arc4random() % v80;
          objc_msgSend(v103, "objectForKey:", CFSTR("collectedBundleID"));
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = v83 | v84;
          +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "anonymousMetadataUndesiredBundleIDs");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          v94 = v87;
          v95 = (void *)v84;
          v88 = objc_msgSend(v87, "containsObject:", v84);
          v89 = arc4random() % v80;
          if (v89)
            v90 = 0;
          else
            v90 = v88 ^ 1;
          if (((v88 ^ 1) & 1) != 0)
          {
            v20 = v99;
          }
          else
          {
            v20 = v99;
            if (!v89)
            {
              v91 = arc4random();
              v90 = 0;
              v88 = v91 % v80 == 0;
            }
          }
          v79 = (v85 == 0) | v88 | v90;

        }
        else
        {
          v79 = 0;
        }
        v21 = v104;
        v78 = v98;
      }
      else
      {
        v79 = arc4random() % v80 == 0;
        v21 = v104;
      }
    }
    -[PRSQueryRankingConfiguration setAllowAnonymousDataCollection:](v27, "setAllowAnonymousDataCollection:", v79);
    rankingConfiguration = v78->_rankingConfiguration;
    p_rankingConfiguration = (id *)&v78->_rankingConfiguration;
    if (!rankingConfiguration)
      objc_storeStrong(p_rankingConfiguration, v27);

    v28 = v110;
    v22 = v97;
    v23 = v106;
    v26 = v102;
  }
  else
  {
    v27 = 0;
    v29 = v109;
    v28 = v110;
  }

  return v27;
}

- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 spotlightQuery:(id)a9 userQuery:(id)a10 tokenString:(id)a11 queryKind:(unint64_t)a12 isPeopleSearch:(BOOL)a13 keyboardLanguage:(id)a14
{
  uint64_t v15;
  uint64_t v16;

  LOBYTE(v16) = 0;
  LOBYTE(v15) = 0;
  return -[PRSRankingItemRanker rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:isAdvancedSyntax:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:](self, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:isAdvancedSyntax:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", a3, a4, a5, a6, a7, a8, v15, a9, self->_searchString, 0, 0, v16, a14);
}

- (void)activate
{
  id v2;

  +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)deactivate
{
  id v2;

  +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivate");

}

- (void)updateResultSetContext:(_resultset_computation_ctx *)a3 andUniqueScores:(id)a4 withResultSetItems:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  _BYTE *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  float v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  id v46;
  _BYTE *v47;
  id obj;
  id v49;
  uint64_t v50;
  uint64_t *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[12940];
  _BYTE v57[128];
  uint64_t v58;

  v5 = ((uint64_t (*)(PRSRankingItemRanker *, SEL, _resultset_computation_ctx *, id, id))MEMORY[0x1E0C80A78])(self, a2, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v10 = (_BYTE *)v5;
  v58 = *MEMORY[0x1E0C80C00];
  v12 = v11;
  v13 = v7;
  if (!v10[38])
  {
    v51 = v9;
    objc_msgSend(v10, "bundleFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.mobilemail"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      *((_BYTE *)v9 + 8) = 1;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 42);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      *((_DWORD *)v9 + 3) = v17;

    }
    v47 = v10;
    objc_msgSend(v10, "bundleFeatures");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("com.apple.MobileSMS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      *((_BYTE *)v9 + 9) = 1;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      *((_DWORD *)v9 + 4) = v21;

    }
    v45 = v15;
    v46 = v13;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v13;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v22)
    {
      v23 = v22;
      v24 = v9 + 3;
      v49 = v12;
      v50 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v53 != v50)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          bzero(v56, 0x328CuLL);
          objc_msgSend(v26, "L2FeatureVector");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "getAllScores:", v56);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PRSRankingItem inputToModelScore]((uint64_t)v26));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v29);

          v30 = 0;
          v31 = *v51;
          do
          {
            v32 = *(float *)(v28 + 4 * (unsigned __int16)sResultSetFeatures[v30 + 1]);
            if (*(float *)(v31 + v30 * 2) < v32)
              *(float *)(v31 + v30 * 2) = v32;
            v30 += 2;
          }
          while (v30 != 86);
          objc_msgSend(v26, "sectionBundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
            || objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
          {
            if ((objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
            {
              v34 = 0;
              v35 = 22;
            }
            else
            {
              v36 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.MobileSMS"));
              if (v36)
                v34 = 22;
              else
                v34 = 0;
              if (!v36)
                goto LABEL_33;
              v35 = 44;
            }
            do
            {
              if (v34 >= 0x2C)
                shouldUpdateFuncForSnippetFeature_cold_1();
              v37 = (uint64_t)*(&off_1E6E53D78 + v34);
              v38 = *(float *)(v28 + 4 * associatedL2FeatureFromSnippetFeature(v34));
              if ((*(unsigned int (**)(uint64_t, float, float))(v37 + 16))(v37, *((float *)v24 + v34), v38))
                *((float *)v24 + v34) = v38;
              ++v34;
            }
            while (v35 != v34);
          }
          else
          {
            objc_msgSend(v47, "bundleFeatures");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKey:", v33);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v40, "count"))
            {
              objc_msgSend(v40, "objectAtIndexedSubscript:", 42);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "integerValue");

              if (v42 == 1)
              {
                *((_BYTE *)v51 + 10) = 1;
                objc_msgSend(v40, "objectAtIndexedSubscript:", 42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "floatValue");
                *((_DWORD *)v51 + 5) = v44;

              }
            }

          }
LABEL_33:

          v12 = v49;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v23);
    }

    if (!v47[38])
      objc_msgSend(v12, "sortWithOptions:usingComparator:", 1, &__block_literal_global_639);

    v13 = v46;
  }

}

uint64_t __82__PRSRankingItemRanker_updateResultSetContext_andUniqueScores_withResultSetItems___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

- (void)populateRankResultSetBundleFeaturesWithBundleItems:(id)a3 withUniqueBundleMaxScores:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  float v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[134];
  _WORD v54[3235];
  _DWORD v55[3235];
  _BYTE v56[128];
  uint64_t v57;

  v4 = ((uint64_t (*)(PRSRankingItemRanker *, SEL, id, id))MEMORY[0x1E0C80A78])(self, a2, a3, a4);
  v6 = v5;
  v7 = (_BYTE *)v4;
  v57 = *MEMORY[0x1E0C80C00];
  v9 = v8;
  v10 = v6;
  if (!v7[38])
  {
    v42 = v10;
    v38 = v9;
    v11 = (void *)objc_opt_class();
    objc_msgSend(v7, "bundleFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedUniqueBundleFeatureValuesFromBundleFeatures:", v12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v7, "bundleFeatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v39)
    {
      v37 = *(_QWORD *)v50;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v50 != v37)
            objc_enumerationMutation(v14);
          v41 = v15;
          v16 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v15);
          objc_msgSend(v7, "bundleFeatures");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v16;
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          bzero(v55, 0x328CuLL);
          bzero(v54, 0x1946uLL);
          v19 = 0;
          v20 = 0;
          do
          {
            if (v19 < 0x18 || v19 <= 0x2B && ((1 << v19) & 0x9F000000000) != 0)
            {
              objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_msgSend(v43, "objectAtIndexedSubscript:", v19);
                v22 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v22 = v42;
              }
              v23 = v22;
              v24 = objc_msgSend(v22, "indexOfObject:", v21);
              v25 = v24 + 1;
              v26 = (float)v24 / (float)(unint64_t)objc_msgSend(v23, "count");
              if (!v19)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:atIndexedSubscript:", v27, 34);

                *(float *)&v28 = v26;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:atIndexedSubscript:", v29, 35);

              }
              v48 = 0;
              objc_msgSend(v7, "relevantResultSetPRSL2FeaturesFromBundleFeature:absRankFeatureOut:relRankFeatureOut:", v19, (char *)&v48 + 2, &v48);
              *(float *)&v55[v20] = (float)v25;
              v30 = v20 + 1;
              v54[v20] = HIWORD(v48);
              *(float *)&v55[v20 + 1] = v26;
              v20 += 2;
              v54[v30] = v48;

            }
            ++v19;
          }
          while (v19 != 46);
          objc_msgSend(v38, "objectForKey:", v40);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v45 != v34)
                  objc_enumerationMutation(v31);
                objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "L2FeatureVector");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setScores:forFeatures:count:", v55, v54, v20);

              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            }
            while (v33);
          }

          v15 = v41 + 1;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v39);
    }

    v9 = v38;
    v10 = v42;
  }

}

- (void)updateResultSetFeaturesOnItems:(id)a3 withContext:(_resultset_computation_ctx *)a4 uniqueScores:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  BOOL *p_var1;
  BOOL *p_var2;
  float *var7;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  float *var0;
  __int16 *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  BOOL *v30;
  void *v31;
  id v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  PRSRankingItemRanker *v36;
  _resultset_computation_ctx *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[11];
  __int16 v44;
  float v45[3235];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!self->_isCancelled)
  {
    v36 = self;
    v37 = a4;
    v38 = v9;
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v8, "count");
    v12 = objc_msgSend(v8, "count");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v32 = v8;
    obj = v8;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v35)
    {
      v13 = (float)v10;
      v14 = (float)v11;
      v34 = *(_QWORD *)v40;
      v15 = (float)v12;
      p_var1 = &a4->var1;
      p_var2 = &a4->var2;
      var7 = a4->var7;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        if (v36->_isCancelled)
          goto LABEL_27;
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v19);
        bzero(v45, 0x328CuLL);
        bzero(v43, 0x1946uLL);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PRSRankingItem inputToModelScore]((uint64_t)v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v38, "indexOfObject:", v21);

        v23 = 0;
        v45[0] = (float)(v22 + 1);
        v45[1] = (float)v22 / v13;
        v45[2] = v14;
        v45[3] = v15;
        v43[0] = 0x761018D01890188;
        var0 = v37->var0;
        v25 = sResultSetFeatures;
        do
        {
          v45[v23 + 4] = var0[v23];
          v26 = *v25;
          v25 += 2;
          *((_WORD *)&v43[1] + v23++) = v26;
        }
        while (v23 != 43);
        if (v37->var3)
        {
          v45[47] = v37->var6;
          v44 = 1794;
          v27 = 48;
        }
        else
        {
          v27 = 47;
        }
        if (*p_var1)
          break;
        if (*p_var2)
          goto LABEL_17;
LABEL_25:
        objc_msgSend(v20, "L2FeatureVector", v32);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setScores:forFeatures:count:", v45, v43, v27);

        if (++v19 == v35)
        {
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          if (v35)
            goto LABEL_4;
          goto LABEL_27;
        }
      }
      v45[v27] = v37->var4;
      v28 = v27 + 1;
      *((_WORD *)v43 + v27++) = 1792;
      if (v37->var2)
      {
LABEL_17:
        v45[v27] = v37->var5;
        v28 = v27 + 1;
        *((_WORD *)v43 + v27) = 1793;
      }
      v29 = 0;
      v27 = v28;
      do
      {
        if (v29 >= 0x16)
          v30 = p_var2;
        else
          v30 = p_var1;
        if (*v30)
        {
          v45[v27] = var7[v29];
          *((_WORD *)v43 + v27++) = associatedResultSetL2FeatureFromSnippetFeature(v29);
        }
        ++v29;
      }
      while (v29 != 44);
      goto LABEL_25;
    }
LABEL_27:

    v8 = v32;
    v9 = v38;
  }

}

- (void)pickMostRecentDateForItem:(id)a3 pastItems:(id *)a4 futureItems:(id *)a5
{
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id *v24;
  id v25;
  __int128 v26;
  uint64_t v27;

  v24 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(v25, "sectionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0uLL;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.application")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
    {
      v26 = xmmword_1B87E0E50;
      v8 = 4;
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilecal")))
    {
      v9 = 17;
LABEL_14:
      LODWORD(v26) = v9;
      v8 = 1;
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.reminders")))
    {
      v10 = 0x1D0000001CLL;
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilemail")))
      {
        v9 = 285;
        goto LABEL_14;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
      {
        v9 = 32;
        goto LABEL_14;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
        v10 = 0x2000000019;
      else
        v10 = 0x2000000009;
    }
    *(_QWORD *)&v26 = v10;
    v8 = 2;
    goto LABEL_15;
  }
  *(_QWORD *)&v26 = 0x90000011CLL;
  DWORD2(v26) = 32;
  v8 = 3;
LABEL_15:
  v11 = 0;
  v12 = 4 * v8;
  v13 = 0.0;
  v14 = 1.79769313e308;
  do
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v25, "attributes", v24), *(int *)((char *)&v26 + v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v15;
    }
    v17 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v17)
    {
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      if (v18 <= self->_currentTime)
      {
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        if (v19 > v13)
        {
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v13 = v20;
        }
      }
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      if (v21 > self->_currentTime)
      {
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        if (v22 < v14)
        {
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v14 = v23;
        }
      }
    }
    v11 += 4;

  }
  while (v12 != v11);
  if (v13 != 0.0)
  {
    objc_msgSend(v25, "setMostRecentUsedDate:", v13);
    objc_msgSend(*a4, "addObject:", v25);
  }
  if (v14 != 0.0)
  {
    objc_msgSend(v25, "setClosestUpComingDate:", v14);
    objc_msgSend(*v24, "addObject:", v25);
  }

}

- (void)populateLocalResultSetDateFeaturesForItems:(id)a3
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
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  int v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)objc_opt_new();
  v6 = (id)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      v12 = v6;
      v13 = v5;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v27 = v12;
        v28 = v13;
        -[PRSRankingItemRanker pickMostRecentDateForItem:pastItems:futureItems:](self, "pickMostRecentDateForItem:pastItems:futureItems:", v14, &v28, &v27);
        v5 = v28;

        v6 = v27;
        ++v11;
        v12 = v6;
        v13 = v5;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  +[PRSRankingItemRelativeFeatureContext relativeContextsForResultSetWithCurrentTime:](PRSRankingItemRelativeFeatureContext, "relativeContextsForResultSetWithCurrentTime:", self->_currentTime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "relRankFeature");
        v22 = v5;
        if (v21 != 1789)
        {
          if (objc_msgSend(v20, "relRankFeature") == 1791)
            v22 = v6;
          else
            v22 = v7;
        }
        -[PRSRankingItemRanker computeRelativeFeatureForContext:items:](self, "computeRelativeFeatureForContext:items:", v20, v22);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v17);
  }

}

- (void)computeResultSetDependantFeatures:(id)a3 allItems:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_isCancelled)
  {
    v24 = v6;
    v41 = 0;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    *(_OWORD *)v29 = 0u;
    v30 = 0u;
    resultset_computation_ctx_init((uint64_t)v29);
    v23 = (void *)objc_opt_new();
    -[PRSRankingItemRanker updateResultSetContext:andUniqueScores:withResultSetItems:](self, "updateResultSetContext:andUniqueScores:withResultSetItems:", v29);
    v8 = objc_alloc(MEMORY[0x1E0C99E10]);
    -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v20);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
      }
      while (v14);
    }

    -[PRSRankingItemRanker updateResultSetFeaturesOnItems:withContext:uniqueScores:](self, "updateResultSetFeaturesOnItems:withContext:uniqueScores:", v7, v29, v23);
    if (v29[0])
      free(v29[0]);
    v6 = v24;
    if (!self->_isCancelled)
    {
      -[PRSRankingItemRanker populateRankResultSetBundleFeaturesWithBundleItems:withUniqueBundleMaxScores:](self, "populateRankResultSetBundleFeaturesWithBundleItems:withUniqueBundleMaxScores:", v24, v10);
      -[PRSRankingItemRanker populateLocalResultSetDateFeaturesForItems:](self, "populateLocalResultSetDateFeaturesForItems:", v7);
      if (!self->_isCancelled)
      {
        objc_msgSend(v24, "objectForKey:", CFSTR("com.apple.mobilemail"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("com.apple.MobileAddressBook"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSRankingItemRanker populateMailContactFeaturesWithMailItems:contactItems:](self, "populateMailContactFeaturesWithMailItems:contactItems:", v21, v22);

      }
    }

  }
}

- (void)populateMailContactFeaturesWithMailItems:(id)a3 contactItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  id n;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ii;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id obj;
  id obja;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  __int16 v56;
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
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;
  int v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v42 = v6;
    v50 = (void *)objc_opt_new();
    v49 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v41 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v74 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v12, "L2FeatureVector");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "vipSenderMatchesQuery"))
          {
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            -[PRSRankingItem matchedVipSenders]((uint64_t)v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v70 != v17)
                    objc_enumerationMutation(v14);
                  objc_msgSend(v50, "addObject:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j));
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
              }
              while (v16);
            }

          }
          if (objc_msgSend(v13, "senderIsVip"))
          {
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            -[PRSRankingItem matchedSenders]((uint64_t)v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v66;
              do
              {
                for (k = 0; k != v21; ++k)
                {
                  if (*(_QWORD *)v66 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(v49, "addObject:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k));
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
              }
              while (v21);
            }

          }
          if (objc_msgSend(v13, "receiverIsVip"))
          {
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            -[PRSRankingItem matchedRecipients]((uint64_t)v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v62;
              do
              {
                for (m = 0; m != v26; ++m)
                {
                  if (*(_QWORD *)v62 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m));
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
              }
              while (v26);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      }
      while (v9);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v43 = v42;
    v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v80, 16);
    if (v46)
    {
      v44 = *(_QWORD *)v58;
      do
      {
        for (n = 0; n != (id)v46; n = (char *)n + 1)
        {
          if (*(_QWORD *)v58 != v44)
            objc_enumerationMutation(v43);
          v30 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)n);
          v79 = 0;
          v78 = 0;
          v56 = 0;
          v55 = 0;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          -[PRSRankingItem emailAddresses](v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
          if (!v32)
          {
LABEL_66:

            continue;
          }
          v33 = v32;
          v45 = (void *)v30;
          obja = n;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = *(_QWORD *)v52;
          do
          {
            for (ii = 0; ii != v33; ++ii)
            {
              if (*(_QWORD *)v52 != v38)
                objc_enumerationMutation(v31);
              v40 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * ii);
              if ((v34 & 1) != 0)
                goto LABEL_50;
              if (objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * ii)))
              {
                *((_WORD *)&v55 + v37) = 1854;
                *((_DWORD *)&v78 + v37++) = 1065353216;
LABEL_50:
                v34 = 1;
                if ((v35 & 1) != 0)
                  goto LABEL_55;
                goto LABEL_53;
              }
              v34 = 0;
              if ((v35 & 1) != 0)
                goto LABEL_55;
LABEL_53:
              if (objc_msgSend(v50, "containsObject:", v40))
              {
                *((_WORD *)&v55 + v37) = 1853;
                *((_DWORD *)&v78 + v37++) = 1065353216;
LABEL_55:
                v35 = 1;
                if ((v36 & 1) != 0)
                  goto LABEL_60;
                goto LABEL_58;
              }
              v35 = 0;
              if ((v36 & 1) != 0)
                goto LABEL_60;
LABEL_58:
              if (objc_msgSend(v49, "containsObject:", v40))
              {
                *((_WORD *)&v55 + v37) = 1852;
                *((_DWORD *)&v78 + v37++) = 1065353216;
LABEL_60:
                v36 = 1;
                continue;
              }
              v36 = 0;
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
          }
          while (v33);

          n = obja;
          if (v37)
          {
            objc_msgSend(v45, "L2FeatureVector");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setScores:forFeatures:count:", &v78, &v55, v37);
            goto LABEL_66;
          }
        }
        v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v80, 16);
      }
      while (v46);
    }

    v5 = v41;
    v6 = v42;
  }

}

- (void)relevantResultSetPRSL2FeaturesFromBundleFeature:(unint64_t)a3 absRankFeatureOut:(unsigned __int16 *)a4 relRankFeatureOut:(unsigned __int16 *)a5
{
  unsigned __int16 v5;

  if (a3 >= 0x2C || ((0x9F000FFFFFFuLL >> a3) & 1) == 0)
    -[PRSRankingItemRanker relevantResultSetPRSL2FeaturesFromBundleFeature:absRankFeatureOut:relRankFeatureOut:].cold.1();
  v5 = word_1B87E11B4[a3];
  *a4 = word_1B87E115C[a3];
  *a5 = v5;
}

- (void)computeRelativeFeatureForContext:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  __int16 v8;
  __int16 v9;
  void *v10;
  uint64_t (**v11)(_QWORD, void *, void *);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t (**v27)(_QWORD, void *, void *);
  void *v28;
  _WORD v29[2];
  _QWORD v30[4];
  id v31;
  _DWORD v32[2];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_isCancelled)
  {
    v8 = objc_msgSend(v6, "relRankFeature");
    v9 = objc_msgSend(v6, "absRankFeature");
    objc_msgSend(v6, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "comparator");
    v11 = (uint64_t (**)(_QWORD, void *, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      v26 = v6;
      v27 = v11;
      -[PRSRankingItemRanker comparatorByJoiningComparator:withPredicate:](self, "comparatorByJoiningComparator:withPredicate:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __63__PRSRankingItemRanker_computeRelativeFeatureForContext_items___block_invoke;
      v30[3] = &unk_1E6E53A80;
      v24 = v12;
      v25 = v7;
      v31 = v24;
      objc_msgSend(v7, "sortedArrayWithOptions:usingComparator:", 1, v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = 0;
        v18 = -1.0;
        v19 = -1.0;
        do
        {
          if (v17)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v17 - 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
          }
          objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -2.0;
          if (objc_msgSend(v10, "evaluateWithObject:", v21))
          {
            if (v20 && !v27[2](v27, v20, v21))
            {
              v22 = v19;
            }
            else
            {
              v18 = (float)v16;
              v22 = 1.0 - (float)((float)v16++ / (float)(unint64_t)objc_msgSend(v28, "count"));
            }
          }
          else
          {
            v18 = -2.0;
          }
          v29[0] = v9;
          v29[1] = v8;
          *(float *)v32 = v18;
          *(float *)&v32[1] = v22;
          objc_msgSend(v21, "L2FeatureVector");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setScores:forFeatures:count:", v32, v29, 2);

          ++v17;
          v19 = v22;
        }
        while (v15 != v17);
      }

      v7 = v25;
      v6 = v26;
      v11 = v27;
    }

  }
}

uint64_t __63__PRSRankingItemRanker_computeRelativeFeatureForContext_items___block_invoke(uint64_t a1)
{
  return -(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (float)computeScoresForVectors:(id)a3 withBundleFeatures:(id)a4
{
  BOOL *p_isCancelled;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  float *v15;

  p_isCancelled = &self->_isCancelled;
  if (self->_isCancelled)
    return 0;
  v8 = a4;
  v9 = a3;
  +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItemRanker experimentalWeight1](self, "experimentalWeight1");
  v13 = v12;
  -[PRSRankingItemRanker experimentalWeight2](self, "experimentalWeight2");
  v15 = (float *)objc_msgSend(v10, "computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:", v9, v9, v8, v11, p_isCancelled, 0, v13, v14);

  return v15;
}

- (float)computeScoresForVectors:(id)a3
{
  BOOL *p_isCancelled;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  float *v12;

  p_isCancelled = &self->_isCancelled;
  if (self->_isCancelled)
    return 0;
  v6 = a3;
  +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItemRanker experimentalWeight1](self, "experimentalWeight1");
  v10 = v9;
  -[PRSRankingItemRanker experimentalWeight2](self, "experimentalWeight2");
  v12 = (float *)objc_msgSend(v7, "computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:", v6, v6, 0, v8, p_isCancelled, 0, v10, v11);

  return v12;
}

+ (void)setDockApps:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&s_dockapps_update_lock);
    objc_storeStrong((id *)&sDockApps, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)&s_dockapps_update_lock);
    v4 = v5;
  }

}

- (void)updateScoresForPreparedItems:(id)a3
{
  id v4;

  v4 = a3;
  -[PRSRankingItemRanker updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:](self, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v4, objc_msgSend((id)objc_opt_class(), "isCJK"), 0, 0, 0, -1.79769313e308);

}

- (void)updateScoresForPreparedItems:(id)a3 isCJK:(BOOL)a4 clientBundleID:(id)a5 thresholdValue:(double)a6 queryNodeMatchInfo:(id)a7
{
  id v8;

  v8 = a3;
  -[PRSRankingItemRanker updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:](self, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v8, objc_msgSend((id)objc_opt_class(), "isCJK"), 0, 0, 0, -1.79769313e308);

}

- (void)updateScoresForPreparedItems:(id)a3 isCJK:(BOOL)a4 clientBundleID:(id)a5 thresholdValue:(double)a6 queryNodeMatchInfo:(id)a7 collectL2Signals:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int IsSyndicatedPhotos;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  unint64_t queryTermCount;
  BOOL *p_hasPolicySingleTermPhraseMatch;
  int v38;
  int v39;
  char *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  id v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  _DWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  double v84;
  double v85;
  void *v86;
  NSObject *v87;
  void *v88;
  uint64_t v89;
  _BOOL4 v90;
  id v91;
  id v92;
  void *v93;
  int v94;
  BOOL *p_hasPolicyMultipleTermsPhraseMatch;
  void *obj;
  _BOOL4 v97;
  void *v98;
  char v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  BOOL *p_isCancelled;
  char v110;
  void *v111;
  _BOOL4 v112;
  unint64_t v113;
  unint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t buf[4];
  uint64_t v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  id v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v8 = a8;
  v12 = a4;
  v142 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (!self->_isCancelled)
  {
    p_isCancelled = &self->_isCancelled;
    v91 = v16;
    PRSLogCategoryDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v128 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_1B86C5000, v17, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> updating scores for %lu items", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v104 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    os_unfair_lock_lock((os_unfair_lock_t)&s_dockapps_update_lock);
    v100 = (void *)objc_msgSend((id)sDockApps, "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)&s_dockapps_update_lock);
    if (PRSRankingSDEnabledFlagState_onceToken != -1)
      dispatch_once(&PRSRankingSDEnabledFlagState_onceToken, &__block_literal_global_649);
    v112 = v8;
    v90 = v12;
    v93 = v15;
    v99 = PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags;
    v97 = -[NSString isEqualToString:](self->_clientBundle, "isEqualToString:", CFSTR("com.apple.searchd"));
    v94 = SSStringEndsWithSpace(self->_searchString);
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v92 = v14;
    v19 = v14;
    obj = v19;
    v107 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
    if (!v107)
    {
      v20 = 0;
      v21 = (void *)v104;
      goto LABEL_43;
    }
    v110 = 0;
    v20 = 0;
    v105 = *(_QWORD *)v124;
    p_hasPolicyMultipleTermsPhraseMatch = &self->_hasPolicyMultipleTermsPhraseMatch;
    v21 = (void *)v104;
    v102 = v18;
LABEL_8:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v124 != v105)
        objc_enumerationMutation(obj);
      if (*p_isCancelled)
      {
        v41 = obj;
        goto LABEL_41;
      }
      v23 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v22);
      objc_msgSend(v23, "sectionBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v24);

      if (IsSyndicatedPhotos)
      {
        objc_msgSend(v23, "retrievalType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "intValue");
        objc_msgSend(v23, "retrievalType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "intValue") & 1;

        v20 += v28;
      }
      objc_msgSend(v23, "L2FeatureVector");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_37;
      if ((v99 & 2) != 0)
      {
        v40 = PRSModelManagerAssociatedObjectKeyForType(0);
        objc_setAssociatedObject(v29, v40, v23, (void *)1);
      }
      objc_msgSend(v18, "addObject:", v29);
      objc_msgSend(v101, "addObject:", v29);
      objc_msgSend(v23, "sectionBundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sectionBundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "count"))
      {
        v33 = objc_opt_new();

        objc_msgSend(v21, "setObject:forKey:", v33, v31);
        v32 = (void *)v33;
      }
      if ((v110 & 1) != 0)
        v110 = 1;
      else
        v110 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.mobilemail"));
      objc_msgSend(v32, "addObject:", v23);
      objc_msgSend(v23, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v100, "containsObject:", v34);

      if (v35)
        objc_msgSend(v29, "setIsAppInDock:", 1);
      v21 = (void *)v104;
      if (!v97 || (objc_msgSend(v23, "shouldHideUnderShowMore") & 1) == 0)
      {
        queryTermCount = self->_queryTermCount;
        if (queryTermCount < 2)
        {
          if (queryTermCount != 1)
            goto LABEL_36;
          v38 = v94;
          if (*p_hasPolicyMultipleTermsPhraseMatch)
            v38 = 0;
          if (v38 != 1)
            goto LABEL_36;
          v39 = hasPolicyPhraseMatch(v23, 1uLL, 1);
          p_hasPolicySingleTermPhraseMatch = &self->_hasPolicySingleTermPhraseMatch;
          if (!v39)
            goto LABEL_36;
        }
        else
        {
          if (!hasPolicyPhraseMatch(v23, queryTermCount, self->_exact))
            goto LABEL_36;
          p_hasPolicySingleTermPhraseMatch = &self->_hasPolicyMultipleTermsPhraseMatch;
          if (*p_hasPolicyMultipleTermsPhraseMatch)
            goto LABEL_36;
        }
        *p_hasPolicySingleTermPhraseMatch = 1;
      }
LABEL_36:

      v18 = v102;
LABEL_37:

      if (v107 == ++v22)
      {
        v19 = obj;
        v107 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
        if (v107)
          goto LABEL_8;
LABEL_43:

        if (*p_isCancelled)
        {
LABEL_44:

          v14 = v92;
          v15 = v93;
          v16 = v91;
          break;
        }
        v103 = v18;
        -[PRSRankingItemRanker computeResultSetDependantFeatures:allItems:](self, "computeResultSetDependantFeatures:allItems:", v21, v19);
        -[PRSRankingItemRanker computePolicyFeaturesForBundleItems:isCJK:](self, "computePolicyFeaturesForBundleItems:isCJK:", v21, v90);
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v42 = v21;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
        if (v43)
        {
          v44 = v43;
          v41 = 0;
          v45 = *(_QWORD *)v120;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v120 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
              if (SSPommesRankingForSectionBundle(v47))
              {
                if (!v41)
                {
                  +[SSPommesRanker sharedPommesRanker](SSPommesRanker, "sharedPommesRanker");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v42, "objectForKey:", v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v89) = v20 == 0;
                objc_msgSend(v41, "updateScoresForItems:withSectionBundle:userQuery:queryID:currentTime:collectL2Signals:keyboardLanguage:onlyEmbeddingResults:", v48, v47, self->_userQueryString, self->_queryID, v112, self->_keyboardLanguage, self->_currentTime, v89);

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
          }
          while (v44);
        }
        else
        {
          v41 = 0;
        }

        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v49 = obj;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v116;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v116 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
              objc_msgSend(v54, "sectionBundleIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = SSSectionIsSyndicatedPhotos(v55);

              if (v56)
              {
                if ((objc_msgSend(v54, "photosMatch") & 1) != 0)
                  v57 = 1;
                else
                  v57 = objc_msgSend(v54, "isGoodPhotosMatch");
                objc_msgSend(v54, "setPhotosMatch:", v57);
              }
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
          }
          while (v51);
        }

        v18 = v103;
        if (_os_feature_enabled_impl())
        {
          SSGeneralLog();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = objc_msgSend(v49, "count");
            *(_DWORD *)buf = 134217984;
            v128 = v59;
            _os_log_impl(&dword_1B86C5000, v58, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] retrieved %lu items", buf, 0xCu);
          }

          if (objc_msgSend(v49, "count"))
          {
            v60 = 0;
            do
            {
              v113 = v60;
              objc_msgSend(v49, "objectAtIndexedSubscript:");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v61, "attributes"), 1uLL);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v61, "attributes"), 0xE3uLL);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v61, "attributes"), 7uLL);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v61, "attributes"), 0xCuLL);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v61, "attributes"), 4uLL);
              v65 = objc_claimAutoreleasedReturnValue();
              v106 = (void *)v65;
              if (v64)
                v66 = v64;
              else
                v66 = (void *)v65;
              if (v63)
                v66 = v63;
              v108 = v66;
              SSGeneralLog();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v61, "sectionBundleIdentifier");
                v98 = v63;
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "identifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134219266;
                v114 = v113 + 1;
                v128 = v114;
                v129 = 2112;
                v130 = v68;
                v131 = 2112;
                v132 = v69;
                v133 = 2112;
                v134 = v62;
                v135 = 2112;
                v136 = v111;
                v137 = 2112;
                v138 = v108;
                _os_log_impl(&dword_1B86C5000, v67, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] retrieved item %lu: bundleId=%@ identifier=%@ MDItemIdentifier=%@ messageID=%@ name=%@", buf, 0x3Eu);

                v18 = v103;
                v63 = v98;
              }
              else
              {
                v114 = v113 + 1;
              }

              v70 = objc_msgSend(v49, "count");
              v60 = v114;
            }
            while (v114 < v70);
          }
        }
        v71 = v93;
        v72 = v71;
        if (v71)
        {
          if (objc_msgSend(v71, "isEqualToString:", CFSTR("com.apple.mobilemail")))
          {

LABEL_41:
            v21 = (void *)v104;
            goto LABEL_44;
          }
          v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

          if ((v73 & 1) != 0)
            goto LABEL_41;
        }
        if (objc_msgSend(v18, "count") || objc_msgSend(v101, "count"))
        {
          +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRSRankingItemRanker experimentalWeight1](self, "experimentalWeight1");
          v77 = v76;
          -[PRSRankingItemRanker experimentalWeight2](self, "experimentalWeight2");
          v79 = (_DWORD *)objc_msgSend(v74, "computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:", v18, v101, 0, v75, p_isCancelled, v72, v77, v78);

          if (v79)
          {
            v80 = objc_msgSend(v18, "count");
            if (v80)
            {
              v81 = v80;
              for (k = 0; k != v81; ++k)
              {
                objc_msgSend(v49, "objectAtIndexedSubscript:", k);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v84) = v79[k];
                objc_msgSend(v83, "setScore:", v84);
                LODWORD(v85) = v79[k];
                objc_msgSend(v83, "setRawScore:", v85);
                objc_msgSend(v103, "objectAtIndexedSubscript:", k);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "withinBundleScore");
                objc_msgSend(v83, "setWithinBundleScore:");

                if (*(float *)&v79[k] < a6)
                {
                  objc_msgSend(v83, "setEligibleForDemotion:", 1);
                  PRSLogCategoryDefault();
                  v87 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v83, "sectionBundleIdentifier");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v128 = (uint64_t)v88;
                    _os_log_impl(&dword_1B86C5000, v87, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> marking item as eligible for demotion as score less than threshold: %@", buf, 0xCu);

                  }
                }

              }
            }
            free(v79);
            -[PRSRankingItemRanker rerankItemsWithPolicyForBundleItems:isCJK:](self, "rerankItemsWithPolicyForBundleItems:isCJK:", v42, v90);
            v18 = v103;
          }
        }
        goto LABEL_41;
      }
    }
  }

}

+ (void)sortResultsInSection:(id)a3 currentTime:(double)a4
{
  id v5;
  void *v6;
  int IsSyndicatedPhotos;
  uint64_t *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char IsMailOrPommesCTL;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *, void *);
  void *v18;
  double v19;
  _QWORD v20[4];
  id v21;
  double v22;
  char v23;

  v5 = a3;
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v6);

  if (IsSyndicatedPhotos)
  {
    v8 = (uint64_t *)&__block_literal_global_644;
LABEL_6:
    objc_msgSend(v5, "sortUsingComparator:", v8, v15, v16, v17, v18, *(_QWORD *)&v19);
    goto LABEL_7;
  }
  objc_msgSend(v5, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = SSPommesRankingForSectionBundle(v9);

  if (!v10)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_3;
    v18 = &__block_descriptor_40_e75_q24__0__SFSearchResult_SpotlightExtras_8__SFSearchResult_SpotlightExtras_16l;
    v19 = a4;
    v8 = &v15;
    goto LABEL_6;
  }
  +[SSPommesRanker sharedPommesRanker](SSPommesRanker, "sharedPommesRanker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsMailOrPommesCTL = SSSectionIsMailOrPommesCTL(v12);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_2;
  v20[3] = &unk_1E6E53AC8;
  v23 = IsMailOrPommesCTL;
  v21 = v11;
  v22 = a4;
  v14 = v11;
  objc_msgSend(v5, "sortUsingComparator:", v20);

LABEL_7:
}

int64_t __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "rankingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rankingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v4, "rankingItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rankingItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[SSPommesPhotosRanker PhotosL2Compare:to:](SSPommesPhotosRanker, "PhotosL2Compare:to:", v8, v9);

    }
    else
    {
      v10 = -1;
    }
  }
  else
  {
    v10 = v7 != 0;
  }

  return v10;
}

uint64_t __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rankingItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "rankingItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = *(unsigned __int8 *)(a1 + 48);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "rankingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(double *)(a1 + 40);
    if (v10)
      v15 = objc_msgSend(v11, "mailCompare:to:currentTime:", v12, v13, v14);
    else
      v15 = objc_msgSend(v11, "compare:to:currentTime:", v12, v13, v14);
    v17 = v15;

  }
  else
  {
    objc_msgSend(v5, "rankingItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -1;
    }
    else
    {
      objc_msgSend(v6, "rankingItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v18 != 0;
    }
  }

  return v17;
}

uint64_t __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rankingItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "rankingItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v5, "rankingItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -objc_msgSend(v10, "compare:currentTime:", v11, *(double *)(a1 + 32));

  }
  else
  {
    objc_msgSend(v5, "rankingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v12 = -1;
    }
    else
    {
      objc_msgSend(v6, "rankingItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v14 != 0;
    }
  }

  return v12;
}

+ (BOOL)shouldFilterResult:(id)a3 currentTime:(double)a4 isScopedSearch:(BOOL)a5 clientBundleId:(id)a6 queryKind:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v37;
  char v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v11 = a3;
  v12 = a6;
  objc_msgSend(v11, "sectionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.reminders"));

  if (!v14)
  {
    objc_msgSend(v11, "sectionBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.tips")) & 1) != 0)
    {
LABEL_7:

LABEL_8:
      if (!a5)
      {
        objc_msgSend(v11, "rankingItem");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v11, "rankingItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "topicalityScore");
          v24 = v23;

          if (v24 < 2.22044605e-16)
            goto LABEL_24;
        }
      }
      goto LABEL_22;
    }
    objc_msgSend(v11, "sectionBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.Passbook")))
    {
      v26 = v12;
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        if ((objc_msgSend(v26, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) == 0
          && (objc_msgSend(v26, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) == 0)
        {
          v37 = objc_msgSend(v26, "hasPrefix:", CFSTR("com.apple.ondeviceeval"));
          if (a7 != 12 && !v37)
          {

            goto LABEL_7;
          }
        }
        v38 = _os_feature_enabled_impl();

        if ((v38 & 1) == 0)
          goto LABEL_8;
LABEL_16:
        objc_msgSend(v11, "sectionBundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.people.screenTimeRequest")))
        {

        }
        else
        {
          objc_msgSend(v11, "sectionBundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.people.askToBuyRequest"));

          if (!v29)
          {
            objc_msgSend(v11, "resultBundleId");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.shortcuts"));

            if (v40)
            {
              objc_msgSend(v11, "rankingItem");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v35, "attributes"), 0xAAuLL);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v35) = objc_msgSend(v41, "BOOLValue");
            }
            else
            {
              objc_msgSend(v11, "userActivityType");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v17, "length"))
              {
LABEL_21:

                goto LABEL_22;
              }
              objc_msgSend(v11, "rankingItem");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v42, "attributes"), 0x15uLL);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v43)
                goto LABEL_22;
              objc_msgSend(v11, "rankingItem");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v44, "attributes"), 0x16uLL);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v41)
                goto LABEL_22;
              LODWORD(v35) = objc_msgSend(v41, "BOOLValue") ^ 1;
            }

            goto LABEL_25;
          }
        }
        objc_msgSend(v11, "rankingItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v30, "attributes"), 0x24uLL);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        if (v31 < a4)
          goto LABEL_23;
        objc_msgSend(v11, "rankingItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bundleIDType");

        objc_msgSend(v11, "rankingItem");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v33, "attributes"), 0x99uLL);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v33) = objc_msgSend(v34, "intValue");
        if (!(_DWORD)v33)
          goto LABEL_23;
        goto LABEL_21;
      }

    }
    goto LABEL_16;
  }
  objc_msgSend(v11, "rankingItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v11, "rankingItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v16, "attributes"), 0x1CuLL);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "timeIntervalSinceNow");
      *(float *)&v18 = v18 / -86400.0;
      if (*(float *)&v18 > 30.0)
      {
LABEL_23:

LABEL_24:
        LOBYTE(v35) = 1;
        goto LABEL_25;
      }
    }
    goto LABEL_21;
  }
LABEL_22:
  LOBYTE(v35) = 0;
LABEL_25:

  return (char)v35;
}

+ (void)thresholdResultsInSection:(id)a3 userQuery:(id)a4 queryID:(int64_t)a5 isEntitiesSearch:(BOOL)a6 currentTime:(double)a7 isScopedSearch:(BOOL)a8 queryKind:(unint64_t)a9 clientBundleID:(id)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  int64_t v34;
  unint64_t v35;
  double v36;
  BOOL v37;
  BOOL v38;
  uint8_t buf[4];
  int64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a10;
  v19 = objc_msgSend(v16, "resultsCount");
  v20 = (void *)MEMORY[0x1E0CB3880];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __137__PRSRankingItemRanker_thresholdResultsInSection_userQuery_queryID_isEntitiesSearch_currentTime_isScopedSearch_queryKind_clientBundleID___block_invoke;
  v30[3] = &unk_1E6E53B10;
  v21 = v16;
  v31 = v21;
  v22 = v17;
  v37 = a6;
  v32 = v22;
  v33 = v18;
  v34 = a5;
  v35 = a9;
  v36 = a7;
  v38 = a8;
  v23 = v18;
  objc_msgSend(v20, "predicateWithBlock:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filterUsingPredicate:", v24);

  v25 = objc_msgSend(v21, "resultsCount");
  v26 = v19 - v25;
  if (v19 != v25)
  {
    PRSLogCategoryDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      SSRedactString(v22, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v40 = a5;
      v41 = 2112;
      v42 = v28;
      v43 = 2112;
      v44 = v29;
      v45 = 2048;
      v46 = v26;
      v47 = 2048;
      v48 = v19;
      _os_log_impl(&dword_1B86C5000, v27, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Filtering qid: %lu, query: %@, bundleID: %@, thresholded: %ld, original count: %lu", buf, 0x34u);

    }
  }

}

uint64_t __137__PRSRankingItemRanker_thresholdResultsInSection_userQuery_queryID_isEntitiesSearch_currentTime_isScopedSearch_queryKind_clientBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SSPommesRankingForSectionBundle(v4) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.reminders"));

  if ((v6 & 1) != 0)
  {
LABEL_6:
    v9 = +[PRSRankingItemRanker shouldFilterResult:currentTime:isScopedSearch:clientBundleId:queryKind:](PRSRankingItemRanker, "shouldFilterResult:currentTime:isScopedSearch:clientBundleId:queryKind:", v3, *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72)) ^ 1;
    goto LABEL_7;
  }
  objc_msgSend(v3, "rankingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "rankingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = !SSThresholdRankedItem(v8, *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 80), *(void **)(a1 + 48), *(_QWORD *)(a1 + 64));

  }
  else
  {
    v9 = 1;
  }
LABEL_7:

  return v9;
}

- (void)computePolicyFeaturesForBundleItems:(id)a3 isCJK:(BOOL)a4
{
  unint64_t queryTermCount;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  PRSRankingItemRanker *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;

  v18 = a3;
  if (!-[PRSRankingItemRanker policyDisabled](self, "policyDisabled") && !self->_isCancelled)
  {
    if (computePolicyFeaturesForBundleItems_isCJK__onceToken != -1)
      dispatch_once(&computePolicyFeaturesForBundleItems_isCJK__onceToken, &__block_literal_global_661);
    queryTermCount = self->_queryTermCount;
    v7 = -[PRSRankingItemRanker queryTermLength](self, "queryTermLength");
    v8 = objc_msgSend(v18, "count");
    v9 = v8;
    if (v8 % 7)
      v10 = v8 / 7 + 1;
    else
      v10 = v8 / 7;
    v11 = 6;
    v12 = 4;
    while (v10 % computePolicyFeaturesForBundleItems_isCJK__core_count)
    {
      if (v8 % v11)
        v10 = v8 / v11 + 1;
      else
        v10 = v8 / v11;
      if (v11-- <= 4)
        goto LABEL_16;
    }
    v12 = v11 + 1;
LABEL_16:
    objc_msgSend(v18, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(33, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_2;
    block[3] = &unk_1E6E53BE8;
    v23 = v12;
    v24 = v9;
    v20 = v15;
    v21 = v18;
    v22 = self;
    v25 = queryTermCount;
    v26 = v7;
    v27 = a4;
    v17 = v15;
    dispatch_apply(v10, v16, block);

  }
}

void __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke()
{
  if (get_thread_count_onceToken != -1)
    dispatch_once(&get_thread_count_onceToken, &__block_literal_global_656);
  computePolicyFeaturesForBundleItems_isCJK__core_count = get_thread_count_batch_size;
}

void __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  BOOL v26;
  int v27;
  int v28;
  double v29;
  __int16 v30;
  uint64_t v31;
  float v32;
  _BOOL4 v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  unint64_t v51;
  unint64_t v52;
  BOOL v54;
  void *v55;
  int IsSyndicatedPhotos;
  unint64_t v57;
  void *v58;
  float v59;
  float v60;
  void *v61;
  float v62;
  float v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  float v68;
  float v69;
  char v70;
  _BOOL4 v71;
  void *v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  float v77;
  __int16 v78;
  void *v79;
  float v80;
  float v81;
  _BOOL4 v82;
  char v83;
  int v84;
  unint64_t v85;
  char v86;
  unint64_t v87;
  char v88;
  unint64_t v89;
  int v90;
  _BOOL4 v91;
  _BOOL4 v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  unint64_t v103;
  _WORD *v104;
  int v105;
  int v106;
  uint64_t v107;
  int v108;
  int v109;
  uint64_t v110;
  int v111;
  void *v112;
  char v113;
  int v114;
  void *v115;
  char v116;
  void *v117;
  int v118;
  float v119;
  float v120;
  char v121;
  float v122;
  int v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t j;
  void *v130;
  void *v131;
  void *v132;
  unint64_t v133;
  unint64_t v134;
  void *v135;
  void *context;
  uint64_t v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  id obj;
  uint64_t v143;
  int v144;
  uint64_t v145;
  _BOOL4 v146;
  _WORD *v147;
  void *v148;
  int v149;
  id v150;
  _BOOL4 v151;
  _BOOL4 v152;
  __int16 v153;
  _BOOL4 v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  unsigned int v158;
  int v159;
  unint64_t v160;
  _QWORD v161[5];
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[5];
  _BYTE v175[128];
  _WORD v176[32];
  float v177[34];
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCB3708]();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = v4 * a2;
  v6 = v5 + v4;
  if (v6 >= *(_QWORD *)(a1 + 64))
    v7 = *(_QWORD *)(a1 + 64);
  else
    v7 = v6;
  PRSRankingQueryIndexDictionary();
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v7;
  if (v5 >= v7)
    goto LABEL_246;
  v8 = v5;
  v9 = &off_1E6E41000;
  v10 = MEMORY[0x1E0C809B0];
  do
  {
    v133 = v8;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[410], "importantAttributesForBundle:", v11);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v138, "count");
    v148 = (void *)v11;
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v174[0] = v10;
    v174[1] = 3221225472;
    v174[2] = __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_3;
    v174[3] = &unk_1E6E53B98;
    v174[4] = *(_QWORD *)(a1 + 48);
    v149 = 1;
    objc_msgSend(v12, "sortedArrayWithOptions:usingComparator:", 1, v174);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 72) >= 2uLL)
    {
      v172 = 0u;
      v173 = 0u;
      v170 = 0u;
      v171 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v171;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v171 != v17)
              objc_enumerationMutation(v14);
            if ((hasPolicyPhraseMatch(*(void **)(*((_QWORD *)&v170 + 1) + 8 * i), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 43)) & 1) != 0)
            {
              v149 = 0;
              goto LABEL_18;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
          if (v16)
            continue;
          break;
        }
        v149 = 1;
      }
      else
      {
        v149 = 1;
      }
LABEL_18:

    }
    v141 = (void *)objc_opt_new();
    v140 = SSStringEndsWithSpace(*(void **)(*(_QWORD *)(a1 + 48) + 64));
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    obj = v13;
    v145 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
    if (!v145)
    {
      v144 = 0;
      v19 = v148;
      goto LABEL_228;
    }
    v144 = 0;
    v143 = *(_QWORD *)v167;
    v19 = v148;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v167 != v143)
          objc_enumerationMutation(obj);
        if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 38))
        {

          goto LABEL_245;
        }
        v21 = *(_QWORD **)(*((_QWORD *)&v166 + 1) + 8 * v20);
        objc_msgSend(v9[410], "itemSpecificImportantAttributesForBundle:withItem:", v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v150 = v22;
          v23 = objc_msgSend(v22, "count");
        }
        else
        {
          v150 = v138;
          v23 = v137;
        }
        memset(v177, 0, 128);
        memset(v176, 0, sizeof(v176));
        v24 = hasPolicyPhraseMatch(v21, *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 43));
        v25 = *(_QWORD *)(a1 + 72);
        v159 = v24;
        if (v25 >= 2)
        {
          if (v24)
          {
            v177[0] = 1.0;
            v176[0] = 2079;
            objc_msgSend(v21, "setHasPolicyMultipleTermsPhraseMatch:", 1);
LABEL_39:
            v31 = 1;
            goto LABEL_41;
          }
          v177[0] = 0.0;
          v30 = 2079;
LABEL_38:
          v176[0] = v30;
          goto LABEL_39;
        }
        v26 = v25 == 1;
        v27 = v140;
        if (!v26)
          v27 = 0;
        if (v27 == 1)
        {
          v28 = hasPolicyPhraseMatch(v21, 1uLL, 1);
          LODWORD(v29) = 0;
          if (v28)
          {
            objc_msgSend(v21, "setHasPolicySingleTermPhraseMatch:", 1, v29);
            LODWORD(v29) = 1.0;
          }
          v177[0] = *(float *)&v29;
          v30 = 2080;
          goto LABEL_38;
        }
        v31 = 0;
LABEL_41:
        if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 40))
          v32 = 1.0;
        else
          v32 = 0.0;
        *(float *)((unint64_t)v177 | (4 * v31)) = v32;
        v155 = v31;
        v147 = (_WORD *)((unint64_t)v176 | (2 * v31));
        *v147 = 2081;
        v33 = hasPolicyNearMatch(v21, *(_QWORD *)(a1 + 72));
        if (*(_QWORD *)(a1 + 72) >= 2uLL && v33)
          objc_msgSend(v21, "setHasPolicyMultipleTermsNearMatch:", 1);
        v156 = v20;
        v34 = objc_msgSend(v21, "didMatchRankingDescriptor:", CFSTR("kMDItemTextContentTokenizedMatch"));
        if (!*(_QWORD *)(a1 + 72))
        {
          v36 = 0;
          v37 = 0;
LABEL_67:
          v160 = 0;
          goto LABEL_68;
        }
        v35 = 0;
        v36 = 0;
        v37 = 0;
        do
        {
          if (v23)
          {
            v38 = 0;
            while (1)
            {
              v39 = v35 + *(_QWORD *)(a1 + 72) * v38;
              if ((((unint64_t)-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v21) >> v39) & 1) != 0)
                break;
              if (v23 == ++v38)
                goto LABEL_55;
            }
            ++v37;
            v36 += ((unint64_t)~-[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v21) >> v39) & 1;
          }
LABEL_55:
          ++v35;
          v40 = *(_QWORD *)(a1 + 72);
        }
        while (v35 < v40);
        if (!v40)
          goto LABEL_67;
        v41 = 0;
        v160 = 0;
        do
        {
          if (v23)
          {
            v42 = 0;
            while (1)
            {
              v43 = v41 + *(_QWORD *)(a1 + 72) * v42;
              if ((((unint64_t)-[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v21) >> v43) & 1) != 0)
                break;
              if (v23 == ++v42)
                goto LABEL_64;
            }
            ++v160;
          }
LABEL_64:
          ++v41;
        }
        while (v41 < *(_QWORD *)(a1 + 72));
LABEL_68:
        if ((objc_msgSend(v21, "bundleIDType") & 0x100) != 0)
        {
          objc_msgSend(v21, "L2FeatureVector");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "scoreForFeature:", 1);
          v47 = v46;

          objc_msgSend(v21, "L2FeatureVector");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "scoreForFeature:", 41);
          v50 = v49;

          v51 = *(_QWORD *)(a1 + 80);
          v52 = objc_msgSend(v9[410], "spellCorrectedAppMinQueryLen");
          v54 = v47 == 1.0 && v51 > v52;
          v44 = v50 == 0.0 && v54;
        }
        else
        {
          v44 = 0;
        }
        if ((objc_msgSend(v21, "bundleIDType") & 0x100) != 0)
        {
          objc_msgSend(v21, "L2FeatureVector");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "scoreForFeature:", 2327);
          v63 = v62;

          objc_msgSend(v21, "L2FeatureVector");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "scoreForFeature:", 1614);
          v66 = v65;

          objc_msgSend(v21, "L2FeatureVector");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "scoreForFeature:", 189);
          v69 = v68;

          if (v63 == 1.0 || v66 == 0.0 && v69 != 2147500000.0 && v69 != -1.0)
            goto LABEL_100;
          if (v66 == 0.0)
          {
            if (*(_QWORD *)(a1 + 80) > 4uLL)
              v70 = 1;
            else
              v70 = v44;
            if ((v70 & 1) != 0)
            {
LABEL_100:
              v71 = 1;
              goto LABEL_104;
            }
          }
          else if ((v44 & 1) != 0)
          {
            goto LABEL_100;
          }
          if ((objc_msgSend(v21, "isKeywordMatch") & 1) != 0)
            goto LABEL_100;
        }
        else
        {
          objc_msgSend(v21, "sectionBundleIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v55);

          if (IsSyndicatedPhotos)
          {
            if ((objc_msgSend(v21, "photosMatch") & 1) != 0)
              goto LABEL_100;
            if ((objc_msgSend(v21, "photosExactMatch") & 1) != 0)
              goto LABEL_100;
            v57 = *(_QWORD *)(a1 + 72);
            if (v57 >= 2 && v37 >= v57 - 1)
            {
              objc_msgSend(v21, "L2FeatureVector");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "scoreForFeature:", 2843);
              v60 = v59;

              if (v60 != 2147500000.0 && v60 != -1.0)
                goto LABEL_100;
            }
          }
        }
        if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 32))
        {
          objc_msgSend(v21, "L2FeatureVector");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "scoreForFeature:", 2390);
          v74 = v73;

          v71 = v74 == 1.0;
        }
        else
        {
          v71 = 0;
        }
LABEL_104:
        objc_msgSend(v21, "L2FeatureVector");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "scoreForFeature:", 2);
        v77 = v76;

        v78 = objc_msgSend(v21, "bundleIDType");
        objc_msgSend(v21, "L2FeatureVector");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "scoreForFeature:", 2362);
        v81 = v80;

        if ((v78 & 0x800) != 0)
        {
          if (v37)
            v83 = v34;
          else
            v83 = 0;
          v82 = 1;
          if (v37 < *(_QWORD *)(a1 + 72) && (v83 & 1) == 0 && (v77 != 1.0 || *(_QWORD *)(a1 + 80) <= 2uLL))
            v82 = v81 == 1.0;
        }
        else
        {
          v82 = 1;
        }
        if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 200) == 2 && (objc_msgSend(v21, "bundleIDType") & 0x200) != 0)
          v158 = (v36 == 0) & ~objc_msgSend(*(id *)(a1 + 48), "isContentWord");
        else
          v158 = 0;
        v84 = objc_msgSend(v21, "bundleIDType");
        v152 = (v84 & 0x100000) == 0
            || (v85 = *(_QWORD *)(a1 + 72), v37 >= v85)
            || v85 >= 2 && v77 == 1.0
            || hasPolicySecondaryMatch(v21, v85, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 192), *(void **)(*(_QWORD *)(a1 + 48) + 72), *(_BYTE *)(*(_QWORD *)(a1 + 48) + 43), v139);
        v86 = objc_msgSend(v21, "bundleIDType");
        v153 = v78;
        v151 = (v86 & 2) == 0
            || (v87 = *(_QWORD *)(a1 + 72), v37 >= v87)
            || v87 >= 2 && v77 == 1.0
            || hasPolicySecondaryMatch(v21, v87, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 192), *(void **)(*(_QWORD *)(a1 + 48) + 72), *(_BYTE *)(*(_QWORD *)(a1 + 48) + 43), v139);
        v88 = objc_msgSend(v21, "bundleIDType");
        v146 = (v88 & 8) == 0
            || (v89 = *(_QWORD *)(a1 + 72), v37 >= v89)
            || v89 >= 2 && v77 == 1.0
            || hasPolicySecondaryMatch(v21, v89, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 192), *(void **)(*(_QWORD *)(a1 + 48) + 72), *(_BYTE *)(*(_QWORD *)(a1 + 48) + 43), v139);
        v90 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 168), "isEqualToString:", CFSTR("com.apple.searchd"));
        if (v90
          && !-[PRSRankingItem recencyTestForVisibilityWithCurrentTime:]((uint64_t)v21, *(double *)(*(_QWORD *)(a1 + 48) + 176)))
        {
          if ((objc_msgSend(v21, "bundleIDType") & 0x40000) != 0
            || (objc_msgSend(v21, "bundleIDType") & 0x2000000) != 0)
          {
            v123 = v159;
          }
          else
          {
            v123 = 1;
          }
          v157 = v123;
        }
        else
        {
          v157 = 0;
        }
        if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v21))
        {
          v91 = v71;
          v92 = 1;
          goto LABEL_145;
        }
        if ((objc_msgSend(v21, "bundleIDType") & 0x100) == 0
          || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "hasPrefix:", CFSTR("en"))
          || !+[PRSRankingUtilities aToZInString:](PRSRankingUtilities, "aToZInString:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64)))
        {
          v91 = v71;
          v92 = 0;
          goto LABEL_145;
        }
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v21, "attributes"), 7uLL);
        v93 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v135 = (void *)v93;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v91 = v71;
LABEL_223:
          v92 = 0;
          goto LABEL_224;
        }
        v94 = (void *)v93;
        v91 = v71;
        v95 = v94;
        if (!+[PRSRankingUtilities aToZInString:](PRSRankingUtilities, "aToZInString:", v94))
          goto LABEL_223;
        v92 = objc_msgSend(v95, "rangeOfString:options:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64), 1) != 0x7FFFFFFFFFFFFFFFLL;
LABEL_224:

LABEL_145:
        if (v37 == *(_QWORD *)(a1 + 72))
          objc_msgSend(v21, "setMatchedQueryTerms:", 1);
        v96 = v155 + 1;
        v26 = (v153 & 0x800) == 0;
        v154 = v82;
        v97 = !v82;
        v98 = v26 || !v82;
        v99 = !v152;
        v100 = (*(_QWORD *)&v84 & 0x100000) == 0 || !v152;
        v101 = v92 || v91;
        v102 = !v151;
        if ((v86 & 2) == 0)
          v102 = 1;
        v103 = (unint64_t)v177 | (4 * v96);
        v104 = (_WORD *)((unint64_t)v176 | (2 * v96));
        if (v101 != 1 && v98 && v100 && v102)
        {
          v105 = !v146;
          if ((v88 & 8) == 0)
            v105 = 1;
          if (((v105 | v157) & 1) == 0 && v149 | v159 && ((v158 | v97) & 1) == 0)
          {
LABEL_167:
            v106 = 0;
            *(_DWORD *)v103 = 1065353216;
            *v104 = 1909;
            *(float *)((unint64_t)v177 | (4 * (v155 | 2))) = (float)v37;
            *(_WORD *)((unint64_t)v176 | (2 * (v155 | 2))) = 1913;
            v177[v155 + 3] = (float)v160;
            v107 = v155 | 4;
            *(_WORD *)((unint64_t)v176 | (2 * (v155 + 3))) = 1912;
            goto LABEL_169;
          }
        }
        else if (((v157 | (v149 | v159) ^ 1) & 1) == 0 && !(v158 | v97))
        {
          goto LABEL_167;
        }
        v106 = 1;
        objc_msgSend(v21, "setShouldHideUnderShowMore:", 1);
        *(_QWORD *)v103 = 0;
        *(_QWORD *)(v103 + 8) = 0;
        *(_QWORD *)v104 = 0x777077807790775;
        *(_WORD *)((unint64_t)v176 | (2 * (v155 + 5))) = 1910;
        *(_QWORD *)&v177[v155 + 5] = 0;
        v107 = v155 + 7;
        v147[6] = 1927;
        objc_msgSend(v21, "setEligibleForDemotion:", 1);
        v144 += v157;
LABEL_169:
        v108 = v91;
        if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v21))
          v109 = 1;
        else
          v109 = v91;
        if ((v90 & v109) == 1)
        {
          v110 = -[PRSRankingItem recencyTestForTopHitWithCurrentTime:]((uint64_t)v21, *(double *)(*(_QWORD *)(a1 + 48) + 176));
          v111 = v149 | v159;
          if (v110 != 1)
            v111 = 0;
          if ((v111 & v154) == 1 && ((v158 | v99) & 1) == 0)
          {
            objc_msgSend(v21, "L2FeatureVector");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend(v112, "isSiriAction");

            if ((v113 & 1) == 0)
              objc_msgSend(v21, "setRecentForTopHit:", 1);
          }
        }
        if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v21))
          v114 = 1;
        else
          v114 = v108;
        if ((v90 & v114) == 1
          && -[PRSRankingItem recencyTestForAboveThresholdTopHitWithCurrentTime:](v21, *(double *)(*(_QWORD *)(a1 + 48) + 176)) == 1)
        {
          if (v149 | v159)
          {
            if (((v158 | v99) & 1) == 0)
            {
              objc_msgSend(v21, "L2FeatureVector");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend(v115, "isSiriAction");

              if ((v116 & 1) == 0)
                objc_msgSend(v21, "setRecentForAboveThresholdTopHit:", 1);
            }
          }
        }
        if (v106)
        {
          objc_msgSend(v21, "L2FeatureVector");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "setScores:forFeatures:count:", v177, v176, v107);
          v9 = &off_1E6E41000;
        }
        else
        {
          v9 = &off_1E6E41000;
          if (!objc_msgSend(v148, "hasPrefix:", CFSTR("com.apple."))
            || (objc_msgSend(v148, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0
            || (v118 = objc_msgSend(v148, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")), v119 = 1.0, v118))
          {
            v119 = -1.0;
          }
          v177[v107] = v119;
          v176[v107] = 1927;
          v120 = -1.0;
          if (objc_msgSend(v148, "hasPrefix:", CFSTR("com.apple."))
            && (objc_msgSend(v148, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
          {
            if (objc_msgSend(v148, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")))
              v120 = -1.0;
            else
              v120 = (float)v37;
          }
          v177[v107 + 1] = v120;
          v176[v107 + 1] = 1911;
          if (v37 == *(_QWORD *)(a1 + 72))
          {
            objc_msgSend(v141, "addObject:", v21);
          }
          else
          {
            if (*(_BYTE *)(a1 + 88))
              v121 = 1;
            else
              v121 = v108;
            if ((v121 & 1) == 0)
              objc_msgSend(v21, "setEligibleForDemotion:", 1);
          }
          v122 = -1.0;
          if (objc_msgSend(v148, "hasPrefix:", CFSTR("com.apple."))
            && (objc_msgSend(v148, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
          {
            if (objc_msgSend(v148, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")))
              v122 = -1.0;
            else
              v122 = (float)v160;
          }
          v177[v107 + 2] = v122;
          v176[v107 + 2] = 1910;
          objc_msgSend(v21, "L2FeatureVector");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "setScores:forFeatures:count:", v177, v176, v107 + 3);
        }

        v20 = v156 + 1;
        v19 = v148;
      }
      while (v156 + 1 != v145);
      v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
      v145 = v124;
    }
    while (v124);
LABEL_228:

    if (objc_msgSend(obj, "count") == v144)
    {
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v125 = obj;
      v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v162, v175, 16);
      if (v126)
      {
        v127 = v126;
        v128 = *(_QWORD *)v163;
        do
        {
          for (j = 0; j != v127; ++j)
          {
            if (*(_QWORD *)v163 != v128)
              objc_enumerationMutation(v125);
            v130 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * j);
            if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v130))
              objc_msgSend(v130, "setEligibleForDemotion:", 0);
          }
          v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v162, v175, 16);
        }
        while (v127);
      }

      v19 = v148;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 38))
    {
LABEL_245:

      break;
    }
    if (objc_msgSend(v141, "count"))
    {
      v131 = (void *)objc_opt_new();
      v161[0] = MEMORY[0x1E0C809B0];
      v161[1] = 3221225472;
      v161[2] = __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_4;
      v161[3] = &unk_1E6E53BC0;
      v161[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v131, "setComparator:", v161);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "setPredicate:", v132);

      v19 = v148;
      objc_msgSend(v131, "setAbsRankFeature:", 1907);
      objc_msgSend(v131, "setRelRankFeature:", 1908);
      objc_msgSend(*(id *)(a1 + 48), "computeRelativeFeatureForContext:items:", v131, v141);

    }
    v8 = v133 + 1;
    v10 = MEMORY[0x1E0C809B0];
  }
  while (v133 + 1 != v134);
LABEL_246:

  objc_autoreleasePoolPop(context);
}

uint64_t __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return -[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

- (void)rerankItemsWithPolicyForBundleItems:(id)a3 isCJK:(BOOL)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[5];
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[PRSRankingItemRanker policyDisabled](self, "policyDisabled") && !self->_isCancelled)
  {
    if (rerankItemsWithPolicyForBundleItems_isCJK__onceToken != -1)
      dispatch_once(&rerankItemsWithPolicyForBundleItems_isCJK__onceToken, &__block_literal_global_666);
    v6 = objc_msgSend(v5, "count");
    v7 = v6;
    if (v6 % 7)
      v8 = v6 / 7 + 1;
    else
      v8 = v6 / 7;
    v9 = 6;
    v10 = 4;
    while (v8 % rerankItemsWithPolicyForBundleItems_isCJK__core_count)
    {
      if (v6 % v9)
        v8 = v6 / v9 + 1;
      else
        v8 = v6 / v9;
      if (v9-- <= 4)
        goto LABEL_16;
    }
    v10 = v9 + 1;
LABEL_16:
    objc_msgSend(v5, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(33, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_2;
    block[3] = &unk_1E6E53C58;
    v40 = v10;
    v41 = v7;
    block[4] = self;
    v15 = v13;
    v38 = v15;
    v16 = v5;
    v39 = v16;
    dispatch_apply(v8, v14, block);

    if (!self->_isCancelled)
    {
      v31 = v15;
      v32 = v5;
      v30 = v16;
      objc_msgSend(v16, "objectForKey:", CFSTR("com.apple.MobileAddressBook"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v19 = (void *)objc_msgSend(v18, "copy");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRSRankingItemRanker meContactIdentifier](self, "meContactIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "isEqualToString:", v26);

            if (v27)
            {
              LODWORD(v28) = -8388609;
              objc_msgSend(v24, "setScore:", v28);
              LODWORD(v29) = -8388609;
              objc_msgSend(v24, "setWithinBundleScore:", v29);
              objc_msgSend(v18, "removeObject:", v24);
              objc_msgSend(v18, "addObject:", v24);
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v21);
      }

      objc_msgSend(v30, "setObject:forKey:", v18, CFSTR("com.apple.MobileAddressBook"));
      v15 = v31;
      v5 = v32;
    }

  }
}

void __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke()
{
  if (get_thread_count_onceToken != -1)
    dispatch_once(&get_thread_count_onceToken, &__block_literal_global_656);
  rerankItemsWithPolicyForBundleItems_isCJK__core_count = get_thread_count_batch_size;
}

void __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  id *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  int v44;
  int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  unint64_t v51;
  int v52;
  unint64_t v53;
  int v54;
  _BOOL4 v55;
  float v56;
  float v57;
  void *v58;
  uint64_t v59;
  void *v60;
  float v61;
  float v62;
  _BOOL4 v63;
  _BOOL4 v64;
  void *v65;
  float v66;
  float v67;
  void *v68;
  float v69;
  float v70;
  void *v71;
  float v72;
  float v73;
  unint64_t v74;
  _BOOL4 v76;
  void *v77;
  float v78;
  float v79;
  unint64_t v80;
  int v81;
  int v82;
  int v83;
  void *v84;
  float v85;
  float v86;
  _BOOL4 v87;
  _BOOL4 v88;
  uint64_t v89;
  float v90;
  float v91;
  void *v92;
  float v93;
  float v94;
  int v95;
  void *v96;
  float v97;
  float v98;
  int v99;
  int v100;
  int v101;
  void *v102;
  BOOL v103;
  int v104;
  unint64_t v105;
  char v106;
  unint64_t v107;
  void *v108;
  unint64_t v109;
  void *v110;
  float v111;
  double v112;
  int v113;
  void *v114;
  float v115;
  double v116;
  int v117;
  void *v118;
  float v119;
  double v120;
  void *v121;
  uint64_t v122;
  int v123;
  _BYTE *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  _BYTE *v131;
  _QWORD *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t m;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  void *v163;
  void *v164;
  uint64_t v165;
  char v166;
  char v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char v171;
  char v172;
  uint64_t v173;
  uint64_t v174;
  double *v175;
  void *v176;
  uint64_t v177;
  char v178;
  char v179;
  uint64_t v180;
  double *v181;
  void *v182;
  uint64_t v183;
  char v184;
  char v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  char v189;
  char v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  char v194;
  char v195;
  uint64_t v196;
  id v197;
  float v198;
  NSObject *v199;
  uint64_t v200;
  unint64_t v201;
  unint64_t v202;
  uint64_t v203;
  uint64_t v204;
  float v205;
  float v206;
  void *v207;
  double v208;
  void *v209;
  double v210;
  NSObject *v211;
  uint64_t v212;
  unint64_t v213;
  unint64_t v214;
  uint64_t v215;
  float v216;
  void *v217;
  double v218;
  void *v219;
  double v220;
  NSObject *v221;
  uint64_t v222;
  unint64_t v223;
  unint64_t v224;
  uint64_t v225;
  float v226;
  void *v227;
  double v228;
  void *v229;
  double v230;
  NSObject *v231;
  uint64_t v232;
  unint64_t v233;
  unint64_t v234;
  uint64_t v235;
  float v236;
  void *v237;
  double v238;
  void *v239;
  double v240;
  NSObject *v241;
  uint64_t v242;
  unint64_t v243;
  unint64_t v244;
  uint64_t v245;
  float v246;
  void *v247;
  double v248;
  void *v249;
  double v250;
  NSObject *v251;
  uint64_t v252;
  unint64_t v253;
  unint64_t v254;
  uint64_t v255;
  uint64_t v256;
  float v257;
  float v258;
  float v259;
  void *v260;
  double v261;
  void *v262;
  double v263;
  void *v264;
  double v265;
  void *v266;
  __int16 v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  float v272;
  float v273;
  double v274;
  float v275;
  void *v276;
  double v277;
  void *v278;
  double v279;
  void *v280;
  void *v281;
  NSObject *v282;
  id v283;
  void *v284;
  float v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  float v294;
  void *v295;
  uint64_t v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  unint64_t v306;
  void *v307;
  _BOOL4 v308;
  uint64_t v309;
  _QWORD *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  int v322;
  void *v323;
  void *v324;
  int v325;
  void *v326;
  _BOOL4 v327;
  void *v328;
  id obj;
  int v330;
  void *v331;
  unint64_t v332;
  int v333;
  void *v334;
  _BOOL4 v335;
  _BOOL4 matched;
  void *v337;
  uint64_t v338;
  void *v339;
  int v340;
  uint64_t v341;
  void *v342;
  _BOOL4 v343;
  void *v344;
  _BOOL4 v345;
  id v346;
  void *v347;
  unint64_t v348;
  void *v349;
  id *v350;
  int v351;
  void *v352;
  _QWORD v353[5];
  _QWORD v354[5];
  _QWORD v355[5];
  _QWORD v356[5];
  _QWORD v357[5];
  _QWORD v358[5];
  unint64_t v359;
  unint64_t v360;
  unint64_t v361;
  unint64_t v362;
  unint64_t v363;
  unint64_t v364;
  unint64_t v365;
  unint64_t v366;
  unint64_t v367;
  unint64_t v368;
  unint64_t v369;
  unint64_t v370;
  unint64_t v371;
  unint64_t v372;
  unint64_t v373;
  unint64_t v374;
  unint64_t v375;
  unint64_t v376;
  unint64_t v377;
  unint64_t v378;
  unint64_t v379;
  unint64_t v380;
  unint64_t v381;
  unint64_t v382;
  unint64_t v383;
  unint64_t v384;
  unint64_t v385;
  unint64_t v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  _QWORD v391[5];
  _QWORD v392[5];
  _QWORD v393[8];
  char v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  _QWORD v411[5];
  unint64_t v412;
  __int16 v413;
  __int16 v414;
  __int16 v415;
  __int16 v416;
  __int16 v417;
  __int16 v418;
  __int16 v419;
  __int16 v420;
  __int16 v421;
  __int16 v422;
  __int16 v423;
  __int16 v424;
  __int16 v425;
  __int16 v426;
  __int16 v427;
  __int16 v428;
  __int16 v429;
  __int16 v430;
  __int16 v431;
  __int16 v432;
  __int16 v433;
  __int16 v434;
  __int16 v435;
  __int16 v436;
  __int16 v437;
  int v438;
  _BYTE v439[12];
  _BYTE v440[12];
  int v441;
  int v442;
  int v443;
  int v444;
  int v445;
  int v446;
  int v447;
  int v448;
  int v449;
  int v450;
  int v451;
  int v452;
  int v453;
  int v454;
  int v455;
  int v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  int v462;
  int v463;
  uint64_t v464;
  _BYTE v465[128];
  _BYTE v466[128];
  _BYTE v467[128];
  _BYTE v468[128];
  _QWORD v469[19];

  v8 = MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = v9;
  v11 = (_QWORD *)v8;
  v469[16] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1BCCB3708]();
  v310 = v11;
  v14 = (id *)(v11 + 4);
  v13 = (_QWORD *)v11[4];
  v15 = v11[7];
  v16 = v15 * v10;
  v17 = v15 * v10 + v15;
  if (v17 >= v11[8])
    v18 = v11[8];
  else
    v18 = v17;
  v19 = v13[25];
  v332 = objc_msgSend(v13, "queryTermLength");
  v20 = SSStringEndsWithSpace(*((void **)*v14 + 8));
  v21 = *((unsigned __int8 *)*v14 + 43);
  v308 = SSEnableSpotlightTopHitPersonalizedRanking();
  v333 = v20;
  if (*((_QWORD *)*v14 + 23) == 1)
    v22 = v20;
  else
    v22 = 0;
  v103 = v21 == 0;
  v23 = v16;
  if (!v103)
    v22 = 1;
  v340 = v22;
  PRSRankingQueryIndexDictionary();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  v306 = v18;
  if (v16 >= v18)
    goto LABEL_382;
  v348 = v19 - 5;
  v26 = 3221225472;
  v27 = -10000.0;
  v28 = -5000.0;
  v347 = (void *)v24;
  v350 = v14;
  v295 = v12;
  do
  {
    objc_msgSend((id)v310[5], "objectAtIndexedSubscript:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SSPommesRankingForSectionBundle(v29) & v308 & 1) != 0)
      goto LABEL_377;
    v296 = v23;
    objc_msgSend((id)v310[6], "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v411[0] = MEMORY[0x1E0C809B0];
    v411[1] = v26;
    v411[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_3;
    v411[3] = &unk_1E6E53B98;
    v411[4] = v310[4];
    objc_msgSend(v30, "sortedArrayWithOptions:usingComparator:", 1, v411);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v322 = 0;
    v311 = v29;
    matched = SSDemoteNonExactMatchBundle();
    if (matched && v348 <= 3)
    {
      if (!*((_QWORD *)*v14 + 23))
      {
        v322 = 0;
LABEL_31:
        v406 = 0u;
        v405 = 0u;
        v404 = 0u;
        v403 = 0u;
        v38 = v31;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v403, v468, 16);
        if (!v39)
          goto LABEL_58;
        v40 = v39;
        v41 = *(_QWORD *)v404;
        while (2)
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v404 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v403 + 1) + 8 * i);
            v44 = hasPolicyPhraseMatch(v43, *((_QWORD *)*v14 + 23), 1);
            v45 = v44;
            if (*((_BYTE *)*v14 + 43))
            {
              if ((v44 & 1) != 0)
                goto LABEL_60;
            }
            else if ((hasPolicyPhraseMatch(v43, *((_QWORD *)*v14 + 23), 0) & 1) != 0)
            {
LABEL_60:
              v330 = v45;
              v343 = 0;
              v55 = 1;
              goto LABEL_62;
            }
          }
          v330 = v45;
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v403, v468, 16);
          if (v40)
            continue;
          break;
        }
        v343 = 0;
        goto LABEL_59;
      }
      v410 = 0u;
      v409 = 0u;
      v408 = 0u;
      v407 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v407, v469, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v408;
        while (2)
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v408 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v407 + 1) + 8 * j);
            if ((objc_msgSend(v37, "shouldHideUnderShowMore") & 1) == 0
              && (hasPolicyPhraseMatch(v37, *((_QWORD *)*v14 + 23), 1) & 1) != 0)
            {
              v322 = 0;
              goto LABEL_27;
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v407, v469, 16);
          if (v34)
            continue;
          break;
        }
        v322 = 1;
LABEL_27:
        v29 = v311;
      }
      else
      {
        v322 = 1;
      }

    }
    if (v348 <= 3)
      goto LABEL_31;
    v402 = 0u;
    v401 = 0u;
    v400 = 0u;
    v399 = 0u;
    v46 = v31;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v399, v467, 16);
    if (!v47)
    {
      v343 = 0;
      v330 = 0;
      v327 = 0;
      goto LABEL_64;
    }
    v48 = v47;
    v49 = *(_QWORD *)v400;
    while (2)
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v400 != v49)
          objc_enumerationMutation(v46);
        v51 = *((_QWORD *)*v14 + 23);
        v343 = v51 < 2;
        if (v51 >= 2)
        {
          v54 = *((unsigned __int8 *)*v14 + 43);
          v53 = *((_QWORD *)*v14 + 23);
        }
        else
        {
          if (v51 == 1)
            v52 = v333;
          else
            v52 = 0;
          if (v52 != 1)
            continue;
          v53 = 1;
          v54 = 1;
        }
        if ((hasPolicyPhraseMatch(*(void **)(*((_QWORD *)&v399 + 1) + 8 * k), v53, v54) & 1) != 0)
        {
          v330 = 0;
          v55 = v51 > 1;
LABEL_62:
          v327 = v55;
          goto LABEL_63;
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v399, v467, 16);
      if (v48)
        continue;
      break;
    }
LABEL_58:
    v343 = 0;
    v330 = 0;
LABEL_59:
    v327 = 0;
LABEL_63:
    v29 = v311;
LABEL_64:

    v334 = (void *)objc_opt_new();
    v349 = (void *)objc_opt_new();
    v335 = (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0
        || (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
        || objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobilemail"));
    v398 = 0u;
    v397 = 0u;
    v396 = 0u;
    v395 = 0u;
    obj = v31;
    v341 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v395, v466, 16);
    if (v341)
    {
      v303 = 0;
      v304 = 0;
      v305 = 0;
      v307 = 0;
      v325 = 0;
      v351 = 0;
      v338 = *(_QWORD *)v396;
      v56 = -3.4028e38;
      v57 = -3.4028e38;
      v58 = v349;
      while (2)
      {
        v59 = 0;
LABEL_71:
        if (*(_QWORD *)v396 != v338)
          objc_enumerationMutation(obj);
        if (*((_BYTE *)*v14 + 38))
        {
          v288 = obj;

          v12 = v295;
          v29 = v311;
          goto LABEL_381;
        }
        v60 = *(void **)(*((_QWORD *)&v395 + 1) + 8 * v59);
        objc_msgSend(v60, "score");
        if (v61 >= v57)
          v57 = v61;
        objc_msgSend(v60, "withinBundleScore");
        if (v62 >= v56)
          v56 = v62;
        if ((objc_msgSend(v60, "bundleIDType") & 0x100) != 0)
        {
          objc_msgSend(v60, "L2FeatureVector");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "scoreForFeature:", 2327);
          v67 = v66;

          v63 = v67 == 1.0;
          objc_msgSend(v60, "L2FeatureVector");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "scoreForFeature:", 1);
          v70 = v69;

          objc_msgSend(v60, "L2FeatureVector");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "scoreForFeature:", 41);
          v73 = v72;

          v74 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen");
          v76 = v70 == 1.0 && v332 > v74;
          if (v73 != 0.0)
            v76 = 0;
          v345 = v76;
          objc_msgSend(v60, "L2FeatureVector");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "scoreForFeature:", 2328);
          v79 = v78;

          v64 = v79 == 1.0;
        }
        else
        {
          v63 = 0;
          v345 = 0;
          v64 = 0;
        }
        v80 = *((_QWORD *)*v14 + 23);
        if (v348 > 3)
        {
          v83 = hasPolicyPhraseMatch(v60, v80, v340);
          v82 = 0;
        }
        else
        {
          v81 = hasPolicyPhraseMatch(v60, v80, 1);
          v82 = v81;
          if (*((_BYTE *)*v14 + 43))
            v83 = v81;
          else
            v83 = hasPolicyPhraseMatch(v60, *((_QWORD *)*v14 + 23), 0);
        }
        objc_msgSend(v60, "L2FeatureVector");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "scoreForFeature:", 2390);
        v86 = v85;

        v87 = v86 == 1.0;
        v88 = v335
           && hasPolicySecondaryMatch(v60, *((_QWORD *)*v350 + 23), *((_QWORD *)*v350 + 24), *((void **)*v350 + 9), v340, v347);
        objc_msgSend(v60, "L2FeatureVector");
        v89 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v89, "scoreForFeature:", 2);
        v91 = v90;

        LOWORD(v89) = objc_msgSend(v60, "bundleIDType");
        objc_msgSend(v60, "L2FeatureVector");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "scoreForFeature:", 2362);
        v94 = v93;

        if ((v89 & 0x800) != 0 && (objc_msgSend(v60, "shouldHideUnderShowMore") & 1) == 0)
        {
          if (*((_QWORD *)*v350 + 23) && v91 == 1.0 && v332 > 2)
          {
            v95 = 1;
          }
          else
          {
            v103 = v94 == 1.0 && *((_BYTE *)*v350 + 43) == 0;
            v95 = v103;
          }
        }
        else
        {
          v95 = 0;
        }
        v351 |= v87;
        objc_msgSend(v60, "L2FeatureVector");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "scoreForFeature:", 1927);
        v98 = v97;

        v99 = objc_msgSend(v60, "matchedQueryTerms");
        if (v98 == 1.0)
          v100 = v99;
        else
          v100 = 0;
        if (objc_msgSend(v60, "isNotExecutable"))
        {
          objc_msgSend(v349, "addObject:", v60);
          v25 = v347;
          goto LABEL_105;
        }
        if (!objc_msgSend(v60, "matchedQueryTerms")
          || v98 != 1.0
          && (objc_msgSend(v60, "bundleIDType") & 0x100000) == 0
          && (objc_msgSend(v60, "bundleIDType") & 8) == 0
          && (objc_msgSend(v60, "bundleIDType") & 2) == 0)
        {
          goto LABEL_122;
        }
        if ((objc_msgSend(v60, "bundleIDType") & 0x40000) != 0 || (objc_msgSend(v60, "bundleIDType") & 0x2000000) != 0)
        {
          v101 = v330;
          if (*((_QWORD *)*v350 + 23) != 1)
            v101 = 1;
          if ((((v343 || v327) | v101) & 1) != 0)
            goto LABEL_122;
          goto LABEL_139;
        }
        if (!(v343 | v330 | v327))
          goto LABEL_139;
LABEL_122:
        if ((v330 & v82 & v83) == 1 || !(v330 | !v327 | v83 ^ 1) || ((v343 & v83 | v64 | v88 | v351) & 1) != 0)
        {
LABEL_139:
          objc_msgSend(v334, "addObject:", v60);
          if ((v351 & 1) != 0)
          {
            v25 = v347;
            v14 = v350;
            if (objc_msgSend(v60, "shouldHideUnderShowMore"))
              objc_msgSend(v60, "setShouldHideUnderShowMore:", 0);
            if (objc_msgSend(v60, "shouldHideUnderShowMoreIfNotTophit"))
              objc_msgSend(v60, "setShouldHideUnderShowMoreIfNotTophit:", 0);
            v104 = v325;
            if ((v325 & 1) == 0)
              v104 = 1;
            v325 = v104;
          }
          else
          {
            v25 = v347;
            v14 = v350;
          }
          if (*((_BYTE *)*v14 + 33))
          {
            if (objc_msgSend(v60, "shouldHideUnderShowMore"))
              objc_msgSend(v60, "setShouldHideUnderShowMore:", 0);
            if (objc_msgSend(v60, "shouldHideUnderShowMoreIfNotTophit"))
              objc_msgSend(v60, "setShouldHideUnderShowMoreIfNotTophit:", 0);
          }
        }
        else
        {
          if (*((_BYTE *)*v350 + 33))
          {
            if ((objc_msgSend(v60, "bundleIDType") & 0x100000) == 0
              && !(((unint64_t)objc_msgSend(v60, "bundleIDType") >> 3) & 1 | v95 & 1))
            {
              goto LABEL_128;
            }
            goto LABEL_139;
          }
          if (v95)
            goto LABEL_139;
LABEL_128:
          if (((v100 & v330 ^ 1 | v82 | v83 ^ 1) & 1) != 0)
          {
            v25 = v347;
            if (((!v327 | v83 | v100 ^ 1) & 1) != 0)
            {
              v14 = v350;
              if ((objc_msgSend(v60, "bundleIDType") & 0x100) == 0)
                goto LABEL_131;
              if (v63)
              {
                v102 = v304;
                if (!v304)
                  v102 = (void *)objc_opt_new();
                v304 = v102;
              }
              else if (v345)
              {
                v102 = v303;
                if (!v303)
                  v102 = (void *)objc_opt_new();
                v303 = v102;
              }
              else
              {
LABEL_131:
                v102 = v349;
              }
            }
            else
            {
              v14 = v350;
              v102 = v305;
              if (!v305)
                v102 = (void *)objc_opt_new();
              v305 = v102;
            }
            objc_msgSend(v102, "addObject:", v60);
          }
          else
          {
            v25 = v347;
            v121 = v307;
            if (!v307)
              v121 = (void *)objc_opt_new();
            v307 = v121;
            objc_msgSend(v121, "addObject:", v60);
LABEL_105:
            v14 = v350;
          }
        }
        v105 = objc_msgSend(v60, "bundleIDType") & 0x100;
        if (v105)
          v106 = v63;
        else
          v106 = 1;
        if ((v106 & 1) != 0)
        {
          v107 = v105 >> 8;
        }
        else
        {
          objc_msgSend(v60, "firstMatchedAltName");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          if (v108)
            LODWORD(v107) = 1;
          else
            LODWORD(v107) = v345;

        }
        v58 = v349;
        v109 = *((_QWORD *)*v14 + 23);
        if (matched && v348 <= 3)
        {
          if (v109)
          {
            if (v322)
            {
              if ((v95 & 1) == 0)
              {
                objc_msgSend(v60, "setIsBundleDemotedForBullseyeCommittedSearch:", 1);
                objc_msgSend(v60, "L2FeatureVector");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "originalL2Score");
                *(float *)&v112 = v111 + v27;
                objc_msgSend(v110, "setOriginalL2Score:", v112);

                goto LABEL_180;
              }
            }
            else if ((v82 & 1) == 0)
            {
LABEL_180:
              objc_msgSend(v60, "setShouldHideUnderShowMoreIfNotTophit:", 1);
            }
          }
        }
        else
        {
          if (v109 >= 2)
          {
            v113 = v327;
            if (!*((_BYTE *)*v14 + 40))
              v113 = 1;
            if (((v113 | v107) & 1) == 0
              && !(((unint64_t)objc_msgSend(v60, "bundleIDType") >> 2) & 1 | v95 & 1))
            {
              objc_msgSend(v60, "L2FeatureVector");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "originalL2Score");
              *(float *)&v116 = v115 + v27;
              objc_msgSend(v114, "setOriginalL2Score:", v116);

            }
          }
          if (*((_QWORD *)*v14 + 23) == 1)
          {
            v117 = v343;
            if (!*((_BYTE *)*v14 + 41))
              v117 = 1;
            if (((v117 | v107) & 1) == 0)
            {
              objc_msgSend(v60, "L2FeatureVector");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "originalL2Score");
              *(float *)&v120 = v119 + v27;
              objc_msgSend(v118, "setOriginalL2Score:", v120);

            }
          }
        }
        if (v341 == ++v59)
        {
          v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v395, v466, 16);
          v341 = v122;
          if (!v122)
          {
            v123 = v325 & 1;
            v12 = v295;
            v29 = v311;
            goto LABEL_201;
          }
          continue;
        }
        goto LABEL_71;
      }
    }
    v303 = 0;
    v304 = 0;
    v305 = 0;
    v307 = 0;
    v123 = 0;
    v56 = -3.4028e38;
    v57 = -3.4028e38;
    v58 = v349;
LABEL_201:

    if (*((_BYTE *)*v14 + 38))
    {
      v288 = obj;
LABEL_381:

      break;
    }
    v294 = v27;
    if (!objc_msgSend(v334, "count"))
      goto LABEL_337;
    if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) == 0
      && (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) == 0
      && (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) == 0)
    {
      v124 = *v14;
      if ((!v123 || !v124[32]) && !v124[33])
      {
        v358[0] = MEMORY[0x1E0C809B0];
        v358[1] = v26;
        v358[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_7;
        v358[3] = &unk_1E6E53B98;
        v358[4] = v124;
        objc_msgSend(v334, "sortWithOptions:usingComparator:", 17, v358);
        goto LABEL_330;
      }
    }
    objc_msgSend(v25, "objectForKey:", CFSTR("kMDItemShortcutWithinBagParamValue"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v125, "integerValue");

    objc_msgSend(v25, "objectForKey:", CFSTR("PRSPolicyFieldsPrefixMatch"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v127, "integerValue");

    objc_msgSend(v25, "objectForKey:", CFSTR("PRSRankingTCNearMatch"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "integerValue");

    v131 = *v14;
    if (v123 && v131[32])
    {
      v393[0] = MEMORY[0x1E0C809B0];
      v393[1] = v26;
      v393[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_4;
      v393[3] = &unk_1E6E53C30;
      v394 = 1;
      v393[4] = v131;
      v393[5] = v126;
      v393[6] = v128;
      v393[7] = v130;
      v132 = v393;
      v133 = v334;
      goto LABEL_328;
    }
    if (!v131[33])
    {
      v134 = objc_msgSend(v334, "count");
      v352 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v134);
      v309 = v134;
      v344 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v134);
      v387 = 0u;
      v388 = 0u;
      v389 = 0u;
      v390 = 0u;
      v346 = v334;
      v135 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v387, v465, 16);
      if (v135)
      {
        v136 = v135;
        v137 = *(_QWORD *)v388;
        do
        {
          for (m = 0; m != v136; ++m)
          {
            if (*(_QWORD *)v388 != v137)
              objc_enumerationMutation(v346);
            v139 = *(void **)(*((_QWORD *)&v387 + 1) + 8 * m);
            if (isLowerScore(v139, *((_QWORD *)*v14 + 23), *((_QWORD *)*v14 + 24), *((void **)*v14 + 9), v25))
            {
              objc_msgSend(v352, "addObject:", v139);
            }
            else
            {
              objc_msgSend(v344, "addObject:", v139);
              bzero(&v439[4], 0x3288uLL);
              bzero((char *)&v412 + 2, 0x1944uLL);
              LOWORD(v412) = 2427;
              *(_DWORD *)v439 = 1065353216;
              objc_msgSend(v139, "L2FeatureVector");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "setScores:forFeatures:count:", v439, &v412, 1);

            }
          }
          v136 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v387, v465, 16);
        }
        while (v136);
      }

      v141 = objc_msgSend(v352, "count");
      v318 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v342 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v339 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v331 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v337 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v328 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v326 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v324 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v321 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v323 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v320 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v319 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v317 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v316 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v315 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v314 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v313 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v312 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v302 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v301 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v300 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v299 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v298 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v297 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v292 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v291 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v289 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v141);
      v144 = (void *)objc_opt_new();
      v293 = v144;
      if (!v141)
      {
LABEL_296:
        objc_msgSend(v352, "removeObjectsAtIndexes:", v144, v289);
        *(_QWORD *)v439 = 0;
        v412 = 0;
        v386 = 0;
        v385 = 0;
        v384 = 0;
        v383 = 0;
        v382 = 0;
        v381 = 0;
        v380 = 0;
        v379 = 0;
        v378 = 0;
        v377 = 0;
        v376 = 0;
        v375 = 0;
        v374 = 0;
        v373 = 0;
        v372 = 0;
        v371 = 0;
        v370 = 0;
        v369 = 0;
        v368 = 0;
        v367 = 0;
        v366 = 0;
        v365 = 0;
        v364 = 0;
        v363 = 0;
        v362 = 0;
        v361 = 0;
        v360 = 0;
        v359 = 0;
        v162 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v163 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v309);
        v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v309);
        v165 = 0;
        v166 = 1;
        do
        {
          v167 = v166;
          v168 = sDockApps_block_invoke_3_sRecencyFeatureList1[v165];
          v169 = sDockApps_block_invoke_3_sPeriodList1[v165];
          updateBatch(v318, (unint64_t *)v439, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v142, &v412, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v342, &v386, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v339, &v384, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v337, &v382, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v143, &v385, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          if ((v333 & 1) == 0 && !*((_BYTE *)*v350 + 43))
          {
            updateBatch(v324, &v379, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v323, &v377, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v321, &v378, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v320, &v376, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v319, &v375, v168, v169, v164, v162, v163, *((double *)*v350 + 22));
          }
          v166 = 0;
          v165 = 1;
        }
        while ((v167 & 1) != 0);
        v170 = 0;
        v171 = 1;
        do
        {
          v172 = v171;
          v173 = sDockApps_block_invoke_3_sRecencyFeatureList2[v170];
          v174 = sDockApps_block_invoke_3_sPeriodList2[v170];
          updateBatch(v318, (unint64_t *)v439, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v142, &v412, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v342, &v386, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v339, &v384, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v337, &v382, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v143, &v385, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          v175 = (double *)*v350;
          if ((v333 & 1) != 0)
          {
            v176 = v331;
          }
          else
          {
            v176 = v331;
            if (!*((_BYTE *)v175 + 43))
            {
              updateBatch(v324, &v379, v173, v174, v164, v162, v163, v175[22]);
              updateBatch(v323, &v377, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
              updateBatch(v321, &v378, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
              updateBatch(v320, &v376, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
              updateBatch(v319, &v375, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
              v176 = v331;
              v175 = (double *)*v350;
            }
          }
          updateBatch(v176, &v383, v173, v174, v164, v162, v163, v175[22]);
          updateBatch(v328, &v381, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v326, &v380, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          if ((v333 & 1) == 0 && !*((_BYTE *)*v350 + 43))
          {
            updateBatch(v317, &v374, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v316, &v373, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v315, &v372, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v314, &v371, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v313, &v370, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v312, &v369, v173, v174, v164, v162, v163, *((double *)*v350 + 22));
          }
          v171 = 0;
          v170 = 1;
        }
        while ((v172 & 1) != 0);
        v177 = 0;
        v178 = 1;
        do
        {
          v179 = v178;
          v180 = sDockApps_block_invoke_3_sPeriodList3[v177];
          updateBatch(v318, (unint64_t *)v439, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v142, &v412, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v342, &v386, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v339, &v384, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v337, &v382, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v143, &v385, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          v181 = (double *)*v350;
          if ((v333 & 1) != 0)
          {
            v182 = v331;
          }
          else
          {
            v182 = v331;
            if (!*((_BYTE *)v181 + 43))
            {
              updateBatch(v324, &v379, 0, v180, v164, v162, v163, v181[22]);
              updateBatch(v321, &v378, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
              updateBatch(v323, &v377, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
              updateBatch(v320, &v376, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
              updateBatch(v319, &v375, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
              v182 = v331;
              v181 = (double *)*v350;
            }
          }
          updateBatch(v182, &v383, 0, v180, v164, v162, v163, v181[22]);
          updateBatch(v328, &v381, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v326, &v380, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          if ((v333 & 1) == 0 && !*((_BYTE *)*v350 + 43))
          {
            updateBatch(v317, &v374, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v316, &v373, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v315, &v372, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v314, &v371, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v313, &v370, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v312, &v369, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v292, &v362, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v300, &v366, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v299, &v365, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v298, &v364, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v291, &v361, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v290, &v360, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v302, &v368, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v301, &v367, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
            updateBatch(v297, &v363, 0, v180, v164, v162, v163, *((double *)*v350 + 22));
          }
          v178 = 0;
          v177 = 1;
        }
        while ((v179 & 1) != 0);
        v183 = 0;
        v184 = 1;
        do
        {
          v185 = v184;
          v186 = sDockApps_block_invoke_3_sRecencyFeatureList1[v183];
          v187 = sDockApps_block_invoke_3_sPeriodList1[v183];
          updateBatch(v318, (unint64_t *)v439, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v142, &v412, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v342, &v386, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v339, &v384, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v337, &v382, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v143, &v385, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v324, &v379, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v323, &v377, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v321, &v378, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v320, &v376, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v319, &v375, v186, v187, v164, v162, v163, *((double *)*v350 + 22));
          v184 = 0;
          v183 = 1;
        }
        while ((v185 & 1) != 0);
        v188 = 0;
        v189 = 1;
        do
        {
          v190 = v189;
          v191 = sDockApps_block_invoke_3_sRecencyFeatureList2[v188];
          v192 = sDockApps_block_invoke_3_sPeriodList2[v188];
          updateBatch(v318, (unint64_t *)v439, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v142, &v412, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v342, &v386, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v339, &v384, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v337, &v382, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v143, &v385, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v324, &v379, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v323, &v377, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v321, &v378, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v320, &v376, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v319, &v375, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v331, &v383, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v328, &v381, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v326, &v380, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v317, &v374, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v316, &v373, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v315, &v372, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v314, &v371, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v313, &v370, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v312, &v369, v191, v192, v164, v162, v163, *((double *)*v350 + 22));
          v189 = 0;
          v188 = 1;
        }
        while ((v190 & 1) != 0);
        v193 = 0;
        v194 = 1;
        do
        {
          v195 = v194;
          v196 = sDockApps_block_invoke_3_sPeriodList3[v193];
          updateBatch(v318, (unint64_t *)v439, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v142, &v412, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v342, &v386, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v339, &v384, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v337, &v382, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v143, &v385, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v324, &v379, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v321, &v378, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v323, &v377, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v320, &v376, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v319, &v375, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v331, &v383, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v328, &v381, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v326, &v380, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v317, &v374, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v316, &v373, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v315, &v372, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v314, &v371, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v313, &v370, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v312, &v369, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v292, &v362, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v300, &v366, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v299, &v365, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v298, &v364, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v291, &v361, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v290, &v360, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v302, &v368, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v301, &v367, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          updateBatch(v297, &v363, 0, v196, v164, v162, v163, *((double *)*v350 + 22));
          v194 = 0;
          v193 = 1;
        }
        while ((v195 & 1) != 0);
        updateBatch(v352, &v359, 0, 0, v164, v162, v163, *((double *)*v350 + 22));
        objc_msgSend(v164, "addObjectsFromArray:", v344);
        objc_msgSend(v164, "addObjectsFromArray:", v163);
        v197 = v164;

        v334 = v197;
        v12 = v295;
        v25 = v347;
        v14 = v350;
        v29 = v311;
        goto LABEL_329;
      }
      v145 = 0;
      while (2)
      {
        objc_msgSend(v352, "objectAtIndex:", v145, v289);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        bzero(&v439[4], 0x3288uLL);
        bzero((char *)&v412 + 2, 0x1944uLL);
        LOWORD(v412) = 2428;
        *(_DWORD *)v439 = 0;
        if (isUpper1_0(v146, v147, v25))
        {
          objc_msgSend(v318, "addObject:", v146);
          objc_msgSend(v144, "addIndex:", v145);
          WORD1(v412) = 2397;
          *(_DWORD *)&v439[4] = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 2;
          goto LABEL_236;
        }
        WORD1(v412) = 2397;
        *(_DWORD *)&v439[4] = 0;
        if (isUpper1(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v142, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          WORD2(v412) = 2398;
          *(_DWORD *)&v439[8] = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 3;
          goto LABEL_236;
        }
        WORD2(v412) = 2398;
        *(_DWORD *)&v439[8] = 0;
        if ((isUpper2_0_2(v146, *((_QWORD *)*v350 + 23), v25) & 1) != 0
          || isUpper2_0_3(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v342, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          HIWORD(v412) = 2399;
          *(_DWORD *)v440 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 4;
          goto LABEL_236;
        }
        HIWORD(v412) = 2399;
        *(_DWORD *)v440 = 0;
        if ((isUpper2_1_2(v146, *((_QWORD *)*v350 + 23), v25) & 1) != 0
          || isUpper2_1_3(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v339, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v413 = 2401;
          *(_DWORD *)&v440[4] = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 5;
          goto LABEL_236;
        }
        v413 = 2401;
        *(_DWORD *)&v440[4] = 0;
        if ((isUpper2_2_2(v146, *((_QWORD *)*v350 + 23), v25, *((void **)*v350 + 3)) & 1) != 0
          || isUpper2_2_3(v146, *((_QWORD *)*v350 + 23), v25, *((void **)*v350 + 3)))
        {
          objc_msgSend(v337, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v414 = 2403;
          *(_DWORD *)&v440[8] = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 6;
          goto LABEL_236;
        }
        v414 = 2403;
        *(_DWORD *)&v440[8] = 0;
        if (isUpper2_0(v146, v151, v25))
        {
          objc_msgSend(v143, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v415 = 2400;
          v441 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 7;
          goto LABEL_236;
        }
        v415 = 2400;
        v441 = 0;
        if (isUpper3_0(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v324, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v416 = 2406;
          v442 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 8;
          goto LABEL_236;
        }
        v416 = 2406;
        v442 = 0;
        if (isUpper4_0(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v323, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v417 = 2408;
          v443 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 9;
          goto LABEL_236;
        }
        v417 = 2408;
        v443 = 0;
        if (isUpper3(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v321, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v418 = 2407;
          v444 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 10;
          goto LABEL_236;
        }
        v418 = 2407;
        v444 = 0;
        if (isUpper4(v146, v152, v25))
        {
          objc_msgSend(v320, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v419 = 2409;
          v445 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 11;
          goto LABEL_236;
        }
        v419 = 2409;
        v445 = 0;
        if (isUpper2_1(v146, *((_QWORD *)*v350 + 23), v25))
        {
          objc_msgSend(v331, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v420 = 2402;
          v446 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v148;
          v150 = 12;
LABEL_236:
          objc_msgSend(v148, "setScores:forFeatures:count:", v439, &v412, v150);
LABEL_237:

          if (v141 == ++v145)
            goto LABEL_296;
          continue;
        }
        break;
      }
      v420 = 2402;
      v446 = 0;
      if (isUpper2_2(v146, *((_QWORD *)*v350 + 23), v25, *((void **)*v350 + 3)))
      {
        objc_msgSend(v328, "addObject:", v146);
        v144 = v293;
        objc_msgSend(v293, "addIndex:", v145);
        v421 = 2404;
        v447 = 1065353216;
        objc_msgSend(v146, "L2FeatureVector");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v153;
        v154 = 13;
      }
      else
      {
        v421 = 2404;
        v447 = 0;
        if (isUpper2(v146, *((_QWORD *)*v350 + 23), v347))
        {
          objc_msgSend(v326, "addObject:", v146);
          v144 = v293;
          objc_msgSend(v293, "addIndex:", v145);
          v422 = 2405;
          v448 = 1065353216;
          objc_msgSend(v146, "L2FeatureVector");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v153;
          v154 = 14;
        }
        else
        {
          v422 = 2405;
          v448 = 0;
          if ((isUpper5__2(v146, *((_QWORD *)*v350 + 23), v347) & 1) != 0
            || isUpper5__3(v146, *((_QWORD *)*v350 + 23), v347))
          {
            objc_msgSend(v319, "addObject:", v146);
            v144 = v293;
            objc_msgSend(v293, "addIndex:", v145);
            v423 = 2410;
            v449 = 1065353216;
            objc_msgSend(v146, "L2FeatureVector");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v149 = v153;
            v154 = 15;
          }
          else
          {
            v423 = 2410;
            v449 = 0;
            if (isUpper5_0(v146, *((_QWORD *)*v350 + 23), v347))
            {
              objc_msgSend(v317, "addObject:", v146);
              v144 = v293;
              objc_msgSend(v293, "addIndex:", v145);
              v424 = 2411;
              v450 = 1065353216;
              objc_msgSend(v146, "L2FeatureVector");
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              v149 = v153;
              v154 = 16;
            }
            else
            {
              v424 = 2411;
              v450 = 0;
              if (isUpper5_0r(v146, *((_QWORD *)*v350 + 23), v347))
              {
                objc_msgSend(v316, "addObject:", v146);
                v144 = v293;
                objc_msgSend(v293, "addIndex:", v145);
                v425 = 2412;
                v451 = 1065353216;
                objc_msgSend(v146, "L2FeatureVector");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                v149 = v153;
                v154 = 17;
              }
              else
              {
                v425 = 2412;
                v451 = 0;
                if (isUpper5_1(v146, *((_QWORD *)*v350 + 23), v347))
                {
                  objc_msgSend(v315, "addObject:", v146);
                  v144 = v293;
                  objc_msgSend(v293, "addIndex:", v145);
                  v426 = 2413;
                  v452 = 1065353216;
                  objc_msgSend(v146, "L2FeatureVector");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  v149 = v153;
                  v154 = 18;
                }
                else
                {
                  v426 = 2413;
                  v452 = 0;
                  if (isUpper5_s(v146, *((_QWORD *)*v350 + 23), v347))
                  {
                    objc_msgSend(v314, "addObject:", v146);
                    v144 = v293;
                    objc_msgSend(v293, "addIndex:", v145);
                    v427 = 2414;
                    v453 = 1065353216;
                    objc_msgSend(v146, "L2FeatureVector");
                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                    v149 = v153;
                    v154 = 19;
                  }
                  else
                  {
                    v427 = 2415;
                    v453 = 0;
                    if (isUpper5(v146, v155, v347))
                    {
                      objc_msgSend(v313, "addObject:", v146);
                      v144 = v293;
                      objc_msgSend(v293, "addIndex:", v145);
                      v428 = 2415;
                      v454 = 1065353216;
                      objc_msgSend(v146, "L2FeatureVector");
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      v149 = v153;
                      v154 = 20;
                    }
                    else
                    {
                      v428 = 2415;
                      v454 = 0;
                      if (isUpper5_c(v146, v156, v347))
                      {
                        objc_msgSend(v312, "addObject:", v146);
                        v144 = v293;
                        objc_msgSend(v293, "addIndex:", v145);
                        v429 = 2416;
                        v455 = 1065353216;
                        objc_msgSend(v146, "L2FeatureVector");
                        v153 = (void *)objc_claimAutoreleasedReturnValue();
                        v149 = v153;
                        v154 = 21;
                      }
                      else
                      {
                        v429 = 2416;
                        v455 = 0;
                        if (isLowerScore_0(v146, *((_QWORD *)*v350 + 23), v347))
                        {
                          objc_msgSend(v292, "addObject:", v146);
                          v144 = v293;
                          objc_msgSend(v293, "addIndex:", v145);
                          v430 = 2423;
                          v456 = 1065353216;
                          objc_msgSend(v146, "L2FeatureVector");
                          v153 = (void *)objc_claimAutoreleasedReturnValue();
                          v149 = v153;
                          v154 = 22;
                        }
                        else
                        {
                          v430 = 2423;
                          v456 = 0;
                          if (isUpper7_0(v146, v157, v347))
                          {
                            objc_msgSend(v300, "addObject:", v146);
                            v144 = v293;
                            objc_msgSend(v293, "addIndex:", v145);
                            v431 = 2419;
                            v457 = 1065353216;
                            objc_msgSend(v146, "L2FeatureVector");
                            v153 = (void *)objc_claimAutoreleasedReturnValue();
                            v149 = v153;
                            v154 = 23;
                          }
                          else
                          {
                            v431 = 2419;
                            v457 = 0;
                            if (isUpper7_1(v146, v158, v347))
                            {
                              objc_msgSend(v299, "addObject:", v146);
                              v144 = v293;
                              objc_msgSend(v293, "addIndex:", v145);
                              v432 = 2420;
                              v458 = 1065353216;
                              objc_msgSend(v146, "L2FeatureVector");
                              v153 = (void *)objc_claimAutoreleasedReturnValue();
                              v149 = v153;
                              v154 = 24;
                            }
                            else
                            {
                              v432 = 2420;
                              v458 = 0;
                              if (isUpper7(v146, v159, v347))
                              {
                                objc_msgSend(v298, "addObject:", v146);
                                v144 = v293;
                                objc_msgSend(v293, "addIndex:", v145);
                                v433 = 2421;
                                v459 = 1065353216;
                                objc_msgSend(v146, "L2FeatureVector");
                                v153 = (void *)objc_claimAutoreleasedReturnValue();
                                v149 = v153;
                                v154 = 25;
                              }
                              else
                              {
                                v433 = 2421;
                                v459 = 0;
                                if (isLowerScore_c0(v146, *((_QWORD *)*v350 + 23), v347))
                                {
                                  objc_msgSend(v291, "addObject:", v146);
                                  v144 = v293;
                                  objc_msgSend(v293, "addIndex:", v145);
                                  v434 = 2424;
                                  v460 = 1065353216;
                                  objc_msgSend(v146, "L2FeatureVector");
                                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                                  v149 = v153;
                                  v154 = 26;
                                }
                                else
                                {
                                  v434 = 2424;
                                  v460 = 0;
                                  if (isLowerScore_c(v146, v160, v347))
                                  {
                                    objc_msgSend(v289, "addObject:", v146);
                                    v144 = v293;
                                    objc_msgSend(v293, "addIndex:", v145);
                                    v435 = 2425;
                                    v461 = 1065353216;
                                    objc_msgSend(v146, "L2FeatureVector");
                                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                                    v149 = v153;
                                    v154 = 27;
                                  }
                                  else
                                  {
                                    v435 = 2425;
                                    v461 = 0;
                                    if (isUpper6(v146, *((_QWORD *)*v350 + 23), *((_QWORD *)*v350 + 24), *((void **)*v350 + 9), v347))
                                    {
                                      objc_msgSend(v302, "addObject:", v146);
                                      v144 = v293;
                                      objc_msgSend(v293, "addIndex:", v145);
                                      v436 = 2417;
                                      v462 = 1065353216;
                                      objc_msgSend(v146, "L2FeatureVector");
                                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                                      v149 = v153;
                                      v154 = 28;
                                    }
                                    else
                                    {
                                      v436 = 2417;
                                      v462 = 0;
                                      if (isUpper6_r(v146, v161, *((_QWORD *)*v350 + 24), *((void **)*v350 + 9), v347))
                                      {
                                        objc_msgSend(v301, "addObject:", v146);
                                        v144 = v293;
                                        objc_msgSend(v293, "addIndex:", v145);
                                        v437 = 2418;
                                        v463 = 1065353216;
                                        objc_msgSend(v146, "L2FeatureVector");
                                        v153 = (void *)objc_claimAutoreleasedReturnValue();
                                        v149 = v153;
                                        v154 = 29;
                                      }
                                      else
                                      {
                                        v437 = 2418;
                                        v463 = 0;
                                        if (!isUpper7_r(v146, *((_QWORD *)*v350 + 23), *((_QWORD *)*v350 + 24), *((void **)*v350 + 9)))
                                        {
                                          v438 = 158992758;
                                          v464 = 0x3F80000000000000;
                                          objc_msgSend(v146, "L2FeatureVector");
                                          v149 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v149, "setScores:forFeatures:count:", v439, &v412, 31);
                                          v25 = v347;
                                          v144 = v293;
                                          goto LABEL_237;
                                        }
                                        objc_msgSend(v297, "addObject:", v146);
                                        v144 = v293;
                                        objc_msgSend(v293, "addIndex:", v145);
                                        LOWORD(v438) = 2422;
                                        LODWORD(v464) = 1065353216;
                                        objc_msgSend(v146, "L2FeatureVector");
                                        v153 = (void *)objc_claimAutoreleasedReturnValue();
                                        v149 = v153;
                                        v154 = 30;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      objc_msgSend(v153, "setScores:forFeatures:count:", v439, &v412, v154);
      v25 = v347;
      goto LABEL_237;
    }
    if ((SSSectionIsSyndicatedPhotos(v29) & 1) != 0)
    {
      v391[0] = MEMORY[0x1E0C809B0];
      v391[1] = v26;
      v391[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_6;
      v391[3] = &unk_1E6E53B98;
      v391[4] = *v14;
      v132 = v391;
    }
    else
    {
      v392[0] = MEMORY[0x1E0C809B0];
      v392[1] = v26;
      v392[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_5;
      v392[3] = &unk_1E6E53B98;
      v392[4] = *v14;
      v132 = v392;
    }
    v133 = v334;
LABEL_328:
    objc_msgSend(v133, "sortWithOptions:usingComparator:", 17, v132);
LABEL_329:
    v58 = v349;
LABEL_330:
    v198 = v28;
    PRSLogCategoryDefault();
    v199 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
    {
      v200 = objc_msgSend(v334, "count");
      *(_DWORD *)v439 = 134218242;
      *(_QWORD *)&v439[4] = v200;
      *(_WORD *)v440 = 2112;
      *(_QWORD *)&v440[2] = v29;
      _os_log_impl(&dword_1B86C5000, v199, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items matched query terms in bundle %@", v439, 0x16u);
    }

    v201 = objc_msgSend(v334, "count");
    if (v201)
    {
      v202 = v201;
      v203 = v26;
      v204 = 0;
      v205 = (float)v201;
      do
      {
        v206 = (float)v202 / v205;
        objc_msgSend(v334, "objectAtIndexedSubscript:", v204);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v208 = v57 + v206;
        objc_msgSend(v207, "setScore:", v208);

        objc_msgSend(v334, "objectAtIndexedSubscript:", v204);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v210 = v56 + v206;
        objc_msgSend(v209, "setWithinBundleScore:", v210);

        ++v204;
        --v202;
      }
      while (v202);
      v26 = v203;
    }
    v28 = v198;
LABEL_337:
    if (objc_msgSend(v307, "count"))
    {
      v357[0] = MEMORY[0x1E0C809B0];
      v357[1] = v26;
      v357[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_668;
      v357[3] = &unk_1E6E53B98;
      v357[4] = *v14;
      objc_msgSend(v307, "sortWithOptions:usingComparator:", 17, v357);
      PRSLogCategoryDefault();
      v211 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
      {
        v212 = objc_msgSend(v307, "count");
        *(_DWORD *)v439 = 134218242;
        *(_QWORD *)&v439[4] = v212;
        *(_WORD *)v440 = 2112;
        *(_QWORD *)&v440[2] = v29;
        _os_log_impl(&dword_1B86C5000, v211, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items not word matched phrase in bundle %@", v439, 0x16u);
      }

      v213 = objc_msgSend(v307, "count");
      if (v213)
      {
        v214 = v213;
        v215 = 0;
        v216 = (float)v213;
        do
        {
          objc_msgSend(v307, "objectAtIndexedSubscript:", v215);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v218 = (float)((float)v214 / v216) + v28;
          objc_msgSend(v217, "setScore:", v218);

          objc_msgSend(v307, "objectAtIndexedSubscript:", v215);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v220 = (float)((float)v214 / v216) + v28;
          objc_msgSend(v219, "setWithinBundleScore:", v220);

          ++v215;
          --v214;
        }
        while (v214);
      }
    }
    if (objc_msgSend(v305, "count"))
    {
      v356[0] = MEMORY[0x1E0C809B0];
      v356[1] = v26;
      v356[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_669;
      v356[3] = &unk_1E6E53B98;
      v356[4] = *v14;
      objc_msgSend(v305, "sortWithOptions:usingComparator:", 17, v356);
      PRSLogCategoryDefault();
      v221 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
      {
        v222 = objc_msgSend(v305, "count");
        *(_DWORD *)v439 = 134218242;
        *(_QWORD *)&v439[4] = v222;
        *(_WORD *)v440 = 2112;
        *(_QWORD *)&v440[2] = v29;
        _os_log_impl(&dword_1B86C5000, v221, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items not matched phrase in bundle %@", v439, 0x16u);
      }

      v223 = objc_msgSend(v305, "count");
      if (v223)
      {
        v224 = v223;
        v225 = 0;
        v226 = (float)v223;
        do
        {
          objc_msgSend(v305, "objectAtIndexedSubscript:", v225);
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v228 = (float)((float)v224 / v226) + -6000.0;
          objc_msgSend(v227, "setScore:", v228);

          objc_msgSend(v305, "objectAtIndexedSubscript:", v225);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v230 = (float)((float)v224 / v226) + -6000.0;
          objc_msgSend(v229, "setWithinBundleScore:", v230);

          ++v225;
          --v224;
        }
        while (v224);
      }
    }
    v27 = v294;
    if (objc_msgSend(v304, "count"))
    {
      v355[0] = MEMORY[0x1E0C809B0];
      v355[1] = v26;
      v355[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_670;
      v355[3] = &unk_1E6E53B98;
      v355[4] = *v14;
      objc_msgSend(v304, "sortWithOptions:usingComparator:", 17, v355);
      PRSLogCategoryDefault();
      v231 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
      {
        v232 = objc_msgSend(v304, "count");
        *(_DWORD *)v439 = 134218242;
        *(_QWORD *)&v439[4] = v232;
        *(_WORD *)v440 = 2112;
        *(_QWORD *)&v440[2] = v29;
        _os_log_impl(&dword_1B86C5000, v231, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items alt names only matched query terms in bundle %@", v439, 0x16u);
      }

      v233 = objc_msgSend(v304, "count");
      if (v233)
      {
        v234 = v233;
        v235 = 0;
        v236 = (float)v233;
        do
        {
          objc_msgSend(v304, "objectAtIndexedSubscript:", v235);
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v238 = (float)((float)v234 / v236) + -8000.0;
          objc_msgSend(v237, "setScore:", v238);

          objc_msgSend(v304, "objectAtIndexedSubscript:", v235);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v240 = (float)((float)v234 / v236) + -8000.0;
          objc_msgSend(v239, "setWithinBundleScore:", v240);

          ++v235;
          --v234;
        }
        while (v234);
      }
    }
    if (objc_msgSend(v303, "count"))
    {
      v354[0] = MEMORY[0x1E0C809B0];
      v354[1] = v26;
      v354[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_671;
      v354[3] = &unk_1E6E53B98;
      v354[4] = *v14;
      objc_msgSend(v303, "sortWithOptions:usingComparator:", 17, v354);
      PRSLogCategoryDefault();
      v241 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
      {
        v242 = objc_msgSend(v303, "count");
        *(_DWORD *)v439 = 134218242;
        *(_QWORD *)&v439[4] = v242;
        *(_WORD *)v440 = 2112;
        *(_QWORD *)&v440[2] = v29;
        _os_log_impl(&dword_1B86C5000, v241, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> re-ranked %lu items spell corrected matched query terms in bundle %@", v439, 0x16u);
      }

      v243 = objc_msgSend(v303, "count");
      if (v243)
      {
        v244 = v243;
        v245 = 0;
        v246 = (float)v243;
        do
        {
          objc_msgSend(v303, "objectAtIndexedSubscript:", v245);
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v248 = (float)((float)v244 / v246) + -9000.0;
          objc_msgSend(v247, "setScore:", v248);

          objc_msgSend(v303, "objectAtIndexedSubscript:", v245);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v250 = (float)((float)v244 / v246) + -9000.0;
          objc_msgSend(v249, "setWithinBundleScore:", v250);

          ++v245;
          --v244;
        }
        while (v244);
      }
    }
    if (objc_msgSend(v58, "count"))
    {
      v353[0] = MEMORY[0x1E0C809B0];
      v353[1] = v26;
      v353[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_672;
      v353[3] = &unk_1E6E53B98;
      v353[4] = *v14;
      objc_msgSend(v58, "sortWithOptions:usingComparator:", 17, v353);
      PRSLogCategoryDefault();
      v251 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
      {
        v252 = objc_msgSend(v58, "count");
        *(_DWORD *)v439 = 134218242;
        *(_QWORD *)&v439[4] = v252;
        *(_WORD *)v440 = 2112;
        *(_QWORD *)&v440[2] = v29;
        _os_log_impl(&dword_1B86C5000, v251, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> re-ranked %lu items not matched query terms in bundle %@", v439, 0x16u);
      }

      v253 = objc_msgSend(v58, "count");
      if (v253)
      {
        v254 = v253;
        v255 = 0;
        v256 = 0;
        v257 = (float)v253;
        do
        {
          v258 = (float)(v254 + v255) / v257;
          v259 = v258 + v294;
          objc_msgSend(v58, "objectAtIndexedSubscript:", v256);
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v261 = v258 + v294;
          objc_msgSend(v260, "setScore:", v261);

          if (!objc_msgSend(v334, "count") || *((_BYTE *)*v14 + 34))
            v259 = v258 + v28;
          objc_msgSend(v58, "objectAtIndexedSubscript:", v256);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v263 = v259;
          objc_msgSend(v262, "setScore:", v263);

          objc_msgSend(v58, "objectAtIndexedSubscript:", v256);
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v265 = v259;
          objc_msgSend(v264, "setWithinBundleScore:", v265);

          v58 = v349;
          if (SSEnableAppSearchV2())
          {
            objc_msgSend(v349, "objectAtIndexedSubscript:", v256);
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            v267 = objc_msgSend(v266, "bundleIDType");

            if ((v267 & 0x100) != 0)
            {
              objc_msgSend(*v14, "userQueryString");
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v349, "objectAtIndexedSubscript:", v256);
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v269, "displayName");
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v270, "lowercaseString");
              v271 = (void *)objc_claimAutoreleasedReturnValue();
              appErrorScore();
              v273 = v272;

              v29 = v311;
              v58 = v349;

              v274 = v273;
              if (v273 > 0.9)
              {
                v275 = v273 + 1.0;
                objc_msgSend(v349, "objectAtIndexedSubscript:", v256, v274);
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v277 = v275;
                objc_msgSend(v276, "setScore:", v277);

                objc_msgSend(v349, "objectAtIndexedSubscript:", v256);
                v278 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v279 = v275;
                objc_msgSend(v278, "setWithinBundleScore:", v279);

                objc_msgSend(v349, "objectAtIndexedSubscript:", v256);
                v280 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v280, "displayName");
                v281 = (void *)objc_claimAutoreleasedReturnValue();

                SSGeneralLog();
                v282 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
                {
                  SSRedactString(v281, 1);
                  v283 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v349, "objectAtIndexedSubscript:", v256);
                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v284, "score");
                  *(_DWORD *)v439 = 138412546;
                  *(_QWORD *)&v439[4] = v283;
                  *(_WORD *)v440 = 2048;
                  *(double *)&v440[2] = v285;
                  _os_log_impl(&dword_1B86C5000, v282, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> <AppSpellCorrection> updating L2 score for %@ to %f", v439, 0x16u);

                }
                v29 = v311;
                v58 = v349;
              }
            }
          }
          bzero(&v439[4], 0x3288uLL);
          bzero((char *)&v412 + 2, 0x1944uLL);
          LOWORD(v412) = 2428;
          *(_DWORD *)v439 = 1065353216;
          objc_msgSend(v58, "objectAtIndexedSubscript:", v256);
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v286, "L2FeatureVector");
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v287, "setScores:forFeatures:count:", v439, &v412, 1);

          ++v256;
          --v255;
        }
        while (v254 != v256);
      }
    }

    v23 = v296;
LABEL_377:

    ++v23;
  }
  while (v23 != v306);
LABEL_382:

  objc_autoreleasePoolPop(v12);
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDatesPlus:currentTime:hasCategory:topBit:upperBit:lowerBit:](a2, a3, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem comparePhotosOnlyWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_668(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_669(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_670(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if (objc_msgSend(v7, "isKeywordMatch")
    && objc_msgSend(v7, "wordMatchedKeyword")
    && objc_msgSend(v8, "isKeywordMatch")
    && !objc_msgSend(v8, "wordMatchedKeyword"))
  {
    v9 = -1;
  }
  else if (objc_msgSend(v7, "isKeywordMatch")
         && (objc_msgSend(v7, "wordMatchedKeyword") & 1) == 0
         && objc_msgSend(v8, "isKeywordMatch")
         && (objc_msgSend(v8, "wordMatchedKeyword") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v9 = --[PRSRankingItem compareWithDates:currentTime:]((uint64_t)v7, v8, *(double *)(*(_QWORD *)(a1 + 32) + 176));
  }

  return v9;
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_671(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_672(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(_QWORD *)(a1 + 32) + 176));
}

- (BOOL)wasItemCreatedWithinAWeek:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a3, "attributes"), 0x20uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v7 = 0;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    if (v6 <= 0.0 || v6 > self->_currentTime + -604800.0)
      v7 = 1;
  }

  return v7;
}

- (id)comparatorByJoiningComparator:(id)a3 withPredicate:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PRSRankingItemRanker_comparatorByJoiningComparator_withPredicate___block_invoke;
  v11[3] = &unk_1E6E53C80;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  v9 = (void *)MEMORY[0x1BCCB38DC](v11);

  return v9;
}

uint64_t __68__PRSRankingItemRanker_comparatorByJoiningComparator_withPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v6);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v7)
      v10 = -1;
    else
      v10 = v8;
  }
  else
  {
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v10;
}

- (void)resetbundleFeaturesScratchBuf:(float *)a3
{
  unint64_t i;

  for (i = 0; i != 46; ++i)
  {
    if (i >= 0x2E)
      -[PRSRankingItemRanker resetbundleFeaturesScratchBuf:].cold.1();
    a3[i] = flt_1B87E120C[i];
  }
}

+ (id)importantAttributesForBundle:(id)a3
{
  id v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD v129[19];
  _QWORD v130[17];
  uint64_t v131;
  uint64_t v132;
  _QWORD v133[3];
  _QWORD v134[2];
  _QWORD v135[4];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[3];
  _QWORD v139[2];
  _QWORD v140[2];

  v140[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.application")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")))
    {
      v7 = *MEMORY[0x1E0CA6048];
      v139[0] = *MEMORY[0x1E0CA68D8];
      v139[1] = v7;
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v139;
LABEL_17:
      v6 = 2;
      goto LABEL_18;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
    {
      v8 = *MEMORY[0x1E0CA60F0];
      v138[0] = *MEMORY[0x1E0CA6048];
      v138[1] = v8;
      v138[2] = *MEMORY[0x1E0CA6158];
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v138;
    }
    else
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilecal")))
      {
        v9 = *MEMORY[0x1E0CA64A0];
        v137[0] = *MEMORY[0x1E0CA6968];
        v137[1] = v9;
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = v137;
        goto LABEL_17;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
      {
        v10 = *MEMORY[0x1E0CA6150];
        v136[0] = *MEMORY[0x1E0CA6158];
        v136[1] = v10;
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = v136;
        goto LABEL_17;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Music")))
      {
        v11 = *MEMORY[0x1E0CA5F80];
        v135[0] = *MEMORY[0x1E0CA6968];
        v135[1] = v11;
        v12 = *MEMORY[0x1E0CA60A8];
        v135[2] = *MEMORY[0x1E0CA5FF0];
        v135[3] = v12;
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = v135;
        v6 = 4;
        goto LABEL_18;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
      {
        v13 = *MEMORY[0x1E0CA5F90];
        v134[0] = *MEMORY[0x1E0CA6158];
        v134[1] = v13;
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = v134;
        goto LABEL_17;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences")))
      {
        v16 = *MEMORY[0x1E0CA68D8];
        v133[0] = *MEMORY[0x1E0CA6158];
        v133[1] = v16;
        v133[2] = *MEMORY[0x1E0CA6150];
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = v133;
      }
      else
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
        {
          v132 = *MEMORY[0x1E0CA6158];
          v4 = (void *)MEMORY[0x1E0C99D20];
          v5 = &v132;
          goto LABEL_3;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.photos")))
        {
          v131 = *MEMORY[0x1E0CA68D8];
          v4 = (void *)MEMORY[0x1E0C99D20];
          v5 = &v131;
          goto LABEL_3;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
        {
          v17 = *MEMORY[0x1E0CA6598];
          v130[0] = *MEMORY[0x1E0CA66B0];
          v130[1] = v17;
          v18 = *MEMORY[0x1E0CA6630];
          v130[2] = *MEMORY[0x1E0CA6618];
          v130[3] = v18;
          v19 = *MEMORY[0x1E0CA65F8];
          v130[4] = *MEMORY[0x1E0CA6678];
          v130[5] = v19;
          v20 = *MEMORY[0x1E0CA6580];
          v130[6] = *MEMORY[0x1E0CA6588];
          v130[7] = v20;
          v21 = *MEMORY[0x1E0CA65B8];
          v130[8] = *MEMORY[0x1E0CA65B0];
          v130[9] = v21;
          v22 = *MEMORY[0x1E0CA6610];
          v130[10] = *MEMORY[0x1E0CA65A8];
          v130[11] = v22;
          v23 = *MEMORY[0x1E0CA66A8];
          v130[12] = *MEMORY[0x1E0CA60F0];
          v130[13] = v23;
          v24 = *MEMORY[0x1E0CA65E8];
          v130[14] = *MEMORY[0x1E0CA65D8];
          v130[15] = v24;
          v130[16] = *MEMORY[0x1E0CA5F40];
          v4 = (void *)MEMORY[0x1E0C99D20];
          v5 = v130;
          v6 = 17;
          goto LABEL_18;
        }
        if (SSSectionIsSyndicatedPhotos(v3))
        {
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.searchd.syndicatedPhotos.MobileSMS")))
          {
            v25 = *MEMORY[0x1E0CA6598];
            v129[0] = *MEMORY[0x1E0CA66B0];
            v129[1] = v25;
            v26 = *MEMORY[0x1E0CA6630];
            v129[2] = *MEMORY[0x1E0CA6618];
            v129[3] = v26;
            v27 = *MEMORY[0x1E0CA65F8];
            v129[4] = *MEMORY[0x1E0CA6678];
            v129[5] = v27;
            v28 = *MEMORY[0x1E0CA6580];
            v129[6] = *MEMORY[0x1E0CA6588];
            v129[7] = v28;
            v29 = *MEMORY[0x1E0CA65B8];
            v129[8] = *MEMORY[0x1E0CA65B0];
            v129[9] = v29;
            v30 = *MEMORY[0x1E0CA6610];
            v129[10] = *MEMORY[0x1E0CA65A8];
            v129[11] = v30;
            v31 = *MEMORY[0x1E0CA66A8];
            v129[12] = *MEMORY[0x1E0CA60F0];
            v129[13] = v31;
            v32 = *MEMORY[0x1E0CA65D8];
            v129[14] = *MEMORY[0x1E0CA6048];
            v129[15] = v32;
            v33 = *MEMORY[0x1E0CA5F40];
            v129[16] = *MEMORY[0x1E0CA65E8];
            v129[17] = v33;
            v129[18] = *MEMORY[0x1E0CA6320];
            v4 = (void *)MEMORY[0x1E0C99D20];
            v5 = v129;
          }
          else
          {
            if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.searchd.syndicatedPhotos.mobilenotes")))
            {
              v35 = *MEMORY[0x1E0CA6598];
              v109 = *MEMORY[0x1E0CA66B0];
              v110 = v35;
              v36 = *MEMORY[0x1E0CA6630];
              v111 = *MEMORY[0x1E0CA6618];
              v112 = v36;
              v37 = *MEMORY[0x1E0CA65F8];
              v113 = *MEMORY[0x1E0CA6678];
              v114 = v37;
              v38 = *MEMORY[0x1E0CA6580];
              v115 = *MEMORY[0x1E0CA6588];
              v116 = v38;
              v39 = *MEMORY[0x1E0CA65B8];
              v117 = *MEMORY[0x1E0CA65B0];
              v118 = v39;
              v40 = *MEMORY[0x1E0CA6610];
              v119 = *MEMORY[0x1E0CA65A8];
              v120 = v40;
              v41 = *MEMORY[0x1E0CA66A8];
              v121 = *MEMORY[0x1E0CA60F0];
              v122 = v41;
              v42 = *MEMORY[0x1E0CA6150];
              v123 = *MEMORY[0x1E0CA6158];
              v124 = v42;
              v43 = *MEMORY[0x1E0CA65E8];
              v125 = *MEMORY[0x1E0CA65D8];
              v126 = v43;
              v44 = *MEMORY[0x1E0CA6320];
              v127 = *MEMORY[0x1E0CA5F40];
              v128 = v44;
              v4 = (void *)MEMORY[0x1E0C99D20];
              v5 = &v109;
              v6 = 20;
              goto LABEL_18;
            }
            v46 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.spotlight.syndicatedPhotos.fileProvider"));
            v47 = *MEMORY[0x1E0CA6598];
            if (!v46)
            {
              v72 = *MEMORY[0x1E0CA66B0];
              v73 = v47;
              v57 = *MEMORY[0x1E0CA6630];
              v74 = *MEMORY[0x1E0CA6618];
              v75 = v57;
              v58 = *MEMORY[0x1E0CA65F8];
              v76 = *MEMORY[0x1E0CA6678];
              v77 = v58;
              v59 = *MEMORY[0x1E0CA6580];
              v78 = *MEMORY[0x1E0CA6588];
              v79 = v59;
              v60 = *MEMORY[0x1E0CA65B8];
              v80 = *MEMORY[0x1E0CA65B0];
              v81 = v60;
              v61 = *MEMORY[0x1E0CA6610];
              v82 = *MEMORY[0x1E0CA65A8];
              v83 = v61;
              v62 = *MEMORY[0x1E0CA66A8];
              v84 = *MEMORY[0x1E0CA60F0];
              v85 = v62;
              v63 = *MEMORY[0x1E0CA65E8];
              v86 = *MEMORY[0x1E0CA65D8];
              v87 = v63;
              v64 = *MEMORY[0x1E0CA6320];
              v88 = *MEMORY[0x1E0CA5F40];
              v89 = v64;
              v4 = (void *)MEMORY[0x1E0C99D20];
              v5 = &v72;
              v6 = 18;
              goto LABEL_18;
            }
            v90 = *MEMORY[0x1E0CA66B0];
            v91 = v47;
            v48 = *MEMORY[0x1E0CA6630];
            v92 = *MEMORY[0x1E0CA6618];
            v93 = v48;
            v49 = *MEMORY[0x1E0CA65F8];
            v94 = *MEMORY[0x1E0CA6678];
            v95 = v49;
            v50 = *MEMORY[0x1E0CA6580];
            v96 = *MEMORY[0x1E0CA6588];
            v97 = v50;
            v51 = *MEMORY[0x1E0CA65B8];
            v98 = *MEMORY[0x1E0CA65B0];
            v99 = v51;
            v52 = *MEMORY[0x1E0CA6610];
            v100 = *MEMORY[0x1E0CA65A8];
            v101 = v52;
            v53 = *MEMORY[0x1E0CA66A8];
            v102 = *MEMORY[0x1E0CA60F0];
            v103 = v53;
            v54 = *MEMORY[0x1E0CA65D8];
            v104 = *MEMORY[0x1E0CA6158];
            v105 = v54;
            v55 = *MEMORY[0x1E0CA5F40];
            v106 = *MEMORY[0x1E0CA65E8];
            v107 = v55;
            v108 = *MEMORY[0x1E0CA6320];
            v4 = (void *)MEMORY[0x1E0C99D20];
            v5 = &v90;
          }
          v6 = 19;
          goto LABEL_18;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.people.findMy")))
        {
          v34 = *MEMORY[0x1E0CA6048];
          v70 = *MEMORY[0x1E0CA6968];
          v71 = v34;
          v4 = (void *)MEMORY[0x1E0C99D20];
          v5 = &v70;
          goto LABEL_17;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.people.askToBuyRequest")))
        {
          v45 = *MEMORY[0x1E0CA6048];
          v68 = *MEMORY[0x1E0CA6968];
          v69 = v45;
          v4 = (void *)MEMORY[0x1E0C99D20];
          v5 = &v68;
          goto LABEL_17;
        }
        v56 = *MEMORY[0x1E0CA6968];
        v65 = *MEMORY[0x1E0CA6158];
        v66 = v56;
        v67 = *MEMORY[0x1E0CA6150];
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = &v65;
      }
    }
    v6 = 3;
    goto LABEL_18;
  }
  v140[0] = *MEMORY[0x1E0CA6158];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = v140;
LABEL_3:
  v6 = 1;
LABEL_18:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    v95,
    v96,
    v97,
    v98,
    v99,
    v100,
    v101,
    v102,
    v103,
    v104,
    v105,
    v106,
    v107,
    v108,
    v109,
    v110,
    v111,
    v112,
    v113,
    v114,
    v115,
    v116,
    v117,
    v118,
    v119,
    v120,
    v121,
    v122,
    v123);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)importantAttributesForParsecBundle:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *MEMORY[0x1E0CA6158];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)itemSpecificImportantAttributesForBundle:(id)a3 withItem:(id)a4
{
  id v5;
  id v6;
  __CFString **v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "bundleIDType") & 0x4000000) != 0
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0))
  {
    v7 = SSSectionIdentifierSyndicatedPhotosMessages;
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "bundleIDType") & 0x8000000) != 0
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0))
  {
    v7 = SSSectionIdentifierSyndicatedPhotosNotes;
LABEL_18:
    +[PRSRankingItemRanker importantAttributesForBundle:](PRSRankingItemRanker, "importantAttributesForBundle:", *v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "bundleIDType") & 0x10000000) != 0
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow"))))
  {
    v7 = SSSectionIdentifierSyndicatedPhotosFiles;
    goto LABEL_18;
  }
  v8 = 0;
LABEL_19:

  return v8;
}

+ (id)phoneFavoritesCopy
{
  void *v2;

  pthread_mutex_lock(&sVIPLock_0);
  v2 = (void *)objc_msgSend((id)sPhoneFavorites, "copy");
  pthread_mutex_unlock(&sVIPLock_0);
  return v2;
}

- (void)setRenderEngagementFeaturesForItemAsShorts:(id)a3 counts:(signed __int16)a4[6] isRender:(BOOL)a5 bundleDict:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t v11;
  _WORD *v12;
  int v13;
  double v14;
  unint64_t v15;
  int v16;
  _WORD *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  double v24;
  unint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  float v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  _OWORD v36[3];
  _OWORD v37[3];
  _OWORD v38[3];
  uint64_t v39;

  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = 0;
  memset(v38, 0, sizeof(v38));
  memset(v37, 0, sizeof(v37));
  memset(&v36[1], 0, 32);
  if (v7)
    v12 = &renderFeatures;
  else
    v12 = &engagementFeatures;
  v36[0] = 0uLL;
  do
  {
    v13 = a4[v11];
    v14 = log10((double)v13);
    v15 = vcvtpd_s64_f64(v14);
    *(float *)&v14 = (float)v13;
    +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", (int)((v15 >> 1) + (v15 & 1)), v14);
    *((_DWORD *)v37 + v11) = v16;
    *((_WORD *)v36 + v11) = v12[v11];
    ++v11;
  }
  while (v11 != 6);
  if (objc_msgSend(v10, "count"))
  {
    if (v7)
      v17 = &bundleRenderFeatures;
    else
      v17 = &bundleEngagementFeatures;
    objc_msgSend(v9, "sectionBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v35 = 0;
      v34 = 0;
      v21 = 6;
      if (objc_msgSend(v19, "getRankingValues:withRankingValueSize:forType:", &v34, 6, v7))
      {
        v30 = v18;
        v31 = v9;
        for (i = 0; i != 6; ++i)
        {
          v23 = *((__int16 *)&v34 + i);
          v24 = log10((double)v23);
          v25 = vcvtpd_s64_f64(v24);
          *(float *)&v24 = (float)v23;
          +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", (int)((v25 >> 1) + (v25 & 1)), v24);
          *((_DWORD *)&v37[1] + i + 2) = v26;
          *(_WORD *)(((unint64_t)v36 | 0xC) + 2 * i) = v17[i];
        }
        if (v7)
        {
          v21 = 12;
          v9 = v31;
        }
        else
        {
          v33 = 0;
          v32 = 0;
          v9 = v31;
          if (objc_msgSend(v20, "getRankingValues:withRankingValueSize:forType:", &v32, 6, 1))
          {
            v28 = 0;
            v21 = 18;
            do
            {
              if (*((_WORD *)&v32 + v28))
                v29 = (float)*((__int16 *)&v34 + v28) / (float)*((__int16 *)&v32 + v28);
              else
                v29 = 0.0;
              *((float *)v38 + v28) = v29;
              *((_WORD *)&v36[1] + v28 + 4) = bundleEngagementRatioFeatures[v28];
              ++v28;
            }
            while (v28 != 6);
          }
          else
          {
            v21 = 12;
          }
        }
      }
    }
    else
    {
      v21 = 6;
    }

  }
  else
  {
    v21 = 6;
  }
  objc_msgSend(v9, "L2FeatureVector", v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setScores:forFeatures:count:", v37, v36, v21);

}

- (void)setRenderEngagementFeaturesForItem:(id)a3 counts:(id)a4 isRender:(BOOL)a5 bundleDict:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  _BOOL8 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  int v30;
  uint64_t v31;

  v23 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v30 = 0;
  v29 = 0;
  if (objc_msgSend(v10, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v21 = v11;
      v22 = v9;
      v15 = 0;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v15 > 5)
              goto LABEL_14;
            *((_WORD *)&v29 + v15++) = objc_msgSend(v18, "shortValue");
          }
          else if (self->_isInternalDevice)
          {
            getpid();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("render/engagment count is not a number but:%@ isRender:%d"), v18, v23);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            SimulateCrash();

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
LABEL_14:

      v20 = v15 == 6;
      v9 = v22;
      v11 = v21;
      if (v20)
        -[PRSRankingItemRanker setRenderEngagementFeaturesForItemAsShorts:counts:isRender:bundleDict:](self, "setRenderEngagementFeaturesForItemAsShorts:counts:isRender:bundleDict:", v22, &v29, v23, v21);
    }
    else
    {

    }
  }

}

- (void)prepareForPurePommesL2RankingWithItems:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") && !self->_isCancelled)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "populateOnlyPommesFeaturesForBundleID:queryTokenCount:queryID:", v7, self->_queryTokenCount, self->_queryID, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)prepareItems:(id)a3 inBundle:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  float v28;
  float v29;
  float v30;
  uint64_t j;
  void *v32;
  void *v33;
  unint64_t v34;
  int v35;
  __CFString *v36;
  void *v37;
  double v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  const __CFArray *v49;
  const __CFArray *v50;
  CFIndex Count;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  double v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  const __CFString *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  float v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  float v102[4];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t buf[32];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (objc_msgSend(v6, "count") && !self->_isCancelled)
  {
    v82 = v7;
    PRSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = objc_msgSend(v6, "count");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v82;
      _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> preparing %lu items for bundle %@", buf, 0x16u);
    }

    +[SSRankingManager getCoreDuetValues](SSRankingManager, "getCoreDuetValues");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = malloc_type_calloc(0x2EuLL, 4uLL, 0x100004052888210uLL);
    -[PRSRankingItemRanker resetbundleFeaturesScratchBuf:](self, "resetbundleFeaturesScratchBuf:", v10);
    SSPhraseQueryUnquoteString(self->_searchString);
    v71 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:isCJK:fuzzyThreshold:options:", v71, self->_keyboardLanguage, self->_isCJK, 0, 0);
    objc_msgSend(v11, "setMatchOncePerTerm:", 0);
    objc_msgSend(v11, "setCountQPUSpecialToken:", self->_countQPUSpecialToken);
    v81 = v11;
    objc_msgSend(v11, "setItemQPQUOutputTokenInfo:", self->_itemQPQUOutputTokenInfo);
    -[PRSRankingItemRanker parsedQueryFromQU](self, "parsedQueryFromQU");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CA6AB8]);
      -[PRSRankingItemRanker parsedQueryFromQU](self, "parsedQueryFromQU");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithQuery:language:isCJK:fuzzyThreshold:options:", v15, self->_keyboardLanguage, self->_isCJK, 0, 0);

      objc_msgSend(v16, "setMatchOncePerTerm:", 0);
      objc_msgSend(v16, "setCountQPUSpecialToken:", self->_countQPUSpecialToken);
      v79 = v16;
      objc_msgSend(v16, "setItemQPQUOutputTokenInfo:", self->_itemQPQUOutputTokenInfo);
    }
    else
    {
      v79 = 0;
    }
    SSGeneralLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PRSRankingItemRanker prepareItems:inBundle:].cold.1((uint64_t)self, v81, v17);

    objc_msgSend(v81, "setQueryTokenCount:", self->_queryTokenCount);
    v122 = 0u;
    v121 = 0u;
    v120 = 0u;
    v119 = 0u;
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    memset(buf, 0, sizeof(buf));
    prs_feature_population_ctx_init((uint64_t)buf, LOBYTE(self->_queryTermCount));
    +[PRSRankingItemRanker importantAttributesForBundle:](PRSRankingItemRanker, "importantAttributesForBundle:", v82);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v74, "count");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v72 = v6;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v93 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PRSRankingItem inputToModelScore](*(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i)));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
      }
      while (v21);
    }
    v80 = (void *)v9;

    objc_msgSend(v18, "sortWithOptions:usingComparator:", 1, &__block_literal_global_677);
    v25 = objc_msgSend(v19, "count");
    v26 = objc_msgSend(v18, "count");
    v27 = objc_msgSend(v19, "count");
    v78 = objc_alloc_init(MEMORY[0x1E0D70C00]);
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v19;
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
    if (v77)
    {
      v28 = (float)v26;
      v29 = (float)v25;
      v30 = (float)v27;
      v76 = *(_QWORD *)v89;
      v70 = v25;
      while (2)
      {
        for (j = 0; j != v77; ++j)
        {
          if (*(_QWORD *)v89 != v76)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PRSRankingItem inputToModelScore]((uint64_t)v32));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v18, "indexOfObject:", v33);

          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v103 = 0u;
          v101 = 0;
          v99 = 0u;
          v100 = 0u;
          v98 = 0u;
          v102[0] = (float)(v34 + 1);
          v102[1] = (float)v34 / v28;
          v102[2] = v29;
          v102[3] = v30;
          v97 = 0x760018E018B018ALL;
          -[PRSRankingItemRanker lastIsSpaceFeature](self, "lastIsSpaceFeature");
          LODWORD(v103) = v35;
          LOWORD(v98) = 67;
          if (v80)
          {
            v36 = (__CFString *)v82;
            objc_msgSend(v80, "objectForKey:", v82);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v80, "objectForKey:", v82);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "floatValue");
              v41 = v40;

            }
            else
            {
              v41 = 0;
            }
            LODWORD(v38) = v41;
            +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", 2, v38);
            DWORD1(v103) = v43;
            WORD1(v98) = 1930;
            v42 = 6;
          }
          else
          {
            v42 = 5;
            v36 = (__CFString *)v82;
          }
          if (-[__CFString isEqualToString:](v36, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
          {
            v87 = 0.0;
            SSCompactRankingAttrsGetFloat(objc_msgSend(v32, "attributes"), 0x41uLL, &v87);
            v102[v42] = v87;
            v44 = v42 + 1;
            *((_WORD *)&v97 + v42) = 329;
            SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v32, "attributes"), 9uLL);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45;
            if (v45)
            {
              objc_msgSend(v45, "timeIntervalSinceReferenceDate");
              v102[v44] = (float)((uint64_t)v47 / -86400 + (uint64_t)(self->_currentTime / 86400.0));
              *((_WORD *)&v97 + v44) = 330;
              v44 = v42 + 2;
            }

            v42 = v44;
            v36 = (__CFString *)v82;
          }
          objc_msgSend(v32, "L2FeatureVector");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setScores:forFeatures:count:", v102, &v97, v42);
          if (self->_isCancelled)
          {
            prs_feature_population_ctx_destroy((uint64_t)buf);
            if (v10)
              free(v10);

            v54 = obj;
            v69 = (void *)v71;
            v6 = v72;
            v57 = v80;
            goto LABEL_69;
          }
          +[PRSRankingItemRanker itemSpecificImportantAttributesForBundle:withItem:](PRSRankingItemRanker, "itemSpecificImportantAttributesForBundle:withItem:", v36, v32);
          v49 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v49)
          {
            *(_QWORD *)&buf[16] = v49;
            Count = CFArrayGetCount(v49);
          }
          else
          {
            Count = v73;
            *(_QWORD *)&buf[16] = v74;
          }
          *(_QWORD *)&v122 = Count;
          -[PRSRankingItem populateFeaturesWithEvaluator:updatingBundleFeatures:withContext:keyboardLanguage:isCJK:currentTime:withRanker:attributeHolder:quParsedEvaluator:]((uint64_t)v32, (uint64_t)v81, (uint64_t)v10, (uint64_t)buf, (uint64_t)self->_keyboardLanguage, self->_isCJK, (uint64_t)self, (uint64_t)v78, v79);

        }
        v25 = v70;
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
        if (v77)
          continue;
        break;
      }
    }
    v52 = v25;

    v53 = 46;
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 46);
    do
    {
      objc_msgSend(v54, "addObject:", &unk_1E6E9A140);
      --v53;
    }
    while (v53);
    v56 = 0;
    v57 = v80;
    do
    {
      if ((unint64_t)(v56 - 34) >= 2)
      {
        if (v56 == 33)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v54;
          v60 = v58;
          v61 = 33;
        }
        else if (v56)
        {
          LODWORD(v55) = *((_DWORD *)v10 + v56);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v54;
          v60 = v58;
          v61 = v56;
        }
        else
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v54;
          v60 = v58;
          v61 = 0;
        }
        objc_msgSend(v59, "setObject:atIndexedSubscript:", v60, v61);

      }
      ++v56;
    }
    while (v56 != 46);
    v62 = v82;
    if (!v82)
      v62 = &stru_1E6E549F0;
    pthread_mutex_lock(&sBundleMapLock);
    -[PRSRankingItemRanker bundleFeatures](self, "bundleFeatures");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKey:", v54, v62);

    pthread_mutex_unlock(&sBundleMapLock);
    v82 = v62;
    +[PRSRankingItemRelativeFeatureContext relativeContextsForBundle:currentTime:](PRSRankingItemRelativeFeatureContext, "relativeContextsForBundle:currentTime:", v62, self->_currentTime);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v84;
      while (2)
      {
        for (k = 0; k != v66; ++k)
        {
          if (*(_QWORD *)v84 != v67)
            objc_enumerationMutation(v64);
          if (self->_isCancelled)
          {
            prs_feature_population_ctx_destroy((uint64_t)buf);
            if (v10)
              free(v10);

            goto LABEL_68;
          }
          -[PRSRankingItemRanker computeRelativeFeatureForContext:items:](self, "computeRelativeFeatureForContext:items:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k), obj);
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
        if (v66)
          continue;
        break;
      }
    }

    if (v10)
      free(v10);
    prs_feature_population_ctx_destroy((uint64_t)buf);
LABEL_68:
    v69 = (void *)v71;
    v6 = v72;

LABEL_69:
    v7 = (__CFString *)v82;
  }

}

uint64_t __46__PRSRankingItemRanker_prepareItems_inBundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedLongLongValue");
  v6 = objc_msgSend(v4, "unsignedLongLongValue");

  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

- (void)prepareItemsForL1Ranking:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") && !self->_isCancelled)
  {
    PRSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v20 = objc_msgSend(v6, "count");
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> preparing %lu items for L1 Ranking with bundle %@", buf, 0x16u);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "populateOnlyPommesL1RankingFeaturesWithQueryTokenCount:queryID:", self->_queryTokenCount, self->_queryID, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)prepareParsecResults:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[4];
  _OWORD v30[8];
  _BYTE v31[128];
  uint8_t buf[32];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") && !self->_isCancelled)
  {
    PRSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = objc_msgSend(v6, "count");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> preparing %lu results for parsec bundle %@", buf, 0x16u);
    }

    SSPhraseQueryUnquoteString(self->_searchString);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:fuzzyThreshold:options:", v23, self->_keyboardLanguage, 0, 0);
    objc_msgSend(v9, "setMatchOncePerTerm:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    memset(buf, 0, sizeof(buf));
    prs_feature_population_ctx_init((uint64_t)buf, LOBYTE(self->_queryTermCount));
    *(_QWORD *)&buf[16] = +[PRSRankingItemRanker importantAttributesForParsecBundle:](PRSRankingItemRanker, "importantAttributesForParsecBundle:", v7);
    *(_QWORD *)&v42 = CFArrayGetCount(*(CFArrayRef *)&buf[16]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "rankingItem");
          v16 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v16;
          if (self->_isCancelled)
          {
            prs_feature_population_ctx_destroy((uint64_t)buf);

            goto LABEL_20;
          }
          -[PRSRankingItem populateFeaturesWithEvaluator:withContext:keyboardLanguage:isCJK:currentTime:forParsecResult:](v16, (uint64_t)v9, (uint64_t)buf, (uint64_t)self->_keyboardLanguage, self->_isCJK, (uint64_t)v15, v17, v18);
          memset(v30, 0, sizeof(v30));
          memset(v29, 0, sizeof(v29));
          -[PRSRankingItemRanker lastIsSpaceFeature](self, "lastIsSpaceFeature");
          LODWORD(v30[0]) = v20;
          LOWORD(v29[0]) = 2295;
          v21 = hasParsecPolicyPhraseMatch(v19, self->_queryTermCount, self->_exact);
          if (self->_queryTermCount >= 2 && v21)
          {
            DWORD1(v30[0]) = 1065353216;
            WORD1(v29[0]) = 2088;
            if (!-[PRSRankingItemRanker hasParsecPolicyPhraseMatch](self, "hasParsecPolicyPhraseMatch"))
              -[PRSRankingItemRanker setHasParsecPolicyPhraseMatch:](self, "setHasParsecPolicyPhraseMatch:", 1);
          }
          else
          {
            DWORD1(v30[0]) = 0;
            WORD1(v29[0]) = 2088;
          }
          objc_msgSend(v19, "L2FeatureVector");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setScores:forFeatures:count:", v30, v29, 2);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v12)
          continue;
        break;
      }
    }

    prs_feature_population_ctx_destroy((uint64_t)buf);
LABEL_20:

    v6 = v24;
  }

}

- (id)filterRankedItems:(id)a3 bundle:(id)a4 userQuery:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  void *v59;
  float v60;
  float v61;
  double v62;
  double v63;
  BOOL v64;
  void *v65;
  double v66;
  void *v67;
  id v68;
  void *v69;
  id v71;
  id obj;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (filterRankedItems_bundle_userQuery__lastTopItem
    && (objc_msgSend((id)filterRankedItems_bundle_userQuery__lastUserQuery, "isEqualToString:", v10) & 1) == 0)
  {
    v11 = (void *)filterRankedItems_bundle_userQuery__lastUserQuery;
    filterRankedItems_bundle_userQuery__lastUserQuery = 0;

    v12 = (void *)filterRankedItems_bundle_userQuery__lastTopItem;
    filterRankedItems_bundle_userQuery__lastTopItem = 0;

    filterRankedItems_bundle_userQuery__lastTopItemIsLowerC = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsLowerC0 = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsUpper6 = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsUpper6_r = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsUpper7_r = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsLower = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsLowest = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsNotMatched = -1082130432;
    v13 = (void *)filterRankedItems_bundle_userQuery__lastTopItemDate;
    filterRankedItems_bundle_userQuery__lastTopItemDate = 0;

    filterRankedItems_bundle_userQuery__lastTopItemInterval = 0;
  }
  v14 = objc_msgSend(v8, "count");
  if (v14)
  {
    v15 = v14;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
    {
      obj = a5;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
      if (filterRankedItems_bundle_userQuery__lastTopItem)
      {
        v17 = (id)filterRankedItems_bundle_userQuery__lastTopItem;
        v80 = filterRankedItems_bundle_userQuery__lastTopItemIsLowerC0;
        v81 = filterRankedItems_bundle_userQuery__lastTopItemIsLowerC;
        v78 = filterRankedItems_bundle_userQuery__lastTopItemIsUpper6_r;
        v79 = filterRankedItems_bundle_userQuery__lastTopItemIsUpper6;
        v76 = filterRankedItems_bundle_userQuery__lastTopItemIsLower;
        v77 = filterRankedItems_bundle_userQuery__lastTopItemIsUpper7_r;
        v74 = filterRankedItems_bundle_userQuery__lastTopItemIsNotMatched;
        v75 = filterRankedItems_bundle_userQuery__lastTopItemIsLowest;
        v71 = (id)filterRankedItems_bundle_userQuery__lastTopItemDate;
        v18 = 0;
        v73 = filterRankedItems_bundle_userQuery__lastTopItemInterval;
      }
      else
      {
        objc_msgSend(v8, "firstObject");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "L2FeatureVector");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "scoreForFeature:", 2425);
        v81 = v21;

        objc_msgSend(v17, "L2FeatureVector");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scoreForFeature:", 2424);
        v80 = v23;

        objc_msgSend(v17, "L2FeatureVector");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "scoreForFeature:", 2417);
        v79 = v25;

        objc_msgSend(v17, "L2FeatureVector");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "scoreForFeature:", 2418);
        v78 = v27;

        objc_msgSend(v17, "L2FeatureVector");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "scoreForFeature:", 2422);
        v77 = v29;

        objc_msgSend(v17, "L2FeatureVector");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "scoreForFeature:", 2426);
        v76 = v31;

        objc_msgSend(v17, "L2FeatureVector");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "scoreForFeature:", 2427);
        v75 = v33;

        objc_msgSend(v17, "L2FeatureVector");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "scoreForFeature:", 2428);
        v74 = v35;

        objc_msgSend(v17, "interestingDate");
        v71 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "timeIntervalSinceReferenceDate");
        v73 = v36;
        objc_msgSend(v16, "addObject:", v17);
        v18 = 1;
      }
      if (v18 < v15)
      {
        do
        {
          objc_msgSend(v8, "objectAtIndex:", v18);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "L2FeatureVector");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "scoreForFeature:", 2425);
          v40 = v39;

          objc_msgSend(v37, "L2FeatureVector");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "scoreForFeature:", 2424);
          v43 = v42;

          objc_msgSend(v37, "L2FeatureVector");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "scoreForFeature:", 2417);
          v46 = v45;

          objc_msgSend(v37, "L2FeatureVector");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "scoreForFeature:", 2418);
          v49 = v48;

          objc_msgSend(v37, "L2FeatureVector");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "scoreForFeature:", 2422);
          v52 = v51;

          objc_msgSend(v37, "L2FeatureVector");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "scoreForFeature:", 2426);
          v55 = v54;

          objc_msgSend(v37, "L2FeatureVector");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "scoreForFeature:", 2427);
          v58 = v57;

          objc_msgSend(v37, "L2FeatureVector");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "scoreForFeature:", 2428);
          v61 = v60;

          LODWORD(v63) = -1.0;
          if (self->_isFuzzySearch)
            goto LABEL_13;
          v64 = v40 == 1.0;
          if (v43 == 1.0)
            v64 = 1;
          if (v46 == 1.0)
            v64 = 1;
          if (v49 == 1.0)
            v64 = 1;
          if (v52 == 1.0)
            v64 = 1;
          if (v55 == 1.0)
            v64 = 1;
          if (v58 == 1.0)
            v64 = 1;
          if ((v64 || v61 == 1.0)
            && *(float *)&v81 == -1.0
            && *(float *)&v80 == -1.0
            && *(float *)&v79 == -1.0
            && *(float *)&v78 == -1.0
            && *(float *)&v77 == -1.0
            && *(float *)&v76 == -1.0
            && *(float *)&v75 == -1.0
            && (LODWORD(v62) = v74, *(float *)&v74 == 0.0))
          {
            objc_msgSend(v37, "interestingDate", v62, v63);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "timeIntervalSinceReferenceDate");
            if (v66 < *(double *)&v73 && (v61 != 1.0 || !filterRankedItems_bundle_userQuery__lastTopItem))
              objc_msgSend(v16, "addObject:", v37);

          }
          else
          {
LABEL_13:
            objc_msgSend(v16, "addObject:", v37);
          }

          ++v18;
        }
        while (v15 != v18);
      }
      objc_storeStrong((id *)&filterRankedItems_bundle_userQuery__lastUserQuery, obj);
      v67 = (void *)filterRankedItems_bundle_userQuery__lastTopItem;
      filterRankedItems_bundle_userQuery__lastTopItem = (uint64_t)v17;
      v68 = v17;

      filterRankedItems_bundle_userQuery__lastTopItemIsLowerC = v81;
      filterRankedItems_bundle_userQuery__lastTopItemIsLowerC0 = v80;
      filterRankedItems_bundle_userQuery__lastTopItemIsUpper6 = v79;
      filterRankedItems_bundle_userQuery__lastTopItemIsUpper6_r = v78;
      filterRankedItems_bundle_userQuery__lastTopItemIsUpper7_r = v77;
      filterRankedItems_bundle_userQuery__lastTopItemIsLower = v76;
      filterRankedItems_bundle_userQuery__lastTopItemIsLowest = v75;
      filterRankedItems_bundle_userQuery__lastTopItemIsNotMatched = v74;
      v69 = (void *)filterRankedItems_bundle_userQuery__lastTopItemDate;
      filterRankedItems_bundle_userQuery__lastTopItemDate = (uint64_t)v71;

      filterRankedItems_bundle_userQuery__lastTopItemInterval = v73;
      v19 = v16;

    }
    else
    {
      v19 = v8;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)requery:(id *)a3
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  CFIndex queryTermCount;
  char *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NeighborItem *v23;
  id *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  char *v28;
  unsigned __int16 v29;
  id *Minimum;
  void *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  id v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  _QWORD v46[2];
  id *v47;
  char *v48;
  id v49;
  void *v50;
  char *v51;
  CFBinaryHeapRef v52;
  _QWORD v53[6];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v47 = a3;
  v46[1] = v46;
  v64 = *MEMORY[0x1E0C80C00];
  v4 = 3 * self->_queryTermCount;
  v48 = (char *)&v46[-12 * self->_queryTermCount];
  v5 = 32 * v4;
  if (32 * v4)
  {
    v6 = v48;
    do
    {
      *v6 = 0;
      v6[2] = 0;
      v6[5] = 0;
      v6 += 6;
    }
    while (v6 != v46);
  }
  queryTermCount = self->_queryTermCount;
  bzero(v48, 96 * queryTermCount);
  v52 = CFBinaryHeapCreate(0, queryTermCount, &nextResultHeapCallBacks, 0);
  +[PRSRankingItemRanker embeddingForLanguage:](PRSRankingItemRanker, "embeddingForLanguage:", self->_keyboardLanguage);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_queryTermCount)
    goto LABEL_42;
  v8 = 0;
  v51 = 0;
  v9 = (id *)(v48 + 40);
  do
  {
    -[NSArray objectAtIndex:](self->_queryTerms, "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__11;
    v62 = __Block_byref_object_dispose__11;
    v63 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __32__PRSRankingItemRanker_requery___block_invoke;
    v53[3] = &unk_1E6E53CC8;
    v53[4] = &v58;
    v53[5] = &v54;
    objc_msgSend(v49, "enumerateNeighborsForString:maximumCount:maximumDistance:distanceType:usingBlock:", v11, 5, 0, v53, 0.75);
    v12 = v55[3];
    if (v12)
    {
      objc_storeStrong(v9 - 5, (id)v59[5]);
      *(v9 - 4) = (id)v55[3];
      objc_msgSend((id)v59[5], "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(v9 - 3);
      *(v9 - 3) = (id)v13;

      *((_WORD *)v9 - 8) = 0;
      *(v9 - 1) = v8;
      objc_storeStrong(v9, v11);
      CFBinaryHeapAddValue(v52, v9 - 5);
      v51 += v12;
    }
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);

    ++v8;
    v15 = self->_queryTermCount;
    v9 += 6;
  }
  while ((unint64_t)v8 < v15);
  if ((unint64_t)v51 > 4)
    goto LABEL_21;
  if (v15)
  {
    v16 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_queryTerms, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      SSAllLengthyOriginals(v50, self->_keyboardLanguage);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      if (v19)
      {
        v20 = 0;
        v21 = 0;
        do
        {
          if (!v21)
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
          objc_msgSend(v18, "objectAtIndex:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[NeighborItem initWithNeighbor:type:distance:position:]([NeighborItem alloc], "initWithNeighbor:type:distance:position:", v22, 1, v20, 99.0);
          objc_msgSend(v21, "addObject:", v23);

          ++v20;
        }
        while (v19 != v20);
        v24 = (id *)&v48[48 * v16];
        objc_storeStrong(v24, v21);
        *(_QWORD *)&v48[48 * v16 + 8] = v19;
        objc_msgSend(v21, "firstObject");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = &v48[48 * v16];
        v27 = (void *)*((_QWORD *)v26 + 2);
        *((_QWORD *)v26 + 2) = v25;

        v28 = &v48[48 * v16];
        *((_WORD *)v28 + 12) = 0;
        *((_QWORD *)v28 + 4) = v16;
        objc_storeStrong((id *)v28 + 5, v50);
        CFBinaryHeapAddValue(v52, v24);
        v51 += v19;
      }
      else
      {
        v21 = 0;
      }

      ++v16;
    }
    while (v16 < self->_queryTermCount);
  }
  if (v51)
  {
LABEL_21:
    v51 = 0;
    v29 = 0;
    do
    {
      Minimum = (id *)CFBinaryHeapGetMinimum(v52);
      if (!Minimum)
        break;
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_queryTermCount);
      if (self->_queryTermCount)
      {
        v32 = 0;
        v33 = 0;
        v34 = -1;
        do
        {
          if ((v33 & 1) != 0 || (id)v32 != Minimum[4])
          {
            -[NSArray objectAtIndex:](self->_queryTerms, "objectAtIndex:", v32);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v39);
          }
          else
          {
            v35 = Minimum[2];
            objc_msgSend(v35, "neighbor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v36);

            CFBinaryHeapRemoveMinimumValue(v52);
            v37 = *((unsigned __int16 *)Minimum + 12) + 1;
            if (v37 < (unint64_t)Minimum[1])
            {
              objc_msgSend(*Minimum, "objectAtIndex:", *((unsigned __int16 *)Minimum + 12) + 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong(Minimum + 2, v38);
              *((_WORD *)Minimum + 12) = v37;
              CFBinaryHeapAddValue(v52, Minimum);

            }
            v39 = 0;
            ++v29;
            v33 = 1;
            v34 = v32;
          }

          ++v32;
        }
        while (v32 < self->_queryTermCount);
      }
      else
      {
        v34 = -1;
      }
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(" "));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v34 != self->_queryTermCount - 1 && self->_lastIsSpaceFeature != 0.0)
      {
        objc_msgSend(v40, "stringByAppendingString:", CFSTR(" "));
        v42 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)v42;
      }
      if (v29 == 1)
      {
        v43 = v41;

        v51 = v43;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(** =\"%@*\"cwdt)"), v41);
        v43 = (char *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*v47, "addObject:", v43);
      }

    }
    while (v29 < 5u);
    CFRelease(v52);
  }
  else
  {
LABEL_42:
    CFRelease(v52);
    v51 = 0;
  }

  if (v5)
  {
    v44 = v48 - 48;
    do
    {
      __destructor_8_s0_s16_s40((id *)&v44[v5]);
      v5 -= 48;
    }
    while (v5);
  }
  return v51;
}

void __32__PRSRankingItemRanker_requery___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NeighborItem *v8;
  id v9;

  v9 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = -[NeighborItem initWithNeighbor:type:distance:position:]([NeighborItem alloc], "initWithNeighbor:type:distance:position:", v9, 0, 99, a3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (BOOL)pommes
{
  return self->_pommes;
}

- (void)setPommes:(BOOL)a3
{
  self->_pommes = a3;
}

- (void)setKeyboardLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLanguage, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSString)userQueryString
{
  return self->_userQueryString;
}

- (void)setUserQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_userQueryString, a3);
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(int64_t)a3
{
  self->_queryID = a3;
}

- (int64_t)countQPUSpecialToken
{
  return self->_countQPUSpecialToken;
}

- (void)setCountQPUSpecialToken:(int64_t)a3
{
  self->_countQPUSpecialToken = a3;
}

- (unint64_t)queryTokenCount
{
  return self->_queryTokenCount;
}

- (void)setQueryTokenCount:(unint64_t)a3
{
  self->_queryTokenCount = a3;
}

- (NSString)parsedQueryFromQU
{
  return self->_parsedQueryFromQU;
}

- (void)setParsedQueryFromQU:(id)a3
{
  objc_storeStrong((id *)&self->_parsedQueryFromQU, a3);
}

- (NSArray)itemQPQUOutputTokenInfo
{
  return self->_itemQPQUOutputTokenInfo;
}

- (void)setItemQPQUOutputTokenInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)quIntentScores
{
  return self->_quIntentScores;
}

- (void)setQuIntentScores:(id)a3
{
  objc_storeStrong((id *)&self->_quIntentScores, a3);
}

- (NSArray)quIntentLabels
{
  return self->_quIntentLabels;
}

- (void)setQuIntentLabels:(id)a3
{
  objc_storeStrong((id *)&self->_quIntentLabels, a3);
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (NSMapTable)bundleFeatures
{
  return self->_bundleFeatures;
}

- (void)setBundleFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_bundleFeatures, a3);
}

- (double)experimentalWeight1
{
  return self->_experimentalWeight1;
}

- (void)setExperimentalWeight1:(double)a3
{
  self->_experimentalWeight1 = a3;
}

- (double)experimentalWeight2
{
  return self->_experimentalWeight2;
}

- (void)setExperimentalWeight2:(double)a3
{
  self->_experimentalWeight2 = a3;
}

- (NSString)meContactIdentifier
{
  return self->_meContactIdentifier;
}

- (void)setMeContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_meContactIdentifier, a3);
}

- (NSString)clientBundle
{
  return self->_clientBundle;
}

- (void)setClientBundle:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundle, a3);
}

- (BOOL)policyDisabled
{
  return self->_policyDisabled;
}

- (void)setPolicyDisabled:(BOOL)a3
{
  self->_policyDisabled = a3;
}

- (float)lastIsSpaceFeature
{
  return self->_lastIsSpaceFeature;
}

- (void)setLastIsSpaceFeature:(float)a3
{
  self->_lastIsSpaceFeature = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (void)setIsCJK:(BOOL)a3
{
  self->_isCJK = a3;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (BOOL)hasPolicyMultipleTermsPhraseMatch
{
  return self->_hasPolicyMultipleTermsPhraseMatch;
}

- (void)setHasPolicyMultipleTermsPhraseMatch:(BOOL)a3
{
  self->_hasPolicyMultipleTermsPhraseMatch = a3;
}

- (BOOL)hasPolicySingleTermPhraseMatch
{
  return self->_hasPolicySingleTermPhraseMatch;
}

- (void)setHasPolicySingleTermPhraseMatch:(BOOL)a3
{
  self->_hasPolicySingleTermPhraseMatch = a3;
}

- (BOOL)hasParsecPolicyPhraseMatch
{
  return self->_hasParsecPolicyPhraseMatch;
}

- (void)setHasParsecPolicyPhraseMatch:(BOOL)a3
{
  self->_hasParsecPolicyPhraseMatch = a3;
}

- (BOOL)exact
{
  return self->_exact;
}

- (void)setExact:(BOOL)a3
{
  self->_exact = a3;
}

- (void)setIsContentWord:(BOOL)a3
{
  self->_isContentWord = a3;
}

- (void)setQueryTermCount:(unint64_t)a3
{
  self->_queryTermCount = a3;
}

- (void)setQueryTermLength:(unint64_t)a3
{
  self->_queryTermLength = a3;
}

- (void)setIsAltNamePrefixMatchOnlyTopHitExcludedQuery:(BOOL)a3
{
  self->_isAltNamePrefixMatchOnlyTopHitExcludedQuery = a3;
}

- (void)setIsSpellCorrectPrefixMatchOnlyTopHitExcludedQuery:(BOOL)a3
{
  self->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery = a3;
}

- (void)setContainsEnglishAlphabetInQuery:(BOOL)a3
{
  self->_containsEnglishAlphabetInQuery = a3;
}

- (void)setContainsDigitInQuery:(BOOL)a3
{
  self->_containsDigitInQuery = a3;
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (unint64_t)topHitMaxCount
{
  return self->_topHitMaxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundle, 0);
  objc_storeStrong((id *)&self->_meContactIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleFeatures, 0);
  objc_storeStrong((id *)&self->_quIntentLabels, 0);
  objc_storeStrong((id *)&self->_quIntentScores, 0);
  objc_storeStrong((id *)&self->_itemQPQUOutputTokenInfo, 0);
  objc_storeStrong((id *)&self->_parsedQueryFromQU, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_queryTerms, 0);
  objc_storeStrong((id *)&self->_rankCategories, 0);
  objc_storeStrong((id *)&self->_rankingConfiguration, 0);
}

- (void)initWithSearchString:(uint64_t)a1 userQueryString:(uint64_t)a2 queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:.cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)OUTLINED_FUNCTION_3_1(a1, a2);
  SSRedactString(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_8(&dword_1B86C5000, v5, v6, "qid=%ld - Unable to get tokenIDs for query (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_3();
}

- (void)initWithSearchString:(uint64_t)a1 userQueryString:(uint64_t)a2 queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:.cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)OUTLINED_FUNCTION_3_1(a1, a2);
  SSRedactString(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_8(&dword_1B86C5000, v5, v6, "qid=%ld - query token count equals to 0 for query(%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_3();
}

- (void)rankingConfigurationWithMeContact:(void *)a1 emailAddresses:(NSObject *)a2 phoneFavorites:vipList:clientBundle:isScopedSearch:isAdvancedSyntax:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:.cold.1(void *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = 134219520;
  v5 = objc_msgSend(a1, "dominantRankingQueryCount");
  v6 = 2048;
  v7 = objc_msgSend(a1, "dominatedRankingQueryCount");
  v8 = 2048;
  v9 = objc_msgSend(a1, "shortcutBit");
  v10 = 2048;
  v11 = objc_msgSend(a1, "highMatchBit");
  v12 = 2048;
  v13 = objc_msgSend(a1, "lowMatchBit");
  v14 = 2048;
  v15 = objc_msgSend(a1, "highRecencyBit");
  v16 = 2048;
  v17 = objc_msgSend(a1, "lowRecencyBit");
  _os_log_debug_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] <Model> 1: dominantRankingQueryCount:%ld dominatedRankingQueryCount:%ld shortcutBit:%ld, highMatchBit:%ld, lowMatchBit:%ld, highRecencyBit:%ld, lowRecencyBit:%ld", (uint8_t *)&v4, 0x48u);
}

- (void)relevantResultSetPRSL2FeaturesFromBundleFeature:absRankFeatureOut:relRankFeatureOut:.cold.1()
{
  __assert_rtn("-[PRSRankingItemRanker relevantResultSetPRSL2FeaturesFromBundleFeature:absRankFeatureOut:relRankFeatureOut:]", "PRSRankingItemRanker.m", 4962, "false");
}

- (void)resetbundleFeaturesScratchBuf:.cold.1()
{
  __assert_rtn("-[PRSRankingItemRanker resetbundleFeaturesScratchBuf:]", "PRSRankingItemRanker.m", 8483, "false");
}

- (void)prepareItems:(NSObject *)a3 inBundle:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 72);
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "countQPUSpecialToken");
  _os_log_debug_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_DEBUG, "[Spotlightranking] <Adjusted pommesL1> Query: %@, Number of QPU Token> %ld", (uint8_t *)&v5, 0x16u);
}

@end
