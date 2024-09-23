@implementation SSLogConfig

- (void)setBackingOSLogObject:(id)a3
{
  objc_storeStrong((id *)&self->_backingOSLogObject, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SSLogConfig *v5;
  void *v6;
  uint64_t v7;
  NSString *category;
  void *v9;
  uint64_t v10;
  NSString *subsystem;

  v5 = -[SSLogConfig init](+[SSLogConfig allocWithZone:](SSLogConfig, "allocWithZone:"), "init");
  -[SSLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  category = v5->_category;
  v5->_category = (NSString *)v7;

  v5->_environment = -[SSLogConfig environment](self, "environment");
  objc_storeStrong((id *)&v5->_outputDirectory, self->_outputDirectory);
  objc_storeStrong((id *)&v5->_outputFilename, self->_outputFilename);
  -[SSLogConfig subsystem](self, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  subsystem = v5->_subsystem;
  v5->_subsystem = (NSString *)v10;

  v5->_writeToDisk = -[SSLogConfig writeToDisk](self, "writeToDisk");
  return v5;
}

- (SSLogConfig)init
{
  SSLogConfig *v2;
  SSLogConfig *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *propertyAccessQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSLogConfig;
  v2 = -[SSLogConfig init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_environment = 0;
    v4 = dispatch_queue_create("com.apple.StoreServices.SSLogConfig", MEMORY[0x1E0C80D50]);
    propertyAccessQueue = v3->_propertyAccessQueue;
    v3->_propertyAccessQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

id *__26__SSLogConfig_OSLogObject__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *result;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  os_log_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "backingOSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  result = (id *)(v5 + 40);
  if (!v7)
  {
    objc_storeStrong(result, MEMORY[0x1E0C81028]);
    objc_msgSend(*(id *)(a1 + 32), "subsystem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        return (id *)objc_msgSend(*(id *)(a1 + 32), "setBackingOSLogObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "subsystem");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (const char *)objc_msgSend(v8, "UTF8String");
      objc_msgSend(*(id *)(a1 + 32), "category");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = os_log_create(v11, (const char *)objc_msgSend(v12, "UTF8String"));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    return (id *)objc_msgSend(*(id *)(a1 + 32), "setBackingOSLogObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void __26__SSLogConfig_OSLogObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backingOSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (OS_os_log)backingOSLogObject
{
  return self->_backingOSLogObject;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (BOOL)debugLogsEnabled
{
  void *v2;
  BOOL v3;

  -[SSLogConfig OSLogObject](self, "OSLogObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SSLogConfig _debugLogsEnabled:](SSLogConfig, "_debugLogsEnabled:", v2);

  return v3;
}

- (OS_os_log)OSLogObject
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__44;
  v15 = __Block_byref_object_dispose__44;
  v16 = 0;
  -[SSLogConfig propertyAccessQueue](self, "propertyAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SSLogConfig_OSLogObject__block_invoke;
  block[3] = &unk_1E47B8680;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  v5 = (void *)v12[5];
  if (!v5)
  {
    -[SSLogConfig propertyAccessQueue](self, "propertyAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __26__SSLogConfig_OSLogObject__block_invoke_2;
    v9[3] = &unk_1E47B8680;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_barrier_sync(v6, v9);

    v5 = (void *)v12[5];
  }
  v7 = v5;
  _Block_object_dispose(&v11, 8);

  return (OS_os_log *)v7;
}

- (OS_dispatch_queue)propertyAccessQueue
{
  return self->_propertyAccessQueue;
}

+ (BOOL)_debugLogsEnabled:(id)a3
{
  return os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG);
}

+ (id)sharedAccountsConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSLogConfig_sharedAccountsConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAccountsConfig_ss_once_token___COUNTER__, block);
  return (id)sharedAccountsConfig_ss_once_object___COUNTER__;
}

- (BOOL)shouldLogToDisk
{
  _BOOL4 v3;

  v3 = -[SSLogConfig shouldLog](self, "shouldLog");
  if (v3)
    LOBYTE(v3) = -[SSLogConfig writeToDisk](self, "writeToDisk")
              && +[SSLogConfig _deviceIsRunningInternalOrSeedBuild](SSLogConfig, "_deviceIsRunningInternalOrSeedBuild")|| -[SSLogConfig debugLogsEnabled](self, "debugLogsEnabled");
  return v3;
}

- (BOOL)shouldLog
{
  return !-[SSLogConfig environment](self, "environment")
      || +[SSLogConfig _deviceIsRunningInternalBuild](SSLogConfig, "_deviceIsRunningInternalBuild")
      && -[SSLogConfig environment](self, "environment") < 3
      || +[SSLogConfig _deviceIsRunningSeedBuild](SSLogConfig, "_deviceIsRunningSeedBuild")
      && -[SSLogConfig environment](self, "environment") < 2
      || -[SSLogConfig debugLogsEnabled](self, "debugLogsEnabled");
}

- (unint64_t)environment
{
  return self->_environment;
}

- (BOOL)writeToDisk
{
  return self->_writeToDisk;
}

+ (id)sharedDaemonConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSLogConfig_sharedDaemonConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedDaemonConfig_ss_once_token___COUNTER__, block);
  return (id)sharedDaemonConfig_ss_once_object___COUNTER__;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAccessQueue, 0);
  objc_storeStrong((id *)&self->_backingOSLogObject, 0);
  objc_storeStrong((id *)&self->_backingLogFileOptions, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectory, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

void __35__SSLogConfig_sharedAccountsConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices.accounts"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedAccountsConfig_ss_once_object___COUNTER__;
  sharedAccountsConfig_ss_once_object___COUNTER__ = v1;

}

void __40__SSLogConfig_sharedStoreServicesConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("StoreServices"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedStoreServicesConfig_ss_once_object___COUNTER__;
  sharedStoreServicesConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)_createLogConfigWithSubsystem:(id)a3 category:(id)a4
{
  return (id)objc_msgSend(a1, "_createLogConfigWithBaseConfig:subystem:category:", 0, a3, a4);
}

+ (id)_createLogConfigWithBaseConfig:(id)a3 subystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  SSMutableLogConfig *v10;
  SSMutableLogConfig *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
    v10 = (SSMutableLogConfig *)objc_msgSend(v7, "mutableCopy");
  else
    v10 = objc_alloc_init(SSMutableLogConfig);
  v11 = v10;
  if (v8)
    -[SSLogConfig setSubsystem:](v10, "setSubsystem:", v8);
  if (v9)
    -[SSLogConfig setCategory:](v11, "setCategory:", v9);
  v12 = (void *)-[SSMutableLogConfig copy](v11, "copy");

  return v12;
}

- (void)setSubsystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setWriteToDisk:(BOOL)a3
{
  self->_writeToDisk = a3;
}

+ (id)sharedStoreServicesConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSLogConfig_sharedStoreServicesConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStoreServicesConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedStoreServicesConfig_ss_once_token___COUNTER__, block);
  return (id)sharedStoreServicesConfig_ss_once_object___COUNTER__;
}

+ (id)sharedConfig
{
  if (sharedConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedConfig_ss_once_token___COUNTER__, &__block_literal_global_21);
  return (id)sharedConfig_ss_once_object___COUNTER__;
}

void __27__SSLogConfig_sharedConfig__block_invoke()
{
  SSLogConfig *v0;
  void *v1;

  v0 = objc_alloc_init(SSLogConfig);
  v1 = (void *)sharedConfig_ss_once_object___COUNTER__;
  sharedConfig_ss_once_object___COUNTER__ = (uint64_t)v0;

}

void __34__SSLogConfig_sharedPrivacyConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("privacy"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedPrivacyConfig_ss_once_object___COUNTER__;
  sharedPrivacyConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharedPrivacyConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSLogConfig_sharedPrivacyConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPrivacyConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedPrivacyConfig_ss_once_token___COUNTER__, block);
  return (id)sharedPrivacyConfig_ss_once_object___COUNTER__;
}

+ (id)sharedAccountsAuthenticationConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SSLogConfig_sharedAccountsAuthenticationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsAuthenticationConfig_onceToken != -1)
    dispatch_once(&sharedAccountsAuthenticationConfig_onceToken, block);
  return (id)sharedAccountsAuthenticationConfig_authenticationConfig;
}

