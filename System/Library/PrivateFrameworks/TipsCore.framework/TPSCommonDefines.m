@implementation TPSCommonDefines

- (NSDate)lastMajorVersionUpdateDate
{
  void *v3;

  +[TPSDefaultsManager lastMajorVersionUpdateDate](TPSDefaultsManager, "lastMajorVersionUpdateDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSUserDefaults objectForKey:](self->_appGroupDefaults, "objectForKey:", CFSTR("TPSLastMajorVersionUpdateDate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v3;
}

- (id)collectionIdentifierToUseForCollectionIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v21 = 0;
  v22 = (id *)&v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  +[TPSCommonDefines softwareWelcomeCollectionIdentifier](TPSCommonDefines, "softwareWelcomeCollectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines checklistCollectionIdentifier](TPSCommonDefines, "checklistCollectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__TPSCommonDefines_collectionIdentifierToUseForCollectionIdentifiers___block_invoke;
  v11[3] = &unk_1E395CD00;
  v15 = &v17;
  v6 = v4;
  v12 = v6;
  v16 = &v21;
  v7 = v5;
  v13 = v7;
  v8 = v3;
  v14 = v8;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  if (*((_BYTE *)v18 + 24))
    objc_storeStrong(v22 + 5, v4);
  v9 = v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

+ (id)checklistCollectionIdentifier
{
  return CFSTR("Checklist");
}

+ (id)softwareWelcomeCollectionIdentifier
{
  return CFSTR("WhatsNewInIOS");
}

+ (BOOL)isInternalDevice
{
  return +[TPSDefaultsManager isInternalDevice](TPSDefaultsManager, "isInternalDevice");
}

- (NSString)language
{
  return self->_language;
}

+ (id)clientBundleIdentifier
{
  return CFSTR("com.apple.tips");
}

+ (BOOL)isPadUI
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

+ (BOOL)isPhoneUI
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

+ (id)deviceClass
{
  if (deviceClass_onceToken != -1)
    dispatch_once(&deviceClass_onceToken, &__block_literal_global_69);
  return (id)deviceClass_deviceClass;
}

void __43__TPSCommonDefines_syncCollectionStatusMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "collectionStatusMap");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)callerIsTipsdWithSource:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke;
  v9[3] = &unk_1E395CC98;
  v10 = v4;
  v11 = a1;
  v5 = callerIsTipsdWithSource__predicate;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&callerIsTipsdWithSource__predicate, v9);
  v7 = callerIsTipsdWithSource__gCallerIsTipsd;

  return v7;
}

- (void)syncCollectionStatusMap
{
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  v10 = 0;
  -[TPSCommonDefines syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__TPSCommonDefines_syncCollectionStatusMap__block_invoke;
  v4[3] = &unk_1E395B128;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  +[TPSSecureArchivingUtilities archivedDataWithRootObject:forKey:userDefaults:](TPSSecureArchivingUtilities, "archivedDataWithRootObject:forKey:userDefaults:", v6[5], CFSTR("collectionStatusMap"), self->_appGroupDefaults);
  _Block_object_dispose(&v5, 8);

}

- (void)updateCollectionStatus:(unint64_t)a3 collections:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!objc_msgSend(v6, "count"))
    goto LABEL_27;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v8)
  {

    goto LABEL_27;
  }
  v9 = v8;
  v19 = v6;
  v20 = 0;
  v10 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
      -[TPSCommonDefines dateForCollectionIdentifier:dateType:](self, "dateForCollectionIdentifier:dateType:", v12, a3, v19);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        goto LABEL_22;
      }
      -[TPSCommonDefines collectionStatusForCollectionIdentifier:](self, "collectionStatusForCollectionIdentifier:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3 == 2)
        {
          objc_msgSend(v15, "featuredDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(v15, "setFeaturedDate:", v14);
            goto LABEL_20;
          }
        }
        else
        {
          if (a3 != 1)
          {
            if (a3)
              goto LABEL_21;
            objc_msgSend(v15, "activatedDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              goto LABEL_21;
            objc_msgSend(v15, "setActivatedDate:", v14);
            goto LABEL_20;
          }
          objc_msgSend(v15, "firstViewedDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v15, "setFirstViewedDate:", v14);
LABEL_20:
            v20 = 1;
          }
        }
      }
      else
      {
        v14 = 0;
      }
LABEL_21:

LABEL_22:
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v9);

  v6 = v19;
  if ((v20 & 1) != 0)
    -[TPSCommonDefines syncCollectionStatusMap](self, "syncCollectionStatusMap");
