@implementation PASLazyPurgeableResult

void __49___PASLazyPurgeableResult__createDispatchSources__block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  pthread_mutex_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char *v7;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (pthread_mutex_t *)(WeakRetained + 16);
    v7 = WeakRetained;
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 16));
    v3 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = 0;

    dispatch_source_cancel(*((dispatch_source_t *)v7 + 12));
    v4 = (void *)*((_QWORD *)v7 + 12);
    *((_QWORD *)v7 + 12) = 0;

    v5 = *((_QWORD *)v7 + 13);
    if (v5)
    {
      dispatch_source_cancel(v5);
      v6 = (void *)*((_QWORD *)v7 + 13);
      *((_QWORD *)v7 + 13) = 0;

    }
    pthread_mutex_unlock(v2);
    WeakRetained = v7;
  }

}

void __49___PASLazyPurgeableResult__createDispatchSources__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  +[_PASDispatch autoreleasingSerialQueueWithLabel:qosClass:](_PASDispatch, "autoreleasingSerialQueueWithLabel:qosClass:", "_PASLazyPurgeableResult-dispatch-sources", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_createDispatchSources__pasExprOnceResult;
  _createDispatchSources__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