void __49__SSLogConfig_sharedAccountsAuthenticationConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sharedAccountsConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v4, "setCategory:", CFSTR("authentication"));
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)sharedAccountsAuthenticationConfig_authenticationConfig;
  sharedAccountsAuthenticationConfig_authenticationConfig = v2;

}

+ (id)sharedAccountsCookiesConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSLogConfig_sharedAccountsCookiesConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsCookiesConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAccountsCookiesConfig_ss_once_token___COUNTER__, block);
  return (id)sharedAccountsCookiesConfig_ss_once_object___COUNTER__;
}

void __42__SSLogConfig_sharedAccountsCookiesConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedAccountsConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("cookies"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedAccountsCookiesConfig_ss_once_object___COUNTER__;
  sharedAccountsCookiesConfig_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedAccountsLogoutConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSLogConfig_sharedAccountsLogoutConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsLogoutConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAccountsLogoutConfig_ss_once_token___COUNTER__, block);
  return (id)sharedAccountsLogoutConfig_ss_once_object___COUNTER__;
}

void __41__SSLogConfig_sharedAccountsLogoutConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedAccountsConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("logout"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedAccountsLogoutConfig_ss_once_object___COUNTER__;
  sharedAccountsLogoutConfig_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedAccountsMigrationConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSLogConfig_sharedAccountsMigrationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsMigrationConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAccountsMigrationConfig_ss_once_token___COUNTER__, block);
  return (id)sharedAccountsMigrationConfig_ss_once_object___COUNTER__;
}

