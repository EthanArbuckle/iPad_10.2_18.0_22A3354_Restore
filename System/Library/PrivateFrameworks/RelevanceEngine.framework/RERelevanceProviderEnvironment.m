@implementation RERelevanceProviderEnvironment

- (void)_setupRelevanceProviderManagers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSMutableArray *obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __65__RERelevanceProviderEnvironment__setupRelevanceProviderManagers__block_invoke;
  v49[3] = &unk_24CF8EB10;
  v49[4] = self;
  v3 = MEMORY[0x2199B2434](v49, a2);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  +[RERelevanceProviderManager providerManagerClasses](RERelevanceProviderManager, "providerManagerClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v46;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v6);
  }

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relevanceProviderManagerLoader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v11;
  v29 = (void *)v3;
  objc_msgSend(v11, "enumerationDataSourceClassesWithBlock:", v3);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = 40;
  obj = self->_relevanceManagers;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v12);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend((id)objc_opt_class(), "_dependencyClasses", v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v38;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v38 != v17)
                objc_enumerationMutation(v14);
              -[NSMapTable objectForKey:](self->_relevanceClassManagerMap, "objectForKey:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v18), "_relevanceProviderClass"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                -[REDependencyGraph markItem:dependentOnItem:](self->_dependencyGraph, "markItem:dependentOnItem:", v13, v19);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          }
          while (v16);
        }

        ++v12;
      }
      while (v12 != v32);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v32);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = *(id *)((char *)&self->super.super.isa + v27);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
        +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders", v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_scheduleUpdate:", v26);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
    }
    while (v22);
  }

}

void __65__RERelevanceProviderEnvironment__setupRelevanceProviderManagers__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  objc_msgSend(a2, "_features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REMutableFeatureSet, "featureSetWithFeatures:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "intersectsFeatureSet:", v14))
  {
    v5 = objc_alloc((Class)a2);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithQueue:", v6);

    objc_msgSend(v7, "setEnvironment:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v14, "intersetFeatureSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(v7, "setSupportedFeatures:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v7, objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addItem:", v7);
    objc_msgSend(*(id *)(a1 + 32), "relevanceEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addLoggable:", v7);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(a2, "_features");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "_histogramForFeature:", v12);

  }
}

- (id)_histogramForFeature:(id)a3
{
  id v4;
  REHistogram *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_relevanceHistogramMap, "objectForKey:", v4);
  v5 = (REHistogram *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[REHistogram initWithFeature:]([REHistogram alloc], "initWithFeature:", v4);
    -[NSMapTable setObject:forKey:](self->_relevanceHistogramMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)scheduleUpdateForRelevanceProviderManager:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *updateCompletionBlocks;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  RELogForDomain(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling imminent update for relevance provider manager %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    updateCompletionBlocks = self->_updateCompletionBlocks;
    v10 = (void *)MEMORY[0x2199B2434](v7);
    -[NSMutableArray addObject:](updateCompletionBlocks, "addObject:", v10);

  }
  -[NSMutableSet addObject:](self->_providerManagersToUpdate, "addObject:", v6);
  -[REUpNextScheduler schedule](self->_scheduler, "schedule");

}

void __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_performUpdate:", v3);

}

