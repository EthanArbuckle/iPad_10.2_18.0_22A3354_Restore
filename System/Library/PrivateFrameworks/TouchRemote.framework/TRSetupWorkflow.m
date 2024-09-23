@implementation TRSetupWorkflow

+ (void)initialize
{
  _TRLogEnabled = 1;
  _TRLogVerboseEnabled = 1;
}

- (TRSetupWorkflow)initWithNearbyDevice:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  TRSetupWorkflow *v9;
  TRSetupWorkflow *v10;
  TROperationQueue *v11;
  TROperationQueue *operationQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRSetupWorkflow;
  v9 = -[TRSetupWorkflow init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nearbyDevice, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
    v10->_state = 1;
    v11 = objc_alloc_init(TROperationQueue);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

  }
  return v10;
}

- (void)start
{
  TRSession *v3;
  void *v4;
  uint64_t v5;
  TRNearbyDeviceScanner *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[TRSetupWorkflow state](self, "state") != 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("TRSetupWorkflow is already started."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[TRSetupWorkflow setState:](self, "setState:", 2);
  v3 = -[TRSession initWithNearbyDevice:]([TRSession alloc], "initWithNearbyDevice:", self->_nearbyDevice);
  -[TRSetupWorkflow setSession:](self, "setSession:", v3);

  objc_initWeak(&location, self);
  -[TRSetupWorkflow session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __24__TRSetupWorkflow_start__block_invoke;
  v11[3] = &unk_24C2E5278;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "setDisconnectHandler:", v11);

  v6 = objc_alloc_init(TRNearbyDeviceScanner);
  -[TRSetupWorkflow session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __24__TRSetupWorkflow_start__block_invoke_2;
  v9[3] = &unk_24C2E52A0;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  -[TRNearbyDeviceScanner openSession:withCompletion:](v6, "openSession:withCompletion:", v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __24__TRSetupWorkflow_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_abortSetupWithErrorCode:userInfo:", -9104, 0);

}

void __24__TRSetupWorkflow_start__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void (**v8)(void);
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "state") != 2)
  {
    if (_TRLogEnabled != 1)
      goto LABEL_16;
    TRLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[TRSetupWorkflow start]_block_invoke_2";
      _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "%s Workflow stopped", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("TRNearbyDeviceErrorDomain")))
    {
      v11 = objc_msgSend(v5, "code");

      if (v11 == -9100)
      {
        v16 = *MEMORY[0x24BDD1398];
        v17 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        v12 = WeakRetained;
        v13 = -9100;
LABEL_14:
        objc_msgSend(v12, "_abortSetupWithErrorCode:userInfo:", v13, v9);
        goto LABEL_15;
      }
    }
    else
    {

    }
    v14 = *MEMORY[0x24BDD1398];
    v15 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = WeakRetained;
    v13 = -9104;
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "startedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "startedHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  objc_msgSend(WeakRetained, "_performHandshakeOperation");
LABEL_16:

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[TRSetupWorkflow cancel]";
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Cancelling setup workflow", (uint8_t *)&v5, 0xCu);
    }

  }
  -[TRSetupWorkflow operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)_performHandshakeOperation
{
  TRHandshakeOperation *v3;
  void *v4;
  TRHandshakeOperation *v5;
  void *v6;
  _QWORD v7[5];

  v3 = [TRHandshakeOperation alloc];
  -[TRSetupWorkflow session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TROperation initWithSession:](v3, "initWithSession:", v4);

  -[TRHandshakeOperation setProtocolVersion:](v5, "setProtocolVersion:", 0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__TRSetupWorkflow__performHandshakeOperation__block_invoke;
  v7[3] = &unk_24C2E4F08;
  v7[4] = self;
  -[TRHandshakeOperation setCompletionBlock:](v5, "setCompletionBlock:", v7);
  -[TRSetupWorkflow operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

}

uint64_t __45__TRSetupWorkflow__performHandshakeOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performConfigurationOperation");
}

- (void)_performConfigurationOperation
{
  void *v3;
  void (**v4)(void);
  TRSetupConfigurationOperation *v5;
  void *v6;
  TRSetupConfigurationOperation *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  -[TRSetupWorkflow configurationStageStartedHandler](self, "configurationStageStartedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TRSetupWorkflow configurationStageStartedHandler](self, "configurationStageStartedHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  v5 = [TRSetupConfigurationOperation alloc];
  -[TRSetupWorkflow session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TROperation initWithSession:](v5, "initWithSession:", v6);

  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__TRSetupWorkflow__performConfigurationOperation__block_invoke;
  v9[3] = &unk_24C2E52C8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  -[TRSetupConfigurationOperation setCompletionBlock:](v7, "setCompletionBlock:", v9);
  -[TRSetupWorkflow operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __49__TRSetupWorkflow__performConfigurationOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("TRSetupConfigurationOperationNeedsNetworkKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    objc_msgSend(WeakRetained, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("TRSetupConfigurationOperationUnauthenticatedServicesKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setUnauthenticatedAccountServices:", v7);
    v8 = *(void **)(a1 + 32);
    if (v5)
      objc_msgSend(v8, "_performNetworkOperation");
    else
      objc_msgSend(v8, "_performActivationOperation");
  }
  else
  {
    objc_msgSend(WeakRetained, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v7, "code"), 0);
  }

}

- (void)_performNetworkOperation
{
  TRNetworkOperation *v3;
  void *v4;
  TRNetworkOperation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TRSetupWorkflow *v12;
  id v13;
  id location;
  _QWORD v15[5];

  v3 = [TRNetworkOperation alloc];
  -[TRSetupWorkflow session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TROperation initWithSession:](v3, "initWithSession:", v4);

  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__TRSetupWorkflow__performNetworkOperation__block_invoke;
  v15[3] = &unk_24C2E52F0;
  v15[4] = self;
  -[TRNetworkOperation setSendingWiFiInfoHandler:](v5, "setSendingWiFiInfoHandler:", v15);
  objc_initWeak(&location, v5);
  v8 = v6;
  v9 = 3221225472;
  v10 = __43__TRSetupWorkflow__performNetworkOperation__block_invoke_2;
  v11 = &unk_24C2E52C8;
  objc_copyWeak(&v13, &location);
  v12 = self;
  -[TRNetworkOperation setCompletionBlock:](v5, "setCompletionBlock:", &v8);
  -[TRSetupWorkflow operationQueue](self, "operationQueue", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __43__TRSetupWorkflow__performNetworkOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "networkStageStartedHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __43__TRSetupWorkflow__performNetworkOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TRNetworkOperationHasNetworkKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performActivationOperation");
  }
  else
  {
    objc_msgSend(WeakRetained, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v5, "code"), 0);

  }
}

