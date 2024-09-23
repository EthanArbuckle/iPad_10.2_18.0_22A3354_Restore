@implementation WebBundleDownloadManager

- (id)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___WebBundleDownloadManagerObserver, &_dispatch_main_q);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

+ (id)sharedInstance
{
  return 0;
}

- (WebBundleDownloadManager)initWithConfiguration:(id)a3
{
  id v5;
  WebBundleDownloadManager *v6;
  WebBundleDownloadManager *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *downloadingQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WebBundleDownloadManager;
  v6 = -[WebBundleDownloadManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.maps.webbundle.downloading", v9);
    downloadingQueue = v7->_downloadingQueue;
    v7->_downloadingQueue = (OS_dispatch_queue *)v10;

    -[WebBundleDownloadManager _updateOnDevicesWebBundleIfNeed](v7, "_updateOnDevicesWebBundleIfNeed");
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)downloadWebBundle
{
  -[WebBundleDownloadManager _downloadWebBundleWithForce:](self, "_downloadWebBundleWithForce:", 0);
}

- (void)_downloadWebBundleWithForce:(BOOL)a3
{
  NSObject *downloadingQueue;
  _QWORD v6[5];
  BOOL v7;

  if (!-[WebBundleDownloadManager isWebBundleDownloading](self, "isWebBundleDownloading"))
  {
    -[WebBundleDownloadManager setWebBundleDownloading:](self, "setWebBundleDownloading:", 1);
    downloadingQueue = self->_downloadingQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100BC710C;
    v6[3] = &unk_1011ACE58;
    v6[4] = self;
    v7 = a3;
    dispatch_async(downloadingQueue, v6);
  }
}

- (void)_downloadManifestWithForce:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *global_queue;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTileGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "explicitResources"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100BC80E4;
  v18[3] = &unk_1011E8278;
  objc_copyWeak(&v19, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v18));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceRequester sharedRequester](GEOResourceRequester, "sharedRequester"));
  global_queue = (void *)geo_get_global_queue(21);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BC8174;
  v15[3] = &unk_1011B21F8;
  objc_copyWeak(&v17, &location);
  v14 = v6;
  v16 = v14;
  objc_msgSend(v12, "fetchResources:force:manifestConfiguration:auditToken:queue:handler:", v11, v4, 0, 0, global_queue, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (void)_downloadWebBundleFileWithPath:(id)a3 inDirectory:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, void *);
  void *v22;
  WebBundleDownloadManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration serverURL](self->_configuration, "serverURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v8));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v12));
  objc_initWeak(&location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100BC8440;
  v22 = &unk_1011E82C8;
  objc_copyWeak(&v27, &location);
  v15 = v10;
  v26 = v15;
  v23 = self;
  v16 = v9;
  v24 = v16;
  v17 = v8;
  v25 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataTaskWithRequest:completionHandler:", v13, &v19));

  objc_msgSend(v18, "resume", v19, v20, v21, v22, v23);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)_downloadCompleteWithNewDirectory:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = sub_10043292C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Download failed with error:%@", (uint8_t *)&v15, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager observers](self, "observers"));
    objc_msgSend(v10, "webBundleEncounteredError:", v7);
LABEL_5:

    goto LABEL_10;
  }
  v11 = sub_10043292C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v13)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Web bundle hasn't changed", (uint8_t *)&v15, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager observers](self, "observers"));
    objc_msgSend(v10, "webBundleHadNoChanges");
    goto LABEL_5;
  }
  if (v13)
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Download complete with new directory: %@", (uint8_t *)&v15, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager observers](self, "observers"));
  objc_msgSend(v14, "webBundleUpdatedWithWebBundlePath:", v6);

  -[WebBundleConfiguration setWebBundleDirectory:](self->_configuration, "setWebBundleDirectory:", v6);
  +[RAPWebBundleConfigurationManager saveConfiguration:](RAPWebBundleConfigurationManager, "saveConfiguration:", self->_configuration);
  -[WebBundleDownloadManager _updateOnDevicesWebBundleIfNeed](self, "_updateOnDevicesWebBundleIfNeed");
LABEL_10:
  -[WebBundleDownloadManager setWebBundleDownloading:](self, "setWebBundleDownloading:", 0);

}

- (BOOL)_saveWebBundleManifestToDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v13));

  v9 = v13;
  v10 = v9;
  if (v9)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration manifestKey](self->_configuration, "manifestKey"));
    objc_msgSend(v7, "setObject:forKey:", v8, v11);

    objc_msgSend(v7, "synchronize");
  }

  return v10 == 0;
}

- (id)loadWebBundleManifestWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration manifestKey](self->_configuration, "manifestKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  if (v7)
  {
    v8 = objc_opt_class(WebBundleManifest);
    v9 = objc_opt_class(WebBundleFile);
    v10 = objc_opt_class(NSString);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(NSSet), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v7, a3));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_fileHashesInFiles:(id)a3 areEqualToFilesInDirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  const __CFString *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v8 = a3;
  v9 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filePath", (_QWORD)v29));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager _fileHashForFile:](self, "_fileHashForFile:", v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fileHash"));
        if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) == 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
          v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

          v24 = sub_10043292C();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            if (v23)
              v26 = &stru_1011EB268;
            else
              v26 = CFSTR(" NOT");
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
            *(_DWORD *)buf = 138412546;
            v34 = v26;
            v35 = 2112;
            v36 = v27;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "File%@ exists and hashes doesn't match: %@", buf, 0x16u);

          }
          if (a5)
            *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.ReportAProblem.Downloader"), -4, 0));

          v20 = 0;
          goto LABEL_18;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v12)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_18:

  return v20;
}

