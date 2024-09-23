@implementation SKFilesystem

+ (NSArray)allFilesystems
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SKFilesystem_allFilesystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allFilesystems_onceToken != -1)
    dispatch_once(&allFilesystems_onceToken, block);
  return (NSArray *)(id)_allFilesystems;
}

void __30__SKFilesystem_allFilesystems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "installedFilesystems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extensionFilesystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "sortWithOptions:usingComparator:", 16, &__block_literal_global_2);
  v6 = (void *)_allFilesystems;
  _allFilesystems = (uint64_t)v5;

}

uint64_t __30__SKFilesystem_allFilesystems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortPriority");
  if (v6 >= (int)objc_msgSend(v5, "sortPriority"))
  {
    v8 = objc_msgSend(v4, "sortPriority");
    v7 = v8 > (int)objc_msgSend(v5, "sortPriority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (NSMutableDictionary)extensionFilesystemsMapping
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "installedFilesystems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (_extensionFilesystemsMapping && objc_msgSend((id)_extensionFilesystemsMapping, "count"))
  {
    v3 = (id)_extensionFilesystemsMapping;
    objc_sync_exit(v2);

  }
  else
  {
    +[SKFilesystem getExtensionFilesystems](SKFilesystem, "getExtensionFilesystems");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_extensionFilesystemsMapping;
    _extensionFilesystemsMapping = v4;

    objc_sync_exit(v2);
    v3 = (id)_extensionFilesystemsMapping;
  }
  return (NSMutableDictionary *)v3;
}

+ (NSArray)extensionFilesystems
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "installedFilesystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (_extensionFilesystems && objc_msgSend((id)_extensionFilesystems, "count"))
  {
    v4 = (id)_extensionFilesystems;
    objc_sync_exit(v3);

  }
  else
  {
    objc_msgSend(a1, "extensionFilesystemsMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKFilesystem collectFilesystemsWithPersonalityMapping:](SKFilesystem, "collectFilesystemsWithPersonalityMapping:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_extensionFilesystems;
    _extensionFilesystems = v6;

    objc_sync_exit(v3);
    v4 = (id)_extensionFilesystems;
  }
  return (NSArray *)v4;
}

+ (NSMutableDictionary)installedFilesystemsMapping
{
  if (installedFilesystemsMapping_onceToken != -1)
    dispatch_once(&installedFilesystemsMapping_onceToken, &__block_literal_global_13);
  return (NSMutableDictionary *)(id)_installedFilesystemsMapping;
}

void __43__SKFilesystem_installedFilesystemsMapping__block_invoke()
{
  void *v0;
  id v1;
  const __CFURL *v2;
  const __CFArray *BundlesFromDirectory;
  const __CFArray *v4;
  CFIndex v5;
  __CFBundle *ValueAtIndex;
  void *v7;
  CFURLRef v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/Filesystems"));
  v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(0, v2, CFSTR("fs"));
  if (BundlesFromDirectory)
  {
    v4 = BundlesFromDirectory;
    if (CFArrayGetCount(BundlesFromDirectory) >= 1)
    {
      v5 = 0;
      do
      {
        ValueAtIndex = (__CFBundle *)CFArrayGetValueAtIndex(v4, v5);
        v7 = (void *)MEMORY[0x24BDD1488];
        v8 = CFBundleCopyBundleURL(ValueAtIndex);
        objc_msgSend(v7, "bundleWithURL:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "bundlePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("apfs_userfs.fs"));

        if ((v11 & 1) == 0)
          objc_msgSend(v1, "addObject:", v9);

        ++v5;
      }
      while (v5 < CFArrayGetCount(v4));
    }
    CFRelease(v4);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v1;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    v16 = *MEMORY[0x24BDBD298];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v18 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_msgSend(v18, "infoDictionary", (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          +[SKFilesystem filesystemsFromBundle:](SKFilesystem, "filesystemsFromBundle:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "setObject:forKeyedSubscript:", v21, v20);

        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v22 = (void *)_installedFilesystemsMapping;
  _installedFilesystemsMapping = (uint64_t)v0;

}

+ (NSArray)installedFilesystems
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SKFilesystem_installedFilesystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (installedFilesystems_onceToken != -1)
    dispatch_once(&installedFilesystems_onceToken, block);
  return (NSArray *)(id)_installedFilesystems;
}

void __36__SKFilesystem_installedFilesystems__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "installedFilesystemsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[SKFilesystem collectFilesystemsWithPersonalityMapping:](SKFilesystem, "collectFilesystemsWithPersonalityMapping:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_installedFilesystems;
  _installedFilesystems = v1;

}

+ (id)collectFilesystemsWithPersonalityMapping:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  +[SKFilesystem buildSpecialFilesystems](SKFilesystem, "buildSpecialFilesystems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend(v4, "sortWithOptions:usingComparator:", 16, &__block_literal_global_18);
  return v4;
}

uint64_t __57__SKFilesystem_collectFilesystemsWithPersonalityMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortPriority");
  if (v6 >= (int)objc_msgSend(v5, "sortPriority"))
  {
    v8 = objc_msgSend(v4, "sortPriority");
    v7 = v8 > (int)objc_msgSend(v5, "sortPriority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)getExtensionFilesystems
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v18 = (id)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = (id)objc_opt_new();
  if (v17)
  {
    v2 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __39__SKFilesystem_getExtensionFilesystems__block_invoke;
    v23[3] = &unk_24FDBFED8;
    v25 = &v26;
    v3 = v2;
    v24 = v3;
    objc_msgSend(v17, "installedExtensionsSync:", v23);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)v27[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)MEMORY[0x24BDD1488];
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7), "url", v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleWithURL:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "infoDictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", kExtensionAttributesKey);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FSShortName"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13 && (objc_msgSend(v13, "isEqualToString:", CFSTR("hfs")) & 1) == 0)
            {
              +[SKFilesystem filesystemsFromBundle:](SKFilesystem, "filesystemsFromBundle:", v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v14);

            }
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __39__SKFilesystem_getExtensionFilesystems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_25);

    SKGetOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_22FE50000, v9, OS_LOG_TYPE_FAULT, "Failed to get extensions %@", (uint8_t *)&v10, 0xCu);
    }

  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __39__SKFilesystem_getExtensionFilesystems__block_invoke_2()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKFilesystem.m", 221);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (NSMutableDictionary)cachedFilesystems
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_cachedFilesystems;
  if (!_cachedFilesystems)
  {
    v3 = objc_opt_new();
    v4 = (void *)_cachedFilesystems;
    _cachedFilesystems = v3;

    v2 = (void *)_cachedFilesystems;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setCachedFilesystems:(id)a3
{
  objc_storeStrong((id *)&_cachedFilesystems, a3);
}

- (SKFilesystem)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SKFilesystem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *formatArgs;
  void *v26;
  void *v27;
  uint64_t v28;
  NSURL *formatExecutable;
  uint64_t v30;
  NSString *repairArgs;
  void *v32;
  void *v33;
  uint64_t v34;
  NSURL *repairExecutable;
  uint64_t v36;
  NSString *verificationArgs;
  uint64_t v38;
  NSString *liveVerificationArgs;
  void *v40;
  void *v41;
  uint64_t v42;
  NSURL *verificationExecutable;
  uint64_t v44;
  NSString *xmlOutputArg;
  void *v46;
  void *v47;
  uint64_t v48;
  NSBundle *bundle;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SKFilesystem;
  v5 = -[SKFilesystem init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("localizedKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("localizedKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem setLocalizedKey:](v5, "setLocalizedKey:", v7);

      +[SKError frameworkBundle](SKError, "frameworkBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem localizedKey](v5, "localizedKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24FDC08E8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem setLocalizedName:](v5, "setLocalizedName:", v10);

    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("localizedName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKFilesystem setLocalizedName:](v5, "setLocalizedName:", v8);
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setType:](v5, "setType:", v11);

    objc_msgSend(v4, "objectForKey:", CFSTR("majorType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setMajorType:](v5, "setMajorType:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("isEncrypted"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setIsEncrypted:](v5, "setIsEncrypted:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("defaultEffaceable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setDefaultEffaceable:](v5, "setDefaultEffaceable:", objc_msgSend(v14, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("isCaseSensitive"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setIsCaseSensitive:](v5, "setIsCaseSensitive:", objc_msgSend(v15, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("isJournaled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setIsJournaled:](v5, "setIsJournaled:", objc_msgSend(v16, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("shouldShow"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setShouldShow:](v5, "setShouldShow:", objc_msgSend(v17, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("dmPersonality"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setDmPersonality:](v5, "setDmPersonality:", v18);

    objc_msgSend(v4, "objectForKey:", CFSTR("sortPriority"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setSortPriority:](v5, "setSortPriority:", objc_msgSend(v19, "intValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("minimumSize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setMinimumSize:](v5, "setMinimumSize:", objc_msgSend(v20, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("unlocalizedName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedName:](v5, "setUnlocalizedName:", v21);

    objc_msgSend(v4, "objectForKey:", CFSTR("unlocalizedEncryptedName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedEncryptedName:](v5, "setUnlocalizedEncryptedName:", v22);

    objc_msgSend(v4, "objectForKey:", CFSTR("contentMask"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setContentMask:](v5, "setContentMask:", v23);

    objc_msgSend(v4, "objectForKey:", CFSTR("formatArgs"));
    v24 = objc_claimAutoreleasedReturnValue();
    formatArgs = v5->_formatArgs;
    v5->_formatArgs = (NSString *)v24;

    v26 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKey:", CFSTR("formatExecutable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLWithString:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    formatExecutable = v5->_formatExecutable;
    v5->_formatExecutable = (NSURL *)v28;

    objc_msgSend(v4, "objectForKey:", CFSTR("repairArgs"));
    v30 = objc_claimAutoreleasedReturnValue();
    repairArgs = v5->_repairArgs;
    v5->_repairArgs = (NSString *)v30;

    v32 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKey:", CFSTR("repairExecutable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "URLWithString:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    repairExecutable = v5->_repairExecutable;
    v5->_repairExecutable = (NSURL *)v34;

    objc_msgSend(v4, "objectForKey:", CFSTR("verificationArgs"));
    v36 = objc_claimAutoreleasedReturnValue();
    verificationArgs = v5->_verificationArgs;
    v5->_verificationArgs = (NSString *)v36;

    objc_msgSend(v4, "objectForKey:", CFSTR("liveVerificationArgs"));
    v38 = objc_claimAutoreleasedReturnValue();
    liveVerificationArgs = v5->_liveVerificationArgs;
    v5->_liveVerificationArgs = (NSString *)v38;

    v40 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKey:", CFSTR("verificationExecutable"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "URLWithString:", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    verificationExecutable = v5->_verificationExecutable;
    v5->_verificationExecutable = (NSURL *)v42;

    objc_msgSend(v4, "objectForKey:", CFSTR("xmlOutputArg"));
    v44 = objc_claimAutoreleasedReturnValue();
    xmlOutputArg = v5->_xmlOutputArg;
    v5->_xmlOutputArg = (NSString *)v44;

    v46 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v4, "objectForKey:", CFSTR("bundle"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bundleWithPath:", v47);
    v48 = objc_claimAutoreleasedReturnValue();
    bundle = v5->_bundle;
    v5->_bundle = (NSBundle *)v48;

  }
  return v5;
}

- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 encrypted:(BOOL)a7 personalityKey:(id)a8 sortPriority:(int)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SKFilesystem *v21;
  uint64_t v23;

  v9 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  getPersonalityDict(v18, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = a9;
  v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:](self, "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:", v19, v18, v17, v16, getCaseSensitive(v20, v15), v9, v15, v23);

  return v21;
}

- (SKFilesystem)initWithSKFilesystem:(id)a3 bundle:(id)a4 localizedName:(id)a5 localizedKey:(id)a6 caseSensitive:(BOOL)a7 encrypted:(BOOL)a8 personalityKey:(id)a9 sortPriority:(int)a10
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  SKFilesystem *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *repairArgs;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSURL *repairExecutable;
  void *v41;
  uint64_t v42;
  NSString *formatArgs;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSURL *formatExecutable;
  void *v49;
  uint64_t v50;
  NSString *verificationArgs;
  void *v52;
  uint64_t v53;
  NSString *liveVerificationArgs;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSURL *verificationExecutable;
  void *v60;
  uint64_t v61;
  NSString *xmlOutputArg;
  uint64_t v63;
  void *v65;
  _BOOL4 v66;
  id obj;
  void *v68;
  id v69;
  objc_super v70;

  v10 = a8;
  v66 = a7;
  v69 = a3;
  obj = a4;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v70.receiver = self;
  v70.super_class = (Class)SKFilesystem;
  v19 = -[SKFilesystem init](&v70, sel_init);
  objc_msgSend(v15, "infoDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", *MEMORY[0x24BDBD298]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "componentsSeparatedByString:", CFSTR("."));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v15;
  getPersonalityDict(v15, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v65 = v20;
    -[SKFilesystem setLocalizedName:](v19, "setLocalizedName:", v16);
    -[SKFilesystem setLocalizedKey:](v19, "setLocalizedKey:", v17);
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedName:](v19, "setUnlocalizedName:", v26);

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSEncryptionName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setUnlocalizedEncryptedName:](v19, "setUnlocalizedEncryptedName:", v28);

    -[SKFilesystem setType:](v19, "setType:", v69);
    v29 = v22;
    -[SKFilesystem setMajorType:](v19, "setMajorType:", v22);
    -[SKFilesystem setIsCaseSensitive:](v19, "setIsCaseSensitive:", v66);
    -[SKFilesystem setIsEncrypted:](v19, "setIsEncrypted:", v10);
    -[SKFilesystem setDefaultEffaceable:](v19, "setDefaultEffaceable:", v10 ^ 1);
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSFormatMinimumSize"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setMinimumSize:](v19, "setMinimumSize:", NSNumberToULongLong(v30));

    -[SKFilesystem setSortPriority:](v19, "setSortPriority:", a10);
    -[SKFilesystem setDmPersonality:](v19, "setDmPersonality:", v18);
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSFormatContentMask"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setContentMask:](v19, "setContentMask:", v32);

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSRepairArguments"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v33);
    v34 = objc_claimAutoreleasedReturnValue();
    repairArgs = v19->_repairArgs;
    v19->_repairArgs = (NSString *)v34;

    objc_msgSend(v23, "resourceURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSRepairExecutable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "URLByAppendingPathComponent:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    repairExecutable = v19->_repairExecutable;
    v19->_repairExecutable = (NSURL *)v39;

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSFormatArguments"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v41);
    v42 = objc_claimAutoreleasedReturnValue();
    formatArgs = v19->_formatArgs;
    v19->_formatArgs = (NSString *)v42;

    objc_msgSend(v23, "resourceURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSFormatExecutable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "URLByAppendingPathComponent:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    formatExecutable = v19->_formatExecutable;
    v19->_formatExecutable = (NSURL *)v47;

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSVerificationArguments"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v49);
    v50 = objc_claimAutoreleasedReturnValue();
    verificationArgs = v19->_verificationArgs;
    v19->_verificationArgs = (NSString *)v50;

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSLiveVerificationArguments"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v52);
    v53 = objc_claimAutoreleasedReturnValue();
    liveVerificationArgs = v19->_liveVerificationArgs;
    v19->_liveVerificationArgs = (NSString *)v53;

    objc_msgSend(v23, "resourceURL");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSVerificationExecutable"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "URLByAppendingPathComponent:", v57);
    v58 = objc_claimAutoreleasedReturnValue();
    verificationExecutable = v19->_verificationExecutable;
    v19->_verificationExecutable = (NSURL *)v58;

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FSXMLOutputArgument"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringOrEmpty(v60);
    v61 = objc_claimAutoreleasedReturnValue();
    xmlOutputArg = v19->_xmlOutputArg;
    v19->_xmlOutputArg = (NSString *)v61;

    objc_storeStrong((id *)&v19->_bundle, obj);
    if (+[SKFilesystem _shouldShowFilesystemWithType:key:personality:](SKFilesystem, "_shouldShowFilesystemWithType:key:personality:", v29, v18, v24))
    {
      v22 = v29;
      v63 = 1;
    }
    else
    {
      v22 = v29;
      if (-[SKFilesystem isExtension](v19, "isExtension"))
        v63 = objc_msgSend(v29, "isEqualToString:", CFSTR("apfs"));
      else
        v63 = 0;
    }
    v20 = v65;
    -[SKFilesystem setShouldShow:](v19, "setShouldShow:", v63);
  }

  return v19;
}

- (id)initEncryptedFSWithUnencryptedFS:(id)a3 localizedName:(id)a4 sortPriority:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  SKFilesystem *v11;
  SKFilesystem *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SKFilesystem initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v10);
  v12 = v11;
  if (v11)
  {
    -[SKFilesystem setIsEncrypted:](v11, "setIsEncrypted:", 1);
    -[SKFilesystem setDefaultEffaceable:](v12, "setDefaultEffaceable:", 0);
    -[SKFilesystem setLocalizedName:](v12, "setLocalizedName:", v9);
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "localizedKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ Encrypted"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setLocalizedKey:](v12, "setLocalizedKey:", v15);

    -[SKFilesystem setSortPriority:](v12, "setSortPriority:", v5);
  }

  return v12;
}

- (id)dictionaryRepresentation
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKFilesystem localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKFilesystem localizedName](self, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("localizedName"));

  }
  -[SKFilesystem localizedKey](self, "localizedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKFilesystem localizedKey](self, "localizedKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("localizedKey"));

  }
  -[SKFilesystem type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("type"));

  -[SKFilesystem majorType](self, "majorType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SKFilesystem majorType](self, "majorType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("majorType"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKFilesystem isEncrypted](self, "isEncrypted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isEncrypted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKFilesystem defaultEffaceable](self, "defaultEffaceable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("defaultEffaceable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKFilesystem isCaseSensitive](self, "isCaseSensitive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isCaseSensitive"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKFilesystem shouldShow](self, "shouldShow"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("shouldShow"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKFilesystem isJournaled](self, "isJournaled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("isJournaled"));

  -[SKFilesystem dmPersonality](self, "dmPersonality");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("dmPersonality"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SKFilesystem sortPriority](self, "sortPriority"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sortPriority"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKFilesystem minimumSize](self, "minimumSize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("minimumSize"));

  -[SKFilesystem unlocalizedName](self, "unlocalizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("unlocalizedName"));

  -[SKFilesystem unlocalizedEncryptedName](self, "unlocalizedEncryptedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("unlocalizedEncryptedName"));

  -[SKFilesystem contentMask](self, "contentMask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("contentMask"));

  -[SKFilesystem formatArgs](self, "formatArgs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("formatArgs"));

  -[SKFilesystem formatExecutable](self, "formatExecutable");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v24, CFSTR("formatExecutable"));

  -[SKFilesystem repairArgs](self, "repairArgs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("repairArgs"));

  -[SKFilesystem repairExecutable](self, "repairExecutable");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v27, CFSTR("repairExecutable"));

  -[SKFilesystem verificationArgs](self, "verificationArgs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v28, CFSTR("verificationArgs"));

  -[SKFilesystem liveVerificationArgs](self, "liveVerificationArgs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("liveVerificationArgs"));

  -[SKFilesystem verificationExecutable](self, "verificationExecutable");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "absoluteString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v31, CFSTR("verificationExecutable"));

  -[SKFilesystem xmlOutputArg](self, "xmlOutputArg");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v32, CFSTR("xmlOutputArg"));

  -[SKFilesystem bundle](self, "bundle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bundlePath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v34, CFSTR("bundle"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SKFilesystem localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKFilesystem shouldShow](self, "shouldShow");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - Show: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isExtensionInsensitiveEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _BOOL4 v15;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[SKFilesystem type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[SKFilesystem dmPersonality](self, "dmPersonality");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dmPersonality");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9)
        && (v10 = -[SKFilesystem isEncrypted](self, "isEncrypted"), v10 == objc_msgSend(v5, "isEncrypted"))
        && (v11 = -[SKFilesystem defaultEffaceable](self, "defaultEffaceable"),
            v11 == objc_msgSend(v5, "defaultEffaceable"))
        && (v12 = -[SKFilesystem isJournaled](self, "isJournaled"), v12 == objc_msgSend(v5, "isJournaled")))
      {
        v15 = -[SKFilesystem isCaseSensitive](self, "isCaseSensitive");
        v13 = v15 ^ objc_msgSend(v5, "isCaseSensitive") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  if (-[SKFilesystem isExtensionInsensitiveEqual:](self, "isExtensionInsensitiveEqual:", v4))
  {
    v5 = -[SKFilesystem isExtension](self, "isExtension");
    v6 = v5 ^ objc_msgSend(v4, "isExtension") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5 isExtension:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SKFilesystem *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  id v39;
  _QWORD v40[4];
  BOOL v41;
  BOOL v42;
  BOOL v43;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%d_%d_%d"), v10, v8, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cachedFilesystems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[SKFilesystem initWithDictionaryRepresentation:]([SKFilesystem alloc], "initWithDictionaryRepresentation:", v13);
    goto LABEL_26;
  }
  v39 = a1;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("apfs")) & 1) != 0)
  {
    v15 = CFSTR("apfs.fs");
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("hfs")) & 1) != 0)
  {
    v15 = CFSTR("hfs.fs");
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("msdos")) & 1) != 0)
  {
    v15 = CFSTR("msdos.fs");
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("exfat")) & 1) != 0)
  {
    v15 = CFSTR("exfat.fs");
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("free")))
    {
      v14 = 0;
      goto LABEL_26;
    }
    v15 = &stru_24FDC08E8;
  }
  +[SKFilesystem getExtensionFilesystems](SKFilesystem, "getExtensionFilesystems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v6)
    goto LABEL_18;
  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_18;
  v37 = (void *)v18;
  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_134);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v20);
  v38 = v15;
  v21 = v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v22, "count");

  v17 = v21;
  v15 = v38;

  if (v36)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
