@implementation PXPlacesMapPipelineExecutionContext

- (PXPlacesMapPipelineExecutionContext)initWithViewPort:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PXPlacesMapPipelineExecutionContext *v9;
  PXPlacesMapPipelineExecutionContext *v10;
  void *v11;
  id completionHandler;
  uint64_t v13;
  NSMutableSet *dataSources;
  uint64_t v15;
  NSMapTable *changesForDataSources;

  v7 = a3;
  v8 = a4;
  v9 = -[PXPlacesMapPipelineExecutionContext init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewPort, a3);
    v11 = _Block_copy(v8);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = v11;

    v13 = objc_opt_new();
    dataSources = v10->_dataSources;
    v10->_dataSources = (NSMutableSet *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    changesForDataSources = v10->_changesForDataSources;
    v10->_changesForDataSources = (NSMapTable *)v15;

  }
  return v10;
}

- (NSArray)dataSources
{
  return (NSArray *)-[NSMutableSet allObjects](self->_dataSources, "allObjects");
}

- (void)start
{
  NSDate *v3;
  NSDate *start;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  self->_start = v3;

}

- (void)stop
{
  void *v3;
  double v4;

  if (self->_duration == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_start);
    self->_duration = v4;

  }
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)addDataSources:(id)a3 changesForDataSources:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  v6 = a4;
  -[NSMutableSet addObjectsFromArray:](self->_dataSources, "addObjectsFromArray:", a3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_changesForDataSources, "objectForKey:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = (void *)objc_opt_new();
          -[NSMapTable setObject:forKey:](self->_changesForDataSources, "setObject:forKey:", v13, v12);
        }
        objc_msgSend(v7, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)startTimerForDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (startTimerForDataSource__onceToken != -1)
    dispatch_once(&startTimerForDataSource__onceToken, &__block_literal_global_75685);
  v5 = startTimerForDataSource__startDataSourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PXPlacesMapPipelineExecutionContext_startTimerForDataSource___block_invoke_2;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)stopTimerForDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (stopTimerForDataSource__onceToken != -1)
    dispatch_once(&stopTimerForDataSource__onceToken, &__block_literal_global_11_75684);
  v5 = stopTimerForDataSource__stopDataSourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXPlacesMapPipelineExecutionContext_stopTimerForDataSource___block_invoke_2;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)durationForDataSources
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_timerStartDataSource, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_timerStartDataSource, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKeyedSubscript:](self->_timerStopDataSource, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_timerStartDataSource, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        objc_msgSend(v9, "numberWithDouble:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)startTimerForPipeline:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (startTimerForPipeline__onceToken != -1)
    dispatch_once(&startTimerForPipeline__onceToken, &__block_literal_global_14_75683);
  v5 = startTimerForPipeline__startPipelineQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXPlacesMapPipelineExecutionContext_startTimerForPipeline___block_invoke_2;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)stopTimerForPipeline:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (stopTimerForPipeline__onceToken != -1)
    dispatch_once(&stopTimerForPipeline__onceToken, &__block_literal_global_15);
  v5 = stopTimerForPipeline__stopPipelineQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PXPlacesMapPipelineExecutionContext_stopTimerForPipeline___block_invoke_2;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)durationForPipelines
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_timerStartDataSource, "count"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableDictionary allKeys](self->_timerStartPipeline, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v32;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(obj);
        v22 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v3);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_timerStartPipeline, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "allKeys");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v6;
        v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v25)
        {
          v24 = *(_QWORD *)v28;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v28 != v24)
                objc_enumerationMutation(v23);
              v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7);
              objc_msgSend(v26, "objectForKeyedSubscript:", v4);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v9)
              {
                v10 = (void *)MEMORY[0x1E0C99E08];
                -[NSMutableDictionary objectForKeyedSubscript:](self->_timerStartPipeline, "objectForKeyedSubscript:", v4);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
                v9 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v26, "setObject:forKeyedSubscript:", v9, v4);
              }
              v12 = (void *)MEMORY[0x1E0CB37E8];
              -[NSMutableDictionary objectForKeyedSubscript:](self->_timerStopPipeline, "objectForKeyedSubscript:", v4);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v8);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](self->_timerStartPipeline, "objectForKeyedSubscript:", v4);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v8);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "timeIntervalSinceDate:", v16);
              objc_msgSend(v12, "numberWithDouble:");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v8);

              ++v7;
            }
            while (v25 != v7);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v25);
        }

        v3 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v21);
  }

  return v26;
}

- (double)duration
{
  return self->_duration;
}

- (NSMapTable)changesForDataSources
{
  return (NSMapTable *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)updatePlanResults
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUpdatePlanResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PXPlacesMapViewPort)viewPort
{
  return (PXPlacesMapViewPort *)objc_getProperty(self, a2, 120, 1);
}

- (void)setViewPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewPort, 0);
  objc_storeStrong((id *)&self->_updatePlanResults, 0);
  objc_storeStrong((id *)&self->_changesForDataSources, 0);
  objc_storeStrong((id *)&self->_callstack, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timerStopPlanResultsExecution, 0);
  objc_storeStrong((id *)&self->_timerStartPlanResultsExecution, 0);
  objc_storeStrong((id *)&self->_timerStopPipeline, 0);
  objc_storeStrong((id *)&self->_timerStartPipeline, 0);
  objc_storeStrong((id *)&self->_timerStopDataSource, 0);
  objc_storeStrong((id *)&self->_timerStartDataSource, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

void __60__PXPlacesMapPipelineExecutionContext_stopTimerForPipeline___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%p"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%p"), objc_opt_class(), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

void __60__PXPlacesMapPipelineExecutionContext_stopTimerForPipeline___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)stopTimerForPipeline__stopPipelineQueue;
  stopTimerForPipeline__stopPipelineQueue = (uint64_t)v0;

}

void __61__PXPlacesMapPipelineExecutionContext_startTimerForPipeline___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%p"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%p"), objc_opt_class(), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

void __61__PXPlacesMapPipelineExecutionContext_startTimerForPipeline___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)startTimerForPipeline__startPipelineQueue;
  startTimerForPipeline__startPipelineQueue = (uint64_t)v0;

}

void __62__PXPlacesMapPipelineExecutionContext_stopTimerForDataSource___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%p"), objc_opt_class(), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v3);

}

void __62__PXPlacesMapPipelineExecutionContext_stopTimerForDataSource___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)stopTimerForDataSource__stopDataSourceQueue;
  stopTimerForDataSource__stopDataSourceQueue = (uint64_t)v0;

}

void __63__PXPlacesMapPipelineExecutionContext_startTimerForDataSource___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%p"), objc_opt_class(), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v3);

}

void __63__PXPlacesMapPipelineExecutionContext_startTimerForDataSource___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)startTimerForDataSource__startDataSourceQueue;
  startTimerForDataSource__startDataSourceQueue = (uint64_t)v0;

}

@end
