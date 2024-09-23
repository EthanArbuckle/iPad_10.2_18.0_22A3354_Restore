@implementation SiriUICachedUserNotificationsSettings

- (SiriUICachedUserNotificationsSettings)init
{
  SiriUICachedUserNotificationsSettings *v2;
  uint64_t v3;
  NSMapTable *appObservers;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableDictionary *appNotificationSettings;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SiriUICachedUserNotificationsSettings;
  v2 = -[SiriUICachedUserNotificationsSettings init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    appObservers = v2->_appObservers;
    v2->_appObservers = (NSMapTable *)v3;

    v5 = dispatch_queue_create("SiriUICachedUserNotificationsSettings", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    appNotificationSettings = v2->_appNotificationSettings;
    v2->_appNotificationSettings = (NSMutableDictionary *)v7;

    objc_initWeak(&location, v2);
    v9 = v2->_queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __45__SiriUICachedUserNotificationsSettings_init__block_invoke;
    v11[3] = &unk_24D7D94A0;
    objc_copyWeak(&v12, &location);
    dispatch_async(v9, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__SiriUICachedUserNotificationsSettings_init__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = WeakRetained[3];
    WeakRetained[3] = (id)v1;

    objc_msgSend(WeakRetained[3], "setDelegate:");
    objc_msgSend(WeakRetained, "_updateNotificationSystemSettingsChangeFromSettingsCenter:notifyObservers:", WeakRetained[3], 1);
  }

}

- (void)addObserver:(id)a3 forAppBundleId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__SiriUICachedUserNotificationsSettings_addObserver_forAppBundleId___block_invoke;
    v9[3] = &unk_24D7D94C8;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __68__SiriUICachedUserNotificationsSettings_addObserver_forAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addObserver:forAppBundleId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3 forAppBundleId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71__SiriUICachedUserNotificationsSettings_removeObserver_forAppBundleId___block_invoke;
    v9[3] = &unk_24D7D94C8;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __71__SiriUICachedUserNotificationsSettings_removeObserver_forAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeObserver:forAppBundleId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)syncAnnounceNotificationsEnabledForAppBundleId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__SiriUICachedUserNotificationsSettings_syncAnnounceNotificationsEnabledForAppBundleId___block_invoke;
  v8[3] = &unk_24D7D94F0;
  v10 = &v13;
  objc_copyWeak(&v11, &location);
  v9 = v4;
  v6 = v4;
  dispatch_sync(queue, v8);
  LOBYTE(queue) = *((_BYTE *)v14 + 24);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)queue;
}

void __88__SiriUICachedUserNotificationsSettings_syncAnnounceNotificationsEnabledForAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_announceNotificationsEnabledForAppBundleId:", *(_QWORD *)(a1 + 32));

}

- (BOOL)syncNotificationBannersVisibleInCarPlayForAppBundleId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__SiriUICachedUserNotificationsSettings_syncNotificationBannersVisibleInCarPlayForAppBundleId___block_invoke;
  v8[3] = &unk_24D7D94F0;
  v10 = &v13;
  objc_copyWeak(&v11, &location);
  v9 = v4;
  v6 = v4;
  dispatch_sync(queue, v8);
  LOBYTE(queue) = *((_BYTE *)v14 + 24);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)queue;
}

void __95__SiriUICachedUserNotificationsSettings_syncNotificationBannersVisibleInCarPlayForAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_notificationBannersVisibleInCarPlayForAppBundleId:", *(_QWORD *)(a1 + 32));

}

- (id)cachedNotificationSettingsForAppBundleId:(id)a3 asyncFetchNewValuesAndUpdateObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *queue;
  AppNotificationSettings *v9;
  AppNotificationSettings *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appNotificationSettings, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v6, "length"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __120__SiriUICachedUserNotificationsSettings_cachedNotificationSettingsForAppBundleId_asyncFetchNewValuesAndUpdateObservers___block_invoke;
    v12[3] = &unk_24D7D94C8;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v7;
    dispatch_async(queue, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if (v7)
    v9 = v7;
  else
    v9 = -[AppNotificationSettings initWithAnnounceEnabled:carPlayBannersEnabled:]([AppNotificationSettings alloc], "initWithAnnounceEnabled:carPlayBannersEnabled:", 0, 0);
  v10 = v9;

  return v10;
}

