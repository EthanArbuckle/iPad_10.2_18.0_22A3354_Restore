@implementation RCBoostableOperationThrottler

- (RCBoostableOperationThrottler)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[RCBoostableOperationThrottler init]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
    v11 = 1024;
    v12 = 267;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[RCBoostableOperationThrottler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (RCBoostableOperationThrottler)initWithDelegate:(id)a3
{
  id v4;
  RCBoostableOperationThrottler *v5;
  RCBoostableOperationThrottler *v6;
  RCUnfairLock *v7;
  RCUnfairLock *workPendingLock;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialWorkQueue;
  objc_super v13;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCBoostableOperationThrottler initWithDelegate:].cold.1();
  v13.receiver = self;
  v13.super_class = (Class)RCBoostableOperationThrottler;
  v5 = -[RCBoostableOperationThrottler init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[RCUnfairLock initWithOptions:]([RCUnfairLock alloc], "initWithOptions:", 1);
    workPendingLock = v6->_workPendingLock;
    v6->_workPendingLock = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("RCBoostableOperationThrottler.serial", v9);
    serialWorkQueue = v6->_serialWorkQueue;
    v6->_serialWorkQueue = (OS_dispatch_queue *)v10;

  }
  return v6;
}

- (void)tickleWithQualityOfService:(int64_t)a3
{
  -[RCBoostableOperationThrottler tickleWithQualityOfService:completion:](self, "tickleWithQualityOfService:completion:", a3, 0);
}

- (void)tickleWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id location;

  v6 = a4;
  -[RCBoostableOperationThrottler workPendingLock](self, "workPendingLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  if (-[RCBoostableOperationThrottler workPending](self, "workPending"))
  {
    -[RCBoostableOperationThrottler workPendingLock](self, "workPendingLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    -[RCBoostableOperationThrottler setWorkPending:](self, "setWorkPending:", 1);
    -[RCBoostableOperationThrottler workPendingLock](self, "workPendingLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    -[RCBoostableOperationThrottler delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v10);

    -[RCBoostableOperationThrottler serialWorkQueue](self, "serialWorkQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke;
    v15[3] = &unk_1E470EA10;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    RCDispatchAsyncWithQualityOfService(v11, a3, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  -[RCBoostableOperationThrottler serialWorkQueue](self, "serialWorkQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6)
    v14 = v6;
  else
    v14 = &__block_literal_global_1;
  RCDispatchAsyncWithQualityOfService(v12, a3, v14);

}

void __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "workPendingLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setWorkPending:", 0);
  objc_msgSend(*(id *)(a1 + 32), "workPendingLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke_2;
  v5[3] = &unk_1E470E9E8;
  v5[4] = *(_QWORD *)(a1 + 32);
  RCPerformIfNonNil(WeakRetained, v5);

}

void __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "operationThrottlerPerformOperation:", *(_QWORD *)(a1 + 32));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "serialWorkQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v4);

    objc_msgSend(v3, "operationThrottler:performAsyncOperationWithCompletion:");
  }

}

void __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "serialWorkQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

- (void)tickle
{
  -[RCBoostableOperationThrottler tickleWithCompletion:](self, "tickleWithCompletion:", 0);
}

- (void)tickleWithCompletion:(id)a3
{
  -[RCBoostableOperationThrottler tickleWithQualityOfService:completion:](self, "tickleWithQualityOfService:completion:", 9, a3);
}

- (BOOL)suspended
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCBoostableOperationThrottler suspended].cold.1();
  return 0;
}

- (void)setSuspended:(BOOL)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCBoostableOperationThrottler setSuspended:].cold.1();
}

- (RCOperationThrottlerDelegate)delegate
{
  return (RCOperationThrottlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)serialWorkQueue
{
  return self->_serialWorkQueue;
}

- (void)setSerialWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialWorkQueue, a3);
}

- (BOOL)workPending
{
  return self->_workPending;
}

- (void)setWorkPending:(BOOL)a3
{
  self->_workPending = a3;
}

- (RCUnfairLock)workPendingLock
{
  return self->_workPendingLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workPendingLock, 0);
  objc_storeStrong((id *)&self->_serialWorkQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate != nil");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2_0();
}

- (void)suspended
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("suspending a boostable operation throttler is not yet supported"));
  v2 = 136315906;
  v3 = "-[RCBoostableOperationThrottler suspended]";
  v4 = 2080;
  v5 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
  v6 = 1024;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_1();
}

- (void)setSuspended:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("suspending a boostable operation throttler is not yet supported"));
  v2 = 136315906;
  v3 = "-[RCBoostableOperationThrottler setSuspended:]";
  v4 = 2080;
  v5 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
  v6 = 1024;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_1();
}

@end