void __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  REExpectation *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  RERelevanceValue *v23;
  RETaggedFeatureValueArray *v24;
  RERelevanceValue *v25;
  void *v26;
  id v27;
  __int128 v28;
  void *v29;
  id *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  _QWORD v37[4];
  NSObject *v38;
  void *v39;
  REExpectation *v40;
  uint64_t *v41;
  _QWORD v42[4];
  NSObject *v43;
  void *v44;
  id v45;
  REExpectation *v46;
  uint64_t *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  os_unfair_lock_s *v53;
  uint64_t v54;
  void *v55;
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE buf[12];
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeAllObjects");
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v30 = (id *)a1;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v62 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v7, "allProviders");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v58 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          }
          while (v9);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v4);
  }

  v52 = 0;
  v53 = (os_unfair_lock_s *)&v52;
  v54 = 0x2810000000;
  v55 = &unk_2133F94DA;
  v56 = 0;
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(REExpectation);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = v2;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
  if (v14)
  {
    v16 = *(_QWORD *)v49;
    *(_QWORD *)&v15 = 138412546;
    v28 = v15;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
        objc_msgSend(v30[4], "_providerManagerForProvider:", v18, v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          if ((objc_msgSend(v19, "containsProvider:", v18) & 1) != 0)
          {
            -[REExpectation beginOperation](v12, "beginOperation");
            if (objc_msgSend((id)objc_opt_class(), "supportsHistoricProviders"))
            {
              v42[0] = MEMORY[0x24BDAC760];
              v42[1] = 3221225472;
              v42[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_52;
              v42[3] = &unk_24CF8EB88;
              v21 = v20;
              v43 = v21;
              v44 = v18;
              v47 = &v52;
              v45 = v29;
              v46 = v12;
              -[NSObject isProviderHistoric:completion:](v21, "isProviderHistoric:completion:", v18, v42);

              v22 = v43;
            }
            else
            {
              v37[0] = MEMORY[0x24BDAC760];
              v37[1] = 3221225472;
              v37[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4_59;
              v37[3] = &unk_24CF8EBB0;
              v41 = &v52;
              v38 = v29;
              v39 = v18;
              v40 = v12;
              objc_msgSend(v20, "relevanceForProvider:completion:", v18, v37);

              v22 = v38;
            }
          }
          else
          {
            RELogForDomain(3);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v28;
              *(_QWORD *)&buf[4] = v18;
              v66 = 2112;
              v67 = v20;
              _os_log_impl(&dword_2132F7000, v22, OS_LOG_TYPE_INFO, "Can find provider %@ in manager %@", buf, 0x16u);
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_30;
          v22 = v18;
          *(_QWORD *)buf = 0;
          *(_QWORD *)buf = -[NSObject value](v22, "value");
          os_unfair_lock_lock(v53 + 8);
          v23 = [RERelevanceValue alloc];
          v24 = -[RETaggedFeatureValueArray initWithValues:count:]([RETaggedFeatureValueArray alloc], "initWithValues:count:", buf, 1);
          v25 = -[RERelevanceValue initWithValues:isHistoric:](v23, "initWithValues:isHistoric:", v24, 0);
          objc_msgSend(v29, "setObject:forKey:", v25, v22);

          os_unfair_lock_unlock(v53 + 8);
        }

LABEL_30:
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
    }
    while (v14);
  }

  objc_msgSend(v30[4], "queue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_5;
  v31[3] = &unk_24CF8EBD8;
  v31[4] = v30[4];
  v36 = &v52;
  v27 = v29;
  v32 = v27;
  v33 = v30[5];
  v34 = v30[6];
  v35 = v30[7];
  -[REExpectation notifyOperationsCompleteOrPerformUsingQueue:block:](v12, "notifyOperationsCompleteOrPerformUsingQueue:block:", v26, v31);

  _Block_object_dispose(&v52, 8);
}

void __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
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
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lock");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v36 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_removeRelevanceValueForProvider:", v7);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_addRelevanceValue:forProvider:", v9, v7);
        v10 = v9;
        if (v8 == v10)
        {

        }
        else
        {
          v11 = objc_msgSend(v8, "isEqual:", v10);

          if ((v11 & 1) == 0)
            objc_msgSend(v26, "addObject:", v7);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "unlock");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v26;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "relevanceEnvironment:didUpdateRelevanceProvider:", *(_QWORD *)(a1 + 32), v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = *(id *)(a1 + 48);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * k);
        if (objc_msgSend((id)objc_opt_class(), "_wantsDelayedUpdate")
          && (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= 2)
        {
          +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_scheduleUpdate:", v25);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v21);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects", (_QWORD)v8);
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 32));
}

