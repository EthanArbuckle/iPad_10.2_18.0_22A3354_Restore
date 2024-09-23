@implementation PPUniversalSearchFeedbackListener

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  PPUniversalSearchFeedbackListener *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  unint64_t i;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t k;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t m;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  PPSpotlightSessionState *sessionState;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  NSObject *log;
  os_log_t loga;
  void *v91;
  void *v92;
  id v93;
  _QWORD v94[6];
  uint8_t buf[4];
  id v96;
  __int16 v97;
  int64_t v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  v5 = self;
  objc_sync_enter(v5);
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_opt_new();
    objc_msgSend(v45, "processName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v96 = v44;
    v97 = 2112;
    v98 = (int64_t)v46;
    _os_log_debug_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_DEBUG, "Feedback from bundleId:%@, process:%@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if ((v9 & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pp_private_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v96 = v93;
        v97 = 2048;
        v98 = a4;
        _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, visible result feedback:%@, queryId:%lld", buf, 0x16u);
      }

      v11 = v93;
      for (i = 0; ; ++i)
      {
        objc_msgSend(v11, "results");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = i < objc_msgSend(v13, "count");

        if (!v14)
          goto LABEL_62;
        v15 = (void *)MEMORY[0x18D7805AC]();
        objc_msgSend(v11, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "resultBundleId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.mobilemail")))
        {

        }
        else
        {
          objc_msgSend(v17, "resultBundleId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

          if (!v20)
            goto LABEL_17;
        }
        objc_msgSend(v17, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length") == 0;

        if (v22)
        {
          pp_default_log_handle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18BE3A000, v25, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: Received Feedback on SFSearchResult with empty or nil identifier", buf, 2u);
          }
        }
        else
        {
          -[PPSpotlightSessionState seenSpotlightIds](v5->_sessionState, "seenSpotlightIds");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v24);

          -[PPSpotlightSessionState seenBundleIds](v5->_sessionState, "seenBundleIds");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "resultBundleId");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v25, "addObject:", v26);

        }
LABEL_17:

        objc_autoreleasePoolPop(v15);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pp_private_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v96 = v93;
        v97 = 2048;
        v98 = a4;
        _os_log_debug_impl(&dword_18BE3A000, v27, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, clearing intermediates at local search feedback:%@, queryId:%lld", buf, 0x16u);
      }

      -[PPSpotlightSessionState seenBundleIds](v5->_sessionState, "seenBundleIds");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeAllObjects");

      -[PPSpotlightSessionState seenSpotlightIds](v5->_sessionState, "seenSpotlightIds");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");
      goto LABEL_62;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pp_private_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v96 = v93;
        v97 = 2048;
        v98 = a4;
        _os_log_debug_impl(&dword_18BE3A000, v29, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, engagement feedback:%@, queryId:%lld", buf, 0x16u);
      }

      v11 = v93;
      objc_msgSend(v11, "result");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "resultBundleId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.mobilemail")))
      {

      }
      else
      {
        objc_msgSend(v91, "resultBundleId");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

        if (!v48)
        {
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
      }
      objc_msgSend(v91, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "length") == 0;

      if (!v50)
      {
        -[PPSpotlightSessionState engagedSpotlightIds](v5->_sessionState, "engagedSpotlightIds");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v52);

        -[PPSpotlightSessionState engagedBundleIds](v5->_sessionState, "engagedBundleIds");
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "resultBundleId");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](loga, "addObject:", v53);

        goto LABEL_61;
      }
      pp_default_log_handle();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18BE3A000, log, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: Received Feedback on SFSearchResult with empty or nil identifier", buf, 2u);
      }
