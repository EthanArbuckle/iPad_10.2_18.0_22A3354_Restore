@implementation TSProximityTargetTransferFlow

- (TSProximityTargetTransferFlow)initWithTransferBackPlan:(id)a3
{
  id v5;
  TSProximityTargetTransferFlow *v6;
  uint64_t v7;
  UIBarButtonItem *cancelButton;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSProximityTargetTransferFlow;
  v6 = -[TSSIMSetupFlow init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel_userDidTapCancel);
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = (UIBarButtonItem *)v7;

    v6->_backgroundTask = *MEMORY[0x24BEBE030];
    objc_storeStrong(&v6->_transferBackPlan, a3);
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TSProximityTargetTransferFlow dealloc]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "end target proximity flow @%s", buf, 0xCu);
  }

  -[TSProximityTargetTransferFlow _stopBackgroundTask](self, "_stopBackgroundTask");
  -[TSProximityTargetTransferFlow _endAdvertising](self, "_endAdvertising");
  v4.receiver = self;
  v4.super_class = (Class)TSProximityTargetTransferFlow;
  -[TSProximityTargetTransferFlow dealloc](&v4, sel_dealloc);
}

- (id)firstViewController
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[TSProximityTargetTransferFlow firstViewController].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)firstViewController:(id)a3
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
  v6[2] = __53__TSProximityTargetTransferFlow_firstViewController___block_invoke;
  v6[3] = &unk_24DEF3EE8;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[TSProximityTargetTransferFlow _beginAdvertising:](self, "_beginAdvertising:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __53__TSProximityTargetTransferFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v3;
      v10 = 2080;
      v11 = "-[TSProximityTargetTransferFlow firstViewController:]_block_invoke";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "activate bt server failed : %@ @%s", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_firstViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  TSProximityPINCodeViewController *v5;
  void *v6;
  TSSubFlowViewController *v7;
  NSObject *transferBackPlan;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    -[SSProximityDevice templateSession](self->_btServer, "templateSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [TSSubFlowViewController alloc];
      v20[0] = CFSTR("FlowTypeKey");
      v20[1] = CFSTR("MessageSessionKey");
      v21[0] = &unk_24DF23818;
      v21[1] = v6;
      v20[2] = CFSTR("HasTransferablePlan");
      v20[3] = CFSTR("IsStandaloneProximityTransfer");
      v21[2] = MEMORY[0x24BDBD1C8];
      v21[3] = MEMORY[0x24BDBD1C8];
      v20[4] = CFSTR("TransferBackPlan");
      transferBackPlan = self->_transferBackPlan;
      v9 = transferBackPlan;
      if (!transferBackPlan)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v21[4] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[TSSubFlowViewController initWithOptions:navigationController:](v7, "initWithOptions:navigationController:", v10, v11);

      if (transferBackPlan)
      {
LABEL_15:

        if (v5)
          goto LABEL_17;
LABEL_16:
        -[TSProximityTargetTransferFlow _endAdvertising](self, "_endAdvertising");
        -[TSProximityTargetTransferFlow _stopBackgroundTask](self, "_stopBackgroundTask");
        v5 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TSProximityTargetTransferFlow nextViewControllerFrom:].cold.1(v9, v12, v13, v14, v15, v16, v17, v18);
      v5 = 0;
    }

    goto LABEL_15;
  }
  if (!-[NSString length](self->_pin, "length"))
    goto LABEL_16;
  v5 = -[TSProximityPINCodeViewController initWithPIN:]([TSProximityPINCodeViewController alloc], "initWithPIN:", self->_pin);
  if (!v5)
    goto LABEL_16;
LABEL_17:

  return v5;
}

- (void)userDidTapCancel
{
  objc_super v3;

  -[TSProximityTargetTransferFlow _endAdvertising](self, "_endAdvertising");
  v3.receiver = self;
  v3.super_class = (Class)TSProximityTargetTransferFlow;
  -[TSSIMSetupFlow userDidTapCancel](&v3, sel_userDidTapCancel);
}

