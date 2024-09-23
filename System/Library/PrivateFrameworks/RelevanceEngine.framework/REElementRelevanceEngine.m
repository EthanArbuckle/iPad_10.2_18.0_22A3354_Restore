@implementation REElementRelevanceEngine

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void (**WeakRetained)(id, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "transformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)objc_opt_class(), "supportsInvalidation");

    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addFeature:", v3);
    objc_msgSend(v3, "transformer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_opt_class(), "supportsPersistence");

    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "addFeature:", v3);
  }
  WeakRetained = (void (**)(id, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40));
  if (WeakRetained)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "_dependentFeatures", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          WeakRetained[2](WeakRetained, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __68__REElementRelevanceEngine__enumerateAndGenerateSectionComparators___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "comparatorWithRules:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  RESection *v9;

  v5 = a3;
  v6 = a2;
  v9 = -[RESection initWithSectionDescriptor:comparator:]([RESection alloc], "initWithSectionDescriptor:comparator:", v6, v5);

  -[RESection setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 32));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
}

- (REElementRelevanceEngine)initWithRelevanceEngine:(id)a3
{
  id v4;
  REElementRelevanceEngine *v5;
  REElementRelevanceEngine *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  int v10;
  OS_dispatch_queue *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  REUpNextScheduler *scheduler;
  OS_dispatch_queue *v16;
  double v17;
  uint64_t v18;
  REUpNextScheduler *predictorUpdatedScheduler;
  void *v20;
  uint64_t v21;
  NSMutableSet *elementsNeedingRelevanceUpdate;
  uint64_t v23;
  NSMutableDictionary *sections;
  uint64_t v25;
  NSMutableDictionary *predictedElements;
  uint64_t v27;
  NSMapTable *relevanceProviderElementMap;
  REKeyMultiValueMap *v29;
  REKeyMultiValueMap *identifierElementIdentifierMap;
  uint64_t v31;
  NSMutableSet *reloadingElementIdentifiers;
  uint64_t v33;
  NSMutableDictionary *reloadingCachedFeatureMap;
  RERelevanceProviderEnvironment *v35;
  RERelevanceProviderEnvironment *providerEnvironment;
  id *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void (**v54)(_QWORD, _QWORD);
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  uint64_t *v84;
  uint64_t v85;
  id *v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _QWORD v91[4];
  id *v92;
  _QWORD v93[4];
  id *v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  id location;
  objc_super v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v100.receiver = self;
  v100.super_class = (Class)REElementRelevanceEngine;
  v5 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v100, sel_initWithRelevanceEngine_, v4);
  v6 = v5;
  if (v5)
  {
    -[RERelevanceEngineSubsystem queue](v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "wantsImmutableContent");

    objc_initWeak(&location, v6);
    v11 = v6->_queue;
    if (v10)
      v12 = 0.0;
    else
      v12 = 0.05;
    v13 = MEMORY[0x24BDAC760];
    v97[0] = MEMORY[0x24BDAC760];
    v97[1] = 3221225472;
    v97[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke;
    v97[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v98, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v11, v97, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    scheduler = v6->_scheduler;
    v6->_scheduler = (REUpNextScheduler *)v14;

    v16 = v6->_queue;
    if (v10)
      v17 = 0.0;
    else
      v17 = 0.5;
    v95[0] = v13;
    v95[1] = 3221225472;
    v95[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_2;
    v95[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v96, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v16, v95, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    predictorUpdatedScheduler = v6->_predictorUpdatedScheduler;
    v6->_predictorUpdatedScheduler = (REUpNextScheduler *)v18;

    objc_msgSend(v4, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_ignoreDeviceLockState = objc_msgSend(v20, "ignoreDeviceLockState");

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    elementsNeedingRelevanceUpdate = v6->_elementsNeedingRelevanceUpdate;
    v6->_elementsNeedingRelevanceUpdate = (NSMutableSet *)v21;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    sections = v6->_sections;
    v6->_sections = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    predictedElements = v6->_predictedElements;
    v6->_predictedElements = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    relevanceProviderElementMap = v6->_relevanceProviderElementMap;
    v6->_relevanceProviderElementMap = (NSMapTable *)v27;

    v29 = objc_alloc_init(REKeyMultiValueMap);
    identifierElementIdentifierMap = v6->_identifierElementIdentifierMap;
    v6->_identifierElementIdentifierMap = v29;

    v31 = objc_opt_new();
    reloadingElementIdentifiers = v6->_reloadingElementIdentifiers;
    v6->_reloadingElementIdentifiers = (NSMutableSet *)v31;

    v33 = objc_opt_new();
    reloadingCachedFeatureMap = v6->_reloadingCachedFeatureMap;
    v6->_reloadingCachedFeatureMap = (NSMutableDictionary *)v33;

    v35 = -[RERelevanceProviderEnvironment initWithRelevanceEngine:]([RERelevanceProviderEnvironment alloc], "initWithRelevanceEngine:", v4);
    providerEnvironment = v6->_providerEnvironment;
    v6->_providerEnvironment = v35;

    -[RERelevanceProviderEnvironment setDelegate:](v6->_providerEnvironment, "setDelegate:", v6);
    v93[0] = v13;
    v93[1] = 3221225472;
    v93[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_3;
    v93[3] = &unk_24CF8ECF8;
    v37 = v6;
    v94 = v37;
    objc_msgSend(v37, "_enumerateAndGenerateSectionComparators:", v93);
    objc_msgSend(v4, "rootFeatures");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[REPredictor systemPredictorsSupportingFeatureSet:relevanceEngine:](REPredictor, "systemPredictorsSupportingFeatureSet:relevanceEngine:", v38, v4);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v37[13];
    v37[13] = (id)v39;

    v41 = v37[13];
    v91[0] = v13;
    v91[1] = 3221225472;
    v91[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_4;
    v91[3] = &unk_24CF8ED20;
    v42 = v37;
    v92 = v42;
    objc_msgSend(v41, "enumeratePredictors:", v91);
    objc_msgSend(v4, "featureTransmuter");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v42[16];
    v42[16] = (id)v43;

    if (!v42[16])
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature transmuter should not be nil!"), v45, v46, v47, v48, v49, v50, v71);
    +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    v86 = (id *)&v85;
    v87 = 0x3042000000;
    v88 = __Block_byref_object_copy__18;
    v89 = __Block_byref_object_dispose__18;
    v90 = 0;
    v81[0] = v13;
    v81[1] = 3221225472;
    v81[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_12;
    v81[3] = &unk_24CF8ED48;
    v53 = v51;
    v82 = v53;
    v72 = v52;
    v83 = v72;
    v84 = &v85;
    v54 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v81);
    objc_storeWeak(v86 + 5, v54);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(v42[16], "outputFeatures");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v78 != v57)
            objc_enumerationMutation(v55);
          v54[2](v54, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
      }
      while (v56);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v59 = v53;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v101, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v74 != v61)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "transformer");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setInvalidationDelegate:", v42);

        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v101, 16);
      }
      while (v60);
    }

    v64 = objc_msgSend(v72, "copy");
    v65 = v42[12];
    v42[12] = (id)v64;

    *((_BYTE *)v42 + 160) = 0;
    objc_msgSend(v42, "_checkPreferences");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:selector:name:object:", v42, sel__checkPreferences, CFSTR("RERelevanceEnginePreferencesDidUpdate"), 0);

    objc_msgSend(v42, "relevanceEngine");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "modelManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObserver:", v42);

    objc_msgSend(v37[13], "addObserver:", v42);
    objc_msgSend(v4, "modelManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addDataStore:", v42);

    _Block_object_dispose(&v85, 8);
    objc_destroyWeak(&v90);

    objc_destroyWeak(&v96);
    objc_destroyWeak(&v98);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)dataStoreKey
{
  return CFSTR("Persistence Features");
}

