@implementation WBSParsecDFeedbackDispatcher

uint64_t __56__WBSParsecDFeedbackDispatcher_postFeedback_forQueryID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postFeedbackOnFeedbackQueue:forQueryID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)searchViewAppearedBecauseOfEvent:(unint64_t)a3 forQueryID:(int64_t)a4 usesLoweredSearchBar:(BOOL)a5
{
  -[WBSParsecDFeedbackDispatcher searchViewAppearedBecauseOfEvent:isSafariReaderAvailable:forQueryID:usesLoweredSearchBar:](self, "searchViewAppearedBecauseOfEvent:isSafariReaderAvailable:forQueryID:usesLoweredSearchBar:", a3, 0, a4, a5);
}

- (void)searchViewAppearedBecauseOfEvent:(unint64_t)a3 isSafariReaderAvailable:(BOOL)a4 forQueryID:(int64_t)a5 usesLoweredSearchBar:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;

  v6 = a6;
  v8 = a4;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6B8]), "initWithEvent:", a3);
  objc_msgSend(v10, "setReaderTextAvailable:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "setIsUsingLoweredSearchBar:", v6);
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v10, a5);

}

- (void)postFeedback:(id)a3 forQueryID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *feedbackQueue;
  _QWORD block[5];
  id v17;
  int64_t v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Posting feedback to parsecd", buf, 2u);
  }
  v8 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    if (!v6)
      goto LABEL_7;
  }
  else if (!v6)
  {
    goto LABEL_7;
  }
  if (WBSParsecGlobalFeedbackIsEnabled())
  {
    feedbackQueue = self->_feedbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__WBSParsecDFeedbackDispatcher_postFeedback_forQueryID___block_invoke;
    block[3] = &unk_1E5444D10;
    block[4] = self;
    v17 = v6;
    v18 = a4;
    dispatch_async(feedbackQueue, block);

  }
LABEL_7:

}