- (void)_performActivationOperation
{
  void *v3;
  void (**v4)(void);
  TRActivationOperation *v5;
  void *v6;
  TRActivationOperation *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  -[TRSetupWorkflow activationStageStartedHandler](self, "activationStageStartedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TRSetupWorkflow activationStageStartedHandler](self, "activationStageStartedHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  v5 = [TRActivationOperation alloc];
  -[TRSetupWorkflow session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TROperation initWithSession:](v5, "initWithSession:", v6);

  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__TRSetupWorkflow__performActivationOperation__block_invoke;
  v9[3] = &unk_24C2E52C8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  -[TRActivationOperation setCompletionBlock:](v7, "setCompletionBlock:", v9);
  -[TRSetupWorkflow operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __46__TRSetupWorkflow__performActivationOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TRActivationOperationIsActivatedKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performAuthenticationOperation");
  }
  else
  {
    objc_msgSend(WeakRetained, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v5, "code"), 0);

  }
}

- (void)_performAuthenticationOperation
{
  TRAuthenticationOperation *v3;
  void *v4;
  TRAuthenticationOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v3 = [TRAuthenticationOperation alloc];
  -[TRSetupWorkflow session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TROperation initWithSession:](v3, "initWithSession:", v4);

  -[TRSetupWorkflow unauthenticatedAccountServices](self, "unauthenticatedAccountServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAuthenticationOperation setTargetedServices:](v5, "setTargetedServices:", v6);

  -[TRSetupWorkflow presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAuthenticationOperation setPresentingViewController:](v5, "setPresentingViewController:", v7);

  objc_initWeak(&location, v5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__TRSetupWorkflow__performAuthenticationOperation__block_invoke;
  v9[3] = &unk_24C2E52C8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  -[TRAuthenticationOperation setCompletionBlock:](v5, "setCompletionBlock:", v9);
  -[TRSetupWorkflow operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __50__TRSetupWorkflow__performAuthenticationOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performCompletionOperation");
  }
  else
  {
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_abortSetupWithErrorCode:userInfo:", objc_msgSend(v3, "code"), 0);

  }
}

- (void)_performCompletionOperation
{
  NSObject *v3;
  TRCompletionOperation *v4;
  void *v5;
  TRCompletionOperation *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[TRSetupWorkflow _performCompletionOperation]";
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Completion Request", buf, 0xCu);
    }

  }
  v4 = [TRCompletionOperation alloc];
  -[TRSetupWorkflow session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TROperation initWithSession:](v4, "initWithSession:", v5);

  -[TRCompletionOperation setSuccess:](v6, "setSuccess:", 1);
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__TRSetupWorkflow__performCompletionOperation__block_invoke;
  v8[3] = &unk_24C2E5278;
  objc_copyWeak(&v9, (id *)buf);
  -[TRCompletionOperation setCompletionBlock:](v6, "setCompletionBlock:", v8);
  -[TRSetupWorkflow operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __46__TRSetupWorkflow__performCompletionOperation__block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "completionHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
  objc_msgSend(WeakRetained, "_releaseHandlers");
  objc_msgSend(WeakRetained, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisconnectHandler:", 0);

  objc_msgSend(WeakRetained, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnect");

  objc_msgSend(WeakRetained, "setSession:", 0);
}

- (void)_abortSetupWithErrorCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  TRCompletionOperation *v11;
  void *v12;
  TRCompletionOperation *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[TRSetupWorkflow state](self, "state") == 2)
  {
    -[TRSetupWorkflow setState:](self, "setState:", 3);
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[TRSetupWorkflow _abortSetupWithErrorCode:userInfo:]";
        v21 = 2048;
        v22 = a3;
        _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s Aborting setup with error code: %ld", buf, 0x16u);
      }

    }
    if (a3 == -10001)
    {
      -[TRSetupWorkflow _releaseHandlers](self, "_releaseHandlers");
      a3 = -10001;
LABEL_14:
      v11 = [TRCompletionOperation alloc];
      -[TRSetupWorkflow session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[TROperation initWithSession:](v11, "initWithSession:", v12);

      -[TRCompletionOperation setSuccess:](v13, "setSuccess:", 0);
      -[TRCompletionOperation setErrorCode:](v13, "setErrorCode:", a3);
      -[TRSetupWorkflow session](self, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisconnectHandler:", 0);
      -[TRSetupWorkflow setSession:](self, "setSession:", 0);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __53__TRSetupWorkflow__abortSetupWithErrorCode_userInfo___block_invoke;
      v17[3] = &unk_24C2E4F08;
      v18 = v14;
      v15 = v14;
      -[TRCompletionOperation setCompletionBlock:](v13, "setCompletionBlock:", v17);
      -[TRSetupWorkflow operationQueue](self, "operationQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addOperation:", v13);

      goto LABEL_15;
    }
    if (a3 == -11000)
      a3 = -8003;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRSetupWorkflow failureHandler](self, "failureHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TRSetupWorkflow failureHandler](self, "failureHandler");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v8);

    }
    -[TRSetupWorkflow _releaseHandlers](self, "_releaseHandlers");
    if ((a3 | 4) != 0xFFFFFFFFFFFFDC74)
      goto LABEL_14;
    -[TRSetupWorkflow setSession:](self, "setSession:", 0);
  }
LABEL_15:

}

