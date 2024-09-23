@implementation SPUISearchModelGeneral

- (void)activate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SPUISearchModelGeneral_activate__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)setMaxUISuggestions:(int64_t)a3
{
  id v4;

  -[SPUISearchModelGeneral session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxUISuggestions:", a3);

}

id __34__SPUISearchModelGeneral_activate__block_invoke(uint64_t a1)
{
  void *v2;
  objc_super v4;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SPUISearchModelGeneral;
  return objc_msgSendSuper2(&v4, sel_activate);
}

- (SPClientSession)session
{
  return (SPClientSession *)objc_getProperty(self, a2, 64, 1);
}

void __30__SPUISearchModelGeneral_init__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAllParametersForClient:", CFSTR("Spotlight"));

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadAllParametersForClient:", CFSTR("SpotlightKnowledge"));

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllParametersForClient:", CFSTR("Mail"));

}

- (SPUISearchModelGeneral)init
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPUISearchModelGeneral;
  v2 = -[SPUISearchModelGeneral init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("SPUISearchModel workQueue", v4);
    v6 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v5;

    v7 = objc_alloc_init(MEMORY[0x24BEB0070]);
    v8 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v7;

    dispatch_async(*((dispatch_queue_t *)v2 + 9), &__block_literal_global_180);
  }
  return (SPUISearchModelGeneral *)v2;
}

- (void)_setInfinitePatience:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  os_log_type_t v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v7.receiver = self;
  v7.super_class = (Class)SPUISearchModelGeneral;
  -[SPUISearchModel setInfinitePatience:](&v7, sel_setInfinitePatience_, v3);
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_22E078000, v5, v6, "Setting infinite patience: %d", buf, 8u);
  }

  -[SPClientSession setInfinitePatience:](self->_session, "setInfinitePatience:", v3);
}

- (void)setInfinitePatience:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SPUISearchModelGeneral_setInfinitePatience___block_invoke;
  block[3] = &unk_24F9D6008;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(workQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__SPUISearchModelGeneral_setInfinitePatience___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setInfinitePatience:", *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)infinitePatience
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SPUISearchModelGeneral_infinitePatience__block_invoke;
  v5[3] = &unk_24F9D6030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SPUISearchModelGeneral_infinitePatience__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "infinitePatience");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setForceStableResults:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SPUISearchModelGeneral_setForceStableResults___block_invoke;
  v4[3] = &unk_24F9D5E38;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

void __48__SPUISearchModelGeneral_setForceStableResults___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setForceStableResults:", v1);

}

- (BOOL)forceStableResults
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SPUISearchModelGeneral_forceStableResults__block_invoke;
  v5[3] = &unk_24F9D6030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__SPUISearchModelGeneral_forceStableResults__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "forceStableResults");

}

- (void)updatesDisabled
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SPUISearchModelGeneral_updatesDisabled__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __41__SPUISearchModelGeneral_updatesDisabled__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disableUpdates");

}

- (BOOL)queryInProgress
{
  NSObject *workQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__SPUISearchModelGeneral_queryInProgress__block_invoke;
  v5[3] = &unk_24F9D6030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__SPUISearchModelGeneral_queryInProgress__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "lastResponse");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "state") == 4;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)updatesEnabled
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SPUISearchModelGeneral_updatesEnabled__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __40__SPUISearchModelGeneral_updatesEnabled__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enableUpdates");

}

- (void)deactivate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SPUISearchModelGeneral_deactivate__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __36__SPUISearchModelGeneral_deactivate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivate");

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)SPUISearchModelGeneral;
  objc_msgSendSuper2(&v6, sel_deactivate);
  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadAllParametersForClient:", CFSTR("Spotlight"));

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadAllParametersForClient:", CFSTR("SpotlightKnowledge"));

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadAllParametersForClient:", CFSTR("Mail"));

}

- (int64_t)maxUISuggestions
{
  void *v2;
  int64_t v3;

  -[SPUISearchModelGeneral session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxUISuggestions");

  return v3;
}

- (BOOL)shouldEnableOCR
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (shouldEnableOCR_onceToken != -1)
    dispatch_once(&shouldEnableOCR_onceToken, &__block_literal_global_191);
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  v4 = v2;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v30;
    v4 = v2;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "languageCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("yue"));

        if (v10)
        {
          objc_msgSend(v4, "arrayByAddingObject:", CFSTR("zh"));
          v11 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v11;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", shouldEnableOCR_supportedLocaleStrings, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeWithLocaleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "languageCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "languageCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((v23 & 1) != 0)
        {
          LOBYTE(v17) = 1;
          goto LABEL_22;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_22:

  return v17;
}

void __41__SPUISearchModelGeneral_shouldEnableOCR__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDF9C78]);
  objc_msgSend(v2, "supportedRecognitionLanguagesAndReturnError:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldEnableOCR_supportedLocaleStrings;
  shouldEnableOCR_supportedLocaleStrings = v0;

}

- (void)updateWithQueryContext:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SPUISearchModelGeneral_updateWithQueryContext___block_invoke;
  block[3] = &unk_24F9D6078;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

void __49__SPUISearchModelGeneral_updateWithQueryContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldEnableOCR") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setDisableOCR:", 1);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryTaskWithContext:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setQueryTask:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setForceStableResults:", 0);
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "queryTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableUpdates");

    v5 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v5, "queryTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v5);

  if (objc_msgSend(MEMORY[0x24BE85288], "isIpad"))
    v8 = 6;
  else
    v8 = 4;
  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaxTopHitAppResults:", v8);

  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

}

- (void)clear
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPUISearchModelGeneral_clear__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __31__SPUISearchModelGeneral_clear__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "queryTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

  return objc_msgSend(*(id *)(a1 + 32), "setQueryTask:", 0);
}

- (void)purgeMemory
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SPUISearchModelGeneral_purgeMemory__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __37__SPUISearchModelGeneral_purgeMemory__block_invoke(uint64_t a1)
{
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SPUISearchModelGeneral;
  objc_msgSendSuper2(&v3, sel_purgeMemory);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastSections:forQuery:", MEMORY[0x24BDBD1A8], 0);

}

- (NSString)rankingDebugLog
{
  void *v2;
  void *v3;

  -[SPUISearchModel queryTask](self, "queryTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rankingDebugLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
