@implementation WCCloudMigrator

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    WCLogForCategory(2uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = (void (*)(void))*((_QWORD *)a1[7] + 2);
LABEL_10:
    v11();
    goto LABEL_11;
  }
  if ((objc_msgSend(a1[4], "storeRequiresMigration:", a1[5]) & 1) == 0)
  {
    WCLogForCategory(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B00C3000, v15, OS_LOG_TYPE_DEFAULT, "Syncronized store, already migrated", buf, 2u);
    }

    v11 = (void (*)(void))*((_QWORD *)a1[7] + 2);
    goto LABEL_10;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2;
  v16[3] = &unk_1E60A6F38;
  v12 = a1[6];
  v20 = a1[7];
  v17 = a1[6];
  v13 = a1[5];
  v14 = a1[4];
  v18 = v13;
  v19 = v14;
  objc_msgSend(v12, "synchronizeWithCompletionHandler:", v16);

LABEL_11:
}

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B00C3000, a2, a3, "Failed to migrate the store. Could not synchronize the toStore, error=%@", a5, a6, a7, a8, 2u);
}

- (BOOL)storeRequiresMigration:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4 < 1;
}

- (void)migrateStore:(id)a3 toStore:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke;
  v14[3] = &unk_1E60A6F38;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v12, "synchronizeWithCompletionHandler:", v14);

}

- (WCCloudMigrator)init
{
  WCCloudMigrator *v2;
  WCDeviceLookup *v3;
  NSObject *p_super;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCCloudMigrator;
  v2 = -[WCCloudMigrator init](&v7, sel_init);
  if (v2)
  {
    if (+[WCCloudMigrator isRunningInTheWeatherAppProcess](WCCloudMigrator, "isRunningInTheWeatherAppProcess"))
    {
      v3 = objc_alloc_init(WCDeviceLookup);
      p_super = &v2->_deviceLookup->super;
      v2->_deviceLookup = v3;
    }
    else
    {
      WCLogForCategory(2uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B00C3000, p_super, OS_LOG_TYPE_DEFAULT, "Not running in the Weather app, skipping device lookup", v6, 2u);
      }
    }

  }
  return v2;
}

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WCLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1B00C3000, v5, OS_LOG_TYPE_DEFAULT, "Migrating key-value store to encrypted store, contents=%@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_3;
    v14[3] = &unk_1E60A6F10;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &unk_1E60C9BB0, CFSTR("version"));
    objc_msgSend(*(id *)(a1 + 40), "synchronize");
    objc_msgSend(*(id *)(a1 + 48), "eraseStoreIfNeeded:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (void)eraseStoreIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[16];

  v4 = a3;
  if (!+[WCCloudMigrator isRunningInTheWeatherAppProcess](WCCloudMigrator, "isRunningInTheWeatherAppProcess"))
  {
    WCLogForCategory(2uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v10 = "Not running in the Weather app, not erasing";
LABEL_8:
    _os_log_impl(&dword_1B00C3000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_9;
  }
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    WCLogForCategory(2uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v10 = "Store empty, no erase required";
    goto LABEL_8;
  }
  -[WCCloudMigrator deviceLookup](self, "deviceLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke;
  v11[3] = &unk_1E60A6F88;
  v12 = v4;
  objc_msgSend(v8, "checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:completionHandler:", 14, 0, 10, 16, v11, 15552000.0);

  v9 = v12;
LABEL_9:

}

void __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  WCLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B00C3000, v4, OS_LOG_TYPE_DEFAULT, "Erasing store", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke_7;
    v8[3] = &unk_1E60A6F60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

    objc_msgSend(*(id *)(a1 + 32), "synchronize");
    v4 = v9;
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B00C3000, v4, OS_LOG_TYPE_DEFAULT, "Non-encrypted store still in use, no erase needed", buf, 2u);
  }

}

uint64_t __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

+ (BOOL)isRunningInTheWeatherAppProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.weather"));

  return v4;
}

- (WCDeviceLookup)deviceLookup
{
  return self->_deviceLookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLookup, 0);
}

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B00C3000, a2, a3, "Failed to migrate the store. Could not synchronize the fromStore, error=%@", a5, a6, a7, a8, 2u);
}

@end
