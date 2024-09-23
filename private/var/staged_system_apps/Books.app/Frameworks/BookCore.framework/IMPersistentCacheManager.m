@implementation IMPersistentCacheManager

- (IMPersistentCacheManager)init
{
  IMPersistentCacheManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *caches;
  NSCountedSet *v5;
  NSCountedSet *pathRequestCount;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  IMPersistentCacheManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMPersistentCacheManager;
  v2 = -[IMPersistentCacheManager init](&v11, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    caches = v2->_caches;
    v2->_caches = v3;

    v5 = (NSCountedSet *)objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 6);
    pathRequestCount = v2->_pathRequestCount;
    v2->_pathRequestCount = v5;

    v7 = dispatch_queue_create("com.apple.itunesmobile.impersistentcachemanager", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B9FB8;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30DC50 != -1)
    dispatch_once(&qword_30DC50, block);
  return (id)qword_30DC48;
}

- (void)_cleanCachesInPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByDeletingLastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));

  -[IMPersistentCacheManager cleanUpCacheFilesInPath:withExtension:](self, "cleanUpCacheFilesInPath:withExtension:", v6, v5);
}

- (id)cacheForPath:(id)a3 maxSize:(unint64_t)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_BA128;
  v19 = sub_BA138;
  v20 = 0;
  accessQueue = self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_BA140;
  v11[3] = &unk_2906A8;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(accessQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)purgeFromCache:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BA25C;
  block[3] = &unk_28B808;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)addCleanupExclusionPath:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BA324;
  block[3] = &unk_28B808;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)cleanUpCacheFilesInPath:(id)a3 withExtension:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  IMPersistentCacheManager *v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BA41C;
  block[3] = &unk_28C5F0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_excludedCachesForCleanup, 0);
  objc_storeStrong((id *)&self->_pathRequestCount, 0);
  objc_storeStrong((id *)&self->_caches, 0);
}

@end
