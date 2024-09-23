@implementation BKLibraryDataSourceBLDownload

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRestoreControllers:(id)a3
{
  objc_storeStrong((id *)&self->_restoreControllers, a3);
}

- (void)setReloadCounterpartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (void)setITunesSyncedBooksPlistCleaner:(id)a3
{
  objc_storeWeak((id *)&self->_iTunesSyncedBooksPlistCleaner, a3);
}

- (void)setGenerationChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDidLoadSupplementalAssetHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)reloadDownloadQueue
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  if (v5 - self->_lastDownloadQueueReload <= 14400.0)
  {
    v12 = BCBookDownloadLog(v6, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Suppressing reloadFromServer due to time clamp", v13, 2u);
    }
  }
  else
  {
    self->_lastDownloadQueueReload = v5;
    v9 = BCBookDownloadLog(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Triggering reloadFromServer", buf, 2u);
    }

    v11 = objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    -[NSObject reloadFromServerWithCompletion:](v11, "reloadFromServerWithCompletion:", &stru_1008EE070);
  }

}

- (BKLibraryDataSourceBLDownload)init
{
  BKLibraryDataSourceBLDownload *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *downloadingAssets;
  NSMutableDictionary *v11;
  NSMutableDictionary *assetsWithDownloadingChildAssets;
  objc_super v14;

  kdebug_trace(725353716, 28, 0, 0, 0);
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourceBLDownload;
  v3 = -[BKLibraryDataSourceBLDownload init](&v14, "init");
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.BKLibraryDataSourceBLDownload.dispatchQueue", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v8, "addObserver:", v3);

    v9 = objc_opt_new(NSMutableDictionary);
    downloadingAssets = v3->_downloadingAssets;
    v3->_downloadingAssets = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    assetsWithDownloadingChildAssets = v3->_assetsWithDownloadingChildAssets;
    v3->_assetsWithDownloadingChildAssets = v11;

  }
  kdebug_trace(725353716, 29, 0, 0, 0);
  return v3;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.ibooks.progress.bldownload");
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  OS_dispatch_queue *dispatchQueue;
  NSMutableDictionary *downloadingAssets;
  NSMutableDictionary *assetsWithDownloadingChildAssets;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = 0;

  downloadingAssets = self->_downloadingAssets;
  self->_downloadingAssets = 0;

  assetsWithDownloadingChildAssets = self->_assetsWithDownloadingChildAssets;
  self->_assetsWithDownloadingChildAssets = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryDataSourceBLDownload;
  -[BKLibraryDataSourceBLDownload dealloc](&v7, "dealloc");
}

