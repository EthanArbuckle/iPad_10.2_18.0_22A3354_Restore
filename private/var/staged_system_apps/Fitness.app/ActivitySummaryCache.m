@implementation ActivitySummaryCache

- (void)loadDataIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_query)
  {
    _HKInitializeLogging(self, a2);
    v3 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[FASC] Initialize and start activity summary query", v4, 2u);
    }
    -[ActivitySummaryCache startActivitySummaryQuery](self, "startActivitySummaryQuery");
  }
}

- (int64_t)numberOfActivitySummaries
{
  NSObject *readWriteQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004C4E0;
  v5[3] = &unk_100779E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (ActivitySummaryCache)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008208;
  block[3] = &unk_100777CF8;
  block[4] = a1;
  if (qword_10083E080 != -1)
    dispatch_once(&qword_10083E080, block);
  return (ActivitySummaryCache *)(id)qword_10083E088;
}

- (void)setObject:(id)a3 forCacheIndex:(int64_t)a4
{
  id v6;
  NSObject *readWriteQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  readWriteQueue = self->_readWriteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C514;
  block[3] = &unk_100779BA8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(readWriteQueue, block);

}

- (ActivitySummaryCache)init
{
  ActivitySummaryCache *v2;
  ActivitySummaryCache *v3;
  uint64_t v4;
  uint64_t v5;
  OS_dispatch_queue *readWriteQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *cache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ActivitySummaryCache;
  v2 = -[ActivitySummaryCache init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = HKCreateSerialDispatchQueue(v2, CFSTR("cacheQueue"));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    readWriteQueue = v3->_readWriteQueue;
    v3->_readWriteQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v3->_cache;
    v3->_cache = v7;

  }
  return v3;
}

- (void)startActivitySummaryQuery
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD *v16;
  HKActivitySummaryQuery *v17;
  HKActivitySummaryQuery *query;
  HKActivitySummaryQuery *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location[2];

  objc_initWeak(location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10003C9D4;
  v34[3] = &unk_1007780E8;
  objc_copyWeak(&v35, location);
  v3 = objc_retainBlock(v34);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000AEBF8;
  v32[3] = &unk_100777C80;
  objc_copyWeak(&v33, location);
  v4 = objc_retainBlock(v32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = _HKActivityCacheDateComponentsFromCacheIndex(410227200);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar hk_gregorianCalendar](NSCalendar, "hk_gregorianCalendar"));
  v10 = _HKActivityCacheDateComponentsFromDate(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:](HKQuery, "predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:", v7, v11));
  v13 = objc_alloc((Class)HKActivitySummaryQuery);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000AED14;
  v28[3] = &unk_100779E30;
  v14 = v4;
  v30 = v14;
  v15 = v5;
  v29 = v15;
  v16 = v3;
  v31 = v16;
  v17 = (HKActivitySummaryQuery *)objc_msgSend(v13, "initWithPredicate:resultsHandler:", v12, v28);
  query = self->_query;
  self->_query = v17;

  v19 = self->_query;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000AEEB0;
  v25[3] = &unk_100779E58;
  v20 = v14;
  v26 = v20;
  v21 = v16;
  v27 = v21;
  -[HKActivitySummaryQuery setUpdateHandler:](v19, "setUpdateHandler:", v25);
  -[HKActivitySummaryQuery setShouldIncludeActivitySummaryPrivateProperties:](self->_query, "setShouldIncludeActivitySummaryPrivateProperties:", 1);
  -[HKActivitySummaryQuery setShouldIncludeActivitySummaryStatistics:](self->_query, "setShouldIncludeActivitySummaryStatistics:", 0);
  -[HKActivitySummaryQuery setDebugIdentifier:](self->_query, "setDebugIdentifier:", CFSTR("ActivitySummaryCache.activitySummaryQuery"));
  v23 = objc_msgSend((id)objc_opt_class(self, v22), "healthStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v24, "executeQuery:", self->_query);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(location);
}

- (int64_t)latestActivitySummaryIndex
{
  NSObject *readWriteQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004C0CC;
  v5[3] = &unk_100779E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)objectForCacheIndex:(int64_t)a3
{
  NSObject *readWriteQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000AEB34;
  v11 = sub_1000AEB44;
  v12 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CBD8;
  block[3] = &unk_100779DE0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(readWriteQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)activitySummaryForCacheIndex:(int64_t)a3
{
  return -[ActivitySummaryCache objectForCacheIndex:](self, "objectForCacheIndex:", a3);
}

+ (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&qword_10083E070, a3);
}

+ (id)healthStore
{
  return (id)qword_10083E070;
}

- (void)removeObjectForCacheIndex:(int64_t)a3
{
  NSObject *readWriteQueue;
  _QWORD v4[6];

  readWriteQueue = self->_readWriteQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AEAE8;
  v4[3] = &unk_100779460;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(readWriteQueue, v4);
}

- (int64_t)earliestActivitySummaryIndex
{
  NSObject *readWriteQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AEBDC;
  v5[3] = &unk_100779E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)fitnessStartOfWeekOffset
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
