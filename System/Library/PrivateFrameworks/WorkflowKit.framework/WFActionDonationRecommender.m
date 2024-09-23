@implementation WFActionDonationRecommender

- (WFActionDonationRecommender)init
{
  WFActionDonationRecommender *v2;
  uint64_t v3;
  NSMutableDictionary *cachedDonationsPerApp;
  uint64_t v5;
  NSMutableDictionary *cachedActionPredictionsPerApp;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  void *v10;
  WFActionDonationRecommender *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFActionDonationRecommender;
  v2 = -[WFActionDonationRecommender init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedDonationsPerApp = v2->_cachedDonationsPerApp;
    v2->_cachedDonationsPerApp = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    cachedActionPredictionsPerApp = v2->_cachedActionPredictionsPerApp;
    v2->_cachedActionPredictionsPerApp = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.shortcuts.WFActionDonationRecommender.fetchRecommendedDonations", v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addApplicationStateObserver:forEvent:", v2, 0);

    v11 = v2;
  }

  return v2;
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  void *v5;
  id v6;

  if (!a4)
  {
    -[WFActionDonationRecommender setCachedDonationsForAllApps:](self, "setCachedDonationsForAllApps:", 0);
    -[WFActionDonationRecommender cachedDonationsPerApp](self, "cachedDonationsPerApp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[WFActionDonationRecommender setCachedActionPredictionsForAllApps:](self, "setCachedActionPredictionsForAllApps:", 0);
    -[WFActionDonationRecommender cachedActionPredictionsPerApp](self, "cachedActionPredictionsPerApp");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

  }
}

- (NSSet)excludedAppBundleIdentifiers
{
  NSSet *excludedAppBundleIdentifiers;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  excludedAppBundleIdentifiers = self->_excludedAppBundleIdentifiers;
  if (!excludedAppBundleIdentifiers)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    +[WFActionDonationRecommender disabledSpotlightApps](WFActionDonationRecommender, "disabledSpotlightApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithSet:", v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();

    -[NSSet addObject:](v6, "addObject:", *MEMORY[0x1E0DC7FA0]);
    -[NSSet addObject:](v6, "addObject:", *MEMORY[0x1E0DC7F88]);
    -[NSSet addObject:](v6, "addObject:", *MEMORY[0x1E0DC7F68]);
    v7 = self->_excludedAppBundleIdentifiers;
    self->_excludedAppBundleIdentifiers = v6;

    excludedAppBundleIdentifiers = self->_excludedAppBundleIdentifiers;
  }
  return excludedAppBundleIdentifiers;
}