- (WBSParsecDFeedbackDispatcher)initWithSession:(id)a3
{
  id v4;
  WBSParsecDFeedbackDispatcher *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *feedbackListeners;
  NSArray *v9;
  uint64_t v10;
  NSMutableArray *visibleResultsFeedbackEventsToBeSent;
  uint64_t v12;
  NSMutableArray *previousRankingFeedbackEventsSentForCurrentQueryID;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *feedbackQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queriesToDictionariesMappingQueue;
  WBSParsecDFeedbackDispatcher *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSParsecDFeedbackDispatcher;
  v5 = -[WBSParsecDFeedbackDispatcher init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      -[NSArray addObject:](v6, "addObject:", v4);
    feedbackListeners = v5->_feedbackListeners;
    v5->_feedbackListeners = v7;
    v9 = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    visibleResultsFeedbackEventsToBeSent = v5->_visibleResultsFeedbackEventsToBeSent;
    v5->_visibleResultsFeedbackEventsToBeSent = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    previousRankingFeedbackEventsSentForCurrentQueryID = v5->_previousRankingFeedbackEventsSentForCurrentQueryID;
    v5->_previousRankingFeedbackEventsSentForCurrentQueryID = (NSMutableArray *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDFeedbackDispatcher", v14);
    feedbackQueue = v5->_feedbackQueue;
    v5->_feedbackQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDFeedbackDispatcher", v17);
    queriesToDictionariesMappingQueue = v5->_queriesToDictionariesMappingQueue;
    v5->_queriesToDictionariesMappingQueue = (OS_dispatch_queue *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)_postFeedbackOnFeedbackQueue:(id)a3 forQueryID:(int64_t)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_feedbackListeners;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "reportFeedback:queryId:", v6, a4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)dealloc
{
  NSTimer *sendPendingVisibleResultsFeedbackFeedbackEventsTimer;
  objc_super v4;

  if (-[NSTimer isValid](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "isValid"))
    -[NSTimer fire](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "fire");
  -[NSTimer invalidate](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "invalidate");
  sendPendingVisibleResultsFeedbackFeedbackEventsTimer = self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer;
  self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)WBSParsecDFeedbackDispatcher;
  -[WBSParsecDFeedbackDispatcher dealloc](&v4, sel_dealloc);
}

- (void)flush
{
  dispatch_sync((dispatch_queue_t)self->_feedbackQueue, &__block_literal_global_28);
}

- (void)didDisplayCompletionListItems:(id)a3 forQuery:(id)a4 forEvent:(int64_t)a5
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  WBSCompletionQuery *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSTimer *v20;
  NSTimer *sendPendingVisibleResultsFeedbackFeedbackEventsTimer;
  _QWORD v22[5];
  id v23;
  uint64_t v24;

  v9 = a4;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D8C828]);
  if ((unint64_t)(a5 - 1) > 2)
    v12 = 1;
  else
    v12 = qword_1A84E35C8[a5 - 1];
  v13 = (void *)objc_msgSend(v11, "initWithResults:triggerEvent:", v10, v12);
  v14 = objc_msgSend(v9, "queryID");
  v15 = self->_previousQueryForVisibleResultsFeedback;
  objc_storeStrong((id *)&self->_currentQueryForVisibleResultsFeedback, a4);
  -[NSTimer invalidate](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "invalidate");
  if (v14 != -[WBSCompletionQuery queryID](v15, "queryID"))
  {
    objc_storeStrong((id *)&self->_previousQueryForVisibleResultsFeedback, a4);
    if (-[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"))
    {
      v16 = -[WBSCompletionQuery queryID](v15, "queryID");
      -[WBSCompletionQuery queryString](v15, "queryString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSParsecDFeedbackDispatcher _postPendingVisibleResultsFeedbackEventsForQueryID:queryString:](self, "_postPendingVisibleResultsFeedbackEventsForQueryID:queryString:", v16, v17);

    }
  }
  -[NSMutableArray addObject:](self->_visibleResultsFeedbackEventsToBeSent, "addObject:", v13);
  v18 = (void *)MEMORY[0x1E0C99E88];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__WBSParsecDFeedbackDispatcher_didDisplayCompletionListItems_forQuery_forEvent___block_invoke_2;
  v22[3] = &unk_1E5444D78;
  v23 = v9;
  v24 = v14;
  v22[4] = self;
  v19 = v9;
  objc_msgSend(v18, "scheduledTimerWithTimeInterval:repeats:block:", 0, v22, 0.5);
  v20 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  sendPendingVisibleResultsFeedbackFeedbackEventsTimer = self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer;
  self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer = v20;

}

uint64_t __80__WBSParsecDFeedbackDispatcher_didDisplayCompletionListItems_forQuery_forEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sfSearchResultValue");
}

void __80__WBSParsecDFeedbackDispatcher_didDisplayCompletionListItems_forQuery_forEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queryString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_postPendingVisibleResultsFeedbackEventsForQueryID:queryString:", v2, v4);

  }
}

- (void)_postPendingVisibleResultsFeedbackEventsForQueryID:(int64_t)a3 queryString:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *feedbackQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"))
  {
    v8 = 0;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_visibleResultsFeedbackEventsToBeSent, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "results");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v11);

      if (v8 == -[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count") - 1)
      {
        objc_msgSend(v7, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setResults:", v12);

      }
      else
      {
        objc_msgSend(v10, "setResults:", 0);
      }
      feedbackQueue = self->_feedbackQueue;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __95__WBSParsecDFeedbackDispatcher__postPendingVisibleResultsFeedbackEventsForQueryID_queryString___block_invoke;
      v15[3] = &unk_1E5444DA0;
      v15[4] = self;
      v16 = v10;
      v18 = a3;
      v17 = v6;
      v14 = v10;
      dispatch_async(feedbackQueue, v15);

      ++v8;
    }
    while (v8 < -[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"));
  }
  -[NSMutableArray removeAllObjects](self->_visibleResultsFeedbackEventsToBeSent, "removeAllObjects");

}

void __95__WBSParsecDFeedbackDispatcher__postPendingVisibleResultsFeedbackEventsForQueryID_queryString___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_postFeedbackOnFeedbackQueue:forQueryID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "results");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_postMapsFeedbackForResults:queryString:", v3, *(_QWORD *)(a1 + 48));

}

