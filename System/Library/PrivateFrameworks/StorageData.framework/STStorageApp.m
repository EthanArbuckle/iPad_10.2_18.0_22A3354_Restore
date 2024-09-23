@implementation STStorageApp

- (STStorageApp)initWithAppRecord:(id)a3 usageBundle:(id)a4
{
  id v6;
  id v7;
  STStorageApp *v8;
  uint64_t v9;
  STSizeVector *extSizesVar;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStorageApp;
  v8 = -[STStorageApp init](&v12, sel_init);
  if (v8)
  {
    +[STSizeVector zero](STSizeVector, "zero");
    v9 = objc_claimAutoreleasedReturnValue();
    extSizesVar = v8->_extSizesVar;
    v8->_extSizesVar = (STSizeVector *)v9;

    -[STStorageApp setAppRecord:](v8, "setAppRecord:", v6);
    objc_storeStrong((id *)&v8->_usageBundle, a4);
  }

  return v8;
}

- (STStorageApp)initWithAppRecord:(id)a3
{
  return -[STStorageApp initWithAppRecord:usageBundle:](self, "initWithAppRecord:usageBundle:", a3, 0);
}

- (STStorageApp)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  STStorageApp *v24;
  id v26;
  id v27;

  v4 = a3;
  v27 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v27);
  v6 = v27;
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "code");
    STLog(2, CFSTR("%li loading application record for %@"), v9, v10, v11, v12, v13, v14, v8);

    v26 = 0;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v4, &v26);
    v16 = v26;

    if (v16)
    {
      v17 = objc_msgSend(v16, "code");
      STLog(2, CFSTR("%li loading placeholder application record for %@"), v18, v19, v20, v21, v22, v23, v17);

      v24 = 0;
    }
    else
    {
      self = -[STStorageApp initWithAppRecord:](self, "initWithAppRecord:", v15);
      v24 = self;
    }
  }
  else
  {
    self = -[STStorageApp initWithAppRecord:](self, "initWithAppRecord:", v5);
    v24 = self;
    v15 = v5;
  }

  return v24;
}

- (STStorageApp)initWithBundleIdentifier:(id)a3 name:(id)a4 vendorName:(id)a5
{
  id v9;
  id v10;
  id v11;
  STStorageApp *v12;
  uint64_t v13;
  STSizeVector *extSizesVar;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)STStorageApp;
  v12 = -[STStorageApp init](&v16, sel_init);
  if (v12)
  {
    +[STSizeVector zero](STSizeVector, "zero");
    v13 = objc_claimAutoreleasedReturnValue();
    extSizesVar = v12->_extSizesVar;
    v12->_extSizesVar = (STSizeVector *)v13;

    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v12->_appIdentifier, a3);
    v12->_appKind = 2;
    objc_storeStrong((id *)&v12->_name, a4);
    objc_storeStrong((id *)&v12->_vendorName, a5);
  }

  return v12;
}

- (LSApplicationRecord)appRecord
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSString *bundleIdentifier;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  if (self->_lsid
    && (v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithPersistentIdentifier:", self->_lsid)) != 0)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDC1540]);
    bundleIdentifier = self->_bundleIdentifier;
    v18 = 0;
    v5 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:allowPlaceholder:error:", bundleIdentifier, 1, &v18);
    v8 = v18;
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "code");
      STLog(2, CFSTR("%li loading application record for %@"), v11, v12, v13, v14, v15, v16, v10);
      v4 = 0;
    }
    else
    {
      v4 = v5;
    }

  }
  return (LSApplicationRecord *)v4;
}

