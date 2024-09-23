@implementation PBServerConnection

void __38__PBServerConnection_serverConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "memberQ_serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.pasteboard.pasted"), 4096);
    PBNewClientToServerXPCInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRemoteObjectInterface:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setMemberQ_serverConnection:", v3);
    objc_msgSend(v3, "resume");

  }
  objc_msgSend(*(id *)(a1 + 32), "memberQ_serverConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (NSXPCConnection)memberQ_serverConnection
{
  return self->_memberQ_serverConnection;
}

- (void)setMemberQ_serverConnection:(id)a3
{
  objc_storeStrong((id *)&self->_memberQ_serverConnection, a3);
}

+ (id)defaultConnection
{
  if (qword_1ECED8B88 != -1)
    dispatch_once(&qword_1ECED8B88, &__block_literal_global_0);
  return (id)_MergedGlobals_0;
}

- (id)localGeneralPasteboardWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  uint8_t buf[8];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke;
  v20[3] = &unk_1E24312A8;
  v20[4] = &v27;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:error:]", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C53A000, v14, OS_LOG_TYPE_INFO, "Retrieving local-only general pasteboard.", buf, 2u);
  }

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke_21;
  v18[3] = &unk_1E24312F8;
  v18[4] = &v21;
  v18[5] = &v27;
  objc_msgSend(v13, "localGeneralPasteboardCompletionBlock:", v18);
  v15 = (void *)v28[5];
  if (v15)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    objc_msgSend((id)v22[5], "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", v8, v9);
  }
  v16 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

uint64_t __67__PBServerConnection_beginListeningToPasteboardChangeNotifications__block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *v3;
  uint32_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t result;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_notificationQueue_token < 0)
  {
    v2 = (const char *)objc_msgSend(CFSTR("com.apple.pasteboard.notify.changed"), "UTF8String");
    _notificationQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = notify_register_dispatch(v2, &_notificationQueue_token, v3, &__block_literal_global_30);

    _PBLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v4;
        _os_log_error_impl(&dword_18C53A000, v6, OS_LOG_TYPE_ERROR, "Could not register for global pasteboard change notifications. Error: %d", (uint8_t *)v8, 8u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_18C53A000, v6, OS_LOG_TYPE_INFO, "Began listening to global pasteboard change notifications.", (uint8_t *)v8, 2u);
    }

  }
  result = _notificationQueue_getState();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (unint64_t)beginListeningToPasteboardChangeNotifications
{
  NSObject *v2;
  unint64_t v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  _notificationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PBServerConnection_beginListeningToPasteboardChangeNotifications__block_invoke;
  block[3] = &unk_1E24313E8;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 authenticationBlock:(id)a5 dataOwnerBlock:(id)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, void *, void *);
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v10 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke;
  v31[3] = &unk_1E24312A8;
  v31[4] = &v38;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:error:]", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v45 = v12;
    v46 = 1024;
    v47 = v10;
    _os_log_impl(&dword_18C53A000, v19, OS_LOG_TYPE_INFO, "Retrieving pasteboard named %@, create if needed: %{BOOL}d", buf, 0x12u);
  }

  v24 = v16;
  v25 = 3221225472;
  v26 = __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke_20;
  v27 = &unk_1E24312D0;
  v20 = v12;
  v28 = v20;
  v29 = &v32;
  v30 = &v38;
  objc_msgSend(v18, "pasteboardWithName:createIfNeeded:completionBlock:", v20, v10, &v24);
  v21 = (void *)v39[5];
  if (v21)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v21);
  }
  else
  {
    objc_msgSend((id)v33[5], "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", v13, v14, v24, v25, v26, v27);
    objc_msgSend((id)v33[5], "registerLocalAvailableDerivedRepresentations");
  }
  v22 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

- (NSXPCConnection)serverConnection
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[PBServerConnection memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PBServerConnection_serverConnection__block_invoke;
  v6[3] = &unk_1E2431140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

void __39__PBServerConnection_defaultConnection__block_invoke()
{
  PBServerConnection *v0;
  void *v1;

  v0 = objc_alloc_init(PBServerConnection);
  v1 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v0;

}

- (PBServerConnection)init
{
  PBServerConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBServerConnection;
  v2 = -[PBServerConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Pasteboard.PBServerConnection-member-queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)localGeneralPasteboardWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[8];
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke;
  v25[3] = &unk_1E2431168;
  v13 = v10;
  v26 = v13;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:completionBlock:]", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C53A000, v16, OS_LOG_TYPE_INFO, "Retrieving local-only general pasteboard.", buf, 2u);
  }

  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke_7;
  v20[3] = &unk_1E24311B8;
  v21 = v8;
  v22 = v9;
  v23 = v13;
  v17 = v13;
  v18 = v9;
  v19 = v8;
  objc_msgSend(v15, "localGeneralPasteboardCompletionBlock:", v20);

}

