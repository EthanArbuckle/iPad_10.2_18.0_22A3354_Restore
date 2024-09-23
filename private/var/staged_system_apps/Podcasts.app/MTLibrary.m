@implementation MTLibrary

+ (void)initialize
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTLibrary;
  objc_msgSendSuper2(&v4, "initialize");
  if ((id)objc_opt_class(MTLibrary, v3) == a1)
  {
    +[MTPreferences registerDefaults](MTPreferences, "registerDefaults");
    +[MTPreferences copySettingsToSharedContainer](MTPreferences, "copySettingsToSharedContainer");
  }
}

- (MTLibrary)init
{
  void *v3;
  MTLibrary *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibraryConfiguration defaultConfiguration](MTLibraryConfiguration, "defaultConfiguration"));
  v4 = -[MTLibrary initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (MTLibrary)initWithConfiguration:(id)a3
{
  id v4;
  MTLibrary *v5;
  PFFairPlayInvalidationManager *v6;
  id v7;
  void *v8;
  MTLibrary *v9;
  void *v10;
  _QWORD v12[4];
  MTLibrary *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTLibrary;
  v5 = -[MTLibrary init](&v14, "init");
  if (v5)
  {
    v6 = objc_opt_new(PFFairPlayInvalidationManager);
    -[MTLibrary setFairPlayInvalidationManager:](v5, "setFairPlayInvalidationManager:", v6);

    v7 = objc_msgSend(objc_alloc((Class)MTSecureDownloadRenewalManager), "initWithDelegate:", v5);
    -[MTLibrary setSecureDownloadRenewalManager:](v5, "setSecureDownloadRenewalManager:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaContentSourceiOSMusicLibrary sharedInstance](MTMediaContentSourceiOSMusicLibrary, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100047A8C;
    v12[3] = &unk_1004A65C8;
    v9 = v5;
    v13 = v9;
    objc_msgSend(v8, "determineiTunesMatchEnabledWithCompletion:", v12);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, "_userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);

    -[MTLibrary setConfig:](v9, "setConfig:", v4);
  }

  return v5;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004300;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_100567280 != -1)
    dispatch_once(&qword_100567280, block);
  return (id)qword_100567278;
}

- (void)_userDefaultsDidChange:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));

  if (v3 != v4)
    +[MTPreferences copySettingsToSharedContainer](MTPreferences, "copySettingsToSharedContainer");
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, a3);
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

+ (void)setConfigurationForTests:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v5, "setConfig:", v4);

}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
}

- (void)updateiTunesPlaylistForiTunesMatchState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateQueueContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004FBDC;
  v6[3] = &unk_1004A65F0;
  v7 = v4;
  v8 = -[MTLibrary iTunesMatchEnabled](self, "iTunesMatchEnabled");
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (void)removeDownloadAssetsForEpisodeUuids:(id)a3
{
  -[MTLibrary removeDownloadAssetsForEpisodeUuids:shouldKeep:](self, "removeDownloadAssetsForEpisodeUuids:shouldKeep:", a3, 0);
}

- (void)removeDownloadAssetsForEpisodeAdamIds:(id)a3
{
  -[MTLibrary removeDownloadAssetsForEpisodeAdamIds:shouldKeep:](self, "removeDownloadAssetsForEpisodeAdamIds:shouldKeep:", a3, 0);
}

- (void)removeDownloadAssetsForEpisodeUuids:(id)a3 shouldKeep:(id)a4
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
  MTLibrary *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainOrPrivateContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004FD3C;
  v13[3] = &unk_1004A6618;
  v14 = v9;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v12, "performBlockAndWaitWithSave:", v13);

}

- (void)removeDownloadAssetsForEpisodeAdamIds:(id)a3 shouldKeep:(id)a4
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
  MTLibrary *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainOrPrivateContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004FEC0;
  v13[3] = &unk_1004A6618;
  v14 = v9;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v12, "performBlockAndWaitWithSave:", v13);

}

