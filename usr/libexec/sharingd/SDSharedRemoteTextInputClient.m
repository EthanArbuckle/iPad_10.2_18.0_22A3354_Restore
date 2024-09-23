@implementation SDSharedRemoteTextInputClient

+ (id)sharedClient
{
  if (qword_1007C6960 != -1)
    dispatch_once(&qword_1007C6960, &stru_100717738);
  return (id)qword_1007C6968;
}

- (SDSharedRemoteTextInputClient)init
{
  SDSharedRemoteTextInputClient *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDSharedRemoteTextInputClient;
  v2 = -[SDSharedRemoteTextInputClient init](&v7, "init");
  if (v2)
  {
    v3 = SFMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)_ensureStarted
{
  SFRemoteTextInputClient *v3;
  SFRemoteTextInputClient *rtiClient;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_rtiClient)
  {
    if (dword_1007B1CB8 <= 30
      && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
    {
      LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient _ensureStarted]", 30, "RTI client start\n");
    }
    v3 = (SFRemoteTextInputClient *)objc_alloc_init((Class)SFRemoteTextInputClient);
    rtiClient = self->_rtiClient;
    self->_rtiClient = v3;

    -[SFRemoteTextInputClient setDispatchQueue:](self->_rtiClient, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000F2F14;
    v7[3] = &unk_100715858;
    v7[4] = self;
    -[SFRemoteTextInputClient setEventHandler:](self->_rtiClient, "setEventHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F2F20;
    v6[3] = &unk_100717760;
    v6[4] = self;
    -[SFRemoteTextInputClient setTextInputDidBegin:](self->_rtiClient, "setTextInputDidBegin:", v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000F2F6C;
    v5[3] = &unk_100717760;
    v5[4] = self;
    -[SFRemoteTextInputClient setTextInputDidEnd:](self->_rtiClient, "setTextInputDidEnd:", v5);
    -[SFRemoteTextInputClient activate](self->_rtiClient, "activate");
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2FD4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSDictionary)currentPayload
{
  return (NSDictionary *)-[SFRemoteTextInputClient currentPayload](self->_rtiClient, "currentPayload");
}

- (void)invalidate
{
  SFRemoteTextInputClient *rtiClient;

  if (dword_1007B1CB8 <= 50 && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 50)))
    LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient invalidate]", 50, "Invalidate\n");
  -[SDSharedRemoteTextInputClient removeAllDelegates](self, "removeAllDelegates");
  -[SDSharedRemoteTextInputClient _stopClock:](self, "_stopClock:", 3);
  if (self->_rtiClient)
  {
    if (dword_1007B1CB8 <= 30
      && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
    {
      LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient invalidate]", 30, "RTI client stop\n");
    }
    -[SFRemoteTextInputClient invalidate](self->_rtiClient, "invalidate");
    rtiClient = self->_rtiClient;
    self->_rtiClient = 0;

  }
}

- (void)addDelegate:(id)a3
{
  NSMutableSet *delegates;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  if (dword_1007B1CB8 <= 30 && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
    LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient addDelegate:]", 30, "Adding delegate: %{ptr}\n", v7);
  delegates = self->_delegates;
  if (!delegates)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }
  -[NSMutableSet addObject:](delegates, "addObject:", v7);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_1007B1CB8 <= 30)
  {
    if (dword_1007B1CB8 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B1CB8, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient removeDelegate:]", 30, "Removing delegate: %{ptr}\n", v4);
      v4 = v6;
    }
  }
  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v4);

}

- (void)removeAllDelegates
{
  NSMutableSet *delegates;

  -[NSMutableSet removeAllObjects](self->_delegates, "removeAllObjects");
  delegates = self->_delegates;
  self->_delegates = 0;

}

- (void)handleTextInputData:(id)a3
{
  -[SFRemoteTextInputClient handleTextInputData:](self->_rtiClient, "handleTextInputData:", a3);
}

- (void)handleUsername:(id)a3 password:(id)a4
{
  -[SFRemoteTextInputClient handleUsername:password:](self->_rtiClient, "handleUsername:password:", a3, a4);
}

