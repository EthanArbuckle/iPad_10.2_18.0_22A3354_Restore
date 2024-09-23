@implementation UASharedPasteboardManager

+ (void)initialize
{
  id v2;

  +[UASharedPasteboardIRManager sharedIRManager](UASharedPasteboardIRManager, "sharedIRManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initializeConverters");

}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  return (id)sharedManager_result;
}

void __42__UASharedPasteboardManager_sharedManager__block_invoke()
{
  UASharedPasteboardManager *v0;
  void *v1;

  v0 = objc_alloc_init(UASharedPasteboardManager);
  v1 = (void *)sharedManager_result;
  sharedManager_result = (uint64_t)v0;

}

+ (BOOL)dontConnectToServer
{
  char *v2;

  v2 = getenv("__UAUSERACTIVITYDONTCONNECTTOUSERACTIVITYD");
  if (v2)
    LOBYTE(v2) = atoi(v2) != 0;
  return (char)v2;
}

- (UASharedPasteboardManager)init
{
  UASharedPasteboardManager *v2;
  dispatch_queue_t v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UASharedPasteboardManager *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  UASharedPasteboardManager *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  UASharedPasteboardManager *v29;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)UASharedPasteboardManager;
  v2 = -[UASharedPasteboardManager init](&v30, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("UAPasteboardServerQ", 0);
    -[UASharedPasteboardManager setServerQ:](v2, "setServerQ:", v3);

    v4 = dispatch_queue_create("UAPasteboardReadingQ", 0);
    -[UASharedPasteboardManager setPasteboardReadQ:](v2, "setPasteboardReadQ:", v4);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E60143D8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager setDisallowedTypesForSending:](v2, "setDisallowedTypesForSending:", v5);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E60143F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager setDisallowedTypesForReceiving:](v2, "setDisallowedTypesForReceiving:", v6);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6014408);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager setBomCheckTypes:](v2, "setBomCheckTypes:", v7);

    v31[0] = CFSTR("public.utf16-plain-text");
    v31[1] = CFSTR("public.utf16-external-plain-text");
    v32[0] = &unk_1E6014420;
    v32[1] = &unk_1E6014438;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager setTypeBOMs:](v2, "setTypeBOMs:", v8);

    -[UASharedPasteboardManager setTypeAliases:](v2, "setTypeAliases:", &unk_1E60144F8);
    v9 = objc_msgSend((id)objc_opt_class(), "dontConnectToServer");
    v10 = MEMORY[0x1E0C809B0];
    if ((v9 & 1) == 0)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3B38]);
      UASharedPasteboardManagerServiceName();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithMachServiceName:options:", v12, 0);
      -[UASharedPasteboardManager setConnection:](v2, "setConnection:", v13);

      _UAGetSharedPasteboardManagerProtocolInterface();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UASharedPasteboardManager connection](v2, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRemoteObjectInterface:", v14);

      -[UASharedPasteboardManager connection](v2, "connection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setExportedObject:", v2);

      _UAGetSharedPasteboardManagerResponseProtocolInterface();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UASharedPasteboardManager connection](v2, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setExportedInterface:", v17);

      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x3032000000;
      v28[3] = __Block_byref_object_copy__1;
      v28[4] = __Block_byref_object_dispose__1;
      v19 = v2;
      v29 = v19;
      -[UASharedPasteboardManager connection](v19, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInterruptionHandler:", &__block_literal_global_59);

      v27[0] = v10;
      v27[1] = 3221225472;
      v27[2] = __33__UASharedPasteboardManager_init__block_invoke_62;
      v27[3] = &unk_1E6007870;
      v27[4] = v28;
      -[UASharedPasteboardManager connection](v19, "connection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setInvalidationHandler:", v27);

      -[UASharedPasteboardManager connection](v19, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "resume");

      _Block_object_dispose(v28, 8);
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager setControllSyncObject:](v2, "setControllSyncObject:", v23);

    -[UASharedPasteboardManager setUpdateScheduled:](v2, "setUpdateScheduled:", 0);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __33__UASharedPasteboardManager_init__block_invoke_64;
    block[3] = &unk_1E6007310;
    v26 = v2;
    if (init_sRegisterForReconnectionMessageOnce != -1)
      dispatch_once(&init_sRegisterForReconnectionMessageOnce, block);

  }
  return v2;
}

void __33__UASharedPasteboardManager_init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF7EB000, v0, OS_LOG_TYPE_DEFAULT, "PBOARD CONNECTION INTURRUPTED", v1, 2u);
  }

}

void __33__UASharedPasteboardManager_init__block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void (**v4)(void);
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_DEFAULT, "PBOARD CONNECTION INVALIDATED: to useractivityd; all future attempts to use it will fail.",
      v7,
      2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setCompletionBlock:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setConnection:", 0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __33__UASharedPasteboardManager_init__block_invoke_64(uint64_t a1)
{
  NSObject *v2;
  _QWORD handler[4];
  id v4;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__UASharedPasteboardManager_init__block_invoke_2;
  handler[3] = &unk_1E60078C0;
  v4 = *(id *)(a1 + 32);
  notify_register_dispatch("com.apple.coreservices.useractivity.reconnection", (int *)&init_sRegisterForReconnectionNotificationToken, v2, handler);

}

void __33__UASharedPasteboardManager_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  id buf[2];

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  objc_msgSend(*(id *)(a1 + 32), "controllSyncObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_INFO, "Received reconnect notification", (uint8_t *)buf, 2u);
  }

  if ((int)objc_msgSend(*(id *)(a1 + 32), "disableCount") < 1)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_INFO, "No need to reconnect", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "Client has disable count > 0, reconnecting", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, *(id *)(a1 + 32));
    v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
    UASharedPasteboardControllServiceName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithMachServiceName:options:", v7, 0);
    objc_msgSend(*(id *)(a1 + 32), "setControllConnection:", v8);

    _UAGetSharedPasteboardControllProtocolInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controllConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v9);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __33__UASharedPasteboardManager_init__block_invoke_66;
    v18[3] = &unk_1E6007898;
    objc_copyWeak(&v19, buf);
    objc_msgSend(*(id *)(a1 + 32), "controllConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInvalidationHandler:", v18);

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_INFO, "Resuming connection", v17, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "controllConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

    objc_msgSend(*(id *)(a1 + 32), "controllConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startConnection:", getpid());

    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v3);

  objc_autoreleasePoolPop(v2);
}

void __33__UASharedPasteboardManager_init__block_invoke_66(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "Controll connection invalidated, should reconnect when UA launches again", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setControllConnection:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UASharedPasteboardManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UASharedPasteboardManager controllConnection](self, "controllConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)UASharedPasteboardManager;
  -[UASharedPasteboardManager dealloc](&v5, sel_dealloc);
}

- (void)startPreventingPasteboardSharing
{
  void *v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  id buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UASharedPasteboardManager controllSyncObject](self, "controllSyncObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[UASharedPasteboardManager setDisableCount:](self, "setDisableCount:", -[UASharedPasteboardManager disableCount](self, "disableCount") + 1);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = -[UASharedPasteboardManager disableCount](self, "disableCount");
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "Calling in to disable UC, count: %d", (uint8_t *)&buf, 8u);
  }

  -[UASharedPasteboardManager controllConnection](self, "controllConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    objc_initWeak(&buf, self);
    v7 = objc_alloc(MEMORY[0x1E0CB3B38]);
    UASharedPasteboardControllServiceName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithMachServiceName:options:", v8, 0);
    -[UASharedPasteboardManager setControllConnection:](self, "setControllConnection:", v9);

    _UAGetSharedPasteboardControllProtocolInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager controllConnection](self, "controllConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v10);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__UASharedPasteboardManager_startPreventingPasteboardSharing__block_invoke;
    v18[3] = &unk_1E6007898;
    objc_copyWeak(&v19, &buf);
    -[UASharedPasteboardManager controllConnection](self, "controllConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInvalidationHandler:", v18);

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1AF7EB000, v13, OS_LOG_TYPE_INFO, "Resuming connection", v17, 2u);
    }

    -[UASharedPasteboardManager controllConnection](self, "controllConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    -[UASharedPasteboardManager controllConnection](self, "controllConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startConnection:", getpid());

    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
  objc_sync_exit(v3);

}

