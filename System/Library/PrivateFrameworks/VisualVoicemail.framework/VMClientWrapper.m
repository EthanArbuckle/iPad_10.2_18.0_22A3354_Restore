@implementation VMClientWrapper

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (VMClientWrapper)init
{
  VMClientWrapper *v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[16];

  if ((objc_msgSend((id)objc_opt_class(), "isVMXPCAvailable") & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VMClientWrapper;
    self = -[VMClientWrapper init](&v6, sel_init);
    v3 = self;
  }
  else
  {
    vm_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "VMD is not available", buf, 2u);
    }

    v3 = 0;
  }

  return v3;
}

+ (BOOL)isVMXPCAvailable
{
  if (isVMXPCAvailable_onceToken != -1)
    dispatch_once(&isVMXPCAvailable_onceToken, &__block_literal_global_160);
  return isVMXPCAvailable_isVMXPCAvailable;
}

void __46__VMClientWrapper_voicemailClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC14C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)voicemailClientXPCInterface_xpcInterface;
  voicemailClientXPCInterface_xpcInterface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)voicemailClientXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_voicemailsUpdated_, 0, 0);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)voicemailClientXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_updateAccounts_, 0, 0);

}

void __46__VMClientWrapper_voicemailServerXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC4938);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)voicemailServerXPCInterface_xpcInterface;
  voicemailServerXPCInterface_xpcInterface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)voicemailServerXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_requestInitialState_, 1, 1);
  objc_msgSend((id)voicemailServerXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_allVoicemails_, 0, 1);
  objc_msgSend((id)voicemailServerXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_requestTranscriptionProgress_, 0, 0);
  objc_msgSend((id)voicemailServerXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_insertVoicemail_, 0, 0);
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)voicemailServerXPCInterface_xpcInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_accounts_, 0, 1);
  v13 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_isAccountSubscribed_reply_, 0, 0);

  v15 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_isAccountOnline_reply_, 0, 0);

  v17 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_isPasscodeChangeSupportedForAccountUUID_reply_, 0, 0);

  v19 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_minimumPasscodeLengthForAccountUUID_reply_, 0, 0);

  v21 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_maximumPasscodeLengthForAccountUUID_reply_, 0, 0);

  v23 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_setPasscode_forAccountUUID_reply_, 0, 1);

  v25 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_setPasscode_forAccountUUID_reply_, 0, 0);

  v27 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_setPasscode_forAccountUUID_reply_, 1, 0);

  v29 = (void *)voicemailServerXPCInterface_xpcInterface;
  v30 = (void *)MEMORY[0x24BDBCF20];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_greetingForAccountUUID_reply_, 0, 1);

  v33 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_greetingForAccountUUID_reply_, 0, 0);

  v35 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_isGreetingChangeSupportedForAccountUUID_reply_, 0, 0);

  v37 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_maximumGreetingDurationForAccountUUID_reply_, 0, 0);

  v39 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_setGreeting_forAccountUUID_reply_, 0, 1);

  v41 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_setGreeting_forAccountUUID_reply_, 0, 0);

  v43 = (void *)voicemailServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_setGreeting_forAccountUUID_reply_, 1, 0);

  v45 = (void *)voicemailServerXPCInterface_xpcInterface;
  v46 = (void *)MEMORY[0x24BDBCF20];
  v47 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_messagesForMailboxType_limit_offset_reply_, 0, 1);

  v49 = (void *)voicemailServerXPCInterface_xpcInterface;
  v50 = (void *)MEMORY[0x24BDBCF20];
  v51 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_messagesForMailboxType_read_limit_offset_reply_, 0, 1);

}

