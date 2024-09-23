@implementation RTTSettings

void __40__RTTSettings__registerForNotification___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("RTTSettings", 0);
  v1 = (void *)_registerForNotification__RegistrationQueue;
  _registerForNotification__RegistrationQueue = (uint64_t)v0;

}

void __29__RTTSettings_sharedInstance__block_invoke()
{
  RTTSettings *v0;
  void *v1;

  v0 = objc_alloc_init(RTTSettings);
  v1 = (void *)sharedInstance_Settings;
  sharedInstance_Settings = (uint64_t)v0;

}

- (RTTSettings)init
{
  RTTSettings *v2;
  NSLock *v3;
  NSLock *synchronizeDomainsLock;
  NSMutableSet *v5;
  NSMutableSet *registeredNotifications;
  NSMutableSet *v7;
  NSMutableSet *synchronizePreferences;
  NSMutableDictionary *v9;
  NSMutableDictionary *updateBlocks;
  NSMutableDictionary *v11;
  NSMutableDictionary *cachedSettings;
  dispatch_queue_t v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RTTSettings;
  v2 = -[RTTSettings init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    synchronizeDomainsLock = v2->_synchronizeDomainsLock;
    v2->_synchronizeDomainsLock = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    registeredNotifications = v2->_registeredNotifications;
    v2->_registeredNotifications = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    synchronizePreferences = v2->_synchronizePreferences;
    v2->_synchronizePreferences = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    updateBlocks = v2->_updateBlocks;
    v2->_updateBlocks = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedSettings = v2->_cachedSettings;
    v2->_cachedSettings = v11;

    v13 = dispatch_queue_create("rtt-nano-sync-queue", 0);
    -[RTTSettings setNanoSynchronizeQueue:](v2, "setNanoSynchronizeQueue:", v13);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)AccessibilitySettingsChangedOnCompanion, CFSTR("NanoRTTDefaultsChanged"), 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)setNanoSynchronizeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nanoSynchronizeQueue, a3);
}

+ (void)initialize
{
  id v2;

  v2 = +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  if ((objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard") & 1) != 0
    || objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsPreferences"))
  {
    objc_msgSend(&unk_24D209DD0, "enumerateObjectsUsingBlock:", &__block_literal_global_6);
  }
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXRTTSettingsListenerHelper *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[RTTSettings updateBlocks](self, "updateBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  -[RTTSettings _preferenceKeyForSelector:](self, "_preferenceKeyForSelector:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = (void *)MEMORY[0x2199D4874](v8);
    v21 = v10;
    v24[0] = v10;
    v16 = (void *)MEMORY[0x2199D4874]();
    v24[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "addObject:", v17);
    objc_getAssociatedObject(v9, &AXRTTSettingsDestructionHelperKey);
    v18 = (AXRTTSettingsListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v18 = -[AXRTTSettingsListenerHelper initWithListenerAddress:]([AXRTTSettingsListenerHelper alloc], "initWithListenerAddress:", v9);
      objc_setAssociatedObject(v9, &AXRTTSettingsDestructionHelperKey, v18, (void *)1);
    }
    -[AXRTTSettingsListenerHelper addSelectorKey:](v18, "addSelectorKey:", a4);
    -[RTTSettings _registerForNotification:](self, "_registerForNotification:", v13);

    v10 = v21;
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __68__RTTSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke;
    v22[3] = &unk_24D2045A0;
    v23 = v10;
    objc_msgSend(v14, "indexesOfObjectsPassingTest:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v14, "removeObjectsAtIndexes:", v19);

  }
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[RTTSettings updateBlocks](self, "updateBlocks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v14, v13);

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_51_0);
  return (id)sharedInstance_Settings;
}

- (BOOL)TTYHardwareEnabled
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings TTYHardwareEnabledForContext:](self, "TTYHardwareEnabledForContext:", v4);

  return (char)self;
}

- (BOOL)BOOLValueForKey:(id)a3 andContext:(id)a4 withDefaultValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:].cold.2();

  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings objectValueForKey:andContext:withClass:andDefaultValue:](self, "objectValueForKey:andContext:withClass:andDefaultValue:", v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:].cold.1();

  v15 = objc_msgSend(v13, "BOOLValue");
  return v15;
}

