@implementation TRHandshakeOperationHandler

- (TRHandshakeOperationHandler)initWithHandshakeHandler:(id)a3
{
  id v4;
  TRHandshakeOperationHandler *v5;
  uint64_t v6;
  id handshakeHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRHandshakeOperationHandler;
  v5 = -[TRHandshakeOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handshakeHandler = v5->_handshakeHandler;
    v5->_handshakeHandler = (id)v6;

  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__TRHandshakeOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_24C2E4DC8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", v4, objc_opt_class());

}

uint64_t __65__TRHandshakeOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleHandshakeRequest:withResponseHandler:", a2, a3);
}

- (void)_handleHandshakeRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**handshakeHandler)(id, void *, _QWORD *);
  void *v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_handshakeHandler)
  {
    v13 = CFSTR("TRHandshakeOperationHandlerParamKeyProtocolVersion");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "protocolVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    handshakeHandler = (void (**)(id, void *, _QWORD *))self->_handshakeHandler;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __75__TRHandshakeOperationHandler__handleHandshakeRequest_withResponseHandler___block_invoke;
    v11[3] = &unk_24C2E5728;
    v12 = v6;
    handshakeHandler[2](handshakeHandler, v8, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v10, 0);

  }
}

void __75__TRHandshakeOperationHandler__handleHandshakeRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  TRHandshakeResponse *v4;

  v4 = objc_alloc_init(TRHandshakeResponse);
  -[TRHandshakeResponse setProtocolVersion:](v4, "setProtocolVersion:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)handshakeHandler
{
  return self->_handshakeHandler;
}

- (void)setHandshakeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handshakeHandler, 0);
}

@end