- (void)cacheRecentDonations:(id)a3 forApplicationBundleIdentifier:(id)a4 ballpark:(unint64_t)a5
{
  id v8;
  WFCachedDonations *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a3;
  v9 = -[WFCachedDonations initWithDonations:ballpark:]([WFCachedDonations alloc], "initWithDonations:ballpark:", v8, a5);

  if (v11)
  {
    -[WFActionDonationRecommender cachedDonationsPerApp](self, "cachedDonationsPerApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  else
  {
    -[WFActionDonationRecommender setCachedDonationsForAllApps:](self, "setCachedDonationsForAllApps:", v9);
  }

}

- (void)cacheActionPredictionDonations:(id)a3 forApplicationBundleIdentifier:(id)a4 ballpark:(unint64_t)a5
{
  id v8;
  WFCachedDonations *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a3;
  v9 = -[WFCachedDonations initWithDonations:ballpark:]([WFCachedDonations alloc], "initWithDonations:ballpark:", v8, a5);

  if (v11)
  {
    -[WFActionDonationRecommender cachedActionPredictionsPerApp](self, "cachedActionPredictionsPerApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  else
  {
    -[WFActionDonationRecommender setCachedActionPredictionsForAllApps:](self, "setCachedActionPredictionsForAllApps:", v9);
  }

}

- (NSArray)defaultRecommendations
{
  NSArray *defaultRecommendations;
  NSArray *v4;
  NSArray *v5;

  defaultRecommendations = self->_defaultRecommendations;
  if (!defaultRecommendations)
  {
    +[WFActionDonationDefaultsRecommender defaultRecommendations](WFActionDonationDefaultsRecommender, "defaultRecommendations");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultRecommendations;
    self->_defaultRecommendations = v4;

    defaultRecommendations = self->_defaultRecommendations;
  }
  return defaultRecommendations;
}

- (void)fetchDonationsWithLimit:(unint64_t)a3 applicationBundleIdentifier:(id)a4 includeSuggestedForAllApps:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD block[6];
  _QWORD aBlock[5];
  id v19;
  id v20;
  unint64_t v21;
  BOOL v22;

  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AEB628;
  aBlock[4] = self;
  v19 = v10;
  v22 = a5;
  v20 = v11;
  v21 = a3;
  v13 = v11;
  v14 = v10;
  v15 = _Block_copy(aBlock);
  -[WFActionDonationRecommender workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_2;
  block[3] = &unk_1E7AF76F0;
  block[4] = self;
  block[5] = v15;
  dispatch_async(v16, block);

}

- (void)_fetchDonationsWithLimit:(unint64_t)a3 applicationBundleIdentifier:(id)a4 includeSuggestedForAllApps:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  id v82;
  unint64_t v83;
  NSObject *group;
  WFActionDonationRecommender *v85;
  void *v86;
  _QWORD aBlock[5];
  id v88;
  id v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t *v93;
  unint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  id v104;
  _QWORD v105[5];
  id v106;
  NSObject *v107;
  __int128 *p_buf;
  uint64_t *v109;
  os_signpost_id_t v110;
  unint64_t v111;
  _QWORD v112[5];
  id v113;
  NSObject *v114;
  uint64_t *v115;
  uint64_t *v116;
  os_signpost_id_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  id *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  _BYTE v147[128];
  _BYTE v148[128];
  id v149;
  uint8_t v150[4];
  const char *v151;
  __int16 v152;
  uint64_t v153;
  __int128 buf;
  uint64_t v155;
  char v156;
  uint64_t v157;

  v7 = a5;
  v157 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v82 = a6;
  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = __Block_byref_object_copy__4690;
  v145 = __Block_byref_object_dispose__4691;
  v146 = 0;
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__4690;
  v139 = __Block_byref_object_dispose__4691;
  v140 = 0;
  v129 = 0;
  v130 = (id *)&v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__4690;
  v133 = __Block_byref_object_dispose__4691;
  v134 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__4690;
  v127 = __Block_byref_object_dispose__4691;
  v128 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v83 = a3;
  group = dispatch_group_create();
  if (2 * a3 <= 0x32)
    v11 = 50;
  else
    v11 = 2 * a3;
  v85 = self;
  v86 = v10;
  if (v10)
  {
    -[WFActionDonationRecommender cachedDonationsPerApp](self, "cachedDonationsPerApp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFActionDonationRecommender cachedDonationsForAllApps](self, "cachedDonationsForAllApps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81 = v13;
  if (v13 && objc_msgSend(v13, "isValidWithBallpark:", v11))
  {
    objc_msgSend(v13, "donations");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v142[5];
    v142[5] = v14;

    *((_BYTE *)v120 + 24) = 1;
  }
  else
  {
    dispatch_group_enter(group);
    getWFActionDonationsLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);

    getWFActionDonationsLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchRecentDonations", "appIdentifier=%{signpost.telemetry:string1, Name=AppID}@", (uint8_t *)&buf, 0xCu);
    }

    v20 = (void *)MEMORY[0x1E0DC7930];
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke;
    v112[3] = &unk_1E7AEB650;
    v116 = &v141;
    v117 = v17;
    v115 = &v119;
    v112[4] = self;
    v113 = v10;
    v118 = v11;
    v114 = group;
    objc_msgSend(v20, "fetchDonationsForApplicationBundleIdentifier:limit:filteringForTopLevel:filteringForIsEligibleForPrediction:filteringForRecent:completion:", v113, v11, 0, 1, 1, v112);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v155 = 0x2020000000;
  v156 = 0;
  if (v10)
  {
    -[WFActionDonationRecommender cachedActionPredictionsPerApp](self, "cachedActionPredictionsPerApp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFActionDonationRecommender cachedActionPredictionsForAllApps](self, "cachedActionPredictionsForAllApps");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80 = v22;
  if (v22 && objc_msgSend(v22, "isValidWithBallpark:", v83))
  {
    objc_msgSend(v22, "donations");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v136[5];
    v136[5] = v23;

    *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 1;
  }
  else
  {
    dispatch_group_enter(group);
    getWFActionDonationsLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_signpost_id_generate(v25);

    getWFActionDonationsLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)v150 = 134218242;
      v151 = (const char *)v83;
      v152 = 2112;
      v153 = (uint64_t)v10;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "FetchPredictedDonations", "limit=%{signpost.telemetry:number1, Name=Limit}lu appIdentifier=%{signpost.telemetry:string1, Name=AppID}@", v150, 0x16u);
    }

    v29 = objc_alloc_init(getATXActionPredictionClientClass());
    if (v10)
    {
      v149 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_137;
    v105[3] = &unk_1E7AEB678;
    v109 = &v135;
    v110 = v26;
    p_buf = &buf;
    v105[4] = self;
    v106 = v10;
    v111 = v83;
    v107 = group;
    objc_msgSend(v29, "getActionPredictionsForCandidateBundleIdentifiers:candidateActionTypes:consumerType:consumerSubType:limit:reply:", v30, 0, 8, 23, v83, v105);

  }
  v31 = (void *)MEMORY[0x1E0C9AA60];
  if (!v10)
  {
    v40 = v130[5];
    v130[5] = (id)MEMORY[0x1E0C9AA60];

    if (!v7)
      goto LABEL_60;
    v41 = objc_opt_new();
    v42 = (void *)v124[5];
    v124[5] = v41;

    +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    objc_msgSend(v43, "shortcutSuggestionsForAllAppsWithLimit:shortcutAvailability:error:", 4, 0, &v103);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v103;

    getWFActionDonationsLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v44)
    {
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v47 = objc_msgSend(v44, "count");
        *(_DWORD *)v150 = 136315394;
        v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAll"
               "Apps:completionHandler:]";
        v152 = 2048;
        v153 = v47;
        v48 = "%s Successfully fetched %lu suggested donations from all apps";
        v49 = v46;
        v50 = OS_LOG_TYPE_INFO;
LABEL_47:
        _os_log_impl(&dword_1C15B3000, v49, v50, v48, v150, 0x16u);
      }
    }
    else if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v150 = 136315394;
      v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllAp"
             "ps:completionHandler:]";
      v152 = 2114;
      v153 = (uint64_t)v34;
      v48 = "%s Error getting voice shortcut suggestions for all apps: %{public}@";
      v49 = v46;
      v50 = OS_LOG_TYPE_ERROR;
      goto LABEL_47;
    }

    -[WFActionDonationRecommender excludedAppBundleIdentifiers](self, "excludedAppBundleIdentifiers");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v33 = v44;
    v53 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v99, v148, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v100 != v54)
            objc_enumerationMutation(v33);
          v56 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          if ((objc_msgSend(v52, "containsObject:", v56) & 1) == 0)
          {
            objc_msgSend(v33, "objectForKeyedSubscript:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            VCActionDonationArrayFromINShortcutArray(v57, v56);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v124[5], "setObject:forKeyedSubscript:", v58, v56);

          }
        }
        v53 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v99, v148, 16);
      }
      while (v53);
    }

    goto LABEL_58;
  }
  +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  objc_msgSend(v32, "shortcutSuggestionsForAppWithBundleIdentifier:shortcutAvailability:error:", v10, 0, &v104);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v104;

  getWFActionDonationsLogObject();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v34)
  {
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_DWORD *)v150 = 136315394;
    v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps"
           ":completionHandler:]";
    v152 = 2114;
    v153 = (uint64_t)v34;
    v37 = "%s Error getting voice shortcut suggestions: %{public}@";
    v38 = v36;
    v39 = OS_LOG_TYPE_ERROR;
    goto LABEL_39;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v51 = objc_msgSend(v130[5], "count");
    *(_DWORD *)v150 = 136315394;
    v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps"
           ":completionHandler:]";
    v152 = 2048;
    v153 = v51;
    _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_INFO, "%s Successfully fetched suggested donations with donation count: %lu", v150, 0x16u);
  }

  getWFActionDonationsLogObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v150 = 136315394;
    v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps"
           ":completionHandler:]";
    v152 = 2114;
    v153 = (uint64_t)v10;
    v37 = "%s for applicationBundleIdentifier: %{public}@";
    v38 = v36;
    v39 = OS_LOG_TYPE_DEBUG;