- (id)objectValueForKey:(id)a3 andContext:(id)a4 withClass:(Class)a5 andDefaultValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  char isKindOfClass;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  int v29;
  int v30;
  void *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v38;
  id v39;
  Class v40;
  NSObject *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  NSObject *v51;
  __int16 v52;
  _BYTE v53[10];
  Class v54;
  __int16 v55;
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTTSettings uuidFromContext:](self, "uuidFromContext:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  -[RTTSettings valueForPreferenceKey:andContext:](self, "valueForPreferenceKey:andContext:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = v12;
    if (-[NSObject length](v13, "length"))
    {
      objc_msgSend(v14, "objectForKey:", v13);
      v41 = objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();
      AXLogRTT();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if ((isKindOfClass & 1) != 0)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          v49 = v10;
          v50 = 2112;
          v51 = v41;
          _os_log_impl(&dword_21473C000, v17, OS_LOG_TYPE_INFO, "Returning setting: [%@] = '%@'", buf, 0x16u);
        }

        v19 = v41;
        v15 = v19;
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138413314;
          v49 = v10;
          v50 = 2112;
          v51 = v41;
          v52 = 2112;
          *(_QWORD *)v53 = a5;
          *(_WORD *)&v53[8] = 2112;
          v54 = (Class)v14;
          v55 = 2112;
          v56 = v13;
          _os_log_impl(&dword_21473C000, v17, OS_LOG_TYPE_INFO, "Slot value is wrong kind: [%@] %@ > %@ (%@ -> %@)", buf, 0x34u);
        }

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        obj = v14;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v23)
        {
          v24 = v23;
          v39 = v11;
          v40 = a5;
          v38 = v12;
          v25 = *(_QWORD *)v44;
          while (2)
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              AXLogRTT();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v29 = -[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("RTTWildcardContext"));
                v30 = objc_msgSend(v27, "hasPrefix:", CFSTR("00000000-"));
                *(_DWORD *)buf = 138413058;
                v49 = v27;
                v50 = 2112;
                v51 = v13;
                v52 = 1024;
                *(_DWORD *)v53 = v29;
                *(_WORD *)&v53[4] = 1024;
                *(_DWORD *)&v53[6] = v30;
                _os_log_impl(&dword_21473C000, v28, OS_LOG_TYPE_INFO, "check: %@ %@ %d %d", buf, 0x22u);
              }

              objc_msgSend(v27, "commonPrefixWithString:options:", v13, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v31, "length") > 5)
              {

LABEL_32:
                objc_msgSend(obj, "objectForKey:", v27);
                v33 = objc_claimAutoreleasedReturnValue();

                AXLogRTT();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  v35 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138413058;
                  v49 = v27;
                  v50 = 2112;
                  v51 = v15;
                  v52 = 2112;
                  *(_QWORD *)v53 = v35;
                  *(_WORD *)&v53[8] = 2112;
                  v54 = v40;
                  v36 = v35;
                  _os_log_impl(&dword_21473C000, v34, OS_LOG_TYPE_INFO, "Found another id with value: [%@], contextUUID mismatch: [%@] [cls: %@, expected: %@]", buf, 0x2Au);

                }
                v12 = v38;
                v11 = v39;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v19 = v33;

                  v15 = v19;
                }
                else
                {
                  v19 = v33;
                }
                goto LABEL_37;
              }
              if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("RTTWildcardContext")))
              {
                v32 = objc_msgSend(v27, "hasPrefix:", CFSTR("00000000-"));

                if ((v32 & 1) != 0)
                  goto LABEL_32;
              }
              else
              {

              }
            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            if (v24)
              continue;
            break;
          }
          v12 = v38;
          v11 = v39;
        }
        v19 = v41;
LABEL_37:

      }
    }
    else
    {
      AXLogRTT();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v11;
        _os_log_impl(&dword_21473C000, v19, OS_LOG_TYPE_INFO, "Not retrieving setting. Context is wrong: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    AXLogRTT();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v10;
      v50 = 2112;
      v51 = v22;
      v52 = 2112;
      *(_QWORD *)v53 = v14;
      _os_log_impl(&dword_21473C000, v20, OS_LOG_TYPE_INFO, "Preference group wrong: [%@] = |%@| '%@'", buf, 0x20u);

    }
    v15 = v12;
  }

  return v15;
}

