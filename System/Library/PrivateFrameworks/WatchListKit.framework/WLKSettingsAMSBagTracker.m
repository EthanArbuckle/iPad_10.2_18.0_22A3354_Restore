@implementation WLKSettingsAMSBagTracker

+ (id)sharedTracker
{
  if (sharedTracker___once != -1)
    dispatch_once(&sharedTracker___once, &__block_literal_global_13);
  return (id)sharedTracker___singleInstance;
}

void __41__WLKSettingsAMSBagTracker_sharedTracker__block_invoke()
{
  WLKSettingsAMSBagTracker *v0;
  void *v1;

  v0 = objc_alloc_init(WLKSettingsAMSBagTracker);
  v1 = (void *)sharedTracker___singleInstance;
  sharedTracker___singleInstance = (uint64_t)v0;

}

- (WLKSettingsAMSBagTracker)init
{
  WLKSettingsAMSBagTracker *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSDictionary *trackedBagKeys;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)WLKSettingsAMSBagTracker;
  v2 = -[WLKSettingsAMSBagTracker init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10[0] = kBagKeyUVSearchNowPlayingEnabled;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("uvSearch"));

    v5 = objc_msgSend(v3, "copy");
    trackedBagKeys = v2->_trackedBagKeys;
    v2->_trackedBagKeys = (NSDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AMSBagTracker_SportsEnabledKey"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKSettingsAMSBagTracker _removeInactiveKeys:](v2, "_removeInactiveKeys:", v7);

  }
  return v2;
}

- (void)updateTrackedBagValues
{
  NSObject *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - updateTrackedBagValues", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_trackedBagKeys;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSDictionary objectForKey:](self->_trackedBagKeys, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLKSettingsAMSBagTracker _updateKeys:](self, "_updateKeys:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)updateTrackedBagValuesWithChangedKeys:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - Update tracked bag values did change", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_trackedBagKeys, "objectForKey:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[NSDictionary objectForKey:](self->_trackedBagKeys, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WLKSettingsAMSBagTracker _updateKeys:](self, "_updateKeys:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

}

- (id)isNowPlayingEnabled
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AMSBagTracker_NowPlayingEnabledKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateBoolValueForTrackedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", kBagKeyUVSearchNowPlayingEnabled))
  {
    objc_msgSend(MEMORY[0x1E0DB1840], "app");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedBooleanForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - Update now playing enabled: %d", (uint8_t *)v9, 8u);
    }

    -[WLKSettingsAMSBagTracker _setIsNowPlayingEnabled:](self, "_setIsNowPlayingEnabled:", v7);
  }

}

- (void)_updateKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[WLKSettingsAMSBagTracker _updateBoolValueForTrackedKey:](self, "_updateBoolValueForTrackedKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setIsNowPlayingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("AMSBagTracker_NowPlayingEnabledKey"));

}

- (void)_removeInactiveKeys:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v5 = 138412290;
    v14 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObjectForKey:", v9);

          WLKSystemLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v9;
            _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "WLKSettingsAMSBagTracker - Removed object from user defaults for key: %@", buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }

}

- (NSDictionary)trackedBagKeys
{
  return self->_trackedBagKeys;
}

- (void)setTrackedBagKeys:(id)a3
{
  objc_storeStrong((id *)&self->_trackedBagKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedBagKeys, 0);
}

@end
