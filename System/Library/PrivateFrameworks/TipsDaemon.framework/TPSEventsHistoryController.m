@implementation TPSEventsHistoryController

+ (void)removeEventHistoryCache
{
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("DeliveryEventIdentifierToDeliveryEventMap"));
}

- (TPSEventsHistoryController)initWithTipStatusController:(id)a3
{
  id v5;
  TPSEventsHistoryController *v6;
  TPSEventsHistoryController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *contextualEventIdentifierToContextualEventMap;
  uint64_t v14;
  NSMutableDictionary *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *eventQueue;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSEventsHistoryController;
  v6 = -[TPSEventsHistoryController init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tipStatusController, a3);
    v8 = (void *)MEMORY[0x1E0C99E20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClasses:forKey:", v11, CFSTR("DeliveryEventIdentifierToDeliveryEventMap"));
    v12 = objc_claimAutoreleasedReturnValue();
    contextualEventIdentifierToContextualEventMap = v7->_contextualEventIdentifierToContextualEventMap;
    v7->_contextualEventIdentifierToContextualEventMap = (NSMutableDictionary *)v12;

    if (!v7->_contextualEventIdentifierToContextualEventMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v7->_contextualEventIdentifierToContextualEventMap;
      v7->_contextualEventIdentifierToContextualEventMap = (NSMutableDictionary *)v14;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.tips.TPSEventsHistoryController.eventQueue", v16);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v17;

  }
  return v7;
}

- (NSDictionary)contextualEventsForIdentifiers
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
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__TPSEventsHistoryController_contextualEventsForIdentifiers__block_invoke;
  v6[3] = &unk_1EA1DFEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __60__TPSEventsHistoryController_contextualEventsForIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "contextualEventIdentifierToContextualEventMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count");
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextualEventIdentifierToContextualEventMap");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v1, "copy");
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (v3)
  {

  }
}

- (id)contextualEventsBySourceMap
{
  NSObject *v3;
  id v4;
  _QWORD block[7];
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__15;
  v7[4] = __Block_byref_object_dispose__15;
  v8 = 0;
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__TPSEventsHistoryController_contextualEventsBySourceMap__block_invoke;
  block[3] = &unk_1EA1E1118;
  block[4] = self;
  block[5] = v7;
  block[6] = &v9;
  dispatch_sync(v3, block);

  v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __57__TPSEventsHistoryController_contextualEventsBySourceMap__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "matchedDate", (_QWORD)v21);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v10, "status");

          if (v13)
            continue;
        }
        v14 = objc_msgSend(v10, "type");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(_QWORD *)(a1[6] + 8);
            v20 = *(void **)(v19 + 40);
            *(_QWORD *)(v19 + 40) = v18;

            v17 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v15);
        }
        objc_msgSend(v16, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

- (id)allContextualEvents
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
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TPSEventsHistoryController_allContextualEvents__block_invoke;
  v6[3] = &unk_1EA1DFEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__TPSEventsHistoryController_allContextualEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)contextualEventsForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[TPSEventsHistoryController _contextualEventForIdentifier:](self, "_contextualEventForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_contextualEventForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TPSEventsHistoryController__contextualEventForIdentifier___block_invoke;
  block[3] = &unk_1EA1E0DE0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__TPSEventsHistoryController__contextualEventForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setContextualEvent:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__TPSEventsHistoryController__setContextualEvent_forIdentifier___block_invoke;
  v11[3] = &unk_1EA1E1140;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__TPSEventsHistoryController__setContextualEvent_forIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

}

- (void)_addEvents:(id)a3 contentIdentifier:(id)a4 eventSinceDate:(id)a5 minObservationCount:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TPSContextualEventBuilder *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v22 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0DBF390], "identifierFromEventInfoDictionary:", v16, v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSEventsHistoryController _contextualEventForIdentifier:](self, "_contextualEventForIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (!v11)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v18, "setEventSinceDate:", v11);
          objc_msgSend(v18, "setMatchedDate:", 0);
          objc_msgSend(v18, "removeAllObservations");
          goto LABEL_9;
        }
        v19 = -[TPSContextualEventBuilder initWithDictionary:]([TPSContextualEventBuilder alloc], "initWithDictionary:", v16);
        -[TPSContextualEventBuilder contextualEvent](v19, "contextualEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v20;
        if (v20)
        {
          if (v22 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v20, "status") == 1)
            objc_msgSend(v18, "setMinObservationCount:", v22);
          -[TPSEventsHistoryController _setContextualEvent:forIdentifier:](self, "_setContextualEvent:forIdentifier:", v18, v17);
        }

        if (v11)
          goto LABEL_8;