void __44__SSLogConfig_sharedAccountsMigrationConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedAccountsConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("migration"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedAccountsMigrationConfig_ss_once_object___COUNTER__;
  sharedAccountsMigrationConfig_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedAccountsMigrationConfigOversize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SSLogConfig_sharedAccountsMigrationConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsMigrationConfigOversize_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAccountsMigrationConfigOversize_ss_once_token___COUNTER__, block);
  return (id)sharedAccountsMigrationConfigOversize_ss_once_object___COUNTER__;
}

void __52__SSLogConfig_sharedAccountsMigrationConfigOversize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedAccountsMigrationConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("migration-oversize"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedAccountsMigrationConfigOversize_ss_once_object___COUNTER__;
  sharedAccountsMigrationConfigOversize_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedAccountsStorefrontConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSLogConfig_sharedAccountsStorefrontConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsStorefrontConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAccountsStorefrontConfig_ss_once_token___COUNTER__, block);
  return (id)sharedAccountsStorefrontConfig_ss_once_object___COUNTER__;
}

void __45__SSLogConfig_sharedAccountsStorefrontConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedAccountsConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("storefront"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedAccountsStorefrontConfig_ss_once_object___COUNTER__;
  sharedAccountsStorefrontConfig_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedAskPermissionExtensionConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SSLogConfig_sharedAskPermissionExtensionConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAskPermissionExtensionConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedAskPermissionExtensionConfig_ss_once_token___COUNTER__, block);
  return (id)sharedAskPermissionExtensionConfig_ss_once_object___COUNTER__;
}

void __49__SSLogConfig_sharedAskPermissionExtensionConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("askpermission"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedAskPermissionExtensionConfig_ss_once_object___COUNTER__;
  sharedAskPermissionExtensionConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharedBagConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSLogConfig_sharedBagConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBagConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedBagConfig_ss_once_token___COUNTER__, block);
  return (id)sharedBagConfig_ss_once_object___COUNTER__;
}

void __30__SSLogConfig_sharedBagConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices.bag"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedBagConfig_ss_once_object___COUNTER__;
  sharedBagConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharedBagCacheConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSLogConfig_sharedBagCacheConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBagCacheConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedBagCacheConfig_ss_once_token___COUNTER__, block);
  return (id)sharedBagCacheConfig_ss_once_object___COUNTER__;
}

void __35__SSLogConfig_sharedBagCacheConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedBagConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("cache"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedBagCacheConfig_ss_once_object___COUNTER__;
  sharedBagCacheConfig_ss_once_object___COUNTER__ = v2;

}

void __33__SSLogConfig_sharedDaemonConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("Daemon"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedDaemonConfig_ss_once_object___COUNTER__;
  sharedDaemonConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharedDaemonConfigOversize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSLogConfig_sharedDaemonConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonConfigOversize_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedDaemonConfigOversize_ss_once_token___COUNTER__, block);
  return (id)sharedDaemonConfigOversize_ss_once_object___COUNTER__;
}

