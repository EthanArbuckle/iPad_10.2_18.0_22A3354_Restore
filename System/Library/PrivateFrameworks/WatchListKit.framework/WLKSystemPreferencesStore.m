@implementation WLKSystemPreferencesStore

+ (id)sharedPreferences
{
  if (sharedPreferences___once != -1)
    dispatch_once(&sharedPreferences___once, &__block_literal_global_27);
  return (id)sharedPreferences___singleInstance;
}

void __46__WLKSystemPreferencesStore_sharedPreferences__block_invoke()
{
  WLKSystemPreferencesStore *v0;
  void *v1;

  os_unfair_lock_lock(&__initLock);
  __isInitializing = 1;
  v0 = objc_alloc_init(WLKSystemPreferencesStore);
  v1 = (void *)sharedPreferences___singleInstance;
  sharedPreferences___singleInstance = (uint64_t)v0;

  __isInitializing = 0;
  os_unfair_lock_unlock(&__initLock);
}

+ (BOOL)isSystemPreferencesStoreInitializing
{
  char v2;

  os_unfair_lock_lock(&__initLock);
  v2 = __isInitializing;
  os_unfair_lock_unlock(&__initLock);
  return v2;
}

- (WLKSystemPreferencesStore)init
{
  WLKSystemPreferencesStore *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  uint64_t v6;
  void *defaultsAccessor;
  id v8;
  uint64_t v9;
  NSUserDefaults *v10;
  _QWORD handler[4];
  WLKSystemPreferencesStore *v13;
  uint8_t buf[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WLKSystemPreferencesStore;
  v2 = -[WLKSystemPreferencesStore init](&v15, sel_init);
  if (v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - init", buf, 2u);
    }

    v4 = dispatch_queue_create("WLKPreferencesQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    if ((WLKIsTVApp() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = objc_claimAutoreleasedReturnValue();
      defaultsAccessor = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v6;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0C99EA0]);
      WLKTVAppBundleID();
      defaultsAccessor = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "initWithSuiteName:", defaultsAccessor);
      v10 = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v9;

    }
    v2->_preferencesDidChangeNotificationToken = 0;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33__WLKSystemPreferencesStore_init__block_invoke;
    handler[3] = &unk_1E68A8820;
    v13 = v2;
    notify_register_dispatch("com.apple.WatchListKit.WLKPreferencesDidChangeNotification", &v2->_preferencesDidChangeNotificationToken, MEMORY[0x1E0C80D38], handler);

  }
  return v2;
}

void __33__WLKSystemPreferencesStore_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &state64);
  if (state64 != getpid())
  {
    WLKSystemLogObject();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v5 = CFSTR("WLKSettingsDidChangeNotification");
      _os_log_impl(&dword_1B515A000, v1, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - Preferences did change - Firing local notification %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("WLKSettingsDidChangeNotification"), 0);

  }
}

- (void)dealloc
{
  int preferencesDidChangeNotificationToken;
  objc_super v4;

  preferencesDidChangeNotificationToken = self->_preferencesDidChangeNotificationToken;
  if (preferencesDidChangeNotificationToken)
    notify_cancel(preferencesDidChangeNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)WLKSystemPreferencesStore;
  -[WLKSystemPreferencesStore dealloc](&v4, sel_dealloc);
}

- (void)setUseCellularDataPlayback:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v4, CFSTR("CellularDataMode"));

}

- (BOOL)useCellularDataPlayback
{
  void *v2;
  char v3;

  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("CellularDataMode"), MEMORY[0x1E0C9AAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCellularQualityPlayback:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("PlaybackQualityCellular"));
}

- (NSString)cellularQualityPlayback
{
  return (NSString *)-[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PlaybackQualityCellular"), CFSTR("GoodQuality"));
}

- (void)setWifiQualityPlayback:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("PlaybackQuality"));
}

- (NSString)wifiQualityPlayback
{
  return (NSString *)-[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PlaybackQuality"), CFSTR("BestQuality"));
}

- (void)setUseCellularDataDownload:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v4, CFSTR("DownloadUseCellular"));

}

- (BOOL)useCellularDataDownload
{
  void *v2;
  char v3;

  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("DownloadUseCellular"), MEMORY[0x1E0C9AAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCellularQualityDownload:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("DownloadQualityCellular"));
}

- (NSString)cellularQualityDownload
{
  return (NSString *)-[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("DownloadQualityCellular"), CFSTR("GoodQualityDownload"));
}

- (void)setWifiQualityDownload:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("DownloadQualityWifi"));
}

