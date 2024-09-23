@implementation SSMetricsTimingDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_26);
  return (id)sharedInstance_sharedInstance;
}

void __41__SSMetricsTimingDefaults_sharedInstance__block_invoke()
{
  SSMetricsTimingDefaults *v0;
  void *v1;

  v0 = -[SSMetricsTimingDefaults initWithSessionDelegate:]([SSMetricsTimingDefaults alloc], "initWithSessionDelegate:", 0);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

+ (id)sharedInstanceWithSessionDelegate:(id)a3
{
  id v3;
  SSMetricsTimingDefaults *v4;

  v3 = a3;
  v4 = -[SSMetricsTimingDefaults initWithSessionDelegate:]([SSMetricsTimingDefaults alloc], "initWithSessionDelegate:", v3);

  return v4;
}

- (SSMetricsTimingDefaults)initWithSessionDelegate:(id)a3
{
  id v4;
  SSMetricsTimingDefaults *v5;
  NSDictionary *v6;
  NSDictionary *cachedValues;
  SSCoalescingQueue *v8;
  uint64_t v9;
  SSCoalescingQueue *updateQueue;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SSMetricsTimingDefaults;
  v5 = -[SSMetricsTimingDefaults init](&v16, sel_init);
  if (v5)
  {
    v6 = (NSDictionary *)CFPreferencesCopyAppValue(CFSTR("NetworkTimingMetrics"), CFSTR("com.apple.itunesstored"));
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = v6;

    objc_initWeak(&location, v5);
    v8 = [SSCoalescingQueue alloc];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__SSMetricsTimingDefaults_initWithSessionDelegate___block_invoke;
    v12[3] = &unk_1E47BA0B8;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    v9 = -[SSCoalescingQueue initWithBlock:](v8, "initWithBlock:", v12);
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = (SSCoalescingQueue *)v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __51__SSMetricsTimingDefaults_initWithSessionDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  _BYTE *v34;
  uint64_t v35;
  _BYTE v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "isURLBagRequest"))
  {
    +[SSLogConfig sharediTunesStoreConfig](SSLogConfig, "sharediTunesStoreConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v6 &= 2u;
    if (v6)
    {
      *(_DWORD *)v36 = 138412290;
      *(_QWORD *)&v36[4] = objc_opt_class();
      v8 = *(id *)&v36[4];
      LODWORD(v35) = 12;
      v34 = v36;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_18:

        v16 = 0;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, v36, v35, *(_OWORD *)v36);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_18;
  }
  if (!v3)
  {
    +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (SSIsDaemon())
    {
      v29 = SSViTunesStoreFramework();
      objc_msgSend(SSVWeakLinkedClassForString(CFSTR("ISURLBagCache"), v29), "sharedCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "URLBagForContext:", v17);
      v20 = objc_claimAutoreleasedReturnValue();

      -[NSObject valueForKey:](v20, "valueForKey:", CFSTR("metrics"));
    }
    else
    {
      +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", v17);
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject valueForKey:error:](v20, "valueForKey:error:", CFSTR("metrics"), 0);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  objc_msgSend(v3, "dictionaryForKey:error:", CFSTR("metrics"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSLogConfig sharediTunesStoreConfig](SSLogConfig, "sharediTunesStoreConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v17, "shouldLog");
  if (objc_msgSend(v17, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v17, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    v19 &= 2u;
  if (!v19)
    goto LABEL_34;
  *(_DWORD *)v36 = 138412546;
  *(_QWORD *)&v36[4] = objc_opt_class();
  *(_WORD *)&v36[12] = 2112;
  *(_QWORD *)&v36[14] = v16;
  v21 = *(id *)&v36[4];
  LODWORD(v35) = 22;
  v34 = v36;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, v36, v35, *(_QWORD *)v36, *(_OWORD *)&v36[8], v37);
    v20 = objc_claimAutoreleasedReturnValue();
    free(v22);
    SSFileLog(v17, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v20);
LABEL_34:

  }
LABEL_36:
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("performance"), v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cachedValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToDictionary:", v31);

  if ((v33 & 1) == 0)
  {
    CFPreferencesSetAppValue(CFSTR("NetworkTimingMetrics"), v31, CFSTR("com.apple.itunesstored"));
    objc_msgSend(WeakRetained, "setCachedValues:", v31);
  }

}

- (NSDictionary)values
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__58;
  v12 = __Block_byref_object_dispose__58;
  v13 = 0;
  -[SSMetricsTimingDefaults updateQueue](self, "updateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SSMetricsTimingDefaults_values__block_invoke;
  v7[3] = &unk_1E47B8680;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __33__SSMetricsTimingDefaults_values__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cachedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (double)sessionDurationLoadURL
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSMetricsTimingDefaults values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sessionDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4 / 1000.0;

  return v5;
}

- (double)samplingPercentageUsersLoadURL
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSMetricsTimingDefaults values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)samplingPercentageCachedResponsesLoadURL
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSMetricsTimingDefaults values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("samplingPercentageCachedResponses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)sessionDurationPageRender
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSMetricsTimingDefaults values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sessionDurationPageRender"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4 / 1000.0;

  return v5;
}

- (double)samplingPercentageUsersPageRender
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSMetricsTimingDefaults values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsersPageRender"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)update
{
  id v3;

  if (!-[SSMetricsTimingDefaults isRunningTests](self, "isRunningTests"))
  {
    -[SSMetricsTimingDefaults updateQueue](self, "updateQueue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeBlock");

  }
}

- (SSCoalescingQueue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (NSDictionary)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
  objc_storeStrong((id *)&self->_cachedValues, a3);
}

- (BOOL)isRunningTests
{
  return self->_runningTests;
}

- (void)setRunningTests:(BOOL)a3
{
  self->_runningTests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end
