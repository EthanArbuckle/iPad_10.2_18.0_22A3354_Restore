@implementation REDonatedActionsApplicationStore

- (REDonatedActionsApplicationStore)init
{
  void *v3;
  REDonatedActionsApplicationStore *v4;

  +[RELocationManager simulatedLocationManager](RELocationManager, "simulatedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REDonatedActionsApplicationStore initWithLocationManager:](self, "initWithLocationManager:", v3);

  return v4;
}

- (REDonatedActionsApplicationStore)initWithLocationManager:(id)a3
{
  id v4;
  REDonatedActionsApplicationStore *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  REFilteringRule *v13;
  void *v14;
  REFilteringRule *v15;
  double v16;
  REInteractionDescriptor *v17;
  RERelevanceEngine *v18;
  RERelevanceEngine *filteringEngine;
  uint64_t v20;
  REMLElementRanker *elementRanker;
  OS_dispatch_queue *v22;
  uint64_t v23;
  uint64_t v24;
  REUpNextScheduler *scheduler;
  OS_dispatch_queue *v26;
  uint64_t v27;
  REUpNextScheduler *applicationScheduler;
  REDonatedActionFilteredCache *v29;
  REDonatedActionFilteredCache *cache;
  REFilteringRule *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)REDonatedActionsApplicationStore;
  v5 = -[REDonatedActionsApplicationStore init](&v40, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.RelevanceEngine.REDonatedActionsApplicationStore", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    +[REMutableRelevanceEngineConfiguration defaultConfiguration](REMutableRelevanceEngineConfiguration, "defaultConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWantsImmutableContent:", 1);
    objc_msgSend(v8, "setAllowsRemoteTraining:", 1);
    objc_msgSend(v8, "setTrainingBehavior:", 1);
    objc_msgSend(v8, "setModelStorageBehavior:", 1);
    v34 = v4;
    objc_msgSend(v8, "setLocationManager:", v4);
    +[REDataSourceLoader disabledDataSourceLoader](REDataSourceLoader, "disabledDataSourceLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataSourceLoader:", v9);

    objc_msgSend(v8, "removeAllInteractions");
    objc_msgSend(v8, "removeAllSections");
    +[RESectionDescriptor defaultSectionDescriptorForIdentifier:](RESectionDescriptor, "defaultSectionDescriptorForIdentifier:", CFSTR("defaultSectionIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHistoricSectionDescriptor:", 0);
    objc_msgSend(v10, "rules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v13 = [REFilteringRule alloc];
    +[RECondition trueCondition](RECondition, "trueCondition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[REFilteringRule initWithCondition:type:](v13, "initWithCondition:type:", v14, 1);

    LODWORD(v16) = 1.0;
    -[RERule setPriority:](v15, "setPriority:", v16);
    v32 = v15;
    objc_msgSend(v12, "addObject:", v15);
    v33 = v12;
    objc_msgSend(v10, "setRules:", v12);
    objc_msgSend(v8, "addSectionWithDescriptor:", v10);
    v17 = objc_alloc_init(REInteractionDescriptor);
    -[REInteractionDescriptor setName:](v17, "setName:", CFSTR("REElementInteractionTap"));
    objc_msgSend(v8, "addInteractionWithDescriptor:", v17);
    v18 = -[RERelevanceEngine initWithName:configuration:]([RERelevanceEngine alloc], "initWithName:configuration:", CFSTR("REDonatedActionsApplicationStore-Filtering"), v8);
    filteringEngine = v5->_filteringEngine;
    v5->_filteringEngine = v18;

    -[RERelevanceEngine setAutomaticallyResumeEngine:](v5->_filteringEngine, "setAutomaticallyResumeEngine:", 0);
    -[RERelevanceEngine resume](v5->_filteringEngine, "resume");
    -[RERelevanceEngine elementRankerForSection:](v5->_filteringEngine, "elementRankerForSection:", CFSTR("defaultSectionIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    elementRanker = v5->_elementRanker;
    v5->_elementRanker = (REMLElementRanker *)v20;

    objc_initWeak(&location, v5);
    v22 = v5->_queue;
    v23 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke;
    v37[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v38, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v22, v37, 0.1);
    v24 = objc_claimAutoreleasedReturnValue();
    scheduler = v5->_scheduler;
    v5->_scheduler = (REUpNextScheduler *)v24;

    v26 = v5->_queue;
    v35[0] = v23;
    v35[1] = 3221225472;
    v35[2] = __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke_2;
    v35[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v36, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v26, v35, 0.1);
    v27 = objc_claimAutoreleasedReturnValue();
    applicationScheduler = v5->_applicationScheduler;
    v5->_applicationScheduler = (REUpNextScheduler *)v27;

    v29 = objc_alloc_init(REDonatedActionFilteredCache);
    cache = v5->_cache;
    v5->_cache = v29;

    -[REDonatedActionFilteredCache setDelegate:](v5->_cache, "setDelegate:", v5);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    v4 = v34;
  }

  return v5;
}

void __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notify");

}

void __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyApplicationsUpdates");

}

- (void)fetchApplicationsProvidingDonations:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke;
    v7[3] = &unk_24CF8AA78;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke_2;
  v4[3] = &unk_24CF8B2E0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_queue_loadApplicationsIfNeededWithCompletion:", v4);

}

void __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
    -[REDonatedActionFilteredCache fetchDonationWithIdentifier:completion:](self->_cache, "fetchDonationWithIdentifier:completion:", a3);
}

- (void)fetchTopDonationsForApplications:(id)a3 fromOnlyRecentPlatform:(BOOL)a4 block:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _MultiplatformDonationRecencyStore *v10;
  void *v11;
  REDonatedActionFilteredCache *cache;
  uint64_t v13;
  id v14;
  _MultiplatformDonationRecencyStore *v15;
  _QWORD v16[4];
  _MultiplatformDonationRecencyStore *v17;
  id v18;
  REDonatedActionsApplicationStore *v19;
  id v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  REDonatedActionsApplicationStore *v24;
  id v25;
  _MultiplatformDonationRecencyStore *v26;
  BOOL v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (objc_msgSend(v8, "count"))
    {
      if (v6)
        v10 = objc_alloc_init(_MultiplatformDonationRecencyStore);
      else
        v10 = 0;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      cache = self->_cache;
      v13 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke;
      v22[3] = &unk_24CF910F8;
      v23 = v8;
      v24 = self;
      v25 = v11;
      v27 = v6;
      v26 = v10;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_2;
      v16[3] = &unk_24CF91148;
      v21 = v6;
      v17 = v26;
      v18 = v25;
      v19 = self;
      v20 = v9;
      v14 = v25;
      v15 = v26;
      -[REDonatedActionFilteredCache fetchAllUniqueActions:completion:](cache, "fetchAllUniqueActions:completion:", v22, v16);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1B8]);
    }
  }

}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3)
    && (objc_msgSend(*(id *)(a1 + 40), "_shouldFilterDonation:", v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, v3);
    }
    objc_msgSend(v4, "addObject:", v9);
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v9, "remoteBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isLocalDonation") & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v9, "creationDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v9, "isLocalDonation"))
      {
        objc_msgSend(v9, "creationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(*(id *)(a1 + 56), "updateDataWithRemoteBundleIdentifier:remoteDate:localBundleIdentifier:localDate:", v5, v7, v6, v8);

    }
  }

}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  REExpectation *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id obj;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  REExpectation *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "bundlesFromMostRecentlyProvidingPlatforms");
  else
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(REExpectation);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[REExpectation beginOperation](v4, "beginOperation");
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 48);
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_3;
        v19[3] = &unk_24CF91120;
        v19[4] = v11;
        v20 = v3;
        v21 = v9;
        v22 = v4;
        objc_msgSend(v11, "_sortDonationsByCount:completion:", v10, v19);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v12 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_5;
  v16[3] = &unk_24CF8B2E0;
  v17 = v3;
  v18 = v12;
  v14 = v3;
  -[REExpectation notifyOperationsCompleteOnQueue:block:](v4, "notifyOperationsCompleteOnQueue:block:", v13, v16);

}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_4;
  v10[3] = &unk_24CF8B6F0;
  v6 = v4;
  v7 = a1[6];
  v8 = (void *)a1[7];
  v11 = v6;
  v12 = v7;
  v13 = v3;
  v14 = v8;
  v9 = v3;
  dispatch_async(v5, v10);

}

