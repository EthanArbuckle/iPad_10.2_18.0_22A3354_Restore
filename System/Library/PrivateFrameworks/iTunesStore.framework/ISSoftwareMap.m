@implementation ISSoftwareMap

- (ISSoftwareMap)init
{
  ISSoftwareMap *v3;
  objc_super v5;

  __ISRecordSPIClassUsage(self);
  objc_msgSend((id)objc_opt_class(), "startObservingNotifications");
  v5.receiver = self;
  v5.super_class = (Class)ISSoftwareMap;
  v3 = -[ISSoftwareMap init](&v5, sel_init);
  if (v3)
  {
    v3->_applications = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    -[ISSoftwareMap _loadFromMobileInstallation](v3, "_loadFromMobileInstallation");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_applications = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareMap;
  -[ISSoftwareMap dealloc](&v3, sel_dealloc);
}

+ (BOOL)haveApplicationsOfType:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (SSIsDaemon())
  {
    if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDC1508]) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDC14E8]))
    {
      v4 = 2;
    }
    else
    {
      v4 = 0;
    }
    v14 = (void *)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __40__ISSoftwareMap_haveApplicationsOfType___block_invoke;
    v19[3] = &unk_24C43CBA8;
    v19[4] = &v20;
    objc_msgSend(v14, "enumerateApplicationsOfType:block:", v4, v19);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
      if (!v5)
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = objc_msgSend(v5, "shouldLog");
      v7 = objc_msgSend(v5, "shouldLogToDisk");
      v8 = objc_msgSend(v5, "OSLogObject");
      if (v7)
        v6 |= 2u;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        v9 = v6;
      else
        v9 = v6 & 2;
      if (v9)
      {
        v24 = 136446210;
        v25 = "+[ISSoftwareMap haveApplicationsOfType:]";
        LODWORD(v17) = 12;
        v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v24, v17);
          free(v11);
          SSFileLog();
        }
      }
    }
    v12 = (void *)SSXPCCreateMessageDictionary();
    SSXPCDictionarySetCFObject();
    v13 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __40__ISSoftwareMap_haveApplicationsOfType___block_invoke_18;
    v18[3] = &unk_24C43CBD0;
    v18[4] = v13;
    v18[5] = &v20;
    __ISSoftwareMapXPC((uint64_t)v12, (uint64_t)v18);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v13);
    xpc_release(v12);
  }
  v15 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v15;
}

uint64_t __40__ISSoftwareMap_haveApplicationsOfType___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

intptr_t __40__ISSoftwareMap_haveApplicationsOfType___block_invoke_18(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x20BD37E20](a2) == MEMORY[0x24BDACFA0])
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)currentMap
{
  id v2;

  pthread_mutex_lock(&__CurrentMapLock);
  v2 = (id)__CurrentMap;
  pthread_mutex_unlock(&__CurrentMapLock);
  return v2;
}

+ (BOOL)currentMapIsValid
{
  char v2;

  pthread_mutex_lock(&__CurrentMapLock);
  v2 = __CurrentMapIsValid;
  pthread_mutex_unlock(&__CurrentMapLock);
  return v2;
}

+ (void)invalidateCurrentMap
{
  pthread_mutex_lock(&__CurrentMapLock);
  __CurrentMapIsValid = 0;
  pthread_mutex_unlock(&__CurrentMapLock);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ISSoftwareMapInvalidatedNotification"), 0);
}

+ (id)loadedMap
{
  ISSoftwareMap *v2;
  BOOL v3;
  ISSoftwareMap *v4;

  pthread_mutex_lock(&__CurrentMapLock);
  v2 = (ISSoftwareMap *)__CurrentMap;
  if (__CurrentMap)
    v3 = __CurrentMapIsValid == 0;
  else
    v3 = 1;
  if (v3)
  {

    v2 = objc_alloc_init(ISSoftwareMap);
    __CurrentMap = (uint64_t)v2;
    __CurrentMapIsValid = 1;
  }
  v4 = v2;
  pthread_mutex_unlock(&__CurrentMapLock);
  return v4;
}

+ (void)setCurrentMap:(id)a3
{
  pthread_mutex_lock(&__CurrentMapLock);
  if ((id)__CurrentMap != a3)
  {

    a3 = a3;
    __CurrentMap = (uint64_t)a3;
  }
  __CurrentMapIsValid = a3 != 0;
  pthread_mutex_unlock(&__CurrentMapLock);
}

