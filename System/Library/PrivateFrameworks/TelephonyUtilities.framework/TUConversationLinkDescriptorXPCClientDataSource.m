@implementation TUConversationLinkDescriptorXPCClientDataSource

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke;
  v18[3] = &unk_1E38A1448;
  v12 = v10;
  v19 = v12;
  v13 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke_112;
  v16[3] = &unk_1E38A1510;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "conversationLinkDescriptorsWithPredicate:limit:offset:reply:", v13, a4, a5, v16);

}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUConversationLinkDescriptorXPCClientDataSource xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSXPCConnection)xpcConnection
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.FaceTime.FTConversationService"));
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_msgSend((id)objc_opt_class(), "serverXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v7);

    objc_msgSend((id)objc_opt_class(), "clientXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __64__TUConversationLinkDescriptorXPCClientDataSource_xpcConnection__block_invoke;
    v14 = &unk_1E38A13D0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", &v11);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_100, v11, v12, v13, v14);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  v9 = xpcConnection;
  os_unfair_lock_unlock(p_accessorLock);
  return v9;
}

- (TUConversationLinkDescriptorXPCClientDataSource)init
{
  TUConversationLinkDescriptorXPCClientDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUConversationLinkDescriptorXPCClientDataSource;
  result = -[TUConversationLinkDescriptorXPCClientDataSource init](&v3, sel_init);
  if (result)
    result->_accessorLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUConversationLinkDescriptorXPCClientDataSource;
  -[TUConversationLinkDescriptorXPCClientDataSource dealloc](&v3, sel_dealloc);
}

+ (TUConversationLinkDescriptorXPCServer)asynchronousServer
{
  return (TUConversationLinkDescriptorXPCServer *)objc_loadWeakRetained(&sAsynchronousServer);
}

+ (void)setAsynchronousServer:(id)a3
{
  id WeakRetained;
  void *v4;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer);

  v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&sAsynchronousServer, obj);
    v4 = obj;
  }

}

+ (TUConversationLinkDescriptorXPCServer)synchronousServer
{
  return (TUConversationLinkDescriptorXPCServer *)objc_loadWeakRetained(&sSynchronousServer);
}

+ (void)setSynchronousServer:(id)a3
{
  id WeakRetained;
  void *v4;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&sSynchronousServer);

  v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&sSynchronousServer, obj);
    v4 = obj;
  }

}

+ (NSXPCInterface)clientXPCInterface
{
  if (clientXPCInterface_onceToken != -1)
    dispatch_once(&clientXPCInterface_onceToken, &__block_literal_global);
  return (NSXPCInterface *)(id)clientXPCInterface_sClientXPCInterface;
}

void __69__TUConversationLinkDescriptorXPCClientDataSource_clientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3ABEA0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientXPCInterface_sClientXPCInterface;
  clientXPCInterface_sClientXPCInterface = v0;

}

+ (NSXPCInterface)serverXPCInterface
{
  if (serverXPCInterface_onceToken != -1)
    dispatch_once(&serverXPCInterface_onceToken, &__block_literal_global_46);
  return (NSXPCInterface *)(id)serverXPCInterface_sServerXPCInterface;
}

void __69__TUConversationLinkDescriptorXPCClientDataSource_serverXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E6F20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverXPCInterface_sServerXPCInterface;
  serverXPCInterface_sServerXPCInterface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_addConversationLinkDescriptors_reply_, 0, 0);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_addOrUpdateConversationLinkDescriptors_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_removeConversationLinkDescriptorsWithPredicate_deleteReason_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_conversationLinkDescriptorCountWithPredicate_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_conversationLinkDescriptorsWithPredicate_limit_offset_reply_, 0, 0);
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_conversationLinkDescriptorsWithPredicate_limit_offset_reply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 2, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 2, 0);
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 2, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_setName_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverXPCInterface_sServerXPCInterface, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_setName_withRevision_forConversationLinkDescriptorsWithPredicate_reply_, 2, 0);
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sSynchronousServer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUConversationLinkDescriptorXPCClientDataSource xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __64__TUConversationLinkDescriptorXPCClientDataSource_xpcConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

void __64__TUConversationLinkDescriptorXPCClientDataSource_xpcConnection__block_invoke_99()
{
  NSObject *v0;
  uint8_t v1[16];

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v1, 2u);
  }

}

