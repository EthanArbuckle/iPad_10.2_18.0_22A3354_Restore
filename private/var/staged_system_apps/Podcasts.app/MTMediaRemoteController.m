@implementation MTMediaRemoteController

- (void)updateRemoteSkipPreferenceFromDefaults:(id)a3
{
  -[MTMediaRemoteController setRemoteSkipPreference:](self, "setRemoteSkipPreference:", objc_msgSend(a3, "BOOLForKey:", kMTRemoteSkipInsteadOfNextTrackDefaultKey));
}

- (void)sessionIdentifierDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandCenter"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setPlaybackSessionCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));
  objc_msgSend(v4, "setCurrentPlaybackSessionIdentifier:", v6);

}

- (MTMediaRemoteController)initWithPlayerController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  MTMediaRemoteController *v9;
  MTMediaRemoteController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MTDefaultsChangeNotifier *v33;
  MTDefaultsChangeNotifier *defaultsObserver;
  MTDefaultsChangeNotifier *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSArray *internalRequestLabels;
  uint64_t v42;
  NSObject *v43;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  objc_super v49;
  _QWORD v50[5];
  _QWORD v51[3];
  const __CFString *v52;
  const __CFString *v53;
  uint8_t buf[4];
  void *v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
  -[MTMediaRemoteController setPlayerController:](self, "setPlayerController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playbackQueueController"));
  v7 = _MTLogCategoryMediaRemote(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting setup of media remote controller for player: %@", buf, 0xCu);
  }

  v49.receiver = self;
  v49.super_class = (Class)MTMediaRemoteController;
  v9 = -[MTMediaRemoteController initWithPlayer:](&v49, "initWithPlayer:", v5);
  v10 = v9;
  if (v9)
  {
    -[MTMediaRemoteController setPlaybackQueueController:](v9, "setPlaybackQueueController:", v6);
    objc_msgSend(v6, "setSessionDelegate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "insertIntoPlaybackQueueCommand"));
    objc_msgSend(v12, "addTarget:action:", v10, "remoteInsertIntoPlaybackQueueCommand:completionHandler:");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playItemInQueueCommand"));
    objc_msgSend(v13, "addTarget:action:", v10, "remotePlayItemInPlaybackQueueCommand:completionHandler:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reorderQueueCommand"));
    objc_msgSend(v14, "addTarget:action:", v10, "remoteReorderPlaybackQueueCommand:completionHandler:");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "removeFromPlaybackQueueCommand"));
    objc_msgSend(v15, "addTarget:action:", v10, "remoteRemoveFromPlaybackQueueCommand:completionHandler:");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setPlaybackQueueCommand"));
    objc_msgSend(v16, "addTarget:action:usingExtendedStatus:", v10, "remoteSetPlaybackQueueCommand:completionHandler:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playCommand"));
    objc_msgSend(v17, "addTarget:action:", v10, "remotePlayCommand:completionHandler:");

    if (os_feature_enabled_red_sun(v18))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setPlaybackQueueCommand"));
      objc_msgSend(v19, "registerSupportedQueueType:", 8);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setPlaybackSessionCommand"));
    objc_msgSend(v20, "addTarget:action:", v10, "remoteSetPlaybackSessionCommand:completionHandler:");

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setPlaybackSessionCommand"));
    v53 = CFSTR("com.apple.podcasts.MTPlaybackQueueController.GenericQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
    objc_msgSend(v21, "setSupportedSessionTypes:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setPlaybackSessionCommand"));
    v52 = CFSTR("com.apple.podcasts.MTPlaybackQueueController.GenericQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    objc_msgSend(v23, "setExportableSessionTypes:", v24);

    +[MPRemoteCommandCenter updateLaunchCommandsWithConfigurationHandler:](MPRemoteCommandCenter, "updateLaunchCommandsWithConfigurationHandler:", &stru_1004A7B28);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](IMAVPlayer, "sharedPlayer"));
    LODWORD(v24) = v5 == v25;

    if ((_DWORD)v24)
    {
      v26 = objc_alloc((Class)MPRemoteCommandCenter);
      v27 = objc_msgSend(v26, "initWithPlayerID:", kMTPodcastsMagicMomentsPlayerID);
      -[MTMediaRemoteController setMetadataCommandCenter:](v10, "setMetadataCommandCenter:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController metadataCommandCenter](v10, "metadataCommandCenter"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "setPlaybackQueueCommand"));
      objc_msgSend(v29, "addTarget:action:usingExtendedStatus:", v10, "remoteSetMetadataPlaybackQueueCommand:completionHandler:", 1);

    }
    objc_initWeak((id *)buf, v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
    v51[0] = kMTSkipForwardIntervalDefaultKey;
    v51[1] = kMTSkipBackwardsIntervalDefaultKey;
    v51[2] = kMTRemoteSkipInsteadOfNextTrackDefaultKey;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 3));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v31));

    v33 = -[MTDefaultsChangeNotifier initWithProperties:defaults:]([MTDefaultsChangeNotifier alloc], "initWithProperties:defaults:", v32, v30);
    defaultsObserver = v10->_defaultsObserver;
    v10->_defaultsObserver = v33;

    v35 = v10->_defaultsObserver;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100043DB0;
    v45[3] = &unk_1004A7B50;
    objc_copyWeak(&v48, (id *)buf);
    v36 = v30;
    v46 = v36;
    v37 = v11;
    v47 = v37;
    -[MTDictionaryDiff addCallback:](v35, "addCallback:", v45);
    -[MTDefaultsChangeNotifier start](v10->_defaultsObserver, "start");
    -[MTMediaRemoteController updatePreferredSkipDurationsFromUserDefaults:forCommandCenter:](v10, "updatePreferredSkipDurationsFromUserDefaults:forCommandCenter:", v36, v37);
    -[MTMediaRemoteController updateRemoteSkipPreferenceFromDefaults:](v10, "updateRemoteSkipPreferenceFromDefaults:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MTSiriAnalyticsController sharedInstance](MTSiriAnalyticsController, "sharedInstance"));
    -[MTMediaRemoteController setSiriAnalyticsController:](v10, "setSiriAnalyticsController:", v38);

    if (isTV(v39))
      -[MTMediaRemoteController setSupportedPlaybackRates:](v10, "setSupportedPlaybackRates:", 0);
    v50[0] = CFSTR("PlayerBar");
    v50[1] = CFSTR("PlayerBar");
    v50[2] = CFSTR("PlayState");
    v50[3] = CFSTR("MiniPlayer");
    v50[4] = CFSTR("NowPlaying");
    v40 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 5));
    internalRequestLabels = v10->_internalRequestLabels;
    v10->_internalRequestLabels = (NSArray *)v40;

    objc_destroyWeak(&v48);
    objc_destroyWeak((id *)buf);

  }
  v42 = _MTLogCategoryMediaRemote(v9);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v5;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Finished setup of media remote controller for player: %@", buf, 0xCu);
  }

  return v10;
}

