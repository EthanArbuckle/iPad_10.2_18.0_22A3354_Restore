@implementation RAPRecordManager

+ (void)addRAPRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v8, "_addRAPRecord:completion:", v7, v6);

}

+ (void)fetchAllRAPRecordsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v5, "_fetchAllRAPRecordsWithCompletion:", v4);

}

+ (void)fetchRAPRecordsMatchingProblemId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v8, "_fetchRAPRecordsMatchingProblemId:completion:", v7, v6);

}

+ (void)editStatusOfRAPRecordWithReportID:(id)a3 status:(signed __int16)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v10, "_editStatusOfRAPRecordWithReportID:status:completion:", v9, v5, v8);

}

+ (void)addTrafficIncidentReport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v8, "_addTrafficIncidentReport:completion:", v7, v6);

}

+ (void)fetchAllTrafficIncidentReportsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedInstance"));
  objc_msgSend(v5, "_fetchAllTrafficIncidentReportsWithCompletion:", v4);

}

+ (id)_sharedInstance
{
  if (qword_1014D2E50 != -1)
    dispatch_once(&qword_1014D2E50, &stru_1011C04E0);
  return (id)qword_1014D2E48;
}

- (RAPRecordManager)initWithSyncedCache:(id)a3
{
  id v5;
  RAPRecordManager *v6;
  RAPRecordManager *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *mapsSyncQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RAPRecordManager;
  v6 = -[RAPRecordManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_syncedCache, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.Maps.RAPRecordManager.mapsSyncQueue", v9);
    mapsSyncQueue = v7->_mapsSyncQueue;
    v7->_mapsSyncQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)_addRAPRecord:(id)a3 completion:(id)a4
{
  id v6;
  RAPRecordMapsSync *syncedCache;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006BC4F8;
  v9[3] = &unk_1011AE218;
  v10 = v6;
  v8 = v6;
  -[RAPRecordMapsSync addRAPRecord:completion:](syncedCache, "addRAPRecord:completion:", a3, v9);

}

- (void)_fetchAllRAPRecordsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  RAPRecordMapsSync *syncedCache;
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
  v15 = sub_1006BC70C;
  v16 = sub_1006BC71C;
  v17 = 0;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006BC724;
  v9[3] = &unk_1011B3EE8;
  v11 = &v12;
  v8 = v4;
  v10 = v8;
  -[RAPRecordMapsSync fetchAllRAPHistoryObjectsWithCompletion:](syncedCache, "fetchAllRAPHistoryObjectsWithCompletion:", v9);

  _Block_object_dispose(&v12, 8);
}

- (void)_fetchRAPRecordsMatchingProblemId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RAPRecordMapsSync *syncedCache;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_1006BC70C;
  v13[4] = sub_1006BC71C;
  v14 = objc_alloc_init((Class)NSMutableArray);
  syncedCache = self->_syncedCache;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1006BCB84;
  v10[3] = &unk_1011B3EE8;
  v12 = v13;
  v9 = v7;
  v11 = v9;
  -[RAPRecordMapsSync fetchRAPHistoryWithReportId:completion:](syncedCache, "fetchRAPHistoryWithReportId:completion:", v6, v10);

  _Block_object_dispose(v13, 8);
}

- (void)_fetchRAPRecordsMatchingProblemIdV2:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *mapsSyncQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_1006BC70C;
  v15[4] = sub_1006BC71C;
  v16 = objc_alloc_init((Class)NSMutableArray);
  mapsSyncQueue = self->_mapsSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006BCFD8;
  block[3] = &unk_1011C0508;
  v13 = v7;
  v14 = v15;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(mapsSyncQueue, block);

  _Block_object_dispose(v15, 8);
}

- (void)_editStatusOfRAPRecordWithReportID:(id)a3 status:(signed __int16)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  RAPRecordMapsSync *syncedCache;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v8 = a5;
  syncedCache = self->_syncedCache;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006BD4DC;
  v11[3] = &unk_1011AE218;
  v12 = v8;
  v10 = v8;
  -[RAPRecordMapsSync editStatusOfRAPRecordWithReportID:toStatus:completion:](syncedCache, "editStatusOfRAPRecordWithReportID:toStatus:completion:", a3, v5, v11);

}

- (void)_addTrafficIncidentReport:(id)a3 completion:(id)a4
{
  id v6;
  RAPRecordMapsSync *syncedCache;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006BD610;
  v9[3] = &unk_1011AE218;
  v10 = v6;
  v8 = v6;
  -[RAPRecordMapsSync addTrafficIncidentReport:completion:](syncedCache, "addTrafficIncidentReport:completion:", a3, v9);

}

- (void)_fetchAllTrafficIncidentReportsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  RAPRecordMapsSync *syncedCache;
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
  v15 = sub_1006BC70C;
  v16 = sub_1006BC71C;
  v17 = 0;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006BD824;
  v9[3] = &unk_1011B3EE8;
  v11 = &v12;
  v8 = v4;
  v10 = v8;
  -[RAPRecordMapsSync fetchAllTrafficIncidentReportsWithCompletion:](syncedCache, "fetchAllTrafficIncidentReportsWithCompletion:", v9);

  _Block_object_dispose(&v12, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSyncQueue, 0);
  objc_storeStrong((id *)&self->_syncedCache, 0);
}

@end