LABEL_39:
    _os_log_impl(&dword_1C15B3000, v38, v39, v37, v150, 0x16u);
  }
LABEL_40:

  if (v33)
  {
    VCActionDonationArrayFromINShortcutArray(v33, v10);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_storeStrong(v130 + 5, v52);
  if (v33)
  {
LABEL_58:

    goto LABEL_59;
  }
  v33 = 0;
LABEL_59:

LABEL_60:
  -[WFActionDonationRecommender defaultRecommendations](v85, "defaultRecommendations");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionDonationRecommender filteredActionDonations:byApplicationAppIdentifier:](WFActionDonationRecommender, "filteredActionDonations:byApplicationAppIdentifier:", v59, v86);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v60, "count"))
  {
    objc_msgSend(v130[5], "arrayByAddingObjectsFromArray:", v60);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v130[5];
    v130[5] = (id)v61;

    getWFActionDonationsLogObject();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      v64 = objc_msgSend(v60, "count");
      *(_DWORD *)v150 = 136315394;
      v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllAp"
             "ps:completionHandler:]";
      v152 = 2048;
      v153 = v64;
      _os_log_impl(&dword_1C15B3000, v63, OS_LOG_TYPE_INFO, "%s Adding %lu default recommended donations", v150, 0x16u);
    }

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v65 = v60;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v95, v147, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v96;
      do
      {
        for (j = 0; j != v66; ++j)
        {
          if (*(_QWORD *)v96 != v67)
            objc_enumerationMutation(v65);
          v69 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
          objc_msgSend(v69, "sourceAppIdentifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v124[5], "objectForKeyedSubscript:", v70);
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v71;
          if (v71)
            v73 = (void *)v71;
          else
            v73 = v31;
          v74 = v73;

          objc_msgSend(v74, "arrayByAddingObject:", v69);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v124[5], "setObject:forKeyedSubscript:", v75, v70);
        }
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v95, v147, 16);
      }
      while (v66);
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_140;
  aBlock[3] = &unk_1E7AEB6A0;
  v94 = v83;
  aBlock[4] = v85;
  v90 = &v141;
  v91 = &v135;
  v92 = &v129;
  v76 = v86;
  v88 = v76;
  v77 = v82;
  v89 = v77;
  v93 = &v123;
  v78 = _Block_copy(aBlock);
  -[WFActionDonationRecommender workQueue](v85, "workQueue");
  v79 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(group, v79, v78);

  -[WFActionDonationRecommender setActiveFetchGroup:](v85, "setActiveFetchGroup:", group);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
}

- (void)fetchRecommendedDonationsForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  uint64_t v17;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDonationRecommender.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  if (v7)
    v9 = 30;
  else
    v9 = 150;
  -[WFActionDonationRecommender excludedAppBundleIdentifiers](self, "excludedAppBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 && objc_msgSend(v10, "containsObject:", v7))
  {
    v8[2](v8, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __105__WFActionDonationRecommender_fetchRecommendedDonationsForApplicationBundleIdentifier_completionHandler___block_invoke;
    v13[3] = &unk_1E7AEB6C8;
    v14 = v11;
    v17 = v9;
    v15 = v7;
    v16 = v8;
    -[WFActionDonationRecommender fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:completionHandler:](self, "fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:completionHandler:", v9, v15, 0, v13);

  }
}

- (void)fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7AEB808;
  v7 = v4;
  v8 = 150;
  v6[4] = self;
  v5 = v4;
  -[WFActionDonationRecommender fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:completionHandler:](self, "fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:completionHandler:", 150, 0, 1, v6);

}

- (OS_dispatch_group)activeFetchGroup
{
  return self->_activeFetchGroup;
}

- (void)setActiveFetchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_activeFetchGroup, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (WFCachedDonations)cachedDonationsForAllApps
{
  return self->_cachedDonationsForAllApps;
}

