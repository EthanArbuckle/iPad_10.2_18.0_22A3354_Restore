@implementation CLScheduledEventTracker

- (id)initOnSilo:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 block:(id)a7
{
  CLScheduledEventTracker *v12;
  CLTimer *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLScheduledEventTracker;
  v12 = -[CLScheduledEventTracker init](&v16, "init");
  if (v12)
  {
    v12->_silo = (CLDispatchSilo *)a3;
    v13 = (CLTimer *)objc_msgSend(a3, "newTimer");
    v12->_timer = v13;
    -[CLTimer setHandler:](v13, "setHandler:", a7);
    -[CLScheduledEventTracker updateDesiredFireTimeToHour:minute:second:](v12, "updateDesiredFireTimeToHour:minute:second:", a4, a5, a6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)sub_100DC51B0, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v12;
}

- (void)invalidate
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[CLTimer invalidate](-[CLScheduledEventTracker timer](self, "timer"), "invalidate");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
}

- (void)dealloc
{
  objc_super v3;

  -[CLScheduledEventTracker invalidate](self, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)CLScheduledEventTracker;
  -[CLScheduledEventTracker dealloc](&v3, "dealloc");
}

- (BOOL)getAndClearUpdateNextFireTimeHasFired
{
  BOOL v3;

  v3 = -[CLScheduledEventTracker didUpdateFireTime](self, "didUpdateFireTime");
  -[CLScheduledEventTracker setDidUpdateFireTime:](self, "setDidUpdateFireTime:", 0);
  return v3;
}

- (void)handleSysTimeChanged
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102186A20);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"system time changed!\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLScheduledEventTracker updateNextFireTime](self, "updateNextFireTime");
}

- (void)updateDesiredFireTimeToHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5
{
  self->_hour = a3;
  self->_minute = a4;
  self->_second = a5;
  -[CLScheduledEventTracker updateNextFireTime](self, "updateNextFireTime");
}

- (void)updateNextFireTime
{
  NSCalendar *v3;
  NSDate *v4;
  id v5;
  NSDate *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  CLTimer *v12;
  NSObject *v13;
  uint64_t v14;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;

  v3 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
  -[CLDispatchSilo currentLatchedAbsoluteTimestamp](-[CLScheduledEventTracker silo](self, "silo"), "currentLatchedAbsoluteTimestamp");
  v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = -[NSDateComponents copy](-[NSCalendar components:fromDate:](v3, "components:fromDate:", 252, v4), "copy");
  objc_msgSend(v5, "setHour:", -[CLScheduledEventTracker hour](self, "hour"));
  objc_msgSend(v5, "setMinute:", -[CLScheduledEventTracker minute](self, "minute"));
  objc_msgSend(v5, "setSecond:", -[CLScheduledEventTracker second](self, "second"));
  v6 = -[NSCalendar dateFromComponents:](v3, "dateFromComponents:", v5);
  -[NSDate timeIntervalSinceReferenceDate](v4, "timeIntervalSinceReferenceDate");
  v8 = v7;
  -[NSDate timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
  if (v8 > v9)
  {
    v10 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v10, "setDay:", 1);
    v6 = -[NSCalendar dateByAddingComponents:toDate:options:](v3, "dateByAddingComponents:toDate:options:", v10, v6, 0);
  }
  -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", v4);
  self->_nextFireDelay = v11;
  v12 = -[CLScheduledEventTracker timer](self, "timer");
  -[CLScheduledEventTracker nextFireDelay](self, "nextFireDelay");
  -[CLTimer setNextFireDelay:interval:](v12, "setNextFireDelay:interval:");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102186A20);
  v13 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
  {
    -[CLScheduledEventTracker nextFireDelay](self, "nextFireDelay");
    v15[0] = 68289282;
    v15[1] = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2050;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updated scheduled event timer\", \"nextFireDelay\":\"%{public}f\"}", (uint8_t *)v15, 0x1Cu);
  }
  -[CLScheduledEventTracker setDidUpdateFireTime:](self, "setDidUpdateFireTime:", 1);
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (double)nextFireDelay
{
  return self->_nextFireDelay;
}

- (CLTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CLDispatchSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)didUpdateFireTime
{
  return self->_didUpdateFireTime;
}

- (void)setDidUpdateFireTime:(BOOL)a3
{
  self->_didUpdateFireTime = a3;
}

@end
