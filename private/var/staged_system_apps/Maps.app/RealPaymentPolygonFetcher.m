@implementation RealPaymentPolygonFetcher

- (BOOL)paymentPolygonsAtLocation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t Log;
  const char *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v13 = sub_10043253C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
      v26 = 1024;
      v27 = 20;
      v28 = 2082;
      v29 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      v30 = 2082;
      v31 = "nil == completion";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v12 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 136446978;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
    v26 = 1024;
    v27 = 20;
    v28 = 2082;
    v29 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    v30 = 2082;
    v31 = "nil == completion";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil";
    goto LABEL_12;
  }
  if (!v5)
  {
    v17 = sub_10043253C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
      v26 = 1024;
      v27 = 21;
      v28 = 2082;
      v29 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      v30 = 2082;
      v31 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", buf, 0x26u);
    }

    v19 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v12 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 136446978;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
    v26 = 1024;
    v27 = 21;
    v28 = 2082;
    v29 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    v30 = 2082;
    v31 = "nil == location";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, v16, buf, 0x26u);
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v23 = v5;
  v8 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultTraits"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForNearbyTransitPaymentInfoForLocations:traits:", v9, v11));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10062F724;
  v21[3] = &unk_1011AE268;
  v22 = v6;
  -[NSObject submitWithHandler:networkActivity:](v12, "submitWithHandler:networkActivity:", v21, 0);

LABEL_14:
  return v8;
}

@end
