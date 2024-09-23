@implementation RCAsyncOnceOperation

- (RCAsyncOnceOperation)initWithBlock:(id)a3
{
  id v4;
  RCAsyncOnceOperation *v5;
  uint64_t v6;
  id workBlock;
  RCMutexLock *v8;
  RCMutexLock *lock;

  v4 = a3;
  v5 = -[RCAsyncOnceOperation init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    workBlock = v5->_workBlock;
    v5->_workBlock = (id)v6;

    v8 = objc_alloc_init(RCMutexLock);
    lock = v5->_lock;
    v5->_lock = v8;

  }
  return v5;
}

- (RCAsyncOnceOperation)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  RCAsyncOnceOperation *v8;
  _QWORD v10[4];
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__RCAsyncOnceOperation_initWithTarget_selector___block_invoke;
  v10[3] = &unk_1E470E0B8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v7 = (void *)MEMORY[0x1A85815B4](v10);
  v8 = -[RCAsyncOnceOperation initWithBlock:](self, "initWithBlock:", v7);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v8;
}

id __48__RCAsyncOnceOperation_initWithTarget_selector___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    ((void (*)(id, _QWORD, void (**)(id, _QWORD)))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 40)))(WeakRetained, *(_QWORD *)(a1 + 40), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3[2](v3, 0);
    v6 = 0;
  }

  return v6;
}

- (id)executeWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  void (*v12)(_QWORD *, _QWORD *);
  NSObject *v13;
  void *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  NSObject *v21;

  v4 = (void (**)(_QWORD))a3;
  -[RCMutexLock lock](self->_lock, "lock");
  if (-[RCAsyncOnceOperation finished](self, "finished"))
  {
    -[RCMutexLock unlock](self->_lock, "unlock");
    v5 = 0;
LABEL_13:
    v4[2](v4);
    goto LABEL_14;
  }
  v6 = -[RCAsyncOnceOperation interest](self, "interest");
  v7 = MEMORY[0x1E0C809B0];
  if (!v6)
  {
    -[RCAsyncOnceOperation activeGroup](self, "activeGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCAsyncOnceOperation executeWithCompletionHandler:].cold.2();
    -[RCAsyncOnceOperation activeOperation](self, "activeOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCAsyncOnceOperation executeWithCompletionHandler:].cold.1();
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    -[RCAsyncOnceOperation setActiveGroup:](self, "setActiveGroup:", v10);
    -[RCAsyncOnceOperation workBlock](self, "workBlock");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E470E0E0;
    v20[4] = self;
    v21 = v10;
    v12 = (void (*)(_QWORD *, _QWORD *))v11[2];
    v13 = v10;
    v12(v11, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCAsyncOnceOperation setActiveOperation:](self, "setActiveOperation:", v14);

    v15 = -[RCAsyncOnceOperation relativePriority](self, "relativePriority");
    -[RCAsyncOnceOperation activeOperation](self, "activeOperation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRelativePriority:", v15);

  }
  -[RCAsyncOnceOperation setInterest:](self, "setInterest:", -[RCAsyncOnceOperation interest](self, "interest") + 1);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E470DFF0;
  v19[4] = self;
  +[RCCancelHandler cancelHandlerWithBlock:](RCCancelHandler, "cancelHandlerWithBlock:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCAsyncOnceOperation activeGroup](self, "activeGroup");
  v17 = objc_claimAutoreleasedReturnValue();
  -[RCMutexLock unlock](self->_lock, "unlock");
  if (!v17)
    goto LABEL_13;
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], v4);

LABEL_14:
  return v5;
}

void __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lock");
  objc_msgSend(*(id *)(a1 + 32), "activeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setSucceeded:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setInterest:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setActiveGroup:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setActiveOperation:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setWorkBlock:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lock");
  objc_msgSend(*(id *)(a1 + 32), "setInterest:", objc_msgSend(*(id *)(a1 + 32), "interest") - 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "interest"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setActiveGroup:", 0);
    objc_msgSend(*(id *)(a1 + 32), "activeOperation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "setActiveOperation:", 0);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unlock");
}

- (BOOL)finishedExecuting
{
  BOOL v3;

  -[RCMutexLock lock](self->_lock, "lock");
  v3 = -[RCAsyncOnceOperation finished](self, "finished");
  -[RCMutexLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)finishedExecutingWithFailure
{
  _BOOL4 v3;

  -[RCMutexLock lock](self->_lock, "lock");
  if (-[RCAsyncOnceOperation finished](self, "finished"))
    v3 = !-[RCAsyncOnceOperation succeeded](self, "succeeded");
  else
    LOBYTE(v3) = 0;
  -[RCMutexLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;

  -[RCMutexLock lock](self->_lock, "lock");
  self->_relativePriority = a3;
  -[RCAsyncOnceOperation activeOperation](self, "activeOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelativePriority:", a3);

  -[RCMutexLock unlock](self->_lock, "unlock");
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void)setWorkBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (unint64_t)interest
{
  return self->_interest;
}

- (void)setInterest:(unint64_t)a3
{
  self->_interest = a3;
}

- (OS_dispatch_group)activeGroup
{
  return self->_activeGroup;
}

- (void)setActiveGroup:(id)a3
{
  objc_storeStrong((id *)&self->_activeGroup, a3);
}

- (RCOperationCanceling)activeOperation
{
  return self->_activeOperation;
}

- (void)setActiveOperation:(id)a3
{
  objc_storeStrong((id *)&self->_activeOperation, a3);
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (RCMutexLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_activeOperation, 0);
  objc_storeStrong((id *)&self->_activeGroup, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

- (void)executeWithCompletionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("already have an active operation"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)executeWithCompletionHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("already have an active group"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

@end
