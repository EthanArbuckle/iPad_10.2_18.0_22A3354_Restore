@implementation BADownloadQueue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesForSerialization
{
  if (qword_100065570 != -1)
    dispatch_once(&qword_100065570, &stru_100058EB8);
  return (id)qword_100065568;
}

- (BADownloadQueue)initWithApplicationIdentifier:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  BADownloadQueue *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSString *stagingDirectory;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  BADownloadQueue *v28;
  id v30;
  id v31;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)BADownloadQueue;
  v9 = -[BADownloadQueue init](&v32, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_baassets_validUTI"));
    if (!objc_msgSend(v10, "isEqualToString:", v7))
    {

      v28 = 0;
      goto LABEL_6;
    }
    v9->_stateLock = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    -[BADownloadQueue setLastDownloadStartDate:](v9, "setLastDownloadStartDate:", v11);

    -[BADownloadQueue setFrozen:](v9, "setFrozen:", 0);
    v12 = objc_alloc_init((Class)NSMutableOrderedSet);
    -[BADownloadQueue setDownloads:](v9, "setDownloads:", v12);

    v13 = objc_alloc_init((Class)NSMutableSet);
    -[BADownloadQueue setActiveDownloads:](v9, "setActiveDownloads:", v13);

    v14 = objc_alloc_init((Class)NSMutableDictionary);
    -[BADownloadQueue setUniqueIdentifiersToDownloads:](v9, "setUniqueIdentifiersToDownloads:", v14);

    v15 = objc_alloc_init((Class)NSMutableDictionary);
    -[BADownloadQueue setIdentifiersToDownloads:](v9, "setIdentifiersToDownloads:", v15);

    -[BADownloadQueue setActiveManifestDownload:](v9, "setActiveManifestDownload:", 0);
    -[BADownloadQueue setDelegate:](v9, "setDelegate:", v8);
    -[BADownloadQueue setEssentialAssetsWaitingOnContentRequest:](v9, "setEssentialAssetsWaitingOnContentRequest:", 0);
    -[BADownloadQueue setEssentialAssetsBytesDownloaded:](v9, "setEssentialAssetsBytesDownloaded:", 0);
    -[BADownloadQueue setEssentialAssetsBytesTotal:](v9, "setEssentialAssetsBytesTotal:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[BADownloadQueue setEssentialAssetIdentifiersMonitored:](v9, "setEssentialAssetIdentifiersMonitored:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DownloadStaging/%@"), v10));
    v18 = sub_100017F60();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", v17));
    stagingDirectory = v9->_stagingDirectory;
    v9->_stagingDirectory = (NSString *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue stagingDirectory](v9, "stagingDirectory"));
    v31 = 0;
    objc_msgSend(v22, "removeItemAtPath:error:", v23, &v31);
    v24 = v31;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue stagingDirectory](v9, "stagingDirectory"));
    v30 = v24;
    objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v30);
    v27 = v30;

  }
  v28 = v9;
LABEL_6:

  return v28;
}

