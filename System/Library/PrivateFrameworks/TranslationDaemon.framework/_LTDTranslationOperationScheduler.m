@implementation _LTDTranslationOperationScheduler

- (_LTDTranslationOperationScheduler)initWithQueue:(id)a3
{
  id v4;
  _LTDTranslationOperationScheduler *v5;
  uint64_t v6;
  NSOperationQueue *offlineEngineQueue;
  uint64_t v8;
  NSOperationQueue *onlineEngineQueue;
  NSCache *v10;
  NSCache *cancellationCache;
  _LTDTranslationOperationScheduler *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTDTranslationOperationScheduler;
  v5 = -[_LTDTranslationOperationScheduler init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    offlineEngineQueue = v5->_offlineEngineQueue;
    v5->_offlineEngineQueue = (NSOperationQueue *)v6;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_offlineEngineQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_offlineEngineQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setUnderlyingQueue:](v5->_offlineEngineQueue, "setUnderlyingQueue:", v4);
    v5->_offlineOperationTimeout = 90.0;
    v8 = objc_opt_new();
    onlineEngineQueue = v5->_onlineEngineQueue;
    v5->_onlineEngineQueue = (NSOperationQueue *)v8;

    -[NSOperationQueue setQualityOfService:](v5->_onlineEngineQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setUnderlyingQueue:](v5->_onlineEngineQueue, "setUnderlyingQueue:", v4);
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cancellationCache = v5->_cancellationCache;
    v5->_cancellationCache = v10;

    v12 = v5;
  }

  return v5;
}

- (void)scheduleOperation:(id)a3 route:(int64_t)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v6 = a3;
  v7 = _LTOSLogTranslationEngine();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (a4 == 2)
  {
    if (v8)
      -[_LTDTranslationOperationScheduler scheduleOperation:route:].cold.1(v6, v7);
    v9 = 16;
  }
  else
  {
    if (v8)
      -[_LTDTranslationOperationScheduler scheduleOperation:route:].cold.2(v6, v7);
    objc_msgSend(v6, "setOperationTimeout:", self->_offlineOperationTimeout);
    v9 = 8;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v9), "addOperation:", v6);

}

- (id)scheduleOperationWithGroupID:(id)a3 route:(int64_t)a4 block:(id)a5
{
  void *v7;

  +[_LTDContinuationOperation continuationOperationWithGroupID:delegate:block:](_LTDContinuationOperation, "continuationOperationWithGroupID:delegate:block:", a3, self, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDTranslationOperationScheduler scheduleOperation:route:](self, "scheduleOperation:route:", v7, a4);
  return v7;
}

- (void)cancelOperationsWithGroupID:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_LTDTranslationOperationScheduler cancelOperationsWithGroupID:].cold.1((uint64_t)v4, v5);
    -[NSCache setObject:forKey:](self->_cancellationCache, "setObject:forKey:", MEMORY[0x24BDBD1C8], v4);
  }

}

- (BOOL)shouldStartOperation:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSCache objectForKey:](self->_cancellationCache, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (double)offlineOperationTimeout
{
  return self->_offlineOperationTimeout;
}

- (void)setOfflineOperationTimeout:(double)a3
{
  self->_offlineOperationTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationCache, 0);
  objc_storeStrong((id *)&self->_onlineEngineQueue, 0);
  objc_storeStrong((id *)&self->_offlineEngineQueue, 0);
}

- (void)scheduleOperation:(void *)a1 route:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend(a1, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_2491B9000, v5, v6, "Translation operation scheduled as concurrent: %p; groupID: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);

  OUTLINED_FUNCTION_1_3();
}

- (void)scheduleOperation:(void *)a1 route:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend(a1, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_2491B9000, v5, v6, "Translation operation scheduled as serial: %p; groupID: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);

  OUTLINED_FUNCTION_1_3();
}

- (void)cancelOperationsWithGroupID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Was asked to cancel operations with groupID %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
