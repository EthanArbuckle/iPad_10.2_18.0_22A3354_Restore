@implementation MTPlaybackQueueController

- (void)manifestDidChange
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v3 = _MTLogCategoryPlayback(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidating playback queue", v14, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoCenter"));
  objc_msgSend(v7, "invalidatePlaybackQueue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "player"));
  objc_msgSend(v9, "updateNowPlayingDurationSnapshot");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  -[MTPlaybackQueueController setSessionIdentifier:](self, "setSessionIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController sessionDelegate](self, "sessionDelegate"));
  LOBYTE(v11) = objc_opt_respondsToSelector(v12, "sessionIdentifierDidChange");

  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController sessionDelegate](self, "sessionDelegate"));
    objc_msgSend(v13, "sessionIdentifierDidChange");

  }
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (MTPlaybackQueueControllerSessionDelegate)sessionDelegate
{
  return (MTPlaybackQueueControllerSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (MTPlaybackQueueController)initWithPlayerController:(id)a3
{
  id v4;
  MTPlaybackQueueController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MTUpNextResultsController *v16;
  void *v17;
  NSMutableSet *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTPlaybackQueueController;
  v5 = -[MTPlaybackQueueController init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
    -[MTPlaybackQueueController setPlayerController:](v5, "setPlayerController:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoCenter"));
    objc_msgSend(v7, "setPlaybackQueueDataSource:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](IMAVPlayer, "sharedPlayer"));
    if (v6 == v8)
    {
      v9 = objc_alloc((Class)MPNowPlayingInfoCenter);
      v10 = objc_msgSend(v9, "initWithPlayerID:", kMTPodcastsMagicMomentsPlayerID);
      -[MTPlaybackQueueController setMetadataInfoCenter:](v5, "setMetadataInfoCenter:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController metadataInfoCenter](v5, "metadataInfoCenter"));
      objc_msgSend(v11, "setPlaybackQueueDataSource:", v5);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController metadataInfoCenter](v5, "metadataInfoCenter"));
      objc_msgSend(v12, "invalidatePlaybackQueue");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, "manifestDidChange", IMAVPlayerNotification_MediaItemDidChange, v6);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, "didLoadAdditionalItems", IMPlayerManifestDidLoadAdditionalItems, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, "artworkDidChange:", kMTImageDownloaderArtworkDidLoadNotification, 0);

    v16 = -[MTUpNextResultsController initWithPlayerController:]([MTUpNextResultsController alloc], "initWithPlayerController:", v4);
    -[MTPlaybackQueueController setUpNextResultsController:](v5, "setUpNextResultsController:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController upNextResultsController](v5, "upNextResultsController"));
    objc_msgSend(v17, "setDelegate:", v5);

    v18 = objc_opt_new(NSMutableSet);
    -[MTPlaybackQueueController setArtworkRequests:](v5, "setArtworkRequests:", v18);

    -[MTPlaybackQueueController manifestDidChange](v5, "manifestDidChange");
  }

  return v5;
}

- (MPNowPlayingInfoCenter)metadataInfoCenter
{
  return self->_metadataInfoCenter;
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  return v6;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v6 = a4;
  v7 = a3;
  v8 = kdebug_trace(723518092, 0, 0, 0, 0);
  v9 = _MTLogCategoryMediaRemote(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138543362;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch content item for ID %{public}@", (uint8_t *)&v19, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:](self, "_playerItemForContentItemId:infoCenter:", v6, v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentItem"));

  v14 = _MTLogCategoryMediaRemote(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "albumName"));
    v19 = 138543874;
    v20 = v6;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[InfoCenter] Did fetch content item for ID %{public}@ - %@ - %@", (uint8_t *)&v19, 0x20u);

  }
  kdebug_trace(723518096, 0, 0, 0, 0);

  return v12;
}

- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _MTLogCategoryMediaRemote(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch info for content item ID %{public}@", buf, 0xCu);

  }
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "privateQueueContext"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:](self, "_playerItemForContentItemId:infoCenter:", v16, v8));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000286DC;
    v21[3] = &unk_1004A6618;
    v22 = v15;
    v23 = v17;
    v24 = v9;
    v25 = v10;
    v18 = v17;
    v19 = v15;
    objc_msgSend(v19, "performBlock:", v21);

  }
  return 0;
}

