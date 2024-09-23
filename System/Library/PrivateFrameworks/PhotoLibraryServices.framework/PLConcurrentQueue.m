@implementation PLConcurrentQueue

- (PLConcurrentQueue)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLConcurrentQueue.m"), 21, CFSTR("%s is not a valid initializer"), "-[PLConcurrentQueue init]");

  return 0;
}

- (PLConcurrentQueue)initWithTargetQueue:(id)a3 width:(int64_t)a4
{
  id v7;
  PLConcurrentQueue *v8;
  PLConcurrentQueue *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *internalQueue;
  NSMutableArray *v12;
  NSMutableArray *internalQueue_pendingBlocks;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLConcurrentQueue;
  v8 = -[PLConcurrentQueue init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_targetQueue, a3);
    v9->_width = a4;
    v10 = dispatch_queue_create("com.apple.photos.concurrent-queue-internal", 0);
    internalQueue = v9->_internalQueue;
    v9->_internalQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    internalQueue_pendingBlocks = v9->_internalQueue_pendingBlocks;
    v9->_internalQueue_pendingBlocks = v12;

  }
  return v9;
}

- (void)dispatchAsync:(id)a3
{
  void *v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PLConcurrentQueue_dispatchAsync___block_invoke;
    block[3] = &unk_1E3675C58;
    block[4] = self;
    v8 = v4;
    v6 = v4;
    dispatch_sync(internalQueue, block);

  }
}

- (void)_internalQueue_tryDispatchingNextPendingBlock
{
  void *v3;
  id v4;

  if (-[NSMutableArray count](self->_internalQueue_pendingBlocks, "count"))
  {
    if (self->_internalQueue_usedWidth < self->_width)
    {
      -[NSMutableArray firstObject](self->_internalQueue_pendingBlocks, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_internalQueue_pendingBlocks, "removeObjectAtIndex:", 0);
      ++self->_internalQueue_usedWidth;
      v4 = v3;
      pl_dispatch_async();

    }
  }
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (int64_t)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __66__PLConcurrentQueue__internalQueue_tryDispatchingNextPendingBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLConcurrentQueue__internalQueue_tryDispatchingNextPendingBlock__block_invoke_2;
  block[3] = &unk_1E3677AA0;
  block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __66__PLConcurrentQueue__internalQueue_tryDispatchingNextPendingBlock__block_invoke_2(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_tryDispatchingNextPendingBlock");
}

uint64_t __35__PLConcurrentQueue_dispatchAsync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (void *)MEMORY[0x19AEC174C](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_tryDispatchingNextPendingBlock");
}

@end
