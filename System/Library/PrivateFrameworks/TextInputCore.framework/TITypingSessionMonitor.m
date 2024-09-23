@implementation TITypingSessionMonitor

- (void)layoutDidChange:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "layoutDidChange:keyboardState:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)setClientID:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setClientID:keyboardState:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)currentInteractionObservers
{
  NSArray *interactionObservers;

  interactionObservers = self->_interactionObservers;
  if (!interactionObservers)
  {
    -[TITypingSessionMonitor _loadInteractionObservers](self, "_loadInteractionObservers");
    interactionObservers = self->_interactionObservers;
  }
  return interactionObservers;
}

- (void)_loadInteractionObservers
{
  id v3;
  TITypingSession *v4;
  void *v5;
  TITypingSession *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *interactionObservers;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = [TITypingSession alloc];
  -[TITypingSessionMonitor locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TITypingSession initWithLocale:keyboardLayout:](v4, "initWithLocale:keyboardLayout:", v5, 0);

  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "startSessionWithTimestamp:", v7, (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = (NSArray *)objc_msgSend(v8, "copy");
  interactionObservers = self->_interactionObservers;
  self->_interactionObservers = v13;

}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id obj;
  _BOOL4 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v21 = a6;
  v11 = a5;
  v12 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v14 = a7;
  v15 = a10;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", v22, v12, v11, v21, v14, a8.location, a8.length, a9, v15);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

}

- (void)changingContextWithTrigger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "changingContextWithTrigger:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)observeSession:(id)a3 sessionParams:(id)a4
{
  id v6;
  void *v7;
  TITypingSessionAligned *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "setSessionParams:", a4);
  -[TITypingSessionMonitor featureUsageMetricsCache](self, "featureUsageMetricsCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFeatureUsageMetricsCache:", v7);

  -[TITypingSessionMonitor _lazyLoadAggregatedEventObservers](self, "_lazyLoadAggregatedEventObservers");
  if ((objc_msgSend(v6, "didReceiveSecureFieldEvent") & 1) != 0
    || !-[NSMutableArray count](self->_aggregatedEventObservers, "count")
    && (-[TITypingSessionMonitor config](self, "config"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "usesDODMLLogging"),
        v9,
        !v10))
  {
    v8 = 0;
    goto LABEL_21;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1898;
  v38 = __Block_byref_object_dispose__1899;
  v39 = (id)os_transaction_create();
  v8 = -[TITypingSessionAligned initWithSession:]([TITypingSessionAligned alloc], "initWithSession:", v6);
  -[TITypingSessionAligned alignedEntries](v8, "alignedEntries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    goto LABEL_11;
  -[TITypingSessionAligned layouts](v8, "layouts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count")
    || !+[TITypingSessionMonitor shouldRecordSession:](TITypingSessionMonitor, "shouldRecordSession:", v6))
  {

LABEL_11:
    goto LABEL_12;
  }
  -[TITypingSessionMonitor config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "usesDODMLLogging");

  if (!v14)
  {
LABEL_12:
    v15 = (void *)v35[5];
    v35[5] = 0;
    goto LABEL_13;
  }
  -[TITypingSessionMonitor desRecordWriter](self, "desRecordWriter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __55__TITypingSessionMonitor_observeSession_sessionParams___block_invoke;
  v33[3] = &unk_1EA0FB110;
  v33[4] = &v34;
  objc_msgSend(v15, "storeAlignedSession:completion:", v8, v33);
LABEL_13:

  v16 = (void *)os_transaction_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = self->_aggregatedEventObservers;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v21++), "sessionDidEnd:aligned:", v6, v8, (_QWORD)v29);
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v19);
  }

  -[TITypingSessionMonitor userModel](self, "userModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSessionMonitor coreAnalyticsEventDispatcher](self, "coreAnalyticsEventDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "revisionRateAnalyzer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "revisionRateAnalysisSummary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dispatchFeedbackAnalyzers:aligned:revisionRateAnalysisSummary:", v6, v8, v25);

  -[TITypingSessionMonitor userModel](self, "userModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "persistForDate:", v27);

  _Block_object_dispose(&v34, 8);
LABEL_21:

  return v8;
}

void __85__TITypingSessionMonitor_endSessionWithInteractionObservers_sessionParams_timestamp___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "endSessionWithTimestamp:", *(_QWORD *)(a1 + 40));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v5);
    }

    if (TI_IS_INTERNAL_INSTALL::once_token != -1)
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
    if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
      v8 = objc_msgSend(v22, "BOOLForKey:", CFSTR("typingSessionNotificationsEnabled"));
      v23 = v8 ^ 1;
      if (TI_IS_INTERNAL_INSTALL::once_token != -1)
        dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
      if (TI_IS_INTERNAL_INSTALL::is_internal_install)
        v9 = v8;
      else
        v9 = 0;
      if (v9 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.keyboard.inputAnalytics.keyboardDidSuspend"), 0, 0, 1);

      }
    }
    else
    {
      v22 = 0;
      v23 = 1;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "analyzeSessionWithSessionParams:", *(_QWORD *)(a1 + 48));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 56), "_typingSessionFromInteractionObservers:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "setSessionParams:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v18, "setFeatureUsageMetricsCache:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 56));
      v19 = (id)objc_msgSend(WeakRetained, "observeSession:sessionParams:", v18, *(_QWORD *)(a1 + 48));
    }
    if (TI_IS_INTERNAL_INSTALL::once_token != -1)
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
    v20 = v23;
    if (!TI_IS_INTERNAL_INSTALL::is_internal_install)
      v20 = 1;
    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "queueCompletionHandler:", &__block_literal_global_1920);

    }
  }

}

