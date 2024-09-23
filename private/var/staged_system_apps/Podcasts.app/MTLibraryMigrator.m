@implementation MTLibraryMigrator

+ (BOOL)_needsImageStoreMigration
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", kMTImageProviderMigrationHasOccurred) ^ 1;

  return v3;
}

+ (BOOL)runImageStoreMigration
{
  uint64_t v3;
  NSObject *v4;
  unsigned __int8 v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = _MTLogCategoryDatabase(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (ImageStore) Start image store migration.", buf, 2u);
  }

  v5 = objc_msgSend(a1, "runImageStorePathMigration");
  v6 = objc_msgSend(a1, "runImageFormatMigration");
  v7 = (char)v6;
  v9 = _MTLogCategoryDatabase(v6, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Migration] (ImageStore) Image store migration has been completed.", v12, 2u);
  }

  return v5 | v7;
}

+ (void)_migrateToImageProvider
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = _MTLogCategoryArtworkDownload(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Beginning artwork migration from MTImageStore to ImageProvider", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C4D8;
  v8[3] = &unk_1004ABE38;
  v9 = v5;
  v10 = a1;
  v7 = v5;
  objc_msgSend(v6, "migrateLibraryArtworkFromImageStoreWithCompletionHandler:", v8);

}

+ (BOOL)runDataMigration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  _BYTE v68[12];
  __int16 v69;
  id v70;

  os_unfair_lock_lock(&stru_1005675C8);
  v5 = _MTLogCategoryDatabase(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v68 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Acquired lock.", v68, 2u);
  }

  v7 = +[MTLibraryMigrationUtil needsDataMigration](MTLibraryMigrationUtil, "needsDataMigration");
  if (v7)
  {
    v8 = (uint64_t)+[MTDB libraryDataVersion](MTDB, "libraryDataVersion");
    v10 = _MTLogCategoryDatabase(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v68 = 134217984;
      *(_QWORD *)&v68[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Needs migration with dataVersion %ld.", v68, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    objc_msgSend(v12, "deleteOrphanedEpisodes");

    v15 = _MTLogCategoryDatabase(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Deleted orphaned episodes.", v68, 2u);
    }

    v17 = objc_msgSend(a1, "migrateSettingsForVersion:", v8);
    v19 = _MTLogCategoryDatabase(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for settings.", v68, 2u);
    }

    v21 = objc_msgSend(a1, "migratePlaylistsForVersion:", v8);
    v23 = _MTLogCategoryDatabase(v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for playlists.", v68, 2u);
    }

    v25 = objc_msgSend(a1, "runMigrationOnEpisodesByPodcastForVersion:", v8);
    v27 = _MTLogCategoryDatabase(v25, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for episodes by podcast.", v68, 2u);
    }

    v29 = objc_msgSend(a1, "runMigrationOnAllEpisodesForVersion:", v8);
    v31 = _MTLogCategoryDatabase(v29, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for ALL episodes.", v68, 2u);
    }

    switch(v8)
    {
      case 32:
        if (!+[PFClientUtil isRunningOnInternalOS](PFClientUtil, "isRunningOnInternalOS"))
          goto LABEL_28;
        v38 = objc_msgSend(a1, "deleteDuplicateVideoEpisodesForRdar59691904");
        v40 = _MTLogCategoryDatabase(v38, v39);
        v36 = objc_claimAutoreleasedReturnValue(v40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          break;
        *(_WORD *)v68 = 0;
        v37 = "[Migration] (Data) Deleted duplicate video episodes.";
        goto LABEL_26;
      case 15:
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v41, "setObject:forKey:", 0, CFSTR("MTPodcastManifestUuid"));

        v44 = _MTLogCategoryDatabase(v42, v43);
        v36 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          v37 = "[Migration] (Data) Set kMTPodcastManifestUuid to nil in defaults.";
          goto LABEL_26;
        }
        break;
      case 3:
        v33 = objc_msgSend(a1, "recalculateAllPlaylists");
        v35 = _MTLogCategoryDatabase(v33, v34);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          v37 = "[Migration] (Data) Finished recalculation for ALL playlists.";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, v68, 2u);
        }
        break;
      default:
        if (v8 >= 34)
        {
          if ((unint64_t)v8 > 0x3D)
          {
            if ((unint64_t)v8 > 0x45)
              goto LABEL_36;
            goto LABEL_35;
          }
LABEL_34:
          objc_msgSend(a1, "prunePersistentHistory");
LABEL_35:
          +[MTFeedManager resetCache](MTFeedManager, "resetCache");
LABEL_36:
          v55 = objc_msgSend(a1, "touchLibraryMigrationVersion");
          v57 = _MTLogCategoryDatabase(v55, v56);
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = +[MTDB libraryDataVersion](MTDB, "libraryDataVersion");
            *(_DWORD *)v68 = 134218240;
            *(_QWORD *)&v68[4] = v8;
            v69 = 2048;
            v70 = v59;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Set migration version from %ld to %ld", v68, 0x16u);
          }

          goto LABEL_39;
        }
LABEL_28:
        if (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod", *(_QWORD *)v68))
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate truePredicate](NSPredicate, "truePredicate"));
          objc_msgSend(v45, "deleteEpisodes:", v46);

          v49 = _MTLogCategoryDatabase(v47, v48);
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v68 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) (HomePod) Deleted episodes.", v68, 2u);
          }

          v51 = +[MTBaseFeedManager purgeSubscriptionMetadata](MTBaseFeedManager, "purgeSubscriptionMetadata");
          v53 = _MTLogCategoryDatabase(v51, v52);
          v54 = objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v68 = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) (HomePod) Purged subscription metadata.", v68, 2u);
          }

        }
        goto LABEL_34;
    }

    goto LABEL_28;
  }
LABEL_39:
  if (+[MTDB needsSerpentIdEpisodeMigration](MTDB, "needsSerpentIdEpisodeMigration"))
  {
    objc_msgSend(a1, "migrateSerpentId");
    v7 = 1;
  }
  if (+[MTDB needsCacheBustForFreeAndPaidUrlStorage](MTDB, "needsCacheBustForFreeAndPaidUrlStorage"))
  {
    +[MTFeedManager resetCache](MTFeedManager, "resetCache");
    v7 = 1;
  }
  +[MTDB setStoreBothFreeAndPaidUrlsPreviousBootup](MTDB, "setStoreBothFreeAndPaidUrlsPreviousBootup");
  if (+[MTDB needsMigrationToDeltaFeedUpdates](MTDB, "needsMigrationToDeltaFeedUpdates"))
  {
    +[MTFeedManager migrateToDeltaFeedSystem](MTFeedManager, "migrateToDeltaFeedSystem");
    +[MTDB setMigrationToDeltaFeedUpdatesComplete](MTDB, "setMigrationToDeltaFeedUpdatesComplete");
  }
  if (objc_msgSend(a1, "needsToComputeLastLaunch"))
    objc_msgSend(a1, "setLastLaunchFromDatabase");
  objc_msgSend(a1, "updateGlobalDownloadPolicyIfNecessary");
  if (objc_msgSend(a1, "_needsImageStoreMigration"))
  {
    objc_msgSend(a1, "_migrateToImageProvider");
  }
  else
  {
    v60 = objc_msgSend(a1, "_hasMTImageStoreContent");
    if ((_DWORD)v60)
    {
      v61 = _MTLogCategoryArtworkDownload(v60);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "ImageProvider migration is complete, but images remain in MTImageStore. Attempting deletion...", v68, 2u);
      }

      objc_msgSend(a1, "_removeImageStoreContent");
    }
  }
  +[MTDataMigrator migrate](MTDataMigrator, "migrate");
  os_unfair_lock_unlock(&stru_1005675C8);
  v65 = _MTLogCategoryDatabase(v63, v64);
  v66 = objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v68 = 67109120;
    *(_DWORD *)&v68[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished. Did perform migration: %x", v68, 8u);
  }

  return v7;
}

