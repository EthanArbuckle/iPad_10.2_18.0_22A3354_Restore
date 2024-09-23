@implementation WRCannedRepliesStore

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)WRCannedRepliesStore;
  -[WRCannedRepliesStore dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsEnhancedEditing
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = BPSDeviceHasCapabilityForString();
  return (char)v2;
}

+ (BOOL)isTinker
{
  return 0;
}

- (WRCannedRepliesStore)init
{
  return -[WRCannedRepliesStore initWithCategory:](self, "initWithCategory:", 0);
}

- (WRCannedRepliesStore)initWithCategory:(unint64_t)a3
{
  WRCannedRepliesStore *v4;
  WRCannedRepliesStore *v5;
  uint64_t v6;
  WRReplyStoreInfo *info;
  os_log_t v8;
  OS_os_log *log;
  NSRecursiveLock *v10;
  NSRecursiveLock *lock;
  __CFString *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WRCannedRepliesStore;
  v4 = -[WRCannedRepliesStore init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_category = a3;
    +[WRReplyStoreInfo infoForCategory:](WRReplyStoreInfo, "infoForCategory:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (WRReplyStoreInfo *)v6;

    v8 = os_log_create("WatchReplies", "CannedReplies");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    lock = v5->_lock;
    v5->_lock = v10;

    -[WRReplyStoreInfo defaultsChangedNotificationName](v5->_info, "defaultsChangedNotificationName");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_WRCannedRepliesStore_handleStoreChange, v12, v5, CFNotificationSuspensionBehaviorDeliverImmediately);
    }

  }
  return v5;
}

- (id)domainAccessor
{
  NPSDomainAccessor *domainAccessor;
  void *v4;
  NPSDomainAccessor *v5;
  NPSDomainAccessor *v6;
  id v7;

  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    -[WRReplyStoreInfo defaultsDomain](self->_info, "defaultsDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (NPSDomainAccessor *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", v4);
      v6 = self->_domainAccessor;
      self->_domainAccessor = v5;

      v7 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
    }

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (id)npsManager
{
  NPSManager *npsManager;
  NPSManager *v4;
  NPSManager *v5;

  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v4 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    v5 = self->_npsManager;
    self->_npsManager = v4;

    npsManager = self->_npsManager;
  }
  return npsManager;
}

- (id)repliesForLanguage:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSArray *v6;
  void *v7;
  _BOOL4 v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSArray *v19;
  NSArray *cachedLocalizedReplies;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[16];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WRCannedRepliesStore invalidateCachesIfNeededForLanguage:](self, "invalidateCachesIfNeededForLanguage:", v4);
  v22 = v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_cachedLocalizedReplies)
  {
    -[WRCannedRepliesStore loadCannedRepliesIfNeeded](self, "loadCannedRepliesIfNeeded");
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", -[NSArray count](self->_cannedReplies, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WRCannedRepliesStore usesFormalReplies](self, "usesFormalReplies");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_cannedReplies;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v10)
      goto LABEL_20;
    v11 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "defaultReplyKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[WRCannedRepliesStore localizedDefaultReply:](self, "localizedDefaultReply:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          if (!v8)
            continue;
          -[WRCannedRepliesStore localizedFormalDefaultReply:](self, "localizedFormalDefaultReply:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);
        }
        else
        {
          objc_msgSend(v13, "defaultReplyText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER"));

          if (v18)
            objc_msgSend(v13, "defaultReplyText");
          else
            objc_msgSend(v13, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);
        }

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v10)
      {
LABEL_20:

        objc_msgSend(v7, "array");
        v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
        cachedLocalizedReplies = self->_cachedLocalizedReplies;
        self->_cachedLocalizedReplies = v19;

        v6 = self->_cachedLocalizedReplies;
        goto LABEL_21;
      }
    }
  }
  v5 = self->_log;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
    -[WRCannedRepliesStore repliesForLanguage:].cold.1((uint64_t)v28, -[NSArray count](self->_cachedLocalizedReplies, "count"), v5);

  v6 = self->_cachedLocalizedReplies;
