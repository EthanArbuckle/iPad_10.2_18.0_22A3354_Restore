@implementation MTFeedIngester

- (MTFeedIngester)initWithPodcast:(id)a3 ctx:(id)a4 storeInfoUpdater:(id)a5 imageDownloader:(id)a6 imageStore:(id)a7 syncController:(id)a8 library:(id)a9 downloadManager:(id)a10 episodeLevelCalculator:(id)a11 categoryIngester:(id)a12 feedUpdateSource:(int64_t)a13 updaterJobUUID:(id)a14 canSendNotifications:(BOOL)a15
{
  id v20;
  id v21;
  id v22;
  MTFeedIngester *v23;
  MTFeedIngester *v24;
  uint64_t v25;
  NSMutableSet *newlyEntitledEpisodeUUIDs;
  uint64_t v27;
  NSMutableSet *updatedEpisodeUUIDs;
  uint64_t v29;
  _TtC18PodcastsFoundation29FeedManagerLocalConfiguration *configuration;
  id v33;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v42 = a4;
  v33 = a5;
  v41 = a5;
  v40 = a6;
  v34 = a7;
  v39 = a7;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a14;
  v44.receiver = self;
  v44.super_class = (Class)MTFeedIngester;
  v23 = -[MTFeedIngester init](&v44, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_ctx, a4);
    objc_storeStrong((id *)&v24->_localPodcast, a3);
    v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    newlyEntitledEpisodeUUIDs = v24->_newlyEntitledEpisodeUUIDs;
    v24->_newlyEntitledEpisodeUUIDs = (NSMutableSet *)v25;

    v27 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    updatedEpisodeUUIDs = v24->_updatedEpisodeUUIDs;
    v24->_updatedEpisodeUUIDs = (NSMutableSet *)v27;

    v24->_latestEpisodeDate = 0.0;
    v24->_shouldMarkPlaylistsForUpdate = 0;
    objc_storeStrong((id *)&v24->_storeInfoUpdater, v33);
    objc_storeStrong((id *)&v24->_imageDownloader, a6);
    objc_storeStrong((id *)&v24->_imageStore, v34);
    objc_storeStrong((id *)&v24->_syncController, a8);
    objc_storeStrong((id *)&v24->_library, a9);
    objc_storeStrong((id *)&v24->_downloadManager, a10);
    objc_storeStrong((id *)&v24->_episodeLevelCalculator, a11);
    objc_storeStrong((id *)&v24->_categoryIngester, a12);
    v24->_feedUpdateSource = a13;
    objc_storeStrong((id *)&v24->_updaterJobUUID, a14);
    v24->_itemsInserted = 0;
    v24->_itemsIngested = 0;
    v24->_itemsDeleted = 0;
    v24->_canSendNotifications = a15;
    v29 = objc_claimAutoreleasedReturnValue(+[FeedManagerLocalConfiguration platformSpecificConfiguration](_TtC18PodcastsFoundation29FeedManagerLocalConfiguration, "platformSpecificConfiguration"));
    configuration = v24->_configuration;
    v24->_configuration = (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)v29;

  }
  return v24;
}

- (id)unsafeIngestNewEpisode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  int v12;
  id v13;
  double v14;
  double v15;
  uint64_t updated;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  uint64_t v55;

  v4 = a3;
  if (-[MTFeedIngester _localPodcastExists](self, "_localPodcastExists"))
  {
    -[MTSyncControllerProtocol setUppSyncDirtyFlag:](self->_syncController, "setUppSyncDirtyFlag:", 1);
    v5 = objc_claimAutoreleasedReturnValue(+[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:](MTEpisode, "insertNewEpisodeInManagedObjectContext:canSendNotifications:", self->_ctx, self->_canSendNotifications));
    -[NSObject setPodcast:](v5, "setPodcast:", self->_localPodcast);
    -[NSObject setImportSource:](v5, "setImportSource:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pubDate"));
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;
    -[MTPodcast addedDate](self->_localPodcast, "addedDate");
    v10 = v9;

    v11 = -[MTPodcast importing](self->_localPodcast, "importing");
    if (v8 < v10)
      v12 = 1;
    else
      v12 = v11;
    if ((v12 & 1) != 0 || (-[MTPodcast subscribed](self->_localPodcast, "subscribed") & 1) == 0)
    {
      v13 = -[NSObject metadataTimestamp](v5, "metadataTimestamp");
      v15 = v14;
      updated = _MTLogCategoryFeedUpdateIngester(v13);
      v17 = objc_claimAutoreleasedReturnValue(updated);
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15 == 0.0)
      {
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v5, "uuid"));
          v22 = -[NSObject sentNotification](v5, "sentNotification");
          v23 = -[MTPodcast importing](self->_localPodcast, "importing");
          v42 = 138544642;
          v43 = v19;
          v44 = 2112;
          v45 = v20;
          v46 = 2114;
          v47 = v21;
          v48 = 1024;
          v49 = v22;
          v50 = 1024;
          v51 = v12;
          v52 = 1024;
          v53 = v23;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Marking new feed episode as backCatalog. %{public}@, sentNotification: %d, isEpisodePublishedBeforeAddedDate: %d, podcastIsImporting: %d", (uint8_t *)&v42, 0x32u);

        }
        -[NSObject setPlayState:manually:source:](v5, "setPlayState:manually:source:", 0, 1, 6);
        -[NSObject setBackCatalog:](v5, "setBackCatalog:", 1);
        -[NSObject setMetadataTimestamp:](v5, "setMetadataTimestamp:", 0.0);
        -[NSObject setMetadataFirstSyncEligible:](v5, "setMetadataFirstSyncEligible:", 0);
      }
      else
      {
        if (v18)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v5, "uuid"));
          v32 = -[NSObject sentNotification](v5, "sentNotification");
          v33 = -[MTPodcast importing](self->_localPodcast, "importing");
          -[NSObject metadataTimestamp](v5, "metadataTimestamp");
          v42 = 138544898;
          v43 = v29;
          v44 = 2112;
          v45 = v30;
          v46 = 2114;
          v47 = v31;
          v48 = 1024;
          v49 = v32;
          v50 = 1024;
          v51 = v12;
          v52 = 1024;
          v53 = v33;
          v54 = 2048;
          v55 = v34;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ New feed episode already has a metadataTimestamp. Setting isNew to false. %{public}@, sentNotification: %d, isEpisodePublishedBeforeAddedDate: %d, podcastIsImporting: %d, metadataTimestamp: %f", (uint8_t *)&v42, 0x3Cu);

        }
        -[NSObject setIsNew:](v5, "setIsNew:", 0);
      }
      -[NSObject suppressAutomaticDownloadsIfNeeded](v5, "suppressAutomaticDownloadsIfNeeded");
    }
    v35 = _MTLogCategoryFeedUpdateIngester(-[NSObject setEpisodeLevel:](v5, "setEpisodeLevel:", +[MTEpisodeLevelCalculator uncalculatedLevel](MTEpisodeLevelCalculator, "uncalculatedLevel")));
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v5, "uuid"));
      v40 = -[NSObject sentNotification](v5, "sentNotification");
      v42 = 138544130;
      v43 = v37;
      v44 = 2112;
      v45 = v38;
      v46 = 2114;
      v47 = v39;
      v48 = 1024;
      v49 = v40;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ new episode %{public}@, sentNotification: %d", (uint8_t *)&v42, 0x26u);

    }
    ++self->_itemsInserted;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedIngester _unsafeIngestEpisode:localEpisode:isNew:](self, "_unsafeIngestEpisode:localEpisode:isNew:", v4, v5, 1));
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodeStoreId"));
    v25 = objc_msgSend(v24, "longLongValue");

    v26 = ((uint64_t (*)(void))_MTLogCategoryFeedUpdateIngester)();
    v5 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v25));
      v42 = 138412290;
      v43 = v27;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ - could not ingest new feed episode because ingester local podcast does not exist", (uint8_t *)&v42, 0xCu);

    }
    v28 = 0;
  }

  return v28;
}