+ (BOOL)runCoreDataMigration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  uint64_t v26;

  os_unfair_lock_lock(&stru_1005675CC);
  v5 = _MTLogCategoryDatabase(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Acquired lock.", (uint8_t *)&v23, 2u);
  }

  if (+[MTDB isCorrupt](MTDB, "isCorrupt"))
  {
    os_unfair_lock_unlock(&stru_1005675CC);
    v9 = _MTLogCategoryDatabase(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[Migration] (CoreData) DB is corrupt, returning immediately.", (uint8_t *)&v23, 2u);
    }

    LOBYTE(v11) = 0;
  }
  else if ((+[MTLibraryMigrationUtil needsCoreDataMigration](MTLibraryMigrationUtil, "needsCoreDataMigration") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB fetchManagedObjectModelFromDisk](MTDB, "fetchManagedObjectModelFromDisk"));
    v11 = +[MTLibraryMigrationUtil createPersistentStoreForModel:attemptMigration:](MTLibraryMigrationUtil, "createPersistentStoreForModel:attemptMigration:", v12, 1);

    if (v11)
    {
      v15 = _MTLogCategoryDatabase(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = +[MTDB coreDataVersion](MTDB, "coreDataVersion");
        v23 = 134218240;
        v24 = v17;
        v25 = 2048;
        v26 = 141;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Successfully migrated. Set migration version from %ld to %ld", (uint8_t *)&v23, 0x16u);
      }

      objc_msgSend(a1, "touchCoreDataMigrationVersion");
    }
    os_unfair_lock_unlock(&stru_1005675CC);
  }
  else
  {
    os_unfair_lock_unlock(&stru_1005675CC);
    v20 = _MTLogCategoryDatabase(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) DB does not need migration, returning immediately.", (uint8_t *)&v23, 2u);
    }

    LOBYTE(v11) = 1;
  }
  return v11;
}

+ (BOOL)runImageFormatMigration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_queue_global_t global_queue;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  NSURLResourceKey v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants fileType](MTImageStoreConstants, "fileType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants defaultImageStoreURL](MTImageStoreConstants, "defaultImageStoreURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMImageStore defaultStore](IMImageStore, "defaultStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskCache"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v21 = NSURLContentTypeKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v7, 0, &v20));
  v9 = v20;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    objc_msgSend(v10, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2840, CFSTR("Error enumerating image cache directory for migration: %@"), v11);

  }
  global_queue = dispatch_get_global_queue(2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000434B0;
  v17[3] = &unk_1004ABED8;
  v18 = v2;
  v19 = v5;
  v14 = v5;
  v15 = v2;
  objc_msgSend(v8, "concurrentMapWithStrideSize:on:withBlock:", 5, v13, v17);

  +[MTLibraryMigrationUtil setLibraryImageStoreType:](MTLibraryMigrationUtil, "setLibraryImageStoreType:", v15);
  return 1;
}

+ (BOOL)hasBeenInactiveForTimeInterval:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastAppUseDate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = v7;

    v9 = v8 > a3;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (BOOL)needsToComputeLastLaunch
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastAppUseDate"));

  v4 = _MTLogCategoryLifecycle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Last application use: %@", (uint8_t *)&v7, 0xCu);
  }

  return v3 == 0;
}

+ (void)updateGlobalDownloadPolicyIfNecessary
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  objc_msgSend(a1, "inactiveIntervalForDownloadPolicyUpgrade");
  if (objc_msgSend(a1, "hasBeenInactiveForTimeInterval:"))
    objc_msgSend(a1, "_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:", v3);

}

+ (BOOL)runImageStorePathMigration
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _UNKNOWN **v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  char v42;
  id obj;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  _BYTE v53[128];

  if (+[MTLibraryMigrationUtil needsImageStoreMigration](MTLibraryMigrationUtil, "needsImageStoreMigration"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants deprecatedImageStoreURL](MTImageStoreConstants, "deprecatedImageStoreURL"));
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants defaultImageStoreURL](MTImageStoreConstants, "defaultImageStoreURL"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

    v6 = CPInterfaceController_ptr;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v44 = (void *)v3;
    v8 = v3;
    v9 = (void *)v5;
    v10 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v12 = objc_msgSend(v11, "fileExistsAtPath:", v5);

      if ((v12 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v52 = 0;
        v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v52);
        v15 = v52;

        if ((v14 & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
          objc_msgSend(v16, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2791, CFSTR("Failed to create new image store at %@: %@"), v9, v17);

        }
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v51 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v44, &v51));
      v20 = v51;

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));
        objc_msgSend(v21, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2800, CFSTR("Error enumerating image cache directory for migration: %@"), v22);

      }
      v41 = v20;
      v42 = v10;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v19;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByAppendingPathComponent:", v27));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v27));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[208], "defaultManager"));
            v46 = 0;
            objc_msgSend(v30, "moveItemAtPath:toPath:error:", v28, v29, &v46);
            v31 = v46;

            if (v31)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
              v33 = v9;
              v34 = v6;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedDescription"));
              objc_msgSend(v32, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2812, CFSTR("Error moving image to new cache location: %@"), v35);

              v6 = v34;
              v9 = v33;

            }
          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        }
        while (v24);
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[208], "defaultManager"));
      v45 = 0;
      objc_msgSend(v36, "removeItemAtPath:error:", v44, &v45);
      v37 = v45;

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedDescription"));
        objc_msgSend(v38, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2821, CFSTR("Error deleting old image cache: %@"), v39);

      }
      LOBYTE(v10) = v42;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

+ (BOOL)needsMigration
{
  if (+[MTLibraryMigrationUtil isNewInstall](MTLibraryMigrationUtil, "isNewInstall"))
  {
    +[IMMetrics recordUserAction:](IMMetrics, "recordUserAction:", CFSTR("is_new_install"));
    objc_msgSend(a1, "touchAllMigrationVersions");
    return 0;
  }
  objc_msgSend(a1, "fixupDataMigrationVersion");
  if ((+[MTLibraryMigrationUtil needsCoreDataMigration](MTLibraryMigrationUtil, "needsCoreDataMigration") & 1) != 0|| (+[MTLibraryMigrationUtil needsDataMigration](MTLibraryMigrationUtil, "needsDataMigration") & 1) != 0|| (+[MTLibraryMigrationUtil needsImageStoreMigration](MTLibraryMigrationUtil, "needsImageStoreMigration") & 1) != 0|| (+[MTDB isCorrupt](MTDB, "isCorrupt") & 1) != 0|| (+[MTDB needsSerpentIdEpisodeMigration](MTDB, "needsSerpentIdEpisodeMigration") & 1) != 0|| (+[MTDB needsCacheBustForFreeAndPaidUrlStorage](MTDB, "needsCacheBustForFreeAndPaidUrlStorage") & 1) != 0|| (+[MTDB needsMigrationToDeltaFeedUpdates](MTDB, "needsMigrationToDeltaFeedUpdates") & 1) != 0|| (objc_msgSend(a1, "globalDownloadPolicyRequiresMigration") & 1) != 0|| +[MTDataMigrator requiresMigration](MTDataMigrator, "requiresMigration")|| (objc_msgSend(a1, "_needsImageStoreMigration") & 1) != 0)
  {
    return 1;
  }
  if ((+[PFClientUtil supportsImageStore](PFClientUtil, "supportsImageStore") & 1) != 0)
    return 0;
  return objc_msgSend(a1, "_hasMTImageStoreContent");
}

+ (void)migrateDatabaseToSharedContainerIfNeeded
{
  if ((+[MTDB quickCheckForNeedsContainerMigration](MTDB, "quickCheckForNeedsContainerMigration") & 1) == 0)
  {
    if (objc_msgSend(a1, "needToMigrateDataToSharedContainer"))
      objc_msgSend(a1, "moveSQLiteFilesFromDocumentsToSharedContainer");
    if ((objc_msgSend(a1, "needToMigrateDataToSharedContainer") & 1) == 0)
      +[MTDB setQuickCheckForNeedsContainerMigration:](MTDB, "setQuickCheckForNeedsContainerMigration:", 1);
  }
}

+ (double)inactiveIntervalForDownloadPolicyUpgrade
{
  return 63072000.0;
}

+ (BOOL)globalDownloadPolicyRequiresMigration
{
  if ((objc_msgSend(a1, "needsToComputeLastLaunch") & 1) != 0)
    return 1;
  objc_msgSend(a1, "inactiveIntervalForDownloadPolicyUpgrade");
  return objc_msgSend(a1, "hasBeenInactiveForTimeInterval:");
}

