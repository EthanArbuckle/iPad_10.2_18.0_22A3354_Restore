@implementation TRDeviceSetupPeripheral

- (TRDeviceSetupPeripheral)init
{
  TRDeviceSetupPeripheral *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRDeviceSetupPeripheral;
  v2 = -[TRDeviceSetupPeripheral init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TouchRemote.TRDeviceSetupPeripheral", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)performSetupAndReturnError:(id *)a3
{
  NSObject *v5;
  void *v7;
  uint64_t v8;
  char Config;
  id v10;
  id v11;
  void *v12;
  void *v13;
  TRDeviceSetupLegacyAuthenticationAction *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD block[4];
  BOOL v22;
  uint8_t v23[16];
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[5];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  char v31;

  if (self->_preparingForSetup)
  {
    if (self->_performingSetup)
      return 1;
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke;
    v27[3] = &unk_24C2E5C38;
    v27[4] = buf;
    objc_msgSend(v7, "requestPermissionToInitiateSetupWithCompletion:", v27);

    if (v29[24])
    {
      v26 = 0;
      v24 = 0;
      v25 = 0;
      Config = TRCanPerformSetupGetConfig(&v26, &v25, &v24);
      v10 = v25;
      v11 = v24;
      if ((Config & 1) != 0)
      {
        +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[TRDeviceSetupConnectAction initWithDeviceName:networkSSID:networkPassword:]([TRDeviceSetupLegacyAuthenticationAction alloc], "initWithDeviceName:networkSSID:networkPassword:", v13, v10, v11);
        v20[0] = v8;
        v20[1] = 3221225472;
        v20[2] = __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_2;
        v20[3] = &unk_24C2E5C80;
        v20[4] = self;
        v15 = (void *)MEMORY[0x20BD22DF8](v20);
        v19 = 0;
        -[TRDeviceSetupPeripheral _sendAction:sendDataHandler:error:](self, "_sendAction:sendDataHandler:error:", v14, v15, &v19);

      }
      else
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_20A2BF000, v17, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Unable to perform setup, requirements not met.", v23, 2u);
          }

        }
        dispatch_get_global_queue(0, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_92;
        block[3] = &__block_descriptor_33_e5_v8__0l;
        v22 = v26;
        dispatch_async(v18, block);

        -[TRDeviceSetupPeripheral cancelPreparingForSetup](self, "cancelPreparingForSetup");
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8108, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      _Block_object_dispose(buf, 8);
      if ((Config & 1) != 0)
        return 1;
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Unable to perform setup, user did not give permission", v23, 2u);
        }

      }
      -[TRDeviceSetupPeripheral cancelPreparingForSetup](self, "cancelPreparingForSetup");
      _Block_object_dispose(buf, 8);
    }
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] -performSetup called before a tap was received, ignoring.", buf, 2u);
    }

  }
  return 0;
}

uint64_t __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_92(uint64_t a1)
{
  id v2;

  +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentWiFiNetworkConnectionError:completion:", *(unsigned __int8 *)(a1 + 32), 0);

}

void __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 9))
  {
    v6 = v3;
    *(_BYTE *)(v4 + 9) = 0;
    objc_msgSend(*(id *)(a1 + 32), "pendingSendDataHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingSendDataHandler:", 0);
    if (v5)
      ((void (**)(_QWORD, id))v5)[2](v5, v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;

    v3 = v6;
  }

}

- (void)cancelPreparingForSetup
{
  void *v3;
  id v4;

  if (self->_preparingForSetup)
  {
    self->_preparingForSetup = 0;
    -[TRDeviceSetupPeripheral pendingSendDataHandler](self, "pendingSendDataHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupPeripheral setPendingSendDataHandler:](self, "setPendingSendDataHandler:", 0);
    v3 = v4;
    if (v4)
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      v3 = v4;
    }

  }
}

- (void)cancelSetupForStateChange
{
  void *v3;
  id v4;

  if (self->_performingSetup)
  {
    -[TRDeviceSetupPeripheral pendingSendDataHandler](self, "pendingSendDataHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupPeripheral setPendingSendDataHandler:](self, "setPendingSendDataHandler:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8105, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupPeripheral _setupDidFailWithError:replyHandler:](self, "_setupDidFailWithError:replyHandler:", v3, v4);

  }
}

