@implementation ASPCarryLog_XpcActivityMgr

- (ASPCarryLog_XpcActivityMgr)initWithXpcActivity:(id)a3
{
  id v5;
  ASPCarryLog_XpcActivityMgr *v6;
  ASPCarryLog_XpcActivityMgr *v7;
  ASPCarryLog_XpcActivityMgr *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASPCarryLog_XpcActivityMgr;
  v6 = -[ASPCarryLog_XpcActivityMgr init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcActivity, a3);
    v7->_isActivityDeferred = 0;
    v8 = v7;
  }

  return v7;
}

- (BOOL)shouldDeferXpcActivity
{
  _xpc_activity_s *v2;
  BOOL should_defer;

  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_XpcActivityMgr xpcActivity](self, "xpcActivity"));
  should_defer = xpc_activity_should_defer(v2);

  return should_defer;
}

- (BOOL)tryDeferXpcActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  _xpc_activity_s *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;

  if (-[ASPCarryLog_XpcActivityMgr isActivityDeferred](self, "isActivityDeferred"))
  {
    v3 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG))
      sub_100041910(v3);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_XpcActivityMgr xpcActivity](self, "xpcActivity"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[ASPCarryLog_XpcActivityMgr shouldDeferXpcActivity](self, "shouldDeferXpcActivity");

      if (v6)
      {
        -[ASPCarryLog_XpcActivityMgr setIsActivityDeferred:](self, "setIsActivityDeferred:", 1);
        v7 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_XpcActivityMgr xpcActivity](self, "xpcActivity"));
        v8 = xpc_activity_set_state(v7, 3);

        v9 = (void *)oslog;
        v10 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
        if (v8)
        {
          if (v10)
            sub_100041998(v9);
        }
        else if (v10)
        {
          sub_100041A20(v9);
        }
      }
    }
  }
  return -[ASPCarryLog_XpcActivityMgr isActivityDeferred](self, "isActivityDeferred");
}

- (void)forceDeferXpcActivity
{
  void *v3;
  _xpc_activity_s *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  -[ASPCarryLog_XpcActivityMgr setIsActivityDeferred:](self, "setIsActivityDeferred:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_XpcActivityMgr xpcActivity](self, "xpcActivity"));

  if (v3)
  {
    v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_XpcActivityMgr xpcActivity](self, "xpcActivity"));
    v5 = xpc_activity_set_state(v4, 3);

    v6 = (void *)oslog;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_XpcActivityMgr xpcActivity](self, "xpcActivity"));
        v9 = 134217984;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "xpc_activity %p force deferred!", (uint8_t *)&v9, 0xCu);

      }
    }
    else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100041AA8(v6);
    }
  }
}

- (BOOL)isActivityDeferred
{
  return self->_isActivityDeferred;
}

- (void)setIsActivityDeferred:(BOOL)a3
{
  self->_isActivityDeferred = a3;
}

- (OS_xpc_object)xpcActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

@end