- (void)updatePreferredSkipDurationsFromUserDefaults:(id)a3 forCommandCenter:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = kMTSkipForwardIntervalDefaultKey;
  v6 = a4;
  v7 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", kMTSkipBackwardsIntervalDefaultKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1004D5C20, &off_1004D5C38, &off_1004D5C50, &off_1004D5C68, &off_1004D5C80, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1004D5C20, &off_1004D5C38, &off_1004D5C50, &off_1004D5C68, &off_1004D5C80, 0));
  if (v13)
  {
    objc_msgSend(v9, "removeObject:", v13);
    objc_msgSend(v9, "insertObject:atIndex:", v13, 0);
  }
  if (v8)
  {
    objc_msgSend(v10, "removeObject:", v8);
    objc_msgSend(v10, "insertObject:atIndex:", v8, 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "skipForwardCommand"));
  objc_msgSend(v11, "setPreferredIntervals:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "skipBackwardCommand"));
  objc_msgSend(v12, "setPreferredIntervals:", v10);

}

- (void)setSiriAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_siriAnalyticsController, a3);
}

- (void)setRemoteSkipPreference:(int64_t)a3
{
  self->_remoteSkipPreference = a3;
}

- (void)setPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_playerController, a3);
}

- (void)setPlaybackQueueController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueController, a3);
}

