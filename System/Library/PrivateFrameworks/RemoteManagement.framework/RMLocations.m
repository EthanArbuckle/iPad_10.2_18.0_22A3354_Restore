@implementation RMLocations

+ (int64_t)currentDomain
{
  return +[RMBundle managementScope](RMBundle, "managementScope") == 1;
}

+ (id)_rootDirectoryURLInDomain:(int64_t)a3 error:(id *)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_rootDirectoryURLInDomain_error__onceToken != -1)
    dispatch_once(&_rootDirectoryURLInDomain_error__onceToken, block);
  return (id)_rootDirectoryURLInDomain_error__containerURL;
}

void __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(a1 + 32) != 1)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    NSHomeDirectory();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
    goto LABEL_5;
  }
  DMCSystemContainerPathWithBundleIdentifier();
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = (void *)MEMORY[0x24BDBCF48];
LABEL_5:
    objc_msgSend(v3, "fileURLWithPath:", v2);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject URLByAppendingPathComponent:](v5, "URLByAppendingPathComponent:", CFSTR("Library/Application Support"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_rootDirectoryURLInDomain_error__containerURL;
    _rootDirectoryURLInDomain_error__containerURL = v6;

    goto LABEL_6;
  }
  +[RMLog locations](RMLog, "locations");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke_cold_1(v5);
LABEL_6:

}

+ (id)baseDirectoryURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "baseDirectoryURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)baseDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  char DirectoryAtURL;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v4 = a4;
  v21 = 0;
  objc_msgSend(a1, "_rootDirectoryURLInDomain:error:", a3, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (!v6)
  {
    +[RMLog locations](RMLog, "locations");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[RMLocations baseDirectoryURLInDomain:createIfNeeded:].cold.2();

  }
  if (a3)
    v9 = CFSTR("com.apple.remotemanagementd");
  else
    v9 = CFSTR("com.apple.RemoteManagementAgent");
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4)
  {
    v20 = v7;
    DirectoryAtURL = createDirectoryAtURL(v10, a3, (uint64_t)&v20);
    v13 = v20;

    if ((DirectoryAtURL & 1) == 0)
    {
      +[RMLog locations](RMLog, "locations");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[RMLocations baseDirectoryURLInDomain:createIfNeeded:].cold.1();

    }
    objc_msgSend(v11, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DMCSetSkipBackupAttributeToItemAtPath();

  }
  else
  {
    v13 = v7;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__RMLocations_baseDirectoryURLInDomain_createIfNeeded___block_invoke;
  block[3] = &unk_24D967BA8;
  v16 = v11;
  v19 = v16;
  if (baseDirectoryURLInDomain_createIfNeeded__onceToken != -1)
    dispatch_once(&baseDirectoryURLInDomain_createIfNeeded__onceToken, block);

  return v16;
}

void __55__RMLocations_baseDirectoryURLInDomain_createIfNeeded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  +[RMLog locations](RMLog, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21885E000, v2, OS_LOG_TYPE_INFO, "Base directory is %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)oldBaseDirectoryURLInSystemDomain
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Application Support/com.apple.remotemanagementd"));
}

+ (id)dataVaultDirectoryURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "dataVaultDirectoryURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)dataVaultDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char DirectoryAtURL;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v16;

  v4 = a4;
  objc_msgSend(a1, "baseDirectoryURLInDomain:createIfNeeded:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[RMLog locations](RMLog, "locations");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[RMLocations dataVaultDirectoryURLInDomain:createIfNeeded:].cold.2();

    if (v4)
      goto LABEL_3;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  if (!v4)
    goto LABEL_10;
LABEL_3:
  v16 = 0;
  DirectoryAtURL = createDirectoryAtURL(v7, a3, (uint64_t)&v16);
  v9 = v16;
  if ((DirectoryAtURL & 1) == 0)
  {
    +[RMLog locations](RMLog, "locations");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[RMLocations dataVaultDirectoryURLInDomain:createIfNeeded:].cold.1();

  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v13, 0);

  if (v14)
    objc_msgSend(a1, "_oneTimeDataVaultConversionInDomain:dataVaultDirectoryURL:", a3, v7);

  return v7;
}

+ (void)_oneTimeDataVaultConversionInDomain:(int64_t)a3 dataVaultDirectoryURL:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__RMLocations__oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL___block_invoke;
  block[3] = &unk_24D967BA8;
  v8 = v4;
  v5 = _oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&_oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL__onceToken, block);

}