- (void)_enumerateAndGenerateSectionComparators:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a3;
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __68__REElementRelevanceEngine__enumerateAndGenerateSectionComparators___block_invoke;
    v8[3] = &unk_24CF8CBC0;
    v9 = v5;
    v10 = v7;
    objc_msgSend(v6, "enumerateSectionDescriptorsWithOptions:includeHistoric:usingBlock:", 0, 1, v8);

  }
}

- (void)_checkPreferences
{
  void *v3;
  id v4;

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectivePreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[RERelevanceProviderEnvironment setAllowsLocationUse:](self->_providerEnvironment, "setAllowsLocationUse:", objc_msgSend(v4, "mode") & 1);
}

- (id)relevanceProviderEnvironment
{
  return self->_providerEnvironment;
}

- (BOOL)modelManager:(id)a3 loadDataStoreFromURL:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id *v19;
  REFeatureSet *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_persistenceFeatures;
  v7 = -[REFeatureSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "name", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

        if (v16)
        {
          objc_msgSend(v11, "transformer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "readFromURL:error:", v13, v19);

        }
      }
      v8 = -[REFeatureSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return 1;
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateElementRelevance");

}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStateBasedOnPredictor");

}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "outstandingActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v4, "countForObject:", v9);
        if (v10)
        {
          v11 = v10;
          do
          {
            objc_msgSend(*(id *)(a1 + 32), "beginActivity:forObject:", v9, v3);
            --v11;
          }
          while (v11);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[REElementRelevanceEngine pause](self, "pause");
  -[REPredictorManager removeObserver:](self->_predictorManager, "removeObserver:", self);
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("RERelevanceEnginePreferencesDidUpdate"), 0);

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDataStore:", self);

  v8.receiver = self;
  v8.super_class = (Class)REElementRelevanceEngine;
  -[RERelevanceEngineSubsystem dealloc](&v8, sel_dealloc);
}

- (NSArray)sections
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_sections, "allKeys");
}

