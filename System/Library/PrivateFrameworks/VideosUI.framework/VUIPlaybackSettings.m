@implementation VUIPlaybackSettings

void __37__VUIPlaybackSettings_sharedSettings__block_invoke()
{
  VUIPlaybackSettings *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPlaybackSettings);
  v1 = (void *)sharedSettings_sSharedSettings;
  sharedSettings_sSharedSettings = (uint64_t)v0;

}

- (VUIPlaybackSettings)init
{
  VUIPlaybackSettings *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VUIPlaybackSettings;
  v2 = -[VUIPlaybackSettings init](&v20, sel_init);
  if (v2)
  {
    MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__externalScreenTypeDidChange_, *MEMORY[0x1E0D4C8D8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__sceneWillConnect_, *MEMORY[0x1E0DC5328], 0);

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __27__VUIPlaybackSettings_init__block_invoke;
    v17 = &unk_1E9F9C358;
    objc_copyWeak(&v18, &location);
    MRMediaRemoteGetExternalScreenType();

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "vuiIsNonLightningAVAdapterConnected");

    if (v9)
    {
      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "A non-Lightning AV adapter is connected", v13, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHasAVAdapterEvenBeenConnected:", 1);

    }
    -[VUIPlaybackSettings _updateNetworkStatus](v2, "_updateNetworkStatus");
    -[VUIPlaybackSettings _updatePropertiesFromUserPrefs](v2, "_updatePropertiesFromUserPrefs");
    -[VUIPlaybackSettings _registerObserverForUserPrefsChange](v2, "_registerObserverForUserPrefsChange");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_updatePropertiesFromUserPrefs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
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
  NSString *preferredAudioLanguageCode;
  NSString *v24;
  char v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v3, "useCellularDataPlayback");

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wifiQualityPlayback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellularQualityPlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioLanguageCode");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "useCellularDataDownload");

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "downloadsCompatibleWithAVAdapter");

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wifiQualityDownload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellularQualityDownload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectedAudioLanguagesDownload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v18, "count"))
  {
    v26[0] = CFSTR("ORIGINAL_AUDIO_LANGUAGE");
    v26[1] = CFSTR("DEVICE_AUDIO_LANGUAGE");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v18, "containsObject:", CFSTR("DEFAULT_LANGUAGE")))
  {
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v19, "removeObject:", CFSTR("DEFAULT_LANGUAGE"));
    objc_msgSend(v19, "insertObject:atIndex:", CFSTR("ORIGINAL_AUDIO_LANGUAGE"), 0);
    objc_msgSend(v19, "insertObject:atIndex:", CFSTR("DEVICE_AUDIO_LANGUAGE"), 1);
LABEL_5:

    v18 = v19;
  }
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subtitleDefaultLanguageEnabledDownload");

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subtitleAudioLanguagesDownload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackSettings setPreferredWifiPlaybackQuality:](self, "setPreferredWifiPlaybackQuality:", -[VUIPlaybackSettings _playbackQualityForString:forCellular:](self, "_playbackQualityForString:forCellular:", v5, 0));
  -[VUIPlaybackSettings setPreferredCellularPlaybackQuality:](self, "setPreferredCellularPlaybackQuality:", -[VUIPlaybackSettings _playbackQualityForString:forCellular:](self, "_playbackQualityForString:forCellular:", v7, 1));
  -[VUIPlaybackSettings setPreferredWifiDownloadQuality:](self, "setPreferredWifiDownloadQuality:", -[VUIPlaybackSettings _downloadQualityForString:](self, "_downloadQualityForString:", v14));
  -[VUIPlaybackSettings setPreferredCellularDownloadQuality:](self, "setPreferredCellularDownloadQuality:", -[VUIPlaybackSettings _downloadQualityForString:](self, "_downloadQualityForString:", v16));
  -[VUIPlaybackSettings setPreferredAudioDownloadLanguages:](self, "setPreferredAudioDownloadLanguages:", v18);
  -[VUIPlaybackSettings setUseDefaultSubtitleDownloadLanguages:](self, "setUseDefaultSubtitleDownloadLanguages:", 1);
  -[VUIPlaybackSettings setPreferredSubtitleDownloadLanguages:](self, "setPreferredSubtitleDownloadLanguages:", v22);
  self->_cellularDataPlaybackEnabled = v25;
  self->_cellularDataDownloadEnabled = v10;
  preferredAudioLanguageCode = self->_preferredAudioLanguageCode;
  self->_preferredAudioLanguageCode = v24;

  self->_preferAVAdapterCompatibility = v12;
}

