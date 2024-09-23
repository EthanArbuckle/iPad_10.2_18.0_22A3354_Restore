@implementation TRDeviceSetupServer

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    TRLogInitialize();
}

- (TRDeviceSetupServer)init
{
  TRDeviceSetupServer *v2;
  TRTransferServer *v3;
  TRTransferServer *transferServer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRDeviceSetupServer;
  v2 = -[TRDeviceSetupServer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TRTransferServer);
    transferServer = v2->_transferServer;
    v2->_transferServer = v3;

    -[TRTransferServer setDelegate:](v2->_transferServer, "setDelegate:", v2);
    v2->_notifyTokenIsValid = notify_register_check("com.apple.TouchRemote.deviceSetupActive", &v2->_notifyToken) == 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TRTransferServer setDelegate:](self->_transferServer, "setDelegate:", 0);
  if (self->_notifyTokenIsValid)
    notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupServer;
  -[TRDeviceSetupServer dealloc](&v3, sel_dealloc);
}

- (void)serverWillReceiveData:(id)a3
{
  TRDeviceSetupServerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  self->_setupInProgress = 1;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "deviceSetupServerDidPromptToBeginSetup:", self);

  }
}

- (void)server:(id)a3 didReceiveData:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = objc_msgSend(v9, "length");
      _os_log_impl(&dword_20A2BF000, v11, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Server got data of length %li", buf, 0xCu);
    }

  }
  if (self->_cancelledSetupInProgress)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8104, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupServer _finishSetupWithError:replyHandler:](self, "_finishSetupWithError:replyHandler:", v12, v10);
  }
  else
  {
    v19 = 0;
    +[TRDeviceSetupAction actionWithData:error:supportsLegacy:](TRDeviceSetupAction, "actionWithData:error:supportsLegacy:", v9, &v19, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TRDeviceSetupServer _connectWithAction:replyHandler:](self, "_connectWithAction:replyHandler:", v13, v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[TRDeviceSetupServer _authenticateWithAction:replyHandler:](self, "_authenticateWithAction:replyHandler:", v13, v10);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[TRDeviceSetupServer _setUpWithAction:replyHandler:](self, "_setUpWithAction:replyHandler:", v13, v10);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[TRDeviceSetupServer _finishWithAction:replyHandler:](self, "_finishWithAction:replyHandler:", v13, v10);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[TRDeviceSetupServer _cancelWithAction:replyHandler:](self, "_cancelWithAction:replyHandler:", v13, v10);
            }
            else
            {
              if (_TRLogEnabled == 1)
              {
                TRLogHandle();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v21 = (uint64_t)v13;
                  v22 = 2112;
                  v23 = v12;
                  _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Failed to handle action: %@. Error: %@", buf, 0x16u);
                }

              }
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8101, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRDeviceSetupServer _finishSetupWithError:replyHandler:](self, "_finishSetupWithError:replyHandler:", v15, v10);
              -[TRDeviceSetupServer delegate](self, "delegate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_opt_respondsToSelector();

              if ((v17 & 1) != 0)
              {
                -[TRDeviceSetupServer delegate](self, "delegate");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "deviceSetupServer:didFailSetupWithError:", self, v15);

              }
            }
          }
        }
      }
    }

  }
}

- (void)server:(id)a3 didFailToReceiveData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_setupInProgress)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    if (v7)
    {
      v12 = *MEMORY[0x24BDD1398];
      v13[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TRDeviceSetupServer _finishSetupWithError:replyHandler:](self, "_finishSetupWithError:replyHandler:", v11, 0);
    -[TRDeviceSetupServer _cancelTransferConnection](self, "_cancelTransferConnection");

  }
}

- (void)cancelActiveSetup
{
  if (self->_setupInProgress)
  {
    self->_cancelledSetupInProgress = 1;
    -[TRDeviceSetupServer _cancelTransferConnection](self, "_cancelTransferConnection");
  }
}

- (void)start
{
  -[TRTransferServer start](self->_transferServer, "start");
  self->_started = 1;
  if (self->_notifyTokenIsValid)
  {
    notify_set_state(self->_notifyToken, 1uLL);
    notify_post("com.apple.TouchRemote.deviceSetupActive");
  }
}

- (void)stop
{
  -[TRTransferServer stop](self->_transferServer, "stop");
  self->_started = 0;
  self->_cancelledSetupInProgress = 0;
  if (self->_notifyTokenIsValid)
  {
    notify_set_state(self->_notifyToken, 0);
    notify_post("com.apple.TouchRemote.deviceSetupActive");
  }
}