void __120__SiriUICachedUserNotificationsSettings_cachedNotificationSettingsForAppBundleId_asyncFetchNewValuesAndUpdateObservers___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateNotificationSettingsChangeAndNotifyObserversForAppBundleId:ifDifferentFromSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (int64_t)announceCarPlaySetting
{
  return self->_cachedAnnounceCarPlaySetting;
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __108__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSystemSettings___block_invoke;
  v8[3] = &unk_24D7D9518;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __108__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSystemSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNotificationSystemSettingsChangeFromSettingsCenter:notifyObservers:", *(_QWORD *)(a1 + 40), 1);
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SiriUICachedUserNotificationsSettings *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke;
  block[3] = &unk_24D7D9540;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __111__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_updateNotificationSettingsChangeForAppBundleId:fromSettingsCenter:notifyObservers:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(_QWORD *)(a1 + 48), 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_addObserver:(id)a3 forAppBundleId:(id)a4
{
  NSMapTable *appObservers;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  appObservers = self->_appObservers;
  v7 = a4;
  -[NSMapTable objectForKey:](appObservers, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v8, "containsObject:", v9) & 1) == 0)
    objc_msgSend(v8, "addObject:", v9);
  -[NSMapTable setObject:forKey:](self->_appObservers, "setObject:forKey:", v8, v7);
  -[SiriUICachedUserNotificationsSettings _updateNotificationSettingsChangeForAppBundleId:fromSettingsCenter:notifyObservers:](self, "_updateNotificationSettingsChangeForAppBundleId:fromSettingsCenter:notifyObservers:", v7, self->_notificationsSettingsCenter, 0);

}

- (void)_removeObserver:(id)a3 forAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_appObservers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "removeObject:", v9);
  if (!objc_msgSend(v8, "count"))
    -[NSMapTable removeObjectForKey:](self->_appObservers, "removeObjectForKey:", v6);
  -[NSMutableDictionary removeObjectForKey:](self->_appNotificationSettings, "removeObjectForKey:", v6);

}

- (BOOL)_announceNotificationsEnabledForAppBundleId:(id)a3
{
  void *v3;
  char v4;

  -[SiriUICachedUserNotificationsSettings _appNotificationSettingsForAppBundleId:](self, "_appNotificationSettingsForAppBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnnounceEnabled");

  return v4;
}

- (BOOL)_notificationBannersVisibleInCarPlayForAppBundleId:(id)a3
{
  void *v3;
  char v4;

  -[SiriUICachedUserNotificationsSettings _appNotificationSettingsForAppBundleId:](self, "_appNotificationSettingsForAppBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areCarPlayBannersEnabled");

  return v4;
}

- (id)_appNotificationSettingsForAppBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appNotificationSettings, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SiriUICachedUserNotificationsSettings _appNotificationSettingsForAppBundleId:fromSettingsCenter:](self, "_appNotificationSettingsForAppBundleId:fromSettingsCenter:", v4, self->_notificationsSettingsCenter);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_appNotificationSettingsForAppBundleId:(id)a3 fromSettingsCenter:(id)a4
{
  UNNotificationSettingsCenter *notificationsSettingsCenter;
  id v6;
  _BOOL8 v7;
  _BOOL8 v8;

  notificationsSettingsCenter = self->_notificationsSettingsCenter;
  v6 = a3;
  v7 = -[SiriUICachedUserNotificationsSettings _announceNotificationsEnabledForAppBundleId:fromSettingsCenter:](self, "_announceNotificationsEnabledForAppBundleId:fromSettingsCenter:", v6, notificationsSettingsCenter);
  v8 = -[SiriUICachedUserNotificationsSettings _notificationBannersVisibleInCarPlayForAppBundleId:fromSettingsCenter:](self, "_notificationBannersVisibleInCarPlayForAppBundleId:fromSettingsCenter:", v6, self->_notificationsSettingsCenter);

  return -[AppNotificationSettings initWithAnnounceEnabled:carPlayBannersEnabled:]([AppNotificationSettings alloc], "initWithAnnounceEnabled:carPlayBannersEnabled:", v7, v8);
}

