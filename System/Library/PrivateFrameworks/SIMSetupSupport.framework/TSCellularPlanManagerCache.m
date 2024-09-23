@implementation TSCellularPlanManagerCache

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_10);
  return (id)sharedInstance_instance_0;
}

void __44__TSCellularPlanManagerCache_sharedInstance__block_invoke()
{
  TSCellularPlanManagerCache *v0;
  void *v1;

  v0 = objc_alloc_init(TSCellularPlanManagerCache);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (TSCellularPlanManagerCache)init
{
  TSCellularPlanManagerCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanManagerCache;
  v2 = -[TSCellularPlanManagerCache init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateLocalCachedPlanItems_, *MEMORY[0x24BE158D8], 0);

  }
  return v2;
}

- (void)planItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke;
    v14[3] = &unk_24DEF3768;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v5, "planItemsWithCompletion:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache planItemsWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2;
  block[3] = &unk_24DEF3740;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v15 = v7;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v16);
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "setCachedPlanItems:", *(_QWORD *)(a1 + 48));
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "cachedPlanItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

      goto LABEL_11;
    }
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_2(a1 + 32, v3, v4, v5, v6, v7, v8, v9);

  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_11:

}

- (void)hasInstallingPlanOrUserPlan:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__TSCellularPlanManagerCache_hasInstallingPlanOrUserPlan___block_invoke;
    v14[3] = &unk_24DEF30D0;
    v15 = v4;
    -[TSCellularPlanManagerCache planItemsWithCompletion:](self, "planItemsWithCompletion:", v14);
    v6 = v15;
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache hasInstallingPlanOrUserPlan:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

uint64_t __58__TSCellularPlanManagerCache_hasInstallingPlanOrUserPlan___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "count") != 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanManagerCache;
  -[TSCellularPlanManagerCache dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2080;
    v9 = "-[TSCellularPlanManagerCache setDelegate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "set delegate : %@ @%s", (uint8_t *)&v6, 0x16u);
  }

  objc_storeWeak((id *)&self->delegate, v4);
}

- (void)resetDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  TSCellularPlanManagerCacheDelegate **p_delegate;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    v9 = 138412802;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v4;
    v13 = 2080;
    v14 = "-[TSCellularPlanManagerCache resetDelegate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "reset delegate : %@ <> removedDelegate: %@ @%s", (uint8_t *)&v9, 0x20u);

  }
  p_delegate = &self->delegate;
  v8 = objc_loadWeakRetained((id *)p_delegate);

  if (v8 == v4)
    objc_storeWeak((id *)p_delegate, 0);

}

- (NSArray)planItems
{
  NSArray *cachedPlanItems;
  _QWORD block[5];

  cachedPlanItems = self->_cachedPlanItems;
  if (!cachedPlanItems)
  {
    objc_sync_enter(0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__TSCellularPlanManagerCache_planItems__block_invoke;
    block[3] = &unk_24DEF29A8;
    block[4] = self;
    if (planItems_onceToken != -1)
      dispatch_once(&planItems_onceToken, block);
    objc_sync_exit(0);
    cachedPlanItems = self->_cachedPlanItems;
  }
  return cachedPlanItems;
}

uint64_t __39__TSCellularPlanManagerCache_planItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCachedPlanItems");
}

- (void)shouldShowPlanSetupWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE15900];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldShowPlanSetup:", v4);

}

- (void)selectPlanForData:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[TSCellularPlanManagerCache _getValidatedPlanItemFor:](self, "_getValidatedPlanItemFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject didSelectPlanForData:completion:](v4, "didSelectPlanForData:completion:", v3, &__block_literal_global_24);
  }
  else
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache selectPlanForData:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

void __48__TSCellularPlanManagerCache_selectPlanForData___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__TSCellularPlanManagerCache_selectPlanForData___block_invoke_cold_1();

  }
}

- (void)selectPlanForVoice:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[TSCellularPlanManagerCache _getValidatedPlanItemFor:](self, "_getValidatedPlanItemFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject didSelectPlanForDefaultVoice:completion:](v4, "didSelectPlanForDefaultVoice:completion:", v3, &__block_literal_global_25);
  }
  else
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache selectPlanForVoice:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

