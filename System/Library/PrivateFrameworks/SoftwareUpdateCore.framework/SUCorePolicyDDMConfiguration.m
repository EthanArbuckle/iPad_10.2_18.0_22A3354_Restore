@implementation SUCorePolicyDDMConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_instance;
}

void __46__SUCorePolicyDDMConfiguration_sharedInstance__block_invoke()
{
  SUCorePolicyDDMConfiguration *v0;
  void *v1;

  v0 = -[SUCorePolicyDDMConfiguration initWithState]([SUCorePolicyDDMConfiguration alloc], "initWithState");
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (SUCorePolicyDDMConfiguration)initWithState
{
  return -[SUCorePolicyDDMConfiguration initWithStatePersistencePath:](self, "initWithStatePersistencePath:", 0);
}

- (SUCorePolicyDDMConfiguration)initWithStatePersistencePath:(id)a3
{
  __CFString *v4;
  SUCorePolicyDDMConfiguration *v5;
  SUCorePolicyDDMConfiguration *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *stateQueue;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SUCorePersistedState *persistedState;
  NSObject *v21;
  _QWORD block[4];
  SUCorePolicyDDMConfiguration *v24;
  objc_super v25;

  v4 = (__CFString *)a3;
  v25.receiver = self;
  v25.super_class = (Class)SUCorePolicyDDMConfiguration;
  v5 = -[SUCorePolicyDDMConfiguration init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_allowInvalidDeclaration = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.su.ddm.stateQueue", v7);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v8;

    if (!v4)
    {
      objc_msgSend((id)objc_opt_class(), "statePersistencePath");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "oslog");
        v11 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[SUCorePolicyDDMConfiguration initWithStatePersistencePath:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

        v4 = CFSTR("/tmp/SoftwareUpdateDDMStatePersistence.plist");
      }
    }
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8970]), "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v6->_stateQueue, v4, CFSTR("1.0"));
    persistedState = v6->_persistedState;
    v6->_persistedState = (SUCorePersistedState *)v19;

    dispatch_assert_queue_not_V2((dispatch_queue_t)v6->_stateQueue);
    v21 = v6->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke;
    block[3] = &unk_1EA877EF8;
    v24 = v6;
    dispatch_sync(v21, block);

  }
  return v6;
}

void __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadPersistedState") & 1) != 0)
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "oslog");
    v2 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SUCorePolicyDDMConfiguration initWithStatePersistencePath:]_block_invoke";
      _os_log_impl(&dword_1DDFDD000, v2, OS_LOG_TYPE_DEFAULT, "%s: Loaded persisted state", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

+ (id)statePersistencePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "getDaemonCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.su.ddm.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)getDaemonCacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  char __s[1024];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  bzero(__s, 0x400uLL);
  if ((int)confstr(65538, __s, 0x400uLL) >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("SUCorePolicyDDMConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if ((v6 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = 0,
          objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, &v32),
          v8 = v32,
          v7,
          !v8))
    {
      v11 = v4;
    }
    else
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[SUCorePolicyDDMConfiguration getDaemonCacheDirectory].cold.1();

      v11 = 0;
    }

    goto LABEL_20;
  }
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[SUCorePolicyDDMConfiguration getDaemonCacheDirectory].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

  if ((v24 & 1) != 0)
  {
LABEL_19:
    objc_msgSend(v3, "path");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 0, 0, &v31);
  v27 = v31;

  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "oslog");
  v29 = objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "+[SUCorePolicyDDMConfiguration getDaemonCacheDirectory]";
      _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, "%s: Created tmp directory", buf, 0xCu);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    +[SUCorePolicyDDMConfiguration getDaemonCacheDirectory].cold.2();

  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)hasManagedConfigurations
{
  SUCorePolicyDDMConfiguration *v2;
  NSObject *stateQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = v2->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SUCorePolicyDDMConfiguration_hasManagedConfigurations__block_invoke;
  v5[3] = &unk_1EA877ED0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __56__SUCorePolicyDDMConfiguration_hasManagedConfigurations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v13 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v13, &v12);
  v3 = v13;
  v4 = v12;
  objc_msgSend(*(id *)(a1 + 32), "persistedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("SUCoreDDMDeclarationGlobalSettings"));
  v6 = objc_claimAutoreleasedReturnValue();

  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v3, "count");
    v10 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 136315906;
    v15 = "-[SUCorePolicyDDMConfiguration hasManagedConfigurations]_block_invoke";
    v16 = 2048;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    v20 = 2048;
    v21 = v6;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%s: valid.count = %lu, invalid.count = %lu, globalSettings = %p", buf, 0x2Au);
  }

  if (objc_msgSend(v3, "count"))
    v11 = 1;
  else
    v11 = (objc_msgSend(v4, "count") | v6) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;

}

