@implementation ATXLocationManagerStateStoreOnDisk

- (ATXLocationManagerStateStoreOnDisk)initWithPath:(id)a3 environment:(id)a4 locationParameters:(id)a5
{
  id v10;
  id v11;
  id v12;
  ATXLocationManagerStateStoreOnDisk *v13;
  ATXLocationManagerStateStoreOnDisk *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManagerStateStore.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManagerStateStore.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ATXLocationManagerStateStoreOnDisk;
  v13 = -[ATXLocationManagerStateStoreOnDisk init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_path, a3);
    objc_storeStrong((id *)&v14->_env, a4);
    v14->_fd = -1;
    v14->_cacheExpirationInterval = (double)(int)objc_msgSend(v12, "previousLOIExpirationTime");
  }

  return v14;
}

- (ATXLocationManagerStateStoreOnDisk)initWithLocationParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ATXLocationManagerStateStoreOnDisk *v15;

  v4 = (void *)MEMORY[0x1E0CF94D8];
  v5 = a3;
  objc_msgSend(v4, "appPredictionDirectoryFile:", CFSTR("ATXLocationManagerState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("contextstored"));

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D15900], "knowledgeDirectory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("ATXLocationManagerState"));
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("-unrestricted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v15 = -[ATXLocationManagerStateStoreOnDisk initWithPath:environment:locationParameters:](self, "initWithPath:environment:locationParameters:", v13, v14, v5);

  return v15;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  v4.receiver = self;
  v4.super_class = (Class)ATXLocationManagerStateStoreOnDisk;
  -[ATXLocationManagerStateStoreOnDisk dealloc](&v4, sel_dealloc);
}

- (BOOL)_tryToOpen
{
  ATXLocationManagerStateStoreOnDisk *v2;
  BOOL v3;
  int v4;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_fd < 0)
  {
    v4 = -[ATXLocationManagerStateStoreOnDiskEnv openFileAtPath:dataProtectionClass:](v2->_env, "openFileAtPath:dataProtectionClass:", v2->_path, 3);
    v2->_fd = v4;
    v3 = v4 >= 0;
  }
  else
  {
    v3 = 1;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)loadNowOrCallLater:(id)a3
{
  id v4;
  ATXLocationManagerStateStoreOnDisk *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  id deferredLoadCallback;
  ATXLocationManagerStateStoreOnDiskEnv *env;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[ATXLocationManagerStateStoreOnDisk _tryToOpen](v5, "_tryToOpen"))
  {
    v6 = (void *)MEMORY[0x1D82448B0]();
    location = 0;
    -[ATXLocationManagerStateStoreOnDisk cacheExpirationInterval](v5, "cacheExpirationInterval");
    ATXCacheFileRead();

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v7 = !-[ATXLocationManagerStateStoreOnDiskEnv isLocked](v5->_env, "isLocked");
    if (!v4)
      LOBYTE(v7) = 1;
    if ((v7 & 1) == 0 && !v5->_deferredLoadCallback)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fileExistsAtPath:", v5->_path);

      if (v9)
      {
        objc_initWeak(&location, v5);
        v10 = MEMORY[0x1D8244A3C](v4);
        deferredLoadCallback = v5->_deferredLoadCallback;
        v5->_deferredLoadCallback = (id)v10;

        env = v5->_env;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __57__ATXLocationManagerStateStoreOnDisk_loadNowOrCallLater___block_invoke;
        v14[3] = &unk_1E942DA58;
        objc_copyWeak(&v15, &location);
        -[ATXLocationManagerStateStoreOnDiskEnv callOnNextUnlock:](env, "callOnNextUnlock:", v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }
  objc_sync_exit(v5);

  return 0;
}

void __57__ATXLocationManagerStateStoreOnDisk_loadNowOrCallLater___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceDidUnlock");

}

- (void)_deviceDidUnlock
{
  ATXLocationManagerStateStoreOnDisk *v2;
  void (**v3)(_QWORD, _QWORD);
  id deferredLoadCallback;
  id v5;

  v2 = self;
  objc_sync_enter(v2);
  -[ATXLocationManagerStateStoreOnDisk loadNowOrCallLater:](v2, "loadNowOrCallLater:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8244A3C](v2->_deferredLoadCallback);
  deferredLoadCallback = v2->_deferredLoadCallback;
  v2->_deferredLoadCallback = 0;

  objc_sync_exit(v2);
  if (v3)
    ((void (**)(_QWORD, id))v3)[2](v3, v5);

}

- (void)write:(id)a3
{
  id v4;
  ATXLocationManagerStateStoreOnDisk *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[ATXLocationManagerStateStoreOnDisk _tryToOpen](v5, "_tryToOpen"))
  {
    v6 = (void *)MEMORY[0x1D82448B0]();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v7)
    {
      v19[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ATXCacheFileWriteChunks();

      if ((v10 & 1) != 0)
      {
LABEL_9:

        objc_autoreleasePoolPop(v6);
        goto LABEL_10;
      }
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ATXLocationManagerStateStoreOnDisk write:].cold.2(v11);
    }
    else
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[ATXLocationManagerStateStoreOnDisk write:].cold.1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
    }

    goto LABEL_9;
  }
LABEL_10:
  objc_sync_exit(v5);

}

- (void)clear
{
  void *v2;
  int fd;
  ATXLocationManagerStateStoreOnDisk *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", obj->_path, 0);

  fd = obj->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    obj->_fd = -1;
  }
  objc_sync_exit(obj);

}

- (double)cacheExpirationInterval
{
  return self->_cacheExpirationInterval;
}

- (void)setCacheExpirationInterval:(double)a3
{
  self->_cacheExpirationInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredLoadCallback, 0);
  objc_storeStrong((id *)&self->_env, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)loadNowOrCallLater:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, a2, a3, "Error deserializing: %@", a5, a6, a7, a8, 2u);
}

- (void)write:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, a2, a3, "Error serializing: %@", a5, a6, a7, a8, 2u);
}

- (void)write:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "Error writing location manager file", v1, 2u);
}

@end
