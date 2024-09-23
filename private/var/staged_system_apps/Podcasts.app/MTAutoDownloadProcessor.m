@implementation MTAutoDownloadProcessor

+ (unint64_t)_freeSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfFileSystemForPath:error:", v3, &v9));

  if (v9)
    objc_msgSend(v9, "logAndThrow:", 1);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSFileSystemFreeSize));
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

  }
  else
  {
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (BOOL)start
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  -[MTAutoDownloadProcessor _reportRetentionPolicy](self, "_reportRetentionPolicy");
  v15.receiver = self;
  v15.super_class = (Class)MTAutoDownloadProcessor;
  v3 = -[MTBaseProcessor start](&v15, "start");
  if (v3)
  {
    objc_initWeak(&location, self);
    -[MTAutoDownloadProcessor setLastCheckTime:](self, "setLastCheckTime:", 0.0);
    -[MTAutoDownloadProcessor setIsDeviceStorageSpaceAvailableForPersistence:](self, "setIsDeviceStorageSpaceAvailableForPersistence:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    objc_msgSend(v4, "addObserver:", self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_lpmDidChange", NSProcessInfoPowerStateDidChangeNotification, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDeviceCapacityMonitor shared](MTDeviceCapacityMonitor, "shared"));
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100057A84;
    v12 = &unk_1004A6C28;
    objc_copyWeak(&v13, &location);
    v7 = objc_msgSend(v6, "addCapacityChangeObserverWithOptions:callback:", 3, &v9);
    -[MTAutoDownloadProcessor setDeviceCapacityObserver:](self, "setDeviceCapacityObserver:", v7, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)stop
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAutoDownloadProcessor;
  -[MTPodcastAndEpisodeProcessor stop](&v5, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDeviceCapacityMonitor shared](MTDeviceCapacityMonitor, "shared"));
  objc_msgSend(v4, "removeCapacityChangeObserverWith:", -[MTAutoDownloadProcessor deviceCapacityObserver](self, "deviceCapacityObserver"));

}

- (id)defaultPropertiesThatAffectPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode userDefaultPropertiesAffectingPredicates](MTEpisode, "userDefaultPropertiesAffectingPredicates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast userDefaultPropertiesAffectingPredicates](MTPodcast, "userDefaultPropertiesAffectingPredicates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "setByAddingObjectsFromSet:", v3));

  return v4;
}

- (id)podcastPredicate
{
  return +[MTPodcast predicateForPodcastsToAutodownload](MTPodcast, "predicateForPodcastsToAutodownload");
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v4 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100057E84;
  v19 = &unk_1004A6C50;
  v7 = v6;
  v20 = v7;
  v8 = v4;
  v21 = v8;
  v22 = &v38;
  v23 = &v34;
  v24 = &v30;
  v25 = &v26;
  objc_msgSend(v7, "performBlockAndWait:", &v16);
  if (*((_BYTE *)v39 + 24)
    && -[MTAutoDownloadProcessor isDeviceStorageSpaceAvailableForPersistence](self, "isDeviceStorageSpaceAvailableForPersistence", v16, v17, v18, v19, v20))
  {
    v9 = *((unsigned __int8 *)v31 + 24);
    v10 = v35[3];
    v11 = *((unsigned __int8 *)v27 + 24);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeDsid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAutomaticDownloadsOnShow:deletePlayedEpisodes:episodeLimit:serialNextEpisodesSort:includePlayableWithoutAccount:](MTEpisode, "predicateForAutomaticDownloadsOnShow:deletePlayedEpisodes:episodeLimit:serialNextEpisodesSort:includePlayableWithoutAccount:", v8, v9 != 0, v10, v11 != 0, v13 == 0));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate", v16, v17, v18, v19));
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v14;
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  if (objc_msgSend(a6, "count", a3, a4, a5))
    -[MTAutoDownloadProcessor _reCheck](self, "_reCheck");
}