- (int64_t)_playbackQualityForString:(id)a3 forCellular:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  int64_t v6;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC88A0]) & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC88A8]) | v4;

  return v6;
}

- (int64_t)_downloadQualityForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC8890]) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC8898]);
    v4 = 1;
  }

  return v4;
}

- (void)setUseDefaultSubtitleDownloadLanguages:(BOOL)a3
{
  self->_useDefaultSubtitleDownloadLanguages = a3;
}

- (void)setPreferredWifiPlaybackQuality:(int64_t)a3
{
  self->_preferredWifiPlaybackQuality = a3;
}

- (void)setPreferredWifiDownloadQuality:(int64_t)a3
{
  self->_preferredWifiDownloadQuality = a3;
}

- (void)setPreferredSubtitleDownloadLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSubtitleDownloadLanguages, a3);
}

- (void)setPreferredCellularPlaybackQuality:(int64_t)a3
{
  self->_preferredCellularPlaybackQuality = a3;
}

- (void)setPreferredCellularDownloadQuality:(int64_t)a3
{
  self->_preferredCellularDownloadQuality = a3;
}

- (void)setPreferredAudioDownloadLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAudioDownloadLanguages, a3);
}

- (void)_updateNetworkStatus
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  _BYTE v11[22];
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "networkType");

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    goto LABEL_8;
  v6 = CFSTR("Unknown");
  if (v4 > 99)
  {
    if (v4 > 1000)
    {
      switch(v4)
      {
        case 1001:
          v6 = CFSTR("Bridged WiFi");
          break;
        case 2000:
          v6 = CFSTR("Wired Ethernet");
          break;
        case 3000:
          v6 = CFSTR("Other");
          break;
      }
      goto LABEL_5;
    }
    if (v4 != 100)
    {
      if (v4 == 500)
      {
        v6 = CFSTR("Bluetooth");
      }
      else if (v4 == 1000)
      {
        v6 = CFSTR("WiFi");
      }
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if ((unint64_t)(v4 - 1) < 8)
LABEL_4:
    v6 = CFSTR("Cellular");
LABEL_5:
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCurrentNetworkLinkExpensive");
  v9 = CFSTR("NO");
  *(_DWORD *)v11 = 134218498;
  *(_QWORD *)&v11[4] = v4;
  *(_WORD *)&v11[12] = 2112;
  if (v8)
    v9 = CFSTR("YES");
  *(_QWORD *)&v11[14] = v6;
  v12 = 2112;
  v13 = v9;
  _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Network type did change to %ld (%@) is expensive: %@", v11, 0x20u);

LABEL_8:
  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0
    || (ICEnvironmentNetworkTypeIsWired() & 1) != 0
    || (ICEnvironmentNetworkTypeIsBluetooth() & 1) != 0)
  {
    v10 = 1;
  }
  else if (ICEnvironmentNetworkTypeIsCellular())
  {
    v10 = 2;
  }
  else
  {
    v10 = 0;
  }
  -[VUIPlaybackSettings setNetworkStatus:](self, "setNetworkStatus:", v10, *(_OWORD *)v11);
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (void)_registerObserverForUserPrefsChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePreferencesDidChangeNotification_, *MEMORY[0x1E0DC89D8], 0);

}

void __27__VUIPlaybackSettings_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "_descriptionForExternalScreenType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Initial external screen type is %@", (uint8_t *)&v7, 0xCu);

  }
  if ((_DWORD)a2 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasAVAdapterEvenBeenConnected:", 1);

  }
}

- (id)_descriptionForExternalScreenType:(unsigned int)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E9F9C378[a3];
}

+ (id)sharedSettings
{
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_43);
  return (id)sharedSettings_sSharedSettings;
}

- (int64_t)preferredWifiPlaybackQuality
{
  return self->_preferredWifiPlaybackQuality;
}

- (int64_t)preferredCellularPlaybackQuality
{
  return self->_preferredCellularPlaybackQuality;
}