- (int)state
{
  int v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!-[STStorageApp isPseudoApp](self, "isPseudoApp"))
  {
    -[STStorageApp appRecord](self, "appRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isValid"))
    {
      if ((objc_msgSend(v5, "isInstalled") & 1) != 0)
      {
        v3 = 0;
LABEL_11:

        return v3;
      }
      if ((objc_msgSend(v5, "isDowngraded") & 1) != 0)
      {
        v3 = 3;
        goto LABEL_11;
      }
      v6 = objc_msgSend(v4, "installType");
      if (v6 <= 0xA)
      {
        v3 = dword_20D6BF948[v6];
        goto LABEL_11;
      }
    }
    v3 = 5;
    goto LABEL_11;
  }
  return 0;
}

- (id)appProxy
{
  void *v2;
  void *v3;

  -[STStorageApp appRecord](self, "appRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compatibilityObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAppRecord:(id)a3
{
  NSData *v4;
  NSData *lsid;
  NSString *v6;
  NSString *bundleIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *name;
  NSString *v14;
  NSString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  NSString *versionString;
  id v22;
  int v23;
  void *v24;
  int v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *parentAppIdentifier;
  STContainer *v32;
  STContainer *appContainer;
  NSArray *v34;
  NSArray *dataContainers;
  id v36;

  v36 = a3;
  objc_msgSend(v36, "persistentIdentifier");
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  lsid = self->_lsid;
  self->_lsid = v4;

  objc_msgSend(v36, "bundleIdentifier");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v6;

  objc_storeStrong((id *)&self->_appIdentifier, self->_bundleIdentifier);
  objc_msgSend(v36, "applicationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "iTunesMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInstalled") & 1) != 0 || (objc_msgSend(v8, "isPlaceholder") & 1) != 0)
  {
    objc_msgSend(v36, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "itemName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (objc_msgSend(v10, "length"))
  {
    v12 = v11;
    name = self->_name;
    self->_name = v12;
  }
  else
  {
    objc_msgSend(v36, "compatibilityObject");
    name = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(name, "localizedName");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_name;
    self->_name = v14;

  }
  objc_msgSend(v9, "artistName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STStorageApp isApple](self, "isApple")
    && (!objc_msgSend(v16, "length") || objc_msgSend(v16, "isEqualToString:", CFSTR("Apple"))))
  {
    v17 = CFSTR("Apple Inc.");

    v16 = v17;
  }
  objc_storeStrong((id *)&self->_vendorName, v16);
  -[STStorageApp appRecord](self, "appRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shortVersionString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "stringValue");
      v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = &stru_24C7607E8;
    }

    v19 = (void *)v20;
  }
  versionString = self->_versionString;
  self->_versionString = (NSString *)v19;
  v22 = v19;

  if (objc_msgSend(v36, "isDeletable"))
    v23 = objc_msgSend(v36, "isDeletableSystemApplication");
  else
    v23 = 1;
  self->_appKind = v23;
  self->_isPseudoApp = 0;
  objc_msgSend(v36, "appClipMetadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isAppClip = v24 != 0;

  v25 = objc_msgSend(v36, "supportsOpenInPlace");
  v26 = 0;
  if (v25)
    v26 = objc_msgSend(v36, "isFileSharingEnabled");
  self->_isDocumentApp = v26;
  STPersonaCopyPersonaUniqueStrings();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "linkedParentApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bundleIdentifier");
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  parentAppIdentifier = self->_parentAppIdentifier;
  self->_parentAppIdentifier = v30;

  +[STContainer containerWithIdentifier:containerClass:personaUniqueString:](STContainer, "containerWithIdentifier:containerClass:personaUniqueString:", v28, 1, 0);
  v32 = (STContainer *)objc_claimAutoreleasedReturnValue();
  appContainer = self->_appContainer;
  self->_appContainer = v32;

  DataContainersFromAppRecordWithPersonas(v36, v27);
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dataContainers = self->_dataContainers;
  self->_dataContainers = v34;

}

- (BOOL)isApple
{
  void *v3;
  void *v4;
  BOOL v5;

  -[STStorageApp appRecord](self, "appRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "developerType") == 1;
  else
    v5 = -[NSString hasPrefix:](self->_bundleIdentifier, "hasPrefix:", CFSTR("com.apple."));

  return v5;
}

- (BOOL)isSystemApp
{
  return self->_appKind == 1;
}

- (BOOL)isUserApp
{
  return self->_appKind == 0;
}

- (BOOL)userVisible
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;

  if (!-[STStorageApp forceVisible](self, "forceVisible"))
  {
    if (-[STStorageApp forceHidden](self, "forceHidden"))
      return 0;
    -[STStorageApp name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      return 0;
    -[STStorageApp appRecord](self, "appRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      goto LABEL_21;
    objc_msgSend(v6, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRestricted");

    if ((v9 & 1) != 0)
    {
      v3 = 0;
LABEL_17:

      return v3;
    }
    if (objc_msgSend(v7, "developerType") == 1
      && (objc_msgSend(v7, "isDeletable") & 1) == 0
      && (objc_msgSend(v7, "isSystemPlaceholder") & 1) == 0)
    {
LABEL_21:
      if (!self->_usageBundle)
      {
        -[STStorageApp mediaTypes](self, "mediaTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (!v11)
        {
          -[STStorageApp externalSizes](self, "externalSizes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isZero");

          if (v13)
          {
            v3 = -[STStorageApp appKind](self, "appKind") == 2;
            goto LABEL_17;
          }
        }
      }
    }
    v3 = 1;
    goto LABEL_17;
  }
  return 1;
}

- (void)_postNotify:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v5, self->_bundleIdentifier);

}

- (void)postNotify:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__STStorageApp_postNotify___block_invoke;
  v6[3] = &unk_24C75F680;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __27__STStorageApp_postNotify___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__postNotify_, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__postNotify_, *(_QWORD *)(a1 + 40), 0.1);
}

- (BOOL)isDeletable
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!-[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", CFSTR("com.apple.Health")))
  {
    -[STStorageApp appRecord](self, "appRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if ((objc_msgSend(v4, "isDeletableSystemApplication") & 1) != 0
        || objc_msgSend(v5, "isSystemPlaceholder"))
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isSystemAppRemovalAllowed");
LABEL_7:
        v3 = v7;

LABEL_11:
        return v3;
      }
      if (objc_msgSend(v5, "isDeletable"))
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isAppRemovalAllowed");
        goto LABEL_7;
      }
    }
    v3 = 0;
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)isDemotable
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  int v9;

  -[STStorageApp appRecord](self, "appRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "appClipMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if ((objc_msgSend(v3, "isDeletableSystemApplication") & 1) != 0
        || objc_msgSend(v3, "isSystemPlaceholder"))
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "isSystemAppRemovalAllowed");

        goto LABEL_4;
      }
      if (objc_msgSend(v3, "isDeletable"))
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isAppRemovalAllowed");

        if (v9)
        {
          v5 = objc_msgSend(v3, "isAppStoreVendable");
          goto LABEL_4;
        }
      }
    }
  }
  v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)isInstalled
{
  return -[STStorageApp state](self, "state") == 0;
}

