@implementation SBKSimpleTransactionRequestHandler

- (SBKSimpleTransactionRequestHandler)initWithBagContext:(id)a3
{
  id v4;
  SBKSimpleTransactionRequestHandler *v5;
  SBKTransactionController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBKTransactionController *transactionController;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBKSimpleTransactionRequestHandler;
  v5 = -[SBKSimpleTransactionRequestHandler init](&v12, sel_init);
  if (v5)
  {
    v6 = [SBKTransactionController alloc];
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncRequestURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBKTransactionController initWithDomain:requestURL:](v6, "initWithDomain:requestURL:", v7, v8);
    transactionController = v5->_transactionController;
    v5->_transactionController = (SBKTransactionController *)v9;

  }
  return v5;
}

- (void)scheduleTransaction:(id)a3 finishedBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  -[SBKSimpleTransactionRequestHandler transactionController](self, "transactionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__SBKSimpleTransactionRequestHandler_scheduleTransaction_finishedBlock___block_invoke;
  v10[3] = &unk_24E2A8268;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "scheduleTransaction:withTransactionFinishedBlock:", v6, v10);

}

- (void)timeout
{
  void *v3;
  id v4;

  if (!-[SBKTransactionController isIdle](self->_transactionController, "isIdle"))
  {
    -[SBKTransactionController currentTransaction](self->_transactionController, "currentTransaction");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[SBKStoreError transactionTimeoutErrorWithTransaction:underlyingError:](SBKStoreError, "transactionTimeoutErrorWithTransaction:underlyingError:", v4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKSimpleTransactionRequestHandler cancelWithError:](self, "cancelWithError:", v3);

  }
}

- (void)cancel
{
  -[SBKSimpleTransactionRequestHandler cancelWithError:](self, "cancelWithError:", 0);
}

- (void)cancelWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  self->_canceled = 1;
  -[SBKSimpleTransactionRequestHandler transactionController](self, "transactionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "cancelAllTransactionsCancelCode:", objc_msgSend(v5, "code"));
  else
    objc_msgSend(v4, "cancelAllTransactions");

}

- (SBKTransactionController)transactionController
{
  return self->_transactionController;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionController, 0);
}

uint64_t __72__SBKSimpleTransactionRequestHandler_scheduleTransaction_finishedBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return 1;
}

@end
