@implementation WeatherCloudPersistence

+ (BOOL)processIsWhitelistedForSync
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  char v6;
  char v7;
  void *v8;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("DemoOverrideMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "BOOLValue"))
    {

      v5 = 0;
LABEL_11:

      return v5;
    }
    v7 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "launchedToTest");

    if ((v7 & 1) == 0)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.weather")) & 1) != 0
        || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.nanoweatherprefsd")) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        v5 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.weather.WeatherIntents"));
      }
      goto LABEL_11;
    }
  }
  else
  {
    v6 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "launchedToTest");

    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  return 0;
}

+ (id)cloudPersistenceWithDelegate:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WeatherCloudPersistence_cloudPersistenceWithDelegate___block_invoke;
  block[3] = &unk_24DD9CF20;
  v9 = v3;
  v4 = cloudPersistenceWithDelegate__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&cloudPersistenceWithDelegate__onceToken, block);
  v6 = (id)cloudPersistenceWithDelegate__sharedCloudPersistence;

  return v6;
}

void __56__WeatherCloudPersistence_cloudPersistenceWithDelegate___block_invoke(uint64_t a1)
{
  WeatherCloudPersistence *v1;
  void *v2;

  v1 = -[WeatherCloudPersistence initWithDelegate:]([WeatherCloudPersistence alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)cloudPersistenceWithDelegate__sharedCloudPersistence;
  cloudPersistenceWithDelegate__sharedCloudPersistence = (uint64_t)v1;

}

- (WeatherCloudPersistence)init
{
  return -[WeatherCloudPersistence initWithDelegate:](self, "initWithDelegate:", 0);
}

- (WeatherCloudPersistence)initWithDelegate:(id)a3
{
  WeatherCloudPersistence *v3;
  uint64_t v4;
  NSUbiquitousKeyValueStore *nonEncryptedStore;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSUbiquitousKeyValueStore *encryptedStore;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WeatherCloudMigrator *v17;
  WeatherCloudMigrator *migrator;
  WeatherCloudMigrator *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  WeatherCloudMigrator *v24;
  void *v25;
  void *v26;
  void *v27;
  WeatherCloudMigrator *v28;
  void *v29;
  WeatherCloudPersistence *v30;
  _QWORD v32[4];
  WeatherCloudPersistence *v33;
  uint8_t buf[16];
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)WeatherCloudPersistence;
  v3 = -[WeatherCloudPersistence init](&v35, sel_init, a3);
  if (v3)
  {
    if (objc_msgSend((id)objc_opt_class(), "processIsWhitelistedForSync"))
    {
      objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
      v4 = objc_claimAutoreleasedReturnValue();
      nonEncryptedStore = v3->_nonEncryptedStore;
      v3->_nonEncryptedStore = (NSUbiquitousKeyValueStore *)v4;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x24BDD1378];
      -[WeatherCloudPersistence nonEncryptedStore](v3, "nonEncryptedStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_cloudCitiesChangedExternally_, v7, v8);

      objc_msgSend(MEMORY[0x24BEC2210], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userInfoManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "encryptedStore");
      v11 = objc_claimAutoreleasedReturnValue();
      encryptedStore = v3->_encryptedStore;
      v3->_encryptedStore = (NSUbiquitousKeyValueStore *)v11;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WeatherCloudPersistence encryptedStore](v3, "encryptedStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel_encryptedStoreChanged_, v7, v14);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WeatherCloudPersistence encryptedStore](v3, "encryptedStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel_cloudCitiesChangedExternally_, v7, v16);

      v17 = objc_alloc_init(WeatherCloudMigrator);
      migrator = v3->_migrator;
      v3->_migrator = v17;

      v19 = v3->_migrator;
      -[WeatherCloudPersistence encryptedStore](v3, "encryptedStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = -[WeatherCloudMigrator storeRequiresMigration:](v19, "storeRequiresMigration:", v20);

      WALogForCategory(14);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v15)
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AAEC000, v21, OS_LOG_TYPE_DEFAULT, "Store might require migration, starting migrator", buf, 2u);
        }

        -[WeatherCloudPersistence nonEncryptedStore](v3, "nonEncryptedStore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WeatherCloudPersistence setActiveCloudStore:](v3, "setActiveCloudStore:", v23);

        v24 = v3->_migrator;
        -[WeatherCloudPersistence nonEncryptedStore](v3, "nonEncryptedStore");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WeatherCloudPersistence encryptedStore](v3, "encryptedStore");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __44__WeatherCloudPersistence_initWithDelegate___block_invoke;
        v32[3] = &unk_24DD9D188;
        v33 = v3;
        -[WeatherCloudMigrator migrateStore:toStore:completionBlock:](v24, "migrateStore:toStore:completionBlock:", v25, v26, v32);

      }
      else
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AAEC000, v21, OS_LOG_TYPE_DEFAULT, "Store doesn't require migration", buf, 2u);
        }

        -[WeatherCloudPersistence encryptedStore](v3, "encryptedStore");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[WeatherCloudPersistence setActiveCloudStore:](v3, "setActiveCloudStore:", v27);

        v28 = v3->_migrator;
        -[WeatherCloudPersistence nonEncryptedStore](v3, "nonEncryptedStore");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WeatherCloudMigrator eraseStoreIfNeeded:](v28, "eraseStoreIfNeeded:", v29);

        -[WeatherCloudPersistence synchronize](v3, "synchronize");
      }
    }
    v30 = v3;
  }

  return v3;
}