+ (void)fixupDataMigrationVersion
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!+[MTDB libraryDataVersion](MTDB, "libraryDataVersion"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants managedObjectModelDefinitionURL](MTConstants, "managedObjectModelDefinitionURL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("/MTLibrary 19.mom")));

    v4 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v3);
    v5 = +[MTLibraryMigrationUtil isMomCompatible:](MTLibraryMigrationUtil, "isMomCompatible:", v4);
    if ((_DWORD)v5)
    {
      v7 = _MTLogCategoryDatabase(v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Migration] Setting library to data version 6 which matches database version 19", v9, 2u);
      }

      +[MTDB setLibraryDataVersion:](MTDB, "setLibraryDataVersion:", 6);
    }

  }
}

+ (void)_removeImageStoreContent
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v2 = +[PFClientUtil supportsImageStore](PFClientUtil, "supportsImageStore");
  if (!(_DWORD)v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants defaultImageStoreURL](MTImageStoreConstants, "defaultImageStoreURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = 0;
    v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v16);
    v7 = v16;

    v9 = _MTLogCategoryArtworkDownload(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "Successfully removed image store directory";
        v13 = v11;
        v14 = OS_LOG_TYPE_INFO;
        v15 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      v12 = "Failed to remove image store directory: %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 12;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  v3 = _MTLogCategoryArtworkDownload(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Skipping image store removal, client supports image store", buf, 2u);
  }
LABEL_11:

}

+ (BOOL)_hasMTImageStoreContent
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  char v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants defaultImageStoreURL](MTImageStoreConstants, "defaultImageStoreURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v8);
  if (v8)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

+ (void)migratePlaylistsForVersion:(int64_t)a3
{
  if ((unint64_t)(a3 - 19) >= 0x31)
  {
    if ((unint64_t)(a3 - 7) >= 0xC)
    {
      if ((unint64_t)a3 > 6)
        return;
      objc_msgSend(a1, "migratePlaylistDefaultsForVersion7to8");
    }
    objc_msgSend(a1, "migrateDefaultPlaylistsForVersion18to19");
  }
  _objc_msgSend(a1, "migratePlaylistDefaultsForVersion66to67");
}

+ (void)migratePlaylistDefaultsForVersion66to67
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011E6E8;
  v5[3] = &unk_1004A6200;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWaitWithSave:", v5);

}

+ (void)migratePlaylistDefaultsForVersion7to8
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011E8C0;
  v5[3] = &unk_1004A6200;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWaitWithSave:", v5);

}

+ (void)migrateDefaultPlaylistsForVersion18to19
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = _MTLogCategoryDatabase(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating playlists from version 18 to 19.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011EAE4;
  v8[3] = &unk_1004A77F8;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v8);

}

+ (void)deleteOrUpdatePlaylist:(id)a3 ifIsDefault:(BOOL)a4
{
  id v4;
  id v5;

  if (a4)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    objc_msgSend(v5, "deletePlaylist:", v4);

  }
  else
  {
    v5 = a3;
    objc_msgSend(v5, "setIsBuiltIn:", 0);
  }

}

+ (BOOL)isDefaultSettingsForPlaylist:(id)a3 title:(id)a4 episodesToShow:(int64_t)a5 showPlayedEpisodes:(BOOL)a6 includeAllPodcasts:(BOOL)a7
{
  int v7;
  int v8;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  BOOL v16;

  v7 = a7;
  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  v14 = objc_msgSend(v13, "isEqualToString:", v12);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultSettings"));
    v16 = objc_msgSend(v15, "episodesToShow") == (id)a5
       && objc_msgSend(v15, "showPlayedEpisodes") == v8
       && objc_msgSend(v11, "includesAllPodcasts") == v7
       && objc_msgSend(v15, "mediaType") == 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)migrateSettingsForVersion:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v8 = v4;
  v9 = v3;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion6to7");
      goto LABEL_3;
    case 7uLL:
    case 8uLL:
    case 9uLL:
LABEL_3:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion9to10", v4, v9, v5, v6);
      goto LABEL_4;
    case 0xAuLL:
LABEL_4:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion10to11", v8, v9);
      goto LABEL_5;
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
LABEL_5:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion30to31", v8, v9);
      goto LABEL_6;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
LABEL_6:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion42to43", v8, v9);
      goto LABEL_7;
    case 0x2BuLL:
    case 0x2CuLL:
LABEL_7:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion44to45", v8, v9);
      goto LABEL_8;
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
LABEL_8:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion48to49", v8, v9);
      goto LABEL_9;
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
LABEL_9:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion58to59", v8, v9);
      goto LABEL_10;
    case 0x3BuLL:
    case 0x3CuLL:
LABEL_10:
      _objc_msgSend(a1, "migrateSettingDefaultsForVersion60to61");
      break;
    default:
      return;
  }
}

+ (void)migrateSettingDefaultsForVersion6to7
{
  void *v3;
  float v4;
  int v5;
  void *v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "floatForKey:", CFSTR("MTAutoDownload"));
  v5 = (int)v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setBool:forKey:", (v5 - 1) < 2, CFSTR("MTAutoDownloadDefaultKey"));

  v7 = objc_msgSend(a1, "episodesToKeepToEpisodeLimit:", objc_msgSend(a1, "episodesToKeepDefaultValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "setInteger:forKey:", v7, kMTPodcastEpisodeLimitDefaultKey);

}

+ (void)migrateSettingDefaultsForVersion9to10
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MTCellularDownload"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", 0, kMTWiFiDownloadOnly);

  }
}

+ (void)migrateSettingDefaultsForVersion10to11
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;
  const __CFString *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = CFSTR("MTAutoDownloadDefaultKey");
  v10 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  objc_msgSend(v2, "registerDefaults:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("MTAutoDownloadDefaultKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = v6;
  LODWORD(v8) = 0;
  if (v5)
    *(float *)&v8 = 3.0;
  objc_msgSend(v6, "setFloat:forKey:", kMTPodcastAutoDownloadStateDefaultKey, v8);

}

+ (void)migrateSettingDefaultsForVersion42to43
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  double v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v3 = kMTPodcastAutoDownloadStateDefaultKey;
  v4 = objc_msgSend(v2, "integerForKey:", kMTPodcastAutoDownloadStateDefaultKey);

  if (v4 == 1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
    LODWORD(v5) = 3.0;
    objc_msgSend(v6, "setFloat:forKey:", v3, v5);

  }
}

+ (void)migrateSettingDefaultsForVersion44to45
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  double v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v3 = kMTPodcastAutoDownloadStateDefaultKey;
  v4 = objc_msgSend(v2, "integerForKey:", kMTPodcastAutoDownloadStateDefaultKey);

  if (v4 == 0x7FFFFFFF)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
    LODWORD(v5) = 3.0;
    objc_msgSend(v6, "setFloat:forKey:", v3, v5);

  }
}

+ (void)migrateSettingDefaultsForVersion48to49
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  v2 = _MTLogCategoryDatabase(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating setting defaults from version 48 to 49.", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults showListShowsAllShowsKey](NSUserDefaults, "showListShowsAllShowsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  if (!v6)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10011F498;
    v14 = &unk_1004A6B98;
    v9 = v8;
    v15 = v9;
    v16 = buf;
    objc_msgSend(v9, "performBlockAndWait:", &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults", v11, v12, v13, v14));
    objc_msgSend(v10, "setShowListShowsAllShows:", v18[24]);

    _Block_object_dispose(buf, 8);
  }
}

+ (void)migrateSettingDefaultsForVersion58to59
{
  _UNKNOWN **v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  if (objc_msgSend(v3, "BOOLForKey:", kMTPodcastAutoDownloadStateDefaultKey))
    v2 = &off_1004D66D0;
  else
    v2 = &off_1004D66E8;
  objc_msgSend(v3, "setObject:forKey:", v2, kMTPodcastEpisodeLimitDefaultKey);

}

+ (void)migrateSettingDefaultsForVersion60to61
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("didPresentNowPlayingScrollingTip"));

  }
}

+ (void)runMigrationOnEpisodesByPodcastForVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011F7C0;
  v8[3] = &unk_1004ABE60;
  v9 = v6;
  v10 = a3;
  v11 = a1;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v8);

}

