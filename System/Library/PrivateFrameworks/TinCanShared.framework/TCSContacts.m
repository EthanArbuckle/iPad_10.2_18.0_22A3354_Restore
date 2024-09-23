@implementation TCSContacts

- (TCSContacts)init
{
  TCSContacts *v2;
  TCSContacts *v3;
  uint64_t v4;
  NSHashTable *observers;
  uint64_t v6;
  NPSManager *npsManager;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  CNCoalescingTimer *allowlistSaveTimer;
  const char *v18;
  NSObject *v19;
  id v20;
  _QWORD handler[4];
  id v23;
  id location;
  _QWORD v25[4];
  id v26;
  id buf[2];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TCSContacts;
  v2 = -[TCSContacts init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowlistLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = objc_opt_new();
    npsManager = v3->_npsManager;
    v3->_npsManager = (NPSManager *)v6;

    if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
    {
      -[TCSContacts _loadDataFromDefaults](v3, "_loadDataFromDefaults");
    }
    else
    {
      _TCSInitializeLogging();
      v8 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21342E000, v8, OS_LOG_TYPE_DEFAULT, "TCSContacts needs to wait for first device unlock before loading data.", (uint8_t *)buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[TCSBehavior sharedBehavior](TCSBehavior, "sharedBehavior");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__handleDeviceFirstUnlock, CFSTR("TCSFirstUnlockNotification"), v10);

    }
    objc_msgSend(MEMORY[0x24BE192D0], "defaultProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, v3);
    v12 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __19__TCSContacts_init__block_invoke;
    v25[3] = &unk_24CFC2448;
    objc_copyWeak(&v26, buf);
    v13 = (void *)MEMORY[0x2199B2B54](v25);
    v14 = objc_alloc(MEMORY[0x24BE19238]);
    objc_msgSend(v11, "mainThreadScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithDelay:options:block:schedulerProvider:downstreamScheduler:", 1, v13, v11, v15, 0.3);
    allowlistSaveTimer = v3->_allowlistSaveTimer;
    v3->_allowlistSaveTimer = (CNCoalescingTimer *)v16;

    -[TCSContacts setShouldObserveAllowlistDefaultChanges:](v3, "setShouldObserveAllowlistDefaultChanges:", 1);
    objc_initWeak(&location, v3);
    v18 = (const char *)objc_msgSend(CFSTR("TCSContactsDidChangeNotification"), "UTF8String");
    v19 = MEMORY[0x24BDAC9B8];
    v20 = MEMORY[0x24BDAC9B8];
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = __19__TCSContacts_init__block_invoke_2;
    handler[3] = &unk_24CFC2550;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch(v18, &v3->_prefSyncToken, v19, handler);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v26);
    objc_destroyWeak(buf);

  }
  return v3;
}

void __19__TCSContacts_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_saveAllowlist");

}

void __19__TCSContacts_init__block_invoke_2(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  _DWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[8] == a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleContactsPrefSync");
    WeakRetained = v4;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TCSContacts setShouldObserveAllowlistDefaultChanges:](self, "setShouldObserveAllowlistDefaultChanges:", 0);
  notify_cancel(self->_prefSyncToken);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TCSContacts;
  -[TCSContacts dealloc](&v4, sel_dealloc);
}

- (NSUserDefaults)defaults
{
  NSUserDefaults *defaults;
  NSUserDefaults *v4;
  NSUserDefaults *v5;

  defaults = self->_defaults;
  if (!defaults)
  {
    +[TCSTinCanUserDefaults defaults](TCSTinCanUserDefaults, "defaults");
    v4 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaults;
    self->_defaults = v4;

    defaults = self->_defaults;
  }
  return defaults;
}

- (void)setShouldObserveAllowlistDefaultChanges:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_shouldObserveAllowlistDefaultChanges != a3)
  {
    v3 = a3;
    self->_shouldObserveAllowlistDefaultChanges = a3;
    -[TCSContacts defaults](self, "defaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, v5, 1, TCSContactsObservationContext);
    else
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, v5, TCSContactsObservationContext);

  }
}

+ (void)dismissInvitationNotificationsFromContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_tinCanUserNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__TCSContacts_dismissInvitationNotificationsFromContact___block_invoke;
  v7[3] = &unk_24CFC2C68;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "getDeliveredNotificationsWithCompletionHandler:", v7);

}

