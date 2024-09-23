@implementation SignpostIntervalBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caInstrumentationProcessor, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_outstandingAnimationState, 0);
  objc_storeStrong((id *)&self->_threadwideDictionary, 0);
  objc_storeStrong((id *)&self->_processwideDictionary, 0);
  objc_storeStrong((id *)&self->_systemwideDictionary, 0);
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleHIDLatency:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (SignpostIntervalBuilder)init
{
  SignpostIntervalBuilder *v2;
  SignpostIntervalBuilder *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *syncQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SignpostIntervalBuilder;
  v2 = -[SignpostIntervalBuilder init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SignpostIntervalBuilder dropAccumulatedState](v2, "dropAccumulatedState");
    v3->_buildSkyLightAnimationCompositeIntervalTimelines = 1;
    v4 = dispatch_queue_create("SignpostIntervalBuilder sync queue", 0);
    syncQueue = v3->_syncQueue;
    v3->_syncQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dropAccumulatedState
{
  NSMutableDictionary *v3;
  NSMutableDictionary *systemwideDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *processwideDictionary;
  NSMutableDictionary *v7;
  NSMutableDictionary *threadwideDictionary;
  SignpostCAInstrumentationProcessor *v9;
  SignpostCAInstrumentationProcessor *caInstrumentationProcessor;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMapTable *outstandingAnimationState;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  systemwideDictionary = self->_systemwideDictionary;
  self->_systemwideDictionary = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  processwideDictionary = self->_processwideDictionary;
  self->_processwideDictionary = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  threadwideDictionary = self->_threadwideDictionary;
  self->_threadwideDictionary = v7;

  v9 = objc_alloc_init(SignpostCAInstrumentationProcessor);
  caInstrumentationProcessor = self->_caInstrumentationProcessor;
  self->_caInstrumentationProcessor = v9;

  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke;
  v32[3] = &unk_1E4601240;
  objc_copyWeak(&v33, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCommitIntervalBlock:", v32);

  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_2;
  v30[3] = &unk_1E4601268;
  objc_copyWeak(&v31, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClientDrawableIntervalBlock:", v30);

  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_3;
  v28[3] = &unk_1E4601290;
  objc_copyWeak(&v29, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTransactionLifetimeBlock:", v28);

  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_4;
  v26[3] = &unk_1E46012B8;
  objc_copyWeak(&v27, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidLatencyBlock:", v26);

  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_5;
  v24[3] = &unk_1E46012E0;
  objc_copyWeak(&v25, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRenderBlock:", v24);

  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_6;
  v22[3] = &unk_1E4601308;
  objc_copyWeak(&v23, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrameLatencyBlock:", v22);

  objc_copyWeak(&v21, &location);
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor", v11, 3221225472, __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_7, &unk_1E4601330);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrameLifetimeBlock:", &v20);

  outstandingAnimationState = self->_outstandingAnimationState;
  self->_outstandingAnimationState = 0;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  SignpostInterval *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "_resolvedEventType") & 2) == 0)
    __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 40), "_matchingEventForEvent:removeIfFound:", *(_QWORD *)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = v2;
    if (objc_msgSend(v2, "isAnimationStart"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_animationWithBegin:endEvent:firstFrameGraceTimeController:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v3 = objc_claimAutoreleasedReturnValue();
      **(_BYTE **)(a1 + 64) = 1;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;
    }
    else
    {
      v6 = -[SignpostInterval initWithBeginEvent:endEvent:]([SignpostInterval alloc], "initWithBeginEvent:endEvent:", v9, *(_QWORD *)(a1 + 32));
      if ((objc_msgSend(*(id *)(a1 + 40), "_handleCommonSpecialIntervals:", v6) & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 40), "_handleMacOsSpecialIntervals:", v6) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "caInstrumentationProcessor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleSignpostInterval:", v6);

      }
      **(_BYTE **)(a1 + 64) = 0;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v6;
    }

    v2 = v9;
  }

}