- (void)_postMapsFeedbackForResults:(id)a3 queryString:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D27678], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captureMapsResultsDisplayedFeedbackForQueryString:resultsArray:", v7, v5);

  }
}

id __72__WBSParsecDFeedbackDispatcher__postMapsFeedbackForResults_queryString___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "mapsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v2, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "mapsData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setMapsData:", v6);

    }
    else
    {
      objc_msgSend(v2, "setMapsData:", 0);
    }

  }
  objc_msgSend(v2, "mapsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)userDidEngageWithCompletionListItem:(id)a3 onActionButton:(BOOL)a4 method:(int64_t)a5
{
  -[WBSParsecDFeedbackDispatcher userDidEngageWithCompletionListItem:onActionButton:method:doesMatchSiriSuggestion:](self, "userDidEngageWithCompletionListItem:onActionButton:method:doesMatchSiriSuggestion:", a3, a4, a5, 0);
}

- (void)userDidEngageWithCompletionListItem:(id)a3 onActionButton:(BOOL)a4 method:(int64_t)a5 doesMatchSiriSuggestion:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v6 = a6;
  v8 = a4;
  v24 = a3;
  objc_msgSend(v24, "sfSearchResultValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = (void *)MEMORY[0x1E0D8C7A8];
        objc_msgSend(v24, "siriSuggestion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textWithString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTitle:", v16);

      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = objc_msgSend(v24, "engagementDestination");
    else
      v17 = 3;
    v18 = 1;
    if (a5 != 1)
      v18 = 2;
    if (a5 == 2)
      v19 = 20;
    else
      v19 = v18;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:", v11, v19, v17);
    v21 = v20;
    if (v8)
      objc_msgSend(v20, "setActionTarget:", 4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v21, "setMatchesUnengagedSuggestion:", v6);
    v22 = -[WBSCompletionQuery queryID](self->_currentQueryForVisibleResultsFeedback, "queryID");
    if (-[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"))
    {
      -[NSTimer invalidate](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "invalidate");
      -[WBSCompletionQuery queryString](self->_currentQueryForVisibleResultsFeedback, "queryString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSParsecDFeedbackDispatcher _postPendingVisibleResultsFeedbackEventsForQueryID:queryString:](self, "_postPendingVisibleResultsFeedbackEventsForQueryID:queryString:", v22, v23);

    }
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v21, v22);

  }
}

- (void)userTypedURLDirectlyForQuery:(id)a3 triggerEvent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D8C340]);
  objc_msgSend(v11, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithInput:", v7);

  if (a4 == 1)
    objc_msgSend(v8, "setTriggerEvent:", 20);
  v9 = objc_msgSend(v11, "queryID");
  if (-[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"))
  {
    -[NSTimer invalidate](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "invalidate");
    objc_msgSend(v11, "queryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSParsecDFeedbackDispatcher _postPendingVisibleResultsFeedbackEventsForQueryID:queryString:](self, "_postPendingVisibleResultsFeedbackEventsForQueryID:queryString:", v9, v10);

  }
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v8, objc_msgSend(v11, "queryID"));

}

- (void)userTypedGoToSearch:(id)a3 endpoint:(unint64_t)a4 triggerEvent:(int64_t)a5 forQueryID:(int64_t)a6
{
  objc_class *v10;
  id v11;
  void *v12;
  id v13;

  v10 = (objc_class *)MEMORY[0x1E0D8C338];
  v11 = a3;
  v13 = (id)objc_msgSend([v10 alloc], "initWithInput:endpoint:", v11, a4);

  if (a5 == 1)
    objc_msgSend(v13, "setTriggerEvent:", 20);
  if (-[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"))
  {
    -[NSTimer invalidate](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "invalidate");
    -[WBSCompletionQuery queryString](self->_currentQueryForVisibleResultsFeedback, "queryString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSParsecDFeedbackDispatcher _postPendingVisibleResultsFeedbackEventsForQueryID:queryString:](self, "_postPendingVisibleResultsFeedbackEventsForQueryID:queryString:", a6, v12);

  }
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v13, a6);

}

- (void)didReceiveLocalResultsForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSParsecDFeedbackDispatcher _takeStartSearchFeedbackForSearchOfType:forQuery:](self, "_takeStartSearchFeedbackForSearchOfType:forQuery:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C368]), "initWithStartSearch:", v5);
    if (v6)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = 134218240;
        v10 = v6;
        v11 = 2048;
        v12 = v5;
        _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Sending bookmarks/history search end feedback to parsecd: %p (paired with search start feedback: %p)", (uint8_t *)&v9, 0x16u);
      }
      v8 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[WBSParsecDFeedbackDispatcher didReceiveLocalResultsForQuery:].cold.1();
      -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v6, objc_msgSend(v4, "queryID"));
    }

  }
}

