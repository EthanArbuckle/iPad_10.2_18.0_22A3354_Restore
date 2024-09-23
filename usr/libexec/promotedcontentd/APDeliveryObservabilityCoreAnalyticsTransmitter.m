@implementation APDeliveryObservabilityCoreAnalyticsTransmitter

- (void)sendDeliveryEventWithError:(int64_t)a3 successCount:(int64_t)a4 backoffIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v11[0] = CFSTR("error");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v12[0] = v7;
  v11[1] = CFSTR("successCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v12[1] = v8;
  v11[2] = CFSTR("backoffIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  v12[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("ec.delivery"), v10);

}

@end
