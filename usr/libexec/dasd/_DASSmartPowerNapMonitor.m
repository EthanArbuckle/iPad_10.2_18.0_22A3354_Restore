@implementation _DASSmartPowerNapMonitor

- (BOOL)inSmartPowerNap
{
  return self->_currentState == 1;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004BA44;
  v8[3] = &unk_10015DF50;
  v9 = a3;
  v10 = a1;
  v4 = qword_1001AB690;
  v5 = v9;
  if (v4 != -1)
    dispatch_once(&qword_1001AB690, v8);
  v6 = (id)qword_1001AB698;

  return v6;
}

- (unsigned)state
{
  return self->_currentState;
}

- (void)handleSmartPowerNapNotification:(unsigned __int8)a3
{
  _DASDaemon *daemon;
  const __CFString *v4;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    daemon = self->_daemon;
    if (a3 == 1)
      v4 = CFSTR("Entered SmartPowerNap");
    else
      v4 = CFSTR("Exit SmartPowerNap");
    -[_DASDaemon evaluateScoreAndRunAllActivitiesForReason:](daemon, "evaluateScoreAndRunAllActivitiesForReason:", v4);
  }
}

- (void)registerForSmartPowerNapNotifications
{
  _PMCoreSmartPowerNap *v3;
  _PMCoreSmartPowerNap *smartPowerNapMonitor;
  _PMCoreSmartPowerNap *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  v3 = (_PMCoreSmartPowerNap *)objc_alloc_init((Class)_PMCoreSmartPowerNap);
  smartPowerNapMonitor = self->_smartPowerNapMonitor;
  self->_smartPowerNapMonitor = v3;

  v5 = self->_smartPowerNapMonitor;
  if (v5)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004B98C;
    v7[3] = &unk_10015E1C0;
    v7[4] = self;
    -[_PMCoreSmartPowerNap registerWithCallback:callback:](v5, "registerWithCallback:callback:", queue, v7);
  }
}

- (_DASSmartPowerNapMonitor)initWithDaemon:(id)a3
{
  id v5;
  _DASSmartPowerNapMonitor *v6;
  _DASSmartPowerNapMonitor *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DASSmartPowerNapMonitor;
  v6 = -[_DASSmartPowerNapMonitor init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.duetactivityscheduler.smartpowernapmonitor", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    -[_DASSmartPowerNapMonitor registerForSmartPowerNapNotifications](v7, "registerForSmartPowerNapNotifications");
  }

  return v7;
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (_PMCoreSmartPowerNap)smartPowerNapMonitor
{
  return self->_smartPowerNapMonitor;
}

- (void)setSmartPowerNapMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_smartPowerNapMonitor, a3);
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unsigned __int8)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartPowerNapMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