- (id)resetInteractionObserversForNextSession
{
  void *v3;
  NSArray *interactionObservers;

  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  interactionObservers = self->_interactionObservers;
  self->_interactionObservers = 0;

  return v3;
}

- (TIFeatureUsageMetricsCache)featureUsageMetricsCache
{
  return self->_featureUsageMetricsCache;
}

- (void)endSessionWithInteractionObservers:(id)a3 sessionParams:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_copyWeak(&v16, &location);
  v14 = v10;
  v15 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  TIDispatchAsync();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)_typingSessionFromInteractionObservers:(id)a3
{
  return (id)objc_msgSend(a3, "firstObject");
}

- (void)_lazyLoadAggregatedEventObservers
{
  if (!self->_aggregatedEventObservers)
    -[TITypingSessionMonitor _loadAggregatedEventObservers](self, "_loadAggregatedEventObservers");
}

- (TITypingSessionMonitor)initWithConfig:(id)a3 metricDescriptorRegistry:(id)a4
{
  id v7;
  id v8;
  TITypingSessionMonitor *v9;
  TITypingSessionMonitor *v10;
  void *v11;
  uint64_t v12;
  NSLocale *locale;
  TIFeatureUsageMetricsCache *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  TIFeatureUsageMetricsCache *featureUsageMetricsCache;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *workQueue;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TITypingSessionMonitor;
  v9 = -[TITypingSessionMonitor init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_msgSend(v7, "inputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = objc_claimAutoreleasedReturnValue();
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v12;

    objc_storeStrong((id *)&v10->_metricDescriptorRegistry, a4);
    v14 = [TIFeatureUsageMetricsCache alloc];
    objc_msgSend(v7, "inputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "normalizedIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TIFeatureUsageMetricsCache initWithInputMode:metricDescriptorRegistry:](v14, "initWithInputMode:metricDescriptorRegistry:", v16, v8);
    featureUsageMetricsCache = v10->_featureUsageMetricsCache;
    v10->_featureUsageMetricsCache = (TIFeatureUsageMetricsCache *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = dispatch_queue_create("com.apple.textInput.TypingSessionMonitor", v20);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v21;

  }
  return v10;
}

- (void)addKeyInput:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "addKeyInput:keyboardState:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  id v6;
  void *v7;
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
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "addDrawInputWithSyllableCount:keyboardState:", a3, v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)addTouchEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addTouchEvent:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)candidatesOffered:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "candidatesOffered:keyboardState:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "acceptingCandidateWithTrigger:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v11 = a8;
  v34 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        LOBYTE(v25) = a9;
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:", v28, v27, v17, v18, v19, v11, v25, a10, v20);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v22);
  }

}

