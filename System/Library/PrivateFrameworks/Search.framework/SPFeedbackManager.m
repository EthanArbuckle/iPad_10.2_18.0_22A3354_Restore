@implementation SPFeedbackManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  return (id)sharedManager_sharedManager;
}

void __54__SPFeedbackManager_updateNeedsToDisplayFirstTimeView__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "defaultsCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNeedsToDisplayFirstTimeView:", objc_msgSend(v2, "integerForKey:", CFSTR("SPUISearchFirstTimeShowCount")) == 0);

  v3 = objc_msgSend(*(id *)(a1 + 32), "isParsecFeedbackEnabled");
  objc_msgSend(*(id *)(a1 + 32), "parsecFeedbackListener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParsecEnabled:", v3);

}

- (void)setNeedsToDisplayFirstTimeView:(BOOL)a3
{
  self->_needsToDisplayFirstTimeView = a3;
}

- (NSUserDefaults)defaultsCenter
{
  return self->_defaultsCenter;
}

void __34__SPFeedbackManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

- (SPFeedbackManager)init
{
  SPFeedbackManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *feedbackQueue;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *clientBundleID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SPFeedbackManager;
  v2 = -[SPFeedbackManager init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.spotlight.feedback", v4);
    feedbackQueue = v2->_feedbackQueue;
    v2->_feedbackQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v2, CFSTR("SPUISearchFirstTimeShowCount"), 0, 0);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v2, CFSTR("SBSearchDisabledDomains"), 0, 0);
    -[SPFeedbackManager setDefaultsCenter:](v2, "setDefaultsCenter:", v7);
    -[SPFeedbackManager updateNeedsToDisplayFirstTimeView](v2, "updateNeedsToDisplayFirstTimeView");
    -[SPFeedbackManager updateParsecEnabled](v2, "updateParsecEnabled");
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v2->_clientBundleID;
    v2->_clientBundleID = (NSString *)v9;

    v2->_clientRankAndBlend = _os_feature_enabled_impl();
    if (-[NSString hasPrefix:](v2->_clientBundleID, "hasPrefix:", CFSTR("com.apple.omniSearch"))
      || -[NSString hasPrefix:](v2->_clientBundleID, "hasPrefix:", CFSTR("com.apple.intelligenceflow")))
    {
      v2->_clientRankAndBlend = 0;
    }

  }
  return v2;
}

- (void)updateParsecEnabled
{
  NSObject *feedbackQueue;
  _QWORD block[5];

  feedbackQueue = self->_feedbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SPFeedbackManager_updateParsecEnabled__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  dispatch_async(feedbackQueue, block);
}

- (void)updateNeedsToDisplayFirstTimeView
{
  NSObject *feedbackQueue;
  _QWORD block[5];

  feedbackQueue = self->_feedbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SPFeedbackManager_updateNeedsToDisplayFirstTimeView__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  dispatch_async(feedbackQueue, block);
}

- (void)setDefaultsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsCenter, a3);
}

- (void)_sendFeedback:(id)a3 type:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[SPFeedbackManager _sendFeedback:type:queryId:](self, "_sendFeedback:type:queryId:", v6, a4, objc_msgSend(v6, "queryId"));

}

- (void)_sendFeedback:(id)a3 type:(int64_t)a4 queryId:(unint64_t)a5
{
  id v8;
  NSObject *feedbackQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int64_t v14;

  v8 = a3;
  feedbackQueue = self->_feedbackQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__SPFeedbackManager__sendFeedback_type_queryId___block_invoke;
  v11[3] = &unk_24CF63E70;
  v11[4] = self;
  v12 = v8;
  v13 = a5;
  v14 = a4;
  v10 = v8;
  dispatch_async(feedbackQueue, v11);

}

void __40__SPFeedbackManager_updateParsecEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  SPGetDisabledDomainSet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", CFSTR("DOMAIN_PARSEC")))
  {
    v4 = *(void **)(a1 + 32);
    v3 = (id *)(a1 + 32);
    objc_msgSend(v4, "setIsParsecEnabled:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSpotlightInternetResultsAllowed");
    v7 = *(void **)(a1 + 32);
    v3 = (id *)(a1 + 32);
    objc_msgSend(v7, "setIsParsecEnabled:", v6);

  }
  v8 = objc_msgSend(*v3, "isParsecFeedbackEnabled");
  objc_msgSend(*v3, "parsecFeedbackListener");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParsecEnabled:", v8);

}