- (void)localGeneralPasteboardCompletionBlock:(id)a3
{
  -[PBServerConnection localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:completionBlock:](self, "localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:completionBlock:", 0, 0, a3);
}

+ (void)simulateCrashReportForAuthorizationWithAuthenticationMessage:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  uint8_t buf[2];

  _PBLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  if (a3)
  {
    if (v5)
    {
      v8 = 0;
      v6 = "This application is not expected to prompt for paste authorization. A paste authentication message was sent, "
           "but rejected by pasted. Consult the logs from pasted to see why paste authentication was rejected.";
      v7 = (uint8_t *)&v8;
LABEL_7:
      _os_log_fault_impl(&dword_18C53A000, v4, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "This application is not expected to prompt for paste authorization. Please adopt secure paste controls instead.";
    v7 = buf;
    goto LABEL_7;
  }

}

- (void)helloCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PBServerConnection_helloCompletionBlock___block_invoke;
  v9[3] = &unk_1E2431168;
  v10 = v4;
  v6 = v4;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection helloCompletionBlock:]", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "helloCompletionBlock:", v6);
}

uint64_t __43__PBServerConnection_helloCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pasteboardWithName:(id)a3 completionBlock:(id)a4
{
  -[PBServerConnection pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:completionBlock:](self, "pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:completionBlock:", a3, 0, 0, 0, a4);
}

- (void)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 authenticationBlock:(id)a5 dataOwnerBlock:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v10 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke;
  v31[3] = &unk_1E2431168;
  v18 = v15;
  v32 = v18;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:completionBlock:]", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v12;
    v35 = 1024;
    v36 = v10;
    _os_log_impl(&dword_18C53A000, v21, OS_LOG_TYPE_INFO, "Retrieving pasteboard named %@, create if needed: %d", buf, 0x12u);
  }

  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke_5;
  v26[3] = &unk_1E2431190;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v30 = v18;
  v22 = v18;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  objc_msgSend(v20, "pasteboardWithName:createIfNeeded:completionBlock:", v25, v10, v26);

}

void __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[4];
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...retrieving pasteboard named %@ failed with error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = a1[4];
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...retrieving pasteboard named %@ completed successfully.", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v5, "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", a1[5], a1[6]);
  }
  v10 = a1[7];
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)localGeneralPasteboardWithAuthenticationBlock:(id)a3 completionBlock:(id)a4
{
  -[PBServerConnection localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:completionBlock:](self, "localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:completionBlock:", a3, 0, a4);
}

void __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke_7(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...retrieving local-only general pasteboard failed with error: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...retrieving local-only general pasteboard completed successfully.", (uint8_t *)&v10, 2u);
    }

    objc_msgSend(v5, "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", a1[4], a1[5]);
  }
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke;
  v23[3] = &unk_1E2431168;
  v13 = v9;
  v24 = v13;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection savePasteboard:dataProviderEndpoint:completionBlock:]", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_18C53A000, v16, OS_LOG_TYPE_INFO, "Saving pasteboard name %@", buf, 0xCu);

  }
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke_8;
  v20[3] = &unk_1E24311E0;
  v21 = v8;
  v22 = v13;
  v18 = v13;
  v19 = v8;
  objc_msgSend(v15, "savePasteboard:dataProviderEndpoint:completionBlock:", v19, v10, v20);

}

void __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...saving pasteboard failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...saving pasteboard completed successfully.", (uint8_t *)&v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setChangeCount:", objc_msgSend(v5, "changeCount"));
    objc_msgSend(v5, "sharingToken");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSharingToken:", v8);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)requestItemFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 typeIdentifier:(id)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 completionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a10;
  v20 = a9;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke;
  v32[3] = &unk_1E2431168;
  v22 = v19;
  v33 = v22;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection requestItemFromPasteboardWithName:UUID:authenticationMessage:itemIndex:typeIdentifier:dataOwner:loadContext:completionBlock:]", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    v35 = a6;
    v36 = 2112;
    v37 = v18;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_18C53A000, v25, OS_LOG_TYPE_INFO, "Requesting item %u of type %@ from pasteboard named %@, UUID %@", buf, 0x26u);
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke_10;
  v29[3] = &unk_1E2431208;
  v30 = v17;
  v31 = v22;
  v26 = v22;
  v27 = v17;
  objc_msgSend(v24, "requestItemFromPasteboardWithName:UUID:authenticationMessage:itemIndex:typeIdentifier:dataOwner:loadContext:completionBlock:", v15, v16, v27, a6, v18, a8, v20, v29);

}