LABEL_21:
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v6;
}

- (id)keyForDefaultReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WRCannedRepliesStore usesFormalReplies](self, "usesFormalReplies");
  -[NSRecursiveLock lock](self->_lock, "lock");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_cannedReplies;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "defaultReplyKey", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[WRCannedRepliesStore localizedDefaultReply:](self, "localizedDefaultReply:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
          {
            objc_msgSend(v10, "defaultReplyKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
          if (v5)
          {
            -[WRCannedRepliesStore localizedFormalDefaultReply:](self, "localizedFormalDefaultReply:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v4);

            if (v15)
            {
              objc_msgSend(v10, "defaultReplyKey");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringByAppendingString:", CFSTR("_FORMAL"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_15;
            }
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v16;
}

+ (id)supportedLanguages
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.WatchReplies"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cannedReplies
{
  -[WRCannedRepliesStore invalidateCachesIfNeededForLanguage:](self, "invalidateCachesIfNeededForLanguage:", 0);
  -[WRCannedRepliesStore loadCannedRepliesIfNeeded](self, "loadCannedRepliesIfNeeded");
  -[WRCannedRepliesStore localizeDefaultRepliesIfNeeded](self, "localizeDefaultRepliesIfNeeded");
  return self->_cannedReplies;
}

- (void)setCannedReplies:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  NSObject *log;
  WRCannedRepliesStore *v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_storeStrong((id *)&self->_cannedReplies, a3);
  v22 = self;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v23 = +[WRCannedRepliesStore supportsEnhancedEditing](WRCannedRepliesStore, "supportsEnhancedEditing");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        objc_msgSend(v12, "defaultReplyText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER"));

        if (v14)
        {
          objc_msgSend(v12, "defaultReplyText");
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v18 = (__CFString *)v15;
          goto LABEL_11;
        }
        objc_msgSend(v12, "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v12, "text");
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        objc_msgSend(v12, "defaultReplyKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v12, "defaultReplyKey");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ((-[__CFString hasSuffix:](v18, "hasSuffix:", CFSTR("_FORMAL")) & 1) == 0)
          {
            if (!v23)
            {

              v18 = &stru_24E19D6B0;
            }
LABEL_11:
            objc_msgSend(v6, "addObject:", v18);
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v9 = v20;
    }
    while (v20);
  }

  log = v22->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v6;
    _os_log_impl(&dword_21DBDA000, log, OS_LOG_TYPE_DEFAULT, "saving canned replies: %{public}@", buf, 0xCu);
  }
  -[WRCannedRepliesStore saveReplies:](v22, "saveReplies:", v6);

}

- (BOOL)includeSmartReplies
{
  void *v3;
  char v4;
  char v6;

  v6 = 0;
  -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("IncludeSmartRepliesKey"), &v6);

  if (!v6)
    return -[WRReplyStoreInfo supportsSmartReplies](self->_info, "supportsSmartReplies");
  return v4;
}

- (void)setIncludeSmartReplies:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("IncludeSmartRepliesKey"));

  -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "synchronize");

  -[WRCannedRepliesStore npsManager](self, "npsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WRReplyStoreInfo defaultsDomain](self->_info, "defaultsDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("IncludeSmartRepliesKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronizeNanoDomain:keys:", v9, v10);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncludeSmartRepliesKey.changed"), 0, 0, 1u);
}

- (BOOL)supportsSmartReplies
{
  return -[WRReplyStoreInfo supportsSmartReplies](self->_info, "supportsSmartReplies");
}

