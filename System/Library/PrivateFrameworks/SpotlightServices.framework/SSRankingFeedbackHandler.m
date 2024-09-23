@implementation SSRankingFeedbackHandler

+ (id)copyRenderEngagementCounts
{
  void *v2;

  pthread_rwlock_rdlock(&sRWRenderEngagementValueLock);
  v2 = (void *)objc_msgSend((id)sRenderEngagementCountValues, "copy");
  pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  return (id)sharedInstance_handler;
}

uint64_t __42__SSRankingFeedbackHandler_sharedInstance__block_invoke()
{
  SSRankingFeedbackHandler *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v0 = objc_alloc_init(SSRankingFeedbackHandler);
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = (uint64_t)v0;

  sClientRankAndBlend = _os_feature_enabled_impl();
  v2 = objc_opt_new();
  v3 = (void *)sRenderEngagementCountValues;
  sRenderEngagementCountValues = v2;

  if (sClientRankAndBlend)
  {
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sCSIndex;
    sCSIndex = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA9B70], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sIndexer;
    sIndexer = v6;
  }

  return pthread_rwlock_init(&sRWRenderEngagementValueLock, 0);
}

- (SSRankingFeedbackHandler)init
{
  SSRankingFeedbackHandler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSRankingFeedbackHandler;
  v2 = -[SSRankingFeedbackHandler init](&v10, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(33, 2uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("queue to fetch bundle render/engagement counts", 0, v3);
    -[SSRankingFeedbackHandler setFetchQueue:](v2, "setFetchQueue:", v4);

    dispatch_get_global_queue(9, 2uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create_with_target_V2("queue to update render/engagement counts", 0, v5);
    -[SSRankingFeedbackHandler setCountQueue:](v2, "setCountQueue:", v6);

    v7 = (void *)objc_opt_new();
    -[SSRankingFeedbackHandler setMapProtectionClassToBundleIdToItem:](v2, "setMapProtectionClassToBundleIdToItem:", v7);

    v8 = (void *)objc_opt_new();
    -[SSRankingFeedbackHandler setSectionCSItems:](v2, "setSectionCSItems:", v8);

  }
  return v2;
}

- (void)_indexItemWithIdentifier:(id)a3 bundleID:(id)a4 startDate:(id)a5 pc:(id)a6
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0CA6B48];
  v13 = a3;
  v14 = objc_alloc_init(v12);
  objc_msgSend(v14, "setUniqueIdentifier:", v13);

  objc_msgSend(v14, "setIsUpdate:", 1);
  v15 = (void *)objc_opt_new();
  v16 = v15;
  if (v10)
  {
    objc_msgSend(v15, "setAttribute:forKey:", v10, CFSTR("_kMDItemEngagementDate"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttribute:forKey:", v17, CFSTR("_kMDItemEngagementDate"));

  }
  objc_msgSend(v14, "setAttributeSet:", v16);
  objc_msgSend(v14, "setBundleID:", v9);
  if (sClientRankAndBlend)
  {
    v18 = (void *)sCSIndex;
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = &__block_literal_global_25;
  }
  else
  {
    v18 = (void *)sIndexer;
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = &__block_literal_global_26;
  }
  objc_msgSend(v18, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v19, 0, 0, v11, v9, 0, v20);

}

- (void)_updateSpotlightRecentEngagementWithIdentifier:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 queryString:(id)a6 renderPosition:(id)a7
{
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = (objc_class *)MEMORY[0x1E0CA6B50];
  v15 = a7;
  v16 = a6;
  v17 = a3;
  v18 = [v14 alloc];
  v30[0] = CFSTR("_kMDItemLastSpotlightEngagementQuery");
  v30[1] = CFSTR("_kMDItemLastSpotlightEngagementRenderPosition");
  v31[0] = v16;
  v31[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithAttributes:", v19);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v17, 0, v20);
  objc_msgSend(v21, "setIsUpdate:", 1);
  objc_msgSend(v21, "setBundleID:", v12);
  -[SSRankingFeedbackHandler countQueue](self, "countQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __127__SSRankingFeedbackHandler__updateSpotlightRecentEngagementWithIdentifier_bundleID_protectionClass_queryString_renderPosition___block_invoke;
  v26[3] = &unk_1E6E43000;
  v27 = v21;
  v28 = v13;
  v29 = v12;
  v23 = v12;
  v24 = v13;
  v25 = v21;
  dispatch_async(v22, v26);

}

void __127__SSRankingFeedbackHandler__updateSpotlightRecentEngagementWithIdentifier_bundleID_protectionClass_queryString_renderPosition___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (sClientRankAndBlend)
  {
    v2 = (void *)sCSIndex;
    v8[0] = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v5 = a1[6];
    v6 = &__block_literal_global_32;
  }
  else
  {
    v2 = (void *)sIndexer;
    v7 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v5 = a1[6];
    v6 = &__block_literal_global_33;
  }
  objc_msgSend(v2, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v3, 0, 0, v4, v5, 0, v6);

}

- (void)didEngageResultWithRankingItem:(id)a3 startDate:(id)a4 protectionClass:(id)a5 query:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  SSRankingFeedbackHandler *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SSRankingFeedbackHandler countQueue](self, "countQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__SSRankingFeedbackHandler_didEngageResultWithRankingItem_startDate_protectionClass_query___block_invoke;
  block[3] = &unk_1E6E43050;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(v14, block);

}

void __91__SSRankingFeedbackHandler_didEngageResultWithRankingItem_startDate_protectionClass_query___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "rankingFeedbackBundleID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_indexItemWithIdentifier:bundleID:startDate:pc:", v3, v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "_indexItemWithIdentifier:bundleID:startDate:pc:", v10, CFSTR("com.apple.searchd"), *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CB2AC0]);
  if (sRenderEngagementCountValues)
  {
    pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
    v4 = (void *)sRenderEngagementCountValues;
    objc_msgSend(*(id *)(a1 + 32), "sectionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "copy");

    }
    else
    {
      v7 = (void *)objc_opt_new();
    }
    objc_msgSend(v7, "incrementRankingValuesForType:", 0);
    objc_msgSend((id)sRenderEngagementCountValues, "setValue:forKey:", v7, v10);
    pthread_rwlock_unlock(&sRWRenderEngagementValueLock);

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateSpotlightRecentEngagementWithIdentifier:bundleID:protectionClass:queryString:renderPosition:", v9, v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &unk_1E6E97770);

}

