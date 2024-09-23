@implementation ICMusicAccountNotificationsSettingsManager

void __59__ICMusicAccountNotificationsSettingsManager_sharedManager__block_invoke()
{
  ICMusicAccountNotificationsSettingsManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICMusicAccountNotificationsSettingsManager);
  v1 = (void *)sharedManager_sSharedManager_16975;
  sharedManager_sSharedManager_16975 = (uint64_t)v0;

}

- (id)cachedAccountNotificationsShowInLibrarySwitch
{
  void *v2;
  void *v3;
  ICMusicAccountNotificationsSettingsSwitch *v4;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountNotificationsShowInLibraryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[ICMusicAccountNotificationsSettingsSwitch initWithItemResponseDictionary:]([ICMusicAccountNotificationsSettingsSwitch alloc], "initWithItemResponseDictionary:", v3);
  return v4;
}

+ (ICMusicAccountNotificationsSettingsManager)sharedManager
{
  if (sharedManager_sOnceToken_16973 != -1)
    dispatch_once(&sharedManager_sOnceToken_16973, &__block_literal_global_16974);
  return (ICMusicAccountNotificationsSettingsManager *)(id)sharedManager_sSharedManager_16975;
}

- (void)getAccountNotificationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  ICMusicAccountNotificationsSettingsRequestOperation *v6;
  void *v7;
  ICMusicAccountNotificationsSettingsRequestOperation *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  ICMusicAccountNotificationsSettingsManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrieving account notifications switches.", buf, 0xCu);
  }

  v6 = [ICMusicAccountNotificationsSettingsRequestOperation alloc];
  -[ICMusicAccountNotificationsSettingsManager storeRequestContext](self, "storeRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICMusicAccountNotificationsSettingsRequestOperation initWithRequestContext:withRequestMethod:](v6, "initWithRequestContext:withRequestMethod:", v7, 0);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__ICMusicAccountNotificationsSettingsManager_getAccountNotificationsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E438CA78;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[ICMusicAccountNotificationsSettingsRequestOperation performRequestWithResponseHandler:](v8, "performRequestWithResponseHandler:", v10);

}

- (void)setAccountNotificationsArtistContentFeature:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICMusicAccountNotificationsSettingsSwitch *v7;
  ICMusicAccountNotificationsSettingsSwitch *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  ICMusicAccountNotificationsSettingsRequestOperation *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  ICMusicAccountNotificationsSettingsManager *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = [ICMusicAccountNotificationsSettingsSwitch alloc];
  v8 = -[ICMusicAccountNotificationsSettingsSwitch initWithToggleState:hasBeenToggled:identifier:](v7, "initWithToggleState:hasBeenToggled:identifier:", v4, 1, ICMusicAccountNotificationsSettingsSwitchShowInLibrary);
  v9 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 1024;
    v23 = v4;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting account notifications switches to: %{BOOL}u.", buf, 0x12u);
  }

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicAccountNotificationsSettingsSwitch itemResponseDictionary](v8, "itemResponseDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountNotificationsShowInLibraryDictionary:", v11);

  -[ICMusicAccountNotificationsSettingsManager storeRequestContext](self, "storeRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICMusicAccountNotificationsSettingsRequestOperation initWithRequestContext:withRequestMethod:]([ICMusicAccountNotificationsSettingsRequestOperation alloc], "initWithRequestContext:withRequestMethod:", v12, 0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E438CAC8;
  v19 = v4;
  v16[4] = self;
  v17 = v12;
  v18 = v6;
  v14 = v6;
  v15 = v12;
  -[ICMusicAccountNotificationsSettingsRequestOperation performRequestWithResponseHandler:](v13, "performRequestWithResponseHandler:", v16);

}

- (void)setCachedAccountNotificationsShowInLibraryEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  ICMusicAccountNotificationsSettingsSwitch *v6;
  ICMusicAccountNotificationsSettingsSwitch *v7;
  void *v8;
  void *v9;
  int v10;
  ICMusicAccountNotificationsSettingsManager *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching show in library switch as %{BOOL}u.", (uint8_t *)&v10, 0x12u);
  }

  v6 = [ICMusicAccountNotificationsSettingsSwitch alloc];
  v7 = -[ICMusicAccountNotificationsSettingsSwitch initWithToggleState:hasBeenToggled:identifier:](v6, "initWithToggleState:hasBeenToggled:identifier:", v3, 1, ICMusicAccountNotificationsSettingsSwitchShowInLibrary);
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicAccountNotificationsSettingsSwitch itemResponseDictionary](v7, "itemResponseDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountNotificationsShowInLibraryDictionary:", v9);

}

