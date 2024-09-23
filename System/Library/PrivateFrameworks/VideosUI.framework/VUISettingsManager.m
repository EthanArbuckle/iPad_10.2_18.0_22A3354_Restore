@implementation VUISettingsManager

void __36__VUISettingsManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUISettingsManager _init]([VUISettingsManager alloc], "_init");
  v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;

}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_3 != -1)
    dispatch_once(&sharedInstance___onceToken_3, &__block_literal_global_26);
  return (id)sharedInstance___instance_1;
}

- (id)preferencesJSONData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISettingsManager maxMovieRank](self, "maxMovieRank");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("maxMovieRank"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("maxMovieRank"));

  }
  -[VUISettingsManager maxTVShowRank](self, "maxTVShowRank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("maxTVShowRank"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("maxTVShowRank"));

  }
  -[VUISettingsManager preferredVideoFormat](self, "preferredVideoFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("preferredVideoFormat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUISettingsManager upNextLockupsUseCoverArt](self, "upNextLockupsUseCoverArt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("upNextLockupsUseCoverArt"));

  -[VUISettingsManager isRTL](self, "isRTL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isRTL"));

  return v3;
}

- (BOOL)upNextLockupsUseCoverArt
{
  return self->_upNextLockupsUseCoverArt;
}

- (NSString)preferredVideoFormat
{
  return self->_preferredVideoFormat;
}

- (NSNumber)maxTVShowRank
{
  return self->_maxTVShowRank;
}

- (NSNumber)maxMovieRank
{
  return self->_maxMovieRank;
}

- (id)_init
{
  VUISettingsManager *v2;
  VUISettingsManager *v3;
  uint64_t v4;
  NSNumber *maxMovieRank;
  uint64_t v6;
  NSNumber *maxTVShowRank;
  uint64_t v8;
  NSString *preferredVideoFormat;
  uint64_t v10;
  NSNumber *isRTL;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VUISettingsManager;
  v2 = -[VUISettingsManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUISettingsManager _restrictionsMaximumEffectiveMovieRanking](v2, "_restrictionsMaximumEffectiveMovieRanking");
    v4 = objc_claimAutoreleasedReturnValue();
    maxMovieRank = v3->_maxMovieRank;
    v3->_maxMovieRank = (NSNumber *)v4;

    -[VUISettingsManager _restrictionsMaximumEffectiveTVShowRanking](v3, "_restrictionsMaximumEffectiveTVShowRanking");
    v6 = objc_claimAutoreleasedReturnValue();
    maxTVShowRank = v3->_maxTVShowRank;
    v3->_maxTVShowRank = (NSNumber *)v6;

    -[VUISettingsManager _formatStringForVideoFormat:](v3, "_formatStringForVideoFormat:", -[VUISettingsManager _preferredVideoFormat](v3, "_preferredVideoFormat"));
    v8 = objc_claimAutoreleasedReturnValue();
    preferredVideoFormat = v3->_preferredVideoFormat;
    v3->_preferredVideoFormat = (NSString *)v8;

    -[VUISettingsManager _isRTL](v3, "_isRTL");
    v10 = objc_claimAutoreleasedReturnValue();
    isRTL = v3->_isRTL;
    v3->_isRTL = (NSNumber *)v10;

    -[VUISettingsManager createSettingsStore](v3, "createSettingsStore");
  }
  -[VUISettingsManager _setupNotificationObservers](v3, "_setupNotificationObservers");
  return v3;
}

- (BOOL)_hasRestrictionsChanged
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  NSNumber *v11;
  NSNumber *maxMovieRank;
  NSNumber *v13;
  NSNumber *maxTVShowRank;
  BOOL v15;
  NSObject *v16;
  NSNumber *v17;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  uint8_t buf[16];

  -[VUISettingsManager _restrictionsMaximumEffectiveMovieRanking](self, "_restrictionsMaximumEffectiveMovieRanking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISettingsManager _restrictionsMaximumEffectiveTVShowRanking](self, "_restrictionsMaximumEffectiveTVShowRanking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISettingsManager restrictions](self, "restrictions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

LABEL_10:
    v11 = (NSNumber *)objc_msgSend(v3, "copy");
    maxMovieRank = self->_maxMovieRank;
    self->_maxMovieRank = v11;

    v13 = (NSNumber *)objc_msgSend(v4, "copy");
    maxTVShowRank = self->_maxTVShowRank;
    self->_maxTVShowRank = v13;

    v15 = 0;
    goto LABEL_14;
  }
  if (v7)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {

  }
  else
  {
    v10 = objc_msgSend(v6, "isEqual:", v7);

    if ((v10 & 1) != 0)
      goto LABEL_10;
  }
  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_INFO, "VUISettingsManager - Content restrictions did change", buf, 2u);
  }

  v17 = (NSNumber *)objc_msgSend(v3, "copy");
  v18 = self->_maxMovieRank;
  self->_maxMovieRank = v17;

  v19 = (NSNumber *)objc_msgSend(v4, "copy");
  v20 = self->_maxTVShowRank;
  self->_maxTVShowRank = v19;

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_35);
  v15 = 1;
