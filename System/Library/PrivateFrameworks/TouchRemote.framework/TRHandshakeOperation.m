@implementation TRHandshakeOperation

- (void)execute
{
  NSObject *v3;
  TRHandshakeRequest *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[TRHandshakeOperation isCancelled](self, "isCancelled"))
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
        v10 = "-[TRHandshakeOperation execute]";
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Handshake Request", buf, 0xCu);
      }

    }
    v4 = objc_alloc_init(TRHandshakeRequest);
    -[TRHandshakeRequest setProtocolVersion:](v4, "setProtocolVersion:", -[TRHandshakeOperation protocolVersion](self, "protocolVersion"));
    objc_initWeak((id *)buf, self);
    -[TROperation session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __31__TRHandshakeOperation_execute__block_invoke;
    v7[3] = &unk_24C2E4FE0;
    objc_copyWeak(&v8, (id *)buf);
    objc_msgSend(v5, "sendRequest:withResponseHandler:", v4, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);

  }
}

void __31__TRHandshakeOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v7;
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
      v13 = "-[TRHandshakeOperation _handleResponse:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Handshake Response: %@", buf, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "protocolVersion");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7, CFSTR("TRHandshakeOperationProtocolVersionKey"));
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

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

@end