- (NSString)preferredAudioLanguageCode
{
  return self->_preferredAudioLanguageCode;
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (BOOL)cellularDataPlaybackEnabled
{
  return self->_cellularDataPlaybackEnabled;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackSettings;
  -[VUIPlaybackSettings dealloc](&v4, sel_dealloc);
}

- (int64_t)preferredPlaybackQualityForCurrentNetworkStatus
{
  int64_t v3;

  v3 = -[VUIPlaybackSettings networkStatus](self, "networkStatus");
  if (v3 == 2)
    return -[VUIPlaybackSettings preferredCellularPlaybackQuality](self, "preferredCellularPlaybackQuality");
  if (v3 == 1)
    return -[VUIPlaybackSettings preferredWifiPlaybackQuality](self, "preferredWifiPlaybackQuality");
  return 0;
}

- (int64_t)preferredDownloadQualityForCurrentNetworkStatus
{
  int64_t v3;

  v3 = -[VUIPlaybackSettings networkStatus](self, "networkStatus");
  if (v3 == 2)
    return -[VUIPlaybackSettings preferredCellularDownloadQuality](self, "preferredCellularDownloadQuality");
  if (v3 == 1)
    return -[VUIPlaybackSettings preferredWifiDownloadQuality](self, "preferredWifiDownloadQuality");
  return 1;
}

- (void)setCellularDataPlaybackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_cellularDataPlaybackEnabled = a3;
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseCellularDataPlayback:", v3);

}

- (BOOL)cellularDataDownloadEnabled
{
  return self->_cellularDataDownloadEnabled;
}

- (void)setCellularDataDownloadEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_cellularDataDownloadEnabled = a3;
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseCellularDataDownload:", v3);

}

- (void)setPreferredAudioLanguageCode:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, a3);
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioLanguageCode:", v4);

}

- (BOOL)preferAVAdapterCompatibility
{
  return self->_preferAVAdapterCompatibility;
}

- (void)setPreferAVAdapterCompatibility:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_preferAVAdapterCompatibility = a3;
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasAVAdapterEvenBeenConnected:", 1);

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDownloadsCompatibleWithAVAdapter:", v3);

}

- (void)updateSupplementaryAvailableAudioLanguageCodes:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Updating supplementary available audio language codes with %@", buf, 0xCu);
  }

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supplementaryAvailableAudioLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithArray:", v7);

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v3;
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
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14, (_QWORD)v17) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  VUIDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Updated supplementary available audio language codes: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSupplementaryAvailableAudioLanguages:", v8);

}

- (void)_externalScreenTypeDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_numberForKey:", *MEMORY[0x1E0D4C8E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIPlaybackSettings _descriptionForExternalScreenType:](self, "_descriptionForExternalScreenType:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "External screen type did change to %@", (uint8_t *)&v10, 0xCu);

  }
  if ((_DWORD)v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasAVAdapterEvenBeenConnected:", 1);

  }
}

- (void)_sceneWillConnect:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(a3, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "vui_isNonLightningSecondScreenScene"))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "A non-Lightning AV adapter was connected", v6, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasAVAdapterEvenBeenConnected:", 1);

  }
}

- (void)_handlePreferencesDidChangeNotification:(id)a3
{
  _QWORD block[2];
  void (*v4)(uint64_t);
  void *v5;
  VUIPlaybackSettings *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __63__VUIPlaybackSettings__handlePreferencesDidChangeNotification___block_invoke;
  v5 = &unk_1E9F98DF0;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __63__VUIPlaybackSettings__handlePreferencesDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updatePropertiesFromUserPrefs");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VUIPlaybackSettingsUserPreferencesDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VUIPlaybackSettings_environmentMonitorDidChangeNetworkType___block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__VUIPlaybackSettings_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateNetworkStatus");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VUIPlaybackSettingsNetworkStatusDidChange"), *(_QWORD *)(a1 + 32));

}

- (int64_t)preferredWifiDownloadQuality
{
  return self->_preferredWifiDownloadQuality;
}

- (int64_t)preferredCellularDownloadQuality
{
  return self->_preferredCellularDownloadQuality;
}

- (NSArray)preferredAudioDownloadLanguages
{
  return self->_preferredAudioDownloadLanguages;
}

- (BOOL)useDefaultSubtitleDownloadLanguages
{
  return self->_useDefaultSubtitleDownloadLanguages;
}

- (NSArray)preferredSubtitleDownloadLanguages
{
  return self->_preferredSubtitleDownloadLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSubtitleDownloadLanguages, 0);
  objc_storeStrong((id *)&self->_preferredAudioDownloadLanguages, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, 0);
}

@end