- (void)resultsWithRankingItemsDidBecomeVisible:(id)a3 date:(id)a4 protectionClassMapping:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  SSRankingFeedbackHandler *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SSRankingFeedbackHandler countQueue](self, "countQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke;
  block[3] = &unk_1E6E43028;
  v16 = v8;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t j;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id *v62;
  id *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *context;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id obj;
  id obja;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  _QWORD v94[2];
  id v95;
  _QWORD v96[4];
  _QWORD v97[2];
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint64_t v120;
  uint64_t v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCB3708]();
  v78 = (void *)objc_opt_new();
  v79 = a1;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v116;
    v85 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v116 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        objc_msgSend(v6, "identifier", context);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rankingFeedbackBundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(v79 + 40);
        objc_msgSend(v6, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          v12 = v11 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          v13 = v79;
          if ((objc_msgSend(v78, "containsObject:", v8) & 1) == 0)
          {
            objc_msgSend(*(id *)(v79 + 48), "sectionCSItems");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            if (v15 <= 0x95)
            {
              v16 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
              objc_msgSend(v16, "setUniqueIdentifier:", v8);
              objc_msgSend(v16, "setIsUpdate:", 1);
              v17 = (void *)objc_opt_new();
              v18 = v17;
              v19 = *(_QWORD *)(v79 + 56);
              if (v19)
              {
                objc_msgSend(v17, "setAttribute:forKey:", v19, CFSTR("_kMDItemRenderDate"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setAttribute:forKey:", v20, CFSTR("_kMDItemRenderDate"));

              }
              objc_msgSend(v16, "setAttributeSet:", v18);
              objc_msgSend(v16, "setBundleID:", CFSTR("com.apple.searchd"));
              v13 = v79;
              objc_msgSend(*(id *)(v79 + 48), "sectionCSItems");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v16);

              v4 = v85;
            }
          }
          objc_msgSend(v78, "addObject:", v8);
          v22 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
          objc_msgSend(v6, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setUniqueIdentifier:", v23);

          objc_msgSend(v22, "setIsUpdate:", 1);
          v24 = (void *)objc_opt_new();
          v25 = v24;
          v26 = *(_QWORD *)(v13 + 56);
          if (v26)
          {
            objc_msgSend(v24, "setAttribute:forKey:", v26, CFSTR("_kMDItemRenderDate"));
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setAttribute:forKey:", v27, CFSTR("_kMDItemRenderDate"));

          }
          objc_msgSend(v22, "setAttributeSet:", v25);
          objc_msgSend(v22, "setBundleID:", v8);
          if (objc_msgSend(v11, "length"))
          {
            objc_msgSend(*(id *)(v79 + 48), "mapProtectionClassToBundleIdToItem");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKey:", v11);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
              v29 = (void *)objc_opt_new();
            objc_msgSend(v29, "objectForKey:", v8);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v30)
              v30 = (void *)objc_opt_new();
            if ((unint64_t)objc_msgSend(v30, "count") <= 0x95)
              objc_msgSend(v30, "addObject:", v22);
            objc_msgSend(v29, "setObject:forKey:", v30, v8);
            objc_msgSend(*(id *)(v79 + 48), "mapProtectionClassToBundleIdToItem");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKey:", v29, v11);

            v4 = v85;
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
    }
    while (v3);
  }

  if (_os_feature_enabled_impl())
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v32 = v79;
    objc_msgSend(*(id *)(v79 + 48), "mapProtectionClassToBundleIdToItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allKeys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = v34;
    v76 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
    if (v76)
    {
      v75 = *(_QWORD *)v112;
      v82 = *MEMORY[0x1E0CA6818];
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v112 != v75)
            objc_enumerationMutation(v74);
          v77 = v35;
          v36 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * v35);
          objc_msgSend(*(id *)(v32 + 48), "mapProtectionClassToBundleIdToItem", context);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v36;
          objc_msgSend(v37, "objectForKey:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          objc_msgSend(v38, "allKeys");
          v81 = (id)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
          if (v86)
          {
            v84 = *(_QWORD *)v108;
            v80 = v38;
            do
            {
              for (j = 0; j != v86; ++j)
              {
                if (*(_QWORD *)v108 != v84)
                  objc_enumerationMutation(v81);
                v40 = *(id *)(*((_QWORD *)&v107 + 1) + 8 * j);
                if ((objc_msgSend(v40, "isEqual:", CFSTR("com.apple.parsec.stocks")) & 1) != 0
                  || (objc_msgSend(v40, "isEqual:", CFSTR("com.apple.parsec.sports")) & 1) != 0
                  || (objc_msgSend(v40, "isEqual:", CFSTR("com.apple.parsec.maps")) & 1) != 0
                  || objc_msgSend(v40, "isEqual:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
                {
                  objc_msgSend(v38, "objectForKey:", v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  CS_simplifyItemArray();
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  v43 = (void *)objc_opt_new();
                  v103 = 0u;
                  v104 = 0u;
                  v105 = 0u;
                  v106 = 0u;
                  v44 = v42;
                  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
                  if (v45)
                  {
                    v46 = v45;
                    v47 = *(_QWORD *)v104;
                    do
                    {
                      for (k = 0; k != v46; ++k)
                      {
                        if (*(_QWORD *)v104 != v47)
                          objc_enumerationMutation(v44);
                        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * k), "uniqueIdentifier");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "addObject:", v49);

                      }
                      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
                    }
                    while (v46);
                  }

                  if (objc_msgSend(v43, "count"))
                  {
                    obja = v40;
                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v44, "count"));
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = 0u;
                    v100 = 0u;
                    v101 = 0u;
                    v102 = 0u;
                    v51 = v44;
                    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
                    if (v52)
                    {
                      v53 = v52;
                      v54 = *(_QWORD *)v100;
                      do
                      {
                        for (m = 0; m != v53; ++m)
                        {
                          if (*(_QWORD *)v100 != v54)
                            objc_enumerationMutation(v51);
                          v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * m), "copy");
                          objc_msgSend(v50, "addObject:", v56);

                        }
                        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
                      }
                      while (v53);
                    }

                    if (sClientRankAndBlend)
                    {
                      v96[0] = MEMORY[0x1E0C809B0];
                      v96[1] = 3221225472;
                      v96[2] = __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_2;
                      v96[3] = &unk_1E6E43838;
                      v97[0] = v51;
                      v97[1] = v83;
                      v57 = obja;
                      v98 = v57;
                      v58 = (void *)MEMORY[0x1BCCB38DC](v96);
                      objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      v121 = v82;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "array");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = v80;
                      objc_msgSend(v59, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v60, v83, v57, v61, v58);

                      v63 = &v98;
                      v62 = (id *)v97;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0DA9B70], "sharedInstance");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      v120 = v82;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "array");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      v93[0] = MEMORY[0x1E0C809B0];
                      v93[1] = 3221225472;
                      v93[2] = __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_4;
                      v93[3] = &unk_1E6E43880;
                      v94[0] = v50;
                      v94[1] = v83;
                      v95 = obja;
                      objc_msgSend(v58, "fetchAttributesForProtectionClass:attributes:bundleID:identifiers:completion:", v83, v59, v95, v60, v93);
                      v63 = &v95;
                      v62 = (id *)v94;
                    }

                    v40 = obja;
                  }

                }
              }
              v86 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
            }
            while (v86);
          }

          v35 = v77 + 1;
          v32 = v79;
        }
        while (v77 + 1 != v76);
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
      }
      while (v76);
    }

  }
  if (sRenderEngagementCountValues)
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v64 = v78;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v90;
      do
      {
        for (n = 0; n != v66; ++n)
        {
          if (*(_QWORD *)v90 != v67)
            objc_enumerationMutation(v64);
          v69 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * n);
          pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
          objc_msgSend((id)sRenderEngagementCountValues, "objectForKey:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v70)
          {
            v71 = v70;
            v72 = (void *)objc_msgSend(v70, "copy");

          }
          else
          {
            v72 = (void *)objc_opt_new();
          }
          objc_msgSend(v72, "incrementRankingValuesForType:", 1, context);
          objc_msgSend((id)sRenderEngagementCountValues, "setValue:forKey:", v72, v69);
          pthread_rwlock_unlock(&sRWRenderEngagementValueLock);

        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
      }
      while (v66);
    }

  }
  objc_autoreleasePoolPop(context);
}