- (BADownloadQueue)initWithCoder:(id)a3
{
  id v4;
  BADownloadQueue *v5;
  uint64_t v6;
  BADownloadQueue *v7;
  id v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char isKindOfClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSSet *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSSet *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  NSString *stagingDirectory;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *i;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *j;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  _BYTE v100[128];
  _BYTE v101[128];

  v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)BADownloadQueue;
  v5 = -[BADownloadQueue init](&v99, "init");
  v7 = v5;
  if (v5)
  {
    v5->_stateLock = 0;
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v11), CFSTR("lastDownloadStartDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[BADownloadQueue setLastDownloadStartDate:](v7, "setLastDownloadStartDate:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue lastDownloadStartDate](v7, "lastDownloadStartDate"));
    v16 = objc_opt_class(NSDate, v15);
    isKindOfClass = objc_opt_isKindOfClass(v14, v16);

    if ((isKindOfClass & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      -[BADownloadQueue setLastDownloadStartDate:](v7, "setLastDownloadStartDate:", v19);

    }
    v20 = objc_opt_class(NSMutableArray, v18);
    v22 = objc_opt_class(NSMutableOrderedSet, v21);
    v24 = objc_opt_class(BADownload, v23);
    v26 = objc_opt_class(BAURLDownload, v25);
    v28 = objc_opt_class(BAManifestDownload, v27);
    v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v22, v24, v26, v28, objc_opt_class(BACloudKitDownload, v29), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("downloads")));

    v34 = objc_opt_class(NSMutableOrderedSet, v33);
    if ((objc_opt_isKindOfClass(v32, v34) & 1) != 0)
    {
      -[BADownloadQueue setDownloads:](v7, "setDownloads:", v32);
    }
    else
    {
      v36 = objc_opt_class(NSMutableArray, v35);
      if ((objc_opt_isKindOfClass(v32, v36) & 1) != 0)
        v37 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithArray:](NSMutableOrderedSet, "orderedSetWithArray:", v32));
      else
        v37 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
      v38 = (void *)v37;
      -[BADownloadQueue setDownloads:](v7, "setDownloads:", v37);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("activeManifestDownload")))
    {
      v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BAManifestDownload, v39), CFSTR("activeManifestDownload"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      -[BADownloadQueue setActiveManifestDownload:](v7, "setActiveManifestDownload:", v41);

    }
    -[BADownloadQueue setEssentialAssetsWaitingOnContentRequest:](v7, "setEssentialAssetsWaitingOnContentRequest:", 0);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("essentialAssetsBytesTotal")))
      -[BADownloadQueue setEssentialAssetsBytesTotal:](v7, "setEssentialAssetsBytesTotal:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("essentialAssetsBytesTotal")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("essentialAssetsBytesDownloaded")))
      -[BADownloadQueue setEssentialAssetsBytesDownloaded:](v7, "setEssentialAssetsBytesDownloaded:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("essentialAssetsBytesDownloaded")));
    v90 = (void *)v32;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("essentialAssetIdentifiersMonitored")))
    {
      v43 = objc_opt_class(NSMutableSet, v42);
      v45 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v43, objc_opt_class(NSString, v44), 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("essentialAssetIdentifiersMonitored")));
      -[BADownloadQueue setEssentialAssetIdentifiersMonitored:](v7, "setEssentialAssetIdentifiersMonitored:", v47);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("frozen")))
      -[BADownloadQueue setFrozen:](v7, "setFrozen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("frozen")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](v7, "identifier"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "_baassets_validUTI"));

    v89 = (void *)v49;
    v50 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DownloadStaging/%@"), v49));
    v51 = sub_100017F60();
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v88 = (void *)v50;
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", v50));
    stagingDirectory = v7->_stagingDirectory;
    v7->_stagingDirectory = (NSString *)v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue stagingDirectory](v7, "stagingDirectory"));
    objc_msgSend(v55, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v56, 1, 0, 0);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](v7, "downloads"));
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
    if (v59)
    {
      v61 = v59;
      v62 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(_QWORD *)v96 != v62)
            objc_enumerationMutation(v58);
          v64 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
          v65 = objc_opt_class(BAManifestDownload, v60);
          if ((objc_opt_isKindOfClass(v64, v65) & 1) != 0 || objc_msgSend(v64, "state") == (id)-1)
            objc_msgSend(v57, "addObject:", v64);
        }
        v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
      }
      while (v61);
    }

    v66 = objc_alloc_init((Class)NSMutableSet);
    -[BADownloadQueue setActiveDownloads:](v7, "setActiveDownloads:", v66);

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[BADownloadQueue setUniqueIdentifiersToDownloads:](v7, "setUniqueIdentifiersToDownloads:", v67);

    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[BADownloadQueue setIdentifiersToDownloads:](v7, "setIdentifiersToDownloads:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](v7, "downloads"));
    objc_msgSend(v69, "minusSet:", v57);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](v7, "activeManifestDownload"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](v7, "downloads"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "set"));
    if (v70)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](v7, "activeManifestDownload"));
      v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "setByAddingObject:", v73));

      v72 = (void *)v74;
    }

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v75 = v72;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v92;
      do
      {
        for (j = 0; j != v77; j = (char *)j + 1)
        {
          if (*(_QWORD *)v92 != v78)
            objc_enumerationMutation(v75);
          v80 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)j);
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](v7, "identifier"));
          objc_msgSend(v80, "setApplicationIdentifier:", v81);

          v82 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue stagingDirectory](v7, "stagingDirectory"));
          objc_msgSend(v80, "setDownloadCachePath:", v82);

          if (objc_msgSend(v80, "state") == (id)2 || objc_msgSend(v80, "state") == (id)3)
            sub_10002FBB8(v80, 1);
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue uniqueIdentifiersToDownloads](v7, "uniqueIdentifiersToDownloads"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "uniqueIdentifier"));
          objc_msgSend(v83, "setObject:forKey:", v80, v84);

          v85 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifiersToDownloads](v7, "identifiersToDownloads"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
          objc_msgSend(v85, "setObject:forKey:", v80, v86);

        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
      }
      while (v77);
    }

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  os_unfair_recursive_lock_s *p_stateLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue lastDownloadStartDate](self, "lastDownloadStartDate"));
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("lastDownloadStartDate"));

  objc_msgSend(v11, "encodeBool:forKey:", -[BADownloadQueue frozen](self, "frozen"), CFSTR("frozen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("downloads"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](self, "activeManifestDownload"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](self, "activeManifestDownload"));
    objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("activeManifestDownload"));

  }
  objc_msgSend(v11, "encodeInteger:forKey:", -[BADownloadQueue essentialAssetsBytesTotal](self, "essentialAssetsBytesTotal"), CFSTR("essentialAssetsBytesTotal"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[BADownloadQueue essentialAssetsBytesDownloaded](self, "essentialAssetsBytesDownloaded"), CFSTR("essentialAssetsBytesDownloaded"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("essentialAssetIdentifiersMonitored"));

  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (void)_addDownload:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;

  v4 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  v6 = objc_opt_class(BAManifestDownload, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
    v9 = objc_msgSend(v8, "copy");

    if (objc_msgSend(v9, "count"))
    {
      v10 = sub_100012964();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
        *(_DWORD *)buf = 138543618;
        v36 = v12;
        v37 = 2048;
        v38 = objc_msgSend(v9, "count");
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New manifest being enqueued for %{public}@, canceling existing essential downloads. (Count: %ld)", buf, 0x16u);

      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue _downloadWithIdentifier:](self, "_downloadWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v17), (_QWORD)v30));
            v19 = v18;
            if (v18)
            {
              objc_msgSend(v18, "cancelDownload");
              -[BADownloadQueue _removeDownload:](self, "_removeDownload:", v19);
            }

            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

    }
    -[BADownloadQueue setActiveManifestDownload:](self, "setActiveManifestDownload:", v7, (_QWORD)v30);
    -[BADownloadQueue setEssentialAssetsBytesTotal:](self, "setEssentialAssetsBytesTotal:", 0);
    -[BADownloadQueue setEssentialAssetsBytesDownloaded:](self, "setEssentialAssetsBytesDownloaded:", 0);
    if ((unint64_t)(sub_10000B428((uint64_t)v7) - 1) > 1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      -[BADownloadQueue setEssentialAssetIdentifiersMonitored:](self, "setEssentialAssetIdentifiersMonitored:", v20);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v20));
      -[BADownloadQueue setEssentialAssetIdentifiersMonitored:](self, "setEssentialAssetIdentifiersMonitored:", v21);

    }
    -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  v24 = objc_msgSend(v22, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v23, "count"), 1024, &stru_100058EF8);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  objc_msgSend(v25, "insertObject:atIndex:", v4, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue uniqueIdentifiersToDownloads](self, "uniqueIdentifiersToDownloads"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
  objc_msgSend(v26, "setObject:forKey:", v4, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifiersToDownloads](self, "identifiersToDownloads"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v28, "setObject:forKey:", v4, v29);

}