- (void)cancelSetupForTimeout
{
  void *v3;
  id v4;

  if (self->_performingSetup)
  {
    -[TRDeviceSetupPeripheral pendingSendDataHandler](self, "pendingSendDataHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupPeripheral setPendingSendDataHandler:](self, "setPendingSendDataHandler:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8106, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupPeripheral _setupDidFailWithError:replyHandler:](self, "_setupDidFailWithError:replyHandler:", v3, v4);

  }
}

- (void)_didDisconnect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__TRDeviceSetupPeripheral__didDisconnect__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__TRDeviceSetupPeripheral__didDisconnect__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  id v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    objc_msgSend(v2, "pendingSendDataHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingSendDataHandler:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8104, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setupDidFailWithError:replyHandler:", v3, v4);

  }
}

- (void)_didReceiveData:(id)a3 replyHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v14 = 0;
  +[TRDeviceSetupAction actionWithData:error:supportsLegacy:](TRDeviceSetupAction, "actionWithData:error:supportsLegacy:", a3, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TRDeviceSetupPeripheral _authenticateWithAction:replyHandler:](self, "_authenticateWithAction:replyHandler:", v7, v6);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TRDeviceSetupPeripheral _setUpWithAction:replyHandler:](self, "_setUpWithAction:replyHandler:", v7, v6);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TRDeviceSetupPeripheral _legacyAuthenticateWithAction:attemptCount:replyHandler:](self, "_legacyAuthenticateWithAction:attemptCount:replyHandler:", v7, 0, v6);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_11:
    -[TRDeviceSetupPeripheral _cancelSetupWithAction:replyHandler:](self, "_cancelSetupWithAction:replyHandler:", v7, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_6:
      -[TRDeviceSetupPeripheral _finishSetupWithAction:replyHandler:](self, "_finishSetupWithAction:replyHandler:", v7, v6);
      goto LABEL_12;
    }
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Failed to handle action: %@. Error: %@", buf, 0x16u);
      }

    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1398];
    v16 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRDeviceSetupPeripheral _setupDidFailWithError:replyHandler:](self, "_setupDidFailWithError:replyHandler:", v13, v6);
  }
LABEL_12:
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Waiting for data to send...", buf, 2u);
    }

  }
  -[TRDeviceSetupPeripheral setPendingSendDataHandler:](self, "setPendingSendDataHandler:", v6);

}

- (void)_didTapWithSendDataHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  self->_preparingForSetup = 1;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __54__TRDeviceSetupPeripheral__didTapWithSendDataHandler___block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Waiting for data to send...", v7, 2u);
    }

  }
  -[TRDeviceSetupPeripheral setPendingSendDataHandler:](self, "setPendingSendDataHandler:", v4);

}

void __54__TRDeviceSetupPeripheral__didTapWithSendDataHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Got tap.", v6, 2u);
      }

    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v5, "deviceSetupPeripheralDidTap:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_legacyAuthenticateWithAction:(id)a3 attemptCount:(unint64_t)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a5;
  +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultAccountIDForAuthenticationAccountType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke;
  v15[3] = &unk_24C2E5D20;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = a4;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v10, "requestLegacyAuthenticationWithAccountID:completion:", v12, v15);

}

void __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20[2];
  id location;

  v7 = a3;
  v8 = a4;
  if (!a2)
    goto LABEL_6;
  if (!objc_msgSend(v7, "length") || !objc_msgSend(v8, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_legacyAuthenticateWithAction:attemptCount:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "length"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "userAgent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_2;
    v17[3] = &unk_24C2E5CF8;
    objc_copyWeak(v20, &location);
    v19 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    v14 = *(void **)(a1 + 56);
    v18 = v13;
    v20[1] = v14;
    objc_msgSend(v9, "_legacyAuthenticateWithUserAgent:deviceGUID:accountID:password:attemptCount:completion:", v10, v11, v7, v8, v12, v17);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_6:
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8102, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setupDidFailWithError:replyHandler:", v16, *(_QWORD *)(a1 + 48));

  }
LABEL_8:

}