void __41__SSLogConfig_sharedDaemonConfigOversize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedDaemonConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("Daemon-Oversize"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedDaemonConfigOversize_ss_once_object___COUNTER__;
  sharedDaemonConfigOversize_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedFairPlayAnisetteConfig
{
  if (sharedFairPlayAnisetteConfig_onceToken != -1)
    dispatch_once(&sharedFairPlayAnisetteConfig_onceToken, &__block_literal_global_27_0);
  return (id)sharedFairPlayAnisetteConfig_config;
}

uint64_t __43__SSLogConfig_sharedFairPlayAnisetteConfig__block_invoke()
{
  SSLogConfig *v0;
  void *v1;

  v0 = objc_alloc_init(SSLogConfig);
  v1 = (void *)sharedFairPlayAnisetteConfig_config;
  sharedFairPlayAnisetteConfig_config = (uint64_t)v0;

  objc_msgSend((id)sharedFairPlayAnisetteConfig_config, "setSubsystem:", CFSTR("com.apple.StoreServices.FairPlay"));
  objc_msgSend((id)sharedFairPlayAnisetteConfig_config, "setCategory:", CFSTR("anisette"));
  return objc_msgSend((id)sharedFairPlayAnisetteConfig_config, "setEnvironment:", 2);
}

+ (id)sharedFeatureEnablerMigrationConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSLogConfig_sharedFeatureEnablerMigrationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFeatureEnablerMigrationConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedFeatureEnablerMigrationConfig_ss_once_token___COUNTER__, block);
  return (id)sharedFeatureEnablerMigrationConfig_ss_once_object___COUNTER__;
}

void __50__SSLogConfig_sharedFeatureEnablerMigrationConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices.FeatureEnabler"), CFSTR("migration"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedFeatureEnablerMigrationConfig_ss_once_object___COUNTER__;
  sharedFeatureEnablerMigrationConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharedFollowUpConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSLogConfig_sharedFollowUpConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFollowUpConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedFollowUpConfig_ss_once_token___COUNTER__, block);
  return (id)sharedFollowUpConfig_ss_once_object___COUNTER__;
}

void __35__SSLogConfig_sharedFollowUpConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("followup"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedFollowUpConfig_ss_once_object___COUNTER__;
  sharedFollowUpConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharediTunesStoreConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SSLogConfig_sharediTunesStoreConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharediTunesStoreConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharediTunesStoreConfig_ss_once_token___COUNTER__, block);
  return (id)sharediTunesStoreConfig_ss_once_object___COUNTER__;
}

void __38__SSLogConfig_sharediTunesStoreConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("iTunesStore"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharediTunesStoreConfig_ss_once_object___COUNTER__;
  sharediTunesStoreConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharediTunesStoreConfigOversize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSLogConfig_sharediTunesStoreConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharediTunesStoreConfigOversize_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharediTunesStoreConfigOversize_ss_once_token___COUNTER__, block);
  return (id)sharediTunesStoreConfigOversize_ss_once_object___COUNTER__;
}

void __46__SSLogConfig_sharediTunesStoreConfigOversize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharediTunesStoreConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("iTunesStore-Oversize"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharediTunesStoreConfigOversize_ss_once_object___COUNTER__;
  sharediTunesStoreConfigOversize_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedPushNotificationConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SSLogConfig_sharedPushNotificationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPushNotificationConfig_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedPushNotificationConfig_ss_once_token___COUNTER__, block);
  return (id)sharedPushNotificationConfig_ss_once_object___COUNTER__;
}

void __43__SSLogConfig_sharedPushNotificationConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.StoreServices"), CFSTR("pushnotification"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedPushNotificationConfig_ss_once_object___COUNTER__;
  sharedPushNotificationConfig_ss_once_object___COUNTER__ = v1;

}

+ (id)sharedStoreServicesConfigOversize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSLogConfig_sharedStoreServicesConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStoreServicesConfigOversize_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedStoreServicesConfigOversize_ss_once_token___COUNTER__, block);
  return (id)sharedStoreServicesConfigOversize_ss_once_object___COUNTER__;
}