LABEL_14:

  return v15;
}

- (NSString)restrictions
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->_maxMovieRank, self->_maxTVShowRank);
}

- (BOOL)_hasPreferredVideoFormatChanged
{
  void *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *preferredVideoFormat;

  -[VUISettingsManager _formatStringForVideoFormat:](self, "_formatStringForVideoFormat:", -[VUISettingsManager _preferredVideoFormat](self, "_preferredVideoFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_preferredVideoFormat;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v5 && v4)
      v7 = -[NSString isEqual:](v4, "isEqual:", v5);
  }

  v8 = (NSString *)-[NSString copy](v6, "copy");
  preferredVideoFormat = self->_preferredVideoFormat;
  self->_preferredVideoFormat = v8;

  if ((v7 & 1) == 0)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_36);

  return v7 ^ 1;
}

- (unint64_t)_preferredVideoFormat
{
  void *v2;
  unint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("PreferredPurchaseResolution"), CFSTR("com.apple.videos-preferences"));
  v3 = v2 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "integerValue") == 1;

  return v3;
}

- (id)_formatStringForVideoFormat:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("SD");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("HD");
}

- (void)createSettingsStore
{
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  WLKSystemPreferencesStore *v9;
  WLKSystemPreferencesStore *preferencesStore;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__VUISettingsManager_createSettingsStore__block_invoke;
  aBlock[3] = &unk_1E9F9B250;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = objc_msgSend(MEMORY[0x1E0DC8860], "isSystemPreferencesStoreInitializing");
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings - WLKSystemPreferencesStore is initializing", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __41__VUISettingsManager_createSettingsStore__block_invoke_22;
    v11[3] = &unk_1E9F9A060;
    objc_copyWeak(&v13, &buf);
    v12 = v4;
    dispatch_async(v8, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&buf);
  }
  else
  {
    if (v7)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings - WLKSystemPreferencesStore already initialized", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
    v9 = (WLKSystemPreferencesStore *)objc_claimAutoreleasedReturnValue();
    preferencesStore = self->_preferencesStore;
    self->_preferencesStore = v9;

    (*((void (**)(void *, VUISettingsManager *))v4 + 2))(v4, self);
  }

}

void __41__VUISettingsManager_createSettingsStore__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BYTE *v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v3[8] = objc_msgSend(v2, "_upNextLockupsUseCoverArt");
  objc_msgSend(v3, "checkAndUpdateSettings");

}

- (void)checkAndUpdateSettings
{
  NSObject *v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;
  _BOOL4 v7;
  NSObject *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[16];

  if (self->_preferencesStore)
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings", buf, 2u);
    }

    v4 = -[VUISettingsManager _hasRestrictionsChanged](self, "_hasRestrictionsChanged");
    v5 = -[VUISettingsManager _hasPreferredVideoFormatChanged](self, "_hasPreferredVideoFormatChanged");
    v6 = -[VUISettingsManager _hasUpNextLockupsUseCoverArtChanged](self, "_hasUpNextLockupsUseCoverArtChanged");
    v7 = -[VUISettingsManager _hasRTLChanged](self, "_hasRTLChanged");
    if (v4 || v5 || v6 || v7)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__VUISettingsManager_checkAndUpdateSettings__block_invoke;
      v9[3] = &__block_descriptor_33_e8_v12__0B8l;
      v10 = v6;
      -[VUISettingsManager _sendSettingsValuesToJS:](self, "_sendSettingsValuesToJS:", v9);
    }
    else
    {
      VUIDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings - nothing has changed", buf, 2u);
      }

    }
  }
}