LABEL_27:

}

- (id)dateForCollectionIdentifier:(id)a3 dateType:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[TPSCommonDefines collectionStatusForCollectionIdentifier:](self, "collectionStatusForCollectionIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    switch(a4)
    {
      case 2uLL:
        objc_msgSend(v5, "featuredDate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 1uLL:
        objc_msgSend(v5, "firstViewedDate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 0uLL:
        objc_msgSend(v5, "activatedDate");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v8 = (void *)v7;
        goto LABEL_10;
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

void __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionStatusMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  TPSCollectionStatus *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "collectionStatusMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      v6 = -[TPSCollectionStatus initWithIdentifier:]([TPSCollectionStatus alloc], "initWithIdentifier:", *(_QWORD *)(a1 + 40));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      objc_msgSend(*(id *)(a1 + 32), "syncQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke_2;
      block[3] = &unk_1E395C950;
      v10 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v11 = v10;
      v12 = *(_QWORD *)(a1 + 48);
      v14 = v11;
      v15 = v12;
      dispatch_async(v9, block);

    }
  }
}

- (NSMutableDictionary)collectionStatusMap
{
  NSMutableDictionary *collectionStatusMap;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;

  collectionStatusMap = self->_collectionStatusMap;
  if (!collectionStatusMap)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSSecureArchivingUtilities unarchivedObjectOfClasses:forKey:userDefaults:](TPSSecureArchivingUtilities, "unarchivedObjectOfClasses:forKey:userDefaults:", v8, CFSTR("collectionStatusMap"), self->_appGroupDefaults);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    v11 = self->_collectionStatusMap;
    self->_collectionStatusMap = v10;

    collectionStatusMap = self->_collectionStatusMap;
  }
  return collectionStatusMap;
}

- (id)collectionStatusForCollectionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[TPSCommonDefines syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke;
  block[3] = &unk_1E395C0B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (NSString)majorVersion
{
  return self->_majorVersion;
}

uint64_t __42__TPSCommonDefines_reloadAppGroupDefaults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCollectionStatusMap:", 0);
}

- (void)setCollectionStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionStatusMap, a3);
}

void __34__TPSCommonDefines_sharedInstance__block_invoke()
{
  TPSCommonDefines *v0;
  void *v1;

  v0 = objc_alloc_init(TPSCommonDefines);
  v1 = (void *)sharedInstance_gTPSCommonDefines;
  sharedInstance_gTPSCommonDefines = (uint64_t)v0;

}

+ (BOOL)hardwareChanged
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MGCopyAnswer();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(v2, "objectForKey:", CFSTR("CurrentProductHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("CurrentProductHash"));

    objc_msgSend(v2, "synchronize");
  }

  return v6 != v4;
}