+ (id)applicationForBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "applicationForBundleIdentifier:applicationType:", a3, *MEMORY[0x24BDC1518]);
}

+ (id)applicationForBundleIdentifier:(id)a3 applicationType:(id)a4
{
  void *v7;
  ISSoftwareApplication *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  objc_msgSend((id)objc_opt_class(), "startObservingNotifications");
  v7 = (void *)objc_msgSend(a1, "currentMap");
  if (v7
    && objc_msgSend(a1, "currentMapIsValid")
    && objc_msgSend(a4, "isEqualToString:", *MEMORY[0x24BDC1518]))
  {
    v8 = (ISSoftwareApplication *)(id)objc_msgSend(v7, "applicationForBundleIdentifier:", a3);
LABEL_8:
    v24[5] = (uint64_t)v8;
    goto LABEL_22;
  }
  if (SSIsDaemon())
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
    if (objc_msgSend((id)objc_msgSend(v9, "bundleType"), "isEqualToString:", a4))
    {
      v8 = -[ISSoftwareApplication initWithLaunchServicesApplication:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:", v9);
      goto LABEL_8;
    }
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
      if (!v10)
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      v12 = objc_msgSend(v10, "shouldLogToDisk");
      v13 = objc_msgSend(v10, "OSLogObject");
      if (v12)
        v11 |= 2u;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        v14 = v11;
      else
        v14 = v11 & 2;
      if (v14)
      {
        v29 = 136446210;
        v30 = "+[ISSoftwareMap applicationForBundleIdentifier:applicationType:]";
        LODWORD(v21) = 12;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v29, v21);
          free(v16);
          SSFileLog();
        }
      }
    }
    v17 = (void *)SSXPCCreateMessageDictionary();
    SSXPCDictionarySetCFObject();
    SSXPCDictionarySetCFObject();
    v18 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __64__ISSoftwareMap_applicationForBundleIdentifier_applicationType___block_invoke;
    v22[3] = &unk_24C43CBD0;
    v22[4] = v18;
    v22[5] = &v23;
    __ISSoftwareMapXPC((uint64_t)v17, (uint64_t)v22);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v18);
    xpc_release(v17);
  }
LABEL_22:
  v19 = (id)v24[5];
  _Block_object_dispose(&v23, 8);
  return v19;
}

intptr_t __64__ISSoftwareMap_applicationForBundleIdentifier_applicationType___block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x20BD37E20](a2) == MEMORY[0x24BDACFA0])
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[ISSoftwareApplication initWithXPCEncoding:]([ISSoftwareApplication alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "0"));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)applicationForPluginBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "applicationForPluginBundleIdentifier:extensionType:", a3, 0);
}

+ (id)applicationForPluginBundleIdentifier:(id)a3 extensionType:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  ISSoftwareApplication *v9;

  if (SSIsDaemon()
    && ((v6 = (void *)objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", a3), v7 = v6, !a4)
     || objc_msgSend((id)objc_msgSend(v6, "protocol"), "isEqualToString:", a4))
    && (objc_msgSend(v7, "containingBundle"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "containingBundle"), "bundleType"),
        objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC1518])))
  {
    v9 = -[ISSoftwareApplication initWithLaunchServicesApplication:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:", objc_msgSend(v7, "containingBundle"));
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)applicationForBundleIdentifier:(id)a3
{
  NSArray *applications;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  applications = self->_applications;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](applications, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(applications);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "bundleIdentifier"), "isEqualToString:", a3))
          return v9;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](applications, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)applicationForItemIdentifier:(id)a3
{
  NSArray *applications;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  applications = self->_applications;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](applications, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(applications);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "itemIdentifier"), "isEqual:", a3))
          return v9;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](applications, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (NSArray)applications
{
  return self->_applications;
}

- (id)copySoftwareUpdatesPropertyList
{
  return -[ISSoftwareMap copySoftwareUpdatesPropertyListWithUpdatesContext:](self, "copySoftwareUpdatesPropertyListWithUpdatesContext:", 0);
}

- (id)copySoftwareUpdatesPropertyListWithUpdatesContext:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "copySoftwareUpdatesPropertyListWithApplications:updatesContext:", self->_applications, a3);
}

