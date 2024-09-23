@implementation PKService

- (void)checkIn
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (objc_opt_class())
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0D87D60], "currentProcess");
    pklog_handle_for_category(7);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "KernelMemoryStatus", ", buf, 2u);
    }

    getpid();
    memorystatus_control();
    pklog_handle_for_category(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "KernelMemoryStatus", ", v5, 2u);
    }

  }
}

- (void)beganUsingServicePersonality:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  PKService *v9;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF26BD98;
  block[3] = &unk_1E5F40650;
  v8 = v4;
  v9 = self;
  v5 = qword_1ECDD7008;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&qword_1ECDD7008, block);

}

+ (void)main
{
  NSObject *v2;
  NSObject *v3;
  uint64_t current_persona;
  int v5;
  NSObject *v6;
  uid_t v7;
  uid_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint8_t v12[4];
  uid_t v13;
  __int16 v14;
  uid_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[28];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", ", buf, 2u);
  }

  pklog_handle_for_category(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", ", buf, 2u);
  }

  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)buf = 0u;
  v10 = 0;
  v11 = 0;
  current_persona = voucher_get_current_persona();
  v5 = current_persona;
  *(_OWORD *)buf = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  *(_DWORD *)buf = 1;
  pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v11, &v10);
  pklog_handle_for_category(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = geteuid();
    v8 = getuid();
    *(_DWORD *)v12 = 67110146;
    v13 = v7;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = v5;
    v18 = 2080;
    v19 = v11;
    v20 = 2080;
    v21 = v10;
    _os_log_impl(&dword_1AF254000, v6, OS_LOG_TYPE_DEFAULT, "Hello, I'm launching as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v12, 0x28u);
  }

  +[PKService defaultService](PKService, "defaultService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "run");

}

- (NSXPCListenerEndpoint)endpoint
{
  void *v2;
  void *v3;

  -[PKService serviceListener](self, "serviceListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (PKService)init
{
  void *v3;
  PKService *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[PKService initWithExternalProviders:](self, "initWithExternalProviders:", v3);

  return v4;
}

- (PKService)initWithExternalProviders:(id)a3
{
  id v5;
  PKService *v6;
  PKService *v7;
  void *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *timerQueue;
  uint64_t active_platform;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKService;
  v6 = -[PKService init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_external, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKService setPersonalities:](v7, "setPersonalities:", v8);

    v9 = dispatch_queue_create("timer queue", 0);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v9;

    v7->_personalityLock._os_unfair_lock_opaque = 0;
    active_platform = dyld_get_active_platform();
    pklog_handle_for_category(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v16 = active_platform;
      _os_log_impl(&dword_1AF254000, v12, OS_LOG_TYPE_INFO, "setting extensionPointPlatform: %u", buf, 8u);
    }

    -[PKService setExtensionPointPlatform:](v7, "setExtensionPointPlatform:", active_platform);
  }

  return v7;
}

+ (id)defaultService
{
  if (qword_1ECDD7000 != -1)
    dispatch_once(&qword_1ECDD7000, &unk_1E5F40518);
  return (id)qword_1ECDD6FF8;
}

- (void)run
{
  -[PKService runUsingServiceListener:](self, "runUsingServiceListener:", 1);
  exit(1);
}

- (void)runUsingServiceListener:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD block[5];

  v3 = a3;
  if (+[PKCapabilities supportsAutoreleasePoolDuringPlugInLaunch](PKCapabilities, "supportsAutoreleasePoolDuringPlugInLaunch"))
  {
    v5 = (void *)MEMORY[0x1AF45AD14]();
    -[PKService _prepareToRunUsingServiceListener:](self, "_prepareToRunUsingServiceListener:", v3);
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    -[PKService _prepareToRunUsingServiceListener:](self, "_prepareToRunUsingServiceListener:", v3);
  }
  -[PKService timerQueue](self, "timerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF26C66C;
  block[3] = &unk_1E5F40678;
  block[4] = self;
  dispatch_sync(v6, block);

  pklog_handle_for_category(7);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Bootstrap complete. Ready for handshake from host.",
      v10,
      2u);
  }

  pklog_handle_for_category(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", ", v10, 2u);
  }

  -[PKService serviceListener](self, "serviceListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __PLUGINKIT_HANDING_CONTROL_TO_MAIN_SERVICE_LISTENER__();

}

