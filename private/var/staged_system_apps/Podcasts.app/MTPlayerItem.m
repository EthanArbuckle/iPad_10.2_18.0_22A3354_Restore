@implementation MTPlayerItem

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem streamCacheObserverToken](self, "streamCacheObserverToken"));

  if (v3)
  {
    v6 = _MTLogCategoryPlayback(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem streamCacheObserverToken](self, "streamCacheObserverToken"));
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing observer for token: %@", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem streamCacheObserverToken](self, "streamCacheObserverToken"));
    objc_msgSend(v9, "removeObserver:", v10);

    -[MTPlayerItem setStreamCacheObserverToken:](self, "setStreamCacheObserverToken:", 0);
  }
  -[MTPlayerItem cleanupItem](self, "cleanupItem");
  v11.receiver = self;
  v11.super_class = (Class)MTPlayerItem;
  -[MTPlayerItem dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamCacheObserverToken, 0);
  objc_storeStrong((id *)&self->_fairPlayKeySession, 0);
  objc_storeStrong((id *)&self->_fairPlayKeyLoader, 0);
  objc_storeStrong((id *)&self->_analyticsChannel, 0);
  objc_storeStrong((id *)&self->_storeResponseDelegate, 0);
  objc_storeStrong((id *)&self->_storeReportingParams, 0);
}

- (BOOL)isPlayable
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetURL"));
    -[MTPlayerItem reportIfLocalAssetHasiPodLibraryURL:](self, "reportIfLocalAssetHasiPodLibraryURL:", v5);

    v6 = objc_msgSend(v4, "reasonForNotPlayable");
    if (v6)
    {
      v8 = v6;
      v9 = _MTLogCategoryPlayback(v6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
        v20 = 138413058;
        v21 = v11;
        v22 = 2114;
        v23 = v12;
        v24 = 2048;
        v25 = objc_msgSend(v4, "storeTrackId");
        v26 = 2050;
        v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MTPlayerItem not playable %@ - %{public}@ - %lld with reason %{public}lu", (uint8_t *)&v20, 0x2Au);

      }
LABEL_9:

      v17 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v14 = objc_msgSend(v13, "isReachable");

    if ((v14 & 1) == 0)
    {
      v18 = _MTLogCategoryPlayback(v15, v16);
      v10 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MTPlayerItem not playable. No episode found and network isn't reachable", (uint8_t *)&v20, 2u);
      }
      goto LABEL_9;
    }
  }
  v17 = 1;
LABEL_10:

  return v17;
}

- (id)assetForLocalFile:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)AVURLAsset);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem defaultAssetOptions](self, "defaultAssetOptions"));
  v7 = objc_msgSend(v5, "initWithURL:options:", v4, v6);

  return v7;
}

- (id)createAssetForUrl:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  id v12;

  v4 = a3;
  v6 = _MTLogCategoryPlayback(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Creating asset for url: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v4)
  {
    if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
      v8 = objc_claimAutoreleasedReturnValue(-[MTPlayerItem assetForLocalFile:](self, "assetForLocalFile:", v4));
    else
      v8 = objc_claimAutoreleasedReturnValue(-[MTPlayerItem assetForRemoteFile:](self, "assetForRemoteFile:", v4));
    v9 = (void *)v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)assetForRemoteFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem defaultAssetOptions](self, "defaultAssetOptions"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(objc_alloc((Class)PFMediaStreamedAssetCache), "initWithSourceURL:", v4);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedAssetURL"));
  v10 = (void *)v8;
  if (v8)
  {
    v11 = _MTLogCategoryPlayback(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Found media in stream cache", buf, 2u);
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem assetForLocalFile:](self, "assetForLocalFile:", v10));
    v14 = 0;
  }
  else
  {
    v28 = 0;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "streamCacheURLAndReturnError:", &v28));
    v14 = v28;
    v17 = _MTLogCategoryPlayback(v14, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    v25 = (void *)v15;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Setting stream cache location to %@", buf, 0xCu);
      }

      objc_msgSend(v6, "setObject:forKey:", v15, AVURLAssetDownloadDestinationURLKey);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = (uint64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error retrieving file url for stream cache: %@", buf, 0xCu);
      }

    }
    v13 = objc_msgSend(objc_alloc((Class)AVURLAsset), "initWithURL:options:", v4, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v21 = AVURLAssetDownloadCompleteSuccessNotification;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005B1F0;
    v26[3] = &unk_1004A6EE8;
    v27 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", v21, v13, v22, v26));
    -[MTPlayerItem setStreamCacheObserverToken:](self, "setStreamCacheObserverToken:", v23);

  }
  return v13;
}