void __73__RMLocations__oneTimeDataVaultConversionInDomain_dataVaultDirectoryURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  +[RMLog locations](RMLog, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21885E000, v2, OS_LOG_TYPE_INFO, "Data Vault directory is %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)identityDirectoryURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "identityDirectoryURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)identityDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:", a3, a4, CFSTR("Identities"), CFSTR("Identity"));
}

+ (id)persistentStoreDirectoryURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "persistentStoreDirectoryURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)persistentStoreDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:", a3, a4, CFSTR("Database"), CFSTR("Persistent Store"));
}

+ (id)persistentStoreURLCreateIfNeeded:(BOOL)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "persistentStoreDirectoryURLCreateIfNeeded:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("RemoteManagement.sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)persistentStoreURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "persistentStoreDirectoryURLInDomain:createIfNeeded:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("RemoteManagement.sqlite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)httpLoggingDirectoryURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "httpLoggingDirectoryURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)httpLoggingDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:", a3, a4, CFSTR("HTTPLogs"), CFSTR("HTTP Logs"));
}

+ (id)statusDirectoryURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "statusDirectoryURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)statusDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:", a3, a4, CFSTR("Status"), CFSTR("Status"));
}

+ (id)defaultsOverrideFileURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "defaultsOverrideFileURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)defaultsOverrideFileURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/db/.RMDefaultsOverride.plist"), 0);
}

+ (id)migrationStatusFileURLCreateIfNeeded:(BOOL)a3
{
  return (id)objc_msgSend(a1, "migrationStatusFileURLInDomain:createIfNeeded:", objc_msgSend(a1, "currentDomain"), a3);
}

