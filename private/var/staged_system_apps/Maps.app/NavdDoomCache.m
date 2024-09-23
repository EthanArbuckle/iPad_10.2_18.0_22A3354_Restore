@implementation NavdDoomCache

+ (id)defaultPath
{
  return +[NavdPaths pathInCacheDirWithFilename:](NavdPaths, "pathInCacheDirWithFilename:", CFSTR("NavdDoomConductor.storage"));
}

+ (BOOL)saveToFilePath:(id)a3 storage:(id)a4
{
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t Log;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  unsigned int v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;

  v6 = (char *)a3;
  v7 = a4;
  if (!v6)
  {
    v8 = objc_msgSend((id)objc_opt_class(a1), "defaultPath");
    v6 = (char *)objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = MapsSuggestionsLoggingSubsystem;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomEvalDumper");
  v11 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Saving to cache at %@", buf, 0xCu);
  }

  v12 = MapsSuggestionsCurrentBestLocation();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v7, "setMostRecentLocation:", v13);

  v14 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("NavdDoomCacheStorageKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "encodedData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));

  if (v16)
  {
    v17 = GEOFindOrCreateLog(v9, "NavdDoomEvalDumper");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Saving failed to %@, error: %@", buf, 0x16u);

    }
    v20 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedFailureReason")));
    printf("Saving failed to %s, error: %s", v20, (const char *)-[NSObject UTF8String](v22, "UTF8String"));
  }
  else
  {
    v28 = 0;
    v25 = objc_msgSend(v15, "writeToFile:options:error:", v6, 1073741825, &v28);
    v26 = v28;
    v21 = v26;
    if (v25 && !v26)
    {
      v23 = 1;
      goto LABEL_10;
    }
    v27 = GEOFindOrCreateLog(v9, "NavdDoomEvalDumper");
    v22 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "+[NavdDoomCache saveToFilePath:storage:]";
      v31 = 2112;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s failed because: %@", buf, 0x16u);
    }
  }

  v23 = 0;
LABEL_10:

  return v23;
}

+ (id)loadFromFilePath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t Log;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v4 = a3;
  if (!v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(a1), "defaultPath");
    v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  v6 = MapsSuggestionsLoggingSubsystem;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomEvalDumper");
  v8 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Loading from cache at %@", buf, 0xCu);
  }

  v27 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v4, 0, &v27));
  v10 = v27;
  if (!v10)
  {
    if (!v9)
    {
      v24 = GEOFindOrCreateLog(v6, "NavdDoomEvalDumper");
      v12 = objc_claimAutoreleasedReturnValue(v24);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 138412546;
      v29 = v4;
      v30 = 2112;
      v31 = 0;
      v13 = "Error reading from: %@, error: %@";
      goto LABEL_8;
    }
    v15 = objc_opt_class(NavdDoomStorage);
    v16 = objc_opt_class(MapsSuggestionsEntry);
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, objc_opt_class(GEOWaypointRoute), 0);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    v18 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v9, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "decodeObjectOfClasses:forKey:", v12, CFSTR("NavdDoomCacheStorageKey")));
    objc_msgSend(v18, "finishDecoding");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "error"));

    if (v20)
    {
      v21 = GEOFindOrCreateLog(v6, "NavdDoomEvalDumper");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "error"));
        *(_DWORD *)buf = 138412546;
        v29 = v4;
        v30 = 2112;
        v31 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Loading failed from %@, error: %@", buf, 0x16u);

      }
    }
    else
    {
      if (v19)
      {
        v14 = v19;
        goto LABEL_19;
      }
      v26 = GEOFindOrCreateLog(v6, "NavdDoomEvalDumper");
      v22 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v4;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Loaded nil from %@", buf, 0xCu);
      }
    }

    v14 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v11 = GEOFindOrCreateLog(v6, "NavdDoomEvalDumper");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v4;
    v30 = 2112;
    v31 = v10;
    v13 = "Could not read from: %@, error: %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
  }
LABEL_9:
  v14 = 0;
LABEL_20:

  return v14;
}

- (NavdDoomCache)init
{
  NavdDoomCache *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NavdDoomCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavdDoomCache;
  v2 = -[NavdDoomCache init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("NavdDoomCacheQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)_writeToDisk
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10039B3FC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)willStartUpdate
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)willUpdateExitTime
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didUpdateExitTime
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didInvalidateWindow
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didUpdateWindow
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)willUpdateDestinations
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didUpdateDestinations
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)willUpdateRoutes
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didUpdateRoutes
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)willFireAlert
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didFireAlert
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didScheduleWakeup
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (void)didEndUpdate
{
  -[NavdDoomCache _writeToDisk](self, "_writeToDisk");
}

- (NavdDoomStorageSnapshotDataSource)snapshotDataSource
{
  return self->_snapshotDataSource;
}

- (void)setSnapshotDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