- (id)_playerItemForContentItemId:(id)a3 infoCenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  __CFString *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerID"));
  v9 = objc_msgSend(v8, "isEqualToString:", kMTPodcastsMagicMomentsPlayerID);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController magicMomentPlayerItem](self, "magicMomentPlayerItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    if (objc_msgSend(v12, "isEqualToString:", v6))
      v13 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController magicMomentPlayerItem](self, "magicMomentPlayerItem"));
    else
      v13 = 0;

  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_10004679C;
    v38 = sub_100046A44;
    v39 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100042C54;
    v31[3] = &unk_1004A7A38;
    v15 = v6;
    v32 = v15;
    v33 = &v34;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v31);

    v16 = (void *)v35[5];
    if (!v16)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = sub_10004679C;
      v29 = sub_100046A44;
      v30 = &stru_1004C6D40;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000CF0CC;
      v24[3] = &unk_1004AA120;
      v24[4] = &v25;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);

      v20 = _MTLogCategoryPlayback(v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v26[5];
        *(_DWORD *)buf = 138543618;
        v41 = v15;
        v42 = 2114;
        v43 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "We couldn't find a player item for content item %{public}@.  All player items in the queue %{public}@", buf, 0x16u);
      }

      _Block_object_dispose(&v25, 8);
      v16 = (void *)v35[5];
    }
    v13 = v16;

    _Block_object_dispose(&v34, 8);
  }

  return v13;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  int64_t v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = kdebug_trace(723518100, 0, 0, 0, 0);
  v8 = _MTLogCategoryMediaRemote(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v33 = 134217984;
    v34 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch content item ID for offset %ld", (uint8_t *)&v33, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
  v11 = objc_msgSend(v10, "isEqualToString:", kMTPodcastsMagicMomentsPlayerID);

  if (v11)
  {
    if (a4)
    {
      v13 = 0;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController magicMomentPlayerItem](self, "magicMomentPlayerItem"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contentItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));

    }
    v31 = _MTLogCategoryMediaRemote(v12);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 134218242;
      v34 = a4;
      v35 = 2114;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[InfoCenter] Did fetch content item ID for Magic Moments player for offset %ld - %{public}@", (uint8_t *)&v33, 0x16u);
    }

    kdebug_trace(723518104, 0, 0, 0, 0);
    return v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  v15 = (char *)objc_msgSend(v14, "currentIndex");

  v16 = &v15[a4];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  v18 = (char *)objc_msgSend(v17, "count");

  if (v16 < v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", v16));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentItemIdentifier"));
    v22 = _MTLogCategoryMediaRemote(v13);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 134218242;
      v34 = a4;
      v35 = 2114;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[InfoCenter] Did fetch content item ID for offset %ld - %{public}@", (uint8_t *)&v33, 0x16u);
    }

    kdebug_trace(723518104, 0, 0, 0, 0);
    return v13;
  }
  v24 = _MTLogCategoryMediaRemote(v19);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    v27 = objc_msgSend(v26, "count");
    v33 = 134218240;
    v34 = a4;
    v35 = 2048;
    v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[InfoCenter] Attempting to fetch content item ID for offset %ld outside of manifest range %lu", (uint8_t *)&v33, 0x16u);

  }
  kdebug_trace(723518104, 0, 0, 0, 0);
  return 0;
}

- (MTCompositeManifest)compositeManifest
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifest"));

  if (v5
    && (v6 = objc_opt_class(MTCompositeManifest),
        v7 = objc_opt_class(v6),
        (objc_opt_isKindOfClass(v5, v7) & 1) == 0))
  {
    v10 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "player"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manifest"));

  }
  return (MTCompositeManifest *)v10;
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (MTResultsController)upNextResultsController
{
  return self->_upNextResultsController;
}

- (void)setUpNextResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_upNextResultsController, a3);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (void)setPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_playerController, a3);
}

- (void)setMetadataInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_metadataInfoCenter, a3);
}

- (void)setArtworkRequests:(id)a3
{
  objc_storeStrong((id *)&self->_artworkRequests, a3);
}

- (void)setArtworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_artworkProvider, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (MTPlayerItem)magicMomentPlayerItem
{
  return self->_magicMomentPlayerItem;
}

- (void)artworkDidChange:(id)a3
{
  uint64_t CacheKeys;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  CacheKeys = MTImageDownloaderArtworkDidLoadCacheKeys(a3);
  v15 = (id)objc_claimAutoreleasedReturnValue(CacheKeys);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v7));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artworkIdentifier"));
      v11 = objc_msgSend(v15, "containsObject:", v10);

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentItem"));
        objc_msgSend(v12, "invalidateArtwork");

      }
      ++v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v14 = objc_msgSend(v13, "count");

    }
    while ((unint64_t)v14 > v7);
  }

}