void __61__UASharedPasteboardManager_startPreventingPasteboardSharing__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "Controll connection invalidated, should reconnect when UA launches again", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setControllConnection:", 0);

}

- (void)stopPreventingPasteboardSharing
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[UASharedPasteboardManager controllSyncObject](self, "controllSyncObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = -[UASharedPasteboardManager disableCount](self, "disableCount");
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "Calling in to cancel disable, count: %d", (uint8_t *)v7, 8u);
  }

  if (-[UASharedPasteboardManager disableCount](self, "disableCount") >= 1)
  {
    -[UASharedPasteboardManager setDisableCount:](self, "setDisableCount:", -[UASharedPasteboardManager disableCount](self, "disableCount") - 1);
    if (!-[UASharedPasteboardManager disableCount](self, "disableCount"))
    {
      _uaGetLogForCategory(CFSTR("pasteboard-client"));
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating connection, count is 0", (uint8_t *)v7, 2u);
      }

      -[UASharedPasteboardManager controllConnection](self, "controllConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");

      -[UASharedPasteboardManager setControllConnection:](self, "setControllConnection:", 0);
    }
  }
  objc_sync_exit(v3);

}

- (BOOL)typeIsDisallowedForSending:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UASharedPasteboardManager disallowedTypesForSending](self, "disallowedTypesForSending");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[UASharedPasteboardManager disallowedTypesForSending](self, "disallowedTypesForSending", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v9 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v8);
            v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = (void *)v13;
            if (v12)
              v15 = v13 == 0;
            else
              v15 = 1;
            if (!v15 && (objc_msgSend(v12, "conformsToType:", v13) & 1) != 0)
            {

              LOBYTE(v7) = 1;
              goto LABEL_19;
            }

          }
          v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_19:

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)typeIsDisallowedForReceiving:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UASharedPasteboardManager disallowedTypesForReceiving](self, "disallowedTypesForReceiving");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[UASharedPasteboardManager disallowedTypesForReceiving](self, "disallowedTypesForReceiving", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v9 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v8);
            v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = (void *)v13;
            if (v12)
              v15 = v13 == 0;
            else
              v15 = 1;
            if (!v15 && (objc_msgSend(v12, "conformsToType:", v13) & 1) != 0)
            {

              LOBYTE(v7) = 1;
              goto LABEL_19;
            }

          }
          v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_19:

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)addData:(id)a3 toItemAtIndex:(unint64_t)a4 generation:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  _BOOL4 v26;
  UAPasteboardGeneration *v27;
  UASharedPasteboardManager *v28;
  void *v29;
  dispatch_time_t v30;
  NSObject *v31;
  id v32;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEBUG, "Adding type: %@ to item: %@ in generation: %@", buf, 0x20u);

  }
  -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend(v8, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UASharedPasteboardManager typeIsDisallowedForSending:](self, "typeIsDisallowedForSending:", v14);

  if (v15)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring disallowed type: %{public}@", buf, 0xCu);

    }
LABEL_9:
    v24 = 0;
    goto LABEL_13;
  }
  -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "generation") > a5;

  if (v19)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "generation"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      v38 = 2114;
      v39 = v23;
      _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_ERROR, "Ignoring item, new generation (%{public}@) is older than current generation (%{public}@)", buf, 0x16u);

    }
    goto LABEL_9;
  }
  -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "generation") == a5;

  if (!v26)
  {
    v27 = -[UAPasteboardGeneration initWithGeneration:]([UAPasteboardGeneration alloc], "initWithGeneration:", a5);
    -[UASharedPasteboardManager setCurrentGeneration:](self, "setCurrentGeneration:", v27);

  }
  -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
  v16 = objc_claimAutoreleasedReturnValue();
  v24 = -[NSObject addType:toItemAtIndex:](v16, "addType:toItemAtIndex:", v8, a4);
LABEL_13:

  -[UASharedPasteboardManager setCurrentGenerationHasUpdates:](self, "setCurrentGenerationHasUpdates:", -[UASharedPasteboardManager currentGenerationHasUpdates](self, "currentGenerationHasUpdates") | v24);
  objc_sync_exit(v13);

  v28 = self;
  objc_sync_enter(v28);
  if (((-[UASharedPasteboardManager updateScheduled](v28, "updateScheduled") | v24 ^ 1) & 1) == 0)
  {
    -[UASharedPasteboardManager currentGeneration](v28, "currentGeneration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardManager sendUpdateToServer:](v28, "sendUpdateToServer:", v29);
    -[UASharedPasteboardManager setUpdateScheduled:](v28, "setUpdateScheduled:", 1);
    v30 = dispatch_time(0, 50000000);
    dispatch_get_global_queue(25, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __62__UASharedPasteboardManager_addData_toItemAtIndex_generation___block_invoke;
    v34[3] = &unk_1E60078E8;
    v34[4] = v28;
    v35 = v29;
    v32 = v29;
    dispatch_after(v30, v31, v34);

  }
  objc_sync_exit(v28);

  return v24;
}

void __62__UASharedPasteboardManager_addData_toItemAtIndex_generation___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  objc_msgSend(*(id *)(a1 + 32), "sendUpdateToServer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setUpdateScheduled:", 0);
  objc_autoreleasePoolPop(v2);
}