void __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
    goto LABEL_23;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = v3;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v5)
  {
    v8 = 0;
    goto LABEL_20;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      if (!v11)
        goto LABEL_15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_15;
      SSFetchAttributeValueIsValid(v11);
      v12 = objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v8 = 0;
LABEL_15:
        ++v7;
        continue;
      }
      v8 = (void *)v12;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v23 = v8;
        v14 = v4;
        v15 = a1;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        a1 = v15;
        v4 = v14;
        v8 = v23;
        if (v18)
        {
          v19 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v19, "attributeSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAttribute:forKey:", 0, CFSTR("_kMDItemRenderDate"));

          objc_msgSend(v22, "addObject:", v19);
        }
      }

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v6);
LABEL_20:

  if (objc_msgSend(v22, "count"))
    objc_msgSend((id)sCSIndex, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v22, 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, &__block_literal_global_41);

  v3 = v21;
LABEL_23:

}

void __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = a1;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count") == 1)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (v14)
          {
            v15 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(v15, "attributeSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setAttribute:forKey:", 0, CFSTR("_kMDItemRenderDate"));

            objc_msgSend(v18, "addObject:", v15);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v18, "count"))
    objc_msgSend((id)sIndexer, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v18, 0, 0, *(_QWORD *)(v17 + 40), *(_QWORD *)(v17 + 48), 0, &__block_literal_global_43);

}

- (void)fetchBundleRenderAndEngagementInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[SSRankingFeedbackHandler fetchQueue](self, "fetchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke;
  block[3] = &unk_1E6E42FD8;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD v42[3];
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemBundleID=%@"), CFSTR("com.apple.searchd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setInternal:", 1);
  objc_msgSend(v3, "setLowPriority:", 0);
  v43[0] = CFSTR("com.apple.searchd");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIDs:", v4);

  objc_msgSend(v3, "setMaxCount:", 400);
  objc_msgSend(v3, "setLive:", 1);
  v42[0] = *MEMORY[0x1E0CA6978];
  v42[1] = CFSTR("_kMDItemRenderValues");
  v42[2] = CFSTR("_kMDItemEngagementValues");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchAttributes:", v5);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setProtectionClasses:");
  }
  else
  {
    v41 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProtectionClasses:", v6);

  }
  objc_msgSend(v3, "fetchAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (sClientRankAndBlend)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v10 = MEMORY[0x1E0C809B0];
    v36 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_2;
    v32[3] = &unk_1E6E438A8;
    v32[4] = &v33;
    v11 = (void *)MEMORY[0x1BCCB38DC](v32);
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_3;
    v29[3] = &unk_1E6E438D0;
    v31 = &v37;
    v12 = v9;
    v30 = v12;
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_4;
    v25[3] = &unk_1E6E438F8;
    v27 = &v33;
    v28 = &v37;
    v13 = (id)MEMORY[0x1BCCB38DC](v29);
    v26 = v13;
    v14 = (void *)MEMORY[0x1BCCB38DC](v25);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v2, v3);
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setFoundItemsHandler:", v11);
      objc_msgSend(v16, "setGatherEndedHandler:", v13);
      objc_msgSend(v16, "setCompletionHandler:", v14);
      objc_msgSend(v16, "start");
    }
    else
    {
      dispatch_group_leave(v12);
    }

    _Block_object_dispose(&v33, 8);
    v19 = 0;
  }
  else
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v17 = (void *)sIndexer;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_5;
    v21[3] = &unk_1E6E43960;
    v23 = &v33;
    v24 = v8;
    v18 = v9;
    v22 = v18;
    objc_msgSend(v17, "startQuery:withContext:handler:", v2, v3, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      dispatch_group_leave(v18);

    _Block_object_dispose(&v33, 8);
    v16 = 0;
  }
  v20 = dispatch_time(0, 250000000);
  dispatch_group_wait(v9, v20);
  if (sClientRankAndBlend)
  {
    if (v16 && !*((_BYTE *)v38 + 24))
      objc_msgSend(v16, "cancel");
  }
  else if (v19)
  {
    objc_msgSend((id)sIndexer, "cancelQuery:", v19);
  }
  _Block_object_dispose(&v37, 8);

}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v2;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v25;
    v21 = *MEMORY[0x1E0CA6060];
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v3);
        v5 = (void *)objc_opt_new();
        objc_msgSend(v4, "attributeSet");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "attributeDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("_kMDItemRenderValues"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count");
          if (v10)
          {
            v11 = v10;
            v12 = 0;
            v29 = 0;
            v28 = 0;
            do
            {
              if (v12 >= v11)
              {
                *((_WORD *)&v28 + v12) = 0;
              }
              else
              {
                objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                *((_WORD *)&v28 + v12) = objc_msgSend(v13, "integerValue");

              }
              ++v12;
            }
            while (v12 != 6);
            objc_msgSend(v5, "setRankingValues:forType:", &v28, 1);
          }
          objc_msgSend(v7, "objectForKey:", CFSTR("_kMDItemEngagementValues"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "count");
          if (v15)
          {
            v16 = v15;
            v17 = 0;
            v29 = 0;
            v28 = 0;
            do
            {
              if (v17 >= v16)
              {
                *((_WORD *)&v28 + v17) = 0;
              }
              else
              {
                objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *((_WORD *)&v28 + v17) = objc_msgSend(v18, "integerValue");

              }
              ++v17;
            }
            while (v17 != 6);
            objc_msgSend(v5, "setRankingValues:forType:", &v28, 0);
          }
          objc_msgSend((id)sRenderEngagementCountValues, "setObject:forKey:", v5, v8);

        }
        ++v3;
      }
      while (v3 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v23);
  }

  pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_QWORD *__63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_4(_QWORD *result, uint64_t a2)
{
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) && !a2 && !*(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24))
    return (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
  return result;
}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_5(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v9 = a6;
  switch(a2)
  {
    case 2:
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (!*(_BYTE *)(v10 + 24))
      {
        *(_BYTE *)(v10 + 24) = 1;
        v13 = v9;
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        v9 = v13;
      }
      break;
    case 1:
      break;
    case 0:
      v12 = v9;
      pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
      objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", *(_QWORD *)(a1 + 48), 0, &__block_literal_global_55);
      pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
LABEL_9:
      v9 = v12;
      goto LABEL_10;
    default:
      goto LABEL_10;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v11 + 24))
  {
    *(_BYTE *)(v11 + 24) = 1;
    v12 = v9;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_9;
  }
