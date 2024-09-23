@implementation MTMediaLibraryUpdater

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F21C;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_1005672D0 != -1)
    dispatch_once(&qword_1005672D0, block);
  return (id)qword_1005672C8;
}

- (MTMediaLibraryUpdater)init
{
  MTMediaLibraryUpdater *v3;
  id v4;
  uint64_t v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  dispatch_source_t v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD handler[4];
  id v20;
  objc_super v21;

  if (+[MTApplication localLibraryUpdatesDisabled](MTApplication, "localLibraryUpdatesDisabled"))
  {
    v3 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MTMediaLibraryUpdater;
    v4 = -[MTMediaLibraryUpdater init](&v21, "init");
    if (v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v6 = (void *)*((_QWORD *)v4 + 2);
      *((_QWORD *)v4 + 2) = v5;

      global_queue = dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue(global_queue);
      v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, v8);
      v10 = (void *)*((_QWORD *)v4 + 3);
      *((_QWORD *)v4 + 3) = v9;

      v11 = *((_QWORD *)v4 + 3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10005F3C0;
      handler[3] = &unk_1004A6200;
      v12 = v4;
      v20 = v12;
      dispatch_source_set_event_handler(v11, handler);
      dispatch_resume(*((dispatch_object_t *)v4 + 3));
      v13 = objc_alloc_init((Class)NSObject);
      v14 = (void *)v12[4];
      v12[4] = v13;

      v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v16 = (void *)v12[5];
      v12[5] = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      objc_msgSend(v17, "addChangeNotifier:", v12);

    }
    self = (MTMediaLibraryUpdater *)v4;
    v3 = self;
  }

  return v3;
}