- (void)sendUpdateToServer:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  UASharedPasteboardTypeInfo *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  UASharedPasteboardItemInfo *v39;
  UASharedPasteboardInfo *v40;
  NSObject *v41;
  UASharedPasteboardInfo *v42;
  uint64_t v43;
  id v44;
  id obj;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  id v53;
  uint64_t i;
  void *v55;
  _QWORD block[5];
  UASharedPasteboardInfo *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  objc_msgSend(v44, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v43 = objc_msgSend(v44, "generation");
  objc_msgSend(v44, "getTypePaths");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v44, "allTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = v6;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEFAULT, "Sending pasteboard update to server: %@", buf, 0xCu);

  }
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v64 = 0u;
  v63 = 0u;
  obj = v4;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v48)
  {
    v46 = *(_QWORD *)v64;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v64 != v46)
        {
          v8 = v7;
          objc_enumerationMutation(obj);
          v7 = v8;
        }
        v49 = v7;
        v9 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v7);
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = v9;
        objc_sync_enter(v11);
        v53 = v11;
        objc_msgSend(v11, "types");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v12, "count");

        objc_sync_exit(v53);
        if (v52)
        {
          for (i = 0; i != v52; ++i)
          {
            objc_msgSend(v53, "types");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", i);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = objc_alloc_init(UASharedPasteboardTypeInfo);
            if (objc_msgSend(v55, "conformsToProtocol:", &unk_1EEE63170))
            {
              v15 = v55;
              objc_msgSend(v15, "uuid");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[UASharedPasteboardTypeInfo setUuid:](v14, "setUuid:", v16);

              if (objc_msgSend(v15, "preferFileRep"))
              {
                -[UASharedPasteboardTypeInfo setType:](v14, "setType:", CFSTR("public.file-url"));
              }
              else
              {
                objc_msgSend(v15, "type");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[UASharedPasteboardTypeInfo setType:](v14, "setType:", v21);

              }
              objc_msgSend(v15, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[UASharedPasteboardTypeInfo setTypeHint:](v14, "setTypeHint:", v23);

              -[UASharedPasteboardTypeInfo typeHint](v14, "typeHint");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                goto LABEL_17;
              if ((objc_opt_respondsToSelector() & 1) == 0)
                goto LABEL_18;
              _uaGetLogForCategory(CFSTR("pasteboard-client"));
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1AF7EB000, v38, OS_LOG_TYPE_DEFAULT, "TypeHint nil, trying to get filename", buf, 2u);
              }

              objc_msgSend(v15, "getFileName");
              v19 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v55, "type");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[UASharedPasteboardTypeInfo setType:](v14, "setType:", v17);

              objc_msgSend(v55, "uuid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[UASharedPasteboardTypeInfo setUuid:](v14, "setUuid:", v18);

              objc_msgSend(v55, "uuid");
              v15 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectForKeyedSubscript:", v15);
              v19 = objc_claimAutoreleasedReturnValue();
            }
            v20 = (void *)v19;
            -[UASharedPasteboardTypeInfo setTypeHint:](v14, "setTypeHint:", v19);
LABEL_17:

LABEL_18:
            v24 = objc_msgSend(v10, "count");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[UASharedPasteboardTypeInfo setIndex:](v14, "setIndex:", v25);

            -[UASharedPasteboardTypeInfo type](v14, "type");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKey:", v14, v26);

            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            -[UASharedPasteboardManager typeAliases](self, "typeAliases");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "type");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v60;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v60 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                  _uaGetLogForCategory(CFSTR("pasteboard-client"));
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v55, "type");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v68 = v33;
                    v69 = 2112;
                    v70 = v35;
                    _os_log_impl(&dword_1AF7EB000, v34, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Adding alias: %@ for type: %@", buf, 0x16u);

                  }
                  v36 = (void *)-[UASharedPasteboardTypeInfo copy](v14, "copy");
                  objc_msgSend(v36, "setType:", v33);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24 + j + 1);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setIndex:", v37);

                  objc_msgSend(v10, "setObject:forKey:", v36, v33);
                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
                v24 += j;
              }
              while (v30);
            }

          }
        }
        v39 = objc_alloc_init(UASharedPasteboardItemInfo);
        -[UASharedPasteboardItemInfo setTypes:](v39, "setTypes:", v10);
        objc_msgSend(v47, "addObject:", v39);

        v7 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v48);
  }

  v40 = objc_alloc_init(UASharedPasteboardInfo);
  -[UASharedPasteboardInfo setItems:](v40, "setItems:", v47);
  -[UASharedPasteboardManager serverQ](self, "serverQ");
  v41 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UASharedPasteboardManager_sendUpdateToServer___block_invoke;
  block[3] = &unk_1E6007930;
  block[4] = self;
  v57 = v40;
  v58 = v43;
  v42 = v40;
  dispatch_async(v41, block);

}

void __48__UASharedPasteboardManager_sendUpdateToServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_145_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localPasteboardTypesDidChange:forGeneration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentGeneration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v5, "generation");
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_INFO, "Did send update to server for generation: %lu", (uint8_t *)&v6, 0xCu);

  }
}

void __48__UASharedPasteboardManager_sendUpdateToServer___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF7EB000, v0, OS_LOG_TYPE_ERROR, "Error getting server connection", v1, 2u);
  }

}

- (void)clearLocalPasteboardInformation
{
  NSObject *v3;
  uint8_t v4[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Clearing local pasteboard information", v4, 2u);
  }

  -[UASharedPasteboardManager setCurrentGeneration:](self, "setCurrentGeneration:", 0);
  -[UASharedPasteboardManager doClearLocalPasteboardInfo](self, "doClearLocalPasteboardInfo");
}

- (void)writeLocalPasteboardToFile:(id)a3 itemDir:(id)a4 extension:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5)
  {
    v13 = a5;
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1AF7EB000, v14, OS_LOG_TYPE_INFO, "Consuming extension to gain access to %{public}@", buf, 0xCu);
    }

    v15 = objc_retainAutorelease(v13);
    objc_msgSend(v15, "bytes");

    v16 = sandbox_extension_consume();
  }
  else
  {
    v16 = 0;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_extension_withCompletion___block_invoke;
  v18[3] = &unk_1E6007958;
  v19 = v12;
  v20 = v16;
  v17 = v12;
  -[UASharedPasteboardManager writeLocalPasteboardToFile:itemDir:withCompletion:](self, "writeLocalPasteboardToFile:itemDir:withCompletion:", v10, v11, v18);

}

void __89__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_extension_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
    if (*(_QWORD *)(a1 + 40))
      sandbox_extension_release();
  }

}

- (void)writeLocalPasteboardToFile:(id)a3 itemDir:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke;
  v15[3] = &unk_1E6007980;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  UASharedPasteboardInfo *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  UASharedPasteboardItemInfo *v17;
  UASharedPasteboardInfo *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[5];
  UASharedPasteboardInfo *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5DFD11C]();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    +[UASharedPasteboardIRManager sharedIRManager](UASharedPasteboardIRManager, "sharedIRManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registeredConverters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_INFO, "PBIR Converters: %{public}@", buf, 0xCu);

  }
  objc_msgSend(a1[4], "currentGeneration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(a1[4], "currentGeneration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(a1[4], "setCurrentGenerationHasUpdates:", 0);
  objc_sync_exit(v7);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v27;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v11);
      if (v13)
        break;
      v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
      v17 = objc_alloc_init(UASharedPasteboardItemInfo);
      objc_msgSend(a1[4], "serializeItem:intoInfo:withFile:intoDir:", v16, v17, a1[5], a1[6]);
      v13 = (UASharedPasteboardInfo *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v17);

      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v12)
          goto LABEL_5;

        if (!v13)
          goto LABEL_16;
LABEL_14:
        (*((void (**)(void))a1[7] + 2))();
        goto LABEL_22;
      }
    }

    goto LABEL_14;
  }

LABEL_16:
  v18 = objc_alloc_init(UASharedPasteboardInfo);
  -[UASharedPasteboardInfo setDataFile:](v18, "setDataFile:", a1[5]);
  if ((unint64_t)objc_msgSend(a1[5], "offsetInFile") >> 31)
    v19 = 0;
  else
    v19 = objc_msgSend(a1[5], "offsetInFile");
  -[UASharedPasteboardInfo setDataSize:](v18, "setDataSize:", v19);
  -[UASharedPasteboardInfo setItems:](v18, "setItems:", v3);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v20, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Queueing block to check for pasteboard changes", buf, 2u);
  }

  dispatch_get_global_queue(25, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke_147;
  v22[3] = &unk_1E6007980;
  v22[4] = a1[4];
  v23 = v18;
  v24 = a1[6];
  v25 = a1[7];
  v13 = v18;
  dispatch_async(v21, v22);

LABEL_22:
  objc_autoreleasePoolPop(v2);
}