- (BOOL)isDeleted
{
  return -[STStorageApp state](self, "state") == 5 || -[STStorageApp state](self, "state") == 7;
}

- (BOOL)isDemoted
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[STStorageApp appRecord](self, "appRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "applicationState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPlaceholder");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isUsageApp
{
  return self->_usageBundle != 0;
}

- (BOOL)isDocumentApp
{
  return self->_isDocumentApp;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (id)appPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[STStorageApp appRecord](self, "appRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bundleContainerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[STStorageApp appRecord](self, "appRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "dataContainerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)documents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isDocumentApp)
  {
    -[STStorageApp dataPath](self, "dataPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Documents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        v13 = *MEMORY[0x24BDBCC60];
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v18 = 0;
            objc_msgSend(v15, "getResourceValue:forKey:error:", &v18, v13, 0);
            v16 = v18;
            if (objc_msgSend(v16, "BOOLValue"))
            {
              if ((unint64_t)objc_msgSend(v9, "level") >= 4)
                objc_msgSend(v9, "skipDescendants");
            }
            else
            {
              objc_msgSend(v3, "addObject:", v15);
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

    }
  }
  return (NSArray *)v3;
}

- (void)notifyAppSizeChanged
{
  -[STStorageApp setAppSizesVar:](self, "setAppSizesVar:", 0);
  -[STStorageApp postNotify:](self, "postNotify:", CFSTR("com.apple.storage.appinfoChanged"));
}

- (int64_t)coreMLDataSize
{
  return self->_coreMLDataSize;
}

- (void)setCoreMLDataSize:(int64_t)a3
{
  _UpdateSize(self, &self->_coreMLDataSize, a3);
}

- (int64_t)assetPurgeableSize
{
  return self->_assetPurgeableSize;
}

- (void)setAssetPurgeableSize:(int64_t)a3
{
  _UpdateSize(self, &self->_assetPurgeableSize, a3);
}

- (void)setExternalSizes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STStorageApp extSizesVar](self, "extSizesVar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    -[STStorageApp setExtSizesVar:](self, "setExtSizesVar:", v5);
    self->_externalSize = objc_msgSend(v5, "userTotal");
    self->_externalPurgeableSize = objc_msgSend(v5, "purgeable");
    -[STStorageApp notifyAppSizeChanged](self, "notifyAppSizeChanged");
  }

}

- (STSizeVector)internalSizes
{
  void *v3;
  id v4;

  -[STStorageApp intSizesVar](self, "intSizesVar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[STStorageApp updateAppSizes](self, "updateAppSizes");
    -[STStorageApp intSizesVar](self, "intSizesVar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (STSizeVector *)v3;
}

- (STSizeVector)appSize
{
  void *v3;

  -[STStorageApp appSizesVar](self, "appSizesVar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[STStorageApp updateAppSizes](self, "updateAppSizes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (STSizeVector *)v3;
}

- (int64_t)sizeOfMLData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[STStorageApp bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheDeleteDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.aned.CacheDelete"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("COREML_NON_PURGEABLE_BY_APP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  return v9;
}

- (id)updateAppSizes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSString *bundleIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  +[STSizeVector zero](STSizeVector, "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STSizeVector zero](STSizeVector, "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp appRecord](self, "appRecord");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
LABEL_3:
    v7 = 0;
    goto LABEL_6;
  }
  if (!-[NSString length](self->_bundleIdentifier, "length"))
  {
    v6 = 0;
    goto LABEL_3;
  }
  v8 = objc_alloc(MEMORY[0x24BDC1540]);
  bundleIdentifier = self->_bundleIdentifier;
  v33 = 0;
  v6 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", bundleIdentifier, 1, &v33);
  v7 = v33;
LABEL_6:
  objc_msgSend(v6, "bundleContainerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  if (v10)
  {
    v32 = 0;
    v11 = *MEMORY[0x24BDBCDF0];
    v31 = 0;
    objc_msgSend(v10, "getResourceValue:forKey:error:", &v32, v11, &v31);
    v12 = v32;
    v13 = v31;
    v14 = v12;

    objc_msgSend(v14, "BOOLValue");
    v7 = v13;
  }
  if (-[STStorageApp userVisible](self, "userVisible"))
  {
    if (self->_appContainer)
    {
      v34[0] = self->_appContainer;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SizesOfContainers(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v15;
    }
    else
    {
      +[STSizeVector zero](STSizeVector, "zero");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    SizesOfContainers(self->_dataContainers);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "plus:", v17);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    SizesOfContainers(self->_sharedContainers);
    v18 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v18;
  }
  self->_appContainerSize = objc_msgSend(v3, "fixed");
  self->_dataContainerSize = objc_msgSend(v3, "dynamic");
  self->_dataPurgeableSize = objc_msgSend(v3, "purgeable");
  self->_sharedContainerSize = objc_msgSend(v4, "dynamic");
  self->_sharedPurgeableSize = objc_msgSend(v4, "purgeable");
  -[STStorageApp extSizesVar](self, "extSizesVar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_externalSize = objc_msgSend(v19, "dynamic");
  self->_externalPurgeableSize = objc_msgSend(v19, "purgeable");
  +[STSizeVector fixed:dynamic:purgeable:](STSizeVector, "fixed:dynamic:purgeable:", self->_appContainerSize, self->_sharedContainerSize + self->_dataContainerSize + self->_coreMLDataSize, self->_sharedPurgeableSize + self->_dataPurgeableSize + self->_assetPurgeableSize);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "plus:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp setIntSizesVar:](self, "setIntSizesVar:", v20);
  -[STStorageApp setAppSizesVar:](self, "setAppSizesVar:", v21);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    +[STLaunchDates sharedDates](STLaunchDates, "sharedDates");
    v29 = v3;
    v22 = v4;
    v23 = v6;
    v24 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageApp bundleIdentifier](self, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "launchDateForApp:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageApp setLastUsedDate:](self, "setLastUsedDate:", v27);

    v7 = v24;
    v6 = v23;
    v4 = v22;
    v3 = v29;
  }

  return v21;
}

- (void)refreshAppSizes
{
  id v2;

  v2 = -[STStorageApp updateAppSizes](self, "updateAppSizes");
}

- (void)refreshAppState
{
  NSData *v3;
  id v4;
  NSString *bundleIdentifier;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v3 = self->_lsid;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDC1540]);
    bundleIdentifier = self->_bundleIdentifier;
    v12 = 0;
    v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", bundleIdentifier, 1, &v12);
    v7 = v12;
    if (v6)
    {
      objc_msgSend(v6, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToData:", v3);

      if ((v9 & 1) == 0)
      {
        -[STStorageApp setAppRecord:](self, "setAppRecord:", v6);
        +[STMSizer sharedAppSizer](STMSizer, "sharedAppSizer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reloadAppContainer:", self);

        +[STStorageAppsMonitor sharedMonitor](STStorageAppsMonitor, "sharedMonitor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSortNeeded");

      }
    }

  }
  if ((_os_feature_enabled_impl() & 1) == 0)
    -[STStorageApp refreshAppSizes](self, "refreshAppSizes");

}

- (int64_t)staticSize
{
  void *v2;
  int64_t v3;

  -[STStorageApp appSize](self, "appSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fixed");

  return v3;
}

- (int64_t)docsAndDataSize
{
  void *v2;
  int64_t v3;

  -[STStorageApp appSize](self, "appSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "docsAndData");

  return v3;
}

- (int64_t)dynamicSize
{
  void *v2;
  int64_t v3;

  -[STStorageApp appSize](self, "appSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dynamic");

  return v3;
}

- (int64_t)totalSize
{
  void *v2;
  int64_t v3;

  -[STStorageApp appSize](self, "appSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userTotal");

  return v3;
}

- (int64_t)sharedDataSize
{
  return self->_sharedContainerSize;
}

+ (id)sizeOfPluginKitContainers
{
  void *v2;
  void *v3;

  +[STContainer containersWithClass:personaUniqueString:](STContainer, "containersWithClass:personaUniqueString:", 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SizesOfContainers(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addNumber:(int64_t)a3 toDict:(id)a4 forKey:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = a5;
    v9 = a4;
    objc_msgSend(v7, "numberWithLongLong:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v8);

  }
}

- (NSDictionary)infoDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[STStorageApp vendorName](self, "vendorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("vendor"));

  -[STStorageApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("id"));

  if (self->_isAppClip)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("is-app-clip"));
  if (-[STStorageApp isDemoted](self, "isDemoted"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("is-placeholder"));
  -[STStorageApp lastUsedDate](self, "lastUsedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[STStorageApp lastUsedDate](self, "lastUsedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("last-used"));

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp internalSizes](self, "internalSizes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp externalSizes](self, "externalSizes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "plus:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v12, "userTotal"), v9, CFSTR("total"));
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v10, "fixed"), v9, CFSTR("fixed"));
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v10, "dynamic"), v9, CFSTR("dynamic"));
  -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v10, "purgeable"), v9, CFSTR("purgeable"));
  if ((objc_msgSend(v11, "isZero") & 1) == 0)
  {
    -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v11, "dynamic") + objc_msgSend(v11, "fixed"), v9, CFSTR("external"));
    -[STStorageApp addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v11, "purgeable"), v9, CFSTR("ext-purgeable"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sizes"));

  return (NSDictionary *)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)versionString
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setVersionString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (int)appKind
{
  return self->_appKind;
}