- (void)setAreChaptersLoaded:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTPlayerItem;
  -[MTPlayerItem setAreChaptersLoaded:](&v3, "setAreChaptersLoaded:", a3);
}

- (void)setAsset:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MTPlayerItem;
  -[MTPlayerItem setAsset:](&v22, "setAsset:", v4);
  v5 = -[MTPlayerItem cleanupItem](self, "cleanupItem");
  if (v4)
  {
    v7 = _MTLogCategoryPlayback(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set asset URL to: %@", buf, 0xCu);

    }
    if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", -[MTPlayerItem episodeStoreId](self, "episodeStoreId")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
      if (objc_msgSend(v13, "isHLSPlaylist"))
      {

      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));
        v16 = objc_msgSend(v15, "isPackagedMedia");

        if (!v16)
          goto LABEL_15;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[PFFairPlayRolloutController sharedInstance](PFFairPlayRolloutController, "sharedInstance"));
      v18 = objc_msgSend(v17, "isEnabled");

      v19 = _MTLogCategoryDRM();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching keys using ICContentKeySession", buf, 2u);
        }

        -[MTPlayerItem prepareAssetForFairPlayPlayback:](self, "prepareAssetForFairPlayPlayback:", v4);
      }
      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching keys using IMAVSecureKeyLoader", buf, 2u);
        }

        -[MTPlayerItem prepareAssetForFairPlayPlayback_legacy:](self, "prepareAssetForFairPlayPlayback_legacy:", v4);
      }
    }
  }
LABEL_15:

}

- (void)cleanupItem
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PFFairPlayRolloutController sharedInstance](PFFairPlayRolloutController, "sharedInstance"));
  v4 = objc_msgSend(v3, "isEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));
      objc_msgSend(v6, "deregister");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
      v9 = objc_msgSend(v8, "isOfflineAsset");

      if ((v9 & 1) == 0)
      {
        v10 = _MTLogCategoryDRM();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MTPlayerItem/cleanupItem]: Stopping existing session.", buf, 2u);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeyLoader](self, "fairPlayKeyLoader"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeySession](self, "fairPlayKeySession"));
        objc_msgSend(v12, "stopKeyRequestWithSession:completion:", v13, 0);

      }
      -[MTPlayerItem setFairPlayKeySession:](self, "setFairPlayKeySession:", 0);
    }
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
    objc_msgSend(v14, "sendStopRequestForStreamingLicenseIfNecessary");

  }
}

- (PFFairPlayKeySession)fairPlayKeySession
{
  return self->_fairPlayKeySession;
}

- (id)defaultAssetOptions
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAVAssetCache sharedInstance](MTAVAssetCache, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetCache"));
  objc_msgSend(v3, "setObject:forKey:", v5, AVURLAssetCacheKey);

  -[MTPlayerItem addServiceIdentifier:](self, "addServiceIdentifier:", v3);
  -[MTPlayerItem addUserAgent:](self, "addUserAgent:", v3);
  return v3;
}

- (void)addUserAgent:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a3;
  v4 = _CFNetworkCopyDefaultUserAgentString();
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  v7 = v5;
  if (v5 && (v5 = objc_msgSend(v5, "length")) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", v7, AVURLAssetHTTPUserAgentKey);
  }
  else
  {
    v8 = _MTLogCategoryPlayback(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No or empty user agent received from CFNetwork", v10, 2u);
    }

  }
}

- (void)addServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a3;
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem priceType](self, "priceType"));
    v6 = MTEpisodePriceTypeFromPersistentString();

    v7 = CFSTR(".external");
    if (v6 == 3)
      v7 = CFSTR(".hosted");
    if (v6 == 2)
      v8 = CFSTR(".hosted.subscription");
    else
      v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("app.podcasts.episode"), "stringByAppendingString:", v8));
    objc_msgSend(v10, "setObject:forKey:", v9, AVURLAssetAlternativeConfigurationServiceIdentifierKey);
    objc_msgSend(v4, "setObject:forKey:", v10, AVURLAssetAlternativeConfigurationOptionsKey);

  }
}

