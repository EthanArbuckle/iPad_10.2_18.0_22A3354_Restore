@implementation SACInfoListener

- (SACInfoListener)init
{
  SACInfoListener *v2;
  SACInfoListener *v3;
  NSXPCConnection *mServiceConnection;
  SACServiceDelegate *mProxyInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SACInfoListener;
  v2 = -[SACInfoListener init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    mServiceConnection = v2->mServiceConnection;
    v2->mServiceConnection = 0;

    mProxyInterface = v3->mProxyInterface;
    v3->mProxyInterface = 0;

    v3->mVerbosity = 1;
    -[SACInfoListener startServiceConnection](v3, "startServiceConnection");
  }
  return v3;
}

- (void)startServiceConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *mServiceConnection;
  void *v5;
  uint64_t v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  SACServiceDelegate *v10;
  SACServiceDelegate *mProxyInterface;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  NSLog(CFSTR("%s Starting xpc conn with: %s\n"), a2, "-[SACInfoListener startServiceConnection]", "com.apple.internal.soundautoconfigservice");
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.internal.soundautoconfigservice"));
  mServiceConnection = self->mServiceConnection;
  self->mServiceConnection = v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A20EC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->mServiceConnection, "setRemoteObjectInterface:", v5);

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3042000000;
  v14[3] = sub_228FBC94C;
  v14[4] = sub_228FBC958;
  objc_initWeak(&v15, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = self->mServiceConnection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_228FBC960;
  v13[3] = &unk_24F1A4010;
  v13[4] = v14;
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v13);
  v8 = self->mServiceConnection;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = sub_228FBC9B0;
  v12[3] = &unk_24F1A4010;
  v12[4] = v14;
  -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v12);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A207A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->mServiceConnection, "setExportedInterface:", v9);

  -[NSXPCConnection setExportedObject:](self->mServiceConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->mServiceConnection, "resume");
  -[NSXPCConnection remoteObjectProxy](self->mServiceConnection, "remoteObjectProxy");
  v10 = (SACServiceDelegate *)objc_claimAutoreleasedReturnValue();
  mProxyInterface = self->mProxyInterface;
  self->mProxyInterface = v10;

  -[SACServiceDelegate registerAsInfoListener](self->mProxyInterface, "registerAsInfoListener");
  _Block_object_dispose(v14, 8);
  objc_destroyWeak(&v15);
}

- (void)handleServiceCrash
{
  NSXPCConnection *mServiceConnection;
  dispatch_time_t v4;
  _QWORD block[5];

  NSLog(CFSTR("Delaying checking in with service a few seconds...\n"), a2);
  mServiceConnection = self->mServiceConnection;
  if (mServiceConnection)
  {
    self->mServiceConnection = 0;

  }
  v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_228FBCA90;
  block[3] = &unk_24F1A4038;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

- (void)setListenerVerbosity:(unint64_t)a3
{
  SACServiceDelegate *mProxyInterface;

  self->mVerbosity = a3;
  mProxyInterface = self->mProxyInterface;
  if (mProxyInterface)
    MEMORY[0x24BEDD108](mProxyInterface, sel_setVerbosityForClient_);
}

- (void)handleSACInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SACInfoListener delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SACInfoListener delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleSACInfo:", v7);

  }
}

- (SACInfoDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->mProxyInterface, 0);
  objc_storeStrong((id *)&self->mServiceConnection, 0);
}

@end