void __48__SSLogConfig_sharedStoreServicesConfigOversize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedStoreServicesConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("StoreServices-Oversize"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedStoreServicesConfigOversize_ss_once_object___COUNTER__;
  sharedStoreServicesConfigOversize_ss_once_object___COUNTER__ = v2;

}

+ (id)sharedWriteToDiskConfig
{
  if (sharedWriteToDiskConfig_onceToken != -1)
    dispatch_once(&sharedWriteToDiskConfig_onceToken, &__block_literal_global_48);
  return (id)sharedWriteToDiskConfig_writeToDiskConfig;
}

void __38__SSLogConfig_sharedWriteToDiskConfig__block_invoke()
{
  uint64_t v0;
  void *v1;
  SSMutableLogConfig *v2;

  v2 = objc_alloc_init(SSMutableLogConfig);
  -[SSLogConfig setEnvironment:](v2, "setEnvironment:", 2);
  -[SSLogConfig setSubsystem:](v2, "setSubsystem:", CFSTR("com.apple.StoreServices"));
  -[SSLogConfig setWriteToDisk:](v2, "setWriteToDisk:", 1);
  v0 = -[SSMutableLogConfig copy](v2, "copy");
  v1 = (void *)sharedWriteToDiskConfig_writeToDiskConfig;
  sharedWriteToDiskConfig_writeToDiskConfig = v0;

}

- (SSLogFileOptions)logFileOptions
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__44;
  v15 = __Block_byref_object_dispose__44;
  v16 = 0;
  -[SSLogConfig propertyAccessQueue](self, "propertyAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SSLogConfig_logFileOptions__block_invoke;
  block[3] = &unk_1E47B8680;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  v5 = (void *)v12[5];
  if (!v5)
  {
    -[SSLogConfig propertyAccessQueue](self, "propertyAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __29__SSLogConfig_logFileOptions__block_invoke_2;
    v9[3] = &unk_1E47B8680;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_barrier_sync(v6, v9);

    v5 = (void *)v12[5];
  }
  v7 = v5;
  _Block_object_dispose(&v11, 8);

  return (SSLogFileOptions *)v7;
}

void __29__SSLogConfig_logFileOptions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backingLogFileOptions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__SSLogConfig_logFileOptions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  SSLogFileOptions *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "backingLogFileOptions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "backingLogFileOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(SSLogFileOptions);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "outputDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLogDirectoryPath:", v10);

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "outputFilename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLogFileBaseName:", v12);

      objc_msgSend(*(id *)(a1 + 32), "setBackingLogFileOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }
}

