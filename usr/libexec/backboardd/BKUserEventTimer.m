@implementation BKUserEventTimer

- (void)userEventOccurredOnDisplay:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CFTimeInterval v6;
  NSObject *queue;
  _QWORD v8[10];

  if (!a3)
  {
    v8[8] = v3;
    v8[9] = v4;
    v6 = CACurrentMediaTime();
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018A7C;
    v8[3] = &unk_1000ECB60;
    v8[4] = self;
    *(CFTimeInterval *)&v8[5] = v6;
    dispatch_async(queue, v8);
  }
}

- (BKUserEventTimer)init
{
  BKUserEventTimer *v2;
  BKUserEventTimer *v3;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v6;
  id *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  BSInvalidatable *systemShellObserving;
  id v13;
  uint64_t v14;
  uint64_t v15;
  BSInvalidatable *stateCaptureAssertion;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BKUserEventTimer;
  v2 = -[BKUserEventTimer init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_currentTimeout = BKSHIDServicesUserEventTimerIntervalForever;
    v2->_currentMode = 0;
    v2->_lastUserEvent = CACurrentMediaTime();
    v3->_lastResetTimerRequest = CACurrentMediaTime();
    v3->_isIdle = 1;
    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboardd.idletimer"));
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
    v7 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "systemShellState"));

    if (v7)
    {
      v8 = v7[2];
      if (v8)
      {
        v9 = v7[4];
        v3->_safeToResetIdleTimer = objc_msgSend(v9, "containsObject:", v8);

      }
    }
    else
    {
      v8 = 0;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSystemShellObserver:reason:", v3, CFSTR("BKUserEventTimer")));
    systemShellObserving = v3->_systemShellObserving;
    v3->_systemShellObserving = (BSInvalidatable *)v11;

    objc_initWeak(&location, v3);
    v13 = &_dispatch_main_q;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004C674;
    v18[3] = &unk_1000EC208;
    objc_copyWeak(&v19, &location);
    v14 = BSLogAddStateCaptureBlockWithTitle(&_dispatch_main_q, CFSTR("BKUserEventTimer"), v18);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    stateCaptureAssertion = v3->_stateCaptureAssertion;
    v3->_stateCaptureAssertion = (BSInvalidatable *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKUserEventTimer.m"), 88, CFSTR("this object should never deallocate"));

  v5.receiver = self;
  v5.super_class = (Class)BKUserEventTimer;
  -[BKUserEventTimer dealloc](&v5, "dealloc");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKUserEventTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUserEventTimer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUserEventTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  v5 = NSStringFromBKSHIDServicesUserEventTimerMode(self->_currentMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("currentMode"));

  v8 = objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("currentTimeout"), 0, self->_currentTimeout);
  v9 = objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("lastUserEventTime"), 0, self->_lastUserEvent);
  v10 = objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("lastResetTimerRequestTime"), 0, self->_lastResetTimerRequest);
  v11 = objc_msgSend(v4, "appendBool:withName:", self->_isIdle, CFSTR("_isIdle"));
  v12 = objc_msgSend(v4, "appendBool:withName:", self->_shouldNotify, CFSTR("_shouldNotify"));
  v13 = objc_msgSend(v4, "appendBool:withName:", self->_safeToResetIdleTimer, CFSTR("_safeToResetIdleTimer"));
  return v4;
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C63C;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)lastUserEventTime
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004C628;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetTimer:(double)a3 mode:(int)a4
{
  double v8;
  CFTimeInterval v9;
  NSObject *queue;
  _QWORD v11[7];
  int v12;

  if (BKSHIDServicesUserEventTimerIntervalForever <= a3 || a4 == 0 || a3 < 0.0)
    v8 = BKSHIDServicesUserEventTimerIntervalForever;
  else
    v8 = a3;
  v9 = CACurrentMediaTime();
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004C49C;
  v11[3] = &unk_1000EB200;
  v12 = a4;
  v11[4] = self;
  *(double *)&v11[5] = v8;
  *(CFTimeInterval *)&v11[6] = v9;
  dispatch_async(queue, v11);
}

- (void)notifyOnNextUserEvent
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C48C;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isSafeToResetIdleTimer
{
  return self->_safeToResetIdleTimer;
}

- (void)_queue_postNotification:(__CFString *)a3
{
  id v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  __CFString *v8;

  BSDispatchQueueAssert(self->_queue, a2);
  v4 = sub_100059A14();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "postNotification: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0, 0, 1u);
}

- (void)_queue_userEventOccurredInIdleMode
{
  BSDispatchQueueAssert(self->_queue, a2);
  if (self->_isIdle)
  {
    self->_isIdle = 0;
    -[BKUserEventTimer _queue_postNotification:](self, "_queue_postNotification:", kBKSHIDServicesUserEventUnIdled);
  }
}

- (void)_queue_userEventOccurredInPresenceMode
{
  BSDispatchQueueAssert(self->_queue, a2);
  if (self->_timer)
  {
    if (self->_isIdle)
    {
      self->_isIdle = 0;
      -[BKUserEventTimer _queue_postNotification:](self, "_queue_postNotification:", kBKSHIDServicesUserEventPresent);
    }
  }
}

- (void)_queue_scheduleTimerWithTimeInterval:(double)a3
{
  id v5;
  NSObject *v6;
  id v7;
  OS_dispatch_queue *queue;
  BSTimer *v9;
  BSTimer *timer;
  _QWORD v11[6];
  uint8_t buf[16];

  BSDispatchQueueAssert(self->_queue, a2);
  -[BKUserEventTimer _queue_clearTimer](self, "_queue_clearTimer");
  if (BKSHIDServicesUserEventTimerIntervalForever == a3)
  {
    v5 = sub_100059A14();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disabling timer because scheduled interval exceeds 'forever' threshold", buf, 2u);
    }

  }
  else
  {
    v7 = objc_alloc((Class)BSTimer);
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004C318;
    v11[3] = &unk_1000ECB60;
    *(double *)&v11[5] = a3;
    v11[4] = self;
    v9 = (BSTimer *)objc_msgSend(v7, "initWithFireInterval:queue:handler:", queue, v11, a3);
    timer = self->_timer;
    self->_timer = v9;

    -[BSTimer schedule](self->_timer, "schedule");
  }
}

- (void)_queue_clearTimer
{
  BSTimer *timer;

  -[BSTimer cancel](self->_timer, "cancel");
  timer = self->_timer;
  self->_timer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (id)sharedInstance
{
  if (qword_100117370 != -1)
    dispatch_once(&qword_100117370, &stru_1000EAD28);
  return (id)qword_100117368;
}

@end