- (void)_getDeclarations:(id *)a3 invalid:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
  {
    -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryForKey:", CFSTR("Declarations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    if (!v9)
      v9 = (void *)objc_opt_new();
    v10 = objc_retainAutorelease(v9);
    *a3 = v10;

  }
  if (a4)
  {
    -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryForKey:", CFSTR("invalidDeclarations"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v14, "mutableCopy");
    if (!v12)
      v12 = (void *)objc_opt_new();
    v13 = objc_retainAutorelease(v12);
    *a4 = v13;

  }
}

- (void)_persistValidDeclarations:(id)a3
{
  NSObject *stateQueue;
  id v5;
  id v6;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistDictionary:forKey:shouldPersist:", v5, CFSTR("Declarations"), 0);

}

- (void)_persistInvalidDeclarations:(id)a3
{
  NSObject *stateQueue;
  id v5;
  id v6;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistDictionary:forKey:shouldPersist:", v5, CFSTR("invalidDeclarations"), 0);

}

- (void)_persistActiveDeclarationKey:(id)a3
{
  NSObject *stateQueue;
  id v5;
  id v6;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistString:forKey:shouldPersist:", v5, CFSTR("activeDeclarationKey"), 0);

}

- (void)_persistState
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistState");

}

- (id)_getActiveDeclarationKey
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[SUCorePolicyDDMConfiguration persistedState](self, "persistedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("activeDeclarationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeDeclarationKey
{
  NSObject *stateQueue;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SUCorePolicyDDMConfiguration_activeDeclarationKey__block_invoke;
  v6[3] = &unk_1EA877F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__SUCorePolicyDDMConfiguration_activeDeclarationKey__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getActiveDeclarationKey");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setActiveDeclarationKey:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke;
  block[3] = &unk_1EA878C48;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v13, 0);
  v3 = v13;
  v4 = (uint64_t *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 40);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v3, "safeObjectForKey:ofClass:", v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *v4;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "_persistActiveDeclarationKey:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_persistState");
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *v4;
      *(_DWORD *)buf = 136315394;
      v15 = "-[SUCorePolicyDDMConfiguration setActiveDeclarationKey:]_block_invoke";
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%s: Successfully set %{public}@ as active", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_11;
  }
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke_cold_1();

LABEL_11:
}

- (BOOL)addDeclaration:(id)a3 withKey:(id)a4
{
  return -[SUCorePolicyDDMConfiguration addDeclaration:returningError:](self, "addDeclaration:returningError:", a3, 0);
}

- (BOOL)addDeclaration:(id)a3 withKey:(id)a4 returningError:(id *)a5
{
  return -[SUCorePolicyDDMConfiguration addDeclaration:returningError:](self, "addDeclaration:returningError:", a3, a5);
}

