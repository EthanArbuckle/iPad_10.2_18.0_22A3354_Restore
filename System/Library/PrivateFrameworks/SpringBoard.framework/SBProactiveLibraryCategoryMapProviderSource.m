@implementation SBProactiveLibraryCategoryMapProviderSource

- (void)requestLibraryCategoryMapWithOptions:(unint64_t)a3 existingLibraryCategoryMap:(id)a4 forbiddenApplicationIdentifiers:(id)a5 sessionId:(unint64_t)a6 queue:(id)a7 completion:(id)a8
{
  NSObject *v14;
  NSArray *lastKnownGoodSuggestions;
  NSArray *lastKnownGoodRecentApps;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *v26;
  dispatch_semaphore_t v27;
  ATXAppDirectoryClient *appDirectoryClient;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  CFAbsoluteTime Current;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  CFAbsoluteTime v67;
  ATXAppDirectoryClient *v68;
  NSObject *v69;
  CFAbsoluteTime v70;
  ATXAppDirectoryClient *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  dispatch_queue_t queue;
  id v79;
  _QWORD block[4];
  id v81;
  id v82;
  id v83;
  __int128 *v84;
  _QWORD *v85;
  _QWORD *v86;
  unint64_t v87;
  CFAbsoluteTime v88;
  unint64_t v89;
  _QWORD v90[4];
  NSObject *v91;
  SBProactiveLibraryCategoryMapProviderSource *v92;
  id v93;
  id v94;
  id v95;
  NSObject *v96;
  _QWORD *v97;
  _QWORD *v98;
  CFAbsoluteTime v99;
  unint64_t v100;
  _QWORD v101[4];
  NSObject *v102;
  id v103;
  id v104;
  NSObject *v105;
  _QWORD *v106;
  __int128 *p_buf;
  CFAbsoluteTime v108;
  unint64_t v109;
  _QWORD v110[5];
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[5];
  NSObject *v117;
  uint8_t v118[4];
  unint64_t v119;
  __int128 buf;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v79 = a4;
  v77 = a5;
  v14 = a7;
  v75 = a8;
  queue = v14;
  BSDispatchQueueAssert();
  if (!-[NSArray count](self->_lastKnownGoodSuggestions, "count"))
  {
    lastKnownGoodSuggestions = self->_lastKnownGoodSuggestions;
    self->_lastKnownGoodSuggestions = 0;

  }
  if (!-[NSArray count](self->_lastKnownGoodRecentApps, "count", v75))
  {
    lastKnownGoodRecentApps = self->_lastKnownGoodRecentApps;
    self->_lastKnownGoodRecentApps = 0;

  }
  if (self->_lastKnownGoodSuggestions)
  {
    if (self->_lastKnownGoodRecentApps)
      goto LABEL_25;
  }
  else
  {
    objc_msgSend(v79, "categoryIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getSuggestedCategoryIdentifier(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v79, "sortedApplicationIdentifiersForCategoryIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (NSArray *)objc_msgSend(v19, "copy");
      v21 = self->_lastKnownGoodSuggestions;
      self->_lastKnownGoodSuggestions = v20;

    }
    if (self->_lastKnownGoodRecentApps)
      goto LABEL_14;
  }
  objc_msgSend(v79, "categoryIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  getRecentsCategoryIdentifier(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v79, "sortedApplicationIdentifiersForCategoryIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (NSArray *)objc_msgSend(v24, "copy");
    v26 = self->_lastKnownGoodRecentApps;
    self->_lastKnownGoodRecentApps = v25;

  }
LABEL_14:
  if (!-[NSArray count](self->_lastKnownGoodSuggestions, "count")
    || !-[NSArray count](self->_lastKnownGoodRecentApps, "count"))
  {
    v27 = dispatch_semaphore_create(0);
    appDirectoryClient = self->_appDirectoryClient;
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke;
    v116[3] = &unk_1E8EB8A80;
    v116[4] = self;
    v29 = v27;
    v117 = v29;
    -[ATXAppDirectoryClient predictedAppsAndRecentAppsWithShouldUseDefaultCategories:reply:](appDirectoryClient, "predictedAppsAndRecentAppsWithShouldUseDefaultCategories:reply:", 1, v116);
    v30 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v29, v30))
    {
      SBLogProactiveAppLibrary();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[SBProactiveLibraryCategoryMapProviderSource requestLibraryCategoryMapWithOptions:existingLibraryCategoryMap:forbiddenApplicationIdentifiers:sessionId:queue:completion:].cold.3(a6, v31, v32, v33, v34, v35, v36, v37);

    }
    if (!-[NSArray count](self->_lastKnownGoodSuggestions, "count"))
    {
      v38 = self->_lastKnownGoodSuggestions;
      self->_lastKnownGoodSuggestions = (NSArray *)&unk_1E91CEDA0;

      SBLogProactiveAppLibrary();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[SBProactiveLibraryCategoryMapProviderSource requestLibraryCategoryMapWithOptions:existingLibraryCategoryMap:forbiddenApplicationIdentifiers:sessionId:queue:completion:].cold.2(a6, v39, v40, v41, v42, v43, v44, v45);

    }
  }