- (void)_cancelTransferConnection
{
  TRTransferServer *transferServer;
  TRTransferServer *v4;
  TRTransferServer *v5;

  -[TRTransferServer setDelegate:](self->_transferServer, "setDelegate:", 0);
  -[TRTransferServer stop](self->_transferServer, "stop");
  transferServer = self->_transferServer;
  self->_transferServer = 0;

  v4 = objc_alloc_init(TRTransferServer);
  v5 = self->_transferServer;
  self->_transferServer = v4;

  -[TRTransferServer setDelegate:](self->_transferServer, "setDelegate:", self);
  if (self->_started)
    -[TRTransferServer start](self->_transferServer, "start");
}

- (void)_connectWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Beginning the setup process.", buf, 2u);
    }

  }
  -[TRDeviceSetupServer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[TRDeviceSetupServer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceSetupServer:didBeginSetupWithDeviceName:", self, v12);

  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "networkSSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      _os_log_impl(&dword_20A2BF000, v13, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Asking delegate to connect to a network. Recommended network SSID = \"%@\".", buf, 0xCu);

    }
  }
  objc_initWeak((id *)buf, self);
  -[TRDeviceSetupServer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkSSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkPassword");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__TRDeviceSetupServer__connectWithAction_replyHandler___block_invoke;
  v19[3] = &unk_24C2E5440;
  objc_copyWeak(&v21, (id *)buf);
  v18 = v7;
  v20 = v18;
  objc_msgSend(v15, "deviceSetupServer:connectToNetworkWithRecommendedSSID:password:completionHandler:", self, v16, v17, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

void __55__TRDeviceSetupServer__connectWithAction_replyHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("failed to connect to");
      if (a2)
        v7 = CFSTR("successfully connected to");
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Delegate %@ a network.", (uint8_t *)&v17, 0xCu);
    }

  }
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setCachedAuthInfo:", 0);

    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "accountsToAuthenticateForDeviceSetupServer:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v14, "setAccountsToAuthenticate:", v13);

    v15 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v15, "_requestAuthenticationForNextAccountWithReplyHandler:", *(_QWORD *)(a1 + 32));
LABEL_11:

    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8110, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v16, "_finishSetupWithError:replyHandler:", v15, *(_QWORD *)(a1 + 32));

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_requestAuthenticationForNextAccountWithReplyHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[TRDeviceSetupServer accountsToAuthenticate](self, "accountsToAuthenticate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[TRDeviceSetupServer accountsToAuthenticate](self, "accountsToAuthenticate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    -[TRDeviceSetupServer accountsToAuthenticate](self, "accountsToAuthenticate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

  }
  else
  {
    v8 = 0;
  }
  -[TRDeviceSetupServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TRDeviceSetupServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceSetupServer:willRequestAuthenticationForAccount:", self, v8);

  }
  -[TRDeviceSetupServer _requestAuthenticationForAccount:replyHandler:](self, "_requestAuthenticationForAccount:replyHandler:", v8, v13);

}

- (void)_requestAuthenticationForAccount:(unint64_t)a3 replyHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v6 = a4;
  if (a3)
  {
    -[TRDeviceSetupServer cachedAuthInfo](self, "cachedAuthInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    if (v9)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __69__TRDeviceSetupServer__requestAuthenticationForAccount_replyHandler___block_invoke;
      v10[3] = &unk_24C2E5468;
      objc_copyWeak(v12, &location);
      v11 = v6;
      v12[1] = (id)a3;
      -[TRDeviceSetupServer _authenticateAccount:withAuthInfo:completion:](self, "_authenticateAccount:withAuthInfo:completion:", a3, v9, v10);

      objc_destroyWeak(v12);
    }
    else
    {
      -[TRDeviceSetupServer _requestAuthenticationFromPeripheralForAccount:lastAttemptAction:lastAttemptError:replyHandler:](self, "_requestAuthenticationFromPeripheralForAccount:lastAttemptAction:lastAttemptError:replyHandler:", a3, 0, 0, v6);
    }
    objc_destroyWeak(&location);

  }
  else
  {
    -[TRDeviceSetupServer _requestGeneralSetupWithReplyHandler:](self, "_requestGeneralSetupWithReplyHandler:", v6);
  }

}