- (void)_queue_performUpdate:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  REDependencyGraph *dependencyGraph;
  REExpectation *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD);
  void (**v25)(_QWORD);
  _QWORD v26[5];
  id v27;
  void (**v28)(_QWORD);
  void (**v29)(_QWORD);
  _QWORD v30[4];
  REExpectation *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  v5 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke;
  v42[3] = &unk_24CF8AAF0;
  v42[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x2199B2434](v42);
  if (-[NSHashTable count](self->_providersToUpdate, "count")
    || -[NSMutableSet count](self->_providerManagersToUpdate, "count"))
  {
    v24 = v6;
    v25 = v4;
    v7 = (void *)-[NSMutableSet mutableCopy](self->_providerManagersToUpdate, "mutableCopy");
    -[NSMutableSet removeAllObjects](self->_providerManagersToUpdate, "removeAllObjects");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (-[REDependencyGraph containsItem:](self->_dependencyGraph, "containsItem:", v13))
          {
            dependencyGraph = self->_dependencyGraph;
            v36[0] = v5;
            v36[1] = 3221225472;
            v36[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2;
            v36[3] = &unk_24CF8EB38;
            v37 = v7;
            -[REDependencyGraph enumerateDependenciesOfItem:usingBlock:](dependencyGraph, "enumerateDependenciesOfItem:usingBlock:", v13, v36);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v10);
    }

    v15 = objc_alloc_init(REExpectation);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          -[REExpectation beginOperation](v15, "beginOperation");
          v30[0] = v5;
          v30[1] = 3221225472;
          v30[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3;
          v30[3] = &unk_24CF8AAF0;
          v31 = v15;
          objc_msgSend(v21, "_prepareForUpdateWithCompletion:", v30);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v18);
    }

    -[RERelevanceEngineSubsystem queue](self, "queue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4;
    v26[3] = &unk_24CF8EC00;
    v26[4] = self;
    v27 = v16;
    v6 = v24;
    v28 = v24;
    v4 = v25;
    v29 = v25;
    v23 = v16;
    -[REExpectation notifyOperationsCompleteOrPerformUsingQueue:block:](v15, "notifyOperationsCompleteOrPerformUsingQueue:block:", v22, v26);

  }
  else
  {
    v6[2](v6);
    v4[2](v4);
  }

}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endOperation");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RERelevanceProviderEnvironment)initWithRelevanceEngine:(id)a3
{
  id v4;
  RERelevanceProviderEnvironment *v5;
  uint64_t v6;
  NSMutableArray *relevanceManagers;
  uint64_t v8;
  NSMapTable *relevanceClassManagerMap;
  uint64_t v10;
  NSMapTable *relevanceHistogramMap;
  uint64_t v12;
  NSMapTable *relevanceValues;
  uint64_t v14;
  NSHashTable *customProviders;
  uint64_t v16;
  NSLock *relevanceValuesLock;
  void *v18;
  uint64_t v19;
  REFeatureSet *supportedFeatures;
  REUpNextDisjointSet *v21;
  REUpNextDisjointSet *relevanceProviderSet;
  REDependencyGraph *v23;
  REDependencyGraph *dependencyGraph;
  uint64_t v25;
  NSHashTable *providersToUpdate;
  uint64_t v27;
  NSMutableSet *providerManagersToUpdate;
  uint64_t v29;
  NSMutableArray *updateCompletionBlocks;
  void *v31;
  void *v32;
  NSObject *v33;
  _QWORD v35[4];
  RERelevanceProviderEnvironment *v36;
  id v37;
  char v38;
  id location;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)RERelevanceProviderEnvironment;
  v5 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v40, sel_initWithRelevanceEngine_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    relevanceManagers = v5->_relevanceManagers;
    v5->_relevanceManagers = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    relevanceClassManagerMap = v5->_relevanceClassManagerMap;
    v5->_relevanceClassManagerMap = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    relevanceHistogramMap = v5->_relevanceHistogramMap;
    v5->_relevanceHistogramMap = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    relevanceValues = v5->_relevanceValues;
    v5->_relevanceValues = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v14 = objc_claimAutoreleasedReturnValue();
    customProviders = v5->_customProviders;
    v5->_customProviders = (NSHashTable *)v14;

    v16 = objc_opt_new();
    relevanceValuesLock = v5->_relevanceValuesLock;
    v5->_relevanceValuesLock = (NSLock *)v16;

    objc_msgSend(v4, "rootFeatures");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    supportedFeatures = v5->_supportedFeatures;
    v5->_supportedFeatures = (REFeatureSet *)v19;

    v21 = objc_alloc_init(REUpNextDisjointSet);
    relevanceProviderSet = v5->_relevanceProviderSet;
    v5->_relevanceProviderSet = v21;

    v23 = objc_alloc_init(REDependencyGraph);
    dependencyGraph = v5->_dependencyGraph;
    v5->_dependencyGraph = v23;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v25 = objc_claimAutoreleasedReturnValue();
    providersToUpdate = v5->_providersToUpdate;
    v5->_providersToUpdate = (NSHashTable *)v25;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    providerManagersToUpdate = v5->_providerManagersToUpdate;
    v5->_providerManagersToUpdate = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v29 = objc_claimAutoreleasedReturnValue();
    updateCompletionBlocks = v5->_updateCompletionBlocks;
    v5->_updateCompletionBlocks = (NSMutableArray *)v29;

    objc_msgSend(v4, "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addLoggable:", v5);

    objc_msgSend(v4, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = objc_msgSend(v32, "wantsImmutableContent");

    objc_initWeak(&location, v5);
    -[RERelevanceEngineSubsystem queue](v5, "queue");
    v33 = objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke;
    v35[3] = &unk_24CF8EAA8;
    v36 = v5;
    v38 = (char)v31;
    objc_copyWeak(&v37, &location);
    dispatch_sync(v33, v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_allowsLocationUse != a3)
  {
    v3 = a3;
    self->_allowsLocationUse = a3;
    if (-[RERelevanceEngineSubsystem isRunning](self, "isRunning"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = self->_relevanceManagers;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            if (objc_msgSend((id)objc_opt_class(), "_requiresLocationServices"))
            {
              if (v3)
              {
                -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), v10);
                v11[0] = MEMORY[0x24BDAC760];
                v11[1] = 3221225472;
                v11[2] = __55__RERelevanceProviderEnvironment_setAllowsLocationUse___block_invoke;
                v11[3] = &unk_24CF8AB18;
                v11[4] = self;
                v11[5] = v10;
                objc_msgSend(v10, "resumeWithCompletion:", v11);
              }
              else
              {
                objc_msgSend(v10, "pauseWithCompletion:", &__block_literal_global_44_1);
              }
            }
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

    }
  }
}

