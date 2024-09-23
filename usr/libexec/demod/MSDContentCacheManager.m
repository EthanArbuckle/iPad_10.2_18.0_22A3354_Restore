@implementation MSDContentCacheManager

+ (id)sharedInstance
{
  if (qword_100175548 != -1)
    dispatch_once(&qword_100175548, &stru_10013F890);
  return (id)qword_100175540;
}

- (MSDContentCacheManager)init
{
  MSDContentCacheManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v14.receiver = self;
  v14.super_class = (Class)MSDContentCacheManager;
  v2 = -[MSDContentCacheManager init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    -[MSDContentCacheManager setFileManager:](v2, "setFileManager:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/.MSD_cache/AppPatches.plist")));
    -[MSDContentCacheManager setAppPatchesListFileURL:](v2, "setAppPatchesListFileURL:", v4);

    -[MSDContentCacheManager setDemoVolumeCacheFolderPath:](v2, "setDemoVolumeCacheFolderPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/.MSD_cache"));
    -[MSDContentCacheManager setDataVolumeCacheFolderPath:](v2, "setDataVolumeCacheFolderPath:", CFSTR("/var/MSDWorkContainer/.MSD_cache"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "demoUserHomePath"));
    -[MSDContentCacheManager setUserHomePath:](v2, "setUserHomePath:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userHomePath](v2, "userHomePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/.MSD_cache")));
    -[MSDContentCacheManager setUserVolumeCacheFolderPath:](v2, "setUserVolumeCacheFolderPath:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager dataVolumeCacheFolderPath](v2, "dataVolumeCacheFolderPath"));
    v15[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager demoVolumeCacheFolderPath](v2, "demoVolumeCacheFolderPath"));
    v15[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userVolumeCacheFolderPath](v2, "userVolumeCacheFolderPath"));
    v15[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
    -[MSDContentCacheManager setFileDownloadCachePaths:](v2, "setFileDownloadCachePaths:", v12);

    -[MSDContentCacheManager _loadCachedManifestPaths](v2, "_loadCachedManifestPaths");
    -[MSDContentCacheManager createDownloadCacheFolders](v2, "createDownloadCacheFolders");
    -[MSDContentCacheManager loadAppPatchesList](v2, "loadAppPatchesList");
  }
  return v2;
}

- (void)clearCache
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 138543362;
    v16 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager", v16));
        v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

        if (v11)
        {
          v12 = sub_1000604F0();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", buf, 0xCu);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
          objc_msgSend(v14, "removeItemAtPath:error:", v9, 0);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
        objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  -[MSDContentCacheManager _clearFactoryCache](self, "_clearFactoryCache");
}

- (void)clearCacheExceptFileHashes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  _QWORD v19[6];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138543362;
    v18 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager", v18));
        v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

        if (v13)
        {
          v14 = sub_1000604F0();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", buf, 0xCu);
          }

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v11, 0));

          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1000982F0;
          v19[3] = &unk_10013F8B8;
          v19[4] = v11;
          v19[5] = self;
          v20 = v4;
          objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  -[MSDContentCacheManager _clearFactoryCache](self, "_clearFactoryCache");
}

- (BOOL)copyFileIfPresentInCache:(id)a3 toLocation:(id)a4 verifyHash:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager findFileInCache:](self, "findFileInCache:", v8));
  if (v10)
  {
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileHashWithPath:](MSDFileMetadata, "fileHashWithPath:", v10));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hexStringRepresentation"));

      if (!objc_msgSend(v8, "isEqualToString:", v12))
      {
        v25 = sub_1000604F0();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_1000CA260();

        v17 = 0;
        goto LABEL_19;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v9);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
      v28 = 0;
      v16 = objc_msgSend(v15, "removeItemAtPath:error:", v9, &v28);
      v17 = v28;

      if ((v16 & 1) == 0)
      {
        v18 = sub_1000604F0();
        v12 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_1000CA1F8();
LABEL_19:

        v19 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      v17 = 0;
    }
    v20 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    v27 = v17;
    v22 = objc_msgSend(v21, "copyItemAtPath:toPath:error:", v10, v9, &v27);
    v17 = v27;

    if ((v22 & 1) == 0)
    {
      v24 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000CA190();
      goto LABEL_19;
    }
    v19 = 1;
  }
  else
  {
    v19 = 0;
    v17 = 0;
  }
LABEL_13:

  return v19;
}

- (id)fileCachePathFromSourcePath:(id)a3 forBackgroundDownload:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("/private")))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length")));

    v6 = (id)v7;
  }
  if (v4)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager demoVolumeCacheFolderPath](self, "demoVolumeCacheFolderPath"));
  }
  else if (v6
         && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userHomePath](self, "userHomePath")),
             v10 = objc_msgSend(v6, "hasPrefix:", v9),
             v9,
             v10))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userVolumeCacheFolderPath](self, "userVolumeCacheFolderPath"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager dataVolumeCacheFolderPath](self, "dataVolumeCacheFolderPath"));
  }
  v11 = (void *)v8;

  return v11;
}

- (void)addAppDiffPatchFile:(id)a3 sourceAppUID:(id)a4 targetAppUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_sync_enter(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_msgSend(v12, "setObject:forKey:", v13, v10);

  -[MSDContentCacheManager saveAppPatchesList](self, "saveAppPatchesList");
  objc_sync_exit(v11);

}

- (void)removeAppDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v10, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_msgSend(v9, "removeObjectForKey:", v7);

  -[MSDContentCacheManager saveAppPatchesList](self, "saveAppPatchesList");
  objc_sync_exit(v8);

}