- (void)setCachedAccountNotificationsNewMusicEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  ICMusicAccountNotificationsSettingsSwitch *v6;
  ICMusicAccountNotificationsSettingsSwitch *v7;
  void *v8;
  void *v9;
  int v10;
  ICMusicAccountNotificationsSettingsManager *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching new music switch as %{BOOL}u.", (uint8_t *)&v10, 0x12u);
  }

  v6 = [ICMusicAccountNotificationsSettingsSwitch alloc];
  v7 = -[ICMusicAccountNotificationsSettingsSwitch initWithToggleState:hasBeenToggled:identifier:](v6, "initWithToggleState:hasBeenToggled:identifier:", v3, 1, ICMusicAccountNotificationsSettingsSwitchArtistsAndShows);
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicAccountNotificationsSettingsSwitch itemResponseDictionary](v7, "itemResponseDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountNotificationsShowInLibraryDictionary:", v9);

}

- (id)cachedAccountNotificationsNewMusicSwitch
{
  void *v2;
  void *v3;
  ICMusicAccountNotificationsSettingsSwitch *v4;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountNotificationsShowInLibraryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[ICMusicAccountNotificationsSettingsSwitch initWithItemResponseDictionary:]([ICMusicAccountNotificationsSettingsSwitch alloc], "initWithItemResponseDictionary:", v3);
  return v4;
}

- (id)_getSwitchesDependingOnSubscriptionStatus:(id)a3 withResponse:(id)a4 togglingSwitchesToValue:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "settingsSwitches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      v25 = v12;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        if ((objc_msgSend(v7, "hasCapability:", 128) & 1) == 0)
        {
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", ICMusicAccountNotificationsSettingsSwitchArtistsAndShows))
          {

          }
          else
          {
            objc_msgSend(v15, "identifier");
            v17 = v13;
            v18 = v5;
            v19 = v7;
            v20 = v9;
            v21 = v10;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", ICMusicAccountNotificationsSettingsSwitchShowInLibrary);

            v10 = v21;
            v9 = v20;
            v7 = v19;
            v5 = v18;
            v13 = v17;
            v12 = v25;

            if (!v23)
              goto LABEL_11;
          }
        }
        objc_msgSend(v9, "addObject:", v15);
LABEL_11:
        objc_msgSend(v15, "setIsToggled:", v5);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)storeRequestContext
{
  return -[ICStoreRequestContext initWithBlock:]([ICStoreRequestContext alloc], "initWithBlock:", &__block_literal_global_12_16950);
}

void __65__ICMusicAccountNotificationsSettingsManager_storeRequestContext__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ICURLResponseAuthenticationProvider *v3;
  ICClientInfo *v4;
  id v5;

  v2 = a2;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentity:", v5);
  v3 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 1);
  objc_msgSend(v2, "setAuthenticationProvider:", v3);

  objc_msgSend(v2, "setAllowsExpiredBags:", 1);
  v4 = -[ICClientInfo initWithBundleIdentifier:]([ICClientInfo alloc], "initWithBundleIdentifier:", CFSTR("com.apple.Music"));
  objc_msgSend(v2, "setClientInfo:", v4);

}

void __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  +[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E438CAA0;
  v12 = *(_BYTE *)(a1 + 56);
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v4, "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:", v5, 1, v8);

}

void __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  ICMusicAccountNotificationsSettingsRequestOperation *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_getSwitchesDependingOnSubscriptionStatus:withResponse:togglingSwitchesToValue:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[ICMusicAccountNotificationsSettingsResponse createResponseBodyWithSwitches:](ICMusicAccountNotificationsSettingsResponse, "createResponseBodyWithSwitches:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICMusicAccountNotificationsSettingsRequestOperation initWithRequestContext:withRequestMethod:andBodyDictionary:]([ICMusicAccountNotificationsSettingsRequestOperation alloc], "initWithRequestContext:withRequestMethod:andBodyDictionary:", *(_QWORD *)(a1 + 48), 1, v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E438CA78;
    v6 = *(id *)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    -[ICMusicAccountNotificationsSettingsRequestOperation performRequestWithResponseHandler:](v5, "performRequestWithResponseHandler:", v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

void __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, objc_msgSend(v5, "wasSuccessful"));
  v8 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully retrieved account notifications switches response.", (uint8_t *)&v10, 0xCu);
  }

}

void __91__ICMusicAccountNotificationsSettingsManager_getAccountNotificationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v28 = v7;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully retrieved account notifications switches.", buf, 0xCu);
  }

  v21 = v5;
  objc_msgSend(v5, "settingsSwitches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", ICMusicAccountNotificationsSettingsSwitchShowInLibrary);

        if (v15)
        {
          +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "itemResponseDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAccountNotificationsShowInLibraryDictionary:", v17);
        }
        else
        {
          objc_msgSend(v13, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", ICMusicAccountNotificationsSettingsSwitchArtistsAndShows);

          if (!v19)
            continue;
          +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "itemResponseDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAccountNotificationsNewMusicDictionary:", v17);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