- (void)setMetadataCommandCenter:(id)a3
{
  objc_storeStrong((id *)&self->_metadataCommandCenter, a3);
}

- (MTPlaybackQueueController)playbackQueueController
{
  return self->_playbackQueueController;
}

- (MPRemoteCommandCenter)metadataCommandCenter
{
  return self->_metadataCommandCenter;
}

- (AFMultiUserConnection)siriMultiUserConnection
{
  AFMultiUserConnection *siriMultiUserConnection;
  AFMultiUserConnection *v4;
  AFMultiUserConnection *v5;

  siriMultiUserConnection = self->_siriMultiUserConnection;
  if (!siriMultiUserConnection)
  {
    v4 = (AFMultiUserConnection *)objc_alloc_init((Class)AFMultiUserConnection);
    v5 = self->_siriMultiUserConnection;
    self->_siriMultiUserConnection = v4;

    siriMultiUserConnection = self->_siriMultiUserConnection;
  }
  return siriMultiUserConnection;
}

- (void)accountForRequesterUserId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController siriMultiUserConnection](self, "siriMultiUserConnection"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100075288;
  v10[3] = &unk_1004A7BA0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getHomeUserIdForSharedUserId:completion:", v7, v10);

}

- (id)accountFromQueueContainingDsid:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enqueuerDSID")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ic_sharedAccountStore](ACAccountStore, "ic_sharedAccountStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_storeAccountForStoreAccountID:error:", v6, a4));

    v10 = _MTLogCategoryMediaRemote(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found account %@ with error %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setPlaybackQueueCommand"));
  objc_msgSend(v5, "removeTarget:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playCommand"));
  objc_msgSend(v8, "removeTarget:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController defaultsObserver](self, "defaultsObserver"));
  objc_msgSend(v9, "stop");

  -[MTMediaRemoteController setDefaultsObserver:](self, "setDefaultsObserver:", 0);
  v10.receiver = self;
  v10.super_class = (Class)MTMediaRemoteController;
  -[MTMediaRemoteController dealloc](&v10, "dealloc");
}

- (__CFArray)copySupportedCommands
{
  __CFArray *v3;
  const void *v4;
  const void *v5;
  CFIndex v6;
  CFIndex v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTMediaRemoteController;
  v3 = -[MTMediaRemoteController copySupportedCommands](&v9, "copySupportedCommands");
  v4 = (const void *)MRMediaRemoteCommandInfoCreate(kCFAllocatorDefault);
  MRMediaRemoteCommandInfoSetCommand(v4, 123);
  MRMediaRemoteCommandInfoSetEnabled(v4, 1);
  CFArrayAppendValue(v3, v4);
  CFRelease(v4);
  v5 = (const void *)MRMediaRemoteCommandInfoCreate(kCFAllocatorDefault);
  MRMediaRemoteCommandInfoSetCommand(v5, 124);
  MRMediaRemoteCommandInfoSetEnabled(v5, 1);
  CFArrayAppendValue(v3, v5);
  CFRelease(v5);
  v6 = -[MTMediaRemoteController findIndexOfCommand:inArray:](self, "findIndexOfCommand:inArray:", 4, v3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    CFArrayRemoveValueAtIndex(v3, v6);
  v7 = -[MTMediaRemoteController findIndexOfCommand:inArray:](self, "findIndexOfCommand:inArray:", 5, v3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    CFArrayRemoveValueAtIndex(v3, v7);
  return v3;
}

- (int64_t)findIndexOfCommand:(unsigned int)a3 inArray:(__CFArray *)a4
{
  CFIndex v6;
  const void *ValueAtIndex;

  if (CFArrayGetCount(a4) < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, v6);
    if (MRMediaRemoteCommandInfoGetCommand(ValueAtIndex) == a3)
      break;
    if (++v6 >= CFArrayGetCount(a4))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (void)remoteInsertIntoPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  MTMediaRemoteController *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackQueue"));
  v9 = objc_opt_class(MPGenericTracklistPlaybackQueue);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trackIdentifiers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100075AF8;
    v14[3] = &unk_1004A7BC8;
    v17 = v7;
    v15 = v6;
    v16 = self;
    objc_msgSend(v13, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:completion:", v12, v14);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 200);
  }

}

- (void)remotePlayItemInPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, uint64_t);

  v10 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentItemID"));

  LODWORD(v6) = objc_msgSend(v7, "playItemWithContentID:", v8);
  if ((_DWORD)v6)
  {
    -[MTMediaRemoteController _donateCurrentPlayerItem](self, "_donateCurrentPlayerItem");
    v9 = 0;
  }
  else
  {
    v9 = 200;
  }
  v10[2](v10, v9);

}

