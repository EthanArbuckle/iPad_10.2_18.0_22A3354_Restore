@implementation PRLowPowerModeMonitor

- (PRLowPowerModeMonitor)initWithQueue:(id)a3 stateChangeHandler:(id)a4
{
  id v8;
  id v9;
  PRLowPowerModeMonitor *v10;
  PRLowPowerModeMonitor *v11;
  id v12;
  id modeChangeHandler;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRLowPowerModeMonitor.mm"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PRLowPowerModeMonitor;
  v10 = -[PRLowPowerModeMonitor init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    v11->_monitoring = 0;
    v12 = objc_retainBlock(v9);
    modeChangeHandler = v11->_modeChangeHandler;
    v11->_modeChangeHandler = v12;

    v11->_lowPowerModeEnabled = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PRLowPowerModeMonitor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)PRLowPowerModeMonitor;
  -[PRLowPowerModeMonitor dealloc](&v3, "dealloc");
}

- (void)_initLowPowerModeListner
{
  void *v3;
  void *v4;
  void (**modeChangeHandler)(id, BOOL);
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_lowPowerModeChanged:", NSProcessInfoPowerStateDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  self->_lowPowerModeEnabled = objc_msgSend(v4, "isLowPowerModeEnabled");

  modeChangeHandler = (void (**)(id, BOOL))self->_modeChangeHandler;
  if (modeChangeHandler)
    modeChangeHandler[2](modeChangeHandler, self->_lowPowerModeEnabled);
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lowPowerModeEnabled)
      v7 = "enabled";
    else
      v7 = "disabled";
    v8 = 136315138;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#lpm-mon, Monitor initialized. LPM is %s", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_lowPowerModeChanged:(id)a3
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B4438;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (BOOL)startMonitoring
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  if (!self->_monitoring)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B45D0;
    block[3] = &unk_1007FB340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
    self->_monitoring = 1;
  }
  return 1;
}

- (void)stopMonitoring
{
  OS_dispatch_queue *queue;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_monitoring)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1001B46E4;
    v4[3] = &unk_1007FA078;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)queue, v4);
    self->_monitoring = 0;
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modeChangeHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
