@implementation TRActivationOperation

- (void)execute
{
  NSObject *v3;
  TRSetupActivationRequest *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[TRActivationOperation isCancelled](self, "isCancelled"))
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
        v10 = "-[TRActivationOperation execute]";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Activation Request", buf, 0xCu);
      }

    }
    v4 = objc_alloc_init(TRSetupActivationRequest);
    objc_initWeak((id *)buf, self);
    -[TROperation session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__TRActivationOperation_execute__block_invoke;
    v7[3] = &unk_24C2E4FE0;
    objc_copyWeak(&v8, (id *)buf);
    objc_msgSend(v5, "sendRequest:withResponseHandler:", v4, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);

  }
}

void __32__TRActivationOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "finishWithError:", v7);

  }
  else if (v5)
  {
    objc_msgSend(WeakRetained, "_handleResponse:", v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "finishWithError:", v8);
  }

}

- (void)_handleResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[TRActivationOperation _handleResponse:]";
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Activation Response: %@", buf, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "activated", CFSTR("TRActivationOperationIsActivatedKey")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("TRActivationOperationErrorKey"));

    }
    v12 = (void *)objc_msgSend(v9, "copy");
    -[TROperation finishWithResult:](self, "finishWithResult:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v6);
  }

}

@end