+ (id)migrationStatusFileURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "dataVaultDirectoryURLInDomain:createIfNeeded:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("MigrationStatus.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSURL)managedObjectModelURL
{
  void *v2;
  void *v3;

  +[RMBundle remoteManagementBundle](RMBundle, "remoteManagementBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("RemoteManagement"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)xpcServiceDirectoryURL
{
  void *v2;
  void *v3;

  +[RMBundle remoteManagementBundle](RMBundle, "remoteManagementBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("XPCServices"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (id)configurationSchemaDirectoryForXPCServiceResourceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("ConfigurationSchema"), 1);
}

+ (id)statusSchemaDirectoryForXPCServiceResourceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("StatusSchema"), 1);
}

+ (id)homeDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[RMLocations homeDirectoryURL].cold.1();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__RMLocations_homeDirectoryURL__block_invoke;
  block[3] = &unk_24D967BA8;
  v10 = v4;
  v5 = homeDirectoryURL_onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&homeDirectoryURL_onceToken, block);
  +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __31__RMLocations_homeDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138543362;
    v4 = v2;
    _os_log_impl(&dword_21885E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Home directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)darwinUserDirectoryURL
{
  char *v2;
  void *v3;
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  char v22[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  bzero(v22, 0x400uLL);
  if (!confstr(0x10000, v22, 0x400uLL)
    || (v2 = realpath_DARWIN_EXTSN(v22, 0)) == 0
    || (v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v2, strlen(v2), 4, 1), objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3), v4 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    v5 = __error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMLocations darwinUserDirectoryURL].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v4 = 0;
  }
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __37__RMLocations_darwinUserDirectoryURL__block_invoke;
  v20 = &unk_24D967BA8;
  v21 = v4;
  v13 = darwinUserDirectoryURL_onceToken;
  v14 = v4;
  if (v13 != -1)
    dispatch_once(&darwinUserDirectoryURL_onceToken, &v17);
  +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v14, 0, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __37__RMLocations_darwinUserDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138543362;
    v4 = v2;
    _os_log_impl(&dword_21885E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Darwin Cache directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)darwinCacheDirectoryURL
{
  char *v2;
  void *v3;
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  char v22[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  bzero(v22, 0x400uLL);
  if (!confstr(65538, v22, 0x400uLL)
    || (v2 = realpath_DARWIN_EXTSN(v22, 0)) == 0
    || (v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v2, strlen(v2), 4, 1), objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3), v4 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    v5 = __error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMLocations darwinCacheDirectoryURL].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v4 = 0;
  }
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __38__RMLocations_darwinCacheDirectoryURL__block_invoke;
  v20 = &unk_24D967BA8;
  v21 = v4;
  v13 = darwinCacheDirectoryURL_onceToken;
  v14 = v4;
  if (v13 != -1)
    dispatch_once(&darwinCacheDirectoryURL_onceToken, &v17);
  +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v14, 0, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __38__RMLocations_darwinCacheDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138543362;
    v4 = v2;
    _os_log_impl(&dword_21885E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Darwin Cache directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)darwinTemporaryDirectoryURL
{
  char *v2;
  void *v3;
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  char v22[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  bzero(v22, 0x400uLL);
  if (!confstr(65537, v22, 0x400uLL)
    || (v2 = realpath_DARWIN_EXTSN(v22, 0)) == 0
    || (v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v2, strlen(v2), 4, 1), objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3), v4 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    v5 = __error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMLocations darwinTemporaryDirectoryURL].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v4 = 0;
  }
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __42__RMLocations_darwinTemporaryDirectoryURL__block_invoke;
  v20 = &unk_24D967BA8;
  v21 = v4;
  v13 = darwinTemporaryDirectoryURL_onceToken;
  v14 = v4;
  if (v13 != -1)
    dispatch_once(&darwinTemporaryDirectoryURL_onceToken, &v17);
  +[RMLocations URLWithResolvedSymlinksFromURL:error:](RMLocations, "URLWithResolvedSymlinksFromURL:error:", v14, 0, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __42__RMLocations_darwinTemporaryDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138543362;
    v4 = v2;
    _os_log_impl(&dword_21885E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Darwin Temporary directory is %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (BOOL)fixFilePermissionsForURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  char v17;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[RMLog locations](RMLog, "locations");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v3;
    _os_log_impl(&dword_21885E000, v4, OS_LOG_TYPE_INFO, "Trying to fix permissions: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;

  if (v7)
  {
    v9 = *MEMORY[0x24BDD0CC8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CC8]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && -[NSObject intValue](v10, "intValue"))
    {
      +[RMLog locations](RMLog, "locations");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[RMLocations fixFilePermissionsForURL:].cold.3();
      v13 = v8;
    }
    else
    {
      v21 = v9;
      v22 = &unk_24D96E700;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v8;
      v17 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v15, v16, &v19);
      v13 = v19;

      if ((v17 & 1) != 0)
      {
LABEL_13:
        v8 = v13;
        goto LABEL_17;
      }
      +[RMLog locations](RMLog, "locations");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[RMLocations fixFilePermissionsForURL:].cold.2();
    }

    v14 = 0;
    goto LABEL_13;
  }
  +[RMLog locations](RMLog, "locations");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[RMLocations fixFilePermissionsForURL:].cold.1();
  v14 = 0;
LABEL_17:

  return v14;
}