- (void)removeAllHLSDownloadAssets
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTLibrary *v10;
  uint8_t buf[16];

  v3 = _MTLogCategoryDownload(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Delete all HLS offline keys", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "privateQueueContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100050040;
  v8[3] = &unk_1004A6640;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)_removeDownloadAssetsForEpisodes:(id)a3 shouldKeep:(id)a4 forced:(BOOL)a5
{
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  id v37;
  NSMutableArray *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  BOOL v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];

  v7 = a3;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100050528;
  v44[3] = &unk_1004A6668;
  v37 = a4;
  v45 = v37;
  v46 = a5;
  v8 = objc_retainBlock(v44);
  v39 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v41;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v14);
        v16 = _MTLogCategoryDownload(v10, v11);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_msgSend(v15, "storeTrackId");
          *(_DWORD *)buf = 134217984;
          v48 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Deleting episode %lld", buf, 0xCu);
        }

        v19 = ((uint64_t (*)(_QWORD *, void *))v8[2])(v8, v15);
        if ((_DWORD)v19)
        {
          v21 = _MTLogCategoryDownload(v19, v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_msgSend(v15, "storeTrackId");
            *(_DWORD *)buf = 134217984;
            v48 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Skip deleting episode %lld because we should keep", buf, 0xCu);
          }
          goto LABEL_16;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTLegacyDownloadManagerProvider sharedInstance](MTLegacyDownloadManagerProvider, "sharedInstance"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "downloadManagerIfSetup"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
        objc_msgSend(v25, "cancelDownloadsForEpisodeUuid:userInitiated:", v26, 0);

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[PFTranscriptProviderBridge shared](PFTranscriptProviderBridge, "shared"));
        objc_msgSend(v27, "invalidateTranscriptAssetForAdamID:", objc_msgSend(v15, "storeTrackId"));

        if (objc_msgSend(v15, "persistentID"))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v15, "persistentID")));
          -[NSMutableArray addObject:](v39, "addObject:", v28);

        }
        objc_msgSend(v15, "setAssetURL:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[PFFairPlayRolloutController sharedInstance](PFFairPlayRolloutController, "sharedInstance"));
        v30 = objc_msgSend(v29, "isEnabled");

        if ((v30 & 1) == 0)
        {
          v10 = +[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", objc_msgSend(v15, "storeTrackId"));
          if ((_DWORD)v10)
          {
            v22 = objc_claimAutoreleasedReturnValue(-[MTLibrary secureDownloadRenewalManager](self, "secureDownloadRenewalManager"));
            -[NSObject requestSecureDeletionOf:completionHandler:](v22, "requestSecureDeletionOf:completionHandler:", objc_msgSend(v15, "storeTrackId"), 0);
LABEL_16:

          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      v12 = v10;
    }
    while (v10);
  }

  v31 = -[NSMutableArray count](v39, "count");
  v33 = _MTLogCategoryDownload(v31, v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v35)
    {
      v36 = -[NSMutableArray count](v39, "count");
      *(_DWORD *)buf = 134217984;
      v48 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Delete %ld assets from Media Library", buf, 0xCu);
    }

    +[MTMediaLibraryUtil deleteMediaItems:completion:](MTMediaLibraryUtil, "deleteMediaItems:completion:", v39, 0);
    v34 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject postNotificationName:object:](v34, "postNotificationName:object:", PFMediaDownloadWasDeletedNotification, 0);
  }
  else if (v35)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No downloaded assets in Media Library. Nothing to delete.", buf, 2u);
  }

}

- (void)removeDownloadOf:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  -[MTLibrary removeDownloadAssetsForEpisodeAdamIds:](self, "removeDownloadAssetsForEpisodeAdamIds:", v4);

}

- (PFFairPlayInvalidationManager)fairPlayInvalidationManager
{
  return self->_fairPlayInvalidationManager;
}

- (void)setFairPlayInvalidationManager:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlayInvalidationManager, a3);
}

- (void)setITunesMatchEnabled:(BOOL)a3
{
  self->_iTunesMatchEnabled = a3;
}

- (MTLibraryConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_fairPlayInvalidationManager, 0);
  objc_storeStrong((id *)&self->_cleanUpOldHiddenPodcastsWorkController, 0);
}

- (void)_markPlaylistsForUpdateForPodcastUuids:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058800;
  v8[3] = &unk_1004A6640;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