- (NSString)outputDirectory
{
  NSString *outputDirectory;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;

  outputDirectory = self->_outputDirectory;
  if (outputDirectory)
  {
    v3 = outputDirectory;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    -[SSLogConfig subsystem](self, "subsystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLogConfig category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logFileDirectoryPathForSubsystem:category:", v6, v7);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)outputFilename
{
  NSString *outputFilename;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;

  outputFilename = self->_outputFilename;
  if (outputFilename)
  {
    v3 = outputFilename;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    -[SSLogConfig subsystem](self, "subsystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLogConfig category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logFilenameForSubsystem:category:", v6, v7);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v13.receiver = self;
  v13.super_class = (Class)SSLogConfig;
  -[SSLogConfig description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  category: %@\n"), v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("  environment: %ld\n"), -[SSLogConfig environment](self, "environment"));
  -[SSLogConfig outputDirectory](self, "outputDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  outputDirectory: %@\n"), v7);

  -[SSLogConfig outputFilename](self, "outputFilename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  outputFilename: %@\n"), v8);

  -[SSLogConfig subsystem](self, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  subsystem: %@\n"), v9);

  v10 = -[SSLogConfig writeToDisk](self, "writeToDisk");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("  writeToDisk: %@\n"), v11);
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  NSString *outputDirectory;
  NSString *outputFilename;

  -[SSLogConfig category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SSLogConfig environment](self, "environment") ^ v4;
  -[SSLogConfig subsystem](self, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SSLogConfig writeToDisk](self, "writeToDisk");

  outputDirectory = self->_outputDirectory;
  if (outputDirectory)
    v8 ^= -[NSString hash](outputDirectory, "hash");
  outputFilename = self->_outputFilename;
  if (outputFilename)
    v8 ^= -[NSString hash](outputFilename, "hash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SSLogConfig *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  NSString *outputFilename;
  NSString *outputDirectory;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;

  v5 = (SSLogConfig *)a3;
  if (self == v5)
  {
    LOBYTE(v7) = 1;
    goto LABEL_5;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[SSLogConfig category](self, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (-[SSLogConfig category](v5, "category"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SSLogConfig category](self, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSLogConfig category](v5, "category");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {

        if (!v12)
          goto LABEL_3;
      }
      else
      {

        if ((v12 & 1) == 0)
          goto LABEL_3;
      }
    }
    v13 = -[SSLogConfig environment](self, "environment");
    if (v13 != -[SSLogConfig environment](v5, "environment"))
      goto LABEL_3;
    outputFilename = self->_outputFilename;
    if ((unint64_t)outputFilename | (unint64_t)v5->_outputFilename)
    {
      if (!-[NSString isEqual:](outputFilename, "isEqual:"))
        goto LABEL_3;
    }
    outputDirectory = self->_outputDirectory;
    if ((unint64_t)outputDirectory | (unint64_t)v5->_outputDirectory)
    {
      if (!-[NSString isEqual:](outputDirectory, "isEqual:"))
        goto LABEL_3;
    }
    -[SSLogConfig subsystem](self, "subsystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || (-[SSLogConfig subsystem](v5, "subsystem"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SSLogConfig subsystem](self, "subsystem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSLogConfig subsystem](v5, "subsystem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v16)
      {

        if (!v19)
          goto LABEL_3;
      }
      else
      {

        if ((v19 & 1) == 0)
          goto LABEL_3;
      }
    }
    v20 = -[SSLogConfig writeToDisk](self, "writeToDisk");
    v7 = v20 ^ -[SSLogConfig writeToDisk](v5, "writeToDisk") ^ 1;
    goto LABEL_5;
  }
LABEL_3:
  LOBYTE(v7) = 0;
LABEL_5:

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SSMutableLogConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[SSLogConfig init](+[SSMutableLogConfig allocWithZone:](SSMutableLogConfig, "allocWithZone:"), "init");
  -[SSLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SSLogConfig setCategory:](v5, "setCategory:", v7);

  -[SSLogConfig setEnvironment:](v5, "setEnvironment:", -[SSLogConfig environment](self, "environment"));
  -[SSLogConfig setOutputDirectory:](v5, "setOutputDirectory:", self->_outputDirectory);
  -[SSLogConfig setOutputFilename:](v5, "setOutputFilename:", self->_outputFilename);
  -[SSLogConfig subsystem](self, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[SSLogConfig setSubsystem:](v5, "setSubsystem:", v9);

  -[SSLogConfig setWriteToDisk:](v5, "setWriteToDisk:", -[SSLogConfig writeToDisk](self, "writeToDisk"));
  return v5;
}

+ (BOOL)_deviceIsRunningInternalOrSeedBuild
{
  if ((objc_msgSend(a1, "_deviceIsRunningInternalBuild") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_deviceIsRunningSeedBuild");
}

+ (id)_logFileDirectoryPathForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (_logFileDirectoryPathForSubsystem_category__ss_once_token___COUNTER__ != -1)
    dispatch_once(&_logFileDirectoryPathForSubsystem_category__ss_once_token___COUNTER__, &__block_literal_global_74);
  v7 = (id)_logFileDirectoryPathForSubsystem_category__ss_once_object___COUNTER__;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    else
    {
      v7 = v9;
    }
  }
  else
  {
    v8 = v5;
  }

  return v7;
}

void __58__SSLogConfig__logFileDirectoryPathForSubsystem_category___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = CFSTR("Library");
  v4[2] = CFSTR("Logs");
  v4[3] = CFSTR("com.apple.StoreServices");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathWithComponents:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_logFileDirectoryPathForSubsystem_category__ss_once_object___COUNTER__;
  _logFileDirectoryPathForSubsystem_category__ss_once_object___COUNTER__ = v2;

}

+ (id)_logFilenameForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
    v9 = v7;
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("storeservices");
  }

  return v8;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (void)setOutputDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOutputFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SSLogFileOptions)backingLogFileOptions
{
  return self->_backingLogFileOptions;
}

- (void)setBackingLogFileOptions:(id)a3
{
  objc_storeStrong((id *)&self->_backingLogFileOptions, a3);
}

- (void)setPropertyAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAccessQueue, a3);
}

@end