- (BOOL)_trackBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  BOOL v25;
  NSObject *v26;
  void *v27;

  v4 = a3;
  if (!objc_msgSend(v4, "scope"))
  {
    objc_msgSend(v4, "_key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostIntervalBuilder systemwideDictionary](self, "systemwideDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _signpost_debug_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SignpostIntervalBuilder _trackBegin:].cold.1((uint64_t)v5, v14, v15, v16, v17, v18, v19, v20);

      goto LABEL_19;
    }
    -[SignpostIntervalBuilder systemwideDictionary](self, "systemwideDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v4, v5);

    goto LABEL_28;
  }
  if (objc_msgSend(v4, "scope") != 1)
  {
    if (objc_msgSend(v4, "scope") != 2)
    {
      _signpost_debug_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[SignpostIntervalBuilder _trackBegin:].cold.5();

      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostIntervalBuilder threadwideDictionary](self, "threadwideDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostIntervalBuilder threadwideDictionary](self, "threadwideDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v7, v5);

    }
    objc_msgSend(v4, "_key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v24)
        -[SignpostIntervalBuilder _trackBegin:].cold.4(v4, (uint64_t)v9, v11);
      goto LABEL_18;
    }
    if (v24)
      -[SignpostIntervalBuilder _trackBegin:].cold.3(v4);

    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostIntervalBuilder processwideDictionary](self, "processwideDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostIntervalBuilder processwideDictionary](self, "processwideDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v5);

  }
  objc_msgSend(v4, "_key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_27:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v9);

LABEL_28:
LABEL_29:
    v25 = 1;
    goto LABEL_30;
  }
  _signpost_debug_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SignpostIntervalBuilder _trackBegin:].cold.2(v4);
LABEL_18:

LABEL_19:
  v25 = 0;
LABEL_30:

  return v25;
}

- (id)_matchingEventForEvent:(id)a3 removeIfFound:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    _signpost_debug_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.1();
    goto LABEL_29;
  }
  v8 = objc_msgSend(v6, "scope");
  if (v8 == 2)
  {
    -[SignpostIntervalBuilder threadwideDictionary](self, "threadwideDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "threadID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "_key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && v4)
        goto LABEL_19;

      if (v11)
        goto LABEL_30;
    }
    _signpost_debug_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.5(v7, v17);
LABEL_28:

LABEL_29:
    v11 = 0;
    goto LABEL_30;
  }
  if (v8 == 1)
  {
    -[SignpostIntervalBuilder processwideDictionary](self, "processwideDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "processID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "_key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15);
      v20 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v20;
      if (v4 && v20)
      {
LABEL_19:
        -[NSObject removeObjectForKey:](v9, "removeObjectForKey:", v15);

        goto LABEL_30;
      }

      if (v11)
        goto LABEL_30;
    }
    _signpost_debug_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.4(v7);
    goto LABEL_28;
  }
  if (v8)
  {
    _signpost_debug_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.2();
    goto LABEL_29;
  }
  objc_msgSend(v7, "_key");
  v9 = objc_claimAutoreleasedReturnValue();
  -[SignpostIntervalBuilder systemwideDictionary](self, "systemwideDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _signpost_debug_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.3((uint64_t)v9, v12, v21, v22, v23, v24, v25, v26);
    goto LABEL_24;
  }
  if (v4)
  {
    -[SignpostIntervalBuilder systemwideDictionary](self, "systemwideDictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", v9);
LABEL_24:

  }
LABEL_30:

  return v11;
}

- (NSMutableDictionary)processwideDictionary
{
  return self->_processwideDictionary;
}

