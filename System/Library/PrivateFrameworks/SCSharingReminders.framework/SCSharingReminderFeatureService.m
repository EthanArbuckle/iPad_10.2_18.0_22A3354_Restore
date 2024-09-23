@implementation SCSharingReminderFeatureService

- (id)initConnection
{
  SCSharingReminderFeatureService *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCSharingReminderFeatureService;
  v2 = -[SCSharingReminderFeatureService init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.safetycheckd"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    +[SCSharingReminderFeatureService interface](SCSharingReminderFeatureService, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_3);
    -[NSXPCConnection activate](v2->_xpcConnection, "activate");
  }
  return v2;
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SCLogger();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __49__SCSharingReminderFeatureService_initConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SCLogger();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __49__SCSharingReminderFeatureService_initConnection__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)disconnect
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25747EC28);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchStatusWithCompletion_, 0, 1);

  return v2;
}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCSharingReminderFeatureService xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchStatusWithCompletion:", v4);

}

- (void)resetFeatureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCSharingReminderFeatureService xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetFeatureWithCompletion:", v4);

}

- (void)setReminderDelays:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SCSharingReminderFeatureService xpcConnection](self, "xpcConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReminderDelays:completion:", v7, v6);

}

- (void)postWifiSyncNotificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCSharingReminderFeatureService xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postWifiSyncNotificationWithCompletion:", v4);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2454C0000, a1, a3, "@\"Connection with %@ interrupted.\", a5, a6, a7, a8, 2u);
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2454C0000, a1, a3, "@\"Connection with %@ invalidated.\", a5, a6, a7, a8, 2u);
}

@end
