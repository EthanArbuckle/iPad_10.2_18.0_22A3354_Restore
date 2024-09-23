@implementation TFDataAggregator

- (TFDataAggregator)initWithSessionDataContainer:(id)a3
{
  id v5;
  TFDataAggregator *v6;
  TFDataAggregator *v7;
  uint64_t v8;
  OS_dispatch_queue *aggregationQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFDataAggregator;
  v6 = -[TFDataAggregator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionDataContainer, a3);
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    aggregationQueue = v7->_aggregationQueue;
    v7->_aggregationQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)runTasks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  TFFeedbackDataContainer *v9;
  void *v10;
  id v11;
  id v12;
  TFFeedbackDataContainer *v13;
  _QWORD v14[5];
  TFFeedbackDataContainer *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AMSGenerateLogCorrelationKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generatedLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = objc_opt_class();
    v20 = 2114;
    v21 = v5;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2174E1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] runTasks: tasks=%@", buf, 0x20u);
  }

  -[TFDataAggregator _validateProvidedIdentifiersForTasks:](self, "_validateProvidedIdentifiersForTasks:", v4);
  -[TFDataAggregator sessionDataContainer](self, "sessionDataContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFDataAggregator _prepareDestinationDataContainer:forTasks:](self, "_prepareDestinationDataContainer:forTasks:", v8, v4);

  v9 = -[TFFeedbackDataContainer initWithName:]([TFFeedbackDataContainer alloc], "initWithName:", CFSTR("tasks"));
  -[TFDataAggregator _loadAndExtractDataForTasks:intoDataContainer:](self, "_loadAndExtractDataForTasks:intoDataContainer:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __29__TFDataAggregator_runTasks___block_invoke;
  v14[3] = &unk_24D7946F0;
  v14[4] = self;
  v15 = v9;
  v16 = v4;
  v17 = v5;
  v11 = v5;
  v12 = v4;
  v13 = v9;
  objc_msgSend(v10, "addFinishBlock:", v14);

}

void __29__TFDataAggregator_runTasks___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sessionDataContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_finishUpdatingDataContainer:byMergingDataContainer:forTasks:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generatedLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v8 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionDataContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] runTasks completed: tasks=%@, taskDataContainer=%@ sessionDataContainer=%@", (uint8_t *)&v12, 0x34u);

  }
}

- (void)_prepareDestinationDataContainer:(id)a3 forTasks:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__TFDataAggregator__prepareDestinationDataContainer_forTasks___block_invoke;
  v7[3] = &unk_24D794648;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "performBatchUpdates:", v7);

}

void __62__TFDataAggregator__prepareDestinationDataContainer_forTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v9, "providedEntryIdentifiers", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "setEntryLoadingForIdentifier:toValue:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 1);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

}

- (void)_finishUpdatingDataContainer:(id)a3 byMergingDataContainer:(id)a4 forTasks:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke;
  v16[3] = &unk_24D794718;
  v11 = v9;
  v17 = v11;
  v18 = v8;
  v12 = v8;
  objc_msgSend(a3, "performBatchUpdates:", v16);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke_2;
  v14[3] = &unk_24D794740;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v9, "providedEntryIdentifiers", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "setEntryLoadingForIdentifier:toValue:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 0);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "overwriteWithContentsOfDataContainer:", *(_QWORD *)(a1 + 40));
}

void __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataAggregator:didCompleteTasks:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_loadAndExtractDataForTasks:(id)a3 intoDataContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id obj;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x24BE08340]);
        objc_msgSend(v8, "addObject:", v14);
        -[TFDataAggregator aggregationQueue](self, "aggregationQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __66__TFDataAggregator__loadAndExtractDataForTasks_intoDataContainer___block_invoke;
        v20[3] = &unk_24D794768;
        v20[4] = v13;
        v21 = v7;
        v22 = v14;
        v16 = v14;
        objc_msgSend(v13, "loadDataOnQueue:withCompletionHandler:", v15, v20);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithAll:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __66__TFDataAggregator__loadAndExtractDataForTasks_intoDataContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generatedLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      objc_msgSend(v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v9;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2174E1000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%@:%@] Data aggregation failed with error: %@", (uint8_t *)&v14, 0x2Au);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "extractDataPropertiesFromData:intoDataContainer:", v5, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &unk_24D7A05E0);

}

- (TFFeedbackDataContainer)sessionDataContainer
{
  return self->_sessionDataContainer;
}

- (TFDataAggregatorDelegate)delegate
{
  return (TFDataAggregatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)aggregationQueue
{
  return self->_aggregationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionDataContainer, 0);
}

@end