- (id)podcastShareUrl
{
  id v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  objc_super v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTPlayerItem;
  v3 = -[MTPlayerItem podcastShareUrl](&v18, "podcastShareUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)MTPlayerItem;
    v5 = -[MTPlayerItem podcastShareUrl](&v17, "podcastShareUrl");
    return (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_1000465C4;
    v15 = sub_100046964;
    v16 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005B364;
    v10[3] = &unk_1004A6F38;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v8, "performBlockAndWait:", v10);

    v9 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

    return v9;
  }
}

- (id)artworkIdentifier
{
  void *v3;

  if (-[MTPlayerItem supportsChapterArtwork](self, "supportsChapterArtwork")
    || -[MTPlayerItem supportsEpisodeArtwork](self, "supportsEpisodeArtwork"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem _episodeArtworkIdentifier](self, "_episodeArtworkIdentifier"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem _podcastArtworkIdentifier](self, "_podcastArtworkIdentifier"));
  }
  return v3;
}

- (BOOL)supportsEpisodeArtwork
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeArtworkProperties](self, "episodeArtworkProperties"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsChapterArtwork
{
  void *v3;
  BOOL v4;

  if (!-[MTPlayerItem areChaptersLoaded](self, "areChaptersLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem metadataChapters](self, "metadataChapters"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_podcastArtworkIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastUuid](self, "podcastUuid"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](self, "artworkUrl"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
    v8 = (void *)v7;
    v9 = (void *)kMTLibraryDefaultImageKey;
    if (v7)
      v9 = (void *)v7;
    v5 = v9;

  }
  return v5;
}

- (void)updateActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPlayerItem;
  v4 = a3;
  -[MTPlayerItem updateActivity:](&v7, "updateActivity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid", v7.receiver, v7.super_class));
  objc_msgSend(v4, "setItemIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastFeedUrl](self, "podcastFeedUrl"));
  objc_msgSend(v4, "setContainerIdentifier:", v6);

}

- (MTPlayerItem)init
{
  MTPlayerItem *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTPlayerItem;
  v2 = -[MTPlayerItem init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "cleanupItem", MTApplicationWillTerminateNotification, 0);

    v4 = objc_alloc_init((Class)_TtC10PodcastsUI23UIStoreResponseDelegate);
    -[MTPlayerItem setStoreResponseDelegate:](v2, "setStoreResponseDelegate:", v4);

    v5 = objc_alloc_init((Class)PFCoreAnalyticsChannel);
    -[MTPlayerItem setAnalyticsChannel:](v2, "setAnalyticsChannel:", v5);

    v6 = (void *)objc_opt_new(PFFairPlayKeyLoader);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PFDispatchingFairPlayKeyLoader receiveOn:loader:](PFDispatchingFairPlayKeyLoader, "receiveOn:loader:", &_dispatch_main_q, v6));
    -[MTPlayerItem setFairPlayKeyLoader:](v2, "setFairPlayKeyLoader:", v7);

  }
  return v2;
}

- (void)setStoreResponseDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_storeResponseDelegate, a3);
}

- (void)setFairPlayKeyLoader:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlayKeyLoader, a3);
}

- (void)setAnalyticsChannel:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsChannel, a3);
}

- (id)episode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MTPlayerItem *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
  if (objc_msgSend(v3, "length"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeObjectID](self, "episodeObjectID"));

    if (!v4)
      return 0;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000465C4;
  v18 = sub_100046964;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000133CC;
  v10[3] = &unk_1004A6F10;
  v13 = &v14;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)contentItemIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem instanceIdentifier](self, "instanceIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return v3;
}

- (void)setManifestIndex:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTPlayerItem;
  -[MTPlayerItem setManifestIndex:](&v3, "setManifestIndex:", a3);
}

- (BOOL)supportsArtworkUrl
{
  return 0;
}