- (unint64_t)numberOfElementsInSection:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "visibleCount");

  return v4;
}

- (id)elementAtPath:(id)a3
{
  NSMutableDictionary *sections;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  sections = self->_sections;
  v4 = a3;
  objc_msgSend(v4, "sectionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sections, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "element");
  objc_msgSend(v6, "elementIdAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)modelManager:(id)a3 saveDataStoreToURL:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REFeatureSet *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_persistenceFeatures;
  v8 = -[REFeatureSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, a5);

        objc_msgSend(v12, "transformer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "writeToURL:error:", v14, a5);

      }
      v9 = -[REFeatureSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return 1;
}

- (void)modelManagerDidUpdateModel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke;
  v3[3] = &unk_24CF8AAF0;
  v3[4] = self;
  -[REElementRelevanceEngine _onqueue_async:](self, "_onqueue_async:", v3);
}

uint64_t __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke_2;
  v3[3] = &unk_24CF8ECF8;
  v3[4] = v1;
  return objc_msgSend(v1, "_enumerateAndGenerateSectionComparators:", v3);
}

void __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v5 = a3;
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setComparator:", v5);
}

- (void)addElement:(id)a3 section:(id)a4
{
  id v6;
  NSMutableDictionary *predictedElements;
  void *v8;
  id v9;
  char isKindOfClass;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  RERelevanceProviderEnvironment *providerEnvironment;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  void *v25;
  _QWORD v26[5];
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v23 = v6;
  +[REPredictionElement predictionElementFromElement:](REPredictionElement, "predictionElementFromElement:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSection:", v22);
  predictedElements = self->_predictedElements;
  objc_msgSend(v23, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](predictedElements, "setObject:forKeyedSubscript:", v25, v8);

  objc_msgSend(v23, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }
  v20 = v9;
  v21 = v11;
  -[REKeyMultiValueMap insertValue:forKey:](self->_identifierElementIdentifierMap, "insertValue:forKey:", v9);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v25, "relevanceProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
        -[NSMapTable setObject:forKey:](self->_relevanceProviderElementMap, "setObject:forKey:", v25, v18);
        objc_initWeak(&location, self);
        -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), v18);
        providerEnvironment = self->_providerEnvironment;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __47__REElementRelevanceEngine_addElement_section___block_invoke;
        v26[3] = &unk_24CF8B448;
        objc_copyWeak(&v27, &location);
        v26[4] = v18;
        -[RERelevanceProviderEnvironment addRelevanceProvider:completion:](providerEnvironment, "addRelevanceProvider:completion:", v18, v26);
        if (v17)
          -[RERelevanceProviderEnvironment relateRelevanceProvider:toRelevanceProvider:](self->_providerEnvironment, "relateRelevanceProvider:toRelevanceProvider:", v17, v18);
        v14 = v18;

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        ++v16;
        v17 = v14;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);

  }
  else
  {

    objc_msgSend(v23, "identifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[REElementRelevanceEngine _queue_scheduleRelevanceUpdateForElement:](self, "_queue_scheduleRelevanceUpdateForElement:", v14);
  }

}

void __47__REElementRelevanceEngine_addElement_section___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)reloadElement:(id)a3 withElement:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  NSMutableSet *reloadingElementIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  reloadingElementIdentifiers = self->_reloadingElementIdentifiers;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](reloadingElementIdentifiers, "addObject:", v10);

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementRelevanceEngine sectionForElement:](self, "sectionForElement:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REElementRelevanceEngine _queue_unregisterProvidersForElement:](self, "_queue_unregisterProvidersForElement:", v12);
  -[REElementRelevanceEngine addElement:section:](self, "addElement:section:", v7, v13);

}

- (void)_queue_unregisterProvidersForElement:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_predictedElements, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "relevanceProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[RERelevanceProviderEnvironment removeRelevanceProvider:completion:](self->_providerEnvironment, "removeRelevanceProvider:completion:", v10, 0);
        -[NSMapTable removeObjectForKey:](self->_relevanceProviderElementMap, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)removeElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  REElementRelevanceEngine *v15;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_predictedElements, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementRelevanceEngine _queue_unregisterProvidersForElement:](self, "_queue_unregisterProvidersForElement:", v4);
  objc_msgSend(v5, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__REElementRelevanceEngine_removeElement___block_invoke;
  v11[3] = &unk_24CF8B6F0;
  v12 = v7;
  v13 = v4;
  v14 = v6;
  v15 = self;
  v8 = v6;
  v9 = v4;
  v10 = v7;
  -[REElementRelevanceEngine _performUpdatesToDelegate:](self, "_performUpdatesToDelegate:", v11);

}

void __42__REElementRelevanceEngine_removeElement___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;

  v2 = (uint64_t *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "containsElementWithId:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeElementWithId:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    RELogForDomain(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __42__REElementRelevanceEngine_removeElement___block_invoke_cold_1(v2, a1, v3);

  }
  v4 = (id)*v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 88), "removeValue:forKey:", *(_QWORD *)(a1 + 40), v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "removeObject:", *(_QWORD *)(a1 + 40));

}