LABEL_25:
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x2020000000;
  v115[3] = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v114[3] = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v77, "count"))
  {
    v47 = (void *)MEMORY[0x1E0CB3880];
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_31;
    v112[3] = &unk_1E8EB8AA8;
    v113 = v77;
    objc_msgSend(v47, "predicateWithBlock:", v112);
    v48 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v48;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (!v79 || (a3 & 1) != 0)
    v50 = objc_opt_new();
  else
    v50 = objc_msgSend(v79, "mutableCopy");
  v51 = (void *)v50;
  SBLogProactiveAppLibrary();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a6;
    _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshing proactive library category source", (uint8_t *)&buf, 0xCu);
  }

  v53 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__88;
  v123 = __Block_byref_object_dispose__88;
  v124 = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = __Block_byref_object_copy__88;
  v110[4] = __Block_byref_object_dispose__88;
  v111 = 0;
  v54 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "dictionaryWithObject:forKey:", v55, *MEMORY[0x1E0DAA828]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = objc_msgSend(v51, "sb_hasAppsPopulatedForCategoriesOtherThanProactive");
  if ((a3 & 0x10) != 0)
  {
    SBLogProactiveAppLibrary();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 134217984;
      v119 = a6;
      _os_log_impl(&dword_1D0540000, v58, OS_LOG_TYPE_DEFAULT, "(%ld) We are requesting the defaults because the passed options indicated there is no cache, so we need data fast. ", v118, 0xCu);
    }

  }
  if (!((a3 >> 2) & 1 | v57 & 1))
  {
    SBLogProactiveAppLibrary();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      -[SBProactiveLibraryCategoryMapProviderSource requestLibraryCategoryMapWithOptions:existingLibraryCategoryMap:forbiddenApplicationIdentifiers:sessionId:queue:completion:].cold.1(a6, v59, v60, v61, v62, v63, v64, v65);

  }
  if ((a3 >> 2) & 1 | v57 ^ 1u)
  {
    SBLogProactiveAppLibrary();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 134217984;
      v119 = a6;
      _os_log_impl(&dword_1D0540000, v66, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshing proactive library category source 'Categories'", v118, 0xCu);
    }

    v67 = CFAbsoluteTimeGetCurrent();
    dispatch_group_enter(v53);
    v68 = self->_appDirectoryClient;
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_36;
    v101[3] = &unk_1E8EB8B20;
    v106 = v114;
    v108 = v67;
    v102 = queue;
    p_buf = &buf;
    v109 = a6;
    v103 = v51;
    v104 = v46;
    v105 = v53;
    -[ATXAppDirectoryClient categoriesWithShouldUseDefault:reply:](v68, "categoriesWithShouldUseDefault:reply:", (a3 >> 4) & 1, v101);

  }
  if ((a3 & 2) != 0)
  {
    SBLogProactiveAppLibrary();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 134217984;
      v119 = a6;
      _os_log_impl(&dword_1D0540000, v69, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshing proactive library category source 'Suggestions/Recents/Hidden'", v118, 0xCu);
    }

    v70 = CFAbsoluteTimeGetCurrent();
    dispatch_group_enter(v53);
    v71 = self->_appDirectoryClient;
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_42;
    v90[3] = &unk_1E8EB8B70;
    v97 = v115;
    v99 = v70;
    v98 = v110;
    v100 = a6;
    v91 = queue;
    v92 = self;
    v93 = v46;
    v94 = v51;
    v95 = v56;
    v96 = v53;
    -[ATXAppDirectoryClient predictedAppsAndRecentAppsWithShouldUseDefaultCategories:reply:](v71, "predictedAppsAndRecentAppsWithShouldUseDefaultCategories:reply:", (a3 >> 4) & 1, v90);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_45;
  block[3] = &unk_1E8EB8B98;
  v81 = v51;
  v82 = v56;
  v88 = Current;
  v83 = v76;
  v84 = &buf;
  v89 = a3;
  v85 = v114;
  v86 = v115;
  v87 = a6;
  v72 = v76;
  v73 = v56;
  v74 = v51;
  dispatch_group_notify(v53, queue, block);

  _Block_object_dispose(v110, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(v115, 8);

}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(v10, "recentApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      objc_msgSend(v10, "recentApps");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v2, "copy");
    }
    else
    {
      v6 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v6);
    if (v5)
    {

    }
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    objc_msgSend(v10, "predictedApps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      objc_msgSend(v10, "predictedApps");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v2, "copy");
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v9);
    if (v8)
    {

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (SBProactiveLibraryCategoryMapProviderSource)init
{
  SBProactiveLibraryCategoryMapProviderSource *v2;
  uint64_t v3;
  ATXAppDirectoryClient *appDirectoryClient;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBProactiveLibraryCategoryMapProviderSource;
  v2 = -[SBProactiveLibraryCategoryMapProviderSource init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    appDirectoryClient = v2->_appDirectoryClient;
    v2->_appDirectoryClient = (ATXAppDirectoryClient *)v3;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:suspensionBehavior:", v2, sel_handleUpdateCategoriesNotification_, *MEMORY[0x1E0CF9260], 0, 4);

  }
  return v2;
}

- (NSString)sourceName
{
  return (NSString *)CFSTR("proactive");
}

uint64_t __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CFAbsoluteTime Current;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v8 = MEMORY[0x1E0C809B0];
  *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = Current - *(double *)(a1 + 80);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2;
  block[3] = &unk_1E8EB8AF8;
  v9 = *(_QWORD *)(a1 + 72);
  v15 = v6;
  v10 = *(_QWORD *)(a1 + 88);
  v20 = v9;
  v21 = v10;
  v11 = *(NSObject **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = v5;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v12 = v5;
  v13 = v6;
  dispatch_async(v11, block);

}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v2);
    SBLogProactiveAppLibrary();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sb_stripCategoriesThatArentFromProactive");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_37;
    v7[3] = &unk_1E8EB8AD0;
    v4 = *(void **)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    SBLogProactiveAppLibrary();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134217984;
      v11 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshed proactive library category source 'Categories'", buf, 0xCu);
    }

    v3 = v8;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_37(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0C99E10];
  v18 = v5;
  objc_msgSend(v5, "appBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc(MEMORY[0x1E0DAA4D0]);
    v11 = objc_msgSend(v18, "categoryID");
    objc_msgSend(v18, "localizedStringForCategoryID:", objc_msgSend(v18, "categoryID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithPredictionCategoryID:categoryIndex:localizedDisplayName:localizedDisplayNameKey:", v11, a3, v12, 0);

    objc_msgSend(*(id *)(a1 + 40), "addCategoryIdentifier:", v13);
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v9, "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v15, v13);

    v16 = *(void **)(a1 + 40);
    objc_msgSend(v13, "localizedDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLocalizedCategoryName:forCategoryIdentifier:", v17, v13);

  }
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = CFAbsoluteTimeGetCurrent()
                                                                      - *(double *)(a1 + 96);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43;
  v8[3] = &unk_1E8EB8B48;
  v4 = *(_QWORD *)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 88);
  v16 = v4;
  v6 = *(NSObject **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 72);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v2);
    SBLogProactiveAppLibrary();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_4();

  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "_shouldRemoveRecentsPodWithLastKnownRecentApps:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  SBLogProactiveAppLibrary();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 134217984;
    v80 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%ld) Finished refreshing proactive library category source 'Suggestions/Recents/Hidden'", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "recentApps");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject count](v7, "count");
  SBLogProactiveAppLibrary();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 134217984;
      v80 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%ld) Attempting _lastKnownGoodRecentApps update", buf, 0xCu);
    }

    if ((-[NSObject isEqual:](v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)) & 1) != 0)
    {
      SBLogProactiveAppLibrary();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134217984;
        v80 = v13;
        v14 = "(%ld) _lastKnownGoodRecentApps is same; skipping update";
LABEL_19:
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
      }
    }
    else
    {
      v16 = -[NSObject copy](v7, "copy");
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(void **)(v17 + 24);
      *(_QWORD *)(v17 + 24) = v16;

      SBLogProactiveAppLibrary();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134217984;
        v80 = v19;
        v14 = "(%ld) Updated _lastKnownGoodRecentApps";
        goto LABEL_19;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v10)
  {
    v15 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 134217984;
    v80 = v15;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched recents apps has no apps; using last known good recent apps",
      buf,
      0xCu);
  }

  if ((v4 & 1) == 0)
  {
    v12 = v7;
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
    goto LABEL_20;
  }