- (BOOL)addDeclaration:(id)a3 returningError:(id *)a4
{
  id v6;
  NSObject *stateQueue;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  SUCorePolicyDDMConfiguration *v14;
  uint64_t *v15;
  uint64_t *v16;
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

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke;
  v12[3] = &unk_1EA879340;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v15 = &v17;
  v16 = &v23;
  dispatch_sync(stateQueue, v12);
  v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v9 = *((unsigned __int8 *)v24 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke(uint64_t a1)
{
  SUCoreDDMDeclaration *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  SUCoreDDMDeclaration *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInternal") & 1) != 0)
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8);

    if (v4)
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[SUCorePolicyDDMConfiguration addDeclaration:returningError:]_block_invoke";
        _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "%s: [INTERNAL] _allowInvalidDeclaration is set to YES!!! Allow invalid declarations", buf, 0xCu);
      }

      v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v23 = 0;
  v8 = -[SUCoreDDMDeclaration isValidDeclarationWithReason:](v2, "isValidDeclarationWithReason:", &v23);
  v7 = v23;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 9100, 0, v7);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;
    goto LABEL_18;
  }
LABEL_8:
  -[SUCoreDDMDeclaration declarationKey](v2, "declarationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v21 = 0;
  v22 = 0;
  objc_msgSend(v10, "_getDeclarations:invalid:", &v22, &v21);
  v11 = v22;
  v12 = v21;
  objc_msgSend(v11, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_2();
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(v11, "setSafeObject:forKey:", *(_QWORD *)(a1 + 32), v9);
      objc_msgSend(*(id *)(a1 + 40), "_persistValidDeclarations:", v11);
      objc_msgSend(*(id *)(a1 + 40), "_persistState");
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "oslog");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[SUCorePolicyDDMConfiguration addDeclaration:returningError:]_block_invoke";
        v26 = 2114;
        v27 = v2;
        _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "%s: Adding %{public}@", buf, 0x16u);
      }
    }
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_18:

}

- (id)declarationForKey:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke;
  block[3] = &unk_1EA878C48;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  SUCoreDDMDeclaration *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v17 = 0;
  v18 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v18, &v17);
  v3 = v18;
  v4 = v17;
  v5 = a1 + 5;
  objc_msgSend(v3, "safeObjectForKey:ofClass:", a1[5], objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = CFSTR("a valid");
LABEL_5:
    v10 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", v7);
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *v5;
      *(_DWORD *)buf = 136315650;
      v20 = "-[SUCorePolicyDDMConfiguration declarationForKey:]_block_invoke";
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%s: Found %{public}@ declaration for %{public}@", buf, 0x20u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v4, "safeObjectForKey:ofClass:", *v5, objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7 = v9;
    v8 = CFSTR("an invalid");
    goto LABEL_5;
  }
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke_cold_1();
LABEL_8:

}

- (id)allDeclarations
{
  NSObject *stateQueue;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v12 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke;
  v6[3] = &unk_1EA877ED0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v8, 0);
  v3 = v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke_2;
  v7[3] = &unk_1EA879368;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sortUsingComparator:", &__block_literal_global_213);
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v10 = "-[SUCorePolicyDDMConfiguration allDeclarations]_block_invoke";
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "%s: Sorted valid enforced-su declarations: %{public}@", buf, 0x16u);
  }

}

void __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SUCoreDDMDeclaration *v5;

  v4 = a3;
  v5 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
}

uint64_t __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)allDeclarationsIncludingInvalid
{
  NSObject *stateQueue;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  v15 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke;
  v9[3] = &unk_1EA877ED0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateQueue, v9);
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v11[5];
    *(_DWORD *)buf = 136315394;
    v17 = "-[SUCorePolicyDDMConfiguration allDeclarationsIncludingInvalid]";
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "%s: All enforced-su declarations: %{public}@", buf, 0x16u);
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v9 = 0;
  v8 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v9, &v8);
  v3 = v9;
  v4 = v8;
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_2;
  v7[3] = &unk_1EA879368;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_3;
  v6[3] = &unk_1EA879368;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SUCoreDDMDeclaration *v5;

  v4 = a3;
  v5 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
}

void __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SUCoreDDMDeclaration *v5;

  v4 = a3;
  v5 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
}

