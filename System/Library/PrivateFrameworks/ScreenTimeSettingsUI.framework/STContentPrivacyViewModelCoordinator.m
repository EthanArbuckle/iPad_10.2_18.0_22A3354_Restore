@implementation STContentPrivacyViewModelCoordinator

- (STContentPrivacyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4 userName:(id)a5
{
  id v9;
  id v10;
  id v11;
  STContentPrivacyViewModelCoordinator *v12;
  STContentPrivacyViewModelCoordinator *v13;
  uint64_t v14;
  NSNumber *userDSID;
  uint64_t v16;
  NSString *userName;
  uint64_t v18;
  STContentPrivacyViewModel *viewModel;
  STContentPrivacyViewModelCoordinator *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  STContentPrivacyViewModelCoordinator *v28;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)STContentPrivacyViewModelCoordinator;
  v12 = -[STContentPrivacyViewModelCoordinator init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistenceController, a3);
    v14 = objc_msgSend(v10, "copy");
    userDSID = v13->_userDSID;
    v13->_userDSID = (NSNumber *)v14;

    v16 = objc_msgSend(v11, "copy");
    userName = v13->_userName;
    v13->_userName = (NSString *)v16;

    v13->_isLocalDevice = 0;
    v18 = objc_opt_new();
    viewModel = v13->_viewModel;
    v13->_viewModel = (STContentPrivacyViewModel *)v18;

    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __88__STContentPrivacyViewModelCoordinator_initWithPersistenceController_userDSID_userName___block_invoke;
    v26 = &unk_24DB86690;
    v27 = v10;
    v20 = v13;
    v28 = v20;
    -[STContentPrivacyViewModelCoordinator loadViewModelWithCompletionHandler:](v20, "loadViewModelWithCompletionHandler:", &v23);
    -[STContentPrivacyViewModelCoordinator _registerForPersistentStoreNotifications](v20, "_registerForPersistentStoreNotifications", v23, v24, v25, v26);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v20, sel__contactStoreDidChange_, *MEMORY[0x24BDBA3D0], 0);

  }
  return v13;
}

void __88__STContentPrivacyViewModelCoordinator_initWithPersistenceController_userDSID_userName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __88__STContentPrivacyViewModelCoordinator_initWithPersistenceController_userDSID_userName___block_invoke_cold_1();
  }
  else
  {
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "userName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 40), "isLocalDevice");
      v8 = 138412802;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 1026;
      v13 = v7;
      _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_DEFAULT, "Editing Content & Privacy for user %@ name %@ on local device %{public}d", (uint8_t *)&v8, 0x1Cu);

    }
  }

}

+ (id)appRatingsRestrictionItem
{
  return -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("ratingApps"), CFSTR("AppsSpecifierName"), 3, 0);
}

+ (NSSet)_remoteDeviceRestrictions
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  STRestrictionItem *v11;
  STRestrictionItem *v12;
  STRestrictionItem *v13;
  STRestrictionItem *v14;
  STRestrictionItem *v15;
  STRestrictionItem *v16;
  STRestrictionItem *v17;
  STRestrictionItem *v18;
  STRestrictionItem *v19;
  STRestrictionItem *v20;
  void *v21;
  STRestrictionItem *v23;
  STRestrictionItem *v24;
  STRestrictionItem *v25;
  STRestrictionItem *v26;
  STRestrictionItem *v27;
  STRestrictionItem *v28;
  STRestrictionItem *v29;
  STRestrictionItem *v30;
  STRestrictionItem *v31;
  STRestrictionItem *v32;
  STRestrictionItem *v33;
  STRestrictionItem *v34;
  STRestrictionItem *v35;
  STRestrictionItem *v36;
  STRestrictionItem *v37;
  STRestrictionItem *v38;
  STRestrictionItem *v39;
  STRestrictionItem *v40;
  STRestrictionItem *v41;
  STRestrictionItem *v42;
  STRestrictionItem *v43;
  STRestrictionItem *v44;
  STRestrictionItem *v45;
  STRestrictionItem *v46;
  STRestrictionItem *v47;
  STRestrictionItem *v48;
  STRestrictionItem *v49;
  STRestrictionItem *v50;
  void *v51;
  void *v52;
  STRestrictionItem *v53;
  STRestrictionItem *v54;
  STRestrictionItem *v55;
  STRestrictionItem *v56;
  STRestrictionItem *v57;
  STRestrictionItem *v58;
  STRestrictionItem *v59;
  STRestrictionItem *v60;
  STRestrictionItem *v61;
  STRestrictionItem *v62;
  STRestrictionItem *v63;
  id v64;
  id v65;
  STRestrictionItem *v66;
  STRestrictionItem *v67;
  STRestrictionItem *v68;
  STRestrictionItem *v69;
  STRestrictionItem *v70;
  STRestrictionItem *v71;
  STRestrictionItem *v72;
  STRestrictionItem *v73;
  STRestrictionItem *v74;
  STRestrictionItem *v75;
  _QWORD v76[60];

  v76[58] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[STContentPrivacyViewModelCoordinator _remoteDeviceRestrictions].cold.1(v4);

  }
  v5 = objc_msgSend(v3, "isEqual:", CFSTR("CN"));
  v6 = CFSTR("MusicPodcastsNewsWorkoutsSpecifierName");
  if (v5)
    v6 = CFSTR("MusicPodcastsWorkoutsSpecifierName");
  v7 = v6;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isChinaRegionCellularDevice");

  if (v9)
    v10 = CFSTR("AADC_WirelessChangesSpecifierName");
  else
    v10 = CFSTR("AADC_CellularChangesSpecifierName");
  v64 = (id)MEMORY[0x24BDBCF20];
  v75 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowAppInstallation"), CFSTR("InstallingAppsSpecifierName"), 0, 0);
  v76[0] = v75;
  v74 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowUIAppInstallation"), CFSTR("InstallingUIAppsSpecifierName"), 0, 0);
  v76[1] = v74;
  v73 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowMarketplaceAppInstallation"), CFSTR("InstallingMarketplaceAppsSpecifierName"), 0, 0);
  v76[2] = v73;
  v72 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowWebDistributionAppInstallation"), CFSTR("InstallingWebDistributionAppsSpecifierName"), 0, 0);
  v76[3] = v72;
  v71 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowAppRemoval"), CFSTR("DeletingAppsSpecifierName"), 0, 0);
  v76[4] = v71;
  v70 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowInAppPurchases"), CFSTR("IAPSpecifierName"), 0, 0);
  v76[5] = v70;
  v69 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("forceITunesStorePasswordEntry"), CFSTR("RequirePasswordLabel"), 1, 0);
  v76[6] = v69;
  v68 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("blacklistedAppBundleIDs"), &stru_24DB8A1D0, 2, 0);
  v76[7] = v68;
  v67 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("allowiTunes"), &stru_24DB8A1D0, 0, 0);
  v76[8] = v67;
  v66 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("allowNews"), &stru_24DB8A1D0, 0, 0);
  v76[9] = v66;
  v63 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("allowSafari"), &stru_24DB8A1D0, 0, 0);
  v76[10] = v63;
  v62 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("allowPodcasts"), &stru_24DB8A1D0, 0, 0);
  v76[11] = v62;
  v61 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("allowVideoConferencing"), &stru_24DB8A1D0, 0, 0);
  v76[12] = v61;
  v60 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("legacy.restrictions.apps"), CFSTR("allowGroupActivity"), &stru_24DB8A1D0, 0, 0);
  v76[13] = v60;
  v59 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("media.settings"), CFSTR("allowBookstore"), CFSTR("iBookstoreSpecifierName"), 0, 0);
  v76[14] = v59;
  v58 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.camera"), CFSTR("allowCamera"), &stru_24DB8A1D0, 0, 0);
  v76[15] = v58;
  v57 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STCustomRestrictionConfiguration"), CFSTR("STCustomRestrictionSiriDictation"), CFSTR("SiriDictationSpecifierName"), 0, 0);
  v76[16] = v57;
  v56 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("allowAssistant"), &stru_24DB8A1D0, 0, 0);
  v76[17] = v56;
  v55 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("allowDictation"), &stru_24DB8A1D0, 0, 0);
  v76[18] = v55;
  v54 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.airdrop"), CFSTR("allowAirDrop"), CFSTR("AirDropSpecifierName"), 0, 0);
  v76[19] = v54;
  v53 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.carplay"), CFSTR("allowVehicleUI"), CFSTR("CarPlaySpecifierName"), 0, 0);
  v76[20] = v53;
  v11 = [STRestrictionItem alloc];
  +[STRegionRatings sharedRatings](STRegionRatings, "sharedRatings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "preferredRegion");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:](v11, "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("ratingRegion"), CFSTR("RatingForSpecifierName"), 3, v51);
  v76[21] = v50;
  v49 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("allowExplicitContent"), v7, 0, 0);

  v76[22] = v49;
  v48 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.music"), CFSTR("allowMusicVideos"), CFSTR("MusicVideosSpecifierName"), 0, 0);
  v76[23] = v48;
  v47 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.music"), CFSTR("allowMusicArtistActivity"), CFSTR("MusicProfilesSpecifierName"), 0, 0);
  v76[24] = v47;
  v46 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("ratingMovies"), CFSTR("MoviesSpecifierName"), 3, &unk_24DBBE8C8);
  v76[25] = v46;
  v45 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("allowShowingUndownloadedMovies"), CFSTR("UndownloadedMoviesSpecifierName"), 0, 0);
  v76[26] = v45;
  v44 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("ratingTVShows"), CFSTR("TVSpecifierName"), 3, &unk_24DBBE8C8);
  v76[27] = v44;
  v43 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("allowShowingUndownloadedTV"), CFSTR("UndownloadedTVSpecifierName"), 0, 0);
  v76[28] = v43;
  v42 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("media.settings"), CFSTR("allowBookstoreErotica"), CFSTR("BooksSpecifierName"), 0, 0);
  v76[29] = v42;
  v41 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.ratings"), CFSTR("ratingApps"), CFSTR("AppsSpecifierName"), 3, &unk_24DBBE8C8);
  v76[30] = v41;
  v40 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowAppClips"), CFSTR("AppClipsSpecifierName"), 0, 0);
  v76[31] = v40;
  v39 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STCustomRestrictionConfiguration"), CFSTR("STCustomRestrictionWebFilterState"), CFSTR("WebContentSpecifierName"), 3, &unk_24DBBE8E0);
  v76[32] = v39;
  v38 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("useContentFilter"), CFSTR("LimitAdultWebsitesSpecifierName"), 1, 0);
  v76[33] = v38;
  v37 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("whiteListEnabled"), CFSTR("AllowedWebsitesSpecifierName"), 1, 0);
  v76[34] = v37;
  v36 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("siteWhiteList"), CFSTR("AADC_OnlyAllowLabel"), 2, 0);
  v76[35] = v36;
  v35 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("filterWhiteList"), CFSTR("AlwaysAllowLabel"), 2, 0);
  v76[36] = v35;
  v34 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("filterBlackList"), CFSTR("NeverAllowLabel"), 2, 0);
  v76[37] = v34;
  v33 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("allowAssistantUserGeneratedContent"), CFSTR("WebSearchContentSpecifierName"), 0, 0);
  v76[38] = v33;
  v32 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("forceAssistantProfanityFilter"), CFSTR("ExplicitLanguageSpecifierName"), 1, 0);
  v76[39] = v32;
  v31 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowMultiplayerGaming"), CFSTR("MultiplayerGamesSpecifierName"), 0, 0);
  v76[40] = v31;
  v30 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowedGameCenterOtherPlayerTypes"), CFSTR("MultiplayerGamesSpecifierName"), 3, &unk_24DBBE8F8);
  v76[41] = v30;
  v29 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowAddingGameCenterFriends"), CFSTR("AddingFriendsSpecifierName"), 0, 0);
  v76[42] = v29;
  v28 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterFriendsSharingModification"), CFSTR("ConnectWithFriendsSpecifierName"), 0, 0);
  v76[43] = v28;
  v27 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.camera"), CFSTR("allowScreenRecording"), CFSTR("ScreenRecordingSpecifierName"), 0, 0);
  v76[44] = v27;
  v26 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterNearbyMultiplayer"), CFSTR("NearbyMultiplayerSpecifierName"), 0, 0);
  v76[45] = v26;
  v25 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterPrivateMessaging"), CFSTR("PrivateMessagingSpecifierName"), 0, 0);
  v76[46] = v25;
  v24 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterProfilePrivacyModification"), CFSTR("ProfilePrivacyChangesSpecifierName"), 0, 0);
  v76[47] = v24;
  v23 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterProfileModification"), CFSTR("AvatarNicknameChangesSpecifierName"), 0, 0);
  v76[48] = v23;
  v12 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.icloud"), CFSTR("allowFindMyFriendsModification"), CFSTR("ShareLocationSpecifierName"), 0, 0);
  v76[49] = v12;
  v13 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("passcode.settings"), CFSTR("allowPasscodeModification"), CFSTR("AADC_PasscodeAndFaceIDSpecifierName"), 0, 0);
  v76[50] = v13;
  v14 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("account.settings"), CFSTR("allowAccountModification"), CFSTR("AADC_AccountChangesSpecifierName"), 0, 0);
  v76[51] = v14;
  v15 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STCustomRestrictionConfiguration"), CFSTR("STCustomRestrictionCellularData"), v10, 0, 0);
  v76[52] = v15;
  v16 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("network.cellular.settings"), CFSTR("allowAppCellularDataModification"), &stru_24DB8A1D0, 0, 0);
  v76[53] = v16;
  v17 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("network.cellular.settings"), CFSTR("allowCellularPlanModification"), &stru_24DB8A1D0, 0, 0);
  v76[54] = v17;
  v18 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.donotdisturb"), CFSTR("allowDriverDoNotDisturbModifications"), CFSTR("DrivingFocusSpecifierName"), 0, 0);
  v76[55] = v18;
  v19 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.tvprovider"), CFSTR("allowTVProviderModification"), CFSTR("TVProviderSpecifierName"), 0, 0);
  v76[56] = v19;
  v20 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.settings"), CFSTR("allowAutomaticAppUpdatesModification"), CFSTR("AADC_BackgroundAppActivitiesSpecifierName"), 0, 0);
  v76[57] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 58);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setWithArray:", v21);
  v65 = (id)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v65;
}

