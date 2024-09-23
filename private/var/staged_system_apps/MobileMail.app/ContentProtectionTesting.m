@implementation ContentProtectionTesting

+ (id)sharedInstance
{
  if (qword_1005A9A98 != -1)
    dispatch_once(&qword_1005A9A98, &stru_10051A9C0);
  return (id)qword_1005A9A90;
}

- (ContentProtectionTesting)init
{

  return 0;
}

- (void)toggleLockState
{
  uint64_t ObservedState;
  id v4;
  uint64_t v5;
  NSTimer *v6;
  NSTimer *lockTimer;
  void *v8;
  uint64_t v9;

  ObservedState = EFContentProtectionGetObservedState(self, a2);
  if (ObservedState == 3)
  {
    v4 = -[ContentProtectionTesting _simulateContentProtectionState:](self, "_simulateContentProtectionState:", 0);
    ObservedState = EFContentProtectionGetObservedState(v4, v5);
  }
  if (ObservedState == 2)
  {
    -[ContentProtectionTesting _invalidateLockTimer](self, "_invalidateLockTimer");
    goto LABEL_8;
  }
  if (ObservedState == 1)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (ObservedState)
    return;
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_lockTimerFired:", 0, 0, 10.0));
  lockTimer = self->_lockTimer;
  self->_lockTimer = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v8, "addTimer:forMode:", self->_lockTimer, NSRunLoopCommonModes);

  v9 = 2;
LABEL_9:
  -[ContentProtectionTesting _simulateContentProtectionState:](self, "_simulateContentProtectionState:", v9);
}

- (void)disableContentProtection
{
  -[ContentProtectionTesting _invalidateLockTimer](self, "_invalidateLockTimer");
  -[ContentProtectionTesting _simulateContentProtectionState:](self, "_simulateContentProtectionState:", 3);
}

- (void)_lockTimerFired:(id)a3
{
  if (self->_lockTimer == a3)
  {
    if (EFContentProtectionGetObservedState(self, a2) == 2)
      -[ContentProtectionTesting _simulateContentProtectionState:](self, "_simulateContentProtectionState:", 1);
    -[ContentProtectionTesting _invalidateLockTimer](self, "_invalidateLockTimer");
  }
}

- (void)_invalidateLockTimer
{
  NSTimer *lockTimer;

  -[NSTimer invalidate](self->_lockTimer, "invalidate");
  lockTimer = self->_lockTimer;
  self->_lockTimer = 0;

}

- (void)_simulateContentProtectionState:(int64_t)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;

  if ((unint64_t)a3 > 3)
    v4 = CFSTR("invalid");
  else
    v4 = off_10051A9E0[a3];
  v5 = MFLogGeneral(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Simulating Content Protection state: %@ (%@)", (uint8_t *)&v8, 0x16u);

  }
  EFContentProtectionSimulateState(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockTimer, 0);
}

@end