void __45__SignpostIntervalBuilder_processBeginEvent___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  char v5;
  int v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "_resolvedEventType") & 1) == 0)
    __45__SignpostIntervalBuilder_processBeginEvent___block_invoke_cold_1();
  if (objc_msgSend(*(id *)(a1 + 40), "_trackBegin:", *(_QWORD *)(a1 + 32)))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "isAnimationStart");
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    if (v2)
    {
      objc_msgSend(v3, "_startTrackingAnimationWithBeginEvent:", v4);
LABEL_9:
      v5 = 1;
      goto LABEL_10;
    }
    v6 = objc_msgSend(v3, "signpostIsSkyLightCompositeLoop:", v4);
    v7 = *(void **)(a1 + 40);
    if (!v6)
    {
      objc_msgSend(v7, "caInstrumentationProcessor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleSignpostIntervalBegin:", *(_QWORD *)(a1 + 32));

      goto LABEL_9;
    }
    v5 = 1;
    objc_msgSend(v7, "setSkyLightCompositeIntervalIsInFlight:", 1);
  }
  else
  {
    v5 = 0;
  }
LABEL_10:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
}

- (SignpostCAInstrumentationProcessor)caInstrumentationProcessor
{
  return self->_caInstrumentationProcessor;
}

- (BOOL)signpostIsSkyLightCompositeLoop:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SkyLight")))
  {
    objc_msgSend(v3, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("performance_instrumentation")))
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CompositeLoop"));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasOutstandingAnimations
{
  void *v2;
  BOOL v3;

  -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMapTable)outstandingAnimationState
{
  return self->_outstandingAnimationState;
}

- (BOOL)isMetadataSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (-[SignpostIntervalBuilder isSkyLightCompositeLoopSubsystem:category:](self, "isSkyLightCompositeLoopSubsystem:category:", v6, v7))
  {
    v8 = 1;
  }
  else
  {
    v8 = SSCAIsCAMetadataSubsystemCategory(v6, v7);
  }

  return v8;
}

- (BOOL)isSkyLightCompositeLoopSubsystem:(id)a3 category:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.SkyLight")))
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("performance_instrumentation"));
  else
    v6 = 0;

  return v6;
}

- (BOOL)processBeginEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  SignpostIntervalBuilder *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[SignpostIntervalBuilder syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SignpostIntervalBuilder_processBeginEvent___block_invoke;
  block[3] = &unk_1E4601380;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (id)processEndEvent:(id)a3 firstFrameGraceTimeController:(id)a4 isAnimation:(BOOL *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v16;
  SignpostIntervalBuilder *v17;
  id v18;
  uint64_t *v19;
  BOOL *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  -[SignpostIntervalBuilder syncQueue](self, "syncQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke;
  block[3] = &unk_1E46013A8;
  v16 = v8;
  v17 = self;
  v19 = &v21;
  v20 = a5;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (BOOL)_handleCommonSpecialIntervals:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[SignpostIntervalBuilder hasOutstandingAnimations](self, "hasOutstandingAnimations"))
  {
    -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "handleSignpostInterval:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)processEmittedEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostIntervalBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSignpostEvent:", v4);

}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleRenderServerRender:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (NSMutableDictionary)systemwideDictionary
{
  return self->_systemwideDictionary;
}

- (BOOL)_handleMacOsSpecialIntervals:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;

  v4 = a3;
  objc_msgSend(v4, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SignpostIntervalBuilder signpostIsSkyLightCompositeLoop:](self, "signpostIsSkyLightCompositeLoop:", v5);

  if (v6)
    -[SignpostIntervalBuilder _processSkyLightCompositeInterval:](self, "_processSkyLightCompositeInterval:", v4);

  return v6;
}

- (id)_animationWithBegin:(id)a3 endEvent:(id)a4 firstFrameGraceTimeController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  SignpostAnimationInterval *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "_hasTotalSkyLightCompositeCount") & 1) == 0)
  {
    v13 = -[SignpostIntervalBuilder totalSkyLightCompositeIntervalCount](self, "totalSkyLightCompositeIntervalCount");
    if (v13 >= objc_msgSend(v8, "_totalSkyLightCompositeCount"))
      v14 = -[SignpostIntervalBuilder totalSkyLightCompositeIntervalCount](self, "totalSkyLightCompositeIntervalCount");
    else
      v14 = objc_msgSend(v8, "_totalSkyLightCompositeCount");
    objc_msgSend(v9, "set_totalSkyLightCompositeCount:", v14);
    objc_msgSend(v9, "set_hasTotalSkyLightCompositeCount:", 1);
  }
  v15 = -[SignpostAnimationInterval initWithBeginEvent:endEvent:accumulatedState:firstFrameGraceTimeController:]([SignpostAnimationInterval alloc], "initWithBeginEvent:endEvent:accumulatedState:firstFrameGraceTimeController:", v8, v9, v12, v10);

  -[SignpostIntervalBuilder _cleanupStateForBeginEvent:](self, "_cleanupStateForBeginEvent:", v8);
  return v15;
}