- (NSXPCConnection)clientConnection
{
  VMClientWrapper *v2;
  NSXPCConnection *clientConnection;
  uint64_t v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  NSXPCConnection *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  clientConnection = v2->_clientConnection;
  if (!clientConnection)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.voicemail.vmd"), 4096);
    v5 = v2->_clientConnection;
    v2->_clientConnection = (NSXPCConnection *)v4;

    objc_msgSend((id)objc_opt_class(), "voicemailClientXPCInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_clientConnection, "setExportedInterface:", v6);

    objc_msgSend((id)objc_opt_class(), "voicemailServerXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_clientConnection, "setRemoteObjectInterface:", v7);

    -[VMClientWrapper manager](v2, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](v2->_clientConnection, "setExportedObject:", v8);

    v2->_pingRetry = 0;
    vm_framework_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v2->_clientConnection;
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_2116D5000, v9, OS_LOG_TYPE_DEFAULT, "XPC connection created %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v2);
    v11 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __35__VMClientWrapper_clientConnection__block_invoke;
    v19[3] = &unk_24CC5AB98;
    objc_copyWeak(&v20, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v2->_clientConnection, "setInvalidationHandler:", v19);
    v14 = v11;
    v15 = 3221225472;
    v16 = __35__VMClientWrapper_clientConnection__block_invoke_172;
    v17 = &unk_24CC5AB98;
    objc_copyWeak(&v18, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v2->_clientConnection, "setInterruptionHandler:", &v14);
    -[NSXPCConnection resume](v2->_clientConnection, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
    clientConnection = v2->_clientConnection;
  }
  v12 = clientConnection;
  objc_sync_exit(v2);

  return v12;
}

+ (id)voicemailServerXPCInterface
{
  if (voicemailServerXPCInterface_onceToken != -1)
    dispatch_once(&voicemailServerXPCInterface_onceToken, &__block_literal_global_1);
  return (id)voicemailServerXPCInterface_xpcInterface;
}

+ (id)voicemailClientXPCInterface
{
  if (voicemailClientXPCInterface_onceToken != -1)
    dispatch_once(&voicemailClientXPCInterface_onceToken, &__block_literal_global_139);
  return (id)voicemailClientXPCInterface_xpcInterface;
}

- (VMClientXPCProtocol)manager
{
  return (VMClientXPCProtocol *)objc_loadWeakRetained((id *)&self->_manager);
}

uint64_t __35__VMClientWrapper_isVMXPCAvailable__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isVMXPCAvailable_isVMXPCAvailable = result;
  return result;
}

- (id)asynchronousServerConnectionWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[VMClientWrapper clientConnection](self, "clientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke;
  v9[3] = &unk_24CC5AAF0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

void __35__VMClientWrapper_clientConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", (uint8_t *)&v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "setClientConnection:", 0);
    if (objc_msgSend(v5, "pingRetry"))
    {
      objc_msgSend(v5, "setPingRetry:", 0);
      vm_framework_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "clientConnection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_2116D5000, v6, OS_LOG_TYPE_DEFAULT, "XPC attempting to ping connection %@", (uint8_t *)&v9, 0xCu);

      }
      objc_msgSend(v5, "asynchronousServerConnectionWithErrorHandler:", &__block_literal_global_166);
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject ping:](v8, "ping:", &__block_literal_global_169);
    }
    else
    {
      vm_framework_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_2116D5000, v8, OS_LOG_TYPE_DEFAULT, "XPC connection deallocated", (uint8_t *)&v9, 2u);
      }
    }

    objc_sync_exit(v5);
  }

}

void __35__VMClientWrapper_clientConnection__block_invoke_165(uint64_t a1, void *a2)
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
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__VMClientWrapper_clientConnection__block_invoke_165_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __35__VMClientWrapper_clientConnection__block_invoke_167(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection reestablished with ping response %s", (uint8_t *)&v5, 0xCu);
  }

}

void __35__VMClientWrapper_clientConnection__block_invoke_172(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  uint8_t v4[16];

  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  v3 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(v3);
  if (v3)
  {
    objc_msgSend(v3[2], "invalidate");
    objc_msgSend(v3, "setClientConnection:", 0);
  }
  objc_sync_exit(v3);

}

- (void)setClientConnection:(id)a3
{
  VMClientWrapper *v5;
  NSXPCConnection *v6;

  v6 = (NSXPCConnection *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_clientConnection != v6)
    objc_storeStrong((id *)&v5->_clientConnection, a3);
  objc_sync_exit(v5);

}

- (void)setPingRetry:(BOOL)a3
{
  _BOOL4 v3;
  VMClientWrapper *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_pingRetry != v3)
    obj->_pingRetry = v3;
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  self->_pingRetry = 0;
  -[NSXPCConnection invalidate](self->_clientConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VMClientWrapper;
  -[VMClientWrapper dealloc](&v3, sel_dealloc);
}

- (BOOL)pingRetry
{
  return self->_pingRetry;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

void __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2116D5000, a2, a3, "Failed to create remote object proxy: %@", a5, a6, a7, a8, 2u);
}

void __35__VMClientWrapper_clientConnection__block_invoke_165_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2116D5000, a2, a3, "XPC connection failed to ping after interruption %@", a5, a6, a7, a8, 2u);
}

@end
