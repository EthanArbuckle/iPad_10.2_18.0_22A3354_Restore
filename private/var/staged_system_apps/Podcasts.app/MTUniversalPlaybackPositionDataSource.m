@implementation MTUniversalPlaybackPositionDataSource

+ (double)uppLastSyncTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("MTLibraryUppLastSyncTime"));
  v4 = v3;

  return v4;
}

+ (id)mediaItemIdentifierForEpisode:(id)a3
{
  id v3;
  MTUniversalPlaybackPositionMediaItem *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MTUniversalPlaybackPositionMediaItem);
  -[MTUniversalPlaybackPositionMediaItem setEpisode:](v4, "setEpisode:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:](MZUniversalPlaybackPositionMetadata, "keyValueStoreItemIdentifierForItem:", v4));
  return v5;
}

- (void)performBlockAndWait:(id)a3
{
  id v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "importContext"));

    objc_msgSend(v5, "performBlockAndWait:", v3);
  }
}

- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3
{
  id v3;
  MTUniversalPlaybackPositionTransactionContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  MTUniversalPlaybackPositionTransactionContext *v16;
  id v17;

  v3 = a3;
  v4 = objc_alloc_init(MTUniversalPlaybackPositionTransactionContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[MTUniversalPlaybackPositionTransactionContext setSyncStartTime:](v4, "setSyncStartTime:");

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "importContext"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](MTUPPSyncProcessor, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predicate"));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B2430;
    v13[3] = &unk_1004A9600;
    v14 = v7;
    v15 = v9;
    v17 = v3;
    v16 = v4;
    v10 = v9;
    v11 = v7;
    objc_msgSend(v11, "performBlockAndWaitWithSave:", v13);

  }
  return v4;
}

- (id)_metricsDateFormatter
{
  if (qword_100567420 != -1)
    dispatch_once(&qword_100567420, &stru_1004A9620);
  return (id)qword_100567418;
}

- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(_QWORD);
  uint64_t v11;
  uint64_t isKindOfClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  MTUniversalPlaybackPositionDataSource *v47;
  uint64_t v48;
  BOOL v49;
  uint8_t buf[4];
  id v51;

  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(_QWORD))a5;
  v11 = objc_opt_class(MTUniversalPlaybackPositionTransactionContext);
  isKindOfClass = objc_opt_isKindOfClass(v8, v11);
  if ((isKindOfClass & 1) != 0)
  {
    v39 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTUniversalPlaybackPositionTransactionContext UPPDomainVersion](MTUniversalPlaybackPositionTransactionContext, "UPPDomainVersion"));
    v38 = objc_msgSend(v14, "length") != 0;

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v16 = v15;
    v17 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "importContext"));

    v19 = objc_alloc_init((Class)NSMutableArray);
    v20 = objc_alloc_init((Class)NSMutableSet);
    v21 = v10[2](v10);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (v22)
    {
      v23 = (void *)v22;
      do
      {
        objc_msgSend(v19, "addObject:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaItems"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "itemIdentifier"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v25));

        if (!v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "itemIdentifier"));
          objc_msgSend(v20, "addObject:", v27);

        }
        v28 = v10[2](v10);
        v29 = objc_claimAutoreleasedReturnValue(v28);

        v23 = (void *)v29;
      }
      while (v29);
    }
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000B2D0C;
    v42[3] = &unk_1004A9648;
    v30 = v37;
    v43 = v30;
    v44 = v20;
    v45 = v19;
    v46 = v17;
    v47 = self;
    v49 = v38;
    v48 = v16;
    v31 = v17;
    v32 = v19;
    v33 = v20;
    objc_msgSend(v30, "performBlockAndWaitWithSave:", v42);
    v34 = (void *)objc_opt_class(self);
    objc_msgSend(v31, "syncStartTime");
    objc_msgSend(v34, "setUppLastSyncTime:");
    v9 = v39;
    objc_msgSend((id)objc_opt_class(v31), "setUPPDomainVersion:", v39);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000B3A50;
    v40[3] = &unk_1004A6200;
    v41 = v30;
    v35 = v30;
    objc_msgSend(v35, "performBlockAndWait:", v40);

  }
  else
  {
    v36 = _MTLogCategoryUPPSync(isKindOfClass, v13);
    v33 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v8;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Ran into unexpected transaction {%{public}@} -- BailingOut", buf, 0xCu);
    }
  }

}

