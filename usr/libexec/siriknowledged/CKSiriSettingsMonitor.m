@implementation CKSiriSettingsMonitor

- (CKSiriSettingsMonitor)init
{
  CKSiriSettingsMonitor *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *processingQueue;
  OS_dispatch_source *timerSource;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKSiriSettingsMonitor;
  v2 = -[CKSiriSettingsMonitor init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.siriknowledged.monitor.settings.siri.queue", v4);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v5;

    timerSource = v2->_timerSource;
    v2->_timerSource = 0;

  }
  return v2;
}

- (void)siriSettingsDidChange
{
  NSObject *v3;
  OS_dispatch_queue *processingQueue;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;

  v3 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CKSiriSettingsMonitor siriSettingsDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002884;
  block[3] = &unk_100018558;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async((dispatch_queue_t)processingQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002E64;
  block[3] = &unk_100018680;
  block[4] = a1;
  if (qword_10001DE90 != -1)
    dispatch_once(&qword_10001DE90, block);
  return (id)qword_10001DE98;
}

@end
