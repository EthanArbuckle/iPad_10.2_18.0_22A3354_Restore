@implementation STUSuspendableTimer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)STUSuspendableTimer;
  -[STUSuspendableTimer dealloc](&v4, "dealloc");
}

- (STUSuspendableTimer)initWithTimerPrimitives:(id)a3 dateProvider:(id)a4 timeout:(double)a5 timeoutHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  STUSuspendableTimer *v14;
  STUSuspendableTimer *v15;
  id v16;
  id timeoutHandler;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)STUSuspendableTimer;
  v14 = -[STUSuspendableTimer init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_timerPrimitives, a3);
    objc_storeStrong((id *)&v15->_dateProvider, a4);
    v15->_timeout = a5;
    v16 = objc_retainBlock(v13);
    timeoutHandler = v15->_timeoutHandler;
    v15->_timeoutHandler = v16;

  }
  return v15;
}

- (void)updateWithTimeout:(double)a3
{
  double v6;
  void *v7;
  NSString *v8;
  void *v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSuspendableTimer.m"), 57, CFSTR("%@ must be called from the main thread"), v9);

  }
  -[STUSuspendableTimer timeout](self, "timeout");
  if (v6 != a3 && !-[STUSuspendableTimer isCanceled](self, "isCanceled"))
  {
    -[STUSuspendableTimer suspend](self, "suspend");
    -[STUSuspendableTimer setTimeout:](self, "setTimeout:", a3);
    -[STUSuspendableTimer resume](self, "resume");
  }
}

- (void)resume
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSuspendableTimer.m"), 73, CFSTR("%@ must be called from the main thread"), v16);

  }
  if (-[STUSuspendableTimer isSuspended](self, "isSuspended") && !-[STUSuspendableTimer isCanceled](self, "isCanceled"))
  {
    objc_initWeak(&location, self);
    -[STUSuspendableTimer timeout](self, "timeout");
    v5 = v4;
    -[STUSuspendableTimer consumedTime](self, "consumedTime");
    v7 = v5 - v6;
    if (v7 <= 0.0)
    {
      -[STUSuspendableTimer fireTimeout](self, "fireTimeout");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer dateProvider](self, "dateProvider"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDate"));
      -[STUSuspendableTimer setTimeoutTimerStartDate:](self, "setTimeoutTimerStartDate:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timerPrimitives](self, "timerPrimitives"));
      v11 = objc_msgSend((id)objc_opt_class(self), "timerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100063E0C;
      v17[3] = &unk_1000C9F38;
      objc_copyWeak(&v18, &location);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scheduleTimerWithIdentifier:timeInterval:fireHandler:", v12, v17, v7));
      -[STUSuspendableTimer setTimeoutTimer:](self, "setTimeoutTimer:", v13);

      objc_destroyWeak(&v18);
    }
    objc_destroyWeak(&location);
  }
}

- (void)suspend
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSuspendableTimer.m"), 94, CFSTR("%@ must be called from the main thread"), v12);

  }
  if (!-[STUSuspendableTimer isSuspended](self, "isSuspended")
    && !-[STUSuspendableTimer isCanceled](self, "isCanceled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer dateProvider](self, "dateProvider"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDate"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutTimerStartDate](self, "timeoutTimerStartDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v6, "cancel");

    -[STUSuspendableTimer setTimeoutTimer:](self, "setTimeoutTimer:", 0);
    -[STUSuspendableTimer setTimeoutTimerStartDate:](self, "setTimeoutTimerStartDate:", 0);
    if (!v5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSuspendableTimer.m"), 107, CFSTR("Should have stored the date we started the timeout timer"));

    }
    objc_msgSend(v14, "timeIntervalSinceDate:", v5);
    v8 = v7;
    -[STUSuspendableTimer consumedTime](self, "consumedTime");
    -[STUSuspendableTimer setConsumedTime:](self, "setConsumedTime:", v8 + v9);

  }
}

- (void)cancel
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSuspendableTimer.m"), 114, CFSTR("%@ must be called from the main thread"), v7);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v4, "cancel");

  -[STUSuspendableTimer setTimeoutHandler:](self, "setTimeoutHandler:", 0);
}

- (void)fireTimeout
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void (**v8)(void);

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSuspendableTimer.m"), 123, CFSTR("%@ must be called from the main thread"), v7);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutHandler](self, "timeoutHandler"));

  if (v4)
  {
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutHandler](self, "timeoutHandler"));
    -[STUSuspendableTimer setTimeoutHandler:](self, "setTimeoutHandler:", 0);
    v8[2]();

  }
}

- (BOOL)isSuspended
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutTimer](self, "timeoutTimer"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isCanceled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSuspendableTimer timeoutHandler](self, "timeoutHandler"));
  v3 = v2 == 0;

  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[STUSuspendableTimer isSuspended](self, "isSuspended");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  -[STUSuspendableTimer consumedTime](self, "consumedTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[STUSuspendableTimer timeout](self, "timeout");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> { isSuspended = %@, consumedTimed = %@, timeout = %@}"), v5, self, v8, v9, v10));

  return v11;
}

+ (id)timerIdentifier
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-TimeoutTimer"), v3));

  return v4;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (STUDateProviderProtocol)dateProvider
{
  return self->_dateProvider;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (CRKCancelable)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSDate)timeoutTimerStartDate
{
  return self->_timeoutTimerStartDate;
}

- (void)setTimeoutTimerStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimerStartDate, a3);
}

- (double)consumedTime
{
  return self->_consumedTime;
}

- (void)setConsumedTime:(double)a3
{
  self->_consumedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimerStartDate, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
}

@end
