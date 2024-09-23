@implementation BKSystemAppHeartbeat

- (BKSystemAppHeartbeat)init
{
  return -[BKSystemAppHeartbeat initWithFireCount:interval:](self, "initWithFireCount:interval:", 10, 15.0);
}

- (BKSystemAppHeartbeat)initWithFireCount:(unint64_t)a3 interval:(double)a4
{
  BKSystemAppHeartbeat *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSystemAppHeartbeat;
  result = -[BKSystemAppHeartbeat init](&v7, "init");
  if (result)
  {
    result->_numberOfTimesToFire = a3;
    result->_interval = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSystemAppHeartbeat;
  -[BKSystemAppHeartbeat dealloc](&v3, "dealloc");
}

- (void)_handleTimer:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSTimer *timer;

  ++self->_firedCount;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.backboard.systemAppHeartbeat"), 0, 0, 1u);
  if (self->_firedCount == self->_numberOfTimesToFire)
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (void)start
{
  NSTimer *v3;
  NSTimer *timer;

  self->_firedCount = 0;
  -[NSTimer invalidate](self->_timer, "invalidate");
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_handleTimer:", 0, 1, self->_interval));
  timer = self->_timer;
  self->_timer = v3;

  -[BKSystemAppHeartbeat _handleTimer:](self, "_handleTimer:", self->_timer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