- (void)attemptFailed
{
  objc_super v3;

  -[TSProximityTargetTransferFlow _endAdvertising](self, "_endAdvertising");
  v3.receiver = self;
  v3.super_class = (Class)TSProximityTargetTransferFlow;
  -[TSSIMSetupFlow attemptFailed](&v3, sel_attemptFailed);
}

- (void)appForegrounded
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSProximityTargetTransferFlow;
  -[TSSIMSetupFlow appForegrounded](&v6, sel_appForegrounded);
  if (!-[TSSIMSetupFlow isFlowFinished](self, "isFlowFinished") && !self->_btServer)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke;
    v3[3] = &unk_24DEF3188;
    objc_copyWeak(&v4, &location);
    -[TSProximityTargetTransferFlow _beginAdvertising:](self, "_beginAdvertising:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  id v7;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke_cold_1();

    v5 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v5);
    objc_msgSend(WeakRetained, "_endAdvertising");

    v7 = objc_loadWeakRetained(v5);
    objc_msgSend(v7, "attemptFailed");

  }
}

- (void)appBackgrounded
{
  void *v3;
  char isKindOfClass;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSProximityTargetTransferFlow;
  -[TSSIMSetupFlow appBackgrounded](&v5, sel_appBackgrounded);
  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[TSProximityTargetTransferFlow _endAdvertising](self, "_endAdvertising");
}

- (void)_beginAdvertising:(id)a3
{
  id v4;
  SSProximityDevice *v5;
  SSProximityDevice *v6;
  SSProximityDevice *btServer;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [SSProximityDevice alloc];
  v6 = -[SSProximityDevice initWithQueue:endpoint:remoteInfo:](v5, "initWithQueue:endpoint:remoteInfo:", MEMORY[0x24BDAC9B8], 2, 0);
  btServer = self->_btServer;
  self->_btServer = v6;

  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __51__TSProximityTargetTransferFlow__beginAdvertising___block_invoke;
  v12 = &unk_24DEF3E18;
  objc_copyWeak(&v13, &location);
  -[SSProximityDevice setEventHandler:](self->_btServer, "setEventHandler:", &v9);
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[TSProximityTargetTransferFlow _beginAdvertising:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "activate server @%s", buf, 0xCu);
  }

  -[SSProximityDevice activate:](self->_btServer, "activate:", v4, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __51__TSProximityTargetTransferFlow__beginAdvertising___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSKEvent:", v3);

}

- (void)_endAdvertising
{
  NSObject *v3;
  SSProximityDevice *btServer;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSProximityTargetTransferFlow _endAdvertising]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "invalidate server @%s", (uint8_t *)&v5, 0xCu);
  }

  -[SSProximityDevice invalidate:](self->_btServer, "invalidate:", 0);
  btServer = self->_btServer;
  self->_btServer = 0;

}

- (void)_handleSKEvent:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSString *v11;
  NSString *pin;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  char v18;
  int v19;
  id v20;
  __int16 v21;
  _WORD v22[17];

  *(_QWORD *)&v22[13] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v4;
    v21 = 2080;
    *(_QWORD *)v22 = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "receive SKEvent:%@ @%s", (uint8_t *)&v19, 0x16u);
  }

  v6 = objc_msgSend(v4, "eventType");
  if (v6 == 140)
  {
    objc_msgSend(v4, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v7 = objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v7);
LABEL_19:

    }
  }
  else if (v6 == 110)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject password](v7, "password");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSObject passwordType](v7, "passwordType");
        v19 = 138412802;
        v20 = v9;
        v21 = 1024;
        *(_DWORD *)v22 = v10;
        v22[2] = 2080;
        *(_QWORD *)&v22[3] = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
        _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "pairing code:%@, type:%d @%s", (uint8_t *)&v19, 0x1Cu);

      }
      -[NSObject password](v7, "password");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      pin = self->_pin;
      self->_pin = v11;

      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if ((isKindOfClass & 1) != 0)
      {
        -[NSObject updatePIN:](v15, "updatePIN:", self->_pin);
      }
      else
      {
        objc_opt_class();
        v18 = objc_opt_isKindOfClass();

        if ((v18 & 1) != 0)
        {
          -[TSSIMSetupFlow topViewController](self, "topViewController");
          v16 = objc_claimAutoreleasedReturnValue();
          -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v16);
        }
        else
        {
          _TSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[TSProximityTargetTransferFlow _handleSKEvent:].cold.1(self, v16);
        }
      }

    }
    else
    {
      _TSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TSProximityTargetTransferFlow _handleSKEvent:].cold.2(v4, v7);
    }
    goto LABEL_19;
  }

}