void __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v22 = 0;
      v9 = objc_msgSend(WeakRetained, "_sendAction:sendDataHandler:error:", v5, v8, &v22);
      v10 = v22;
      v11 = v10;
      if ((v9 & 1) == 0)
      {
        v12 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BDD1398];
        v24[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "_setupDidFailWithError:replyHandler:", v14, *(_QWORD *)(a1 + 40));
        v11 = (void *)v14;
      }

    }
    else
    {
      +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_3;
      v18[3] = &unk_24C2E5CD0;
      v18[4] = v7;
      v16 = *(id *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 56);
      v19 = v16;
      v21 = v17;
      v20 = *(id *)(a1 + 40);
      objc_msgSend(v15, "presentLegacyAuthenticationFailedDialogWithMessage:completion:", 0, v18);

    }
  }

}

void __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_3(_QWORD *a1, int a2)
{
  dispatch_time_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint64_t v13;

  if (a2)
  {
    v3 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_4;
    block[3] = &unk_24C2E5CA8;
    v4 = (void *)a1[5];
    block[4] = a1[4];
    v5 = v4;
    v7 = (void *)a1[6];
    v6 = a1[7];
    v11 = v5;
    v13 = v6;
    v12 = v7;
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v8 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8102, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setupDidFailWithError:replyHandler:", v9, a1[6]);

  }
}

void *__83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_4(_QWORD *a1)
{
  void *result;

  result = (void *)a1[4];
  if (result)
    return (void *)objc_msgSend(result, "_legacyAuthenticateWithAction:attemptCount:replyHandler:", a1[5], a1[7] + 1, a1[6]);
  return result;
}

- (void)_authenticateWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "attemptCount"))
  {
    +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failureMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__TRDeviceSetupPeripheral__authenticateWithAction_replyHandler___block_invoke;
    v10[3] = &unk_24C2E5D48;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "presentAuthenticationFailureWithMessage:completion:", v9, v10);

  }
  else
  {
    -[TRDeviceSetupPeripheral _startAuthenticationWithReceivedAction:replyHandler:](self, "_startAuthenticationWithReceivedAction:replyHandler:", v6, v7);
  }

}

uint64_t __64__TRDeviceSetupPeripheral__authenticateWithAction_replyHandler___block_invoke(_QWORD *a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  if (a2)
    return objc_msgSend(v3, "_startAuthenticationWithReceivedAction:replyHandler:", v4, v5);
  else
    return objc_msgSend(v3, "_cancelAuthenticationWithReceivedAction:replyHandler:", v4, v5);
}

- (void)_startAuthenticationWithReceivedAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  TRDeviceSetupPeripheral *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultAccountIDForAuthenticationAccountType:", objc_msgSend(v6, "accountType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __79__TRDeviceSetupPeripheral__startAuthenticationWithReceivedAction_replyHandler___block_invoke;
  v20[3] = &unk_24C2E5D70;
  v10 = v6;
  v21 = v10;
  v22 = self;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x20BD22DF8](v20);
  if (objc_msgSend(v10, "accountType") == 2)
  {
    +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultAccountIDForAuthenticationAccountType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length")
      && (objc_msgSend(v9, "lowercaseString"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "lowercaseString"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "isEqualToString:", v16),
          v16,
          v15,
          v17))
    {
      +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "requestAppleIDAuthenticationWithAccountID:completion:", v9, v12);
    }
    else
    {
      +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "requestAuthenticationWithAccountID:message:completion:", v9, v19, v12);

    }
  }
  else
  {
    +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestAuthenticationWithAccountID:message:completion:", v9, v14, v12);
  }

}

