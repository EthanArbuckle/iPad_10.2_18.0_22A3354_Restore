@implementation UIApplication(Metrics)

- (void)recordAppOpenEvent:()Metrics
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)*MEMORY[0x1E0D7F198])
  {
    v11 = 0;
    v9 = 0;
    v12 = 1;
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47C8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 2;
    }
    else
    {
      v11 = 0;
      v9 = 0;
      if (objc_msgSend(v6, "applicationState") == 2)
        v12 = 3;
      else
        v12 = 0;
    }

  }
  objc_msgSend(a1, "_metricsQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIApplication_Metrics__recordAppOpenEvent___block_invoke;
  block[3] = &unk_1EA0C65A0;
  v18 = v9;
  v19 = v12;
  v17 = v11;
  v14 = v9;
  v15 = v11;
  dispatch_async(v13, block);

}

- (id)_metricsQueue
{
  if (_metricsQueue_onceToken != -1)
    dispatch_once(&_metricsQueue_onceToken, &__block_literal_global_14_0);
  return (id)_metricsQueue_metricsQueue;
}

- (void)subscribeToLifecycleEventNotifications
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel_recordAppOpenEvent_, *MEMORY[0x1E0D7F188], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_recordAppOpenEvent_, *MEMORY[0x1E0D7F198], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel_recordAppCloseEvent_, *MEMORY[0x1E0D7F180], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", a1, sel_recordAppCloseEvent_, *MEMORY[0x1E0D7F1A8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel_recordMemoryWarning_, *MEMORY[0x1E0D7F190], 0);

}

- (void)unsubscribeFromLifecycleEventNotifications
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", a1);

}

- (void)recordAppCloseEvent:()Metrics
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F1D8]), "initWithReason:", v5 == (id)*MEMORY[0x1E0D7F180]);
  objc_msgSend(MEMORY[0x1E0D7F1D0], "recordEvent:", v3);
  if (objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV"))
    v4 = (id)objc_msgSend(MEMORY[0x1E0D7F1D0], "flushImmediately");

}

- (void)recordMemoryWarning:()Metrics
{
  NSObject *v1;

  objc_msgSend(a1, "_metricsQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v1, &__block_literal_global_18);

}

@end