- (void)_removeDownload:(id)a3
{
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
  void *v14;
  unsigned int v15;
  id v16;

  v16 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeDownloads](self, "activeDownloads"));
  objc_msgSend(v4, "removeObject:", v16);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  objc_msgSend(v5, "removeObject:", v16);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue uniqueIdentifiersToDownloads](self, "uniqueIdentifiersToDownloads"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueIdentifier"));
  objc_msgSend(v6, "removeObjectForKey:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifiersToDownloads](self, "identifiersToDownloads"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  objc_msgSend(v8, "removeObjectForKey:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  objc_msgSend(v10, "removeObject:", v11);

  v13 = objc_opt_class(BAManifestDownload, v12);
  if ((objc_opt_isKindOfClass(v16, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](self, "activeManifestDownload"));
    v15 = objc_msgSend(v14, "isEqual:", v16);

    if (v15)
      -[BADownloadQueue setActiveManifestDownload:](self, "setActiveManifestDownload:", 0);
  }

}

- (id)_downloadWithUniqueIdentifier:(id)a3
{
  os_unfair_recursive_lock_s *p_stateLock;
  id v5;
  void *v6;
  void *v7;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)p_stateLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue uniqueIdentifiersToDownloads](self, "uniqueIdentifiersToDownloads"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  return v7;
}

- (id)_downloadWithIdentifier:(id)a3
{
  os_unfair_recursive_lock_s *p_stateLock;
  id v5;
  void *v6;
  void *v7;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)p_stateLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifiersToDownloads](self, "identifiersToDownloads"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  return v7;
}

- (id)downloadWithUniqueIdentifier:(id)a3
{
  os_unfair_recursive_lock_s *p_stateLock;
  id v5;
  void *v6;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_recursive_lock_lock_with_options(p_stateLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue _downloadWithUniqueIdentifier:](self, "_downloadWithUniqueIdentifier:", v5));

  os_unfair_recursive_lock_unlock(p_stateLock);
  return v6;
}

- (int64_t)essentialAssetsStateWithSizeDownloaded:(int64_t *)a3 totalDownloadSize:(int64_t *)a4
{
  os_unfair_recursive_lock_s *p_stateLock;
  int64_t v8;

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v8 = -[BADownloadQueue _essentialAssetState](self, "_essentialAssetState");
  if (a3)
    *a3 = -[BADownloadQueue essentialAssetsBytesDownloaded](self, "essentialAssetsBytesDownloaded");
  if (a4)
    *a4 = -[BADownloadQueue essentialAssetsBytesTotal](self, "essentialAssetsBytesTotal");
  os_unfair_recursive_lock_unlock(p_stateLock);
  return v8;
}

- (int64_t)_essentialAssetState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v9;
  id v10;
  id v11;
  int v12;
  int v13;
  char v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](self, "activeManifestDownload"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](self, "activeManifestDownload"));
    v5 = sub_10000B428((uint64_t)v4);

    if ((unint64_t)(v5 - 1) <= 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeManifestDownload](self, "activeManifestDownload"));
      v7 = (unint64_t)objc_msgSend(v6, "state");

      if (v7 < 4)
        return qword_100042D68[v7];
    }
  }
  else
  {
    if (-[BADownloadQueue essentialAssetsWaitingOnContentRequest](self, "essentialAssetsWaitingOnContentRequest"))
      return 3;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v9);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifiersToDownloads](self, "identifiersToDownloads"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v17));

          if (v19)
          {
            v20 = objc_msgSend(v19, "state") == (id)2;
            if (!objc_msgSend(v19, "state") || objc_msgSend(v19, "state") == (id)1)
              v13 = 1;
            v12 |= v20;
            if ((v12 & v13 & 1) != 0)
            {

              LOBYTE(v13) = 1;
              LOBYTE(v12) = 1;
LABEL_23:
              if (-[BADownloadQueue frozen](self, "frozen"))
                return 5;
              v21 = 3;
              if ((v13 & 1) == 0)
                v21 = 0;
              if ((v12 & 1) != 0)
                return 4;
              else
                return v21;
            }
            v14 = 1;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }

      if ((v14 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

    }
  }
  return 0;
}

