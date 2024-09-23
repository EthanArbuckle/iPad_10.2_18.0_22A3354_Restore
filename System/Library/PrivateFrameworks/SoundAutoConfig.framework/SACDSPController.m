@implementation SACDSPController

- (SACDSPController)init
{
  SACDSPController *v2;
  SACDSPController *v3;
  NSXPCConnection *mServiceConnection;
  SACServiceDelegate *mProxyInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SACDSPController;
  v2 = -[SACDSPController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    mServiceConnection = v2->mServiceConnection;
    v2->mServiceConnection = 0;

    mProxyInterface = v3->mProxyInterface;
    v3->mProxyInterface = 0;

    -[SACDSPController startServiceConnection](v3, "startServiceConnection");
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
  uint64_t v10;
  id *p_mProxyInterface;
  SACServiceDelegate *mProxyInterface;
  _QWORD v13[5];
  _QWORD v14[5];
  _BYTE buf[24];
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18[3];

  v18[2] = *(id *)MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SACDSPController startServiceConnection]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "com.apple.internal.soundautoconfigservice";
    _os_log_impl(&dword_228FBB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s Starting xpc conn with: %s\n", buf, 0x16u);
  }
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.internal.soundautoconfigservice"));
  mServiceConnection = self->mServiceConnection;
  self->mServiceConnection = v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A20EC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->mServiceConnection, "setRemoteObjectInterface:", v5);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3042000000;
  v16 = sub_228FBC380;
  v17 = sub_228FBC38C;
  objc_initWeak(v18, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = self->mServiceConnection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_228FBC394;
  v14[3] = &unk_24F1A4010;
  v14[4] = buf;
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v14);
  v8 = self->mServiceConnection;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = sub_228FBC3E4;
  v13[3] = &unk_24F1A4010;
  v13[4] = buf;
  -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v13);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A20690);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->mServiceConnection, "setExportedInterface:", v9);

  -[NSXPCConnection setExportedObject:](self->mServiceConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->mServiceConnection, "resume");
  -[NSXPCConnection remoteObjectProxy](self->mServiceConnection, "remoteObjectProxy");
  v10 = objc_claimAutoreleasedReturnValue();
  mProxyInterface = self->mProxyInterface;
  p_mProxyInterface = (id *)&self->mProxyInterface;
  *p_mProxyInterface = (id)v10;

  objc_msgSend(*p_mProxyInterface, "registerAsClientWithConnectionType:", 0);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v18);
}

- (void)handleServiceCrash
{
  NSXPCConnection *mServiceConnection;
  dispatch_time_t v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228FBB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Delaying checking in with service a few seconds...\n", buf, 2u);
  }
  mServiceConnection = self->mServiceConnection;
  if (mServiceConnection)
  {
    self->mServiceConnection = 0;

  }
  v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_228FBC4F8;
  block[3] = &unk_24F1A4038;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

- (void)setDSPConfig:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SACDSPController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SACDSPController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDSPConfig:", v7);

  }
}

- (void)getDSPInfoByKey:(id)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SACDSPController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SACDSPController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getDSPInfoByKey:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);

  }
}

- (SACDSPDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SACDSPDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSACDSPDelegate, 0);
  objc_storeStrong((id *)&self->mProxyInterface, 0);
  objc_storeStrong((id *)&self->mServiceConnection, 0);
}

@end
