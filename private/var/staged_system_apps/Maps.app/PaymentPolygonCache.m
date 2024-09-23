@implementation PaymentPolygonCache

- (PaymentPolygonCache)init
{
  PaymentPolygonCache *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PaymentPolygonCache;
  v2 = -[PaymentPolygonCache init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("PaymentPolygonCacheQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_deleteCachedFiles
{
  dispatch_async((dispatch_queue_t)self->_queue, &stru_1011D8F98);
}

- (BOOL)cachedPolygonForLocation:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  uint64_t Log;
  NSObject *v12;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  _BYTE location[12];
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100847154;
    block[3] = &unk_1011B0300;
    objc_copyWeak(&v17, (id *)location);
    v16 = v7;
    v15 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v9 = sub_10043253C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/PaymentPolygonCache.m";
      v19 = 1024;
      v20 = 82;
      v21 = 2082;
      v22 = "-[PaymentPolygonCache cachedPolygonForLocation:withCompletion:]";
      v23 = 2082;
      v24 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", location, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v12 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/PaymentPolygonCache.m";
      v19 = 1024;
      v20 = 82;
      v21 = 2082;
      v22 = "-[PaymentPolygonCache cachedPolygonForLocation:withCompletion:]";
      v23 = 2082;
      v24 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", location, 0x26u);
    }

  }
  return v6 != 0;
}

- (void)cachePolygon:(id)a3 forLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008476A8;
  v11[3] = &unk_1011AFF10;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
