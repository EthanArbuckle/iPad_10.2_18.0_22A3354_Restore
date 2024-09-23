@implementation SSObserver

+ (id)observerWithResultBlock:(id)a3
{
  return (id)objc_msgSend(a1, "observerWithResultBlock:completionBlock:failureBlock:", a3, 0, 0);
}

+ (id)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_sync_enter(v10);
  objc_msgSend(v10, "setCompletionBlock:", v8);
  objc_msgSend(v10, "setFailureBlock:", v9);
  objc_msgSend(v10, "setResultBlock:", v7);
  objc_sync_exit(v10);

  return v10;
}

- (void)_sendCompletionUsingQueue:(id)a3
{
  NSObject *v4;
  SSObserver *v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SSObserver completionBlock](v5, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SSObserver__sendCompletionUsingQueue___block_invoke;
    block[3] = &unk_1E47BA738;
    v8 = v6;
    dispatch_async(v4, block);

  }
}

uint64_t __40__SSObserver__sendCompletionUsingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendFailure:(id)a3 usingQueue:(id)a4
{
  id v7;
  NSObject *v8;
  SSObserver *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSObserver.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v9 = self;
  objc_sync_enter(v9);
  -[SSObserver failureBlock](v9, "failureBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SSObserver__sendFailure_usingQueue___block_invoke;
    block[3] = &unk_1E47B8A98;
    v14 = v10;
    v13 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __38__SSObserver__sendFailure_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_sendResult:(id)a3 usingQueue:(id)a4
{
  id v7;
  NSObject *v8;
  SSObserver *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSObserver.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  v9 = self;
  objc_sync_enter(v9);
  -[SSObserver resultBlock](v9, "resultBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SSObserver__sendResult_usingQueue___block_invoke;
    block[3] = &unk_1E47B8A98;
    v14 = v10;
    v13 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __37__SSObserver__sendResult_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