uint64_t __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "endOperation");
}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)_shouldFilterDonation:(id)a3
{
  id v4;
  void *v5;
  REElement *v6;
  void *v7;
  void *v8;
  REElement *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "relevanceProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = [REElement alloc];
    v7 = (void *)objc_opt_new();
    objc_msgSend(v4, "relevanceProviders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[REElement initWithIdentifier:content:action:relevanceProviders:](v6, "initWithIdentifier:content:action:relevanceProviders:", CFSTR("filtering-element"), v7, 0, v8);

    v10 = -[REMLElementRanker shouldHideElement:](self->_elementRanker, "shouldHideElement:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)fetchAllUniqueDonationsWithBlock:(id)a3 completion:(id)a4
{
  -[REDonatedActionFilteredCache fetchAllUniqueActions:completion:](self->_cache, "fetchAllUniqueActions:completion:", a3, a4);
}

- (void)fetchPerformedCountForAction:(id)a3 completion:(id)a4
{
  -[REDonatedActionFilteredCache fetchPerformedCountForAction:usingBlock:](self->_cache, "fetchPerformedCountForAction:usingBlock:", a3, a4);
}

- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5
{
  -[REDonatedActionFilteredCache fetchPerformedTodayCountForActionWithBundleIdentifer:actionIdentifier:completion:](self->_cache, "fetchPerformedTodayCountForActionWithBundleIdentifer:actionIdentifier:completion:", a3, a4, a5);
}

- (void)fetchFirstPerformedActionDate:(id)a3
{
  -[REDonatedActionFilteredCache fetchFirstPerformedActionDate:](self->_cache, "fetchFirstPerformedActionDate:", a3);
}

- (void)_sortDonationsByCount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  REDonatedActionFilteredCache *cache;
  NSObject *queue;
  id v19;
  id v20;
  id v21;
  id obj;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  NSObject *v28;
  REDonatedActionsApplicationStore *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if ((unint64_t)objc_msgSend(v6, "count") > 1)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = dispatch_group_create();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v21 = v6;
      obj = v6;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            dispatch_group_enter(v10);
            cache = self->_cache;
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke;
            v27[3] = &unk_24CF91198;
            v27[4] = v16;
            v28 = v10;
            v29 = self;
            v30 = v9;
            v31 = v11;
            -[REDonatedActionFilteredCache fetchCountForAction:usingBlock:](cache, "fetchCountForAction:usingBlock:", v16, v27);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v13);
      }

      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_3;
      block[3] = &unk_24CF8AA00;
      v24 = v11;
      v25 = v9;
      v26 = v7;
      v19 = v9;
      v20 = v11;
      dispatch_group_notify(v10, queue, block);

      v6 = v21;
    }
    else
    {
      if (v6)
        v8 = v6;
      else
        v8 = (id)MEMORY[0x24BDBD1A8];
      (*((void (**)(id, id))v7 + 2))(v7, v8);
    }
  }

}

