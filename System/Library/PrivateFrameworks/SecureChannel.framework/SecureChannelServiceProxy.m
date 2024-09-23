@implementation SecureChannelServiceProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __43__SecureChannelServiceProxy_sharedInstance__block_invoke()
{
  SecureChannelServiceProxy *v0;
  void *v1;

  v0 = objc_alloc_init(SecureChannelServiceProxy);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (SecureChannelServiceProxy)init
{
  SecureChannelServiceProxy *v2;
  uint64_t v3;
  NSXPCConnection *connectionToService;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SecureChannelServiceProxy;
  v2 = -[SecureChannelServiceProxy init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.securechanneld"), 4096);
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2555776F8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connectionToService, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInvalidationHandler:](v2->_connectionToService, "setInvalidationHandler:", &__block_literal_global_8);
    -[NSXPCConnection setInterruptionHandler:](v2->_connectionToService, "setInterruptionHandler:", &__block_literal_global_11);
    -[NSXPCConnection resume](v2->_connectionToService, "resume");
  }
  return v2;
}

void __33__SecureChannelServiceProxy_init__block_invoke()
{
  NSLog(CFSTR("invalidationHandler"));
}

void __33__SecureChannelServiceProxy_init__block_invoke_2()
{
  NSLog(CFSTR("interruptionHandler"));
}

- (void)actionForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SecureChannelService *remoteObject;
  NSXPCConnection *connectionToService;
  SecureChannelService *v10;
  SecureChannelService *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    connectionToService = self->_connectionToService;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__SecureChannelServiceProxy_actionForURL_completion___block_invoke;
    v12[3] = &unk_24E596258;
    v13 = v7;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v12);
    v10 = (SecureChannelService *)objc_claimAutoreleasedReturnValue();
    v11 = self->_remoteObject;
    self->_remoteObject = v10;

    remoteObject = self->_remoteObject;
  }
  -[SecureChannelService actionForURL:completion:](remoteObject, "actionForURL:completion:", v6, v7);

}

uint64_t __53__SecureChannelServiceProxy_actionForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runApproverFlowForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SecureChannelService *remoteObject;
  NSXPCConnection *connectionToService;
  SecureChannelService *v10;
  SecureChannelService *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    connectionToService = self->_connectionToService;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__SecureChannelServiceProxy_runApproverFlowForURL_completion___block_invoke;
    v12[3] = &unk_24E596258;
    v13 = v7;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v12);
    v10 = (SecureChannelService *)objc_claimAutoreleasedReturnValue();
    v11 = self->_remoteObject;
    self->_remoteObject = v10;

    remoteObject = self->_remoteObject;
  }
  -[SecureChannelService runApproverFlowForURL:completion:](remoteObject, "runApproverFlowForURL:completion:", v6, v7);

}

uint64_t __62__SecureChannelServiceProxy_runApproverFlowForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end