LABEL_21:
  v20 = (void *)MEMORY[0x1E0C99E40];
  -[NSObject filteredArrayUsingPredicate:](v7, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 48));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "orderedSetWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "categoryIdentifiers");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  getRecentsCategoryIdentifier(v78);
  v23 = objc_claimAutoreleasedReturnValue();
  v76 = v7;
  v77 = v2;
  v75 = v22;
  if (objc_msgSend(v22, "count"))
  {
    SBLogProactiveAppLibrary();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 134218242;
      v80 = v25;
      v81 = 2112;
      v82 = v22;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "(%ld) Received recent apps: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 4);
    objc_msgSend(*(id *)(a1 + 56), "addCategoryIdentifier:", v23);
    v26 = *(void **)(a1 + 56);
    objc_msgSend(v22, "array");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v27, v23);
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 4);
      SBLogProactiveAppLibrary();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134217984;
        v80 = v29;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "(%ld) Removing Recents Pod as the last known recents app is now hidden)", buf, 0xCu);
      }

    }
    SBLogProactiveAppLibrary();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_3();
  }

  getSuggestedCategoryIdentifier(v78);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predictedApps");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = -[NSObject count](v31, "count");
  SBLogProactiveAppLibrary();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v34)
    {
      v35 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 134217984;
      v80 = v35;
      _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "(%ld) Attempting _lastKnownGoodSuggestions update", buf, 0xCu);
    }

    if ((-[NSObject isEqual:](v31, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)) & 1) != 0)
    {
      SBLogProactiveAppLibrary();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134217984;
        v80 = v37;
        v38 = "(%ld) _lastKnownGoodSuggestions is same; skipping update";
LABEL_44:
        _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);
      }
    }
    else
    {
      v43 = -[NSObject copy](v31, "copy");
      v44 = *(_QWORD *)(a1 + 40);
      v45 = *(void **)(v44 + 16);
      *(_QWORD *)(v44 + 16) = v43;

      SBLogProactiveAppLibrary();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v46 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134217984;
        v80 = v46;
        v38 = "(%ld) Updated _lastKnownGoodSuggestions";
        goto LABEL_44;
      }
    }