+ (id)_localDeviceRestrictions
{
  STRestrictionItem *v2;
  STRestrictionItem *v3;
  STRestrictionItem *v4;
  STRestrictionItem *v5;
  STRestrictionItem *v6;
  STRestrictionItem *v7;
  STRestrictionItem *v8;
  STRestrictionItem *v9;
  void *v10;
  void *v11;
  STRestrictionItem *v13;
  STRestrictionItem *v14;
  void *v15;
  STRestrictionItem *v16;
  STRestrictionItem *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x24BDAC8D0];
  v15 = (void *)MEMORY[0x24BDBCF20];
  v17 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("location"), CFSTR("LocationServicesSpecifierName"), 0, 0);
  v18[0] = v17;
  v16 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceAddressBook"), CFSTR("ContactsSpecifierName"), 0, 0);
  v18[1] = v16;
  v14 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceCalendar"), CFSTR("CalendarsSpecifierName"), 0, 0);
  v18[2] = v14;
  v13 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceReminders"), CFSTR("RemindersSpecifierName"), 0, 0);
  v18[3] = v13;
  v2 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServicePhotos"), CFSTR("PhotosSpecifierName"), 0, 0);
  v18[4] = v2;
  v3 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceBluetoothAlways"), CFSTR("BluetoothSharingSpecifierName"), 0, 0);
  v18[5] = v3;
  v4 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceMicrophone"), CFSTR("MicrophoneSpecifierName"), 0, 0);
  v18[6] = v4;
  v5 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceSpeechRecognition"), CFSTR("SpeechRecognitionSpecifierName"), 0, 0);
  v18[7] = v5;
  v6 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("advertising"), CFSTR("AdvertisingSpecifierName"), 0, 0);
  v18[8] = v6;
  v7 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceMediaLibrary"), CFSTR("MediaAppleMusicSpecifierName"), 0, 0);
  v18[9] = v7;
  v8 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.web.tracking"), CFSTR("forceLimitAdTracking"), CFSTR("UserTrackingSpecifierName"), 1, 0);
  v18[10] = v8;
  v9 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("volumeLimit"), CFSTR("ReduceLoudSoundsSpecifierName"), 0, 0);
  v18[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_visibleRestrictions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  +[STContentPrivacyViewModelCoordinator _remoteDeviceRestrictions](STContentPrivacyViewModelCoordinator, "_remoteDeviceRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[STContentPrivacyViewModelCoordinator isLocalDevice](self, "isLocalDevice"))
  {
    +[STContentPrivacyViewModelCoordinator _localDeviceRestrictions](STContentPrivacyViewModelCoordinator, "_localDeviceRestrictions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

  }
  return v5;
}

- (id)_valueForMCFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveValueForSetting:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[STContentPrivacyViewModelCoordinator _valueForMCFeature:].cold.1();

  return v5;
}

- (void)_setValue:(id)a3 forMCFeature:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[STContentPrivacyViewModelCoordinator _setValue:forMCFeature:].cold.1();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBoolValue:forSetting:", objc_msgSend(v5, "BOOLValue"), v6);

}

- (id)_valueForSBCapability:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x24BE847B0], (CFStringRef)*MEMORY[0x24BE847B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  v5 = objc_msgSend(v4, "containsObject:", v3);
  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[STContentPrivacyViewModelCoordinator _valueForSBCapability:].cold.1();

  if (v5)
    v7 = (void *)MEMORY[0x24BDBD1C0];
  else
    v7 = (void *)MEMORY[0x24BDBD1C8];
  v8 = v7;

  return v8;
}

- (void)_setValue:(id)a3 forSBCapability:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[STContentPrivacyViewModelCoordinator _setValue:forSBCapability:].cold.1();

  v9 = (const __CFString *)*MEMORY[0x24BE847B0];
  v10 = (const __CFString *)*MEMORY[0x24BE847B8];
  v11 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x24BE847B0], (CFStringRef)*MEMORY[0x24BE847B8]);
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v11 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    objc_msgSend(v12, "removeObject:", v7);
  else
    objc_msgSend(v12, "addObject:", v7);
  if (objc_msgSend(v12, "count"))
    v13 = (const void *)*MEMORY[0x24BDBD270];
  else
    v13 = 0;
  objc_msgSend(v12, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(v9, v14, v10);
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x24BE847C0], v13, v10);
  CFPreferencesAppSynchronize(v10);
  notify_post("com.apple.locationd/Restrictions");
  notify_post("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification");
  v15 = objc_msgSend(v11, "containsObject:", v7);
  -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "hasPasscode")
    || !objc_msgSend(v7, "isEqualToString:", CFSTR("location")))
  {
    goto LABEL_16;
  }
  v17 = objc_msgSend(v6, "BOOLValue");

  if (v15 == v17)
  {
    objc_msgSend(v6, "BOOLValue");
    v16 = (void *)objc_opt_new();
    v18 = (void *)objc_opt_new();
    objc_msgSend(v16, "postNotificationForContext:", v18);

LABEL_16:
  }

}