- (void)_reportEssentialAssetStateAndProgress
{
  int64_t v3;
  int64_t v4;
  unint64_t v5;
  id v6;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  v3 = -[BADownloadQueue _essentialAssetState](self, "_essentialAssetState");
  v4 = -[BADownloadQueue essentialAssetsBytesDownloaded](self, "essentialAssetsBytesDownloaded");
  v5 = -[BADownloadQueue essentialAssetsBytesTotal](self, "essentialAssetsBytesTotal");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
  objc_msgSend(v6, "downloadQueue:essentialAssetState:bytesWritten:totalBytes:", self, v3, v4, v5);

}

- (void)scheduleDownload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  id v13;
  qos_class_t v14;
  dispatch_queue_global_t global_queue;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  os_unfair_recursive_lock_s *p_stateLock;
  NSObject *queue;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD block[4];
  id v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(BAManifestDownload, v8);
  isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v6, "downloadLock"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
  objc_msgSend(v6, "setApplicationIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue stagingDirectory](self, "stagingDirectory"));
  objc_msgSend(v6, "setDownloadCachePath:", v12);

  sub_10002FBB8(v6, 1);
  v13 = objc_msgSend(v6, "necessity");
  v47 = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v6, "downloadLock"));
  v14 = qos_class_self();
  global_queue = dispatch_get_global_queue(v14, 0);
  v16 = objc_claimAutoreleasedReturnValue(global_queue);
  v17 = v16;
  if ((isKindOfClass & 1) != 0 || v13 != (id)1)
  {
    queue = v16;
    v46 = v7;
    p_stateLock = &self->_stateLock;
    os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v58;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          if ((isKindOfClass & 1) != 0
            && (v30 = objc_opt_class(BAManifestDownload, v25), (objc_opt_isKindOfClass(v29, v30) & 1) != 0))
          {
            objc_msgSend(v22, "addObject:", v29);
          }
          else
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
            v33 = objc_msgSend(v31, "isEqual:", v32);

            if (v33)
            {
              v39 = sub_1000272FC(100);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v47, "downloadLock"));
              objc_msgSend(v47, "setDownloadError:", v40);
              sub_10002FBB8(v47, -1);
              os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v47, "downloadLock"));
              v41 = sub_1000128F4();
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                sub_100035870(v47);

              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = sub_100015744;
              v54[3] = &unk_100058F20;
              v7 = v46;
              v55 = v40;
              v56 = v46;
              v43 = v40;
              v17 = queue;
              dispatch_async(queue, v54);
              os_unfair_recursive_lock_unlock(p_stateLock);

              goto LABEL_28;
            }
          }
        }
        v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v26)
          continue;
        break;
      }
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v22 = v22;
    v34 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    v7 = v46;
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(_QWORD *)v51 != v36)
            objc_enumerationMutation(v22);
          v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v38, "cancelDownloadSilently");
          -[BADownloadQueue _removeDownload:](self, "_removeDownload:", v38);
        }
        v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v35);
    }

    -[BADownloadQueue _addDownload:](self, "_addDownload:", v47);
    os_unfair_recursive_lock_unlock(p_stateLock);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100015754;
    v48[3] = &unk_100058F48;
    v49 = v46;
    v17 = queue;
    dispatch_async(queue, v48);
    v23 = v49;
  }
  else
  {
    v18 = sub_1000272FC(109);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v6, "downloadLock"));
    objc_msgSend(v6, "setDownloadError:", v19);
    sub_10002FBB8(v6, -1);
    os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v6, "downloadLock"));
    v20 = sub_1000128F4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100035918(v6);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015734;
    block[3] = &unk_100058F20;
    v62 = v19;
    v63 = v7;
    v22 = v19;
    dispatch_async(v17, block);

    v23 = v63;
  }
LABEL_28:

}