- (void)setCachedDonationsForAllApps:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDonationsForAllApps, a3);
}

- (NSMutableDictionary)cachedDonationsPerApp
{
  return self->_cachedDonationsPerApp;
}

- (void)setCachedDonationsPerApp:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDonationsPerApp, a3);
}

- (WFCachedDonations)cachedActionPredictionsForAllApps
{
  return self->_cachedActionPredictionsForAllApps;
}

- (void)setCachedActionPredictionsForAllApps:(id)a3
{
  objc_storeStrong((id *)&self->_cachedActionPredictionsForAllApps, a3);
}

- (NSMutableDictionary)cachedActionPredictionsPerApp
{
  return self->_cachedActionPredictionsPerApp;
}

- (void)setCachedActionPredictionsPerApp:(id)a3
{
  objc_storeStrong((id *)&self->_cachedActionPredictionsPerApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedActionPredictionsPerApp, 0);
  objc_storeStrong((id *)&self->_cachedActionPredictionsForAllApps, 0);
  objc_storeStrong((id *)&self->_cachedDonationsPerApp, 0);
  objc_storeStrong((id *)&self->_cachedDonationsForAllApps, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activeFetchGroup, 0);
  objc_storeStrong((id *)&self->_excludedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultRecommendations, 0);
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, void *);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  __int128 v80;
  __int128 v81;
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
  _QWORD aBlock[4];
  id v93;
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v63 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E7AEB6F0;
  v66 = v9;
  v93 = v66;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v89 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        objc_msgSend(v16, "sourceAppIdentifierForDisplay");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "predictedActions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v13);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v85 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
        objc_msgSend(v25, "sourceAppIdentifierForDisplay");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "recentActions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
    }
    while (v22);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v29 = v63;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v81 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
        v10[2](v10, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appSuggestedActions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v37);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
    }
    while (v31);
  }

  getWFActionDonationsLogObject();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = a1[6];
    v40 = objc_msgSend(v66, "count");
    *(_DWORD *)buf = 136315650;
    v95 = "-[WFActionDonationRecommender fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:]_block_invoke";
    v96 = 2048;
    v97 = v39;
    v98 = 2048;
    v99 = v40;
    _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_INFO, "%s Successfully processed donations with limit: %lu,final app count: %lu", buf, 0x20u);
  }

  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_153;
  v78[3] = &unk_1E7AEB768;
  v78[4] = a1[4];
  v79 = v41;
  v43 = v41;
  objc_msgSend(v66, "enumerateKeysAndObjectsUsingBlock:", v78);
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v76[0] = v42;
  v76[1] = 3221225472;
  v76[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4;
  v76[3] = &unk_1E7AEB790;
  v76[4] = a1[4];
  v45 = v44;
  v77 = v45;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v76);

  v46 = v45;
  getWFActionDonationsLogObject();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = a1[6];
    v49 = objc_msgSend(v46, "count");
    *(_DWORD *)buf = 136315650;
    v95 = "-[WFActionDonationRecommender fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:]_block_invoke_5";
    v96 = 2048;
    v97 = v48;
    v98 = 2048;
    v99 = v49;
    _os_log_impl(&dword_1C15B3000, v47, OS_LOG_TYPE_INFO, "%s Successfully processed donations with limit: %lu, final app count: %lu", buf, 0x20u);
  }

  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[objc_class clientForConsumerType:](getATXClientClass(), "clientForConsumerType:", 13);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "appPredictionsForConsumerSubType:limit:", 33, 8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "predictedApps");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_160;
  v74[3] = &unk_1E7AF9D28;
  v54 = v51;
  v75 = v54;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:", v74);

  v72[0] = v53;
  v72[1] = 3221225472;
  v72[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_163;
  v72[3] = &unk_1E7AEB7B8;
  v73 = v54;
  v61 = v54;
  v55 = _Block_copy(v72);
  objc_msgSend(v46, "allKeys");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v53;
  v70[1] = 3221225472;
  v70[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3_165;
  v70[3] = &unk_1E7AEB7E0;
  v71 = v55;
  v57 = v55;
  objc_msgSend(v56, "sortedArrayUsingComparator:", v70);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v53;
  v67[1] = 3221225472;
  v67[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4_167;
  v67[3] = &unk_1E7AF9E58;
  v68 = v50;
  v69 = v46;
  v59 = v46;
  v60 = v50;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v67);

  (*(void (**)(void))(a1[5] + 16))();
}

id __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  BOOL v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  v4 = a3;
  v35 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v36 = v4;
  v37 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v4, "recentActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "interaction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "intent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          VCIntentsForAllPossibleParameterCombinationsOfIntent(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_154;
          v43[3] = &unk_1E7AEB718;
          v44 = v38;
          v45 = v5;
          v46 = v37;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v43);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "appSuggestedActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v35;
    objc_msgSend(v35, "addObject:", v16);

    objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  else
  {
    v17 = v35;
  }
  if (objc_msgSend(v15, "count"))
    v19 = 1;
  else
    v19 = 2;
  objc_msgSend(v4, "predictedActions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v19 >= v21)
    v22 = v21;
  else
    v22 = v19;
  objc_msgSend(v4, "predictedActions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subarrayWithRange:", 0, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v24);

  objc_msgSend(v17, "addObjectsFromArray:", v5);
  objc_msgSend(*(id *)(a1 + 32), "excludedAppBundleIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:](WFActionDonationRecommender, "donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:", v17, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "count");
  v28 = v22 != 0;
  if (v22)
    v29 = (4 - v27) & ~((4 - v27) >> 63);
  else
    v29 = ((4 - v27) & ~((4 - v27) >> 63)) + 1;
  v30 = objc_msgSend(v15, "count");
  if (v30 >= v29)
    v31 = v29;
  else
    v31 = v30;
  objc_msgSend(v15, "subarrayWithRange:", 0, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3;
  v39[3] = &unk_1E7AEB740;
  v42 = v28;
  v40 = v26;
  v41 = v31;
  v33 = v26;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v39);
  objc_msgSend(v33, "addObjectsFromArray:", v37);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v33, v38);

}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "excludedAppBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:](WFActionDonationRecommender, "donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_160(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

uint64_t __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_163(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

uint64_t __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3_165(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v8 = v6(v5, a2);
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v8 - v9;
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4_167(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_154(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  VCInteractionDonationFromINIntent(a2, *(void **)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  v6 = 48;
  if (!a3)
    v6 = 40;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v5);

}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (*(_QWORD *)(a1 + 40) - 1 == a3 && ((v6 = v5, a3) || *(_BYTE *)(a1 + 48))
    || (v7 = a3 + 1, v8 = objc_msgSend(*(id *)(a1 + 32), "count"), v6 = v9, v8 < v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v9, v7);
  }

}

void __105__WFActionDonationRecommender_fetchRecommendedDonationsForApplicationBundleIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v43 = a3;
  v42 = a4;
  v45 = (void *)objc_msgSend(v6, "mutableCopy");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v53;
    v44 = *(_QWORD *)v53;
    do
    {
      v10 = 0;
      v46 = v8;
      do
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "interaction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "intent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          VCIntentsForAllPossibleParameterCombinationsOfIntent(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_opt_new();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v16 = v14;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v49 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                objc_msgSend(v11, "sourceAppIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                VCInteractionDonationFromINIntent(v21, v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v15, "addObject:", v23);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
            }
            while (v18);
          }

          objc_msgSend(v45, "replaceObjectsInRange:withObjectsFromArray:", objc_msgSend(v45, "indexOfObject:", v11), 1, v15);
          v9 = v44;
          v8 = v46;
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v8);
  }

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = a1;
  +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:](WFActionDonationRecommender, "donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:", v43, a1[4], 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  if (v27 >= 2)
    v28 = 2;
  else
    v28 = v27;
  objc_msgSend(v26, "subarrayWithRange:", 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v42);
  objc_msgSend(v24, "addObjectsFromArray:", v29);
  objc_msgSend(v24, "addObjectsFromArray:", v45);
  +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:](WFActionDonationRecommender, "donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:includingSingleDonationPerApp:", v24, a1[4], 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  getWFActionDonationsLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = a1[7];
    v33 = objc_msgSend(v30, "count");
    *(_DWORD *)buf = 136315650;
    v57 = "-[WFActionDonationRecommender fetchRecommendedDonationsForApplicationBundleIdentifier:completionHandler:]_block_invoke";
    v58 = 2048;
    v59 = v32;
    v25 = a1;
    v60 = 2048;
    v61 = v33;
    _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_INFO, "%s Successfully processed recommended donations with limit: %lu, count: %lu", buf, 0x20u);
  }

  getWFActionDonationsLogObject();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = v25[5];
    *(_DWORD *)buf = 136315394;
    v57 = "-[WFActionDonationRecommender fetchRecommendedDonationsForApplicationBundleIdentifier:completionHandler:]_block_invoke";
    v58 = 2114;
    v59 = v35;
    _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", buf, 0x16u);
  }

  v36 = v25[6];
  v37 = v25[7];
  v38 = objc_msgSend(v30, "count");
  if (v37 >= v38)
    v39 = v38;
  else
    v39 = v37;
  objc_msgSend(v30, "subarrayWithRange:", 0, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v40);

}