- (void)addEpisodeObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionDataSource episodeObservers](self, "episodeObservers"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[MTUniversalPlaybackPositionDataSource setEpisodeObservers:](self, "setEpisodeObservers:", v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionDataSource episodeObservers](self, "episodeObservers"));
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeEpisodeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionDataSource episodeObservers](self, "episodeObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

+ (void)updateEpisode:(id)a3 withUPPMetadata:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  int64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  const __CFString *v24;
  unsigned int v25;
  const __CFString *v26;
  id v27;
  double v28;
  _BYTE v29[12];
  __int16 v30;
  int64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v5 = a3;
  v6 = a4;
  v8 = _MTLogCategoryUPPSync(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
    v12 = (const __CFString *)objc_msgSend(v5, "storeTrackId");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadataIdentifier"));
    *(_DWORD *)v29 = 138479107;
    *(_QWORD *)&v29[4] = v10;
    v30 = 2114;
    v31 = (int64_t)v11;
    v32 = 2049;
    v33 = v12;
    v34 = 2114;
    v35 = v13;
    v36 = 2050;
    v37 = objc_msgSend(v5, "playState");
    v38 = 2114;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating episode \"%{private}@\", %{public}@, %{private}lld, %{public}@, current playState: %{public}lld\nwith UPP metadata: %{public}@", v29, 0x3Eu);

  }
  v14 = objc_msgSend(v6, "playCount");
  v15 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:](MTLibraryLegacyUtil, "playStateFromHasBeenPlayed:andPlayCount:", objc_msgSend(v6, "hasBeenPlayed"), v14);
  v16 = objc_msgSend(v5, "playState");
  v17 = objc_msgSend(v5, "isBackCatalogItem");
  if ((uint64_t)v14 > 0)
    v19 = (int)v17;
  else
    v19 = 0;
  v20 = _MTLogCategoryUPPSync(v17, v18);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if ((id)v15 != v16 || v19)
  {
    if (v22)
    {
      v27 = objc_msgSend(v5, "playState");
      *(_DWORD *)v29 = 134349312;
      *(_QWORD *)&v29[4] = v27;
      v30 = 2050;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "UPP Updating playState from %{public}lld to %{public}lld", v29, 0x16u);
    }

    objc_msgSend(v5, "setPlayState:manually:source:", v15, 0, 3);
  }
  else
  {
    if (v22)
    {
      v23 = objc_msgSend(v5, "playState");
      if (objc_msgSend(v5, "playStateManuallySet"))
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v25 = objc_msgSend(v5, "backCatalog");
      *(_DWORD *)v29 = 134349826;
      if (v25)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      *(_QWORD *)&v29[4] = v23;
      v30 = 2112;
      v31 = (int64_t)v24;
      v32 = 2112;
      v33 = v26;
      v34 = 2048;
      v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "UPP NOT Updating playState because it was already %{public}lld, playStateManuallySet: %@, backCatalog: %@. Remote UPP playCount: %lld", v29, 0x2Au);
    }

  }
  objc_msgSend(v6, "bookmarkTime", *(_QWORD *)v29);
  *(float *)&v28 = v28;
  objc_msgSend(v5, "setPlayhead:", v28);
  objc_msgSend(v5, "setPlayCount:", v14);
  objc_msgSend(v5, "pubDate");
  objc_msgSend(v5, "setImportDate:");
  objc_msgSend(v6, "timestamp");
  objc_msgSend(v5, "setMetadataTimestamp:");
  objc_msgSend(v5, "setMetadataFirstSyncEligible:", 0);

}

+ (void)resetUppLastSyncTimeAndDomainVersion
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("MTLibraryUppLastSyncTime"));

  +[MTUniversalPlaybackPositionTransactionContext setUPPDomainVersion:](MTUniversalPlaybackPositionTransactionContext, "setUPPDomainVersion:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](MTUPPSyncProcessor, "sharedInstance"));
  objc_msgSend(v3, "updatePredicate");

}

+ (void)setUppLastSyncTime:(double)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("MTLibraryUppLastSyncTime"), a3);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](MTUPPSyncProcessor, "sharedInstance"));
  objc_msgSend(v5, "updatePredicate");

}

- (NSMutableArray)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_episodeObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeObservers, 0);
}

@end
