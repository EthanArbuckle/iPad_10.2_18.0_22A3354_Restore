@implementation UNCBulletinServerConnection

+ (id)clientInterface
{
  if (clientInterface_onceToken_0 != -1)
    dispatch_once(&clientInterface_onceToken_0, &__block_literal_global_23);
  return (id)clientInterface___interface_0;
}

void __46__UNCBulletinServerConnection_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2578DF350);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface_0;
  clientInterface___interface_0 = v0;

}

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1)
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_1);
  return (id)serverInterface___interface_0;
}

void __46__UNCBulletinServerConnection_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2578DF3B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface___interface_0;
  serverInterface___interface_0 = v0;

  v2 = (void *)serverInterface___interface_0;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getActiveSectionIDsWithHandler_, 0, 1);

}

- (UNCBulletinServerConnection)init
{
  dispatch_queue_t v3;
  UNCBulletinServerConnection *v4;

  v3 = dispatch_queue_create("com.apple.usernotificationscore.bulletinserverconnection", 0);
  v4 = -[UNCBulletinServerConnection initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (UNCBulletinServerConnection)initWithQueue:(id)a3
{
  id v5;
  UNCBulletinServerConnection *v6;
  UNCBulletinServerConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCBulletinServerConnection;
  v6 = -[UNCBulletinServerConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_bbServerConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UNCBulletinServerConnection;
  -[UNCBulletinServerConnection dealloc](&v3, sel_dealloc);
}

- (id)_ensureBBServerSettingsConnection
{
  NSXPCConnection *bbServerConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  NSObject *v11;
  NSXPCConnection *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  uint8_t buf[4];
  NSXPCConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  bbServerConnection = self->_bbServerConnection;
  if (!bbServerConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.bulletinboard.settingsconnection"), 0);
    v5 = self->_bbServerConnection;
    self->_bbServerConnection = v4;

    v6 = self->_bbServerConnection;
    objc_msgSend((id)objc_opt_class(), "serverInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_bbServerConnection;
    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_bbServerConnection, "setExportedObject:", self);
    -[NSXPCConnection setInterruptionHandler:](self->_bbServerConnection, "setInterruptionHandler:", &__block_literal_global_21);
    objc_initWeak(&location, self);
    v10 = self->_bbServerConnection;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __64__UNCBulletinServerConnection__ensureBBServerSettingsConnection__block_invoke_22;
    v17 = &unk_251AE1430;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v14);
    -[NSXPCConnection resume](self->_bbServerConnection, "resume", v14, v15, v16, v17);
    v11 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_bbServerConnection;
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_2499A5000, v11, OS_LOG_TYPE_DEFAULT, "UNCBulletinServerConnection: Connected to BBServer: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    bbServerConnection = self->_bbServerConnection;
  }
  return bbServerConnection;
}

void __64__UNCBulletinServerConnection__ensureBBServerSettingsConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2499A5000, v0, OS_LOG_TYPE_DEFAULT, "Connection to BBServer interrupted", v1, 2u);
  }
}

void __64__UNCBulletinServerConnection__ensureBBServerSettingsConnection__block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_DEFAULT, "Connection to BBServer invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetBBServerSettingsConnection");

}

- (void)_resetBBServerSettingsConnection
{
  NSXPCConnection *bbServerConnection;

  -[NSXPCConnection invalidate](self->_bbServerConnection, "invalidate");
  -[NSXPCConnection setInterruptionHandler:](self->_bbServerConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_bbServerConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setExportedObject:](self->_bbServerConnection, "setExportedObject:", 0);
  bbServerConnection = self->_bbServerConnection;
  self->_bbServerConnection = 0;

}

- (id)serverProxyObject
{
  void *v2;
  void *v3;

  -[UNCBulletinServerConnection _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__UNCBulletinServerConnection_serverProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __48__UNCBulletinServerConnection_serverProxyObject__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (id)asyncServerProxyObject
{
  void *v2;
  void *v3;

  -[UNCBulletinServerConnection _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__UNCBulletinServerConnection_asyncServerProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __53__UNCBulletinServerConnection_asyncServerProxyObject__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (id)activeSectionIDs
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  -[UNCBulletinServerConnection serverProxyObject](self, "serverProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke;
  v5[3] = &unk_251AE14B8;
  v5[4] = &v6;
  objc_msgSend(v2, "getActiveSectionIDsWithHandler:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    v8 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)refreshAnnounceSettings
{
  id v2;

  -[UNCBulletinServerConnection asyncServerProxyObject](self, "asyncServerProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAnnounceSettings");

}

- (void)refreshGlobalSettings
{
  id v2;

  -[UNCBulletinServerConnection asyncServerProxyObject](self, "asyncServerProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshGlobalSettings");

}

- (void)refreshSectionInfo
{
  id v2;

  -[UNCBulletinServerConnection asyncServerProxyObject](self, "asyncServerProxyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshSectionInfo");

}

- (void)refreshSectionInfoForID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCBulletinServerConnection asyncServerProxyObject](self, "asyncServerProxyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshSectionInfoForID:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bbServerConnection, 0);
}

void __48__UNCBulletinServerConnection_serverProxyObject__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "BulletinServerConnection failed to get sync remote proxy: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __53__UNCBulletinServerConnection_asyncServerProxyObject__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "BulletinServerConnection failed to get async remote proxy: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "BulletinServerConnection error reading -activeSectionIDs: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
