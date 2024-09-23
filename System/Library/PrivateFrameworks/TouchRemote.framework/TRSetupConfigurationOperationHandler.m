@implementation TRSetupConfigurationOperationHandler

- (TRSetupConfigurationOperationHandler)initWithConfigurationHandler:(id)a3
{
  id v4;
  TRSetupConfigurationOperationHandler *v5;
  uint64_t v6;
  id configurationHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupConfigurationOperationHandler;
  v5 = -[TRSetupConfigurationOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x20BD22DF8](v4);
    configurationHandler = v5->_configurationHandler;
    v5->_configurationHandler = (id)v6;

  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__TRSetupConfigurationOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_24C2E4DC8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", v4, objc_opt_class());

}

uint64_t __74__TRSetupConfigurationOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConfigurationRequest:withResponseHandler:", a2, a3);
}

- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**configurationHandler)(id, void *, _QWORD *);
  _QWORD v12[4];
  id v13;

  v6 = a4;
  if (self->_configurationHandler)
  {
    objc_msgSend(a3, "deviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("TRSetupConfigurationOperationHandlerParamKeyDeviceName"));
    v10 = (void *)objc_msgSend(v9, "copy");
    configurationHandler = (void (**)(id, void *, _QWORD *))self->_configurationHandler;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__TRSetupConfigurationOperationHandler__handleConfigurationRequest_withResponseHandler___block_invoke;
    v12[3] = &unk_24C2E4FB0;
    v13 = v6;
    configurationHandler[2](configurationHandler, v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v7, 0);
  }

}

void __88__TRSetupConfigurationOperationHandler__handleConfigurationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  TRSetupConfigurationResponse *v6;

  v5 = a3;
  v6 = objc_alloc_init(TRSetupConfigurationResponse);
  -[TRSetupConfigurationResponse setNeedsNetwork:](v6, "setNeedsNetwork:", a2);
  -[TRSetupConfigurationResponse setUnauthenticatedAccountServices:](v6, "setUnauthenticatedAccountServices:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)configurationHandler
{
  return self->_configurationHandler;
}

- (void)setConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationHandler, 0);
}

@end