void __57__TCSContacts_dismissInvitationNotificationsFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  v35 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier");
    v34 = v4 != *MEMORY[0x24BDBA2D0];
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v9, "request", v33);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "categoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(CFSTR("com.apple.tincan.invite"), "isEqualToString:", v12);

        if (v13)
        {
          objc_msgSend(v11, "userInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.tincan.invite.handle"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "userInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("com.apple.tincan.invite.contactidentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v35 + 32), "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v19 = v17 == 0;
          else
            v19 = 1;
          v20 = !v19 && v34;

          if (!v20)
          {
            objc_msgSend(*(id *)(v35 + 40), "canonicalDestinationsForContact:", *(_QWORD *)(v35 + 32));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v15)
            {
              v25 = objc_msgSend(v23, "containsObject:", v15);

              if (!v25)
                goto LABEL_23;
LABEL_21:
              objc_msgSend(v9, "request");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v24);
            }

            goto LABEL_23;
          }
          objc_msgSend(*(id *)(v35 + 32), "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v17);

          if ((v22 & 1) != 0)
            goto LABEL_21;
        }
LABEL_23:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v6);
  }

  v26 = v33;
  if (objc_msgSend(v33, "count"))
  {
    _TCSInitializeLogging();
    v27 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(v35 + 32);
      v28 = *(void **)(v35 + 40);
      v30 = v27;
      objc_msgSend(v28, "_safeContactDetailStringForLogging:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v31;
      _os_log_impl(&dword_21342E000, v30, OS_LOG_TYPE_DEFAULT, "Requesting removal of invitation notifications from: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(v35 + 40), "_tinCanUserNotificationCenter", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeDeliveredNotificationsWithIdentifiers:", v26);

  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)addDestinations:(id)a3
{
  -[TCSContacts _addDestinations:asType:](self, "_addDestinations:asType:", a3, 0);
}

- (void)addDestinationsForInviter:(id)a3
{
  -[TCSContacts _addDestinations:asType:](self, "_addDestinations:asType:", a3, 1);
}

- (void)removeDestinations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCSContacts _removeDestinationFromAllowlist:](self, "_removeDestinationFromAllowlist:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    _TCSInitializeLogging();
    v13 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_21342E000, v14, OS_LOG_TYPE_DEFAULT, "TCSContacts removed handles: %@", buf, 0xCu);

    }
    -[CNCoalescingTimer handleEvent](self->_allowlistSaveTimer, "handleEvent", (_QWORD)v17);
    -[TCSContacts _generateDestinationsFromAllowlist](self, "_generateDestinationsFromAllowlist");
    -[TCSContacts _notifyObserversDestinationsChanged](self, "_notifyObserversDestinationsChanged");
  }

}

- (void)setContact:(id)a3 supportsTinCan:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock(&self->_allowlistLock);
        -[NSMutableDictionary objectForKey:](self->_allowlist, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        os_unfair_lock_unlock(&self->_allowlistLock);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Supported"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        if (v18 != v4)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("Supported"));

          os_unfair_lock_lock(&self->_allowlistLock);
          -[NSMutableDictionary setObject:forKey:](self->_allowlist, "setObject:forKey:", v16, v11);
          os_unfair_lock_unlock(&self->_allowlistLock);
          objc_msgSend(v25, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v25, "count"))
  {
    _TCSInitializeLogging();
    v20 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      NSStringFromBOOL();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v22;
      v33 = 2112;
      v34 = v24;
      _os_log_impl(&dword_21342E000, v21, OS_LOG_TYPE_DEFAULT, "TCSContacts set support flag to %@ for: %@", buf, 0x16u);

    }
    -[TCSContacts _saveAllowlist](self, "_saveAllowlist", v25);
    -[TCSContacts _notifyObserversRecencyChanged](self, "_notifyObserversRecencyChanged");
  }

}