- (void)_rtiHandleEventWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableSet *delegates;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (dword_1007B1CB8 <= 30 && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
  {
    v5 = SFTextInputDataLogString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient _rtiHandleEventWithData:]", 30, "RTI: event with data (%@)\n", v6);

  }
  delegates = self->_delegates;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F335C;
  v9[3] = &unk_100717788;
  v10 = v4;
  v8 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);

}

- (void)_rtiHandleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v6;
  NSMutableSet *delegates;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  if (dword_1007B1CB8 <= 30 && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
    LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient _rtiHandleInputDidBeginWithFlags:sessionInfo:]", 30, "RTI: input did begin with flags: %d", a3);
  -[SDSharedRemoteTextInputClient _startClockWithResetIfNeeded](self, "_startClockWithResetIfNeeded");
  delegates = self->_delegates;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F3490;
  v9[3] = &unk_1007177B0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);

}

- (void)_rtiHandleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v6;
  NSMutableSet *delegates;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  if (dword_1007B1CB8 <= 30 && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
    LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient _rtiHandleInputDidEndWithFlags:sessionInfo:]", 30, "RTI: input did end with flags: %d", a3);
  -[SDSharedRemoteTextInputClient _stopClock:](self, "_stopClock:", 2);
  delegates = self->_delegates;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F35C8;
  v9[3] = &unk_1007177B0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);

}

- (void)_logEvent:(unint64_t)a3 stopClock:(BOOL)a4
{
  NSDate *sessionClock;
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  const __CFString *v12;
  NSDate *v13;
  OS_dispatch_source *overrunTimer;
  OS_dispatch_source *v15;
  NSObject *v16;

  sessionClock = self->_sessionClock;
  if (sessionClock)
  {
    v6 = a4;
    -[NSDate timeIntervalSinceNow](sessionClock, "timeIntervalSinceNow");
    v9 = v8;
    -[NSDate timeIntervalSinceNow](self->_sessionClock, "timeIntervalSinceNow");
    v11 = v9 >= 0.0 ? v10 : -v10;
    if (v6)
    {
      if (dword_1007B1CB8 <= 30
        && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
      {
        if (a3 > 5)
          v12 = CFSTR("?");
        else
          v12 = off_1007177D0[a3];
        LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient _logEvent:stopClock:]", 30, "Stopping session clock: %ld ms, event: %@\n", (uint64_t)(v11 * 1000.0), v12);
      }
      v13 = self->_sessionClock;
      self->_sessionClock = 0;

      overrunTimer = self->_overrunTimer;
      if (overrunTimer)
      {
        v16 = overrunTimer;
        dispatch_source_cancel(v16);
        v15 = self->_overrunTimer;
        self->_overrunTimer = 0;

      }
    }
  }
}

- (void)_startClockWithResetIfNeeded
{
  NSDate *v3;
  NSDate *sessionClock;
  OS_dispatch_source *overrunTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD handler[5];

  if (self->_sessionClock)
    -[SDSharedRemoteTextInputClient _stopClock:](self, "_stopClock:", 4);
  if (dword_1007B1CB8 <= 30 && (dword_1007B1CB8 != -1 || _LogCategory_Initialize(&dword_1007B1CB8, 30)))
    LogPrintF(&dword_1007B1CB8, "-[SDSharedRemoteTextInputClient _startClockWithResetIfNeeded]", 30, "Starting session clock\n");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  sessionClock = self->_sessionClock;
  self->_sessionClock = v3;

  overrunTimer = self->_overrunTimer;
  if (overrunTimer)
  {
    v6 = overrunTimer;
    dispatch_source_cancel(v6);
    v7 = self->_overrunTimer;
    self->_overrunTimer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v9 = self->_overrunTimer;
  self->_overrunTimer = v8;

  v10 = self->_overrunTimer;
  v11 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
  v12 = self->_overrunTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000F38A4;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_overrunTimer);
}

- (void)_stopClock:(unint64_t)a3
{
  -[SDSharedRemoteTextInputClient _logEvent:stopClock:](self, "_logEvent:stopClock:", a3, 1);
}

- (id)_updatedSessionInfoWithAppIcon:(id)a3
{
  return a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionClock, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_storeStrong((id *)&self->_overrunTimer, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