- (id)pathForElement:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_predictedElements, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfElementWithId:", v5);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)sectionForElement:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_predictedElements, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resume
{
  -[REPredictorManager resume](self->_predictorManager, "resume");
}

- (void)pause
{
  -[REPredictorManager pause](self->_predictorManager, "pause");
}

- (void)_updateStateBasedOnPredictor
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  RELogForDomain(8);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Update engine state based on scheduled predictor update.", buf, 2u);
  }

  -[REElementRelevanceEngine modelManagerDidUpdateModel:](self, "modelManagerDidUpdateModel:", 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__REElementRelevanceEngine__updateStateBasedOnPredictor__block_invoke;
  v4[3] = &unk_24CF8AAF0;
  v4[4] = self;
  -[REElementRelevanceEngine _onqueue_async:](self, "_onqueue_async:", v4);
}

void __56__REElementRelevanceEngine__updateStateBasedOnPredictor__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleRelevanceUpdateForElement:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)predictor:(id)a3 didBeginActivity:(id)a4
{
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", a4, a3);
}

- (void)predictor:(id)a3 didFinishActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__REElementRelevanceEngine_predictor_didFinishActivity___block_invoke;
  block[3] = &unk_24CF8C580;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __56__REElementRelevanceEngine_predictor_didFinishActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)predictorDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(8);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "Predictor did update: %@", (uint8_t *)&v6, 0xCu);
  }

  -[REUpNextScheduler schedule](self->_predictorUpdatedScheduler, "schedule");
}

- (void)featureTransformerDidInvalidate:(id)a3
{
  -[REElementRelevanceEngine predictorDidUpdate:](self, "predictorDidUpdate:", 0);
}

- (void)relevanceEnvironment:(id)a3 didUpdateRelevanceProvider:(id)a4
{
  NSObject *queue;
  id v6;
  void *v7;
  id v8;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[NSMapTable objectForKey:](self->_relevanceProviderElementMap, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[REElementRelevanceEngine _elementIsFullyLoaded:](self, "_elementIsFullyLoaded:", v8))
    -[REElementRelevanceEngine _queue_scheduleRelevanceUpdateForElement:](self, "_queue_scheduleRelevanceUpdateForElement:", v7);

}

- (BOOL)_elementIsFullyLoaded:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "relevanceProviders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[RERelevanceProviderEnvironment isRelevanceProviderLoaded:](self->_providerEnvironment, "isRelevanceProviderLoaded:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)))
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (void)_queue_scheduleRelevanceUpdateForElement:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_elementsNeedingRelevanceUpdate, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_elementsNeedingRelevanceUpdate, "addObject:", v4);
    -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
    -[REUpNextScheduler schedule](self->_scheduler, "schedule");
  }
  if (RETrainingSimulationIsCurrentlyActive())
    -[REUpNextScheduler performImmediately](self->_scheduler, "performImmediately");

}