void __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke_147(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  objc_msgSend(*(id *)(a1 + 32), "pickupLocalChanges:iterNumber:cloneDir:completionHandler:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

- (void)pickupLocalChanges:(id)a3 iterNumber:(int64_t)a4 cloneDir:(id)a5 completionHandler:(id)a6
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  UASharedPasteboardTypeInfo *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  int64_t v52;
  uint64_t v53;
  void (**v54)(id, _QWORD);
  void *v55;
  void (**v56)(void);
  void *v57;
  id v58;
  unint64_t v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v65;
  uint64_t v66;
  UASharedPasteboardItemInfo *v67;
  void *v68;
  _QWORD block[5];
  id v70;
  id v71;
  void (**v72)(id, _QWORD);
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  int64_t v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v52 = a4;
  v88 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v58 = a5;
  v54 = (void (**)(id, _QWORD))a6;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v83 = v52;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "[Local Pasteboard] Checking for pasteboard updates count: %ld", buf, 0xCu);
  }

  -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  if (-[UASharedPasteboardManager currentGenerationHasUpdates](self, "currentGenerationHasUpdates"))
  {
    -[UASharedPasteboardManager setCurrentGenerationHasUpdates:](self, "setCurrentGenerationHasUpdates:", 0);
    -[UASharedPasteboardManager currentGeneration](self, "currentGeneration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v11, "copy");

    objc_sync_exit(v9);
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF7EB000, v12, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Pasteboard has changes, picking them up", buf, 2u);
    }

    -[UASharedPasteboardManager setCurrentGenerationHasUpdates:](self, "setCurrentGenerationHasUpdates:", 0);
    if (objc_msgSend(v55, "count"))
    {
      v59 = 0;
      v13 = 0;
      while (!v13)
      {
        objc_msgSend(v55, "objectAtIndexedSubscript:", v59);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "items");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") > v59;

        if (v15)
        {
          objc_msgSend(v65, "items");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v59);
          v67 = (UASharedPasteboardItemInfo *)objc_claimAutoreleasedReturnValue();

          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          objc_msgSend(v57, "types");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
          if (v63)
          {
            v61 = *(_QWORD *)v79;
LABEL_12:
            v17 = 0;
            while (1)
            {
              if (*(_QWORD *)v79 != v61)
              {
                v18 = v17;
                objc_enumerationMutation(obj);
                v17 = v18;
              }
              v66 = v17;
              v68 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v17);
              -[UASharedPasteboardItemInfo types](v67, "types", v52);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "allKeys");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "type");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "containsObject:", v21);

              if ((v22 & 1) == 0)
              {
                v23 = objc_alloc_init(UASharedPasteboardTypeInfo);
                if (objc_msgSend(v68, "conformsToProtocol:", &unk_1EEE63170)
                  && objc_msgSend(v68, "preferFileRep"))
                {
                  objc_msgSend(v65, "dataFile");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UASharedPasteboardManager serializeFileType:intoInfo:withFile:intoDir:](self, "serializeFileType:intoInfo:withFile:intoDir:", v68, v23, v24, v58);
                  v62 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v65, "dataFile");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UASharedPasteboardManager serializeType:intoInfo:withFile:](self, "serializeType:intoInfo:withFile:", v68, v23, v24);
                  v62 = objc_claimAutoreleasedReturnValue();
                }

                objc_msgSend(v65, "dataFile");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "synchronizeFile");

                -[UASharedPasteboardItemInfo types](v67, "types");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (void *)objc_msgSend(v26, "mutableCopy");

                v28 = objc_msgSend(v27, "count");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[UASharedPasteboardTypeInfo setIndex:](v23, "setIndex:", v29);

                objc_msgSend(v68, "type");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", v23, v30);

                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                -[UASharedPasteboardManager typeAliases](self, "typeAliases");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[UASharedPasteboardTypeInfo type](v23, "type");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
                if (v34)
                {
                  v35 = *(_QWORD *)v75;
                  do
                  {
                    for (i = 0; i != v34; ++i)
                    {
                      if (*(_QWORD *)v75 != v35)
                        objc_enumerationMutation(v33);
                      v37 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                      _uaGetLogForCategory(CFSTR("pasteboard-client"));
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v68, "type");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v83 = (int64_t)v37;
                        v84 = 2112;
                        v85 = v39;
                        _os_log_impl(&dword_1AF7EB000, v38, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Adding alias: %@ for type: %@", buf, 0x16u);

                      }
                      v40 = (void *)-[UASharedPasteboardTypeInfo copy](v23, "copy");
                      objc_msgSend(v40, "setType:", v37);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28 + i + 1);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "setIndex:", v41);

                      objc_msgSend(v27, "setObject:forKey:", v40, v37);
                    }
                    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
                    v28 += i;
                  }
                  while (v34);
                }

                -[UASharedPasteboardItemInfo setTypes:](v67, "setTypes:", v27);
                if (v62)
                  break;
              }
              v17 = v66 + 1;
              if (v66 + 1 == v63)
              {
                v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
                if (v63)
                  goto LABEL_12;
                goto LABEL_32;
              }
            }
          }
          else
          {
LABEL_32:
            v62 = 0;
          }
        }
        else
        {
          v67 = objc_alloc_init(UASharedPasteboardItemInfo);
          objc_msgSend(v65, "dataFile");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[UASharedPasteboardManager serializeItem:intoInfo:withFile:intoDir:](self, "serializeItem:intoInfo:withFile:intoDir:", v57, v67, v42, v58);
          v62 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "items");
          obj = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "arrayByAddingObject:", v67);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setItems:", v43);

        }
        v44 = objc_msgSend(v55, "count");
        ++v59;
        v13 = (void *)v62;
        if (v44 <= v59)
        {
          if (!v62)
            goto LABEL_41;
          break;
        }
      }
      v45 = v13;
      v54[2](v54, 0);

    }
    else
    {
LABEL_41:
      objc_msgSend(v65, "dataFile", v52);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v48, "offsetInFile") >> 31)
      {
        objc_msgSend(v65, "setDataSize:", 0);
      }
      else
      {
        objc_msgSend(v65, "dataFile");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setDataSize:", objc_msgSend(v49, "offsetInFile"));

      }
      _uaGetLogForCategory(CFSTR("pasteboard-client"));
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v50, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Queueing block to check for pasteboard changes", buf, 2u);
      }

      dispatch_get_global_queue(25, 0);
      v51 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__UASharedPasteboardManager_pickupLocalChanges_iterNumber_cloneDir_completionHandler___block_invoke;
      block[3] = &unk_1E60079A8;
      block[4] = self;
      v70 = v65;
      v73 = v53;
      v71 = v58;
      v72 = v54;
      dispatch_async(v51, block);

    }
  }
  else
  {
    objc_sync_exit(v9);

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v83 = (int64_t)v65;
      _os_log_impl(&dword_1AF7EB000, v46, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] No updates, sending pasteboard info to server: %@", buf, 0xCu);
    }

    ((void (*)(void (**)(id, _QWORD), id, _QWORD))v54[2])(v54, v65, 0);
    -[UASharedPasteboardManager localPasteboardWasFetched](self, "localPasteboardWasFetched");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      -[UASharedPasteboardManager localPasteboardWasFetched](self, "localPasteboardWasFetched");
      v56 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v56[2]();

    }
  }

}

void __86__UASharedPasteboardManager_pickupLocalChanges_iterNumber_cloneDir_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5DFD11C]();
  objc_msgSend(*(id *)(a1 + 32), "pickupLocalChanges:iterNumber:cloneDir:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

- (id)serializeItem:(id)a3 intoInfo:(id)a4 withFile:(id)a5 intoDir:(id)a6
{
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  UASharedPasteboardTypeInfo *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  BOOL v33;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v35 = a4;
  v37 = a5;
  v36 = a6;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v40, "types");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v49 = v40;
    v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_INFO, "[Local Pasteboard] Serializing item: %@ with types: %@", buf, 0x16u);

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v40, "types");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  if (v13)
  {
    v32 = 0;
  }
  else
  {
    v41 = 0;
    do
    {
      objc_msgSend(v40, "types");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc_init(UASharedPasteboardTypeInfo);
      if (objc_msgSend(v42, "conformsToProtocol:", &unk_1EEE63170)
        && objc_msgSend(v42, "preferFileRep"))
      {
        -[UASharedPasteboardManager serializeFileType:intoInfo:withFile:intoDir:](self, "serializeFileType:intoInfo:withFile:intoDir:", v42, v15, v37, v36);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[UASharedPasteboardManager serializeType:intoInfo:withFile:](self, "serializeType:intoInfo:withFile:", v42, v15, v37);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(v11, "count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UASharedPasteboardTypeInfo setIndex:](v15, "setIndex:", v17);

      -[UASharedPasteboardTypeInfo type](v15, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v15, v18);

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[UASharedPasteboardManager typeAliases](self, "typeAliases");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UASharedPasteboardTypeInfo type](v15, "type");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v44 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            _uaGetLogForCategory(CFSTR("pasteboard-client"));
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v42, "type");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v49 = v25;
              v50 = 2112;
              v51 = v27;
              _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Adding alias: %@ for type: %@", buf, 0x16u);

            }
            v28 = (void *)-[UASharedPasteboardTypeInfo copy](v15, "copy");
            objc_msgSend(v28, "setType:", v25);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 + i + 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setIndex:", v29);

            objc_msgSend(v11, "setObject:forKey:", v28, v25);
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          v16 += i;
        }
        while (v22);
      }

      objc_msgSend(v40, "types");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count") > (unint64_t)++v41;

      v32 = (void *)v38;
      if (v38)
        v33 = 0;
      else
        v33 = v31;
    }
    while (v33);
  }
  objc_msgSend(v37, "synchronizeFile");
  objc_msgSend(v35, "setTypes:", v11);

  return v32;
}