- (void)remoteReorderPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentItemID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "insertAfterContextItemID"));

  objc_msgSend(v7, "reorderItemWithContentId:afterItemWithContentID:", v8, v9);
  v10[2]();

}

- (void)remoteRemoveFromPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentItemID"));

  objc_msgSend(v7, "removeItemWithContentID:", v8);
  v9[2]();

}

- (void)remoteSetMetadataPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  -[MTMediaRemoteController remoteSetPlaybackQueueCommand:isMagicMoment:completionHandler:](self, "remoteSetPlaybackQueueCommand:isMagicMoment:completionHandler:", a3, 1, a4);
}

- (void)remoteSetPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  -[MTMediaRemoteController remoteSetPlaybackQueueCommand:isMagicMoment:completionHandler:](self, "remoteSetPlaybackQueueCommand:isMagicMoment:completionHandler:", a3, 0, a4);
}

- (void)remoteSetPlaybackQueueCommand:(id)a3 isMagicMoment:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void (**v18)(id, void *);
  void *v19;
  MTMediaQueryManifest *v20;
  void *v21;
  MTMediaQueryManifest *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  void (**v29)(id, void *);
  id v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  MTURLCommandRequest *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  MTURLCommandRequest *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  _QWORD *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  uint64_t v69;
  void *v70;
  BOOL v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  void (**v78)(id, void *);
  void (**v79)(id, void *);
  _QWORD *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  _BOOL4 v91;
  uint64_t v92;
  NSObject *v93;
  NSObject *v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  _QWORD v112[4];
  void (**v113)(id, void *);
  _QWORD v114[4];
  void (**v115)(id, void *);
  void (**v116)(id, void *);
  id v117;
  _QWORD v118[4];
  void (**v119)(id, void *);
  _QWORD *v120;
  _BYTE *v121;
  _QWORD v122[4];
  id v123;
  void (**v124)(id, void *);
  void (**v125)(id, void *);
  _BYTE *v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD *v130;
  _BYTE *v131;
  __int128 *v132;
  char v133;
  _QWORD v134[4];
  MTURLCommandRequest *v135;
  MTMediaRemoteController *v136;
  void (**v137)(id, void *);
  id v138;
  void (**v139)(id, void *);
  _BYTE *v140;
  __int128 *v141;
  char v142;
  BOOL v143;
  uint8_t v144[4];
  void *v145;
  _BYTE buf[24];
  uint64_t (*v147)(uint64_t, uint64_t);
  void (*v148)(uint64_t);
  id v149;
  __int128 v150;
  uint64_t v151;
  char v152;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = _MTLogCategoryMediaRemote(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set Playback Queue: %@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playbackQueue"));
  v13 = objc_opt_class(MPLocalMediaQueryRemotePlaybackQueue);
  isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  if ((isKindOfClass & 1) != 0)
  {
    v16 = _MTLogCategoryMediaRemote(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "remoteSetPlaybackQueueCommand with playbackQueue type MPLocalMediaQueryRemotePlaybackQueue", buf, 2u);
    }

    v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playbackQueue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mediaQuery"));
    v20 = [MTMediaQueryManifest alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstItem"));
    v22 = -[MTMediaQueryManifest initWithMediaQuery:initialItem:](v20, "initWithMediaQuery:initialItem:", v19, v21);

    v23 = objc_msgSend(v18, "isRequestingImmediatePlayback");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
    objc_msgSend(v24, "setManifest:startPlayback:reason:interactive:completion:", v22, v23, 7, 0, 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", 0));
    v9[2](v9, v25);

    goto LABEL_71;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playbackQueue"));
  v27 = objc_opt_class(MPGenericTracklistPlaybackQueue);
  v28 = objc_opt_isKindOfClass(v26, v27);

  v29 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playbackQueue"));
  v18 = v29;
  if ((v28 & 1) == 0)
  {
    v31 = objc_opt_class(MPEmptyPlaybackQueue);
    v32 = objc_opt_isKindOfClass(v18, v31);

    if ((v32 & 1) != 0)
    {
      if (os_feature_enabled_red_sun(v33))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playbackQueueController](self, "playbackQueueController"));
        objc_msgSend(v34, "clearUpNextManifest");

        v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(+[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", 0));
        v9[2](v9, v18);
      }
      else
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472;
        v112[2] = sub_100077404;
        v112[3] = &unk_1004A6378;
        v113 = v9;
        objc_msgSend(v75, "clearPlayerManifestWithCompletion:", v112);

        v18 = v113;
      }
      goto LABEL_71;
    }
LABEL_68:
    v103 = _MTLogCategoryMediaRemote(v33);
    v104 = objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playbackQueue"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v105;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "Unhandled Set Playback Queue Command! %@", buf, 0xCu);

    }
    v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(+[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", 200));
    v9[2](v9, v18);
    goto LABEL_71;
  }
  if (a4)
    v30 = 0;
  else
    v30 = objc_msgSend(v29, "isRequestingImmediatePlayback");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trackIdentifiers"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));

  v37 = objc_opt_class(NSString);
  v38 = objc_opt_isKindOfClass(v36, v37);
  v39 = v38;
  v40 = _MTLogCategoryMediaRemote(v38);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if ((v39 & 1) != 0)
  {
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Playback Queue Identifier: %@", buf, 0xCu);
    }

    v43 = -[MTURLCommandRequest initWithURLString:]([MTURLCommandRequest alloc], "initWithURLString:", v36);
    if ((id)-[MTURLCommandRequest commandType](v43, "commandType") == (id)2)
    {
      v44 = _MTLogCategoryMediaRemote(2);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "siriAssetInfo"));
        v47 = objc_msgSend(v46, "length");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v47 != 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "SetPlaybackQueue has assetInfo: %d", buf, 8u);

      }
      v49 = _MTLogCategoryMediaRemote(v48);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "siriAssetInfo"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "SetPlaybackQueue assetInfo: %@", buf, 0xCu);

      }
      if (!-[MTURLCommandRequest playReason](v43, "playReason"))
      {
        if (-[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v8))
          v52 = 9;
        else
          v52 = 7;
        v53 = -[MTURLCommandRequest copyWithPlayReason:](v43, "copyWithPlayReason:", v52);

        v43 = v53;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("requesterUserId")));

      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("sharedUserId")));

      v57 = _MTLogCategoryMediaRemote(v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v109;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "SetPlaybackQueue requesterUserId: %@", buf, 0xCu);
      }

      v60 = _MTLogCategoryMediaRemote(v59);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v107;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "SetPlaybackQueue sharedUserId: %@", buf, 0xCu);
      }

      *(_QWORD *)&v150 = 0;
      *((_QWORD *)&v150 + 1) = &v150;
      v151 = 0x2020000000;
      v152 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v147 = sub_100046654;
      v148 = sub_1000469AC;
      v149 = 0;
      v134[0] = _NSConcreteStackBlock;
      v134[1] = 3221225472;
      v134[2] = sub_100076CE0;
      v134[3] = &unk_1004A7C18;
      v43 = v43;
      v135 = v43;
      v136 = self;
      v137 = v18;
      v140 = buf;
      v141 = &v150;
      v142 = (char)v30;
      v143 = a4;
      v138 = v36;
      v139 = v9;
      v62 = objc_retainBlock(v134);
      v63 = _MTLogCategoryMediaRemote(v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController siriMultiUserConnection](self, "siriMultiUserConnection"));
        *(_DWORD *)v144 = 138412290;
        v145 = v65;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Siri connection: %@", v144, 0xCu);

      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "isPrivateListeningEnabled"));
      v68 = objc_msgSend(v67, "BOOLValue");

      v69 = objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController siriMultiUserConnection](self, "siriMultiUserConnection"));
      v70 = (void *)v69;
      if (!v69 || (v71 = objc_msgSend(v109, "length") == 0, v70, v71))
      {
        v86 = _MTLogCategoryMediaRemote(v69);
        v87 = objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v144 = 67109120;
          LODWORD(v145) = v68;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Device private listening value: %d", v144, 8u);
        }

        *(_BYTE *)(*((_QWORD *)&v150 + 1) + 24) = v68 ^ 1;
        ((void (*)(_QWORD *))v62[2])(v62);
      }
      else
      {
        v127[0] = _NSConcreteStackBlock;
        v127[1] = 3221225472;
        v127[2] = sub_100076EF8;
        v127[3] = &unk_1004A7C40;
        v131 = buf;
        v128 = v109;
        v129 = v107;
        v132 = &v150;
        v133 = v68;
        v130 = v62;
        -[MTMediaRemoteController accountForRequesterUserId:completionHandler:](self, "accountForRequesterUserId:completionHandler:", v128, v127);

      }
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController siriAnalyticsController](self, "siriAnalyticsController"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      objc_msgSend(v88, "observePlaybackStartEventForRefId:", v89);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v150, 8);

