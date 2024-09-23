@implementation NanoRoutePlanningState

+ (int64_t)requiredInitialStateForRequest:(id)a3
{
  return 1;
}

+ (BOOL)controlsDiskRouteStorage
{
  return 1;
}

- (NanoRoutePlanningState)initWithStateManager:(id)a3 isolationQueue:(id)a4
{
  id v6;
  id v7;
  NanoRoutePlanningState *v8;
  NanoRoutePlanningState *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NanoRoutePlanningState;
  v8 = -[NanoRoutePlanningState init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    v9->_sessionState = -1;
    objc_storeStrong((id *)&v9->_isolationQueue, a4);
  }

  return v9;
}

- (void)enterToState:(int64_t)a3 fromState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  double v10;
  NSObject *isolationQueue;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;

  self->_sessionState = a3;
  self->_previousState = a4;
  v6 = sub_10043214C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = sub_1008EFC08(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Entering '%@' state", buf, 0xCu);

  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_timestampStarted = v10;
  isolationQueue = self->_isolationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100897E68;
  v12[3] = &unk_1011AD518;
  v12[4] = self;
  v12[5] = a3;
  dispatch_async(isolationQueue, v12);
}

- (void)leaveToState:(int64_t)a3
{
  unint64_t v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *isolationQueue;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  double v17;

  v5 = -[NanoRoutePlanningState sessionState](self, "sessionState");
  self->_nextState = a3;
  v6 = sub_10043214C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = sub_1008EFC08(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v11 = v10 - self->_timestampStarted;
    *(_DWORD *)buf = 138412546;
    v15 = v9;
    v16 = 2048;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Leaving '%@' state (active for %#.5lfs)", buf, 0x16u);

  }
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100898060;
  v13[3] = &unk_1011AD518;
  v13[4] = self;
  v13[5] = v5;
  dispatch_async(isolationQueue, v13);
}

- (void)stop
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (self->_sessionState == 4 && objc_msgSend((id)objc_opt_class(self), "controlsDiskRouteStorage"))
  {
    v2 = sub_10043214C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will clear disk route storage", v4, 2u);
    }

    +[NanoRoutePlanningResponse clearDiskRouteStorage](NanoRoutePlanningResponse, "clearDiskRouteStorage");
  }
}

- (void)setActive:(BOOL)a3
{
  NSObject *isolationQueue;
  _QWORD v4[5];
  BOOL v5;

  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10089820C;
  v4[3] = &unk_1011ACE58;
  v4[4] = self;
  v5 = a3;
  dispatch_async(isolationQueue, v4);
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NanoRoutePlanningStateManager)manager
{
  return (NanoRoutePlanningStateManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
