@implementation MTPreferences

+ (void)registerDefaults
{
  void *v3;
  id v4;

  if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "defaultSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerDefaults:", v3);

  }
}

+ (id)defaultSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MTPreferences_defaultSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSettings_onceToken != -1)
    dispatch_once(&defaultSettings_onceToken, block);
  return (id)defaultSettings_defaults;
}

+ (BOOL)copySettingsToSharedContainer
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "settingsAppWritesDirectlyToSharedUserDefaults") & 1) == 0)
  {
    objc_msgSend(a1, "defaultSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v6);
          v9 |= objc_msgSend(a1, "_copyUserDefaultToSharedContainer:synchronize:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 0, (_QWORD)v14);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);

      if ((v9 & 1) == 0)
      {
        v3 = 0;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v12, "synchronize");
    }
    else
    {
      v3 = 0;
      v12 = v6;
    }

LABEL_16:
    return v3;
  }
  return 0;
}

+ (void)moveUserDefaultToSharedContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _MTLogCategoryDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412802;
        v16 = v3;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_DEFAULT, "WARNING: Overwriting shared user default %@ with %@ from %@", (uint8_t *)&v15, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, v3);

    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronize");

    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isEqual:", v5))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v3);

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "synchronize");

    }
  }

}

void __32__MTPreferences_defaultSettings__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[14];
  _QWORD v5[15];

  v5[14] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("MTUseCustomColorsKey");
  v4[1] = CFSTR("MTWiFiDownloadOnly");
  v5[0] = MEMORY[0x1E0C9AAB0];
  v5[1] = MEMORY[0x1E0C9AAB0];
  v4[2] = CFSTR("MTSyncSubscriptions");
  v4[3] = CFSTR("MTShowSiriSuggestions");
  v5[2] = MEMORY[0x1E0C9AAB0];
  v5[3] = MEMORY[0x1E0C9AAB0];
  v4[4] = CFSTR("MTPodcastAutoDownloadStateDefaultKey");
  v4[5] = CFSTR("MTCellularDownloadLimitKey");
  v5[4] = MEMORY[0x1E0C9AAB0];
  v5[5] = &unk_1E5538A68;
  v4[6] = CFSTR("MTPodcastDeletePlayedEpisodesDefaultKey");
  v4[7] = CFSTR("MTHidePlayedEpisodes");
  v5[6] = &unk_1E5538A80;
  v5[7] = MEMORY[0x1E0C9AAA0];
  v4[8] = CFSTR("MTContinuousPlaybackEnabled");
  v4[9] = CFSTR("MTSkipForwardIntervalDefault");
  v5[8] = MEMORY[0x1E0C9AAB0];
  v5[9] = &unk_1E5538A98;
  v4[10] = CFSTR("MTSkipBackwardsIntervalDefault");
  v4[11] = CFSTR("MTRemoteSkipInsteadOfNextTrackDefault");
  v5[10] = &unk_1E5538AB0;
  v5[11] = MEMORY[0x1E0C9AAB0];
  v5[12] = MEMORY[0x1E0C9AAB0];
  v4[12] = CFSTR("MTDownloadEpisodesWhenSaving");
  v4[13] = CFSTR("MTPodcastEpisodeLimitDefaultKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "defaultEpisodeLimit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[13] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 14);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultSettings_defaults;
  defaultSettings_defaults = v2;

}

+ (int64_t)defaultEpisodeLimit
{
  return 4;
}

+ (BOOL)_copyUserDefaultToSharedContainer:(id)a3 synchronize:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9 || (objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v5);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "synchronize");

    }
    v10 = 1;
  }

  return v10;
}

@end
