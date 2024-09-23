@implementation _UIAsyncInvocationObserver

- (_UIAsyncInvocationObserver)init
{
  _UIAsyncInvocationObserver *v2;
  _UIAsyncInvocationObserver *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *completionQueueManagementQueue;
  _UIAsyncInvocationObserver *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIAsyncInvocationObserver;
  v2 = -[_UIAsyncInvocationObserver init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_suspendedPostCompletionQueue = 0;
    v4 = dispatch_queue_create("Async Observer Queue Management", 0);
    completionQueueManagementQueue = v3->_completionQueueManagementQueue;
    v3->_completionQueueManagementQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)_didCompleteInvocation
{
  NSObject *completionQueueManagementQueue;
  _QWORD block[5];

  completionQueueManagementQueue = self->_completionQueueManagementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___UIAsyncInvocationObserver__didCompleteInvocation__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(completionQueueManagementQueue, block);
}

- (void)whenCompleteDo:(id)a3
{
  id v4;
  NSObject *completionQueueManagementQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  completionQueueManagementQueue = self->_completionQueueManagementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___UIAsyncInvocationObserver_whenCompleteDo___block_invoke;
  block[3] = &unk_1E16B1D18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(completionQueueManagementQueue, block);

}

+ (void)whenInvocationsCompleteForObservers:(id)a3 do:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  dispatch_semaphore_t v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke;
        v23[3] = &unk_1E16B1B28;
        v24 = v7;
        objc_msgSend(v14, "whenCompleteDo:", v23);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke_2;
  v19[3] = &unk_1E16BAD68;
  v20 = v8;
  v21 = v7;
  v22 = v6;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  dispatch_async(v15, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueueManagementQueue, 0);
  objc_storeStrong((id *)&self->_postCompletionQueue, 0);
}

@end
