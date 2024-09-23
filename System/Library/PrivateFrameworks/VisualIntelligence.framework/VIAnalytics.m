@implementation VIAnalytics

- (VIAnalytics)initWithFeedbackSubmitter:(id)a3
{
  id v5;
  VIAnalytics *v6;
  VIAnalytics *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  VIAEventCache *v10;
  VIAEventCache *eventCache;
  VIAEntryPointLogger *v12;
  uint64_t v13;
  NSArray *loggers;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSDictionary *feedbackNameToLoggerMap;
  VIACacheHitLogger *v30;
  VIAEntryPointLogger *v31;
  VIAnalytics *v32;
  id v33;
  NSArray *obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VIAnalytics;
  v6 = -[VIAnalytics init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackSubmitter, a3);
    v8 = dispatch_queue_create("com.apple.argos.analytics", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = -[VIAEventCache initWithQueue:]([VIAEventCache alloc], "initWithQueue:", v7->_serialQueue);
    eventCache = v7->_eventCache;
    v7->_eventCache = v10;

    v12 = -[VIAEntryPointLogger initWithQueue:feedbackSubmitter:eventCache:]([VIAEntryPointLogger alloc], "initWithQueue:feedbackSubmitter:eventCache:", v7->_serialQueue, v5, v7->_eventCache);
    v33 = v5;
    v30 = -[VIACacheHitLogger initWithQueue:feedbackSubmitter:]([VIACacheHitLogger alloc], "initWithQueue:feedbackSubmitter:", v7->_serialQueue, v5);
    v31 = v12;
    v48[0] = v12;
    v48[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    loggers = v7->_loggers;
    v7->_loggers = (NSArray *)v13;

    v32 = v7;
    v15 = v7->_loggers;
    v16 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v15;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v45;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(obj);
          v37 = v17;
          v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17);
          objc_msgSend((id)objc_opt_class(), "feedbackNamesToLog");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v41 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v16, "objectForKeyedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25)
                {
                  if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
                  {
                    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D467C000, v26, OS_LOG_TYPE_ERROR, "Cannot have two loggers register the same feedback", buf, 2u);
                    }

                  }
                }
                else
                {
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v24);
                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            }
            while (v21);
          }

          v17 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v36);
    }

    v27 = objc_msgSend(v16, "copy");
    v7 = v32;
    feedbackNameToLoggerMap = v32->_feedbackNameToLoggerMap;
    v32->_feedbackNameToLoggerMap = (NSDictionary *)v27;

    v5 = v33;
  }

  return v7;
}

+ (void)logEvent:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "feedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _VISharedAnalytics();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_logEvent:", v5);

  }
}

- (void)_logEvent:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__VIAnalytics__logEvent___block_invoke;
  block[3] = &unk_1E9807748;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__VIAnalytics__logEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performLogEvent:", *(_QWORD *)(a1 + 32));

}

- (void)_performLogEvent:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  VIAFeedbackSubmitter *feedbackSubmitter;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_loggers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9++), "didObserveEvent:", v4, (_QWORD)v18);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "feedback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_feedbackNameToLoggerMap, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13 && (v14 = (void *)v13, v15 = objc_msgSend(v4, "shouldReportDirectly"), v14, (v15 & 1) == 0))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_feedbackNameToLoggerMap, "objectForKeyedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logEvent:", v4);
  }
  else
  {
    feedbackSubmitter = self->_feedbackSubmitter;
    objc_msgSend(v4, "feedback", (_QWORD)v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VIAFeedbackSubmitter reportFeedback:queryId:](feedbackSubmitter, "reportFeedback:queryId:", v17, objc_msgSend(v4, "queryID"));
  }

}

- (void)setTestingDelegate:(id)a3
{
  VIAnalyticsTestingDelegate **p_testingDelegate;
  id v5;

  p_testingDelegate = &self->_testingDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_testingDelegate, v5);
  -[VIAEventCache setTestingDelegate:](self->_eventCache, "setTestingDelegate:", v5);
  -[VIAFeedbackSubmitter setTestingDelegate:](self->_feedbackSubmitter, "setTestingDelegate:", v5);

}

- (VIAnalyticsTestingDelegate)testingDelegate
{
  return (VIAnalyticsTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (VIAFeedbackSubmitter)feedbackSubmitter
{
  return self->_feedbackSubmitter;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_feedbackSubmitter, 0);
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_feedbackNameToLoggerMap, 0);
  objc_storeStrong((id *)&self->_loggers, 0);
}

@end