void __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  getWFActionDonationsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Got duplicate callback from donations fetching. Ignoring duplicate callback.", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 72);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v7, OS_SIGNPOST_INTERVAL_END, v8, "FetchRecentDonations", ", (uint8_t *)&v13, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "cacheRecentDonations:forApplicationBundleIdentifier:ballpark:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
    getWFActionDonationsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v4, "count");
      v13 = 136315394;
      v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Successfully fetched recent donations with donation count: %lu", (uint8_t *)&v13, 0x16u);
    }

    getWFActionDonationsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 136315394;
      v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_137(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[WFActionDonationRecommender getDonationsFromActionResponse:](WFActionDonationRecommender, "getDonationsFromActionResponse:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  getWFActionDonationsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Got duplicate callback from predicted donations fetching. Ignoring duplicate callback.", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 72);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v6, OS_SIGNPOST_INTERVAL_END, v7, "FetchPredictedDonations", ", (uint8_t *)&v13, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "cacheActionPredictionDonations:forApplicationBundleIdentifier:ballpark:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
    getWFActionDonationsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 80);
      v10 = objc_msgSend(v3, "count");
      v13 = 136315650;
      v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      v15 = 2048;
      v16 = v9;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Successfully fetched predicted donations with ballpark: %lu, donation count: %lu", (uint8_t *)&v13, 0x20u);
    }

    getWFActionDonationsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 136315394;
      v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