LABEL_64:
      goto LABEL_71;
    }
    if ((id)-[MTURLCommandRequest commandType](v43, "commandType") == (id)1)
    {
      v76 = _MTLogCategoryMediaRemote(1);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "SetPlaybackQueue for following/subscribing", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v147 = sub_100046654;
      v148 = sub_1000469AC;
      v149 = 0;
      v122[0] = _NSConcreteStackBlock;
      v122[1] = 3221225472;
      v122[2] = sub_100077030;
      v122[3] = &unk_1004A7C90;
      v123 = v36;
      v78 = v18;
      v124 = v78;
      v126 = buf;
      v79 = v9;
      v125 = v79;
      v80 = objc_retainBlock(v122);
      v110 = objc_alloc_init((Class)AFMultiUserConnection);
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "userInfo"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("requesterUserId")));

      v84 = _MTLogCategoryMediaRemote(v83);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v150) = 138412290;
        *(_QWORD *)((char *)&v150 + 4) = v82;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "SetPlaybackQueue requesterUserId: %@", (uint8_t *)&v150, 0xCu);
      }

      if (v110 && objc_msgSend(v82, "length"))
      {
        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472;
        v118[2] = sub_100077214;
        v118[3] = &unk_1004A7CB8;
        v119 = v79;
        v121 = buf;
        v120 = v80;
        -[MTMediaRemoteController accountForRequesterUserId:completionHandler:](self, "accountForRequesterUserId:completionHandler:", v82, v118);

      }
      else
      {
        ((void (*)(_QWORD *))v80[2])(v80);
      }

      _Block_object_dispose(buf, 8);
      goto LABEL_64;
    }
    v90 = -[MTURLCommandRequest commandType](v43, "commandType");
    v91 = v90 == (id)3;
    v92 = _MTLogCategoryMediaRemote(v90);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    v94 = v93;
    if (v91)
    {
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "remoteSetPlaybackQueueCommand with command type MTURLCommandRequestTypeSetRemotePlaybackQueue", buf, 2u);
      }

      v95 = objc_msgSend(v18, "replaceIntent");
      v96 = 2 * (v95 == (id)1);
      if (v95 == (id)2)
        v96 = 1;
      v106 = v96;
      v117 = 0;
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController accountFromQueueContainingDsid:error:](self, "accountFromQueueContainingDsid:error:", v18, &v117));
      v97 = v117;
      v111 = v97;
      if (v97)
      {
        v98 = _MTLogCategoryMediaRemote(v97);
        v99 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Failed account lookup with error %@", buf, 0xCu);
        }

      }
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trackIdentifiers"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionIdentifierOverride"));
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472;
      v114[2] = sub_1000772EC;
      v114[3] = &unk_1004A7BF0;
      v115 = v18;
      v116 = v9;
      +[MTRemoteSetPlaybackQueueUtil decodeAndSetPlaybackQueueForController:fromIdentifiers:sessionIdentifierOverride:enqueuer:accountLookupFailed:startPlayback:upNextQueueIntent:completion:](MTRemoteSetPlaybackQueueUtil, "decodeAndSetPlaybackQueueForController:fromIdentifiers:sessionIdentifierOverride:enqueuer:accountLookupFailed:startPlayback:upNextQueueIntent:completion:", v100, v101, v102, v108, v111 != 0, v30, v106, v114);

      goto LABEL_64;
    }
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Unexpected track identifier for SetPlaybackQueue command: %@", buf, 0xCu);
    }

    goto LABEL_68;
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v72 = (void *)objc_opt_class(v36);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v72;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v36;
    v73 = v72;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Track identifier for SetPlaybackQueue command was unexpected type: %@ (%@)", buf, 0x16u);

  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", 200));
  v9[2](v9, v74);

