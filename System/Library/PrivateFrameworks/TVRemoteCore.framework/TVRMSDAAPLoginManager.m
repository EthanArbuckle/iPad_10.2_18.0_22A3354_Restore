@implementation TVRMSDAAPLoginManager

- (TVRMSDAAPLoginManager)initWithRequestManager:(id)a3
{
  id v5;
  TVRMSDAAPLoginManager *v6;
  uint64_t v7;
  TVRMSFairPlaySession *fairPlaySession;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRMSDAAPLoginManager;
  v6 = -[TVRMSDAAPLoginManager init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    fairPlaySession = v6->_fairPlaySession;
    v6->_fairPlaySession = (TVRMSFairPlaySession *)v7;

    objc_storeStrong((id *)&v6->_requestManager, a3);
    -[TVRMSDAAPRequestManager setFairPlaySession:](v6->_requestManager, "setFairPlaySession:", v6->_fairPlaySession);
  }

  return v6;
}

- (void)loginWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke;
  v6[3] = &unk_24DCD7118;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[TVRMSDAAPLoginManager _requestServerInfoWithCompletionHandler:](self, "_requestServerInfoWithCompletionHandler:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  if (a2 == 1)
  {
    v3 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1;
    v6[3] = &unk_24DCD7140;
    v7 = *(id *)(a1 + 32);
    objc_copyWeak(&v8, v3);
    objc_msgSend(WeakRetained, "_requestLoginWithCompletionHandler:", v6);

    objc_destroyWeak(&v8);
  }
  else
  {
    _TVRCRMSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Error getting server info", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  _BYTE *v6;
  id *v7;
  NSObject *v8;
  _QWORD v9[4];
  _QWORD v10[2];
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(*((id *)WeakRetained + 1), "setSessionIdentifier:", a3);
      if (v6[24])
      {
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2;
        v11[3] = &unk_24DCD7118;
        v12 = *(id *)(a1 + 32);
        objc_copyWeak(&v13, (id *)(a1 + 40));
        objc_msgSend(v6, "_requestFairPlayHandshake:", v11);
        v7 = &v12;
        objc_destroyWeak(&v13);
      }
      else
      {
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2;
        v9[3] = &unk_24DCD70F0;
        v7 = (id *)v10;
        v10[0] = *(id *)(a1 + 32);
        v10[1] = 1;
        objc_msgSend(v6, "_requestControlInterfaceWithCompletionHandler:", v9);
      }

    }
  }
  else
  {
    _TVRCRMSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Error logging in", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint8_t buf[16];

  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_24DCD70F0;
    v6 = *(id *)(a1 + 32);
    v7 = 1;
    objc_msgSend(WeakRetained, "_requestControlInterfaceWithCompletionHandler:", v5);

  }
  else
  {
    _TVRCRMSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Error performing FairPlay handshake", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (void)_requestServerInfoWithCompletionHandler:(id)a3
{
  id v4;
  TVRMSDAAPRequestManager *requestManager;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  requestManager = self->_requestManager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__TVRMSDAAPLoginManager__requestServerInfoWithCompletionHandler___block_invoke;
  v8[3] = &unk_24DCD7168;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", CFSTR("server-info"), CFSTR("GET"), 0, 0, v8);

}

uint64_t __65__TVRMSDAAPLoginManager__requestServerInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2 == 1)
  {
    +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isFairplayRequiredForServerInfo:", v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_requestControlInterfaceWithCompletionHandler:(id)a3
{
  id v4;
  TVRMSDAAPRequestManager *requestManager;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  requestManager = self->_requestManager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__TVRMSDAAPLoginManager__requestControlInterfaceWithCompletionHandler___block_invoke;
  v8[3] = &unk_24DCD6FE0;
  v9 = v4;
  v6 = v4;
  v7 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", CFSTR("ctrl-int"), CFSTR("POST"), 0, 0, v8);

}

void __71__TVRMSDAAPLoginManager__requestControlInterfaceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("items"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dacp.supportsSpeakerSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dacp.supportsVolume"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsDirectionalControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSupportsSpeakerSelection:", v5);
  objc_msgSend(v10, "setSupportsVolumeControl:", v7);
  objc_msgSend(v10, "setSupportsDirectionalControl:", v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_requestLoginWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  TVRMSDAAPRequestManager *requestManager;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (self->_isFairPlayRequired)
    v5 = &unk_24DCF9358;
  else
    v5 = 0;
  requestManager = self->_requestManager;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__TVRMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke;
  v9[3] = &unk_24DCD6FE0;
  v10 = v4;
  v7 = v4;
  v8 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", CFSTR("login"), CFSTR("GET"), 0, v5, v9);

}

void __60__TVRMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 != 1)
  {
    _TVRCRMSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Login error, additional info from response body: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v4, "intValue"));

}

- (void)_requestFairPlayHandshake:(id)a3
{
  TVRMSFairPlaySession *fairPlaySession;
  id v5;
  void (*v6)(void);
  id v7;

  if (self->_isFairPlayRequired)
  {
    fairPlaySession = self->_fairPlaySession;
    v5 = a3;
    -[TVRMSFairPlaySession handshakeData](fairPlaySession, "handshakeData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[TVRMSDAAPLoginManager _continueFairPlayHandshakeWithData:completionHandler:](self, "_continueFairPlayHandshakeWithData:completionHandler:");

  }
  else
  {
    v6 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v6();
  }

}

- (void)_continueFairPlayHandshakeWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  TVRMSDAAPRequestManager *requestManager;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  requestManager = self->_requestManager;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__TVRMSDAAPLoginManager__continueFairPlayHandshakeWithData_completionHandler___block_invoke;
  v12[3] = &unk_24DCD7190;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", CFSTR("fp-setup"), CFSTR("POST"), v9, 0, v12);

}

void __78__TVRMSDAAPLoginManager__continueFairPlayHandshakeWithData_completionHandler___block_invoke(uint64_t a1)
{
  void (*v2)(void);
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "handshakeIterationWithData:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isHandshakeComplete"))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_6:
    v2();
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_continueFairPlayHandshakeWithData:completionHandler:", v3, *(_QWORD *)(a1 + 48));
LABEL_7:

}

- (BOOL)_isFairplayRequiredForServerInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.supportedextensions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  if ((v5 & 2) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.req-fplay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.supports-fprap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v7 & v9;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlaySession, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end