LABEL_20:
      objc_msgSend(v17, "objectForKeyedSubscript:", v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", v10);
        v28 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v28;
      }
      goto LABEL_22;
    }
  }
  else
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/System/Library/Filesystems"), v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v24);
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKFilesystem filesystemsFromBundle:](SKFilesystem, "filesystemsFromBundle:", v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v25;
    if (!v23)
      goto LABEL_20;
  }
  if (!objc_msgSend(v23, "count"))
    goto LABEL_20;
LABEL_22:
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_2;
  v40[3] = &__block_descriptor_35_e39_B24__0__SKFilesystem_8__NSDictionary_16l;
  v41 = v7;
  v42 = v8;
  v43 = v6;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_138);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "cachedFilesystems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:forKey:", v34, v11);

    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v14 = (SKFilesystem *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

LABEL_26:
  return v14;
}

uint64_t __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldShow");
}

BOOL __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_2(unsigned __int8 *a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = a1[32] == objc_msgSend(v3, "isEncrypted")
    && a1[33] == objc_msgSend(v3, "isCaseSensitive")
    && a1[34] == objc_msgSend(v3, "isExtension");

  return v4;
}

uint64_t __66__SKFilesystem_filesystemFor_caseSensitive_encrypted_isExtension___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortPriority");
  if (v6 >= (int)objc_msgSend(v5, "sortPriority"))
  {
    v8 = objc_msgSend(v4, "sortPriority");
    v7 = v8 > (int)objc_msgSend(v5, "sortPriority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4 encrypted:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("msdos")) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("exfat"));
  +[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:](SKFilesystem, "filesystemFor:caseSensitive:encrypted:isExtension:", v7, v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filesystemFor:(id)a3 caseSensitive:(BOOL)a4
{
  return +[SKFilesystem filesystemFor:caseSensitive:encrypted:](SKFilesystem, "filesystemFor:caseSensitive:encrypted:", a3, a4, 0);
}

+ (id)filesystemFor:(id)a3
{
  return +[SKFilesystem filesystemFor:caseSensitive:](SKFilesystem, "filesystemFor:caseSensitive:", a3, 0);
}

+ (id)fileSystemsHFSWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t CaseSensitive;
  SKFilesystem *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  SKFilesystem *v21;
  SKFilesystem *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD *v27;
  SKFilesystem *v28;
  __CFString *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  SKFilesystem *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  SKFilesystem *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  SKFilesystem *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  SKFilesystem *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  SKFilesystem *v52;
  void *v53;
  void *v54;
  void *v55;
  int v57;
  SKFilesystem *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  SKFilesystem *v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[3];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  getPersonalityDict(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD298]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "componentsSeparatedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = objc_claimAutoreleasedReturnValue();

  v66 = v10;
  CaseSensitive = getCaseSensitive(v10, v7);
  v64 = (void *)v13;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Journaled HFS+")))
  {
    v15 = [SKFilesystem alloc];
    v16 = v8;
    v17 = kSKDiskFileSystemHFS[0];
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v9;
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("HFS Generic"), &stru_24FDC08E8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 2;
    v20 = v17;
    v8 = v16;
    v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:](v15, "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:", v20, v16, v19, CFSTR("HFS Generic"), CaseSensitive, 0, v7, v60);

    -[SKFilesystem setIsJournaled:](v21, "setIsJournaled:", 1);
    v22 = [SKFilesystem alloc];
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("HFS Generic Encrypted"), &stru_24FDC08E8, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:](v22, "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:", v21, v24, 3);

    v9 = v61;
    v71[0] = v21;
    v71[1] = v25;
    v26 = (void *)MEMORY[0x24BDBCE30];
    v27 = v71;
LABEL_9:
    objc_msgSend(v26, "arrayWithObjects:count:", v27, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Case-sensitive Journaled HFS+")))
  {
    v28 = [SKFilesystem alloc];
    v29 = kSKDiskFileSystemHFS[0];
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v30 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("HFS Case-sensitive"), &stru_24FDC08E8, 0);
    v32 = v8;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 4;
    v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:](v28, "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:", v29, v32, v33, CFSTR("HFS Case-sensitive"), CaseSensitive, 0, v7, v60);

    v8 = v32;
    -[SKFilesystem setIsJournaled:](v21, "setIsJournaled:", 1);
    v34 = [SKFilesystem alloc];
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("HFS Case-sensitive Encrypted"), &stru_24FDC08E8, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:](v34, "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:", v21, v36, 5);

    v9 = v30;
    v70[0] = v21;
    v70[1] = v25;
    v26 = (void *)MEMORY[0x24BDBCE30];
    v27 = v70;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HFS+")))
  {
    v37 = CaseSensitive;
    v38 = [SKFilesystem alloc];
    +[SKFilesystem _skfilesystemTypeWithPersonality:](SKFilesystem, "_skfilesystemTypeWithPersonality:", v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v62 = v9;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("HFS Not Journaled"), &stru_24FDC08E8, 0);
    v41 = v8;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 8;
    v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:](v38, "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:", v39, v41, v42, CFSTR("HFS Not Journaled"), v37, 0, v7, v60);

    v8 = v41;
    v43 = [SKFilesystem alloc];
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("HFS Not Journaled Encrypted"), &stru_24FDC08E8, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:](v43, "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:", v21, v45, 8);

    v9 = v62;
    v69[0] = v21;
    v69[1] = v25;
    v26 = (void *)MEMORY[0x24BDBCE30];
    v27 = v69;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Case-sensitive HFS+")))
  {
    v46 = CaseSensitive;
    v47 = [SKFilesystem alloc];
    +[SKFilesystem _skfilesystemTypeWithPersonality:](SKFilesystem, "_skfilesystemTypeWithPersonality:", v7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v63 = v9;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("HFS Case-sensitive Not Journaled"), &stru_24FDC08E8, 0);
    v50 = v8;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 8;
    v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:](v47, "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:", v48, v50, v51, CFSTR("HFS Case-sensitive Not Journaled"), v46, 0, v7, v60);

    v8 = v50;
    v52 = [SKFilesystem alloc];
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("HFS Case-sensitive Not Journaled Encrypted"), &stru_24FDC08E8, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:](v52, "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:", v21, v54, 8);

    v9 = v63;
    v68[0] = v21;
    v68[1] = v25;
    v26 = (void *)MEMORY[0x24BDBCE30];
    v27 = v68;
    goto LABEL_9;
  }
  if (+[SKFilesystem _shouldShowFilesystemWithType:key:personality:](SKFilesystem, "_shouldShowFilesystemWithType:key:personality:", v13, v7, v10))
  {
    v57 = 6;
  }
  else
  {
    v57 = 8;
  }
  v58 = [SKFilesystem alloc];
  +[SKFilesystem _skfilesystemTypeWithPersonality:](SKFilesystem, "_skfilesystemTypeWithPersonality:", v7);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v60) = v57;
  v21 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:](v58, "initWithSKFilesystem:bundle:localizedName:localizedKey:caseSensitive:encrypted:personalityKey:sortPriority:", v59, v8, v9, 0, 0, 0, v7, v60);

  v67 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v55;
}

