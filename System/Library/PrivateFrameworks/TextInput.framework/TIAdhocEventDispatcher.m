@implementation TIAdhocEventDispatcher

- (id)loadEventSpecMapFromConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v38;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(obj);
        v28 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v27 = v7;
        objc_msgSend(v4, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(v9);
              -[TIAdhocEventDispatcher replacePeriodsInString:](self, "replacePeriodsInString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              +[TIAnalyticsFieldSpec integerFieldSpecWithName:](TIAnalyticsFieldSpec, "integerFieldSpecWithName:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v15);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v11);
        }

        +[TIAnalyticsEventSpec eventSpecWithName:inputModeRequired:fieldSpecs:](TIAnalyticsEventSpec, "eventSpecWithName:inputModeRequired:fieldSpecs:", v27, 0, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v17 = v8;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v16, v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v19);
        }

        v6 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v26);
  }

  return v5;
}

- (id)replacePeriodsInString:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
}

void __40__TIAdhocEventDispatcher_sharedInstance__block_invoke()
{
  TIAdhocEventDispatcher *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [TIAdhocEventDispatcher alloc];
  adhocEventConfig();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[TIAdhocEventDispatcher initFromConfig:](v0, "initFromConfig:", v3);
  v2 = (void *)sharedInstance_instance_11278;
  sharedInstance_instance_11278 = v1;

}

- (id)initFromConfig:(id)a3
{
  id v4;
  TIAdhocEventDispatcher *v5;
  TIAdhocEventDispatcher *v6;
  uint64_t v7;
  NSMutableDictionary *eventSpecMap;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIAdhocEventDispatcher;
  v5 = -[TIAdhocEventDispatcher init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TIAdhocEventDispatcher loadEventSpecMapFromConfig:](v5, "loadEventSpecMapFromConfig:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    eventSpecMap = v6->_eventSpecMap;
    v6->_eventSpecMap = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (NSMutableDictionary)eventSpecMap
{
  return self->_eventSpecMap;
}

- (void)dispatchEventForStatisticWithName:(id)a3 andValue:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[TIAdhocEventDispatcher replacePeriodsInString:](self, "replacePeriodsInString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAdhocEventDispatcher eventSpecMap](self, "eventSpecMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  IXADefaultLogFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%s Dispatching adhoc event: %@ %@"), "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]", v21, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v22;
      _os_log_debug_impl(&dword_18C56E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v27 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIAnalyticsService sharedInstance](TIAnalyticsService, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerEventSpec:", v12);

    +[TIAnalyticsService sharedInstance](TIAnalyticsService, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __91__TIAdhocEventDispatcher_dispatchEventForStatisticWithName_andValue_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E243B740;
    v25 = v12;
    v26 = v9;
    objc_msgSend(v18, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:withCompletionHandler:", v19, v16, 0, 1, v24);

  }
  else
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Adhoc event not registered for statistic: %@"), "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v23;
      _os_log_debug_impl(&dword_18C56E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)dispatchEventForStatisticWithName:(id)a3 andValue:(int64_t)a4
{
  -[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:](self, "dispatchEventForStatisticWithName:andValue:withCompletionHandler:", a3, a4, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11276 != -1)
    dispatch_once(&sharedInstance_onceToken_11276, &__block_literal_global_11277);
  return (id)sharedInstance_instance_11278;
}

- (void)setEventSpecMap:(id)a3
{
  objc_storeStrong((id *)&self->_eventSpecMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSpecMap, 0);
}

void __91__TIAdhocEventDispatcher_dispatchEventForStatisticWithName_andValue_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (!v6)
      goto LABEL_5;
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%s Adhoc event dispatch failed: %@"), "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]_block_invoke", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v9;
  }
  else
  {
    if (!v6)
      goto LABEL_5;
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Adhoc event dispatched: %@"), "-[TIAdhocEventDispatcher dispatchEventForStatisticWithName:andValue:withCompletionHandler:]_block_invoke", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v9;
  }
  _os_log_debug_impl(&dword_18C56E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

LABEL_5:
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, 1, v3);

}

@end