- (BOOL)usesFormalReplies
{
  void *v2;
  char v3;

  WRLocalizedCategoryString(CFSTR("USES_FORMAL_REPLIES"), self->_category, self->_cachedLanguage);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)localizedDefaultReply:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "defaultReplyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WRLocalizedCategoryString(v4, self->_category, self->_cachedLanguage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedFormalDefaultReply:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "defaultReplyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("_FORMAL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WRLocalizedCategoryString(v5, self->_category, self->_cachedLanguage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadCannedRepliesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  id v13;
  WRCannedReply *v14;
  NSArray *v15;
  NSArray *cannedReplies;
  unint64_t i;
  WRCannedReply *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_cannedReplies)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    -[WRReplyStoreInfo defaultsKey](self->_info, "defaultsKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4 || !v3)
      goto LABEL_14;
    -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRReplyStoreInfo defaultsKey](self->_info, "defaultsKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WRCannedRepliesStore migrateRepliesIfNeeded:](self, "migrateRepliesIfNeeded:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8
       ? (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"))
       : 0;
    v10 = +[WRCannedRepliesStore supportsEnhancedEditing](WRCannedRepliesStore, "supportsEnhancedEditing");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __49__WRCannedRepliesStore_loadCannedRepliesIfNeeded__block_invoke;
    v20[3] = &unk_24E19D5A8;
    v20[4] = self;
    v22 = &v24;
    v23 = v10;
    v11 = v9;
    v21 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
    v12 = v21;
    v13 = v11;

    if (!v13)
    {
LABEL_14:
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"));
      for (i = 0; i < -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"); ++i)
      {
        v18 = objc_alloc_init(WRCannedReply);
        objc_msgSend(CFSTR("DEFAULT_REPLY_"), "stringByAppendingFormat:", CFSTR("%tu"), i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRCannedReply setDefaultReplyKey:](v18, "setDefaultReplyKey:", v19);

        objc_msgSend(v13, "addObject:", v18);
      }
    }
    if (objc_msgSend((id)objc_opt_class(), "supportsEnhancedEditing")
      && -[WRCannedRepliesStore supportsSmartReplies](self, "supportsSmartReplies")
      && !*((_BYTE *)v25 + 24))
    {
      v14 = objc_alloc_init(WRCannedReply);
      -[WRCannedReply setDefaultReplyText:](v14, "setDefaultReplyText:", CFSTR("SMART_REPLIES_MARKER"));
      objc_msgSend(v13, "insertObject:atIndex:", v14, 0);

    }
    v15 = (NSArray *)objc_msgSend(v13, "copy");
    cannedReplies = self->_cannedReplies;
    self->_cannedReplies = v15;

    _Block_object_dispose(&v24, 8);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

void __49__WRCannedRepliesStore_loadCannedRepliesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  WRCannedReply *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!objc_msgSend((id)objc_opt_class(), "isTinker")
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hiddenTinkerReplyKeys"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v10),
        v5,
        (v6 & 1) == 0))
  {
    v7 = objc_alloc_init(WRCannedReply);
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER")))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v8 + 24))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_BYTE *)(v8 + 24) = 1;
      -[WRCannedReply setDefaultReplyText:](v7, "setDefaultReplyText:", v10);
    }
    else if (objc_msgSend(v10, "hasPrefix:", CFSTR("DEFAULT_REPLY_")))
    {
      -[WRCannedReply setDefaultReplyKey:](v7, "setDefaultReplyKey:", v10);
    }
    else if (*(_BYTE *)(a1 + 56) || !objc_msgSend(v10, "isEqualToString:", &stru_24E19D6B0))
    {
      -[WRCannedReply setText:](v7, "setText:", v10);
    }
    else
    {
      objc_msgSend(CFSTR("DEFAULT_REPLY_"), "stringByAppendingFormat:", CFSTR("%tu"), a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WRCannedReply setDefaultReplyKey:](v7, "setDefaultReplyKey:", v9);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)localizeDefaultRepliesIfNeeded
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_didLocalizeDefaultReplies)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_cannedReplies;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v7, "defaultReplyKey", (_QWORD)v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v7, "defaultReplyKey");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            WRLocalizedCategoryString(v9, self->_category, self->_cachedLanguage);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setDefaultReplyText:", v10);

          }
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

    self->_didLocalizeDefaultReplies = 1;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock", (_QWORD)v11);
}