- (void)p_checkForInactiveQueue
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 5000000000);
  v4 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019FF80;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (id)_updateDownloadingAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  BKBLDownloadAsset *v25;
  void *v26;
  id v27;
  BKBLDownloadAsset *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  BKBLDownloadAsset *v42;
  BKBLDownloadAsset *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  BKBLDownloadAsset *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  BKBLDownloadAsset *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  _BYTE v82[128];
  BKBLDownloadAsset *v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  uint64_t v87;
  BKBLDownloadAsset *v88;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bk_assetIdentifier"));
  if (!objc_msgSend(v5, "length"))
    goto LABEL_34;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    v75 = (BKBLDownloadAsset *)v7;
    v76 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload _reportingAssetsForDownloadingAsset:](self, "_reportingAssetsForDownloadingAsset:", v7));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v78 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
          if (v14)
          {
            v15 = (void *)v14;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "author"));

            if (v16)
              continue;
          }
          v17 = objc_msgSend(v13, "updateMetadata:", v4);
          if ((_DWORD)v17)
          {
            v20 = BCBookDownloadLog(v17, v18, v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
              *(_DWORD *)buf = 138543362;
              v85 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "download metadata updated identifier=%{public}@", buf, 0xCu);

            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload libraryManager](self, "libraryManager"));
            v81 = v13;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
            objc_msgSend(v23, "libraryDataSource:updatedAssets:", self, v24);

            -[BKLibraryDataSourceBLDownload _addReportingItemToCoverCache:](self, "_addReportingItemToCoverCache:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v10);
    }

    v25 = v75;
    v5 = v76;
    goto LABEL_35;
  }
  if (objc_msgSend(v4, "isAudiobook"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
    v27 = objc_msgSend(v26, "longLongValue");

    if (!v27)
    {
LABEL_34:
      v25 = 0;
      goto LABEL_35;
    }
  }
  v28 = [BKBLDownloadAsset alloc];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload identifier](self, "identifier"));
  v25 = -[BKBLDownloadAsset initWithBLDownloadStatus:dataSourceIdentifier:isParent:](v28, "initWithBLDownloadStatus:dataSourceIdentifier:isParent:", v4, v29, 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v25, v5);

  v34 = BCBookDownloadLog(v31, v32, v33);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset identifier](v25, "identifier"));
    *(_DWORD *)buf = 138412290;
    v85 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "download new asset=%@", buf, 0xCu);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
  v38 = objc_msgSend(v37, "longLongValue");

  if (!v38)
    goto LABEL_33;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringValue"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload assetsWithDownloadingChildAssets](self, "assetsWithDownloadingChildAssets"));
  v42 = (BKBLDownloadAsset *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v40));

  if (!v42)
  {
    v43 = [BKBLDownloadAsset alloc];
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload identifier](self, "identifier"));
    v42 = -[BKBLDownloadAsset initWithBLDownloadStatus:dataSourceIdentifier:isParent:](v43, "initWithBLDownloadStatus:dataSourceIdentifier:isParent:", v4, v44, 1);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload assetsWithDownloadingChildAssets](self, "assetsWithDownloadingChildAssets"));
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v42, v40);

    v49 = BCBookDownloadLog(v46, v47, v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset identifier](v42, "identifier"));
      *(_DWORD *)buf = 138412290;
      v85 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "created parent=%@ for tracking", buf, 0xCu);

    }
  }
  v52 = objc_msgSend(v4, "isAudiobook");
  v55 = (char)v52;
  if ((_DWORD)v52)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets"));
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v42, v40);

    v60 = BCBookDownloadLog(v57, v58, v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset identifier](v42, "identifier"));
      *(_DWORD *)buf = 138412290;
      v85 = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "download new parent=%@", buf, 0xCu);

    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload libraryManager](self, "libraryManager"));
    v88 = v42;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
    objc_msgSend(v63, "libraryDataSource:addedAssets:", self, v64);

    v52 = -[BKLibraryDataSourceBLDownload _addReportingItemToCoverCache:](self, "_addReportingItemToCoverCache:", v42);
  }
  v65 = BCBookDownloadLog(v52, v53, v54);
  v66 = objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset identifier](v42, "identifier"));
    v68 = objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset identifier](v25, "identifier"));
    v69 = v25;
    v70 = v5;
    v71 = (void *)v68;
    *(_DWORD *)buf = 138412546;
    v85 = v67;
    v86 = 2112;
    v87 = v68;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "set parent=%@ for child=%@", buf, 0x16u);

    v5 = v70;
    v25 = v69;

  }
  -[BKBLDownloadAsset addChild:](v42, "addChild:", v25);

  if ((v55 & 1) == 0)
  {
LABEL_33:
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload libraryManager](self, "libraryManager"));
    v83 = v25;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v83, 1));
    objc_msgSend(v72, "libraryDataSource:addedAssets:", self, v73);

    -[BKLibraryDataSourceBLDownload _addReportingItemToCoverCache:](self, "_addReportingItemToCoverCache:", v25);
  }
LABEL_35:

  return v25;
}

- (void)_addReportingItemToCoverCache:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnailImageURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v19 = v7;
    v20 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    objc_msgSend(v6, "addURLs:priority:quality:expiresAfter:", v8, 5, 201, 10);
