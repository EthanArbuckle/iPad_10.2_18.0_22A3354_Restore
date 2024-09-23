@implementation JSAMetricsAppLaunchEvent

- (JSAMetricsAppLaunchEvent)init
{
  JSAMetricsAppLaunchEvent *v2;
  void *v3;
  uint64_t v4;
  NSString *launchCorrelationKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JSAMetricsAppLaunchEvent;
  v2 = -[JSAMetricsAppLaunchEvent init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    launchCorrelationKey = v2->_launchCorrelationKey;
    v2->_launchCorrelationKey = (NSString *)v4;

  }
  return v2;
}

+ (void)createPendingLaunchEvent
{
  id v2;
  void *v3;

  if ((byte_B9F38 & 1) == 0 && !qword_B9F30)
  {
    v2 = objc_alloc_init((Class)a1);
    v3 = (void *)qword_B9F30;
    qword_B9F30 = (uint64_t)v2;

  }
}

+ (id)consumePendingLaunchEvent
{
  id v2;
  void *v3;

  v2 = (id)qword_B9F30;
  byte_B9F38 = 1;
  v3 = (void *)qword_B9F30;
  qword_B9F30 = 0;

  return v2;
}

+ (void)markJSBootstrapStartTime
{
  double v2;

  v2 = sub_9FB4((uint64_t)a1);
  _objc_msgSend((id)qword_B9F30, "setJsBootstrapStartTime:", v2);
}

+ (void)markJSBootstrapEndTime
{
  double v2;

  v2 = sub_9FB4((uint64_t)a1);
  _objc_msgSend((id)qword_B9F30, "setJsBootstrapEndTime:", v2);
}

+ (void)markLaunchEndTime
{
  double v2;

  v2 = sub_9FB4((uint64_t)a1);
  _objc_msgSend((id)qword_B9F30, "setLaunchEndTime:", v2);
}

+ (void)updateRequiredBlockingBagLoad:(BOOL)a3
{
  _objc_msgSend((id)qword_B9F30, "setRequiredBlockingBagLoad:", a3);
}

+ (void)updateUsedBootstrapFallback:(BOOL)a3
{
  _objc_msgSend((id)qword_B9F30, "setUsedBootstrapFallback:", a3);
}

- (id)metricsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[8];
  _QWORD v15[8];

  if (qword_B9F48 != -1)
    dispatch_once(&qword_B9F48, &stru_9E198);
  v14[0] = CFSTR("launchCorrelationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSAMetricsAppLaunchEvent launchCorrelationKey](self, "launchCorrelationKey"));
  v15[0] = v3;
  v15[1] = &__kCFBooleanTrue;
  v14[1] = CFSTR("isAppLaunch");
  v14[2] = CFSTR("jsBootstrapStartTime");
  -[JSAMetricsAppLaunchEvent jsBootstrapStartTime](self, "jsBootstrapStartTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v15[2] = v4;
  v14[3] = CFSTR("jsBootstrapEndTime");
  -[JSAMetricsAppLaunchEvent jsBootstrapEndTime](self, "jsBootstrapEndTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v15[3] = v5;
  v14[4] = CFSTR("launchEndTime");
  -[JSAMetricsAppLaunchEvent launchEndTime](self, "launchEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v15[4] = v6;
  v14[5] = CFSTR("processStartTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&qword_B9F40));
  v15[5] = v7;
  v14[6] = CFSTR("requiredBlockingBagLoad");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[JSAMetricsAppLaunchEvent requiredBlockingBagLoad](self, "requiredBlockingBagLoad")));
  v15[6] = v8;
  v14[7] = CFSTR("usedBootstrapFallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[JSAMetricsAppLaunchEvent usedBootstrapFallback](self, "usedBootstrapFallback")));
  v15[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 8));

  v11 = JSALog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_71A38((uint64_t)v10, v12);

  return v10;
}

- (double)jsBootstrapStartTime
{
  return self->_jsBootstrapStartTime;
}

- (void)setJsBootstrapStartTime:(double)a3
{
  self->_jsBootstrapStartTime = a3;
}

- (double)jsBootstrapEndTime
{
  return self->_jsBootstrapEndTime;
}

- (void)setJsBootstrapEndTime:(double)a3
{
  self->_jsBootstrapEndTime = a3;
}

- (NSString)launchCorrelationKey
{
  return self->_launchCorrelationKey;
}

- (void)setLaunchCorrelationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)launchEndTime
{
  return self->_launchEndTime;
}

- (void)setLaunchEndTime:(double)a3
{
  self->_launchEndTime = a3;
}

- (double)processStartTime
{
  return self->_processStartTime;
}

- (void)setProcessStartTime:(double)a3
{
  self->_processStartTime = a3;
}

- (BOOL)requiredBlockingBagLoad
{
  return self->_requiredBlockingBagLoad;
}

- (void)setRequiredBlockingBagLoad:(BOOL)a3
{
  self->_requiredBlockingBagLoad = a3;
}

- (BOOL)usedBootstrapFallback
{
  return self->_usedBootstrapFallback;
}

- (void)setUsedBootstrapFallback:(BOOL)a3
{
  self->_usedBootstrapFallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchCorrelationKey, 0);
}

@end