- (void)_updateDatabaseFromMediaLibrary
{
  MTMediaLibraryUpdater *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  MTEntityUpdaterCache *v27;
  void *v28;
  void *v29;
  void *v30;
  MTEntityUpdaterCache *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  MTEntityUpdaterCache *v57;
  id v58;
  NSMutableDictionary *v59;
  MTMediaLibraryUpdater *v60;
  void *v61;
  id v62;
  id v63;
  uint8_t v64[16];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  NSMutableDictionary *v72;
  MTMediaLibraryUpdater *v73;
  MTEntityUpdaterCache *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  char v80;
  _QWORD v81[4];
  id v82;
  uint8_t *v83;
  _QWORD v84[4];
  id v85;
  _BYTE v86[128];
  uint64_t v87;
  _QWORD v88[3];
  uint8_t buf[8];
  __int128 v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryUpdater didUpdateCompletionBlocks](v2, "didUpdateCompletionBlocks"));
  v63 = objc_msgSend(v3, "copy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryUpdater didUpdateCompletionBlocks](v2, "didUpdateCompletionBlocks"));
  objc_msgSend(v4, "removeAllObjects");

  objc_sync_exit(v2);
  v60 = v2;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastModifiedDate"));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_allItemsForPodcastsApp](MPMediaQuery, "mt_allItemsForPodcastsApp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryRestorePostflightUtil downloadCandidateMediaItems](MTMediaLibraryRestorePostflightUtil, "downloadCandidateMediaItems"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mt_compactMap:", &stru_1004A71C0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = kMTHasImportedMediaLibrary;
  v13 = objc_msgSend(v11, "BOOLForKey:", kMTHasImportedMediaLibrary);

  v14 = ((uint64_t (*)(void))_MTLogCategoryMediaLibrary)();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v13;
    LOWORD(v90) = 2112;
    *(_QWORD *)((char *)&v90 + 2) = v61;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "update-from-MusicLibrary started. hasUpdated = %d, postflightPIDs = %@", buf, 0x12u);
  }

  if ((v13 & 1) == 0)
  {
    if (objc_msgSend(v10, "count"))
    {
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_10005FC70;
      v84[3] = &unk_1004A71E8;
      v85 = v9;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectsPassingTest:", v84));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v18));

    }
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingComparator:", &stru_1004A7228));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v20, "setBool:forKey:", 1, v12);

    v9 = (void *)v19;
  }
  v21 = objc_opt_new(NSMutableDictionary);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "importContext"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUpdaterCache episodeCacheWithPredicate:inCtx:](MTEpisodeUpdaterCache, "episodeCacheWithPredicate:inCtx:", v24, v23));

  *(_QWORD *)buf = 0;
  *(_QWORD *)&v90 = buf;
  *((_QWORD *)&v90 + 1) = 0x3032000000;
  v91 = sub_1000465D4;
  v92 = sub_10004696C;
  v93 = 0;
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_10005FD28;
  v81[3] = &unk_1004A6F38;
  v83 = buf;
  v26 = v23;
  v82 = v26;
  objc_msgSend(v26, "performBlockAndWait:", v81);
  v27 = [MTEntityUpdaterCache alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](MTPodcast, "predicateForNotHiddenPodcasts"));
  v88[0] = kPodcastFeedUrl;
  v88[1] = kPodcastUpdatedFeedUrl;
  v88[2] = kPodcastTitle;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 3));
  v87 = kPodcastUuid;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
  v31 = -[MTEntityUpdaterCache initWithPredicate:entityName:ctx:properties:fetchProperties:](v27, "initWithPredicate:entityName:ctx:properties:fetchProperties:", v28, kMTPodcastEntityName, v26, v29, v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  LOBYTE(v30) = +[PFNotificationSettings canSendNotification](PFNotificationSettings, "canSendNotification");
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_10005FDFC;
  v69[3] = &unk_1004A7250;
  v53 = v9;
  v70 = v53;
  v54 = v10;
  v71 = v54;
  v59 = v21;
  v72 = v59;
  v73 = v2;
  v57 = v31;
  v74 = v57;
  v75 = v26;
  v56 = v25;
  v76 = v56;
  v80 = (char)v30;
  v58 = v32;
  v77 = v58;
  v34 = v33;
  v78 = v34;
  v55 = v61;
  v79 = v55;
  v62 = v75;
  objc_msgSend(v75, "performBlockAndWaitWithSave:", v69);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaContentSourceiOSMusicLibrary sharedInstance](MTMediaContentSourceiOSMusicLibrary, "sharedInstance"));
  LOBYTE(v26) = objc_msgSend(v35, "iTunesMatchEnabled");

  if ((v26 & 1) == 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_podcastsQuery](MPMediaQuery, "mt_podcastsQuery"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "collections"));
    v37 = objc_alloc_init((Class)NSMutableArray);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v38 = v36;
    v39 = 0;
    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v66;
      v42 = MPMediaPlaylistPropertyIsITunesSynced;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v41)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "valueForProperty:", v42));

          v39 = v45;
          if (objc_msgSend(v45, "BOOLValue"))
            objc_msgSend(v37, "addObject:", v44);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
      }
      while (v40);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v90 + 40), "valueForKey:", kPlaylistMediaLibraryId));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v46));

    -[MTMediaLibraryUpdater importPlaylists:knownPlaylistIds:mediaLibraryCache:playlists:](v60, "importPlaylists:knownPlaylistIds:mediaLibraryCache:playlists:", v62, v47, v59, v37);
  }
  if (objc_msgSend(v34, "count"))
    +[MTMediaLibraryUtil deleteMediaItems:completion:](MTMediaLibraryUtil, "deleteMediaItems:completion:", v34, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v48, "setDouble:forKey:", CFSTR("MTMediaLibraryLastUpdate"), v8);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PUIMediaLibraryStorageController shared](PUIMediaLibraryStorageController, "shared"));
  objc_msgSend(v49, "mediaLibraryDidChange");

  v50 = _MTLogCategoryMediaLibrary(objc_msgSend(v63, "enumerateObjectsUsingBlock:", &stru_1004A7290));
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "update-from-MusicLibrary finished.", v64, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)forceUpdateDatabaseFromMediaLibraryWithCompletion:(id)a3
{
  MTMediaLibraryUpdater *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryUpdater didUpdateCompletionBlocks](v4, "didUpdateCompletionBlocks"));
    v6 = objc_retainBlock(v7);
    objc_msgSend(v5, "addObject:", v6);

    objc_sync_exit(v4);
  }
  dispatch_source_merge_data((dispatch_source_t)self->_updateDatabaseDispatchSource, 1uLL);

}

- (void)startObservingMediaLibrary
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryTransactionManager sharedInstance](MTMediaLibraryTransactionManager, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100060798;
  v4[3] = &unk_1004A6200;
  v4[4] = self;
  objc_msgSend(v3, "beginGeneratingLibraryChangeNotifications:", v4);

}

- (void)stopObservingMediaLibrary
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryTransactionManager sharedInstance](MTMediaLibraryTransactionManager, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000609D4;
  v4[3] = &unk_1004A6200;
  v4[4] = self;
  objc_msgSend(v3, "endGeneratingLibraryChangeNotifications:", v4);

}