LABEL_7:

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));

  if (v9)
  {
    v13 = BCBookDownloadLog(v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding fallback store ID to cover cache: %@", buf, 0xCu);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));
    v16 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v6, "addProductProfileIDs:priority:", v8, 5);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_removeReportingItemFromCoverCache:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnailImageURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v9 = v7;
    v10 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    objc_msgSend(v6, "removeURLs:priority:quality:", v8, 3, 201);

  }
}

- (id)_reportingAssetsForDownloadingAsset:(id)a3
{
  return -[BKLibraryDataSourceBLDownload _reportingAssetsForDownloadingAsset:includeUntrackedParent:](self, "_reportingAssetsForDownloadingAsset:includeUntrackedParent:", a3, 0);
}

- (id)_reportingAssetsForDownloadingAsset:(id)a3 includeUntrackedParent:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  if (v9)
  {
    if (a4
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11)),
          v12,
          v11,
          v10,
          v12))
    {
      objc_msgSend(v7, "addObject:", v8);
    }
  }
  if ((objc_msgSend(v6, "isAudiobook") & 1) == 0)
    objc_msgSend(v7, "addObject:", v6);

  return v7;
}

- (id)_updateDownloadingAssetAndCreateDownloadStatuses:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload _reportingAssetsForDownloadingAsset:includeUntrackedParent:](self, "_reportingAssetsForDownloadingAsset:includeUntrackedParent:", v6, 1));
  if (objc_msgSend(v9, "count"))
  {
    if (v7)
      objc_msgSend(v6, "setDownloadStatus:", v7);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload _createDownloadStatusForReportingAsset:downloadingAsset:](self, "_createDownloadStatusForReportingAsset:downloadingAsset:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), v6, (_QWORD)v18));
          objc_msgSend(v8, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent", (_QWORD)v18));
  -[BKLibraryDataSourceBLDownload _reportAudiobookDownloadProgress:](self, "_reportAudiobookDownloadProgress:", v16);

  return v8;
}

- (id)_createDownloadStatusForReportingAsset:(id)a3 downloadingAsset:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  float v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v46;
  int v47;
  NSObject *v48;
  __int16 v49;
  double v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (v6 && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")), v11, v11))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v13 = objc_msgSend(v6, "bytesDownloaded");
    v14 = objc_msgSend(v6, "bytesTotal");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "children"));
    v16 = objc_msgSend(v15, "count");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeChildren"));
    v18 = objc_msgSend(v17, "count");

    objc_msgSend(v6, "progress");
    if (v19 >= 0.05)
      v20 = v19;
    else
      v20 = 0.05;
    v21 = objc_msgSend(v6, "downloadState");
    switch((unint64_t)v21)
    {
      case 2uLL:
        v24 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        v47 = 138543618;
        v48 = v12;
        v49 = 2048;
        v50 = v20;
        v26 = "download status: asset=%{public}@ progress=%f REQUESTED";
        goto LABEL_24;
      case 3uLL:
        v36 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v36);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        v47 = 138543618;
        v48 = v12;
        v49 = 2048;
        v50 = v20;
        v26 = "download status: asset=%{public}@ progress=%f WAITING";
LABEL_24:
        v32 = v25;
        v33 = 22;
        break;
      case 4uLL:
        v31 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        v47 = 138544642;
        v48 = v12;
        v49 = 2048;
        v50 = v20;
        v51 = 2048;
        v52 = v13;
        v53 = 2048;
        v54 = v14;
        v55 = 2048;
        v56 = v16;
        v57 = 2048;
        v58 = v18;
        v26 = "download status: asset=%{public}@ progress=%f bytes=%lld/%lld children=%lu active=%lu";
        v32 = v25;
        v33 = 62;
        break;
      case 5uLL:
        v34 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v47 = 138543618;
          v48 = v12;
          v49 = 2048;
          v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f DOWNLOADED", (uint8_t *)&v47, 0x16u);
        }
        v29 = 5;
        goto LABEL_33;
      case 6uLL:
        v35 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v47 = 138543618;
          v48 = v12;
          v49 = 2048;
          v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f PAUSED", (uint8_t *)&v47, 0x16u);
        }
        v29 = 6;
        goto LABEL_33;
      case 7uLL:
        v37 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v47 = 138543618;
          v48 = v12;
          v49 = 2048;
          v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f FAILED", (uint8_t *)&v47, 0x16u);
        }
        v29 = 7;
        goto LABEL_33;
      case 8uLL:
        v38 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v47 = 138543618;
          v48 = v12;
          v49 = 2048;
          v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f CANCELED", (uint8_t *)&v47, 0x16u);
        }
        v29 = 8;
        goto LABEL_33;
      default:
        v29 = (uint64_t)v21;
        v30 = BCBookDownloadLog(v21, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v47 = 138543874;
          v48 = v12;
          v49 = 2048;
          v50 = v20;
          v51 = 1024;
          LODWORD(v52) = v29;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "download status: asset=%{public}@ progress=%f state=%d (unexpected)", (uint8_t *)&v47, 0x1Cu);
        }
        goto LABEL_33;
    }
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v47, v33);
LABEL_26:
    v29 = 4;