void __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_setupRelevanceProviderManagers");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
    v3 = 0.0;
  else
    v3 = 0.05;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke_2;
  v7[3] = &unk_24CF8EA80;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  +[REUpNextScheduler schedulerWithQueue:delay:updateCompletionBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateCompletionBlock:", v2, v7, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v4;

  objc_destroyWeak(&v8);
}

- (BOOL)isSupportedRelevanceProvider:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "feature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[REFeatureSet containsFeature:](self->_supportedFeatures, "containsFeature:", v7);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)_providerManagerForProvider:(id)a3
{
  return -[NSMapTable objectForKey:](self->_relevanceClassManagerMap, "objectForKey:", objc_opt_class());
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_relevanceManagers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeLoggable:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeLoggable:", self);

  v13.receiver = self;
  v13.super_class = (Class)RERelevanceProviderEnvironment;
  -[RERelevanceEngineSubsystem dealloc](&v13, sel_dealloc);
}

- (void)pause
{
  NSMutableArray *v2;
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
  v2 = self->_relevanceManagers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "pauseWithCompletion:", &__block_literal_global_43, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)resume
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_relevanceManagers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!objc_msgSend((id)objc_opt_class(), "_requiresLocationServices") || self->_allowsLocationUse)
        {
          -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), v9);
          v10[0] = v7;
          v10[1] = 3221225472;
          v10[2] = __40__RERelevanceProviderEnvironment_resume__block_invoke;
          v10[3] = &unk_24CF8AB18;
          v10[4] = self;
          v10[5] = v9;
          objc_msgSend(v9, "resumeWithCompletion:", v10);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

uint64_t __40__RERelevanceProviderEnvironment_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 40));
}

