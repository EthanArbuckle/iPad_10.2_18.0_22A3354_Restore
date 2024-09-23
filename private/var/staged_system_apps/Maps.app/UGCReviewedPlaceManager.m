@implementation UGCReviewedPlaceManager

+ (void)clearAllUserData
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v2, "_clearAllUserData");

}

+ (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v8, "_addOrEditReviewedPlace:completion:", v7, v6);

}

+ (void)fetchReviewedPlaceForMUID:(unint64_t)a3 withIdentifierHistory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v10, "_fetchReviewedPlaceForMUID:withIdentifierHistory:completion:", a3, v9, v8);

}

+ (id)locallyCachedReviewedPlaceForMUID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_locallyCachedReviewedPlaceForMUID:", a3));

  return v5;
}

+ (void)removeReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v7, "_removeReviewedPlaceForMUID:completion:", a3, v6);

}

+ (void)updateLocalCacheWithReviewedPlace:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v8, "_updateLocalCacheWithReviewedPlace:completion:", v7, v6);

}

+ (void)fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v5, "_fetchAllHistoryObjectsFromStorageWithCompletion:", v4);

}

+ (void)fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v5, "_fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:", v4);

}

+ (id)_sharedInstance
{
  if (qword_1014D2310 != -1)
    dispatch_once(&qword_1014D2310, &stru_1011B3DB8);
  return (id)qword_1014D2308;
}

- (UGCReviewedPlaceManager)initWithSyncedCache:(id)a3 localCache:(id)a4
{
  id v7;
  id v8;
  UGCReviewedPlaceManager *v9;
  UGCReviewedPlaceManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCReviewedPlaceManager;
  v9 = -[UGCReviewedPlaceManager init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncedCache, a3);
    objc_storeStrong((id *)&v10->_localCache, a4);
  }

  return v10;
}

- (void)_clearAllUserData
{
  -[UGCReviewedPlaceMapsSync clearAllUserData](self->_syncedCache, "clearAllUserData");
  -[UGCReviewedPlaceCache clearAllUserData](self->_localCache, "clearAllUserData");
}

- (void)_addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  UGCReviewedPlaceMapsSync *syncedCache;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  syncedCache = self->_syncedCache;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003A8574;
  v11[3] = &unk_1011B3DE0;
  v9 = v7;
  v13 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v6;
  v12 = v10;
  -[UGCReviewedPlaceMapsSync addOrEditReviewedPlace:completion:](syncedCache, "addOrEditReviewedPlace:completion:", v10, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_fetchReviewedPlaceForMUID:(unint64_t)a3 withIdentifierHistory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UGCReviewedPlaceMapsSync *syncedCache;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = sub_10039DCD4(v8, &stru_1011B3E20);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_initWeak(&location, self);
  syncedCache = self->_syncedCache;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003A8854;
  v14[3] = &unk_1011B3E98;
  v13 = v9;
  v15 = v13;
  objc_copyWeak(&v16, &location);
  -[UGCReviewedPlaceMapsSync fetchReviewedPlaceForMUID:muidHistory:completion:](syncedCache, "fetchReviewedPlaceForMUID:muidHistory:completion:", a3, v11, v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (id)_locallyCachedReviewedPlaceForMUID:(unint64_t)a3
{
  return -[UGCReviewedPlaceCache locallyCachedReviewedPlaceForMUID:](self->_localCache, "locallyCachedReviewedPlaceForMUID:", a3);
}

- (void)_removeReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  UGCReviewedPlaceMapsSync *syncedCache;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A8B80;
  v9[3] = &unk_1011B3EC0;
  v8 = v6;
  v10 = v8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  -[UGCReviewedPlaceMapsSync removeReviewedPlaceWithMUID:completion:](syncedCache, "removeReviewedPlaceWithMUID:completion:", a3, v9);
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

- (void)_updateLocalCacheWithReviewedPlace:(id)a3 completion:(id)a4
{
  id v6;
  UGCReviewedPlaceCache *localCache;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  localCache = self->_localCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A8DAC;
  v9[3] = &unk_1011AE218;
  v10 = v6;
  v8 = v6;
  -[UGCReviewedPlaceCache addOrEditReviewedPlace:completion:](localCache, "addOrEditReviewedPlace:completion:", a3, v9);

}

- (void)_fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  UGCReviewedPlaceMapsSync *syncedCache;
  id v8;
  _QWORD v9[4];
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
  v15 = sub_1003A8F50;
  v16 = sub_1003A8F60;
  v17 = 0;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A8F68;
  v9[3] = &unk_1011B3EE8;
  v11 = &v12;
  v8 = v4;
  v10 = v8;
  -[UGCReviewedPlaceMapsSync fetchAllHistoryObjectsFromStorageWithCompletion:](syncedCache, "fetchAllHistoryObjectsFromStorageWithCompletion:", v9);

  _Block_object_dispose(&v12, 8);
}

- (void)_fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  UGCReviewedPlaceMapsSync *syncedCache;
  id v8;
  _QWORD v9[4];
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
  v15 = sub_1003A8F50;
  v16 = sub_1003A8F60;
  v17 = 0;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A9330;
  v9[3] = &unk_1011B3EE8;
  v11 = &v12;
  v8 = v4;
  v10 = v8;
  -[UGCReviewedPlaceMapsSync fetchAllHistoryObjectsFromStorageWithCompletion:](syncedCache, "fetchAllHistoryObjectsFromStorageWithCompletion:", v9);

  _Block_object_dispose(&v12, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedCache, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
}

@end
