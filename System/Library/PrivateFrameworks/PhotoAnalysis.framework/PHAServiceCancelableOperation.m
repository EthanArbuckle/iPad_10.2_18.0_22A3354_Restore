@implementation PHAServiceCancelableOperation

- (PHAServiceCancelableOperation)initWithOperationId:(int64_t)a3 invocation:(id)a4
{
  id v7;
  PHAServiceCancelableOperation *v8;
  PHAServiceCancelableOperation *v9;
  dispatch_group_t v10;
  OS_dispatch_group *completionGroup;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAServiceCancelableOperation;
  v8 = -[PHAServiceCancelableOperation init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_invocation, a4);
    v9->_operationId = a3;
    v10 = dispatch_group_create();
    completionGroup = v9->_completionGroup;
    v9->_completionGroup = (OS_dispatch_group *)v10;

    dispatch_group_enter((dispatch_group_t)v9->_completionGroup);
  }

  return v9;
}

- (void)addCompletionBlock:(id)a3
{
  NSObject *completionGroup;
  NSObject *v5;

  completionGroup = self->_completionGroup;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(completionGroup, v5, a3);

}

- (int64_t)operationId
{
  return self->_operationId;
}

- (void)setCancellationBlock:(id)a3
{
  PHAServiceCancelableOperation *v4;
  void *v5;
  id cancellationBlock;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_cancelRequested)
  {
    objc_sync_exit(v4);

    aBlock[2]();
  }
  else
  {
    v5 = _Block_copy(aBlock);
    cancellationBlock = v4->_cancellationBlock;
    v4->_cancellationBlock = v5;

    objc_sync_exit(v4);
  }

}

- (id)progressBlock
{
  PHAServiceCancelableOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_progressBlock);
  objc_sync_exit(v2);

  return v3;
}

- (void)setProgressBlock:(id)a3
{
  id v4;
  void *v5;
  id progressBlock;
  PHAServiceCancelableOperation *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  v5 = _Block_copy(v4);

  progressBlock = obj->_progressBlock;
  obj->_progressBlock = v5;

  objc_sync_exit(obj);
}

- (BOOL)cancel
{
  PHAServiceCancelableOperation *v2;
  _BOOL4 cancelRequested;
  void (**v4)(_QWORD);
  id cancellationBlock;

  v2 = self;
  objc_sync_enter(v2);
  cancelRequested = v2->_cancelRequested;
  if (v2->_cancelRequested)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void (**)(_QWORD))_Block_copy(v2->_cancellationBlock);
    cancellationBlock = v2->_cancellationBlock;
    v2->_cancellationBlock = 0;

  }
  v2->_cancelRequested = 1;
  objc_sync_exit(v2);

  if (v4)
    v4[2](v4);

  return !cancelRequested;
}

- (BOOL)isCancelled
{
  PHAServiceCancelableOperation *v2;
  BOOL cancelRequested;

  v2 = self;
  objc_sync_enter(v2);
  cancelRequested = v2->_cancelRequested;
  objc_sync_exit(v2);

  return cancelRequested;
}

- (void)_startWork
{
  PHAServiceOperationListener **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  char v8;
  id v9;
  NSInvocation *invocation;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "operationWillStart:", self);

  }
  -[NSInvocation invoke](self->_invocation, "invoke");
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "operationDidFinish:", self);

  }
  dispatch_group_leave((dispatch_group_t)self->_completionGroup);
  invocation = self->_invocation;
  self->_invocation = 0;

}

- (void)enqueueOnQueue:(id)a3
{
  NSObject *v3;
  dispatch_block_t v4;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PHAServiceCancelableOperation_enqueueOnQueue___block_invoke;
  block[3] = &unk_1E8521740;
  block[4] = self;
  v3 = a3;
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);

}

- (id)operationCanceledError:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = 16;
  else
    v3 = 18;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = CFSTR("operationId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_operationId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_analysisErrorWithCode:userInfo:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  PHAServiceCancelableOperation *v2;
  _BOOL8 cancelRequested;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = self;
  objc_sync_enter(v2);
  cancelRequested = v2->_cancelRequested;
  objc_sync_exit(v2);

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2->_operationId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(-[NSInvocation selector](v2->_invocation, "selector"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p>: operationId %@ canceled=%d SEL=%@"), v6, v2, v7, cancelRequested, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)waitForCompletion
{
  dispatch_group_wait((dispatch_group_t)self->_completionGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSInvocation)invocation
{
  return (NSInvocation *)objc_getProperty(self, a2, 8, 1);
}

- (PHAServiceOperationListener)delegate
{
  return (PHAServiceOperationListener *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
}

uint64_t __48__PHAServiceCancelableOperation_enqueueOnQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWork");
}

+ (id)operationNotFoundError:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v8 = CFSTR("operationId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pl_analysisErrorWithCode:userInfo:", 19, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
