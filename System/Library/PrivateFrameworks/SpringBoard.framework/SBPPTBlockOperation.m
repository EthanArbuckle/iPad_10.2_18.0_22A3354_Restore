@implementation SBPPTBlockOperation

+ (id)operationWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

+ (id)operationWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:block:", v7, v6);

  return v8;
}

- (SBPPTBlockOperation)initWithBlock:(id)a3
{
  id v4;
  SBPPTBlockOperation *v5;
  SBPPTBlockOperation *v6;
  uint64_t v7;
  id block;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPPTBlockOperation;
  v5 = -[SBPPTOperation init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_timeoutInterval = 15.0;
    v5->_state = 0;
    v7 = objc_msgSend(v4, "copy");
    block = v6->_block;
    v6->_block = (id)v7;

  }
  return v6;
}

- (SBPPTBlockOperation)initWithName:(id)a3 block:(id)a4
{
  id v6;
  SBPPTBlockOperation *v7;
  SBPPTBlockOperation *v8;

  v6 = a3;
  v7 = -[SBPPTBlockOperation initWithBlock:](self, "initWithBlock:", a4);
  v8 = v7;
  if (v7)
    -[SBPPTOperation setOperationName:](v7, "setOperationName:", v6);

  return v8;
}

- (SBPPTBlockOperation)init
{
  return -[SBPPTBlockOperation initWithName:block:](self, "initWithName:block:", CFSTR("(anonymous SBPPTBlockOperation)"), &__block_literal_global_411);
}

uint64_t __27__SBPPTBlockOperation_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finish");
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBPPTBlockOperation state](self, "state");
  v5 = CFSTR("Pending");
  if (v4 == 2)
    v5 = CFSTR("Finished");
  if (v4 == 1)
    v6 = CFSTR("Executing");
  else
    v6 = v5;
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("state"));
  v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("timeoutInterval"), self->_timeoutInterval);
  -[SBPPTOperation operationName](self, "operationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("operationName"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("state"), 0);
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("state"), 0);
}

- (void)finish
{
  dispatch_block_t block;

  -[SBPPTBlockOperation timeoutBlock](self, "timeoutBlock");
  block = (dispatch_block_t)objc_claimAutoreleasedReturnValue();
  if (block)
  {
    dispatch_block_cancel(block);
    -[SBPPTBlockOperation setTimeoutBlock:](self, "setTimeoutBlock:", 0);
  }
  -[SBPPTBlockOperation setState:](self, "setState:", 2);
  -[SBPPTOperation operationDidFinish](self, "operationDidFinish");

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPPTBlockOperation;
  -[SBPPTBlockOperation cancel](&v3, sel_cancel);
  self->_cancelled = 1;
  -[SBPPTBlockOperation finish](self, "finish");
}

- (void)cancelAndFailTestWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  SBPPTBlockOperation *v10;
  objc_super v11;
  uint8_t buf[4];
  SBPPTBlockOperation *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "failedTest:withFailure:", v6, v4);
  v11.receiver = self;
  v11.super_class = (Class)SBPPTBlockOperation;
  -[SBPPTBlockOperation cancel](&v11, sel_cancel);
  self->_cancelled = 1;
  SBLogPPT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SBPPTOperation operationName](self, "operationName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (SBPPTBlockOperation *)v8;
    else
      v10 = self;
    *(_DWORD *)buf = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' cancelled for reason: %@", buf, 0x16u);

  }
  -[SBPPTBlockOperation finish](self, "finish");

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return -[SBPPTBlockOperation state](self, "state") == 1;
}

- (BOOL)isFinished
{
  return -[SBPPTBlockOperation state](self, "state") == 2;
}

- (void)start
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "operationName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "Skipping '%@' because it's already finished", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)main
{
  double v3;
  double v4;
  dispatch_block_t v5;
  dispatch_time_t v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[6];

  -[SBPPTBlockOperation timeoutInterval](self, "timeoutInterval");
  v4 = v3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __27__SBPPTBlockOperation_main__block_invoke;
  v8[3] = &unk_1E8E9DE88;
  v8[4] = self;
  *(double *)&v8[5] = v3;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  -[SBPPTBlockOperation setTimeoutBlock:](self, "setTimeoutBlock:", v5);
  v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_after(v6, MEMORY[0x1E0C80D38], v5);
  -[SBPPTOperation operationWillStart](self, "operationWillStart");
  -[SBPPTBlockOperation block](self, "block");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, SBPPTBlockOperation *))v7)[2](v7, self);

}

void __27__SBPPTBlockOperation_main__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation didn't complete within %f seconds"), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelAndFailTestWithReason:", v2);

}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)timeoutBlock
{
  return objc_loadWeakRetained(&self->_timeoutBlock);
}

- (void)setTimeoutBlock:(id)a3
{
  objc_storeWeak(&self->_timeoutBlock, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak(&self->_timeoutBlock);
}

@end