- (id)unsafeIngestEpisode:(id)a3 localEpisode:(id)a4
{
  return -[MTFeedIngester _unsafeIngestEpisode:localEpisode:isNew:](self, "_unsafeIngestEpisode:localEpisode:isNew:", a3, a4, 0);
}

- (id)_unsafeIngestEpisode:(id)a3 localEpisode:(id)a4 isNew:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t updated;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  MTFeedIngester *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id v69;
  char *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSMutableSet *updatedEpisodeUUIDs;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  id v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  updated = _MTLogCategoryFeedUpdateIngester(v9);
  v11 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "podcast"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "podcast"));
    v88 = v8;
    v15 = self;
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    *(_DWORD *)buf = 138544130;
    v90 = v13;
    v91 = 2112;
    v92 = v17;
    v93 = 2114;
    v94 = v18;
    v95 = 2112;
    v96 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updating episode %{public}@ - %@", buf, 0x2Au);

    v5 = v16;
    self = v15;
    v8 = v88;

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "podcast"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
  v23 = objc_msgSend(v21, "isEqualToString:", v22);

  if ((v23 & 1) != 0)
  {
    -[MTFeedIngester _setAttributesOfLocalEpisode:feedEpisode:](self, "_setAttributesOfLocalEpisode:feedEpisode:", v9, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self->_localPodcast, "channel"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self->_localPodcast, "channel"));
      v27 = objc_msgSend(v26, "subscriptionActive");

    }
    else
    {
      v27 = 0;
    }
    v37 = objc_msgSend(v9, "isEntitled");
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "priceType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enclosureURL"));
    objc_msgSend(v8, "entitledDuration");
    if (v39 > 0.0)
    {
      objc_msgSend(v8, "entitledDuration");
      objc_msgSend(v9, "setEntitledDuration:");
    }
    objc_msgSend(v8, "duration");
    if (v40 > 0.0)
    {
      objc_msgSend(v8, "duration");
      objc_msgSend(v9, "setFreeDuration:");
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledEnclosureURL"));
    objc_msgSend(v9, "setEntitledEnclosureURL:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolvedEnclosureUrl"));
    objc_msgSend(v9, "setFreeEnclosureURL:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "priceType"));
    objc_msgSend(v9, "setFreePriceType:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledPriceType"));
    objc_msgSend(v9, "setEntitledPriceType:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledTranscriptIdentifier"));
    objc_msgSend(v9, "setEntitledTranscriptIdentifier:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freeTranscriptIdentifier"));
    objc_msgSend(v9, "setFreeTranscriptIdentifier:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledTranscriptSnippet"));
    objc_msgSend(v9, "setEntitledTranscriptSnippet:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freeTranscriptSnippet"));
    objc_msgSend(v9, "setFreeTranscriptSnippet:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledTranscriptProvider"));
    objc_msgSend(v9, "setEntitledTranscriptProvider:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freeTranscriptProvider"));
    objc_msgSend(v9, "setFreeTranscriptProvider:", v50);

    if (v27)
    {
      objc_msgSend(v8, "entitledDuration");
      if (v51 > 0.0)
      {
        objc_msgSend(v8, "entitledDuration");
        objc_msgSend(v9, "setDuration:");
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledEnclosureURL"));

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledEnclosureURL"));
        objc_msgSend(v9, "setEnclosureURL:", v53);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledPriceType"));
      objc_msgSend(v9, "setPriceType:", v54);

      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitledTranscriptIdentifier"));
    }
    else
    {
      objc_msgSend(v9, "freeDuration");
      if (v56 > 0.0)
      {
        objc_msgSend(v9, "freeDuration");
        objc_msgSend(v9, "setDuration:");
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freeEnclosureURL"));
      objc_msgSend(v9, "setEnclosureURL:", v57);

      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freePriceType"));
      objc_msgSend(v9, "setPriceType:", v58);

      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freeTranscriptIdentifier"));
    }
    v59 = (void *)v55;
    objc_msgSend(v9, "setTranscriptIdentifier:", v55);

    -[MTFeedIngester _handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:isNewEpisodeToCurrentDevice:oldIsEntitled:oldEnclosureURL:oldPriceType:](self, "_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:isNewEpisodeToCurrentDevice:oldIsEntitled:oldEnclosureURL:oldPriceType:", v9, v5, v37, v38, v29);
    if (v5)
    {
      v60 = _MTLogCategoryFeedUpdateIngester(objc_msgSend(v9, "updateEntitlementState"));
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
        v63 = objc_msgSend(v9, "entitlementState");
        *(_DWORD *)buf = 138543618;
        v90 = v62;
        v91 = 2048;
        v92 = v63;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ - set entitlement state for inserted episode to %lld for new episode from unsafeIngestEpisode", buf, 0x16u);

      }
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pubDate"));
    objc_msgSend(v64, "timeIntervalSinceReferenceDate");
    v66 = v65;
    -[MTPodcast addedDate](self->_localPodcast, "addedDate");
    v68 = v67;

    if (v5 && v66 >= v68)
    {
      if (objc_msgSend(v9, "isEntitled"))
      {
        v69 = -[MTPodcast isDark](self->_localPodcast, "isDark");
        v70 = (char *)-[MTPodcast darkCount](self->_localPodcast, "darkCount") + 1;
        -[MTPodcast setDarkCount:](self->_localPodcast, "setDarkCount:", v70);
        -[MTPodcast setDarkCountLocal:](self->_localPodcast, "setDarkCountLocal:", v70);
        -[MTPodcast markPlaylistsForUpdate](self->_localPodcast, "markPlaylistsForUpdate");
        if ((_DWORD)v69 != -[MTPodcast isDark](self->_localPodcast, "isDark"))
        {
          v71 = -[MTPodcast isDark](self->_localPodcast, "isDark");
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast latestExitFromDarkDownloads](self->_localPodcast, "latestExitFromDarkDownloads"));
          if (v72)
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v69, v71, 2, v72));
          }
          else
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v69, v71, 2, v74));

          }
          v75 = (void *)objc_opt_new(PFCoreAnalyticsChannel);
          objc_msgSend(v75, "sendEvent:", v73);

        }
      }
    }
    objc_msgSend(v9, "resolveAvailabilityDate");
    objc_msgSend(v9, "firstTimeAvailable");
    v77 = v76;
    -[MTFeedIngester latestEpisodeDate](self, "latestEpisodeDate");
    if (v77 > v78 && objc_msgSend(v9, "isMedia"))
    {
      objc_msgSend(v9, "firstTimeAvailable");
      self->_latestEpisodeDate = v79;
    }
    updatedEpisodeUUIDs = self->_updatedEpisodeUUIDs;
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
    -[NSMutableSet addObject:](updatedEpisodeUUIDs, "addObject:", v81);

    v83 = _MTLogCategoryFeedUpdateIngester(v82);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      *(_DWORD *)buf = 138543874;
      v90 = v85;
      v91 = 2112;
      v92 = v86;
      v93 = 1024;
      LODWORD(v94) = v5;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updated episode from feed - isNew %x", buf, 0x1Cu);

    }
    ++self->_itemsIngested;
    v36 = v9;

  }
  else
  {
    v28 = _MTLogCategoryFeedUpdateIngester(v24);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "podcast"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uuid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "podcast"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "title"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
      *(_DWORD *)buf = 138544130;
      v90 = v31;
      v91 = 2112;
      v92 = v33;
      v93 = 2114;
      v94 = v34;
      v95 = 2112;
      v96 = v35;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ - %@ podcast for episode does not match podcast for ingester %{public}@ - %@", buf, 0x2Au);

    }
    v36 = 0;
  }

  return v36;
}