- (BOOL)playItemWithContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manifest"));
  if (os_feature_enabled_red_sun(v6))
  {
    v7 = objc_opt_class(MTUpNextManifest);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentItemIdentifier"));

      -[MTPlaybackQueueController reorderItemWithContentId:afterItemWithContentID:](self, "reorderItemWithContentId:afterItemWithContentID:", v4, v10);
    }
  }
  v11 = objc_msgSend(v5, "manifestIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  v13 = objc_msgSend(v12, "determineCompositeIndexWithIndex:fromManifest:", v11, v6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  objc_msgSend(v14, "setCurrentIndex:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  objc_msgSend(v15, "playWithReason:", 7);

  return 1;
}

- (BOOL)removeItemWithContentID:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t isKindOfClass;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint8_t v14[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifest"));
  v6 = objc_msgSend(v4, "manifestIndex");
  v7 = objc_opt_class(MTUpNextManifest);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  v9 = isKindOfClass;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject upNextController](v10, "upNextController"));
    objc_msgSend(v11, "removeEpisodeAtIndex:", v6);

  }
  else
  {
    v12 = _MTLogCategoryMediaRemote(isKindOfClass);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Can't remove an item that isn't in the up next manifest", v14, 2u);
    }
  }

  return v9 & 1;
}

- (void)clearUpNextManifest
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "upNextController"));
  objc_msgSend(v2, "clearQueueItems");

}

- (BOOL)reorderItemWithContentId:(id)a3 afterItemWithContentID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t isKindOfClass;
  NSObject *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  char *v28;
  uint8_t v29[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "upNextController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manifest"));
  v12 = objc_msgSend(v10, "manifestIndex");
  v13 = objc_opt_class(MTUpNextManifest);
  isKindOfClass = objc_opt_isKindOfClass(v11, v13);
  if ((isKindOfClass & 1) != 0)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:](self, "_playerItemForContentItemId:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject manifest](v15, "manifest"));
    v17 = (char *)-[NSObject manifestIndex](v15, "manifestIndex");
    v18 = objc_opt_class(MTUpNextManifest);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
    {
      v19 = objc_msgSend(v9, "moveEpisodeFrom:to:", v12, v17 + 1);
LABEL_14:

      goto LABEL_15;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentManifest"));
    if (v22 == v16)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
      v28 = (char *)objc_msgSend(v24, "currentIndex");

      if (v28 == v17)
      {
        objc_msgSend(v9, "moveEpisodeFrom:to:", v12, 0);
        v19 = 1;
        goto LABEL_14;
      }
    }
    else
    {

    }
    v25 = _MTLogCategoryMediaRemote(v23);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Can't reorder an item to a destination outside of the up next queue", v29, 2u);
    }

    v19 = 0;
    goto LABEL_14;
  }
  v20 = _MTLogCategoryMediaRemote(isKindOfClass);
  v15 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't reorder an item that isn't in the up next manifest", buf, 2u);
  }
  v19 = 0;
LABEL_15:

  return v19;
}

- (void)setMagicMomentPlayerItem:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_magicMomentPlayerItem, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController metadataInfoCenter](self, "metadataInfoCenter"));
  objc_msgSend(v4, "invalidatePlaybackQueue");

}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  double v33;
  CMTime v35;
  CMTime time;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;

  height = a5.height;
  width = a5.width;
  v11 = a4;
  v12 = a6;
  v13 = a3;
  v14 = kdebug_trace(723518108, 0, 0, 0, 0);
  v15 = _MTLogCategoryMediaRemote(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    *(_DWORD *)buf = 138543362;
    v38 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch artwork for content item ID %{public}@", buf, 0xCu);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController playerController](self, "playerController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "player"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:](self, "_playerItemForContentItemId:infoCenter:", v20, v13));

  if (v21)
  {
    objc_msgSend(v19, "currentTime");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentChapter"));

    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentChapter"));
      v28 = v27;
      if (v27)
        objc_msgSend(v27, "assetTimeRange");
      else
        memset(&v35, 0, sizeof(v35));
      time = v35;
      v24 = CMTimeGetSeconds(&time) + 0.00000011920929;

      v26 = objc_msgSend(v19, "currentTime");
      if (v33 >= v24)
        v24 = v33;
    }
    if (os_feature_enabled_red_sun(v26))
      -[MTPlaybackQueueController fetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:](self, "fetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:", v21, v11, v12, v24, width, height);
    else
      -[MTPlaybackQueueController legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:](self, "legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:", v21, v11, v12, v24, width, height);
  }
  else
  {
    v29 = _MTLogCategoryMediaRemote(v22);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
      *(_DWORD *)buf = 138543618;
      v38 = v31;
      v39 = 2112;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[InfoCenter] Attempting to fetch artwork for content item %{public}@ - %@ but player item is nil", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    kdebug_trace(723518112, 0, 0, 0, 0);
  }

  return 0;
}