- (id)_valueForWebFilterState
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  STRestrictionItem *v7;
  STRestrictionItem *v8;
  STRestrictionItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[STContentPrivacyViewModelCoordinator isRestrictAdultContentEnabledValue](self, "isRestrictAdultContentEnabledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[STContentPrivacyViewModelCoordinator isRestrictAdultContentEnabledValue](self, "isRestrictAdultContentEnabledValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyViewModelCoordinator isRestrictAdultContentEnabledValue](self, "isRestrictAdultContentEnabledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("restrictWeb"), &stru_24DB8A1D0, 3, 0);
    -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("useContentFilter"), &stru_24DB8A1D0, 3, 0);
    -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("whiteListEnabled"), &stru_24DB8A1D0, 3, 0);
  -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "BOOLValue"))
  {
    if (objc_msgSend(v6, "BOOLValue") && !objc_msgSend(v10, "BOOLValue"))
    {
      v15 = &unk_24DBBE910;
    }
    else
    {
      if ((objc_msgSend(v6, "BOOLValue") & 1) != 0 || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
      {
        -[STContentPrivacyViewModelCoordinator configurationPayloadsByType](self, "configurationPayloadsByType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("system.webcontentfilter.basic"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "serialize");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUILog contentPrivacy](STUILog, "contentPrivacy");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          v17 = 138544130;
          v18 = v5;
          v19 = 2114;
          v20 = v6;
          v21 = 2114;
          v22 = v10;
          v23 = 2112;
          v24 = v13;
          _os_log_fault_impl(&dword_219AB4000, v14, OS_LOG_TYPE_FAULT, "Unknown web filter state\n%{public}@ %{public}@ %{public}@ %@", (uint8_t *)&v17, 0x2Au);
        }

      }
      v15 = &unk_24DBBE928;
    }
  }
  else
  {
    v15 = &unk_24DBBE8E0;
  }

  return v15;
}

- (id)_restrictionsForWebFilterState:(unint64_t)a3
{
  STRestrictionItem *v5;
  uint64_t v6;
  STRestrictionItem *v7;
  STRestrictionItem *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  STRestrictionItem *v12;
  uint64_t v13;
  STRestrictionItem *v14;
  STRestrictionItem *v15;
  void *v16;
  STRestrictionItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  STRestrictionItem *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  STRestrictionItem *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    v12 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("restrictWeb"), &stru_24DB8A1D0, 3, 0);
    v46[0] = v12;
    v13 = MEMORY[0x24BDBD1C8];
    v47[0] = MEMORY[0x24BDBD1C8];
    v14 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("useContentFilter"), &stru_24DB8A1D0, 3, 0);
    v46[1] = v14;
    v47[1] = MEMORY[0x24BDBD1C0];
    v15 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("whiteListEnabled"), &stru_24DB8A1D0, 3, 0);
    v46[2] = v15;
    v47[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (STRestrictionItem *)objc_msgSend(v16, "mutableCopy");

    v17 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("siteWhiteList"), &stru_24DB8A1D0, 3, 0);
    -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v40 = v5;
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "defaultUserBookmarks");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v42 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            v28 = (void *)MEMORY[0x24BE190C0];
            objc_msgSend(v27, "URL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "absoluteString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "title");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "buildWithAddress:withPageTitle:", v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "addObject:", v32);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v24);
      }

      v33 = (void *)objc_msgSend(v21, "copy");
      v34 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("siteWhiteList"), &stru_24DB8A1D0, 3, 0);
      v5 = v40;
      -[STRestrictionItem setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v33, v34);

    }
    v35 = (void *)-[STRestrictionItem copy](v5, "copy");
  }
  else
  {
    if (a3 == 1)
    {
      v5 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("restrictWeb"), &stru_24DB8A1D0, 3, 0);
      v48[0] = v5;
      v36 = MEMORY[0x24BDBD1C8];
      v49[0] = MEMORY[0x24BDBD1C8];
      v7 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("useContentFilter"), &stru_24DB8A1D0, 3, 0);
      v48[1] = v7;
      v49[1] = v36;
      v8 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("whiteListEnabled"), &stru_24DB8A1D0, 3, 0);
      v48[2] = v8;
      v49[2] = MEMORY[0x24BDBD1C0];
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v49;
      v11 = v48;
    }
    else
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 636, CFSTR("Unimplemented web filter state %d"), a3);

        v35 = (void *)MEMORY[0x24BDBD1B8];
        return v35;
      }
      v5 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("restrictWeb"), &stru_24DB8A1D0, 3, 0);
      v50[0] = v5;
      v6 = MEMORY[0x24BDBD1C0];
      v51[0] = MEMORY[0x24BDBD1C0];
      v7 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("useContentFilter"), &stru_24DB8A1D0, 3, 0);
      v50[1] = v7;
      v51[1] = v6;
      v8 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.webcontentfilter.basic"), CFSTR("whiteListEnabled"), &stru_24DB8A1D0, 3, 0);
      v50[2] = v8;
      v51[2] = v6;
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v51;
      v11 = v50;
    }
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v35;
}

- (id)valueForRestriction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  STRestrictionItem *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  STRestrictionItem *v13;
  const __CFString *v14;
  uint64_t v15;
  STRestrictionItem *v16;
  uint64_t v17;
  STRestrictionItem *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;

  v5 = a3;
  objc_msgSend(v5, "rmConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("STCustomRestrictionConfiguration")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("STCustomRestrictionCellularData")))
    {
      v8 = CFSTR("network.cellular.settings");
      v9 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("network.cellular.settings"), CFSTR("allowAppCellularDataModification"), &stru_24DB8A1D0, 3, 0);
      -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDBD1C8];
      if (v10)
        v12 = (void *)v10;
      else
        v12 = (void *)MEMORY[0x24BDBD1C8];
      v13 = [STRestrictionItem alloc];
      v14 = CFSTR("allowCellularPlanModification");
LABEL_14:
      v18 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:](v13, "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", v8, v14, &stru_24DB8A1D0, 3, 0);
      -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = (void *)v19;
      else
        v20 = v11;
      v21 = objc_msgSend(v12, "BOOLValue");
      v22 = (void *)MEMORY[0x24BDBD1C0];
      if (v21 && objc_msgSend(v20, "BOOLValue"))
        v22 = v11;
      v23 = v22;

      goto LABEL_21;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("STCustomRestrictionSiriDictation")))
    {
      v8 = CFSTR("system.siri");
      v16 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("allowAssistant"), &stru_24DB8A1D0, 3, 0);
      -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDBD1C8];
      if (v17)
        v12 = (void *)v17;
      else
        v12 = (void *)MEMORY[0x24BDBD1C8];
      v13 = [STRestrictionItem alloc];
      v14 = CFSTR("allowDictation");
      goto LABEL_14;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("STCustomRestrictionWebFilterState")))
    {
      -[STContentPrivacyViewModelCoordinator _valueForWebFilterState](self, "_valueForWebFilterState");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 674, CFSTR("Unimplemented key %@"), v7);

LABEL_32:
    v23 = 0;
    goto LABEL_33;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("STMCFeatureConfiguration")))
  {
    -[STContentPrivacyViewModelCoordinator _valueForMCFeature:](self, "_valueForMCFeature:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_26:
    v23 = (id)v15;
    goto LABEL_33;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("STSBCapabilityConfiguration")))
  {
    -[STContentPrivacyViewModelCoordinator _valueForSBCapability:](self, "_valueForSBCapability:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  STSupportedConfigurations();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "objectForKeyedSubscript:", v6);

  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 681, CFSTR("Unimplemented configuration %@"), v6);

  }
  -[STContentPrivacyViewModelCoordinator configurationPayloadsByType](self, "configurationPayloadsByType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_32;
  -[STContentPrivacyViewModelCoordinator _valueInConfiguration:keyPath:](self, "_valueInConfiguration:keyPath:", v12, v7);
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_33:
  return v23;
}

- (id)_valuesByRestriction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_registerForPersistentStoreNotifications
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[STContentPrivacyViewModelCoordinator persistenceController](self, "persistenceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__STContentPrivacyViewModelCoordinator__registerForPersistentStoreNotifications__block_invoke;
  v6[3] = &unk_24DB86588;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

void __80__STContentPrivacyViewModelCoordinator__registerForPersistentStoreNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[5];

  v26[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userDSID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE846C8];
  objc_msgSend(MEMORY[0x24BE84510], "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:", v2, *MEMORY[0x24BE846C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v4, "setSortDescriptors:", MEMORY[0x24BDBD1A8]);
  v19 = v4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB688]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v4, *(_QWORD *)(a1 + 40), 0, 0);
  v20 = (void *)v2;
  objc_msgSend(MEMORY[0x24BE84518], "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:", v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB688]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v7, *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(MEMORY[0x24BE84568], "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB688]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v9, *(_QWORD *)(a1 + 40), 0, 0);
  v18 = (void *)v6;
  v26[0] = v6;
  v26[1] = v8;
  v26[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFetchedResultsControllers:", v11);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "fetchedResultsControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v17, "performFetch:", 0);
        objc_msgSend(v17, "setDelegate:", *(_QWORD *)(a1 + 32));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  NSObject *v8;
  NSObject *v9;

  if (-[STContentPrivacyViewModelCoordinator numExpectedChanges](self, "numExpectedChanges", a3, a4, a5, a6, a7))
  {
    -[STContentPrivacyViewModelCoordinator setNumExpectedChanges:](self, "setNumExpectedChanges:", -[STContentPrivacyViewModelCoordinator numExpectedChanges](self, "numExpectedChanges") - 1);
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[STContentPrivacyViewModelCoordinator controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:].cold.2(self);

  }
  else
  {
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[STContentPrivacyViewModelCoordinator controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:].cold.1(v9);

    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadViewModelForRemoteChanges, 0);
    -[STContentPrivacyViewModelCoordinator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadViewModelForRemoteChanges, 0, 0.0);
  }
}

