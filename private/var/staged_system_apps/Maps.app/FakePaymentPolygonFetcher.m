@implementation FakePaymentPolygonFetcher

- (FakePaymentPolygonFetcher)initWithTestCallback:(id)a3
{
  id v4;
  FakePaymentPolygonFetcher *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  id v10;
  id testCallback;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FakePaymentPolygonFetcher;
  v5 = -[FakePaymentPolygonFetcher init](&v13, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.Maps.fakeFetcherQueue", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_retainBlock(v4);
    testCallback = v5->_testCallback;
    v5->_testCallback = v10;

  }
  return v5;
}

- (BOOL)paymentPolygonsAtLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  BOOL v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t Log;
  const char *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[5];
  NSObject *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v12 = sub_10043253C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
      v24 = 1024;
      v25 = 35;
      v26 = 2082;
      v27 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      v28 = 2082;
      v29 = "nil == completion";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v11 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 136446978;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
    v24 = 1024;
    v25 = 35;
    v26 = 2082;
    v27 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    v28 = 2082;
    v29 = "nil == completion";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil";
    goto LABEL_12;
  }
  if (!v6)
  {
    v16 = sub_10043253C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
      v24 = 1024;
      v25 = 36;
      v26 = 2082;
      v27 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      v28 = 2082;
      v29 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", buf, 0x26u);
    }

    v18 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v11 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 136446978;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
    v24 = 1024;
    v25 = 36;
    v26 = 2082;
    v27 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    v28 = 2082;
    v29 = "nil == location";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v15, buf, 0x26u);
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  queue = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1006F4DB0;
  v20[3] = &unk_1011ACAD0;
  v20[4] = self;
  v21 = v7;
  dispatch_async(queue, v20);
  v10 = 1;
  v11 = v21;
LABEL_14:

  return v10;
}

- (void)configurePaymentPolygonMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPolygonMapItems, a3);
}

- (void)configurePaymentPolygonResponseError:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPolygonResponseError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paymentPolygonResponseError, 0);
  objc_storeStrong((id *)&self->_paymentPolygonMapItems, 0);
  objc_storeStrong(&self->_testCallback, 0);
}

@end