- (BOOL)upgradeToAlternatePaidVersionIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  __int16 v25[8];
  _QWORD v26[4];
  id v27;
  MTPlayerItem *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  if ((-[MTPlayerItem paidSubscriptionActive](self, "paidSubscriptionActive") & 1) != 0)
    return 0;
  v3 = (uint64_t)-[MTPlayerItem channelStoreId](self, "channelStoreId");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10005B8FC;
  v36[3] = &unk_1004A6F88;
  v7 = v6;
  v37 = v7;
  v38 = &v40;
  v39 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v36);
  if (*((_BYTE *)v41 + 24))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_1000465C4;
    v34 = sub_100046964;
    v35 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem alternatePaidURL](self, "alternatePaidURL"));

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[MTPlayerItem alternatePaidURL](self, "alternatePaidURL"));
      v10 = (void *)v31[5];
      v31[5] = v9;

    }
    if (!v31[5])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainOrPrivateContext"));

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10005B948;
        v26[3] = &unk_1004A6690;
        v15 = v14;
        v27 = v15;
        v28 = self;
        v29 = &v30;
        objc_msgSend(v15, "performBlockAndWait:", v26);

      }
    }
    v16 = (void *)v31[5];
    if (v16
      && (v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem url](self, "url")),
          v18 = objc_msgSend(v16, "isEqual:", v17),
          v17,
          (v18 & 1) == 0))
    {
      v22 = _MTLogCategoryPlayback(v19, v20);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "We have found an alternate paid version and have upgraded the player item", (uint8_t *)v25, 2u);
      }

      -[MTPlayerItem setUrl:](self, "setUrl:", v31[5]);
      v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(&v40, 8);
  return v21;
}

- (NSObject)streamCacheObserverToken
{
  return self->_streamCacheObserverToken;
}

- (void)reportIfLocalAssetHasiPodLibraryURL:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("ipod-library"));
    v5 = v9;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent downloadedFileHasiPodLibraryURLWithDiscoveryPoint:path:source:](PFAnalyticsEvent, "downloadedFileHasiPodLibraryURLWithDiscoveryPoint:path:source:", CFSTR("PlaybackValidation"), v9, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem analyticsChannel](self, "analyticsChannel"));
      objc_msgSend(v8, "sendEvent:", v7);

      v5 = v9;
    }
  }

}

- (void)prepareAssetForFairPlayPlayback:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)PFFairPlayAsset), "initWithAdamID:avAsset:", -[MTPlayerItem episodeStoreId](self, "episodeStoreId"), v4);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem fairPlayKeyLoader](self, "fairPlayKeyLoader"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005AD80;
  v8[3] = &unk_1004A6EC0;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "createSessionWithAsset:completion:", v5, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)prepareAssetForFairPlayPlayback_legacy:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v6 = _MTLogCategoryPlayback(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[MTPlayerItem episodeStoreId](self, "episodeStoreId");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    *(_DWORD *)buf = 134218242;
    v27 = v8;
    v28 = 2112;
    v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating secure key loader for episode %lld asset URL: %@", buf, 0x16u);

  }
  v12 = objc_alloc((Class)IMAVSecureKeyLoader);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem storeResponseDelegate](self, "storeResponseDelegate"));
  v16 = objc_msgSend(v12, "initWithRecipient:useCase:account:urlProtocolDelegate:", v4, 0, v14, v15);

  -[MTPlayerItem setSecureKeyLoader:](self, "setSecureKeyLoader:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
  objc_msgSend(v17, "setDelegate:", self);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), -[MTPlayerItem episodeStoreId](self, "episodeStoreId")));
  v19 = _MTLogCategoryDRM();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = -[MTPlayerItem episodeStoreId](self, "episodeStoreId");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
    *(_DWORD *)buf = 134218242;
    v27 = v21;
    v28 = 2112;
    v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Key Loading] Starting from MTPlayerItem for episode adam id %lld, asset URL: %@", buf, 0x16u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
  objc_msgSend(v25, "startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:", 0, v18, 0, 0);

}

- (BOOL)needsNetworkToPlayButNoNetwork
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "reasonForNotPlayable") != (id)2)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v5 = objc_msgSend(v4, "isReachable") ^ 1;

  }
  return v5;
}

- (BOOL)notifyUserIsNotPlayable
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "reasonForNotPlayable");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil sharedInstance](MTEpisodeUnavailableUtil, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcast"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v8 = objc_msgSend(v5, "showDialogForReason:podcastTitle:completion:", v4, v7, 0);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v8 = objc_msgSend(v5, "showInternetUnreachableDialog");
  }

  return v8;
}

- (id)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem author](self, "author"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem album](self, "album"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitleStringForArtist:album:", v4, v5));

  return v6;
}

- (int64_t)mpItemType
{
  if (-[MTPlayerItem isVideo](self, "isVideo"))
    return 2;
  else
    return 1;
}