- (id)serializeFileType:(id)a3 intoInfo:(id)a4 withFile:(id)a5 intoDir:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_time_t v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = dispatch_group_create();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  v42 = 0;
  objc_msgSend(v10, "setType:", CFSTR("public.file-url"));
  objc_msgSend(v9, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUuid:", v14);

  objc_msgSend(v10, "setPreferFileRep:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "getFileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTypeHint:", v15);

  }
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = v17;
    v45 = 2112;
    v46 = v18;
    _os_log_impl(&dword_1AF7EB000, v16, OS_LOG_TYPE_INFO, "[Local Pasteboard] Serializing type as file: %@-%@", buf, 0x16u);

  }
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v12;
    _os_log_impl(&dword_1AF7EB000, v19, OS_LOG_TYPE_INFO, "[Local Pasteboard] Clone Dir: %@", buf, 0xCu);
  }

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v20, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Enter Type Group", buf, 2u);
  }

  dispatch_group_enter(v13);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __73__UASharedPasteboardManager_serializeFileType_intoInfo_withFile_intoDir___block_invoke;
  v30[3] = &unk_1E60079D0;
  v21 = v9;
  v31 = v21;
  v36 = &v37;
  v22 = v12;
  v32 = v22;
  v23 = v10;
  v33 = v23;
  v24 = v11;
  v34 = v24;
  v25 = v13;
  v35 = v25;
  objc_msgSend(v21, "getDataFileWithCompletionBlock:", v30);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v26, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Waiting on Type Group", buf, 2u);
  }

  v27 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v25, v27);
  v28 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  return v28;
}

void __73__UASharedPasteboardManager_serializeFileType_intoInfo_withFile_intoDir___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
      goto LABEL_31;
    }
    objc_msgSend(*(id *)(a1 + 32), "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v8;
    v54 = 2112;
    v55 = v6;
    v9 = "[Local Pasteboard] ERROR: error getting type data for type[%@]: %@";
    v10 = v7;
    v11 = 22;
LABEL_4:
    _os_log_impl(&dword_1AF7EB000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);

    goto LABEL_5;
  }
  if (!v5)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v8;
    v9 = "[Local Pasteboard] ERROR: url is nil for type[%@]";
    v10 = v7;
    v11 = 12;
    goto LABEL_4;
  }
  objc_msgSend(v5, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isReadableFileAtPath:", v17);

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v23 = objc_msgSend(v22, "removeItemAtURL:error:", v15, &v51);
      v24 = v51;

      if ((v23 & 1) == 0)
      {
        _uaGetLogForCategory(CFSTR("pasteboard-client"));
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v24;
          _os_log_impl(&dword_1AF7EB000, v25, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: error removing existing item from clone dir: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v24;
    v27 = objc_msgSend(v26, "copyItemAtURL:toURL:error:", v5, v15, &v50);
    v28 = v50;

    if (v28)
    {
      _uaGetLogForCategory(CFSTR("pasteboard-client"));
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "type");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v30;
        v54 = 2112;
        v55 = v28;
        v31 = "[Local pasteboard] ERROR: error copying file for type[%@]: %@";
        v32 = v29;
        v33 = 22;
LABEL_27:
        _os_log_impl(&dword_1AF7EB000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);

      }
    }
    else
    {
      if ((v27 & 1) != 0)
      {
        objc_msgSend(v15, "absoluteString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "dataUsingEncoding:", 4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 56), "offsetInFile"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setOffset:", v36);

        objc_msgSend(*(id *)(a1 + 48), "setSize:", objc_msgSend(v35, "length"));
        v37 = *(void **)(a1 + 56);
        v49 = 0;
        v38 = objc_msgSend(v37, "writeData:error:", v35, &v49);
        v39 = v49;
        if ((v38 & 1) == 0)
        {
          _uaGetLogForCategory(CFSTR("pasteboard-client"));
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "type");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v41;
            v54 = 2114;
            v55 = v39;
            _os_log_impl(&dword_1AF7EB000, v40, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -128, 0);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v44 = *(void **)(v43 + 40);
          *(_QWORD *)(v43 + 40) = v42;

        }
        goto LABEL_29;
      }
      _uaGetLogForCategory(CFSTR("pasteboard-client"));
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "type");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v30;
        v31 = "[Local Pasteboard] ERROR: Failed to copy file for type[%@] but no error object";
        v32 = v29;
        v33 = 12;
        goto LABEL_27;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, 0);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v35 = *(void **)(v46 + 40);
    *(_QWORD *)(v46 + 40) = v45;
LABEL_29:

  }
LABEL_31:

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v47, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Leave Type Group", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v48, OS_LOG_TYPE_INFO, "[Local Pasteboard] Done writing pasteboard type", buf, 2u);
  }

}

- (id)serializeType:(id)a3 intoInfo:(id)a4 withFile:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_time_t v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  objc_msgSend(v8, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setType:", v12);

  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUuid:", v13);

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v15;
    v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_1AF7EB000, v14, OS_LOG_TYPE_INFO, "[Local Pasteboard] Serializing type: %@-%@", buf, 0x16u);

  }
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Enter Type Group", buf, 2u);
  }

  dispatch_group_enter(v11);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke;
  v26[3] = &unk_1E6007A20;
  v26[4] = self;
  v18 = v8;
  v27 = v18;
  v31 = &v32;
  v19 = v9;
  v28 = v19;
  v20 = v10;
  v29 = v20;
  v21 = v11;
  v30 = v21;
  objc_msgSend(v18, "getDataWithCompletionBlock:", v26);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v22, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Waiting on Type Group", buf, 2u);
  }

  v23 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v21, v23);
  v24 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v24;
}

void __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "pasteboardReadQ");
  v7 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke_2;
  v14[3] = &unk_1E60079F8;
  v15 = v5;
  v16 = v6;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 72);
  v17 = v8;
  v22 = v9;
  v18 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v20 = v11;
  v21 = *(id *)(a1 + 64);
  v12 = v6;
  v13 = v5;
  dispatch_async(v7, v14);

}

