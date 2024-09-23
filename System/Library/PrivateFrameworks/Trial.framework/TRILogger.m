@implementation TRILogger

- (TRILogger)initWithClient:(id)a3 projectId:(int)a4 logHandlers:(id)a5
{
  id v8;
  id v9;
  TRILogger *v10;
  TRILogger *v11;
  objc_class *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *loggingQueue;
  uint64_t v19;
  NSArray *logHandlers;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)TRILogger;
  v10 = -[TRILogger init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_client, v8);
    v11->_projectId = a4;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v14, v16);
    loggingQueue = v11->_loggingQueue;
    v11->_loggingQueue = (OS_dispatch_queue *)v17;

    v19 = objc_msgSend(v9, "copy");
    logHandlers = v11->_logHandlers;
    v11->_logHandlers = (NSArray *)v19;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandlers, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

- (TRILogger)init
{
  return -[TRILogger initWithProjectId:](self, "initWithProjectId:", 0);
}

- (TRILogger)initWithProjectId:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  TRILogger *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[TRILogger initWithProjectId:]";
    _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "called deprecated method %s", buf, 0xCu);
  }

  +[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TRILogger initWithClient:projectId:logHandlers:](self, "initWithClient:projectId:logHandlers:", v6, v3, v8);

  if (v9)
    v9->_projectId = v3;

  return v9;
}

- (TRILogger)initWithProjectId:(int)a3 logHandlers:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  TRILogger *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  +[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TRILogger initWithClient:projectId:logHandlers:](self, "initWithClient:projectId:logHandlers:", v7, v4, v6);

  return v8;
}

- (id)messageWithOneofField:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v7, "oneofs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v12, "fields");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "valueForKey:", v17);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_dispatchLogEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (qword_1ECED7E38 != -1)
      dispatch_once(&qword_1ECED7E38, &__block_literal_global_12);
    v7 = (void *)_MergedGlobals_11;
  }
  v8 = v7;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_logHandlers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "logEvent:subgroupName:queue:", v4, v8, self->_loggingQueue, (_QWORD)v14);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

void __31__TRILogger__dispatchLogEvent___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  +[TRIEntitlement stringForCurrentProcessEntitlement:](TRIEntitlement, "stringForCurrentProcessEntitlement:", CFSTR("application-identifier"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v1;

  objc_autoreleasePoolPop(v0);
}

- (unint64_t)_incrementedLogEventCount
{
  unint64_t v2;

  if (qword_1ECED7E40 != -1)
    dispatch_once(&qword_1ECED7E40, &__block_literal_global_6);
  objc_msgSend((id)qword_1ECED7E48, "lock");
  v2 = ++qword_1ECED7E50;
  objc_msgSend((id)qword_1ECED7E48, "unlock");
  return v2;
}

void __38__TRILogger__incrementedLogEventCount__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECED7E48;
  qword_1ECED7E48 = v0;

  qword_1ECED7E50 = 0;
}

- (void)logEvent:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[TRILogger _incrementedLogEventCount](self, "_incrementedLogEventCount");
  objc_msgSend(v6, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProcessEventIndex:", v4);

  -[TRILogger _dispatchLogEvent:](self, "_dispatchLogEvent:", v6);
}

- (void)logWithTrackingId:(id)a3 logLevel:(int64_t)a4 message:(id)a5 args:(char *)a6
{
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TRILogCategory_ClientFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[TRILogger logWithTrackingId:logLevel:message:args:]";
    _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v7, 0xCu);
  }

}

