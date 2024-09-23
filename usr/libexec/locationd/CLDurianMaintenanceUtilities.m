@implementation CLDurianMaintenanceUtilities

- (BOOL)isTinkerWatch
{
  return +[CLDurianPlatform isTinkerWatch](CLDurianPlatform, "isTinkerWatch");
}

- (BOOL)isWatch
{
  return +[CLDurianPlatform isWatch](CLDurianPlatform, "isWatch");
}

- (CLDurianMaintenanceUtilities)init
{
  -[CLDurianMaintenanceUtilities doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianMaintenanceUtilities)initWithQueue:(id)a3
{
  CLDurianMaintenanceUtilities *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianMaintenanceUtilities;
  v4 = -[CLDurianMaintenanceUtilities init](&v6, "init");
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v4->_powerAssertion = 0;
  }
  return v4;
}

- (void)startTimer:(BOOL)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;

  if (self->_timer)
    -[CLDurianMaintenanceUtilities clearTimer](self, "clearTimer");
  self->_isHeleOnly = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 1026;
    v14 = 5;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint timer setup\", \"holdoff\":%{public}d}", buf, 0x18u);
  }
  -[CLDurianMaintenanceUtilities restartTimer](self, "restartTimer");
  v6 = dispatch_time(0, 5000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1014F2134;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_after(v6, queue, block);
}

- (void)stopTimer
{
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self->_timer != 0;
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1026;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint timer stop\", \"valid\":%{public}hhd}", (uint8_t *)v5, 0x18u);
  }
  -[CLDurianMaintenanceUtilities clearTimer](self, "clearTimer");
}

- (void)restartTimer
{
  double intervalOverride;
  PCPersistentTimer *v4;
  NSObject *v5;
  int interval;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;

  -[CLDurianMaintenanceUtilities clearTimer](self, "clearTimer");
  intervalOverride = self->_intervalOverride;
  self->_interval = intervalOverride;
  if (intervalOverride == 0.0)
    *(_QWORD *)&self->_interval = qword_101CC5C40[!self->_isHeleOnly];
  v4 = (PCPersistentTimer *)objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.locationd.durianPersistentConnectionMaintenance"), self, "onTimer:", 0, self->_interval);
  self->_timer = v4;
  -[PCPersistentTimer setDisableSystemWaking:](v4, "setDisableSystemWaking:", 0);
  -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_timer, "setMinimumEarlyFireProportion:", 0.9);
  -[PCPersistentTimer setUserVisible:](self->_timer, "setUserVisible:", 0);
  -[PCPersistentTimer scheduleInQueue:](self->_timer, "scheduleInQueue:", self->_queue);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    interval = (int)self->_interval;
    v7[0] = 68289794;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 1026;
    v11 = interval;
    v12 = 1026;
    v13 = 1;
    v14 = 1026;
    v15 = 90;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint timer start\", \"interval\":%{public}d, \"waking\":%{public}hhd, \"earlyfire\":%{public}d}", (uint8_t *)v7, 0x24u);
  }
}

- (void)clearTimer
{
  PCPersistentTimer *timer;

  timer = self->_timer;
  if (timer)
  {
    -[PCPersistentTimer invalidate](timer, "invalidate");

    self->_timer = 0;
  }
}

- (void)onTimer:(id)a3
{
  CLDurianMaintenanceUtilitiesDelegate *delegate;
  double v6;
  double v7;
  double v8;

  delegate = self->_delegate;
  objc_msgSend(a3, "fireTime");
  v7 = v6;
  objc_msgSend(a3, "startTime");
  -[CLDurianMaintenanceUtilitiesDelegate maintenanceTimerFiredWithInterval:](delegate, "maintenanceTimerFiredWithInterval:", v7 - v8);
  -[CLDurianMaintenanceUtilities restartTimer](self, "restartTimer");
}

- (BOOL)isTimerOn
{
  return self->_timer != 0;
}

