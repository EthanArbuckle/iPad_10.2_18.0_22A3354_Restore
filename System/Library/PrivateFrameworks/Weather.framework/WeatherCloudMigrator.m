@implementation WeatherCloudMigrator

- (WeatherCloudMigrator)init
{
  WeatherCloudMigrator *v2;
  WeatherDeviceLookup *v3;
  WeatherDeviceLookup *deviceLookup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WeatherCloudMigrator;
  v2 = -[WeatherCloudMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WeatherDeviceLookup);
    deviceLookup = v2->_deviceLookup;
    v2->_deviceLookup = v3;

  }
  return v2;
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
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke;
  v14[3] = &unk_24DD9D0B0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v12, "synchronizeWithCompletionHandler:", v14);

}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke(id *a1, void *a2)
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
    WALogForCategory(14);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = (void (*)(void))*((_QWORD *)a1[7] + 2);
LABEL_10:
    v11();
    goto LABEL_11;
  }
  if ((objc_msgSend(a1[4], "storeRequiresMigration:", a1[5]) & 1) == 0)
  {
    WALogForCategory(14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v15, OS_LOG_TYPE_DEFAULT, "Syncronized store, already migrated", buf, 2u);
    }

    v11 = (void (*)(void))*((_QWORD *)a1[7] + 2);
    goto LABEL_10;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1;
  v16[3] = &unk_24DD9D0B0;
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

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1(uint64_t a1, void *a2)
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

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogForCategory(14);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

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
      _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Migrating key-value store to encrypted store, contents=%@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2;
    v14[3] = &unk_24DD9D088;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &unk_24DDB1638, CFSTR("version"));
    objc_msgSend(*(id *)(a1 + 40), "synchronize");
    objc_msgSend(*(id *)(a1 + 48), "eraseStoreIfNeeded:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unint64_t v9;
  double v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deviceInactivityThreshold");

    v10 = 0.0;
    if (v9 <= 5)
      v10 = dbl_21AB38EF0[v9];
    -[WeatherCloudMigrator deviceLookup](self, "deviceLookup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke;
    v13[3] = &unk_24DD9D100;
    v14 = v4;
    objc_msgSend(v11, "checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:completionHandler:", 14, 0, 10, 16, v13, v10);

    v12 = v14;
  }
  else
  {
    WALogForCategory(14);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v12, OS_LOG_TYPE_DEFAULT, "Store empty, no erase required", buf, 2u);
    }
  }

}

void __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  WALogForCategory(14);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "Erasing store", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke_7;
    v8[3] = &unk_24DD9D0D8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

    objc_msgSend(*(id *)(a1 + 32), "synchronize");
    v4 = v9;
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "Non-encrypted store still in use, no erase needed", buf, 2u);
  }

}

uint64_t __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

- (WeatherDeviceLookup)deviceLookup
{
  return self->_deviceLookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLookup, 0);
}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21AAEC000, a2, a3, "Failed to migrate the store. Could not synchronize the toStore, error=%@", a5, a6, a7, a8, 2u);
}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21AAEC000, a2, a3, "Failed to migrate the store. Could not synchronize the fromStore, error=%@", a5, a6, a7, a8, 2u);
}

@end