- (void)clearDataCache
{
  void *v3;
  void *v4;

  +[TPSDataCacheController removeAllDataCache](TPSDataCacheController, "removeAllDataCache");
  +[TPSJSONCacheController sharedInstance](TPSJSONCacheController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDataCache");

  +[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllDataCache");

  -[NSUserDefaults removeObjectForKey:](self->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSDataCacheIdentifier"));
  -[NSUserDefaults removeObjectForKey:](self->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSAssetCacheIdentifier"));
  -[NSUserDefaults removeObjectForKey:](self->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSJSONCacheIdentifier"));
  -[NSUserDefaults removeObjectForKey:](self->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSStringCacheIdentifier"));
  -[NSUserDefaults synchronize](self->_appGroupDefaults, "synchronize");
}

+ (id)appGroupIdentifier
{
  return CFSTR("group.com.apple.tips");
}

- (BOOL)tipsAccessAllowed
{
  return self->_tipsAccessAllowed;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_4 != -1)
    dispatch_once(&sharedInstance_predicate_4, &__block_literal_global_13);
  return (id)sharedInstance_gTPSCommonDefines;
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (id)reloadAppGroupDefaults
{
  void *v3;
  id v4;
  NSUserDefaults *v5;
  NSUserDefaults *appGroupDefaults;
  NSObject *v7;
  _QWORD block[5];

  if (!self->_tipsAccessAllowed)
    return 0;
  if (!self->_appGroupDefaults)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.tips"));

    v5 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.tips"));
    appGroupDefaults = self->_appGroupDefaults;
    self->_appGroupDefaults = v5;

  }
  if (-[TPSCommonDefines hasLocaleChanged](self, "hasLocaleChanged"))
    -[TPSCommonDefines clearDataCache](self, "clearDataCache");
  -[TPSCommonDefines syncQueue](self, "syncQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSCommonDefines_reloadAppGroupDefaults__block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_async(v7, block);

  -[TPSTipStatusController setAppGroupDefaults:](self->_tipStatusController, "setAppGroupDefaults:", self->_appGroupDefaults);
  return self->_appGroupDefaults;
}

- (BOOL)hasLocaleChanged
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[NSUserDefaults objectForKey:](self->_appGroupDefaults, "objectForKey:", CFSTR("lastViewedLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "isEqualToString:", v5);
  if ((v6 & 1) == 0)
  {
    -[NSUserDefaults setObject:forKey:](self->_appGroupDefaults, "setObject:forKey:", v5, CFSTR("lastViewedLocale"));
    -[NSUserDefaults synchronize](self->_appGroupDefaults, "synchronize");
  }

  return v6 ^ 1;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TPSCommonDefines)init
{
  TPSCommonDefines *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *syncQueue;
  __SecTask *v6;
  __SecTask *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *majorVersion;
  uint64_t v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSUserDefaults *appGroupDefaults;
  TPSTipStatusController *v22;
  TPSTipStatusController *tipStatusController;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t maxVersion;
  uint64_t v29;
  NSMutableDictionary *appBundleIDMap;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  NSObject *v37;
  NSUserDefaults *v38;
  void *v39;
  NSUserDefaults *v40;
  void *v41;
  objc_super v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)TPSCommonDefines;
  v2 = -[TPSCommonDefines init](&v43, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.TipsCore.TPSCommonDefine", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    v6 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v6)
    {
      v7 = v6;
      v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.private.tips.allow"), 0);
      if (v8)
      {
        v9 = v8;
        v10 = CFGetTypeID(v8);
        if (v10 == CFBooleanGetTypeID())
          v2->_tipsAccessAllowed = CFBooleanGetValue(v9) != 0;
        CFRelease(v9);
      }
      CFRelease(v7);
    }
    v2->_maxVersion = +[TPSCommonDefines maxRequestVersion](TPSCommonDefines, "maxRequestVersion");
    v11 = (void *)MGCopyAnswer();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    majorVersion = v2->_majorVersion;
    v2->_majorVersion = (NSString *)v13;

    if (-[NSString intValue](v2->_majorVersion, "intValue") > v2->_maxVersion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v2->_maxVersion);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v2->_majorVersion;
      v2->_majorVersion = (NSString *)v15;

    }
    if (!v2->_tipsAccessAllowed)
      goto LABEL_32;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.tips"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[TPSLogger data](TPSLogger, "data");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v18;
      _os_log_impl(&dword_19A906000, v19, OS_LOG_TYPE_DEFAULT, "App group path %@", buf, 0xCu);
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.tips"));
    appGroupDefaults = v2->_appGroupDefaults;
    v2->_appGroupDefaults = (NSUserDefaults *)v20;

    v22 = -[TPSTipStatusController initWithAppGroupDefaults:]([TPSTipStatusController alloc], "initWithAppGroupDefaults:", v2->_appGroupDefaults);
    tipStatusController = v2->_tipStatusController;
    v2->_tipStatusController = v22;

    v24 = (void *)MGCopyAnswer();
    objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    if (v27 >= v2->_maxVersion)
      maxVersion = v2->_maxVersion;
    else
      maxVersion = v27;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    appBundleIDMap = v2->_appBundleIDMap;
    v2->_appBundleIDMap = (NSMutableDictionary *)v29;

    -[TPSCommonDefines reloadModelInformation](v2, "reloadModelInformation");
    +[TPSDefaultsManager assetRatioIdentifier](TPSDefaultsManager, "assetRatioIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = objc_msgSend(v31, "integerValue");
      if (v33 <= 1)
        v34 = v33;
      else
        v34 = 0;
    }
    else
    {
      if (!MGGetBoolAnswer())
      {
        v2->_assetRatioType = 0;
        goto LABEL_23;
      }
      v34 = 1;
    }
    v2->_assetRatioType = v34;
LABEL_23:
    v35 = -[NSUserDefaults integerForKey:](v2->_appGroupDefaults, "integerForKey:", CFSTR("appGroupLastCleanupMajorVersion"));
    v36 = +[TPSDefaultsManager resetDataCache](TPSDefaultsManager, "resetDataCache");
    if (v35 != maxVersion || v36)
    {
      +[TPSLogger data](TPSLogger, "data");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v45 = v35;
        v46 = 2048;
        v47 = maxVersion;
        _os_log_impl(&dword_19A906000, v37, OS_LOG_TYPE_DEFAULT, "Clean up app group defaults as major version changed from version %zd to %zd", buf, 0x16u);
      }

      v38 = v2->_appGroupDefaults;
      objc_msgSend(MEMORY[0x1E0C99DC8], "tps_userLanguageCode");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](v38, "setObject:forKey:", v39, CFSTR("TPSUserLanguage"));

      v40 = v2->_appGroupDefaults;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", maxVersion);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](v40, "setObject:forKey:", v41, CFSTR("appGroupLastCleanupMajorVersion"));

      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("collectionStatusMap"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSLaunchedFromWidgetKey"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TipsUserType"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSWidgetDocument"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSWidgetTip"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("specialTargetCacheMap"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSViewedTipIdentifiers"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSImageCacheIdentifier"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSVideoCacheIdentifier"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSFileCacheIdentifier"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSExperimentCamp"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("TPSValidTipIdentifiers"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("collectionActivationMap"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("specialTargetCache"));
      -[NSUserDefaults removeObjectForKey:](v2->_appGroupDefaults, "removeObjectForKey:", CFSTR("appGroupLastWipeMajorVersion"));
      -[NSUserDefaults synchronize](v2->_appGroupDefaults, "synchronize");
    }
    else if (!-[TPSCommonDefines hasLocaleChanged](v2, "hasLocaleChanged"))
    {
      goto LABEL_31;
    }
    -[TPSCommonDefines clearDataCache](v2, "clearDataCache");
LABEL_31:

LABEL_32:
  }
  return v2;
}

- (void)reloadModelInformation
{
  void *v3;
  NSString *v4;
  NSString *model;
  NSString *v6;
  NSString *v7;
  id v8;

  +[TPSDefaultsManager deviceModel](TPSDefaultsManager, "deviceModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E39608B8);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    model = self->_model;
    self->_model = v4;

    v3 = v8;
  }
  if (!self->_model)
  {
    v6 = (NSString *)MGCopyAnswer();
    v7 = self->_model;
    self->_model = v6;

    v3 = v8;
  }

}

- (void)activatedCollections:(id)a3
{
  -[TPSCommonDefines updateCollectionStatus:collections:](self, "updateCollectionStatus:collections:", 0, a3);
}

+ (int)maxRequestVersion
{
  return 18;
}

void __70__TPSCommonDefines_collectionIdentifierToUseForCollectionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  id v8;
  void *v9;

  v4 = a2;
  v5 = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    || (v8 = v4, v6 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)), v5 = v8, !v6))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v9 = v5;
      if (!objc_msgSend(0, "isEqualToString:", *(_QWORD *)(a1 + 40))
        || (v7 = objc_msgSend(*(id *)(a1 + 48), "count"), v5 = v9, v7 <= 1))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
        v5 = v9;
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

+ (id)productVersion
{
  return (id)MGCopyAnswer();
}

+ (id)deviceName
{
  return (id)MGCopyAnswer();
}

- (int64_t)userType
{
  if (userType_onceToken != -1)
    dispatch_once(&userType_onceToken, &__block_literal_global_157);
  return userType_gUserType;
}

- (NSUserDefaults)appGroupDefaults
{
  return self->_appGroupDefaults;
}

void __31__TPSCommonDefines_deviceClass__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = MGCopyAnswer();
  v1 = (void *)deviceClass_deviceClass;
  deviceClass_deviceClass = v0;

  if (objc_msgSend((id)deviceClass_deviceClass, "isEqualToString:", CFSTR("RealityDevice")))
  {
    v2 = (void *)deviceClass_deviceClass;
    deviceClass_deviceClass = (uint64_t)CFSTR("apple-vision-pro");

  }
}

+ (id)tipsCoreFrameworkBundle
{
  if (tipsCoreFrameworkBundle_predicate != -1)
    dispatch_once(&tipsCoreFrameworkBundle_predicate, &__block_literal_global_10);
  return (id)tipsCoreFrameworkBundle_gTipsCoreFrameworkBundle;
}

void __43__TPSCommonDefines_tipsCoreFrameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TipsCore"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tipsCoreFrameworkBundle_gTipsCoreFrameworkBundle;
  tipsCoreFrameworkBundle_gTipsCoreFrameworkBundle = v0;

}