- (id)uuidFromContext:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPod") & 1) != 0)
  {
    v4 = CFSTR("RTTWildcardContext");
  }
  else
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_synchronizeIfNecessary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[RTTSettings synchronizePreferences](self, "synchronizePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BED2928]);
    objc_msgSend(v4, "removeObject:", v5);
  }
  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");

}

void __40__RTTSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  __CFString *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  NSObject *v7;

  objc_msgSend(*(id *)(a1 + 32), "registeredNotifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (uint64_t *)(a1 + 40);
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_notificationForPreferenceKey:", *(_QWORD *)(a1 + 40));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __40__RTTSettings__registerForNotification___block_invoke_2_cold_1(v3, v7);

  }
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (id)valueForPreferenceKey:(id)a3 andContext:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  int pw_uid;
  passwd *v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  int v18;
  uid_t v19;
  int v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  -[RTTSettings _synchronizeIfNecessary:](self, "_synchronizeIfNecessary:", v6);
  -[RTTSettings _registerForNotification:](self, "_registerForNotification:", v6);
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedSettings, "objectForKeyedSubscript:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__CFString objectForKey:](v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        AXLogRTT();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v21 = 138412546;
          v22 = v8;
          v23 = 2112;
          v24 = v6;
          _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Returning cached version: %@: %@", (uint8_t *)&v21, 0x16u);
        }

        v11 = v8;
        goto LABEL_21;
      }
    }
    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21 = 138412802;
      v22 = v8;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26[0] = v6;
      _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Cached setting missing right context: %@ > [%@]%@", (uint8_t *)&v21, 0x20u);
    }

  }
  pw_uid = valueForPreferenceKey_andContext__mobileUID;
  if (valueForPreferenceKey_andContext__mobileUID == -1)
  {
    v14 = getpwnam("mobile");
    if (v14)
    {
      pw_uid = v14->pw_uid;
      valueForPreferenceKey_andContext__mobileUID = pw_uid;
    }
    else
    {
      pw_uid = valueForPreferenceKey_andContext__mobileUID;
    }
  }
  if (pw_uid == geteuid())
  {
    v15 = (__CFString *)CFPreferencesCopyValue(v6, (CFStringRef)*MEMORY[0x24BED2928], CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
    if (v15)
      v11 = v15;
    else
      v11 = 0;
  }
  else
  {
    +[RTTServer sharedInstance](RTTServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForTTYSetting:", v6);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = valueForPreferenceKey_andContext__mobileUID;
      v19 = geteuid();
      v21 = 138413058;
      v22 = v6;
      v23 = 2112;
      v24 = v11;
      v25 = 1024;
      LODWORD(v26[0]) = v18;
      WORD2(v26[0]) = 1024;
      *(_DWORD *)((char *)v26 + 6) = v19;
      _os_log_impl(&dword_21473C000, v17, OS_LOG_TYPE_INFO, "Not mobile: asked heard for setting: %@: Result: [%@] {mobile UID %d, my UID %d}", (uint8_t *)&v21, 0x22u);
    }

  }
LABEL_21:

  return v11;
}

- (void)_registerForNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (_registerForNotification__onceToken != -1)
    dispatch_once(&_registerForNotification__onceToken, &__block_literal_global_103);
  v5 = _registerForNotification__RegistrationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__RTTSettings__registerForNotification___block_invoke_2;
  block[3] = &unk_24D203A08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSMutableSet)synchronizePreferences
{
  return self->_synchronizePreferences;
}

- (BOOL)TTYHardwareEnabledForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", kAXSTTYHardwareEnabledPreference, a3, 0);
}

- (BOOL)TTYSoftwareEnabled
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings TTYSoftwareEnabledForContext:](self, "TTYSoftwareEnabledForContext:", v4);

  return (char)self;
}

- (BOOL)TTYSoftwareEnabledForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", kAXSTTYSoftwareEnabledPreference, a3, 0);
}

- (id)_preferenceKeyForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  -[RTTSettings _selectorMap](self, "_selectorMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("UnknownKey");
  v8 = v7;

  return v8;
}

- (id)_selectorMap
{
  if (_selectorMap_onceToken != -1)
    dispatch_once(&_selectorMap_onceToken, &__block_literal_global_72);
  return (id)_selectorMap_SelectorMap;
}

- (id)_notificationForPreferenceKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_AXNotification_"), a3);
}

void __27__RTTSettings__selectorMap__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  void *v27;

  v0 = objc_alloc(MEMORY[0x24BDBCE70]);
  v25 = kAXSTTYHardwareEnabledPreference;
  v26 = v0;
  NSStringFromSelector(sel_TTYHardwareEnabled);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = kAXSTTYSoftwareEnabledPreference;
  NSStringFromSelector(sel_TTYSoftwareEnabled);
  v1 = objc_claimAutoreleasedReturnValue();
  v22 = kAXSTTYIncomingCallsTTYPreference;
  v23 = (void *)v1;
  NSStringFromSelector(sel_incomingCallsTTY);
  v2 = objc_claimAutoreleasedReturnValue();
  v20 = kAXSTTYPreferredRelayNumberPreference;
  v21 = (void *)v2;
  NSStringFromSelector(sel_preferredRelayNumber);
  v3 = objc_claimAutoreleasedReturnValue();
  v18 = kAXSTTYShouldBeRealtimePreference;
  v19 = (void *)v3;
  NSStringFromSelector(sel_ttyShouldBeRealtime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = kAXSRTTAnswerAllRTTCallsAsMutedPreference;
  NSStringFromSelector(sel_answerRTTCallsAsMuted);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = kAXSRTTShowsNotificationsPreference;
  NSStringFromSelector(sel_showsRTTNotifications);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hasReceivedRTTCall);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_internalOverrideTTYAvailability);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = kAXSRTTSettingsVersionPreference;
  NSStringFromSelector(sel_settingsVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_continuityRTTIsSupported);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cannedResponses);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rttLiveTranscriptionsEnabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v26, "initWithObjectsAndKeys:", v25, v27, v24, v23, v22, v21, v20, v19, v18, v15, v17, v4, v16, v5, CFSTR("TTYReceivedRTTCallPreference"), v6, CFSTR("InternalOverrideTTYAvailabilityPreference"),
          v14,
          v7,
          v8,
          CFSTR("RTTContinuityRTTIsSupportedPreference"),
          v9,
          CFSTR("TTYCannedResponsesPreference"),
          v10,
          CFSTR("RTTLiveTranscriptionEnabledPreference"),
          v11,
          0);
  v13 = (void *)_selectorMap_SelectorMap;
  _selectorMap_SelectorMap = v12;

}

void __25__RTTSettings_initialize__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForPreferenceKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateGizmoValueIfNeeded:forPreferenceKey:", v4, v2);

}

- (id)currentLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTTSettings;
  -[RTTSettings dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldMigrateSettings
{
  return -[RTTSettings settingsVersion](self, "settingsVersion") < 2;
}

- (void)migrateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  if (-[RTTSettings settingsVersion](self, "settingsVersion") <= 1)
  {
    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultVoiceContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSTTYPreferredRelayNumberPreference, objc_opt_class(), &stru_24D204B08);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      -[RTTSettings setPreferredRelayNumber:forContext:](self, "setPreferredRelayNumber:forContext:", v5, v4);
    -[RTTSettings setTTYHardwareEnabled:forContext:](self, "setTTYHardwareEnabled:forContext:", -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", kAXSTTYHardwareEnabledPreference, 0), v4);
    -[RTTSettings setTTYSoftwareEnabled:forContext:](self, "setTTYSoftwareEnabled:forContext:", -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", kAXSTTYSoftwareEnabledPreference, 0), v4);
    -[RTTSettings setIncomingCallsTTY:forContext:](self, "setIncomingCallsTTY:forContext:", -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", kAXSTTYIncomingCallsTTYPreference, 0), v4);
    -[RTTSettings setTTYShouldBeRealtime:forContext:](self, "setTTYShouldBeRealtime:forContext:", -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", kAXSTTYShouldBeRealtimePreference, 1), v4);
    -[RTTSettings setSettingsVersion:](self, "setSettingsVersion:", 2);

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("RTT_RequestedNotificationAuthorizationKey_14.0"));

  if ((v7 & 1) == 0)
  {
    if (-[RTTSettings TTYHardwareEnabled](self, "TTYHardwareEnabled")
      || -[RTTSettings TTYSoftwareEnabled](self, "TTYSoftwareEnabled"))
    {
      RTTRequestNotificationAuthorization();
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBool:forKey:", 1, CFSTR("RTT_RequestedNotificationAuthorizationKey_14.0"));

    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_DEFAULT, "Performing RTT notification request", v10, 2u);
    }

  }
}

- (void)_handlePreferenceChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_AXNotification_"), &stru_24D204B08);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:", 0, v8);
  -[RTTSettings synchronizePreferences](self, "synchronizePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[RTTSettings updateBlocks](self, "updateBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_69);

}