- (void)_prepareToRunUsingServiceListener:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  Class v14;
  objc_class *v15;
  NSObject *v16;
  NSObject *v17;

  v3 = a3;
  -[PKService checkEnvironment:](self, "checkEnvironment:", 0);
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3B58], "serviceListener");
  else
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKService setServiceListener:](self, "setServiceListener:", v5);

  -[PKService serviceListener](self, "serviceListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[PKService discoverSubsystems](self, "discoverSubsystems");
  -[PKService external](self, "external");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filesystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PlugInKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_lookUpClass((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    v15 = v14;
    if (v14)
    {
      if (!-[objc_class conformsToProtocol:](v14, "conformsToProtocol:", &unk_1EEE405E0))
      {
        pklog_handle_for_category(7);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1AF276F64();

        v15 = 0;
        goto LABEL_15;
      }
      v15 = (objc_class *)objc_alloc_init(v15);
    }
    if (v15)
    {
      -[PKService setDelegate:](self, "setDelegate:", v15);
LABEL_18:

      goto LABEL_19;
    }
LABEL_15:
    pklog_handle_for_category(7);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1AF276F10();

    goto LABEL_18;
  }
LABEL_19:

}

+ (int)_defaultRun:(int)a3 arguments:(const char *)a4
{
  objc_msgSend(a1, "main", *(_QWORD *)&a3, a4);
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  PKServicePersonality *v9;

  v6 = a3;
  v7 = a4;
  -[PKService serviceListener](self, "serviceListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = -[PKServicePersonality initWithConnection:service:]([PKServicePersonality alloc], "initWithConnection:service:", v7, self);
  }
  else
  {
    pklog_handle_for_category(7);
    v9 = (PKServicePersonality *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
      sub_1AF276FB8();
  }

  return v8 == v6;
}

- (BOOL)_processDefaultSubsystemName:(id)a3
{
  return 1;
}

- (void)discoverSubsystems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  char **v20;
  const char *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PKService configuredSubsystemList](self, "configuredSubsystemList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKService isSystemService](self, "isSystemService"))
  {
    v4 = 0;
    goto LABEL_15;
  }
  v5 = (void *)xpc_copy_bootstrap();
  v6 = v5;
  if (!v5)
  {
    v4 = 0;
    goto LABEL_12;
  }
  xpc_dictionary_get_value(v5, "SubsystemOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pklog_handle_for_category(8);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_1AF27700C(v8);

LABEL_9:
    v4 = 0;
  }

LABEL_12:
  pklog_handle_for_category(8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredLocalizations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_1AF254000, v9, OS_LOG_TYPE_INFO, "Bootstrapping; Preferred localizations: %@", buf, 0xCu);

  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKService checkIn](self, "checkIn");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      if (v14 <= 1)
        v17 = 1;
      else
        v17 = v14;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v13);
        -[PKService discoverSubsystemNamed:options:required:](self, "discoverSubsystemNamed:options:required:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16), v4, 1, (_QWORD)v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v16;
      }
      while (v17 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  v19 = "NSViewService_PKSubsystem";
  v20 = &off_1E5F40E98;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19, (_QWORD)v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!v13 || (objc_msgSend(v13, "containsObject:", v22) & 1) == 0)
      && -[PKService _processDefaultSubsystemName:](self, "_processDefaultSubsystemName:", v22))
    {
      -[PKService discoverSubsystemNamed:options:required:](self, "discoverSubsystemNamed:options:required:", v22, v4, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v12, "addObject:", v23);

    }
    v21 = *v20++;
    v19 = v21;
  }
  while (v21);
  -[PKService setSubsystems:](self, "setSubsystems:", v12);

}

- (id)configuredSubsystemList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKService external](self, "external");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filesystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PlugInKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKService mergeSubsystems:from:](self, "mergeSubsystems:from:", v8, v7);

  return v8;
}

- (void)mergeSubsystems:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Subsystems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKService mergeSubsystemList:from:](self, "mergeSubsystemList:from:", v16, v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SDK"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    v9 = -[PKService extensionPointPlatform](self, "extensionPointPlatform");
    -[PKService external](self, "external");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPlugInCore readSDKDictionary:forPlatform:externalProviders:](PKPlugInCore, "readSDKDictionary:forPlatform:externalProviders:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Subsystems"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKService mergeSubsystemList:from:](self, "mergeSubsystemList:from:", v16, v13);

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("XPCService"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ServiceType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isEqualToString:", CFSTR("System")))
      -[PKService setIsSystemService:](self, "setIsSystemService:", 1);

  }
}

- (void)mergeSubsystemList:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        if (v8 <= 1)
          v11 = 1;
        else
          v11 = v8;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v5, "addObject:", v12);
          ++v10;
        }
        while (v11 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }

}

- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  Class v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_retainAutorelease(v7);
  v10 = objc_lookUpClass((const char *)objc_msgSend(v9, "UTF8String"));
  pklog_handle_for_category(8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (v5)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_1AF27704C();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1AF254000, v12, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] not present, skipping",
        (uint8_t *)&v17,
        0xCu);
    }
    goto LABEL_19;
  }
  if (os_signpost_enabled(v11))
  {
    v17 = 138543362;
    v18 = v9;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
  }

  pklog_handle_for_category(8);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1AF254000, v13, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] initializing",
      (uint8_t *)&v17,
      0xCu);
  }

  __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__(v10, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(8);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    v17 = 138543618;
    v18 = v9;
    v19 = 1026;
    v20 = v14 != 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ", (uint8_t *)&v17, 0x12u);
  }

  if (!v14)
  {
    pklog_handle_for_category(8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1AF2770AC();
    goto LABEL_19;
  }
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EEE40720) & 1) == 0)
  {

    pklog_handle_for_category(8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1AF277100();
LABEL_19:

    v14 = 0;
  }

  return v14;
}

