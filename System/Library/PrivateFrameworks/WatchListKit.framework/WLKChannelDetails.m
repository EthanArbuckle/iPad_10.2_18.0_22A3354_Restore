@implementation WLKChannelDetails

- (id)sui_channelName
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[WLKChannelDetails title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WLKChannelDetails isiTunes](self, "isiTunes"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ITUNES_CHANNEL_NAME"), &stru_1E68AA228, CFSTR("WatchListKit"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

+ (void)sui_fetchSeasonTitlesSettingWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E68A7C90;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchConfigurationWithCompletionHandler:", v6);

}

void __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke_cold_1((uint64_t)v5, v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "features");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wlk_BOOLForKey:defaultValue:", CFSTR("seasonTitles"), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)sui_seasonEpisodeLabel:(BOOL)a3 seasonTitleAvailable:(BOOL)a4 seasonNumber:(id)a5 episodeNumber:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v21;
  __int16 v22;
  uint8_t buf[2];

  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (!v8 || !v7)
  {
    if (v9 && v10)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SEASON_EPISODE_FORMAT"), &stru_1E68AA228, CFSTR("WatchListKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v14, v9, v11);
      goto LABEL_8;
    }
    WLKSystemLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v18 = "WLKChannelDetails+SearchUIAdditions - WLK seasonNumber or episodeNumber is nil";
      v19 = (uint8_t *)&v22;
LABEL_13:
      _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    }
LABEL_14:

    v16 = &stru_1E68AA228;
    goto LABEL_15;
  }
  if (!v10)
  {
    WLKSystemLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "WLKChannelDetails+SearchUIAdditions - WLK episodeNumber is nil";
      v19 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EPISODE_FORMAT"), &stru_1E68AA228, CFSTR("WatchListKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11, v21);
LABEL_8:
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v16;
}

- (id)appIconURLForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  -[WLKChannelDetails images](self, "images");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestArtworkVariantOfType:forSize:", 10, width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkURLForSize:format:", CFSTR("png"), width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WLKChannelDetails)initWithDictionary:(id)a3
{
  id v4;
  WLKChannelDetails *v5;
  void *v6;
  uint64_t v7;
  NSString *channelID;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  NSArray *appAdamIDs;
  void *v18;
  uint64_t v19;
  NSArray *appBundleIDs;
  void *v21;
  uint64_t v22;
  NSString *appName;
  void *v24;
  uint64_t v25;
  NSString *appStoreURLString;
  WLKArtworkVariantListing *v27;
  void *v28;
  uint64_t v29;
  WLKArtworkVariantListing *images;
  void *v31;
  uint64_t v32;
  NSDictionary *rateLimit;
  uint64_t v34;
  NSString *minRequiredAppVersion;
  void *v36;
  unsigned int v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)WLKChannelDetails;
  v5 = -[WLKChannelDetails init](&v55, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    channelID = v5->_channelID;
    v5->_channelID = (NSString *)v7;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v13;

    objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("appAdamIds"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    appAdamIDs = v5->_appAdamIDs;
    v5->_appAdamIDs = (NSArray *)v16;

    objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("appBundleIds"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    appBundleIDs = v5->_appBundleIDs;
    v5->_appBundleIDs = (NSArray *)v19;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("appName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    appName = v5->_appName;
    v5->_appName = (NSString *)v22;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("appStoreUrl"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    appStoreURLString = v5->_appStoreURLString;
    v5->_appStoreURLString = (NSString *)v25;

    v5->_subscribed = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isSubscribed"), 0);
    v5->_itunes = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isItunes"), 0);
    v5->_firstParty = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isFirstParty"), 0);
    v5->_watchListEnabled = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isWatchlistEnabled"), 0);
    v27 = [WLKArtworkVariantListing alloc];
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("images"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[WLKArtworkVariantListing initWithArtworkDictionary:](v27, "initWithArtworkDictionary:", v28);
    images = v5->_images;
    v5->_images = (WLKArtworkVariantListing *)v29;

    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("rateLimit"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    rateLimit = v5->_rateLimit;
    v5->_rateLimit = (NSDictionary *)v32;

    v5->_shouldTrackPlayActivity = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("shouldTrackPlayActivity"), 1);
    v5->_consented = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isConsented"), 0);
    v5->_apSubscription = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isApSubscription"), 0);
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("minWatchlistAppVersion"));
    v34 = objc_claimAutoreleasedReturnValue();
    minRequiredAppVersion = v5->_minRequiredAppVersion;
    v5->_minRequiredAppVersion = (NSString *)v34;

    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("channelType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "unsignedIntValue");
    v5->_channelType = v37;
    if (v5->_itunes
      || v37 == 1
      || (objc_msgSend(v4, "wlk_numberForKey:", CFSTR("isInstalled")),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v39 = objc_msgSend(v38, "isEqual:", &unk_1E68C99C8),
          v38,
          v39))
    {
      v5->_appInstalled = 1;
    }
    else
    {
      v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "allAppBundleIdentifiers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v42);

      +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "_nonConformingAppBundleIdentifiers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v44);

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v45 = v5->_appBundleIDs;
      v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v52 != v48)
              objc_enumerationMutation(v45);
            if (objc_msgSend(v40, "containsObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i), (_QWORD)v51))
            {
              v5->_appInstalled = 1;
              goto LABEL_16;
            }
          }
          v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          if (v47)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }

  return v5;
}

- (WLKChannelDetails)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKChannelDetailsInitException"), CFSTR("-init not supported"));

  return 0;
}

- (NSURL)appStoreURL
{
  void *v2;

  if (self->_appStoreURLString)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSURL *)v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *channelID;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WLKChannelDetails;
  -[WLKChannelDetails description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  channelID = self->_channelID;
  title = self->_title;
  -[NSArray componentsJoinedByString:](self->_appBundleIDs, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@ - ID: %@ - Bundles: %@"), title, channelID, v7);

  return (NSString *)v4;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)appAdamIDs
{
  return self->_appAdamIDs;
}

- (NSArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (NSString)appName
{
  return self->_appName;
}

- (WLKArtworkVariantListing)images
{
  return self->_images;
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (BOOL)isiTunes
{
  return self->_itunes;
}

- (BOOL)isFirstParty
{
  return self->_firstParty;
}

- (BOOL)isWatchListEnabled
{
  return self->_watchListEnabled;
}

- (BOOL)isConsented
{
  return self->_consented;
}

- (void)setConsented:(BOOL)a3
{
  self->_consented = a3;
}

- (BOOL)isApSubscription
{
  return self->_apSubscription;
}

- (NSDictionary)rateLimit
{
  return self->_rateLimit;
}

- (BOOL)shouldTrackPlayActivity
{
  return self->_shouldTrackPlayActivity;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (NSString)minRequiredAppVersion
{
  return self->_minRequiredAppVersion;
}

- (BOOL)isAppInstalled
{
  return self->_appInstalled;
}

- (NSString)appStoreURLString
{
  return self->_appStoreURLString;
}

- (void)setAppStoreURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreURLString, 0);
  objc_storeStrong((id *)&self->_minRequiredAppVersion, 0);
  objc_storeStrong((id *)&self->_rateLimit, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
  objc_storeStrong((id *)&self->_appAdamIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

void __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B515A000, a2, OS_LOG_TYPE_ERROR, "WLKChannelDetails+SearchUIAdditions - WLK init config fetch error %@", (uint8_t *)&v2, 0xCu);
}

@end