uint64_t __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_140(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setActiveFetchGroup:", 0);
  getWFActionDonationsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 88);
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
    v10 = 136316162;
    v11 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:"
          "completionHandler:]_block_invoke";
    v12 = 2048;
    v13 = v3;
    v14 = 2048;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s Successfully fetched recommended donations with ballpark: %lu, recent count: %lu, predicted count: %lu, suggested count: %lu", (uint8_t *)&v10, 0x34u);
  }

  getWFActionDonationsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 136315394;
    v11 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:"
          "completionHandler:]_block_invoke";
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

void __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *group;

  objc_msgSend(*(id *)(a1 + 32), "activeFetchGroup");
  group = objc_claimAutoreleasedReturnValue();
  if (group)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(group, v2, *(dispatch_block_t *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (WFActionDonationRecommender)sharedRecommender
{
  if (sharedRecommender_onceToken != -1)
    dispatch_once(&sharedRecommender_onceToken, &__block_literal_global_4738);
  return (WFActionDonationRecommender *)(id)sharedRecommender_sharedRecommender;
}

+ (id)donationsByRemovingDuplicatesFromDonations:(id)a3 excludingAppIdentifiers:(id)a4 includingSingleDonationPerApp:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        objc_msgSend(v13, "sourceAppIdentifierForDisplay");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          getWFActionDonationsLogObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "fullDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v33 = "+[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:inclu"
                  "dingSingleDonationPerApp:]";
            v34 = 2112;
            v35 = v17;
            _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Skipping donation with unexpected nil sourceAppIdentifier. Donation: %@", buf, 0x16u);

          }
          goto LABEL_12;
        }
        objc_msgSend(v13, "uniqueProperty");
        v15 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v15))
          goto LABEL_12;
        objc_msgSend(v13, "sourceAppIdentifierForDisplay");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "containsObject:", v16))
        {

LABEL_12:
          goto LABEL_13;
        }
        if (a5)
        {
          v18 = objc_msgSend(v25, "containsObject:", v14);

          if ((v18 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
        objc_msgSend(v13, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          objc_msgSend(v13, "uniqueProperty");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v21);

          objc_msgSend(v25, "addObject:", v14);
          objc_msgSend(v24, "addObject:", v13);
        }
LABEL_13:

        ++v12;
      }
      while (v10 != v12);
      v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      v10 = v22;
    }
    while (v22);
  }

  return v24;
}

