@implementation _DASBacklightStateMonitor

- (int64_t)state
{
  return self->_currentState;
}

- (BOOL)isBacklightOff
{
  return self->_currentState == 0;
}

- (_DASBacklightStateMonitor)init
{
  _DASBacklightStateMonitor *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  NSObject *v8;
  int64_t currentState;
  objc_super v11;
  uint8_t buf[4];
  int64_t v13;

  v11.receiver = self;
  v11.super_class = (Class)_DASBacklightStateMonitor;
  v2 = -[_DASBacklightStateMonitor init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.duetactivityscheduler.backlightstatemonitor", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
    v2->_currentState = (int64_t)objc_msgSend(v7, "backlightState");

    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BacklightStateMonitor")));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      currentState = v2->_currentState;
      *(_DWORD *)buf = 134217984;
      v13 = currentState;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Initial BacklightState: %ld.", buf, 0xCu);
    }

    -[_DASBacklightStateMonitor registerForBacklightUpdates](v2, "registerForBacklightUpdates");
  }
  return v2;
}

+ (_DASBacklightStateMonitor)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CED3C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABE18 != -1)
    dispatch_once(&qword_1001ABE18, block);
  return (_DASBacklightStateMonitor *)(id)qword_1001ABE20;
}

- (void)registerForBacklightUpdates
{
  dispatch_time_t v3;
  OS_dispatch_queue *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 1000000000);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CEE14;
  v5[3] = &unk_10015D9E0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, (dispatch_queue_t)queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  NSObject *v6;
  int64_t currentState;
  int v8;
  int64_t v9;

  if (self->_currentState != a4)
  {
    self->_currentState = a4;
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BacklightStateMonitor")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      currentState = self->_currentState;
      v8 = 134217984;
      v9 = currentState;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BacklightState: %ld.", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