- (void)scheduleContentRequestAborted
{
  os_unfair_recursive_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  -[BADownloadQueue setEssentialAssetsWaitingOnContentRequest:](self, "setEssentialAssetsWaitingOnContentRequest:", 0);
  -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (void)scheduleContentRequest:(int64_t)a3 downloads:(id)a4 applicationInfo:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  qos_class_t v12;
  dispatch_queue_global_t global_queue;
  void *v14;
  unsigned __int8 v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  NSObject *queue;
  void *v67;
  unsigned __int8 v68;
  void *v69;
  unint64_t v70;
  id obj;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[6];
  void *v76;
  _QWORD v77[6];
  void *v78;
  _QWORD block[6];
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];

  v10 = a4;
  v11 = a5;
  v65 = a6;
  v12 = qos_class_self();
  global_queue = dispatch_get_global_queue(v12, 0);
  queue = objc_claimAutoreleasedReturnValue(global_queue);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
  v15 = +[BAApplicationInfo applicationForIdentifierAllowsBackgroundActivity:](BAApplicationInfo, "applicationForIdentifierAllowsBackgroundActivity:", v14);

  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  -[BADownloadQueue setEssentialAssetsWaitingOnContentRequest:](self, "setEssentialAssetsWaitingOnContentRequest:", 0);
  v69 = v11;
  v16 = (char *)objc_msgSend(v11, "remainingDownloadAllowanceWithNecessity:isManifest:", 1, 0);
  v67 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingSelector:", "compare:"));

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v64 = v18;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reverseObjectEnumerator"));
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  if (v19)
  {
    v20 = v19;
    v72 = *(_QWORD *)v82;
    v70 = a3 - 1;
    v68 = v15;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v82 != v72)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v21);
        os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v22, "downloadLock"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
        objc_msgSend(v22, "setApplicationIdentifier:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue stagingDirectory](self, "stagingDirectory"));
        objc_msgSend(v22, "setDownloadCachePath:", v24);

        sub_10002FBB8(v22, 1);
        os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v22, "downloadLock"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue _downloadWithIdentifier:](self, "_downloadWithIdentifier:", v25));

        if (v26)
        {
          v27 = sub_1000272FC(100);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          objc_msgSend(v22, "setDownloadError:", v28);
          sub_10002FBB8(v22, -1);
          v29 = sub_1000128F4();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
            *(_DWORD *)buf = 138543874;
            v86 = v50;
            v87 = 2114;
            v88 = v51;
            v89 = 2114;
            v90 = v52;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failing download (%{public}@ , %{public}@) because it is already scheduled. App:(%{public}@).", buf, 0x20u);

            v15 = v68;
          }

          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "responseQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100015F54;
          block[3] = &unk_100058E30;
          block[4] = self;
          block[5] = v22;
          v80 = v28;
          v32 = v28;
          dispatch_async(v31, block);

          v33 = v80;
LABEL_24:

          goto LABEL_25;
        }
        v34 = objc_msgSend(v22, "necessity");
        if (v34 == (id)1)
          v35 = 1;
        else
          v35 = v15;
        if ((v35 & 1) == 0)
        {
          v43 = sub_1000272FC(111);
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          objc_msgSend(v22, "setDownloadError:", v44);
          sub_10002FBB8(v22, -1);
          v45 = sub_1000128F4();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
            *(_DWORD *)buf = 138543874;
            v86 = v56;
            v87 = 2114;
            v88 = v57;
            v89 = 2114;
            v90 = v58;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failing download (%{public}@ , %{public}@) because download is optional and background activity is disabled. App:(%{public}@).", buf, 0x20u);

            v15 = v68;
          }

          v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "responseQueue"));
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_100015F64;
          v77[3] = &unk_100058E30;
          v77[4] = self;
          v77[5] = v22;
          v78 = v44;
          v32 = v44;
          dispatch_async(v47, v77);

          v33 = v78;
          goto LABEL_24;
        }
        if (v70 <= 1 && v34 == (id)1)
        {
          v36 = objc_msgSend(v69, "initialRestrictionsAreEnforced");
          v37 = sub_1000301EC(v22);
          if (v36)
          {
            if ((unint64_t)v16 < v37)
            {
              v38 = sub_1000272FC(112);
              v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
              objc_msgSend(v22, "setDownloadError:", v39);
              sub_10002FBB8(v22, -1);
              v40 = sub_1000128F4();
              v41 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
                v61 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
                *(_DWORD *)buf = 138543874;
                v86 = v59;
                v87 = 2114;
                v88 = v60;
                v89 = 2114;
                v90 = v61;
                _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failing download (%{public}@ , %{public}@) because enqueueing download would exceed essential download allowance. App:(%{public}@).", buf, 0x20u);

                v15 = v68;
              }

              v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "responseQueue"));
              v75[0] = _NSConcreteStackBlock;
              v75[1] = 3221225472;
              v75[2] = sub_100015F74;
              v75[3] = &unk_100058E30;
              v75[4] = self;
              v75[5] = v22;
              v76 = v39;
              v32 = v39;
              dispatch_async(v42, v75);

              v33 = v76;
              goto LABEL_24;
            }
            -[BADownloadQueue setEssentialAssetsBytesTotal:](self, "setEssentialAssetsBytesTotal:", (char *)-[BADownloadQueue essentialAssetsBytesTotal](self, "essentialAssetsBytesTotal")+ sub_1000301EC(v22));
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            objc_msgSend(v53, "addObject:", v54);

            v55 = sub_1000301EC(v22);
            if ((unint64_t)v16 >= v55)
              v16 -= v55;
            else
              v16 = 0;
          }
          else
          {
            -[BADownloadQueue setEssentialAssetsBytesTotal:](self, "setEssentialAssetsBytesTotal:", (char *)-[BADownloadQueue essentialAssetsBytesTotal](self, "essentialAssetsBytesTotal") + v37);
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            objc_msgSend(v48, "addObject:", v49);

          }
        }
        -[BADownloadQueue _addDownload:](self, "_addDownload:", v22);
LABEL_25:
        v21 = (char *)v21 + 1;
      }
      while (v20 != v21);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
      v20 = v62;
    }
    while (v62);
  }

  -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
  os_unfair_recursive_lock_unlock(&self->_stateLock);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100015F84;
  v73[3] = &unk_100058F48;
  v74 = v65;
  v63 = v65;
  dispatch_async(queue, v73);

}

