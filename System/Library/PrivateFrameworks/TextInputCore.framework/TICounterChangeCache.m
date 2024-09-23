@implementation TICounterChangeCache

- (void)addStatisticChanges:(id)a3 withContext:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D20];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithArray:copyItems:", v7, 1);

  if (objc_msgSend(v8, "count"))
  {
    v9 = v5;
    v10 = v8;
    TIDispatchAsync();

  }
}

- (void)persistForDate:(id)a3
{
  id v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableSet *referencedCounters;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "timeIntervalSince1970");
  if (v4)
  {
    v6 = v4;
    if (v5 - self->_timeOfLastPersist < *MEMORY[0x1E0DBEB20] && !self->_userModelRateLimitingDisabled)
    {
      v38 = v4;
      IXADefaultLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Counter change cache persistence not required due to rate limiting."), "-[TICounterChangeCache persistForDate:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v8;
        _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      goto LABEL_40;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v6;
  objc_msgSend(v6, "timeIntervalSince1970");
  self->_timeOfLastPersist = v9;
  objc_msgSend(MEMORY[0x1E0DBDDC0], "sharedUserModelDataStore");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isValid](v7, "isValid"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[NSMutableDictionary allKeys](self->_cache, "allKeys");
    obj = objc_claimAutoreleasedReturnValue();
    v35 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v50;
      v39 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v50 != v34)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
          v48 = 0;
          v40 = v11;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v48;
          v36 = v12;
          v37 = v10;
          if (v12)
          {
            v13 = v12;
            IXADefaultLogFacility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error archiving context object: %@"), "-[TICounterChangeCache persistForDate:]", v13);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v56 = v31;
              _os_log_error_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
            v41 = 0;
          }
          -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v40);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          objc_msgSend(v15, "allKeys");
          v43 = (id)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v45;
            do
            {
              v19 = 0;
              v42 = v17;
              do
              {
                if (*(_QWORD *)v45 != v18)
                  objc_enumerationMutation(v43);
                v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v19);
                objc_msgSend(v15, "objectForKeyedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "intValue"))
                {
                  referencedCounters = self->_referencedCounters;
                  if (!referencedCounters)
                  {
                    -[TICounterChangeCache loadReferencedCounters](self, "loadReferencedCounters");
                    referencedCounters = self->_referencedCounters;
                  }
                  if (-[NSMutableSet containsObject:](referencedCounters, "containsObject:", v20))
                  {
                    v23 = v15;
                    objc_msgSend((id)*MEMORY[0x1E0DBEB40], "stringByAppendingString:", v20);
                    v24 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "inputLanguageAndRegion");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:](v39, "addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:", v21, v25, v26, v41, v24, v27, v38);

                    IXADefaultLogFacility();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Counter change '%@' was persisted."), "-[TICounterChangeCache persistForDate:]", v20);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v56 = v29;
                      _os_log_debug_impl(&dword_1DA6F2000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

                    }
                    v15 = v23;
                    v17 = v42;
                  }
                  else
                  {
                    IXADefaultLogFacility();
                    v24 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Counter change '%@' was ignored because it's not referenced by any event."), "-[TICounterChangeCache persistForDate:]", v20);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v56 = v30;
                      _os_log_debug_impl(&dword_1DA6F2000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

                    }
                  }

                }
                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            }
            while (v17);
          }

          v10 = v37 + 1;
          v7 = v39;
        }
        while (v37 + 1 != v35);
        v35 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v35);
    }
  }
  else
  {
    IXADefaultLogFacility();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Can't persist counter changes because the database is invalid."), "-[TICounterChangeCache persistForDate:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v32;
      _os_log_error_impl(&dword_1DA6F2000, obj, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }

  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
LABEL_40:

}

uint64_t __50__TICounterChangeCache_keyboardDidSuspendForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "persistForDate:", *(_QWORD *)(a1 + 40));
}

- (void)keyboardDidSuspendForDate:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (TICounterChangeCache)initWithEventDescriptorRegistry:(id)a3 metricDescriptorRegistry:(id)a4
{
  id v7;
  id v8;
  TICounterChangeCache *v9;
  TICounterChangeCache *v10;
  uint64_t v11;
  NSMutableDictionary *cache;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  NSMutableSet *referencedCounters;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TICounterChangeCache;
  v9 = -[TICounterChangeCache init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventDescriptorRegistry, a3);
    objc_storeStrong((id *)&v10->_metricDescriptorRegistry, a4);
    v11 = objc_opt_new();
    cache = v10->_cache;
    v10->_cache = (NSMutableDictionary *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.textInput.CounterChangeCache", v14);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v15;

    referencedCounters = v10->_referencedCounters;
    v10->_referencedCounters = 0;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
    v10->_userModelRateLimitingDisabled = objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x1E0DBEB48]);

  }
  return v10;
}

- (void)loadReferencedCounters
{
  NSMutableSet *v3;
  NSMutableSet *referencedCounters;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableSet *)objc_opt_new();
  referencedCounters = self->_referencedCounters;
  self->_referencedCounters = v3;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TIEventDescriptorRegistry allEventDescriptors](self->_eventDescriptorRegistry, "allEventDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v10, "fieldDescriptors", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "metricName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[TICounterChangeCache addCounterReferencesForMetric:](self, "addCounterReferencesForMetric:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

}

- (void)addCounterReferencesForMetric:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIMetricDescriptorRegistry metricDescriptorWithName:](self->_metricDescriptorRegistry, "metricDescriptorWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "calculationExpression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        objc_msgSend(v6, "calculationDependencies", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              -[TICounterChangeCache addCounterReferencesForMetric:](self, "addCounterReferencesForMetric:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v10);
        }

      }
      else
      {
        -[NSMutableSet addObject:](self->_referencedCounters, "addObject:", v4);
      }

    }
  }

}

- (void)close
{
  TIDispatchSync();
}

- (void)queueCompletionHandler:(id)a3
{
  TIDispatchAsync();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedCounters, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);
  objc_storeStrong((id *)&self->_eventDescriptorRegistry, 0);
}

void __56__TICounterChangeCache_addStatisticChanges_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "name", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "value");
        objc_msgSend(v2, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          v10 = objc_msgSend(v11, "intValue") + v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setValue:forKey:", v13, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

uint64_t __29__TICounterChangeCache_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "persistForDate:", 0);
}

@end