LABEL_10:

}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  __int16 v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = *(void **)a2;
  v5 = (void *)*MEMORY[0x1E0C9B0D0];
  if (*(_QWORD *)a2 == *MEMORY[0x1E0C9B0D0])
    v4 = 0;
  v6 = v4;
  if (v6)
  {
    v7 = *(void **)(a2 + 8);
    if (v7 == v5)
      v7 = 0;
    v8 = v7;
    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v21 = 0;
      v20 = 0;
      do
      {
        if (v11 >= v10)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

        }
        *((_WORD *)&v20 + v11++) = v13;
      }
      while (v11 != 6);
      objc_msgSend(v3, "setRankingValues:forType:", &v20, 1);
    }
    v14 = *(void **)(a2 + 16);
    if (v14 == v5)
      v14 = 0;
    v15 = v14;

    v16 = objc_msgSend(v15, "count");
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v21 = 0;
      v20 = 0;
      do
      {
        if (v18 >= v17)
        {
          *((_WORD *)&v20 + v18) = 0;
        }
        else
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *((_WORD *)&v20 + v18) = objc_msgSend(v19, "integerValue");

        }
        ++v18;
      }
      while (v18 != 6);
      objc_msgSend(v3, "setRankingValues:forType:", &v20, 0);
    }
    objc_msgSend((id)sRenderEngagementCountValues, "setObject:forKey:", v3, v6);

  }
}

- (void)fetchBundleRenderAndEngagementInfo
{
  -[SSRankingFeedbackHandler fetchBundleRenderAndEngagementInfo:](self, "fetchBundleRenderAndEngagementInfo:", 0);
}

- (void)writeRenderAndEngagementInfo
{
  NSObject *v3;
  _QWORD block[5];

  -[SSRankingFeedbackHandler countQueue](self, "countQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSRankingFeedbackHandler_writeRenderAndEngagementInfo__block_invoke;
  block[3] = &unk_1E6E42FD8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __56__SSRankingFeedbackHandler_writeRenderAndEngagementInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v1 = a1;
  v43 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mapProtectionClassToBundleIdToItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v38;
    v30 = v1;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v3);
        v32 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v4);
        objc_msgSend(*(id *)(v1 + 32), "mapProtectionClassToBundleIdToItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v7, "objectForKey:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              CS_simplifyItemArray();
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15 && objc_msgSend(v15, "count"))
              {
                v16 = &__block_literal_global_57;
                if (!sClientRankAndBlend)
                  v16 = &__block_literal_global_58;
                v17 = &sIndexer;
                if (sClientRankAndBlend)
                  v17 = &sCSIndex;
                objc_msgSend((id)*v17, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v15, 0, 0, v5, v13, 0, v16);
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v10);
        }

        v4 = v32 + 1;
        v1 = v30;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v31);
  }

  objc_msgSend(*(id *)(v1 + 32), "sectionCSItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = *(void **)(v1 + 32);
    if (sClientRankAndBlend)
    {
      v21 = (void *)sCSIndex;
      objc_msgSend(v20, "sectionCSItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      CS_simplifyItemArray();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0CB2AC0];
      v26 = &__block_literal_global_59;
    }
    else
    {
      v21 = (void *)sIndexer;
      objc_msgSend(v20, "sectionCSItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      CS_simplifyItemArray();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0CB2AC0];
      v26 = &__block_literal_global_60;
    }
    objc_msgSend(v21, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v24, 0, 0, v25, CFSTR("com.apple.searchd"), 0, v26);

  }
  objc_msgSend(*(id *)(v1 + 32), "mapProtectionClassToBundleIdToItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeAllObjects");

  objc_msgSend(*(id *)(v1 + 32), "sectionCSItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAllObjects");

}

- (NSMutableDictionary)mapProtectionClassToBundleIdToItem
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMapProtectionClassToBundleIdToItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)sectionCSItems
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSectionCSItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)countQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCountQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_countQueue, 0);
  objc_storeStrong((id *)&self->_sectionCSItems, 0);
  objc_storeStrong((id *)&self->_mapProtectionClassToBundleIdToItem, 0);
}

