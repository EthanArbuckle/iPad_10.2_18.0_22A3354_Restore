@implementation MTUPPSyncProcessor

- (void)processResults
{
  MTUPPSyncProcessor *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  id v16;

  v2 = self;
  objc_sync_enter(v2);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000468AC;
  v13 = sub_100046ACC;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100115BC4;
  v8[3] = &unk_1004A97D8;
  v8[4] = &v9;
  -[MTBaseProcessor results:](v2, "results:", v8);
  if (-[MTUPPSyncProcessor shouldSync:](v2, "shouldSync:", v10[5]))
  {
    v3 = _MTLogCategoryUPPSync();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend((id)v10[5], "count");
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MTUPPSyncProcessor - Episodes to sync: %ld", buf, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
    -[NSObject performUniversalPlaybackPositionSync](v6, "performUniversalPlaybackPositionSync");
  }
  else
  {
    v7 = _MTLogCategoryUPPSync();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - skipping sync", buf, 2u);
    }
  }

  _Block_object_dispose(&v9, 8);
  objc_sync_exit(v2);

}

- (id)predicate
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = kEpisodeMetadataTimestamp;
  +[MTUniversalPlaybackPositionDataSource uppLastSyncTime](MTUniversalPlaybackPositionDataSource, "uppLastSyncTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForDateKey:isGreaterThanDate:](NSPredicate, "predicateForDateKey:isGreaterThanDate:", v2, v3));

  return v4;
}

- (id)entityName
{
  return kMTEpisodeEntityName;
}

- (void)updatePredicate
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTUPPSyncProcessor;
  -[MTBaseProcessor updatePredicate](&v5, "updatePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  v4 = objc_msgSend(v3, "isObserving");

  if (v4)
    -[MTUPPSyncProcessor processResults](self, "processResults");
}

- (BOOL)shouldSync:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v7 = _MTLogCategoryUPPSync(0, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - skipping sync because no items to sync.", buf, 2u);
    }
    v6 = 0;
    goto LABEL_23;
  }
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    if ((os_feature_enabled_bluemoon(v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUPPSyncProcessor controller](self, "controller"));
      objc_msgSend(v9, "reloadIfNeeded");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTUPPSyncProcessor controller](self, "controller"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "response"));

      if (objc_msgSend(v11, "state") != (id)2)
        goto LABEL_18;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tracklist"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playingItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metadataObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifiers"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "library"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "databaseID"));
      v18 = objc_msgSend(v17, "isEqualToString:", v8);

      if (!v18)
      {
LABEL_18:
        v6 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v21 = _MTLogCategoryUPPSync(v19, v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - Trying to sync the currently playing item. Skipping UPP sync.", v29, 2u);
      }
      v6 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentItem"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject episodeUuid](v22, "episodeUuid"));
      if (-[NSObject isEqualToString:](v8, "isEqualToString:", v23)
        && (v24 = objc_msgSend(v11, "isPlayingLocally"), (_DWORD)v24))
      {
        v26 = _MTLogCategoryUPPSync(v24, v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - skipping sync on currently playing item.", v30, 2u);
        }

        v6 = 0;
      }
      else
      {
        v6 = 1;
      }

    }
    goto LABEL_22;
  }
  v6 = 1;
LABEL_24:

  return v6;
}

- (void)playerPaused
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100115EE0;
  v2[3] = &unk_1004A6200;
  v2[4] = self;
  -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v2);
}

- (id)controller
{
  MPRequestResponseController *controller;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MPRequestResponseController *v10;
  MPRequestResponseController *v11;
  uint64_t v13;
  void *v14;

  controller = self->_controller;
  if (!controller)
  {
    v4 = objc_alloc_init((Class)MPCPlayerRequest);
    objc_msgSend(v4, "setLabel:", CFSTR("com.apple.podcasts.MTUPPSyncProcessor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCPlayerPath pathWithRoute:bundleID:playerID:](MPCPlayerPath, "pathWithRoute:bundleID:playerID:", v5, kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier, kPodcastsPlayerID));
    objc_msgSend(v4, "setPlayerPath:", v6);

    v13 = MPModelRelationshipGenericPodcastEpisode;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet"));
    v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithRelationships:](MPPropertySet, "propertySetWithRelationships:", v8));
    objc_msgSend(v4, "setPlayingItemProperties:", v9);

    v10 = (MPRequestResponseController *)objc_alloc_init((Class)MPRequestResponseController);
    v11 = self->_controller;
    self->_controller = v10;

    -[MPRequestResponseController setRequest:](self->_controller, "setRequest:", v4);
    -[MPRequestResponseController beginAutomaticResponseLoading](self->_controller, "beginAutomaticResponseLoading");

    controller = self->_controller;
  }
  return controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
