@implementation BYXPCActivityRegistrar

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __40__BYXPCActivityRegistrar_sharedInstance__block_invoke()
{
  BYXPCActivityRegistrar *v0;
  void *v1;

  v0 = objc_alloc_init(BYXPCActivityRegistrar);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)registerActivityWithIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  const char *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = a3;
    _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Registering activity: %s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__BYXPCActivityRegistrar_registerActivityWithIdentifier_criteria_handler___block_invoke;
  v11[3] = &unk_1E4E26A78;
  v12 = v7;
  v13 = a3;
  v10 = v7;
  xpc_activity_register(a3, v8, v11);

}

void __74__BYXPCActivityRegistrar_registerActivityWithIdentifier_criteria_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Running activity handler: %s", (uint8_t *)&v7, 0xCu);
  }

  +[BYXPCActivity activityWithXPCActivity:](BYXPCActivity, "activityWithXPCActivity:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterActivityWithIdentifier:(const char *)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = a3;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Unregistering activity: %s", (uint8_t *)&v5, 0xCu);
  }

  xpc_activity_unregister(a3);
}

@end