- (id)fetchResults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v24 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemBundleID=%@ && kMDItemDisplayName=%@"), CFSTR("com.apple.application"), CFSTR("Reminders"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setInternal:", 1);
  objc_msgSend(v3, "setLowPriority:", 0);
  v27[0] = CFSTR("com.apple.application");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIDs:", v4);

  objc_msgSend(v3, "setMaxCount:", 400);
  v26[0] = *MEMORY[0x1E0CA6978];
  v26[1] = CFSTR("_kMDItemRenderData");
  v26[2] = CFSTR("_kMDItemEngagementData");
  v26[3] = CFSTR("_kMDItemRenderValues");
  v26[4] = CFSTR("_kMDItemEngagementValues");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchAttributes:", v5);

  objc_msgSend(v3, "setClientBundleID:", CFSTR("com.apple.application"));
  v25 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProtectionClasses:", v6);

  objc_msgSend(v3, "fetchAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  objc_msgSend(MEMORY[0x1E0DA9B70], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke;
  v15[3] = &unk_1E6E43960;
  v17 = &v19;
  v18 = v8;
  v11 = v9;
  v16 = v11;
  objc_msgSend(v10, "startQuery:withContext:handler:", v2, v3, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    dispatch_group_leave(v11);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  uint64_t v10;
  _QWORD v11[5];

  v9 = a6;
  if (a2 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else if (!a2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_2;
    v11[3] = &unk_1E6E43F38;
    v10 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", v10, 0, v11);
  }

}

void __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v4 = *(void **)a2;
  v5 = (void *)*MEMORY[0x1E0C9B0D0];
  if (*(_QWORD *)a2 == *MEMORY[0x1E0C9B0D0])
    v4 = 0;
  v6 = v4;
  if (v6)
  {
    v24 = v6;
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIdentifier:", v24);
    v8 = *(void **)(a2 + 8);
    if (v8 == v5)
      v8 = 0;
    v9 = v8;
    v10 = v9;
    if (v9)
    {
      v27 = 0;
      v28 = 0;
      __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_3((uint64_t)v9, v9, &v28, &v27);
      v11 = v28;
      v12 = v28;
      v13 = v27;
      v14 = v27;
      objc_storeStrong((id *)&sRenderCountSentinelDate, v11);
      objc_storeStrong((id *)&sRenderCountData, v13);
    }
    else
    {
      v14 = 0;
      v12 = 0;
    }
    v15 = *(void **)(a2 + 16);
    if (v15 == v5)
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      v25 = v14;
      v26 = v12;
      __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_3(v17, v16, &v26, &v25);
      v18 = v26;
      v19 = v26;

      v20 = v25;
      v21 = v25;

      objc_storeStrong((id *)&sEngagementCountSentinelDate, v18);
      objc_storeStrong((id *)&sEngagementCountData, v20);
      v14 = v21;
      v12 = v19;
    }
    objc_msgSend(v7, "setSectionBundleIdentifier:", CFSTR("com.apple.application"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
    if (*(void **)(a2 + 24) == v5)
      v22 = 0;
    else
      v22 = *(void **)(a2 + 24);
    objc_storeStrong((id *)&sRenderCounts, v22);
    if (*(void **)(a2 + 32) == v5)
      v23 = 0;
    else
      v23 = *(void **)(a2 + 32);
    objc_storeStrong((id *)&sEngagementCounts, v23);

    v6 = v24;
  }

}

void __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_3(uint64_t a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v6;
  id v7;
  double *v8;
  char v9;

  v6 = a2;
  v9 = 0;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "getBytes:length:", &v9, 1);
    if (v9 == 9)
    {
      objc_msgSend(v6, "subdataWithRange:", 1, 9);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = (double *)objc_msgSend(v7, "bytes");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subdataWithRange:", 9, objc_msgSend(v6, "length") - 9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

- (void)resetResultWithRankingItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id obj;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  v6 = *MEMORY[0x1E0C9B0D0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
        objc_msgSend(v11, "setUniqueIdentifier:", v10);
        objc_msgSend(v11, "setIsUpdate:", 1);
        objc_msgSend(v11, "setBundleID:", CFSTR("com.apple.application"));
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("_kMDItemRenderData"));
        objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("_kMDItemEngagementData"));
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithAttributes:", v12);
        objc_msgSend(v11, "setAttributeSet:", v13);

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }

  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  objc_msgSend(MEMORY[0x1E0DA9B70], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  v17 = (void *)objc_msgSend(v4, "copy");
  v18 = *MEMORY[0x1E0CB2AC0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke;
  v29[3] = &unk_1E6E43E20;
  v19 = v14;
  v30 = v19;
  objc_msgSend(v15, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v17, 0, 0, v18, CFSTR("com.apple.application"), 0, v29);

  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  v20 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
  objc_msgSend(v20, "setUniqueIdentifier:", CFSTR("com.apple.application"));
  objc_msgSend(v20, "setIsUpdate:", 1);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setAttribute:forKey:", v6, CFSTR("_kMDItemRenderData"));
  objc_msgSend(v21, "setAttribute:forKey:", v6, CFSTR("_kMDItemEngagementData"));
  objc_msgSend(v20, "setAttributeSet:", v21);
  objc_msgSend(v20, "setBundleID:", CFSTR("com.apple.searchd"));
  dispatch_group_enter(v19);
  objc_msgSend(MEMORY[0x1E0DA9B70], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke_2;
  v27[3] = &unk_1E6E43E20;
  v28 = v19;
  v25 = v19;
  objc_msgSend(v22, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v23, 0, 0, v18, v24, 0, v27);

  dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
}

void __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)getSyntheticTestRankingItem
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSectionBundleIdentifier:", CFSTR("com.apple.application"));
  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.reminders"));
  return v2;
}

- (id)getSyntheticTestRankingItemsForStressTest
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  for (i = 0; i != 100000; ++i)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setSectionBundleIdentifier:", CFSTR("com.apple.application"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.reminders.%ld"), i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    objc_msgSend(v2, "addObject:", v4);
  }
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", CFSTR("com.apple.reminders"));

  v7 = (void *)objc_msgSend(v2, "copy");
  return v7;
}

