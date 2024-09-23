@implementation DPCTelemetry

+ (DPCTelemetry)sharedInstance
{
  if (qword_100012EB8 != -1)
    dispatch_once(&qword_100012EB8, &stru_10000C540);
  return (DPCTelemetry *)(id)qword_100012EC0;
}

- (DPCTelemetry)init
{
  DPCTelemetry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DPCTelemetry;
  result = -[DPCTelemetry init](&v3, "init");
  if (result)
  {
    result->_plClientID = 120;
    result->_plEventName = CFSTR("WatchPresence");
  }
  return result;
}

- (void)registerWatchEvent:(unint64_t)a3 rssiValue:(int64_t)a4
{
  NSNumber *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v13[0] = CFSTR("Timestamp");
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  v10 = CFSTR("WatchPresence");
  if (a3 == 2)
    v10 = CFSTR("WatchAbsence");
  v14[0] = v8;
  v14[1] = v10;
  v13[1] = CFSTR("Event");
  v13[2] = CFSTR("RSSI");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v14[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  PLLogRegisteredEvent(self->_plClientID, self->_plEventName, v12, 0);
}

- (void)registerWatchConnectivity:(BOOL)a3
{
  _BOOL4 v3;
  NSNumber *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = a3;
  v9[0] = CFSTR("Timestamp");
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[1] = CFSTR("Event");
  v10[0] = v6;
  v7 = CFSTR("WatchDisconnected");
  if (v3)
    v7 = CFSTR("WatchConnected");
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  PLLogRegisteredEvent(self->_plClientID, self->_plEventName, v8, 0);
}

- (void)registerError:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  if (a3 == 4)
    v4 = CFSTR("WatchUnreachable");
  else
    v4 = CFSTR("Unknown");
  if (a3 == 2)
    v4 = CFSTR("WatchUnavailable");
  v9[0] = CFSTR("Timestamp");
  v5 = v4;
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[1] = CFSTR("Event");
  v10[0] = v7;
  v10[1] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  PLLogRegisteredEvent(self->_plClientID, self->_plEventName, v8, 0);
}

- (void)registerWatchWristEvent:(int64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  if (a3 == 3)
    v4 = CFSTR("WatchWristStatusOnWrist");
  else
    v4 = CFSTR("WatchWristStatusUnknown");
  if (a3 == 2)
    v4 = CFSTR("WatchWristStatusOffWrist");
  if (a3 == 1)
    v4 = CFSTR("WatchWristStatusDisabled");
  v9[0] = CFSTR("Timestamp");
  v5 = v4;
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[1] = CFSTR("Event");
  v10[0] = v7;
  v10[1] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  PLLogRegisteredEvent(self->_plClientID, self->_plEventName, v8, 0);
}

- (void)registerWatchSwitch
{
  NSNumber *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("Timestamp");
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6[1] = CFSTR("Event");
  v7[0] = v4;
  v7[1] = CFSTR("WatchSwitched");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  PLLogRegisteredEvent(self->_plClientID, self->_plEventName, v5, 0);
}

@end