- (void)invalidateAsset
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  __int128 *p_buf;
  char v24;
  objc_super v25;
  uint8_t v26[4];
  void *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem asset](self, "asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugDescription"));

  v7 = _MTLogCategoryPlayback(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "invalidate asset start: %@", (uint8_t *)&buf, 0xCu);
  }

  v25.receiver = self;
  v25.super_class = (Class)MTPlayerItem;
  -[MTPlayerItem invalidateAsset](&v25, "invalidateAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episode](self, "episode"));
  v10 = -[MTPlayerItem isLocal](self, "isLocal");
  v11 = v10;
  if (v10 && (v12 = objc_msgSend(v9, "isDownloaded"), (_DWORD)v12))
  {
    v14 = _MTLogCategoryPlayback(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "invalidate asset is local and still downloaded. invalidate asset finished: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = sub_1000465C4;
    v31 = sub_100046964;
    v32 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005B7D8;
    v21[3] = &unk_1004A6F60;
    v24 = v11;
    v22 = v9;
    p_buf = &buf;
    -[NSObject performBlockAndWait:](v15, "performBlockAndWait:", v21);
    if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "length"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)));
      v17 = -[MTPlayerItem setUrl:](self, "setUrl:", v16);
      v19 = _MTLogCategoryPlayback(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v26 = 138412290;
        v27 = v4;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "invalidate asset in theory we invalidated asset: %@.", v26, 0xCu);
      }

    }
    _Block_object_dispose(&buf, 8);

  }
}

- (void)upgradeToLocalEpisodeBackedItemWithEpisodeUUID:(id)a3 podcastUUID:(id)a4
{
  id v6;

  v6 = a3;
  -[MTPlayerItem setPodcastUuid:](self, "setPodcastUuid:", a4);
  -[MTPlayerItem setEpisodeUuid:](self, "setEpisodeUuid:", v6);

  -[MTPlayerItem updateContentItem](self, "updateContentItem");
}

- (id)fetchArtworkItemProviderForSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id v6;
  void *v7;
  _QWORD v9[7];

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init((Class)NSItemProvider);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005BAC0;
  v9[3] = &unk_1004A7000;
  v9[4] = self;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  objc_msgSend(v6, "registerItemForTypeIdentifier:loadHandler:", v7, v9);

  return v6;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastUuid](self, "podcastUuid"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem podcastUuid](self, "podcastUuid"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10005BE1C;
    v24[3] = &unk_1004A7050;
    v25 = v7;
    objc_msgSend(v8, "artworkForShow:size:completionHandler:", v10, v24, width, height);

    v11 = v25;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](self, "artworkUrl"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkUrl](self, "artworkUrl"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10005BEBC;
      v22[3] = &unk_1004A7050;
      v23 = v7;
      objc_msgSend(v8, "artworkForURL:withSize:completionHandler:", v14, v22, width, height);

      v11 = v23;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkCatalog](self, "artworkCatalog"));

      if (!v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPodcastArtwork](UIImage, "defaultPodcastArtwork"));
        (*((void (**)(id, void *))v7 + 2))(v7, v17);

        goto LABEL_8;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem artworkCatalog](self, "artworkCatalog"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10005BF5C;
      v18[3] = &unk_1004A7078;
      v19 = v7;
      v20 = width;
      v21 = height;
      objc_msgSend(v16, "requestImageWithCompletionHandler:", v18);

      v11 = v19;
    }
  }

LABEL_8:
}