- (BOOL)contactSupportsTinCan:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock(&self->_allowlistLock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&self->_allowlistLock);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Supported"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isDestinationAccepted:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_allowlistLock;
  void *v6;
  void *v7;
  char v8;

  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_allowlistLock);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Accepted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isDestinationAnInviter:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_allowlistLock;
  void *v6;
  void *v7;
  char v8;

  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_allowlistLock);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Inviter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)setDestinationAsAccepted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKey:](self->_allowlist, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  os_unfair_lock_unlock(&self->_allowlistLock);
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Accepted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      _TCSInitializeLogging();
      v10 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
        -[TCSContacts setDestinationAsAccepted:].cold.2(v10);
    }
    else
    {
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Accepted"));
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("Added"));

      objc_msgSend(v7, "removeObjectForKey:", CFSTR("Inviter"));
      os_unfair_lock_lock(&self->_allowlistLock);
      -[NSMutableDictionary setObject:forKey:](self->_allowlist, "setObject:forKey:", v7, v5);
      os_unfair_lock_unlock(&self->_allowlistLock);
      -[CNCoalescingTimer handleEvent](self->_allowlistSaveTimer, "handleEvent");
    }
  }
  else
  {
    _TCSInitializeLogging();
    v11 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSContacts setDestinationAsAccepted:].cold.1(v11);
  }

}

- (BOOL)isContactAccepted:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[TCSContacts isDestinationAccepted:](self, "isDestinationAccepted:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isContactAnInviter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[TCSContacts isDestinationAnInviter:](self, "isDestinationAnInviter:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)setContactAsAccepted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TCSContacts setDestinationAsAccepted:](self, "setDestinationAsAccepted:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[TCSContacts _notifyObserversContactBecameAccepted:](self, "_notifyObserversContactBecameAccepted:", v4);

}

- (void)didInitiateCallToContact:(id)a3 date:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[TCSContacts _didInitiateCallToDestination:date:](self, "_didInitiateCallToDestination:date:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[CNCoalescingTimer handleEvent](self->_allowlistSaveTimer, "handleEvent");
  -[TCSContacts _notifyObserversRecencyChanged](self, "_notifyObserversRecencyChanged");

}

- (void)didReceiveCallFromContact:(id)a3 date:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[TCSContacts _didReceiveCallFromDestination:date:](self, "_didReceiveCallFromDestination:date:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[CNCoalescingTimer handleEvent](self->_allowlistSaveTimer, "handleEvent");
  -[TCSContacts _notifyObserversRecencyChanged](self, "_notifyObserversRecencyChanged");

}

- (void)_didInitiateCallToDestination:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  os_unfair_lock_unlock(&self->_allowlistLock);
  if (v10
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Accepted")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        (v12 & 1) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Outgoing"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;

    objc_msgSend(v18, "enqueue:", v7);
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("Outgoing"));
    os_unfair_lock_lock(&self->_allowlistLock);
    -[NSMutableDictionary setObject:forKey:](self->_allowlist, "setObject:forKey:", v10, v8);
    os_unfair_lock_unlock(&self->_allowlistLock);
    -[CNCoalescingTimer handleEvent](self->_allowlistSaveTimer, "handleEvent");

  }
  else
  {
    _TCSInitializeLogging();
    v17 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSContacts _didInitiateCallToDestination:date:].cold.1(v17);
  }

}

- (void)_didReceiveCallFromDestination:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  os_unfair_lock_unlock(&self->_allowlistLock);
  if (v10
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Accepted")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        (v12 & 1) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Incoming"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;

    objc_msgSend(v18, "enqueue:", v7);
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("Incoming"));
    os_unfair_lock_lock(&self->_allowlistLock);
    -[NSMutableDictionary setObject:forKey:](self->_allowlist, "setObject:forKey:", v10, v8);
    os_unfair_lock_unlock(&self->_allowlistLock);
    -[CNCoalescingTimer handleEvent](self->_allowlistSaveTimer, "handleEvent");

  }
  else
  {
    _TCSInitializeLogging();
    v17 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSContacts _didReceiveCallFromDestination:date:].cold.1(v17);
  }

}

- (id)mostRecentCallDateForContact:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        -[TCSContacts mostRecentCallDateForDestination:](self, "mostRecentCallDateForDestination:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v7)
        {
          objc_msgSend(v7, "laterDate:", v10);
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v12;
        }
        else
        {
          v7 = v10;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)mostRecentCallDateForDestination:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_allowlistLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;

  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_allowlistLock);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Incoming"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Outgoing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InvitationReceived"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    v13 = 0;
  else
    v13 = v10 == 0;
  if (!v13 || v11 == 0)
  {
    if (v8)
      v15 = v10 == 0;
    else
      v15 = 1;
    if (v15)
    {
      if (v8)
        v16 = v8;
      else
        v16 = v10;
      v17 = v16;
    }
    else
    {
      objc_msgSend(v8, "laterDate:", v10);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17 = v11;
  }
  v18 = v17;

  return v18;
}

