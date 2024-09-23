@implementation APAttributionUploadStatusListener

- (APAttributionUploadStatusListener)initWithIntervalId:(unint64_t)a3 reportingStorefront:(id)a4 requestTimestamp:(id)a5 daemonStartTime:(id)a6 tokenPayloadDeliveryStartTime:(id)a7 tokenReturnedToClientDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  APAttributionUploadStatusListener *v18;
  APAttributionUploadStatusListener *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)APAttributionUploadStatusListener;
  v18 = -[APAttributionUploadStatusListener init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    v18->_intervalId = a3;
    objc_storeStrong((id *)&v18->_reportingStorefront, a4);
    objc_storeStrong((id *)&v19->_requestTimestamp, a5);
    objc_storeStrong((id *)&v19->_daemonStartTime, a6);
    objc_storeStrong((id *)&v19->_tokenPayloadDeliveryStartTime, a7);
    objc_storeStrong((id *)&v19->_tokenReturnedToClientDate, a8);
  }

  return v19;
}

- (void)uploadSucceededWithRetryCount:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  const __CFString *v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  unint64_t v41;

  v5 = APPerfLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 134217984;
      v41 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "HTTP Request Success", "HTTP Request Success id=%llu enableTelemetry=YES ", buf, 0xCu);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener requestTimestamp](self, "requestTimestamp"));
  v38 = CFSTR("storeFront");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener reportingStorefront](self, "reportingStorefront"));
  v39 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  +[APAttributionAnalytics sendTimingAnalytics:startDate:endDate:additionalFields:](APAttributionAnalytics, "sendTimingAnalytics:startDate:endDate:additionalFields:", CFSTR("tokenServerDeliveryTime"), v10, v9, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener requestTimestamp](self, "requestTimestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener daemonStartTime](self, "daemonStartTime"));
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  v17 = +[APAttributionAnalytics findBucketForDaemonRunningTime:](APAttributionAnalytics, "findBucketForDaemonRunningTime:", v16);
  v36[0] = CFSTR("numberOfRetries");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v37[0] = v18;
  v36[1] = CFSTR("daemonRunningTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
  v37[1] = v19;
  v36[2] = CFSTR("storeFront");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener reportingStorefront](self, "reportingStorefront"));
  v37[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener tokenReturnedToClientDate](self, "tokenReturnedToClientDate"));
  +[APAttributionAnalytics sendTimingAnalytics:startDate:endDate:additionalFields:](APAttributionAnalytics, "sendTimingAnalytics:startDate:endDate:additionalFields:", CFSTR("clientDeliveryToServerTime"), v22, v9, v21);

  if (!a3)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener tokenPayloadDeliveryStartTime](self, "tokenPayloadDeliveryStartTime"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v34 = CFSTR("storeFront");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener reportingStorefront](self, "reportingStorefront"));
    v35 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    +[APAttributionAnalytics sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:](APAttributionAnalytics, "sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:", CFSTR("attribution.timingPayloadFlow"), CFSTR("payloadFlowTime"), v23, v24, v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener tokenReturnedToClientDate](self, "tokenReturnedToClientDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener reportingStorefront](self, "reportingStorefront", CFSTR("storeFront")));
    v33[0] = v29;
    v32[1] = CFSTR("Retry");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0));
    v32[2] = CFSTR("Code");
    v33[1] = v30;
    v33[2] = &off_100228DC0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
    +[APAttributionAnalytics sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:](APAttributionAnalytics, "sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:", CFSTR("attribution.timingDelivery"), CFSTR("payloadDeliveryTime"), v27, v28, v31);

  }
}

- (void)uploadFailedWithStatusCode:(int64_t)a3 retryCount:(unint64_t)a4
{
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  int64_t v13;

  v6 = APPerfLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      v10 = 134349312;
      v11 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
      v12 = 2048;
      v13 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "HTTP Response Error", "HTTP Response Error id=%{public, name=id}lld error=%ld enableTelemetry=YES ", (uint8_t *)&v10, 0x16u);
    }
  }

}

- (void)requestBuildingStartedWithTimestamp:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  void *v16;

  v5 = APPerfLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      v9 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener reportingStorefront](self, "reportingStorefront"));
      v11 = 134349570;
      v12 = a3;
      v13 = 2050;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HTTP Request Time", "%{public, signpost.description:begin_time}llu id=%{public, name=id}lld storefront=%{public, name=storefront}@", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (void)requestIsAboutToBeSent
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  void *v16;

  v3 = APPerfLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      v13 = 134349056;
      v14 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, v6, "HTTP Request Time", "id=%{public, name=id}lld enableTelemetry=YES ", (uint8_t *)&v13, 0xCu);
    }
  }

  v7 = APPerfLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      v11 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionUploadStatusListener reportingStorefront](self, "reportingStorefront"));
      v13 = 134349314;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HTTP Response Time", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)receivedResponse:(id)a3 retryCount:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[4];
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  unint64_t v24;

  v6 = a3;
  v7 = APPerfLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134349312;
      v22 = -[APAttributionUploadStatusListener intervalId](self, "intervalId");
      v23 = 2050;
      v24 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v10, "HTTP Response Time", "id=%{public, name=id}lld retryCount=%{public, name=retryCount}ld enableTelemetry=YES ", buf, 0x16u);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "responseError"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "responseError"));
    v13 = +[APA9nErrorBucketObjC findBucketForCode:type:](APA9nErrorBucketObjC, "findBucketForCode:type:", objc_msgSend(v12, "code"), 1);

  }
  else
  {
    v13 = +[APA9nErrorBucketObjC findBucketForCode:type:](APA9nErrorBucketObjC, "findBucketForCode:type:", objc_msgSend(v6, "responseStatusCode"), 0);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13, CFSTR("Code")));
  v20[0] = v14;
  v20[1] = &off_100228DD8;
  v19[1] = CFSTR("Module");
  v19[2] = CFSTR("Retry");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v20[2] = v15;
  v19[3] = CFSTR("Status");
  if (objc_msgSend(v6, "responseStatusCode") == (id)204)
    v16 = 0;
  else
    v16 = 6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
  v20[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));

  +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("attribution.retry"), v18);
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void)setIntervalId:(unint64_t)a3
{
  self->_intervalId = a3;
}

- (NSString)reportingStorefront
{
  return self->_reportingStorefront;
}

- (void)setReportingStorefront:(id)a3
{
  objc_storeStrong((id *)&self->_reportingStorefront, a3);
}

- (NSDate)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_requestTimestamp, a3);
}

- (NSDate)daemonStartTime
{
  return self->_daemonStartTime;
}

- (void)setDaemonStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_daemonStartTime, a3);
}

- (NSDate)tokenReturnedToClientDate
{
  return self->_tokenReturnedToClientDate;
}

- (void)setTokenReturnedToClientDate:(id)a3
{
  objc_storeStrong((id *)&self->_tokenReturnedToClientDate, a3);
}

- (NSDate)tokenPayloadDeliveryStartTime
{
  return self->_tokenPayloadDeliveryStartTime;
}

- (void)setTokenPayloadDeliveryStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_tokenPayloadDeliveryStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenPayloadDeliveryStartTime, 0);
  objc_storeStrong((id *)&self->_tokenReturnedToClientDate, 0);
  objc_storeStrong((id *)&self->_daemonStartTime, 0);
  objc_storeStrong((id *)&self->_requestTimestamp, 0);
  objc_storeStrong((id *)&self->_reportingStorefront, 0);
}

@end