uint64_t __53__TRSetupWorkflow__abortSetupWithErrorCode_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

- (void)_releaseHandlers
{
  -[TRSetupWorkflow setStartedHandler:](self, "setStartedHandler:", 0);
  -[TRSetupWorkflow setConfigurationStageStartedHandler:](self, "setConfigurationStageStartedHandler:", 0);
  -[TRSetupWorkflow setNetworkStageStartedHandler:](self, "setNetworkStageStartedHandler:", 0);
  -[TRSetupWorkflow setActivationStageStartedHandler:](self, "setActivationStageStartedHandler:", 0);
  -[TRSetupWorkflow setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[TRSetupWorkflow setFailureHandler:](self, "setFailureHandler:", 0);
}

- (id)startedHandler
{
  return self->_startedHandler;
}

- (void)setStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)configurationStageStartedHandler
{
  return self->_configurationStageStartedHandler;
}

- (void)setConfigurationStageStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)networkStageStartedHandler
{
  return self->_networkStageStartedHandler;
}

- (void)setNetworkStageStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)activationStageStartedHandler
{
  return self->_activationStageStartedHandler;
}

- (void)setActivationStageStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (void)setFailureHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TRNearbyDevice)nearbyDevice
{
  return self->_nearbyDevice;
}

- (void)setNearbyDevice:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevice, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (TRSession)session
{
  return (TRSession *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSSet)unauthenticatedAccountServices
{
  return self->_unauthenticatedAccountServices;
}

- (void)setUnauthenticatedAccountServices:(id)a3
{
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (TROperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_nearbyDevice, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_activationStageStartedHandler, 0);
  objc_storeStrong(&self->_networkStageStartedHandler, 0);
  objc_storeStrong(&self->_configurationStageStartedHandler, 0);
  objc_storeStrong(&self->_startedHandler, 0);
}

@end
