@implementation TROperationQueue

- (TROperationQueue)init
{
  TROperationQueue *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *cancellationQ;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TROperationQueue;
  v2 = -[TROperationQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TROperationQueue.cancellationQ", MEMORY[0x24BDAC9C0]);
    cancellationQ = v2->_cancellationQ;
    v2->_cancellationQ = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)invalidate
{
  NSObject *cancellationQ;
  _QWORD block[5];

  -[TROperationQueue cancelAllOperations](self, "cancelAllOperations");
  cancellationQ = self->_cancellationQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__TROperationQueue_invalidate__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_barrier_async(cancellationQ, block);
}

uint64_t __30__TROperationQueue_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "cancelAllOperations");
}

- (void)addOperation:(id)a3
{
  id v4;
  NSObject *cancellationQ;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  cancellationQ = self->_cancellationQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TROperationQueue_addOperation___block_invoke;
  block[3] = &unk_24C2E4F30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(cancellationQ, block);

}

id __33__TROperationQueue_addOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    objc_msgSend(*(id *)(a1 + 40), "cancel");
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)TROperationQueue;
  return objc_msgSendSuper2(&v4, sel_addOperation_, v2);
}

- (void)addOperationWithBlock:(id)a3
{
  id v4;
  NSObject *cancellationQ;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  cancellationQ = self->_cancellationQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TROperationQueue_addOperationWithBlock___block_invoke;
  block[3] = &unk_24C2E4F58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(cancellationQ, block);

}

uint64_t __42__TROperationQueue_addOperationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  objc_super v4;

  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)TROperationQueue;
  objc_msgSendSuper2(&v4, sel_addOperationWithBlock_, v2);
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "cancelAllOperations");
  return result;
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  id v6;
  NSObject *cancellationQ;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  cancellationQ = self->_cancellationQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__TROperationQueue_addOperations_waitUntilFinished___block_invoke;
  block[3] = &unk_24C2E4F80;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(cancellationQ, block);

}

id __52__TROperationQueue_addOperations_waitUntilFinished___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "cancel");
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)TROperationQueue;
  return objc_msgSendSuper2(&v10, sel_addOperations_waitUntilFinished_, v7, v8);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (OS_dispatch_queue)cancellationQ
{
  return self->_cancellationQ;
}

- (void)setCancellationQ:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationQ, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationQ, 0);
}

@end