- (BOOL)invalidateDeclarationForKey:(id)a3
{
  id v4;
  NSObject *stateQueue;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  if (v4)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke;
    block[3] = &unk_1EA878C48;
    block[4] = self;
    v18 = v4;
    v19 = &v20;
    dispatch_sync(stateQueue, block);
    v6 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v6 = 0;
  }

  return v6;
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
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
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v20 = 0;
  v21 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v21, &v20);
  v3 = v21;
  v4 = v20;
  v5 = (id *)(a1 + 40);
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getActiveDeclarationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (!v6)
      goto LABEL_15;
    v9 = 0;
LABEL_9:
    objc_msgSend(v4, "objectForKey:", *v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_2();

      if (!v9)
        goto LABEL_14;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *v5;
        *(_DWORD *)buf = 136315394;
        v23 = "-[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:]_block_invoke";
        v24 = 2114;
        v25 = v19;
        _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%s: Marking the declaration invalid for %{public}@", buf, 0x16u);
      }

      objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_persistInvalidDeclarations:", v4);
      if (!v9)
        goto LABEL_14;
    }
    objc_msgSend(*(id *)(a1 + 32), "_persistActiveDeclarationKey:", 0);
LABEL_14:
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_persistValidDeclarations:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_persistState");
LABEL_19:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_20;
  }
  v8 = objc_msgSend(*v5, "isEqualToString:", v7);
  v9 = v8;
  if (v6)
    goto LABEL_9;
  if (v8)
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "_persistActiveDeclarationKey:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_persistState");
  }
LABEL_15:
  objc_msgSend(v4, "objectForKey:", *v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v17 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *v5;
      *(_DWORD *)buf = 136315394;
      v23 = "-[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:]_block_invoke";
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "%s: The declaration is already invalid for %{public}@", buf, 0x16u);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_1();

LABEL_20:
}

- (void)removeAllDeclarations
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SUCorePolicyDDMConfiguration_removeAllDeclarations__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__SUCorePolicyDDMConfiguration_removeAllDeclarations__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x1E0C9AA70];
  objc_msgSend(*(id *)(a1 + 32), "_persistValidDeclarations:", MEMORY[0x1E0C9AA70]);
  objc_msgSend(*(id *)(a1 + 32), "_persistInvalidDeclarations:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_persistActiveDeclarationKey:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_persistState");
}

- (void)removeAllInvalidDeclarations
{
  id v2;

  v2 = -[SUCorePolicyDDMConfiguration removeAllInvalidDeclarationsReturningInvalid](self, "removeAllInvalidDeclarationsReturningInvalid");
}

