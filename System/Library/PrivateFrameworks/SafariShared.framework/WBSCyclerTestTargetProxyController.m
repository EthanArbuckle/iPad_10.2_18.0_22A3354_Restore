@implementation WBSCyclerTestTargetProxyController

- (WBSCyclerTestTargetProxyController)init
{

  return 0;
}

- (WBSCyclerTestTargetProxyController)initWithEndpoint:(id)a3
{
  id v4;
  WBSCyclerTestTargetProxyController *v5;
  uint64_t v6;
  NSXPCConnection *xpcConnection;
  void *v8;
  WBSCyclerTestTargetProxyController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSCyclerTestTargetProxyController;
  v5 = -[WBSCyclerTestTargetProxyController init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70E028);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_xpcConnection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v5->_xpcConnection, "resume");
    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSCyclerTestTargetProxyController setDisconnectionHandler:](self, "setDisconnectionHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSCyclerTestTargetProxyController;
  -[WBSCyclerTestTargetProxyController dealloc](&v3, sel_dealloc);
}

- (id)disconnectionHandler
{
  return -[NSXPCConnection interruptionHandler](self->_xpcConnection, "interruptionHandler");
}

- (void)setDisconnectionHandler:(id)a3
{
  NSXPCConnection *xpcConnection;
  id v5;

  xpcConnection = self->_xpcConnection;
  v5 = a3;
  -[NSXPCConnection setInterruptionHandler:](xpcConnection, "setInterruptionHandler:", v5);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v5);

}

- (WBSCyclerTestTarget)testTargetProxy
{
  return (WBSCyclerTestTarget *)-[NSXPCConnection remoteObjectProxy](self->_xpcConnection, "remoteObjectProxy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