- (void)unsafeDeleteFeedDeletedEpisode:(id)a3
{
  id v4;
  uint64_t updated;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  updated = _MTLogCategoryFeedUpdateIngester(v4);
  v6 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ deleting episode removed from feed %{public}@ - %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_msgSend(v4, "setFeedDeleted:", 1);
  self->_shouldMarkPlaylistsForUpdate = 1;
  ++self->_itemsDeleted;

}

- (BOOL)unsafeIngestShow:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  MTPodcast *localPodcast;
  void *v27;
  void *v28;
  void *v29;
  MTPodcast *v30;
  void *v31;
  void *v32;
  MTPodcast *v33;
  void *v34;
  void *v35;
  MTPodcast *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  _BOOL4 v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t updated;
  BOOL v49;
  unsigned int v50;
  MTPodcast *v51;
  void *v52;
  MTPodcast *v53;
  void *v54;
  MTPodcast *v55;
  void *v56;
  MTPodcast *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSMutableOrderedSet *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  void *i;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  NSOrderedSet *v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  void *j;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  void *v109;
  id v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t buf[4];
  id v126;
  __int16 v127;
  NSObject *v128;
  __int16 v129;
  void *v130;

  v4 = a3;
  if (!v4)
  {
    v45 = _MTLogCategoryFeedUpdate(0);
    v8 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      *(_DWORD *)buf = 138543362;
      v126 = v46;
      v47 = "%{public}@ failed to update because feed was nil";
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v47, buf, 0xCu);

    }
LABEL_28:
    v49 = 0;
    goto LABEL_71;
  }
  v5 = -[MTFeedIngester _localPodcastExists](self, "_localPodcastExists");
  if (!v5)
  {
    updated = _MTLogCategoryFeedUpdateIngester(v5);
    v8 = objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastStoreId"));
      *(_DWORD *)buf = 138412290;
      v126 = v46;
      v47 = "%@ - could not ingest feed podcast because ingester local podcast does not exist";
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastStoreId"));
  v7 = objc_msgSend(v6, "longLongValue");

  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v7))
    -[MTPodcast setStoreCollectionId:](self->_localPodcast, "setStoreCollectionId:", v7);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedFeedURL"));
  if (+[MTDBUtil isSupportedUrlString:](MTDBUtil, "isSupportedUrlString:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast currentFeedURL](self->_localPodcast, "currentFeedURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
    v11 = -[NSObject isEqualToString:](v8, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v13 = _MTLogCategoryFeedUpdateIngester(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast currentFeedURL](self->_localPodcast, "currentFeedURL"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
        *(_DWORD *)buf = 134218498;
        v126 = v7;
        v127 = 2112;
        v128 = v8;
        v129 = 2112;
        v130 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%lld Found different updatedFeedURL %@ from %@", buf, 0x20u);

      }
      -[MTPodcast setUpdatedFeedURL:](self->_localPodcast, "setUpdatedFeedURL:", v8);
      self->_didUpdateFeedUrl = 1;
    }
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedFeedURL"));
  if (-[NSObject length](v17, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast currentFeedURL](self->_localPodcast, "currentFeedURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
    v20 = -[NSObject isEqualToString:](v17, "isEqualToString:", v19);

    if ((v20 & 1) == 0)
    {
      v22 = _MTLogCategoryFeedUpdateIngester(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast currentFeedURL](self->_localPodcast, "currentFeedURL"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "absoluteString"));
        *(_DWORD *)buf = 134218498;
        v126 = v7;
        v127 = 2112;
        v128 = v17;
        v129 = 2112;
        v130 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%lld Found different feedURL %@ from %@", buf, 0x20u);

      }
      -[MTPodcast setUpdatedFeedURL:](self->_localPodcast, "setUpdatedFeedURL:", v17);
      self->_didUpdateFeedUrl = 1;
    }
  }
  localPodcast = self->_localPodcast;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByStrippingHTML"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByRemovingNewlineCharacters"));
  -[MTPodcast setTitle:](localPodcast, "setTitle:", v29);

  v30 = self->_localPodcast;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByStrippingHTML"));
  -[MTPodcast setAuthor:](v30, "setAuthor:", v32);

  v33 = self->_localPodcast;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByStrippingHTML"));
  -[MTPodcast setProvider:](v33, "setProvider:", v35);

  -[MTPodcast setIsExplicit:](self->_localPodcast, "setIsExplicit:", objc_msgSend(v4, "isExplicit"));
  v36 = self->_localPodcast;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedDescription"));
  -[MTPodcast setItemDescription:](v36, "setItemDescription:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "showType"));
  v39 = +[MTPodcast showTypeFromString:](MTPodcast, "showTypeFromString:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast showTypeInFeed](self->_localPodcast, "showTypeInFeed"));
  v41 = +[MTPodcast showTypeFromString:](MTPodcast, "showTypeFromString:", v40);

  v43 = v39 == (id)2 && v41 != (id)2;
  v44 = v39 == (id)1 && -[MTPodcast showTypeSetting](self->_localPodcast, "showTypeSetting") == (id)2;
  v50 = -[MTPodcast subscribed](self->_localPodcast, "subscribed");
  -[MTPodcast setShowTypeInFeed:](self->_localPodcast, "setShowTypeInFeed:", v38);
  if (((v50 ^ 1 | v43) & 1) != 0 || v44)
    -[MTPodcast setShowTypeSetting:](self->_localPodcast, "setShowTypeSetting:", v39);
  v51 = self->_localPodcast;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  -[MTPodcast setCategory:](v51, "setCategory:", v52);

  v53 = self->_localPodcast;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webpageURL"));
  -[MTPodcast setWebpageURL:](v53, "setWebpageURL:", v54);

  v55 = self->_localPodcast;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareURL"));
  -[MTPodcast setStoreCleanURL:](v55, "setStoreCleanURL:", v56);

  v57 = self->_localPodcast;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "showSpecificUpsellCopy"));
  -[MTPodcast setShowSpecificUpsellCopy:](v57, "setShowSpecificUpsellCopy:", v58);

  -[MTPodcast setOfferTypes:](self->_localPodcast, "setOfferTypes:", objc_msgSend((id)objc_opt_class(self), "_offerTypesAsFlagBits:", v4));
  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayType"));
  if (v59)
  {
    v60 = (void *)v59;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayType"));
    v62 = objc_msgSend(v61, "isNotEmpty");

    if (v62)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayType"));
      -[MTPodcast setDisplayType:](self->_localPodcast, "setDisplayType:", v63);

    }
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channelItem"));

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channelItem"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[MTChannel createOrFindChannelFromFeedChannelItem:personalizedRequest:context:](MTChannel, "createOrFindChannelFromFeedChannelItem:personalizedRequest:context:", v65, 0, self->_ctx));

    -[MTPodcast setChannel:](self->_localPodcast, "setChannel:", v66);
  }
  else
  {
    -[MTPodcast setChannel:](self->_localPodcast, "setChannel:", 0);
  }
  -[MTFeedIngester _setPodcastArtwork:](self, "_setPodcastArtwork:", v4);
  v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categories"));
  if (v67
    && (v68 = (void *)v67,
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categories")),
        v70 = objc_msgSend(v69, "count"),
        v69,
        v68,
        v70))
  {
    v112 = v38;
    v113 = v17;
    v114 = v8;
    v71 = _MTLogCategoryFeedUpdateIngester(v67);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categories"));
      v75 = objc_msgSend(v74, "count");
      *(_DWORD *)buf = 138543618;
      v126 = v73;
      v127 = 2048;
      v128 = v75;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ - Ingesting %lu categories.", buf, 0x16u);

    }
    v76 = objc_opt_new(NSMutableOrderedSet);
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v111 = v4;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categories"));
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v79; i = (char *)i + 1)
        {
          if (*(_QWORD *)v120 != v80)
            objc_enumerationMutation(v77);
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[MTCategoryIngesterProtocol unsafeIngestFeedCategory:ctx:](self->_categoryIngester, "unsafeIngestFeedCategory:ctx:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i), self->_ctx));
          if (v82)
          {
            -[NSMutableOrderedSet addObject:](v76, "addObject:", v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "podcasts"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "setByAddingObject:", self->_localPodcast));
            objc_msgSend(v82, "setPodcasts:", v84);

            v86 = _MTLogCategoryFeedUpdateIngester(v85);
            v87 = objc_claimAutoreleasedReturnValue(v86);
            if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              goto LABEL_54;
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
            v89 = objc_msgSend(v82, "adamID");
            *(_DWORD *)buf = 138543618;
            v126 = v88;
            v127 = 2048;
            v128 = v89;
            v90 = v87;
            v91 = "%{public}@ - Related category to show. Category ID: %llu";
          }
          else
          {
            v92 = _MTLogCategoryFeedUpdateIngester(0);
            v87 = objc_claimAutoreleasedReturnValue(v92);
            if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              goto LABEL_54;
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
            v93 = objc_msgSend(0, "adamID");
            *(_DWORD *)buf = 138543618;
            v126 = v88;
            v127 = 2048;
            v128 = v93;
            v90 = v87;
            v91 = "%{public}@ - Could not ingest category for show. Category ID: %llu";
          }
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, v91, buf, 0x16u);

