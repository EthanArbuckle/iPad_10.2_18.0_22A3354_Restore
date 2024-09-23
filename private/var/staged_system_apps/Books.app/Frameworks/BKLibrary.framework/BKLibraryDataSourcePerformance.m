@implementation BKLibraryDataSourcePerformance

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class(BKLibraryManager) == a1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "registerDefaults:", &off_C9D68);

  }
}

- (BKLibraryDataSourcePerformance)initWithResource:(id)a3 forceRandomBooks:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  BKLibraryDataSourcePerformance *v8;
  BKLibraryDataSourcePerformance *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSURL *cacheURL;
  objc_super v27;

  v4 = a4;
  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BKLibraryDataSourcePerformance;
  v8 = -[BKLibraryDataSourcePerformance init](&v27, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resourceName, a3);
    v10 = dispatch_queue_create("BKLibraryDataSourcePerformance", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.ibooks.library.datasource.performance.%@"), v7));
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("BKLibraryDataSourcePerformance-PPT"));

    if ((v15 & 1) != 0 || v4)
    {
      -[BKLibraryDataSourcePerformance setRunningPPT:](v9, "setRunningPPT:", 1);
      -[BKLibraryDataSourcePerformance setIsEnabled:](v9, "setIsEnabled:", 1);
      -[BKLibraryDataSourcePerformance setNumRandomBooks:](v9, "setNumRandomBooks:", 500);
      -[BKLibraryDataSourcePerformance setRandomBookBaseID:](v9, "setRandomBookBaseID:", 1000000);
      -[BKLibraryDataSourcePerformance setCreateSeriesContainers:](v9, "setCreateSeriesContainers:", 1);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v9, CFSTR("BKLibraryPerformanceDataSource"), 0, off_DD4C8);

      v17 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("BKLibraryDataSourcePerformance")));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, 0);

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ProductProfiles-%@.plist"), v7));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", v22));
        v24 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23));
        cacheURL = v9->_cacheURL;
        v9->_cacheURL = (NSURL *)v24;

      }
      -[BKLibraryDataSourcePerformance _updateEnabled](v9, "_updateEnabled");

    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("BKLibraryPerformanceDataSource"), off_DD4C8);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryDataSourcePerformance;
  -[BKLibraryDataSourcePerformance dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void (**v14)(_QWORD);
  objc_super v15;
  _QWORD block[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_DD4C8 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_541AC;
    v18[3] = &unk_C2560;
    objc_copyWeak(&v19, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_541D8;
        block[3] = &unk_C2738;
        v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKLibraryDataSourcePerformance;
    -[BKLibraryDataSourcePerformance observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)_libraryDataSourcePerformanceChanged
{
  unsigned int v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[BKLibraryDataSourcePerformance isEnabled](self, "isEnabled");
  -[BKLibraryDataSourcePerformance _updateEnabled](self, "_updateEnabled");
  if (v3 != -[BKLibraryDataSourcePerformance isEnabled](self, "isEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePerformance libraryManager](self, "libraryManager"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_54280;
    v5[3] = &unk_C2F70;
    v5[4] = self;
    objc_msgSend(v4, "libraryDataSource:updateWithName:block:", self, CFSTR("performance enabled changed"), v5);

  }
}

- (void)_updateEnabled
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_isEnabled = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKLibraryPerformanceDataSource"));

}

- (void)_updateCreationDate
{
  void *v3;
  NSDate *v4;
  NSDate *creationDate;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePerformance cacheURL](self, "cacheURL"));
  v6 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v6, NSURLCreationDateKey, 0);
  v4 = (NSDate *)v6;

  creationDate = self->_creationDate;
  self->_creationDate = v4;

}

- (void)_fetchProductProfiles
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePerformance resourceName](self, "resourceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForResource:withExtension:", v5, CFSTR("plist")));

  if (v6)
    v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:", v6);
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("adamIds")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_544F0;
  v12[3] = &unk_C2CA8;
  v12[4] = self;
  objc_msgSend(v11, "productProfilesForStoreIDs:completion:", v10, v12);

}

