@implementation BKRecentBookOpenResultTracker

- (BKRecentBookOpenResultTracker)init
{
  BKRecentBookOpenResultTracker *v2;
  BKRecentBookOpenResultTracker *v3;
  uint64_t v4;
  BKLRUCache *cache;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKRecentBookOpenResultTracker;
  v2 = -[BKRecentBookOpenResultTracker init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[BKRecentBookOpenResultTracker _loadCache](v2, "_loadCache"));
    cache = v3->_cache;
    v3->_cache = (BKLRUCache *)v4;

  }
  return v3;
}

- (id)_loadCache
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  BKLRUCache *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint8_t v14[8];
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKRecentBookOpenResultTracker _cachePath](BKRecentBookOpenResultTracker, "_cachePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, 0);

  v5 = 0;
  if (!v4)
    goto LABEL_13;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));
  if (v6)
  {
    v15 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v6, 0, &v15));
    v5 = v15;
    if (v7)
      v8 = (BKLRUCache *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchiveObjectWithData:](NSKeyedUnarchiver, "unarchiveObjectWithData:", v7));
    else
      v8 = 0;

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", off_1009C9BE8, 20, 0));
    v8 = 0;
  }

  if (v5)
  {
    v9 = sub_10006448C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10069F680();

  }
  if (!v8)
  {
LABEL_13:
    v11 = sub_10006448C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Creating new cache", v14, 2u);
    }

    v8 = -[BKLRUCache initWithCapacity:]([BKLRUCache alloc], "initWithCapacity:", 10);
  }

  return v8;
}

+ (id)_cachePath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BKRecentOpenResultsCache_v20230710")));

  return v5;
}

- (id)resultsForAsset:(id)a3
{
  return -[BKLRUCache objectForKey:](self->_cache, "objectForKey:", a3);
}

- (id)_mutableResultsForAsset:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKRecentBookOpenResultTracker resultsForAsset:](self, "resultsForAsset:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "mutableCopy");
  else
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v6 = v5;

  return v6;
}

- (void)openDidStartForAsset:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "isInBackground");

  if (v6)
  {
    v7 = sub_10006448C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ignoring asset open start in background", v10, 2u);
    }

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKRecentBookOpenTrackingEvent eventForStart:](BKRecentBookOpenTrackingEvent, "eventForStart:", 1));
    -[BKRecentBookOpenResultTracker _addEvent:forAsset:](self, "_addEvent:forAsset:", v9, v4);

  }
}

- (void)openDidFinishForAsset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BKRecentBookOpenTrackingEvent eventForStart:](BKRecentBookOpenTrackingEvent, "eventForStart:", 0));
  -[BKRecentBookOpenResultTracker _addEvent:forAsset:](self, "_addEvent:forAsset:", v5, v4);

}

- (BOOL)shouldAutoOpenAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  const char *v19;
  id v20;
  _BOOL4 v21;
  id v22;
  const char *v23;
  id v24;
  NSObject *v25;
  id v27;
  _DWORD v28[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKRecentBookOpenResultTracker resultsForAsset:](self, "resultsForAsset:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  if (!objc_msgSend(v4, "length"))
  {
    v17 = sub_10006448C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28[0]) = 0;
      v19 = "Asset has no ID.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v28, 2u);
    }
LABEL_14:
    v21 = 1;
LABEL_15:

    goto LABEL_21;
  }
  if (!v6)
  {
    v20 = sub_10006448C();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28[0]) = 0;
      v19 = "Asset has no recent open events.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isStart"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = fabs(v8);

    if (v9 <= 300.0)
    {
      v22 = sub_10006448C();
      v18 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:
        v21 = 0;
        goto LABEL_15;
      }
      LOWORD(v28[0]) = 0;
      v23 = "Asset recently did not finish opening.";
    }
    else
    {
      v10 = (char *)objc_msgSend(v5, "count");
      v11 = 0;
      v12 = (uint64_t)(v10 - 1);
      v13 = &v10[-((unint64_t)(v10 - 1) & ((uint64_t)(v10 - 1) >> 63))];
      while (v12-- >= 1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v12));
        v16 = objc_msgSend(v15, "isStart");

        ++v11;
        if ((v16 & 1) == 0)
          goto LABEL_19;
      }
      v11 = (unint64_t)v13;
LABEL_19:
      if (v11 < 3)
        goto LABEL_20;
      v27 = sub_10006448C();
      v18 = objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      LOWORD(v28[0]) = 0;
      v23 = "Asset had several consecutive failures opening.";
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)v28, 2u);
    goto LABEL_27;
  }
LABEL_20:
  v21 = 1;
LABEL_21:
  v24 = sub_10006448C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v28[0] = 67240192;
    v28[1] = v21;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Recommending auto-open? %{public}d", (uint8_t *)v28, 8u);
  }

  return v21;
}

- (void)_addEvent:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKRecentBookOpenResultTracker _mutableResultsForAsset:](self, "_mutableResultsForAsset:", v6));
  if ((unint64_t)objc_msgSend(v7, "count") >= 3)
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
  objc_msgSend(v7, "addObject:", v8);
  -[BKLRUCache setObject:forKey:](self->_cache, "setObject:forKey:", v7, v6);

  -[BKRecentBookOpenResultTracker save](self, "save");
}

- (void)save
{
  void *v3;
  BKLRUCache *cache;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKRecentBookOpenResultTracker _cachePath](BKRecentBookOpenResultTracker, "_cachePath"));
  cache = self->_cache;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", cache, 0, &v11));
  v6 = v11;
  if (v6)
  {
    v7 = v6;
    v8 = sub_10006448C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10069F740();
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "writeToFile:atomically:", v3, 1) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", off_1009C9BE8, 30, 0));
    v10 = sub_10006448C();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10069F6E0();
    goto LABEL_7;
  }
LABEL_8:

}

+ (void)removeCache
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKRecentBookOpenResultTracker _cachePath](BKRecentBookOpenResultTracker, "_cachePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v2, &v8);
    v5 = v8;

    if (v5)
    {
      v6 = sub_10006448C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10069F7A0();

    }
  }

}

- (BKLRUCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