- (void)reloadViewModelForRemoteChanges
{
  void *v3;

  -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsLoaded:", 0);

  -[STContentPrivacyViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", &__block_literal_global_7);
}

void __71__STContentPrivacyViewModelCoordinator_reloadViewModelForRemoteChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __71__STContentPrivacyViewModelCoordinator_reloadViewModelForRemoteChanges__block_invoke_cold_1();
  }
  else
  {
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_219AB4000, v3, OS_LOG_TYPE_DEFAULT, "Content & Privacy reloading because of remote change", v4, 2u);
    }
  }

}

- (id)_createUnrestrictedConfigurationForUser:(id)a3 withType:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_219AB4000, v9, OS_LOG_TYPE_DEFAULT, "Creating new restriction configuration %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "contentPrivacyConfigurationIdentifierForType:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("account.settings")))
  {
    v11 = (void *)MEMORY[0x24BE19050];
    goto LABEL_41;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("application.settings")))
  {
    v11 = (void *)MEMORY[0x24BE19060];
    goto LABEL_41;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("application.store")))
  {
    v11 = (void *)MEMORY[0x24BE19068];
    goto LABEL_41;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("legacy.restrictions.apps")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("media.settings")))
    {
      v11 = (void *)MEMORY[0x24BE19080];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("network.cellular.settings")))
    {
      v11 = (void *)MEMORY[0x24BE19088];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("passcode.settings")))
    {
      v11 = (void *)MEMORY[0x24BE19090];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.airdrop")))
    {
      v11 = (void *)MEMORY[0x24BE190B0];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.camera")))
    {
      v11 = (void *)MEMORY[0x24BE190C8];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.carplay")))
    {
      v11 = (void *)MEMORY[0x24BE190D0];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.donotdisturb")))
    {
      v11 = (void *)MEMORY[0x24BE190D8];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.gamecenter")))
    {
      v11 = (void *)MEMORY[0x24BE190E0];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.icloud")))
    {
      v11 = (void *)MEMORY[0x24BE19110];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.music")))
    {
      v11 = (void *)MEMORY[0x24BE190E8];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.ratings")))
    {
      v11 = (void *)MEMORY[0x24BE190F0];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.siri")))
    {
      v11 = (void *)MEMORY[0x24BE190F8];
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.tvprovider")))
    {
      v11 = (void *)MEMORY[0x24BE19100];
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("system.webcontentfilter.basic")))
      {
        objc_msgSend(MEMORY[0x24BE190B8], "buildRequiredOnlyWithIdentifier:withRestrictWeb:", v10, MEMORY[0x24BDBD1C0]);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_42:
        v12 = (void *)v13;
        goto LABEL_43;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("system.web.tracking")))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 811, CFSTR("Unimplemented for type %@"), v7);

        v12 = 0;
        goto LABEL_43;
      }
      v11 = (void *)MEMORY[0x24BE19108];
    }
LABEL_41:
    objc_msgSend(v11, "buildRequiredOnlyWithIdentifier:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BE19078], "buildRequiredOnlyWithIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPayloadBlacklistedAppBundleIDs:", MEMORY[0x24BDBD1A8]);
LABEL_43:

  return v12;
}

- (id)_valueInConfiguration:(id)a3 keyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "substringToIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", 1, objc_msgSend(v5, "length") - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "capitalizedString", CFSTR("payload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v14[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", &stru_24DB8A1D0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKeyPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_updateConfiguration:(id)a3 keyPath:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "substringToIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", 1, objc_msgSend(v9, "length") - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = CFSTR("payload");
  objc_msgSend(v10, "capitalizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  v22[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", &stru_24DB8A1D0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = objc_opt_class();
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_219AB4000, v15, OS_LOG_TYPE_DEFAULT, "Setting CEM key %@.%@ to %@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v7, "setValue:forKeyPath:", v8, v14);
  objc_msgSend(v7, "updateServerHash");

}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyViewModelCoordinator persistenceController](self, "persistenceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v9[3] = &unk_24DB87000;
  v10 = v5;
  v11 = v4;
  v9[4] = self;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "performBackgroundTask:", v9);

}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  char v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void (**v43)(id, id);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  BOOL v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  uint64_t v67;
  id v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  id v72;
  id *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  void (**v77)(id, id);
  void *v78;
  void *v79;
  BOOL v80;
  void *v81;
  char v82;
  NSObject *v83;
  char v84;
  void *v85;
  BOOL v86;
  unint64_t v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  id *v99;
  void *v100;
  void *v101;
  BOOL v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD block[5];
  id v107;
  id v108;
  id v109;
  id v110;
  unint64_t v111;
  BOOL v112;
  char v113;
  char v114;
  BOOL v115;
  BOOL v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  id v128;
  id v129;
  id v130;
  _BYTE v131[128];
  _BYTE v132[128];
  void *v133;
  __int128 buf;
  uint64_t (*v135)(uint64_t);
  void *v136;
  id v137;
  void (**v138)(id, id);
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = (id *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*v4, "userObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
LABEL_5:
    objc_msgSend(v7, "localUserDeviceState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "setIsLocalDevice:", v17 != 0);

    v18 = (void *)objc_opt_new();
    v19 = objc_msgSend(v7, "communicationPolicy");
    objc_msgSend(v18, "setScreenTimeCommunicationLimit:", v19);
    v20 = objc_msgSend(v7, "communicationWhileLimitedPolicy");
    objc_msgSend(v18, "setDowntimeCommunicationLimit:", v20);
    v21 = objc_msgSend(v7, "contactManagementState");
    objc_msgSend(v18, "setContactManagementState:", v21);
    v22 = objc_msgSend(v7, "contactsEditable");
    v97 = v18;
    objc_msgSend(v18, "setContactsEditable:", v22);
    if (v20 | v19 | v21)
      goto LABEL_9;
    objc_msgSend(v7, "effectivePasscode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      LOBYTE(v22) = 1;

    if ((v22 & 1) == 0)
    {
LABEL_9:
      objc_msgSend(v7, "dsid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[STCommunicationLimits setHasShownCompatibilityAlert:forDSID:](STCommunicationLimits, "setHasShownCompatibilityAlert:forDSID:", 1, v25);

    }
    objc_msgSend(v7, "managingOrganization");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BE84510];
    objc_msgSend(*v99, "userDSID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v28, *MEMORY[0x24BE846C8], v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v128 = v8;
    v96 = v29;
    objc_msgSend(v29, "execute:", &v128);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v128;

    v95 = v30;
    if (!v30)
    {
      +[STUILog persistence](STUILog, "persistence");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v97;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2();

      v43 = (void (**)(id, id))*(id *)(a1 + 48);
      v31 = v31;
      if (v43)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v43[2](v43, v31);
        }
        else
        {
          *(_QWORD *)&buf = MEMORY[0x24BDAC760];
          *((_QWORD *)&buf + 1) = 3221225472;
          v135 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
          v136 = &unk_24DB86C38;
          v138 = v43;
          v137 = v31;
          dispatch_async(MEMORY[0x24BDAC9B8], &buf);

        }
      }

LABEL_76:
      goto LABEL_77;
    }
    objc_msgSend(v30, "firstObject");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "organizationIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    v94 = v3;
    v98 = v32;
    if (-[NSObject isEqualToString:](v33, "isEqualToString:", *MEMORY[0x24BE84780]))
    {
      -[NSObject identifier](v32, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BE847A8]);

      if (!v35)
      {
LABEL_26:
        v91 = v26;
        v92 = a1;
        v93 = v7;
        v44 = (void *)MEMORY[0x24BDBCED8];
        -[NSObject configurations](v98, "configurations");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("objectID.URIRepresentation.absoluteString"), 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v47;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v133, 1);
        v48 = objc_claimAutoreleasedReturnValue();

        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        -[NSObject configurations](v98, "configurations");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (void *)v48;
        objc_msgSend(v49, "sortedArrayUsingDescriptors:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v101 = v46;
        v105 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
        v51 = 0;
        if (v105)
        {
          v104 = *(_QWORD *)v124;
          v100 = v50;
          do
          {
            for (i = 0; i != v105; ++i)
            {
              v53 = v31;
              if (*(_QWORD *)v124 != v104)
                objc_enumerationMutation(v50);
              v54 = (void *)MEMORY[0x24BE19070];
              objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "payloadPlist");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = v31;
              objc_msgSend(v54, "declarationForData:error:", v55, &v122);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v122;

              if (v56)
              {
                if (v51)
                {
                  v51 = 1;
                }
                else
                {
                  objc_msgSend(v56, "unknownPayloadKeys");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v58, "count") != 0;

                }
                objc_msgSend(v56, "declarationType");
                v57 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectForKeyedSubscript:", v57);
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                if (v59)
                {
                  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
                  {
                    LODWORD(buf) = 138543362;
                    *(_QWORD *)((char *)&buf + 4) = v57;
                    _os_log_fault_impl(&dword_219AB4000, v60, OS_LOG_TYPE_FAULT, "Duplicate configurations of type %{public}@ found, skipping", (uint8_t *)&buf, 0xCu);
                  }
                }
                else
                {
                  v102 = v51;
                  v61 = v31;
                  STSupportedConfigurations();
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v118 = 0u;
                  v119 = 0u;
                  v120 = 0u;
                  v121 = 0u;
                  v60 = v62;
                  v63 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
                  if (v63)
                  {
                    v64 = v63;
                    v65 = *(_QWORD *)v119;
                    while (2)
                    {
                      for (j = 0; j != v64; ++j)
                      {
                        if (*(_QWORD *)v119 != v65)
                          objc_enumerationMutation(v60);
                        v67 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * j);
                        v68 = (id)-[NSObject objectForKeyedSubscript:](v60, "objectForKeyedSubscript:", v67);
                        if (v68 == (id)objc_opt_class())
                        {
                          v46 = v101;
                          objc_msgSend(v101, "setObject:forKeyedSubscript:", v56, v67);
                          v69 = v60;
                          goto LABEL_53;
                        }
                      }
                      v64 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
                      if (v64)
                        continue;
                      break;
                    }
                  }

                  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
                  v69 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = 138412290;
                    *(_QWORD *)((char *)&buf + 4) = v57;
                    _os_log_error_impl(&dword_219AB4000, v69, OS_LOG_TYPE_ERROR, "Unknown future configuration, preserving: %@", (uint8_t *)&buf, 0xCu);
                  }
                  v46 = v101;
LABEL_53:

                  v31 = v61;
                  v51 = v102;
                  v50 = v100;
                }

              }
              else
              {
                +[STUILog contentPrivacy](STUILog, "contentPrivacy");
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v31;
                  _os_log_error_impl(&dword_219AB4000, v57, OS_LOG_TYPE_ERROR, "Error deserializing configuration from DB: %{public}@", (uint8_t *)&buf, 0xCu);
                }
                v51 = 1;
              }

            }
            v105 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
          }
          while (v105);
        }
        v103 = v51;

        v7 = v93;
        if (_os_feature_enabled_impl())
        {
          v70 = (void *)objc_opt_new();
          v117 = 0;
          v71 = objc_msgSend(v70, "isRestrictAdultContentEnabled:", &v117);
          v72 = v117;

          v73 = v99;
          objc_msgSend(*v99, "setIsRestrictAdultContentEnabledValue:", 0);
          +[STUILog contentPrivacy](STUILog, "contentPrivacy");
          v74 = objc_claimAutoreleasedReturnValue();
          v75 = v74;
          if (v72)
          {
            if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
              __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3();
          }
          else
          {
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v71);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v78;
              _os_log_impl(&dword_219AB4000, v75, OS_LOG_TYPE_DEFAULT, "Using isRestrictAdultContentEnabled state: %{public}@", (uint8_t *)&buf, 0xCu);

              v73 = v99;
            }

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v71);
            v75 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v73, "setIsRestrictAdultContentEnabledValue:", v75);
          }

        }
        objc_msgSend(v93, "effectivePasscode");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "length") != 0;

        objc_msgSend(*v99, "isRestrictAdultContentEnabledValue");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v81, "BOOLValue") & 1) != 0)
        {
          v82 = 1;
          v83 = v98;
        }
        else
        {
          v83 = v98;
          v82 = -[NSObject enabled](v98, "enabled");
        }

        v84 = objc_msgSend(v93, "isManaged");
        objc_msgSend(v93, "localUserDeviceState");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v85 == 0;

        v87 = +[STUIUser userTypeFromUser:](STUIUser, "userTypeFromUser:", v93);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_568;
        block[3] = &unk_24DB86FD8;
        v88 = *(void **)(v92 + 40);
        block[4] = *(_QWORD *)(v92 + 32);
        v107 = v101;
        v108 = v88;
        v112 = v80;
        v113 = v82;
        v42 = v97;
        v114 = v84;
        v115 = v86;
        v109 = v97;
        v111 = v87;
        v116 = v103;
        v110 = *(id *)(v92 + 48);
        v89 = v101;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        v26 = v91;
        v3 = v94;
        goto LABEL_76;
      }
      +[STUILog persistence](STUILog, "persistence");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5(v98, v36);

      -[NSObject tombstone](v98, "tombstone");
      objc_msgSend(*v99, "persistenceController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v31;
      v38 = objc_msgSend(v37, "saveContext:error:", v3, &v127);
      v39 = v127;

      +[STUILog persistence](STUILog, "persistence");
      v40 = objc_claimAutoreleasedReturnValue();
      v33 = v40;
      if ((v38 & 1) != 0)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_219AB4000, v33, OS_LOG_TYPE_DEFAULT, "Saved database after deleting Family Restrictions blueprint with Personal organization identifier.", (uint8_t *)&buf, 2u);
        }

        v33 = v98;
        v98 = 0;
      }
      else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4();
      }
    }
    else
    {
      v39 = v31;
    }

    v31 = v39;
    goto LABEL_26;
  }
  v9 = (void *)MEMORY[0x24BE84570];
  objc_msgSend(*v4, "userDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestForUsersWithDSID:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = 0;
  objc_msgSend(v7, "execute:", &v130);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v130;
  if (v11)
  {
    v13 = (void *)MEMORY[0x24BE84570];
    objc_msgSend(*v4, "userDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v12;
    objc_msgSend(v13, "fetchUserWithDSID:inContext:error:", v14, v3, &v129);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v129;

    objc_msgSend(v15, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v99, "setUserObjectID:", v16);

    v7 = v15;
    v4 = (id *)(a1 + 32);
    goto LABEL_5;
  }
  +[STUILog persistence](STUILog, "persistence");
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v12, v76);

  v77 = (void (**)(id, id))*(id *)(a1 + 48);
  v31 = v12;
  if (v77)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v77[2](v77, v31);
    }
    else
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v135 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      v136 = &unk_24DB86C38;
      v138 = v77;
      v137 = v31;
      dispatch_async(MEMORY[0x24BDAC9B8], &buf);

    }
  }