- (BOOL)setStationsOrder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100058BA0;
  v9[3] = &unk_1004A6690;
  v6 = v5;
  v10 = v6;
  v7 = v3;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  LOBYTE(v4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

- (BOOL)setPodcastsOrder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  MTLibrary *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058EE0;
  v10[3] = &unk_1004A6CC0;
  v7 = v6;
  v11 = v7;
  v8 = v4;
  v13 = self;
  v14 = &v15;
  v12 = v8;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)setEpisodesOrder:(id)a3 forStation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000592F4;
  v13[3] = &unk_1004A6D10;
  v9 = v8;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v11 = v5;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v9, "performBlockAndWait:", v13);
  LOBYTE(v7) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v7;
}

- (BOOL)setStationShowGroupOrder:(id)a3 forStation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100059654;
  v13[3] = &unk_1004A6D10;
  v9 = v8;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v11 = v5;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v9, "performBlockAndWait:", v13);
  LOBYTE(v7) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v7;
}

- (void)cleanUpOldHiddenPodcasts
{
  MTLibrary *v2;
  uint64_t v3;
  MTCoalescableWorkController *cleanUpOldHiddenPodcastsWorkController;
  MTCoalescableWorkController *v5;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cleanUpOldHiddenPodcastsWorkController)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MTCoalescableWorkController controllerWithQosClass:identifier:](MTCoalescableWorkController, "controllerWithQosClass:identifier:", 9, CFSTR("MTLibrary.cleanUpOldHiddenPodcasts")));
    cleanUpOldHiddenPodcastsWorkController = v2->_cleanUpOldHiddenPodcastsWorkController;
    v2->_cleanUpOldHiddenPodcastsWorkController = (MTCoalescableWorkController *)v3;

  }
  objc_sync_exit(v2);

  v5 = v2->_cleanUpOldHiddenPodcastsWorkController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006ABD4;
  v6[3] = &unk_1004A6200;
  v6[4] = v2;
  -[MTCoalescableWorkController schedule:](v5, "schedule:", v6);
}

- (void)immediatelyDeleteAllHiddenPodcasts
{
  -[MTLibrary _immediatelyDeleteAllHiddenPodcasts](self, "_immediatelyDeleteAllHiddenPodcasts");
}

- (void)synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTLibrary *v10;
  uint8_t buf[16];

  v3 = _MTLogCategoryDatabase(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting (hiding) all Podcasts", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006ACC0;
  v8[3] = &unk_1004A6640;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v8);

}

- (void)_immediatelyDeleteAllHiddenPodcasts
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = _MTLogCategoryDatabase(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Immediately deleting all hidden podcasts", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForHiddenPodcasts](MTPodcast, "predicateForHiddenPodcasts"));
  -[MTLibrary _deletePodcastForPredicate:](self, "_deletePodcastForPredicate:", v5);

}

- (void)_cleanUpOldHiddenPodcasts
{
  if ((os_feature_enabled_recently_unfollowed(self, a2) & 1) != 0)
    -[MTLibrary _cleanUpOldHiddenAndRecentlyUnfollowedPodcasts](self, "_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts");
  else
    -[MTLibrary _cleanupHiddenPodcasts](self, "_cleanupHiddenPodcasts");
}

- (void)_cleanupHiddenPodcasts
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTLibrary _predicateForOpportunisticHiddenPodcastDeletion](self, "_predicateForOpportunisticHiddenPodcastDeletion"));
  -[MTLibrary _deletePodcastForPredicate:](self, "_deletePodcastForPredicate:", v3);

}

- (void)_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary _predicateForOpportunisticHiddenPodcastDeletion](self, "_predicateForOpportunisticHiddenPodcastDeletion"));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForRecentlyUnfollowedOlderThanCutoffDate](MTPodcast, "predicateForRecentlyUnfollowedOlderThanCutoffDate"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));

  -[MTLibrary _deletePodcastForPredicate:](self, "_deletePodcastForPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForRecentlyUnfollowedOlderThanCutoffDate](MTPodcast, "predicateForRecentlyUnfollowedOlderThanCutoffDate"));
  -[MTLibrary _deleteFromRecentlyUnfollowedForPredicate:](self, "_deleteFromRecentlyUnfollowedForPredicate:", v7);

}

