@implementation TRNetworkOperation

- (void)execute
{
  NSObject *v3;
  char Config;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[TRNetworkOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:");

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
        v13 = "-[TRNetworkOperation execute]";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Network Request", buf, 0xCu);
      }

    }
    buf[0] = 0;
    v10 = 0;
    v11 = 0;
    Config = TRCanPerformSetupGetConfig((BOOL *)buf, &v11, &v10);
    v5 = v11;
    v6 = v10;
    if ((Config & 1) != 0)
    {
      -[TRNetworkOperation _sendRequestWithSSID:password:](self, "_sendRequestWithSSID:password:", v5, v6);
    }
    else
    {
      if (buf[0])
        v7 = -11001;
      else
        v7 = -11000;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TROperation finishWithError:](self, "finishWithError:", v8);

    }
  }
}

- (void)_sendRequestWithSSID:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  TRSetupNetworkRequest *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[TRNetworkOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v8 = (TRSetupNetworkRequest *)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v8);
  }
  else
  {
    -[TRNetworkOperation sendingWiFiInfoHandler](self, "sendingWiFiInfoHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TRNetworkOperation sendingWiFiInfoHandler](self, "sendingWiFiInfoHandler");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v10)[2](v10, v6);

    }
    v8 = objc_alloc_init(TRSetupNetworkRequest);
    -[TRSetupNetworkRequest setNetworkSSID:](v8, "setNetworkSSID:", v6);
    -[TRSetupNetworkRequest setNetworkPassword:](v8, "setNetworkPassword:", v7);
    objc_initWeak(&location, self);
    -[TROperation session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__TRNetworkOperation__sendRequestWithSSID_password___block_invoke;
    v12[3] = &unk_24C2E4FE0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v11, "sendRequest:withResponseHandler:", v8, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __52__TRNetworkOperation__sendRequestWithSSID_password___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[TRNetworkOperation _handleResponse:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Network Response: %@", buf, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4;
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "hasNetwork", CFSTR("TRNetworkOperationHasNetworkKey")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TROperation finishWithResult:](self, "finishWithResult:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v9);
  }

}

- (id)sendingWiFiInfoHandler
{
  return self->_sendingWiFiInfoHandler;
}

- (void)setSendingWiFiInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendingWiFiInfoHandler, 0);
}

@end