void __40__RTTSettings__handlePreferenceChanged___block_invoke(uint64_t a1, void *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (SEL)selectorForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[RTTSettings _selectorMap](self, "_selectorMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__RTTSettings_selectorForPreferenceKey___block_invoke;
  v9[3] = &unk_24D204558;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (const char *)v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__RTTSettings_selectorForPreferenceKey___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  NSString *aSelectorName;

  aSelectorName = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NSSelectorFromString(aSelectorName);
    *a4 = 1;
  }

}

- (id)notificationForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[RTTSettings _preferenceKeyForSelector:](self, "_preferenceKeyForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _notificationForPreferenceKey:](self, "_notificationForPreferenceKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __68__RTTSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateGizmoValueIfNeeded:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTTSettings nanoSynchronizeQueue](self, "nanoSynchronizeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__RTTSettings_updateGizmoValueIfNeeded_forPreferenceKey___block_invoke;
  v11[3] = &unk_24D203A08;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __57__RTTSettings_updateGizmoValueIfNeeded_forPreferenceKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[RTTNanoSettings sharedInstance](RTTNanoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("TTYNanoIndependencePreference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[RTTNanoSettings sharedInstance](RTTNanoSettings, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setValue:forPreferenceKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4 andContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTTSettings uuidFromContext:](self, "uuidFromContext:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v16 = 138412802;
    v17 = v9;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Setting %@=%@ for context: %@", (uint8_t *)&v16, 0x20u);
  }

  if (objc_msgSend(v11, "length"))
  {
    v13 = (void *)MEMORY[0x24BDBCED8];
    -[RTTSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", v9, objc_opt_class(), MEMORY[0x24BDBD1B8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithDictionary:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    -[NSObject setObject:forKey:](v15, "setObject:forKey:", v8, v11);
    -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v15, v9);
  }
  else
  {
    AXLogRTT();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Not setting value for %@ and context %@", (uint8_t *)&v16, 0x16u);
    }
  }

}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4
{
  CFStringRef *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v13;
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (CFStringRef *)MEMORY[0x24BED2928];
  v7 = (const __CFString *)*MEMORY[0x24BED2928];
  v8 = (const __CFString *)*MEMORY[0x24BDBD588];
  v9 = (__CFString *)a4;
  v10 = a3;
  CFPreferencesSetValue(v9, v10, v7, CFSTR("mobile"), v8);
  -[RTTSettings updateGizmoValueIfNeeded:forPreferenceKey:](self, "updateGizmoValueIfNeeded:forPreferenceKey:", v10, v9);
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:", v10, v9);

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  CFPreferencesAppSynchronize(*v6);
  -[RTTSettings _notificationForPreferenceKey:](self, "_notificationForPreferenceKey:", v9);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v11, 0, 0, 1u);
    AXLogRTT();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Posting RTT setting notification for: %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (int64_t)integerValueForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  void *v5;

  -[RTTSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (BOOL)BOOLValueForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  void *v5;

  -[RTTSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)objectValueForKey:(id)a3 withClass:(Class)a4 andDefaultValue:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  -[RTTSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = v7;

    v8 = v9;
  }

  return v8;
}

