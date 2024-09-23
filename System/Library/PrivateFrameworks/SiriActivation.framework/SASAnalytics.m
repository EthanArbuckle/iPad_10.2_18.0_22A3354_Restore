@implementation SASAnalytics

+ (id)analytics
{
  if (analytics_onceToken != -1)
    dispatch_once(&analytics_onceToken, &__block_literal_global_1);
  return (id)analytics_sharedAnalytics;
}

void __25__SASAnalytics_analytics__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SASAnalytics _init]([SASAnalytics alloc], "_init");
  v1 = (void *)analytics_sharedAnalytics;
  analytics_sharedAnalytics = (uint64_t)v0;

}

- (id)_init
{
  SASAnalytics *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *analyticsEventQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASAnalytics;
  v2 = -[SASAnalytics init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.siri.SASAnalyticsEventQueue", v3);
    analyticsEventQueue = v2->_analyticsEventQueue;
    v2->_analyticsEventQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (SASAnalytics)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (void)enqueueCurrentAnalyticsEventWithType:(int64_t)a3 context:(id)a4
{
  id v6;
  NSObject *analyticsEventQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  analyticsEventQueue = self->_analyticsEventQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SASAnalytics_enqueueCurrentAnalyticsEventWithType_context___block_invoke;
  v9[3] = &unk_1E91FBF40;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(analyticsEventQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__SASAnalytics_enqueueCurrentAnalyticsEventWithType_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    +[SiriActivationService service](SiriActivationService, "service");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "xcTestingActive");

    WeakRetained = v5;
    if ((v3 & 1) == 0)
    {
      AFAnalyticsEventCreateCurrent();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_enqueueAnalyticsEvent:", v4);

      WeakRetained = v5;
    }
  }

}

- (void)_enqueueAnalyticsEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (!-[SASAnalytics shouldLogAnalyticsEvents](self, "shouldLogAnalyticsEvents"))
  {
    -[SASAnalytics pendingAnalyticsEventQueue](self, "pendingAnalyticsEventQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SASAnalytics pendingAnalyticsEventQueue](self, "pendingAnalyticsEventQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 < 0x10)
      {
LABEL_8:
        -[SASAnalytics pendingAnalyticsEventQueue](self, "pendingAnalyticsEventQueue");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v4);
        goto LABEL_9;
      }
      -[SASAnalytics pendingAnalyticsEventQueue](self, "pendingAnalyticsEventQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASAnalytics pendingAnalyticsEventQueue](self, "pendingAnalyticsEventQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectsInRange:", 0, objc_msgSend(v9, "count") - 15);

    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 16);
      -[SASAnalytics setPendingAnalyticsEventQueue:](self, "setPendingAnalyticsEventQueue:", v8);
    }

    goto LABEL_8;
  }
  -[SASAnalytics flushPendingAnalyticsEventQueue](self, "flushPendingAnalyticsEventQueue");
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEvent:", v4);
LABEL_9:

}

- (void)flushPendingAnalyticsEventQueue
{
  NSObject *analyticsEventQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  analyticsEventQueue = self->_analyticsEventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SASAnalytics_flushPendingAnalyticsEventQueue__block_invoke;
  block[3] = &unk_1E91FBF68;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(analyticsEventQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__SASAnalytics_flushPendingAnalyticsEventQueue__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "pendingAnalyticsEventQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingAnalyticsEventQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logEvents:", v6);

    }
    objc_msgSend(v8, "setPendingAnalyticsEventQueue:", 0);
    WeakRetained = v8;
  }

}

- (BOOL)shouldLogAnalyticsEvents
{
  return self->_shouldLogAnalyticsEvents;
}

- (void)setShouldLogAnalyticsEvents:(BOOL)a3
{
  self->_shouldLogAnalyticsEvents = a3;
}

- (NSMutableArray)pendingAnalyticsEventQueue
{
  return self->_pendingAnalyticsEventQueue;
}

- (void)setPendingAnalyticsEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAnalyticsEventQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAnalyticsEventQueue, 0);
  objc_storeStrong((id *)&self->_analyticsEventQueue, 0);
}

@end