LABEL_54:
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
      }
      while (v79);
    }

    -[MTPodcast setCategories:](self->_localPodcast, "setCategories:", v76);
    v4 = v111;
  }
  else
  {
    v94 = _MTLogCategoryFeedUpdateIngester(v67);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      *(_DWORD *)buf = 138543362;
      v126 = v96;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%{public}@ - Show has no categories. Disassociating categories if needed.", buf, 0xCu);

    }
    v97 = objc_opt_new(NSOrderedSet);
    -[MTPodcast setCategories:](self->_localPodcast, "setCategories:", v97);

    v76 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext unsafeCategoriesWithRelationshipToPodcastAdamID:](self->_ctx, "unsafeCategoriesWithRelationshipToPodcastAdamID:", -[MTPodcast storeCollectionId](self->_localPodcast, "storeCollectionId")));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v98 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    if (!v98)
      goto LABEL_68;
    v99 = v98;
    v112 = v38;
    v113 = v17;
    v114 = v8;
    v100 = v4;
    v101 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v99; j = (char *)j + 1)
      {
        if (*(_QWORD *)v116 != v101)
          objc_enumerationMutation(v76);
        v103 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)j);
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "podcasts"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v104));

        objc_msgSend(v105, "removeObject:", self->_localPodcast);
        objc_msgSend(v103, "setPodcasts:", v105);

      }
      v99 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    }
    while (v99);
    v4 = v100;
  }
  v17 = v113;
  v8 = v114;
  v38 = v112;
LABEL_68:

  v107 = _MTLogCategoryFeedUpdateIngester(v106);
  v108 = objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    *(_DWORD *)buf = 138543362;
    v126 = v109;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%{public}@ - updated podcast from feed", buf, 0xCu);

  }
  v49 = 1;
LABEL_71:

  return v49;
}

- (void)unsafeIngestPage
{
  MTPodcast *localPodcast;
  double latestEpisodeDate;
  double v5;
  uint64_t updated;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  -[MTFeedIngester _reportMetrics](self, "_reportMetrics");
  localPodcast = self->_localPodcast;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[MTPodcast setUpdatedDate:](localPodcast, "setUpdatedDate:");
  -[MTPodcast setConsecutiveFeedFetchErrors:](self->_localPodcast, "setConsecutiveFeedFetchErrors:", 0);
  latestEpisodeDate = self->_latestEpisodeDate;
  -[MTPodcast feedChangedDate](self->_localPodcast, "feedChangedDate");
  if (latestEpisodeDate > v5)
    -[MTPodcast setFeedChangedDate:](self->_localPodcast, "setFeedChangedDate:", self->_latestEpisodeDate);
  updated = _MTLogCategoryFeedUpdateIngester(-[MTFeedIngester _updatePodcastArtworksIfNeeded](self, "_updatePodcastArtworksIfNeeded"));
  v7 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - finished ingestion of page of podcast from feed", (uint8_t *)&v9, 0xCu);

  }
}

- (void)unsafeFinalizeIngestion
{
  -[MTFeedIngester unsafeIngestPage](self, "unsafeIngestPage");
  if (self->_shouldMarkPlaylistsForUpdate)
    -[MTPodcast markPlaylistsForUpdate](self->_localPodcast, "markPlaylistsForUpdate");
  +[MTFeedIngester _unsafeFinalizeIngestion:episodeLevelCalculator:storeInfoUpdater:updateAverageCalculator:ctx:didUpdateAnyEpisodes:newlyEntitledEpisodeUUIDs:](MTFeedIngester, "_unsafeFinalizeIngestion:episodeLevelCalculator:storeInfoUpdater:updateAverageCalculator:ctx:didUpdateAnyEpisodes:newlyEntitledEpisodeUUIDs:", self->_localPodcast, self->_episodeLevelCalculator, self->_storeInfoUpdater, self->_updateAverageCalculator, self->_ctx, -[NSMutableSet count](self->_updatedEpisodeUUIDs, "count") != 0, self->_newlyEntitledEpisodeUUIDs);
}

