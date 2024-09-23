@implementation SCKStartupQueue

- (SCKStartupQueue)initWithDeferredStartup:(BOOL)a3
{
  _BOOL8 v3;
  SCKStartupQueue *v4;
  SCKAsyncSerialQueue *v5;
  SCKAsyncSerialQueue *startupTaskQueue;
  void *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKStartupQueue;
  v4 = -[SCKStartupQueue init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SCKAsyncSerialQueue);
    startupTaskQueue = v4->_startupTaskQueue;
    v4->_startupTaskQueue = v5;

    -[SCKStartupQueue startupTaskQueue](v4, "startupTaskQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSuspended:", v3);

  }
  return v4;
}

- (void)enqueueStartupBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCKStartupQueue startupTaskQueue](self, "startupTaskQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueBlock:", v4);

}

- (void)executeAfterStartup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SCKStartupQueue startupTaskQueue](self, "startupTaskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuspended:", 0);

  -[SCKStartupQueue startupTaskQueue](self, "startupTaskQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SCKStartupQueue_executeAfterStartup___block_invoke;
  v8[3] = &unk_24D74BDE0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enqueueBlock:", v8);

}

void __39__SCKStartupQueue_executeAfterStartup___block_invoke(uint64_t a1, void *a2)
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

- (SCKAsyncSerialQueue)startupTaskQueue
{
  return self->_startupTaskQueue;
}

- (void)setStartupTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startupTaskQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupTaskQueue, 0);
}

@end