- (id)_predicateForOpportunisticHiddenPodcastDeletion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", -60.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForHiddenPodcasts](MTPodcast, "predicateForHiddenPodcasts"));
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForDateKey:isGreaterThanDate:](NSPredicate, "predicateForDateKey:isGreaterThanDate:", kPodcastAddedDate, v3));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

- (void)_deleteFromRecentlyUnfollowedForPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "importContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006B1B0;
  v8[3] = &unk_1004A6640;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)_deletePodcastForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  MTLibrary *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006B3EC;
  v9[3] = &unk_1004A7398;
  v10 = v6;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);
  +[MTBaseFeedManager saveSubscriptionMetadata](MTBaseFeedManager, "saveSubscriptionMetadata");

}

- (void)_unsafeDeletePodcast:(id)a3 ctx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    if (!v8)
    {
      v9 = _MTLogCategoryDefault(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error deleting podcast without uuid", (uint8_t *)&v21, 2u);
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
    objc_msgSend(v11, "removeItemsWithPrefx:", v8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PUIFeedManagerArtworkBridge shared](PUIFeedManagerArtworkBridge, "shared"));
    objc_msgSend(v12, "invalidateArtworkForPodcast:", v6);

    v14 = _MTLogCategoryDatabase(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Deleting episodes for podcast %@ as part of podcast deletion", (uint8_t *)&v21, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesIncludingHiddenOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesIncludingHiddenOnPodcastUuid:", v8));
    -[MTLibrary _deleteEpisodes:forced:ctx:](self, "_deleteEpisodes:forced:ctx:", v16, 1, v7);

    v18 = _MTLogCategoryDatabase(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Deleting MTPodcast %@ from context", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v7, "deleteObject:", v6);
    objc_msgSend(v7, "saveInCurrentBlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance"));
    objc_msgSend(v20, "removeDonationForPodcastUuid:", v8);

  }
}

- (void)_markAsHiddenPodcast:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = _MTLogCategoryDatabase(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Marking podcast %@ for deletion by hiding it", buf, 0xCu);

  }
  objc_msgSend(v6, "setHidden:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  v12 = objc_msgSend(v11, "supportsLocalMedia");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodes"));
    -[MTLibrary _removeDownloadAssetsForEpisodes:shouldKeep:forced:](self, "_removeDownloadAssetsForEpisodes:shouldKeep:forced:", v13, 0, 1);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playlistSettings", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "playlist"));
        objc_msgSend(v20, "setNeedsUpdate:", 1);

        objc_msgSend(v7, "deleteObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  +[MTBaseFeedManager removeMetadataForPodcastUuid:](MTBaseFeedManager, "removeMetadataForPodcastUuid:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  objc_msgSend(v22, "mt_removeAllNotificationsForPodcastUuid:", v23);

  -[MTLibrary _deleteSpotlightIdentifiersForPodcast:](self, "_deleteSpotlightIdentifiersForPodcast:", v6);
}

- (void)_deleteSpotlightIdentifiersForPodcast:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodes"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006BAF0;
  v10[3] = &unk_1004A7718;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil uniqueIdentifierForObject:](MTCoreSpotlightUtil, "uniqueIdentifierForObject:", v3));
  if (v7)
    objc_msgSend(v9, "addObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightController sharedInstance](MTCoreSpotlightController, "sharedInstance"));
  objc_msgSend(v8, "deleteSearchableItemsWithIdentifiers:", v9);

}

- (void)deletePodcastWithUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importContext"));

  v8 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  -[MTLibrary _markAsHiddenPodcastsWithUuids:setSubscriptionsSyncDirty:ctx:](self, "_markAsHiddenPodcastsWithUuids:setSubscriptionsSyncDirty:ctx:", v7, 1, v6);
}

- (void)_markAsHiddenPodcastsWithUuids:(id)a3 setSubscriptionsSyncDirty:(BOOL)a4 ctx:(id)a5
{
  id v8;
  id v9;
  void ***v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  MTLibrary *v20;
  uint64_t v21;

  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10006BCE0;
  v17 = &unk_1004A7740;
  v18 = a3;
  v8 = a5;
  v19 = v8;
  v20 = self;
  LOBYTE(v21) = a4;
  v9 = v18;
  v10 = objc_retainBlock(&v14);
  if (isRunningUnitTests(v10, v11, v12, v13))
    objc_msgSend(v8, "performBlockAndWait:", v10, v14, v15, v16, v17, v18, v19, v20, v21);
  else
    objc_msgSend(v8, "performBlock:", v10, v14, v15, v16, v17, v18, v19, v20, v21);

}