LABEL_77:
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_568(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);
  _QWORD v7[4];
  id v8;
  void (**v9)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "setConfigurationPayloadsByType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setIsLocalDevice:", objc_msgSend(*(id *)(a1 + 32), "isLocalDevice"));
  objc_msgSend(*(id *)(a1 + 48), "setHasPasscode:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "setRestrictionsEnabled:", *(unsigned __int8 *)(a1 + 81));
  objc_msgSend(*(id *)(a1 + 32), "userName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setUserName:", v2);

  objc_msgSend(*(id *)(a1 + 32), "userDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setUserDSID:", v3);

  objc_msgSend(*(id *)(a1 + 48), "setCommunicationLimits:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "setUserIsManaged:", *(unsigned __int8 *)(a1 + 82));
  objc_msgSend(*(id *)(a1 + 48), "setUserIsRemote:", *(unsigned __int8 *)(a1 + 83));
  objc_msgSend(*(id *)(a1 + 48), "setUserType:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "_visibleRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setVisibleRestrictions:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_valuesByRestriction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setValuesByRestriction:", v5);

  objc_msgSend(*(id *)(a1 + 48), "setShouldAllowEditing:", *(_BYTE *)(a1 + 84) == 0);
  objc_msgSend(*(id *)(a1 + 48), "setIsLoaded:", 1);
  v6 = (void (**)(id, _QWORD))*(id *)(a1 + 64);
  if (v6)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v6[2](v6, 0);
    }
    else
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      v7[3] = &unk_24DB86C38;
      v8 = 0;
      v9 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v7);

    }
  }

}

- (void)loadValuesByRestrictionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__STContentPrivacyViewModelCoordinator_loadValuesByRestrictionWithCompletionHandler___block_invoke;
  v6[3] = &unk_24DB87028;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[STContentPrivacyViewModelCoordinator loadViewModelWithCompletionHandler:](self, "loadViewModelWithCompletionHandler:", v6);

}

void __85__STContentPrivacyViewModelCoordinator_loadValuesByRestrictionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valuesByRestriction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);

}