+ (id)fileSystemsAPFSWithPersonalityKey:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  SKFilesystem *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  SKFilesystem *v11;
  SKFilesystem *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  char CaseSensitive;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  getPersonalityDict(v5, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CaseSensitive = getCaseSensitive(v24, v6);
  v7 = [SKFilesystem alloc];
  v8 = kSKDiskFileSystemAPFS[0];
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APFS"), &stru_24FDC08E8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1;
  v11 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:](v7, "initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:", v8, v5, v10, CFSTR("APFS"), 0, v6, v22);

  v12 = [SKFilesystem alloc];
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("APFS Encrypted"), &stru_24FDC08E8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SKFilesystem initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:](v12, "initEncryptedFSWithUnencryptedFS:localizedName:sortPriority:", v11, v14, 1);

  objc_msgSend(v15, "setLocalizedKey:", CFSTR("APFS Encrypted"));
  if ((CaseSensitive & 1) == 0)
  {
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Case-insensitive APFS"), &stru_24FDC08E8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFilesystem setLocalizedName:](v11, "setLocalizedName:", v17);

    -[SKFilesystem setLocalizedKey:](v11, "setLocalizedKey:", CFSTR("Case-insensitive APFS"));
    -[SKFilesystem setSortPriority:](v11, "setSortPriority:", 0);
    +[SKError frameworkBundle](SKError, "frameworkBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Case-insensitive APFS Encrypted"), &stru_24FDC08E8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLocalizedName:", v19);

    objc_msgSend(v15, "setLocalizedKey:", CFSTR("Case-insensitive APFS Encrypted"));
    objc_msgSend(v15, "setSortPriority:", 0);
  }
  v25[0] = v11;
  v25[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)fileSystems3rdPartyWithPersonalityKey:(id)a3 bundle:(id)a4 userVisibleName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  SKFilesystem *v16;
  void *v17;
  SKFilesystem *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  getPersonalityDict(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD298]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[SKFilesystem _shouldShowFilesystemWithType:key:personality:](SKFilesystem, "_shouldShowFilesystemWithType:key:personality:", v14, v9, v10))
  {
    v15 = 7;
  }
  else
  {
    v15 = 9;
  }
  v16 = [SKFilesystem alloc];
  +[SKFilesystem _skfilesystemTypeWithPersonality:](SKFilesystem, "_skfilesystemTypeWithPersonality:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v15;
  v18 = -[SKFilesystem initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:](v16, "initWithSKFilesystem:bundle:localizedName:localizedKey:encrypted:personalityKey:sortPriority:", v17, v8, v7, 0, 0, v9, v21);

  v22[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)filesystemsWithBundle:(id)a3 filesystemPersonality:(id)a4 userVisibleName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD298]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqualToString:", CFSTR("hfs")))
  {
    objc_msgSend(a1, "fileSystemsHFSWithPersonalityKey:bundle:userVisibleName:", v9, v8, v10);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("apfs")))
      objc_msgSend(a1, "fileSystemsAPFSWithPersonalityKey:bundle:", v9, v8);
    else
      objc_msgSend(a1, "fileSystems3rdPartyWithPersonalityKey:bundle:userVisibleName:", v9, v8, v10);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