LABEL_45:

    v36 = v31;
    goto LABEL_46;
  }
  if (v34)
  {
    v39 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 134217984;
    v80 = v39;
    _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched predicted apps has no apps; using last known good recent apps",
      buf,
      0xCu);
  }

  v36 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v40 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  if (v40)
  {
    v41 = v40;
    v42 = objc_msgSend(v40, "BOOLValue");

    if ((v42 & 1) == 0)
    {
      v31 = 0;
      goto LABEL_45;
    }
  }
LABEL_46:
  v47 = (void *)MEMORY[0x1E0C99E40];
  -[NSObject filteredArrayUsingPredicate:](v36, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 48));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "orderedSetWithArray:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend(v49, "count");
  SBLogProactiveAppLibrary();
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = v51;
  v74 = (void *)v30;
  if (v50)
  {
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v53 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 134218242;
      v80 = v53;
      v81 = 2112;
      v82 = v49;
      _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_DEFAULT, "(%ld) Received predicted apps: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 3);
    objc_msgSend(*(id *)(a1 + 56), "addCategoryIdentifier:", v30);
    v54 = *(void **)(a1 + 56);
    objc_msgSend(v49, "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v55, v30);
    goto LABEL_50;
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_2();

  v69 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  if (v69)
  {
    v70 = v69;
    v71 = objc_msgSend(v69, "BOOLValue");

    if ((v71 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "categoryIdentifiers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      getSuggestedCategoryIdentifier(v55);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "removeCategoryIdentifier:", v72);
      objc_msgSend(*(id *)(a1 + 56), "setSortedApplicationIdentifiers:forCategoryIdentifier:", MEMORY[0x1E0C9AA60], v72);

LABEL_50:
    }
  }
  v56 = (void *)v23;
  getHiddenAppsCategoryIdentifier(v78);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hiddenAppsCategory");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "appBundleIDs");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v59, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 48));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "orderedSetWithArray:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = objc_msgSend(v62, "count");
  SBLogProactiveAppLibrary();
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v63)
  {
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v66 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 134218242;
      v80 = v66;
      v81 = 2112;
      v82 = v62;
      _os_log_impl(&dword_1D0540000, v65, OS_LOG_TYPE_DEFAULT, "(%ld) Received hidden apps: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 7);
    objc_msgSend(*(id *)(a1 + 56), "addCategoryIdentifier:", v57);
    v67 = *(void **)(a1 + 56);
    objc_msgSend(v62, "array");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v68, v57);
  }
  else
  {
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "categoryIdentifiers");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    getHiddenAppsCategoryIdentifier(v68);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "removeCategoryIdentifier:", v73);
    objc_msgSend(*(id *)(a1 + 56), "addCategoryIdentifier:", v73);
    objc_msgSend(*(id *)(a1 + 56), "setSortedApplicationIdentifiers:forCategoryIdentifier:", MEMORY[0x1E0C9AA60], v73);

  }
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DAA820]);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_45(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  double Current;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  _QWORD v54[3];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  _BYTE v58[10];
  __int16 v59;
  _BOOL4 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "categoryIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getRecentsCategoryIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getSuggestedCategoryIdentifier(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getHiddenAppsCategoryIdentifier(v3);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "categoryIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v5) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "count") != 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "categoryIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v4) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "count") != 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "categoryIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v6;
  if ((objc_msgSend(v13, "containsObject:", v6) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "count") != 0;

  }
  SBLogProactiveAppLibrary();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 134218752;
    v56 = v17;
    v57 = 1024;
    *(_DWORD *)v58 = v8;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v11;
    v59 = 1024;
    v60 = v14;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "(%ld) Finished refreshing proactive library category source; hasPredictedApps: %{BOOL}d; hasRecentApps: %{BOOL}d h"
      "asHiddenApps: %{BOOL}d",
      buf,
      0x1Eu);
  }

  if (v8 || v11 || v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "categoryIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    v54[0] = v4;
    v54[1] = v5;
    v54[2] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectsInArray:", v20);

    if (v11)
    {
      objc_msgSend(v19, "insertObject:atIndex:", v4, 0);
      SBLogProactiveAppLibrary();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v52 = v3;
        v22 = v5;
        v23 = v2;
        v24 = *(_QWORD *)(a1 + 80);
        objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v56 = v24;
        v2 = v23;
        v5 = v22;
        v3 = v52;
        v57 = 2112;
        *(_QWORD *)v58 = v25;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched Recent apps: %@", buf, 0x16u);

      }
      if (!v8)
      {
LABEL_17:
        SBLogProactiveAppLibrary();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(_QWORD *)(a1 + 80);
          *(_DWORD *)buf = 134217984;
          v56 = v27;
          _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "(%ld) No predicted apps...", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "setSortedApplicationIdentifiers:forCategoryIdentifier:", MEMORY[0x1E0C9AA60], v5);
LABEL_26:
        if (_os_feature_enabled_impl())
        {
          objc_msgSend(v19, "addObject:", v53);
          SBLogProactiveAppLibrary();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v34)
            {
              v35 = *(_QWORD *)(a1 + 80);
              objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v53);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v56 = v35;
              v57 = 2112;
              *(_QWORD *)v58 = v36;
              _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched Hidden apps: %@", buf, 0x16u);

            }
          }
          else
          {
            if (v34)
            {
              v37 = *(_QWORD *)(a1 + 80);
              *(_DWORD *)buf = 134217984;
              v56 = v37;
              _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "(%ld) No Hidden apps...", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "setSortedApplicationIdentifiers:forCategoryIdentifier:", MEMORY[0x1E0C9AA60], v53);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "setCategoryIdentifiers:", v19);

        goto LABEL_35;
      }
    }
    else
    {
      SBLogProactiveAppLibrary();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 134217984;
        v56 = v29;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "(%ld) No recent apps...", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setSortedApplicationIdentifiers:forCategoryIdentifier:", MEMORY[0x1E0C9AA60], v4);
      if (!v8)
        goto LABEL_17;
    }
    objc_msgSend(v19, "insertObject:atIndex:", v5, 0);
    SBLogProactiveAppLibrary();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v56 = v31;
      v57 = 2112;
      *(_QWORD *)v58 = v32;
      _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched Predicted apps: %@", buf, 0x16u);

    }
    goto LABEL_26;
  }
