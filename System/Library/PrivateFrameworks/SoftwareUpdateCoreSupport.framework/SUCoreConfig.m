@implementation SUCoreConfig

- (SUCoreConfig)initWithProjectName:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  SUCoreConfig *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("SoftwareUpdateCore")) & 1) == 0)
  {
    objc_msgSend(CFSTR("/var/mobile/Library/Preferences/com.apple.SoftwareUpdateCore"), "stringByAppendingFormat:", CFSTR(".%@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("/var/mobile/Library/Preferences/com.apple.SoftwareUpdateCore");
  }
  -[__CFString stringByAppendingPathExtension:](v6, "stringByAppendingPathExtension:", CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SUCoreConfig initWithProjectName:defaultsPath:](self, "initWithProjectName:defaultsPath:", v5, v7);
  return v8;
}

- (SUCoreConfig)initWithProjectName:(id)a3 defaultsPath:(id)a4
{
  id v7;
  id v8;
  SUCoreConfig *v9;
  SUCoreConfig *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  void *v14;
  NSObject *v15;
  void *v16;
  SUCoreConfig *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SUCoreConfig initWithProjectName:defaultsPath:].cold.2();
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SUCoreConfig initWithProjectName:defaultsPath:].cold.1();
LABEL_12:

    v17 = 0;
    goto LABEL_13;
  }
  v22.receiver = self;
  v22.super_class = (Class)SUCoreConfig;
  v9 = -[SUCoreConfig init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_projectName, a3);
    objc_storeStrong((id *)&v10->_defaultsPath, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.SoftwareUpdateCore.SUCoreConfigAccessQueue", v11);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v12;

  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "oslog");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConfig getConfig](v10, "getConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v7;
    v25 = 2114;
    v26 = v8;
    v27 = 2114;
    v28 = v16;
    _os_log_impl(&dword_1B05B8000, v15, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Initializing with name '%{public}@' and defaults path '%{public}@' containing current config: %{public}@", buf, 0x20u);

  }
  self = v10;
  v17 = self;
LABEL_13:

  return v17;
}

- (void)stateSafeSetConfig:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v6
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[SUCoreConfig stateSafeGetConfig](self, "stateSafeGetConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = v12;

      if (v6)
        -[NSObject setSafeObject:forKey:](v14, "setSafeObject:forKey:", v6, v7);
      else
        -[NSObject removeObjectForKey:](v14, "removeObjectForKey:", v7);
      -[SUCoreConfig defaultsPath](self, "defaultsPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0C99E98];
        -[SUCoreConfig defaultsPath](self, "defaultsPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fileURLWithPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v19 = -[NSObject writeToURL:error:](v14, "writeToURL:error:", v18, &v26);
        v20 = v26;

        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "oslog");
        v22 = objc_claimAutoreleasedReturnValue();

        if ((v19 & 1) != 0)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            -[SUCoreConfig defaultsPath](self, "defaultsPath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v28 = v23;
            v29 = 2114;
            v30 = v14;
            _os_log_impl(&dword_1B05B8000, v22, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Successfully updated config at path '%{public}@': %{public}@", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[SUCoreConfig stateSafeSetConfig:forKey:].cold.2();
        }

      }
      else
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "oslog");
        v20 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[SUCoreConfig stateSafeSetConfig:forKey:].cold.1(v20);
      }

    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "oslog");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SUCoreConfig stateSafeSetConfig:forKey:].cold.3();
    }
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SUCoreConfig stateSafeSetConfig:forKey:].cold.4();
  }

}

- (id)stateSafeGetConfig
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUCoreConfig accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1E0C99D80];
  -[SUCoreConfig defaultsPath](self, "defaultsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setConfig:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  -[SUCoreConfig accessQueue](self, "accessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreConfig_setConfig_forKey___block_invoke;
  block[3] = &unk_1E611C270;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

uint64_t __33__SUCoreConfig_setConfig_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateSafeSetConfig:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)getConfig
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[SUCoreConfig accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__SUCoreConfig_getConfig__block_invoke;
  v7[3] = &unk_1E611BFB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __25__SUCoreConfig_getConfig__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "stateSafeGetConfig");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)clearConfig
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUCoreConfig accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[SUCoreConfig accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SUCoreConfig_clearConfig__block_invoke;
  block[3] = &unk_1E611BF88;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __27__SUCoreConfig_clearConfig__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "defaultsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "fileExistsAtPath:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "defaultsPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "removeItemAtPath:error:", v8, &v15);
    v9 = v15;

    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __27__SUCoreConfig_clearConfig__block_invoke_cold_1(v3, (uint64_t)v9, v11);

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v3, "defaultsPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] ClearConfig: Successfully removed configuration at path: %{public}@", buf, 0xCu);

      }
      v9 = v11;
    }
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v3, "defaultsPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] ClearConfig: Configuration file does not exist at path: %{public}@", buf, 0xCu);

    }
  }

}

- (BOOL)getBoolConfigForKey:(id)a3
{
  return -[SUCoreConfig getBoolConfigForKey:defaultValue:](self, "getBoolConfigForKey:defaultValue:", a3, 0);
}

- (BOOL)getBoolConfigForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;

  v6 = a3;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = a4;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__SUCoreConfig_getBoolConfigForKey_defaultValue___block_invoke;
  v11[3] = &unk_1E611C440;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v9 = v6;
  dispatch_sync(v8, v11);

  LOBYTE(self) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __49__SUCoreConfig_getBoolConfigForKey_defaultValue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateSafeGetConfig");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "safeBooleanForKey:defaultValue:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (id)getStringConfigForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SUCoreConfig_getStringConfigForKey___block_invoke;
  block[3] = &unk_1E611C468;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__SUCoreConfig_getStringConfigForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stateSafeGetConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getNumberConfigForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  -[SUCoreConfig accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SUCoreConfig_getNumberConfigForKey___block_invoke;
  block[3] = &unk_1E611C468;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__SUCoreConfig_getNumberConfigForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stateSafeGetConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeObjectForKey:ofClass:", *(_QWORD *)(a1 + 40), objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreConfig projectName](self, "projectName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfig defaultsPath](self, "defaultsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreConfig(%@;%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)projectName
{
  return self->_projectName;
}

- (NSString)defaultsPath
{
  return self->_defaultsPath;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_defaultsPath, 0);
  objc_storeStrong((id *)&self->_projectName, 0);
}

- (void)initWithProjectName:defaultsPath:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreConfig] Attempting to initialize with defaultsPath of an unsupported class: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithProjectName:defaultsPath:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreConfig] Attempting to initialize with project name of an unsupported class: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)stateSafeSetConfig:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B05B8000, log, OS_LOG_TYPE_ERROR, "[SUCoreConfig] Attempting to set config with no defaults path present", v1, 2u);
}

- (void)stateSafeSetConfig:forKey:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B05B8000, v0, OS_LOG_TYPE_ERROR, "[SUCoreConfig] Failed to write config to defaults path with error: %{public}@", v1, 0xCu);
}

- (void)stateSafeSetConfig:forKey:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreConfig] Attempting to set unsupported class to configuration file: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)stateSafeSetConfig:forKey:.cold.4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B05B8000, v2, v3, "[SUCoreConfig] Attempting to set config with key of unsupported class: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __27__SUCoreConfig_clearConfig__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "defaultsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1B05B8000, a3, OS_LOG_TYPE_ERROR, "[SUCoreConfig] ClearConfig: Failed to remove configuration at path '%{public}@': %{public}@", v6, 0x16u);

}

@end
