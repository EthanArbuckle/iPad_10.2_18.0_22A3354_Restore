@implementation MSDDemoUpdateTimeKeeper

+ (id)sharedInstance
{
  if (qword_100175608 != -1)
    dispatch_once(&qword_100175608, &stru_10013FDD0);
  return (id)qword_100175600;
}

- (id)setCompletionTime:(int)a3 reserveTimeForCleanup:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int64_t v34;

  v4 = a4;
  -[MSDDemoUpdateTimeKeeper setCanceled:](self, "setCanceled:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper timer](self, "timer"));

  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AB8D0;
    block[3] = &unk_10013D868;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v8 = -[MSDDemoUpdateTimeKeeper setCompletionTimeForFatalError:](self, "setCompletionTimeForFatalError:", 0);
  if (a3 < 1)
  {
    -[MSDDemoUpdateTimeKeeper setDate:](self, "setDate:", 0);
LABEL_12:
    v22 = 0;
    return v22;
  }
  if (v4)
  {
    -[MSDDemoUpdateTimeKeeper setTimeIntervalReservedForCleanup:](self, "setTimeIntervalReservedForCleanup:", 1800);
    a3 -= 600;
  }
  else
  {
    -[MSDDemoUpdateTimeKeeper setTimeIntervalReservedForCleanup:](self, "setTimeIntervalReservedForCleanup:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)a3));
  -[MSDDemoUpdateTimeKeeper setDate:](self, "setDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11;
  v13 = (double)-[MSDDemoUpdateTimeKeeper timeIntervalReservedForCleanup](self, "timeIntervalReservedForCleanup");

  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12 > v13)
  {
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
      objc_msgSend(v17, "timeIntervalSinceNow");
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
      v21 = -[MSDDemoUpdateTimeKeeper timeIntervalReservedForCleanup](self, "timeIntervalReservedForCleanup");
      *(_DWORD *)buf = 134218498;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      v33 = 2048;
      v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The operation needs to complete in %lf seconds (or by %{public}@). Will indicate system to clean up %td second before that. If no clean up action is taken then the device will be forced to demo mode by then (if possible).", buf, 0x20u);

    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000AB95C;
    v27[3] = &unk_10013D868;
    v27[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v27);
    goto LABEL_12;
  }
  if (v16)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
    objc_msgSend(v24, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v30 = v23;
    v31 = 2048;
    v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Already time for clean up: %{public}@ (in %lf seconds)", buf, 0x16u);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741184, CFSTR("Cannot finish update within given time.")));
  return v22;
}

- (id)setCompletionTimeForFatalError:(int)a3
{
  void *v5;
  _QWORD v7[5];
  int v8;
  _QWORD block[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper timerForFatalError](self, "timerForFatalError"));

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ABAA4;
    block[3] = &unk_10013D868;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (a3 >= 1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000ABB30;
    v7[3] = &unk_10013E6F8;
    v8 = a3;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
  return 0;
}

- (void)canceledByUser
{
  id v3;

  -[MSDDemoUpdateTimeKeeper setCanceled:](self, "setCanceled:", 1);
  v3 = -[MSDDemoUpdateTimeKeeper setCompletionTimeForFatalError:](self, "setCompletionTimeForFatalError:", 0);
}

- (BOOL)shouldCleanUp:(id *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  uint64_t v11;
  const __CFString *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;
    v9 = (double)-[MSDDemoUpdateTimeKeeper timeIntervalReservedForCleanup](self, "timeIntervalReservedForCleanup");

    if (v8 <= v9)
    {
      v12 = CFSTR("Cannot finish update within given time.");
      v11 = 3727741184;
      goto LABEL_6;
    }
  }
  v10 = -[MSDDemoUpdateTimeKeeper canceled](self, "canceled");
  if (v10)
  {
    v11 = 3727741185;
    v12 = CFSTR("Operation canceled.");
LABEL_6:
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", v11, v12));
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (void)forceSwitchToDemoMode:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Time is up, has to force the device into demo mode.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  objc_msgSend(v5, "forceSwitchToDemoModeIfNeeded");

}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (int64_t)timeIntervalReservedForCleanup
{
  return self->_timeIntervalReservedForCleanup;
}

- (void)setTimeIntervalReservedForCleanup:(int64_t)a3
{
  self->_timeIntervalReservedForCleanup = a3;
}

- (NSTimer)timerForFatalError
{
  return self->_timerForFatalError;
}

- (void)setTimerForFatalError:(id)a3
{
  objc_storeStrong((id *)&self->_timerForFatalError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerForFatalError, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