- (void)deletePlaylist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  MTLibrary *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000BCB44;
    v7[3] = &unk_1004A6640;
    v8 = v5;
    v9 = self;
    objc_msgSend(v6, "performBlockAndWaitWithSave:", v7);

  }
}

- (void)deleteStationWithUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  MTLibrary *v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v8 = _MTLogCategoryDatabase(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleting station with uuid: %@", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BCCF0;
  v12[3] = &unk_1004A7398;
  v13 = v6;
  v14 = v4;
  v15 = self;
  v10 = v4;
  v11 = v6;
  objc_msgSend(v11, "performBlockAndWait:", v12);

}

- (void)deleteAllTopLevelStationsExcludingFolders
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTLibrary *v10;
  uint8_t buf[16];

  v3 = _MTLogCategoryDatabase(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deleting all Stations", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BCE18;
  v8[3] = &unk_1004A6640;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

- (void)_deleteSpotlightIdentifierForPlaylist:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil uniqueIdentifierForObject:](MTCoreSpotlightUtil, "uniqueIdentifierForObject:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightController sharedInstance](MTCoreSpotlightController, "sharedInstance"));
    v7 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
    objc_msgSend(v4, "deleteSearchableItemsWithIdentifiers:", v6);

  }
}

- (void)_deleteEpisodes:(id)a3 forced:(BOOL)a4 ctx:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  MTLibrary *v26;
  id v27;
  uint64_t *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  if (objc_msgSend(v10, "supportsLocalMedia"))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
    v12 = objc_msgSend(v11, "supportsPlayback");

    if (!v12)
      goto LABEL_14;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10004676C;
  v34 = sub_100046A2C;
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000CA29C;
  v24[3] = &unk_1004A9EA0;
  v25 = v8;
  v26 = self;
  v13 = v9;
  v29 = a4;
  v27 = v13;
  v28 = &v30;
  objc_msgSend(v13, "performBlockAndWait:", v24);
  if (objc_msgSend((id)v31[5], "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (id)v31[5];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter", (_QWORD)v20));
          objc_msgSend(v19, "mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid:ctx:", v18, v13);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
      }
      while (v15);
    }

  }
  _Block_object_dispose(&v30, 8);

LABEL_14:
}

- (void)_deleteEpisodeUuids:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), kEpisodeUuid, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainOrPrivateContext"));
  -[MTLibrary _deleteEpisodes:forced:ctx:](self, "_deleteEpisodes:forced:ctx:", v8, v4, v7);

}

- (id)_updateUpNextDeleting:(id)a3 inContext:(id)a4 forced:(BOOL)a5 podcastUuids:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  __objc2_class_ro **p_info;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  LODWORD(self) = objc_msgSend(v12, "supportsPlayback");

  if ((_DWORD)self)
  {
    v13 = objc_opt_new(NSMutableArray);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v32 = v9;
    obj = v9;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      p_info = MTOptionSetting.info;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(p_info + 206, "hasDefaultInstance"))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_info + 206, "defaultInstance"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "upNextController"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
            objc_msgSend(v21, "removeEpisodesForUuid:", v22);

            p_info = (__objc2_class_ro **)(MTOptionSetting + 32);
          }
          v23 = objc_msgSend(v19, "feedDeleted");
          if (!(_DWORD)v23 || (v23 = objc_msgSend(v19, "isDownloaded"), (_DWORD)v23))
          {
            if (!a5)
            {
              v24 = _MTLogCategoryDefault(v23);
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "podcastUuid"));
                *(_DWORD *)buf = 138412546;
                v40 = v26;
                v41 = 2112;
                v42 = v27;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Do not delete a downloaded item! episode uuid %@ - podcast uuid %@", buf, 0x16u);

                p_info = (__objc2_class_ro **)(MTOptionSetting + 32);
              }

            }
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "podcast"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
          objc_msgSend(v11, "addObject:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
          -[NSMutableArray addObject:](v13, "addObject:", v30);

          objc_msgSend(v10, "deleteObject:", v19);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v15);
    }

    v9 = v32;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)deleteEpisodes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainOrPrivateContext"));
  -[MTLibrary _deleteEpisodes:forced:ctx:](self, "_deleteEpisodes:forced:ctx:", v4, 0, v5);

}

