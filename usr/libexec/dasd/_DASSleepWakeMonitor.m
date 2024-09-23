@implementation _DASSleepWakeMonitor

- (unsigned)wakeState
{
  return -1;
}

- (BOOL)inADarkWake
{
  return 0;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CEAE8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABE08 != -1)
    dispatch_once(&qword_1001ABE08, block);
  return (id)qword_1001ABE10;
}

- (BOOL)shouldIgnoreThermalNotifications
{
  return 0;
}

- (id)wakeStateDescription
{
  return &stru_1001617C8;
}

- (BOOL)canRunInCurrentWakeState:(id)a3
{
  return 1;
}

- (BOOL)hasFinishedRunningSinceLastWake:(id)a3
{
  return 0;
}

- (int)darkWakeCount
{
  return self->_darkWakeCount;
}

- (void)setDarkWakeCount:(int)a3
{
  self->_darkWakeCount = a3;
}

- (int)pushWakeCount
{
  return self->_pushWakeCount;
}

- (void)setPushWakeCount:(int)a3
{
  self->_pushWakeCount = a3;
}

- (int)darkWakeRunningActivities
{
  return self->_darkWakeRunningActivities;
}

- (void)setDarkWakeRunningActivities:(int)a3
{
  self->_darkWakeRunningActivities = a3;
}

- (int)pushWakeRunningActivities
{
  return self->_pushWakeRunningActivities;
}

- (void)setPushWakeRunningActivities:(int)a3
{
  self->_pushWakeRunningActivities = a3;
}

@end