- (void)invalidateCachesIfNeededForLanguage:(id)a3
{
  NSArray *cachedLocalizedReplies;
  id obj;

  obj = a3;
  if (!obj)
  {
    WRDeviceLanguage();
    obj = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((objc_msgSend(obj, "isEqualToString:", self->_cachedLanguage) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cachedLanguage, obj);
    cachedLocalizedReplies = self->_cachedLocalizedReplies;
    self->_cachedLocalizedReplies = 0;

    self->_didLocalizeDefaultReplies = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)saveReplies:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = a3;
  -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[WRCannedRepliesStore saveReplies:].cold.1((uint64_t)v4, log, v7);
    -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRReplyStoreInfo defaultsKey](self->_info, "defaultsKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v4, v9);

    -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "synchronize");

    v12 = (void *)MEMORY[0x24BDBCF20];
    -[WRReplyStoreInfo defaultsKey](self->_info, "defaultsKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObjects:", v13, CFSTR("WatchRepliesVersion"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WRCannedRepliesStore npsManager](self, "npsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRReplyStoreInfo defaultsDomain](self->_info, "defaultsDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "synchronizeNanoDomain:keys:", v16, v14);

    -[WRReplyStoreInfo defaultsChangedNotificationName](self->_info, "defaultsChangedNotificationName");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v17, 0, 0, 1u);
    }

  }
}

