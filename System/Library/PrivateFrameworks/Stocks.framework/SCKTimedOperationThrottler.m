@implementation SCKTimedOperationThrottler

- (SCKTimedOperationThrottler)initWithDelegate:(id)a3
{
  id v4;
  SCKTimedOperationThrottler *v5;
  SCKTimedOperationThrottler *v6;
  SCKOperationThrottler *v7;
  SCKOperationThrottler *operationThrottler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCKTimedOperationThrottler;
  v5 = -[SCKTimedOperationThrottler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[SCKOperationThrottler initWithDelegate:]([SCKOperationThrottler alloc], "initWithDelegate:", v6);
    operationThrottler = v6->_operationThrottler;
    v6->_operationThrottler = v7;

  }
  return v6;
}

- (void)tickle
{
  id v2;

  -[SCKTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickle");

}

- (void)tickleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCKTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickleWithCompletion:", v4);

}

- (BOOL)suspended
{
  void *v2;
  char v3;

  -[SCKTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspended");

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SCKTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

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
  SCKTimedOperationThrottler *v13;
  id v14;

  v5 = a4;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __85__SCKTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v12 = &unk_24D74BD50;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x219A0B984](&v9);
  -[SCKTimedOperationThrottler delegate](self, "delegate", v9, v10, v11, v12, v13);
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

void __85__SCKTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  dispatch_time_t v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "cooldownTime");
  v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v3, v4, *(dispatch_block_t *)(a1 + 40));

}

- (double)cooldownTime
{
  return self->_cooldownTime;
}

- (void)setCooldownTime:(double)a3
{
  self->_cooldownTime = a3;
}

- (SCKOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (void)setOperationThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_operationThrottler, a3);
}

- (SCKOperationThrottlerDelegate)delegate
{
  return (SCKOperationThrottlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
