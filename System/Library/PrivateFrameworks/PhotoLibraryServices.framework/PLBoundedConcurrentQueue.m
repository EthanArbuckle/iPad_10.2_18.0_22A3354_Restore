@implementation PLBoundedConcurrentQueue

- (PLBoundedConcurrentQueue)initWithName:(id)a3 concurrencyLimit:(unsigned __int8)a4
{
  unsigned int v4;
  id v7;
  id v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v20;
  objc_super v21;

  v4 = a4;
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLBoundedConcurrentQueue;
  v8 = -[PLBoundedConcurrentQueue init](&v21, sel_init);
  if (v8)
  {
    if (v4 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PLBoundedConcurrentQueue.m"), 25, CFSTR("Use a serial queue"));

    }
    v9 = objc_retainAutorelease(v7);
    v10 = (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    v13 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v8 + 1), (const void *)PLBoundedConcurrentQueueContext, *((void **)v8 + 1), 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ serial submission queue"), v9);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "cStringUsingEncoding:", 4), 0);
    v16 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v15;

    v17 = dispatch_semaphore_create(v4);
    v18 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v17;

  }
  return (PLBoundedConcurrentQueue *)v8;
}

- (void)sync:(id)a3
{
  NSObject *concurrentQueue;
  NSObject *v5;
  void (**v6)(void);
  _QWORD block[5];
  void (**v8)(void);

  v6 = (void (**)(void))a3;
  concurrentQueue = self->_concurrentQueue;
  if (dispatch_queue_get_specific(concurrentQueue, (const void *)PLBoundedConcurrentQueueContext) == concurrentQueue)
  {
    v6[2]();
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_bound, 0xFFFFFFFFFFFFFFFFLL);
    v5 = self->_concurrentQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLBoundedConcurrentQueue_sync___block_invoke;
    block[3] = &unk_1E3675C58;
    block[4] = self;
    v8 = v6;
    dispatch_async_and_wait(v5, block);

  }
}

- (void)async:(id)a3
{
  id v4;
  NSObject *submissionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  submissionQueue = self->_submissionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__PLBoundedConcurrentQueue_async___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(submissionQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bound, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

void __34__PLBoundedConcurrentQueue_async___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PLBoundedConcurrentQueue_async___block_invoke_2;
  v5[3] = &unk_1E3675C58;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

intptr_t __34__PLBoundedConcurrentQueue_async___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
}

intptr_t __33__PLBoundedConcurrentQueue_sync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
}

@end