void __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  unint64_t v14;

  v4 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (a2 > 1 || v4 == 2)
  {
    v5 = *(void **)(a1 + 56);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_2;
    block[3] = &unk_24CF91170;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    v14 = a2;
    v12 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_4;
  v4[3] = &unk_24CF911C0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "sortedArrayUsingComparator:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &unk_24CFC1648;
  v11 = v10;

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = &unk_24CFC1648;
  v17 = v16;

  v18 = objc_msgSend(v17, "compare:", v11);
  return v18;
}

- (void)_notify
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("REDonatedActionsApplicationStoreDidUpdate"), self);

}

- (void)_notifyApplicationsUpdates
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("REDonatedActionsApplicationStoreDidUpdateApplications"), 0);

}

- (void)_queue_loadApplicationsIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REDonatedActionFilteredCache *cache;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = v4;
  if (self->_applications)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    cache = self->_cache;
    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke;
    v13[3] = &unk_24CF911E8;
    v14 = v6;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_2;
    v10[3] = &unk_24CF8AA00;
    v10[4] = self;
    v11 = v14;
    v12 = v5;
    v9 = v14;
    -[REDonatedActionFilteredCache fetchAllUniqueActions:completion:](cache, "fetchAllUniqueActions:completion:", v13, v10);

  }
}

void __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_3;
  block[3] = &unk_24CF8AA00;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "schedule");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)donatedActionFilteredCacheDidAddDonation:(id)a3
{
  void *v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDidAddDonation___block_invoke;
    v7[3] = &unk_24CF8AB18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDidAddDonation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "schedule");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "schedule");
}

- (void)donatedActionFilteredCacheCountDidChange
{
  -[REUpNextScheduler schedule](self->_scheduler, "schedule");
}

- (void)donatedActionFilteredCacheDonationRemoved
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDonationRemoved__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDonationRemoved__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "schedule");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "schedule");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementRanker, 0);
  objc_storeStrong((id *)&self->_filteringEngine, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