- (void)startForegroundDownload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  qos_class_t v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  qos_class_t v18;
  dispatch_queue_global_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  os_unfair_recursive_lock_s *p_stateLock;
  unsigned int v24;
  id v25;
  NSObject *v26;
  qos_class_t v27;
  dispatch_queue_global_t v28;
  NSObject *v29;
  int v30;
  id v31;
  id v32;
  id v33;
  int v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  qos_class_t v40;
  dispatch_queue_global_t v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD block[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloadWithUniqueIdentifier:](self, "downloadWithUniqueIdentifier:", v8));

  if (v9)
  {
    if (objc_msgSend(v6, "necessity") == (id)1)
    {
      v10 = sub_1000128F4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100035A4C();

      v12 = qos_class_self();
      global_queue = dispatch_get_global_queue(v12, 0);
      v14 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001644C;
      block[3] = &unk_100058F48;
      v50 = v7;
      dispatch_async(v14, block);

      v15 = v50;
      goto LABEL_38;
    }
    if (objc_msgSend(v9, "necessity") == (id)1 && !objc_msgSend(v6, "necessity"))
    {
      v21 = sub_1000128F4();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100035B64();

    }
    p_stateLock = &self->_stateLock;
    os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
    v24 = -[BADownloadQueue frozen](self, "frozen");
    os_unfair_recursive_lock_unlock(&self->_stateLock);
    if (v24)
    {
      v25 = sub_1000128F4();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_100035AD8();

      v27 = qos_class_self();
      v28 = dispatch_get_global_queue(v27, 0);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100016494;
      v47[3] = &unk_100058F48;
      v48 = v7;
      dispatch_async(v29, v47);

      v15 = v48;
      goto LABEL_38;
    }
    os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v9, "downloadLock"));
    if ((objc_msgSend(v9, "isForegroundDownload") & 1) != 0)
    {
      v30 = 0;
    }
    else
    {
      v31 = objc_msgSend(v9, "state");
      if (v31 == (id)2)
      {
        v30 = 0;
        v33 = 0;
        v34 = 1;
        goto LABEL_26;
      }
      if (v31 == (id)-1)
      {
        v32 = sub_1000272FC(103);
        v33 = (id)objc_claimAutoreleasedReturnValue(v32);
        v30 = 0;
        v34 = 0;
        goto LABEL_26;
      }
      v30 = 1;
      objc_msgSend(v9, "setIsForegroundDownload:", 1);
    }
    v34 = 0;
    v33 = 0;
LABEL_26:
    os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v9, "downloadLock"));
    if (!v33)
    {
      if (v34)
      {
        objc_msgSend(v9, "promoteToForeground");
      }
      else if (v30)
      {
        os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
        v46 = 0;
        v35 = objc_msgSend(v9, "startDownloadWithDelegate:error:", self, &v46);
        v36 = v46;
        v37 = v36;
        if ((v35 & 1) != 0)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeDownloads](self, "activeDownloads"));
          objc_msgSend(v38, "addObject:", v9);

          v33 = 0;
        }
        else
        {
          if (!v36)
          {
            v39 = sub_1000272FC(102);
            v37 = (void *)objc_claimAutoreleasedReturnValue(v39);
          }
          v33 = v37;
          v37 = v33;
        }
        os_unfair_recursive_lock_unlock(p_stateLock);

        goto LABEL_37;
      }
      v33 = 0;
    }
LABEL_37:
    v40 = qos_class_self();
    v41 = dispatch_get_global_queue(v40, 0);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000164DC;
    v43[3] = &unk_100058F20;
    v44 = v33;
    v45 = v7;
    v15 = v33;
    dispatch_async(v42, v43);

    goto LABEL_38;
  }
  v16 = sub_1000128F4();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_1000359C0();

  v18 = qos_class_self();
  v19 = dispatch_get_global_queue(v18, 0);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100016404;
  v51[3] = &unk_100058F48;
  v52 = v7;
  dispatch_async(v20, v51);

  v15 = v52;
LABEL_38:

}

- (BOOL)cancelDownload:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloadWithUniqueIdentifier:](self, "downloadWithUniqueIdentifier:", v6));

  if (v7)
  {
    objc_msgSend(v7, "cancelDownload");
  }
  else if (a4)
  {
    v8 = sub_1000272FC(101);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7 != 0;
}

- (void)cancelAllDownloads
{
  -[BADownloadQueue _cancelAllDownloadsSilently:](self, "_cancelAllDownloadsSilently:", 0);
}

- (void)cancelAllDownloadsSilently
{
  -[BADownloadQueue _cancelAllDownloadsSilently:](self, "_cancelAllDownloadsSilently:", 1);
}