- (unint64_t)importPlaylist:(id)a3 intoContext:(id)a4 mediaLibraryCache:(id)a5 knownPlaylistIds:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSMutableOrderedSet *v26;
  _QWORD *v27;
  id v28;
  id *v29;
  id *v30;
  id *v31;
  id *v32;
  id v34;
  id v35;
  void *v36;
  NSMutableOrderedSet *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  NSMutableOrderedSet *v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[4];
  id v46;
  id v47;
  NSMutableOrderedSet *v48;
  _QWORD v49[3];
  _QWORD v50[4];
  id v51;
  _QWORD *v52;
  _QWORD v53[4];
  _QWORD v54[4];
  NSMutableOrderedSet *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 buf;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];

  v9 = a3;
  v34 = a4;
  v38 = a5;
  v35 = a6;
  v37 = objc_opt_new(NSMutableOrderedSet);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v36 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playlist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i), "valueForProperty:", MPMediaEntityPropertyPersistentID));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", v15));
        v17 = v16;
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetUrl"));
          v19 = objc_msgSend(v18, "length") == 0;

          if (!v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetUrl"));
            v21 = _MTLogCategoryMediaLibrary(-[NSMutableOrderedSet addObject:](v37, "addObject:", v20));
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

            }
          }
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v12);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v61 = 0x2020000000;
  v62 = 0;
  if (!-[NSMutableOrderedSet count](v37, "count"))
    goto LABEL_22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mediaLibraryId"));
  if ((objc_msgSend(v36, "isGenius") & 1) == 0
    && (objc_msgSend(v36, "isOnTheGo") & 1) == 0
    && (objc_msgSend(v36, "isHidden") & 1) == 0)
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100060F98;
    v54[3] = &unk_1004A6CE8;
    v26 = v37;
    v55 = v26;
    v27 = objc_retainBlock(v54);
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v53[3] = 0;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100061020;
    v50[3] = &unk_1004A6F38;
    v52 = v53;
    v28 = v34;
    v51 = v28;
    objc_msgSend(v28, "performBlockAndWait:", v50);
    if ((objc_msgSend(v35, "containsObject:", v24) & 1) != 0)
    {
      objc_msgSend(v35, "removeObject:", v24);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000612DC;
      v39[3] = &unk_1004A7308;
      v40 = v28;
      v41 = v24;
      v42 = v26;
      v44[0] = v27;
      v43 = v36;
      v44[1] = &buf;
      objc_msgSend(v40, "performBlockAndWaitWithSave:", v39);

      v29 = &v40;
      v30 = &v41;
      v31 = (id *)&v42;
      v32 = (id *)v44;
    }
    else
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100061088;
      v45[3] = &unk_1004A72E0;
      v46 = v28;
      v47 = v36;
      v48 = v26;
      v49[0] = v27;
      v49[1] = &buf;
      v49[2] = v53;
      objc_msgSend(v46, "performBlockAndWaitWithSave:", v45);
      v29 = &v46;
      v30 = &v47;
      v31 = (id *)&v48;
      v32 = (id *)v49;
    }

    _Block_object_dispose(v53, 8);
LABEL_22:
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    goto LABEL_23;
  }

  v25 = 0;
LABEL_23:
  _Block_object_dispose(&buf, 8);

  return v25;
}

- (void)importPlaylists:(id)a3 knownPlaylistIds:(id)a4 mediaLibraryCache:(id)a5 playlists:(id)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  MTMediaLibraryUpdater *v28;
  id v29;
  id v30;
  id v31;
  id obj;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v28 = self;
  v30 = a3;
  v31 = a4;
  v29 = a5;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLPlaylist playlistWithMPPlaylist:](MTMLPlaylist, "playlistWithMPPlaylist:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), v28));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaLibraryId"));
        objc_msgSend(v10, "setObject:forKey:", v14, v15);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "parentMediaLibraryId", v28));
        if (objc_msgSend(v22, "isEqualToNumber:", &off_1004D5998))
        {
          objc_msgSend(v16, "addObject:", v21);
        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v22));
          objc_msgSend(v23, "addChild:", v21);

        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v18);
  }
  while (1)
  {

    if (!objc_msgSend(v16, "count"))
      break;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 0));
    if ((objc_msgSend(v17, "isEmpty") & 1) == 0)
    {
      v24 = -[MTMediaLibraryUpdater importPlaylist:intoContext:mediaLibraryCache:knownPlaylistIds:](v28, "importPlaylist:intoContext:mediaLibraryCache:knownPlaylistIds:", v17, v30, v29, v31);
      v46[3] += v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "children"));
      objc_msgSend(v16, "addObjectsFromArray:", v25);

    }
    objc_msgSend(v16, "removeObjectAtIndex:", 0, v28);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100061A60;
  v33[3] = &unk_1004A7180;
  v26 = v30;
  v34 = v26;
  v36 = &v45;
  v27 = v31;
  v35 = v27;
  objc_msgSend(v26, "performBlockAndWaitWithSave:", v33);

  _Block_object_dispose(&v45, 8);
}