+ (void)episodeMigrationForVersion29to30:(id)a3
{
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isBackCatalogItem") && objc_msgSend(v8, "saved"))
  {
    objc_msgSend(v8, "playhead");
    v4 = v3;
    if (objc_msgSend(v8, "isPartiallyPlayedBackCatalogItem"))
      v5 = 1;
    else
      v5 = 2;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    objc_msgSend(v6, "setPlayState:manually:forUserActionOnEpisode:saveChanges:", v5, 1, v8, 0);

    LODWORD(v7) = v4;
    objc_msgSend(v8, "setPlayhead:", v7);
  }

}

+ (void)migrateSerpentId
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchBatchSize:", 200);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10012010C;
  v10 = &unk_1004A6640;
  v11 = v3;
  v12 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v6, "performBlockAndWaitWithSave:", &v7);
  +[MTDB setSerpentIdMigrationComplete:](MTDB, "setSerpentIdMigrationComplete:", 1, v7, v8, v9, v10);

}

+ (void)episodeMigrationForVersion0to1:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  id v5;

  v5 = a3;
  v3 = (unint64_t)objc_msgSend(v5, "flags");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v5, "setVideo:", (v3 >> 3) & 1);
    objc_msgSend(v5, "setAudio:", (v4 >> 4) & 1);
    objc_msgSend(v5, "setExternalType:", (v4 >> 5) & 1);
    objc_msgSend(v5, "setFlags:", 0);
  }

}

+ (void)episodeMigrationForVersion6to7:(id)a3
{
  int64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;

  v17 = a3;
  if (!objc_msgSend(v17, "playState"))
  {
    v3 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:](MTLibraryLegacyUtil, "playStateFromHasBeenPlayed:andPlayCount:", objc_msgSend(v17, "hasBeenPlayed"), objc_msgSend(v17, "playCount"));
    if (!objc_msgSend(v17, "visible"))
      v3 = 0;
    if (v3)
      v4 = objc_msgSend(v17, "manuallyAdded");
    else
      v4 = (id)(objc_msgSend(v17, "visible") ^ 1);
    objc_msgSend(v17, "setPlayState:manually:source:", v3, v4, 8);
  }
  if (objc_msgSend(v17, "persistentID"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemWithPersistentID:", objc_msgSend(v17, "persistentID")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem itemWithMPMediaItem:](MTMLMediaItem, "itemWithMPMediaItem:", v6));
    v8 = v7;
    if (v7)
      v9 = v6 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      objc_msgSend(v17, "setIsFromITunesSync:", objc_msgSend(v7, "isFromITunesSync"));
      if (objc_msgSend(v8, "isMissingAsset"))
        objc_msgSend(v17, "setAssetURL:", 0);
      v10 = objc_msgSend(v17, "persistentID");
      objc_msgSend(v17, "playhead");
      +[MTMediaLibraryUtil updateMediaLibraryItem:playhead:playState:playCount:](MTMediaLibraryUtil, "updateMediaLibraryItem:playhead:playState:playCount:", v10, objc_msgSend(v17, "playState"), objc_msgSend(v17, "playCount"), v11);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "podcast"));
  if (!objc_msgSend(v12, "deletePlayedEpisodesResolvedValue"))
    goto LABEL_24;
  if (!objc_msgSend(v17, "manuallyAdded"))
    goto LABEL_24;
  if (!objc_msgSend(v17, "visible"))
    goto LABEL_24;
  if ((objc_msgSend(v17, "userDeleted") & 1) != 0)
    goto LABEL_24;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetURL"));
  if (!v13)
    goto LABEL_24;
  v14 = (void *)v13;
  v15 = objc_msgSend(v17, "isFromITunesSync");

  v16 = v17;
  if ((v15 & 1) == 0)
  {
    objc_msgSend(v17, "setSaved:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "podcast"));
    objc_msgSend(v12, "setShowPlacardForSavedEpisodes:", 1);
LABEL_24:

    v16 = v17;
  }
  objc_msgSend(v16, "setSuppressAutoDownload:", 1);
  objc_msgSend(v17, "pubDate");
  objc_msgSend(v17, "setImportDate:");

}

+ (void)episodeMigrationForVersion13to14:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcast"));
  objc_msgSend(v3, "pubDate");
  v5 = v4;
  objc_msgSend(v7, "lastTouchDate");
  objc_msgSend(v3, "setIsNew:", v5 > v6);

}

+ (void)episodeMigrationForVersion16to17:(id)a3
{
  id v3;

  v3 = a3;
  if (!objc_msgSend(v3, "playState")
    && objc_msgSend(v3, "playStateManuallySet")
    && objc_msgSend(v3, "playStateSource") == (id)6)
  {
    objc_msgSend(v3, "setBackCatalog:", 1);
  }

}

+ (void)episodeMigrationForVersion17to18:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemDescription"));
  objc_msgSend(v3, "setItemDescriptionHasHTML:", objc_msgSend(v4, "hasHTML"));

}

+ (void)episodeMigrationForVersion21to22:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "itemDescriptionHasHTML"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringBySmartlyStrippingHTML"));
    objc_msgSend(v5, "setItemDescriptionWithoutHTML:", v4);

  }
}

+ (void)episodeMigrationForVersion23to24:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  +[MTUniversalPlaybackPositionDataSource uppLastSyncTime](MTUniversalPlaybackPositionDataSource, "uppLastSyncTime");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadataIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uppMetadataForMetadataIdentifier:", v6));

  if (v7)
  {
    objc_msgSend(v12, "metadataTimestamp");
    v9 = v8;
    objc_msgSend(v7, "timestamp");
    if (v9 != v10)
    {
      objc_msgSend(v12, "metadataTimestamp");
      if (v11 < v4)
        objc_msgSend(v12, "updateUPPTimestamp");
    }
  }

}

+ (BOOL)runMigrationForPodcast:(id)a3 version:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  int v14;
  void *v15;
  __int16 v16;
  int64_t v17;

  v6 = a3;
  v7 = _MTLogCategoryDatabase(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v14 = 138543618;
    v15 = v9;
    v16 = 2048;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Running migration on podcast with uuid %{public}@ for version %ld", (uint8_t *)&v14, 0x16u);

  }
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
      if ((objc_msgSend(v6, "flags") & 0x40) != 0)
      {
        v10 = 0x7FFFFFFFLL;
      }
      else
      {
        if (!objc_msgSend(v6, "autoDownload"))
          goto LABEL_9;
        v10 = 1;
      }
      objc_msgSend(v6, "setAutoDownloadType:", v10);
      goto LABEL_9;
    case 3:
    case 4:
    case 5:
LABEL_9:
      objc_msgSend(v6, "setUpdateInterval:", 0);
      v11 = objc_msgSend(v6, "darkCount");
      if ((uint64_t)v11 < kMTGoDarkCountLimit)
        objc_msgSend(v6, "updateLastTouchDate");
      goto LABEL_11;
    case 6:
LABEL_11:
      objc_msgSend(a1, "podcastMigrationForVersion6to7:", v6);
      goto LABEL_12;
    case 7:
    case 8:
LABEL_12:
      if ((objc_msgSend(a1, "podcastMigrationForVersion8to9:", v6) & 1) == 0)
        goto LABEL_14;
      v12 = 1;
      goto LABEL_42;
    case 9:
LABEL_14:
      objc_msgSend(a1, "podcastMigrationForVersion9to10:", v6);
      goto LABEL_15;
    case 10:
    case 11:
LABEL_15:
      objc_msgSend(a1, "podcastMigrationForVersion11to12:", v6);
      goto LABEL_16;
    case 12:
    case 13:
    case 14:
LABEL_16:
      objc_msgSend(a1, "podcastMigrationForVersion14to15:", v6);
      goto LABEL_17;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
LABEL_17:
      objc_msgSend(a1, "podcastMigrationForVersion19to20:", v6);
      goto LABEL_18;
    case 20:
LABEL_18:
      objc_msgSend(a1, "podcastMigrationForVersion20to21:", v6);
      goto LABEL_19;
    case 21:
    case 22:
    case 23:
    case 24:
LABEL_19:
      objc_msgSend(a1, "podcastMigrationForVersion24to25:", v6);
      goto LABEL_20;
    case 25:
LABEL_20:
      objc_msgSend(a1, "podcastMigrationForVersion25to26:", v6);
      goto LABEL_21;
    case 26:
LABEL_21:
      objc_msgSend(a1, "podcastMigrationForVersion26to27:", v6);
      goto LABEL_22;
    case 27:
LABEL_22:
      objc_msgSend(a1, "podcastMigrationForVersion27to28:", v6);
      goto LABEL_23;
    case 28:
LABEL_23:
      objc_msgSend(a1, "podcastMigrationForVersion28to29:", v6);
      goto LABEL_24;
    case 29:
    case 30:
    case 31:
LABEL_24:
      objc_msgSend(a1, "podcastMigrationForVersion32to33:", v6);
      goto LABEL_25;
    case 32:
    case 33:
    case 34:
LABEL_25:
      objc_msgSend(a1, "podcastMigrationForVersion34to35:", v6);
      goto LABEL_26;
    case 35:
LABEL_26:
      objc_msgSend(a1, "podcastMigrationForVersion35to36:", v6);
      goto LABEL_27;
    case 36:
LABEL_27:
      objc_msgSend(a1, "podcastMigrationForVersion36to37:", v6);
      goto LABEL_28;
    case 37:
    case 38:
LABEL_28:
      objc_msgSend(a1, "podcastMigrationForVersion38to39:", v6);
      goto LABEL_29;
    case 39:
    case 40:
    case 41:
LABEL_29:
      objc_msgSend(a1, "podcastMigrationForVersion41to42:", v6);
      goto LABEL_30;
    case 42:
LABEL_30:
      objc_msgSend(a1, "podcastMigrationForVersion42to43:", v6);
      goto LABEL_31;
    case 43:
    case 44:
LABEL_31:
      objc_msgSend(a1, "podcastMigrationForVersion44to45:", v6);
      goto LABEL_32;
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
LABEL_32:
      objc_msgSend(a1, "podcastMigrationForVersion49to50:", v6);
      goto LABEL_33;
    case 50:
LABEL_33:
      objc_msgSend(a1, "podcastMigrationForVersion50to51:", v6);
      goto LABEL_34;
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
LABEL_34:
      objc_msgSend(a1, "podcastMigrationForVersion55to56:", v6);
      goto LABEL_35;
    case 56:
LABEL_35:
      objc_msgSend(a1, "podcastMigrationForVersion56to57:", v6);
      goto LABEL_36;
    case 57:
LABEL_36:
      objc_msgSend(a1, "podcastMigrationForVersion57to58:", v6);
      goto LABEL_37;
    case 58:
LABEL_37:
      objc_msgSend(a1, "podcastMigrationForVersion58to59:", v6);
      goto LABEL_38;
    case 59:
LABEL_38:
      objc_msgSend(a1, "podcastMigrationForVersion59to60:", v6);
      goto LABEL_39;
    case 60:
    case 61:
    case 62:
LABEL_39:
      objc_msgSend(a1, "podcastMigrationForVersion62to63:", v6);
      goto LABEL_40;
    case 63:
    case 64:
    case 65:
    case 66:
LABEL_40:
      objc_msgSend(a1, "podcastMigrationForVersion66to67:", v6);
      break;
    default:
      break;
  }
  v12 = 0;
LABEL_42:

  return v12;
}

+ (void)podcastMigrationForVersion66to67:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setFetchBatchSize:", 200);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v6));
  objc_msgSend(v5, "setPredicate:", v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100120B64;
  v11[3] = &unk_1004A7398;
  v12 = v4;
  v13 = v5;
  v14 = v3;
  v8 = v3;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v10, "performBlockAndWaitWithSave:", v11);

}

+ (void)podcastMigrationForVersion62to63:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100120D48;
  v5[3] = &unk_1004A6640;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
  v3 = v7;
  v4 = v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

}

+ (void)podcastMigrationForVersion59to60:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  objc_msgSend(v3, "calculateNewEpisodeCountIn:serialShowsUseExperimentalRules:", v4, 0);

}

+ (void)podcastMigrationForVersion58to59:(id)a3
{
  void *v3;
  const mach_header_64 *v4;
  void *v5;
  const mach_header_64 *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v4 = (const mach_header_64 *)objc_msgSend(v3, "episodeLimitForKey:", kMTPodcastEpisodeLimitDefaultKey);

  if (!objc_msgSend(v7, "autoDownloadEnabled"))
  {
    v5 = v7;
    if (v4 == &_mh_execute_header)
      v6 = (const mach_header_64 *)((char *)&_mh_execute_header.magic + 1);
    else
      v6 = &_mh_execute_header;
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "episodeLimit") == v4)
  {
    v5 = v7;
    v6 = &_mh_execute_header + 1;
LABEL_7:
    objc_msgSend(v5, "setEpisodeLimit:", v6);
  }

}

+ (void)podcastMigrationForVersion57to58:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloadedEpisodesOnPodcastUuid:](MTEpisode, "predicateForDownloadedEpisodesOnPodcastUuid:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));

  v8 = kMTEpisodeEntityName;
  objc_msgSend(v3, "setDownloadedUnplayedEpisodesCount:", objc_msgSend(v13, "countOfObjectsInEntity:predicate:", kMTEpisodeEntityName, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:](MTEpisode, "predicateForBookmarkedEpisodesOnPodcastUuid:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AND:", v11));

  objc_msgSend(v3, "setSavedUnplayedEpisodesCount:", objc_msgSend(v13, "countOfObjectsInEntity:predicate:", v8, v12));
}

+ (void)podcastMigrationForVersion56to57:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "hidden") & 1) != 0)
    v3 = 1;
  else
    v3 = (uint64_t)objc_msgSend(v4, "isImplicitlyFollowed");
  objc_msgSend(v4, "setIsHiddenOrImplicitlyFollowed:", v3);

}

+ (void)podcastMigrationForVersion55to56:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isSerialShowTypeInFeed") && objc_msgSend(v3, "showTypeUserSetting") == (id)1)
    objc_msgSend(v3, "setShowTypeSetting:", 2);

}

+ (void)podcastMigrationForVersion50to51:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", kMTPodcastAutoDownloadStateDefaultKey);

  objc_msgSend(v5, "setAutoDownloadEnabled:", v4);
}

+ (void)podcastMigrationForVersion49to50:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating podcasts from version 49 to 50.", v21, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v7 = kMTEpisodeEntityName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:](MTEpisode, "predicateForBookmarkedEpisodesOnPodcastUuid:", v8));
  v10 = objc_msgSend(v6, "countOfObjectsInEntity:predicate:", v7, v9);

  objc_msgSend(v3, "setSavedEpisodesCount:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloadedEpisodesOnPodcastUuid:](MTEpisode, "predicateForDownloadedEpisodesOnPodcastUuid:", v11));
  v13 = objc_msgSend(v6, "countOfObjectsInEntity:predicate:", v7, v12);

  objc_msgSend(v3, "setDownloadedEpisodesCount:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForLibraryEpisodesOnPodcastUuid:](MTEpisode, "predicateForLibraryEpisodesOnPodcastUuid:", v14));
  v16 = objc_msgSend(v6, "countOfObjectsInEntity:predicate:", v7, v15);

  objc_msgSend(v3, "setLibraryEpisodesCount:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:](MTEpisode, "predicateForBookmarkedEpisodesOnPodcastUuid:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "AND:", v19));

  objc_msgSend(v3, "setSavedUnplayedEpisodesCount:", objc_msgSend(v6, "countOfObjectsInEntity:predicate:", v7, v20));
}

+ (void)podcastMigrationForVersion44to45:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v4 = objc_msgSend(v3, "integerForKey:", kMTPodcastAutoDownloadStateDefaultKey);

  if (objc_msgSend(v5, "autoDownloadType") == 0x7FFFFFFF)
    objc_msgSend(v5, "setAutoDownloadType:", v4);

}

+ (void)podcastMigrationForVersion42to43:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "autoDownloadType") == 1)
    objc_msgSend(v3, "setAutoDownloadType:", 3);

}

+ (void)podcastMigrationForVersion41to42:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayType"));

  if (!v3)
  {
    v5 = NSPersistentStringForMTDisplayType(0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v7, "setDisplayType:", v6);

  }
}

