@implementation IMUbiquityQuotaFetcher

- (IMUbiquityQuotaFetcher)init
{
  IMUbiquityQuotaFetcher *v2;
  NSOperationQueue *v3;
  NSOperationQueue *quotaFetchingOperationsQueue;
  uint64_t v5;
  NSMapTable *operationToWatchdogTimerMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMUbiquityQuotaFetcher;
  v2 = -[IMUbiquityQuotaFetcher init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSOperationQueue);
    quotaFetchingOperationsQueue = v2->_quotaFetchingOperationsQueue;
    v2->_quotaFetchingOperationsQueue = v3;

    -[NSOperationQueue setQualityOfService:](v2->_quotaFetchingOperationsQueue, "setQualityOfService:", 17);
    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 5, 512));
    operationToWatchdogTimerMap = v2->_operationToWatchdogTimerMap;
    v2->_operationToWatchdogTimerMap = (NSMapTable *)v5;

  }
  return v2;
}

- (double)cloudServerResponseTimeout
{
  return 60.0;
}

- (void)fetchUserQuotaWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[IMUbiquityQuotaFetcher cloudServerResponseTimeout](self, "cloudServerResponseTimeout");
  -[IMUbiquityQuotaFetcher fetchUserQuotaWithTimeOut:completion:](self, "fetchUserQuotaWithTimeOut:completion:", v4);

}

- (void)fetchUserQuotaWithTimeOut:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  void **v23;
  uint64_t v24;
  id (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id location[2];

  v6 = a4;
  if (+[BCSyncUserDefaults isSignedIntoICloud](BCSyncUserDefaults, "isSignedIntoICloud")
    && +[BCSyncUserDefaults isICloudDriveEnabledForBooks](BCSyncUserDefaults, "isICloudDriveEnabledForBooks"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityQuotaFetcher quotaFetchingOperationsQueue](self, "quotaFetchingOperationsQueue"));

    if (!v7)
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityQuotaFetcher.m", 71, (uint64_t)"-[IMUbiquityQuotaFetcher fetchUserQuotaWithTimeOut:completion:]", (uint64_t)"self.quotaFetchingOperationsQueue", 0, v8, v9, v10, (uint64_t)v23);
    v11 = (id)objc_opt_new(BRFetchQuotaOperation);
    objc_initWeak(location, v11);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_7BD10;
    v28[3] = &unk_28F108;
    objc_copyWeak(&v30, location);
    v28[4] = self;
    v29 = v6;
    objc_msgSend(v11, "setFetchQuotaCompletionBlock:", v28);
    global_queue = dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue(global_queue);
    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityQuotaFetcher operationToWatchdogTimerMap](self, "operationToWatchdogTimerMap"));
      objc_msgSend(v15, "setObject:forKey:", v14, v11);

      v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v14, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_7C080;
      v26 = &unk_28B960;
      v17 = v11;
      v27 = v17;
      dispatch_source_set_event_handler(v14, &v23);
      dispatch_resume(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityQuotaFetcher quotaFetchingOperationsQueue](self, "quotaFetchingOperationsQueue", v23, v24, v25, v26));
      objc_msgSend(v18, "addOperation:", v17);

    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
  else
  {
    v19 = BCQuotaFetcherLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Not fetching quota. Background or offline.", (uint8_t *)location, 2u);
    }

    v11 = objc_retainBlock(v6);
    if (v11)
    {
      v21 = -[IMUbiquityQuotaFetcher lastCachedFreeBytes](self, "lastCachedFreeBytes");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("IMUbiquityQuotaFetcherErrorDomain"), -1000, 0));
      (*((void (**)(id, unint64_t, void *))v11 + 2))(v11, v21, v22);

    }
  }

}

- (unint64_t)lastCachedFreeBytes
{
  return self->_lastCachedFreeBytes;
}

- (void)setLastCachedFreeBytes:(unint64_t)a3
{
  self->_lastCachedFreeBytes = a3;
}

- (NSOperationQueue)quotaFetchingOperationsQueue
{
  return self->_quotaFetchingOperationsQueue;
}

- (void)setQuotaFetchingOperationsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_quotaFetchingOperationsQueue, a3);
}

- (NSMapTable)operationToWatchdogTimerMap
{
  return self->_operationToWatchdogTimerMap;
}

- (void)setOperationToWatchdogTimerMap:(id)a3
{
  objc_storeStrong((id *)&self->_operationToWatchdogTimerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationToWatchdogTimerMap, 0);
  objc_storeStrong((id *)&self->_quotaFetchingOperationsQueue, 0);
}

@end