void __69__TRDeviceSetupServer__requestAuthenticationForAccount_replyHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (a2 == 1)
  {
    objc_msgSend(WeakRetained, "_requestAuthenticationForNextAccountWithReplyHandler:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "cachedAuthInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    v8 = objc_loadWeakRetained(v4);
    objc_msgSend(v8, "_requestAuthenticationForAccount:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }

}

- (void)_requestAuthenticationFromPeripheralForAccount:(unint64_t)a3 lastAttemptAction:(id)a4 lastAttemptError:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[TRDeviceSetupServer delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[TRDeviceSetupServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceSetupServer:localizedAuthenticationMessageForAccount:", self, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_7;
  }
  else
  {
    v16 = 0;
    if (!v11)
      goto LABEL_7;
  }
  objc_msgSend(v11, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("TRDeviceSetupErrorDomain"));

  if (v18)
  {
    objc_msgSend(v11, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_7:
  v19 = 0;
LABEL_8:
  if (v10)
    +[TRDeviceSetupAuthenticateAction actionForFailedAttemptWithOriginalAction:requestMessage:failureMessage:](TRDeviceSetupAuthenticateAction, "actionForFailedAttemptWithOriginalAction:requestMessage:failureMessage:", v10, v16, v19);
  else
    +[TRDeviceSetupAuthenticateAction actionForInitialAttemptWithAccountType:requestMessage:](TRDeviceSetupAuthenticateAction, "actionForInitialAttemptWithAccountType:requestMessage:", a3, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v21 = -[TRDeviceSetupServer _sendAction:sendDataHandler:shouldSendNilOnFailure:error:](self, "_sendAction:sendDataHandler:shouldSendNilOnFailure:error:", v20, v12, 0, &v24);
  v22 = v24;
  if (!v21)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = v22;
        _os_log_impl(&dword_20A2BF000, v23, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Failed to send auth request, moving on to general setup. Action: %@. Error: %@.", buf, 0x16u);
      }

    }
    -[TRDeviceSetupServer _requestGeneralSetupWithReplyHandler:](self, "_requestGeneralSetupWithReplyHandler:", v12);
  }

}

- (void)_authenticateAccount:(unint64_t)a3 withAuthInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[4];
  id v21;
  unint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TRDeviceSetupAuthenticationKeyAccountID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TRDeviceSetupAuthenticationKeyAccountPassword"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3
    && objc_msgSend(v10, "length")
    && objc_msgSend(v11, "length")
    && (-[TRDeviceSetupServer delegate](self, "delegate"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        TRStringFromSetupAccountType(a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        _os_log_impl(&dword_20A2BF000, v13, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Asking delegate to authenticate account \"%@\".", buf, 0xCu);

      }
    }
    -[TRDeviceSetupServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __68__TRDeviceSetupServer__authenticateAccount_withAuthInfo_completion___block_invoke;
    v20[3] = &unk_24C2E5490;
    v22 = a3;
    v21 = v9;
    objc_msgSend(v15, "deviceSetupServer:authenticateAccount:withInfo:completionHandler:", self, a3, v8, v20);

  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        TRStringFromSetupAccountType(a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRDeviceSetupServer delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = &stru_24C2E6A98;
        if (!v18)
          v19 = CFSTR(" (No delegate)");
        *(_DWORD *)buf = 138412546;
        v24 = v17;
        v25 = 2112;
        v26 = v19;
        _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Skipping authentication for account \"%@\".%@", buf, 0x16u);

      }
    }
    if (v9)
      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 2, 0);
  }

}

void __68__TRDeviceSetupServer__authenticateAccount_withAuthInfo_completion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v7 = CFSTR("successfully authenticated");
      else
        v7 = CFSTR("failed to authenticate");
      TRStringFromSetupAccountType(*(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Delegate %@ account \"%@\".", (uint8_t *)&v10, 0x16u);

    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, a2, v5);

}

- (void)_authenticateWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26[0] = CFSTR("TRDeviceSetupAuthenticationKeyAccountID");
  objc_msgSend(v6, "accountID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24C2E6A98;
  v27[0] = v10;
  v26[1] = CFSTR("TRDeviceSetupAuthenticationKeyAccountPassword");
  objc_msgSend(v6, "accountPassword");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24C2E6A98;
  v27[1] = v13;
  v26[2] = CFSTR("TRDeviceSetupAuthenticationKeyAttemptCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "attemptCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = objc_msgSend(v6, "accountType");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__TRDeviceSetupServer__authenticateWithAction_replyHandler___block_invoke;
  v20[3] = &unk_24C2E54B8;
  v17 = v6;
  v21 = v17;
  objc_copyWeak(&v24, &location);
  v18 = v15;
  v22 = v18;
  v19 = v7;
  v23 = v19;
  -[TRDeviceSetupServer _authenticateAccount:withAuthInfo:completion:](self, "_authenticateAccount:withAuthInfo:completion:", v16, v18, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __60__TRDeviceSetupServer__authenticateWithAction_replyHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id WeakRetained;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 != 2)
  {
    if (a2 != 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "_requestAuthenticationFromPeripheralForAccount:lastAttemptAction:lastAttemptError:replyHandler:", objc_msgSend(*(id *)(a1 + 32), "accountType"), *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 48));
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "accountTypesWithSharedCredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v24 = v5;
      v8 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v8, "cachedAuthInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCachedAuthInfo:", v11);

      }
      v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24C2F28B0, CFSTR("TRDeviceSetupAuthenticationKeyAttemptCount"));
      v23 = v12;
      v13 = (void *)objc_msgSend(v12, "copy");
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "accountTypesWithSharedCredentials");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
            v20 = objc_loadWeakRetained((id *)(a1 + 56));
            objc_msgSend(v20, "cachedAuthInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v16);
      }

      v5 = v24;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_requestAuthenticationForNextAccountWithReplyHandler:", *(_QWORD *)(a1 + 48));