- (void)testForDurationWithIntervals:(int *)a3 maxIndex:(int)a4 duration:(int64_t)a5 counts:(id)a6
{
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  int v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  int *v75;
  void *v76;
  void *v78;
  id obj;
  __int16 v80;
  __int16 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  void *v101;
  uint64_t v102;
  void *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v73 = a6;
  if (testForDurationWithIntervals_maxIndex_duration_counts__onceToken != -1)
    dispatch_once(&testForDurationWithIntervals_maxIndex_duration_counts__onceToken, &__block_literal_global_41_0);
  v9 = (void *)objc_opt_new();
  v10 = (uint64_t *)MEMORY[0x1E0CB2AC0];
  v75 = a3;
  if (sStressMode == 1)
  {
    -[SSRankingFeedbackHandler getSyntheticTestRankingItemsForStressTest](self, "getSyntheticTestRankingItemsForStressTest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v95;
      v16 = *MEMORY[0x1E0CB2AC0];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v95 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v16, v18);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
      }
      while (v14);
    }

    -[SSRankingFeedbackHandler resetResultWithRankingItems:](self, "resetResultWithRankingItems:", obj);
    v78 = (void *)objc_msgSend(v12, "copy");
    a3 = v75;
    v10 = (uint64_t *)MEMORY[0x1E0CB2AC0];
  }
  else
  {
    -[SSRankingFeedbackHandler getSyntheticTestRankingItem](self, "getSyntheticTestRankingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    -[SSRankingFeedbackHandler resetResultWithRankingItems:](self, "resetResultWithRankingItems:");
    objc_msgSend(v12, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v19;
    v102 = *v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 0x80000000) == 0)
  {
    v21 = a4;
    do
    {
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v22 + (double)a3[v21] * -86400.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v23);

      --v21;
    }
    while (v21 != -1);
  }
  v74 = v20;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v24 = v9;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v91;
    v28 = *v10;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v91 != v27)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
        -[SSRankingFeedbackHandler resultsWithRankingItemsDidBecomeVisible:date:protectionClassMapping:](self, "resultsWithRankingItemsDidBecomeVisible:date:protectionClassMapping:", obj, v30, v78);
        objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRankingFeedbackHandler didEngageResultWithRankingItem:startDate:protectionClass:query:](self, "didEngageResultWithRankingItem:startDate:protectionClass:query:", v31, v30, v28, CFSTR("a"));

        -[SSRankingFeedbackHandler writeRenderAndEngagementInfo](self, "writeRenderAndEngagementInfo");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    }
    while (v26);
  }

  v32 = -[SSRankingFeedbackHandler fetchResults](self, "fetchResults");
  objc_msgSend(v74, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v33 + (double)(*v75 + 364) * -86400.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_opt_new();
  v76 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v36 = v24;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
  if (v37)
  {
    v38 = v37;
    v39 = 0;
    v40 = *(_QWORD *)v87;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v87 != v40)
          objc_enumerationMutation(v36);
        v42 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * k);
        if (objc_msgSend(v42, "compare:", v34) == -1)
        {
          if (objc_msgSend(v35, "count"))
            objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
          else
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v44 = objc_claimAutoreleasedReturnValue();

          v39 = (void *)v44;
        }
        else
        {
          if (!v39 || objc_msgSend(v39, "compare:", v42) != -1)
          {
            v43 = v42;

            v39 = v43;
          }
          objc_msgSend(v35, "addObject:", v42);
        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    }
    while (v38);
  }
  else
  {
    v39 = 0;
  }
  v72 = v36;

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v45 = v35;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
  if (v46)
  {
    v47 = v46;
    v48 = 0;
    v49 = *(_QWORD *)v83;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v83 != v49)
          objc_enumerationMutation(v45);
        v51 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * m);
        v81 = 0;
        if (v48)
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", v48 - 1);
          v52 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v52 = v39;
        }
        v53 = v52;
        objc_msgSend(v51, "timeIntervalSinceReferenceDate");
        v55 = v54;
        objc_msgSend(v53, "timeIntervalSinceReferenceDate");
        v57 = (int)((double)(86400 * ((unint64_t)(v55 - v56) / 0x15180)) / 86400.0);
        if ((a5 & 0x8000000000000000) == 0 || !v57)
        {
          v80 = 0;
          if (v57 >= 256)
          {
            v80 = (v57 + 1);
            LOBYTE(v57) = -1;
          }
          LOBYTE(v81) = v57;
          HIBYTE(v81) = 1;
          objc_msgSend(v76, "appendBytes:length:", &v81, 2);
          if ((_BYTE)v80)
            objc_msgSend(v76, "appendBytes:length:", &v80, 2);
          ++v48;
        }

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    }
    while (v47);
  }

  v58 = (void *)objc_msgSend(v76, "copy");
  v59 = objc_msgSend(v58, "length");
  if (!sRenderCountSentinelDate)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.1();
  v60 = v59;
  objc_msgSend(v39, "timeIntervalSinceReferenceDate");
  v62 = v61;
  objc_msgSend((id)sRenderCountSentinelDate, "timeIntervalSinceReferenceDate");
  if (v62 - v63 >= 86400.0)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.2();
  if (!sEngagementCountSentinelDate)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.3();
  objc_msgSend((id)sEngagementCountSentinelDate, "timeIntervalSinceReferenceDate");
  v65 = v64;
  objc_msgSend(v39, "timeIntervalSinceReferenceDate");
  if (v65 - v66 >= 86400.0)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.4();
  if ((objc_msgSend((id)sEngagementCountData, "isEqualToData:", v58) & 1) == 0)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.12();
  if ((objc_msgSend((id)sRenderCountData, "isEqualToData:", v58) & 1) == 0)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.11();
  if (objc_msgSend((id)sRenderCountData, "length") != v60)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.10();
  if (objc_msgSend((id)sEngagementCountData, "length") != v60)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.9();
  v67 = objc_msgSend((id)sRenderCounts, "count");
  if (v67 != objc_msgSend(v73, "count"))
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.8();
  v68 = objc_msgSend((id)sEngagementCounts, "count");
  if (v68 != objc_msgSend(v73, "count"))
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.7();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v73);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", sRenderCounts);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v69, "isEqualToSet:", v70) & 1) == 0)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.6();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", sEngagementCounts);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v69, "isEqualToSet:", v71) & 1) == 0)
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.5();

}

