@implementation VUIPlayer

void __23__VUIPlayer_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIPlayer");
  v1 = (void *)sLogObject_1;
  sLogObject_1 = (uint64_t)v0;

}

- (VUIPlayer)initWithName:(id)a3
{
  VUIPlayer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  objc_super v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VUIPlayer;
  v3 = -[TVPPlayer initWithName:](&v12, sel_initWithName_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__currentMediaItemDidChange_, *MEMORY[0x1E0DB1E20], v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__videoPlaybackSettingsDidChange_, CFSTR("VUIPlaybackSettingsUserPreferencesDidChange"), v6);

    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cellularDataPlaybackEnabled");

    v9 = sLogObject_1;
    if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("not ");
      if ((_DWORD)v8)
        v10 = &stru_1E9FF3598;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Use Cellular Data for Playback setting is %@enabled", buf, 0xCu);
    }
    -[TVPPlayer setAllowsCellularUsage:](v3, "setAllowsCellularUsage:", v8);
  }
  return v3;
}

- (void)_configurePlayerForCurrentNetworkSettingsAndMediaItem
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int IsCellular;
  int v29;
  double v30;
  double v31;
  void *v33;
  NSObject *v34;
  void *v35;
  double v36;
  double v37;
  void *v39;
  NSObject *v40;
  void *v41;
  _BYTE v42[24];
  const __CFString *v43;
  uint64_t v44;
  CGSize v45;
  CGSize v46;

  v44 = *MEMORY[0x1E0C80C00];
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_46;
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");
  if ((v6 & 1) != 0)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "preferredWifiPlaybackQuality");

    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "preferredCellularPlaybackQuality");

  }
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "networkType");

  v13 = sLogObject_1;
  if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("Good");
    v15 = CFSTR("Best");
    if (!v8)
      v14 = CFSTR("Best");
    if (v7)
      v15 = CFSTR("Auto");
    *(_DWORD *)v42 = 138412802;
    *(_QWORD *)&v42[4] = v14;
    *(_WORD *)&v42[12] = 2112;
    *(_QWORD *)&v42[14] = v15;
    v16 = CFSTR("NO");
    if (v6)
      v16 = CFSTR("YES");
    *(_WORD *)&v42[22] = 2112;
    v43 = v16;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Wifi playback quality setting: %@, cellular playback quality setting: %@, force high quality: %@", v42, 0x20u);
  }
  v17 = (void *)sLogObject_1;
  if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("Unknown");
    if (v12 > 99)
    {
      if (v12 > 1000)
      {
        switch(v12)
        {
          case 1001:
            v18 = CFSTR("Bridged WiFi");
            break;
          case 2000:
            v18 = CFSTR("Wired Ethernet");
            break;
          case 3000:
            v18 = CFSTR("Other");
            break;
        }
        goto LABEL_17;
      }
      if (v12 != 100)
      {
        if (v12 == 500)
        {
          v18 = CFSTR("Bluetooth");
        }
        else if (v12 == 1000)
        {
          v18 = CFSTR("WiFi");
        }
        goto LABEL_17;
      }
    }
    else if ((unint64_t)(v12 - 1) >= 8)
    {
LABEL_17:
      v19 = (void *)MEMORY[0x1E0DDBF60];
      v20 = v17;
      objc_msgSend(v19, "sharedMonitor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isCurrentNetworkLinkExpensive");
      *(_DWORD *)v42 = 134218498;
      v23 = CFSTR("NO");
      if (v22)
        v23 = CFSTR("YES");
      *(_QWORD *)&v42[4] = v12;
      *(_WORD *)&v42[12] = 2112;
      *(_QWORD *)&v42[14] = v18;
      *(_WORD *)&v42[22] = 2112;
      v43 = v23;
      _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Network type is %ld (%@) is expensive: %@", v42, 0x20u);

      goto LABEL_20;
    }
    v18 = CFSTR("Cellular");
    goto LABEL_17;
  }
LABEL_20:
  v24 = *MEMORY[0x1E0C9D820];
  v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v7)
    v26 = 432.0;
  else
    v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v7)
    v27 = 768.0;
  else
    v27 = *MEMORY[0x1E0C9D820];
  IsCellular = ICEnvironmentNetworkTypeIsCellular();
  if (v8)
    v29 = IsCellular;
  else
    v29 = 1;
  if (!v29)
  {
    v24 = 1024.0;
    v25 = 576.0;
  }
  -[TVPPlayer preferredMaximumResolution](self, "preferredMaximumResolution", *(_OWORD *)v42, *(_QWORD *)&v42[16]);
  if (v24 != v31 || v25 != v30)
  {
    v33 = (void *)sLogObject_1;
    if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v45.width = v24;
      v45.height = v25;
      NSStringFromCGSize(v45);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138412290;
      *(_QWORD *)&v42[4] = v35;
      _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "Setting preferredMaximumResolution to %@", v42, 0xCu);

    }
    -[TVPPlayer setPreferredMaximumResolution:](self, "setPreferredMaximumResolution:", v24, v25);
  }
  -[TVPPlayer preferredMaximumResolutionForExpensiveNetworks](self, "preferredMaximumResolutionForExpensiveNetworks");
  if (v27 != v37 || v26 != v36)
  {
    v39 = (void *)sLogObject_1;
    if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v39;
      v46.width = v27;
      v46.height = v26;
      NSStringFromCGSize(v46);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138412290;
      *(_QWORD *)&v42[4] = v41;
      _os_log_impl(&dword_1D96EE000, v40, OS_LOG_TYPE_DEFAULT, "Setting preferredMaximumResolutionForExpensiveNetworks to %@", v42, 0xCu);

    }
    -[TVPPlayer setPreferredMaximumResolutionForExpensiveNetworks:](self, "setPreferredMaximumResolutionForExpensiveNetworks:", v27, v26);
  }

LABEL_46:
}

+ (id)savedPreferredAudioLanguageCode
{
  void *v2;
  void *v3;

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredAudioLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_10);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIPlayer;
  -[TVPPlayer dealloc](&v4, sel_dealloc);
}

+ (void)updateSupplementaryAvailableAudioLanguageCodes:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSupplementaryAvailableAudioLanguageCodes:", v3);

}

- (void)_videoPlaybackSettingsDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cellularDataPlaybackEnabled");

  v6 = sLogObject_1;
  if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("not ");
    if ((_DWORD)v5)
      v7 = &stru_1E9FF3598;
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "After settings change, Use Cellular Data for Playback setting is %@enabled", (uint8_t *)&v8, 0xCu);
  }
  -[TVPPlayer setAllowsCellularUsage:](self, "setAllowsCellularUsage:", v5);
  -[VUIPlayer _configurePlayerForCurrentNetworkSettingsAndMediaItem](self, "_configurePlayerForCurrentNetworkSettingsAndMediaItem");
}

@end