void __79__TRDeviceSetupPeripheral__startAuthenticationWithReceivedAction_replyHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (a2)
  {
    if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "accountType") == 1)
        objc_msgSend(*(id *)(a1 + 40), "setAuthenticatediTunesStoreID:", v9);
      +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accountTypesWithDefaultAccountID:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[TRDeviceSetupAuthenticateAction actionForFinishedRequestWithOriginalAction:accountID:accountPassword:accountTypesWithSharedCredentials:](TRDeviceSetupAuthenticateAction, "actionForFinishedRequestWithOriginalAction:accountID:accountPassword:accountTypesWithSharedCredentials:", *(_QWORD *)(a1 + 32), v9, v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v22 = 0;
      v16 = objc_msgSend(v14, "_sendAction:sendDataHandler:error:", v13, v15, &v22);
      v17 = v22;
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BDD1398];
        v24[0] = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "_setupDidFailWithError:replyHandler:", v21, *(_QWORD *)(a1 + 48));
        v18 = (void *)v21;
      }

    }
    else
    {
      *a5 = 1;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_cancelAuthenticationWithReceivedAction:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)_cancelAuthenticationWithReceivedAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[TRDeviceSetupAuthenticateAction actionForCancelledRequestWithOriginalAction:](TRDeviceSetupAuthenticateAction, "actionForCancelledRequestWithOriginalAction:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = -[TRDeviceSetupPeripheral _sendAction:sendDataHandler:error:](self, "_sendAction:sendDataHandler:error:", v7, v6, &v14);
  v9 = v14;
  v10 = v9;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1398];
    v16[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRDeviceSetupPeripheral _setupDidFailWithError:replyHandler:](self, "_setupDidFailWithError:replyHandler:", v13, v6);

  }
}

- (void)_setUpWithAction:(id)a3 replyHandler:(id)a4
{
  id v4;
  TRDeviceSetupGeneralSetupAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TRDeviceSetupGeneralSetupAction *v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = [TRDeviceSetupGeneralSetupAction alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v24 = v4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeSharingAppleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeSharingGroupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TRDeviceSetupGeneralSetupAction initWithCountryCode:language:homeSharingID:homeSharingGroupID:isDiagnosticsEnabled:rememberPassword:](v5, "initWithCountryCode:language:homeSharingID:homeSharingGroupID:isDiagnosticsEnabled:rememberPassword:", v8, v10, v12, v14, 0, 0);

  if (v7)
  {

  }
  v25 = 0;
  v16 = -[TRDeviceSetupPeripheral _sendAction:sendDataHandler:error:](self, "_sendAction:sendDataHandler:error:", v15, v24, &v25);
  v17 = v25;
  v18 = v17;
  if (!v16)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD1398];
    v27[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8100, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    -[TRDeviceSetupPeripheral _setupDidFailWithError:replyHandler:](self, "_setupDidFailWithError:replyHandler:", v21, v24);
    v18 = (void *)v21;
  }

}

- (void)_finishSetupWithAction:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke;
  block[3] = &unk_24C2E5BD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_sendAction:sendDataHandler:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke_2;
    block[3] = &unk_24C2E4F08;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v3, block);

  }
}

void __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v4, "deviceSetupPeripheralSetupDidComplete:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_cancelSetupWithAction:(id)a3 replyHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("TRDeviceSetupErrorDomain"), -8104, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TRDeviceSetupPeripheral _setupDidFailWithError:replyHandler:](self, "_setupDidFailWithError:replyHandler:", v7, v6);

}

- (void)_setupDidFailWithError:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke;
  block[3] = &unk_24C2E5D98;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  TRDeviceSetupCancelAction *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 8))
  {
    *(_BYTE *)(v3 + 8) = 0;
    v4 = objc_alloc_init(TRDeviceSetupCancelAction);
    objc_msgSend(*(id *)(a1 + 32), "_sendAction:sendDataHandler:error:", v4, *(_QWORD *)(a1 + 48), 0);
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke_2;
    v7[3] = &unk_24C2E4F30;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    dispatch_async(v5, v7);

  }
}