void __49__TSCellularPlanManagerCache_selectPlanForVoice___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__TSCellularPlanManagerCache_selectPlanForVoice___block_invoke_cold_1();

  }
}

- (void)selectPlansForIMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TSCellularPlanManagerCache selectPlansForIMessage:].cold.3();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[TSCellularPlanManagerCache _getValidatedPlanItemFor:](self, "_getValidatedPlanItemFor:", v12, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "addObject:", v12);
        }
        else
        {
          _TSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[TSCellularPlanManagerCache selectPlansForIMessage:].cold.2(buf, &v22, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanManagerCache selectPlansForIMessage:].cold.1(v6, v15);

    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didSelectPlansForIMessage:completion:", v6, &__block_literal_global_27);

  }
}

void __53__TSCellularPlanManagerCache_selectPlansForIMessage___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__TSCellularPlanManagerCache_selectPlansForIMessage___block_invoke_cold_1();

  }
}

- (id)getPredefinedLabels
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPredefinedLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)setLabelForPlan:(id)a3 label:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  -[TSCellularPlanManagerCache _getValidatedPlanItemFor:](self, "_getValidatedPlanItemFor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLabelForPlan:label:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[TSCellularPlanManagerCache setLabelForPlan:label:].cold.2();

    }
    -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache setLabelForPlan:label:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v9 = 0;
  }

  return v9;
}

- (id)getShortLabelsForLabels:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE15900];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getShortLabelsForLabels:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getDanglingPlanItems
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "danglingPlanItemsShouldUpdate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 userConsentResponse:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  TSCellularPlanManagerCache *v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  _TSLogDomain();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[TSCellularPlanManagerCache addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __101__TSCellularPlanManagerCache_addNewPlanWithCardData_confirmationCode_userConsentResponse_completion___block_invoke;
  v19 = &unk_24DEF37F0;
  v20 = self;
  v21 = v12;
  v15 = v12;
  objc_msgSend(v14, "addNewPlanWithCardData:confirmationCode:triggerType:userConsent:completion:", v10, v11, 2, a5, &v16);

  -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems", v16, v17, v18, v19, v20);
}

void __101__TSCellularPlanManagerCache_addNewPlanWithCardData_confirmationCode_userConsentResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE158B0]) & 1) != 0)
    {
      if (objc_msgSend(v6, "code") == 19)
      {
LABEL_8:

        goto LABEL_9;
      }
      v5 = objc_msgSend(v6, "code");

      if (v5 == 2)
        goto LABEL_9;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planItemsUpdated:planListError:", 0, v6);
    goto LABEL_8;
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 confirmationCode:(id)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  _TSLogDomain();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2048;
    v29 = a6;
    v30 = 2080;
    v31 = "-[TSCellularPlanManagerCache addNewPlanWithAddress:matchingId:confirmationCode:userConsent:completion:]";
    _os_log_debug_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEBUG, "[Db] SMDP: %@, matchingid: %@ cc: %@ signup consent %lu @%s", buf, 0x34u);
  }

  if (BYSetupAssistantNeedsToRun())
    v17 = 1;
  else
    v17 = 2;
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __103__TSCellularPlanManagerCache_addNewPlanWithAddress_matchingId_confirmationCode_userConsent_completion___block_invoke;
  v20[3] = &unk_24DEF37F0;
  v20[4] = self;
  v21 = v15;
  v19 = v15;
  objc_msgSend(v18, "addNewPlanWithAddress:matchingId:oid:confirmationCode:triggerType:userConsent:completion:", v12, v13, 0, v14, v17, a6, v20);

  -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");
}

void __103__TSCellularPlanManagerCache_addNewPlanWithAddress_matchingId_confirmationCode_userConsent_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planItemsUpdated:planListError:", 0, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;

  v5 = a3;
  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TSCellularPlanManagerCache resumePlanProvisioning:userConsent:].cold.1(v5, a4, v7);

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumePlanProvisioning:userConsent:completion:", v5, a4, &__block_literal_global_30);

  -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");
}