LABEL_60:

      goto LABEL_61;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pp_private_log_handle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v96 = v93;
        v97 = 2048;
        v98 = a4;
        _os_log_debug_impl(&dword_18BE3A000, v31, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, search view disappear feedback:%@, queryId:%lld", buf, 0x16u);
      }

      v11 = (id)objc_opt_new();
      v91 = (void *)objc_opt_new();
      log = objc_opt_new();
      v86 = (void *)objc_opt_new();
      v85 = (void *)objc_opt_new();
      v84 = (void *)objc_opt_new();
      v92 = (void *)objc_opt_new();
      v32 = (void *)MEMORY[0x18D7805AC]();
      -[PPSpotlightSessionState engagedSpotlightIds](v5->_sessionState, "engagedSpotlightIds");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __60__PPUniversalSearchFeedbackListener_reportFeedback_queryId___block_invoke;
      v94[3] = &unk_1E226A8D0;
      v94[4] = v5;
      v94[5] = a4;
      objc_msgSend(v33, "_pas_mappedArrayWithIndexedTransform:", v94);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v32);
      v35 = 0;
      for (j = 0; j < objc_msgSend(v34, "count"); ++j)
      {
        v37 = (void *)MEMORY[0x18D7805AC]();
        objc_msgSend(v34, "objectAtIndexedSubscript:", j);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "topicStrings");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v38, "topicStrings");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = 0;
        }

        if (objc_msgSend(v40, "count"))
          ++v35;
        objc_msgSend(v38, "neStrings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v38, "neStrings");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = 0;
        }

        -[NSObject unionSet:](log, "unionSet:", v42);
        objc_msgSend(v86, "unionSet:", v40);

        objc_autoreleasePoolPop(v37);
      }
      for (k = 0; ; ++k)
      {
        -[PPSpotlightSessionState seenSpotlightIds](v5->_sessionState, "seenSpotlightIds");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = k < objc_msgSend(v55, "count");

        if (!v56)
          break;
        v57 = (void *)MEMORY[0x18D7805AC]();
        -[PPSpotlightSessionState seenSpotlightIds](v5->_sessionState, "seenSpotlightIds");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", k);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPSpotlightSessionState seenBundleIds](v5->_sessionState, "seenBundleIds");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectAtIndexedSubscript:", k);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.mobilemail"));
        v63 = v85;
        if ((v62 & 1) != 0
          || (v64 = objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.MobileSMS")), v63 = v84, v64))
        {
          objc_msgSend(v63, "addObject:", v59);
        }

        objc_autoreleasePoolPop(v57);
      }
      -[PPUniversalSearchFeedbackListener fetchFeedbackCSSIParsedResults:feedbackBundleId:queryId:](v5, "fetchFeedbackCSSIParsedResults:feedbackBundleId:queryId:", v85, CFSTR("com.apple.mobilemail"), a4);
      v65 = objc_claimAutoreleasedReturnValue();
      if (v65)
        objc_msgSend(v92, "addObject:", v65);
      v83 = (void *)v65;
      -[PPUniversalSearchFeedbackListener fetchFeedbackCSSIParsedResults:feedbackBundleId:queryId:](v5, "fetchFeedbackCSSIParsedResults:feedbackBundleId:queryId:", v84, CFSTR("com.apple.MobileSMS"), a4);
      v66 = objc_claimAutoreleasedReturnValue();
      if (v66)
        objc_msgSend(v92, "addObject:", v66);
      v88 = (void *)v66;
      v67 = 0;
      for (m = 0; m < objc_msgSend(v92, "count"); ++m)
      {
        v69 = (void *)MEMORY[0x18D7805AC]();
        objc_msgSend(v92, "objectAtIndexedSubscript:", m);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "topicStrings");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "count") != 0;

        objc_msgSend(v70, "neStrings");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unionSet:", v73);

        objc_msgSend(v70, "topicStrings");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "unionSet:", v74);

        objc_autoreleasePoolPop(v69);
        v67 += v72;
      }
      v75 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v75, "minusSet:", log);
      v76 = (void *)objc_msgSend(v91, "mutableCopy");
      objc_msgSend(v76, "minusSet:", v86);
      objc_msgSend(v86, "allObjects");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "allObjects");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPUniversalSearchFeedbackListener sendFeedbackWithEngagementStrings:rejectionStrings:store:](v5, "sendFeedbackWithEngagementStrings:rejectionStrings:store:", v77, v78, v5->_topicStore);

      -[NSObject allObjects](log, "allObjects");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "allObjects");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPUniversalSearchFeedbackListener sendFeedbackWithEngagementStrings:rejectionStrings:store:](v5, "sendFeedbackWithEngagementStrings:rejectionStrings:store:", v79, v80, v5->_entityStore);

      -[PPUniversalSearchFeedbackListener sendMetricsFeedback:engagedCSSICount:](v5, "sendMetricsFeedback:engagedCSSICount:", v67, v35);
      v81 = objc_opt_new();
      sessionState = v5->_sessionState;
      v5->_sessionState = (PPSpotlightSessionState *)v81;

      goto LABEL_60;
    }
  }
LABEL_63:
  objc_sync_exit(v5);

}

