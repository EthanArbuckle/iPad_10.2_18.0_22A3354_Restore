@implementation SecurityAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (qword_100340EE0 != -1)
    dispatch_once(&qword_100340EE0, &stru_1002DC060);
  return (id)qword_100340ED8;
}

+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  BOOL v13;

  v9 = a3;
  v7 = a5;
  if (objc_msgSend(v9, "permittedToSendMetrics"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100057F04;
    block[3] = &unk_1002DC088;
    v11 = v9;
    v13 = a4;
    v12 = v7;
    dispatch_sync(v8, block);

  }
}

@end