+ (id)filteredActionDonations:(id)a3 byApplicationAppIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__WFActionDonationRecommender_filteredActionDonations_byApplicationAppIdentifier___block_invoke;
    v12[3] = &unk_1E7AEB830;
    v13 = v6;
    objc_msgSend(v8, "predicateWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (id)filterDonationsForTitleLength:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_171);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getDonationsFromActionResponse:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = v3;
  objc_msgSend(v3, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    v35 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
        objc_msgSend(v10, "actionUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v14 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v10, "userActivity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_alloc(MEMORY[0x1E0DC7948]);
          objc_msgSend(v10, "userActivity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bundleId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v17, "initWithUserActivity:identifier:sourceAppIdentifier:date:", v18, v14, v19, v20);

          if (v21)
            objc_msgSend(v4, "addObject:", v21);
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(v10, "intent");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          objc_msgSend(v10, "heuristic");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          if (!v25)
          {
            objc_msgSend(v10, "intent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            VCIntentsForAllPossibleParameterCombinationsOfIntent(v26);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v36, 0);
            v28 = objc_alloc(MEMORY[0x1E0DC7938]);
            objc_msgSend(v10, "bundleId");
            v29 = v4;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v28, "initWithIdentifier:sourceAppIdentifier:interaction:", v14, v30, v27);

            v4 = v29;
            if (v31)
              objc_msgSend(v29, "addObject:", v31);

            v5 = v35;
            goto LABEL_12;
          }
        }
LABEL_13:

        ++v9;
      }
      while (v7 != v9);
      v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v7 = v32;
    }
    while (v32);
  }

  return v4;
}

+ (id)disabledSpotlightApps
{
  return softLinkSPGetDisabledAppSet();
}

BOOL __61__WFActionDonationRecommender_filterDonationsForTitleLength___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

uint64_t __82__WFActionDonationRecommender_filteredActionDonations_byApplicationAppIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sourceAppIdentifierForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __48__WFActionDonationRecommender_sharedRecommender__block_invoke()
{
  WFActionDonationRecommender *v0;
  void *v1;

  v0 = objc_alloc_init(WFActionDonationRecommender);
  v1 = (void *)sharedRecommender_sharedRecommender;
  sharedRecommender_sharedRecommender = (uint64_t)v0;

}

@end