- (id)migrateRepliesIfNeeded:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _BOOL4 v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _BOOL4 v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  WRCannedReply *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  WRCannedRepliesStore *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_didMigrationCheck)
  {
    v6 = v4;
    goto LABEL_61;
  }
  -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("WatchRepliesVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = &unk_24E19E9F0;
    objc_msgSend(v9, "setObject:forKey:", &unk_24E19E9F0, CFSTR("WatchRepliesVersion"));

  }
  v10 = objc_msgSend(v8, "unsignedIntegerValue");
  v11 = +[WRCannedRepliesStore supportsEnhancedEditing](WRCannedRepliesStore, "supportsEnhancedEditing");
  v39 = self;
  if (!v10 || v11)
  {
    if (v10)
      v18 = 0;
    else
      v18 = v11;
    if (!v18)
      goto LABEL_36;
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = objc_msgSend(v5, "count");
    if (v19 >= -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"))
    {
      v20 = v5;
    }
    else
    {
      v20 = (void *)objc_msgSend(v5, "mutableCopy");
      v21 = objc_msgSend(v20, "count");
      if (v21 < -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"))
      {
        do
        {
          objc_msgSend(v20, "addObject:", &stru_24E19D6B0);
          v22 = objc_msgSend(v20, "count");
        }
        while (v22 < -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"));
      }

    }
    v23 = (void *)objc_msgSend(v20, "mutableCopy");
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __47__WRCannedRepliesStore_migrateRepliesIfNeeded___block_invoke;
    v44[3] = &unk_24E19D5D0;
    v24 = v23;
    v45 = v24;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v44);
    if (objc_msgSend(v24, "count"))
    {
      -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", &unk_24E19EA08, CFSTR("WatchRepliesVersion"));

      -[WRCannedRepliesStore saveReplies:](self, "saveReplies:", v24);
    }
    v5 = v24;

    v12 = v5;
  }
  else
  {
    if (!objc_msgSend(v5, "count"))
      goto LABEL_36;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"));
    if (-[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"))
    {
      v13 = 0;
      do
      {
        if (v13 >= objc_msgSend(v5, "count"))
        {
          objc_msgSend(v12, "addObject:", &stru_24E19D6B0);
        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER")) & 1) == 0)
          {
            if (-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("DEFAULT_REPLY_")))
            {
              v15 = v12;
              v16 = &stru_24E19D6B0;
            }
            else
            {
              v15 = v12;
              v16 = v14;
            }
            objc_msgSend(v15, "addObject:", v16);
          }

          self = v39;
        }
        ++v13;
      }
      while (v13 < -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"));
    }
    if (objc_msgSend(v12, "count"))
    {
      -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", &unk_24E19E9F0, CFSTR("WatchRepliesVersion"));

      -[WRCannedRepliesStore saveReplies:](self, "saveReplies:", v12);
    }
  }

  v5 = v12;
LABEL_36:
  if (v10 <= 1
    && self->_category == 1
    && (-[WRCannedRepliesStore domainAccessor](self, "domainAccessor"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v26, "setObject:forKey:", &unk_24E19EA20, CFSTR("WatchRepliesVersion")),
        v26,
        objc_msgSend(v5, "count")))
  {
    v38 = v8;
    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v28 = v5;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v41 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v33, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER"), v38)
            || !objc_msgSend(v33, "hasPrefix:", CFSTR("DEFAULT_REPLY_")))
          {
            objc_msgSend(v27, "addObject:", v33);
          }
          else
          {
            v34 = objc_alloc_init(WRCannedReply);
            -[WRCannedReply setDefaultReplyKey:](v34, "setDefaultReplyKey:", v33);
            if (-[WRCannedRepliesStore usesFormalReplies](self, "usesFormalReplies"))
              -[WRCannedRepliesStore localizedFormalDefaultReply:](self, "localizedFormalDefaultReply:", v34);
            else
              -[WRCannedRepliesStore localizedDefaultReply:](self, "localizedDefaultReply:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v35, "isEqualToString:", v33) & 1) == 0)
              objc_msgSend(v27, "addObject:", v33);

            self = v39;
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v30);
    }

    if (objc_msgSend(v27, "count"))
    {
      v36 = objc_msgSend(v27, "count");
      if (v36 != objc_msgSend(v28, "count"))
        -[WRCannedRepliesStore saveReplies:](self, "saveReplies:", v27);
    }

    v8 = v38;
  }
  else
  {
    v27 = v5;
  }
  self->_didMigrationCheck = 1;
  v6 = v27;

LABEL_61:
  return v6;
}

void __47__WRCannedRepliesStore_migrateRepliesIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(CFSTR("DEFAULT_REPLY_"), "stringByAppendingFormat:", CFSTR("%tu"), a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

  }
}

- (void)handleStoreChange
{
  NSObject *log;
  void *v4;
  id v5;
  NSString *cachedLanguage;
  NSArray *cachedLocalizedReplies;
  NSArray *cannedReplies;
  void *v9;
  void *v10;
  uint8_t v11[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21DBDA000, log, OS_LOG_TYPE_DEFAULT, "canned replies did change", v11, 2u);
  }
  -[WRCannedRepliesStore domainAccessor](self, "domainAccessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "synchronize");

  -[NSRecursiveLock lock](self->_lock, "lock");
  cachedLanguage = self->_cachedLanguage;
  self->_cachedLanguage = 0;

  cachedLocalizedReplies = self->_cachedLocalizedReplies;
  self->_cachedLocalizedReplies = 0;

  cannedReplies = self->_cannedReplies;
  self->_cannedReplies = 0;

  self->_didMigrationCheck = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WRReplyStoreInfo defaultsChangedNotificationName](self->_info, "defaultsChangedNotificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", v10, self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_cannedReplies, 0);
  objc_storeStrong((id *)&self->_cachedLocalizedReplies, 0);
  objc_storeStrong((id *)&self->_cachedLanguage, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)repliesForLanguage:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_0(&dword_21DBDA000, a3, (uint64_t)a3, "using cached replies: (count: %{public}lu)", (uint8_t *)a1);
}

- (void)saveReplies:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_21DBDA000, a2, a3, "saving canned replies: %{public}@", (uint8_t *)&v3);
}

@end