+ (id)containerPathForApp:(id)a3 homeDirectory:(id)a4 systemMetadataDirectory:(id)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(a3, "bundleContainerURL");
  if (v8 && (v9 = v8, !objc_msgSend(v8, "isEqual:", a4)))
    return (id)objc_msgSend(v9, "path");
  else
    return (id)objc_msgSend(a5, "stringByAppendingPathComponent:", objc_msgSend(a3, "bundleIdentifier"));
}

+ (id)copySoftwareUpdatesPropertyListWithApplications:(id)a3 updatesContext:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "count"))
    return 0;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v8 = (void *)objc_msgSend(a4, "softwareTypes");
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB2A90]) ^ 1;
    v11 = objc_msgSend(v9, "containsObject:", *MEMORY[0x24BEB2A98]) ^ 1;
    if ((v10 & 1) != 0)
    {
LABEL_8:
      v13 = objc_msgSend(v7, "count");
      if (v13 - 1 >= 0)
      {
        v14 = v13;
        v15 = *MEMORY[0x24BEB2478];
        while (1)
        {
          v16 = (void *)objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", --v14), "softwareType");
          if (!objc_msgSend(v16, "isEqualToString:", v15))
            break;
          if ((v10 & 1) != 0)
            goto LABEL_12;
LABEL_13:
          if (v14 <= 0)
            goto LABEL_20;
        }
        if (v16)
        {
          if ((objc_msgSend(v9, "containsObject:", v16) & 1) != 0)
            goto LABEL_13;
        }
        else if ((v11 & 1) == 0)
        {
          goto LABEL_13;
        }
LABEL_12:
        objc_msgSend(v7, "removeObjectAtIndex:", v14);
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (v11)
    goto LABEL_8;
LABEL_20:
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v7);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v22, "isPlaceholder") & 1) == 0)
        {
          v23 = (void *)objc_msgSend(a1, "_newSoftwareUpdateDictionaryForApplication:", v22);
          if (objc_msgSend(v23, "count"))
            objc_msgSend(v17, "addObject:", v23);

        }
      }
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }
  if (objc_msgSend(v17, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("local-software"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)enumerateApplicationsForProxies:(id)a3 usingBlock:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  ISSoftwareApplication *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[6];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = CPSharedResourcesDirectory();
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v22[0] = v6;
    v22[1] = CFSTR("Library");
    v22[2] = CFSTR("com.apple.itunesstored");
    v22[3] = CFSTR("iTunesMetadata");
    v8 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v8);
  }
  else
  {
    v7 = 0;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(a3);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x20BD37A0C]();
        v15 = -[ISSoftwareApplication initWithLaunchServicesApplication:containerPath:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:containerPath:", v13, objc_msgSend(a1, "containerPathForApp:homeDirectory:systemMetadataDirectory:", v13, v7, v6));
        if (-[ISSoftwareApplication bundleIdentifier](v15, "bundleIdentifier"))
          (*((void (**)(id, ISSoftwareApplication *))a4 + 2))(a4, v15);

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
}

+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[8];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v7 = CPSharedResourcesDirectory();
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
    v12[0] = v7;
    v12[1] = CFSTR("Library");
    v12[2] = CFSTR("com.apple.itunesstored");
    v12[3] = CFSTR("iTunesMetadata");
    v9 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v9);
  }
  else
  {
    v8 = 0;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__ISSoftwareMap_enumerateApplicationsOfType_usingBlock___block_invoke;
  v11[3] = &unk_24C43CBF8;
  v11[4] = a1;
  v11[5] = v8;
  v11[6] = v7;
  v11[7] = a4;
  objc_msgSend(v10, "enumerateApplicationsOfType:block:", a3, v11);
}

void __56__ISSoftwareMap_enumerateApplicationsOfType_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  ISSoftwareApplication *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x20BD37A0C]();
    v5 = -[ISSoftwareApplication initWithLaunchServicesApplication:containerPath:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:containerPath:", a2, objc_msgSend(*(id *)(a1 + 32), "containerPathForApp:homeDirectory:systemMetadataDirectory:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
    if (-[ISSoftwareApplication bundleIdentifier](v5, "bundleIdentifier"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    objc_autoreleasePoolPop(v4);
  }
}

+ (void)removableSystemApplicationsWithCompletionBlock:(id)a3
{
  void *v4;
  RemovableSoftwareLookupTable *v5;
  void *v6;
  _QWORD v7[6];

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = objc_alloc_init(RemovableSoftwareLookupTable);
  if (SSIsDaemon())
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__ISSoftwareMap_removableSystemApplicationsWithCompletionBlock___block_invoke;
    v7[3] = &unk_24C43CC20;
    v7[4] = v5;
    v7[5] = v4;
    objc_msgSend(v6, "enumerateApplicationsOfType:block:", 1, v7);
  }

  if (a3)
    (*((void (**)(id, id))a3 + 2))(a3, (id)objc_msgSend(v4, "copy"));
}