- (TITypingSession)currentTypingSession
{
  void *v3;
  void *v4;

  -[TITypingSessionMonitor currentInteractionObservers](self, "currentInteractionObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSessionMonitor _typingSessionFromInteractionObservers:](self, "_typingSessionFromInteractionObservers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TITypingSession *)v4;
}

- (void)tearDown
{
  if (self->_aggregatedEventObservers)
    TIDispatchAsync();
}

- (TIKBUserModel)userModel
{
  -[TITypingSessionMonitor _lazyLoadAggregatedEventObservers](self, "_lazyLoadAggregatedEventObservers");
  return self->_userModel;
}

- (TISKMetricCollector)sensorKitMetricCollector
{
  -[TITypingSessionMonitor _lazyLoadAggregatedEventObservers](self, "_lazyLoadAggregatedEventObservers");
  return self->_sensorKitMetricCollector;
}

- (TICoreAnalyticsEventDispatcher)coreAnalyticsEventDispatcher
{
  -[TITypingSessionMonitor _lazyLoadAggregatedEventObservers](self, "_lazyLoadAggregatedEventObservers");
  return self->_coreAnalyticsEventDispatcher;
}

- (TIDPEventDispatcher)differentialPrivacyEventDispatcher
{
  -[TITypingSessionMonitor _lazyLoadAggregatedEventObservers](self, "_lazyLoadAggregatedEventObservers");
  return self->_differentialPrivacyEventDispatcher;
}

- (TIBiomeObserver)biomeObserver
{
  -[TITypingSessionMonitor _lazyLoadAggregatedEventObservers](self, "_lazyLoadAggregatedEventObservers");
  return self->_biomeObserver;
}