- (PPUniversalSearchFeedbackListener)init
{
  PPUniversalSearchFeedbackListener *v2;
  uint64_t v3;
  PPNamedEntityStore *entityStore;
  uint64_t v5;
  PPTopicStore *topicStore;
  uint64_t v7;
  PPSpotlightSessionState *sessionState;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PPUniversalSearchFeedbackListener;
  v2 = -[PPUniversalSearchFeedbackListener init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entityStore = v2->_entityStore;
    v2->_entityStore = (PPNamedEntityStore *)v3;

    -[PPNamedEntityStore setClientIdentifier:](v2->_entityStore, "setClientIdentifier:", CFSTR("spotlight"));
    v5 = objc_opt_new();
    topicStore = v2->_topicStore;
    v2->_topicStore = (PPTopicStore *)v5;

    -[PPTopicStore setClientIdentifier:](v2->_topicStore, "setClientIdentifier:", CFSTR("spotlight"));
    v7 = objc_opt_new();
    sessionState = v2->_sessionState;
    v2->_sessionState = (PPSpotlightSessionState *)v7;

  }
  return v2;
}

- (id)fetchFeedbackCSSIParsedResults:(id)a3 feedbackBundleId:(id)a4 queryId:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  __int128 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  void *v34;
  id v35;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  int64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int64_t v61;
  _QWORD v62[5];

  v62[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__3500;
  v54 = __Block_byref_object_dispose__3501;
  v55 = 0;
  v45 = v7;
  v46 = (void *)objc_opt_new();
  objc_msgSend(v46, "setIdentifiers:", v7);
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CA66C8];
    v62[0] = *MEMORY[0x1E0CA66C0];
    v62[1] = v9;
    v62[2] = *MEMORY[0x1E0CA66D0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_semaphore_create(0);
    -[PPUniversalSearchFeedbackListener protectionClassForBundleId:](self, "protectionClassForBundleId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __93__PPUniversalSearchFeedbackListener_fetchFeedbackCSSIParsedResults_feedbackBundleId_queryId___block_invoke;
    v47[3] = &unk_1E226A8F8;
    v49 = &v50;
    v42 = v10;
    v48 = v42;
    objc_msgSend(v44, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v43, v11, v8, v45, v47);

    LODWORD(v10) = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v42, 20.0);
    pp_universal_search_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((_DWORD)v10 == 1)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerFeedback timed out on server", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reply received from server", buf, 2u);
      }

      v14 = (void *)v51[5];
      if (!v14)
        goto LABEL_33;
      v15 = objc_msgSend(v14, "count");
      if (v15 == objc_msgSend(v45, "count"))
      {
        pp_private_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v37 = v51[5];
          *(_DWORD *)buf = 138412290;
          v57 = v37;
          _os_log_debug_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: CoreSpotlight slow fetch results: %@", buf, 0xCu);
        }

        v17 = 0;
        *(_QWORD *)&v18 = 134218242;
        v40 = v18;
        while (v17 < objc_msgSend((id)v51[5], "count", v40))
        {
          objc_msgSend((id)v51[5], "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v19;
            objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              if (v21)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v21 == v24;

                if (!v25)
                {
                  +[PPSpotlightScoringFeatureVector decodeFeatureVectorFromData:version:](PPSpotlightScoringFeatureVector, "decodeFeatureVectorFromData:version:", v21, v22);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "qidStrings");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "allObjects");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  pp_private_log_handle();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v40;
                    v57 = a5;
                    v58 = 2112;
                    v59 = (uint64_t)v28;
                    _os_log_debug_impl(&dword_18BE3A000, v29, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Topic Qids of feedback of queryId:%lld: %@", buf, 0x16u);
                  }

                  objc_msgSend(v46, "topicStrings");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "addObjectsFromArray:", v28);

                }
              }
            }
            if (v23)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v23 == v31;

              if (!v32)
              {
                pp_private_log_handle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v40;
                  v57 = a5;
                  v58 = 2112;
                  v59 = (uint64_t)v23;
                  _os_log_debug_impl(&dword_18BE3A000, v33, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Portrait NE of feedback of queryId:%lld: %@", buf, 0x16u);
                }

                objc_msgSend(v46, "neStrings");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "addObjectsFromArray:", v23);

              }
            }

          }
          ++v17;
        }
        v35 = v46;
        goto LABEL_34;
      }
      pp_universal_search_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_msgSend((id)v51[5], "count");
        v39 = objc_msgSend(v45, "count");
        *(_DWORD *)buf = 134218496;
        v57 = v38;
        v58 = 2048;
        v59 = v39;
        v60 = 2048;
        v61 = a5;
        _os_log_error_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_ERROR, "CoreSpotlight returned mis-matching count of fetchedObjects(%lu) when fetching identifiers(%lu) of query %lld", buf, 0x20u);
      }
    }

LABEL_33:
    v35 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v35 = 0;
LABEL_35:
  _Block_object_dispose(&v50, 8);

  return v35;
}