- (void)didBeginSearchOfType:(int64_t)a3 withQuery:(id)a4 endpoint:(unint64_t)a5
{
  -[WBSParsecDFeedbackDispatcher didBeginSearchOfType:withQuery:urlString:headers:endpoint:](self, "didBeginSearchOfType:withQuery:urlString:headers:endpoint:", a3, a4, 0, MEMORY[0x1E0C9AA70], a5);
}

- (void)didBeginSearchOfType:(int64_t)a3 withQuery:(id)a4 urlString:(id)a5 headers:(id)a6 endpoint:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v12, "triggerEvent");
  if (a3 == 1)
  {
    if (objc_msgSend(MEMORY[0x1E0D8A120], "defaultSearchEngineMatchesExperiment"))
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D8A210], "shared");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "trialABGroupIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    v23 = objc_alloc(MEMORY[0x1E0D8C738]);
    objc_msgSend(v12, "queryString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v23, "initWithInput:triggerEvent:searchType:indexType:queryId:originatingApp:", v24, v15, 2, 5, objc_msgSend(v12, "queryID"), v17);

    v19 = CFSTR("bookmarks/history");
  }
  else
  {
    if (a3)
      goto LABEL_14;
    v16 = objc_alloc(MEMORY[0x1E0D8C740]);
    objc_msgSend(v12, "queryString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithInput:url:headers:triggerEvent:endpoint:queryId:", v17, v13, v14, v15, a7, objc_msgSend(v12, "queryID"));
    v19 = CFSTR("search engine");
  }

  if (v18)
  {
    -[WBSParsecDFeedbackDispatcher _setStartSearchFeedback:forSearchOfType:withQuery:](self, "_setStartSearchFeedback:forSearchOfType:withQuery:", v18, a3, v12);
    v25 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v27 = 138543362;
      v28 = v19;
      _os_log_impl(&dword_1A840B000, v25, OS_LOG_TYPE_INFO, "Sending %{public}@ search start feedback to parsecd.", (uint8_t *)&v27, 0xCu);
    }
    v26 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[WBSParsecDFeedbackDispatcher didBeginSearchOfType:withQuery:urlString:headers:endpoint:].cold.1();
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v18, objc_msgSend(v12, "queryID"));

  }
LABEL_14:

}

- (void)didGenerateCompletionListItemsWithRankingObserver:(id)a3 forQueryID:(int64_t)a4
{
  id v6;

  objc_msgSend(a3, "rankingFeedback");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v6, a4);

}

