@implementation TRActivationOperationHandler

- (TRActivationOperationHandler)initWithActivationHandler:(id)a3
{
  id v4;
  TRActivationOperationHandler *v5;
  uint64_t v6;
  id activationHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRActivationOperationHandler;
  v5 = -[TRActivationOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    activationHandler = v5->_activationHandler;
    v5->_activationHandler = (id)v6;

  }
  return v5;
}

- (TRActivationOperationHandler)initWithActivationHandlerWithError:(id)a3
{
  id v4;
  TRActivationOperationHandler *v5;
  uint64_t v6;
  id activationHandlerWithError;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRActivationOperationHandler;
  v5 = -[TRActivationOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    activationHandlerWithError = v5->_activationHandlerWithError;
    v5->_activationHandlerWithError = (id)v6;

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
  v5[2] = __66__TRActivationOperationHandler_registerMessageHandlersForSession___block_invoke;
  v5[3] = &unk_24C2E54E0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setRequestHandler:forRequestClass:", v5, objc_opt_class());
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __66__TRActivationOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleActivationRequest:withResponseHandler:", v7, v5);

}

- (void)_handleActivationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**activationHandler)(id, _QWORD *);
  void (**activationHandlerWithError)(id, _QWORD *);
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD, _QWORD);
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  activationHandler = (void (**)(id, _QWORD *))self->_activationHandler;
  activationHandlerWithError = (void (**)(id, _QWORD *))self->_activationHandlerWithError;
  v11 = MEMORY[0x24BDAC760];
  if (activationHandler)
  {
    if (!activationHandlerWithError)
      goto LABEL_6;
  }
  else if (!activationHandlerWithError)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v12, 0);

    goto LABEL_7;
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__TRActivationOperationHandler__handleActivationRequest_withResponseHandler___block_invoke;
  v15[3] = &unk_24C2E51D8;
  v16 = v7;
  activationHandlerWithError[2](activationHandlerWithError, v15);

  activationHandler = (void (**)(id, _QWORD *))self->_activationHandler;
LABEL_6:
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __77__TRActivationOperationHandler__handleActivationRequest_withResponseHandler___block_invoke_2;
  v13[3] = &unk_24C2E51B0;
  v14 = v8;
  activationHandler[2](activationHandler, v13);

LABEL_7:
}

void __77__TRActivationOperationHandler__handleActivationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  TRSetupActivationResponse *v6;

  v5 = a3;
  v6 = objc_alloc_init(TRSetupActivationResponse);
  -[TRSetupActivationResponse setActivated:](v6, "setActivated:", a2);
  -[TRSetupActivationResponse setError:](v6, "setError:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__TRActivationOperationHandler__handleActivationRequest_withResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  TRSetupActivationResponse *v4;

  v4 = objc_alloc_init(TRSetupActivationResponse);
  -[TRSetupActivationResponse setActivated:](v4, "setActivated:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)activationHandlerWithError
{
  return self->_activationHandlerWithError;
}

- (void)setActivationHandlerWithError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationHandlerWithError, 0);
  objc_storeStrong(&self->_activationHandler, 0);
}

@end