uint64_t __55__RERelevanceProviderEnvironment_setAllowsLocationUse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 40));
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_52(uint64_t a1, int a2)
{
  char v2;
  void *v4;
  uint64_t v5;
  id *v6;
  id v7;
  uint64_t v8;
  id *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[2];
  char v15;
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  char v19;

  v2 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2_53;
    v16[3] = &unk_24CF8EB60;
    v18[1] = *(_QWORD *)(a1 + 64);
    v6 = (id *)v17;
    v7 = *(id *)(a1 + 48);
    v19 = v2;
    v8 = *(_QWORD *)(a1 + 40);
    v17[0] = v7;
    v17[1] = v8;
    v9 = (id *)v18;
    v18[0] = *(id *)(a1 + 56);
    objc_msgSend(v4, "relevanceForHistoricProvider:completion:", v5, v16);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3_57;
    v12[3] = &unk_24CF8EB60;
    v14[1] = *(_QWORD *)(a1 + 64);
    v6 = (id *)v13;
    v10 = *(id *)(a1 + 48);
    v15 = v2;
    v11 = *(_QWORD *)(a1 + 40);
    v13[0] = v10;
    v13[1] = v11;
    v9 = (id *)v14;
    v14[0] = *(id *)(a1 + 56);
    objc_msgSend(v4, "relevanceForProvider:completion:", v5, v12);
  }

}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2_53(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  RERelevanceValue *v6;
  RETaggedFeatureValueArray *v7;
  RERelevanceValue *v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = *(void **)(a1 + 32);
  v6 = [RERelevanceValue alloc];
  v7 = -[RETaggedFeatureValueArray initWithFeatureValues:]([RETaggedFeatureValueArray alloc], "initWithFeatureValues:", v4);

  v8 = -[RERelevanceValue initWithValues:isHistoric:](v6, "initWithValues:isHistoric:", v7, *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v5, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  return objc_msgSend(*(id *)(a1 + 48), "endOperation");
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3_57(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  RERelevanceValue *v6;
  RETaggedFeatureValueArray *v7;
  RERelevanceValue *v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = *(void **)(a1 + 32);
  v6 = [RERelevanceValue alloc];
  v7 = -[RETaggedFeatureValueArray initWithFeatureValues:]([RETaggedFeatureValueArray alloc], "initWithFeatureValues:", v4);

  v8 = -[RERelevanceValue initWithValues:isHistoric:](v6, "initWithValues:isHistoric:", v7, *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v5, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  return objc_msgSend(*(id *)(a1 + 48), "endOperation");
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4_59(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  RERelevanceValue *v6;
  RETaggedFeatureValueArray *v7;
  RERelevanceValue *v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = *(void **)(a1 + 32);
  v6 = [RERelevanceValue alloc];
  v7 = -[RETaggedFeatureValueArray initWithFeatureValues:]([RETaggedFeatureValueArray alloc], "initWithFeatureValues:", v4);

  v8 = -[RERelevanceValue initWithValues:isHistoric:](v6, "initWithValues:isHistoric:", v7, 0);
  objc_msgSend(v5, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  return objc_msgSend(*(id *)(a1 + 48), "endOperation");
}

- (void)_removeRelevanceValueForProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMapTable objectForKey:](self->_relevanceValues, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isHistoric") & 1) == 0)
  {
    objc_msgSend(v5, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "firstFeatureValue");
    -[RERelevanceProviderEnvironment _histogramForProvider:](self, "_histogramForProvider:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeValue:", v7);

  }
  -[NSMapTable removeObjectForKey:](self->_relevanceValues, "removeObjectForKey:", v9);

}

- (void)_addRelevanceValue:(id)a3 forProvider:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(v10, "isHistoric") & 1) == 0)
  {
    objc_msgSend(v10, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "firstFeatureValue");
    -[RERelevanceProviderEnvironment _histogramForProvider:](self, "_histogramForProvider:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addValue:", v8);

  }
  -[NSMapTable setObject:forKey:](self->_relevanceValues, "setObject:forKey:", v10, v6);

}

- (id)_histogramForProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "effectiveFeatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RERelevanceProviderEnvironment _histogramForFeature:](self, "_histogramForFeature:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "feature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RERelevanceProviderEnvironment _histogramForFeature:](self, "_histogramForFeature:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v9;
}