+ (void)_unsafeFinalizeIngestion:(id)a3 episodeLevelCalculator:(id)a4 storeInfoUpdater:(id)a5 updateAverageCalculator:(id)a6 ctx:(id)a7 didUpdateAnyEpisodes:(BOOL)a8 newlyEntitledEpisodeUUIDs:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t updated;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = v19;
  if (v9)
  {
    +[MTFeedIngester _recalculateEpisodeLevel:episodeLevelCalculator:ctx:](MTFeedIngester, "_recalculateEpisodeLevel:episodeLevelCalculator:ctx:", v14, v15, v18);
  }
  else
  {
    v21 = _MTLogCategoryFeedUpdate(v19);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
      *(_DWORD *)buf = 138543362;
      v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@ - no episodes processed, skipping episode level recalculation", buf, 0xCu);

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "newestEpisodeByAvailabiltyTime"));
  updated = _MTLogCategoryFeedUpdateIngester(v24);
  v26 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    v41 = v15;
    v42 = v16;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    v29 = v20;
    v30 = v18;
    v31 = v17;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uuid"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "title"));
    v34 = objc_msgSend(v24, "storeTrackId");
    *(_DWORD *)buf = 138544386;
    v44 = v27;
    v45 = 2112;
    v46 = v28;
    v47 = 2114;
    v48 = v32;
    v49 = 2112;
    v50 = v33;
    v51 = 2048;
    v52 = v34;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking latest episode as unplayed if needed %{public}@ - %@ - %lld", buf, 0x34u);

    v17 = v31;
    v18 = v30;
    v20 = v29;

    v15 = v41;
    v16 = v42;

  }
  +[MTFeedIngester _markLatestEpisodeAsUnplayedIfNeeded:latestEpisodeInPodcast:](MTFeedIngester, "_markLatestEpisodeAsUnplayedIfNeeded:latestEpisodeInPodcast:", v14, v24);
  +[MTFeedIngester _sendNotificationForNewlyEntitledEpisodesIfNeeded:latestEpisodeInPodcast:newlyEntitledEpisodeUUIDs:ctx:](MTFeedIngester, "_sendNotificationForNewlyEntitledEpisodesIfNeeded:latestEpisodeInPodcast:newlyEntitledEpisodeUUIDs:ctx:", v14, v24, v20, v18);
  objc_msgSend(v24, "firstTimeAvailable");
  objc_msgSend(v14, "setLatestEpisodeAvailabilityTime:");
  objc_msgSend(v14, "setAuthenticatedDark:", 0);
  objc_msgSend(v14, "setFeedUpdateNeedsRetry:", 0);
  if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", objc_msgSend(v14, "storeCollectionId")))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    objc_msgSend(v16, "updateStoreInfoForPodcast:", v35);

  }
  v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "latestExitFromDarkDownloads"));
  v37 = v36;
  if (v36)
    v36 = objc_msgSend(v14, "suppressEpisodesWithBasisDate:", v36);
  v38 = _MTLogCategoryFeedUpdateIngester(v36);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    *(_DWORD *)buf = 138543362;
    v44 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ - finished ingestion of podcast from feed", buf, 0xCu);

  }
}

- (BOOL)_localPodcastExists
{
  MTPodcast *localPodcast;
  uint64_t updated;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;

  localPodcast = self->_localPodcast;
  if (localPodcast)
  {
    localPodcast = (MTPodcast *)-[MTPodcast isDeleted](localPodcast, "isDeleted");
    if (!(_DWORD)localPodcast)
      return 1;
  }
  updated = _MTLogCategoryFeedUpdateIngester(localPodcast);
  v5 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ - local podcast was deleted. Cannot ingest", (uint8_t *)&v8, 0xCu);

  }
  return 0;
}

- (void)_setAttributesOfLocalEpisode:(id)a3 feedEpisode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;

  v55 = a3;
  v6 = a4;
  objc_msgSend(v55, "setFeedDeleted:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
  objc_msgSend(v55, "setGuid:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeStoreId"));
  v9 = objc_msgSend(v8, "longLongValue");

  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v9))
    objc_msgSend(v55, "setStoreTrackId:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByStrippingHTML"));

  objc_msgSend(v55, "setTitle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itunesTitle"));
  objc_msgSend(v55, "setItunesTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedIngester configuration](self, "configuration"));
  LODWORD(v12) = objc_msgSend(v13, "usesCleanEpisodeTitles");

  if ((_DWORD)v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "podcast"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cleanedTitleStringWithPrefix:", v15));
    objc_msgSend(v55, "setCleanedTitle:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemDescription"));
  objc_msgSend(v55, "setItemDescription:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemSummary"));
  objc_msgSend(v55, "setItunesSubtitle:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
  objc_msgSend(v55, "setAuthor:", v19);

  objc_msgSend(v55, "setByteSize:", objc_msgSend(v6, "byteSize"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uti"));
  objc_msgSend(v55, "setUti:", v20);

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pubDate"));
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v55, "pubDate");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pubDate"));
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    v27 = v26;

    if (v24 != v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pubDate"));
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      objc_msgSend(v55, "setPubDate:");

    }
  }
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstTimeAvailableAsPaid"));
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v55, "firstTimeAvailableAsPaid");
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstTimeAvailableAsPaid"));
    objc_msgSend(v33, "timeIntervalSinceReferenceDate");
    v35 = v34;

    if (v32 != v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstTimeAvailableAsPaid"));
      objc_msgSend(v36, "timeIntervalSinceReferenceDate");
      objc_msgSend(v55, "setFirstTimeAvailableAsPaid:");

    }
  }
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstTimeAvailableAsFree"));
  if (v37)
  {
    v38 = (void *)v37;
    objc_msgSend(v55, "firstTimeAvailableAsFree");
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstTimeAvailableAsFree"));
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    v43 = v42;

    if (v40 != v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstTimeAvailableAsFree"));
      objc_msgSend(v44, "timeIntervalSinceReferenceDate");
      objc_msgSend(v55, "setFirstTimeAvailableAsFree:");

    }
  }
  if (objc_msgSend(v6, "trackNum"))
    objc_msgSend(v55, "setTrackNum:", objc_msgSend(v6, "trackNum"));
  objc_msgSend(v55, "setExplicit:", objc_msgSend(v6, "isExplicit"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeType"));
  objc_msgSend(v55, "setEpisodeType:", v45);

  v46 = objc_msgSend(v55, "episodeNumber");
  if (v46 != objc_msgSend(v6, "episodeNumber"))
    objc_msgSend(v55, "setEpisodeNumber:", objc_msgSend(v6, "episodeNumber"));
  v47 = objc_msgSend(v55, "seasonNumber");
  if (v47 != objc_msgSend(v6, "seasonNumber"))
    objc_msgSend(v55, "setSeasonNumber:", objc_msgSend(v6, "seasonNumber"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webpageURL"));
  objc_msgSend(v55, "setWebpageURL:", v48);

  objc_msgSend(v55, "setIsHidden:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkTemplateURL"));
  objc_msgSend(v55, "setArtworkTemplateURL:", v49);

  objc_msgSend(v6, "artworkWidth");
  objc_msgSend(v55, "setArtworkWidth:");
  objc_msgSend(v6, "artworkHeight");
  objc_msgSend(v55, "setArtworkHeight:");
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkBackgroundColor"));
  objc_msgSend(v55, "setArtworkBackgroundColor:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkTextPrimaryColor"));
  objc_msgSend(v55, "setArtworkTextPrimaryColor:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkTextSecondaryColor"));
  objc_msgSend(v55, "setArtworkTextSecondaryColor:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkTextTertiaryColor"));
  objc_msgSend(v55, "setArtworkTextTertiaryColor:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkTextQuaternaryColor"));
  objc_msgSend(v55, "setArtworkTextQuaternaryColor:", v54);

}