- (void)updateMediaLibraryFromNotification:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "doLibraryUpdateFromNotification", 0);
  -[MTMediaLibraryUpdater performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "doLibraryUpdateFromNotification", 0, 1.5);
}

- (void)doLibraryUpdateFromNotification
{
  -[MTMediaLibraryUpdater forceUpdateDatabaseFromMediaLibraryWithCompletion:](self, "forceUpdateDatabaseFromMediaLibraryWithCompletion:", 0);
}

- (void)_printMediaItemPropertiesForItem:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  v11 = MPMediaItemPropertyPodcastGUID;
  v9 = MPMediaItemPropertyPodcastURL;
  v8 = MPMediaItemPropertyStoreID;
  v7 = MPMediaItemPropertyHasBeenPlayed;
  v6 = MPMediaItemPropertyDescriptionInfo;
  v10 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaItemPropertyTitle, MPMediaItemPropertyArtist, MPMediaItemPropertyPodcastTitle, MPMediaItemPropertyPodcastPersistentID, v11, MPMediaItemPropertyAssetURL, MPMediaItemPropertyPersistentID, MPMediaItemPropertyLastPlayedDate, MPMediaItemPropertyRating, MPMediaItemPropertyComments, MPMediaItemPropertyReleaseDate, MPMediaItemPropertyArtwork, MPMediaItemPropertyAlbumArtist, v9, v8, MPMediaItemPropertyBookmarkTime,
                   v7,
                   MPMediaItemPropertyPlaybackDuration,
                   v6,
                   MPMediaItemPropertyAlbumTitle,
                   MPMediaItemPropertyPersistentID,
                   MPMediaItemPropertyMediaType,
                   MPMediaItemPropertyAlbumPersistentID,
                   MPMediaItemPropertyArtistPersistentID,
                   MPMediaItemPropertyAlbumArtistPersistentID,
                   MPMediaItemPropertyGenre,
                   MPMediaItemPropertyGenrePersistentID,
                   MPMediaItemPropertyComposer,
                   MPMediaItemPropertyComposerPersistentID,
                   MPMediaItemPropertyPlaybackDuration,
                   MPMediaItemPropertyAlbumTrackNumber,
                   MPMediaItemPropertyAlbumTrackCount,
                   MPMediaItemPropertyDiscNumber,
                   MPMediaItemPropertyDiscCount,
                   MPMediaItemPropertyLyrics,
                   MPMediaItemPropertyIsCompilation,
                   MPMediaItemPropertyBeatsPerMinute,
                   MPMediaItemPropertyPlayCount,
                   MPMediaItemPropertySkipCount,
                   MPMediaItemPropertyUserGrouping,
                   0));
  v4 = _MTLogCategoryMediaLibrary(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "----------------------------------------------------------------", buf, 2u);
  }

  objc_msgSend(v10, "enumerateValuesForProperties:usingBlock:", v3, &stru_1004A7370);
}

- (id)_findOrAddPodcastForMediaItem:(id)a3 updaterCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  __CFString *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  uint64_t v36;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "feedUrl"));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, kPodcastFeedUrl);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, kPodcastUpdatedFeedUrl);
  }
  if (objc_msgSend(v9, "count"))
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyDictionaryForSearchItem:", v9));
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcastTitle"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByStrippingHTML"));

  if (!v10)
  {
    if (-[__CFString length](v12, "length"))
    {
      if (!v12)
      {
        v13 = 0;
        goto LABEL_27;
      }
    }
    else
    {

      v12 = CFSTR("Untitled");
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, kPodcastTitle);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyDictionaryForSearchItem:", v9));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "importContext"));

  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", kPodcastUuid));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "podcastForUuid:", v16));

    if (v13)
    {
      if (objc_msgSend(v13, "hidden"))
      {
        objc_msgSend(v13, "setHidden:", 0);
        objc_msgSend(v13, "setNeedsArtworkUpdate:", 1);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcastPersistentId"));
      v18 = objc_msgSend(v17, "longLongValue");

      objc_msgSend(v13, "setPodcastPID:", v18);
    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artist"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByStrippingHTML"));

    v21 = _MTLogCategoryMediaLibrary(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Adding Podcast from Feed: %@", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:title:author:provider:imageUrl:description:](MTPodcast, "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:title:author:provider:imageUrl:description:", v15, 0, v7, +[MTPodcast defaultShowType](MTPodcast, "defaultShowType"), v12, v32, 0, 0, 0));
    if (v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeCollectionId"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcastPersistentId"));
      objc_msgSend(v13, "setPodcastPID:", objc_msgSend(v24, "longLongValue"));

      v31 = v23;
      objc_msgSend(v13, "setStoreCollectionId:", objc_msgSend(v23, "longLongValue"));
      if (objc_msgSend(v5, "isItunesU"))
      {
        objc_msgSend(v13, "setDeletePlayedEpisodes:", 0);
        objc_msgSend(v13, "setShowTypeSetting:", 2);
        objc_msgSend(v13, "setEpisodeLimit:", &_mh_execute_header);
      }
      v25 = _MTLogCategoryMediaLibrary(objc_msgSend(v6, "addEntityToCache:", v13));
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
        *(_DWORD *)buf = 138412546;
        v34 = v30;
        v35 = 2112;
        v36 = v27;
        v28 = (void *)v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Inserting new podcast:%@ (%@)", buf, 0x16u);

      }
    }

  }