+ (void)podcastMigrationForVersion38to39:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = objc_msgSend(v8, "showTypeSetting");
  if (v3 == (id)3)
  {
    v5 = (uint64_t)+[MTPodcast defaultShowType](MTPodcast, "defaultShowType");
LABEL_14:
    v7 = v8;
LABEL_15:
    objc_msgSend(v7, "setShowTypeSetting:", v5);
    v4 = v8;
    goto LABEL_16;
  }
  if (v3 == (id)2)
  {
    v6 = objc_msgSend(v8, "isSerialShowTypeInFeed") == 0;
    v7 = v8;
    if (v6)
      v5 = 4;
    else
      v5 = 2;
    goto LABEL_15;
  }
  v4 = v8;
  if (!v3)
  {
    if (objc_msgSend(v8, "sortAscending")
      && (objc_msgSend(v8, "isSerialShowTypeInFeed") & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v8, "sortAscending"))
    {
      v5 = 4;
    }
    else
    {
      v5 = 1;
    }
    goto LABEL_14;
  }
LABEL_16:

}

+ (void)podcastMigrationForVersion36to37:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = kMTEpisodeEntityName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForListenNowForPodcastUuid:](MTEpisode, "predicateForListenNowForPodcastUuid:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](MTEpisode, "sortDescriptorsForListenNow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", v5, v7, v8, 0, 0));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid", (_QWORD)v19));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextEpisodeUuid"));
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) == 0)
          objc_msgSend(v15, "setListenNowEpisode:", 0);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

+ (void)podcastMigrationForVersion34to35:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v4, 0, v3));

  objc_msgSend(v5, "modifiedDate");
  objc_msgSend(v16, "setModifiedDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextEpisodeUuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeUuid"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextEpisodeUuid"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextEpisodeUuid"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeForUuid:", v10));

      objc_msgSend(v11, "setListenNowEpisode:", 0);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeUuid"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeUuid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeForUuid:", v13));

      objc_msgSend(v14, "setListenNowEpisode:", 1);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeUuid"));
    objc_msgSend(v16, "setNextEpisodeUuid:", v15);

  }
}

+ (void)podcastMigrationForVersion32to33:(id)a3
{
  objc_msgSend(a3, "setPodcastPID:", 0);
}

+ (void)podcastMigrationForVersion28to29:(id)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "addedDate");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "newestEpisode"));
  objc_msgSend(v5, "pubDate");
  if (v6 > 0.0)
  {
    objc_msgSend(v5, "pubDate");
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  objc_msgSend(v5, "importDate");
  if (v8 > 0.0)
  {
    objc_msgSend(v5, "importDate");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v9, "setFeedChangedDate:", v4);

}

+ (void)podcastMigrationForVersion27to28:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "episodeLimit") == (id)0xFFFFFFFFLL)
    objc_msgSend(v3, "setEpisodeLimit:", +[MTPodcast episodeLimitDefaultValue](MTPodcast, "episodeLimitDefaultValue"));

}

+ (void)podcastMigrationForVersion20to21:(id)a3
{
  objc_msgSend(a3, "setNotifications:", 1);
}

+ (void)podcastMigrationForVersion19to20:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = kMTEpisodeEntityName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v6));
  v8 = kEpisodeLastDatePlayed;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLastDatePlayed, 0));
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v16 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  LOBYTE(v15) = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:", v5, v7, v10, v11, 0, 1, v15, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v8));

  if (v14)
  {
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setLastDatePlayed:");
  }

}

+ (void)podcastMigrationForVersion14to15:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setNeedsArtworkUpdate:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageURL"));

  if (v3)
  {
    v4 = objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageURL"));
    v6 = objc_msgSend(v4, "init:nonAppInitiated:", v5, objc_msgSend(v9, "requestsAreNonAppInitiated"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageDownloader sharedInstance](MTImageDownloader, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
    objc_msgSend(v7, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:", v8, v6, 0, 0, 0);

  }
}

+ (void)podcastMigrationForVersion11to12:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "autoDownloadType") == -1)
    objc_msgSend(v3, "setAutoDownloadType:", 0x7FFFFFFFLL);

}

+ (void)podcastMigrationForVersion9to10:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setDarkCountLocal:", objc_msgSend(v3, "darkCount"));

}

+ (void)podcastMigrationForVersion6to7:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
    objc_msgSend(v9, "setUuid:", v5);

  }
  v6 = objc_msgSend(v9, "keepEpisodes");
  v7 = v6;
  if ((_DWORD)v6 == -1)
    v7 = objc_msgSend(a1, "episodesToKeepDefaultValue");
  if (v7 == 1)
    v8 = 0xFFFFFFFFLL;
  else
    v8 = 0;
  objc_msgSend(v9, "setDeletePlayedEpisodes:", v8);
  if (v7 != 1)
    objc_msgSend(v9, "setShowPlacardForRemovePlayedEpisodes:", 1);
  objc_msgSend(v9, "setEpisodeLimit:", objc_msgSend(a1, "episodesToKeepToEpisodeLimit:", v6));
  if (objc_msgSend(v9, "autoDownloadType") == 2)
    objc_msgSend(v9, "setAutoDownloadType:", 1);

}

+ (BOOL)podcastMigrationForVersion8to9:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedURL"));
  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodes"));
    v6 = objc_msgSend(v5, "count");

    if (v6 != (id)1)
      goto LABEL_6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetURL"));
    if (objc_msgSend(v9, "length"))
    {

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enclosureURL"));
      v13 = objc_msgSend(v12, "length");

      if (!v13)
      {
        v15 = _MTLogCategoryDatabase(v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
          v20 = 138543362;
          v21 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Will delete podcast %{public}@ during migration", (uint8_t *)&v20, 0xCu);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
        objc_msgSend(v18, "deletePodcastWithUuid:", v19);

        v10 = 1;
        goto LABEL_10;
      }
    }
    v10 = 0;
LABEL_10:

    goto LABEL_7;
  }

LABEL_6:
  v10 = 0;
LABEL_7:

  return v10;
}

+ (void)runMigrationOnAllEpisodesForVersion:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  id v13;
  uint8_t buf[4];
  int64_t v15;

  v5 = _MTLogCategoryDatabase(a1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Running migration on all episodes for version %ld", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100121FE8;
  v10[3] = &unk_1004ABE60;
  v12 = a3;
  v13 = a1;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "performBlockAndWaitWithSave:", v10);

}

+ (void)allEpisodesMigrationForVersion68to69In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  const __CFString *v27;
  void *v28;

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Deleting itemDescriptionWithHTML for upgrade from version 68 to 69.", buf, 2u);
  }

  v6 = objc_alloc((Class)NSBatchUpdateRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode entity](MTEpisode, "entity"));
  v8 = objc_msgSend(v6, "initWithEntity:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@ != nil"), CFSTR("itemDescriptionWithHTML")));
  objc_msgSend(v8, "setPredicate:", v9);

  v27 = CFSTR("itemDescriptionWithHTML");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v28 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  objc_msgSend(v8, "setPropertiesToUpdate:", v11);

  v22 = 0;
  v12 = objc_msgSend(v3, "executeRequest:error:", v8, &v22);
  v13 = v22;
  v14 = _MTLogCategoryDatabase(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v17 = +[MTDB libraryDataVersion](MTDB, "libraryDataVersion");
      *(_DWORD *)buf = 134218242;
      v24 = v17;
      v25 = 2112;
      v26 = v13;
      v18 = "[Migration] (Data) (Initial Version: %li) itemDescriptionWithHTML migration failed with error %@";
      v19 = v16;
      v20 = OS_LOG_TYPE_FAULT;
      v21 = 22;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v18 = "[Migration] (Data) Finished deleting itemDescriptionWithHTML for upgrade from version 68 to 69.";
    v19 = v16;
    v20 = OS_LOG_TYPE_DEFAULT;
    v21 = 2;
    goto LABEL_8;
  }

}

+ (void)allEpisodesMigrationForVersion65to66In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 65 to 66 (migrate all Up Next episodes to have calculated modifiedDateScore values", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForListenNow](MTEpisode, "predicateForListenNow"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001223E8;
  v8[3] = &unk_1004A6200;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsInEntity:predicate:sortDescriptors:", kMTEpisodeEntityName, v6, 0));
  v7 = v9;
  objc_msgSend(v3, "performBlockAndWaitWithSave:", v8);

}

