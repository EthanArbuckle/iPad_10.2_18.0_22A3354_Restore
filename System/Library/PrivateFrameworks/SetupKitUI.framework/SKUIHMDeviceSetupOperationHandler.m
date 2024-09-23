@implementation SKUIHMDeviceSetupOperationHandler

- (SKUIHMDeviceSetupOperationHandler)initWithDispatchQueue:(id)a3 messageSessionTemplate:(id)a4
{
  id v7;
  id v8;
  SKUIHMDeviceSetupOperationHandler *v9;
  SKUIHMDeviceSetupOperationHandler *v10;
  SKUIHMDeviceSetupOperationHandler *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKUIHMDeviceSetupOperationHandler;
  v9 = -[SKUIHMDeviceSetupOperationHandler init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_messageSessionTemplate, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_245DDF000, v3, OS_LOG_TYPE_DEBUG, "handler dealloc", buf, 2u);
  }

  -[SKUIHMDeviceSetupOperationHandler _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)SKUIHMDeviceSetupOperationHandler;
  -[SKUIHMDeviceSetupOperationHandler dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  SKTRSession *v4;
  SKTRSession *trSession;
  HMDeviceSetupOperationHandler *v6;
  HMDeviceSetupOperationHandler *hkDeviceSetupOperationHandler;
  uint8_t v8[16];

  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_245DDF000, v3, OS_LOG_TYPE_DEFAULT, "handler start", v8, 2u);
  }

  if (!self->_trSession)
  {
    v4 = (SKTRSession *)objc_msgSend(objc_alloc(MEMORY[0x24BE85CB8]), "initWithDispatchQueue:messageSessionTemplate:", self->_dispatchQueue, self->_messageSessionTemplate);
    trSession = self->_trSession;
    self->_trSession = v4;

    -[SKTRSession start](self->_trSession, "start");
  }
  if (!self->_hkDeviceSetupOperationHandler)
  {
    v6 = (HMDeviceSetupOperationHandler *)objc_alloc_init(MEMORY[0x24BDD7618]);
    hkDeviceSetupOperationHandler = self->_hkDeviceSetupOperationHandler;
    self->_hkDeviceSetupOperationHandler = v6;

    -[HMDeviceSetupOperationHandler registerMessageHandlersForSession:](self->_hkDeviceSetupOperationHandler, "registerMessageHandlersForSession:", self->_trSession);
  }
}

- (void)cancel
{
  NSObject *v3;
  uint8_t v4[16];

  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245DDF000, v3, OS_LOG_TYPE_DEFAULT, "handler cancel", v4, 2u);
  }

  -[SKUIHMDeviceSetupOperationHandler _cleanup](self, "_cleanup");
}

- (void)_cleanup
{
  HMDeviceSetupOperationHandler *hkDeviceSetupOperationHandler;
  SKTRSession *trSession;

  hkDeviceSetupOperationHandler = self->_hkDeviceSetupOperationHandler;
  self->_hkDeviceSetupOperationHandler = 0;

  -[SKTRSession cancel](self->_trSession, "cancel");
  trSession = self->_trSession;
  self->_trSession = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_hkDeviceSetupOperationHandler, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
