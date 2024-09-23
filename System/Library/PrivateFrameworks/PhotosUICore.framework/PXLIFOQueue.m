@implementation PXLIFOQueue

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (PXLIFOQueue)initWithTargetQueue:(id)a3
{
  id v5;
  PXLIFOQueue *v6;
  PXLIFOQueue *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  uint64_t v10;
  NSMutableArray *internalQueue_pendingBlocks;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXLIFOQueue;
  v6 = -[PXLIFOQueue init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetQueue, a3);
    v8 = dispatch_queue_create("com.apple.photos.lifo-internal-queue", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    internalQueue_pendingBlocks = v7->_internalQueue_pendingBlocks;
    v7->_internalQueue_pendingBlocks = (NSMutableArray *)v10;

  }
  return v7;
}

uint64_t __29__PXLIFOQueue_dispatchAsync___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeNextPendingBlock");
}

void __29__PXLIFOQueue_dispatchAsync___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "addObject:", v2);

}

uint64_t __39__PXLIFOQueue__executeNextPendingBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeLastObject");
}

- (void)_executeNextPendingBlock
{
  NSObject *internalQueue;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *(*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__205265;
  v8 = __Block_byref_object_dispose__205266;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PXLIFOQueue__executeNextPendingBlock__block_invoke;
  v3[3] = &unk_1E5148AA8;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(internalQueue, v3);
  (*(void (**)(void))(v5[5] + 16))();
  _Block_object_dispose(&v4, 8);

}

- (void)dispatchAsync:(id)a3
{
  id v4;
  NSObject *internalQueue;
  uint64_t v6;
  id v7;
  NSObject *targetQueue;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PXLIFOQueue_dispatchAsync___block_invoke;
  block[3] = &unk_1E5148CE0;
  block[4] = self;
  v11 = v4;
  v7 = v4;
  dispatch_sync(internalQueue, block);
  targetQueue = self->_targetQueue;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __29__PXLIFOQueue_dispatchAsync___block_invoke_2;
  v9[3] = &unk_1E5149198;
  v9[4] = self;
  dispatch_async(targetQueue, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
