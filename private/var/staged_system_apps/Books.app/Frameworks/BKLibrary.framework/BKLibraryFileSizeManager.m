@implementation BKLibraryFileSizeManager

+ (id)sharedInstance
{
  if (qword_DE558 != -1)
    dispatch_once(&qword_DE558, &stru_C2FB8);
  return (id)qword_DE560;
}

- (BKLibraryFileSizeManager)init
{
  void *v3;
  BKLibraryFileSizeManager *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = -[BKLibraryFileSizeManager initWithLibraryManager:](self, "initWithLibraryManager:", v3);

  return v4;
}

- (BKLibraryFileSizeManager)initWithLibraryManager:(id)a3
{
  id v4;
  BKLibraryFileSizeManager *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *assetPathToCacheItemDict;
  NSObject *v12;
  _QWORD block[4];
  BKLibraryFileSizeManager *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryFileSizeManager;
  v5 = -[BKLibraryFileSizeManager init](&v16, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.ibooks.BKLibraryFileSizeManager", v7);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new(NSMutableDictionary);
    assetPathToCacheItemDict = v5->_assetPathToCacheItemDict;
    v5->_assetPathToCacheItemDict = v10;

    objc_storeWeak((id *)&v5->_libraryManager, v4);
    -[BKLibraryFileSizeManager _removeObsoletePersistedInfo](v5, "_removeObsoletePersistedInfo");
    v12 = v5->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_55A24;
    block[3] = &unk_C1400;
    v15 = v5;
    dispatch_sync(v12, block);

  }
  return v5;
}

- (id)cachedFileSizeForAssetWithAssetID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_55B40;
  v16 = sub_55B50;
  v17 = 0;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_55B58;
    block[3] = &unk_C2180;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)synchronousFileSizeForCacheItemRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_55B40;
  v16 = sub_55B50;
  v17 = 0;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_55CF0;
    block[3] = &unk_C21A8;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clearCacheEntryForAssetID:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  BKLibraryFileSizeManager *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_55DE0;
    v6[3] = &unk_C12F8;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)filesSizeForCacheItemRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_56038;
    block[3] = &unk_C21D0;
    block[4] = self;
    v13 = v6;
    v14 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void (**)(id, _QWORD, void *))objc_retainBlock(v7);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKLibraryFileSizeManagerDomain"), -1001, 0));
      v10[2](v10, 0, v11);

    }
  }

}

- (void)filesSizesForCacheItemRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD block[4];
  id v13;
  BKLibraryFileSizeManager *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_561B4;
    block[3] = &unk_C21D0;
    v13 = v6;
    v14 = self;
    v15 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void (**)(id, _QWORD, void *))objc_retainBlock(v7);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKLibraryFileSizeManagerDomain"), -1001, 0));
      v10[2](v10, 0, v11);

    }
  }

}

- (void)purgeUnusedCacheEntries
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_56460;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)dq_filesSizeForCacheItemRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BKLibraryFileSizeManagerCacheItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint32_t *v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  BKLibraryFileSizeManagerCacheItem *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager assetPathToCacheItemDict](self, "assetPathToCacheItemDict"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v7 = (BKLibraryFileSizeManagerCacheItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileOnDiskLastTouchDate](v7, "fileOnDiskLastTouchDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
      v27 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v11, &v27));
      v13 = v27;

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
      if (objc_msgSend(v14, "isEqualToString:", NSCocoaErrorDomain))
      {
        v15 = (uint32_t *)objc_msgSend(v13, "code");

        if (v15 == &stru_B8.reserved3)
        {

          v16 = &off_C9F58;
          v17 = v8;
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileModificationDate"));
      v17 = v18;
      if (v8)
      {
        if (objc_msgSend(v18, "compare:", v8) != (char *)&dword_0 + 1
          || (objc_msgSend(v8, "timeIntervalSinceNow"), fabs(v19) <= 1.0))
        {

          v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileSizeNumber](v7, "fileSizeNumber"));
          goto LABEL_19;
        }
      }

    }
    else
    {
      v17 = 0;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetURL"));
    if (v20)
    {
      v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));

      if (v16)
      {
        v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[BKLibraryFileSizeManager _fileSizeForAssetAtURL:](self, "_fileSizeForAssetAtURL:", v20)));
        v21 = objc_opt_new(BKLibraryFileSizeManagerCacheItem);

        -[BKLibraryFileSizeManagerCacheItem setFileURL:](v21, "setFileURL:", v20);
        -[BKLibraryFileSizeManagerCacheItem setFileSizeNumber:](v21, "setFileSizeNumber:", v16);
        -[BKLibraryFileSizeManagerCacheItem setFileOnDiskLastTouchDate:](v21, "setFileOnDiskLastTouchDate:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager assetPathToCacheItemDict](self, "assetPathToCacheItemDict"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

        v24 = objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager dispatchQueue](self, "dispatchQueue"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_5697C;
        v26[3] = &unk_C1400;
        v26[4] = self;
        dispatch_async(v24, v26);

        v7 = v21;
      }
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_19;
  }
  v16 = 0;
LABEL_20:

  return v16;
}