void __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

  }
}

void __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  _PBLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_18C53A000, v14, OS_LOG_TYPE_ERROR, "...requesting item failed with error: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_18C53A000, v14, OS_LOG_TYPE_INFO, "...requesting item completed successfully.", (uint8_t *)&v16, 2u);
  }

  if (objc_msgSend(v11, "isAuthorizationAdmonished"))
    +[PBServerConnection simulateCrashReportForAuthorizationWithAuthenticationMessage:](PBServerConnection, "simulateCrashReportForAuthorizationWithAuthenticationMessage:", *(_QWORD *)(a1 + 32));
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, id, id, id, id))(v15 + 16))(v15, v9, v10, v11, v12);

}

- (void)requestPatternDetectionsFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 patterns:(id)a7 needValues:(BOOL)a8 dataOwner:(int64_t)a9 completionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  _BOOL4 v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v27 = a8;
  v40 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a10;
  v19 = a5;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke;
  v30[3] = &unk_1E2431168;
  v22 = v18;
  v31 = v22;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:]", v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v33 = v17;
    v34 = 2048;
    v35 = a6;
    v36 = 2112;
    v37 = v15;
    v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_18C53A000, v25, OS_LOG_TYPE_INFO, "Requesting detection of patterns %@ from item %lu of pasteboard named %@, UUID %@", buf, 0x2Au);
  }

  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke_12;
  v28[3] = &unk_1E2431230;
  v29 = v22;
  v26 = v22;
  objc_msgSend(v24, "requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:", v15, v16, v19, a6, v17, v27, a9, v28);

}

void __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...requesting pattern detection failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...requesting pattern detection completed successfully.", (uint8_t *)&v10, 2u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)deletePersistentPasteboardWithName:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke;
  v17[3] = &unk_1E2431168;
  v10 = v7;
  v18 = v10;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection deletePersistentPasteboardWithName:completionBlock:]", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_18C53A000, v13, OS_LOG_TYPE_INFO, "Deleting persistent pasteboard named %@", buf, 0xCu);
  }

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke_14;
  v15[3] = &unk_1E2431258;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v12, "deletePersistentPasteboardWithName:completionBlock:", v6, v15);

}

void __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _PBLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_18C53A000, v7, OS_LOG_TYPE_ERROR, "...deleting persistent pasteboard failed with error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_18C53A000, v7, OS_LOG_TYPE_INFO, "...deleting persistent pasteboard completed successfully.", (uint8_t *)&v9, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)didPastePasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18C53A000, v7, OS_LOG_TYPE_INFO, "Notifying pasted of a paste event.", v10, 2u);
  }

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "didPasteContentsFromPasteboardWithName:UUID:completionBlock:", v8, v9, &__block_literal_global_16);
}

- (void)performJanitorialTasksCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke;
  v15[3] = &unk_1E2431168;
  v7 = v4;
  v16 = v7;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection performJanitorialTasksCompletionBlock:]", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C53A000, v10, OS_LOG_TYPE_INFO, "Performing janitorial tasks.", buf, 2u);
  }

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke_17;
  v12[3] = &unk_1E2431110;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "performJanitorialTasksCompletionBlock:", v12);

}

uint64_t __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _PBLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C53A000, v2, OS_LOG_TYPE_INFO, "...janitorial tasks complete.", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getAllPasteboardsCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke;
  v15[3] = &unk_1E2431168;
  v7 = v4;
  v16 = v7;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection getAllPasteboardsCompletionBlock:]", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C53A000, v10, OS_LOG_TYPE_INFO, "Enumerating pasteboards.", buf, 2u);
  }

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke_18;
  v12[3] = &unk_1E2431280;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "getAllPasteboardsCompletionBlock:", v12);

}

uint64_t __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", 0, 0);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (id)pasteboardWithName:(id)a3 error:(id *)a4
{
  return -[PBServerConnection pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:error:](self, "pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:error:", a3, 0, 0, 0, a4);
}