void __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v4, "deviceSetupPeripheralSetupDidFail:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_sendAction:(id)a3 sendDataHandler:(id)a4 error:(id *)a5
{
  void (**v7)(id, void *);
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    objc_msgSend(a3, "dataRepresentationWithError:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 134217984;
          v13 = objc_msgSend(v8, "length");
          _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Data to send length: %ld", (uint8_t *)&v12, 0xCu);
        }

      }
      v7[2](v7, v8);
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_legacyAuthenticateWithUserAgent:(id)a3 deviceGUID:(id)a4 accountID:(id)a5 password:(id)a6 attemptCount:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  v14 = a8;
  v15 = (objc_class *)MEMORY[0x24BEB1F30];
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(v15);
  objc_msgSend(v19, "setURLBagKey:", CFSTR("authenticateAccount"));
  objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", v18, *MEMORY[0x24BEB2518]);

  objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  v28[0] = CFSTR("appleId");
  v28[1] = CFSTR("password");
  v29[0] = v16;
  v29[1] = v13;
  v28[2] = CFSTR("guid");
  v28[3] = CFSTR("why");
  v29[2] = v17;
  v29[3] = CFSTR("purchase");
  v29[4] = CFSTR("0");
  v28[4] = CFSTR("rmp");
  v28[5] = CFSTR("attempt");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRequestParameters:", v21);

  objc_msgSend(v19, "setITunesStoreRequest:", 1);
  objc_msgSend(v19, "setShouldProcessProtocol:", 0);
  objc_msgSend(v19, "setShouldSetCookies:", 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2000]), "initWithRequestProperties:", v19);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke;
  v25[3] = &unk_24C2E5DC0;
  v26 = v13;
  v27 = v14;
  v23 = v14;
  v24 = v13;
  objc_msgSend(v22, "startWithConnectionResponseBlock:", v25);

}

void __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  TRDeviceSetupLegacySetupAction *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TRDeviceSetupLegacySetupActionAuthInfo *v13;
  TRDeviceSetupLegacySetupAction *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *oslog;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  __int128 buf;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v29 = a3;
  if (objc_msgSend(v5, "statusCode") == 200)
  {
    objc_msgSend(v5, "allHeaderFields");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodyData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v26, 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("failureType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v28, "intValue"))
    {
      if (_TRLogEnabled != 1)
      {
        v7 = 0;
LABEL_24:

        goto LABEL_25;
      }
      TRLogHandle();
      oslog = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_20A2BF000, oslog, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Authentication failed: %@", (uint8_t *)&buf, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      v7 = 0;
      if (!v27 || !v6)
        goto LABEL_24;
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Authentication completed.", (uint8_t *)&buf, 2u);
        }

      }
      oslog = objc_msgSend(v6, "mutableCopy");
      -[NSObject setObject:forKey:](oslog, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("password"));
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v34 = 0x2020000000;
      v35 = 0;
      +[TRUserNotificationManager sharedInstance](TRUserNotificationManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke_150;
      v32[3] = &unk_24C2E5C38;
      v32[4] = &buf;
      objc_msgSend(v9, "requestPermissionForDiagnosticSubmissionWithCompletion:", v32);

      objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
      }

      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCAE8]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0;
      v31 = 0;
      TRGetCurrentWiFiNetwork(&v31, &v30);
      v21 = v31;
      v22 = v30;
      v13 = -[TRDeviceSetupLegacySetupActionAuthInfo initWithHeaders:body:]([TRDeviceSetupLegacySetupActionAuthInfo alloc], "initWithHeaders:body:", v27, oslog);
      v14 = [TRDeviceSetupLegacySetupAction alloc];
      v15 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeSharingAppleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRAccountsManager sharedInstance](TRAccountsManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "homeSharingGroupID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = 0;
      v7 = -[TRDeviceSetupLegacySetupAction initWithAuthInfo:networkSSID:networkPassword:diagnosticsEnabled:language:countryCode:homeSharingAppleID:homeSharingGroupID:rememberPassword:](v14, "initWithAuthInfo:networkSSID:networkPassword:diagnosticsEnabled:language:countryCode:homeSharingAppleID:homeSharingGroupID:rememberPassword:", v13, v21, v22, v15 != 0, v24, v23, v17, v19, v20);

      _Block_object_dispose(&buf, 8);
    }

    goto LABEL_24;
  }
  v7 = 0;
  v6 = 0;
LABEL_25:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke_150(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (TRDeviceSetupPeripheralDelegate)delegate
{
  return (TRDeviceSetupPeripheralDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)pendingSendDataHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setPendingSendDataHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)authenticatediTunesStoreID
{
  return self->_authenticatediTunesStoreID;
}

- (void)setAuthenticatediTunesStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatediTunesStoreID, 0);
  objc_storeStrong(&self->_pendingSendDataHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