- (id)valueForPreferenceKey:(id)a3
{
  return -[RTTSettings valueForPreferenceKey:andContext:](self, "valueForPreferenceKey:andContext:", a3, 0);
}

- (void)clearAllServerSettingsCache
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Clearing server settings cache", v4, 2u);
  }

  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[NSMutableDictionary removeAllObjects](self->_cachedSettings, "removeAllObjects");
  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
}

- (void)clearServerSettingsCacheForKey:(id)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFNotificationCenter *LocalCenter;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Clearing server settings cache for: %@", (uint8_t *)&v8, 0xCu);
  }

  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:", 0, v4);
  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  -[RTTSettings _notificationForPreferenceKey:](self, "_notificationForPreferenceKey:", v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, v6, 0, 0, 1u);
  }

}

- (void)setTTYHardwareEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setTTYHardwareEnabled:forContext:](self, "setTTYHardwareEnabled:forContext:", v3, v5);

}

- (void)setTTYSoftwareEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setTTYSoftwareEnabled:forContext:](self, "setTTYSoftwareEnabled:forContext:", v3, v5);

}

- (BOOL)incomingCallsTTY
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings incomingCallsTTYForContext:](self, "incomingCallsTTYForContext:", v4);

  return (char)self;
}

- (void)setIncomingCallsTTY:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setIncomingCallsTTY:forContext:](self, "setIncomingCallsTTY:forContext:", v3, v5);

}

- (int64_t)incomingTTYCallCount
{
  return -[RTTSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("incomingTTYCallCount"), 0);
}

- (void)setIncomingTTYCallCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("incomingTTYCallCount"));

}

- (int64_t)outgoingTTYCallCount
{
  return -[RTTSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("outgoingTTYCallCount"), 0);
}

- (void)setOutgoingTTYCallCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("outgoingTTYCallCount"));

}

- (int64_t)settingsVersion
{
  int64_t result;

  if (CachedVersion == 2)
    return 2;
  result = -[RTTSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSRTTSettingsVersionPreference, 0);
  CachedVersion = result;
  return result;
}

- (void)setSettingsVersion:(int64_t)a3
{
  id v4;

  CachedVersion = -1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, kAXSRTTSettingsVersionPreference);

}

- (double)lastCallCountReset
{
  return (double)-[RTTSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("lastCallCountReset"), 0);
}

- (void)setLastCallCountReset:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("lastCallCountReset"));

}

- (double)lastDBVacuum
{
  return (double)-[RTTSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("TTYLastDBVacuumPreference"), 0);
}

- (void)setLastDBVacuum:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("TTYLastDBVacuumPreference"));

}

- (BOOL)ttyShouldBeRealtime
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings ttyShouldBeRealtimeForContext:](self, "ttyShouldBeRealtimeForContext:", v4);

  return (char)self;
}

- (void)setTtyShouldBeRealtime:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setTTYShouldBeRealtime:forContext:](self, "setTTYShouldBeRealtime:forContext:", v3, v5);

}

- (NSString)preferredRelayNumber
{
  void *v3;
  void *v4;
  void *v5;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings preferredRelayNumberForContext:](self, "preferredRelayNumberForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setPreferredRelayNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setPreferredRelayNumber:forContext:](self, "setPreferredRelayNumber:forContext:", v4, v5);

}

- (BOOL)answerRTTCallsAsMuted
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings answerRTTCallsAsMutedForContext:](self, "answerRTTCallsAsMutedForContext:", v4);

  return (char)self;
}

- (void)setAnswerRTTCallsAsMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setAnswerRTTCallsAsMuted:forContext:](self, "setAnswerRTTCallsAsMuted:forContext:", v3, v5);

}

- (BOOL)showsRTTNotifications
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings showsRTTNotificationsForContext:](self, "showsRTTNotificationsForContext:", v4);

  return (char)self;
}

- (BOOL)rttLiveTranscriptionsEnabled
{
  void *v3;
  void *v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTSettings rttLiveTranscriptionsEnabledForContext:](self, "rttLiveTranscriptionsEnabledForContext:", v4);

  return (char)self;
}

