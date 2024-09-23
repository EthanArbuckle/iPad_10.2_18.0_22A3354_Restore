@implementation RCTimedOperationThrottler

void __84__RCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  dispatch_time_t v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "cooldownTime");
  v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  RCDispatchQueueForQualityOfService(9);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v3, v4, *(dispatch_block_t *)(a1 + 40));

}

- (double)cooldownTime
{
  return self->_cooldownTime;
}

- (void)tickle
{
  id v2;

  -[RCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickle");

}

- (RCOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (void)setCooldownTime:(double)a3
{
  self->_cooldownTime = a3;
}

- (RCTimedOperationThrottler)initWithDelegate:(id)a3
{
  id v4;
  RCTimedOperationThrottler *v5;
  RCTimedOperationThrottler *v6;
  RCOperationThrottler *v7;
  RCOperationThrottler *operationThrottler;
  objc_super v10;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCTimedOperationThrottler initWithDelegate:].cold.1();
  v10.receiver = self;
  v10.super_class = (Class)RCTimedOperationThrottler;
  v5 = -[RCTimedOperationThrottler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[RCOperationThrottler initWithDelegate:]([RCOperationThrottler alloc], "initWithDelegate:", v6);
    operationThrottler = v6->_operationThrottler;
    v6->_operationThrottler = v7;

  }
  return v6;
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  RCTimedOperationThrottler *v13;
  id v14;

  v5 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __84__RCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v12 = &unk_1E470DEC8;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1A85815B4](&v9);
  -[RCTimedOperationThrottler delegate](self, "delegate", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "operationThrottlerPerformOperation:", self);
LABEL_5:
    v7[2](v7);
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v8, "operationThrottler:performAsyncOperationWithCompletion:", self, v7);
LABEL_6:

}

- (RCOperationThrottlerDelegate)delegate
{
  return (RCOperationThrottlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (RCTimedOperationThrottler)init
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
    v8 = "-[RCTimedOperationThrottler init]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
    v11 = 1024;
    v12 = 188;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[RCTimedOperationThrottler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)tickleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickleWithCompletion:", v4);

}

- (BOOL)suspended
{
  void *v2;
  char v3;

  -[RCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspended");

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[RCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (void)setOperationThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_operationThrottler, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationThrottler, 0);
}

- (void)initWithDelegate:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2_0();
}

@end