- (unint64_t)relevanceProviderCount
{
  return -[REUpNextDisjointSet count](self->_relevanceProviderSet, "count");
}

- (void)addRelevanceProvider:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v16)
  {
    objc_msgSend(v16, "setEnvironment:", self);
    -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "addProvider:completion:", v16, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSHashTable addObject:](self->_customProviders, "addObject:", v16);
        -[RERelevanceProviderEnvironment delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "relevanceEnvironment:didUpdateRelevanceProvider:", self, v16);

        if (v6)
          v6[2](v6);
      }
      else
      {
        RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Unsupported relevance provider: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v16);
      }
    }
    -[REUpNextDisjointSet addItem:](self->_relevanceProviderSet, "addItem:", v16);

  }
}

- (void)removeRelevanceProvider:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v15)
  {
    objc_msgSend(v15, "setEnvironment:", 0);
    -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "removeProvider:completion:", v15, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSHashTable removeObject:](self->_customProviders, "removeObject:", v15);
        if (v6)
          v6[2](v6);
      }
      else
      {
        RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Unsupported relevance provider: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v15);
      }
    }
    -[REUpNextDisjointSet removeItem:](self->_relevanceProviderSet, "removeItem:", v15);
    -[NSLock lock](self->_relevanceValuesLock, "lock");
    -[RERelevanceProviderEnvironment _removeRelevanceValueForProvider:](self, "_removeRelevanceValueForProvider:", v15);
    -[NSLock unlock](self->_relevanceValuesLock, "unlock");

  }
}

- (BOOL)containsRelevanceProvider:(id)a3
{
  RERelevanceProviderEnvironment *v4;
  BOOL v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "environment");
  v4 = (RERelevanceProviderEnvironment *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self;

  return v5;
}

- (BOOL)isRelevanceProviderLoaded:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[RERelevanceProviderEnvironment containsRelevanceProvider:](self, "containsRelevanceProvider:", v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[NSLock lock](self->_relevanceValuesLock, "lock");
      -[NSMapTable objectForKey:](self->_relevanceValues, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

      -[NSLock unlock](self->_relevanceValuesLock, "unlock");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)relateRelevanceProvider:(id)a3 toRelevanceProvider:(id)a4
{
  if (a3)
  {
    if (a4)
      -[REUpNextDisjointSet connectItem:withItem:](self->_relevanceProviderSet, "connectItem:withItem:");
  }
}

- (BOOL)isRelevanceProviderHistoric:(id)a3
{
  NSLock *relevanceValuesLock;
  id v5;
  void *v6;
  char v7;

  relevanceValuesLock = self->_relevanceValuesLock;
  v5 = a3;
  -[NSLock lock](relevanceValuesLock, "lock");
  -[NSMapTable objectForKey:](self->_relevanceValues, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "isHistoric");
  else
    v7 = 0;
  -[NSLock unlock](self->_relevanceValuesLock, "unlock");

  return v7;
}

- (id)relevancesForRelevanceProvider:(id)a3 usingContext:(id)a4
{
  id v6;
  id v7;
  RETaggedFeatureValueArray *v8;
  RETaggedFeatureValueArray *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[RERelevanceProviderEnvironment relevancesForRelevanceProvider:](self, "relevancesForRelevanceProvider:", v6);
    v8 = (RETaggedFeatureValueArray *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v6, "value");
    v8 = -[RETaggedFeatureValueArray initWithValues:count:]([RETaggedFeatureValueArray alloc], "initWithValues:count:", &v13, 1);
LABEL_5:
    v9 = v8;
    goto LABEL_9;
  }
  -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relevanceForProvider:context:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RETaggedFeatureValueArray initWithFeatureValues:]([RETaggedFeatureValueArray alloc], "initWithFeatureValues:", v11);
  if (objc_msgSend(v6, "relevancePriority") != 2)
  {
    -[NSLock lock](self->_relevanceValuesLock, "lock");
    -[RERelevanceProviderEnvironment _scaleRelevanceProviderValues:values:](self, "_scaleRelevanceProviderValues:values:", v6, v9);
    -[NSLock unlock](self->_relevanceValuesLock, "unlock");
  }

LABEL_9:
  return v9;
}