- (BOOL)_hasUpNextLockupsUseCoverArtChanged
{
  int upNextLockupsUseCoverArt;
  int v4;

  upNextLockupsUseCoverArt = self->_upNextLockupsUseCoverArt;
  v4 = -[VUISettingsManager _upNextLockupsUseCoverArt](self, "_upNextLockupsUseCoverArt");
  self->_upNextLockupsUseCoverArt = v4;
  return upNextLockupsUseCoverArt != v4;
}

- (BOOL)_upNextLockupsUseCoverArt
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "upNextLockupsUseCoverArt");

  return v3;
}

- (void)_setupNotificationObservers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePreferencesChange_, *MEMORY[0x1E0DC89D8], 0);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self);

}

- (VUISettingsManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented"), CFSTR("-[VUISettingsManager init] not supported, use +sharedInstance instead"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

void __44__VUISettingsManager_checkAndUpdateSettings__block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("VUIUpNextLockupArtSettingDidChangeNotification"), 0);

  }
}

void __41__VUISettingsManager_createSettingsStore__block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_initWeak(&location, WeakRetained);
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__VUISettingsManager_createSettingsStore__block_invoke_2;
  v5[3] = &unk_1E9F99600;
  objc_copyWeak(&v8, &location);
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __41__VUISettingsManager_createSettingsStore__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong(WeakRetained + 6, *(id *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isAppInstallationAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUIAppInstallationAllowed");

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[VUISettingsManager _teardownNotificationObservers](self, "_teardownNotificationObservers");
  v3.receiver = self;
  v3.super_class = (Class)VUISettingsManager;
  -[VUISettingsManager dealloc](&v3, sel_dealloc);
}

- (void)_teardownNotificationObservers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

}

- (void)_sendSettingsValuesToJS:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISettingsManager preferencesJSONData](self, "preferencesJSONData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke;
  v13[3] = &unk_1E9F9B278;
  v14 = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke_34;
  v11[3] = &unk_1E9F98E18;
  v9 = v4;
  v10 = v8;
  objc_msgSend(v7, "evaluate:completionBlock:completionQueue:", v13, v11, MEMORY[0x1E0C80D38]);

}

void __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t v9[16];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wlSettings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "hasProperty:", CFSTR("onPreferencesChange")))
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUISettingsManager - updating user preferences - calling JS", v9, 2u);
    }

    v10[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("onPreferencesChange"), v7);

  }
}

uint64_t __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUISettingsManager - received notice from MCProfileConnection that content restrictions did change", v6, 2u);
  }

  -[VUISettingsManager checkAndUpdateSettings](self, "checkAndUpdateSettings");
}

void __45__VUISettingsManager__hasRestrictionsChanged__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("VUIRestrictionsDidChangeNotification"), 0);

}

void __53__VUISettingsManager__hasPreferredVideoFormatChanged__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("VUIPreferredVideoFormatDidChangeNotification"), 0);

}

- (BOOL)_hasRTLChanged
{
  NSNumber *v3;
  NSNumber *v4;
  NSNumber *isRTL;
  NSNumber *v6;

  v3 = self->_isRTL;
  -[VUISettingsManager _isRTL](self, "_isRTL");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isRTL = self->_isRTL;
  self->_isRTL = v4;
  v6 = v4;

  return v3 != v6;
}

- (id)_isRTL
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection");

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 == 1);
}

- (void)_handlePreferencesChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUISettingsManager - received preferences did change notification", v5, 2u);
  }

  -[VUISettingsManager checkAndUpdateSettings](self, "checkAndUpdateSettings");
}

- (void)setMaxMovieRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setMaxTVShowRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPreferredVideoFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUpNextLockupsUseCoverArt:(BOOL)a3
{
  self->_upNextLockupsUseCoverArt = a3;
}

- (NSNumber)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(id)a3
{
  objc_storeStrong((id *)&self->_isRTL, a3);
}

- (WLKSystemPreferencesStore)preferencesStore
{
  return self->_preferencesStore;
}

- (void)setPreferencesStore:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesStore, 0);
  objc_storeStrong((id *)&self->_isRTL, 0);
  objc_storeStrong((id *)&self->_preferredVideoFormat, 0);
  objc_storeStrong((id *)&self->_maxTVShowRank, 0);
  objc_storeStrong((id *)&self->_maxMovieRank, 0);
}

@end
