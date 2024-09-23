@implementation SCWStartupQueue

- (void)enqueueStartupBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_startupTaskDepthLock);
  ++self->_startupTaskDepth;
  os_unfair_lock_unlock(&self->_startupTaskDepthLock);
  -[SCWStartupQueue startupTaskQueue](self, "startupTaskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCWStartupQueue_enqueueStartupBlock___block_invoke;
  v7[3] = &unk_1E5AF1D50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enqueueBlock:", v7);

}

- (void)executeAfterStartup:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int64_t startupTaskDepth;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[SCWStartupQueue startupTaskQueue](self, "startupTaskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuspended:", 0);

  os_unfair_lock_lock(&self->_startupTaskDepthLock);
  startupTaskDepth = self->_startupTaskDepth;
  os_unfair_lock_unlock(&self->_startupTaskDepthLock);
  if (startupTaskDepth <= 0)
  {
    v4[2](v4);
  }
  else
  {
    -[SCWStartupQueue startupTaskQueue](self, "startupTaskQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__SCWStartupQueue_executeAfterStartup___block_invoke;
    v8[3] = &unk_1E5AF1D78;
    v9 = v4;
    objc_msgSend(v7, "enqueueBlock:", v8);

  }
}

- (SCWAsyncSerialQueue)startupTaskQueue
{
  return self->_startupTaskQueue;
}

void __39__SCWStartupQueue_executeAfterStartup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v4[2]();

}

void __39__SCWStartupQueue_enqueueStartupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCWStartupQueue_enqueueStartupBlock___block_invoke_2;
  v7[3] = &unk_1E5AF1D28;
  v4 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v7);

}

uint64_t __39__SCWStartupQueue_enqueueStartupBlock___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (SCWStartupQueue)initWithDeferredStartup:(BOOL)a3
{
  _BOOL8 v3;
  SCWStartupQueue *v4;
  SCWAsyncSerialQueue *v5;
  SCWAsyncSerialQueue *startupTaskQueue;
  void *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWStartupQueue;
  v4 = -[SCWStartupQueue init](&v9, sel_init);
  if (v4)
  {
    v5 = -[SCWAsyncSerialQueue initWithQualityOfService:]([SCWAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
    startupTaskQueue = v4->_startupTaskQueue;
    v4->_startupTaskQueue = v5;

    v4->_startupTaskDepthLock._os_unfair_lock_opaque = 0;
    -[SCWStartupQueue startupTaskQueue](v4, "startupTaskQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSuspended:", v3);

  }
  return v4;
}

- (void)setStartupTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startupTaskQueue, a3);
}

- (int64_t)startupTaskDepth
{
  return self->_startupTaskDepth;
}

- (void)setStartupTaskDepth:(int64_t)a3
{
  self->_startupTaskDepth = a3;
}

- (os_unfair_lock_s)startupTaskDepthLock
{
  return self->_startupTaskDepthLock;
}

- (void)setStartupTaskDepthLock:(os_unfair_lock_s)a3
{
  self->_startupTaskDepthLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupTaskQueue, 0);
}

@end