void __65__TSCellularPlanManagerCache_resumePlanProvisioning_userConsent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__TSCellularPlanManagerCache_resumePlanProvisioning_userConsent___block_invoke_cold_1();

  }
}

- (id)remapSimLabel:(id)a3 to:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = (void *)MEMORY[0x24BE15900];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remapSimLabel:to:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache remapSimLabel:to:].cold.1();

  }
  return v9;
}

- (int64_t)calculateInstallConsentTextTypeFor:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE15900], "calculateInstallConsentTextTypeFor:", a3);
}

- (void)provideUserResponse:(int64_t)a3 confirmationCode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TSCellularPlanManagerCache planItems](self, "planItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isInstalling"))
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userDidProvideResponse:confirmationCode:forPlan:isRemote:completion:", a3, v6, v8, 0, &__block_literal_global_31);

  -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");
}

void __67__TSCellularPlanManagerCache_provideUserResponse_confirmationCode___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__TSCellularPlanManagerCache_provideUserResponse_confirmationCode___block_invoke_cold_1();

  }
}

- (void)sendUserResponse:(unint64_t)a3 confirmationCode:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TSCellularPlanManagerCache planItems](self, "planItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "isInstalling") & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v12;

    if (!v13)
      goto LABEL_15;
    if (a3)
      v14 = a3 == 2;
    else
      v14 = 2;
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userDidProvideResponse:confirmationCode:forPlan:isRemote:completion:", v14, v6, v13, 0, &__block_literal_global_32);

    -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");
  }
  else
  {
LABEL_9:

LABEL_15:
    _TSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache sendUserResponse:confirmationCode:].cold.1(v13, v16, v17, v18, v19, v20, v21, v22);
  }

}

void __64__TSCellularPlanManagerCache_sendUserResponse_confirmationCode___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__TSCellularPlanManagerCache_sendUserResponse_confirmationCode___block_invoke_cold_1();

  }
}

- (id)getSubscriptionContextUUIDforPlan:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE15900];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSubscriptionContextUUIDforPlan:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didPurchasePlanForEid:(id)a3 iccid:(id)a4 smdpURL:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a5;
  v9 = a6;
  if (a3)
  {
    v10 = a4;
    +[TSUtilities getByteRepresentationOf:](TSUtilities, "getByteRepresentationOf:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didPurchasePlanForCsn:iccid:profileServer:state:", v11, v10, v14, v9);

  }
  else
  {
    v13 = (void *)MEMORY[0x24BE15900];
    v12 = a4;
    objc_msgSend(v13, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didPurchasePlanWithIccid:downloadProfile:", v12, 1);
  }

}

- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v11 = (void *)MEMORY[0x24BE15900];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v11, "sharedManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "didPurchasePlanForCarrier:mnc:gid1:gid2:state:", v16, v15, v14, v13, v12);

}

- (void)didTransferPlanForEid:(id)a3 iccid:(id)a4 srcIccid:(id)a5 smdpURL:(id)a6 state:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a5;
  v11 = a6;
  v12 = a7;
  if (a3)
  {
    v13 = a4;
    +[TSUtilities getByteRepresentationOf:](TSUtilities, "getByteRepresentationOf:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didTransferPlanForCsn:iccid:srcIccid:profileServer:state:", v14, v13, v17, v11, v12);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BE15900];
    v15 = a4;
    objc_msgSend(v16, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didPurchasePlanWithIccid:downloadProfile:", v15, 1);
  }

}

- (void)didEnablePlanItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEnablePlanItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412802;
      v9 = v4;
      v10 = 2112;
      v11 = v6;
      v12 = 2080;
      v13 = "-[TSCellularPlanManagerCache didEnablePlanItems:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Enabling plans: %@, error: %@ @%s", (uint8_t *)&v8, 0x20u);
    }

  }
  -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");

}

- (void)_initializePlanItems
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__TSCellularPlanManagerCache__initializePlanItems__block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  if (_initializePlanItems_onceToken != -1)
    dispatch_once(&_initializePlanItems_onceToken, block);
}