- (void)_loadAggregatedEventObservers
{
  NSMutableArray *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TIKBUserModel *v11;
  TIKBUserModel *userModel;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  TISKMetricCollector *v20;
  TISKMetricCollector *sensorKitMetricCollector;
  TICoreAnalyticsEventDispatcher *v22;
  TICoreAnalyticsEventDispatcher *coreAnalyticsEventDispatcher;
  TIDPEventDispatcher *v24;
  TIDPEventDispatcher *differentialPrivacyEventDispatcher;
  TIBiomeObserver *v26;
  TIBiomeObserver *biomeObserver;
  NSMutableArray *aggregatedEventObservers;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  -[TITypingSessionMonitor config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesUserModelLogging");

  if (v5)
  {
    -[TITypingSessionMonitor config](self, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "normalizedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBDDC0], "sharedUserModelDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSessionMonitor metricDescriptorRegistry](self, "metricDescriptorRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIKBUserModel userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:](TIKBUserModel, "userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:", v8, v9, v10, 0);
    v11 = (TIKBUserModel *)objc_claimAutoreleasedReturnValue();
    userModel = self->_userModel;
    self->_userModel = v11;

    -[NSMutableArray addObject:](v3, "addObject:", self->_userModel);
  }
  -[TITypingSessionMonitor config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sensorKitEnabled");

  if (v14)
  {
    -[TITypingSessionMonitor config](self, "config");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSessionMonitor config](self, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "sensorKitWordsThreshold");
    -[TITypingSessionMonitor config](self, "config");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[TISKMetricCollector makeMetricCollector:wordsThreshold:isTesting:](TISKMetricCollector, "makeMetricCollector:wordsThreshold:isTesting:", v16, v18, objc_msgSend(v19, "isTesting"));
    v20 = (TISKMetricCollector *)objc_claimAutoreleasedReturnValue();
    sensorKitMetricCollector = self->_sensorKitMetricCollector;
    self->_sensorKitMetricCollector = v20;

    if (self->_sensorKitMetricCollector)
      -[NSMutableArray addObject:](v3, "addObject:");
  }
  v22 = objc_alloc_init(TICoreAnalyticsEventDispatcher);
  coreAnalyticsEventDispatcher = self->_coreAnalyticsEventDispatcher;
  self->_coreAnalyticsEventDispatcher = v22;

  -[NSMutableArray addObject:](v3, "addObject:", self->_coreAnalyticsEventDispatcher);
  v24 = objc_alloc_init(TIDPEventDispatcher);
  differentialPrivacyEventDispatcher = self->_differentialPrivacyEventDispatcher;
  self->_differentialPrivacyEventDispatcher = v24;

  -[NSMutableArray addObject:](v3, "addObject:", self->_differentialPrivacyEventDispatcher);
  v26 = objc_alloc_init(TIBiomeObserver);
  biomeObserver = self->_biomeObserver;
  self->_biomeObserver = v26;

  -[NSMutableArray addObject:](v3, "addObject:", self->_biomeObserver);
  aggregatedEventObservers = self->_aggregatedEventObservers;
  self->_aggregatedEventObservers = v3;

}

- (TITypingDESRecordWriter)desRecordWriter
{
  TITypingDESRecordWriter *desRecordWriter;
  TITypingDESRecordWriter *v4;
  TITypingDESRecordWriter *v5;

  desRecordWriter = self->_desRecordWriter;
  if (!desRecordWriter)
  {
    v4 = objc_alloc_init(TITypingDESRecordWriter);
    v5 = self->_desRecordWriter;
    self->_desRecordWriter = v4;

    desRecordWriter = self->_desRecordWriter;
  }
  return desRecordWriter;
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (TIMetricDescriptorRegistry)metricDescriptorRegistry
{
  return self->_metricDescriptorRegistry;
}

- (void)setMetricDescriptorRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, a3);
}

- (void)setDesRecordWriter:(id)a3
{
  objc_storeStrong((id *)&self->_desRecordWriter, a3);
}

- (NSArray)interactionObservers
{
  return self->_interactionObservers;
}

- (void)setInteractionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_interactionObservers, a3);
}

- (NSMutableArray)aggregatedEventObservers
{
  return self->_aggregatedEventObservers;
}

- (void)setAggregatedEventObservers:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedEventObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_aggregatedEventObservers, 0);
  objc_storeStrong((id *)&self->_interactionObservers, 0);
  objc_storeStrong((id *)&self->_desRecordWriter, 0);
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_featureUsageMetricsCache, 0);
  objc_storeStrong((id *)&self->_biomeObserver, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyEventDispatcher, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEventDispatcher, 0);
  objc_storeStrong((id *)&self->_sensorKitMetricCollector, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __55__TITypingSessionMonitor_observeSession_sessionParams___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((a3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TITypingSessionMonitor observeSession:sessionParams:]_block_invoke";
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  failed to write DESRecord", (uint8_t *)&v8, 0xCu);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __34__TITypingSessionMonitor_tearDown__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "tearDown", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __85__TITypingSessionMonitor_endSessionWithInteractionObservers_sessionParams_timestamp___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.keyboard.inputAnalytics.sessionObserversDidComplete"), 0, 0, 1);

}

+ (BOOL)shouldRecordSession:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = shouldRecordSession__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldRecordSession__onceToken, &__block_literal_global_33);
  v5 = (void *)shouldRecordSession__allowlistedAppIDs;
  objc_msgSend(v4, "applicationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __46__TITypingSessionMonitor_shouldRecordSession___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.MobileMail"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.Spotlight"), CFSTR("com.apple.mobilecal"), CFSTR("com.apple.Maps"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldRecordSession__allowlistedAppIDs;
  shouldRecordSession__allowlistedAppIDs = v0;

}

@end
