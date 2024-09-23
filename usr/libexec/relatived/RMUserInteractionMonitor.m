@implementation RMUserInteractionMonitor

+ (id)userInteractionMonitor
{
  return objc_opt_new(RMUserInteractionMonitorAttentionAwareness);
}

- (void)startUserInteractionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024E28);
  v8 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitor] Starting user interaction monitoring", v9, 2u);
  }
  -[RMUserInteractionMonitor setQueue:](self, "setQueue:", v6);
  -[RMUserInteractionMonitor setHandler:](self, "setHandler:", v7);

}

- (void)stopUserInteractionUpdates
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024E28);
  v2 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitor] Stopping user interaction monitoring", v3, 2u);
  }
}

- (void)sendUserInteractionUpdate
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitor queue](self, "queue"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitor handler](self, "handler"));

    if (v5)
    {
      v6 = sub_10000DC34();
      -[RMUserInteractionMonitor lastUserInteractionUpdateTimestamp](self, "lastUserInteractionUpdateTimestamp");
      if (v6 - v7 >= 0.5)
      {
        -[RMUserInteractionMonitor setLastUserInteractionUpdateTimestamp:](self, "setLastUserInteractionUpdateTimestamp:", v6);
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100024E28);
        v8 = qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitor] Sending user interaction update", buf, 2u);
        }
        v9 = objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitor queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000E3D8;
        block[3] = &unk_100024900;
        block[4] = self;
        dispatch_async(v9, block);

      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)lastUserInteractionUpdateTimestamp
{
  return self->_lastUserInteractionUpdateTimestamp;
}

- (void)setLastUserInteractionUpdateTimestamp:(double)a3
{
  self->_lastUserInteractionUpdateTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