- (id)dateAddedForDestination:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_allowlistLock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowlist, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_allowlistLock);
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Added"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

  }
  else
  {
    _TCSInitializeLogging();
    v10 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSContacts dateAddedForDestination:].cold.1(v10);
    v11 = 0;
  }

  return v11;
}

- (int64_t)stateForContact:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = -[TCSContacts isContactAccepted:](self, "isContactAccepted:", v4);
    v6 = -[TCSContacts isContactAnInviter:](self, "isContactAnInviter:", v4);
    if (v5 || !v6)
    {
      if (v5
        && (-[TCSContacts mostRecentCallDateForContact:](self, "mostRecentCallDateForContact:", v4),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v8)
        || +[TCSBehavior isRunningInStoreDemoModeOrSimulator](TCSBehavior, "isRunningInStoreDemoModeOrSimulator"))
      {
        v7 = 3;
      }
      else if (-[TCSContacts contactSupportsTinCan:](self, "contactSupportsTinCan:", v4))
      {
        v7 = 2;
      }
      else
      {
        v7 = 1;
      }
    }
    else
    {
      v7 = 4;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD v7[5];

  if ((void *)TCSContactsObservationContext == a6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__TCSContacts_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_24CFC2498;
    v7[4] = self;
    TCSGuaranteeMainThread(v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TCSContacts;
    -[TCSContacts observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __62__TCSContacts_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAllowlist");
}

+ (id)validatedAllowlistFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (void)_handleDeviceFirstUnlock
{
  NSObject *v3;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSContacts was notified of first device unlock.", v4, 2u);
  }
  -[TCSContacts _loadDataFromDefaults](self, "_loadDataFromDefaults");
  -[TCSContacts _notifyObserversDestinationsChanged](self, "_notifyObserversDestinationsChanged");
}

- (void)_loadDataFromDefaults
{
  -[TCSContacts _loadAllowlistFromDefaults](self, "_loadAllowlistFromDefaults");
  -[TCSContacts _generateDestinationsFromAllowlist](self, "_generateDestinationsFromAllowlist");
  -[TCSContacts _logDestinations](self, "_logDestinations");
}

- (void)_addDestinations:(id)a3 asType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *p_allowlistLock;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    p_allowlistLock = &self->_allowlistLock;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock(p_allowlistLock);
        -[NSMutableDictionary objectForKey:](self->_allowlist, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        os_unfair_lock_unlock(p_allowlistLock);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Accepted"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Inviter"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if (a4)
          v21 = 0;
        else
          v21 = v18;
        v22 = v18 | v20;
        if (a4 != 1)
          v22 = 0;
        if ((v21 & 1) == 0 && (v22 & 1) == 0)
        {
          if (a4)
          {
            if (a4 == 1)
            {
              v23 = MEMORY[0x24BDBD1C8];
              objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Supported"));
              objc_msgSend(v16, "setObject:forKey:", v23, CFSTR("Inviter"));
              objc_msgSend(v16, "setObject:forKey:", v30, CFSTR("InvitationReceived"));
            }
          }
          else
          {
            objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Accepted"));
            objc_msgSend(v16, "setObject:forKey:", v30, CFSTR("Added"));
            objc_msgSend(v16, "removeObjectForKey:", CFSTR("Inviter"));
          }
          os_unfair_lock_lock(p_allowlistLock);
          -[NSMutableDictionary setObject:forKey:](self->_allowlist, "setObject:forKey:", v16, v11);
          os_unfair_lock_unlock(p_allowlistLock);
          objc_msgSend(v31, "addObject:", v11);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v31, "count"))
  {
    _TCSInitializeLogging();
    v24 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", "));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      v29 = CFSTR("inviter");
      if (!a4)
        v29 = CFSTR("allowed");
      *(_DWORD *)buf = 138412546;
      v39 = v27;
      v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_21342E000, v25, OS_LOG_TYPE_DEFAULT, "TCSContacts added: %@ (%@)", buf, 0x16u);

    }
    -[TCSContacts _saveAllowlist](self, "_saveAllowlist", v30);
    -[TCSContacts _generateDestinationsFromAllowlist](self, "_generateDestinationsFromAllowlist");
    -[TCSContacts _notifyObserversDestinationsChanged](self, "_notifyObserversDestinationsChanged");
  }

}