- (id)invalidateAllInvalidDeclarationsReturningAllInvalid
{
  NSObject *stateQueue;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v12 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke;
  v6[3] = &unk_1EA877ED0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v2 = *(void **)(a1 + 32);
  v18 = 0;
  v19 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v19, &v18);
  v3 = v19;
  v4 = v18;
  objc_msgSend(*(id *)(a1 + 32), "_getActiveDeclarationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2;
  v11[3] = &unk_1EA8793D0;
  v7 = v5;
  v12 = v7;
  v15 = &v20;
  v8 = v4;
  v13 = v8;
  v16 = &v24;
  v9 = v3;
  v14 = v9;
  v17 = &v28;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (*((_BYTE *)v29 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_persistValidDeclarations:", v9);
  if (*((_BYTE *)v25 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_persistInvalidDeclarations:", v8);
  if (*((_BYTE *)v21 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_persistActiveDeclarationKey:", 0);
  if (*((_BYTE *)v29 + 24) || *((_BYTE *)v25 + 24) || *((_BYTE *)v21 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_persistState");
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_216;
  v10[3] = &unk_1EA8793F8;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SUCoreDDMDeclaration *v7;
  SUCoreDDMDeclaration *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  SUCoreDDMDeclaration *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", v6);
  v8 = v7;
  if (v7 && !-[SUCoreDDMDeclaration isValidDeclaration](v7, "isValidDeclaration"))
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[SUCorePolicyDDMConfiguration invalidateAllInvalidDeclarationsReturningAllInvalid]_block_invoke_2";
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is nolonger valid; invalidating it",
        (uint8_t *)&v14,
        0x16u);
    }

    if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2_cold_1();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }

}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_216(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  SUCoreDDMDeclaration *v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a3;
  v5 = -[SUCoreDDMDeclaration initWithDeclarationKeys:]([SUCoreDDMDeclaration alloc], "initWithDeclarationKeys:", v4);

  objc_msgSend(v3, "addObject:", v5);
}

- (id)allKeys
{
  NSObject *stateQueue;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v12 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SUCorePolicyDDMConfiguration_allKeys__block_invoke;
  v6[3] = &unk_1EA877ED0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__SUCorePolicyDDMConfiguration_allKeys__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v9 = 0;
  v10 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v10, &v9);
  v3 = v10;
  v4 = v9;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v4, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

}

- (BOOL)removeDeclarationForKey:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke;
    block[3] = &unk_1EA878C48;
    block[4] = self;
    v6 = v4;
    v22 = v6;
    v23 = &v24;
    dispatch_sync(stateQueue, block);
    if (*((_BYTE *)v25 + 24))
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[SUCorePolicyDDMConfiguration removeDeclarationForKey:]";
        v30 = 2114;
        v31 = v6;
        _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%s: Successfully removed %{public}@", buf, 0x16u);
      }
    }
    else
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SUCorePolicyDDMConfiguration removeDeclarationForKey:].cold.2();
    }

    v18 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SUCorePolicyDDMConfiguration removeDeclarationForKey:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = 0;
  }

  return v18;
}

void __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  v15 = 0;
  objc_msgSend(v2, "_getDeclarations:invalid:", &v15, &v14);
  v3 = v15;
  v4 = v14;
  objc_msgSend(*(id *)(a1 + 32), "_getActiveDeclarationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)(a1 + 40);
  v7 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v5);
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "removeObjectForKey:", *v6);
  objc_msgSend(v4, "objectForKey:", *v6);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "removeObjectForKey:", *v6);
    if (v7)
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "oslog");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_2();

    }
    if (v8)
    {
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_persistValidDeclarations:", v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "_persistInvalidDeclarations:", v4);
  }
  else if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_persistValidDeclarations:", v3);
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_persistActiveDeclarationKey:", 0);
LABEL_18:
    objc_msgSend(*(id *)(a1 + 32), "_persistState");
    goto LABEL_19;
  }
  if (v8 | v9)
    goto LABEL_18;
LABEL_19:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (v8 | v9) != 0;

}