- (void)sendFeedbackWithEngagementStrings:(id)a3 rejectionStrings:(id)a4 store:(id)a5
{
  id v7;
  id v8;
  id v9;
  PPFeedback *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  PPFeedback *v15;
  void *v16;
  uint64_t v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int, void *);
  void *v27;
  PPFeedback *v28;
  NSObject *v29;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [PPFeedback alloc];
    v11 = 0;
    v12 = 0;
    v13 = v7;
    v14 = v8;
LABEL_5:
    v15 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](v10, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", v11, v12, v13, v14, 0);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [PPFeedback alloc];
    v11 = v7;
    v12 = v8;
    v13 = 0;
    v14 = 0;
    goto LABEL_5;
  }
  v15 = 0;
LABEL_7:
  -[PPBaseFeedback feedbackItems](v15, "feedbackItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = dispatch_semaphore_create(0);
    pp_universal_search_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18BE3A000, v19, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: sending feedback to server", buf, 2u);
    }

    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __94__PPUniversalSearchFeedbackListener_sendFeedbackWithEngagementStrings_rejectionStrings_store___block_invoke;
    v27 = &unk_1E226A920;
    v28 = v15;
    v20 = v18;
    v29 = v20;
    objc_msgSend(v9, "registerFeedback:completion:", v28, &v24);
    v21 = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v20, 20.0, v24, v25, v26, v27);
    pp_universal_search_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 == 1)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerFeedback timed out on server", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reply received from server", buf, 2u);
    }

  }
}

- (void)sendMetricsFeedback:(unint64_t)a3 engagedCSSICount:(unint64_t)a4
{
  PPUniversalSearchSpotlightFeedback *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  PPTopicStore *topicStore;
  PPUniversalSearchSpotlightFeedback *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, void *);
  void *v16;
  PPUniversalSearchSpotlightFeedback *v17;
  NSObject *v18;
  uint8_t buf[16];

  v5 = -[PPUniversalSearchSpotlightFeedback initWithOfferedCSSICount:engagedCSSICount:]([PPUniversalSearchSpotlightFeedback alloc], "initWithOfferedCSSICount:engagedCSSICount:", a3, a4);
  v6 = dispatch_semaphore_create(0);
  pp_universal_search_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: sending metrics logging feedback to server", buf, 2u);
  }

  topicStore = self->_topicStore;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __74__PPUniversalSearchFeedbackListener_sendMetricsFeedback_engagedCSSICount___block_invoke;
  v16 = &unk_1E226A920;
  v9 = v5;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  -[PPTopicStore registerUniversalSearchSpotlightFeedback:completion:](topicStore, "registerUniversalSearchSpotlightFeedback:completion:", v9, &v13);
  LODWORD(topicStore) = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v10, 20.0, v13, v14, v15, v16);
  pp_universal_search_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((_DWORD)topicStore == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerUniversalSearchSpotlightFeedback timed out on server", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: registerUniversalSearchSpotlightFeedback reply received from server", buf, 2u);
  }

}

- (id)protectionClassForBundleId:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0CB2AB0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = (id *)MEMORY[0x1E0CB2AC0];
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
}

void __74__PPUniversalSearchFeedbackListener_sendMetricsFeedback_engagedCSSICount___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  _DWORD v11[7];

  *(_QWORD *)&v11[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pp_universal_search_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "offeredCSSICount");
      v9 = objc_msgSend(*(id *)(a1 + 32), "engagedCSSICount");
      v10 = 67109376;
      v11[0] = v8;
      LOWORD(v11[1]) = 1024;
      *(_DWORD *)((char *)&v11[1] + 2) = v9;
      _os_log_debug_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Successfully sent metrics logging feedback with %u offeredCSSI and %u engagedCSSI", (uint8_t *)&v10, 0xEu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    *(_QWORD *)v11 = v5;
    _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerUniversalSearchSpotlightFeedback failed to execute on server with error: %@", (uint8_t *)&v10, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __94__PPUniversalSearchFeedbackListener_sendFeedbackWithEngagementStrings_rejectionStrings_store___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pp_universal_search_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "feedbackItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134217984;
      v10 = objc_msgSend(v8, "count");
      _os_log_debug_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Successfully sent feedback with %tu feedback items.", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = (uint64_t)v5;
    _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerFeedback failed to execute on server with error: %@", (uint8_t *)&v9, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __93__PPUniversalSearchFeedbackListener_fetchFeedbackCSSIParsedResults_feedbackBundleId_queryId___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __60__PPUniversalSearchFeedbackListener_reportFeedback_queryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v13 = a2;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a2;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "engagedBundleIds", v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchFeedbackCSSIParsedResults:feedbackBundleId:queryId:", v8, v10, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