- (NSString)wifiQualityDownload
{
  return (NSString *)-[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("DownloadQualityWifi"), CFSTR("GoodQualityDownload"));
}

- (void)setSelectedAudioLanguagesDownload:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("PreferredAudioLanguages"));
}

- (NSArray)selectedAudioLanguagesDownload
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PreferredAudioLanguages"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSubtitleAudioLanguagesDownload:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("PreferredSubtitleLanguages"));
}

- (NSArray)subtitleAudioLanguagesDownload
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PreferredSubtitleLanguages"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSubtitleDefaultLanguageEnabledDownload:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v4, CFSTR("UseDefaultSubtitleLanguages"));

}

- (BOOL)subtitleDefaultLanguageEnabledDownload
{
  void *v2;
  char v3;

  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("UseDefaultSubtitleLanguages"), MEMORY[0x1E0C9AAB0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAudioLanguageCode:(id)a3
{
  id v4;
  id v5;
  id v6;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AUTO_SENTINEL_VALUE")))
  {

    v4 = 0;
  }
  else
  {
    v4 = v5;
  }
  v6 = v4;
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v4, CFSTR("PreferredAudioLanguageCodeV2"));

}

- (NSString)audioLanguageCodeIncludingSentinel
{
  __CFString *v2;

  -[WLKSystemPreferencesStore audioLanguageCode](self, "audioLanguageCode");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("AUTO_SENTINEL_VALUE");
  return (NSString *)v2;
}

- (NSString)audioLanguageCode
{
  return (NSString *)-[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PreferredAudioLanguageCodeV2"), 0);
}

- (void)setSupplementaryAvailableAudioLanguages:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("SupplementaryAvailableAudioLanguages"));
}

- (NSArray)supplementaryAvailableAudioLanguages
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("SupplementaryAvailableAudioLanguages"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setPurchaseResolution:(id)a3
{
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", a3, CFSTR("PreferredPurchaseResolution"));
}

- (NSString)purchaseResolution
{
  return (NSString *)-[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PreferredPurchaseResolution"), CFSTR("0"));
}

- (void)setHasAVAdapterEvenBeenConnected:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v4, CFSTR("HasAVAdapterEverBeenConnected"));

}

- (BOOL)hasAVAdapterEvenBeenConnected
{
  void *v2;
  char v3;

  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("HasAVAdapterEverBeenConnected"), MEMORY[0x1E0C9AAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDownloadsCompatibleWithAVAdapter:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v4, CFSTR("DownloadsCompatibleWithAVAdapter"));

}

- (BOOL)downloadsCompatibleWithAVAdapter
{
  void *v2;
  char v3;

  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("DownloadsCompatibleWithAVAdapter"), MEMORY[0x1E0C9AAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPreferredPlaybackDimensionality:(id)a3
{
  -[WLKSystemPreferencesStore _setDefaultsValue:key:syncNPS:](self, "_setDefaultsValue:key:syncNPS:", a3, CFSTR("PreferredPlaybackDimensionality"), 0);
}

- (NSNumber)preferredPlaybackDimensionality
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = &unk_1E68C9938;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__WLKSystemPreferencesStore_preferredPlaybackDimensionality__block_invoke;
  v5[3] = &unk_1E68A8CE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __60__WLKSystemPreferencesStore_preferredPlaybackDimensionality__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("PreferredPlaybackDimensionality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "integerForKey:", CFSTR("PreferredPlaybackDimensionality")));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = &unk_1E68C9938;
  }

}

- (void)setPrivateModeEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setDefaultsValue:key:syncNPS:](self, "_setDefaultsValue:key:syncNPS:", v4, CFSTR("PrivateModeEnabled"), 0);

}

- (BOOL)privateModeEnabled
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_defaultsAccessor, "objectForKey:", CFSTR("PrivateModeEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 && -[NSUserDefaults BOOLForKey:](self->_defaultsAccessor, "BOOLForKey:", CFSTR("PrivateModeEnabled"));
}

- (void)setSportsScoreSpoilersAllowed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setDefaultsValue:key:syncNPS:](self, "_setDefaultsValue:key:syncNPS:", v4, CFSTR("SportsScoreSpoilersAllowed"), 1);

}

- (BOOL)sportsScoreSpoilersAllowed
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_defaultsAccessor, "objectForKey:", CFSTR("SportsScoreSpoilersAllowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3
      || -[NSUserDefaults BOOLForKey:](self->_defaultsAccessor, "BOOLForKey:", CFSTR("SportsScoreSpoilersAllowed"));
}