- (void)saveContentPrivacyEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  _DWORD v21[7];

  v4 = a3;
  *(_QWORD *)&v21[5] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[STUILog contentPrivacy](STUILog, "contentPrivacy");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[STContentPrivacyViewModelCoordinator userDSID](self, "userDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240450;
    v21[0] = v4;
    LOWORD(v21[1]) = 2112;
    *(_QWORD *)((char *)&v21[1] + 2) = v8;
    _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_DEFAULT, "Asked to change restriction enabled/disabled to %{public}d for %@", buf, 0x12u);

  }
  if (!v4 && -[STContentPrivacyViewModelCoordinator isLocalDevice](self, "isLocalDevice"))
  {
    v9 = (const __CFString *)*MEMORY[0x24BE847B0];
    v10 = (const __CFString *)*MEMORY[0x24BE847B8];
    v11 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x24BE847B0], (CFStringRef)*MEMORY[0x24BE847B8]);
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v21 = v11;
      _os_log_impl(&dword_219AB4000, v12, OS_LOG_TYPE_DEFAULT, "Deleting SpringBoard restrictions. Were: %{public}@", buf, 0xCu);
    }

    CFPreferencesSetAppValue(v9, 0, v10);
    CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x24BE847C0], 0, v10);
    CFPreferencesAppSynchronize(v10);
    notify_post("com.apple.locationd/Restrictions");
    notify_post("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification");
    -[STContentPrivacyViewModelCoordinator _valuesByRestriction](self, "_valuesByRestriction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValuesByRestriction:", v13);

  }
  -[STContentPrivacyViewModelCoordinator persistenceController](self, "persistenceController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke;
  v17[3] = &unk_24DB87078;
  v17[4] = self;
  v18 = v6;
  v19 = v4;
  v16 = v6;
  objc_msgSend(v15, "performBackgroundTask:", v17);

}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  void (*v38)(uint64_t, void *);
  void *v39;
  uint64_t v40;
  id v41;
  char v42;
  id v43;
  id v44;
  uint64_t block;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  void *v48;
  id v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v3, "objectWithID:", v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "managingOrganization");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BE84510];
    objc_msgSend(*v4, "userDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE846C8];
    v36 = (void *)v8;
    objc_msgSend(v9, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v10, *MEMORY[0x24BE846C8], v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0;
    v35 = v12;
    objc_msgSend(v12, "execute:", &v44);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v44;
    if (v13)
    {
      objc_msgSend(v13, "firstObject");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84510]), "initWithContext:", v3);
        objc_msgSend(v15, "setType:", v11);
        objc_msgSend(v7, "contentPrivacyActivationIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIdentifier:", v16);

        v17 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v3, "objectWithID:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWithObject:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setUsers:", v19);

        objc_msgSend(v15, "setOrganization:", v36);
      }
      objc_msgSend(v15, "setIsDirty:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setNumExpectedChanges:", objc_msgSend(*(id *)(a1 + 32), "numExpectedChanges") + 1);
      objc_msgSend(v15, "setEnabled:", *(unsigned __int8 *)(a1 + 48));
      if ((_os_feature_enabled_impl() & 1) != 0)
      {
        v20 = v14;
      }
      else
      {
        +[STUILog contentPrivacy](STUILog, "contentPrivacy");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_4((id *)(a1 + 32));

        objc_msgSend(*v4, "persistenceController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v14;
        v30 = objc_msgSend(v29, "saveContext:error:", v3, &v43);
        v20 = v43;

        if ((v30 & 1) == 0)
        {
          +[STUILog persistence](STUILog, "persistence");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_3();

        }
      }
      v32 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v38 = __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_573;
      v39 = &unk_24DB87050;
      v33 = *(void **)(a1 + 40);
      v40 = *(_QWORD *)(a1 + 32);
      v42 = *(_BYTE *)(a1 + 48);
      v41 = v33;
      v34 = v37;
      v26 = v20;
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v38((uint64_t)v34, v26);
      }
      else
      {
        block = v32;
        v46 = 3221225472;
        v47 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v48 = &unk_24DB86C38;
        v50 = v34;
        v49 = v26;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
    else
    {
      +[STUILog persistence](STUILog, "persistence");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_2();

      v15 = *(id *)(a1 + 40);
      v26 = v14;
      if (v15)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          (*((void (**)(id, id))v15 + 2))(v15, v26);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v46 = 3221225472;
          v47 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
          v48 = &unk_24DB86C38;
          v50 = v15;
          v49 = v26;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }

    }
  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();

    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BE84710];
    v51 = *MEMORY[0x24BDD0FC8];
    v52[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 11, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(id *)(a1 + 40);
    v26 = v25;
    if (v7)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*((void (**)(id, id))v7 + 2))(v7, v26);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v46 = 3221225472;
        v47 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v48 = &unk_24DB86C38;
        v50 = v7;
        v49 = v26;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_573(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRestrictionsEnabled:", *(unsigned __int8 *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v3, "valuesByRestriction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_reportCoreAnalyticsEventWithRestrictionsEnabled:valuesByRestriction:userType:userIsManaged:", v5, v6, objc_msgSend(v3, "userType"), objc_msgSend(v3, "userIsManaged"));

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (void)saveCommunicationLimits:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  STContentPrivacyViewModelCoordinator *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[STContentPrivacyViewModelCoordinator userObjectID](self, "userObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke;
  v13[3] = &unk_24DB870C8;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v13);

}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void (**v25)(id, id);
  void (**v26)(id, id);
  int8x16_t v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, void *);
  void *v30;
  int8x16_t v31;
  id v32;
  id v33;
  uint64_t block;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  id v38;
  void (**v39)(id, id);
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(v3, "objectWithID:"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "setCommunicationPolicy:", objc_msgSend(*(id *)(a1 + 40), "screenTimeCommunicationLimit"));
    objc_msgSend(v6, "setCommunicationWhileLimitedPolicy:", objc_msgSend(*(id *)(a1 + 40), "downtimeCommunicationLimit"));
    objc_msgSend(v6, "setContactManagementState:", objc_msgSend(*(id *)(a1 + 40), "contactManagementState"));
    objc_msgSend(v6, "setContactsEditable:", objc_msgSend(*(id *)(a1 + 40), "contactsEditable"));
    objc_msgSend(*(id *)(a1 + 48), "persistenceController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v8 = objc_msgSend(v7, "saveContext:error:", v4, &v33);
    v9 = v33;

    if ((v8 & 1) != 0)
    {
      v10 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v29 = __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_574;
      v30 = &unk_24DB870A0;
      v27 = *(int8x16_t *)(a1 + 40);
      v11 = (id)v27.i64[0];
      v31 = vextq_s8(v27, v27, 8uLL);
      v32 = *(id *)(a1 + 56);
      v12 = v28;
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v29((uint64_t)v12, 0);
      }
      else
      {
        block = v10;
        v35 = 3221225472;
        v36 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v37 = &unk_24DB86C38;
        v26 = v12;
        v38 = 0;
        v39 = v26;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }
    else
    {
      +[STUILog persistence](STUILog, "persistence");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_2();

      v25 = (void (**)(id, id))*(id *)(a1 + 56);
      v9 = v9;
      if (v25)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v25[2](v25, v9);
        }
        else
        {
          block = MEMORY[0x24BDAC760];
          v35 = 3221225472;
          v36 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
          v37 = &unk_24DB86C38;
          v39 = v25;
          v38 = v9;
          dispatch_async(MEMORY[0x24BDAC9B8], &block);

        }
      }

    }
  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_1(a1 + 32, v13, v14, v15, v16, v17, v18, v19);

    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BE84710];
    v40 = *MEMORY[0x24BDD0FC8];
    v41[0] = CFSTR("user could not be found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 11, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(id *)(a1 + 56);
    v9 = v23;
    if (v6)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*((void (**)(id, id))v6 + 2))(v6, v9);
      }
      else
      {
        block = MEMORY[0x24BDAC760];
        v35 = 3221225472;
        v36 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v37 = &unk_24DB86C38;
        v39 = (void (**)(id, id))v6;
        v38 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], &block);

      }
    }

  }
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_574(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_reportCoreAnalyticsEventForChangedCommunicationLimits:userType:userIsRemote:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "userType"), objc_msgSend(v3, "userIsRemote"));
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)saveValuesForRestrictions:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[STContentPrivacyViewModelCoordinator persistenceController](self, "persistenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke;
  v12[3] = &unk_24DB87118;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "performBackgroundTask:", v12);

}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void (**v70)(id, id);
  NSObject *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void (**v77)(id, id);
  void *v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  char v82;
  id v83;
  uint64_t v84;
  _QWORD *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id obj;
  id obja;
  id *v97;
  _QWORD v98[2];
  uint64_t (*v99)(uint64_t);
  void *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  const __CFString *v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;
  const __CFString *v119;
  _BYTE buf[24];
  void *v121;
  id v122;
  void (**v123)(id, id);
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "userObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = a1;
  if (v5)
  {
    objc_msgSend(v3, "objectWithID:", v5);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91)
    {
      v89 = v5;
      v90 = v3;
      v92 = (void *)objc_opt_new();
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      obj = *(id *)(a1 + 40);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
      v97 = (id *)(a1 + 32);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v111 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11 == v12)
            {

              v11 = 0;
            }
            objc_msgSend(v10, "rmConfiguration");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "payloadKey");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUILog contentPrivacy](STUILog, "contentPrivacy");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*v4, "userDSID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v10;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v11;
              *(_WORD *)&buf[22] = 2112;
              v121 = v16;
              _os_log_impl(&dword_219AB4000, v15, OS_LOG_TYPE_DEFAULT, "Asked to change restriction %{public}@ value to %{public}@ for %@", buf, 0x20u);

              v4 = v97;
            }

            if (objc_msgSend(v13, "isEqualToString:", CFSTR("STCustomRestrictionConfiguration")))
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("STContentPrivacyViewModel.m"), 1133, CFSTR("Unimplemented restriction %@ %@"), v13, v14);

            }
            else if (objc_msgSend(v13, "isEqualToString:", CFSTR("STSBCapabilityConfiguration")))
            {
              objc_msgSend(*v4, "viewModel");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "valuesByRestriction");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, v10);

              v4 = v97;
              objc_msgSend(*v97, "_setValue:forSBCapability:", v11, v14);
            }
            else
            {
              v20 = objc_msgSend(v13, "isEqualToString:", CFSTR("STMCFeatureConfiguration"));
              objc_msgSend(*v4, "viewModel");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "valuesByRestriction");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, v10);

              v4 = v97;
              v23 = *v97;
              if (v20)
              {
                objc_msgSend(v23, "_setValue:forMCFeature:", v11, v14);
              }
              else
              {
                objc_msgSend(v23, "configurationPayloadsByType");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectForKeyedSubscript:", v13);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v25)
                {
                  objc_msgSend(*v97, "_createUnrestrictedConfigurationForUser:withType:", v91, v13);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(*v97, "_updateConfiguration:keyPath:value:", v25, v14, v11);
                objc_msgSend(*v97, "configurationPayloadsByType");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*v97, "setConfigurationPayloadsByType:", v27);

                }
                objc_msgSend(*v97, "configurationPayloadsByType");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, v13);

                objc_msgSend(v92, "addObject:", v13);
              }
              a1 = v93;
            }

          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
        }
        while (v7);
      }

      if (!objc_msgSend(v92, "count"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v35 = 0;
        v5 = v89;
        v3 = v90;
LABEL_83:

        goto LABEL_84;
      }
      objc_msgSend(v91, "managingOrganization");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x24BE84510];
      objc_msgSend(*v4, "userDSID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *MEMORY[0x24BE846C8];
      objc_msgSend(v30, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v31, *MEMORY[0x24BE846C8], v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v109 = 0;
      objc_msgSend(v33, "execute:", &v109);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v109;
      v5 = v89;
      v3 = v90;
      if (!v34)
      {
        +[STUILog persistence](STUILog, "persistence");
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
          __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_2();

        (*(void (**)(void))(*(_QWORD *)(v93 + 48) + 16))();
LABEL_82:

        goto LABEL_83;
      }
      v88 = v33;
      objc_msgSend(v34, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[STUILog persistence](STUILog, "persistence");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219AB4000, v37, OS_LOG_TYPE_DEFAULT, "Restrictions blueprint is missing, will create one", buf, 2u);
        }

        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84510]), "initWithContext:", v90);
        objc_msgSend(v36, "setType:", v32);
        objc_msgSend(v91, "contentPrivacyActivationIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setIdentifier:", v38);

        v39 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v90, "objectWithID:", v89);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setWithObject:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setUsers:", v41);

        objc_msgSend(v36, "setOrganization:", v29);
      }
      v94 = v34;
      objc_msgSend(v36, "setIsDirty:", 1);
      objc_msgSend(*v4, "setNumExpectedChanges:", objc_msgSend(*v4, "numExpectedChanges") + 1);
      obja = v36;
      objc_msgSend(v36, "configurations");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allObjects");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(v43, "valueForKey:", CFSTR("type"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v43;
      objc_msgSend(v44, "dictionaryWithObjects:forKeys:", v43, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v47 = v92;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v106;
        v86 = v29;
        while (2)
        {
          v51 = 0;
          v52 = v35;
          do
          {
            if (*(_QWORD *)v106 != v50)
              objc_enumerationMutation(v47);
            v53 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v51);
            objc_msgSend(*v97, "configurationPayloadsByType");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v55)
            {
              +[STUILog persistence](STUILog, "persistence");
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_6();

              v73 = (void *)MEMORY[0x24BDD1540];
              v74 = *MEMORY[0x24BE84710];
              v114 = *MEMORY[0x24BDD0FC8];
              v115 = CFSTR("restrictions blueprint configuration payload not found");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "errorWithDomain:code:userInfo:", v74, 58, v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              v77 = (void (**)(id, id))*(id *)(v93 + 48);
              v35 = v76;
              v5 = v89;
              v3 = v90;
              v29 = v86;
              v78 = v87;
              v33 = v88;
              if (v77)
              {
                if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
                {
                  v77[2](v77, v35);
                }
                else
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
                  v121 = &unk_24DB86C38;
                  v123 = v77;
                  v122 = v35;
                  dispatch_async(MEMORY[0x24BDAC9B8], buf);

                }
              }

              goto LABEL_81;
            }
            objc_msgSend(v46, "objectForKeyedSubscript:", v53);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v56)
            {
              v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84518]), "initWithContext:", v90);
              objc_msgSend(v55, "declarationIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setIdentifier:", v57);

              objc_msgSend(v56, "setType:", v53);
              objc_msgSend(v56, "setBlueprint:", obja);
            }
            objc_msgSend(v55, "updateServerHash");
            v104 = v52;
            objc_msgSend(v55, "serializeAsDataWithError:", &v104);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v104;

            if (!v58)
            {
              +[STUILog persistence](STUILog, "persistence");
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v35;
                _os_log_fault_impl(&dword_219AB4000, v79, OS_LOG_TYPE_FAULT, "failed to serialize restrictions during save: %{public}@", buf, 0xCu);
              }

              (*(void (**)(void))(*(_QWORD *)(v93 + 48) + 16))();
              v5 = v89;
              v3 = v90;
              v29 = v86;
              v78 = v87;
              v33 = v88;
              goto LABEL_81;
            }
            objc_msgSend(v56, "setPayloadPlist:", v58);
            objc_msgSend(*v97, "setNumExpectedChanges:", objc_msgSend(*v97, "numExpectedChanges") + 1);

            ++v51;
            v52 = v35;
          }
          while (v49 != v51);
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
          v3 = v90;
          v29 = v86;
          if (v49)
            continue;
          break;
        }
      }

      if ((_os_feature_enabled_impl() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE84498], "sharedController");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE84498], "sharedController");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "viewContext");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = 0;
        v62 = objc_msgSend(v59, "saveContext:error:", v61, &v102);
        v63 = v102;

        v5 = v89;
        if ((v62 & 1) == 0)
        {
          +[STUILog persistence](STUILog, "persistence");
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
            __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_3();

        }
      }
      else
      {
        +[STUILog contentPrivacy](STUILog, "contentPrivacy");
        v80 = objc_claimAutoreleasedReturnValue();
        v5 = v89;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_5(v97);

        objc_msgSend(*v97, "persistenceController");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v35;
        v82 = objc_msgSend(v81, "saveContext:error:", v3, &v103);
        v83 = v103;

        if ((v82 & 1) != 0)
        {
          v78 = v87;
          goto LABEL_77;
        }
        +[STUILog persistence](STUILog, "persistence");
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
          __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_3();
        v35 = v83;
      }
      v78 = v87;

      v83 = v35;