LABEL_27:

  return v13;
}

- (void)_addEpisodeInCtx:(id)a3 mediaItem:(id)a4 episodeCache:(id)a5 podcastUuid:(id)a6 isRestoreDownloadCandidate:(BOOL)a7 canSendNotifications:(BOOL)a8 outEpisodeUUID:(id *)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  double v54;
  void *i;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  unsigned __int8 v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  unsigned __int8 v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  unsigned int v94;
  id v95;
  uint64_t v96;
  NSObject *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  float v103;
  float v104;
  double v105;
  void *v106;
  id v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  void *v118;
  void *v119;
  int64_t v120;
  _BOOL8 v122;
  unsigned int v123;
  id v124;
  uint64_t v125;
  NSObject *v126;
  const __CFString *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  NSObject *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  _BOOL4 v145;
  id v146;
  _BOOL4 v147;
  id v148;
  void *v149;
  void *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint8_t buf[4];
  uint64_t v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  double v160;
  _BYTE v161[128];

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetUrl"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "downloadIdentifier"));
  v20 = _MTLogCategoryMediaLibrary(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  v149 = (void *)v19;
  v150 = (void *)v18;
  if (v19 && !v18 && !v10)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      v156 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "addEpisodeInCtx will skip item with nil assetURL, download id: %@", buf, 0xCu);
    }
    goto LABEL_101;
  }
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetUrl"));
    *(_DWORD *)buf = 138543874;
    v156 = (uint64_t)v23;
    v157 = 2114;
    v158 = v24;
    v159 = 1024;
    LODWORD(v160) = v10;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "addEpisodeInCtx will add item '%{public}@' with assetUrl %{public}@, isRestoreDownloadCandidate = %d", buf, 0x1Cu);

  }
  v145 = v9;
  v147 = v10;

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchCacheForEpisodeMatchingMediaItem:", v15));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject podcastUuid](v21, "podcastUuid"));
  v26 = objc_msgSend(v25, "isEqualToString:", v17);

  v148 = v17;
  if ((v26 & 1) != 0)
  {
    if (v21)
      goto LABEL_15;
  }
  else
  {

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "guid"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByStrippingHTML"));

  if (v27)
  {
    v30 = kMTEpisodeEntityName;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:onPodcastUuid:](MTEpisode, "predicateForEpisodeGuid:onPodcastUuid:", v27, v17));
    v32 = (id)objc_claimAutoreleasedReturnValue(+[MTEpisodeUpdaterCache defaultPropertiesToFetch](MTEpisodeUpdaterCache, "defaultPropertiesToFetch"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectsInEntity:predicate:propertiesToFetch:batchSize:", v30, v31, v32, 0));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));

  }
  else
  {
    if (!v29)
      goto LABEL_36;
    v47 = kMTEpisodeEntityName;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeTitle:onPodcastUuid:](MTEpisode, "predicateForEpisodeTitle:onPodcastUuid:", v29, v17));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUpdaterCache defaultPropertiesToFetch](MTEpisodeUpdaterCache, "defaultPropertiesToFetch"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectsInEntity:predicate:propertiesToFetch:batchSize:", v47, v48, v49, 0));

    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v32 = v50;
    v51 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
    if (v51)
    {
      v52 = v51;
      v143 = v16;
      v144 = v14;
      v21 = 0;
      v53 = *(_QWORD *)v152;
      v54 = 1.79769313e308;
      do
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(_QWORD *)v152 != v53)
            objc_enumerationMutation(v32);
          v56 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * (_QWORD)i);
          -[NSObject pubDate](v21, "pubDate");
          v58 = v57;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pubDate"));
          objc_msgSend(v59, "timeIntervalSinceReferenceDate");
          v61 = vabdd_f64(v58, v60);

          if (v61 < v54)
          {
            v62 = v56;

            v54 = v61;
            v21 = v62;
          }
        }
        v52 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
      }
      while (v52);
      v31 = v32;
      v16 = v143;
      v14 = v144;
    }
    else
    {
      v21 = 0;
      v31 = v32;
    }
  }

  v17 = v148;
  if (v21)
    goto LABEL_15;