- (unint64_t)totalSkyLightCompositeIntervalCount
{
  return self->_totalSkyLightCompositeIntervalCount;
}

- (void)_startTrackingAnimationWithBeginEvent:(id)a3
{
  SignpostAnimationAccumulatedState *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SignpostIntervalBuilder _initializeMapsIfNecessary](self, "_initializeMapsIfNecessary");
  v4 = -[SignpostAnimationAccumulatedState initWithAnimationBeginEvent:shouldTrackComposites:]([SignpostAnimationAccumulatedState alloc], "initWithAnimationBeginEvent:shouldTrackComposites:", v6, -[SignpostIntervalBuilder buildSkyLightAnimationCompositeIntervalTimelines](self, "buildSkyLightAnimationCompositeIntervalTimelines"));
  -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  if ((objc_msgSend(v6, "_hasTotalSkyLightCompositeCount") & 1) == 0)
  {
    objc_msgSend(v6, "set_totalSkyLightCompositeCount:", -[SignpostIntervalBuilder totalSkyLightCompositeIntervalCount](self, "totalSkyLightCompositeIntervalCount")+ -[SignpostIntervalBuilder skyLightCompositeIntervalIsInFlight](self, "skyLightCompositeIntervalIsInFlight"));
    objc_msgSend(v6, "set_hasTotalSkyLightCompositeCount:", 1);
  }

}

- (BOOL)skyLightCompositeIntervalIsInFlight
{
  return self->_skyLightCompositeIntervalIsInFlight;
}

- (BOOL)buildSkyLightAnimationCompositeIntervalTimelines
{
  return self->_buildSkyLightAnimationCompositeIntervalTimelines;
}

- (void)_initializeMapsIfNecessary
{
  void *v3;
  id v4;

  -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SignpostIntervalBuilder setOutstandingAnimationState:](self, "setOutstandingAnimationState:", v4);

  }
}

- (void)setOutstandingAnimationState:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingAnimationState, a3);
}

- (void)_cleanupStateForBeginEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v8);

    -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      -[SignpostIntervalBuilder setOutstandingAnimationState:](self, "setOutstandingAnimationState:", 0);
  }

}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleFrameLifetime:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleFrameLatency:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleCommitInterval:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