- (void)logWithTrackingId:(id)a3 message:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[TRILogger logWithTrackingId:message:]";
    _os_log_error_impl(&dword_19B89C000, v4, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)logWithTrackingId:(id)a3 logLevel:(int64_t)a4 message:(id)a5
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[TRILogger logWithTrackingId:logLevel:message:]";
    _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 trialSystemTelemetry:(id)a6
{
  void *v10;
  uint64_t projectId;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0DC0EE0];
  projectId = self->_projectId;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v10, "eventWithTrackingId:projectId:", a3, projectId);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "denormalizedEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMetrics:", v16);

  v18 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v15, "denormalizedEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserDimensions:", v18);

  objc_msgSend(MEMORY[0x1E0DC0F80], "systemDimensions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "denormalizedEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSystemDimensions:", v20);

  v22 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v15, "denormalizedEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTrialSystemTelemetry:", v22);

  TRILogCategory_ClientFramework();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = v25;
    _os_log_impl(&dword_19B89C000, v24, OS_LOG_TYPE_INFO, "Logging log event: %@", (uint8_t *)&v26, 0xCu);

  }
  -[TRILogger logEvent:](self, "logEvent:", v15);

}

- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 systemDimensions:(id)a6 trialSystemTelemetry:(id)a7
{
  void *v12;
  uint64_t projectId;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0DC0EE0];
  projectId = self->_projectId;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(v12, "eventWithTrackingId:projectId:", a3, projectId);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "denormalizedEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMetrics:", v19);

  v21 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v18, "denormalizedEvent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUserDimensions:", v21);

  objc_msgSend(v18, "denormalizedEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSystemDimensions:", v15);

  v24 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v18, "denormalizedEvent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTrialSystemTelemetry:", v24);

  TRILogCategory_ClientFramework();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v18, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v27;
    _os_log_impl(&dword_19B89C000, v26, OS_LOG_TYPE_INFO, "Logging log event: %@", (uint8_t *)&v28, 0xCu);

  }
  -[TRILogger logEvent:](self, "logEvent:", v18);

}

- (void)logWithProjectNameAndTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5 trialSystemTelemetry:(id)a6
{
  void *v10;
  uint64_t projectId;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0DC0EE0];
  projectId = self->_projectId;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v10, "eventWithTrackingId:projectId:", a3, projectId);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "denormalizedEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMetrics:", v16);

  v18 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v15, "denormalizedEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserDimensions:", v18);

  objc_msgSend(MEMORY[0x1E0DC0F80], "systemDimensions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "denormalizedEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSystemDimensions:", v20);

  v22 = objc_msgSend(v12, "copy");
  objc_msgSend(v15, "denormalizedEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTrialSystemTelemetry:", v22);

  objc_msgSend(v15, "denormalizedEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = objc_msgSend(v24, "hasTrialSystemTelemetry");

  if ((v22 & 1) == 0)
  {
    v25 = (void *)objc_opt_new();
    objc_msgSend(v15, "denormalizedEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTrialSystemTelemetry:", v25);

  }
  objc_msgSend(MEMORY[0x1E0DC0F60], "projectNameFromId:", self->_projectId);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "denormalizedEvent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trialSystemTelemetry");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClientProjectId:", v27);

  TRILogCategory_ClientFramework();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "description");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138412290;
    v33 = v31;
    _os_log_impl(&dword_19B89C000, v30, OS_LOG_TYPE_INFO, "Logging log event: %@", (uint8_t *)&v32, 0xCu);

  }
  -[TRILogger logEvent:](self, "logEvent:", v15);

}

- (void)logWithMLRuntimeDimensions:(id)a3 metrics:(id)a4 factorState:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a5;
  v8 = (void *)MEMORY[0x1E0DC0EE0];
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  objc_msgSend(WeakRetained, "trackingId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventWithTrackingId:projectId:", v12, self->_projectId);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v13, "denormalizedEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:", v14);

  v16 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v13, "denormalizedEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMlruntimeDimensions:", v16);

  objc_msgSend(MEMORY[0x1E0DC0F80], "systemDimensions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "denormalizedEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSystemDimensions:", v18);

  if (v47)
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v13, "denormalizedEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTrialSystemTelemetry:", v20);

    objc_msgSend(v47, "experimentIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v13, "denormalizedEvent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trialSystemTelemetry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ensureExperimentFields");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "experimentIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "experimentId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setClientExperimentId:", v27);

      objc_msgSend(v47, "experimentIdentifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "treatmentId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setClientTreatmentId:", v29);

      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v47, "experimentIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v42 = v31;
      objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "deploymentId"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "denormalizedEvent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "trialSystemTelemetry");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setClientDeploymentId:", v44);

      goto LABEL_9;
    }
    objc_msgSend(v47, "rolloutIdentifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v13, "denormalizedEvent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trialSystemTelemetry");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "ensureRolloutFields");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "rolloutIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "rolloutId");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setClientRolloutId:", v36);

      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v47, "rolloutIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v47, "bmltIdentifiers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v13, "denormalizedEvent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trialSystemTelemetry");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "ensureBMLTFields");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "bmltIdentifiers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bmltId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setClientBmltId:", v41);

      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v47, "bmltIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:
  -[TRILogger logEvent:](self, "logEvent:", v13);

}