LABEL_36:
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "podcastForUuid:", v17));
  v64 = v63;
  if (!v63 || (-[NSObject isDeleted](v63, "isDeleted") & 1) != 0)
  {
    v21 = v64;
LABEL_101:

    goto LABEL_102;
  }
  v21 = objc_claimAutoreleasedReturnValue(+[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:](MTEpisode, "insertNewEpisodeInManagedObjectContext:canSendNotifications:", v14, v145));
  -[NSObject setPodcast:](v21, "setPodcast:", v64);
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "stringByStrippingHTML"));

  -[NSObject setTitle:](v21, "setTitle:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject title](v64, "title"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "cleanedTitleStringWithPrefix:", v139));
  -[NSObject setCleanedTitle:](v21, "setCleanedTitle:", v140);

  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uti"));
  -[NSObject setUti:](v21, "setUti:", v141);

  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "guid"));
  -[NSObject setGuid:](v21, "setGuid:", v142);

  -[NSObject setImportSource:](v21, "setImportSource:", 1);
  -[NSObject setEpisodeLevel:](v21, "setEpisodeLevel:", 0x7FFFFFFFFFFFFFFFLL);
  if (v147)
    -[NSObject suppressAutomaticDownloadsIfNeeded](v21, "suppressAutomaticDownloadsIfNeeded");
  -[NSObject setFeedDeleted:](v21, "setFeedDeleted:", 1);
  +[IMMetrics recordUserAction:dataSource:](IMMetrics, "recordUserAction:dataSource:", CFSTR("media_library_import_new_episode"), v21);

  v17 = v148;
  if (v21)
  {
LABEL_15:
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentId"));
    v35 = objc_msgSend(v34, "unsignedLongLongValue");

    if (-[NSObject persistentID](v21, "persistentID") != v35)
      -[NSObject setPersistentID:](v21, "setPersistentID:", v35);
    v146 = v35;
    v36 = objc_claimAutoreleasedReturnValue(-[NSObject assetURL](v21, "assetURL"));
    if ((void *)v36 == v150)
    {

      goto LABEL_43;
    }
    v37 = (void *)v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetURL](v21, "assetURL"));
    v39 = objc_msgSend(v38, "isEqualToString:", v150);

    if ((v39 & 1) != 0)
      goto LABEL_43;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetURL](v21, "assetURL"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v40));
    if (objc_msgSend(v41, "isFileURL"))
    {
      v42 = objc_msgSend(v150, "hasPrefix:", CFSTR("ipod-library"));

      if (v42)
      {
        v44 = _MTLogCategoryMediaLibrary(v43);
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetURL](v21, "assetURL"));
          *(_DWORD *)buf = 138543618;
          v156 = (uint64_t)v150;
          v157 = 2114;
          v158 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Ignoring Media Library asset url %{public}@. Keep using podcasts asset url %{public}@", buf, 0x16u);

        }
        goto LABEL_43;
      }
    }
    else
    {

    }
    v65 = _MTLogCategoryMediaLibrary(v43);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v21, "uuid"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetURL](v21, "assetURL"));
      *(_DWORD *)buf = 138543874;
      v156 = (uint64_t)v67;
      v157 = 2112;
      v158 = v68;
      v159 = 2112;
      v160 = *(double *)&v150;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Episode %{public}@ updated assetURL from %@ to %@", buf, 0x20u);

    }
    -[NSObject setAssetURL:](v21, "setAssetURL:", v150);