void __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PBCannotConnectToServerError(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke_20(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...retrieving pasteboard named %@ failed with error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = a1[4];
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...retrieving pasteboard named %@ completed successfully.", (uint8_t *)&v16, 0xCu);
  }

  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;
  v13 = v5;

  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v6;

}

void __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PBCannotConnectToServerError(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...retrieving local-only general pasteboard failed with error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...retrieving local-only general pasteboard completed successfully.", (uint8_t *)&v14, 2u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

- (id)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[7];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke;
  v20[3] = &unk_1E24312A8;
  v20[4] = &v31;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection savePasteboard:dataProviderEndpoint:error:]", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v15;
    _os_log_impl(&dword_18C53A000, v14, OS_LOG_TYPE_INFO, "Saving pasteboard name %@", buf, 0xCu);

  }
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke_22;
  v19[3] = &unk_1E2431320;
  v19[4] = &v21;
  v19[5] = &v31;
  v19[6] = &v25;
  objc_msgSend(v13, "savePasteboard:dataProviderEndpoint:completionBlock:", v8, v9, v19);
  v16 = (void *)v32[5];
  if (v16)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v16);
  }
  else
  {
    objc_msgSend(v8, "setChangeCount:", v22[3]);
  }
  v17 = (id)v26[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v17;
}

void __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PBCannotConnectToServerError(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke_22(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _PBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_18C53A000, v8, OS_LOG_TYPE_ERROR, "...saving pasteboard failed with error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_18C53A000, v8, OS_LOG_TYPE_INFO, "...saving pasteboard completed successfully.", (uint8_t *)&v14, 2u);
  }

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v5, "changeCount");
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;

}

- (unint64_t)deletePersistentPasteboardWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke;
  v15[3] = &unk_1E24312A8;
  v15[4] = &v20;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection deletePersistentPasteboardWithName:error:]", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_18C53A000, v11, OS_LOG_TYPE_INFO, "Deleting persistent pasteboard named %@", buf, 0xCu);
  }

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke_23;
  v14[3] = &unk_1E2431348;
  v14[4] = &v16;
  v14[5] = &v20;
  objc_msgSend(v10, "deletePersistentPasteboardWithName:completionBlock:", v6, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = v17[3];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PBCannotConnectToServerError(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _PBLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_18C53A000, v7, OS_LOG_TYPE_ERROR, "...deleting persistent pasteboard failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18C53A000, v7, OS_LOG_TYPE_INFO, "...deleting persistent pasteboard completed successfully.", (uint8_t *)&v10, 2u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (id)remoteContentForSlotStyle:(id)a3 pasteButtonTag:(id)a4 error:(id *)a5
{
  return -[PBServerConnection remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:error:](self, "remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:error:", 0, a3, a4, a5);
}

- (id)remoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a4;
  v11 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke;
  v19[3] = &unk_1E24312A8;
  v19[4] = &v26;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:error:]", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke_2;
  v18[3] = &unk_1E2431370;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v15, "getRemoteContentForLayerContextWithId:slotStyle:pasteButtonTag:completionBlock:", a3, v10, v11, v18);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  v16 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PBCannotConnectToServerError(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __67__PBServerConnection_beginListeningToPasteboardChangeNotifications__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _notificationQueue_getState());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.pasteboard.changed"), 0, v1);

}

- (id)requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v18;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  -[PBServerConnection serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke;
  v20[3] = &unk_1E24312A8;
  v20[4] = &v21;
  _loggingErrorHandler((uint64_t)"-[PBServerConnection requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:error:]", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _PBLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C53A000, v12, OS_LOG_TYPE_INFO, "Requesting authentication message for secure paste", buf, 2u);
  }

  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke_34;
  v19[3] = &unk_1E2431410;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend(v11, "requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock:", a3, a4, v19);
  v13 = v28[5];
  _PBLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C53A000, v15, OS_LOG_TYPE_INFO, "Successfully generated authentication message.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v18 = v22[5];
    *(_DWORD *)buf = 138412290;
    v34 = v18;
    _os_log_error_impl(&dword_18C53A000, v15, OS_LOG_TYPE_ERROR, "Authentication message was not generated: %@", buf, 0xCu);
  }

  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  v16 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

void __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PBCannotConnectToServerError(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke_34(uint64_t a1, void *a2, void *a3)
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

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQ_serverConnection, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end