- (void)setAppKind:(int)a3
{
  self->_appKind = a3;
}

- (NSDate)lastUsedDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastUsedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PSUsageBundleApp)usageBundle
{
  return (PSUsageBundleApp *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUsageBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)mediaTypes
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMediaTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (FPProviderDomain)fpDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFpDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (void)setForceVisible:(BOOL)a3
{
  self->_forceVisible = a3;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (STContainer)appContainer
{
  return (STContainer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)dataContainers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataContainers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)sharedContainers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedContainers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)parentAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setParentAppIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSArray)childApps
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setChildApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (id)externalDataSizeBlock
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setExternalDataSizeBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (int64_t)appContainerSize
{
  return self->_appContainerSize;
}

- (void)setAppContainerSize:(int64_t)a3
{
  self->_appContainerSize = a3;
}

- (int64_t)dataContainerSize
{
  return self->_dataContainerSize;
}

- (void)setDataContainerSize:(int64_t)a3
{
  self->_dataContainerSize = a3;
}

- (int64_t)dataPurgeableSize
{
  return self->_dataPurgeableSize;
}

- (void)setDataPurgeableSize:(int64_t)a3
{
  self->_dataPurgeableSize = a3;
}

- (int64_t)sharedContainerSize
{
  return self->_sharedContainerSize;
}