- (void)setTTYHardwareEnabled:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, kAXSTTYHardwareEnabledPreference, v7);

}

- (void)setTTYSoftwareEnabled:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  BOOL v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v15 = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Set software enabled: %d for context: %@", buf, 0x12u);
  }

  if (-[RTTSettings TTYSoftwareEnabledForContext:](self, "TTYSoftwareEnabledForContext:", v6) == v4)
  {
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "TTY software has the same value, no need to set again", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, kAXSTTYSoftwareEnabledPreference, v6);

    v9 = +[RTTTelephonyUtilities TTYSoftwareEnabledForAnyActiveContext](RTTTelephonyUtilities, "TTYSoftwareEnabledForAnyActiveContext");
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__RTTSettings_setTTYSoftwareEnabled_forContext___block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v13 = v9;
    dispatch_async(v10, block);

    _AXSSoftwareTTYSetEnabled();
  }

}

void __48__RTTSettings_setTTYSoftwareEnabled_forContext___block_invoke(uint64_t a1)
{
  id v2;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTTYDictionaryAvailability:", *(unsigned __int8 *)(a1 + 32));

}

- (BOOL)incomingCallsTTYForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", kAXSTTYIncomingCallsTTYPreference, a3, 0);
}

- (void)setIncomingCallsTTY:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Set incoming calls: %d context: %@", (uint8_t *)v9, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, kAXSTTYIncomingCallsTTYPreference, v6);

}

- (BOOL)ttyShouldBeRealtimeForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", kAXSTTYShouldBeRealtimePreference, a3, 1);
}

- (void)setTTYShouldBeRealtime:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, kAXSTTYShouldBeRealtimePreference, v7);

}

- (id)preferredRelayNumberForContext:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;

  v4 = kAXSTTYPreferredRelayNumberPreference;
  v5 = a3;
  -[RTTSettings objectValueForKey:andContext:withClass:andDefaultValue:](self, "objectValueForKey:andContext:withClass:andDefaultValue:", v4, v5, objc_opt_class(), &stru_24D204B08);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setPreferredRelayNumber:(id)a3 forContext:(id)a4
{
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", a3, kAXSTTYPreferredRelayNumberPreference, a4);
}

- (BOOL)answerRTTCallsAsMutedForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", kAXSRTTAnswerAllRTTCallsAsMutedPreference, a3, 1);
}

- (void)setAnswerRTTCallsAsMuted:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, kAXSRTTAnswerAllRTTCallsAsMutedPreference, v7);

}

- (BOOL)showsRTTNotificationsForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", kAXSRTTShowsNotificationsPreference, a3, 1);
}

- (void)setShowsRTTNotifications:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, kAXSRTTShowsNotificationsPreference, v7);

}

- (BOOL)hasReceivedRTTCall
{
  return -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", CFSTR("TTYReceivedRTTCallPreference"), 0);
}

- (void)setHasReceivedRTTCall:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("TTYReceivedRTTCallPreference"));

}

- (BOOL)rttLiveTranscriptionsEnabledForContext:(id)a3
{
  return -[RTTSettings BOOLValueForKey:andContext:withDefaultValue:](self, "BOOLValueForKey:andContext:withDefaultValue:", CFSTR("RTTLiveTranscriptionEnabledPreference"), a3, 1);
}

- (void)setRTTLiveTranscriptionsEnabled:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:andContext:](self, "_setValue:forPreferenceKey:andContext:", v8, CFSTR("RTTLiveTranscriptionEnabledPreference"), v7);

}

- (BOOL)continuityRTTIsSupported
{
  return -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", CFSTR("RTTContinuityRTTIsSupportedPreference"), 0);
}

- (void)setContinuityRTTIsSupported:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("RTTContinuityRTTIsSupportedPreference"));

}

- (BOOL)supportsRelayCalling
{
  return -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", CFSTR("TUSupportsRelayCallingPreference"), 0);
}

- (void)setSupportsRelayCalling:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("TUSupportsRelayCallingPreference"));

}

