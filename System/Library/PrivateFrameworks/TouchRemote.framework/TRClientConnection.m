@implementation TRClientConnection

- (id)interruptionHandler
{
  void *v2;
  void *v3;

  -[TRClientConnection session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interruptionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TRClientConnection session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v4);

}

- (id)invalidationHandler
{
  void *v2;
  void *v3;

  -[TRClientConnection session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[TRClientConnection session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__TRClientConnection_setInvalidationHandler___block_invoke;
  v7[3] = &unk_24C2E5228;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __45__TRClientConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSession:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (id)eventMessageHandler
{
  void *v2;
  void *v3;

  -[TRClientConnection session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventMessageHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEventMessageHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TRClientConnection session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventMessageHandler:", v4);

}

- (id)requestMessageHandler
{
  void *v2;
  void *v3;

  -[TRClientConnection session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestMessageHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRequestMessageHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TRClientConnection session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestMessageHandler:", v4);

}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TRClientConnection session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sendEvent:", v4);
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[TRClientConnection sendEvent:]";
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to send event message. Connection not connected.", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TRClientConnection session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sendRequest:", v4);
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[TRClientConnection sendRequest:]";
        _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to send request message. Connection not connected.", buf, 0xCu);
      }

    }
    v8 = *MEMORY[0x24BDD0FD8];
    v12[0] = *MEMORY[0x24BDD0FC8];
    v12[1] = v8;
    v13[0] = CFSTR("Unable to send request message.");
    v13[1] = CFSTR("The connection must be connected before sending messages");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9102, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v10, 0);

  }
}

- (void)sendResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TRClientConnection session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sendResponse:", v4);
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[TRClientConnection sendResponse:]";
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to send response message. Connection not connected.", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)invalidate
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[TRClientConnection session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "invalidate");
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[TRClientConnection invalidate]";
      _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "%s Unable to invalidate. Connection not connected.", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)connectToNearbyDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  dispatch_queue_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE901B0]);
  objc_msgSend(v6, "representedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPeerDevice:", v9);

  v10 = dispatch_queue_create("com.apple.TRClientConnection.session.dispatchQ", 0);
  objc_msgSend(v8, "setDispatchQueue:", v10);

  if (objc_msgSend(v6, "supportedService") == 1)
    objc_msgSend(v8, "setServiceIdentifier:", *MEMORY[0x24BE90390]);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__TRClientConnection_connectToNearbyDevice_withCompletion___block_invoke;
  v13[3] = &unk_24C2E5250;
  v11 = v7;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v8;
  v14 = v12;
  objc_msgSend(v12, "activateWithCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __59__TRClientConnection_connectToNearbyDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = "-[TRClientConnection connectToNearbyDevice:withCompletion:]_block_invoke";
        v9 = 2112;
        v10 = v3;
        _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "%s Connection failed to activate with error: %@", (uint8_t *)&v7, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315138;
        v8 = "-[TRClientConnection connectToNearbyDevice:withCompletion:]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Connection activated successfully", (uint8_t *)&v7, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setSession:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (SFSession)session
{
  return (SFSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