- (void)logWithTrackingId:(id)a3 metrics:(id)a4 dimensions:(id)a5
{
  void *v8;
  uint64_t projectId;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = (void *)MEMORY[0x1E0DC0EE0];
  projectId = self->_projectId;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v8, "eventWithTrackingId:projectId:", a3, projectId);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v18, "denormalizedEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMetrics:", v12);

  v14 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v18, "denormalizedEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserDimensions:", v14);

  objc_msgSend(MEMORY[0x1E0DC0F80], "systemDimensions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "denormalizedEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSystemDimensions:", v16);

  -[TRILogger logEvent:](self, "logEvent:", v18);
}

- (void)logWithTrackingId:(id)a3 metric:(id)a4 dimensions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  TRILogger *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v23 = self;
    v24 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19 && objc_msgSend(v19, "length"))
          {
            v21 = (void *)objc_opt_new();
            objc_msgSend(v21, "setName:", v18);
            objc_msgSend(v21, "setValue:", v20);
            objc_msgSend(v12, "addObject:", v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v15);
    }

    v9 = v24;
    self = v23;
  }
  else
  {
    v12 = 0;
  }
  v29 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogger logWithTrackingId:metrics:dimensions:](self, "logWithTrackingId:metrics:dimensions:", v8, v22, v12);

}

- (void)logWithNamespaceName:(id)a3 metrics:(id)a4 dimensions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v30 = (id)objc_opt_new();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLogEventId:", v12);

  v13 = (void *)objc_opt_new();
  v14 = (void *)MEMORY[0x1E0DC0EF0];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logTimeFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDeviceLogTime:", v16);

  objc_msgSend(v13, "setProjectId:", self->_projectId);
  objc_msgSend(v30, "setContext:", v13);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v30, "setDenormalizedEvent:", v17);

  v18 = (void *)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  objc_msgSend(WeakRetained, "experimentIdentifiersWithNamespaceName:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "experimentId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setExperimentId:", v21);

  objc_msgSend(v18, "setDeploymentId:", objc_msgSend(v20, "deploymentId"));
  objc_msgSend(v20, "treatmentId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTreatmentId:", v22);

  objc_msgSend(v18, "addNamespaceName:", v10);
  objc_msgSend(v30, "denormalizedEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTreatment:", v18);

  v24 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v30, "denormalizedEvent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMetrics:", v24);

  v26 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v30, "denormalizedEvent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserDimensions:", v26);

  objc_msgSend(MEMORY[0x1E0DC0F80], "systemDimensions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "denormalizedEvent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSystemDimensions:", v28);

  -[TRILogger logEvent:](self, "logEvent:", v30);
}

- (void)logWithTrackingId:(id)a3 metric:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  TRILogCategory_ClientFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315138;
    v10 = "-[TRILogger logWithTrackingId:metric:]";
    _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "called deprecated method %s", (uint8_t *)&v9, 0xCu);
  }

  -[TRILogger logWithTrackingId:metric:dimensions:](self, "logWithTrackingId:metric:dimensions:", v7, v6, 0);
}

- (NSArray)logHandlers
{
  return self->_logHandlers;
}

@end