- (id)_fileHashForFile:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  __CFString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    LODWORD(v5) = objc_msgSend(v5, "length");
    v7 = objc_retainAutorelease(v4);
    CC_SHA256(v6, (CC_LONG)v5, (unsigned __int8 *)objc_msgSend(v7, "mutableBytes"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64EncodedStringWithOptions:", 0));

  }
  else
  {
    v8 = &stru_1011EB268;
  }

  return v8;
}

- (BOOL)_saveFileData:(id)a3 toDirectory:(id)a4 toFilePath:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByAppendingPathComponent:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByDeletingLastPathComponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = 0;
  objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v22);
  v13 = v22;

  if (v13)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v13);
    v14 = sub_10043292C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Directory %@ creation error: %@", buf, 0x16u);
    }

LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v21 = 0;
  objc_msgSend(v9, "writeToURL:options:error:", v10, 0, &v21);
  v13 = v21;
  v18 = sub_10043292C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v13)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "File %@ saving error: %@", buf, 0x16u);
    }

    if (a6)
    {
      v13 = objc_retainAutorelease(v13);
      v16 = 0;
      *a6 = v13;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "File downloaded: %@", buf, 0xCu);
  }

  v13 = 0;
  v16 = 1;
LABEL_8:

  return v16;
}

- (id)_loadCachedWebBundleVersion
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t String;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", CFSTR("kRAPBuiltInWebBundleVersionKey")));

  if (v4)
  {
    v5 = sub_10043292C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found RAPCachedWebBundleVersionKey key in NSUserDefaults when loading cached web bundle. Load using NSUserDefaults string, setting GEOConfig with version, then removing from NSUserDefaults.", (uint8_t *)&v19, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", CFSTR("kRAPBuiltInWebBundleVersionKey")));
    GEOConfigSetString(MapsConfig_RAPBuiltInWebBundleVersionKey, off_1014B55C8, v7);
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("kRAPBuiltInWebBundleVersionKey"));
  }
  else
  {
    String = GEOConfigGetString(MapsConfig_RAPBuiltInWebBundleVersionKey, off_1014B55C8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(String);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](self->_configuration, "absoluteCachedWebBundleDirectory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v11, 0));

  v13 = sub_10043292C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v12, "count");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](self->_configuration, "absoluteCachedWebBundleDirectory"));
    v19 = 134218242;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "number of files in cached web bundle directory: %lu, directory:%@", (uint8_t *)&v19, 0x16u);

  }
  if (objc_msgSend(v12, "count"))
    v17 = v7;
  else
    v17 = 0;

  return v17;
}

- (void)_updateCachedWebBundleVersion:(id)a3
{
  GEOConfigSetString(MapsConfig_RAPBuiltInWebBundleVersionKey, off_1014B55C8, a3);
}

- (void)_updateOnDevicesWebBundleIfNeed
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleDownloadManager loadWebBundleManifestWithError:](self, "loadWebBundleManifestWithError:", &v15));
  v4 = v15;
  if (v4)
  {
    v5 = sub_10043292C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "manifest loading error: %@", buf, 0xCu);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteBuiltInWebBundleDirectory](self->_configuration, "absoluteBuiltInWebBundleDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("manifest.json")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v8));
  if (!v9)
  {
    v10 = sub_10043292C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Empty data in built-in manifest at path: %@", buf, 0xCu);
    }

  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BC9274;
  v13[3] = &unk_1011E82F0;
  v13[4] = self;
  v14 = v3;
  v12 = v3;
  +[WebBundleFileHelper parseManifestFileFromData:withCompletion:](WebBundleFileHelper, "parseManifestFileFromData:withCompletion:", v9, v13);

}

- (void)_updateCachedBundleFromDownloadedBundleDirectoryWithManifest:(id)a3 error:(id *)a4
{
  WebBundleConfiguration *configuration;
  id v7;
  void *v8;
  id v9;

  configuration = self->_configuration;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](configuration, "absoluteCachedWebBundleDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self->_configuration, "webBundleDirectory"));
  +[WebBundleFileHelper copyWebBundleFilesToDirectory:fromDirectory:webBundleManifest:error:](WebBundleFileHelper, "copyWebBundleFilesToDirectory:fromDirectory:webBundleManifest:error:", v9, v8, v7, a4);

}

- (void)_updateCachedBundleFromBuiltInDirectoryWithManifest:(id)a3 error:(id *)a4
{
  WebBundleConfiguration *configuration;
  id v7;
  void *v8;
  id v9;

  configuration = self->_configuration;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](configuration, "absoluteCachedWebBundleDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteBuiltInWebBundleDirectory](self->_configuration, "absoluteBuiltInWebBundleDirectory"));
  +[WebBundleFileHelper copyWebBundleFilesToDirectory:fromDirectory:webBundleManifest:error:](WebBundleFileHelper, "copyWebBundleFilesToDirectory:fromDirectory:webBundleManifest:error:", v9, v8, v7, a4);

  -[WebBundleConfiguration setWebBundleDirectory:](self->_configuration, "setWebBundleDirectory:", v9);
  +[RAPWebBundleConfigurationManager saveConfiguration:](RAPWebBundleConfigurationManager, "saveConfiguration:", self->_configuration);

}

- (BOOL)_isVersion:(id)a3 newerThan:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
      v7 = objc_msgSend(v5, "compare:options:", v6, 64) == (id)1;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isWebBundleDownloading
{
  return self->_webBundleDownloading;
}

- (void)setWebBundleDownloading:(BOOL)a3
{
  self->_webBundleDownloading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_downloadingQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