- (void)_cancelAllDownloadsSilently:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  os_unfair_recursive_lock_s *p_stateLock;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeDownloads](self, "activeDownloads"));
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if (v13)
        {
          if (v3)
            objc_msgSend(v11, "cancelDownloadSilently");
          else
            objc_msgSend(v11, "cancelDownload");
        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    if (v3)
      v18 = -2;
    else
      v18 = -1;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -999, 0));
        sub_10002FBB8(v20, v18);
        -[BADownloadQueue download:failedWithError:](self, "download:failedWithError:", v20, v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (void)demoteAllForegroundDownloads
{
  os_unfair_recursive_lock_s *p_stateLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeDownloads](self, "activeDownloads"));
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if (v11)
        {
          objc_msgSend(v9, "demoteToBackground");
        }
        else
        {
          os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v9, "downloadLock"));
          objc_msgSend(v9, "setIsForegroundDownload:", 0);
          os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v9, "downloadLock"));
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (BOOL)startNextDownload
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  os_unfair_recursive_lock_s *p_stateLock;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  _QWORD v29[5];
  unsigned __int8 v30;
  unsigned __int8 v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100016D1C;
  v37 = sub_100016D2C;
  v38 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "downloadQueue:permittedToStartDownloadsWithNecessity:", self, 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "downloadQueue:permittedToStartDownloadsWithNecessity:", self, 0);

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  if (-[BADownloadQueue frozen](self, "frozen"))
    goto LABEL_5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
  v9 = objc_msgSend(v8, "count");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100016D34;
  v29[3] = &unk_100058F70;
  v30 = v4;
  v31 = v6;
  v32 = v9 != 0;
  v29[4] = &v33;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v29);

  v11 = (void *)v34[5];
  if (!v11)
  {
LABEL_5:
    v12 = 0;
  }
  else
  {
    v28 = 0;
    v12 = objc_msgSend(v11, "startDownloadWithDelegate:error:", self, &v28);
    v13 = v28;
    if ((v12 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v34[5], "downloadStartDate"));
      -[BADownloadQueue setLastDownloadStartDate:](self, "setLastDownloadStartDate:", v14);

      v15 = (id)objc_claimAutoreleasedReturnValue(-[BADownloadQueue activeDownloads](self, "activeDownloads"));
      objc_msgSend(v15, "addObject:", v34[5]);
    }
    else
    {
      v16 = sub_100012964();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v34[5], "identifier"));
        *(_DWORD *)buf = 138543874;
        v40 = v22;
        v41 = 2114;
        v42 = v23;
        v43 = 2114;
        v44 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to start the next download in the queue. (Client Identifier: %{public}@) (Download Identifier: %{public}@) Error:%{public}@", buf, 0x20u);

      }
      if (!v13)
      {
        v18 = sub_1000272FC(102);
        v13 = (id)objc_claimAutoreleasedReturnValue(v18);
      }
      os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend((id)v34[5], "downloadLock"));
      sub_10002FBB8((void *)v34[5], -1);
      objc_msgSend((id)v34[5], "setDownloadError:", v13);
      os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend((id)v34[5], "downloadLock"));
      v19 = (void *)os_transaction_create("com.apple.backgroundassets.startNextDownload.failed_to_start");
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v34[5], "responseQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100016DF8;
      block[3] = &unk_100058F98;
      block[4] = self;
      v27 = &v33;
      v13 = v13;
      v25 = v13;
      v26 = v19;
      v15 = v19;
      dispatch_async(v20, block);

    }
  }
  os_unfair_recursive_lock_unlock(p_stateLock);
  _Block_object_dispose(&v33, 8);

  return v12;
}

- (void)pauseAllDownloads
{
  os_unfair_recursive_lock_s *p_stateLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "state") == (id)2)
          objc_msgSend(v9, "pauseDownload");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (void)freeze
{
  os_unfair_recursive_lock_s *p_stateLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  if (!-[BADownloadQueue frozen](self, "frozen"))
  {
    -[BADownloadQueue setFrozen:](self, "setFrozen:", 1);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "state") == (id)2)
            objc_msgSend(v9, "pauseDownload");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v6);
    }

    v10 = sub_1000128F4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Download queue (%{public}@) has been frozen.", buf, 0xCu);

    }
    -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
  }
  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (void)thaw
{
  os_unfair_recursive_lock_s *p_stateLock;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  if (-[BADownloadQueue frozen](self, "frozen"))
  {
    -[BADownloadQueue setFrozen:](self, "setFrozen:", 0);
    v4 = sub_1000128F4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download queue (%{public}@) has been thawed.", (uint8_t *)&v7, 0xCu);

    }
  }
  os_unfair_recursive_lock_unlock(p_stateLock);
}

- (int64_t)numberOfActiveDownloads
{
  os_unfair_recursive_lock_s *p_stateLock;
  void *v4;
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "state") == (id)2)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  os_unfair_recursive_lock_unlock(p_stateLock);
  return v7;
}

- (int64_t)numberOfWaitingDownloads
{
  os_unfair_recursive_lock_s *p_stateLock;
  void *v4;
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "state") == (id)1)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  os_unfair_recursive_lock_unlock(p_stateLock);
  return v7;
}

- (NSArray)allDownloads
{
  os_unfair_recursive_lock_s *p_stateLock;
  void *v4;
  void *v5;
  id v6;

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue downloads](self, "downloads"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
  v6 = objc_msgSend(v5, "copy");

  os_unfair_recursive_lock_unlock(p_stateLock);
  return (NSArray *)v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue allDownloads](self, "allDownloads"));
  v4 = objc_alloc((Class)NSMutableString);
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ (%p) - %lu Downloads {\n"), v8, self, objc_msgSend(v3, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "appendString:", CFSTR("}"));
  return (NSString *)v9;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue allDownloads](self, "allDownloads"));
  v4 = objc_alloc((Class)NSMutableString);
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue identifier](self, "identifier"));
  v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ (%p)\nApplication Identifier: %@\nDownloads (%lu): {\n"), v8, self, v9, objc_msgSend(v3, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15), "debugDescription"));
        objc_msgSend(v10, "appendFormat:", CFSTR("%@\n"), v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "appendString:", CFSTR("}"));
  return (NSString *)v10;
}