LABEL_33:

    if (objc_msgSend(v6, "isParent")
      && (v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets")),
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v40)),
          v41,
          v40,
          v39,
          !v41))
    {
      v46 = objc_alloc((Class)BKLibraryDownloadStatus);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v44 = objc_msgSend(v46, "initWithAssetID:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:", v43, v29, objc_msgSend(v6, "secondsRemaining"), objc_msgSend(v6, "bytesDownloaded"), objc_msgSend(v6, "bytesTotal"), v20);
    }
    else
    {
      v42 = objc_alloc((Class)BKLibraryDownloadStatus);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v44 = objc_msgSend(v42, "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v43, v29, objc_msgSend(v6, "secondsRemaining"), objc_msgSend(v6, "bytesDownloaded"), objc_msgSend(v6, "bytesTotal"), v20);
    }
    v28 = v44;

  }
  else
  {
    v27 = BCBookDownloadLog(v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1006A3BF4(v10, v6, v12);
    v28 = 0;
  }

  return v28;
}

- (void)_reportAudiobookDownloadProgress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isParent"))
  {
    v5 = objc_alloc_init((Class)BSUIAudioBookDownloadProgress);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    objc_msgSend(v5, "setAssetIdentifier:", v6);

    objc_msgSend(v4, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v5, "setProgress:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = BSUIAudioBookDownloadStatusNotification;
    v11 = BSUIAudioBookDownloadProgressKey;
    v12 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v9, self, v10);

  }
}

- (void)_performBlockOnAllAssetsForAssetID:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
  if (v9)
  {
    v10 = (void *)v9;

LABEL_4:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));

      v10 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "children"));
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeChildren", 0));
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v23));
            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v21);
      }

    }
    else if (objc_msgSend(v10, "active"))
    {
      ((void (**)(id, void *))v7)[2](v7, v10);
    }
    goto LABEL_20;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload assetsWithDownloadingChildAssets](self, "assetsWithDownloadingChildAssets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));

  if (v10)
    goto LABEL_4;
  v24 = BCBookDownloadLog(v12, v13, v14);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_1006A3CAC((uint64_t)v6, v25, v26, v27, v28, v29, v30, v31);

  v10 = 0;
LABEL_20:

}

- (void)updateDownloadStatus
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];

  v3 = BCBookDownloadLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1006A3D10(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload downloadingAssets](self, "downloadingAssets"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A16F8;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)pauseDownloadForAssetID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v6 = BCBookDownloadLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pauseDownloadForAssetID:%@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A1A0C;
  v10[3] = &unk_1008E7338;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)resumeDownloadForAssetID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v6 = BCBookDownloadLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "resumeDownloadForAssetID:%@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A1CC0;
  v10[3] = &unk_1008E7338;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)cancelDownloadForAssetID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v6 = BCBookDownloadLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cancelDownloadForAssetID:%@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A1F74;
  v10[3] = &unk_1008E7338;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)restartDownloadForAssetID:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BCBookDownloadLog(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not implemented - what does this mean?  Cancel followed by a start?", v5, 2u);
  }

}