- (id)_removeDestinationFromAllowlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_allowlistLock);
  -[NSMutableDictionary objectForKey:](self->_allowlist, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_allowlist, "removeObjectForKey:", v4);
    objc_msgSend(v5, "addObject:", v4);
  }
  if (objc_msgSend(v4, "destinationIdIsEmailAddress"))
  {
    -[NSMutableDictionary allKeys](self->_allowlist, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "destinationIdIsEmailAddress", (_QWORD)v17)
            && objc_msgSend(v4, "isEqualToIgnoringCase:", v14))
          {
            -[NSMutableDictionary removeObjectForKey:](self->_allowlist, "removeObjectForKey:", v14);
            objc_msgSend(v5, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  os_unfair_lock_unlock(&self->_allowlistLock);
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (BOOL)_loadAllowlistFromDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *allowlist;

  -[TCSContacts defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  os_unfair_lock_lock(&self->_allowlistLock);
  v9 = objc_msgSend(v8, "isEqualToDictionary:", self->_allowlist);
  if ((v9 & 1) == 0)
  {
    +[TCSContacts validatedAllowlistFromDictionary:](TCSContacts, "validatedAllowlistFromDictionary:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");
    allowlist = self->_allowlist;
    self->_allowlist = v11;

  }
  os_unfair_lock_unlock(&self->_allowlistLock);

  return v9 ^ 1;
}

- (BOOL)_generateDestinationsFromAllowlist
{
  os_unfair_lock_s *p_allowlistLock;
  void *v4;
  NSArray **p_destinations;
  NSArray *destinations;
  char v7;

  p_allowlistLock = &self->_allowlistLock;
  os_unfair_lock_lock(&self->_allowlistLock);
  +[TCSContacts _destinationsFromAllowlistDictionary:onlyAccepted:](TCSContacts, "_destinationsFromAllowlistDictionary:onlyAccepted:", self->_allowlist, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_allowlistLock);
  destinations = self->_destinations;
  p_destinations = &self->_destinations;
  v7 = objc_msgSend(v4, "isEqualToArray:", destinations);
  if ((v7 & 1) == 0)
    objc_storeStrong((id *)p_destinations, v4);

  return v7 ^ 1;
}

- (void)_reloadAllowlist
{
  void *v3;
  id v4;

  -[TCSContacts allowlist](self, "allowlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  if (-[TCSContacts _loadAllowlistFromDefaults](self, "_loadAllowlistFromDefaults"))
  {
    if (-[TCSContacts _generateDestinationsFromAllowlist](self, "_generateDestinationsFromAllowlist"))
    {
      -[TCSContacts _logDestinations](self, "_logDestinations");
      -[TCSContacts _notifyObserversDestinationsChanged](self, "_notifyObserversDestinationsChanged");
    }
    if (-[TCSContacts _didIncomingOutgoingOrSupportChange:](self, "_didIncomingOutgoingOrSupportChange:", v4))
      -[TCSContacts _notifyObserversRecencyChanged](self, "_notifyObserversRecencyChanged");
  }

}

- (BOOL)_didIncomingOutgoingOrSupportChange:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TCSContacts__didIncomingOutgoingOrSupportChange___block_invoke;
  v6[3] = &unk_24CFC2C90;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __51__TCSContacts__didIncomingOutgoingOrSupportChange___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Supported"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Supported"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (v9 == v12)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Incoming"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Incoming"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    if (objc_msgSend(v13, "count") || !objc_msgSend(v15, "count"))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Outgoing"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Outgoing"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      if (!objc_msgSend(v16, "count") && objc_msgSend(v18, "count"))
      {
        *a4 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }

    }
    else
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

  }
  else
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)_logDestinations
{
  NSUInteger v3;
  NSObject *v4;
  _BOOL4 v5;
  NSArray *destinations;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSArray count](self->_destinations, "count");
  _TCSInitializeLogging();
  v4 = TCSLogDefault;
  v5 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      destinations = self->_destinations;
      v7 = v4;
      -[NSArray componentsJoinedByString:](destinations, "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_21342E000, v7, OS_LOG_TYPE_DEFAULT, "TCSContacts has allowed destinations: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21342E000, v4, OS_LOG_TYPE_DEFAULT, "TCSContacts has no allowed destinations.", (uint8_t *)&v10, 2u);
  }
}

