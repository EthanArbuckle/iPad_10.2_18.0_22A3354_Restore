@implementation SBSCardItemsController

- (SBSCardItemsController)initWithIdentifier:(id)a3
{
  id v4;
  SBSCardItemsController *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSCardItemsController;
  v5 = -[SBSCardItemsController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSCardItemsController _invalidateConnection](self, "_invalidateConnection");
  v3.receiver = self;
  v3.super_class = (Class)SBSCardItemsController;
  -[SBSCardItemsController dealloc](&v3, sel_dealloc);
}

- (void)setCardItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWallet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "Set %ld SBSCardItems", (uint8_t *)&v7, 0xCu);
  }

  -[SBSCardItemsController _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &__block_literal_global_37);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCardItems:forControllerWithIdentifier:", v4, self->_identifier);

}

void __39__SBSCardItemsController_setCardItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogWallet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __39__SBSCardItemsController_setCardItems___block_invoke_cold_1();

}

- (void)getCardItemsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSString *identifier;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    SBLogWallet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "Get SBSCardItems", buf, 2u);
    }

    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke;
    v12[3] = &unk_1E288D2C0;
    v7 = v4;
    v13 = v7;
    -[SBSCardItemsController _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_165;
    v10[3] = &unk_1E288F790;
    v11 = v7;
    objc_msgSend(v8, "getCardItemsForControllerWithIdentifier:withHandler:", identifier, v10);

  }
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SBLogWallet();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    SBLogWallet();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18EB52000, v7, OS_LOG_TYPE_INFO, "Got %ld SBSCardItems", (uint8_t *)&v10, 0xCu);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    SBLogWallet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_165_cold_1((uint64_t)v5, v9);

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SBSCardItemsController _connectToServerIfNecessary](self, "_connectToServerIfNecessary");
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E288D2C0;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SBLogWallet();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)_connectToServerIfNecessary
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_connected)
  {
    -[SBSCardItemsController _invalidateConnection](self, "_invalidateConnection");
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.springboard.carditemscontroller"), 0);
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE143F20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v7 = self->_connection;
    SBCardItemsControllerServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __53__SBSCardItemsController__connectToServerIfNecessary__block_invoke;
    v13 = &unk_1E288F7B8;
    objc_copyWeak(&v14, &location);
    v9 = (void *)MEMORY[0x193FF87DC](&v10);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v9, v10, v11, v12, v13);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v9);
    -[NSXPCConnection resume](self->_connection, "resume");
    self->_connected = 1;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __53__SBSCardItemsController__connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_noteConnectionDropped");

}

- (void)_noteConnectionDropped
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "SBSCardItems XPC connection dropped", v1, 2u);
}

- (void)_invalidateConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

    self->_connected = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __39__SBSCardItemsController_setCardItems___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "Setting SBSCardItems failed with error %{pubic}@", v2);
  OUTLINED_FUNCTION_3();
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "Getting SBSCardItems failed with error %{pubic}@", v2);
  OUTLINED_FUNCTION_3();
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_165_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_4();
  v4 = v3;
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, a2, v5, "Got unexpected type %{public}@ of SBSCardItems", v6);

}

void __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSCardItems XPC message failed: %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

@end