- (void)launchContainingApplicationForPlugInNamed:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  pklog_handle_for_category(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1AF277154(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (id)defaultsForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[PKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)plugInPrincipalForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[PKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plugInPrincipal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hostPrincipalForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[PKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostPrincipal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)embeddedPrincipalForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[PKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedPrincipal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)connectionForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[PKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSolePersonality:(id)a3
{
  PKServicePersonality *v4;
  PKServicePersonality *solePersonality;

  v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  solePersonality = self->_solePersonality;
  self->_solePersonality = v4;

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (PKServicePersonality)solePersonality
{
  os_unfair_lock_s *p_personalityLock;
  PKServicePersonality *v4;
  NSObject *v5;

  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  v4 = self->_solePersonality;
  os_unfair_lock_unlock(p_personalityLock);
  if (!v4)
  {
    pklog_handle_for_category(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1AF2771C4(self, v5);

  }
  return v4;
}

- (id)personalityNamed:(id)a3
{
  id v4;
  os_unfair_lock_s *p_personalityLock;
  void *v6;
  void *v7;
  void *v8;
  PKServicePersonality *v9;

  v4 = a3;
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  if (v4)
  {
    -[PKService personalities](self, "personalities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (PKServicePersonality *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = self->_solePersonality;
  }
  os_unfair_lock_unlock(p_personalityLock);

  return v9;
}

- (id)personalityNamed:(id)a3 forHostPid:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_personalityLock;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  p_personalityLock = &self->_personalityLock;
  v7 = a3;
  os_unfair_lock_lock(p_personalityLock);
  -[PKService personalities](self, "personalities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_personalityLock);
  return v11;
}

- (void)registerPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  PKServicePersonality *v19;
  PKServicePersonality *solePersonality;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_personalityLock);
  -[PKService personalities](self, "personalities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKService personalities](self, "personalities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v12);

  -[PKService personalities](self, "personalities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") == 1)
  {
    v14 = objc_msgSend(v7, "count");

    if (v14 == 1)
    {
      pklog_handle_for_category(7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "version");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v16;
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_1AF254000, v15, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Set sole personality.", (uint8_t *)&v22, 0x20u);

      }
      v19 = (PKServicePersonality *)v4;
      solePersonality = self->_solePersonality;
      self->_solePersonality = v19;
      goto LABEL_12;
    }
  }
  else
  {

  }
  pklog_handle_for_category(7);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1AF27724C(v4, self, v21);

  solePersonality = self->_solePersonality;
  self->_solePersonality = 0;
LABEL_12:

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (BOOL)unregisterPersonality:(id)a3
{
  PKServicePersonality *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  PKServicePersonality *solePersonality;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  -[PKService personalities](self, "personalities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");

  if (v6)
  {
    -[PKService personalities](self, "personalities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[PKServicePersonality connection](v4, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v12 != 0;

    if (v12)
    {
      objc_msgSend(v9, "removeObjectForKey:", v11);
      if (self->_solePersonality == v4)
      {
        pklog_handle_for_category(7);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[PKPlugInCore uuid](v4, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore identifier](v4, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore version](v4, "version");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543874;
          v20 = v14;
          v21 = 2112;
          v22 = v15;
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_1AF254000, v13, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Removed sole personality.", (uint8_t *)&v19, 0x20u);

        }
        solePersonality = self->_solePersonality;
        self->_solePersonality = 0;

      }
    }

  }
  os_unfair_lock_unlock(&self->_personalityLock);

  return (char)v6;
}

- (void)checkEnvironment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  char __s[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  bzero(__s, 0x400uLL);
  __s[0] = 63;
  -[PKService external](self, "external");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sandbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKService external](self, "external");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "sandbox_container_path_for_pid:buffer:bufsize:", objc_msgSend(v7, "getpid"), __s, 1024);

  if (v8)
  {
    pklog_handle_for_category(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1AF2773A8(v9);

  }
  else if (strlen(__s) > 1)
  {
    return;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("plugin has invalid sandbox or container: error %d path %s"), *__error(), __s);
  pklog_handle_for_category(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1AF277350();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v10);
}

- (void)scheduleTermination:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[PKService timerQueue](self, "timerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1AF26DE2C;
  v6[3] = &unk_1E5F40628;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)cancelTermination
{
  NSObject *v3;
  _QWORD block[5];

  -[PKService timerQueue](self, "timerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF26E0A0;
  block[3] = &unk_1E5F40678;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (void)setExtensionPointPlatform:(unsigned int)a3
{
  self->_extensionPointPlatform = a3;
}

- (os_unfair_lock_s)personalityLock
{
  return self->_personalityLock;
}

- (OS_dispatch_queue)timerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (PKServiceDelegate)delegate
{
  return (PKServiceDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)personalities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonalities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)subsystems
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubsystems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (OS_dispatch_source)terminationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_source)firstHostRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstHostRequestTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PKExternalProviders)external
{
  return self->_external;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_firstHostRequestTimer, 0);
  objc_storeStrong((id *)&self->_terminationTimer, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_personalities, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_solePersonality, 0);
}

@end