void __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  __int128 v28;
  unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  unint64_t v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 *v46;
  int v47;
  void *v48;
  int v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  char v57;
  id v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  id v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  char v78;
  id v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned __int8 *v93;
  id v94;
  __int128 v95;
  const __CFString *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  char v105;
  _BYTE v106[128];
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  _BYTE v110[14];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(v3, "hasBytesAvailable");
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v108 = v3;
    v109 = 1024;
    *(_DWORD *)v110 = v4;
    *(_WORD *)&v110[4] = 2112;
    *(_QWORD *)&v110[6] = v5;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "[Local Pasteboard] Got data stream: %@(%d) with error: %@", buf, 0x1Cu);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v108 = v7;
      v109 = 2112;
      *(_QWORD *)v110 = v8;
      _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: error getting type data for type[%@]: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "open");
    v91 = (uint64_t)&v91;
    v93 = (unsigned __int8 *)&v90;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 64), "offsetInFile"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setOffset:", v12);

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "offset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v108 = v14;
      v109 = 2112;
      *(_QWORD *)v110 = v15;
      _os_log_impl(&dword_1AF7EB000, v13, OS_LOG_TYPE_INFO, "[Local Pasteboard] Adding type (%@) data to file at offset: %@", buf, 0x16u);

    }
    +[UASharedPasteboardIRManager sharedIRManager](UASharedPasteboardIRManager, "sharedIRManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "converterForType:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 48), "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v108 = v21;
        v109 = 2112;
        *(_QWORD *)v110 = v22;
        v23 = v22;
        _os_log_impl(&dword_1AF7EB000, v19, OS_LOG_TYPE_INFO, "[Local Pasteboard] Found converter for type: %{public}@ -> %@", buf, 0x16u);

      }
      v97 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    }
    else
    {
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 48), "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v108 = v24;
        _os_log_impl(&dword_1AF7EB000, v19, OS_LOG_TYPE_INFO, "[Local Pasteboard] No converter for type: %{public}@", buf, 0xCu);

      }
      v97 = 0;
    }
    objc_msgSend(*(id *)(a1 + 72), "bomCheckTypes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "containsObject:", v26);

    v96 = CFSTR("UAContinuityErrorDomain");
    *(_QWORD *)&v28 = 138543618;
    v95 = v28;
    v29 = v93;
    while (1)
    {
      v30 = objc_msgSend(*(id *)(a1 + 32), "read:maxLength:", v29, 1024);
      v31 = v30;
      if (v30 < 1)
        break;
      if ((v27 & 1) != 0)
      {
        v92 = v30;
        objc_msgSend(*(id *)(a1 + 72), "typeBOMs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "type");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = objc_msgSend(v34, "count");
        v36 = v34;
        if (v35)
        {
          v37 = 0;
          while (1)
          {
            v38 = v29[v37];
            v39 = v36;
            objc_msgSend(v36, "objectAtIndexedSubscript:", v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "shortValue");

            if (v38 != v41)
              break;
            ++v37;
            v42 = objc_msgSend(v39, "count");
            v36 = v39;
            if (v42 <= v37)
              goto LABEL_44;
          }
          v94 = v39;
          v43 = objc_msgSend(v39, "count");
          if ((int)v43 >= 1)
          {
            v44 = v43;
            v45 = (v43 << 32) - 0x100000000;
            v46 = v29;
            v36 = v94;
            while (1)
            {
              v47 = *v46++;
              objc_msgSend(v36, "objectAtIndexedSubscript:", v45 >> 32);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "shortValue");

              v29 = v93;
              if (v47 != v49)
                break;
              v45 -= 0x100000000;
              --v44;
              v36 = v94;
              if (!v44)
                goto LABEL_44;
            }
          }
          v105 = 0;
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v50 = v94;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v102;
            do
            {
              for (i = 0; i != v52; ++i)
              {
                if (*(_QWORD *)v102 != v53)
                  objc_enumerationMutation(v50);
                v105 = objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "shortValue");
                if (v18)
                {
                  objc_msgSend(v97, "appendBytes:length:", &v105, 1);
                }
                else
                {
                  v55 = *(void **)(a1 + 64);
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &v105, 1, 0);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = 0;
                  v57 = objc_msgSend(v55, "writeData:error:", v56, &v100);
                  v58 = v100;

                  if ((v57 & 1) == 0)
                  {
                    _uaGetLogForCategory(CFSTR("pasteboard-client"));
                    v59 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(*(id *)(a1 + 48), "type");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v95;
                      v108 = v60;
                      v109 = 2114;
                      *(_QWORD *)v110 = v58;
                      _os_log_impl(&dword_1AF7EB000, v59, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);

                    }
                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v96, -128, 0);
                    v61 = objc_claimAutoreleasedReturnValue();
                    v62 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
                    v63 = *(void **)(v62 + 40);
                    *(_QWORD *)(v62 + 40) = v61;

                  }
                }
                objc_msgSend(*(id *)(a1 + 56), "setSize:", objc_msgSend(*(id *)(a1 + 56), "size") + 1);
              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
            }
            while (v52);
          }

          v29 = v93;
          v36 = v94;
        }
LABEL_44:

        v31 = v92;
      }
      objc_msgSend(*(id *)(a1 + 56), "setSize:", objc_msgSend(*(id *)(a1 + 56), "size") + v31);
      if (v18)
      {
        objc_msgSend(v97, "appendBytes:length:", v29, v31);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v29, v31, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = *(void **)(a1 + 64);
        v99 = 0;
        v66 = objc_msgSend(v65, "writeData:error:", v64, &v99);
        v67 = v99;
        if ((v66 & 1) == 0)
        {
          _uaGetLogForCategory(CFSTR("pasteboard-client"));
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 48), "type");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v95;
            v108 = v69;
            v109 = 2114;
            *(_QWORD *)v110 = v67;
            _os_log_impl(&dword_1AF7EB000, v68, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v96, -128, 0);
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v72 = *(void **)(v71 + 40);
          *(_QWORD *)(v71 + 40) = v70;

        }
      }
      v27 = 0;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
        goto LABEL_58;
    }
    if (v30 < 0)
    {
      _uaGetLogForCategory(CFSTR("pasteboard-client"));
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "streamError");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v108 = v74;
        _os_log_impl(&dword_1AF7EB000, v73, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Stream Error: %{public}@", buf, 0xCu);

      }
    }
LABEL_58:
    if (v18)
    {
      _uaGetLogForCategory(CFSTR("pasteboard-client"));
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF7EB000, v75, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Converting data from platform to IR for type", buf, 2u);
      }

      objc_msgSend(v18, "convertPlatformDataToIR:", v97);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setSize:", objc_msgSend(v76, "length"));
      v77 = *(void **)(a1 + 64);
      v98 = 0;
      v78 = objc_msgSend(v77, "writeData:error:", v76, &v98);
      v79 = v98;
      if ((v78 & 1) == 0)
      {
        _uaGetLogForCategory(CFSTR("pasteboard-client"));
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 48), "type");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v95;
          v108 = v81;
          v109 = 2114;
          *(_QWORD *)v110 = v79;
          _os_log_impl(&dword_1AF7EB000, v80, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v96, -128, 0);
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v84 = *(void **)(v83 + 40);
        *(_QWORD *)(v83 + 40) = v82;

      }
    }
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 56), "type");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(*(id *)(a1 + 56), "size");
      *(_DWORD *)buf = 138412546;
      v108 = v86;
      v109 = 2048;
      *(_QWORD *)v110 = v87;
      _os_log_impl(&dword_1AF7EB000, v85, OS_LOG_TYPE_INFO, "[Local Pasteboard] Data length written for type %@: %ld", buf, 0x16u);

    }
  }
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v88, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Leave Type Group", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v89 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v89, OS_LOG_TYPE_INFO, "[Local Pasteboard] Done writing pasteboard type", buf, 2u);
  }

}