+ (id)tipsUIFrameworkBundle
{
  if (tipsUIFrameworkBundle_predicate != -1)
    dispatch_once(&tipsUIFrameworkBundle_predicate, &__block_literal_global_14);
  return (id)tipsUIFrameworkBundle_gTipsUIFrameworkBundle;
}

void __41__TPSCommonDefines_tipsUIFrameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TipsUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tipsUIFrameworkBundle_gTipsUIFrameworkBundle;
  tipsUIFrameworkBundle_gTipsUIFrameworkBundle = v0;

}

+ (BOOL)isAppValidWithBundleIdentifier:(id)a3
{
  return a3 && sub_19A97ABD4(TPSCommonDefines, "isAppValidWithBundleIdentifier:");
}

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer();
}

+ (BOOL)isMacUI
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Mac"));

  return v3;
}

+ (BOOL)isVisionUI
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("apple-vision-pro"));

  return v3;
}

+ (BOOL)isGreenTeaDevice
{
  if (isGreenTeaDevice_onceToken != -1)
    dispatch_once(&isGreenTeaDevice_onceToken, &__block_literal_global_30);
  return isGreenTeaDevice_deviceIsGreenTea;
}

uint64_t __36__TPSCommonDefines_isGreenTeaDevice__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isGreenTeaDevice_deviceIsGreenTea = result;
  return result;
}