LABEL_16:

}

- (void)_requestGeneralSetupWithReplyHandler:(id)a3
{
  id v4;
  TRDeviceSetupGeneralSetupAction *v5;

  v4 = a3;
  -[TRDeviceSetupServer setAccountsToAuthenticate:](self, "setAccountsToAuthenticate:", 0);
  v5 = objc_alloc_init(TRDeviceSetupGeneralSetupAction);
  -[TRDeviceSetupServer _sendAction:sendDataHandler:shouldSendNilOnFailure:error:](self, "_sendAction:sendDataHandler:shouldSendNilOnFailure:error:", v5, v4, 1, 0);

}

- (void)_setUpWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v22, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v22, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("TRDeviceSetupInfoKeyCountryCode"));

  }
  objc_msgSend(v22, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v22, "language");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("TRDeviceSetupInfoKeyLanguage"));

  }
  objc_msgSend(v22, "homeSharingID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v22, "homeSharingID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("TRDeviceSetupInfoKeyHomeSharingAppleID"));

  }
  objc_msgSend(v22, "homeSharingGroupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v22, "homeSharingGroupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("TRDeviceSetupInfoKeyHomeSharingGroupID"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v22, "isDiagnosticsEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("TRDeviceSetupInfoKeyDiagnosticsEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v22, "rememberPassword"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("TRDeviceSetupInfoKeyRememberPasswordEnabled"));

  -[TRDeviceSetupServer delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[TRDeviceSetupServer delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v20, "deviceSetupServer:didReceiveSetupInfo:", self, v21);

  }
  -[TRDeviceSetupServer _finishSetupWithError:replyHandler:](self, "_finishSetupWithError:replyHandler:", 0, v6);

}

- (void)_finishWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  self->_setupInProgress = 0;
  self->_cancelledSetupInProgress = 0;
  -[TRDeviceSetupServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TRDeviceSetupServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceSetupServerDidFinishSetup:", self);

  }
}

- (void)_cancelWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  self->_setupInProgress = 0;
  self->_cancelledSetupInProgress = 0;
  -[TRDeviceSetupServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TRDeviceSetupServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceSetupServer:didFailSetupWithError:", self, v11);

  }
}

- (void)_finishSetupWithError:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TRDeviceSetupCancelAction *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Setup failed. Error: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    v9 = -[TRDeviceSetupCancelAction initWithError:]([TRDeviceSetupCancelAction alloc], "initWithError:", v6);
    -[TRDeviceSetupServer _sendAction:sendDataHandler:shouldSendNilOnFailure:error:](self, "_sendAction:sendDataHandler:shouldSendNilOnFailure:error:", v9, v7, 1, 0);
    -[TRDeviceSetupServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[TRDeviceSetupServer delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceSetupServer:didFailSetupWithError:", self, v6);

    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_20A2BF000, v13, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Setup is finished.", (uint8_t *)&v14, 2u);
      }

    }
    v9 = objc_alloc_init(TRDeviceSetupFinishAction);
    -[TRDeviceSetupServer _sendAction:sendDataHandler:shouldSendNilOnFailure:error:](self, "_sendAction:sendDataHandler:shouldSendNilOnFailure:error:", v9, v7, 1, 0);
  }

}

- (BOOL)_sendAction:(id)a3 sendDataHandler:(id)a4 shouldSendNilOnFailure:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  void (**v9)(id, void *);
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, void *))a4;
  if (v9)
  {
    objc_msgSend(a3, "dataRepresentationWithError:", a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;
    if (v10)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 134217984;
          v15 = objc_msgSend(v10, "length");
          _os_log_impl(&dword_20A2BF000, v12, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Data to send length: %ld", (uint8_t *)&v14, 0xCu);
        }

      }
      v9[2](v9, v10);
    }
    else if (v7)
    {
      v9[2](v9, 0);
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (TRDeviceSetupServerDelegate)delegate
{
  return (TRDeviceSetupServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)accountsToAuthenticate
{
  return self->_accountsToAuthenticate;
}

- (void)setAccountsToAuthenticate:(id)a3
{
  objc_storeStrong((id *)&self->_accountsToAuthenticate, a3);
}

- (NSMutableDictionary)cachedAuthInfo
{
  return self->_cachedAuthInfo;
}

- (void)setCachedAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAuthInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAuthInfo, 0);
  objc_storeStrong((id *)&self->_accountsToAuthenticate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataToSendSemaphore, 0);
  objc_storeStrong((id *)&self->_dataToSend, 0);
  objc_storeStrong((id *)&self->_transferServer, 0);
}

@end