LABEL_77:
      v84 = MEMORY[0x24BDAC760];
      v98[0] = MEMORY[0x24BDAC760];
      v98[1] = 3221225472;
      v99 = __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_583;
      v100 = &unk_24DB870F0;
      v101 = *(id *)(v93 + 48);
      v85 = v98;
      v35 = v83;
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (*)(_QWORD *, id))v99)(v85, v35);
      }
      else
      {
        *(_QWORD *)buf = v84;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v121 = &unk_24DB86C38;
        v123 = v85;
        v122 = v35;
        dispatch_async(MEMORY[0x24BDAC9B8], buf);

      }
      v33 = v88;

      v47 = v101;
LABEL_81:

      v34 = v94;
      goto LABEL_82;
    }
  }
  +[STUILog persistence](STUILog, "persistence");
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();

  v66 = (void *)MEMORY[0x24BDD1540];
  v67 = *MEMORY[0x24BE84710];
  v118 = *MEMORY[0x24BDD0FC8];
  v119 = CFSTR("user could not be found");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "errorWithDomain:code:userInfo:", v67, 11, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (void (**)(id, id))*(id *)(v93 + 48);
  v35 = v69;
  if (v70)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v70[2](v70, v35);
    }
    else
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      v121 = &unk_24DB86C38;
      v123 = v70;
      v122 = v35;
      dispatch_async(MEMORY[0x24BDAC9B8], buf);

    }
  }

LABEL_84:
}

uint64_t __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_583(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveRestrictionValue:(id)a3 forItem:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  STRestrictionItem *v14;
  STRestrictionItem *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  STRestrictionItem *v19;
  void *v20;
  STRestrictionItem *v21;
  void *v22;
  char v23;
  STRestrictionItem *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  STRestrictionItem *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "rmConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "payloadKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v13;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("STCustomRestrictionConfiguration")))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("STCustomRestrictionCellularData")))
    {
      v14 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("network.cellular.settings"), CFSTR("allowAppCellularDataModification"), &stru_24DB8A1D0, 3, 0);
      v41[0] = v14;
      v42[0] = v9;
      v15 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("network.cellular.settings"), CFSTR("allowCellularPlanModification"), &stru_24DB8A1D0, 3, 0);
      v41[1] = v15;
      v42[1] = v9;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v42;
      v18 = v41;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("STCustomRestrictionSiriDictation")))
      {
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("STCustomRestrictionWebFilterState")))
        {
          -[STContentPrivacyViewModelCoordinator _restrictionsForWebFilterState:](self, "_restrictionsForWebFilterState:", objc_msgSend(v9, "unsignedIntegerValue"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 1265, CFSTR("Unimplemented restriction %@ %@"), v12, v13);

          v20 = 0;
        }
        goto LABEL_21;
      }
      v14 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("allowAssistant"), &stru_24DB8A1D0, 3, 0);
      v39[0] = v14;
      v40[0] = v9;
      v15 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.siri"), CFSTR("allowDictation"), &stru_24DB8A1D0, 3, 0);
      v39[1] = v15;
      v40[1] = v9;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v40;
      v18 = v39;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
    -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
    v19 = (STRestrictionItem *)objc_claimAutoreleasedReturnValue();
    -[STRestrictionItem valuesByRestriction](v19, "valuesByRestriction");
    v21 = (STRestrictionItem *)objc_claimAutoreleasedReturnValue();
    -[STRestrictionItem setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v9, v10);
    goto LABEL_22;
  }
  v19 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowedGameCenterOtherPlayerTypes"), &stru_24DB8A1D0, 3, 0);
  v20 = 0;
  if (objc_msgSend(v10, "isEqual:", v19))
  {
    -[STContentPrivacyViewModelCoordinator createValuesForRestrictions:multiplayerRestriction:](self, "createValuesForRestrictions:multiplayerRestriction:", v9, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowAppInstallation"), &stru_24DB8A1D0, 0, 0);
  if (objc_msgSend(v10, "isEqual:", v21))
  {
    v31 = v12;
    -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEligibleForAppDistribution");

    if ((v23 & 1) == 0)
    {
      v30 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowAppInstallation"), &stru_24DB8A1D0, 3, 0);
      v37[0] = v30;
      v38[0] = v9;
      v24 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("application.store"), CFSTR("allowUIAppInstallation"), &stru_24DB8A1D0, 3, 0);
      v37[1] = v24;
      v38[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v25 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v25;
    }
    v12 = v31;
  }
  if (!v20)
  {
    v26 = v12;
    v35 = v10;
    v27 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)

    v12 = v26;
  }
LABEL_22:

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __87__STContentPrivacyViewModelCoordinator_saveRestrictionValue_forItem_completionHandler___block_invoke;
  v33[3] = &unk_24DB87140;
  v33[4] = self;
  v34 = v11;
  v28 = v11;
  -[STContentPrivacyViewModelCoordinator saveValuesForRestrictions:completionHandler:](self, "saveValuesForRestrictions:completionHandler:", v20, v33);

}