- (void)didRankSections:(id)a3 blendingDuration:(double)a4 feedbackForHiddenAndDuplicateResults:(id)a5 forQueryID:(int64_t)a6 hiddenIgnoredSiriSuggestedSite:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *previousRankingFeedbackEventsSentForCurrentQueryID;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke;
    v33[3] = &unk_1E5444E30;
    v28 = v15;
    v34 = v28;
    v35 = v13;
    objc_msgSend(v12, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C600]), "initWithSections:blendingDuration:", v16, a4);
    v18 = objc_opt_respondsToSelector();
    if (v14 && (v18 & 1) != 0)
    {
      v37[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHiddenResults:", v19);

    }
    if (self->_previousQueryIDForRankedResultsFeedback != a6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      previousRankingFeedbackEventsSentForCurrentQueryID = self->_previousRankingFeedbackEventsSentForCurrentQueryID;
      self->_previousRankingFeedbackEventsSentForCurrentQueryID = v20;

      self->_previousQueryIDForRankedResultsFeedback = a6;
    }
    v27 = a6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = self->_previousRankingFeedbackEventsSentForCurrentQueryID;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      while (2)
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          if (-[WBSParsecDFeedbackDispatcher _rankingFeedback:isShallowEqual:](self, "_rankingFeedback:isShallowEqual:", v17, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v26), v27, v28, (_QWORD)v29))
          {

            goto LABEL_17;
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        if (v24)
          continue;
        break;
      }
    }

    -[NSMutableArray addObject:](self->_previousRankingFeedbackEventsSentForCurrentQueryID, "addObject:", v17);
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v17, v27);
LABEL_17:

  }
}

id __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v5 = a2;
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke_2;
  v13 = &unk_1E5444E08;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v6, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResults:", 0, v10, v11, v12, v13);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6D8]), "initWithResults:section:localSectionPosition:personalizationScore:", v7, v5, a3, 0.0);

  return v8;
}

id __144__WBSParsecDFeedbackDispatcher_didRankSections_blendingDuration_feedbackForHiddenAndDuplicateResults_forQueryID_hiddenIgnoredSiriSuggestedSite___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7
      || (v8 = *(void **)(a1 + 40),
          objc_msgSend(v5, "identifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "objectForKeyedSubscript:", v9),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v6))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C648]), "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v5, 0, 0, a3);
    }
  }

  return v6;
}

- (BOOL)_rankingFeedback:(id)a3 isShallowEqual:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  id v49;
  void *v50;
  unint64_t v51;
  BOOL v52;
  id v53;
  void *v54;
  char v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "queryId");
  v54 = v6;
  if (v7 != objc_msgSend(v6, "queryId"))
    goto LABEL_4;
  objc_msgSend(v5, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v54, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 != v12)
      goto LABEL_4;
  }
  else
  {

  }
  objc_msgSend(v5, "sections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    v13 = 1;
    goto LABEL_5;
  }
  v17 = 0;
  v53 = v5;
  while (1)
  {
    objc_msgSend(v5, "sections");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "section");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "sections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "section");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v20, "isEqualToString:", v24);

    if (!v25)
      break;
    objc_msgSend(v5, "sections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "results");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(v5, "sections");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectAtIndexedSubscript:", v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "results");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v30, "count");
      objc_msgSend(v54, "sections");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v17);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "results");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v33, "count");

      if (v62 != v57)
        break;
    }
    else
    {

    }
    v34 = 0;
    while (1)
    {
      objc_msgSend(v5, "sections");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "results");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      if (v34 >= v38)
        break;
      objc_msgSend(v5, "sections");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectAtIndexedSubscript:", v17);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "results");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndexedSubscript:", v34);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "result");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "sections");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", v17);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "results");
      v43 = v17;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", v34);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "result");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v40, "isEqualToString:", v47);

      v17 = v43;
      v5 = v53;

      ++v34;
      if ((v55 & 1) == 0)
        goto LABEL_4;
    }
    v48 = v17 + 1;
    objc_msgSend(v5, "sections");
    v49 = v5;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");

    v5 = v49;
    v13 = 1;
    v52 = v48 >= v51;
    v17 = v48;
    if (v52)
      goto LABEL_5;
  }