LABEL_9:
        objc_msgSend(v18, "addObserverIdentifier:", v10);

        ++v15;
      }
      while (v13 != v15);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v13 = v21;
    }
    while (v21);
  }

}

- (void)addEventsFromTriggerEvents:(id)a3 desiredOutcomeEvents:(id)a4 contentIdentifier:(id)a5 eventSinceDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v15)
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(MEMORY[0x1E0DBF348], "isInternalDevice"))
    {
      v14 = objc_msgSend(MEMORY[0x1E0DBF3A0], "triggerMinObservationCount");
      if ((unint64_t)(v14 - 1) < 0x7FFFFFFFFFFFFFFELL)
        v13 = v14;
    }
    -[TPSEventsHistoryController _addEvents:contentIdentifier:eventSinceDate:minObservationCount:](self, "_addEvents:contentIdentifier:eventSinceDate:minObservationCount:", v15, v11, v12, v13);
  }
  if (v10)
    -[TPSEventsHistoryController _addEvents:contentIdentifier:eventSinceDate:minObservationCount:](self, "_addEvents:contentIdentifier:eventSinceDate:minObservationCount:", v10, v11, v12, 0x7FFFFFFFFFFFFFFFLL);

}

- (void)processEventProviderQueryResults:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (objc_msgSend(v6, "count"))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__15;
    v21 = __Block_byref_object_dispose__15;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__15;
    v15 = __Block_byref_object_dispose__15;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke;
    v10[3] = &unk_1EA1E1190;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = &v11;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
    objc_msgSend((id)v18[5], "minusSet:", v12[5]);
    objc_msgSend((id)v18[5], "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12[5], "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v9);

    -[TPSEventsHistoryController updateCacheData](self, "updateCacheData");
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void (**v31)(void *, id);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contextualEventForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "resultDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_msgSend(v5, "eventSinceDate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v5, "eventSinceDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "compare:", v9);

      if (v13 == 1)
      {
        objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "eventSinceDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v15;
          v48 = 2112;
          v49 = (uint64_t)v9;
          _os_log_impl(&dword_1DAC2F000, v14, OS_LOG_TYPE_DEFAULT, "Event since date (%@) for delivery event is later in time than result date (%@). Skipping result...", buf, 0x16u);

        }
        goto LABEL_30;
      }
    }
    objc_msgSend(v9, "dateByAddingTimeInterval:", -180.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEventSinceDate:", v16);

    objc_msgSend(v3, "bookmark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBookmark:", v17);

    objc_msgSend(v3, "bookmark");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_2(v3);

    }
    objc_msgSend(v3, "observationMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "observedWithResults:", v20);

    objc_msgSend(v5, "observerIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "observationMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v5, "observationMap");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v47 = v38;
        v48 = 2048;
        v49 = objc_msgSend(v26, "count");
        v50 = 1024;
        v51 = objc_msgSend(v5, "minObservationCount");
        _os_log_impl(&dword_1DAC2F000, v27, OS_LOG_TYPE_DEFAULT, "Event %@, current observation count: %zd. Expected observation count: %d ", buf, 0x1Cu);

      }
      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_1(v5);

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_15;
    aBlock[3] = &unk_1EA1E1168;
    v45 = *(_QWORD *)(a1 + 40);
    v29 = v5;
    v40 = v29;
    v41 = v9;
    v14 = v23;
    v30 = *(_QWORD *)(a1 + 32);
    v42 = v14;
    v43 = v30;
    v44 = v3;
    v31 = (void (**)(void *, id))_Block_copy(aBlock);
    if (objc_msgSend(v29, "status") == 1)
    {
      if (!v21)
        goto LABEL_29;
    }
    else if (v21)
    {
      v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v35 = *(void **)(v34 + 40);
        *(_QWORD *)(v34 + 40) = v33;

        v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v32, "addObjectsFromArray:", v14);
      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v29, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v37;
        _os_log_impl(&dword_1DAC2F000, v36, OS_LOG_TYPE_DEFAULT, "Event %@ invalidated due to absent event observed.", buf, 0xCu);

      }
      goto LABEL_29;
    }
    v31[2](v31, v29);