+ (id)_framerateCalculationAllowlist:(BOOL)a3
{
  _BOOL4 v3;
  SignpostSupportSubsystemCategoryAllowlist *v4;

  v3 = a3;
  v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  -[SignpostSupportSubsystemCategoryFilter addSubsystem:category:](v4, "addSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("performance_instrumentation"));
  +[SignpostCAInstrumentationProcessor addNeededSCToAllowlist:](SignpostCAInstrumentationProcessor, "addNeededSCToAllowlist:", v4);
  if (v3)
    +[SignpostCAInstrumentationProcessor addNeededMetalSCToAllowlist:](SignpostCAInstrumentationProcessor, "addNeededMetalSCToAllowlist:", v4);
  return v4;
}

+ (BOOL)_filterPassesRequiredSCForFramerate:(id)a3 includeMetal:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _BOOL4 v6;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "passesSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("performance_instrumentation")))
  {
    v6 = +[SignpostCAInstrumentationProcessor filterPassesRequiredSCForCAInstrumentation:](SignpostCAInstrumentationProcessor, "filterPassesRequiredSCForCAInstrumentation:", v5);
    if (v6 && v4)
      LOBYTE(v6) = +[SignpostCAInstrumentationProcessor filterPassesRequiredSCForCAMetalInstrumentation:](SignpostCAInstrumentationProcessor, "filterPassesRequiredSCForCAMetalInstrumentation:", v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleClientDrawableInterval:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(WeakRetained, "caInstrumentationProcessor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleTransactionLifetimeInterval:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (BOOL)timestampIndicatesDeviceReboot:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v6;

  v5 = -[SignpostIntervalBuilder previousMCT](self, "previousMCT");
  if (v5 > a3)
  {
    _signpost_debug_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SignpostIntervalBuilder timestampIndicatesDeviceReboot:].cold.1();

    -[SignpostIntervalBuilder dropAccumulatedState](self, "dropAccumulatedState");
  }
  -[SignpostIntervalBuilder setPreviousMCT:](self, "setPreviousMCT:", a3);
  return v5 > a3;
}

- (id)matchingEventForEvent:(id)a3 removeIfFound:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  -[SignpostIntervalBuilder syncQueue](self, "syncQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SignpostIntervalBuilder_matchingEventForEvent_removeIfFound___block_invoke;
  v11[3] = &unk_1E4601358;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __63__SignpostIntervalBuilder_matchingEventForEvent_removeIfFound___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_matchingEventForEvent:removeIfFound:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_metalCalculationAllowlist
{
  SignpostSupportSubsystemCategoryAllowlist *v2;

  v2 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  +[SignpostCAInstrumentationProcessor addNeededMetalSCToAllowlist:](SignpostCAInstrumentationProcessor, "addNeededMetalSCToAllowlist:", v2);
  return v2;
}

- (BOOL)signpostIsAnimationMetadata:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[SignpostIntervalBuilder signpostIsSkyLightCompositeLoop:](self, "signpostIsSkyLightCompositeLoop:", v4)
    || SSCAEventTypeForSignpost(v4) != 2
    || SSCAIntervalTypeForSignpostInterval(v4) != 14;

  return v5;
}

- (void)_processSkyLightCompositeInterval:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SignpostSupportCompositorInterval *v7;
  uint64_t v8;
  uint64_t v9;
  SignpostSupportCompositorInterval *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SignpostIntervalBuilder buildSkyLightAnimationCompositeIntervalTimelines](self, "buildSkyLightAnimationCompositeIntervalTimelines"))
  {
    -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = [SignpostSupportCompositorInterval alloc];
      v8 = objc_msgSend(v4, "startMachContinuousTime");
      v9 = objc_msgSend(v4, "endMachContinuousTime");
      objc_msgSend(v4, "timebaseRatio");
      v10 = -[SignpostSupportCompositorInterval initWithStartContinuousTime:endContinuousTime:timebaseRatio:contributingPids:](v7, "initWithStartContinuousTime:endContinuousTime:timebaseRatio:contributingPids:", v8, v9, 0);
      if (v10)
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        -[SignpostIntervalBuilder outstandingAnimationState](self, "outstandingAnimationState", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectEnumerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v18;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "addCompositorInterval:", v10);
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v14);
        }

      }
    }
  }
  -[SignpostIntervalBuilder setTotalSkyLightCompositeIntervalCount:](self, "setTotalSkyLightCompositeIntervalCount:", -[SignpostIntervalBuilder totalSkyLightCompositeIntervalCount](self, "totalSkyLightCompositeIntervalCount") + 1);
  -[SignpostIntervalBuilder setSkyLightCompositeIntervalIsInFlight:](self, "setSkyLightCompositeIntervalIsInFlight:", 0);

}

- (id)doneProcessing
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[SignpostIntervalBuilder syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SignpostIntervalBuilder_doneProcessing__block_invoke;
  v6[3] = &unk_1E46013F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__SignpostIntervalBuilder_doneProcessing__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "systemwideDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99DE8];
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "systemwideDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "processwideDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v18, "count"))
        {
          v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v18, "allValues");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v15);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "threadwideDictionary", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v27, "count"))
        {
          v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v27, "allValues");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObjectsFromArray:", v29);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sortUsingComparator:", &__block_literal_global_14);
  return objc_msgSend(*(id *)(a1 + 32), "dropAccumulatedState");
}