void __48__SPFeedbackManager__sendFeedback_type_queryId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  void *v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v1 = a1;
  v67 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isParsecFeedbackEnabled"))
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "reportFeedback:queryId:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
  if (*(_QWORD *)(v1 + 56) == 26)
  {
    v2 = v1;
    v3 = *(id *)(v1 + 40);
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightBackingResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "resultBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB0720]);

    if (v8)
    {
      v9 = v6;

      v4 = v9;
    }
    v10 = objc_msgSend(v3, "triggerEvent");
    v1 = v2;
    if (v4 && (unint64_t)(v10 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v4, "query"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v4, "userInput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v4, "completion");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v14;

        v1 = v2;
      }
      objc_msgSend(MEMORY[0x24BEB02F8], "cacheResult:searchString:", v4, v11);

    }
  }
  v15 = *(id *)(v1 + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = *(id *)(v1 + 40);
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v17, "setQueryId:", objc_msgSend(v16, "queryId"));
    objc_msgSend(v16, "cardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "spotlightBackingResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v17;
      objc_msgSend(v17, "setResult:", v19);
    }
    else
    {
      objc_msgSend(v16, "result");
      v21 = v1;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      objc_msgSend(v17, "setResult:", v22);

      v1 = v21;
    }

    v15 = v20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v15;
    v50 = v1;
    v23 = *(id *)(v1 + 40);
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v23, "uniqueIdsOfVisibleButtons");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUniqueIdsOfVisibleButtons:", v25);

    objc_msgSend(v23, "uniqueIdentifiersOfVisibleCardSections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUniqueIdentifiersOfVisibleCardSections:", v26);

    v48 = v23;
    objc_msgSend(v23, "goTakeoverResult");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setGoTakeoverResult:", v27);

    objc_msgSend(v24, "results");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_opt_new();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v28;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (!v30)
      goto LABEL_47;
    v31 = v30;
    v32 = *(_QWORD *)v62;
    v51 = *(_QWORD *)v62;
    while (1)
    {
      v33 = 0;
      v52 = v31;
      do
      {
        if (*(_QWORD *)v62 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v33);
        if ((objc_msgSend(v34, "usesCompactDisplay") & 1) != 0)
          objc_msgSend(v34, "compactCard");
        else
          objc_msgSend(v34, "inlineCard");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "cardSections");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = v35;
          v56 = v33;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v54 = v37;
          objc_msgSend(v37, "cardSections");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          if (!v39)
            goto LABEL_43;
          v40 = v39;
          v41 = *(_QWORD *)v58;
          while (1)
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v58 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              objc_msgSend(v24, "uniqueIdentifiersOfVisibleCardSections");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "cardSectionId");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v44, "containsObject:", v45) & 1) != 0)
              {
                objc_msgSend(v43, "spotlightBackingResult");
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v46)
                  continue;
                objc_msgSend(v43, "spotlightBackingResult");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v44);
              }
              else
              {

              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            if (!v40)
            {
LABEL_43:

              v32 = v51;
              v31 = v52;
              v35 = v55;
              v33 = v56;
              v37 = v54;
              goto LABEL_45;
            }
          }
        }
        objc_msgSend(v29, "addObject:", v34);
LABEL_45:

        ++v33;
      }
      while (v33 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (!v31)
      {
LABEL_47:

        objc_msgSend(v24, "setResults:", v29);
        v1 = v50;
        goto LABEL_49;
      }
    }
  }
  v24 = v15;
LABEL_49:
  if (*(_BYTE *)(*(_QWORD *)(v1 + 32) + 8))
  {
    +[SPSearchFeedbackProxy sharedProxy](SPSearchFeedbackProxy, "sharedProxy");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sendFeedbackType:feedback:queryId:clientID:", *(_QWORD *)(v1 + 56), v24, *(_QWORD *)(v1 + 48), *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16));
  }
  else
  {
    +[SPDaemonConnection sharedBackgroundConnection](SPDaemonConnection, "sharedBackgroundConnection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sendSFFeedback:type:queryId:", v24, *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 48));
  }

}