void __89__SSRankingFeedbackHandler_Tests__testForDurationWithIntervals_maxIndex_duration_counts___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  v1 = (void *)userDefaults;
  userDefaults = v0;

}

- (void)testCountsUptoOneDay
{
  int v2;

  v2 = 0;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", &v2, 0, 1, &unk_1E6E9B350);
}

- (void)testCountsUptoWeek
{
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = xmmword_1B87DF0D0;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", &v2, 3, 7, &unk_1E6E9B368);
}

- (void)testCountsUptoMonth
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B87DF0E0;
  v2[1] = unk_1B87DF0F0;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 7, 30, &unk_1E6E9B380);
}

- (void)testCountsUptoQuarter
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B87DF100;
  v2[1] = unk_1B87DF110;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 7, 90, &unk_1E6E9B398);
}

- (void)testCountsUptoHalfYear
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B87DF120;
  v2[1] = unk_1B87DF130;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 7, 180, &unk_1E6E9B3B0);
}

- (void)testCountsUptoYear
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = xmmword_1B87DF140;
  v3 = 0x16C0000016BLL;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", &v2, 5, 365, &unk_1E6E9B3C8);
}

- (void)testCountsAfterYear
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B87DF158;
  v2[1] = unk_1B87DF168;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 7, 381, &unk_1E6E9B3E0);
}

- (void)testCountsAfterCoupleYears
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0x30C00000014;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 1, 781, &unk_1E6E9B3F8);
}

- (void)testCountsMovingDaysInPast
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0xFFFFFFFE00000000;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 1, -3, &unk_1E6E9B410);
}

- (void)testCountsMovingYearInPast
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0xFFFFFE8900000000;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 1, -376, &unk_1E6E9B428);
}

- (void)testCountsMovingCoupleOfYearsInPast
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0xFFFFFCF400000000;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 1, -781, &unk_1E6E9B440);
}

- (void)testForDummyEntry
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0x14000000000;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v2, 1, 321, &unk_1E6E9B458);
}

- (void)testCountsForRegularEngagement
{
  uint64_t i;
  _DWORD v4[730];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bzero(v4, 0xB68uLL);
  for (i = 0; i != 730; ++i)
    v4[i] = i;
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v4, 729, 731, &unk_1E6E9B470);
}

- (void)stressTestCounts
{
  uint64_t v2;
  int32x4_t v3;
  int32x4_t v4;
  _OWORD v5[25];
  uint64_t v6;

  v2 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  sStressMode = 1;
  v3 = (int32x4_t)xmmword_1B87DF0C0;
  memset(v5, 0, sizeof(v5));
  v4.i64[0] = 0x400000004;
  v4.i64[1] = 0x400000004;
  do
  {
    v5[v2] = v3;
    v3 = vaddq_s32(v3, v4);
    ++v2;
  }
  while (v2 != 25);
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v5, 99, 101, &unk_1E6E9B488, *(double *)v3.i64);
}

@end