- (void)_saveAllowlist
{
  void *v3;
  NSMutableDictionary *allowlist;
  void *v5;
  void *v6;
  NPSManager *npsManager;
  void *v8;
  void *v9;
  id v10;

  -[TCSContacts setShouldObserveAllowlistDefaultChanges:](self, "setShouldObserveAllowlistDefaultChanges:", 0);
  os_unfair_lock_lock(&self->_allowlistLock);
  -[TCSContacts defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  allowlist = self->_allowlist;
  v5 = allowlist;
  if (!allowlist)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v6);

  if (!allowlist)
  os_unfair_lock_unlock(&self->_allowlistLock);
  -[TCSContacts setShouldObserveAllowlistDefaultChanges:](self, "setShouldObserveAllowlistDefaultChanges:", 1);
  if (NPSHasCompletedInitialSync())
  {
    npsManager = self->_npsManager;
    v8 = (void *)MEMORY[0x24BDBCF20];
    +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObject:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeUserDefaultsDomain:keys:](npsManager, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.tincan"), v9);

  }
}

- (void)_notifyObserversDestinationsChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "destinationsDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversRecencyChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "recencyDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversContactBecameAccepted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "contactBecameAccepted:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)_shouldHandleResetStoreDemoContent
{
  int v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFrontBoard");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_resetStoreDemoContent
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *allowlist;
  uint8_t v16[16];

  if (-[TCSContacts _shouldHandleResetStoreDemoContent](self, "_shouldHandleResetStoreDemoContent"))
  {
    _TCSInitializeLogging();
    v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSContacts will reset demo content.", v16, 2u);
    }
    -[TCSContacts defaults](self, "defaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("Suggestions"));

    -[TCSContacts defaults](self, "defaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("SuggestionsFirstGenerated"));

    -[TCSContacts defaults](self, "defaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("SuggestionsPreviouslyGenerated"));

    -[TCSContacts defaults](self, "defaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("SawTalkButtonTutorial"));

    -[TCSContacts defaults](self, "defaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCSTinCanUserDefaults storeDemoAllowlistKey](TCSTinCanUserDefaults, "storeDemoAllowlistKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    os_unfair_lock_lock(&self->_allowlistLock);
    v14 = (NSMutableDictionary *)objc_msgSend(v13, "mutableCopy");
    allowlist = self->_allowlist;
    self->_allowlist = v14;

    os_unfair_lock_unlock(&self->_allowlistLock);
    -[TCSContacts _saveAllowlist](self, "_saveAllowlist");
    -[TCSContacts _generateDestinationsFromAllowlist](self, "_generateDestinationsFromAllowlist");
    -[TCSContacts _logDestinations](self, "_logDestinations");
    -[TCSContacts _notifyObserversDestinationsChanged](self, "_notifyObserversDestinationsChanged");
    -[TCSContacts _notifyObserversRecencyChanged](self, "_notifyObserversRecencyChanged");

  }
}

- (void)_deleteAllowlist
{
  void *v2;
  id v3;

  -[TCSContacts defaults](self, "defaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)_destinationsFromAllowlistDictionary:(id)a3 onlyAccepted:(BOOL)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  if (a4)
  {
    v4 = (void *)MEMORY[0x24BDBCEF0];
    v5 = a3;
    objc_msgSend(v4, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__TCSContacts__destinationsFromAllowlistDictionary_onlyAccepted___block_invoke;
    v10[3] = &unk_24CFC2470;
    v11 = v6;
    v7 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a3;
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __65__TCSContacts__destinationsFromAllowlistDictionary_onlyAccepted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Accepted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

+ (id)_unifiedMeContactFromContactStore:(id)a3 keysToFetch:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(a3, "_ios_meContactWithKeysToFetch:error:", a4, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      if (objc_msgSend(v5, "code") != 2)
      {
        _TCSInitializeLogging();
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
          +[TCSContacts _unifiedMeContactFromContactStore:keysToFetch:].cold.1();
      }
    }
  }

  return v4;
}

+ (id)_unifiedContactWithIdentifier:(id)a3 orDestination:(id)a4 usingContactStore:(id)a5 keysToFetch:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v10, "length"))
  {
    if (v11)
    {
      if (objc_msgSend(v11, "destinationIdIsPhoneNumber"))
      {
        objc_msgSend(a1, "_pauseCharacterSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v11, "_cn_containsCharacterInSet:", v21);

        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        _TCSInitializeLogging();
        v23 = (void *)TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
          +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:].cold.2(v23);
LABEL_20:
        v20 = 0;
        goto LABEL_21;
      }
      if (objc_msgSend(v11, "destinationIdIsEmailAddress"))
      {
        objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
    _TCSInitializeLogging();
    v24 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:].cold.1((uint64_t)v10, v24, v11);
    goto LABEL_20;
  }
  v14 = (void *)MEMORY[0x24BDBACA0];
  v27[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateForContactsWithIdentifiers:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v17 = (void *)v16;

LABEL_4:
  v26 = 0;
  objc_msgSend(v12, "unifiedContactsMatchingPredicate:keysToFetch:error:", v17, v13, &v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v26;
  if (v19)
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:].cold.3();
    v20 = 0;
  }
  else
  {
    objc_msgSend(v18, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(a1, "_unknownContactWithDestination:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_21:
  return v20;
}

+ (id)_pauseCharacterSet
{
  if (_pauseCharacterSet_onceToken != -1)
    dispatch_once(&_pauseCharacterSet_onceToken, &__block_literal_global_6);
  return (id)_pauseCharacterSet_PauseCharacterSet;
}

void __33__TCSContacts__pauseCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(";,"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_pauseCharacterSet_PauseCharacterSet;
  _pauseCharacterSet_PauseCharacterSet = v0;

}

+ (id)_canonicalPhoneNumberFromCNPhoneNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "digits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEB4A20];
  TUHomeCountryCode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumberWithDigits:countryCode:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unformattedInternationalRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = v3;
  v9 = v8;

  return v9;
}

+ (id)_canonicalPhoneNumberFromPhoneNumberString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_canonicalPhoneNumberFromCNPhoneNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_canonicalDestinationForString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (objc_msgSend(v4, "destinationIdIsPhoneNumber"))
  {
    objc_msgSend(a1, "_canonicalPhoneNumberFromPhoneNumberString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)canonicalDestinationsForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = *MEMORY[0x24BDBA348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "areKeysAvailable:", v6);

  if (v7)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v4, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v12), "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_canonicalPhoneNumberFromCNPhoneNumber:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v10);
    }

  }
  v34 = *MEMORY[0x24BDBA288];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "areKeysAvailable:", v15);

  if (v16)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "emailAddresses", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

  }
  objc_msgSend(v5, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_unknownContactWithDestination:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "destinationIdIsPhoneNumber"))
  {
    v5 = (void *)MEMORY[0x24BDBAD38];
    v6 = *MEMORY[0x24BDBAB70];
    objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labeledValueWithLabel:value:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setPhoneNumbers:", v9);
  }
  else if (objc_msgSend(v3, "destinationIdIsEmailAddress"))
  {
    objc_msgSend(MEMORY[0x24BDBAD38], "labeledValueWithLabel:value:", *MEMORY[0x24BDBAB58], v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setEmailAddresses:", v9);
  }
  else
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      +[TCSContacts _unknownContactWithDestination:].cold.1();
    v9 = v4;
    v4 = 0;
  }

  return v4;
}

+ (BOOL)_contact:(id)a3 hasKeysForFormatterStye:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "areKeysAvailable:", v7);

  if ((v8 & 1) == 0)
  {
    _TCSInitializeLogging();
    v9 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      +[TCSContacts _contact:hasKeysForFormatterStye:].cold.1(v9, v5, a4);
  }

  return v8;
}