- (void)downloadDidBegin:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v5, "downloadDidBegin:", v6);

  }
}

- (void)downloadDidPause:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v5, "downloadDidPause:", v6);

  }
}

- (void)download:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));

  if (v10)
  {
    if (objc_msgSend(v15, "necessity") == (id)1)
    {
      os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v13 = objc_msgSend(v11, "containsObject:", v12);

      if (v13)
      {
        -[BADownloadQueue setEssentialAssetsBytesDownloaded:](self, "setEssentialAssetsBytesDownloaded:", (char *)-[BADownloadQueue essentialAssetsBytesDownloaded](self, "essentialAssetsBytesDownloaded") + a4);
        -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
      }
      os_unfair_recursive_lock_unlock(&self->_stateLock);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v14, "download:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:", v15, a4, a5, a6);

  }
}

- (void)download:(id)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v9, "download:didResumeAtOffset:expectedTotalBytes:", v10, a4, a5);

  }
}

- (void)download:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v11, "download:didReceiveChallenge:completionHandler:", v12, v8, v9);

  }
}

- (void)download:(id)a3 failedWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
  v8 = objc_msgSend(v7, "count");

  -[BADownloadQueue _removeDownload:](self, "_removeDownload:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
  v10 = objc_msgSend(v9, "count");

  if (v8 && !v10)
    -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
  os_unfair_recursive_lock_unlock(&self->_stateLock);
  if (sub_1000301A8(v19) == -2)
  {
    v12 = sub_100030230(v19, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v16 = sub_100030230(v19, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v14, "removeItemAtURL:error:", v17, 0);

LABEL_9:
    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));

    if (v18)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
      objc_msgSend(v14, "download:failedWithError:", v19, v6);
      goto LABEL_9;
    }
  }

}

- (void)download:(id)a3 finishedWithFileURL:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v8 = objc_opt_class(BAManifestDownload, v7);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0)
  {
    v9 = v15;
    os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
    if ((unint64_t)(sub_10000B428((uint64_t)v9) - 1) <= 1)
    {
      -[BADownloadQueue setEssentialAssetsWaitingOnContentRequest:](self, "setEssentialAssetsWaitingOnContentRequest:", 1);
      -[BADownloadQueue setEssentialAssetsBytesTotal:](self, "setEssentialAssetsBytesTotal:", -[BADownloadQueue essentialAssetsBytesDownloaded](self, "essentialAssetsBytesDownloaded"));
    }
    -[BADownloadQueue _removeDownload:](self, "_removeDownload:", v9);
    -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
    os_unfair_recursive_lock_unlock(&self->_stateLock);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v10, "downloadQueue:manifest:finishedWithFileURL:", self, v9, v6);

    v6 = v10;
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options(&self->_stateLock, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
    v12 = objc_msgSend(v11, "count");

    -[BADownloadQueue _removeDownload:](self, "_removeDownload:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue essentialAssetIdentifiersMonitored](self, "essentialAssetIdentifiersMonitored"));
    v14 = objc_msgSend(v13, "count");

    if (v12 && !v14)
      -[BADownloadQueue _reportEssentialAssetStateAndProgress](self, "_reportEssentialAssetStateAndProgress");
    os_unfair_recursive_lock_unlock(&self->_stateLock);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BADownloadQueue delegate](self, "delegate"));
    objc_msgSend(v9, "download:finishedWithFileURL:", v15, v6);
  }

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)lastDownloadStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastDownloadStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BADownloadQueueDelegate)delegate
{
  return (BADownloadQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BAManifestDownload)activeManifestDownload
{
  return (BAManifestDownload *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveManifestDownload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableOrderedSet)downloads
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableSet)activeDownloads
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActiveDownloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)uniqueIdentifiersToDownloads
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUniqueIdentifiersToDownloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)identifiersToDownloads
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdentifiersToDownloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (NSString)stagingDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)essentialAssetsWaitingOnContentRequest
{
  return self->_essentialAssetsWaitingOnContentRequest;
}

- (void)setEssentialAssetsWaitingOnContentRequest:(BOOL)a3
{
  self->_essentialAssetsWaitingOnContentRequest = a3;
}

- (NSMutableSet)essentialAssetIdentifiersMonitored
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEssentialAssetIdentifiersMonitored:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int64_t)essentialAssetsBytesDownloaded
{
  return self->_essentialAssetsBytesDownloaded;
}

- (void)setEssentialAssetsBytesDownloaded:(int64_t)a3
{
  self->_essentialAssetsBytesDownloaded = a3;
}

- (unint64_t)essentialAssetsBytesTotal
{
  return self->_essentialAssetsBytesTotal;
}

- (void)setEssentialAssetsBytesTotal:(unint64_t)a3
{
  self->_essentialAssetsBytesTotal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_essentialAssetIdentifiersMonitored, 0);
  objc_storeStrong((id *)&self->_stagingDirectory, 0);
  objc_storeStrong((id *)&self->_identifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_activeManifestDownload, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastDownloadStartDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