+ (void)allEpisodesMigrationForVersion59to60In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;
  void *v23;

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all trailers from version 54 to 55 (migrate all episode 0's to nulls", buf, 2u);
  }

  v6 = kEpisodeEpisodeNumber;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = 0)"), kEpisodeEpisodeNumber));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](MTEpisode, "predicateForEpisodeType:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v10, "setPredicate:", v9);
  v22 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v10, "setPropertiesToUpdate:", v12);

  objc_msgSend(v10, "setResultType:", 2);
  v19 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v10, &v19));

  v14 = v19;
  v15 = _MTLogCategoryDatabase(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "result"));
    *(_DWORD *)buf = 138412290;
    v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null", buf, 0xCu);

  }
}

+ (void)allEpisodesMigrationForVersion54to55In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;
  _UNKNOWN **v22;

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all trailers from version 54 to 55 (migrate all episode 0's to nulls", buf, 2u);
  }

  v6 = kEpisodeEpisodeNumber;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = NULL)"), kEpisodeEpisodeNumber));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](MTEpisode, "predicateForEpisodeType:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v10, "setPredicate:", v9);
  v21 = v6;
  v22 = &off_1004D6700;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  objc_msgSend(v10, "setPropertiesToUpdate:", v11);

  objc_msgSend(v10, "setResultType:", 2);
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v10, &v18));

  v13 = v18;
  v14 = _MTLogCategoryDatabase(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "result"));
    *(_DWORD *)buf = 138412290;
    v20 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null", buf, 0xCu);

  }
}

+ (void)allEpisodesMigrationForVersion53to54In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;
  void *v21;

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 53 to 54 (migrate all episode 0's to nulls", buf, 2u);
  }

  v6 = kEpisodeEpisodeNumber;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = 0)"), kEpisodeEpisodeNumber));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v8, "setPredicate:", v7);
  v20 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v8, "setPropertiesToUpdate:", v10);

  objc_msgSend(v8, "setResultType:", 2);
  v17 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v8, &v17));

  v12 = v17;
  v13 = _MTLogCategoryDatabase(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));
    *(_DWORD *)buf = 138412290;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null", buf, 0xCu);

  }
}

+ (void)allEpisodesMigrationForVersion51to52In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;
  void *v21;

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 51 to 52 (migrate all season 0's to nulls", buf, 2u);
  }

  v6 = kEpisodeSeasonNumber;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = 0)"), kEpisodeSeasonNumber));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v8, "setPredicate:", v7);
  v20 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v8, "setPropertiesToUpdate:", v10);

  objc_msgSend(v8, "setResultType:", 2);
  v17 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v8, &v17));

  v12 = v17;
  v13 = _MTLogCategoryDatabase(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all season 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));
    *(_DWORD *)buf = 138412290;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from season 0 to null", buf, 0xCu);

  }
}

+ (void)allEpisodesMigrationForVersion47to48In:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;
  _UNKNOWN **v22;

  v3 = a3;
  v4 = _MTLogCategoryDatabase(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 47 to 48.", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AND:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v10, "setPredicate:", v9);
  v21 = kEpisodeDownloadBehavior;
  v22 = &off_1004D6718;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  objc_msgSend(v10, "setPropertiesToUpdate:", v11);

  objc_msgSend(v10, "setResultType:", 2);
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v10, &v18));

  v13 = v18;
  v14 = _MTLogCategoryDatabase(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate undownloaded episodes to MTEpisodeDownloadBehaviorAutomaticSuppressed %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "result"));
    *(_DWORD *)buf = 138412290;
    v20 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ My Episodes successfully migrated undownloaded episodes to MTEpisodeDownloadBehaviorAutomaticSuppressed", buf, 0xCu);

  }
}

+ (void)allEpisodesMigrationForVersion46to47In:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesWhichNeedEntitlementStateUpdate](MTEpisode, "predicateForEpisodesWhichNeedEntitlementStateUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsInEntity:predicate:sortDescriptors:", kMTEpisodeEntityName, v4, 0));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "updateEntitlementState");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (void)allEpisodesMigrationForVersion45to46In:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSaved:](MTEpisode, "predicateForSaved:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v5));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001232FC;
  v8[3] = &unk_1004A6200;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsInEntity:predicate:sortDescriptors:", kMTEpisodeEntityName, v6, 0));
  v7 = v9;
  objc_msgSend(v3, "performBlockAndWaitWithSave:", v8);

}

+ (void)allEpisodesMigrationForVersion43to44In:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  unint64_t v37;
  _BYTE v38[128];

  v4 = a3;
  objc_msgSend(a1, "rollbackMigrationV40IfNeededInContext:", v4);
  v5 = kMTEpisodeEntityName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSaved:](MTEpisode, "predicateForSaved:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForPubDateAscending:](MTEpisode, "sortDescriptorsForPubDateAscending:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsInEntity:predicate:sortDescriptors:", v5, v6, v7));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (v12 > 0x12B)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "setIsBookmarksMigrationRecoveredEpisode:", 1);
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "setIsBookmarked:", 1);
          objc_msgSend(v15, "pubDate");
          objc_msgSend(v15, "setLastBookmarkedDate:");
          ++v12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v17 = _MTLogCategoryDatabase(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Bookmarks migration run for %lu previously saved episodes.", buf, 0xCu);
  }

  if ((unint64_t)objc_msgSend(v9, "count") >= 0x12D)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v19, "setBool:forKey:", 1, kHasSavedEpisodesOffLimitsMigratedOnDataVersion44);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", v5));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), kEpisodeUserEpisode, &__kCFBooleanTrue));
  objc_msgSend(v20, "setPredicate:", v21);

  v34 = kEpisodeIsBookmarksMigrationRecoveredEpisode;
  v35 = &__kCFBooleanTrue;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  objc_msgSend(v20, "setPropertiesToUpdate:", v22);

  objc_msgSend(v20, "setResultType:", 2);
  v29 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeRequest:error:", v20, &v29));
  v24 = v29;
  v25 = _MTLogCategoryDatabase(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v24)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = (unint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate My Episodes to recoveredEpisodes failed %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "result"));
    *(_DWORD *)buf = 138412290;
    v37 = (unint64_t)v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ My Episodes successfully migrated to Recovered Episodes.", buf, 0xCu);

  }
}

+ (void)rollbackMigrationV40IfNeededInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;
  void *v38;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BookmarksMigrationRegistry migrationRegisteredAtVersion:](_TtC8Podcasts26BookmarksMigrationRegistry, "migrationRegisteredAtVersion:", 40));
  v5 = v4;
  if (v4)
  {
    v33 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuids"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v8 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuids:](MTEpisode, "predicateForEpisodeUuids:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllBookmarkedEpisodes](MTEpisode, "predicateForAllBookmarkedEpisodes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSaved:](MTEpisode, "predicateForSaved:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 120.0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", -120.0));

    v15 = kEpisodeLastBookmarkedDate;
    v30 = (void *)v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForDateKey:isLessThanOrEqualToDate:](NSPredicate, "predicateForDateKey:isLessThanOrEqualToDate:", kEpisodeLastBookmarkedDate, v12));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForDateKey:isGreaterThanOrEqualToDate:](NSPredicate, "predicateForDateKey:isGreaterThanOrEqualToDate:", v15, v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "AND:", v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
    v31 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AND:", v18));
    v32 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "AND:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject AND:](v8, "AND:", v21));
    objc_msgSend(v19, "setPredicate:", v22);

    v3 = v33;
    v37 = kEpisodeIsBookmarked;
    v38 = &__kCFBooleanFalse;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    objc_msgSend(v19, "setPropertiesToUpdate:", v23);

    v34 = 0;
    v24 = objc_msgSend(v33, "executeRequest:error:", v19, &v34);
    v25 = v34;
    v26 = _MTLogCategoryDatabase(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (v25)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to roll back version 40 migration failed %@", buf, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Version 40 migration correctly rolled back.", buf, 2u);
      }

      +[BookmarksMigrationRegistry deleteMigrationRegistryAtVersion:](_TtC8Podcasts26BookmarksMigrationRegistry, "deleteMigrationRegistryAtVersion:", 40);
    }

  }
  else
  {
    v29 = _MTLogCategoryDatabase(0);
    v8 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) No v40 migration detected, nothing to roll back", buf, 2u);
    }
  }

}