LABEL_71:
}

- (void)remoteSetPlaybackSessionCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  MTURLCommandRequest *v19;
  void *v20;
  MTURLCommandRequest *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  MTMediaRemoteController *v31;
  id v32;
  void (**v33)(id, uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  _QWORD v37[2];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackSessionData"));
  v37[0] = objc_opt_class(NSArray);
  v37[1] = objc_opt_class(NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
  v34 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v10, v8, &v34));
  v12 = v34;

  v14 = _MTLogCategoryMediaRemote(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Set Playback Session: %@", buf, 0xCu);
  }

  if (v12 || (v16 = objc_msgSend(v11, "count")) == 0)
  {
    v17 = _MTLogCategoryMediaRemote(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to set playback session, unarchiving error: %@", buf, 0xCu);
    }

    if (v7)
      v7[2](v7, 200);
  }
  else
  {
    v19 = [MTURLCommandRequest alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v21 = -[MTURLCommandRequest initWithURLString:](v19, "initWithURLString:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest requesterDsid](v21, "requesterDsid"));

    v24 = _MTLogCategoryMediaRemote(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Set Playback Session enqueuer DSID: %@", buf, 0xCu);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ic_sharedAccountStore](ACAccountStore, "ic_sharedAccountStore"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v22, "longLongValue")));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10007779C;
    v29[3] = &unk_1004A7D08;
    v30 = v22;
    v31 = self;
    v32 = v11;
    v33 = v7;
    v28 = v22;
    objc_msgSend(v26, "ic_storeAccountForStoreAccountID:completion:", v27, v29);

  }
}

- (void)remotePlayCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  MTMediaRemoteController *v23;
  void (**v24)(id, uint64_t);
  char v25;
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaRemoteOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kMRMediaRemoteOptionInterruptionEvent));
  v10 = objc_msgSend(v9, "BOOLValue");

  v12 = _MTLogCategoryMediaRemote(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received remotePlay: %@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "player"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "manifest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentItem"));

  if (v17)
  {
    -[MTMediaRemoteController _donateCurrentPlayerItem](self, "_donateCurrentPlayerItem");
    if (-[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v6))
    {
      v18 = 9;
    }
    else if (-[MTMediaRemoteController _commandEventIsInternal:](self, "_commandEventIsInternal:", v6))
    {
      v18 = 7;
    }
    else
    {
      v18 = 8;
    }
    v19 = objc_msgSend(v14, "playWithReason:interruptEvent:", v18, v10);
    if (v7)
    {
      if (v19)
        v20 = 0;
      else
        v20 = 200;
      v7[2](v7, v20);
    }
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100077C78;
    v21[3] = &unk_1004A7D58;
    v22 = v14;
    v23 = self;
    v25 = (char)v10;
    v24 = v7;
    objc_msgSend(v22, "restorePlayerManifestWithCompletion:", v21);

  }
}

