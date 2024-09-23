@implementation TRCompletionOperationHandler

- (TRCompletionOperationHandler)initWithCompletionHandler:(id)a3
{
  id v4;
  TRCompletionOperationHandler *v5;
  uint64_t v6;
  id completionHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRCompletionOperationHandler;
  v5 = -[TRCompletionOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v6;

  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__TRCompletionOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_24C2E4DC8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", v4, objc_opt_class());

}

uint64_t __66__TRCompletionOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletionRequest:withResponseHandler:", a2, a3);
}

- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4
{
  void (**v6)(id, _QWORD, TRSetupCompletionResponse *);
  TRSetupCompletionResponse *v7;
  void *v8;
  void (**v9)(id, TRSetupCompletionResponse *, _QWORD);
  id v10;

  v10 = a3;
  if (self->_completionHandler)
  {
    v6 = (void (**)(id, _QWORD, TRSetupCompletionResponse *))a4;
    v7 = objc_alloc_init(TRSetupCompletionResponse);
    v6[2](v6, 0, v7);

    objc_msgSend(v10, "completedSuccessfully");
    objc_msgSend(v10, "errorCode");
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = (void (**)(id, TRSetupCompletionResponse *, _QWORD))a4;
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v7 = (TRSetupCompletionResponse *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v7, 0);

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