- (void)takeMaintenancePowerAssertion
{
  NSObject *v2;
  int v4;
  dispatch_time_t v5;
  NSObject *queue;
  NSObject *v7;
  int assertId;
  _QWORD v9[5];
  int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  if (self->_isHeleOnly)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
    v2 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint assertion skip\"}", buf, 0x12u);
    }
  }
  else
  {
    if (self->_powerAssertion)
      -[CLDurianMaintenanceUtilities releaseMaintenancePowerAssertion:](self, "releaseMaintenancePowerAssertion:", CFSTR("retake"));
    v4 = self->_assertId + 1;
    self->_assertId = v4;
    v5 = dispatch_time(0, 28000000000);
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1014F2698;
    v9[3] = &unk_10213D498;
    v9[4] = self;
    v10 = v4;
    dispatch_after(v5, queue, v9);
    self->_assertTime = CFAbsoluteTimeGetCurrent();
    self->_assertDuration = -1.0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      assertId = self->_assertId;
      *(_DWORD *)buf = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 1026;
      v16 = assertId;
      v17 = 1026;
      v18 = 28;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint assertion take\", \"id\":%{public}d, \"duration\":%{public}d}", buf, 0x1Eu);
    }
    self->_powerAssertion = (void *)CPPowerAssertionCreate(CFSTR("DurianMaintenance"), 28.0);
  }
}

- (void)releaseMaintenancePowerAssertion:(id)a3
{
  uint64_t v5;
  int assertDuration;
  int assertId;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;

  if (self->_powerAssertion)
  {
    self->_assertDuration = CFAbsoluteTimeGetCurrent() - self->_assertTime;
    CFRelease(self->_powerAssertion);
    self->_powerAssertion = 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      assertDuration = (int)self->_assertDuration;
      assertId = self->_assertId;
      v13 = 68289795;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 1026;
      v18 = assertId;
      v19 = 2113;
      v20 = a3;
      v21 = 1026;
      v22 = assertDuration;
      v8 = "{\"msg%{public}.0s\":\"#durian #maint assertion release\", \"id\":%{public}d, \"reason\":%{private, location:"
           "escape_only}@, \"duration\":%{public}d}";
      v9 = v5;
      v10 = 40;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (!self->_isHeleOnly)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_assertId;
      v13 = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 1026;
      v18 = v12;
      v19 = 2113;
      v20 = a3;
      v8 = "{\"msg%{public}.0s\":\"#durian #maint assertion null\", \"id\":%{public}d, \"reason\":%{private, location:escape_only}@}";
      v9 = v11;
      v10 = 34;
      goto LABEL_6;
    }
  }
}

- (void)releaseMaintenancePowerAssertionWithId:(int)a3
{
  NSObject *v5;
  int assertId;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  if (self->_assertId == a3)
  {
    -[CLDurianMaintenanceUtilities releaseMaintenancePowerAssertion:](self, "releaseMaintenancePowerAssertion:", CFSTR("timeout"));
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC3A0);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      assertId = self->_assertId;
      v7[0] = 68289538;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 1026;
      v11 = assertId;
      v12 = 1026;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint assertion mismatch\", \"id\":%{public}d, \"input\":%{public}d}", (uint8_t *)v7, 0x1Eu);
    }
  }
}

- (BOOL)isPowerAssertionAsserted
{
  return self->_powerAssertion != 0;
}

- (double)getMaintenanceAssertionDuration
{
  return self->_assertDuration;
}

- (BOOL)isIphone
{
  return +[CLDurianPlatform isPhone](CLDurianPlatform, "isPhone");
}

- (CLDurianMaintenanceUtilitiesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianMaintenanceUtilitiesDelegate *)a3;
}

- (double)intervalOverride
{
  return self->_intervalOverride;
}

- (void)setIntervalOverride:(double)a3
{
  self->_intervalOverride = a3;
}

- (double)interval
{
  return self->_interval;
}

@end