+ (id)osBuild
{
  if (osBuild_onceToken != -1)
    dispatch_once(&osBuild_onceToken, &__block_literal_global_33);
  return (id)osBuild_gOSBuild;
}

void __27__TPSCommonDefines_osBuild__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = MGCopyAnswer();
  v2 = (id)v0;
  if (v0)
  {
    objc_msgSend(CFSTR("iOS-"), "stringByAppendingString:", v0);
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)osBuild_gOSBuild;
  osBuild_gOSBuild = v0;

}

+ (id)deviceFamily
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E39608B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)deviceMarketingName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(" ("));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringToIndex:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  return v2;
}

+ (id)notificationBundleIdentifier
{
  return CFSTR("com.apple.tips");
}

void __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;

  objc_msgSend(*(id *)(a1 + 40), "mainBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.tipsd"));
  callerIsTipsdWithSource__gCallerIsTipsd = v3;
  +[TPSLogger default](TPSLogger, "default");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_1(a1, v4);
  }
  else if (v5)
  {
    __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_2(a1, (uint64_t)v2, v4);
  }

}

+ (BOOL)isSeniorUser
{
  if (isSeniorUser_predicate != -1)
    dispatch_once(&isSeniorUser_predicate, &__block_literal_global_59_0);
  return isSeniorUser_kIsSeniorUser;
}