LABEL_29:

LABEL_30:
  }

}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_msgSend(*(id *)(a1 + 32), "setMatchedDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setBookmark:", 0);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObjectsFromArray:");
    v7 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_persistUserInfo:forObserverIdentifiers:", v8, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "matchedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1DAC2F000, v9, OS_LOG_TYPE_DEFAULT, "Event %@, matched at %@.", (uint8_t *)&v12, 0x16u);

  }
}

- (void)_persistUserInfo:(id)a3 forObserverIdentifiers:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TPSEventsHistoryController *v10;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke;
    v8[3] = &unk_1EA1E09D8;
    v9 = v7;
    v10 = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

void __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke_2;
  v6[3] = &unk_1EA1E11B8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __70__TPSEventsHistoryController__persistUserInfo_forObserverIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "tipStatusController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateUserInfoForIdentifier:key:value:", *(_QWORD *)(a1 + 40), v7, v6);

  objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCacheData");

}

- (void)removeObserverIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke;
  v9[3] = &unk_1EA1E1140;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke_2;
  v5[3] = &unk_1EA1E11E0;
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsForKeys:", a1[5]);

}

void __56__TPSEventsHistoryController_removeObserverIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "removeObserverIdentifiers:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v6, "canBeRemoved"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1DAC2F000, v7, OS_LOG_TYPE_DEFAULT, "Remove unused contextualEvent: %@", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)removeObserverIdentifiers:(id)a3 fromEventIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke;
  v11[3] = &unk_1EA1E1140;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke_2;
  v7[3] = &unk_1EA1E1208;
  v7[4] = WeakRetained;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

}

void __77__TPSEventsHistoryController_removeObserverIdentifiers_fromEventIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contextualEventIdentifierToContextualEventMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObserverIdentifiers:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v5, "canBeRemoved"))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1DAC2F000, v6, OS_LOG_TYPE_DEFAULT, "Remove unused contextualEvent: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)restartTrackingForEventIdentifiers:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TPSEventsHistoryController contextualEventsForIdentifiers:](self, "contextualEventsForIdentifiers:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1DAC2F000, v11, OS_LOG_TYPE_DEFAULT, "Restart tracking for event identifiers: %@ on %@", buf, 0x16u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v17, "setMatchedDate:", 0, (_QWORD)v18);
        objc_msgSend(v17, "removeAllObservations");
        objc_msgSend(v17, "setEventSinceDate:", v10);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)updateCacheData
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[TPSEventsHistoryController eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__TPSEventsHistoryController_updateCacheData__block_invoke;
  v4[3] = &unk_1EA1E1230;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__TPSEventsHistoryController_updateCacheData__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)MEMORY[0x1E0DBF400];
  objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "archivedDataWithRootObject:forKey:", v2, CFSTR("DeliveryEventIdentifierToDeliveryEventMap"));

}

- (void)removeCacheData
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DAC2F000, log, OS_LOG_TYPE_DEBUG, "Remove TPSEventHistoryController cache.", v1, 2u);
}

void __45__TPSEventsHistoryController_removeCacheData__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contextualEventIdentifierToContextualEventMap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

  objc_msgSend(WeakRetained, "updateCacheData");
}

- (id)debugDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("DeliveryEventIdentifierToDeliveryEventMap"), self->_contextualEventIdentifierToContextualEventMap);
  return v3;
}

- (void)setContextualEventsForIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (void)setTipStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_tipStatusController, a3);
}

- (NSMutableDictionary)contextualEventIdentifierToContextualEventMap
{
  return self->_contextualEventIdentifierToContextualEventMap;
}

- (void)setContextualEventIdentifierToContextualEventMap:(id)a3
{
  objc_storeStrong((id *)&self->_contextualEventIdentifierToContextualEventMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualEventIdentifierToContextualEventMap, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_contextualEventsForIdentifiers, 0);
}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "observationMap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1DAC2F000, v2, v3, "Dates: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "bookmark");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1DAC2F000, v2, v3, "Bookmark: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

@end