- (id)relevancesForRelevanceProvider:(id)a3
{
  id v4;
  RETaggedFeatureValueArray *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v4, "value");
    v5 = -[RETaggedFeatureValueArray initWithValues:count:]([RETaggedFeatureValueArray alloc], "initWithValues:count:", &v9, 1);
  }
  else
  {
    -[NSLock lock](self->_relevanceValuesLock, "lock");
    -[NSMapTable objectForKey:](self->_relevanceValues, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (RETaggedFeatureValueArray *)objc_msgSend(v7, "copy");

    -[RERelevanceProviderEnvironment _scaleRelevanceProviderValues:values:](self, "_scaleRelevanceProviderValues:values:", v4, v5);
    -[NSLock unlock](self->_relevanceValuesLock, "unlock");

  }
  return v5;
}

- (void)_scaleRelevanceProviderValues:(id)a3 values:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  float v17;
  void *v18;
  const char *v19;
  float v20;
  float v21;
  uint64_t v22;
  const void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[RERelevanceProviderEnvironment featuresForRelevanceProvider:](self, "featuresForRelevanceProvider:", v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "featureType");

  if (v9 != 2)
    goto LABEL_26;
  v10 = (void *)objc_msgSend(v6, "firstFeatureValue");
  if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 1)
    v12 = (float)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v10);
  else
    v12 = REDoubleValueForTaggedPointer(v10, v11);
  v13 = objc_msgSend(v24, "relevancePriority");
  if (v13 == 3)
  {
    -[RERelevanceProviderEnvironment _histogramForProvider:](self, "_histogramForProvider:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v14, "mean");
    if (REFeatureValueTypeForTaggedPointer((unint64_t)v18) == 1)
      v20 = (float)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v18);
    else
      v20 = REDoubleValueForTaggedPointer(v18, v19);
    REReleaseFeatureValueTaggedPointer(v18);
    v21 = v20 * 0.5;
  }
  else
  {
    if (v13 != 1)
    {
      if (!v13)
        v12 = 0.0;
      goto LABEL_19;
    }
    -[RERelevanceProviderEnvironment _histogramForProvider:](self, "_histogramForProvider:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mean");
    if (REFeatureValueTypeForTaggedPointer((unint64_t)v15) == 1)
      v17 = (float)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v15);
    else
      v17 = REDoubleValueForTaggedPointer(v15, v16);
    REReleaseFeatureValueTaggedPointer(v15);
    v21 = (v17 + 1.0) * 0.5;
  }
  v12 = __71__RERelevanceProviderEnvironment__scaleRelevanceProviderValues_values___block_invoke(v12, v21);

LABEL_19:
  if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 1)
    v22 = RECreateIntegerFeatureValueTaggedPointer((uint64_t)v12);
  else
    v22 = RECreateDoubleFeatureValueTaggedPointer();
  v23 = (const void *)v22;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "removeAllFeatureValues");
    objc_msgSend(v6, "addFeatureValue:", v23);
  }
  else
  {
    objc_msgSend(v6, "removeFeatureValueAtIndex:", 0);
    objc_msgSend(v6, "insertFeatureValue:atIndex:", v23, 0);
  }
  REReleaseFeatureValueTaggedPointer(v23);
LABEL_26:

}

float __71__RERelevanceProviderEnvironment__scaleRelevanceProviderValues_values___block_invoke(float a1, float a2)
{
  float v2;
  float v3;
  float v4;
  double v5;
  float v6;

  v2 = fmaxf(a2, 0.00000011921);
  if (v2 > 1.0)
    v2 = 1.0;
  v3 = (v2 * -2.0 + 1.0) / ((v2 + -1.0 + v2 + -1.0) * v2);
  v4 = (float)((float)(1.0 - v3) * a1) + v3 * (a1 * a1);
  v5 = fmax(v4, 0.0);
  if (v5 > 1.0)
    v5 = 1.0;
  v6 = v5;
  return (float)(v6 + a1) * 0.5;
}