- (void)_queue_updateElementRelevance
{
  int *v3;
  int *v4;
  int *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  _BOOL8 v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t n;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  uint64_t v59;
  char v60;
  void *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  NSMutableSet *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t ii;
  uint64_t v74;
  void *v75;
  NSMutableSet *obj;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  id v94;
  id v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t v118[128];
  uint8_t buf[4];
  uint64_t v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = self->_elementsNeedingRelevanceUpdate;
  v83 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
  if (v83)
  {
    v3 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
    v4 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
    v82 = *(_QWORD *)v115;
    v5 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
    do
    {
      for (i = 0; i != v83; i = v48 + 1)
      {
        if (*(_QWORD *)v115 != v82)
          objc_enumerationMutation(obj);
        v84 = i;
        v7 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v3[86]), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *((unsigned __int8 *)&self->super.super.isa + v4[95]);
        v10 = objc_msgSend(v8, "privacyBehavior");
        v11 = objc_msgSend(v8, "privacyBehavior");
        v12 = objc_msgSend(v8, "privacyBehavior");
        v13 = v11 == 1;
        if (!v9)
          v13 = v10 == 2;
        v15 = !self->_ignoreDeviceLockState && v12 != 0 && v13;
        v85 = v7;
        v16 = -[NSMutableSet containsObject:](self->_reloadingElementIdentifiers, "containsObject:", v7);
        v87 = v8;
        if (-[REElementRelevanceEngine _elementIsFullyLoaded:](self, "_elementIsFullyLoaded:", v8))
        {
          if (v16)
          {
            -[NSMutableSet removeObject:](self->_reloadingElementIdentifiers, "removeObject:", v7);
            RELogForDomain(3);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v8, "relevanceProviders");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v120 = v7;
              v121 = 2112;
              v122 = v66;
              _os_log_debug_impl(&dword_2132F7000, v17, OS_LOG_TYPE_DEBUG, "updateElementRelevance: finished reloading %@ %@", buf, 0x16u);

            }
          }
          v81 = v15;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v18 = objc_claimAutoreleasedReturnValue();
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          objc_msgSend(v87, "relevanceProviders");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v111;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v111 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
                if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v5[91]), "isRelevanceProviderHistoric:", v24))-[NSObject addObject:](v18, "addObject:", v24);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
            }
            while (v21);
          }

          if (-[NSObject count](v18, "count"))
          {
            objc_msgSend(MEMORY[0x24BDD14E0], "set");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = 0u;
            v107 = 0u;
            v108 = 0u;
            v109 = 0u;
            objc_msgSend(v87, "relevanceProviders");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v107;
              do
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v107 != v29)
                    objc_enumerationMutation(v26);
                  objc_msgSend(v25, "addObject:", objc_opt_class());
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
              }
              while (v28);
            }

            objc_msgSend(MEMORY[0x24BDD14E0], "set");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            v32 = v18;
            v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v102, v126, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v103;
              do
              {
                for (m = 0; m != v34; ++m)
                {
                  if (*(_QWORD *)v103 != v35)
                    objc_enumerationMutation(v32);
                  objc_msgSend(v31, "addObject:", objc_opt_class());
                }
                v34 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v102, v126, 16);
              }
              while (v34);
            }

            v100 = 0u;
            v101 = 0u;
            v98 = 0u;
            v99 = 0u;
            v37 = v31;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v125, 16);
            if (v38)
            {
              v39 = v38;
              v40 = 0;
              v41 = *(_QWORD *)v99;
              do
              {
                for (n = 0; n != v39; ++n)
                {
                  if (*(_QWORD *)v99 != v41)
                    objc_enumerationMutation(v37);
                  v43 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * n);
                  v44 = objc_msgSend(v37, "countForObject:", v43);
                  if (v44 == objc_msgSend(v25, "countForObject:", v43))
                    v40 = 1;
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v125, 16);
              }
              while (v39);
            }
            else
            {
              v40 = 0;
            }

            v49 = v40 & 1;
          }
          else
          {
            v49 = 0;
          }
          -[REElementRelevanceEngine _queue_featureMapForElementWithId:trainingContext:](self, "_queue_featureMapForElementWithId:trainingContext:", v85, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reloadingCachedFeatureMap, "setObject:forKeyedSubscript:", v50, v85);
          objc_msgSend(v87, "section");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v52;
          objc_msgSend(v52, "name");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v53, "isSectionWithNameHistoric:", v55);

          if (v56 && (v49 & 1) == 0)
          {
            -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "sectionForHistoricSection:", v51);
            v58 = (id)objc_claimAutoreleasedReturnValue();
            v59 = v85;
            goto LABEL_67;
          }
          v60 = v56 | v49 ^ 1;
          v59 = v85;
          if ((v60 & 1) != 0)
            goto LABEL_68;
          -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "historicSectionForSection:", v51);
          v58 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

          if (!v58)
LABEL_68:
            v58 = v51;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", v58);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v61)
          {
            objc_msgSend(v54, "name");
            v62 = objc_claimAutoreleasedReturnValue();

            v58 = (id)v62;
          }
          v5 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
          v48 = v84;
          objc_msgSend(v87, "setSection:", v58);
          objc_msgSend(v80, "addObject:", v59);
          objc_msgSend(v79, "setObject:forKeyedSubscript:", v58, v59);
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v50, v59);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v81);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v63, v59);

          RELogForDomain(3);
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v50, "description");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v120 = v59;
            v121 = 2112;
            v122 = v65;
            v123 = 2112;
            v124 = v51;
            _os_log_debug_impl(&dword_2132F7000, v64, OS_LOG_TYPE_DEBUG, "Relevance of element %@ updated to %@ (%@)", buf, 0x20u);

            v5 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
          }

          v3 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
          v4 = &OBJC_IVAR___REFeatureTransformer__invalidationDelegate;
          goto LABEL_74;
        }
        if ((v16 & 1) != 0)
        {
          -[NSMutableDictionary objectForKey:](self->_reloadingCachedFeatureMap, "objectForKey:", v7);
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addObject:", v7);
          objc_msgSend(v87, "section");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKeyedSubscript:", v45, v7);

          objc_msgSend(v78, "setObject:forKeyedSubscript:", v18, v7);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v46, v7);

          RELogForDomain(3);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = v84;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v120 = v7;
            _os_log_debug_impl(&dword_2132F7000, v47, OS_LOG_TYPE_DEBUG, "updateElementRelevance: used cached feature map for %@", buf, 0xCu);
          }

        }
        else
        {
          RELogForDomain(3);
          v18 = objc_claimAutoreleasedReturnValue();
          v48 = v84;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v120 = v7;
            _os_log_debug_impl(&dword_2132F7000, v18, OS_LOG_TYPE_DEBUG, "updateElementRelevance: not loaded %@", buf, 0xCu);
          }
        }