void __64__ISSoftwareMap_removableSystemApplicationsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  ISSoftwareApplication *v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x20BD37A0C]();
    if (objc_msgSend((id)objc_msgSend(a2, "applicationType"), "isEqualToString:", CFSTR("System"))
      && objc_msgSend(a2, "isDeletable"))
    {
      v5 = -[ISSoftwareApplication initWithLaunchServicesApplication:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:", a2);
      if (!-[ISSoftwareApplication itemIdentifier](v5, "itemIdentifier"))
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForBundleIdentifer:", -[ISSoftwareApplication bundleIdentifier](v5, "bundleIdentifier"));
        if (v6)
          -[ISSoftwareApplication setItemIdentifier:](v5, "setItemIdentifier:", v6);
      }
      if (-[ISSoftwareApplication bundleIdentifier](v5, "bundleIdentifier"))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

    }
    objc_autoreleasePoolPop(v4);
  }
}

+ (void)startObservingNotifications
{
  pthread_once(&startObservingNotifications_sNotificationGuard, (void (*)(void))__StartWatchingInstallationNotifications);
}

+ (id)_newSoftwareUpdateDictionaryForApplication:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_msgSend(a3, "itemIdentifier");
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("adam-id"));
  v6 = objc_msgSend(a3, "versionIdentifier");
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("installed-version-identifier"));
  return v4;
}

+ (void)_startWatchingInstallationNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *DistributedCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)__SoftwareMappingChangedNotification, CFSTR("com.apple.itunesstored.invalidatedSoftwareMap"), 0, CFNotificationSuspensionBehaviorCoalesce);
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)__SoftwareMappingChangedNotification, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)__SoftwareMappingChangedNotification, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_loadFromMobileInstallation
{
  RemovableSoftwareLookupTable *v3;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[5];
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (SSIsDaemon())
  {
    v3 = objc_alloc_init(RemovableSoftwareLookupTable);
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = (void *)objc_opt_class();
    v6 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke;
    v18[3] = &unk_24C43CC48;
    v18[4] = v4;
    objc_msgSend(v5, "enumerateApplicationsOfType:usingBlock:", 0, v18);
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_2;
    v17[3] = &unk_24C43CC70;
    v17[4] = v3;
    v17[5] = v4;
    objc_msgSend((id)objc_opt_class(), "enumerateApplicationsOfType:usingBlock:", 1, v17);

    self->_applications = v4;
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
      if (!v7)
        v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = objc_msgSend(v7, "shouldLog");
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v9 = v8 | 2;
      else
        v9 = v8;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_FAULT))
        v10 = v9;
      else
        v10 = v9 & 2;
      if (v10)
      {
        v19 = 136446210;
        v20 = "-[ISSoftwareMap _loadFromMobileInstallation]";
        LODWORD(v15) = 12;
        v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v19, v15);
          free(v12);
          SSFileLog();
        }
      }
    }
    v13 = (void *)SSXPCCreateMessageDictionary();
    v14 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_49;
    v16[3] = &unk_24C43CC98;
    v16[4] = self;
    v16[5] = v14;
    __ISSoftwareMapXPC((uint64_t)v13, (uint64_t)v16);
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v14);
    xpc_release(v13);
  }
}

uint64_t __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  char v5;
  uint64_t result;

  if (!objc_msgSend(a2, "itemIdentifier"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForBundleIdentifer:", objc_msgSend(a2, "bundleIdentifier"));
    if (v4)
      objc_msgSend(a2, "setItemIdentifier:", v4);
  }
  v5 = objc_msgSend(a2, "removableStatus");
  result = objc_msgSend(a2, "itemIdentifier");
  if (result)
  {
    if ((v5 & 4) == 0)
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
  return result;
}

intptr_t __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_49(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x20BD37E20](a2) == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(a2, "0");
    objc_opt_class();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = SSXPCCreateNSArrayFromXPCEncodedArray();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