- (void)_updateNotificationSystemSettingsChangeFromSettingsCenter:(id)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int64_t v7;

  v4 = a4;
  objc_msgSend(a3, "notificationSystemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "announcementCarPlaySetting");

  if (v7 != self->_cachedAnnounceCarPlaySetting)
  {
    self->_cachedAnnounceCarPlaySetting = v7;
    if (v4)
      -[SiriUICachedUserNotificationsSettings _notifyAllObserversThatPreferencesDidChange](self, "_notifyAllObserversThatPreferencesDidChange");
  }
}

- (void)_updateNotificationSettingsChangeForAppBundleId:(id)a3 fromSettingsCenter:(id)a4 notifyObservers:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  if (-[SiriUICachedUserNotificationsSettings _currentlyObservingForAppBundleId:](self, "_currentlyObservingForAppBundleId:", v11))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_appNotificationSettings, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUICachedUserNotificationsSettings _appNotificationSettingsForAppBundleId:fromSettingsCenter:](self, "_appNotificationSettingsForAppBundleId:fromSettingsCenter:", v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appNotificationSettings, "setObject:forKeyedSubscript:", v10, v11);
      if (v5)
        -[SiriUICachedUserNotificationsSettings _notifyAllObserversWithAppBundleIdThatPreferencesDidChange:](self, "_notifyAllObserversWithAppBundleIdThatPreferencesDidChange:", v11);
    }

  }
}

- (void)_updateNotificationSettingsChangeAndNotifyObserversForAppBundleId:(id)a3 ifDifferentFromSettings:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[SiriUICachedUserNotificationsSettings _currentlyObservingForAppBundleId:](self, "_currentlyObservingForAppBundleId:", v8))
  {
    -[SiriUICachedUserNotificationsSettings _appNotificationSettingsForAppBundleId:fromSettingsCenter:](self, "_appNotificationSettingsForAppBundleId:fromSettingsCenter:", v8, self->_notificationsSettingsCenter);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appNotificationSettings, "setObject:forKeyedSubscript:", v7, v8);
      -[SiriUICachedUserNotificationsSettings _notifyAllObserversWithAppBundleIdThatPreferencesDidChange:](self, "_notifyAllObserversWithAppBundleIdThatPreferencesDidChange:", v8);
    }

  }
}

- (BOOL)_announceNotificationsEnabledForAppBundleId:(id)a3 fromSettingsCenter:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a4, "notificationSourceWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "announcementSetting") == 2;

  return v7;
}

- (BOOL)_notificationBannersVisibleInCarPlayForAppBundleId:(id)a3 fromSettingsCenter:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a4, "notificationSourceWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "carPlaySetting") == 2;

  return v7;
}

- (BOOL)_currentlyObservingForAppBundleId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable keyEnumerator](self->_appObservers, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqualToString:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_notifyAllObserversThatPreferencesDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMapTable keyEnumerator](self->_appObservers, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SiriUICachedUserNotificationsSettings _notifyAllObserversWithAppBundleIdThatPreferencesDidChange:](self, "_notifyAllObserversWithAppBundleIdThatPreferencesDidChange:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_notifyAllObserversWithAppBundleIdThatPreferencesDidChange:(id)a3
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
  -[NSMapTable objectForKey:](self->_appObservers, "objectForKey:", v4);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cachedSettings:didChangeForAppBundleId:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)cachedAnnounceCarPlaySetting
{
  return self->_cachedAnnounceCarPlaySetting;
}

- (void)setCachedAnnounceCarPlaySetting:(int64_t)a3
{
  self->_cachedAnnounceCarPlaySetting = a3;
}

- (NSMutableDictionary)appNotificationSettings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppNotificationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNotificationSettings, 0);
  objc_storeStrong((id *)&self->_notificationsSettingsCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appObservers, 0);
}

@end