uint64_t __41__SignpostIntervalBuilder_doneProcessing__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "startMachContinuousTime");
  if (v6 >= objc_msgSend(v5, "startMachContinuousTime"))
  {
    v8 = objc_msgSend(v4, "startMachContinuousTime");
    v7 = v8 > objc_msgSend(v5, "startMachContinuousTime");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)setBuildSkyLightAnimationCompositeIntervalTimelines:(BOOL)a3
{
  self->_buildSkyLightAnimationCompositeIntervalTimelines = a3;
}

- (NSMutableDictionary)threadwideDictionary
{
  return self->_threadwideDictionary;
}

- (void)setTotalSkyLightCompositeIntervalCount:(unint64_t)a3
{
  self->_totalSkyLightCompositeIntervalCount = a3;
}

- (void)setSkyLightCompositeIntervalIsInFlight:(BOOL)a3
{
  self->_skyLightCompositeIntervalIsInFlight = a3;
}

- (unint64_t)previousMCT
{
  return self->_previousMCT;
}

- (void)setPreviousMCT:(unint64_t)a3
{
  self->_previousMCT = a3;
}

- (void)timestampIndicatesDeviceReboot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_1A1A28000, v0, v1, "Dropping accumulated state due to out of order timestamp.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_matchingEventForEvent:removeIfFound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_1A1A28000, v0, v1, "Asked to match nil event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_matchingEventForEvent:removeIfFound:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_1A1A28000, v0, v1, "Asked to match on unknown scope", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_matchingEventForEvent:(uint64_t)a3 removeIfFound:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a2, a3, "Could not find key %@ in systemwide scope", a5, a6, a7, a8, 2u);
}

- (void)_matchingEventForEvent:(void *)a1 removeIfFound:.cold.4(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "_key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processID");
  OUTLINED_FUNCTION_1_1(&dword_1A1A28000, v3, v4, "Could not find key %@ in processwide scope for PID %d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)_matchingEventForEvent:(void *)a1 removeIfFound:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a1, "threadID");
  _os_log_debug_impl(&dword_1A1A28000, a2, OS_LOG_TYPE_DEBUG, "Could not find key %@ in threadwide scope for thread %#llx", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_4();
}

- (void)_trackBegin:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a2, a3, "Collision in systemwide scope on %@. Ignoring.", a5, a6, a7, a8, 2u);
}

- (void)_trackBegin:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "processID");
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1A1A28000, v1, v2, "Collision in processwide scope for pid %u on %@. Ignoring.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)_trackBegin:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "processID");
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1A1A28000, v1, v2, "Adding threadwide event for pid %u on %@.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)_trackBegin:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6[0] = 67109634;
  v6[1] = objc_msgSend(a1, "processID");
  v7 = 2048;
  v8 = objc_msgSend(a1, "threadID");
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1A1A28000, a3, OS_LOG_TYPE_DEBUG, "Collision in threadwide scope for pid %u, tid %llu on %@. Ignoring.", (uint8_t *)v6, 0x1Cu);
}

- (void)_trackBegin:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_1A1A28000, v0, v1, "Unknown scope for event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __45__SignpostIntervalBuilder_processBeginEvent___block_invoke_cold_1()
{
  __assert_rtn("-[SignpostIntervalBuilder processBeginEvent:]_block_invoke", "SignpostIntervalBuilder.m", 455, "beginEvent._resolvedEventType & SignpostResolvedEventType_IntervalBeginEvent");
}

void __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke_cold_1()
{
  __assert_rtn("-[SignpostIntervalBuilder processEndEvent:firstFrameGraceTimeController:isAnimation:]_block_invoke", "SignpostIntervalBuilder.m", 560, "endEvent._resolvedEventType & SignpostResolvedEventType_IntervalEndEvent");
}

@end