- (void)setXpcConnection:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection **p_xpcConnection;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  p_xpcConnection = &self->_xpcConnection;
  if (xpcConnection != v8)
    objc_storeStrong((id *)p_xpcConnection, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (TUConversationLinkDescriptorDataSourceDelegate)conversationLinkDescriptorDataSourceDelegate
{
  os_unfair_lock_s *p_accessorLock;
  TUConversationLinkDescriptorDataSourceDelegate *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_conversationLinkDescriptorDataSourceDelegate;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setConversationLinkDescriptorDataSourceDelegate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  TUConversationLinkDescriptorDataSourceDelegate **p_conversationLinkDescriptorDataSourceDelegate;
  TUConversationLinkDescriptorDataSourceDelegate *conversationLinkDescriptorDataSourceDelegate;
  TUConversationLinkDescriptorDataSourceDelegate *v8;

  v8 = (TUConversationLinkDescriptorDataSourceDelegate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  conversationLinkDescriptorDataSourceDelegate = self->_conversationLinkDescriptorDataSourceDelegate;
  p_conversationLinkDescriptorDataSourceDelegate = &self->_conversationLinkDescriptorDataSourceDelegate;
  if (conversationLinkDescriptorDataSourceDelegate != v8)
    objc_storeStrong((id *)p_conversationLinkDescriptorDataSourceDelegate, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke;
  v13[3] = &unk_1E38A13F8;
  v13[4] = &v14;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_102;
  v12[3] = &unk_1E38A1420;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "addConversationLinkDescriptors:reply:", v6, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_102(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke;
  v14[3] = &unk_1E38A1448;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_104;
  v12[3] = &unk_1E38A1470;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "addConversationLinkDescriptors:reply:", v9, v12);

}

void __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_104(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke;
  v13[3] = &unk_1E38A13F8;
  v13[4] = &v14;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_105;
  v12[3] = &unk_1E38A1420;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "addOrUpdateConversationLinkDescriptors:reply:", v6, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_105(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke;
  v14[3] = &unk_1E38A1448;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_106;
  v12[3] = &unk_1E38A1470;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "addOrUpdateConversationLinkDescriptors:reply:", v9, v12);

}

void __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_106(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke;
  v13[3] = &unk_1E38A13F8;
  v13[4] = &v14;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_107;
  v12[3] = &unk_1E38A1498;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "conversationLinkDescriptorCountWithPredicate:reply:", v6, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v21[3];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_107(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke;
  v14[3] = &unk_1E38A1448;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke_109;
  v12[3] = &unk_1E38A14C0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "conversationLinkDescriptorCountWithPredicate:reply:", v9, v12);

}

void __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke_109(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v11 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke;
  v17[3] = &unk_1E38A13F8;
  v17[4] = &v18;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_110;
  v16[3] = &unk_1E38A14E8;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v12, "conversationLinkDescriptorsWithPredicate:limit:offset:reply:", v10, a4, a5, v16);

  if (a6)
  {
    v13 = (void *)v19[5];
    if (v13)
      *a6 = objc_retainAutorelease(v13);
  }
  v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke_112(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v9 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke;
  v15[3] = &unk_1E38A13F8;
  v15[4] = &v16;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_113;
  v14[3] = &unk_1E38A1498;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v10, "removeConversationLinkDescriptorsWithPredicate:deleteReason:reply:", v8, a4, v14);

  if (a5)
  {
    v11 = (void *)v17[5];
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
  v12 = v23[3];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_113(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke;
  v16[3] = &unk_1E38A1448;
  v10 = v8;
  v17 = v10;
  v11 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke_114;
  v14[3] = &unk_1E38A14C0;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "removeConversationLinkDescriptorsWithPredicate:deleteReason:reply:", v11, a4, v14);

}

void __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke_114(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke;
  v13[3] = &unk_1E38A13F8;
  v13[4] = &v14;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke_115;
  v12[3] = &unk_1E38A1498;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "removeLinkDescriptorsFromDataSourceWithPredicate:reply:", v6, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v21[3];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke_115(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke;
  v14[3] = &unk_1E38A1448;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_116;
  v12[3] = &unk_1E38A14C0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "removeLinkDescriptorsFromDataSourceWithPredicate:reply:", v9, v12);

}

void __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_116(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v11 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v17[3] = &unk_1E38A13F8;
  v17[4] = &v18;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_117;
  v16[3] = &unk_1E38A1498;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v12, "setActivated:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v8, a4, v10, v16);

  if (a6)
  {
    v13 = (void *)v19[5];
    if (v13)
      *a6 = objc_retainAutorelease(v13);
  }
  v14 = v25[3];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_117(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v18[3] = &unk_1E38A1448;
  v12 = v10;
  v19 = v12;
  v13 = a5;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_118;
  v16[3] = &unk_1E38A14C0;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "setActivated:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v8, a4, v13, v16);

}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_118(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a3;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v18[3] = &unk_1E38A13F8;
  v18[4] = &v19;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_119;
  v17[3] = &unk_1E38A1498;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v13, "setExpirationDate:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v10, a4, v11, v17);

  if (a6)
  {
    v14 = (void *)v20[5];
    if (v14)
      *a6 = objc_retainAutorelease(v14);
  }
  v15 = v26[3];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_119(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v19[3] = &unk_1E38A1448;
  v12 = v10;
  v20 = v12;
  v13 = a5;
  v14 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_120;
  v17[3] = &unk_1E38A14C0;
  v18 = v12;
  v16 = v12;
  objc_msgSend(v15, "setExpirationDate:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v14, a4, v13, v17);

}

void __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_120(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a3;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v18[3] = &unk_1E38A13F8;
  v18[4] = &v19;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_121;
  v17[3] = &unk_1E38A1498;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v13, "setInvitedHandles:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v10, a4, v11, v17);

  if (a6)
  {
    v14 = (void *)v20[5];
    if (v14)
      *a6 = objc_retainAutorelease(v14);
  }
  v15 = v26[3];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_121(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v19[3] = &unk_1E38A1448;
  v12 = v10;
  v20 = v12;
  v13 = a5;
  v14 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_122;
  v17[3] = &unk_1E38A14C0;
  v18 = v12;
  v16 = v12;
  objc_msgSend(v15, "setInvitedHandles:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v14, a4, v13, v17);

}

void __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_122(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a3;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v18[3] = &unk_1E38A13F8;
  v18[4] = &v19;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_123;
  v17[3] = &unk_1E38A1498;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v13, "setName:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v10, a4, v11, v17);

  if (a6)
  {
    v14 = (void *)v20[5];
    if (v14)
      *a6 = objc_retainAutorelease(v14);
  }
  v15 = v26[3];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_123(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v19[3] = &unk_1E38A1448;
  v12 = v10;
  v20 = v12;
  v13 = a5;
  v14 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_124;
  v17[3] = &unk_1E38A14C0;
  v18 = v12;
  v16 = v12;
  objc_msgSend(v15, "setName:withRevision:forConversationLinkDescriptorsWithPredicate:reply:", v14, a4, v13, v17);

}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_124(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v9 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke;
  v15[3] = &unk_1E38A13F8;
  v15[4] = &v16;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke_125;
  v14[3] = &unk_1E38A1420;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v10, "setInteger:forKey:reply:", a3, v8, v14);

  if (a5)
  {
    v11 = (void *)v17[5];
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
  v12 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke_125(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke;
  v16[3] = &unk_1E38A1448;
  v10 = v8;
  v17 = v10;
  v11 = a4;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_126;
  v14[3] = &unk_1E38A1470;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "setInteger:forKey:reply:", a3, v11, v14);

}

void __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_126(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)integerForKey:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke;
  v14[3] = &unk_1E38A1448;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_127;
  v12[3] = &unk_1E38A1538;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "integerForKey:reply:", v9, v12);

}

void __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);

}

uint64_t __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_127(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)integerForKey:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke;
  v13[3] = &unk_1E38A13F8;
  v13[4] = &v14;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_129;
  v12[3] = &unk_1E38A1560;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "integerForKey:reply:", v6, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v21[3];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_129(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v10 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke;
  v16[3] = &unk_1E38A13F8;
  v16[4] = &v17;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke_130;
  v15[3] = &unk_1E38A1420;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v11, "setString:forKey:reply:", v8, v9, v15);

  if (a5)
  {
    v12 = (void *)v18[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke_130(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke;
  v17[3] = &unk_1E38A1448;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke_131;
  v15[3] = &unk_1E38A1470;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "setString:forKey:reply:", v12, v11, v15);

}

void __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke_131(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stringForKey:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke;
  v14[3] = &unk_1E38A1448;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[TUConversationLinkDescriptorXPCClientDataSource asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke_132;
  v12[3] = &unk_1E38A1588;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "stringForKey:reply:", v9, v12);

}

void __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke;
  v13[3] = &unk_1E38A13F8;
  v13[4] = &v14;
  -[TUConversationLinkDescriptorXPCClientDataSource synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke_134;
  v12[3] = &unk_1E38A15B0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "stringForKey:reply:", v6, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)conversationLinkDescriptorsDidChange
{
  id v3;

  -[TUConversationLinkDescriptorXPCClientDataSource conversationLinkDescriptorDataSourceDelegate](self, "conversationLinkDescriptorDataSourceDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationLinkDescriptorsDidChangeForDataSource:", self);

}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_conversationLinkDescriptorDataSourceDelegate, 0);
}

void __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not add converation links due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not add conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not add or update converation links due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not add or update conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not retrieve conversation link count due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not retrieve conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not remove conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not remove conversation link descriptors from data source due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not update conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not update TU KV due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not fetch TU KV due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Could not synch fetch conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