+ (BOOL)_isContact:(id)a3 similarToContact:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 || (v9 & 1) != 0)
  {
    v12 = objc_msgSend(a1, "_isUnknownContact:equalToUnknownContact:", v7, v6);
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    v7 = v10;
  }

  return v12;
}

+ (BOOL)_isUnknownContact:(id)a3 equalToUnknownContact:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a4;
  objc_msgSend(a3, "idsCanonicalDestinations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "idsCanonicalDestinations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "isEqualToSet:", v11);
  return (char)v6;
}

+ (id)_firstPhoneNumberOrEmailAddressFromContact:(id)a3 formatPhoneNumber:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19[0] = *MEMORY[0x24BDBA348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "areKeysAvailable:", v6);

  if (!v7)
    goto LABEL_6;
  objc_msgSend(v5, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
    objc_msgSend(v10, "formattedInternationalStringValue");
  else
    objc_msgSend(v10, "unformattedInternationalStringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_6:
    v18 = *MEMORY[0x24BDBA288];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "areKeysAvailable:", v13);

    if (v14)
    {
      objc_msgSend(v5, "emailAddresses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (id)_tinCanUserNotificationCenter
{
  void *v2;

  if ((TCSIsProcessTinCan() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF88B8], "currentNotificationCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.tincan"));
  }
  return v2;
}

+ (id)_safeContactNameStringForLogging:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_contact:hasKeysForFormatterStye:", v6, 0))
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v6, 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[TCSContacts _firstPhoneNumberOrEmailAddressFromContact:formatPhoneNumber:](TCSContacts, "_firstPhoneNumberOrEmailAddressFromContact:formatPhoneNumber:", v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v8 = (__CFString *)IDSCopyRawAddressForDestination();
      else
        v8 = CFSTR("[unknown]");
      goto LABEL_8;
    }
  }
  else
  {
    v8 = CFSTR("<name formatter keys missing>");
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v9 = (void *)IDSCopyRawAddressForDestination();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ [%@]"), v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v11;
LABEL_8:

  }
  TCSLogSafeDescription(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_safeContactDetailStringForLogging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("ID: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "_contact:hasKeysForFormatterStye:", v4, 0))
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v4, 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("<name formatter keys missing>");
  }
  if (-[__CFString length](v8, "length"))
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    TCSLogSafeDescription(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" \"%@\"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v11);

  }
  objc_msgSend(a1, "canonicalDestinationsForContact:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    TCSLogSafeDescription(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(" [%@]"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v16);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (BOOL)shouldObserveAllowlistDefaultChanges
{
  return self->_shouldObserveAllowlistDefaultChanges;
}

- (NSMutableDictionary)allowlist
{
  return self->_allowlist;
}

- (void)setAllowlist:(id)a3
{
  objc_storeStrong((id *)&self->_allowlist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowlist, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_allowlistSaveTimer, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setDestinationAsAccepted:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  TCSLogSafeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_21342E000, v4, v5, "%s: attempt to mark destination [%@] as allowed, but it does not exist in the destination list.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)setDestinationAsAccepted:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  TCSLogSafeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_21342E000, v4, v5, "%s: attempt to mark destination [%@] as allowed, which it already was.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_didInitiateCallToDestination:(void *)a1 date:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  TCSLogSafeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_21342E000, v4, v5, "%s called with disallowed destination: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_didReceiveCallFromDestination:(void *)a1 date:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  TCSLogSafeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_21342E000, v4, v5, "%s called with disallowed destination: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)dateAddedForDestination:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  TCSLogSafeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v1, v4, "TCSContacts was asked for date-added info for unallowed destination: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_unifiedMeContactFromContactStore:keysToFetch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v0, v1, "Error fetching me contact: %@", v2);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_unifiedContactWithIdentifier:(void *)a3 orDestination:usingContactStore:keysToFetch:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  TCSLogSafeDescription(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_1_3(&dword_21342E000, v5, v7, "Cannot perform contact lookup using ID:%@ destination:%@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_unifiedContactWithIdentifier:(void *)a1 orDestination:usingContactStore:keysToFetch:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  TCSLogSafeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v1, v4, "Contact lookups for phone number handles containing pause characters is broken, skipping: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v0, v1, "Error fetching contacts: %@", v2);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_unknownContactWithDestination:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v0, v1, "Cannot create an unknown contact with destination: %@", v2);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_contact:(uint64_t)a3 hasKeysForFormatterStye:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;

  v5 = OUTLINED_FUNCTION_5(a1);
  TCSLogSafeDescription(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v9 = 2048;
  v10 = a3;
  OUTLINED_FUNCTION_1_3(&dword_21342E000, v5, v7, "%@ missing keys to use name formatter style %ld!", v8);

  OUTLINED_FUNCTION_1_0();
}

@end