void __44__WeatherCloudPersistence_initWithDelegate___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryptedStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setActiveCloudStore:", v3);

    WALogForCategory(14);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "Migrator finished processing, notifying clients of store change", v7, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", CFSTR("WeatherCloudStoreChangedExternally"), *(_QWORD *)(a1 + 32), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotification:", v5);

    objc_msgSend(*(id *)(a1 + 32), "synchronize");
  }
  else
  {
    WALogForCategory(14);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__WeatherCloudPersistence_initWithDelegate___block_invoke_cold_1(a1, v5);
  }

}

- (void)cloudCitiesChangedExternally:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__WeatherCloudPersistence_cloudCitiesChangedExternally___block_invoke;
  v7[3] = &unk_24DD9D650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronizeWithCompletionHandler:", v7);

}

void __56__WeatherCloudPersistence_cloudCitiesChangedExternally___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isInitialSyncNotification:", *(_QWORD *)(a1 + 40));
  v7 = CFSTR("WeatherCloudStoreIsInitialSyncKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", CFSTR("WeatherCloudStoreChangedExternally"), *(_QWORD *)(a1 + 32), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotification:", v5);

}

- (BOOL)isInitialSyncNotification:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD1368]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  return (v5 & 0xFFFFFFFD) == 1;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (BOOL)synchronize
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "synchronize");

  -[WeatherCloudPersistence delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudPersistenceDidSynchronize:", self);

  return v5;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizeWithCompletionHandler:", v4);

}

- (void)encryptedStoreChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[WeatherCloudPersistence encryptedStore](self, "encryptedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherCloudPersistence activeCloudStore](self, "activeCloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[WeatherCloudPersistence migrator](self, "migrator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherCloudPersistence encryptedStore](self, "encryptedStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "storeRequiresMigration:", v7);

    if ((v8 & 1) != 0)
    {
      -[WeatherCloudPersistence cloudCitiesChangedExternally:](self, "cloudCitiesChangedExternally:", v12);
    }
    else
    {
      -[WeatherCloudPersistence encryptedStore](self, "encryptedStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WeatherCloudPersistence setActiveCloudStore:](self, "setActiveCloudStore:", v9);

      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", CFSTR("WeatherCloudStoreChangedExternally"), self, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotification:", v10);

    }
  }

}

- (WeatherCloudPersistenceDelegate)delegate
{
  return (WeatherCloudPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WeatherCloudMigrator)migrator
{
  return self->_migrator;
}

- (NSUbiquitousKeyValueStore)activeCloudStore
{
  return self->_activeCloudStore;
}

- (void)setActiveCloudStore:(id)a3
{
  objc_storeStrong((id *)&self->_activeCloudStore, a3);
}

- (NSUbiquitousKeyValueStore)nonEncryptedStore
{
  return self->_nonEncryptedStore;
}

- (void)setNonEncryptedStore:(id)a3
{
  objc_storeStrong((id *)&self->_nonEncryptedStore, a3);
}

- (NSUbiquitousKeyValueStore)encryptedStore
{
  return self->_encryptedStore;
}

- (void)setEncryptedStore:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedStore, 0);
  objc_storeStrong((id *)&self->_nonEncryptedStore, 0);
  objc_storeStrong((id *)&self->_activeCloudStore, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__WeatherCloudPersistence_initWithDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "nonEncryptedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "encryptedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_21AAEC000, a2, OS_LOG_TYPE_ERROR, "Migration failed, fromContents=%@, toContents=%@", (uint8_t *)&v8, 0x16u);

}

@end
