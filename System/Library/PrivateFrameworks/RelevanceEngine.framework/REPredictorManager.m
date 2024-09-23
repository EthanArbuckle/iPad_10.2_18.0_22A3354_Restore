@implementation REPredictorManager

- (void)enumeratePredictors:(id)a3
{
  void (**v4)(id, _QWORD);
  NSArray *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_predictors;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)addObserver:(id)a3
{
  -[REObserverStore addObserver:](self->_observer, "addObserver:", a3);
}

- (REPredictorManager)initWithPredictors:(id)a3 featureSet:(id)a4 relevanceEngine:(id)a5
{
  id v8;
  id v9;
  id v10;
  REPredictorManager *v11;
  REPredictorManager *v12;
  void *v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  NSArray *predictors;
  uint64_t v25;
  NSDictionary *predictorsMap;
  REObserverStore *v27;
  REObserverStore *observer;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id WeakRetained;
  void *v36;
  REPredictorManager *v38;
  id v39;
  id obj;
  id *location;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v57.receiver = self;
  v57.super_class = (Class)REPredictorManager;
  v10 = a5;
  v11 = -[REPredictorManager init](&v57, sel_init);
  v12 = v11;
  if (v11)
  {
    v38 = v11;
    location = (id *)&v11->_engine;
    v44 = v10;
    objc_storeWeak((id *)&v11->_engine, v10);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v39 = v8;
    obj = v8;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v54 != v42)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend((id)objc_opt_class(), "supportedFeatures");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v50 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
                if (objc_msgSend(v9, "containsFeature:", v22))
                {
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v22);
                  objc_msgSend(v13, "addObject:", v16);
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
            }
            while (v19);
          }

        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v43);
    }

    objc_msgSend(v13, "allObjects");
    v23 = objc_claimAutoreleasedReturnValue();
    v12 = v38;
    predictors = v38->_predictors;
    v38->_predictors = (NSArray *)v23;

    v25 = objc_msgSend(v14, "copy");
    predictorsMap = v38->_predictorsMap;
    v38->_predictorsMap = (NSDictionary *)v25;

    v27 = objc_alloc_init(REObserverStore);
    observer = v38->_observer;
    v38->_observer = v27;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v29 = v38->_predictors;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    v10 = v44;
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
          if (v10)
          {
            WeakRetained = objc_loadWeakRetained(location);
            objc_msgSend(v34, "addRelevanceEngine:", WeakRetained);

            v10 = v44;
          }
          objc_msgSend(v34, "addObserver:", v38);
          objc_msgSend(v10, "logger");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addLoggable:", v34);

          v10 = v44;
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v31);
    }

    v8 = v39;
  }

  return v12;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  objc_super v12;
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
  v3 = self->_predictors;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "removeObserver:", self);
        WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
        objc_msgSend(v8, "removeRelevanceEngine:", WeakRetained);

        v10 = objc_loadWeakRetained((id *)&self->_engine);
        objc_msgSend(v10, "logger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeLoggable:", v8);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)REPredictorManager;
  -[REPredictorManager dealloc](&v12, sel_dealloc);
}

- (void)enumerateValuesForElement:(id)a3 trainingContext:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  NSDictionary *predictorsMap;
  id v11;
  _QWORD v12[4];
  id v13;
  REPredictorManager *v14;
  id v15;
  id v16;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    predictorsMap = self->_predictorsMap;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke;
    v12[3] = &unk_24CF8CFA0;
    v13 = v11;
    v14 = self;
    v15 = v8;
    v16 = v9;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predictorsMap, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
}

void __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a2;
  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  v30 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke_5;
  v18[3] = &unk_24CF8CF78;
  v24 = &v25;
  v7 = v6;
  v19 = v7;
  v8 = v5;
  v20 = v8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v21 = v9;
  v22 = v10;
  v23 = v11;
  objc_msgSend(v7, "onQueueSync:", v18);
  v17 = v26[5];
  if (v17)
    (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56)
                                                                                             + 16))(*(_QWORD *)(a1 + 56), v8, v17, v12, v13, v14, v15, v16);

  _Block_object_dispose(&v25, 8);
}

void __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  WeakRetained = objc_loadWeakRetained((id *)(a1[7] + 32));
  objc_msgSend(v2, "featureValueForFeature:element:engine:trainingContext:", v3, v4, WeakRetained, a1[8]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[9] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)resume
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
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
  v2 = self->_predictors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_initWeak(&location, v7);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __28__REPredictorManager_resume__block_invoke;
        v8[3] = &unk_24CF8AAC8;
        objc_copyWeak(&v9, &location);
        objc_msgSend(v7, "onQueue:", v8);
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __28__REPredictorManager_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "beginUpdates");

}

- (void)pause
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
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
  v2 = self->_predictors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_initWeak(&location, v7);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __27__REPredictorManager_pause__block_invoke;
        v8[3] = &unk_24CF8AAC8;
        objc_copyWeak(&v9, &location);
        objc_msgSend(v7, "onQueue:", v8);
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __27__REPredictorManager_pause__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endUpdates");

}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_observer, "removeObserver:", a3);
}

- (void)predictorDidUpdate:(id)a3
{
  id v4;
  REObserverStore *observer;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observer = self->_observer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__REPredictorManager_predictorDidUpdate___block_invoke;
  v7[3] = &unk_24CF8CFC8;
  v8 = v4;
  v6 = v4;
  -[REObserverStore enumerateObserversWithBlock:](observer, "enumerateObserversWithBlock:", v7);

}

void __41__REPredictorManager_predictorDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "predictorDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)predictor:(id)a3 didBeginActivity:(id)a4
{
  id v6;
  id v7;
  REObserverStore *observer;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  observer = self->_observer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__REPredictorManager_predictor_didBeginActivity___block_invoke;
  v11[3] = &unk_24CF8CFF0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[REObserverStore enumerateObserversWithBlock:](observer, "enumerateObserversWithBlock:", v11);

}

void __49__REPredictorManager_predictor_didBeginActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "predictor:didBeginActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)predictor:(id)a3 didFinishActivity:(id)a4
{
  id v6;
  id v7;
  REObserverStore *observer;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  observer = self->_observer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__REPredictorManager_predictor_didFinishActivity___block_invoke;
  v11[3] = &unk_24CF8CFF0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[REObserverStore enumerateObserversWithBlock:](observer, "enumerateObserversWithBlock:", v11);

}

void __50__REPredictorManager_predictor_didFinishActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "predictor:didFinishActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_predictorsMap, 0);
  objc_storeStrong((id *)&self->_predictors, 0);
}

@end