- (id)appDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));

  objc_sync_exit(v9);
  return v11;
}

- (id)findFileInCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "stringByAppendingPathComponent:", v4));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
      v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

      if ((v12 & 1) != 0)
        break;

      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (unint64_t)fileSizeInCache:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager findFileInCache:](self, "findFileInCache:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, 0));

  if (v6)
    v7 = objc_msgSend(v6, "fileSize");
  else
    v7 = 0;

  return (unint64_t)v7;
}

- (BOOL)deleteFromCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  BOOL v9;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager findFileInCache:](self, "findFileInCache:", v4));
  if (!v5)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000CA2C4();
    v8 = 0;
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  v15 = 0;
  v7 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v15);
  v8 = v15;

  if ((v7 & 1) == 0)
  {
    v13 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
      *(_DWORD *)buf = 138543874;
      v17 = v4;
      v18 = 2114;
      v19 = v5;
      v20 = 2114;
      v21 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete hash: %{public}@ with path: %{public}@ from cache; error: %{public}@",
        buf,
        0x20u);

    }
LABEL_10:

    v9 = 0;
    goto LABEL_4;
  }
  v9 = 1;
LABEL_4:

  return v9;
}

- (void)createDownloadCacheFolders
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths", 0));
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
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
        v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

        if ((v11 & 1) == 0)
          objc_msgSend(v3, "prepareWorkDirectory:writableByNonRoot:", v9, 1);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)loadAppPatchesList
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatchesListFileURL](self, "appPatchesListFileURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatchesListFileURL](self, "appPatchesListFileURL"));
    v13 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v7, &v13));
    v9 = v13;

    if (v8)
    {
      v10 = objc_msgSend(v8, "mutableCopy");
      -[MSDContentCacheManager setAppPatches:](self, "setAppPatches:", v10);
    }
    else
    {
      v11 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000CA328(v9, v10);
    }

  }
  else
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDContentCacheManager setAppPatches:](self, "setAppPatches:", v12);

  }
}

- (void)saveAppPatchesList
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatchesListFileURL](self, "appPatchesListFileURL"));
  v9 = 0;
  v5 = objc_msgSend(v3, "writeToURL:error:", v4, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000CA3A8(v6, v8);

  }
}

- (void)_loadCachedManifestPaths
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *cachedManifestPaths;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100099240;
  v12 = sub_100099250;
  v13 = (id)objc_opt_new(NSMutableArray, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest"), 0));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100099258;
  v7[3] = &unk_10013F528;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v9[5]));
  cachedManifestPaths = self->_cachedManifestPaths;
  self->_cachedManifestPaths = v5;

  _Block_object_dispose(&v8, 8);
}

- (void)_clearFactoryCache
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const __CFString *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest"));

  if (v4)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    objc_msgSend(v7, "removeItemAtPath:error:", CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest"), 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  v9 = objc_msgSend(v8, "fileExistsAtPath:", CFSTR("/var/MSDWorkContainer/.MSD_cache_content_plist"));

  if (v9)
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = CFSTR("/var/MSDWorkContainer/.MSD_cache_content_plist");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    objc_msgSend(v12, "removeItemAtPath:error:", CFSTR("/var/MSDWorkContainer/.MSD_cache_content_plist"), 0);

  }
}

- (NSArray)cachedManifestPaths
{
  return self->_cachedManifestPaths;
}

- (NSArray)fileDownloadCachePaths
{
  return self->_fileDownloadCachePaths;
}

- (void)setFileDownloadCachePaths:(id)a3
{
  objc_storeStrong((id *)&self->_fileDownloadCachePaths, a3);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (NSMutableDictionary)appPatches
{
  return self->_appPatches;
}

- (void)setAppPatches:(id)a3
{
  objc_storeStrong((id *)&self->_appPatches, a3);
}

- (NSURL)appPatchesListFileURL
{
  return self->_appPatchesListFileURL;
}

- (void)setAppPatchesListFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_appPatchesListFileURL, a3);
}

- (NSString)dataVolumeCacheFolderPath
{
  return self->_dataVolumeCacheFolderPath;
}

- (void)setDataVolumeCacheFolderPath:(id)a3
{
  objc_storeStrong((id *)&self->_dataVolumeCacheFolderPath, a3);
}

- (NSString)demoVolumeCacheFolderPath
{
  return self->_demoVolumeCacheFolderPath;
}

- (void)setDemoVolumeCacheFolderPath:(id)a3
{
  objc_storeStrong((id *)&self->_demoVolumeCacheFolderPath, a3);
}

- (NSString)userVolumeCacheFolderPath
{
  return self->_userVolumeCacheFolderPath;
}

- (void)setUserVolumeCacheFolderPath:(id)a3
{
  objc_storeStrong((id *)&self->_userVolumeCacheFolderPath, a3);
}

- (NSString)userHomePath
{
  return self->_userHomePath;
}

- (void)setUserHomePath:(id)a3
{
  objc_storeStrong((id *)&self->_userHomePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHomePath, 0);
  objc_storeStrong((id *)&self->_userVolumeCacheFolderPath, 0);
  objc_storeStrong((id *)&self->_demoVolumeCacheFolderPath, 0);
  objc_storeStrong((id *)&self->_dataVolumeCacheFolderPath, 0);
  objc_storeStrong((id *)&self->_appPatchesListFileURL, 0);
  objc_storeStrong((id *)&self->_appPatches, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_fileDownloadCachePaths, 0);
  objc_storeStrong((id *)&self->_cachedManifestPaths, 0);
}

@end
