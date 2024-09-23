@implementation FRSharedImageCache

- (FRSharedImageCache)init
{
  void *v3;
  FRSharedImageCache *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = -[FRSharedImageCache initWithPersistenceEnabled:](self, "initWithPersistenceEnabled:", objc_msgSend(v3, "BOOLForKey:", CFSTR("enableImageCacheKey")));

  return v4;
}

- (FRSharedImageCache)initWithPersistenceEnabled:(BOOL)a3
{
  FRSharedImageCache *v4;
  FRSharedImageCache *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *persistenceQueue;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *rootPath;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)FRSharedImageCache;
  v4 = -[FRSharedImageCache init](&v21, "init");
  v5 = v4;
  if (v4)
  {
    v4->_persistenceEnabled = a3;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.FRSharedImageCache.persistence", v9);
    persistenceQueue = v5->_persistenceQueue;
    v5->_persistenceQueue = (OS_dispatch_queue *)v10;

    v12 = FRURLForNewsAppCachesDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("CachedImages")));
    rootPath = v5->_rootPath;
    v5->_rootPath = (NSString *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = objc_msgSend(v17, "fileExistsAtPath:", v5->_rootPath);

    if ((v18 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5->_rootPath, 0, 0, 0);

    }
  }
  return v5;
}

- (id)fetchImageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSharedImageCache rootPath](self, "rootPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRSharedImageCache _imageAtPath:](self, "_imageAtPath:", v6));
  return v7;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (id)_imageAtPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[FRSharedImageCache persistenceEnabled](self, "persistenceEnabled"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_100018694;
    v15 = sub_10001856C;
    v16 = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[FRSharedImageCache persistenceQueue](self, "persistenceQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006ADB0;
    v8[3] = &unk_1000DBFB0;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (BOOL)persistenceEnabled
{
  return self->_persistenceEnabled;
}

- (void)pruneImagesOlderThan:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[FRSharedImageCache persistenceQueue](self, "persistenceQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006AF78;
  v6[3] = &unk_1000DDD70;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  CGImage *v13;
  CGImage *v14;
  CFAbsoluteTime Current;
  _QWORD *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  CGImage *v25;
  CFAbsoluteTime v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[FRSharedImageCache persistenceEnabled](self, "persistenceEnabled"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRSharedImageCache rootPath](self, "rootPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v9));

    v12 = objc_retainAutorelease(v8);
    v13 = (CGImage *)objc_msgSend(v12, "CGImage");
    if (v12)
    {
      v14 = v13;
      if (v13)
      {
        CGImageRetain(v13);
        Current = CFAbsoluteTimeGetCurrent();
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10006B384;
        v21[3] = &unk_1000DE448;
        v25 = v14;
        v22 = v11;
        v23 = v12;
        v26 = Current;
        v24 = v9;
        v16 = objc_retainBlock(v21);
        v17 = objc_claimAutoreleasedReturnValue(-[FRSharedImageCache persistenceQueue](self, "persistenceQueue"));
        v18 = v17;
        if (v5)
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10006B53C;
          v19[3] = &unk_1000DAF28;
          v20 = v16;
          dispatch_sync(v18, v19);

          v18 = v20;
        }
        else
        {
          dispatch_async(v17, v16);
        }

      }
    }

  }
}

- (void)cache:(id)a3 forKey:(id)a4
{
  -[FRSharedImageCache cache:forKey:immediately:](self, "cache:forKey:immediately:", a3, a4, 0);
}

- (void)setPersistenceEnabled:(BOOL)a3
{
  self->_persistenceEnabled = a3;
}

- (void)setPersistenceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end