- (id)featuresForRelevanceProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "effectiveFeatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "feature");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v15 = (void *)MEMORY[0x24BDBCE30];
      v16 = (void **)v19;
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Unsupported relevance provider: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v4);
      +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", &stru_24CF92178, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      v15 = (void *)MEMORY[0x24BDBCE30];
      v16 = &v18;
    }
    objc_msgSend(v15, "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_relevaneProviderWithType:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *j;
  void *v18;
  char v19;
  objc_class *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_relevanceManagers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass"), "relevanceSimulatorID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) != 0)
        {
          v20 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass");
LABEL_20:
          v15 = (void *)objc_msgSend([v20 alloc], "initWithDictionary:", v7);
          goto LABEL_21;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v10)
        continue;
      break;
    }
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_supportedFeatures;
  v15 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), "name", (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v6);

        if ((v19 & 1) != 0)
        {
          v20 = (objc_class *)RECustomRelevanceProvider;
          goto LABEL_20;
        }
      }
      v15 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_21:

  return v15;
}

- (id)encodeRelevaneProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RERelevanceProviderEnvironment _providerManagerForProvider:](self, "_providerManagerForProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
      objc_msgSend(v10, "feature");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "dictionaryEncoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v12;
      v16 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "dictionaryEncoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "relevanceSimulatorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || !objc_msgSend(v7, "length"))
  {

    goto LABEL_8;
  }
  v17 = v8;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

- (id)createRelevaneProviderWithType:(id)a3 withOptions:(id)a4
{
  void *v5;
  id v6;

  -[RERelevanceProviderEnvironment _relevaneProviderWithType:withOptions:](self, "_relevaneProviderWithType:withOptions:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[RERelevanceProviderEnvironment isSupportedRelevanceProvider:](self, "isSupportedRelevanceProvider:", v5))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (REFeatureSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (NSDictionary)allProviderValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_relevanceValuesLock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_relevanceValues, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_relevanceValues, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[NSLock unlock](self->_relevanceValuesLock, "unlock");
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

- (RERelevanceProviderEnvironmentDelegate)delegate
{
  return (RERelevanceProviderEnvironmentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_providerManagersToUpdate, 0);
  objc_storeStrong((id *)&self->_providersToUpdate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_relevanceValuesLock, 0);
  objc_storeStrong((id *)&self->_customProviders, 0);
  objc_storeStrong((id *)&self->_relevanceValues, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_relevanceProviderSet, 0);
  objc_storeStrong((id *)&self->_relevanceHistogramMap, 0);
  objc_storeStrong((id *)&self->_relevanceClassManagerMap, 0);
  objc_storeStrong((id *)&self->_relevanceManagers, 0);
}

- (void)immediateUpdateForRelevanceProviderManager:(id)a3 completion:(id)a4
{
  NSMutableSet *providerManagersToUpdate;
  id v7;

  providerManagersToUpdate = self->_providerManagersToUpdate;
  v7 = a4;
  -[NSMutableSet addObject:](providerManagersToUpdate, "addObject:", a3);
  -[RERelevanceProviderEnvironment _queue_performUpdate:](self, "_queue_performUpdate:", v7);

}

- (void)scheduleUpdateForRelevanceProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *updateCompletionBlocks;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  RELogForDomain(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling imminent update for relevance provider %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    updateCompletionBlocks = self->_updateCompletionBlocks;
    v10 = (void *)MEMORY[0x2199B2434](v7);
    -[NSMutableArray addObject:](updateCompletionBlocks, "addObject:", v10);

  }
  -[NSHashTable addObject:](self->_providersToUpdate, "addObject:", v6);
  -[REUpNextScheduler schedule](self->_scheduler, "schedule");

}

- (void)accessHistogramForFeature:(id)a3 usingBlock:(id)a4
{
  NSLock *relevanceValuesLock;
  id v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  relevanceValuesLock = self->_relevanceValuesLock;
  v7 = a3;
  -[NSLock lock](relevanceValuesLock, "lock");
  -[RERelevanceProviderEnvironment _histogramForFeature:](self, "_histogramForFeature:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v8)
    v9[2](v9, v8);
  -[NSLock unlock](self->_relevanceValuesLock, "unlock");

}

- (id)currentRelevanceProvidersState
{
  return self->_relevanceValues;
}

@end