LABEL_35:
  objc_msgSend(*(id *)(a1 + 32), "setMetadata:", *(_QWORD *)(a1 + 40));
  Current = CFAbsoluteTimeGetCurrent();
  v39 = *(double *)(a1 + 88);
  v40 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(_QWORD, _QWORD, id))(v40 + 16))(*(_QWORD *)(a1 + 48), 0, v2);
    v41 = v53;
  }
  else
  {
    v42 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v40 + 16))(v40, v42, 0);

    v43 = *(_QWORD *)(a1 + 96);
    v41 = v53;
    if ((v43 & 4) != 0)
    {
      SBLogProactiveAppLibrary();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(_QWORD *)(a1 + 80);
        v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 134218240;
        v56 = v45;
        v57 = 2048;
        *(_QWORD *)v58 = v46;
        _os_log_impl(&dword_1D0540000, v44, OS_LOG_TYPE_DEFAULT, "(%ld) Query response time for proactive library category source 'Categories' time: %f seconds ", buf, 0x16u);
      }

      v43 = *(_QWORD *)(a1 + 96);
    }
    if ((v43 & 2) != 0)
    {
      SBLogProactiveAppLibrary();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(_QWORD *)(a1 + 80);
        v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        *(_DWORD *)buf = 134218240;
        v56 = v48;
        v57 = 2048;
        *(_QWORD *)v58 = v49;
        _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "(%ld) Query response time for proactive library category source 'Suggestions/Recents' time: %f seconds", buf, 0x16u);
      }

    }
  }
  SBLogProactiveAppLibrary();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 134218240;
    v56 = v51;
    v57 = 2048;
    *(double *)v58 = Current - v39;
    _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_DEFAULT, "(%ld) Total query response time for proactive library queries time: %f seconds", buf, 0x16u);
  }

}