- (SKFilesystem)initWithSpecialFilesystem:(id)a3 majorType:(id)a4 localizedName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SKFilesystem *v14;
  _QWORD v16[8];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("type");
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SKFilesystem _skfilesystemTypeWithPersonality:](SKFilesystem, "_skfilesystemTypeWithPersonality:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = v9;
  v16[1] = CFSTR("majorType");
  v16[2] = CFSTR("localizedName");
  v17[2] = v8;
  v17[3] = MEMORY[0x24BDBD1C0];
  v16[3] = CFSTR("isCaseSensitive");
  v16[4] = CFSTR("isEncrypted");
  v17[4] = MEMORY[0x24BDBD1C0];
  v17[5] = MEMORY[0x24BDBD1C0];
  v16[5] = CFSTR("shouldShow");
  v16[6] = CFSTR("dmPersonality");
  v17[6] = v10;
  v16[7] = CFSTR("sortPriority");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SKFilesystem initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v13);
  return v14;
}

+ (id)buildSpecialFilesystems
{
  SKFilesystem *v2;
  void *v3;
  void *v4;
  SKFilesystem *v5;
  SKFilesystem *v6;
  void *v7;
  void *v8;
  SKFilesystem *v9;
  SKFilesystem *v10;
  void *v11;
  void *v12;
  SKFilesystem *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v2 = [SKFilesystem alloc];
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Free Space"), &stru_24FDC08E8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKFilesystem initWithSpecialFilesystem:majorType:localizedName:](v2, "initWithSpecialFilesystem:majorType:localizedName:", CFSTR("Free Space"), CFSTR("FREE_SPACE"), v4);

  v6 = [SKFilesystem alloc];
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Linux Swap"), &stru_24FDC08E8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKFilesystem initWithSpecialFilesystem:majorType:localizedName:](v6, "initWithSpecialFilesystem:majorType:localizedName:", CFSTR("Linux Swap"), CFSTR("Linux Swap"), v8);

  v10 = [SKFilesystem alloc];
  +[SKError frameworkBundle](SKError, "frameworkBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Linux Native"), &stru_24FDC08E8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SKFilesystem initWithSpecialFilesystem:majorType:localizedName:](v10, "initWithSpecialFilesystem:majorType:localizedName:", CFSTR("Linux Native"), CFSTR("Linux Native"), v12);

  v16[0] = v5;
  v16[1] = v9;
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)filesystemsFromBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v3;
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", kExtensionAttributesKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kExtensionAttributesKey);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v21 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FSPersonalities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("FSPersonalities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FSName"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FSName"));
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
            v17 = (__CFString *)v18;
          else
            v17 = &stru_24FDC08E8;
        }
        +[SKFilesystem filesystemsWithBundle:filesystemPersonality:userVisibleName:](SKFilesystem, "filesystemsWithBundle:filesystemPersonality:userVisibleName:", v23, v14, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObjectsFromArray:", v19);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  return v22;
}