- (BOOL)isRemotePasteboardAvailable
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  char v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote status from server", buf, 2u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__UASharedPasteboardManager_isRemotePasteboardAvailable__block_invoke;
  v9[3] = &unk_1E6007A48;
  v11 = &v13;
  v5 = v3;
  v10 = v5;
  -[UASharedPasteboardManager fetchPasteboardStatus:](self, "fetchPasteboardStatus:", v9);
  v6 = dispatch_time(0, 100000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

intptr_t __56__UASharedPasteboardManager_isRemotePasteboardAvailable__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Got remote status: %@", (uint8_t *)&v7, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  -[UASharedPasteboardManager serverQ](self, "serverQ");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke;
  block[3] = &unk_1E6007AE0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v2 = MEMORY[0x1E0C809B0];
  v14 = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_2;
  v10[3] = &unk_1E6007A70;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", v10);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote pasteboard types for process: %d", buf, 8u);
  }

  v5 = *(unsigned int *)(a1 + 48);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_159;
  v7[3] = &unk_1E6007AB8;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v8, "fetchPasteboardTypesForProcess:withCompletion:", v5, v7);

}

void __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Connection to useractivityd inturrupted with outstanding type request", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -126, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  UAPasteboardItem *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UAPasteboardFileChunkItemProvider *v20;
  void *v21;
  NSObject *v22;
  UAPasteboardFileItemProvider *v23;
  UAPasteboardFileChunkItemProvider *v24;
  NSObject *v25;
  UAPasteboardFileChunkItemProvider *v26;
  UAPasteboardFileChunkItemProvider *v27;
  id obj;
  uint64_t v29;
  UAPasteboardFileChunkItemProvider *v30;
  uint64_t v31;
  uint64_t i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  UAPasteboardFileChunkItemProvider *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v27 = a3;
  if (v27)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v27;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Type Fetch Error: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v26;
      _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "[Local Pasteboard] Received remote pasteboard info: %@", buf, 0xCu);
    }

    v30 = (UAPasteboardFileChunkItemProvider *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[UAPasteboardFileChunkItemProvider items](v26, "items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v31)
    {
      v29 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v39 != v29)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v7 = objc_alloc_init(UAPasteboardItem);
          objc_msgSend(v6, "types");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "allValues");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_163);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v35 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_msgSend(v15, "type");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(*(id *)(a1 + 32), "typeIsDisallowedForReceiving:", v16) & 1) == 0)
                {
                  if (objc_msgSend(v16, "isEqualToString:", CFSTR("public.file-url")))
                  {
                    objc_msgSend(v15, "typeHint");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();

                    v18 = (void *)MEMORY[0x1E0C99E98];
                    if (v17)
                    {
                      objc_msgSend(v15, "typeHint");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "fileURLWithPath:", v19);
                      v20 = (UAPasteboardFileChunkItemProvider *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v15, "uuid");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "UUIDString");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "fileURLWithPath:", v21);
                      v20 = (UAPasteboardFileChunkItemProvider *)objc_claimAutoreleasedReturnValue();

                    }
                    _uaGetLogForCategory(CFSTR("pasteboard-client"));
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138477827;
                      v45 = v20;
                      _os_log_impl(&dword_1AF7EB000, v22, OS_LOG_TYPE_INFO, "[Local Pasteboard] Using hintURL for file-url type: %{private}@", buf, 0xCu);
                    }

                    v23 = -[UAPasteboardFileItemProvider initWithURL:sandboxExtension:]([UAPasteboardFileItemProvider alloc], "initWithURL:sandboxExtension:", v20, 0);
                    -[UAPasteboardItem addType:](v7, "addType:", v23);

                  }
                  else
                  {
                    v20 = -[UAPasteboardFileChunkItemProvider initWithType:fileHandle:offsetInFile:size:]([UAPasteboardFileChunkItemProvider alloc], "initWithType:fileHandle:offsetInFile:size:", v16, 0, 0, objc_msgSend(v15, "size"));
                    -[UAPasteboardItem addType:](v7, "addType:", v20);
                  }

                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v12);
          }

          v24 = -[UAPasteboardFileChunkItemProvider initWithType:fileHandle:offsetInFile:size:]([UAPasteboardFileChunkItemProvider alloc], "initWithType:fileHandle:offsetInFile:size:", CFSTR("com.apple.is-remote-clipboard"), 0, 0, 0);
          -[UAPasteboardItem addType:](v7, "addType:", v24);
          -[UAPasteboardFileChunkItemProvider addObject:](v30, "addObject:", v7);

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v31);
    }

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v30;
      _os_log_impl(&dword_1AF7EB000, v25, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Received remote types: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "index");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v5, "index");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "index");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "index");
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
      v7 = (void *)v12;
    }
  }
  v13 = objc_msgSend(v6, "compare:", v7);

  return v13;
}

- (void)requestRemotePasteboardDataForProcess:(int)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  -[UASharedPasteboardManager serverQ](self, "serverQ");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke;
  block[3] = &unk_1E6007AE0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v2 = MEMORY[0x1E0C809B0];
  v14 = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_2;
  v10[3] = &unk_1E6007A70;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", v10);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote pasteboard data for process: %d", buf, 8u);
  }

  v5 = *(unsigned int *)(a1 + 48);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_169;
  v7[3] = &unk_1E6007AB8;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v8, "fetchPasteboardDataForProcess:withCompletion:", v5, v7);

}

void __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Connection to useractivityd inturrupted with outstanding data request", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -126, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  UASharedPasteboardTypeInfo *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  UAPasteboardFileItemProvider *v50;
  void *v51;
  void *v52;
  UAPasteboardFileChunkItemProvider *v53;
  void *v54;
  void *v55;
  UAPasteboardDataProvider *v56;
  void *v57;
  UAPasteboardDataProvider *v58;
  NSObject *v59;
  id v61;
  id obj;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t i;
  UAPasteboardItem *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v69 = a2;
  v61 = a3;
  if (v61)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v80 = v61;
      _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error fetching remote pasteboard data: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_49;
  }
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v69;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Received remote pasteboard info: %@", buf, 0xCu);
  }

  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v69, "sandboxExtensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v80 = v7;
    _os_log_impl(&dword_1AF7EB000, v6, OS_LOG_TYPE_INFO, "[Local Pasteboard] Received extensions: %@", buf, 0xCu);

  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v69, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v65)
  {
    v63 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v68 = objc_alloc_init(UAPasteboardItem);
        objc_msgSend(v8, "types");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_171);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "types");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v13, "containsObject:", CFSTR("public.file-url"));

        if ((_DWORD)v10)
        {
          objc_msgSend(v8, "types");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("public.file-url"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "dataFile");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "offset");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "seekToFileOffset:", objc_msgSend(v17, "unsignedLongLongValue"));

          objc_msgSend(v15, "dataFile");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "readDataOfLength:", objc_msgSend(v15, "size"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "dataFile");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "seekToFileOffset:", 0);

          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithDataRepresentation:relativeToURL:", v19, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          _uaGetLogForCategory(CFSTR("pasteboard-client"));
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v80 = v21;
            _os_log_impl(&dword_1AF7EB000, v22, OS_LOG_TYPE_INFO, "[Local Pasteboard] URL decoded from file: %{private}@", buf, 0xCu);
          }

          objc_msgSend(v21, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("items/%@/"), v26);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v69, "sharedDataPath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAppendingPathComponent:", v66);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "URLByAppendingPathComponent:", v23);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          _uaGetLogForCategory(CFSTR("pasteboard-client"));
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v70;
            _os_log_impl(&dword_1AF7EB000, v30, OS_LOG_TYPE_INFO, "[Local Pasteboard] new URL for item: %@", buf, 0xCu);
          }

          objc_msgSend(v8, "types");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "allKeys");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "containsObject:", CFSTR("com.apple.security.sandbox-extension-dict"));

          if ((v33 & 1) == 0)
          {
            _uaGetLogForCategory(CFSTR("pasteboard-client"));
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AF7EB000, v34, OS_LOG_TYPE_INFO, "[Local Pasteboard] Adding sandbox extension type because we need it on macOS", buf, 2u);
            }

            v35 = objc_alloc_init(UASharedPasteboardTypeInfo);
            -[UASharedPasteboardTypeInfo setType:](v35, "setType:", CFSTR("com.apple.security.sandbox-extension-dict"));
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[UASharedPasteboardTypeInfo setUuid:](v35, "setUuid:", v36);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UASharedPasteboardTypeInfo setIndex:](v35, "setIndex:", v37);

            objc_msgSend(v11, "arrayByAddingObject:", v35);
            v38 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v38;
          }

        }
        else
        {
          v70 = 0;
        }
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v39 = v11;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v40; ++j)
            {
              if (*(_QWORD *)v72 != v41)
                objc_enumerationMutation(v39);
              v43 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
              objc_msgSend(v43, "type");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v44, "isEqualToString:", CFSTR("public.file-url")))
              {
                _uaGetLogForCategory(CFSTR("pasteboard-client"));
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v43, "type");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v80 = v46;
                  v81 = 2112;
                  v82 = v70;
                  _os_log_impl(&dword_1AF7EB000, v45, OS_LOG_TYPE_INFO, "[Local Pasteboard] Creating data provider for %@ with %@", buf, 0x16u);

                }
                objc_msgSend(v69, "sandboxExtensions");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "uuid");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKeyedSubscript:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                v50 = -[UAPasteboardFileItemProvider initWithURL:sandboxExtension:]([UAPasteboardFileItemProvider alloc], "initWithURL:sandboxExtension:", v70, v49);
              }
              else
              {
                if ((objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.security.sandbox-extension-dict")) & 1) != 0)
                {
                  v50 = 0;
                  goto LABEL_42;
                }
                objc_msgSend(v43, "dataFile");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                  v52 = v43;
                else
                  v52 = v69;
                objc_msgSend(v52, "dataFile");
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                v53 = [UAPasteboardFileChunkItemProvider alloc];
                objc_msgSend(v43, "type");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "offset");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = -[UAPasteboardFileChunkItemProvider initWithType:fileHandle:offsetInFile:size:](v53, "initWithType:fileHandle:offsetInFile:size:", v54, v49, v55, objc_msgSend(v43, "size"));

              }
              if (v50)
                -[UAPasteboardItem addType:](v68, "addType:", v50);
LABEL_42:

            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          }
          while (v40);
        }

        v56 = [UAPasteboardDataProvider alloc];
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = -[UAPasteboardDataProvider initWithData:type:](v56, "initWithData:type:", v57, CFSTR("com.apple.is-remote-clipboard"));

        -[UAPasteboardItem addType:](v68, "addType:", v58);
        objc_msgSend(v64, "addObject:", v68);

      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v65);
  }

  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v64;
    _os_log_impl(&dword_1AF7EB000, v59, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Returning items: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_49:
}