- (id)_cachedProductProfiles
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
  uint64_t v14;
  NSSet *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePerformance cacheURL](self, "cacheURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v3));

  v20 = 0;
  v5 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v4, &v20);
  v6 = v20;
  v7 = v6;
  if (v6)
  {
    v8 = BKLibraryLog(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_8366C(self, (uint64_t)v7, v9);
    v10 = 0;
  }
  else
  {
    v11 = objc_opt_class(NSArray);
    v12 = objc_opt_class(NSDictionary);
    v13 = objc_opt_class(NSNull);
    v14 = objc_opt_class(NSString);
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(NSNumber), 0);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    v16 = objc_opt_class(NSDictionary);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("Root")));
    v18 = BUDynamicCast(v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v18);

  }
  return v10;
}

- (int64_t)coverSourceRank
{
  return 1;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a5;
  if (!qword_DE550)
  {
    v7 = BKGenericBookCoverDefaultSettings();
    qword_DE550 = BKGenericBookCoverCreateImage(CFSTR("Title"), CFSTR("author"), v7, v8, 768.0, 1024.0);
  }
  v9 = objc_retainBlock(v6);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage im_imageWithCGImage:](UIImage, "im_imageWithCGImage:", qword_DE550));
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v10, 0, 0);

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

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v4 = objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    v4 = v5;
  }

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

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  kdebug_trace(725353716, 64, 0, 0, 0);
  if (-[BKLibraryDataSourcePerformance runningPPT](self, "runningPPT"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (-[BKLibraryDataSourcePerformance numRandomBooks](self, "numRandomBooks"))
    {
      v6 = 0;
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)-[BKLibraryDataSourcePerformance randomBookBaseID](self, "randomBookBaseID") + v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
        objc_msgSend(v5, "addObject:", v8);

        ++v6;
      }
      while (v6 < -[BKLibraryDataSourcePerformance numRandomBooks](self, "numRandomBooks"));
    }
    kdebug_trace(725353716, 65, 0, 0, 0);
    v9 = objc_retainBlock(v4);
    v10 = v9;
    if (v9)
      (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v5, 0);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePerformance queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_54CE0;
    v12[3] = &unk_C1428;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v11, v12);

  }
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  BKLibraryDataSourcePerformance *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353716, 66, 0, 0, 0);
  v8 = -[BKLibraryDataSourcePerformance runningPPT](self, "runningPPT");
  v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePerformance queue](self, "queue"));
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_54EE4;
    block[3] = &unk_C21D0;
    v19 = v6;
    v20 = self;
    v21 = v7;
    v10 = v7;
    v11 = v6;
    dispatch_async(v9, block);

    v12 = v19;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5514C;
    v15[3] = &unk_C21D0;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    v13 = v7;
    v14 = v6;
    dispatch_async(v9, v15);

    v12 = v16;
  }

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (unint64_t)numRandomBooks
{
  return self->_numRandomBooks;
}

- (void)setNumRandomBooks:(unint64_t)a3
{
  self->_numRandomBooks = a3;
}

- (unint64_t)randomBookBaseID
{
  return self->_randomBookBaseID;
}

- (void)setRandomBookBaseID:(unint64_t)a3
{
  self->_randomBookBaseID = a3;
}

- (BOOL)createSeriesContainers
{
  return self->_createSeriesContainers;
}

- (void)setCreateSeriesContainers:(BOOL)a3
{
  self->_createSeriesContainers = a3;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_cacheURL, a3);
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  objc_storeStrong((id *)&self->_resourceName, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (BOOL)profilesChecked
{
  return self->_profilesChecked;
}

- (void)setProfilesChecked:(BOOL)a3
{
  self->_profilesChecked = a3;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