- (int64_t)_fileSizeForAssetAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];
  char v20;

  v4 = a3;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v20);

  if (v7)
  {
    if (v20)
    {
      v19[0] = 0;
      v19[1] = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      -[BKLibraryFileSizeManager _installedUnzippedAssetDiskSpaceMetrics:directory:](self, "_installedUnzippedAssetDiskSpaceMetrics:directory:", v19, v8);

      v9 = (id)v19[0];
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      v18 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v10, &v18));
      v12 = v18;

      v9 = 0;
      if (!v12)
      {
        v13 = objc_opt_class(NSNumber);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSFileSize));
        v15 = BUDynamicCast(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        v9 = objc_msgSend(v16, "longLongValue");
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return (int64_t)v9;
}

- (void)_installedUnzippedAssetDiskSpaceMetrics:(id *)a3 directory:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *context;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD v30[2];

  v4 = a4;
  context = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v26 = v4;
  v6 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v30[0] = NSURLTotalFileAllocatedSizeKey;
  v30[1] = NSURLIsDirectoryKey;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v23 = (void *)v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = 0;
    v27 = 0;
    do
    {
      v11 = objc_autoreleasePoolPush();
      v29 = 0;
      objc_msgSend(v9, "getResourceValue:forKey:error:", &v29, NSURLIsDirectoryKey, 0);
      v12 = v29;
      if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
        v28 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v13, &v28));
        v15 = v28;

        if (!v15)
        {
          v16 = objc_opt_class(NSNumber);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSFileSize));
          v18 = BUDynamicCast(v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          v27 += (uint64_t)objc_msgSend(v19, "longLongValue");
          ++v10;

        }
      }

      objc_autoreleasePoolPop(v11);
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));

      v9 = (void *)v20;
    }
    while (v20);
  }
  else
  {
    v27 = 0;
    v10 = 0;
  }
  v21 = a3->var1 + v10;
  a3->var0 += v27;
  a3->var1 = v21;

  objc_autoreleasePoolPop(context);
}

- (id)_persistedInfoURL
{
  return -[BKLibraryFileSizeManager _documentsURLWithFilename:](self, "_documentsURLWithFilename:", CFSTR("BKLibraryFileSizeManager2"));
}

- (id)_documentsURLWithFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v3, 0));
  return v6;
}

- (void)dq_persistInfoToDisk
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("version");
  v9[1] = CFSTR("assetPathToFileSize");
  v10[0] = &off_C9F70;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager assetPathToCacheItemDict](self, "assetPathToCacheItemDict"));
  v4 = objc_msgSend(v3, "copy");
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("root"));
  objc_msgSend(v6, "finishEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodedData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager _persistedInfoURL](self, "_persistedInfoURL"));
  objc_msgSend(v7, "writeToURL:atomically:", v8, 1);

}

- (void)dq_readPersistedInfoFromDisk
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager _persistedInfoURL](self, "_persistedInfoURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v3));

  if (v4)
  {
    v30 = 0;
    v5 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v4, &v30);
    v6 = v30;
    v7 = v6;
    if (v6)
    {
      v8 = BKLibraryLog(v6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager _persistedInfoURL](self, "_persistedInfoURL"));
        sub_83718(v10, (uint64_t)v7, buf, v9);
      }
    }
    else
    {
      v11 = objc_opt_class(NSDictionary);
      v12 = objc_opt_class(BKLibraryFileSizeManagerCacheItem);
      v13 = objc_opt_class(NSString);
      v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, objc_opt_class(NSNumber), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_opt_class(NSDictionary);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("root")));
      v18 = BUDynamicCast(v16, v17);
      v9 = objc_claimAutoreleasedReturnValue(v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("version")));
      v20 = (char *)objc_msgSend(v19, "unsignedIntegerValue");
      if (v20 == (_BYTE *)&dword_0 + 2)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("assetPathToFileSize")));
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v22));
          -[BKLibraryFileSizeManager setAssetPathToCacheItemDict:](self, "setAssetPathToCacheItemDict:", v23);

        }
      }
      else
      {
        v24 = BCIMLog(v20, v21);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "-[BKLibraryFileSizeManager dq_readPersistedInfoFromDisk]";
          v33 = 2080;
          v34 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryFileSizeManager.m";
          v35 = 1024;
          v36 = 527;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
        }

        v28 = BCIMLog(v26, v27);
        v22 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v29 = (char *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager _persistedInfoURL](self, "_persistedInfoURL"));
          *(_DWORD *)buf = 138543362;
          v32 = v29;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "@\"Corrupt ubiquity cache or unrecongnized version at %{public}@\", buf, 0xCu);

        }
      }

    }
  }

}

- (void)_removeObsoletePersistedInfo
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManager _documentsURLWithFilename:](self, "_documentsURLWithFilename:", CFSTR("BKLibraryFileSizeManager")));
  v5 = 0;
  objc_msgSend(v3, "removeItemAtURL:error:", v4, &v5);

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableDictionary)assetPathToCacheItemDict
{
  return self->_assetPathToCacheItemDict;
}

- (void)setAssetPathToCacheItemDict:(id)a3
{
  objc_storeStrong((id *)&self->_assetPathToCacheItemDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPathToCacheItemDict, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