- (void)togglePausedForAssetID:(id)a3 orTemporaryAssetID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v9 = BCBookDownloadLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "togglePausedForAssetID:%@ orTemporaryAssetID:%@", buf, 0x16u);
  }

  if (v6)
    v11 = v6;
  else
    v11 = v7;
  v12 = v11;
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A22C8;
    v14[3] = &unk_1008E7338;
    v14[4] = self;
    v15 = v12;
    dispatch_async(v13, v14);

  }
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BKLibraryDataSourceBLDownload *v13;
  uint8_t buf[4];
  id v15;

  v5 = a4;
  v7 = BCBookDownloadLog(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[BKLibraryDataSourceBLDownload] downloadQueue:downloadStatesDidChange: %@", buf, 0xCu);
  }

  v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A287C;
  v11[3] = &unk_1008E7338;
  v12 = v5;
  v13 = self;
  v10 = v5;
  dispatch_async(v9, v11);

}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BKLibraryDataSourceBLDownload *v16;
  uint8_t buf[4];
  id v18;

  v7 = a4;
  v8 = a5;
  v10 = BCBookDownloadLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BKLibraryDataSourceBLDownload] didCompleteWithError: %@", buf, 0xCu);
  }

  v12 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A2D28;
  v14[3] = &unk_1008E7338;
  v15 = v7;
  v16 = self;
  v13 = v7;
  dispatch_async(v12, v14);

}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A3CF0;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BKLibraryDataSourceBLDownload *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353716, 80, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceBLDownload dispatchQueue](self, "dispatchQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A3F38;
  v13[3] = &unk_1008E8EE0;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, v13);

}

- (int64_t)coverSourceRank
{
  return 1;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v5 = v6;
  }

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
    v5 = v6;
  }

}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "permanentOrTemporaryAssetID"));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A41FC;
  block[3] = &unk_1008E8898;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(dispatchQueue, block);

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "permanentOrTemporaryAssetID"));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4374;
  block[3] = &unk_1008E8898;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (BOOL)explicitContentRestricted
{
  return self->_explicitContentRestricted;
}

- (void)setExplicitContentRestricted:(BOOL)a3
{
  self->_explicitContentRestricted = a3;
}

- (id)generationChangeHandler
{
  return self->_generationChangeHandler;
}

- (id)reloadCounterpartHandler
{
  return self->_reloadCounterpartHandler;
}

- (id)didLoadSupplementalAssetHandler
{
  return self->_didLoadSupplementalAssetHandler;
}

- (NSArray)restoreControllers
{
  return self->_restoreControllers;
}

- (BKLibraryDataSourcePlistWriting)iTunesSyncedBooksPlistCleaner
{
  return (BKLibraryDataSourcePlistWriting *)objc_loadWeakRetained((id *)&self->_iTunesSyncedBooksPlistCleaner);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableDictionary)downloadingAssets
{
  return self->_downloadingAssets;
}

- (void)setDownloadingAssets:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingAssets, a3);
}

- (NSMutableDictionary)assetsWithDownloadingChildAssets
{
  return self->_assetsWithDownloadingChildAssets;
}

- (void)setAssetsWithDownloadingChildAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assetsWithDownloadingChildAssets, a3);
}

- (double)lastDownloadQueueReload
{
  return self->_lastDownloadQueueReload;
}

- (void)setLastDownloadQueueReload:(double)a3
{
  self->_lastDownloadQueueReload = a3;
}

- (unint64_t)downloadQueueGeneration
{
  return self->_downloadQueueGeneration;
}

- (void)setDownloadQueueGeneration:(unint64_t)a3
{
  self->_downloadQueueGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsWithDownloadingChildAssets, 0);
  objc_storeStrong((id *)&self->_downloadingAssets, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_iTunesSyncedBooksPlistCleaner);
  objc_storeStrong((id *)&self->_restoreControllers, 0);
  objc_storeStrong(&self->_didLoadSupplementalAssetHandler, 0);
  objc_storeStrong(&self->_reloadCounterpartHandler, 0);
  objc_storeStrong(&self->_generationChangeHandler, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