- (int64_t)remotePause:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMediaRemoteController;
  return -[MTMediaRemoteController remotePause:](&v4, "remotePause:", a3);
}

- (void)remoteTogglePlayPauseCommand:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_super v6;
  _QWORD v7[4];
  MTMediaRemoteController *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = sub_100077EB4;
  v7[3] = &unk_1004A7D80;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)MTMediaRemoteController;
  v7[0] = _NSConcreteStackBlock;
  v5 = v9;
  -[MTMediaRemoteController remoteTogglePlayPauseCommand:completionHandler:](&v6, "remoteTogglePlayPauseCommand:completionHandler:", a3, v7);

}

- (int64_t)remoteNextTrack:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((id)-[MTMediaRemoteController remoteSkipPreference](self, "remoteSkipPreference") != (id)1
    || -[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v4)
    || -[MTMediaRemoteController _commandEventIsInternal:](self, "_commandEventIsInternal:", v4))
  {
    v8.receiver = self;
    v8.super_class = (Class)MTMediaRemoteController;
    v5 = -[MTMediaRemoteController remoteNextTrack:](&v8, "remoteNextTrack:", v4);
    if (!v5)
      -[MTMediaRemoteController _donateCurrentPlayerItem](self, "_donateCurrentPlayerItem");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController _skipForwardCommandEvent](self, "_skipForwardCommandEvent"));
    v5 = -[MTMediaRemoteController remoteSkipForward:](self, "remoteSkipForward:", v6);

  }
  return (int64_t)v5;
}