- (void)_setPodcastArtwork:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t updated;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageURL"));
  if (objc_msgSend(v5, "length"))
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageURL"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "globalImageURL"));
  v7 = (void *)v6;

  if (objc_msgSend((id)objc_opt_class(self), "_fetchSmallestPicturePossible"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTResizedArtworkURLProvider sharedInstance](MTResizedArtworkURLProvider, "sharedInstance"));
    v9 = objc_msgSend(v8, "resizedArtworkURLString:withDimension:", v7, objc_msgSend((id)objc_opt_class(self), "_maxArtworkSize"));
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v7 = (void *)v10;
  }
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self->_localPodcast, "imageURL"));
    v12 = objc_msgSend(v11, "isEqualToString:", v7);

    if ((v12 & 1) == 0)
    {
      updated = _MTLogCategoryFeedUpdateIngester(v13);
      v15 = objc_claimAutoreleasedReturnValue(updated);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
        v31 = 138543874;
        v32 = v16;
        v33 = 2112;
        v34 = v17;
        v35 = 2112;
        v36 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ artwork url did change %@", (uint8_t *)&v31, 0x20u);

      }
      -[MTPodcast setNeedsArtworkUpdate:](self->_localPodcast, "setNeedsArtworkUpdate:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[PUIFeedManagerArtworkBridge shared](PUIFeedManagerArtworkBridge, "shared"));
      objc_msgSend(v18, "invalidateArtworkForPodcast:", self->_localPodcast);

    }
  }
  -[MTPodcast setImageURL:](self->_localPodcast, "setImageURL:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkTemplateURL"));
  -[MTPodcast setArtworkTemplateURL:](self->_localPodcast, "setArtworkTemplateURL:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkPrimaryColor"));
  -[MTPodcast setArtworkPrimaryColor:](self->_localPodcast, "setArtworkPrimaryColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkTextPrimaryColor"));
  -[MTPodcast setArtworkTextPrimaryColor:](self->_localPodcast, "setArtworkTextPrimaryColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkTextSecondaryColor"));
  -[MTPodcast setArtworkTextSecondaryColor:](self->_localPodcast, "setArtworkTextSecondaryColor:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkTextTertiaryColor"));
  -[MTPodcast setArtworkTextTertiaryColor:](self->_localPodcast, "setArtworkTextTertiaryColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkTextQuaternaryColor"));
  -[MTPodcast setArtworkTextQuaternaryColor:](self->_localPodcast, "setArtworkTextQuaternaryColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uberBackgroundImageURL"));
  -[MTPodcast setUberBackgroundImageURL:](self->_localPodcast, "setUberBackgroundImageURL:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uberBackgroundJoeColor"));
  -[MTPodcast setUberBackgroundJoeColor:](self->_localPodcast, "setUberBackgroundJoeColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uberArtworkTextPrimaryColor"));
  -[MTPodcast setUberArtworkTextPrimaryColor:](self->_localPodcast, "setUberArtworkTextPrimaryColor:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uberArtworkTextSecondaryColor"));
  -[MTPodcast setUberArtworkTextSecondaryColor:](self->_localPodcast, "setUberArtworkTextSecondaryColor:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uberArtworkTextTertiaryColor"));
  -[MTPodcast setUberArtworkTextTertiaryColor:](self->_localPodcast, "setUberArtworkTextTertiaryColor:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uberArtworkTextQuaternaryColor"));
  -[MTPodcast setUberArtworkTextQuaternaryColor:](self->_localPodcast, "setUberArtworkTextQuaternaryColor:", v30);

}

- (void)_reportMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[8];

  v23 = +[MTFeedUpdateMetricsDataKey newEpisodeCount](MTFeedUpdateMetricsDataKey, "newEpisodeCount");
  v28[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_itemsInserted));
  v29[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey deletedEpisodeCount](MTFeedUpdateMetricsDataKey, "deletedEpisodeCount"));
  v28[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_itemsDeleted));
  v29[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey updatedEpisodeCount](MTFeedUpdateMetricsDataKey, "updatedEpisodeCount"));
  v28[2] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_itemsIngested - self->_itemsInserted));
  v29[2] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey totalEpisodeCount](MTFeedUpdateMetricsDataKey, "totalEpisodeCount"));
  v28[3] = v17;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_itemsDeleted + self->_itemsIngested));
  v29[3] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey podcastStoreId](MTFeedUpdateMetricsDataKey, "podcastStoreId"));
  v28[4] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MTPodcast storeCollectionId](self->_localPodcast, "storeCollectionId")));
  v29[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey source](MTFeedUpdateMetricsDataKey, "source"));
  v28[5] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_feedUpdateSource));
  v29[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey eventId](MTFeedUpdateMetricsDataKey, "eventId"));
  v28[6] = v8;
  v29[6] = self->_updaterJobUUID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey updaterType](MTFeedUpdateMetricsDataKey, "updaterType"));
  v28[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataUpdaterValue sync](MTFeedUpdateMetricsDataUpdaterValue, "sync"));
  v29[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 8));

  v13 = _MTLogCategoryFeedUpdate(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    *(_DWORD *)buf = 138543618;
    v25 = v15;
    v26 = 2112;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - processed feed page and found new episodes: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction pageParser](MTFeedUpdateMetricsAction, "pageParser"));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", v16, 0, v11);

}

+ (void)_recalculateEpisodeLevel:(id)a3 episodeLevelCalculator:(id)a4 ctx:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t updated;
  NSObject *v15;
  int v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  v11 = (void *)v10;
  if (v10)
  {
    v12 = _MTLogCategoryFeedUpdate(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 138543362;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@ - recalculating episode levels", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v8, "unsafeUpdateEpisodeLevelsWithShowUUID:on:", v11, v9);
  }
  else
  {
    updated = _MTLogCategoryFeedUpdateIngester(0);
    v15 = objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 134217984;
      v17 = objc_msgSend(v7, "storeCollectionId");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%lld - can't process episode levels, uuid missing", (uint8_t *)&v16, 0xCu);
    }

  }
}

+ (void)_markLatestEpisodeAsUnplayedIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  uint64_t updated;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "metadataTimestamp");
    if (fabs(v8) <= 2.22044605e-16)
    {
      v9 = objc_msgSend(v5, "subscribed");
      if ((_DWORD)v9)
      {
        updated = _MTLogCategoryFeedUpdateIngester(v9);
        v11 = objc_claimAutoreleasedReturnValue(updated);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
          v19 = 138544386;
          v20 = v12;
          v21 = 2112;
          v22 = v13;
          v23 = 2114;
          v24 = v14;
          v25 = 2112;
          v26 = v15;
          v27 = 2048;
          v28 = objc_msgSend(v7, "storeTrackId");
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking latest episode as unplayed %{public}@ - %@ - %lld", (uint8_t *)&v19, 0x34u);

        }
        +[MTFeedIngester _markEpisodeAsFirstSeen:](MTFeedIngester, "_markEpisodeAsFirstSeen:", v7);
        objc_msgSend(v7, "setPlayState:manually:source:", 2, 0, 6);
        objc_msgSend(v7, "setMetadataTimestamp:", 0.0);
        objc_msgSend(v7, "setMetadataFirstSyncEligible:", 1);
      }
    }
  }
  else
  {
    v16 = _MTLogCategoryFeedUpdate(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v19 = 138543362;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ - Could not get the latest episode. Not marking anything as unplayed.", (uint8_t *)&v19, 0xCu);

    }
  }

}

