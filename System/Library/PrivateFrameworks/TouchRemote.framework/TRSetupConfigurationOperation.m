@implementation TRSetupConfigurationOperation

- (void)execute
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  TRSetupConfigurationRequest *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[TRSetupConfigurationOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v8);

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
        v12 = "-[TRSetupConfigurationOperation execute]";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Configuration Request", buf, 0xCu);
      }

    }
    v4 = (void *)MGCopyAnswer();
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[TRSetupConfigurationOperation execute]";
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Using device name (%@)", buf, 0x16u);
      }

    }
    v6 = objc_alloc_init(TRSetupConfigurationRequest);
    -[TRSetupConfigurationRequest setDeviceName:](v6, "setDeviceName:", v4);
    objc_initWeak((id *)buf, self);
    -[TROperation session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__TRSetupConfigurationOperation_execute__block_invoke;
    v9[3] = &unk_24C2E4FE0;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v7, "sendRequest:withResponseHandler:", v6, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);

  }
}

void __40__TRSetupConfigurationOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[TRSetupConfigurationOperation _handleResponse:]";
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Configuration Response: %@", buf, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4;
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "needsNetwork", CFSTR("TRSetupConfigurationOperationNeedsNetworkKey")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v12[1] = CFSTR("TRSetupConfigurationOperationUnauthenticatedServicesKey");
    objc_msgSend(v7, "unauthenticatedAccountServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    v12[2] = CFSTR("TRSetupConfigurationOperationUseAIDAKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "useAIDA"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[TROperation finishWithResult:](self, "finishWithResult:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v11);
  }

}

@end