uint64_t __50__TSCellularPlanManagerCache__initializePlanItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCachedPlanItems");
}

- (void)_updateCachedPlanItems
{
  NSObject *v3;
  NSError *lastError;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSError *v9;
  int v10;
  NSError *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    lastError = self->_lastError;
    v10 = 138412546;
    v11 = lastError;
    v12 = 2080;
    v13 = "-[TSCellularPlanManagerCache _updateCachedPlanItems]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "Updated plan list _lastError: %@ @%s", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItemsShouldUpdate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanManagerCache setCachedPlanItems:](self, "setCachedPlanItems:", v6);

  -[TSCellularPlanManagerCache delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanManagerCache cachedPlanItems](self, "cachedPlanItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "planItemsUpdated:planListError:", v8, self->_lastError);

  v9 = self->_lastError;
  self->_lastError = 0;

}

- (void)_updateLocalCachedPlanItems:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CTCellularPlanLocalInfoError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanManagerCache _updateLocalCachedPlanItems:].cold.1();

    -[TSCellularPlanManagerCache delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "planItemsUpdated:planListError:", 0, v5);

    objc_storeStrong((id *)&self->_lastError, v5);
  }
  -[TSCellularPlanManagerCache _updateCachedPlanItems](self, "_updateCachedPlanItems");

}

- (id)_getValidatedPlanItemFor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TSCellularPlanManagerCache planItems](self, "planItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "iccid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "iccid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (TSCellularPlanManagerCacheDelegate)delegate
{
  return (TSCellularPlanManagerCacheDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (NSArray)cachedPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedPlanItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)danglingPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDanglingPlanItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_cachedPlanItems, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)planItemsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid parameter: completion is nil @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid TSCellularPlanManagerCache @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]fetch plan items failed : %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)hasInstallingPlanOrUserPlan:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid parameter: completion is nil @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)selectPlanForData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Failed - plan item invalid @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __48__TSCellularPlanManagerCache_selectPlanForData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)selectPlanForVoice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Failed - plan item invalid @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__TSCellularPlanManagerCache_selectPlanForVoice___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)selectPlansForIMessage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  uint8_t v5[14];
  void *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5();
  v6 = a1;
  v7 = 2080;
  v8 = "-[TSCellularPlanManagerCache selectPlansForIMessage:]";
  OUTLINED_FUNCTION_4_1(&dword_21B647000, a2, v4, "[Db]  Going to send %lu plans to select iMessage %@ @%s", v5);
}

- (void)selectPlansForIMessage:(os_log_t)log .cold.2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSCellularPlanManagerCache selectPlansForIMessage:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]Failed - plan item invalid @%s", buf, 0xCu);
}

- (void)selectPlansForIMessage:.cold.3()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = "-[TSCellularPlanManagerCache selectPlansForIMessage:]";
  _os_log_debug_impl(&dword_21B647000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __53__TSCellularPlanManagerCache_selectPlansForIMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setLabelForPlan:(uint64_t)a3 label:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Failed - plan item invalid @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setLabelForPlan:label:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = v0;
  v4 = 2080;
  v5 = "-[TSCellularPlanManagerCache addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:]";
  OUTLINED_FUNCTION_4_1(&dword_21B647000, v1, (uint64_t)v1, "[Db] adding new plan with card data %@ and confirmation code %@ @%s", v2);
}

- (void)resumePlanProvisioning:(os_log_t)log userConsent:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109634;
  v3[1] = a1 & 1;
  v4 = 2048;
  v5 = a2;
  v6 = 2080;
  v7 = "-[TSCellularPlanManagerCache resumePlanProvisioning:userConsent:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] Resume: [%d] signupConsent: %lu @%s", (uint8_t *)v3, 0x1Cu);
}

void __65__TSCellularPlanManagerCache_resumePlanProvisioning_userConsent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)remapSimLabel:to:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __67__TSCellularPlanManagerCache_provideUserResponse_confirmationCode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendUserResponse:(uint64_t)a3 confirmationCode:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]No installing item @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __64__TSCellularPlanManagerCache_sendUserResponse_confirmationCode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateLocalCachedPlanItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Plan list error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