LABEL_74:

      }
      v83 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
    }
    while (v83);
  }

  v93[0] = MEMORY[0x24BDAC760];
  v93[1] = 3221225472;
  v93[2] = __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke;
  v93[3] = &unk_24CF8ED98;
  v93[4] = self;
  v88 = v79;
  v94 = v88;
  v86 = v78;
  v95 = v86;
  v67 = v77;
  v96 = v67;
  v68 = v80;
  v97 = v68;
  -[REElementRelevanceEngine _performUpdatesToDelegate:](self, "_performUpdatesToDelegate:", v93);
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v69 = self->_elementsNeedingRelevanceUpdate;
  v70 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v89, v118, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v90;
    do
    {
      for (ii = 0; ii != v71; ++ii)
      {
        if (*(_QWORD *)v90 != v72)
          objc_enumerationMutation(v69);
        v74 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * ii);
        -[REElementRelevanceEngine delegate](self, "delegate");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "relevanceEngine:didUpdateRelevanceOfElement:", self, v74);

        -[RERelevanceEngineSubsystem endActivity:forObject:](self, "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
      }
      v71 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v89, v118, 16);
    }
    while (v71);
  }

  -[NSMutableSet removeAllObjects](self->_elementsNeedingRelevanceUpdate, "removeAllObjects");
}

void __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*((id *)a1[4] + 6), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
        v22[0] = v6;
        v22[1] = 3221225472;
        v22[2] = __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke_2;
        v22[3] = &unk_24CF8ED70;
        v9 = a1[5];
        v10 = a1[4];
        v23 = v9;
        v24 = v10;
        v25 = a1[6];
        v26 = a1[7];
        v27 = v8;
        v28 = a1[8];
        objc_msgSend(v8, "performBatchUpdates:", v22);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = a1[8];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        objc_msgSend(a1[4], "delegate", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "relevanceEngine:elementWasAdded:", a1[4], v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v33, 16);
    }
    while (v13);
  }

}

void __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  REMLElement *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        v14 = objc_msgSend(*(id *)(a1 + 64), "containsElementWithId:", v7);
        v15 = *(void **)(a1 + 64);
        if (v14)
        {
          if (v10 == v15)
            objc_msgSend(v10, "updateElementWithId:withNewFeatureSet:forceHidden:", v7, v11, v13);
          else
            objc_msgSend(v15, "removeElementWithId:", v7);
          objc_msgSend(*(id *)(a1 + 72), "removeObject:", v7);
        }
        else if (v10 == v15)
        {
          v16 = -[REMLElement initWithIdentifier:featureMap:]([REMLElement alloc], "initWithIdentifier:featureMap:", v7, v11);
          objc_msgSend(*(id *)(a1 + 64), "addElement:forceHidden:", v16, v13);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

- (void)_performUpdatesToDelegate:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  if (a3)
  {
    v4 = (void (**)(_QWORD))a3;
    -[REElementRelevanceEngine _allCurrentElements](self, "_allCurrentElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4);

    -[REElementRelevanceEngine _allCurrentElements](self, "_allCurrentElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REElementRelevanceEngine delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke;
    v10[3] = &unk_24CF8C580;
    v10[4] = self;
    v11 = v5;
    v12 = v6;
    v8 = v6;
    v9 = v5;
    objc_msgSend(v7, "relevanceEngine:performedBatchUpdates:", self, v10);

  }
}

void __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id obj;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[REArrayDiff diffFromElements:toElements:equalComparator:hashGenerator:changeComparator:](REArrayDiff, "diffFromElements:toElements:equalComparator:hashGenerator:changeComparator:", v7, v8, &__block_literal_global_46, &__block_literal_global_34, &__block_literal_global_35_0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_5;
        v12[3] = &unk_24CF8EE60;
        v10 = *(_QWORD *)(a1 + 32);
        v12[4] = v6;
        v12[5] = v10;
        objc_msgSend(v9, "enumerateOperationsUsingBlock:", v12);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

uint64_t __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:");
}

uint64_t __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hash");
}

uint64_t __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_4()
{
  return 0;
}

void __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a2)
  {
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relevanceEngine:didMoveElement:fromPath:toPath:", *(_QWORD *)(a1 + 40), v12, v10, v9);
      goto LABEL_7;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relevanceEngine:didRemoveElement:atPath:", *(_QWORD *)(a1 + 40), v12, v10);
      goto LABEL_7;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relevanceEngine:didInsertElement:atPath:", *(_QWORD *)(a1 + 40), v12, v9);
LABEL_7:

      break;
  }

}

- (id)_allCurrentElements
{
  void *v3;
  NSMutableDictionary *sections;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_sections, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sections = self->_sections;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__REElementRelevanceEngine__allCurrentElements__block_invoke;
  v8[3] = &unk_24CF8EE88;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __47__REElementRelevanceEngine__allCurrentElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "visibleCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "visibleCount") >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "elementIdAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "visibleCount"));
  }
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

}