- (BOOL)_shouldRemoveRecentsPodWithLastKnownRecentApps:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "count") != 1)
    goto LABEL_4;
  v4 = (void *)MEMORY[0x1E0CF9688];
  objc_msgSend(v3, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isHidden");
  if ((v5 & 1) != 0)
    v7 = 1;
  else
LABEL_4:
    v7 = 0;

  return v7;
}

- (void)handleUpdateCategoriesNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogProactiveAppLibrary();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Proactive is requesting a refresh all because of notification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[SBProactiveLibraryCategoryMapProviderSource delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestLibraryCategoryMapUpdateWithRefreshOptions:source:", 6, self);

}

- (SBHLibraryCategoryMapProviderSourceDelegate)delegate
{
  return (SBHLibraryCategoryMapProviderSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastKnownGoodRecentApps, 0);
  objc_storeStrong((id *)&self->_lastKnownGoodSuggestions, 0);
  objc_storeStrong((id *)&self->_appDirectoryClient, 0);
}

- (void)requestLibraryCategoryMapWithOptions:(uint64_t)a3 existingLibraryCategoryMap:(uint64_t)a4 forbiddenApplicationIdentifiers:(uint64_t)a5 sessionId:(uint64_t)a6 queue:(uint64_t)a7 completion:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "(%ld) existing category map has no apps hydrated; we're going to hydrate them by forcing a categories apps update wh"
    "en one wasn't explicitly requested. ",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_2_0();
}

- (void)requestLibraryCategoryMapWithOptions:(uint64_t)a3 existingLibraryCategoryMap:(uint64_t)a4 forbiddenApplicationIdentifiers:(uint64_t)a5 sessionId:(uint64_t)a6 queue:(uint64_t)a7 completion:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "(%ld) !!!!!!!!!!!!!!!! We failed to populate default suggestions, going with stale lame set of apps we know the user has.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)requestLibraryCategoryMapWithOptions:(uint64_t)a3 existingLibraryCategoryMap:(uint64_t)a4 forbiddenApplicationIdentifiers:(uint64_t)a5 sessionId:(uint64_t)a6 queue:(uint64_t)a7 completion:(uint64_t)a8 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "(%ld) Timed out trying to retrieve default suggestions / recent apps", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "(%ld) Error refreshing proactive library category source 'Categories': %@");
  OUTLINED_FUNCTION_2_0();
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "(%ld) No hidden apps received!", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "(%ld) No predicted apps received!", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "(%ld) No recent apps received!", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_43_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "(%ld) Error refreshing proactive library category source 'Suggestions/Recents/Hidden': %@");
  OUTLINED_FUNCTION_2_0();
}

@end