- (void)deleteEpisodeUuids:(id)a3
{
  -[MTLibrary deleteEpisodeUuids:forced:](self, "deleteEpisodeUuids:forced:", a3, 0);
}

- (void)deleteOrphanedEpisodes
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTLibrary *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CAAD8;
  v6[3] = &unk_1004A6640;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  id v17;
  MTLibrary *v18;
  uint64_t *v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainOrPrivateContext"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F87F4;
  v15[3] = &unk_1004AAFB8;
  v11 = v10;
  v16 = v11;
  v12 = v8;
  v18 = self;
  v19 = &v22;
  v17 = v12;
  v20 = a3;
  v21 = a4;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6
{
  uint64_t v6;

  if (a3)
    v6 = 0;
  else
    v6 = 2;
  return -[MTLibrary setPlayState:manually:forUserActionOnEpisode:saveChanges:](self, "setPlayState:manually:forUserActionOnEpisode:saveChanges:", v6, a4, a5, a6);
}

- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  id v17;
  MTLibrary *v18;
  uint64_t *v19;
  int64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainOrPrivateContext"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F8988;
  v15[3] = &unk_1004AAFE0;
  v11 = v10;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  v18 = self;
  v19 = &v22;
  v20 = a3;
  v21 = a4;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6
{
  return -[MTLibrary setPlayState:fromContextActions:manually:forUserActionOnEpisode:saveChanges:](self, "setPlayState:fromContextActions:manually:forUserActionOnEpisode:saveChanges:", a3, 0, a4, a5, a6);
}

- (BOOL)setPlayState:(int64_t)a3 fromContextActions:(BOOL)a4 manually:(BOOL)a5 forUserActionOnEpisode:(id)a6 saveChanges:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  unsigned __int8 v21;
  void *v22;
  _DWORD v24[2];
  __int16 v25;
  id v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v7 = a7;
  v8 = a5;
  v9 = a4;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = _MTLogCategoryDefault(v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v12, "playState");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      v24[0] = 67241730;
      v24[1] = v9;
      v25 = 2050;
      v26 = v15;
      v27 = 2050;
      v28 = a3;
      v29 = 1026;
      v30 = v8;
      v31 = 1026;
      v32 = v7;
      v33 = 2114;
      v34 = v16;
      v35 = 2114;
      v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting Playstate from context actions %{public}d: playstate from %{public}lld to %{public}lld , Manual: %{public}d, saveChanges: %{public}u For: %{public}@, UUID: %{public}@", (uint8_t *)v24, 0x3Cu);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "podcast"));
    objc_msgSend(v18, "resetGoDarkWithReason:", 4);
    if (v9)
    {
      v19 = objc_msgSend(v12, "playState");
      if (a3 == 2 && !v19)
      {
        LODWORD(v20) = 0;
        objc_msgSend(v12, "setPlayhead:", v20);
      }
      if (a3)
        v8 = v8;
      else
        v8 = 0;
    }
    if (!a3 && (v8 & 1) == 0)
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v12, "setLastDatePlayed:");
    }
    v21 = 1;
    objc_msgSend(v12, "setPlayState:manually:source:", a3, v8, 1);
    if (v7)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
      v21 = objc_msgSend(v22, "saveInCurrentBlock");

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)cleanUpNeutralInterests
{
  MTLibrary *v2;

  v2 = self;
  MTLibrary.cleanUpNeutralInterests()();

}

- (void)deleteAllInterestsBlockingCaller
{
  MTLibrary *v2;

  v2 = self;
  MTLibrary.deleteAllInterestsBlockingCaller()();

}

- (void)removeEpisodesWith:(id)a3
{
  Swift::OpaquePointer v4;
  MTLibrary *v5;

  v4._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Int64);
  v5 = self;
  MTLibrary.removeEpisodes(with:)(v4);

  swift_bridgeObjectRelease(v4._rawValue);
}

@end