void __32__TPSCommonDefines_isSeniorUser__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryAuthKitAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSeniorUser_kIsSeniorUser = objc_msgSend(v1, "userIsSeniorForAccount:", v0);

}

+ (BOOL)isChecklistCollectionWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[TPSCommonDefines checklistCollectionIdentifier](TPSCommonDefines, "checklistCollectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (BOOL)isSavedTipsCollectionIdentifier:(id)a3
{
  return objc_msgSend(CFSTR("SavedTips"), "isEqualToString:", a3);
}

+ (BOOL)supportsFaceID
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportsUserGuide
{
  return 1;
}

+ (BOOL)supportsCloudDeviceUserGuide
{
  return 1;
}

+ (int)buttonType
{
  return MGGetSInt32Answer();
}

+ (id)deviceGuideIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)deviceSymbol
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "deviceGuideIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isPadUI") && (objc_msgSend(a1, "supportsFaceID") & 1) == 0)
  {
    v6 = objc_msgSend(a1, "buttonType");
    if (v6 < 2)
    {
      v7 = CFSTR(".gen1");
LABEL_7:
      objc_msgSend(v5, "appendString:", v7);
      return v5;
    }
    if (v6 == 2)
    {
      v7 = CFSTR(".gen2");
      goto LABEL_7;
    }
  }
  return v5;
}

+ (id)hardwareWelcomeCollectionIdentifier
{
  return CFSTR("WelcomeToIOS");
}

+ (id)switcherWelcomeCollectionIdentifier
{
  return CFSTR("WelcomeIOSSwitcher");
}

- (NSString)userLanguage
{
  NSString *userLanguage;
  NSString *v4;
  NSString *v5;

  userLanguage = self->_userLanguage;
  if (!userLanguage)
  {
    -[NSUserDefaults stringForKey:](self->_appGroupDefaults, "stringForKey:", CFSTR("TPSUserLanguage"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_userLanguage;
    self->_userLanguage = v4;

    userLanguage = self->_userLanguage;
  }
  return userLanguage;
}

- (void)setUserLanguage:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_userLanguage, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_userLanguage, a3);
    -[NSUserDefaults setObject:forKey:](self->_appGroupDefaults, "setObject:forKey:", self->_userLanguage, CFSTR("TPSUserLanguage"));
    -[NSUserDefaults synchronize](self->_appGroupDefaults, "synchronize");
  }

}

- (void)notifiedCollection:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (a3)
  {
    -[TPSCommonDefines collectionStatusForCollectionIdentifier:](self, "collectionStatusForCollectionIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      v6 = objc_msgSend(v4, "canNotify");
      v5 = v7;
      if (v6)
      {
        objc_msgSend(v7, "setCanNotify:", 0);
        -[TPSCommonDefines syncCollectionStatusMap](self, "syncCollectionStatusMap");
        v5 = v7;
      }
    }

  }
}

- (void)featuredCollection:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TPSCommonDefines updateCollectionStatus:collections:](self, "updateCollectionStatus:collections:", 2, v4);

  }
}

- (void)viewedCollection:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TPSCommonDefines updateCollectionStatus:collections:](self, "updateCollectionStatus:collections:", 1, v4);

  }
}

- (void)activatedCollection:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TPSCommonDefines updateCollectionStatus:collections:](self, "updateCollectionStatus:collections:", 0, v4);

  }
}