LABEL_43:
    v69 = -[NSObject isFromITunesSync](v21, "isFromITunesSync");
    if (v69 != objc_msgSend(v15, "isFromITunesSync"))
      -[NSObject setIsFromITunesSync:](v21, "setIsFromITunesSync:", objc_msgSend(v15, "isFromITunesSync"));
    v70 = -[NSObject byteSize](v21, "byteSize");
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "byteSize"));
    v72 = objc_msgSend(v71, "unsignedLongLongValue");

    if (v70 != v72)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "byteSize"));
      -[NSObject setByteSize:](v21, "setByteSize:", objc_msgSend(v73, "unsignedLongLongValue"));

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "duration"));
    objc_msgSend(v74, "doubleValue");
    v76 = v75;

    if (v76 > 0.0)
    {
      -[NSObject duration](v21, "duration");
      if (v76 != v77)
        -[NSObject setDuration:](v21, "setDuration:", v76);
    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "category"));
    v79 = objc_claimAutoreleasedReturnValue(-[NSObject category](v21, "category"));
    if (v78 == (void *)v79)
    {

    }
    else
    {
      v80 = (void *)v79;
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject category](v21, "category"));
      v82 = objc_msgSend(v81, "isEqual:", v78);

      if ((v82 & 1) == 0)
        -[NSObject setCategory:](v21, "setCategory:", v78);
    }
    v83 = v16;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject author](v21, "author"));
    v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "artist"));
    if (v84 == (void *)v85)
    {

    }
    else
    {
      v86 = (void *)v85;
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject author](v21, "author"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "artist"));
      v89 = objc_msgSend(v87, "isEqual:", v88);

      v17 = v148;
      if ((v89 & 1) != 0)
      {
LABEL_59:
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pubDate"));
        objc_msgSend(v90, "timeIntervalSinceReferenceDate");
        v92 = v91;

        -[NSObject pubDate](v21, "pubDate");
        if (v93 == 0.0)
          -[NSObject setPubDate:](v21, "setPubDate:", v92);
        v94 = -[NSObject explicit](v21, "explicit");
        v95 = objc_msgSend(v15, "isExplicit");
        v16 = v83;
        if (v94 != (_DWORD)v95)
        {
          v96 = _MTLogCategoryMediaLibrary(v95);
          v97 = objc_claimAutoreleasedReturnValue(v96);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            if (objc_msgSend(v15, "isExplicit"))
              v98 = CFSTR("ON");
            else
              v98 = CFSTR("OFF");
            v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject title](v21, "title"));
            v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject podcast](v21, "podcast"));
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "title"));
            *(_DWORD *)buf = 138412802;
            v156 = (uint64_t)v98;
            v157 = 2112;
            v158 = v99;
            v159 = 2112;
            v160 = *(double *)&v101;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "Ignoring: ML has different explict flag (%@) for %@ by %@", buf, 0x20u);

            v17 = v148;
          }

        }
        if (objc_msgSend(v15, "isFromITunesSync"))
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playhead"));
          objc_msgSend(v102, "floatValue");
          v104 = v103;

          -[NSObject playhead](v21, "playhead");
          if (v104 > *(float *)&v105)
          {
            *(float *)&v105 = v104;
            -[NSObject setPlayhead:](v21, "setPlayhead:", v105);
          }
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playCount"));
          v107 = objc_msgSend(v106, "integerValue");

          if (-[NSObject playCount](v21, "playCount") != v107)
            -[NSObject setPlayCount:](v21, "setPlayCount:", v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPlayedDate"));
          objc_msgSend(v108, "timeIntervalSinceReferenceDate");
          v110 = v109;

          -[NSObject lastDatePlayed](v21, "lastDatePlayed");
          if (v111 != v110)
          {
            v112 = (void *)objc_claimAutoreleasedReturnValue(+[FutureDateChecker sharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "sharedInstance"));
            objc_msgSend(v112, "timestampBoundByNow:", v110);
            v114 = v113;

            v116 = _MTLogCategoryMediaLibrary(v115);
            v117 = objc_claimAutoreleasedReturnValue(v116);
            if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
            {
              v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v21, "uuid"));
              -[NSObject lastDatePlayed](v21, "lastDatePlayed");
              *(_DWORD *)buf = 138412802;
              v156 = (uint64_t)v118;
              v157 = 2048;
              v158 = v119;
              v159 = 2048;
              v160 = v110;
              _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEBUG, "Changing last date played for %@ from %lf to %lf", buf, 0x20u);

            }
            -[NSObject setLastDatePlayed:](v21, "setLastDatePlayed:", v114);
          }
          v120 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:](MTLibraryLegacyUtil, "playStateFromHasBeenPlayed:andPlayCount:", objc_msgSend(v15, "hasBeenPlayed"), v107);
          v122 = fabs(v110) > 2.22044605e-16 && v120 == 2;
          -[NSObject setPlayState:manually:source:](v21, "setPlayState:manually:source:", v120, v122, 7);
          v123 = -[NSObject explicit](v21, "explicit");
          v124 = objc_msgSend(v15, "isExplicit");
          if (v123 != (_DWORD)v124)
          {
            v125 = _MTLogCategoryMediaLibrary(v124);
            v126 = objc_claimAutoreleasedReturnValue(v125);
            if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
            {
              if (objc_msgSend(v15, "isExplicit"))
                v127 = CFSTR("ON");
              else
                v127 = CFSTR("OFF");
              v128 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject title](v21, "title"));
              v129 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject podcast](v21, "podcast"));
              v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "title"));
              *(_DWORD *)buf = 138412802;
              v156 = (uint64_t)v127;
              v157 = 2112;
              v158 = v128;
              v159 = 2112;
              v160 = *(double *)&v130;
              _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEBUG, "Importing: ML has different explict flag (%@) for %@ by %@", buf, 0x20u);

              v17 = v148;
            }

            -[NSObject setExplicit:](v21, "setExplicit:", objc_msgSend(v15, "isExplicit"));
          }
          +[IMMetrics recordUserAction:dataSource:](IMMetrics, "recordUserAction:dataSource:", CFSTR("media_library_import_from_itunes"), v21);
        }
        v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeTrackId"));
        v132 = (uint64_t)objc_msgSend(v131, "longLongValue");

        if (v132 >= 1)
        {
          v133 = -[NSObject storeTrackId](v21, "storeTrackId");
          if (v133 != (id)v132)
            v133 = -[NSObject setStoreTrackId:](v21, "setStoreTrackId:", v132);
        }
        if (v147)
        {
          v134 = _MTLogCategoryMediaLibrary(v133);
          v135 = objc_claimAutoreleasedReturnValue(v134);
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v146));
            *(_DWORD *)buf = 138543362;
            v156 = (uint64_t)v136;
            _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Setting persistent id for item that is being retored: %{public}@", buf, 0xCu);

          }
          -[NSObject setPersistentID:](v21, "setPersistentID:", v146);
        }
        if (a9)
          *a9 = (id)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v21, "uuid"));

        goto LABEL_101;
      }
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "artist"));
      -[NSObject setAuthor:](v21, "setAuthor:", v84);
    }

    goto LABEL_59;
  }