- (void)setDefaultNavigationItems:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  UIBarButtonItem *cancelButton;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = +[TSUtilities isPad](TSUtilities, "isPad");
  objc_msgSend(v12, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  cancelButton = self->_cancelButton;
  if (v4)
    objc_msgSend(v5, "setRightBarButtonItem:", cancelButton);
  else
    objc_msgSend(v5, "setLeftBarButtonItem:", cancelButton);

  objc_msgSend(v12, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidesBackButton:animated:", 1, 0);

  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(v12, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

  }
}

- (id)_firstViewController
{
  TSProximityWaitingViewController *v3;
  SSProximityDevice *btServer;
  void *v5;
  TSProximityWaitingViewController *v6;
  NSObject *v7;
  int v9;
  TSProximityWaitingViewController *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TSProximityTargetTransferFlow _startBackgroundTask](self, "_startBackgroundTask");
  v3 = [TSProximityWaitingViewController alloc];
  btServer = self->_btServer;
  objc_msgSend(self->_transferBackPlan, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSProximityWaitingViewController initWithBTServer:transferBackPhoneNumber:](v3, "initWithBTServer:transferBackPhoneNumber:", btServer, v5);

  -[TSProximityWaitingViewController setDelegate:](v6, "setDelegate:", self);
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v6);
  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2080;
    v12 = "-[TSProximityTargetTransferFlow _firstViewController]";
    _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)_startBackgroundTask
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (*MEMORY[0x24BEBE030] == self->_backgroundTask)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __53__TSProximityTargetTransferFlow__startBackgroundTask__block_invoke;
    v4[3] = &unk_24DEF29F8;
    objc_copyWeak(&v5, &location);
    self->_backgroundTask = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __53__TSProximityTargetTransferFlow__startBackgroundTask__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSProximityTargetTransferFlow _startBackgroundTask]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "background task expired @%s", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopBackgroundTask");

}

- (void)_stopBackgroundTask
{
  unint64_t v2;
  void *v4;

  v2 = *MEMORY[0x24BEBE030];
  if (*MEMORY[0x24BEBE030] != self->_backgroundTask)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", self->_backgroundTask);

    self->_backgroundTask = v2;
  }
}

- (SSProximityDevice)btServer
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBtServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)pin
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setTransferBackPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_btServer, 0);
}

- (void)firstViewController
{
  OUTLINED_FUNCTION_1_0();
}

- (void)nextViewControllerFrom:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid template session @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __48__TSProximityTargetTransferFlow_appForegrounded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSProximityTargetTransferFlow appForegrounded]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]bt advertising failed : %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleSKEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  v6 = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, v4, "[E]unexpect top view controller : %@ @%s", v5);

}

- (void)_handleSKEvent:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  _DWORD v4[2];
  __int16 v5;
  void *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109634;
  v4[1] = objc_msgSend(a1, "eventType");
  v5 = 2112;
  v6 = a1;
  v7 = 2080;
  v8 = "-[TSProximityTargetTransferFlow _handleSKEvent:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]invalid SKEvent class for event : %d : %@ @%s", (uint8_t *)v4, 0x1Cu);
}

@end