- (id)externalMetadata
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  MTPlayerItem *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)MTPlayerItem;
  v3 = -[MTPlayerItem externalMetadata](&v39, "externalMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1000465C4;
  v37 = sub_100046964;
  v38 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem itemDescription](self, "itemDescription"));
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1000465C4;
  v31 = sub_100046964;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000465C4;
  v25 = sub_100046964;
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005C2B0;
    v15[3] = &unk_1004A70A0;
    v9 = v8;
    v16 = v9;
    v17 = self;
    v18 = &v33;
    v19 = &v27;
    v20 = &v21;
    objc_msgSend(v9, "performBlockAndWait:", v15);

  }
  if (objc_msgSend((id)v34[5], "length"))
  {
    v10 = objc_alloc_init((Class)AVMutableMetadataItem);
    objc_msgSend(v10, "setIdentifier:", AVMetadataCommonIdentifierDescription);
    objc_msgSend(v10, "setExtendedLanguageTag:", IMAVMetadataItemExtendedLanguageTag);
    objc_msgSend(v10, "setValue:", v34[5]);
    objc_msgSend(v4, "addObject:", v10);

  }
  if (v28[5])
  {
    v11 = objc_alloc_init((Class)AVMutableMetadataItem);
    objc_msgSend(v11, "setIdentifier:", AVMetadataCommonIdentifierCreationDate);
    objc_msgSend(v11, "setExtendedLanguageTag:", IMAVMetadataItemExtendedLanguageTag);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "verboseDisplayString"));
    objc_msgSend(v11, "setValue:", v12);

    objc_msgSend(v4, "addObject:", v11);
  }
  if (objc_msgSend((id)v22[5], "length"))
  {
    v13 = objc_alloc_init((Class)AVMutableMetadataItem);
    objc_msgSend(v13, "setIdentifier:", AVMetadataIdentifieriTunesMetadataContentRating);
    objc_msgSend(v13, "setExtendedLanguageTag:", IMAVMetadataItemExtendedLanguageTag);
    objc_msgSend(v13, "setValue:", v22[5]);
    objc_msgSend(v4, "addObject:", v13);

  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v4;
}

- (id)_episodeArtworkIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem _podcastArtworkIdentifier](self, "_podcastArtworkIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid"));
  v7 = v6;

  if (objc_msgSend(v7, "length"))
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v3, v7));
  else
    v8 = v3;
  v9 = v8;

  return v9;
}

+ (id)subtitleStringForArtist:(id)a3 album:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = objc_msgSend(v6, "length");
  if (v7 && v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NOWPLAYING_PODCAST_ARTIST_FORMAT"), &stru_1004C6D40, 0));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v5, v6));

  }
  else
  {
    if (v7)
    {
      v12 = (__CFString *)v5;
    }
    else
    {
      if (!v8)
      {
        v11 = &stru_1004C6D40;
        goto LABEL_9;
      }
      v12 = (__CFString *)v6;
    }
    v11 = v12;
  }
LABEL_9:

  return v11;
}

+ (id)subtitleStringForEpisode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000465C4;
  v23 = sub_100046964;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000465C4;
  v17 = sub_100046964;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005C6A0;
  v9[3] = &unk_1004A70C8;
  v11 = &v19;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subtitleStringForArtist:album:", v20[5], v14[5]));

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)contentKeyRequestDidFailWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v6 = _MTLogCategoryPlayback(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeUuid](self, "episodeUuid"));
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Content Key Request failed for episode %@ with error: %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem secureKeyLoader](self, "secureKeyLoader"));
  objc_msgSend(v9, "invalidateAndCancel");

  -[MTPlayerItem setSecureKeyLoader:](self, "setSecureKeyLoader:", 0);
  -[MTPlayerItem invalidateAsset](self, "invalidateAsset");

}

- (id)metricsContentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", -[MTPlayerItem episodeStoreId](self, "episodeStoreId")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), -[MTPlayerItem episodeStoreId](self, "episodeStoreId")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("adamId"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem episodeGuid](self, "episodeGuid"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("guid"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem title](self, "title"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem title](self, "title"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem author](self, "author"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItem author](self, "author"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("podcast"));

  }
  return v3;
}

- (NSString)storeReportingParams
{
  return self->_storeReportingParams;
}

- (void)setStoreReportingParams:(id)a3
{
  objc_storeStrong((id *)&self->_storeReportingParams, a3);
}

- (_TtC10PodcastsUI23UIStoreResponseDelegate)storeResponseDelegate
{
  return self->_storeResponseDelegate;
}

- (PFAnalyticsChannel)analyticsChannel
{
  return self->_analyticsChannel;
}

- (PFFairPlayKeyLoading)fairPlayKeyLoader
{
  return self->_fairPlayKeyLoader;
}

- (void)setFairPlayKeySession:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlayKeySession, a3);
}

- (void)setStreamCacheObserverToken:(id)a3
{
  objc_storeStrong((id *)&self->_streamCacheObserverToken, a3);
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return +[MTEpisodeIdentifier identifierWithPlayerItem:](MTEpisodeIdentifier, "identifierWithPlayerItem:", self);
}

- (MTPlayerItem)initWithPodcastEpisode:(id)a3 podcast:(id)a4
{
  id v5;
  id v6;
  MTPlayerItem *result;

  v5 = a3;
  v6 = a4;
  MTPlayerItem.init(podcastEpisode:podcast:)(v5, a4);
  return result;
}

@end