- (void)autodownloadEpisodesChanged:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void **v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  MTAutoDownloadProcessor *v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;

  v4 = a3;
  -[MTAutoDownloadProcessor _reportRetentionPolicy](self, "_reportRetentionPolicy");
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v6 = objc_msgSend(v5, "isReachable");

    if ((v6 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
      v10 = objc_msgSend(v9, "isReachableViaCellular");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
      v12 = objc_msgSend(v11, "isPodcastsCellularDownloadsEnabled");

      if ((v12 & 1) != 0 || !v10)
      {
        v19 = -[MTAutoDownloadProcessor _isLPMEnabled](self, "_isLPMEnabled");
        if (v19)
        {
          v21 = _MTLogCategoryDownload(v19, v20);
          v16 = objc_claimAutoreleasedReturnValue(v21);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            goto LABEL_10;
          *(_WORD *)buf = 0;
          v17 = "Skipping autodownloaded since Low Power Mode is enabled.";
          goto LABEL_9;
        }
        v22 = -[MTAutoDownloadProcessor isDeviceStorageSpaceAvailableForPersistence](self, "isDeviceStorageSpaceAvailableForPersistence");
        v23 = v22;
        v25 = _MTLogCategoryDownload(v22, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        v16 = v26;
        if (v23)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v42 = objc_msgSend(v4, "count");
            v43 = 2112;
            v44 = v4;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking Autodownloads for %lu episodes: %@", buf, 0x16u);
          }

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "importContext"));

          v29 = objc_alloc_init((Class)NSMutableSet);
          v33 = _NSConcreteStackBlock;
          v34 = 3221225472;
          v35 = sub_100058250;
          v36 = &unk_1004A6C78;
          v37 = v4;
          v38 = v28;
          v39 = self;
          v40 = v29;
          v30 = v29;
          v16 = v28;
          -[NSObject performBlockAndWait:](v16, "performBlockAndWait:", &v33);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MTLegacyDownloadManagerProvider sharedInstance](MTLegacyDownloadManagerProvider, "sharedInstance", v33, v34, v35, v36));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "downloadManager"));
          objc_msgSend(v32, "addEpisodeAutoDownloads:completion:", v30, 0);

          goto LABEL_10;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v17 = "Skipping autodownloaded since disk capacity is low.";
          goto LABEL_9;
        }
      }
      else
      {
        v15 = _MTLogCategoryDownload(v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v17 = "Skipping autodownloaded since cellular internet usage is not allowed.";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
        }
      }
    }
    else
    {
      v18 = _MTLogCategoryDownload(v7, v8);
      v16 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v17 = "Skipping autodownloaded since there is no active internet connection";
        goto LABEL_9;
      }
    }
LABEL_10:

  }
}

- (BOOL)_isLPMEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (void)_reCheck
{
  double v3;
  double v4;
  double v5;
  double v6;
  MTAutoDownloadProcessor *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  double v14;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[MTAutoDownloadProcessor lastCheckTime](self, "lastCheckTime");
  v6 = v4 - v5;
  if (v4 - v5 >= 2.0)
  {
    -[MTAutoDownloadProcessor setLastCheckTime:](self, "setLastCheckTime:", v4);
    -[MTAutoDownloadProcessor setHasCheckQueued:](self, "setHasCheckQueued:", 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000585AC;
    v12[3] = &unk_1004A6200;
    v12[4] = self;
    -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v12);
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = -[MTAutoDownloadProcessor hasCheckQueued](v7, "hasCheckQueued");
    if (!v8)
    {
      v10 = _MTLogCategoryDownload(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v14 = v6 + 1.0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Postponing recheck for %.0lf sec.", buf, 0xCu);
      }

      -[MTAutoDownloadProcessor setHasCheckQueued:](v7, "setHasCheckQueued:", 1);
      -[MTAutoDownloadProcessor performSelector:withObject:afterDelay:](v7, "performSelector:withObject:afterDelay:", "_reCheck", 0, v6 + 1.0);
    }
    objc_sync_exit(v7);

  }
}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a4)
    -[MTAutoDownloadProcessor _reCheck](self, "_reCheck", a3);
}

- (void)_lpmDidChange
{
  if (!-[MTAutoDownloadProcessor _isLPMEnabled](self, "_isLPMEnabled"))
    -[MTAutoDownloadProcessor _reCheck](self, "_reCheck");
}

- (void)_reportRetentionPolicy
{
  void *v2;
  id v3;

  if (qword_100567290 != -1)
    dispatch_once(&qword_100567290, &stru_1004A6C98);
  v2 = (void *)qword_100567288;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent globalRetentionPolicy](PFAnalyticsEvent, "globalRetentionPolicy"));
  objc_msgSend(v2, "sendEvent:", v3);

}

- (double)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setLastCheckTime:(double)a3
{
  self->_lastCheckTime = a3;
}

- (BOOL)hasCheckQueued
{
  return self->_hasCheckQueued;
}

- (void)setHasCheckQueued:(BOOL)a3
{
  self->_hasCheckQueued = a3;
}

- (BOOL)isDeviceStorageSpaceAvailableForPersistence
{
  return self->_isDeviceStorageSpaceAvailableForPersistence;
}

- (void)setIsDeviceStorageSpaceAvailableForPersistence:(BOOL)a3
{
  self->_isDeviceStorageSpaceAvailableForPersistence = a3;
}

- (int64_t)deviceCapacityObserver
{
  return self->_deviceCapacityObserver;
}

- (void)setDeviceCapacityObserver:(int64_t)a3
{
  self->_deviceCapacityObserver = a3;
}

@end