uint64_t __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "index");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v5, "index");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "index");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "index");
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
      v7 = (void *)v12;
    }
  }
  v13 = objc_msgSend(v6, "compare:", v7);

  return v13;
}

- (BOOL)requestPasteboardFetchReturnEarly
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  _uaGetLogForCategory(CFSTR("pasteboard-clien"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v2, OS_LOG_TYPE_INFO, "Setting remote generation to return early", buf, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  UASharedPasteboardAUXServiceName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMachServiceName:options:", v4, 0);

  _UAGetSharedPasteboardAUXProtocolInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_178);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__UASharedPasteboardManager_requestPasteboardFetchReturnEarly__block_invoke_179;
  v9[3] = &unk_1E6007B48;
  v9[4] = &v11;
  objc_msgSend(v7, "setReturnPasteboardDataEarlyWithCompletion:", v9);

  objc_msgSend(v5, "invalidate");
  LOBYTE(v7) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v7;
}

void __62__UASharedPasteboardManager_requestPasteboardFetchReturnEarly__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_ERROR, "ERROR getting remote proxy: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __62__UASharedPasteboardManager_requestPasteboardFetchReturnEarly__block_invoke_179(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_INFO, "Pasteboard already fetched: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (void)fetchPasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[UASharedPasteboardManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__UASharedPasteboardManager_fetchPasteboardTypesForProcess_withCompletion___block_invoke;
  v10[3] = &unk_1E60075A8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRemotePasteboardTypesForProcess:withCompletion:", v4, v8);

}

uint64_t __75__UASharedPasteboardManager_fetchPasteboardTypesForProcess_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)doClearLocalPasteboardInfo
{
  void *v2;
  id v3;

  -[UASharedPasteboardManager connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLocalPasteboardInformation");

}

- (void)fetchPasteboardDataForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[UASharedPasteboardManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__UASharedPasteboardManager_fetchPasteboardDataForProcess_withCompletion___block_invoke;
  v10[3] = &unk_1E60075A8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRemotePasteboardForProcess:withCompletion:", v4, v8);

}

uint64_t __74__UASharedPasteboardManager_fetchPasteboardDataForProcess_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPasteboardStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UASharedPasteboardManager connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRemotePasteboardStatus:", v4);

}

- (id)fetchRemoteName
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint8_t buf[16];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote device name from server", buf, 2u);
  }

  -[UASharedPasteboardManager connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_180);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UASharedPasteboardManager_fetchRemoteName__block_invoke_181;
  v8[3] = &unk_1E6007498;
  v8[4] = &v10;
  objc_msgSend(v5, "fetchRemoteDeviceName:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__UASharedPasteboardManager_fetchRemoteName__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error getting proxy: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __44__UASharedPasteboardManager_fetchRemoteName__block_invoke_181(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1AF7EB000, v4, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Got remote device name: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)tellClientDebuggingEnabled:(BOOL)a3 logFileHandle:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _uaGetLogForCategory(CFSTR("pasteboard-client"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "Received debug update from server: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)localPasteboardWasFetched
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalPasteboardWasFetched:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (UAPasteboardGeneration)currentGeneration
{
  return (UAPasteboardGeneration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentGeneration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)serverQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerQ:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSXPCConnection)controllConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setControllConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)disableCount
{
  return self->_disableCount;
}

- (void)setDisableCount:(int)a3
{
  self->_disableCount = a3;
}

- (id)controllSyncObject
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setControllSyncObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)remotePasteboardAvailable
{
  return self->_remotePasteboardAvailable;
}

- (void)setRemotePasteboardAvailable:(BOOL)a3
{
  self->_remotePasteboardAvailable = a3;
}

- (BOOL)currentGenerationHasUpdates
{
  return self->_currentGenerationHasUpdates;
}

- (void)setCurrentGenerationHasUpdates:(BOOL)a3
{
  self->_currentGenerationHasUpdates = a3;
}

- (BOOL)updateScheduled
{
  return self->_updateScheduled;
}

- (void)setUpdateScheduled:(BOOL)a3
{
  self->_updateScheduled = a3;
}

- (OS_dispatch_queue)pasteboardReadQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPasteboardReadQ:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSSet)disallowedTypesForSending
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisallowedTypesForSending:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSSet)disallowedTypesForReceiving
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDisallowedTypesForReceiving:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)bomCheckTypes
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBomCheckTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)typeBOMs
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTypeBOMs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)typeAliases
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTypeAliases:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  self->_completionBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeAliases, 0);
  objc_storeStrong((id *)&self->_typeBOMs, 0);
  objc_storeStrong((id *)&self->_bomCheckTypes, 0);
  objc_storeStrong((id *)&self->_disallowedTypesForReceiving, 0);
  objc_storeStrong((id *)&self->_disallowedTypesForSending, 0);
  objc_storeStrong((id *)&self->_pasteboardReadQ, 0);
  objc_storeStrong(&self->_controllSyncObject, 0);
  objc_storeStrong((id *)&self->_controllConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serverQ, 0);
  objc_storeStrong((id *)&self->_currentGeneration, 0);
  objc_storeStrong(&self->_localPasteboardWasFetched, 0);
}

@end