LABEL_4:
  v13 = 0;
LABEL_5:

  return v13;
}

- (void)didReceiveParsecResultsAfterTimeout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_42);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C658]), "initWithResults:", v4);
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v5, objc_msgSend(v6, "parsecQueryID"));

  }
}

uint64_t __68__WBSParsecDFeedbackDispatcher_didReceiveParsecResultsAfterTimeout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sfSearchResultValue");
}

- (void)didHideRepeatedlyIgnoredSiriSuggestedSiteWithFeedbackEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v4, objc_msgSend(v4, "queryId"));

}

- (id)_customFeedbackOfType:(unint64_t)a3 JSONDictionary:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a4, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C318]), "initWithType:data:", a3, v5);
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSParsecDFeedbackDispatcher _customFeedbackOfType:JSONDictionary:].cold.1(v8, v6, a3);
    v7 = 0;
  }

  return v7;
}

- (void)sendCrowdsourcedAutoFillFeedback:(id)a3 forQueryID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WBSParsecDFeedbackDispatcher sendCrowdsourcedAutoFillFeedback:forQueryID:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  -[WBSParsecDFeedbackDispatcher _customFeedbackOfType:JSONDictionary:](self, "_customFeedbackOfType:JSONDictionary:", 1, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v14, a4);

}

- (void)sendNewTabFeedback:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSParsecDFeedbackDispatcher sendNewTabFeedback:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  -[WBSParsecDFeedbackDispatcher searchViewAppearedBecauseOfEvent:forQueryID:usesLoweredSearchBar:](self, "searchViewAppearedBecauseOfEvent:forQueryID:usesLoweredSearchBar:", 8, objc_msgSend(MEMORY[0x1E0D8A0E0], "currentQueryID"), v3);
}

- (void)sendClearInputFeedbackWithTriggerEvent:(unint64_t)a3 forQueryID:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WBSParsecDFeedbackDispatcher sendClearInputFeedbackWithTriggerEvent:forQueryID:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C240]), "initWithEvent:", a3);
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v15, a4);

}

- (void)triggeredExperimentWithTreatmentId:(id)a3 withQueryID:(int64_t)a4 cfDiffered:(BOOL)a5 cfUsed:(BOOL)a6 cfError:(unint64_t)a7
{
  id v9;

  if (a3)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C398]), "initWithCfDiffered:cfUsed:cfError:", a5, a6, a7);
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v9, a4);

  }
}

- (void)triggeredExperimentWithTreatmentId:(id)a3 withQueryID:(int64_t)a4
{
  id v6;

  if (a3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D8C398]);
    -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v6, a4);

  }
}

- (void)_setStartSearchFeedback:(id)a3 forSearchOfType:(int64_t)a4 withQuery:(id)a5
{
  id v8;
  id v9;
  NSObject *queriesToDictionariesMappingQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  queriesToDictionariesMappingQueue = self->_queriesToDictionariesMappingQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__WBSParsecDFeedbackDispatcher__setStartSearchFeedback_forSearchOfType_withQuery___block_invoke;
  v13[3] = &unk_1E5444DA0;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(queriesToDictionariesMappingQueue, v13);

}

void __82__WBSParsecDFeedbackDispatcher__setStartSearchFeedback_forSearchOfType_withQuery___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1[4] + 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(a1[4] + 8);
  }
  objc_msgSend(v2, "objectForKey:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *(void **)(a1[4] + 8);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, a1[5]);

  }
  v9 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);

}