+ (id)_skfilesystemTypeWithPersonality:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kSKDiskFileSystem_%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_shouldShowFilesystemWithType:(id)a3 key:(id)a4 personality:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FSServerOnly"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NSNumberToBool(v10);

  if (v11 && (v12 = (void *)_CFCopyServerVersionDictionary(), v12, !v12))
  {

  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FSFormatExecutable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_4;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FSFormatInteractive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isValidNSNumber(v15) & 1) == 0)
  {

LABEL_14:
    LOBYTE(v14) = 0;
    goto LABEL_15;
  }
  v16 = objc_msgSend(v15, "BOOLValue");

  if ((v16 & 1) != 0)
    goto LABEL_14;
LABEL_4:
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("hfs"))
    && !objc_msgSend(v8, "containsString:", CFSTR("Journaled"))
    || objc_msgSend(v7, "isEqualToString:", CFSTR("msdos"))
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("MS-DOS")))
  {
    goto LABEL_14;
  }
  v14 = objc_msgSend(v7, "isEqualToString:", CFSTR("udf")) ^ 1;
LABEL_15:

  return v14;
}

- (BOOL)isExtension
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SKFilesystem bundle](self, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", kExtensionAttributesKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isValidName:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (-[SKFilesystem isExtension](self, "isExtension"))
    {
      v8 = (void *)objc_opt_new();
      if (v8)
      {
        -[SKFilesystem bundle](self, "bundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __34__SKFilesystem_isValidName_error___block_invoke;
        v14[3] = &unk_24FDBFF80;
        v16 = &v17;
        v11 = v7;
        v15 = v11;
        objc_msgSend(v8, "validateVolumeName:usingBundle:volumeID:replyHandler:", v6, v10, 0, v14);

        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        if (a4)
          *a4 = objc_retainAutorelease((id)v18[5]);
        v12 = v18[5] == 0;

      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 1;
    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __34__SKFilesystem_isValidName_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)majorType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMajorType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)dmPersonality
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDmPersonality:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)defaultEffaceable
{
  return self->_defaultEffaceable;
}

- (void)setDefaultEffaceable:(BOOL)a3
{
  self->_defaultEffaceable = a3;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (void)setIsCaseSensitive:(BOOL)a3
{
  self->_isCaseSensitive = a3;
}

- (BOOL)isJournaled
{
  return self->_isJournaled;
}

- (void)setIsJournaled:(BOOL)a3
{
  self->_isJournaled = a3;
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (unint64_t)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(unint64_t)a3
{
  self->_minimumSize = a3;
}

- (NSString)contentMask
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContentMask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)localizedKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalizedKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(int)a3
{
  self->_sortPriority = a3;
}

- (NSString)unlocalizedName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUnlocalizedName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)unlocalizedEncryptedName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUnlocalizedEncryptedName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)formatArgs
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSURL)formatExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)repairArgs
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSURL)repairExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)verificationArgs
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)liveVerificationArgs
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSURL)verificationExecutable
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)xmlOutputArg
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_xmlOutputArg, 0);
  objc_storeStrong((id *)&self->_verificationExecutable, 0);
  objc_storeStrong((id *)&self->_liveVerificationArgs, 0);
  objc_storeStrong((id *)&self->_verificationArgs, 0);
  objc_storeStrong((id *)&self->_repairExecutable, 0);
  objc_storeStrong((id *)&self->_repairArgs, 0);
  objc_storeStrong((id *)&self->_formatExecutable, 0);
  objc_storeStrong((id *)&self->_formatArgs, 0);
  objc_storeStrong((id *)&self->_unlocalizedEncryptedName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_localizedKey, 0);
  objc_storeStrong((id *)&self->_contentMask, 0);
  objc_storeStrong((id *)&self->_dmPersonality, 0);
  objc_storeStrong((id *)&self->_majorType, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