- (id)currentlyApplicableDeclaration
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[SUCorePolicyDDMConfiguration allDeclarations](self, "allDeclarations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "declarationFromAllDeclarations:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)declarationFromAllDeclarationDicts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUCoreDDMDeclaration *v11;
  SUCoreDDMDeclaration *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [SUCoreDDMDeclaration alloc];
        v12 = -[SUCoreDDMDeclaration initWithDeclarationKeys:](v11, "initWithDeclarationKeys:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "declarationFromAllDeclarations:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)declarationFromAllDeclarations:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_217);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "+[SUCorePolicyDDMConfiguration declarationFromAllDeclarations:]";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "%s: Sorted DDM declarations: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__SUCorePolicyDDMConfiguration_declarationFromAllDeclarations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)addGlobalSettingsDeclaration:(id)a3 returningError:(id *)a4
{
  id v6;
  NSObject *stateQueue;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  SUCorePolicyDDMConfiguration *v14;
  uint64_t *v15;
  uint64_t *v16;
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

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__SUCorePolicyDDMConfiguration_addGlobalSettingsDeclaration_returningError___block_invoke;
  v12[3] = &unk_1EA879340;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v15 = &v23;
  v16 = &v17;
  dispatch_sync(stateQueue, v12);
  v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v9 = *((unsigned __int8 *)v24 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __76__SUCorePolicyDDMConfiguration_addGlobalSettingsDeclaration_returningError___block_invoke(uint64_t a1)
{
  SUCoreDDMDeclarationGlobalSettings *v2;
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SUCoreDDMDeclarationGlobalSettings *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = -[SUCoreDDMDeclarationGlobalSettings initWithDeclarationKeys:]([SUCoreDDMDeclarationGlobalSettings alloc], "initWithDeclarationKeys:", *(_QWORD *)(a1 + 32));
  v12 = 0;
  v3 = -[SUCoreDDMDeclarationGlobalSettings isValidDeclarationWithReason:](v2, "isValidDeclarationWithReason:", &v12);
  v4 = v12;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistDictionary:forKey:shouldPersist:", *(_QWORD *)(a1 + 32), CFSTR("SUCoreDDMDeclarationGlobalSettings"), 1);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SUCorePolicyDDMConfiguration addGlobalSettingsDeclaration:returningError:]_block_invoke";
      v15 = 2114;
      v16 = v2;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "%s: Invalid global settings declaration: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildError:underlying:description:", 9100, 0, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)currentGlobalSettingsDeclaration
{
  NSObject *stateQueue;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SUCorePolicyDDMConfiguration_currentGlobalSettingsDeclaration__block_invoke;
  v6[3] = &unk_1EA877ED0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__SUCorePolicyDDMConfiguration_currentGlobalSettingsDeclaration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SUCoreDDMDeclarationGlobalSettings *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("SUCoreDDMDeclarationGlobalSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[SUCoreDDMDeclarationGlobalSettings initWithDeclarationKeys:]([SUCoreDDMDeclarationGlobalSettings alloc], "initWithDeclarationKeys:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = 136315394;
    v11 = "-[SUCorePolicyDDMConfiguration currentGlobalSettingsDeclaration]_block_invoke";
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%s: Current global settings declaration: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)removeGlobalSettingsDeclaration
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SUCorePolicyDDMConfiguration_removeGlobalSettingsDeclaration__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __63__SUCorePolicyDDMConfiguration_removeGlobalSettingsDeclaration__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "persistedState");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "persistDictionary:forKey:shouldPersist:", 0, CFSTR("SUCoreDDMDeclarationGlobalSettings"), 1);

}

- (id)_dateFromString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SUCorePolicyDDMConfiguration allDeclarations](self, "allDeclarations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCorePolicyDDMConfiguration (Declarations:%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SUCorePersistedState)persistedState
{
  return (SUCorePersistedState *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistedState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)stateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)allowInvalidDeclaration
{
  return self->_allowInvalidDeclaration;
}

- (void)setAllowInvalidDeclaration:(BOOL)a3
{
  self->_allowInvalidDeclaration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
}

- (void)initWithStatePersistencePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, a1, a3, "%s: Failed to create persisted path; fall back to '%{public}@'",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_2_0();
}

void __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: Unable to read corrupted software update state file.  Exception: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a1, a3, "%s: Failed to load persisted state", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)getDaemonCacheDirectory
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a1, a3, "%s: Failed to get CS_DARWIN_USER_CACHE_DIR for daemon, fallback to tmp", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  v2 = 136315650;
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_5_0(&dword_1DDFDD000, v0, v1, "%s: %{public}@ is not in the valid declarations %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: There is already a tracked invalid declaration for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: There is already a tracked valid declaration for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: Unable to find any declaration for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)invalidateDeclarationForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a1, a3, "%s: Invalid declaration key to invalidate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: Unable to find any declaration to invalidate for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: The declaration is both valid and invalid for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: The declaration with active key = %{public}@ was invalid", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: The declaration is both valid and invalid for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)removeDeclarationForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a1, a3, "%s: Unable to remove declaration for null key", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)removeDeclarationForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: Unable to find any declaration to remove for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: The declaration was both valid and invalid for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: The declaration with key = %{public}@ was invalid", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