- (BOOL)isRelayCallingEnabled
{
  return -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", CFSTR("TUIsRelayCallingEnabledPreference"), 0);
}

- (void)setIsRelayCallingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("TUIsRelayCallingEnabledPreference"));

}

- (NSArray)cannedResponses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  uint64_t v22;

  -[RTTSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("TTYCannedResponsesPreference"), objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v5 = objc_msgSend(v3, "count");
  v6 = MEMORY[0x24BDAC760];
  v22 = v5 - 1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __30__RTTSettings_cannedResponses__block_invoke;
  v17[3] = &unk_24D2045E8;
  v17[4] = self;
  v7 = v3;
  v18 = v7;
  v8 = v4;
  v19 = v8;
  v20 = v21;
  objc_msgSend(&unk_24D209DE8, "enumerateObjectsUsingBlock:", v17);
  objc_msgSend(v8, "addEntriesFromDictionary:", v7);
  objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_146);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsForKeys:", v10);

  objc_msgSend(v8, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __30__RTTSettings_cannedResponses__block_invoke_3;
  v15[3] = &unk_24D204650;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v11, "sortedArrayUsingComparator:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v21, 8);
  return (NSArray *)v13;
}

void __30__RTTSettings_cannedResponses__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ttyLocStringAndLocale(v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = *(void **)(a1 + 48);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v7, "numberWithUnsignedInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

  }
}

unint64_t __30__RTTSettings_cannedResponses__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return (unint64_t)objc_msgSend(a3, "integerValue") >> 63;
}

uint64_t __30__RTTSettings_cannedResponses__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)setCannedResponses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  -[RTTSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("TTYCannedResponsesPreference"), objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34__RTTSettings_setCannedResponses___block_invoke;
  v14[3] = &unk_24D204678;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v11 = v4;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __34__RTTSettings_setCannedResponses___block_invoke_150;
  v12[3] = &unk_24D2046A0;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v10, CFSTR("TTYCannedResponsesPreference"));

}

void __34__RTTSettings_setCannedResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &unk_24D209D70, v3);

}

void __34__RTTSettings_setCannedResponses___block_invoke_150(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

- (void)resetCannedResponses
{
  id v3;

  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", 0, CFSTR("TTYCannedResponsesPreference"));
  -[RTTSettings cannedResponses](self, "cannedResponses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings setCannedResponses:](self, "setCannedResponses:", v3);

}

- (BOOL)rttInlineAbbreviationBarEnabled
{
  int v2;

  v2 = -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", CFSTR("RTTInlineAbbreviationBar"), 1);
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad") ^ 1;
  return v2;
}

- (void)setRttInlineAbbreviationBarEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("RTTInlineAbbreviationBar"));

}

- (BOOL)rttCallHoldEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)rttLiveTranscriptionsFeatureFlagEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (BOOL)internalOverrideTTYAvailability
{
  return -[RTTSettings BOOLValueForKey:withDefaultValue:](self, "BOOLValueForKey:withDefaultValue:", CFSTR("InternalOverrideTTYAvailabilityPreference"), 0);
}

- (void)setInternalOverrideTTYAvailability:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("InternalOverrideTTYAvailabilityPreference"));

}

- (void)setRegisteredNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_registeredNotifications, a3);
}

- (void)setSynchronizePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizePreferences, a3);
}

- (void)setUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateBlocks, a3);
}

- (OS_dispatch_queue)nanoSynchronizeQueue
{
  return self->_nanoSynchronizeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoSynchronizeQueue, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_synchronizePreferences, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
  objc_storeStrong((id *)&self->_synchronizeDomainsLock, 0);
}

void __40__RTTSettings__registerForNotification___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_21473C000, a2, OS_LOG_TYPE_DEBUG, "Registered for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)BOOLValueForKey:andContext:withDefaultValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21473C000, v0, v1, "Retrieved BOOL value: %@=%@");
  OUTLINED_FUNCTION_1();
}

- (void)BOOLValueForKey:andContext:withDefaultValue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21473C000, v0, v1, "Requesting BOOL value: %@ [%@]");
  OUTLINED_FUNCTION_1();
}

@end
