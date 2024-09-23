@implementation RMUserInteractionMonitorAttentionAwareness

- (RMUserInteractionMonitorAttentionAwareness)init
{
  RMUserInteractionMonitorAttentionAwareness *v2;
  void *v3;
  AWAttentionAwarenessClient *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  objc_super v15;
  id location[3];

  v15.receiver = self;
  v15.super_class = (Class)RMUserInteractionMonitorAttentionAwareness;
  v2 = -[RMUserInteractionMonitorAttentionAwareness init](&v15, "init");
  if (v2)
  {
    v3 = (void *)objc_opt_new(AWAttentionAwarenessConfiguration);
    objc_msgSend(v3, "setIdentifier:", CFSTR("com.apple.relatived"));
    objc_msgSend(v3, "setEventMask:", 4094);
    objc_msgSend(v3, "setAttentionLostTimeout:", 0.1);
    v4 = objc_opt_new(AWAttentionAwarenessClient);
    -[RMUserInteractionMonitorAttentionAwareness setAttentionAwarenessClient:](v2, "setAttentionAwarenessClient:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient](v2, "attentionAwarenessClient"));
    v14 = 0;
    v6 = objc_msgSend(v5, "setConfiguration:shouldReset:error:", v3, 0, &v14);
    v7 = v14;

    if (v6)
    {
      objc_initWeak(location, v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient](v2, "attentionAwarenessClient"));
      v9 = &_dispatch_main_q;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100003CE4;
      v12[3] = &unk_1000247D8;
      objc_copyWeak(&v13, location);
      objc_msgSend(v8, "setEventHandlerWithQueue:block:", &_dispatch_main_q, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    else
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024818);
      v10 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[RMUserInteractionMonitorAttentionAwareness] Error setting attention awareness config: %{public}@", (uint8_t *)location, 0xCu);
      }
      -[RMUserInteractionMonitorAttentionAwareness setAttentionAwarenessClient:](v2, "setAttentionAwarenessClient:", 0);
    }

  }
  return v2;
}

- (void)startUserInteractionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RMUserInteractionMonitorAttentionAwareness;
  -[RMUserInteractionMonitor startUserInteractionUpdatesToQueue:withHandler:](&v9, "startUserInteractionUpdatesToQueue:withHandler:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient](self, "attentionAwarenessClient"));

  if (v5)
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024818);
    v6 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitorAttentionAwareness] Starting user interaction monitoring", v8, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient](self, "attentionAwarenessClient"));
    objc_msgSend(v7, "resumeWithError:", 0);

  }
}

- (void)stopUserInteractionUpdates
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RMUserInteractionMonitorAttentionAwareness;
  -[RMUserInteractionMonitor stopUserInteractionUpdates](&v7, "stopUserInteractionUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient](self, "attentionAwarenessClient"));

  if (v3)
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024818);
    v4 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[RMUserInteractionMonitorAttentionAwareness] Stopping user interaction monitoring", v6, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient](self, "attentionAwarenessClient"));
    objc_msgSend(v5, "suspendWithError:", 0);

  }
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
}

@end