+ (void)_sendNotificationForNewlyEntitledEpisodesIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 ctx:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t updated;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  NSObject *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  unsigned int v49;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:ctx:](MTRecencyUtil, "upNextForPodcastUuid:ctx:", v13, v14));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "episodeUuid"));

    if (v16)
      v17 = v16;
    else
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    v19 = v17;
    updated = _MTLogCategoryFeedUpdateIngester(v17);
    v22 = objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
      *(_DWORD *)buf = 138544130;
      v41 = v23;
      v42 = 2112;
      v43 = v24;
      v44 = 2114;
      v45 = v16;
      v46 = 2114;
      v47 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Up Next Episode: %{public}@. Latest Episode: %{public}@", buf, 0x2Au);

    }
    v26 = objc_msgSend(v11, "containsObject:", v19);
    if ((_DWORD)v26)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForUuid:entityName:", v16, kMTEpisodeEntityName));
      v27 = _MTLogCategoryFeedUpdateIngester(v20);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v10;
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
        v31 = objc_claimAutoreleasedReturnValue(-[NSObject uuid](v20, "uuid"));
        v39 = v12;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject title](v20, "title"));
        v33 = -[NSObject isNew](v20, "isNew");
        *(_DWORD *)buf = 138544386;
        v41 = v29;
        v42 = 2112;
        v43 = v30;
        v44 = 2114;
        v45 = v31;
        v46 = 2112;
        v47 = v32;
        v48 = 1024;
        v49 = v33;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found new smart play episode from episode entitlement changed %{public}@ - %@. episode isNew: %d", buf, 0x30u);

        v12 = v39;
        v10 = v38;
      }

      +[MTFeedIngester _markEpisodeAsFirstSeen:](MTFeedIngester, "_markEpisodeAsFirstSeen:", v20);
      -[NSObject setSentNotification:](v20, "setSentNotification:", 0);
    }
    else
    {
      v34 = _MTLogCategoryFeedUpdateIngester(v26);
      v20 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v12;
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
        *(_DWORD *)buf = 138543874;
        v41 = v36;
        v42 = 2112;
        v43 = v37;
        v44 = 2114;
        v45 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Smart Play Episode is not newly entitled. Not setting eligible for notifications: %{public}@.", buf, 0x20u);

        v12 = v35;
      }
    }
    goto LABEL_15;
  }
  v18 = _MTLogCategoryFeedUpdateIngester(0);
  v16 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    *(_DWORD *)buf = 138543618;
    v41 = v19;
    v42 = 2112;
    v43 = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ No newly entitled episodes. Not marking any episodes eligibile for notifications.", buf, 0x16u);
LABEL_15:

  }
}

- (void)_updatePodcastArtworksIfNeeded
{
  id v3;
  uint64_t v4;
  void *v5;
  MTImageStoreProtocol *imageStore;
  void *v7;
  id v8;
  void *v9;
  id v10;
  MTFeedIngesterImageDownloaderProtocol *imageDownloader;
  void *v12;
  uint64_t v13;
  void *v14;
  MTImageStoreProtocol *v15;
  void *v16;
  void *v17;
  id v18;
  MTFeedIngesterImageDownloaderProtocol *v19;
  void *v20;
  uint64_t updated;
  NSObject *v22;
  id v23;
  uint8_t buf[16];

  if (self->_imageStore && self->_imageDownloader)
  {
    v3 = -[MTPodcast requestsAreNonAppInitiated](self->_localPodcast, "requestsAreNonAppInitiated");
    if ((-[MTPodcast needsArtworkUpdate](self->_localPodcast, "needsArtworkUpdate") & 1) != 0
      || (v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"))) != 0
      && (v5 = (void *)v4,
          imageStore = self->_imageStore,
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid")),
          LOBYTE(imageStore) = -[MTImageStoreProtocol hasItemForKey:](imageStore, "hasItemForKey:", v7),
          v7,
          v5,
          (imageStore & 1) == 0))
    {
      v8 = objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self->_localPodcast, "imageURL"));
      v10 = objc_msgSend(v8, "init:nonAppInitiated:", v9, v3);

      imageDownloader = self->_imageDownloader;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      -[MTFeedIngesterImageDownloaderProtocol downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:](imageDownloader, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:", v12, v10, 0, 1);

    }
    v13 = objc_claimAutoreleasedReturnValue(-[MTPodcast uberBackgroundImageURL](self->_localPodcast, "uberBackgroundImageURL"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = self->_imageStore;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uberBackgroundImageURL](self->_localPodcast, "uberBackgroundImageURL"));
      LOBYTE(v15) = -[MTImageStoreProtocol hasItemForKey:](v15, "hasItemForKey:", v16);

      if ((v15 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uberBackgroundImageURL](self->_localPodcast, "uberBackgroundImageURL"));
        v23 = (id)objc_claimAutoreleasedReturnValue(+[PFArtworkFormatter formatArtworkUrlWithString:for:cropCode:fileExtension:](PFArtworkFormatter, "formatArtworkUrlWithString:for:cropCode:fileExtension:", v17, CFSTR("sr"), CFSTR("png"), kMTPreferredShowUberArtworkWidth, kMTPreferredShowUberArtworkHeight));

        v18 = objc_msgSend(objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions), "initWithUrl:nonAppInitiated:", v23, v3);
        v19 = self->_imageDownloader;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uberBackgroundImageURL](self->_localPodcast, "uberBackgroundImageURL"));
        -[MTFeedIngesterImageDownloaderProtocol downloadImageUrl:cacheKey:userInitiated:backgroundFetch:](v19, "downloadImageUrl:cacheKey:userInitiated:backgroundFetch:", v18, v20, 0, 1);

      }
    }
  }
  else
  {
    updated = _MTLogCategoryFeedUpdateIngester(self);
    v22 = objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Image downloader and image store are nil, artwork won't be downloaded", buf, 2u);
    }

  }
}

+ (unint64_t)_maxArtworkSize
{
  return 3000;
}

+ (BOOL)_fetchSmallestPicturePossible
{
  return 0;
}

+ (unint64_t)_offerTypesAsFlagBits:(id)a3
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "offers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "offerTypeAsFlagBit");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_markEpisodeAsFirstSeen:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "unsuppressAutomaticDownloadsIfNeeded");
  objc_msgSend(v3, "setIsNew:", 1);

}

