@implementation STStorageDataInterface

- (STStorageDataInterface)init
{
  STStorageDataInterface *v2;
  uint64_t v3;
  STStorageAppsMonitor *appsMonitor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStorageDataInterface;
  v2 = -[STStorageDataInterface init](&v6, sel_init);
  if (v2)
  {
    +[STStorageAppsMonitor sharedMonitor](STStorageAppsMonitor, "sharedMonitor");
    v3 = objc_claimAutoreleasedReturnValue();
    appsMonitor = v2->_appsMonitor;
    v2->_appsMonitor = (STStorageAppsMonitor *)v3;

    -[STStorageAppsMonitor sync](v2->_appsMonitor, "sync");
  }
  return v2;
}

- (id)apps
{
  return -[STStorageAppsMonitor filteredApps:sortedUsingBlock:](self->_appsMonitor, "filteredApps:sortedUsingBlock:", 0, &__block_literal_global_9);
}

uint64_t __30__STStorageDataInterface_apps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)appsOrderedBySize
{
  return -[STStorageAppsMonitor filteredApps:sortedUsingBlock:](self->_appsMonitor, "filteredApps:sortedUsingBlock:", 0, &__block_literal_global_1);
}

uint64_t __43__STStorageDataInterface_appsOrderedBySize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "appSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userTotal");
  objc_msgSend(v5, "appSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userTotal");

  if (v7 <= v9)
  {
    objc_msgSend(v5, "appSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userTotal");
    objc_msgSend(v4, "appSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userTotal");

    if (v12 <= v14)
    {
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "localizedCaseInsensitiveCompare:", v16);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (id)appsOrderedByName
{
  return -[STStorageAppsMonitor filteredApps:sortedUsingBlock:](self->_appsMonitor, "filteredApps:sortedUsingBlock:", 0, &__block_literal_global_2);
}

uint64_t __43__STStorageDataInterface_appsOrderedByName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)storageInfoDict
{
  return -[STStorageAppsMonitor storageInfoDict](self->_appsMonitor, "storageInfoDict");
}

+ (id)storageInfoDict_Remote
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint8_t buf[16];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  STStorageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6A4000, v2, OS_LOG_TYPE_INFO, "Connecting to StorageDataService", buf, 2u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.storagedatad"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C8AC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "resume");
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_10;
  v8[3] = &unk_24C75FEA8;
  v8[4] = &v10;
  objc_msgSend(v5, "storageInfoDict:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  STStorageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_cold_1((uint64_t)v2, v3);

}

void __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_10(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)appSizesDict
{
  return -[STStorageAppsMonitor appSizesDict](self->_appsMonitor, "appSizesDict");
}

- (id)categorySizesDict
{
  return -[STStorageAppsMonitor categorySizesDict](self->_appsMonitor, "categorySizesDict");
}

- (STStorageAppsMonitor)appsMonitor
{
  return (STStorageAppsMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppsMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsMonitor, 0);
}

void __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D6A4000, a2, OS_LOG_TYPE_ERROR, "Error connecting to StorageDataService: %@", (uint8_t *)&v2, 0xCu);
}

@end