+ (id)_applicationSupportChildDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4 childName:(id)a5 descriptor:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char DirectoryAtURL;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v7 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "baseDirectoryURLInDomain:createIfNeeded:", a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[RMLog locations](RMLog, "locations");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[RMLocations _applicationSupportChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:].cold.1();

  }
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7)
  {
    v28 = 0;
    DirectoryAtURL = createDirectoryAtURL(v14, a3, (uint64_t)&v28);
    v17 = v28;
    if ((DirectoryAtURL & 1) == 0)
    {
      +[RMLog locations](RMLog, "locations");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v30 = v11;
        v31 = 2114;
        v32 = v15;
        v33 = 2114;
        v34 = v17;
        _os_log_error_impl(&dword_21885E000, v18, OS_LOG_TYPE_ERROR, "Unable to create %{public}@ directory at %{public}@: %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v17 = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__RMLocations__applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke;
  block[3] = &unk_24D967D78;
  v26 = v11;
  v19 = v15;
  v27 = v19;
  v20 = _applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken;
  v21 = v11;
  if (v20 != -1)
    dispatch_once(&_applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken, block);
  v22 = v27;
  v23 = v19;

  return v23;
}

void __96__RMLocations__applicationSupportChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[RMLog locations](RMLog, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_21885E000, v2, OS_LOG_TYPE_INFO, "%{public}@ directory is %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

+ (id)_dataVaultChildDirectoryURLInDomain:(int64_t)a3 createIfNeeded:(BOOL)a4 childName:(id)a5 descriptor:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char DirectoryAtURL;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v7 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "dataVaultDirectoryURLInDomain:createIfNeeded:", a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[RMLog locations](RMLog, "locations");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[RMLocations _dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:].cold.1();

  }
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7)
  {
    v28 = 0;
    DirectoryAtURL = createDirectoryAtURL(v14, a3, (uint64_t)&v28);
    v17 = v28;
    if ((DirectoryAtURL & 1) == 0)
    {
      +[RMLog locations](RMLog, "locations");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v30 = v11;
        v31 = 2114;
        v32 = v15;
        v33 = 2114;
        v34 = v17;
        _os_log_error_impl(&dword_21885E000, v18, OS_LOG_TYPE_ERROR, "Unable to create %{public}@ directory at %{public}@: %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v17 = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__RMLocations__dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke;
  block[3] = &unk_24D967D78;
  v26 = v11;
  v19 = v15;
  v27 = v19;
  v20 = _dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken;
  v21 = v11;
  if (v20 != -1)
    dispatch_once(&_dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor__onceToken, block);
  v22 = v27;
  v23 = v19;

  return v23;
}

void __87__RMLocations__dataVaultChildDirectoryURLInDomain_createIfNeeded_childName_descriptor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[RMLog locations](RMLog, "locations");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_21885E000, v2, OS_LOG_TYPE_INFO, "%{public}@ directory is %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

+ (id)URLWithResolvedSymlinksFromURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  _BYTE v24[1024];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0x8000, 0);

  if (v7 < 1)
  {
    v9 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      +[RMLocations URLWithResolvedSymlinksFromURL:error:].cold.1();
      if (!a4)
        goto LABEL_17;
    }
    else if (!a4)
    {
      goto LABEL_17;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD1128];
    v20 = *MEMORY[0x24BDD1328];
    v21 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      *a4 = objc_retainAutorelease(v13);

LABEL_16:
    a4 = 0;
    goto LABEL_17;
  }
  if (fcntl(v7, 50, v24) == -1)
  {
    v14 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      +[RMLocations URLWithResolvedSymlinksFromURL:error:].cold.1();
      if (a4)
        goto LABEL_12;
    }
    else if (a4)
    {
LABEL_12:
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD1128];
      v22 = *MEMORY[0x24BDD1328];
      v23 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        *a4 = objc_retainAutorelease(v18);

    }
    close(v7);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  close(v7);
  if (!v8)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  a4 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return a4;
}

void __47__RMLocations__rootDirectoryURLInDomain_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21885E000, log, OS_LOG_TYPE_ERROR, "Failed to get system container path. Caller must be rmdctl or remotemanagementd.", v1, 2u);
  OUTLINED_FUNCTION_2_1();
}

+ (void)baseDirectoryURLInDomain:createIfNeeded:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Unable to create root directory at %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

+ (void)baseDirectoryURLInDomain:createIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to find root directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)dataVaultDirectoryURLInDomain:createIfNeeded:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Unable to create Data Vault at %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

+ (void)dataVaultDirectoryURLInDomain:createIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to find Data Vault directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)homeDirectoryURL
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21885E000, MEMORY[0x24BDACB70], v0, "Failed to find Home directory: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

+ (void)darwinUserDirectoryURL
{
  OUTLINED_FUNCTION_2_2(&dword_21885E000, MEMORY[0x24BDACB70], a3, "Failed to find Darwin User directory: %{errno}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

+ (void)darwinCacheDirectoryURL
{
  OUTLINED_FUNCTION_2_2(&dword_21885E000, MEMORY[0x24BDACB70], a3, "Failed to find Darwin Cache directory: %{errno}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

+ (void)darwinTemporaryDirectoryURL
{
  OUTLINED_FUNCTION_2_2(&dword_21885E000, MEMORY[0x24BDACB70], a3, "Failed to find Darwin Temporary directory: %{errno}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

+ (void)fixFilePermissionsForURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Could not get file attributes: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fixFilePermissionsForURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Could not set file attributes: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fixFilePermissionsForURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Could not set file attributes for permissions: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_applicationSupportChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to find Application Support directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_dataVaultChildDirectoryURLInDomain:createIfNeeded:childName:descriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to find data vault directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)URLWithResolvedSymlinksFromURL:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_21885E000, MEMORY[0x24BDACB70], v0, "Failed to resolve symlinks for path %@: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