- (void)setSharedContainerSize:(int64_t)a3
{
  self->_sharedContainerSize = a3;
}

- (int64_t)sharedPurgeableSize
{
  return self->_sharedPurgeableSize;
}

- (void)setSharedPurgeableSize:(int64_t)a3
{
  self->_sharedPurgeableSize = a3;
}

- (int64_t)externalSize
{
  return self->_externalSize;
}

- (void)setExternalSize:(int64_t)a3
{
  self->_externalSize = a3;
}

- (int64_t)externalPurgeableSize
{
  return self->_externalPurgeableSize;
}

- (void)setExternalPurgeableSize:(int64_t)a3
{
  self->_externalPurgeableSize = a3;
}

- (BOOL)isPseudoApp
{
  return self->_isPseudoApp;
}

- (void)setIsPseudoApp:(BOOL)a3
{
  self->_isPseudoApp = a3;
}

- (STSizeVector)intSizesVar
{
  return (STSizeVector *)objc_getProperty(self, a2, 224, 1);
}

- (void)setIntSizesVar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (STSizeVector)extSizesVar
{
  return (STSizeVector *)objc_getProperty(self, a2, 232, 1);
}

- (void)setExtSizesVar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (STSizeVector)appSizesVar
{
  return (STSizeVector *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppSizesVar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSizesVar, 0);
  objc_storeStrong((id *)&self->_extSizesVar, 0);
  objc_storeStrong((id *)&self->_intSizesVar, 0);
  objc_storeStrong(&self->_externalDataSizeBlock, 0);
  objc_storeStrong((id *)&self->_childApps, 0);
  objc_storeStrong((id *)&self->_parentAppIdentifier, 0);
  objc_storeStrong((id *)&self->_fpDomain, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
  objc_storeStrong((id *)&self->_usageBundle, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedContainers, 0);
  objc_storeStrong((id *)&self->_dataContainers, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_lsid, 0);
}

@end