- (int64_t)remotePreviousTrack:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((id)-[MTMediaRemoteController remoteSkipPreference](self, "remoteSkipPreference") != (id)1
    || -[MTMediaRemoteController _commandEventIsFromSiri:](self, "_commandEventIsFromSiri:", v4)
    || -[MTMediaRemoteController _commandEventIsInternal:](self, "_commandEventIsInternal:", v4))
  {
    v8.receiver = self;
    v8.super_class = (Class)MTMediaRemoteController;
    v5 = -[MTMediaRemoteController remotePreviousTrack:](&v8, "remotePreviousTrack:", v4);
    if (!v5)
      -[MTMediaRemoteController _donateCurrentPlayerItem](self, "_donateCurrentPlayerItem");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController _skipBackwardCommandEvent](self, "_skipBackwardCommandEvent"));
    v5 = -[MTMediaRemoteController remoteSkipBackward:](self, "remoteSkipBackward:", v6);

  }
  return (int64_t)v5;
}

- (int64_t)remoteChangePlaybackRate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMediaRemoteController;
  return -[MTMediaRemoteController remoteChangePlaybackRate:](&v4, "remoteChangePlaybackRate:", a3);
}

- (BOOL)_commandEventIsFromSiri:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mediaRemoteOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMRMediaRemoteOptionRemoteControlInterfaceIdentifier));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MediaAssistant"));

  return v5;
}

- (BOOL)_commandEventIsInternal:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mediaRemoteOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kMRMediaRemoteOptionRemoteControlInterfaceIdentifier));

  LOBYTE(self) = -[NSArray containsObject:](self->_internalRequestLabels, "containsObject:", v5);
  return (char)self;
}

- (id)_skipForwardCommandEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandCenter"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "skipForwardCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredIntervals"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  objc_msgSend(v6, "doubleValue");
  v7 = objc_msgSend(v4, "newCommandEventWithInterval:");

  return v7;
}

- (id)_skipBackwardCommandEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandCenter"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "skipBackwardCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredIntervals"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  objc_msgSend(v6, "doubleValue");
  v7 = objc_msgSend(v4, "newCommandEventWithInterval:");

  return v7;
}

- (void)_donateCurrentPlayerItem
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaRemoteController playerController](self, "playerController"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "compositeManifest"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance"));
  objc_msgSend(v3, "donateManifestCurrentItem:", v4);

}

- (int64_t)remoteSkipPreference
{
  return self->_remoteSkipPreference;
}

- (MTSiriAnalyticsController)siriAnalyticsController
{
  return self->_siriAnalyticsController;
}

- (void)setSiriMultiUserConnection:(id)a3
{
  objc_storeStrong((id *)&self->_siriMultiUserConnection, a3);
}

- (MTDefaultsChangeNotifier)defaultsObserver
{
  return self->_defaultsObserver;
}

- (void)setDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsObserver, a3);
}

- (NSArray)internalRequestLabels
{
  return self->_internalRequestLabels;
}

- (void)setInternalRequestLabels:(id)a3
{
  objc_storeStrong((id *)&self->_internalRequestLabels, a3);
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueController, 0);
  objc_destroyWeak((id *)&self->_playerController);
  objc_storeStrong((id *)&self->_internalRequestLabels, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_siriMultiUserConnection, 0);
  objc_storeStrong((id *)&self->_siriAnalyticsController, 0);
  objc_storeStrong((id *)&self->_metadataCommandCenter, 0);
}

@end
