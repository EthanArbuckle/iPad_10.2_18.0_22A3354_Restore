@implementation TRCompletionOperation

- (void)execute
{
  NSObject *v3;
  TRSetupCompletionRequest *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[TRCompletionOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v6);

  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[TRCompletionOperation execute]";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Completion Request", buf, 0xCu);
      }

    }
    v4 = objc_alloc_init(TRSetupCompletionRequest);
    -[TRSetupCompletionRequest setCompletedSuccessfully:](v4, "setCompletedSuccessfully:", 1);
    objc_initWeak((id *)buf, self);
    -[TROperation session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__TRCompletionOperation_execute__block_invoke;
    v7[3] = &unk_24C2E4FE0;
    objc_copyWeak(&v8, (id *)buf);
    objc_msgSend(v5, "sendRequest:withResponseHandler:", v4, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);

  }
}

void __32__TRCompletionOperation_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (a3)
    objc_msgSend(WeakRetained, "finishWithResult:", MEMORY[0x24BDBD1B8]);
  else
    objc_msgSend(WeakRetained, "finishWithError:", v7);

}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end
