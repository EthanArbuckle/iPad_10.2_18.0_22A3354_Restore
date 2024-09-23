@implementation RMTimedDispatch

+ (id)timedDispatchAfterInterval:(double)a3 completionBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = -[RMTimedDispatch initAfterInterval:completionBlock:]([RMTimedDispatch alloc], "initAfterInterval:completionBlock:", v5, a3);

  return v6;
}

- (id)initAfterInterval:(double)a3 completionBlock:(id)a4
{
  id v6;
  RMTimedDispatch *v7;
  void *v8;
  uint64_t v9;
  NSString *timerID;
  RMTimedDispatch *v11;
  dispatch_block_t v12;
  id timerCompletionBlock;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  RMTimedDispatch *v23;
  id v24;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RMTimedDispatch;
  v7 = -[RMTimedDispatch init](&v25, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    timerID = v7->_timerID;
    v7->_timerID = (NSString *)v9;

    v7->_complete = 0;
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke;
    v22 = &unk_24D967E90;
    v11 = v7;
    v23 = v11;
    v24 = v6;
    v12 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v19);
    timerCompletionBlock = v11->_timerCompletionBlock;
    v11->_timerCompletionBlock = v12;

    +[RMLog timeddispatch](RMLog, "timeddispatch", v19, v20, v21, v22);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[RMTimedDispatch initAfterInterval:completionBlock:].cold.1(v11, v14, a3);

    v15 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    if (timedDispatchQueue_onceToken != -1)
      dispatch_once(&timedDispatchQueue_onceToken, &__block_literal_global_38);
    v16 = (id)timedDispatchQueue_queue;
    -[RMTimedDispatch timerCompletionBlock](v11, "timerCompletionBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v15, v16, v17);

  }
  return v7;
}

void __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMLog timeddispatch](RMLog, "timeddispatch");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_2(v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setComplete:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setTimerCompletionBlock:", 0);
  }
  else
  {
    if (v5)
      __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_1(v4);

  }
}

- (void)cancel
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "timerID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_21885E000, v2, v3, "Timed dispatch cancelled: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_0();
}

- (NSString)timerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (id)timerCompletionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setTimerCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerCompletionBlock, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (void)initAfterInterval:(double)a3 completionBlock:.cold.1(void *a1, NSObject *a2, double a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "timerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2048;
  v8 = a3;
  _os_log_debug_impl(&dword_21885E000, a2, OS_LOG_TYPE_DEBUG, "Timed dispatch starting: %{public}@ interval: %f", v6, 0x16u);

}

void __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21885E000, log, OS_LOG_TYPE_DEBUG, "Timed dispatch cancelled", v1, 2u);
}

void __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "timerID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_21885E000, v2, v3, "Timed dispatch executing: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_0();
}

@end
