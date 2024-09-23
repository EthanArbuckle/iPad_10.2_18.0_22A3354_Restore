@implementation TRIXPCServerContextPromise

- (TRIXPCServerContextPromise)init
{
  TRIXPCServerContextPromise *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRIXPCServerContextPromise;
  v2 = -[TRIXPCServerContextPromise init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D81598];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v5, "UTF8String"), 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIXPCServerContextPromise setFullfillmentQueue:](v2, "setFullfillmentQueue:", v6);

    -[TRIXPCServerContextPromise setServerContext:](v2, "setServerContext:", 0);
    -[TRIXPCServerContextPromise setTaskQueue:](v2, "setTaskQueue:", 0);
    -[TRIXPCServerContextPromise fullfillmentQueue](v2, "fullfillmentQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v7);

  }
  return v2;
}

- (void)fullfillWithContext:(id)a3 taskQueue:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  -[TRIXPCServerContextPromise setServerContext:](self, "setServerContext:", a3);
  -[TRIXPCServerContextPromise setTaskQueue:](self, "setTaskQueue:", v6);

  -[TRIXPCServerContextPromise fullfillmentQueue](self, "fullfillmentQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

}

- (void)reject
{
  NSObject *v2;

  -[TRIXPCServerContextPromise fullfillmentQueue](self, "fullfillmentQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v2);

}

- (void)addBlockToExecuteAfterPromiseFullfillment:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TRIXPCServerContextPromise *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __72__TRIXPCServerContextPromise_addBlockToExecuteAfterPromiseFullfillment___block_invoke;
  v11 = &unk_1E932F8F0;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v8);
  -[TRIXPCServerContextPromise fullfillmentQueue](self, "fullfillmentQueue", v8, v9, v10, v11, v12);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

void __72__TRIXPCServerContextPromise_addBlockToExecuteAfterPromiseFullfillment___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = qos_class_self();
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "Running server context block with qos: %u", (uint8_t *)v6, 8u);
  }

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "serverContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

}

- (OS_dispatch_queue)fullfillmentQueue
{
  return self->_fullfillmentQueue;
}

- (void)setFullfillmentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fullfillmentQueue, a3);
}

- (TRIServerContext)serverContext
{
  return self->_serverContext;
}

- (void)setServerContext:(id)a3
{
  objc_storeStrong((id *)&self->_serverContext, a3);
}

- (TRITaskQueuing)taskQueue
{
  return self->_taskQueue;
}

- (void)setTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_serverContext, 0);
  objc_storeStrong((id *)&self->_fullfillmentQueue, 0);
}

@end
