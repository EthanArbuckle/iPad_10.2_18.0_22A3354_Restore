@implementation UGCReviewedPlaceCache

- (UGCReviewedPlaceCache)init
{
  UGCReviewedPlaceCache *v2;
  UGCReviewedPlaceCache *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UGCReviewedPlaceCache;
  v2 = -[UGCReviewedPlaceCache init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_class(v2), "baseFilePath:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[UGCReviewedPlaceCache _commonInitWithURL:](v3, "_commonInitWithURL:", v5);

  }
  return v3;
}

- (UGCReviewedPlaceCache)initWithURL:(id)a3
{
  id v4;
  UGCReviewedPlaceCache *v5;
  UGCReviewedPlaceCache *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UGCReviewedPlaceCache;
  v5 = -[UGCReviewedPlaceCache init](&v8, "init");
  v6 = v5;
  if (v5)
    -[UGCReviewedPlaceCache _commonInitWithURL:](v5, "_commonInitWithURL:", v4);

  return v6;
}

- (void)_commonInitWithURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  GEOSQLiteDB *v8;
  GEOSQLiteDB *db;
  _QWORD v10[5];

  v4 = a3;
  v5 = objc_alloc((Class)GEOSQLiteDB);
  v6 = sub_1004331EC();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100396DEC;
  v10[3] = &unk_1011B3888;
  v10[4] = self;
  v8 = (GEOSQLiteDB *)objc_msgSend(v5, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:", "com.apple.maps.cachedreviewedplace.db", v7, v4, 0x100000, 0, v10);

  db = self->_db;
  self->_db = v8;

}

- (void)moveCacheIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = objc_msgSend((id)objc_opt_class(self), "oldFilePath:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "baseFilePath:", 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_1004331EC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v9, "path"));
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Migrate DB files from: %@ to %@", (uint8_t *)&v17, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v9, "path"));
    +[GEOSQLiteDB migrateAllDBFilesFrom:to:](GEOSQLiteDB, "migrateAllDBFilesFrom:to:", v14, v15);

  }
  else
  {
    v16 = sub_1004331EC();
    v9 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Cache files not exists, we don't need to migrate them", (uint8_t *)&v17, 2u);
    }
  }

}

+ (id)oldFilePath:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v10));
  v6 = v10;

  if (!a3 || v5)
  {
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.Maps"), 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReviewedPlaceCache"), 0));

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    *a3 = objc_retainAutorelease(v6);
  }

  return v7;
}

+ (id)baseFilePath:(id *)a3
{
  return objc_msgSend((id)objc_opt_class(a1), "oldFilePath:", a3);
}

- (void)fetchWithMUID:(unint64_t)a3 andReplaceIfNeededWithNewMUID:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[3];
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100397444;
  v10[3] = &unk_1011B3900;
  v9 = v8;
  v11 = v9;
  v12[1] = (id)a3;
  v12[2] = (id)a4;
  objc_copyWeak(v12, &location);
  -[UGCReviewedPlaceCache fetchReviewedPlaceForMUID:completion:](self, "fetchReviewedPlaceForMUID:completion:", a3, v10);
  objc_destroyWeak(v12);

  objc_destroyWeak(&location);
}

- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100397720;
  v9[3] = &unk_1011B2188;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

}

- (id)locallyCachedReviewedPlaceForMUID:(unint64_t)a3
{
  GEOSQLiteDB *db;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1003978B4;
  v11 = sub_1003978C4;
  v12 = 0;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100397C1C;
  v6[3] = &unk_1011B3950;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)removeReviewedPlaceWithMUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100397F10;
  v9[3] = &unk_1011B2188;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

}

- (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  GEOSQLiteDB *db;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003981B8;
  v11[3] = &unk_1011AECC0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v11);

}

- (void)clearAllUserData
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100398468;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
