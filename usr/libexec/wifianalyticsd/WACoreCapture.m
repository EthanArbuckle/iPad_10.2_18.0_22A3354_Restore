@implementation WACoreCapture

- (WACoreCapture)init
{
  WACoreCapture *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *ccQueue;
  WACoreCapture *v7;
  id v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v11.receiver = self;
  v11.super_class = (Class)WACoreCapture;
  v2 = -[WACoreCapture init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.wifi.analytics.ccQ", v4);
    ccQueue = v2->_ccQueue;
    v2->_ccQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }
  else
  {
    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[WACoreCapture init]";
      v14 = 1024;
      v15 = 48;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }

  }
  return v2;
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  OS_dispatch_queue *ccQueue;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "-[WACoreCapture __dumpCoreCaptureLogsWithReason:]";
    v13 = 1024;
    v14 = 62;
    v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Called into __dumpCoreCaptureLogsWithReason: %@", buf, 0x1Cu);
  }

  ccQueue = self->_ccQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FA28;
  block[3] = &unk_1000CCDB0;
  v10 = v4;
  v8 = v4;
  dispatch_async((dispatch_queue_t)ccQueue, block);

}

- (OS_dispatch_queue)ccQueue
{
  return self->_ccQueue;
}

- (void)setCcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ccQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccQueue, 0);
}

@end