+ (void)allEpisodesMigrationForVersion40to41In:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSuppressAutoDownload:](MTEpisode, "predicateForSuppressAutoDownload:", 1));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchBatchSize:", 200);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:", v4));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        objc_msgSend(v12, "setDownloadBehavior:", 1, (_QWORD)v14);
        if (!(((unint64_t)v11 + v9 + 1) % (unint64_t)objc_msgSend(v4, "fetchBatchSize")))
          objc_msgSend(v3, "saveInCurrentBlock");
        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v9 += (uint64_t)v8;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "saveInCurrentBlock");
}

+ (void)deleteDuplicateVideoEpisodesForRdar59691904
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000468F4;
  v10 = sub_100046AE4;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100123E38;
  v5[3] = &unk_1004A6530;
  v5[4] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
  objc_msgSend(v4, "deleteEpisodeUuids:forced:", v7[5], 1);

  _Block_object_dispose(&v6, 8);
}

+ (void)moveEpisodeAssetsToSharedContainer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 0));
  objc_msgSend(v5, "setPredicate:", v6);

  v15[0] = kEpisodeUuid;
  v15[1] = kEpisodeAssetURL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  objc_msgSend(v5, "setPropertiesToFetch:", v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012420C;
  v11[3] = &unk_1004A7398;
  v12 = v3;
  v13 = v5;
  v14 = v4;
  v8 = v4;
  v9 = v5;
  v10 = v3;
  objc_msgSend(v10, "performBlockAndWaitWithSave:", v11);

}

+ (void)removeAllEpisodesFromMediaLibrary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _UNKNOWN **v15;

  +[MPMediaQuery setFilteringDisabled:](MPMediaQuery, "setFilteringDisabled:", 1);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100124858;
  v12[3] = &unk_1004ABE88;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v2 = v13;
  objc_msgSend(v2, "performTransactionWithBlock:", v12);
  +[MPMediaQuery setFilteringDisabled:](MPMediaQuery, "setFilteringDisabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBatchUpdateRequest batchUpdateRequestWithEntityName:](NSBatchUpdateRequest, "batchUpdateRequestWithEntityName:", kMTEpisodeEntityName));
  v14 = kEpisodePersistentID;
  v15 = &off_1004D6700;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  objc_msgSend(v3, "setPropertiesToUpdate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012489C;
  v9[3] = &unk_1004A6640;
  v10 = v6;
  v11 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

+ (void)prunePersistentHistory
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int v13;
  uint8_t buf[4];
  int v15;

  v2 = _MTLogCategoryDatabase(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = 14;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Will prune persistent history older than %d days old", buf, 8u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1209600.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeDate:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100124B0C;
  v10[3] = &unk_1004A76E8;
  v11 = v7;
  v12 = v5;
  v13 = 14;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v10);

}

+ (int)episodesToKeepDefaultValue
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MTPodcastKeepEpisodesDefault"));

  return v3;
}

+ (int64_t)episodesToKeepToEpisodeLimit:(int)a3
{
  if ((a3 + 1) > 7)
    return 0;
  else
    return qword_1003C84F8[a3 + 1];
}

+ (void)recalculateAllPlaylists
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100124D30;
  v5[3] = &unk_1004A6200;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWaitWithSave:", v5);

}

+ (void)touchAllMigrationVersions
{
  objc_msgSend(a1, "touchLibraryMigrationVersion");
  objc_msgSend(a1, "touchCoreDataMigrationVersion");
}

+ (void)touchLibraryMigrationVersion
{
  +[MTDB setLibraryDataVersion:](MTDB, "setLibraryDataVersion:", 70);
}

+ (void)touchCoreDataMigrationVersion
{
  +[MTDB setCoreDataVersion:](MTDB, "setCoreDataVersion:", 141);
}

+ (BOOL)needToMigrateDataToSharedContainer
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  int v14;

  v2 = objc_msgSend((id)objc_opt_class(a1), "legacyLibraryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryPath](MTDB, "libraryPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
  v12 = v11;
  v13 = CFSTR("not required");
  v14 = v6 & (v10 ^ 1);
  if (v14)
    v13 = CFSTR("required");
  objc_msgSend(v11, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2560, CFSTR("Migrate data to shared container is %@"), v13);

  return v14;
}

+ (id)legacyLibraryPath
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v5 = objc_alloc((Class)NSString);
  v6 = (objc_class *)objc_opt_class(MTLibrary);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@.sqlite"), v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v9));
  return v10;
}

+ (BOOL)moveSQLiteFilesFromDocumentsToSharedContainer
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v34;
  id v35;
  id v36;

  v2 = objc_msgSend((id)objc_opt_class(a1), "legacyLibraryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryPath](MTDB, "libraryPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v36 = 0;
  v6 = objc_msgSend(v5, "moveItemAtURL:toURL:error:", v3, v4, &v36);
  v7 = v36;

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v8, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2728, CFSTR("Error moving database to %@ from %@"), v4, v3);

    objc_msgSend(v7, "logAndThrow:printStackTrace:", 0, 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("-shm")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));

  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("-shm")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v35 = 0;
      objc_msgSend(v18, "moveItemAtURL:toURL:error:", v11, v17, &v35);
      v19 = v35;

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
        objc_msgSend(v20, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2741, CFSTR("Error moving database shm to %@ from %@"), v17, v11);

        objc_msgSend(v19, "logAndThrow:printStackTrace:", 0, 0);
      }

    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("-wal")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));

  if (v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
    v26 = objc_msgSend(v24, "fileExistsAtPath:", v25);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("-wal")));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v28));

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v34 = 0;
      objc_msgSend(v30, "moveItemAtURL:toURL:error:", v23, v29, &v34);
      v31 = v34;

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
        objc_msgSend(v32, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2755, CFSTR("Error moving database wal to %@ from %@"), v31, v23);

        objc_msgSend(v31, "logAndThrow:printStackTrace:", 0, 0);
      }

    }
  }

  return v6;
}

+ (void)setLastLaunchFromDatabase
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = _MTLogCategoryLifecycle(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SourceLastLaunchFromDB", ", (uint8_t *)&v16, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mostRecentPlayTimeFromDatabase"));
  v10 = v8;
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v6, "SourceLastLaunchFromDB", ", (uint8_t *)&v16, 2u);
  }

  v13 = _MTLogCategoryLifecycle(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v9)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Setting new value for last use from database: %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v3, "setLastAppUseDate:", v9);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to update last launch from the database.", (uint8_t *)&v16, 2u);
    }

  }
}

+ (id)_mostRecentPlayTimeFromDatabase
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateQueueContext"));

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000468F4;
  v16 = sub_100046AE4;
  v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100125834;
  v8[3] = &unk_1004A6F88;
  v11 = a1;
  v5 = v4;
  v9 = v5;
  v10 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

+ (id)_fetchRequestForMostRecentlyPlayedEpisode
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v2, "setResultType:", 2);
  v3 = objc_alloc((Class)NSSortDescriptor);
  v4 = kEpisodeLastDatePlayed;
  v5 = objc_msgSend(v3, "initWithKey:ascending:", kEpisodeLastDatePlayed, 0);
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v2, "setSortDescriptors:", v6);

  v10[0] = kObjectID;
  v10[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  objc_msgSend(v2, "setPropertiesToFetch:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), v4));
  objc_msgSend(v2, "setPredicate:", v8);

  objc_msgSend(v2, "setFetchLimit:", 1);
  return v2;
}

+ (void)_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = kMTPodcastEpisodeLimitDefaultKey;
  v8 = v3;
  v5 = objc_msgSend(v3, "episodeLimitForKey:", kMTPodcastEpisodeLimitDefaultKey);
  v6 = PFMostRestrictiveLimit(+[MTPreferences defaultEpisodeLimit](MTPreferences, "defaultEpisodeLimit"), v5);
  if ((id)v6 != v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v6));
    objc_msgSend(v8, "setObject:forKey:", v7, v4);

  }
}

@end