- (BOOL)isParsecFeedbackEnabled
{
  return !-[SPFeedbackManager needsToDisplayFirstTimeView](self, "needsToDisplayFirstTimeView")
      && -[SPFeedbackManager isParsecEnabled](self, "isParsecEnabled");
}

- (BOOL)needsToDisplayFirstTimeView
{
  return self->_needsToDisplayFirstTimeView;
}

- (BOOL)isParsecEnabled
{
  return self->_isParsecEnabled;
}

- (PARSession)parsecFeedbackListener
{
  return self->_parsecFeedbackListener;
}

- (void)setIsParsecEnabled:(BOOL)a3
{
  self->_isParsecEnabled = a3;
}

- (void)sectionHeaderDidBecomeVisible:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 18);
}

- (void)resultsDidBecomeVisible:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 12);
}

- (void)didStartSearch:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 5);
}

- (void)didRankSections:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 7);
}

- (void)didEndSearch:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 6);
}

- (void)setParsecFeedbackListener:(id)a3
{
  objc_storeStrong((id *)&self->_parsecFeedbackListener, a3);
}

+ (void)flushFeedbackWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  +[SPFeedbackManager sharedManager](SPFeedbackManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke;
  v8[3] = &unk_24CF64428;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  objc_msgSend(a1, "bumpPriorityOnQueue:withCompletion:", v6, v8);

}

void __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  +[SPDaemonConnection sharedBackgroundConnection](SPDaemonConnection, "sharedBackgroundConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_2;
  v5[3] = &unk_24CF64400;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "bumpPriorityOnQueue:withCompletion:", v4, v5);

}

void __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[SPDaemonConnection sharedBackgroundConnection](SPDaemonConnection, "sharedBackgroundConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_3;
  v3[3] = &unk_24CF64400;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "barrierOnXPC:", v3);

}

uint64_t __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)bumpPriorityOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD block[4];
  id v10;

  v5 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SPFeedbackManager_bumpPriorityOnQueue_withCompletion___block_invoke;
  block[3] = &unk_24CF64400;
  v10 = v5;
  v6 = v5;
  v7 = a3;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v7, v8);

}

uint64_t __56__SPFeedbackManager_bumpPriorityOnQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)searchViewDidAppear:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 2);
}

- (void)searchViewDidDisappear:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 3);
}

- (void)cardViewDidDisappear:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 4);
}

- (void)didEngageResult:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 8);
}

- (void)didEngageSuggestion:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 9);
}

- (void)didEngageCardSection:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 10);
}

- (void)didErrorOccur:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 1);
}

- (void)sendCustomFeedback:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 11);
}

- (void)suggestionsDidBecomeVisible:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 13);
}

- (void)didReceiveResultsAfterTimeout:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 14);
}

- (void)didAppendLateSections:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 15);
}

- (void)didClearInput:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 16);
}

- (void)didEngageSection:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 17);
}

- (void)didGradeResultRelevancy:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 19);
}

- (void)cardViewDidAppear:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 20);
}

- (void)didReportUserResponseFeedback:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 25);
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  -[SPFeedbackManager _sendFeedback:type:queryId:](self, "_sendFeedback:type:queryId:", a3, 21, a4);
}

- (void)didPerformCommand:(id)a3
{
  -[SPFeedbackManager _sendFeedback:type:](self, "_sendFeedback:type:", a3, 26);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("SPUISearchFirstTimeShowCount")))
  {
    -[SPFeedbackManager updateNeedsToDisplayFirstTimeView](self, "updateNeedsToDisplayFirstTimeView");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("SBSearchDisabledDomains")))
  {
    -[SPFeedbackManager updateParsecEnabled](self, "updateParsecEnabled");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SPFeedbackManager;
    if (-[SPFeedbackManager respondsToSelector:](&v14, sel_respondsToSelector_, sel_observeValueForKeyPath_ofObject_change_context_))
    {
      v13.receiver = self;
      v13.super_class = (Class)SPFeedbackManager;
      -[SPFeedbackManager observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    }
  }

}

- (OS_dispatch_queue)feedbackQueue
{
  return self->_feedbackQueue;
}

- (void)setFeedbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsCenter, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_parsecFeedbackListener, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end
