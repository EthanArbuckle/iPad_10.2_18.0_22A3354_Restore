@implementation CSPower

+ (CSPower)sharedInstance
{
  if (qword_100389488 != -1)
    dispatch_once(&qword_100389488, &stru_100365928);
  return (CSPower *)(id)qword_100389490;
}

- (CSPower)init
{
  NSObject *v3;
  CSPower *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *activeReasons;
  objc_super v16;
  uint8_t buf[16];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v3 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "init", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)CSPower;
  v4 = -[CSPower init](&v16, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("CSPowerDispatchQueue", 0);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v5;

    if (-[CSPower isAssertionActive](v4, "isAssertionActive"))
      -[CSPower releasePowerAssertion](v4, "releasePowerAssertion");
    v4->_valid = 1;
    v4->_refCount = 0;
    v4->_assertionID = CFSTR("com.apple.anomalydetectiond.PowerAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, 0));
    activeReasons = v4->_activeReasons;
    v4->_activeReasons = (NSMutableArray *)v13;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CSPower releaseAllCFObjects](self, "releaseAllCFObjects");
  v3.receiver = self;
  v3.super_class = (Class)CSPower;
  -[CSPower dealloc](&v3, "dealloc");
}

- (BOOL)isAssertionActive
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v3 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "isAssertionActive", v5, 2u);
  }
  return self->_assertionReference != 0;
}

- (void)createPowerAssertion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CDB68;
  block[3] = &unk_100347E10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

- (void)releasePowerAssertion
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CDE7C;
  block[3] = &unk_10034B158;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)releaseAllCFObjects
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CE198;
  block[3] = &unk_10034B158;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)clearAllPowerloggingInfo
{
  NSObject *v3;
  unint64_t v4;
  NSMutableArray *activeReasons;
  void *v6;
  uint8_t v7[16];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v3 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearAllPowerloggingInfo", v7, 2u);
  }
  if (-[NSMutableArray count](self->_activeReasons, "count"))
  {
    v4 = 0;
    do
    {
      activeReasons = self->_activeReasons;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      -[NSMutableArray addObject:](activeReasons, "addObject:", v6);

      ++v4;
    }
    while ((unint64_t)-[NSMutableArray count](self->_activeReasons, "count") > v4);
  }
}

- (void)clearPowerloggingInfo:(int)a3
{
  NSObject *v5;
  NSMutableArray *activeReasons;
  void *v7;
  uint8_t v8[16];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v5 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "clearPowerloggingInfo", v8, 2u);
  }
  activeReasons = self->_activeReasons;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  -[NSMutableArray replaceObjectAtIndex:withObject:](activeReasons, "replaceObjectAtIndex:withObject:", a3, v7);

  if ((a3 - 1) <= 1)
    self->_sessionType = 0;
}

- (void)powerlogActivity:(double)a3 state:(int)a4
{
  NSObject *dispatchQueue;
  _QWORD block[6];
  int v6;

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CE49C;
  block[3] = &unk_100365950;
  v6 = a4;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(dispatchQueue, block);
}

- (void)sendPowerlogMetrics:(int)a3 start:(id)a4 end:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[3];
  _QWORD v14[3];

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = a5;
  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v9 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "sendPowerlogMetrics", v12, 2u);
  }
  v13[0] = CFSTR("APWakeReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v14[0] = v10;
  v14[1] = v7;
  v13[1] = CFSTR("reasonStartTimestamp");
  v13[2] = CFSTR("reasonEndTimestamp");
  v14[2] = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  PLLogRegisteredEvent(126, +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", "KappaEvent", 4), v11, 0);
}

- (void)onKappaSessionUpdate:(int)a3 data:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  int v6;

  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002CE874;
  v5[3] = &unk_100365978;
  v6 = a3;
  v5[4] = self;
  dispatch_sync(dispatchQueue, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeReasons, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
