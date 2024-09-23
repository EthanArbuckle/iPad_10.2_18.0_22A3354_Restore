@implementation STUPostAggressiveUserNotificationOperation

- (STUPostAggressiveUserNotificationOperation)initWithTimerPrimitives:(id)a3 lockScreenPrimitives:(id)a4 userNotificationPoster:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUPostAggressiveUserNotificationOperation *v12;
  STUPostAggressiveUserNotificationOperation *v13;
  id v14;
  id userNotificationPoster;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STUPostAggressiveUserNotificationOperation;
  v12 = -[STUPostAggressiveUserNotificationOperation init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timerPrimitives, a3);
    objc_storeStrong((id *)&v13->_lockScreenPrimitives, a4);
    v14 = objc_retainBlock(v11);
    userNotificationPoster = v13->_userNotificationPoster;
    v13->_userNotificationPoster = v14;

  }
  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUPostAggressiveUserNotificationOperation;
  -[STUPostAggressiveUserNotificationOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D508;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)main
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D5C8;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)operationWillFinish
{
  void *v3;
  void *v4;
  id v5;

  -[STUPostAggressiveUserNotificationOperation setUserNotificationPoster:](self, "setUserNotificationPoster:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation redeliveryDelayTimer](self, "redeliveryDelayTimer"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation userNotification](self, "userNotification"));
  objc_msgSend(v4, "cancel");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation lockScreenStateSubscription](self, "lockScreenStateSubscription"));
  objc_msgSend(v5, "cancel");

}

- (void)beginObservingLockState
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  _QWORD v8[5];
  id v9[2];
  id location;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 90, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (-[STUPostAggressiveUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation lockScreenPrimitives](self, "lockScreenPrimitives"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001D790;
    v8[3] = &unk_1000CA0A0;
    v9[1] = (id)a2;
    v8[4] = self;
    objc_copyWeak(v9, &location);
    objc_msgSend(v4, "lockStateStatusProviderWithCompletion:", v8);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)postInitialUserNotification
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 116, CFSTR("%@ must be called from the main thread"), v12);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation lockStateStatusProvider](self, "lockStateStatusProvider"));

  if (!v4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 117, CFSTR("Should be observing the lock screen before posting the initial notification"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation userNotificationPoster](self, "userNotificationPoster"));

  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 118, CFSTR("Should be have a notification poster before posting the initial notification"));

  }
  if (-[STUPostAggressiveUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation lockStateStatusProvider](self, "lockStateStatusProvider"));
    -[STUPostAggressiveUserNotificationOperation setPostedOnLockedScreen:](self, "setPostedOnLockedScreen:", objc_msgSend(v6, "isLocked"));

    v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation userNotificationPoster](self, "userNotificationPoster"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001DB54;
    v15[3] = &unk_1000CA0F0;
    objc_copyWeak(&v16, &location);
    v8 = ((uint64_t (**)(_QWORD, _QWORD *))v7)[2](v7, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[STUPostAggressiveUserNotificationOperation setUserNotification:](self, "setUserNotification:", v9);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)userNotificationDidFinishWithResult:(int64_t)a3
{
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 134, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (-[STUPostAggressiveUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[STUPostAggressiveUserNotificationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v9);

  }
}

- (void)evaluateLockScreenState
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26[2];
  id location;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v21 = NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 146, CFSTR("%@ must be called from the main thread"), v22);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation lockStateStatusProvider](self, "lockStateStatusProvider"));

  if (!v4)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 147, CFSTR("Should be observing the lock screen before evaluating lock state conditions"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation lockStateStatusProvider](self, "lockStateStatusProvider"));
  v6 = objc_msgSend(v5, "isLocked");

  if (-[STUPostAggressiveUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation userNotification](self, "userNotification"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = -[STUPostAggressiveUserNotificationOperation isPostedOnLockedScreen](self, "isPostedOnLockedScreen");

      if ((_DWORD)v6 != v9)
      {
        -[STUPostAggressiveUserNotificationOperation setPostedOnLockedScreen:](self, "setPostedOnLockedScreen:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation redeliveryDelayTimer](self, "redeliveryDelayTimer"));
        objc_msgSend(v10, "cancel");

        -[STUPostAggressiveUserNotificationOperation setLockScreenEvaluationCounter:](self, "setLockScreenEvaluationCounter:", (char *)-[STUPostAggressiveUserNotificationOperation lockScreenEvaluationCounter](self, "lockScreenEvaluationCounter")+ 1);
        if ((v6 & 1) == 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation userNotification](self, "userNotification"));
          v12 = -[STUPostAggressiveUserNotificationOperation lockScreenEvaluationCounter](self, "lockScreenEvaluationCounter");
          objc_initWeak(&location, self);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostAggressiveUserNotificationOperation timerPrimitives](self, "timerPrimitives"));
          v14 = objc_msgSend((id)objc_opt_class(self), "redeliverDelayTimerIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          objc_msgSend((id)objc_opt_class(self), "redeliveryDelay");
          v17 = v16;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10001DFAC;
          v24[3] = &unk_1000CA118;
          objc_copyWeak(v26, &location);
          v26[1] = v12;
          v18 = v11;
          v25 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheduleTimerWithIdentifier:timeInterval:fireHandler:", v15, v24, v17));
          -[STUPostAggressiveUserNotificationOperation setRedeliveryDelayTimer:](self, "setRedeliveryDelayTimer:", v19);

          objc_destroyWeak(v26);
          objc_destroyWeak(&location);

        }
      }
    }
  }
}

+ (id)redeliverDelayTimerIdentifier
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class(a1);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-redeliveryDelayTimer"), v4));

  return v5;
}

+ (double)redeliveryDelay
{
  return 1.5;
}

- (id)userNotificationPoster
{
  return self->_userNotificationPoster;
}

- (void)setUserNotificationPoster:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (STULockScreenPrimitives)lockScreenPrimitives
{
  return self->_lockScreenPrimitives;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (STULockStateStatusProviding)lockStateStatusProvider
{
  return self->_lockStateStatusProvider;
}

- (void)setLockStateStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateStatusProvider, a3);
}

- (CRKCancelable)lockScreenStateSubscription
{
  return self->_lockScreenStateSubscription;
}

- (void)setLockScreenStateSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenStateSubscription, a3);
}

- (BOOL)isPostedOnLockedScreen
{
  return self->_postedOnLockedScreen;
}

- (void)setPostedOnLockedScreen:(BOOL)a3
{
  self->_postedOnLockedScreen = a3;
}

- (STUUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(id)a3
{
  objc_storeStrong((id *)&self->_userNotification, a3);
}

- (CRKCancelable)redeliveryDelayTimer
{
  return self->_redeliveryDelayTimer;
}

- (void)setRedeliveryDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_redeliveryDelayTimer, a3);
}

- (unint64_t)lockScreenEvaluationCounter
{
  return self->_lockScreenEvaluationCounter;
}

- (void)setLockScreenEvaluationCounter:(unint64_t)a3
{
  self->_lockScreenEvaluationCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeliveryDelayTimer, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_lockScreenStateSubscription, 0);
  objc_storeStrong((id *)&self->_lockStateStatusProvider, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
  objc_storeStrong((id *)&self->_lockScreenPrimitives, 0);
  objc_storeStrong(&self->_userNotificationPoster, 0);
}

@end