- (id)_takeStartSearchFeedbackForSearchOfType:(int64_t)a3 forQuery:(id)a4
{
  id v6;
  void *v7;
  NSObject *queriesToDictionariesMappingQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queriesToDictionariesMappingQueue = self->_queriesToDictionariesMappingQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__WBSParsecDFeedbackDispatcher__takeStartSearchFeedbackForSearchOfType_forQuery___block_invoke;
  v13[3] = &unk_1E5444E98;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queriesToDictionariesMappingQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __81__WBSParsecDFeedbackDispatcher__takeStartSearchFeedbackForSearchOfType_forQuery___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v5, "removeObjectForKey:", a1[6]);
}

- (void)searchViewDisappearedBecauseOfEvent:(int64_t)a3 forQueryID:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  id v9;

  if (-[NSMutableArray count](self->_visibleResultsFeedbackEventsToBeSent, "count"))
  {
    -[NSTimer invalidate](self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, "invalidate");
    v7 = -[WBSCompletionQuery queryID](self->_currentQueryForVisibleResultsFeedback, "queryID");
    -[WBSCompletionQuery queryString](self->_currentQueryForVisibleResultsFeedback, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSParsecDFeedbackDispatcher _postPendingVisibleResultsFeedbackEventsForQueryID:queryString:](self, "_postPendingVisibleResultsFeedbackEventsForQueryID:queryString:", v7, v8);

  }
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6C0]), "initWithEvent:", a3);
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v9, a4);

}

- (void)userDidTypeKey:(int64_t)a3
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C250]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.safari.keystroke"), 0, a3);
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v5, a3);

}

- (void)userDidTapMicKey:(int64_t)a3
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C250]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.safari.mictap"), 0, a3);
  -[WBSParsecDFeedbackDispatcher postFeedback:forQueryID:](self, "postFeedback:forQueryID:", v5, a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRankingFeedbackEventsSentForCurrentQueryID, 0);
  objc_storeStrong((id *)&self->_visibleResultsFeedbackEventsToBeSent, 0);
  objc_storeStrong((id *)&self->_sendPendingVisibleResultsFeedbackFeedbackEventsTimer, 0);
  objc_storeStrong((id *)&self->_currentQueryForVisibleResultsFeedback, 0);
  objc_storeStrong((id *)&self->_previousQueryForVisibleResultsFeedback, 0);
  objc_storeStrong((id *)&self->_feedbackListeners, 0);
  objc_storeStrong((id *)&self->_queriesToDictionariesMappingQueue, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_queriesToDictionariesFromSearchTypesToStartSearchFeedbacks, 0);
}

- (void)postFeedback:(uint64_t)a3 forQueryID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A840B000, a2, a3, "Posting feedback to parsecd: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveLocalResultsForQuery:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1A840B000, v0, v1, "Sending bookmarks/history search end feedback to parsecd: %{private}@ (paired with search start feedback: %{private}@)");
  OUTLINED_FUNCTION_1();
}

- (void)didBeginSearchOfType:withQuery:urlString:headers:endpoint:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1A840B000, v0, v1, "Sending %{public}@ search start feedback to parsecd: %{private}@");
  OUTLINED_FUNCTION_1();
}

- (void)_customFeedbackOfType:(uint64_t)a3 JSONDictionary:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a3;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A840B000, v5, OS_LOG_TYPE_ERROR, "Failed to serialize feedback of type %lu with error %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)sendCrowdsourcedAutoFillFeedback:(uint64_t)a3 forQueryID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A840B000, a2, a3, "Sending AutoFill feedback: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendNewTabFeedback:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Sending new tab feedback to parsecd", a5, a6, a7, a8, 0);
}

- (void)sendClearInputFeedbackWithTriggerEvent:(uint64_t)a3 forQueryID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Sending input field cleared feedback to parsecd", a5, a6, a7, a8, 0);
}

@end
