@implementation TRAuthenticationOperationHandler

- (TRAuthenticationOperationHandler)initWithCompanionAuthHandler:(id)a3 proxyAuthHandler:(id)a4
{
  id v6;
  id v7;
  TRAuthenticationOperationHandler *v8;
  TRCompanionAuthOperationHandler *v9;
  uint64_t v10;
  uint64_t v11;
  TRCompanionAuthOperationHandler *companionAuthHandler;
  TRProxyAuthOperationHandler *v13;
  uint64_t v14;
  TRProxyAuthOperationHandler *proxyAuthHandler;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TRAuthenticationOperationHandler;
  v8 = -[TRAuthenticationOperationHandler init](&v21, sel_init);
  if (v8)
  {
    v9 = [TRCompanionAuthOperationHandler alloc];
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke;
    v19[3] = &unk_24C2E5760;
    v20 = v6;
    v11 = -[TRCompanionAuthOperationHandler initWithCompanionAuthHandler:](v9, "initWithCompanionAuthHandler:", v19);
    companionAuthHandler = v8->_companionAuthHandler;
    v8->_companionAuthHandler = (TRCompanionAuthOperationHandler *)v11;

    v13 = [TRProxyAuthOperationHandler alloc];
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke_2;
    v17[3] = &unk_24C2E5760;
    v18 = v7;
    v14 = -[TRProxyAuthOperationHandler initWithProxyAuthHandler:](v13, "initWithProxyAuthHandler:", v17);
    proxyAuthHandler = v8->_proxyAuthHandler;
    v8->_proxyAuthHandler = (TRProxyAuthOperationHandler *)v14;

  }
  return v8;
}

uint64_t __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (TRAuthenticationOperationHandler)initWithCompanionAuthHandlerWithError:(id)a3 proxyAuthHandler:(id)a4
{
  id v6;
  id v7;
  TRAuthenticationOperationHandler *v8;
  TRCompanionAuthOperationHandler *v9;
  uint64_t v10;
  uint64_t v11;
  TRCompanionAuthOperationHandler *companionAuthHandler;
  TRProxyAuthOperationHandler *v13;
  uint64_t v14;
  TRProxyAuthOperationHandler *proxyAuthHandler;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TRAuthenticationOperationHandler;
  v8 = -[TRAuthenticationOperationHandler init](&v21, sel_init);
  if (v8)
  {
    v9 = [TRCompanionAuthOperationHandler alloc];
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke;
    v19[3] = &unk_24C2E5788;
    v20 = v6;
    v11 = -[TRCompanionAuthOperationHandler initWithCompanionAuthHandlerWithError:](v9, "initWithCompanionAuthHandlerWithError:", v19);
    companionAuthHandler = v8->_companionAuthHandler;
    v8->_companionAuthHandler = (TRCompanionAuthOperationHandler *)v11;

    v13 = [TRProxyAuthOperationHandler alloc];
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke_2;
    v17[3] = &unk_24C2E5788;
    v18 = v7;
    v14 = -[TRProxyAuthOperationHandler initWithProxyAuthHandlerWithError:](v13, "initWithProxyAuthHandlerWithError:", v17);
    proxyAuthHandler = v8->_proxyAuthHandler;
    v8->_proxyAuthHandler = (TRProxyAuthOperationHandler *)v14;

  }
  return v8;
}

uint64_t __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerMessageHandlersForSession:(id)a3
{
  TRCompanionAuthOperationHandler *companionAuthHandler;
  id v5;

  companionAuthHandler = self->_companionAuthHandler;
  v5 = a3;
  -[TRCompanionAuthOperationHandler registerMessageHandlersForSession:](companionAuthHandler, "registerMessageHandlersForSession:", v5);
  -[TRProxyAuthOperationHandler registerMessageHandlersForSession:](self->_proxyAuthHandler, "registerMessageHandlersForSession:", v5);

}

- (TRCompanionAuthOperationHandler)companionAuthHandler
{
  return self->_companionAuthHandler;
}

- (void)setCompanionAuthHandler:(id)a3
{
  objc_storeStrong((id *)&self->_companionAuthHandler, a3);
}

- (TRProxyAuthOperationHandler)proxyAuthHandler
{
  return self->_proxyAuthHandler;
}

- (void)setProxyAuthHandler:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAuthHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAuthHandler, 0);
  objc_storeStrong((id *)&self->_companionAuthHandler, 0);
}

@end