- (void)resetCollectionStatusMap
{
  -[NSUserDefaults removeObjectForKey:](self->_appGroupDefaults, "removeObjectForKey:", CFSTR("collectionStatusMap"));
  -[NSUserDefaults synchronize](self->_appGroupDefaults, "synchronize");
}

- (id)activateDateForCollectionIdentifier:(id)a3
{
  return -[TPSCommonDefines dateForCollectionIdentifier:dateType:](self, "dateForCollectionIdentifier:dateType:", a3, 0);
}

- (id)appBundleIDForInstalledAppWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appBundleIDMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("*")) & 1) == 0 && objc_msgSend(v4, "length"))
    {
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
      {
        v6 = v4;
      }
      else
      {
        objc_msgSend(CFSTR("com.apple."), "stringByAppendingString:", v4);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v6;
      if (objc_msgSend((id)objc_opt_class(), "isAppValidWithBundleIdentifier:", v6))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appBundleIDMap, "setObject:forKeyedSubscript:", v5, v4);
        goto LABEL_11;
      }

    }
    v5 = 0;
  }
LABEL_11:

  return v5;
}

void __28__TPSCommonDefines_userType__block_invoke()
{
  unint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = +[TPSUserTypeChecker userTypeOverride](TPSUserTypeChecker, "userTypeOverride");
  if (v0 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "appGroupDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "objectForKey:", CFSTR("TipsUserType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3 || (v0 = objc_msgSend(v3, "integerValue"), v0 >= 3))
    {
      v0 = +[TPSUserTypeChecker userType](TPSUserTypeChecker, "userType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("TipsUserType"));

      objc_msgSend(v2, "synchronize");
    }

  }
  userType_gUserType = v0;
}

- (id)collectionIdentifierForCurrentUserType
{
  int64_t v2;
  void *v3;

  v2 = -[TPSCommonDefines userType](self, "userType");
  if (v2 == 2)
  {
    +[TPSCommonDefines switcherWelcomeCollectionIdentifier](TPSCommonDefines, "switcherWelcomeCollectionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
      +[TPSCommonDefines softwareWelcomeCollectionIdentifier](TPSCommonDefines, "softwareWelcomeCollectionIdentifier");
    else
      +[TPSCommonDefines hardwareWelcomeCollectionIdentifier](TPSCommonDefines, "hardwareWelcomeCollectionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)daysSinceLastMajorVersionUpdate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[TPSCommonDefines lastMajorVersionUpdateDate](self, "lastMajorVersionUpdateDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:toDate:options:", 16, v2, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "day");
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)setLastMajorVersionUpdateDate:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_appGroupDefaults, "setObject:forKey:", a3, CFSTR("TPSLastMajorVersionUpdateDate"));
}

- (id)archivedTipStatuses
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  id v22;
  id obj;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_tipStatusArchivalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C999D0];
    v36[0] = *MEMORY[0x1E0C99A90];
    v36[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v2;
    objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, v5, 4, &__block_literal_global_164);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v26 = 0;
          objc_msgSend(v12, "getResourceValue:forKey:error:", &v26, v4, 0);
          v13 = v26;
          if ((objc_msgSend(v13, "BOOLValue") & 1) == 0)
          {
            v25 = v9;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v12, 1, &v25);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v25;

            if (v14)
            {
              v16 = (void *)MEMORY[0x1E0CB3710];
              v17 = objc_opt_class();
              v24 = v15;
              objc_msgSend(v16, "unarchivedObjectOfClass:fromData:error:", v17, v14, &v24);
              v18 = objc_claimAutoreleasedReturnValue();
              v9 = v24;

              if (v18)
              {
                objc_msgSend(v22, "addObject:", v18);
              }
              else
              {
                +[TPSLogger default](TPSLogger, "default");
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  -[TPSCommonDefines archivedTipStatuses].cold.1(v33, v12, &v34, v19);

              }
            }
            else
            {
              +[TPSLogger default](TPSLogger, "default");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v15;
                _os_log_error_impl(&dword_19A906000, v18, OS_LOG_TYPE_ERROR, "Failed to unarchive tip status. Error: %@", buf, 0xCu);
              }
              v9 = v15;
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v2 = v21;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t __39__TPSCommonDefines_archivedTipStatuses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "code") != 260)
  {
    +[TPSLogger default](TPSLogger, "default");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __39__TPSCommonDefines_archivedTipStatuses__block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);

  }
  return 1;
}