- (void)_onqueue_async:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)sectionDidUpdateContentOrder:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  RELogForDomain(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[REElementRelevanceEngine sectionDidUpdateContentOrder:].cold.1(v3, v4);

}

- (id)section:(id)a3 groupForIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  REDataSourceManager *dataSourceManager;
  void *v17;
  REDataSourceManager *v18;
  REDataSourceManager *v19;
  char v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[16];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_fetchedInternalBuildOnceToken_3 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_3, &__block_literal_global_241);
  if (!_isInternalDevice_3)
    goto LABEL_23;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ____RE_Cached_Get__ShowAllElements_block_invoke;
  block[3] = &unk_24CF8AAF0;
  v23 = 0;
  if (__RE_Cached_Get__ShowAllElements_onceToken != -1)
    dispatch_once(&__RE_Cached_Get__ShowAllElements_onceToken, block);
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  if ((__RE_Cached_hasValue__ShowAllElements & 1) == 0)
  {
    v21 = 0;
    if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    {
      *(_OWORD *)buf = xmmword_24CF8EF30;
      v25 = 0;
      RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (RelevanceEngineLibraryCore_frameworkLibrary_0)
    {
      objc_msgSend(soft__REEngineDefaults(), "globalDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = objc_msgSend(v8, "_BOOLValueForKey:set:", CFSTR("ShowAllElements"), &v21);
    if (v21)
      v10 = v9;
    else
      v10 = 0;
    RELogForDomain(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_2132F7000, v11, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key ShowAllElements: %@", buf, 0xCu);

    }
    if (v21)
      v13 = v10;
    else
      v13 = 0;
    __RE_Cached__ShowAllElements = v13;
    __RE_Cached_hasValue__ShowAllElements = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  v14 = __RE_Cached__ShowAllElements;

  if (v14)
  {
    v15 = 0;
  }
  else
  {
LABEL_23:
    dataSourceManager = self->_dataSourceManager;
    if (!dataSourceManager)
    {
      -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dataSourceManager");
      v18 = (REDataSourceManager *)objc_claimAutoreleasedReturnValue();
      v19 = self->_dataSourceManager;
      self->_dataSourceManager = v18;

      dataSourceManager = self->_dataSourceManager;
    }
    -[REDataSourceManager elementGroupForIdentifier:](dataSourceManager, "elementGroupForIdentifier:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_queue_featureMapForElementWithId:(id)a3 trainingContext:(id)a4
{
  NSMutableDictionary *predictedElements;
  id v7;
  void *v8;
  void *v9;

  predictedElements = self->_predictedElements;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](predictedElements, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementRelevanceEngine _queue_featureMapForElement:trainingContext:](self, "_queue_featureMapForElement:trainingContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_queue_featureMapForElement:(id)a3 trainingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  RERelevanceProviderEnvironment *providerEnvironment;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t j;
  void *v20;
  unint64_t v21;
  void *v22;
  REPredictorManager *predictorManager;
  id v24;
  void *v25;
  void *context;
  void *v28;
  id obj;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  context = (void *)MEMORY[0x2199B223C]();
  v28 = v6;
  objc_msgSend(v6, "relevanceProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newInputFeatureMap");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v36;
    v31 = v7;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[RERelevanceProviderEnvironment featuresForRelevanceProvider:](self->_providerEnvironment, "featuresForRelevanceProvider:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        providerEnvironment = self->_providerEnvironment;
        if (v7)
          -[RERelevanceProviderEnvironment relevancesForRelevanceProvider:usingContext:](providerEnvironment, "relevancesForRelevanceProvider:usingContext:", v12, v7);
        else
          -[RERelevanceProviderEnvironment relevancesForRelevanceProvider:](providerEnvironment, "relevancesForRelevanceProvider:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "count");
        v17 = objc_msgSend(v15, "count");
        if (v16 >= v17)
          v18 = v17;
        else
          v18 = v16;
        if (v18)
        {
          for (j = 0; j != v18; ++j)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", j);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v15, "featureValueAtIndex:", j);
            if (objc_msgSend(v10, "hasValueForFeature:", v20))
            {
              v22 = (void *)objc_msgSend(v10, "valueForFeature:", v20);
              if (RECompareFeatureValues(v21, v22) != 1)
                v21 = (unint64_t)v22;
            }
            objc_msgSend(v10, "setValue:forFeature:", v21, v20);

          }
        }

        v7 = v31;
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v32);
  }

  predictorManager = self->_predictorManager;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __72__REElementRelevanceEngine__queue_featureMapForElement_trainingContext___block_invoke;
  v33[3] = &unk_24CF8ADB0;
  v34 = v10;
  v24 = v10;
  -[REPredictorManager enumerateValuesForElement:trainingContext:usingBlock:](predictorManager, "enumerateValuesForElement:trainingContext:usingBlock:", v28, v7, v33);
  -[REFeatureTransmuter transformFeatureMaps:](self->_featureTransmuter, "transformFeatureMaps:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v25;
}

void __72__REElementRelevanceEngine__queue_featureMapForElement_trainingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const void *v6;

  v5 = a2;
  v6 = (const void *)RECreateFeatureValueTaggedPointer(a3);
  objc_msgSend(*(id *)(a1 + 32), "setValue:forFeature:", v6, v5);

  REReleaseFeatureValueTaggedPointer(v6);
}

- (id)featureMapForElement:(id)a3 trainingContext:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  void *v9;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[REElementRelevanceEngine _queue_featureMapForElementWithId:trainingContext:](self, "_queue_featureMapForElementWithId:trainingContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_generateFeatureMapForElement:(id)a3
{
  id v4;
  NSMutableDictionary *predictedElements;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  predictedElements = self->_predictedElements;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](predictedElements, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[REPredictionElement predictionElementFromElement:](REPredictionElement, "predictionElementFromElement:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSection:", CFSTR("defaultSectionIdentifier"));
  }
  -[REElementRelevanceEngine _queue_featureMapForElement:trainingContext:](self, "_queue_featureMapForElement:trainingContext:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)featureProviderForElement:(id)a3
{
  void *v3;
  _REFeatureMapWrapper *v4;

  -[REElementRelevanceEngine _generateFeatureMapForElement:](self, "_generateFeatureMapForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_REFeatureMapWrapper initWithFeatureMap:]([_REFeatureMapWrapper alloc], "initWithFeatureMap:", v3);

  return v4;
}

- (id)predictionForElement:(id)a3
{
  id v4;
  void *v5;
  REMLElement *v6;
  void *v7;
  REMLElement *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[REElementRelevanceEngine _generateFeatureMapForElement:](self, "_generateFeatureMapForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [REMLElement alloc];
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[REMLElement initWithIdentifier:featureMap:](v6, "initWithIdentifier:featureMap:", v7, v5);
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicitionForLogicalElement:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)elementRankerForSection:(id)a3
{
  id v4;
  _REElementRankerWrapper *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = objc_alloc_init(_REElementRankerWrapper);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "comparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_REElementRankerWrapper setComparator:](v5, "setComparator:", v7);

  -[_REElementRankerWrapper setQueue:](v5, "setQueue:", self->_queue);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__REElementRelevanceEngine_elementRankerForSection___block_invoke;
  v9[3] = &unk_24CF8EEB0;
  v9[4] = self;
  -[_REElementRankerWrapper setFeatureMapGenerator:](v5, "setFeatureMapGenerator:", v9);
  return v5;
}

uint64_t __52__REElementRelevanceEngine_elementRankerForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateFeatureMapForElement:", a2);
}

- (NSDictionary)sectionsMap
{
  return (NSDictionary *)self->_sections;
}

- (REPredictorManager)predictorManager
{
  return self->_predictorManager;
}

- (RERelevanceProviderEnvironment)providerEnvironment
{
  return self->_providerEnvironment;
}

- (REElementRelevanceEngineDelegate)delegate
{
  return (REElementRelevanceEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_predictorUpdatedScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_featureTransmuter, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_providerEnvironment, 0);
  objc_storeStrong((id *)&self->_predictorManager, 0);
  objc_storeStrong((id *)&self->_persistenceFeatures, 0);
  objc_storeStrong((id *)&self->_identifierElementIdentifierMap, 0);
  objc_storeStrong((id *)&self->_relevanceProviderElementMap, 0);
  objc_storeStrong((id *)&self->_reloadingCachedFeatureMap, 0);
  objc_storeStrong((id *)&self->_reloadingElementIdentifiers, 0);
  objc_storeStrong((id *)&self->_predictedElements, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_elementsNeedingRelevanceUpdate, 0);
}

- (id)featureMapForPredictedElement:(id)a3 trainingContext:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  void *v9;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[REElementRelevanceEngine _queue_featureMapForElement:trainingContext:](self, "_queue_featureMapForElement:trainingContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_identifierForElementIdentifier:(id)a3
{
  return -[REKeyMultiValueMap keyForValue:](self->_identifierElementIdentifierMap, "keyForValue:", a3);
}

- (id)_elementIdentifierForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[REKeyMultiValueMap valuesForKey:](self->_identifierElementIdentifierMap, "valuesForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)refreshContent
{
  -[REElementRelevanceEngine predictorDidUpdate:](self, "predictorDidUpdate:", 0);
}

void __42__REElementRelevanceEngine_removeElement___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_2132F7000, log, OS_LOG_TYPE_DEBUG, "No element %@ with found in section %@", (uint8_t *)&v5, 0x16u);
}

- (void)sectionDidUpdateContentOrder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_2132F7000, a2, OS_LOG_TYPE_DEBUG, "Section (grouped) did update %@", (uint8_t *)&v4, 0xCu);

}

@end
