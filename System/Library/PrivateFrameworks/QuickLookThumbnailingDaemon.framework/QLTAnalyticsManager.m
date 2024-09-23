@implementation QLTAnalyticsManager

- (id)_eventsQueue
{
  if (_eventsQueue_onceToken != -1)
    dispatch_once(&_eventsQueue_onceToken, &__block_literal_global);
  return (id)_eventsQueue__eventsSerialBackgroundQueue;
}

void __35__QLTAnalyticsManager__eventsQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, -1);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.quicklook.AnalyticsEventsQueue", attr);
  v2 = (void *)_eventsQueue__eventsSerialBackgroundQueue;
  _eventsQueue__eventsSerialBackgroundQueue = (uint64_t)v1;

}

- (void)_sendEvent:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  -[QLTAnalyticsManager _eventsQueue](self, "_eventsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__QLTAnalyticsManager__sendEvent___block_invoke;
  v8[3] = &unk_1E99D2AF8;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __34__QLTAnalyticsManager__sendEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "propertiesBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AnalyticsSendEventLazy();

  v5 = MEMORY[0x1E0CD3398];
  v6 = *(NSObject **)(MEMORY[0x1E0CD3398] + 152);
  if (!v6)
  {
    QLTInitLogging();
    v6 = *(NSObject **)(v5 + 152);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(const char **)(a1 + 40);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("failed");
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    if (v4)
      v12 = CFSTR("succeeded");
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_INFO, "%@: Tracking event %@ %@", (uint8_t *)&v13, 0x20u);

  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  return (id)sharedManager_sharedAnalyticsManager;
}

void __36__QLTAnalyticsManager_sharedManager__block_invoke()
{
  QLTAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(QLTAnalyticsManager);
  v1 = (void *)sharedManager_sharedAnalyticsManager;
  sharedManager_sharedAnalyticsManager = (uint64_t)v0;

}

- (void)sendCacheSizeEventWithCacheSize:(unint64_t)a3
{
  QLTCacheSizeEvent *v4;

  v4 = -[QLTCacheSizeEvent initWithCacheSize:]([QLTCacheSizeEvent alloc], "initWithCacheSize:", a3);
  -[QLTAnalyticsManager _sendEvent:](self, "_sendEvent:", v4);

}

@end
