@implementation _PASQueueLock

- (void)runAsyncWithLockAcquired:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___PASQueueLock_runAsyncWithLockAcquired___block_invoke;
  v7[3] = &unk_1E4430468;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (_PASQueueLock)initWithGuardedData:(id)a3 serialQueue:(id)a4
{
  id v7;
  id v8;
  _PASQueueLock *v9;
  _PASQueueLock *v10;
  NSObject *queue;
  _QWORD block[4];
  _PASQueueLock *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_PASQueueLock;
  v9 = -[_PASQueueLock init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong(&v10->_guardedData, a3);
    queue = v10->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49___PASQueueLock_initWithGuardedData_serialQueue___block_invoke;
    block[3] = &unk_1E44311E8;
    v14 = v10;
    dispatch_sync(queue, block);

  }
  return v10;
}

- (void)runWithLockAcquired:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___PASQueueLock_runWithLockAcquired___block_invoke;
  block[3] = &unk_1E4430468;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (unsigned)runWithLockAcquired:(id)a3 shouldContinueBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  dispatch_block_t v8;
  void *v9;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  char v27;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2810000000;
  v26 = &unk_1A09C8ECB;
  v27 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2829;
  v21 = __Block_byref_object_dispose__2830;
  v22 = (id)MEMORY[0x1A1AFDE78](v6);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57___PASQueueLock_runWithLockAcquired_shouldContinueBlock___block_invoke;
  v16[3] = &unk_1E4430490;
  v16[5] = &v23;
  v16[6] = &v17;
  v16[4] = self;
  v8 = dispatch_block_create((dispatch_block_flags_t)0, v16);
  dispatch_async((dispatch_queue_t)self->_queue, v8);
  while (1)
  {
    v9 = (void *)MEMORY[0x1A1AFDC98]();
    v10 = v7[2](v7);
    objc_autoreleasePoolPop(v9);
    if (!v10)
      break;
    if (!dispatch_block_wait(v8, +[_PASDispatch dispatchTimeWithSecondsFromNow:](_PASDispatch, "dispatchTimeWithSecondsFromNow:", 1.0)))goto LABEL_10;
  }
  v11 = (unsigned __int8 *)(v24 + 4);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(1u, v11));
  if ((v12 & 1) == 0)
  {
    v13 = (void *)v18[5];
    v18[5] = 0;

    v14 = 1;
    goto LABEL_11;
  }
  dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
  v14 = 0;
LABEL_11:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (id)unsafeGuardedData
{
  return self->_guardedData;
}

- (id)guardedDataAssertingLockContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[_PASQueueLock unsafeGuardedData](self, "unsafeGuardedData");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_guardedData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