- (void)fetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void **v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  MTPlaybackQueueController *v30;
  id v31;
  uint8_t *v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController artworkProvider](self, "artworkProvider"));

  if (v16)
  {
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x3032000000;
    v36 = sub_10004679C;
    v37 = sub_100046A44;
    v38 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController artworkProvider](self, "artworkProvider"));
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_1000CEA70;
    v28 = &unk_1004AA0D0;
    v29 = v14;
    v30 = self;
    v31 = v15;
    v32 = buf;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fetchInfoCenterArtworkWith:at:of:completion:", v13, &v25, a5, width, height));
    v20 = (void *)*((_QWORD *)v34 + 5);
    *((_QWORD *)v34 + 5) = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController artworkRequests](self, "artworkRequests", v25, v26, v27, v28));
    objc_msgSend(v21, "addObject:", *((_QWORD *)v34 + 5));

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v22 = _MTLogCategoryMediaRemote(v17);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MTPlaybackQueueControllerErrorDomain"), 2, 0));
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v24);

    kdebug_trace(723518112, 0, 0, 0, 0);
  }

}

- (void)legacyFetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7
{
  double height;
  double width;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  height = a6.height;
  width = a6.width;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000CEC8C;
  v14[3] = &unk_1004AA0F8;
  v15 = a4;
  v16 = a7;
  v12 = v16;
  v13 = v15;
  objc_msgSend(a3, "retrieveArtwork:withSize:atTime:", v14, width, height, a5);

}

- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void (**v27)(id, _QWORD, void *);
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  v5 = (void (**)(id, _QWORD, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeDsid"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackQueueController compositeManifest](self, "compositeManifest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifiersForManifest:queueStatus:", v9, 0));

  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  if (objc_msgSend(v10, "count"))
  {
    v27 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance", v27));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playbackRequestURLWithDSID:baseRequestURLString:", v7, v17));

          objc_msgSend(v11, "addObject:", v19);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v14);
    }

    v28 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 0, &v28));
    v21 = v28;
    v22 = v21;
    v5 = v27;
    if (v21)
    {
      v23 = _MTLogCategoryMediaRemote(v21);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not archive playback session: %@", buf, 0xCu);
      }

    }
    if (v27)
      ((void (**)(id, void *, void *))v27)[2](v27, v20, v22);

  }
  else
  {
    v25 = _MTLogCategoryMediaRemote(0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "No playback identifiers found in current manifest", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MTPlaybackQueueControllerErrorDomain"), 1, 0));
    v5[2](v5, 0, v22);
  }

}

- (id)_playerItemForContentItemId:(id)a3
{
  return -[MTPlaybackQueueController _playerItemForContentItemId:infoCenter:](self, "_playerItemForContentItemId:infoCenter:", a3, 0);
}

- (id)_contentItemForChapter:(id)a3 playerItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeUuid"));
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "episodeStoreId")));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "podcastUuid"));
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "podcastStoreId")));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-%@"), v17));
    v7 = objc_msgSend(objc_alloc((Class)MPNowPlayingContentItem), "initWithIdentifier:", v18);
    objc_msgSend(v7, "setCollectionIdentifier:", v15);
    objc_msgSend(v7, "setContainer:", 0);
    objc_msgSend(v7, "setPlayable:", 1);
    objc_msgSend(v7, "setTitle:", v17);
    objc_msgSend(v8, "duration");
    v20 = v19;

    objc_msgSend(v7, "setDuration:", v20);
  }

  return v7;
}

- (MTNowPlayingArtworkProvider)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setCompositeManifest:(id)a3
{
  objc_storeStrong((id *)&self->_compositeManifest, a3);
}

- (NSMutableSet)artworkRequests
{
  return self->_artworkRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkRequests, 0);
  objc_destroyWeak((id *)&self->_playerController);
  objc_storeStrong((id *)&self->_upNextResultsController, 0);
  objc_storeStrong((id *)&self->_compositeManifest, 0);
  objc_storeStrong((id *)&self->_metadataInfoCenter, 0);
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_magicMomentPlayerItem, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
}

@end