void __87__STContentPrivacyViewModelCoordinator_saveRestrictionValue_forItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v8, "restrictionsEnabled");
  objc_msgSend(v8, "valuesByRestriction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reportCoreAnalyticsEventWithRestrictionsEnabled:valuesByRestriction:userType:userIsManaged:", v6, v7, objc_msgSend(v8, "userType"), objc_msgSend(v8, "userIsManaged"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)createValuesForRestrictions:(id)a3 multiplayerRestriction:(id)a4
{
  id v6;
  STRestrictionItem *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  STRestrictionItem *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  id *v22;
  void *v23;
  id v25;
  id v26;
  STRestrictionItem *v27;
  void *v28;
  uint64_t v29;
  id v30;
  STRestrictionItem *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = a4;
  v7 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterNearbyMultiplayer"), &stru_24DB8A1D0, 0, 0);
  -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valuesByRestriction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = objc_msgSend(v6, "isEqual:", &unk_24DBBE898);
  v13 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowedGameCenterOtherPlayerTypes"), &stru_24DB8A1D0, 3, 0);
  -[STContentPrivacyViewModelCoordinator viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valuesByRestriction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", &unk_24DBBE898);

  if (v12 && (v17 & 1) == 0 && v11)
  {
    v18 = v25;
    v30 = v25;
    v19 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = v7;
    v32 = v19;
    v33 = MEMORY[0x24BDBD1C0];
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = &v32;
    v22 = &v30;
  }
  else
  {
    if (((v12 | v11 | v17 ^ 1) & 1) != 0)
    {
      v23 = 0;
      v18 = v25;
      goto LABEL_14;
    }
    v18 = v25;
    v26 = v25;
    v19 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = v7;
    v28 = v19;
    v29 = MEMORY[0x24BDBD1C8];
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = &v28;
    v22 = &v26;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 2, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

LABEL_14:
  return v23;
}

+ (id)_coreAnalyticsEventWithRestrictionsEnabled:(BOOL)a3 valuesByRestriction:(id)a4 userType:(unint64_t)a5 userIsManaged:(BOOL)a6
{
  id v6;
  STRestrictionItem *v7;
  void *v8;
  STRestrictionItem *v9;
  void *v10;
  STRestrictionItem *v11;
  void *v12;
  STRestrictionItem *v13;
  void *v14;
  uint64_t v15;
  STRestrictionItem *v16;
  void *v17;
  uint64_t v18;
  STRestrictionItem *v19;
  void *v20;
  char v21;
  STRestrictionItem *v22;
  void *v23;
  char v24;
  STRestrictionItem *v25;
  void *v26;
  char v27;
  STRestrictionItem *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  unsigned int v37;
  _BOOL4 v40;

  v40 = a3;
  v6 = a4;
  v7 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("STSBCapabilityConfiguration"), CFSTR("kTCCServiceMediaLibrary"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v37 = objc_msgSend(v8, "BOOLValue") ^ 1;
  else
    v37 = 0;
  v9 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowedGameCenterOtherPlayerTypes"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v36 = objc_msgSend(v10, "integerValue") != 2;
  else
    v36 = 0;
  v11 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowAddingGameCenterFriends"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    HIDWORD(v35) = objc_msgSend(v12, "BOOLValue") ^ 1;
  else
    HIDWORD(v35) = 0;
  v13 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterFriendsSharingModification"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = objc_msgSend(v14, "BOOLValue") ^ 1;
  else
    v15 = 0;
  v16 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.camera"), CFSTR("allowScreenRecording"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = objc_msgSend(v17, "BOOLValue") ^ 1;
  else
    v18 = 0;
  v19 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterNearbyMultiplayer"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = objc_msgSend(v20, "BOOLValue") ^ 1;
  else
    v21 = 0;
  v22 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterPrivateMessaging"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = objc_msgSend(v23, "BOOLValue") ^ 1;
  else
    v24 = 0;
  v25 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterProfilePrivacyModification"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    v27 = objc_msgSend(v26, "BOOLValue") ^ 1;
  else
    v27 = 0;
  v28 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterProfileModification"), &stru_24DB8A1D0, 3, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    v30 = objc_msgSend(v29, "BOOLValue") ^ 1;
  else
    v30 = 0;
  if (a5 > 7)
    v31 = 0;
  else
    v31 = qword_219BA4C30[a5];
  LOBYTE(v35) = a6;
  BYTE3(v34) = v30;
  BYTE2(v34) = v27;
  BYTE1(v34) = v24;
  LOBYTE(v34) = v21;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84610]), "initWithContentAndPrivacyRestrictionsEnabled:mediaAndAppleMusicIsRestricted:gameCenterMultiplayerGamesIsRestricted:gameCenterAddingFriendsIsRestricted:gameCenterConnectWithFriendsIsRestricted:gameCenterScreenRecordingIsRestricted:gameCenterNearbyMultiplayerIsRestricted:gameCenterPrivateMessagingIsRestricted:gameCenterProfilePrivacyChangesIsRestricted:gameCenterAvatarAndNicknameChangesIsRestricted:userAgeGroup:userIsManaged:", v40, v37, v36, HIDWORD(v35), v15, v18, v34, v31, v35);

  return v32;
}

- (void)_reportCoreAnalyticsEventWithRestrictionsEnabled:(BOOL)a3 valuesByRestriction:(id)a4 userType:(unint64_t)a5 userIsManaged:(BOOL)a6
{
  id v6;

  +[STContentPrivacyViewModelCoordinator _coreAnalyticsEventWithRestrictionsEnabled:valuesByRestriction:userType:userIsManaged:](STContentPrivacyViewModelCoordinator, "_coreAnalyticsEventWithRestrictionsEnabled:valuesByRestriction:userType:userIsManaged:", a3, a4, a5, a6);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84558], "reportEvent:", v6);

}

- (void)_reportCoreAnalyticsEventForChangedCommunicationLimits:(id)a3 userType:(unint64_t)a4 userIsRemote:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v7 = objc_msgSend(v11, "screenTimeCommunicationLimit") || objc_msgSend(v11, "downtimeCommunicationLimit");
  v8 = objc_msgSend(v11, "contactManagementState");
  if (a4 > 7)
    v9 = 0;
  else
    v9 = qword_219BA4C30[a4];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84530]), "initWithCommunicationLimited:contactManagementEnabled:contactEditingAllowed:userAgeGroup:userIsRemote:", v7, v8 == 2, objc_msgSend(v11, "contactsEditable"), v9, v5);
  objc_msgSend(MEMORY[0x24BE84558], "reportEvent:", v10);

}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (void)setIsLocalDevice:(BOOL)a3
{
  self->_isLocalDevice = a3;
}

- (NSMutableDictionary)configurationPayloadsByType
{
  return self->_configurationPayloadsByType;
}

- (void)setConfigurationPayloadsByType:(id)a3
{
  objc_storeStrong((id *)&self->_configurationPayloadsByType, a3);
}

- (NSArray)fetchedResultsControllers
{
  return self->_fetchedResultsControllers;
}

- (void)setFetchedResultsControllers:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsControllers, a3);
}

- (unint64_t)numExpectedChanges
{
  return self->_numExpectedChanges;
}

- (void)setNumExpectedChanges:(unint64_t)a3
{
  self->_numExpectedChanges = a3;
}

- (NSNumber)isRestrictAdultContentEnabledValue
{
  return self->_isRestrictAdultContentEnabledValue;
}

- (void)setIsRestrictAdultContentEnabledValue:(id)a3
{
  objc_storeStrong((id *)&self->_isRestrictAdultContentEnabledValue, a3);
}

- (STContentPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_isRestrictAdultContentEnabledValue, 0);
  objc_storeStrong((id *)&self->_fetchedResultsControllers, 0);
  objc_storeStrong((id *)&self->_configurationPayloadsByType, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
}

void __88__STContentPrivacyViewModelCoordinator_initWithPersistenceController_userDSID_userName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to load Content&Privacy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_remoteDeviceRestrictions
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219AB4000, log, OS_LOG_TYPE_ERROR, "Failed to provide region code for explicit content restriction key. Returning least restrictive string key.", v1, 2u);
}

- (void)_valueForMCFeature:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_219AB4000, v0, v1, "MCFeature value for %@ is %@");
  OUTLINED_FUNCTION_1();
}

- (void)_setValue:forMCFeature:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_219AB4000, v0, v1, "Setting MCFeature %@ to %@");
  OUTLINED_FUNCTION_1();
}

- (void)_valueForSBCapability:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_219AB4000, v1, OS_LOG_TYPE_DEBUG, "SB capability %@ is present %d", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_setValue:forSBCapability:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_219AB4000, v0, v1, "Setting SB capability %@ to %@");
  OUTLINED_FUNCTION_1();
}

- (void)controller:(os_log_t)log didChangeObject:atIndexPath:forChangeType:newIndexPath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219AB4000, log, OS_LOG_TYPE_DEBUG, "Observed a change which was not expected, so refreshing", v1, 2u);
}

- (void)controller:(void *)a1 didChangeObject:atIndexPath:forChangeType:newIndexPath:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "numExpectedChanges");
  OUTLINED_FUNCTION_3_1(&dword_219AB4000, v1, v2, "Observed a change, %d more are expected", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

void __71__STContentPrivacyViewModelCoordinator_reloadViewModelForRemoteChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to reload Content&Privacy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "userDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v7 = 2114;
  v8 = a2;
  _os_log_fault_impl(&dword_219AB4000, a3, OS_LOG_TYPE_FAULT, "failed to fetch user for restrictions %{public}@: %{public}@", v6, 0x16u);

}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to fetch restrictions blueprints: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to check isRestrictAdultContentEnabled from settings service: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_219AB4000, v0, v1, "Failed to save database changes: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_219AB4000, a2, v4, "Deleting Family Restrictions blueprint with Personal organization identifier: %{public}@", v5);

}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "user with objectID could not be found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to fetch restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to save restrictions enabled state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_4(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_3_1(&dword_219AB4000, v1, v2, "Saving restrictions enabled, %d changes expected", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, a2, a3, "user with objectID could not be found: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to save: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to fetch restricitons blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to save restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_5(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_3_1(&dword_219AB4000, v1, v2, "Saving restrictions, %d changes expected", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_219AB4000, v0, v1, "Restrictions blueprint configuration payload not found for type %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
