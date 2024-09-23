@implementation TRNetworkOperationHandler

- (TRNetworkOperationHandler)initWithJoinNetworkHandler:(id)a3
{
  id v4;
  TRNetworkOperationHandler *v5;
  uint64_t v6;
  id joinNetworkHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRNetworkOperationHandler;
  v5 = -[TRNetworkOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    joinNetworkHandler = v5->_joinNetworkHandler;
    v5->_joinNetworkHandler = (id)v6;

  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__TRNetworkOperationHandler_registerMessageHandlersForSession___block_invoke;
  v5[3] = &unk_24C2E54E0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setRequestHandler:forRequestClass:", v5, objc_opt_class());
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __63__TRNetworkOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleNetworkRequest:withResponseHandler:", v7, v5);

}

- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**joinNetworkHandler)(id, void *, _QWORD *);
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_joinNetworkHandler)
  {
    objc_msgSend(v6, "networkSSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "networkPassword");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("TRNetworkOperationHandlerParamKeyNetworkSSID"));
      if (v9)
        objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("TRNetworkOperationHandlerParamKeyNetworkSSID"));
      v11 = (void *)objc_msgSend(v10, "copy");
      joinNetworkHandler = (void (**)(id, void *, _QWORD *))self->_joinNetworkHandler;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __71__TRNetworkOperationHandler__handleNetworkRequest_withResponseHandler___block_invoke;
      v14[3] = &unk_24C2E51B0;
      v15 = v7;
      joinNetworkHandler[2](joinNetworkHandler, v11, v14);

    }
    else
    {
      v13 = *MEMORY[0x24BDD0FD8];
      v16[0] = *MEMORY[0x24BDD0FC8];
      v16[1] = v13;
      v17[0] = CFSTR("Invalid Message Parameters");
      v17[1] = CFSTR("Missing SSID parameter");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10002, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v11, 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v8, 0);
  }

}

void __71__TRNetworkOperationHandler__handleNetworkRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  TRSetupNetworkResponse *v4;

  v4 = objc_alloc_init(TRSetupNetworkResponse);
  -[TRSetupNetworkResponse setHasNetwork:](v4, "setHasNetwork:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)joinNetworkHandler
{
  return self->_joinNetworkHandler;
}

- (void)setJoinNetworkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_joinNetworkHandler, 0);
}

@end
