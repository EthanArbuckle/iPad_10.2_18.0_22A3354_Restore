@implementation ATXLocationManagerStateStoreOnDiskEnv

- (void)dealloc
{
  objc_super v3;

  if (self->_stateChangeRegistration)
    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForLockStateChangeNotifications:");
  v3.receiver = self;
  v3.super_class = (Class)ATXLocationManagerStateStoreOnDiskEnv;
  -[ATXLocationManagerStateStoreOnDiskEnv dealloc](&v3, sel_dealloc);
}

- (BOOL)isLocked
{
  return objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked") ^ 1;
}

- (int)openFileAtPath:(id)a3 dataProtectionClass:(int)a4
{
  id v5;
  int v6;
  NSObject *v7;

  v5 = objc_retainAutorelease(a3);
  v6 = open_dprotected_np((const char *)objc_msgSend(v5, "UTF8String"), 514, a4, 0, 384);
  if (v6 < 0 && *__error() != 1)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXLocationManagerStateStoreOnDiskEnv openFileAtPath:dataProtectionClass:].cold.1((uint64_t)v5, v7);

  }
  return v6;
}

- (void)callOnNextUnlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id stateChangeRegistration;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationManagerStateStore.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callback"));

  }
  if (self->_stateChangeRegistration)
    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForLockStateChangeNotifications:");
  v15 = 0;
  v16 = (id *)&v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v6 = (void *)MEMORY[0x1E0D81590];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__ATXLocationManagerStateStoreOnDiskEnv_callOnNextUnlock___block_invoke;
  v12[3] = &unk_1E942DF48;
  v7 = v5;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(v6, "registerForLockStateChangeNotifications:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  stateChangeRegistration = self->_stateChangeRegistration;
  self->_stateChangeRegistration = v8;

  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  objc_storeStrong(v16 + 5, self->_stateChangeRegistration);
  objc_sync_exit(v10);

  _Block_object_dispose(&v15, 8);
}

void __58__ATXLocationManagerStateStoreOnDiskEnv_callOnNextUnlock___block_invoke(uint64_t a1, int a2)
{
  id obj;

  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_opt_class();
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForLockStateChangeNotifications:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_sync_exit(obj);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeRegistration, 0);
}

- (void)openFileAtPath:(uint64_t)a1 dataProtectionClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int *v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 138412802;
  v8 = a1;
  v9 = 1024;
  v10 = v4;
  v11 = 2080;
  v12 = v6;
  _os_log_fault_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_FAULT, "failed to open '%@': [%i] %s", (uint8_t *)&v7, 0x1Cu);
}

@end