- (void)_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:(id)a3 isNewEpisodeToCurrentDevice:(BOOL)a4 oldIsEntitled:(BOOL)a5 oldEnclosureURL:(id)a6 oldPriceType:(id)a7
{
  int v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  MTFeedIngesterLibraryProtocol *library;
  void *v56;
  void *v57;
  void *v58;
  MTFeedIngesterDownloadManagerProtocol *downloadManager;
  void *v60;
  void *v61;
  void *v62;
  uint64_t updated;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  int v72;
  MTFeedIngester *v73;
  id v74;
  _QWORD v75[4];
  NSObject *v76;
  void *v77;
  void *v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  _BYTE v82[10];
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  unsigned int v93;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "priceType"));
  if (!v15
    || (v16 = (void *)v15,
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosureURL")),
        v17,
        v16,
        !v17))
  {
    updated = _MTLogCategoryFeedUpdateIngester(v15);
    v37 = objc_claimAutoreleasedReturnValue(updated);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "priceType"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosureURL"));
    *(_DWORD *)buf = 138413314;
    v80 = v64;
    v81 = 2112;
    *(_QWORD *)v82 = v65;
    *(_WORD *)&v82[8] = 2112;
    v83 = v14;
    v84 = 2112;
    v85 = v66;
    v86 = 2112;
    v87 = v13;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Nil attribute detected for episode %@. Not handling priceType change. priceType: %@, oldPriceType: %@, enclosureUrl: %@, oldEnclosureUrl: %@", buf, 0x34u);

    goto LABEL_27;
  }
  v74 = v14;
  v18 = _MTLogCategoryFeedUpdateIngester(v15);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "priceType"));
    v73 = self;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosureURL"));
    v69 = objc_msgSend(v12, "entitlementState");
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "podcast"));
    v72 = v9;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "channel"));
    v23 = v10;
    v24 = objc_msgSend(v70, "storeId");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "podcast"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "channel"));
    *(_DWORD *)buf = 138414082;
    v80 = v20;
    v81 = 2112;
    *(_QWORD *)v82 = v21;
    *(_WORD *)&v82[8] = 2112;
    v83 = v74;
    v84 = 2112;
    v85 = v22;
    v86 = 2112;
    v87 = v13;
    v88 = 2048;
    v89 = v69;
    v90 = 2048;
    v91 = v24;
    v10 = v23;
    v92 = 1024;
    v93 = objc_msgSend(v26, "subscriptionActive");
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Handling attributes and redownload on priceType change if needed for episode: %@. priceType: %@, oldPriceType: %@, enclosureUrl: %@, oldEnclosureUrl: %@, oldEntitlementState: %lld, channel: %lld, subscriptionActive: %d", buf, 0x4Eu);

    v9 = v72;
    self = v73;

  }
  v27 = _MTLogCategoryFeedUpdateIngester(objc_msgSend(v12, "updateEntitlementState"));
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v12, "entitlementState");
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    *(_DWORD *)buf = 134218242;
    v80 = v29;
    v81 = 2112;
    *(_QWORD *)v82 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Updated entitlementState to: %lld for episode %@", buf, 0x16u);

  }
  v31 = 0;
  v14 = v74;
  if (!v74 && v10)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "priceType"));
    v31 = v32 != 0;

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "priceType"));
  v34 = objc_msgSend(v33, "isEqualToString:", v74);

  v36 = _MTLogCategoryFeedUpdateIngester(v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  if ((v34 & 1) != 0 || v31)
  {
    if (v38)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      *(_DWORD *)buf = 138412802;
      v80 = v67;
      v81 = 1024;
      *(_DWORD *)v82 = v34;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v31;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "priceType did not actually change for episode %@. priceTypeValueDidNotChange: %d - isNewEpisodeAndPriceTypeDidNotChange: %d", buf, 0x18u);

    }
    goto LABEL_30;
  }
  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "priceType"));
    *(_DWORD *)buf = 138412802;
    v80 = v39;
    v81 = 2112;
    *(_QWORD *)v82 = v74;
    *(_WORD *)&v82[8] = 2112;
    v83 = v40;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PriceType changed for episode uuid %@ from priceType: %@ to %@", buf, 0x20u);

  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "setPriceTypeChangedDate:");
  if (objc_msgSend(v12, "isEntitled"))
  {
    v41 = objc_msgSend(v12, "isEntitled");
    if ((_DWORD)v41 != v9)
    {
      v42 = _MTLogCategoryFeedUpdateIngester(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
        *(_DWORD *)buf = 138412290;
        v80 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Episode %@ is newly entitled.", buf, 0xCu);

      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedIngester newlyEntitledEpisodeUUIDs](self, "newlyEntitledEpisodeUUIDs"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      objc_msgSend(v45, "addObject:", v46);

    }
  }
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosureURL"));
  if ((-[NSObject isEqualToString:](v37, "isEqualToString:", v13) & 1) != 0)
  {
LABEL_30:

    goto LABEL_31;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetURL"));
  v48 = objc_msgSend(v47, "length");

  if (v48)
  {
    v50 = _MTLogCategoryFeedUpdateIngester(v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosureURL"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      *(_DWORD *)buf = 138412546;
      v80 = v52;
      v81 = 2112;
      *(_QWORD *)v82 = v53;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Found new enclosureURL %@ for downloaded asset for episode %@", buf, 0x16u);

    }
    if (self->_downloadManager)
    {
      library = self->_library;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      v78 = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v57));
      -[MTFeedIngesterLibraryProtocol removeDownloadAssetsForEpisodeUuids:](library, "removeDownloadAssetsForEpisodeUuids:", v58);

      downloadManager = self->_downloadManager;
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      v77 = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v61));
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10009A4E4;
      v75[3] = &unk_1004A8C90;
      v76 = v12;
      -[MTFeedIngesterDownloadManagerProtocol restoreDownloadedEpisodes:completion:](downloadManager, "restoreDownloadedEpisodes:completion:", v62, v75);

      v37 = v76;
      goto LABEL_30;
    }
    v68 = _MTLogCategoryFeedUpdateIngester(v54);
    v37 = objc_claimAutoreleasedReturnValue(v68);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    *(_DWORD *)buf = 138412290;
    v80 = v64;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Missing Download Manager. Failed to re-download %@", buf, 0xCu);
LABEL_27:

    goto LABEL_30;
  }
LABEL_31:

}

- (BOOL)didUpdateFeedUrl
{
  return self->_didUpdateFeedUrl;
}

- (void)setDidUpdateFeedUrl:(BOOL)a3
{
  self->_didUpdateFeedUrl = a3;
}

- (double)latestEpisodeDate
{
  return self->_latestEpisodeDate;
}

- (void)setLatestEpisodeDate:(double)a3
{
  self->_latestEpisodeDate = a3;
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (NSMutableSet)newlyEntitledEpisodeUUIDs
{
  return self->_newlyEntitledEpisodeUUIDs;
}

- (NSMutableSet)updatedEpisodeUUIDs
{
  return self->_updatedEpisodeUUIDs;
}

- (BOOL)shouldMarkPlaylistsForUpdate
{
  return self->_shouldMarkPlaylistsForUpdate;
}

- (void)setShouldMarkPlaylistsForUpdate:(BOOL)a3
{
  self->_shouldMarkPlaylistsForUpdate = a3;
}

- (NSManagedObjectContext)ctx
{
  return self->_ctx;
}

- (MTPodcast)localPodcast
{
  return self->_localPodcast;
}

- (MTStoreInfoUpdaterProtocol)storeInfoUpdater
{
  return self->_storeInfoUpdater;
}

- (MTFeedIngesterImageDownloaderProtocol)imageDownloader
{
  return self->_imageDownloader;
}

- (MTImageStoreProtocol)imageStore
{
  return self->_imageStore;
}

- (MTSyncControllerProtocol)syncController
{
  return self->_syncController;
}

- (MTFeedIngesterLibraryProtocol)library
{
  return self->_library;
}

- (MTFeedIngesterDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator
{
  return self->_episodeLevelCalculator;
}

- (MTPodcastUpdateAverageCalculator)updateAverageCalculator
{
  return self->_updateAverageCalculator;
}

- (MTCategoryIngesterProtocol)categoryIngester
{
  return self->_categoryIngester;
}

- (int64_t)feedUpdateSource
{
  return self->_feedUpdateSource;
}

- (void)setFeedUpdateSource:(int64_t)a3
{
  self->_feedUpdateSource = a3;
}

- (NSString)updaterJobUUID
{
  return self->_updaterJobUUID;
}

- (void)setUpdaterJobUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)itemsInserted
{
  return self->_itemsInserted;
}

- (void)setItemsInserted:(int64_t)a3
{
  self->_itemsInserted = a3;
}

- (int64_t)itemsIngested
{
  return self->_itemsIngested;
}

- (void)setItemsIngested:(int64_t)a3
{
  self->_itemsIngested = a3;
}

- (int64_t)itemsDeleted
{
  return self->_itemsDeleted;
}

- (void)setItemsDeleted:(int64_t)a3
{
  self->_itemsDeleted = a3;
}

- (BOOL)canSendNotifications
{
  return self->_canSendNotifications;
}

- (void)setCanSendNotifications:(BOOL)a3
{
  self->_canSendNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updaterJobUUID, 0);
  objc_storeStrong((id *)&self->_categoryIngester, 0);
  objc_storeStrong((id *)&self->_updateAverageCalculator, 0);
  objc_storeStrong((id *)&self->_episodeLevelCalculator, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_imageDownloader, 0);
  objc_storeStrong((id *)&self->_storeInfoUpdater, 0);
  objc_storeStrong((id *)&self->_localPodcast, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_updatedEpisodeUUIDs, 0);
  objc_storeStrong((id *)&self->_newlyEntitledEpisodeUUIDs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