- (void)deleteTipStatusArchivalDirectory
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A906000, a2, OS_LOG_TYPE_ERROR, "Failed to remove item with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_2();
}

+ (id)_tipStatusArchivalURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.tips"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Archived"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mainBundleIdentifier
{
  if (mainBundleIdentifier_onceToken != -1)
    dispatch_once(&mainBundleIdentifier_onceToken, &__block_literal_global_171);
  return (id)mainBundleIdentifier_gMainBundleIdentifier;
}

void __40__TPSCommonDefines_mainBundleIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  __CFBundle *MainBundle;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v0;
  if (v0)
  {
    objc_msgSend(v0, "bundleIdentifier");
    v1 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v3 = (void *)mainBundleIdentifier_gMainBundleIdentifier;
    mainBundleIdentifier_gMainBundleIdentifier = v1;

    goto LABEL_6;
  }
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetValueForInfoDictionaryKey(MainBundle, (CFStringRef)*MEMORY[0x1E0C9AE78]);
    v1 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (int)maxVersion
{
  return self->_maxVersion;
}

- (void)setMaxVersion:(int)a3
{
  self->_maxVersion = a3;
}

- (BOOL)supportsUIApplication
{
  return self->_supportsUIApplication;
}

- (void)setSupportsUIApplication:(BOOL)a3
{
  self->_supportsUIApplication = a3;
}

- (void)setMajorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_majorVersion, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSMutableDictionary)appBundleIDMap
{
  return self->_appBundleIDMap;
}

- (void)setAppBundleIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIDMap, a3);
}

- (int64_t)assetRatioType
{
  return self->_assetRatioType;
}

- (void)setTipStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_tipStatusController, a3);
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_appBundleIDMap, 0);
  objc_storeStrong((id *)&self->_collectionStatusMap, 0);
  objc_storeStrong((id *)&self->_appGroupDefaults, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_majorVersion, 0);
  objc_storeStrong((id *)&self->_userLanguage, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
}

+ (BOOL)isAppRestrictedWithBundleIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v8;
  id v9;
  unsigned __int8 v10;

  v3 = sub_19A990D58();
  v5 = v4;
  objc_allocWithZone(MEMORY[0x1E0CA5870]);
  swift_bridgeObjectRetain();
  v6 = sub_19A90A1A8(v3, v5, 1);
  v8 = v6;
  if (v6)
  {
    v9 = objc_msgSend(v6, sel_applicationState);
    v10 = objc_msgSend(v9, sel_isRestricted);
    swift_bridgeObjectRelease();

    return v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

+ (BOOL)isRecordValid:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_applicationState);
  if ((objc_msgSend(v4, sel_isRestricted) & 1) != 0)
  {
    v5 = 0;
  }
  else if (objc_msgSend(v4, sel_isInstalled))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, sel_isPlaceholder);
  }

  return v5;
}

void __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19A906000, a2, OS_LOG_TYPE_DEBUG, "%@: Caller is tipsd.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_0_2();
}

void __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_19A906000, log, OS_LOG_TYPE_DEBUG, "%@: Caller is not tipsd. Caller is: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0_2();
}

- (void)archivedTipStatuses
{
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_19A906000, a4, OS_LOG_TYPE_DEBUG, "Skipping unrecognized archive: %@", a1, 0xCu);

}

void __39__TPSCommonDefines_archivedTipStatuses__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19A906000, log, OS_LOG_TYPE_ERROR, "Error enumerating archived tip status directory. URL: %@ Error: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0_2();
}

@end
