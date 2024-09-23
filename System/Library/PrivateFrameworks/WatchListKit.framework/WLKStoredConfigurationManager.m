@implementation WLKStoredConfigurationManager

void __54__WLKStoredConfigurationManager__updateConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    WLKSystemLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Unsupported type in rrkvp key:%@ obj:%@", (uint8_t *)&v13, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __47__WLKStoredConfigurationManager_sharedInstance__block_invoke()
{
  WLKStoredConfigurationManager *v0;
  void *v1;

  v0 = objc_alloc_init(WLKStoredConfigurationManager);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (WLKStoredConfigurationManager)init
{
  WLKStoredConfigurationManager *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLKStoredConfigurationManager;
  v3 = -[WLKStoredConfigurationManager init](&v7, sel_init);
  if (v3 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleLibraryChange_, CFSTR("WLKAppLibraryDidChangeNotification"), 0);
    +[WLKAccountMonitor sharedInstance](WLKAccountMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleAccountChange_, CFSTR("WLKAccountMonitorAccountDidChange"), v5);

  }
  return v3;
}

- (void)_updateConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;
  uint8_t v17[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - _updateConfiguration", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isActiveUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("activeUser"));
  objc_msgSend(v4, "vppaStatusString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("vppaState"));
  objc_msgSend(v4, "utsc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("utsc"));
  objc_msgSend(v4, "requiredRequestKeyValuePairsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__WLKStoredConfigurationManager__updateConfiguration___block_invoke;
  v12[3] = &unk_1E68A7B50;
  v12[4] = buf;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (v14[24])
  {
    if (v10)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("rrkvp"));
    if (objc_msgSend(v6, "count"))
      -[WLKStoredConfigurationManager _setStoredConfiguration:](self, "_setStoredConfiguration:", v6);
  }
  else
  {
    WLKSystemLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v17 = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Unsupported type in rrkvp %@. Will not persist.", v17, 0xCu);
    }

  }
  _Block_object_dispose(buf, 8);

}

- (void)_setStoredConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  pid_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v4, "objectForKey:", CFSTR("storedConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v5;
  v8 = v7;
  if (v7 == v6)
  {

  }
  else
  {
    if (v6 && v7)
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
    WLKSystemLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Stored config did change. Posting notification from:%@ to:%@", (uint8_t *)&v16, 0x16u);
    }

    v11 = getpid();
    notify_set_state(0, v11);
    notify_post("com.apple.WatchListKit.WLKStoredConfigurationDidChangeDispatchNotification");
    if (v6)
    {
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("storedConfig"));
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSince1970");
      objc_msgSend(v12, "numberWithDouble:", floor(v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("storedConfigTimestamp"));

    }
    else
    {
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("storedConfig"));
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("storedConfigTimestamp"));
    }
  }
LABEL_13:

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_47);
  return (id)sharedInstance_sInstance;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WLKStoredConfigurationManager;
  -[WLKStoredConfigurationManager dealloc](&v4, sel_dealloc);
}

- (void)_invalidateWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKStoredConfigurationManager - Invalidating for reason: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WLKStoredConfigurationManager__invalidateWithReason___block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __55__WLKStoredConfigurationManager__invalidateWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStoredConfiguration:", 0);
}

- (void)_handleLibraryChange:(id)a3
{
  -[WLKStoredConfigurationManager _invalidateWithReason:](self, "_invalidateWithReason:", CFSTR("libraryChanged"));
}

- (void)_handleAccountChange:(id)a3
{
  -[WLKStoredConfigurationManager _invalidateWithReason:](self, "_invalidateWithReason:", CFSTR("accountChanged"));
}

- (WLKStoredConfiguration)storedConfiguration
{
  void *v2;
  void *v3;
  WLKStoredConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v2, "objectForKey:", CFSTR("storedConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(WLKStoredConfiguration);
    -[WLKStoredConfiguration setActiveUser:](v4, "setActiveUser:", objc_msgSend(v3, "wlk_BOOLForKey:defaultValue:", CFSTR("activeUser"), 0));
    objc_msgSend(v3, "wlk_stringForKey:", CFSTR("vppaState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKStoredConfiguration setVppaState:](v4, "setVppaState:", v5);
    objc_msgSend(v3, "wlk_stringForKey:", CFSTR("utsc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKStoredConfiguration setUtsc:](v4, "setUtsc:", v6);
    objc_msgSend(v3, "wlk_dictionaryForKey:", CFSTR("rrkvp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKStoredConfiguration setRequiredRequestKeyValuePairs:](v4, "setRequiredRequestKeyValuePairs:", v7);
    objc_msgSend(v2, "objectForKey:", CFSTR("storedConfigTimestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLKStoredConfiguration setTimestamp:](v4, "setTimestamp:", v11);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setStoredConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_storedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedConfiguration, 0);
}

@end