LABEL_102:

}

+ (id)numberFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1005672D8;
  if (!qword_1005672D8)
  {
    v3 = objc_alloc_init((Class)NSNumberFormatter);
    v4 = (void *)qword_1005672D8;
    qword_1005672D8 = (uint64_t)v3;

    objc_msgSend((id)qword_1005672D8, "setNumberStyle:", 1);
    v2 = (void *)qword_1005672D8;
  }
  return v2;
}

- (void)libraryDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  MTMediaLibraryUpdater *v15;

  v4 = a3;
  v5 = kMTEpisodeEntityName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changesForEntityName:", kMTEpisodeEntityName));
  v7 = objc_msgSend(v6, "hasChanges");

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changesForEntityName:", v5));
    if (objc_msgSend(v8, "hasUpdates"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "importContext"));

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000633D0;
      v12[3] = &unk_1004A7398;
      v13 = v8;
      v14 = v10;
      v15 = self;
      v11 = v10;
      v8 = v8;
      objc_msgSend(v11, "performBlock:", v12);

    }
  }

}

- (BOOL)haveMediaLibraryPropertiesChangedForEpisode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableDictionary *episodeCache;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSMutableDictionary *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    episodeCache = self->_episodeCache;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](episodeCache, "objectForKeyedSubscript:", v8));

    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryUpdater propertiesForMediaLibrary](self, "propertiesForMediaLibrary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryWithValuesForKeys:", v6));

    v11 = objc_msgSend(v10, "isEqualToDictionary:", v9);
    LOBYTE(v6) = v11 ^ 1;
    if ((v11 & 1) == 0)
    {
      v12 = self->_episodeCache;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v10, v13);

    }
  }

  return (char)v6;
}

- (id)propertiesForMediaLibrary
{
  _QWORD v3[4];

  v3[0] = kEpisodePersistentID;
  v3[1] = kEpisodePlayhead;
  v3[2] = kEpisodePlayState;
  v3[3] = kEpisodePlayCount;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4));
}

- (id)noteObserver
{
  return self->_noteObserver;
}

- (void)setNoteObserver:(id)a3
{
  objc_storeStrong(&self->_noteObserver, a3);
}

- (NSMutableArray)didUpdateCompletionBlocks
{
  return self->_didUpdateCompletionBlocks;
}

- (void)setDidUpdateCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_didUpdateCompletionBlocks, a3);
}

- (OS_dispatch_source)updateDatabaseDispatchSource
{
  return self->_updateDatabaseDispatchSource;
}

- (void)setUpdateDatabaseDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_updateDatabaseDispatchSource, a3);
}

- (NSObject)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(id)a3
{
  objc_storeStrong((id *)&self->_observerLock, a3);
}

- (NSMutableDictionary)episodeCache
{
  return self->_episodeCache;
}

- (void)setEpisodeCache:(id)a3
{
  objc_storeStrong((id *)&self->_episodeCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeCache, 0);
  objc_storeStrong((id *)&self->_observerLock, 0);
  objc_storeStrong((id *)&self->_updateDatabaseDispatchSource, 0);
  objc_storeStrong((id *)&self->_didUpdateCompletionBlocks, 0);
  objc_storeStrong(&self->_noteObserver, 0);
}

@end