- (void)setPostPlayAutoPlayNextVideo:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setDefaultsValue:key:syncNPS:](self, "_setDefaultsValue:key:syncNPS:", v4, CFSTR("PostPlayAutoPlayNextVideo"), 1);

}

- (BOOL)postPlayAutoPlayNextVideo
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_defaultsAccessor, "objectForKey:", CFSTR("PostPlayAutoPlayNextVideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3
      || -[NSUserDefaults BOOLForKey:](self->_defaultsAccessor, "BOOLForKey:", CFSTR("PostPlayAutoPlayNextVideo"));
}

- (void)setUpNextLockupsUseCoverArt:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WLKSystemPreferencesStore _setDefaultsValue:key:syncNPS:](self, "_setDefaultsValue:key:syncNPS:", v4, CFSTR("UpNextLockupsUseCoverArt"), 0);

}

- (BOOL)upNextLockupsUseCoverArt
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_defaultsAccessor, "objectForKey:", CFSTR("UpNextLockupsUseCoverArt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 && -[NSUserDefaults BOOLForKey:](self->_defaultsAccessor, "BOOLForKey:", CFSTR("UpNextLockupsUseCoverArt"));
}

- (void)_publishCrossProcessPreferencesChangedNotification
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__WLKSystemPreferencesStore__publishCrossProcessPreferencesChangedNotification__block_invoke;
  v3[3] = &unk_1E68A7FC0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __79__WLKSystemPreferencesStore__publishCrossProcessPreferencesChangedNotification__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  int v2;
  pid_t v3;
  _DWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[2];
    v4 = WeakRetained;
    v3 = getpid();
    notify_set_state(v2, v3);
    notify_post("com.apple.WatchListKit.WLKPreferencesDidChangeNotification");
    WeakRetained = v4;
  }

}

- (void)_setDefaultsValue:(id)a3 key:(id)a4 syncNPS:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WLKSystemPreferencesStore__setDefaultsValue_key_syncNPS___block_invoke;
  block[3] = &unk_1E68A8D08;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(accessQueue, block);
  -[WLKSystemPreferencesStore _publishCrossProcessPreferencesChangedNotification](self, "_publishCrossProcessPreferencesChangedNotification");

}

void __59__WLKSystemPreferencesStore__setDefaultsValue_key_syncNPS___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - set UserDefaults value %@ for key %@", buf, 0x16u);
  }

  if (*(_BYTE *)(a1 + 56))
  {
    v5 = (void *)objc_opt_class();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_synchronizeSettingsDefaultsForKeys:", v8);

  }
}

- (void)_setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  CFPreferencesSetAppValue(v7, v6, CFSTR("com.apple.videos-preferences"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.videos-preferences"));
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = CFSTR("com.apple.videos-preferences");
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - set CFPrefs value %@ for key %@ in domain %@", (uint8_t *)&v9, 0x20u);
  }

  -[WLKSystemPreferencesStore _publishCrossProcessPreferencesChangedNotification](self, "_publishCrossProcessPreferencesChangedNotification");
}

- (id)_getPreferencesValue:(id)a3 fallbackValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.videos-preferences"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
      v8 = v5;
    else
      v8 = v6;
    v9 = v8;

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)migratePrivateModeFromDiskIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("PrivateModeEnabled"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PrivateModeEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PrivateModeEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v7, CFSTR("PrivateModeEnabled"));

LABEL_4:
  }

}

- (void)migrateSportsSpoilersFromDiskIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WLKSystemPreferencesStore _getPreferencesValue:fallbackValue:](self, "_getPreferencesValue:fallbackValue:", CFSTR("SportsScoreSpoilersAllowed"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SportsScoreSpoilersAllowed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SportsScoreSpoilersAllowed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKSystemPreferencesStore _setPreferencesValue:forKey:](self, "_setPreferencesValue:forKey:", v7, CFSTR("SportsScoreSpoilersAllowed"));

LABEL_4:
  }

}

+ (void)_synchronizeSettingsDefaultsForKeys:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WLKSystemPreferencesStore__synchronizeSettingsDefaultsForKeys___block_invoke;
  block[3] = &unk_1E68A80F8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __65__WLKSystemPreferencesStore__synchronizeSettingsDefaultsForKeys___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - NPSManager sync begin", buf, 2u);
  }

  v3 = objc_alloc_init(MEMORY[0x1E0D51618]);
  WLKTVAppBundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:", v4, *(_QWORD *)(a1 + 32));

  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - NPSManager sync end", v6, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_defaultsAccessor, 0);
}

@end
