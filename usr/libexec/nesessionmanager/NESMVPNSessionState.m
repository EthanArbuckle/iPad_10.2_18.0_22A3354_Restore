@implementation NESMVPNSessionState

- (NESMVPNSessionState)initWithType:(int64_t)a3 andTimeout:(unint64_t)a4
{
  NESMVPNSessionState *v6;
  NESMVPNSessionState *v7;
  NESMVPNSession *session;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSessionState;
  v6 = -[NESMVPNSessionState init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    session = v6->_session;
    v6->_type = a3;
    v6->_session = 0;
    v6->_timeout = a4;

  }
  return v7;
}

- (void)enterWithSession:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  unint64_t timeout;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  SEL v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;

  v4 = a3;
  v6 = v4;
  if (self)
  {
    objc_setProperty_atomic(self, v5, v4, 16);
    if (self->_timeout)
    {
      v7 = ne_log_obj(v4, v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class(self);
        v10 = NSStringFromClass(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        timeout = self->_timeout;
        *(_DWORD *)buf = 138412802;
        v26 = v6;
        v27 = 2112;
        v28 = v11;
        v29 = 2048;
        v30 = timeout;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Entering state %@, timeout %llu seconds", buf, 0x20u);

      }
LABEL_9:
      if (self->_timeout && (objc_opt_respondsToSelector(self, "handleTimeout") & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));
        v19 = self->_timeout;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100067D70;
        v23[3] = &unk_1000BEB58;
        v23[4] = self;
        v24 = v6;
        v20 = NECreateTimerSource(v18, v19, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_setProperty_atomic(self, v22, v21, 32);

      }
      goto LABEL_12;
    }
  }
  v13 = ne_log_obj(v4, v5);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class(self);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Entering state %@", buf, 0x16u);

  }
  if (self)
    goto LABEL_9;
LABEL_12:

}

- (void)leave
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  SEL v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v14 = 138412546;
    v15 = Property;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Leaving state %@", (uint8_t *)&v14, 0x16u);

  }
  if (self)
  {
    if (objc_getProperty(self, v10, 32, 1))
    {
      v12 = objc_getProperty(self, v11, 32, 1);
      dispatch_source_cancel(v12);
      objc_setProperty_atomic(self, v13, 0, 32);
    }
    objc_setProperty_atomic(self, v11, 0, 16);
  }
}

- (void)handleStartMessage:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  id Property;
  objc_class *v8;
  NSString *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v4 = ne_log_obj(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v6, 16, 1);
    else
      Property = 0;
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412546;
    v12 = Property;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received start message", (uint8_t *)&v11, 0x16u);

  }
}

- (void)handleEstablishIPC
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  _BYTE *v16;
  char v17;
  const char *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v20 = 138412546;
    v21 = Property;
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received establish IPC message", (uint8_t *)&v20, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryTunnelPlugin"));
  if (v12)
  {
    v14 = (void *)v12;
    if (self)
      v15 = objc_getProperty(self, v13, 16, 1);
    else
      v15 = 0;
    v16 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryTunnelPlugin"));
    if (v16)
    {
      v17 = v16[16];

      if ((v17 & 1) == 0)
        return;
      if (self)
        v19 = objc_getProperty(self, v18, 16, 1);
      else
        v19 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "primaryTunnelPlugin"));
      sub_10001780C(v14);
    }

  }
}

- (void)handleEstablishIPCReplySent
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412546;
    v11 = Property;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: sent establish IPC reply", (uint8_t *)&v10, 0x16u);

  }
}

- (void)handleStop
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12 = 138412546;
    v13 = Property;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v12, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "setState:", 5);
}

- (void)handleInterfaceUnavailable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = Property;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: interface %@ is now unavailable", (uint8_t *)&v13, 0x20u);

  }
}

- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  id Property;
  objc_class *v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const char *v24;

  v4 = a4;
  v6 = a3;
  v8 = ne_log_obj(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v10, 16, 1);
    else
      Property = 0;
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)v14;
    v16 = "did not change";
    v17 = 138413058;
    v18 = Property;
    v19 = 2112;
    if (v4)
      v16 = "changed";
    v20 = v14;
    v21 = 2112;
    v22 = v6;
    v23 = 2080;
    v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: interface %@ is now available, address %s", (uint8_t *)&v17, 0x2Au);

  }
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  id Property;
  objc_class *v15;
  NSString *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a5;
  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v13, 16, 1);
    else
      Property = 0;
    v15 = (objc_class *)objc_opt_class(self);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 138413314;
    v19 = Property;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v8;
    v24 = 1024;
    v25 = a4;
    v26 = 2112;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ started with PID %d error %@", (uint8_t *)&v18, 0x30u);

  }
}

- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  id Property;
  objc_class *v13;
  NSString *v14;
  void *v15;
  const char *v16;
  const char *v17;
  id v18;
  id v19;
  const char *v20;
  id v21;
  id v22;
  unsigned __int8 v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v9 = ne_log_obj(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v11, 16, 1);
    else
      Property = 0;
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v24 = 138413058;
    v25 = Property;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v6;
    v30 = 2048;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ attached IPC with endpoint %p", (uint8_t *)&v24, 0x2Au);

  }
  if (self)
  {
    if (!objc_msgSend(objc_getProperty(self, v16, 16, 1), "establishIPCPending"))
      goto LABEL_16;
    v18 = objc_getProperty(self, v17, 16, 1);
  }
  else
  {
    v23 = objc_msgSend(0, "establishIPCPending");
    v18 = 0;
    if ((v23 & 1) == 0)
      goto LABEL_16;
  }
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "primaryTunnelPlugin"));

  if (v19 == v6)
  {
    if (v7)
    {
      if (self)
        v21 = objc_getProperty(self, v20, 16, 1);
      else
        v21 = 0;
      objc_msgSend(v21, "setEndpointInEstablishIPCReply:forPlugin:", v7, v6);
    }
    else
    {
      if (self)
        v22 = objc_getProperty(self, v20, 16, 1);
      else
        v22 = 0;
      objc_msgSend(v22, "sendEstablishIPCReply");
    }
  }
LABEL_16:

}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  id Property;
  objc_class *v12;
  NSString *v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  id v22;
  const char *v23;
  id v24;
  id v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = ne_log_obj(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v10, 16, 1);
    else
      Property = 0;
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v26 = 138413058;
    v27 = Property;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v6;
    v32 = 2080;
    v33 = ne_session_stop_reason_to_string(v4);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ disconnected with reason %s", (uint8_t *)&v26, 0x2Au);

  }
  if (self)
    v16 = objc_getProperty(self, v15, 16, 1);
  else
    v16 = 0;
  v17 = objc_msgSend(v16, "setLastStopReason:", v4);
  if ((_DWORD)v4 == 6)
  {
    v19 = ne_log_obj(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        v22 = objc_getProperty(self, v21, 16, 1);
      else
        v22 = 0;
      v26 = 138412290;
      v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ re-setting on demand configuration because the plugin was disabled", (uint8_t *)&v26, 0xCu);
    }

    if (self)
      v24 = objc_getProperty(self, v23, 16, 1);
    else
      v24 = 0;
    sub_10007B40C((uint64_t)v24, 1);
  }
  if (self)
    v25 = objc_getProperty(self, v18, 16, 1);
  else
    v25 = 0;
  objc_msgSend(v25, "setState:", 5);

}

- (void)handlePluginStatusDidChangeToContacting:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = Property;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to contacting", (uint8_t *)&v13, 0x20u);

  }
}

- (void)handlePluginStatusDidChangeToAuthenticating:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = Property;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to authenticating", (uint8_t *)&v13, 0x20u);

  }
}

- (void)handlePluginStatusDidChangeToNegotiating:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = Property;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to negotiating", (uint8_t *)&v13, 0x20u);

  }
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  const char *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v15 = 138412802;
    v16 = Property;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to connected", (uint8_t *)&v15, 0x20u);

  }
  if (self)
    v14 = objc_getProperty(self, v13, 16, 1);
  else
    v14 = 0;
  objc_msgSend(v14, "setReassertedByPlugin:", 0);

}

- (void)handlePluginStatusDidChangeToReasserting:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  const char *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v15 = 138412802;
    v16 = Property;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to reasserting", (uint8_t *)&v15, 0x20u);

  }
  if (self)
    v14 = objc_getProperty(self, v13, 16, 1);
  else
    v14 = 0;
  objc_msgSend(v14, "setReassertedByPlugin:", 1);

}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  id Property;
  objc_class *v12;
  NSString *v13;
  void *v14;
  const char *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = ne_log_obj(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v10, 16, 1);
    else
      Property = 0;
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v17 = 138413058;
    v18 = Property;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v6;
    v23 = 2080;
    v24 = ne_session_stop_reason_to_string(v4);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to disconnecting with reason %s", (uint8_t *)&v17, 0x2Au);

  }
  if (self)
    v16 = objc_getProperty(self, v15, 16, 1);
  else
    v16 = 0;
  objc_msgSend(v16, "setState:", 5);

}

- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id Property;
  objc_class *v18;
  NSString *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v14 = ne_log_obj(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v16, 16, 1);
    else
      Property = 0;
    v18 = (objc_class *)objc_opt_class(self);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = 138413570;
    v22 = Property;
    v23 = 2112;
    v24 = v20;
    v25 = 2112;
    v26 = v10;
    v27 = 2048;
    v28 = v11;
    v29 = 1024;
    v30 = a5;
    v31 = 2112;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ authentication is complete with results %p, status %d, error %@", (uint8_t *)&v21, 0x3Au);

  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  const char *v13;
  const char *v14;
  id v15;
  unsigned __int8 v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v17 = 138412802;
    v18 = Property;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ dispose complete", (uint8_t *)&v17, 0x20u);

  }
  if (!self)
  {
    v16 = objc_msgSend(0, "establishIPCPending");
    v15 = 0;
    if ((v16 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (objc_msgSend(objc_getProperty(self, v13, 16, 1), "establishIPCPending"))
  {
    v15 = objc_getProperty(self, v14, 16, 1);
LABEL_8:
    objc_msgSend(v15, "sendEstablishIPCReply");
  }
LABEL_9:

}

- (void)handlePluginDidDetachIPC:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  const char *v13;
  const char *v14;
  id v15;
  unsigned __int8 v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v17 = 138412802;
    v18 = Property;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ did detach from IPC", (uint8_t *)&v17, 0x20u);

  }
  if (!self)
  {
    v16 = objc_msgSend(0, "establishIPCPending");
    v15 = 0;
    if ((v16 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (objc_msgSend(objc_getProperty(self, v13, 16, 1), "establishIPCPending"))
  {
    v15 = objc_getProperty(self, v14, 16, 1);
LABEL_8:
    objc_msgSend(v15, "sendEstablishIPCReply");
  }
LABEL_9:

}

- (BOOL)handleSleep
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  unsigned int *v16;
  unsigned int v17;
  id v18;
  void *v19;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  int v27;
  id v28;
  __int16 v29;
  void *v30;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v27 = 138412546;
    v28 = Property;
    v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ in state %@: received sleep event", (uint8_t *)&v27, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryTunnelPlugin"));
  if (v12
    && ((v14 = (void *)v12, !self) ? (v15 = 0) : (v15 = objc_getProperty(self, v13, 16, 1)),
        v16 = (unsigned int *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryTunnelPlugin")),
        v17 = sub_10001755C(v16),
        v16,
        v14,
        v17))
  {
    if (self)
      v18 = objc_getProperty(self, v13, 16, 1);
    else
      v18 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "primaryTunnelPlugin"));
    sub_100017240(v19);
  }
  else
  {
    if (self)
      v20 = objc_getProperty(self, v13, 16, 1);
    else
      v20 = 0;
    if (objc_msgSend(v20, "parentType") == (id)2)
    {
      if (self)
        v22 = objc_getProperty(self, v21, 16, 1);
      else
        v22 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parent"));
      if (self)
        objc_getProperty(self, v23, 16, 1);
      sub_100086214(v19);
    }
    else
    {
      if (self)
        v24 = objc_getProperty(self, v21, 16, 1);
      else
        v24 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "server"));
      sub_1000517BC(v19, v25);
    }
  }

  return 1;
}

- (BOOL)canSleep
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = 138412546;
    v12 = Property;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ in state %@: received can sleep query", (uint8_t *)&v11, 0x16u);

  }
  return 1;
}

- (void)handleWakeup
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  unsigned int *v16;
  unsigned int v17;
  const char *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v21 = 138412546;
    v22 = Property;
    v23 = 2112;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ in state %@: received wake event", (uint8_t *)&v21, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryTunnelPlugin"));
  if (v12)
  {
    v14 = (void *)v12;
    v15 = self ? objc_getProperty(self, v13, 16, 1) : 0;
    v16 = (unsigned int *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryTunnelPlugin"));
    v17 = sub_10001755C(v16);

    if (v17)
    {
      if (self)
        v19 = objc_getProperty(self, v18, 16, 1);
      else
        v19 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "primaryTunnelPlugin"));
      sub_100017504(v20);

    }
  }
}

- (void)handleTimeout
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412546;
    v11 = Property;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: timed out", (uint8_t *)&v10, 0x16u);

  }
}

- (void)handleUserSwitch
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412546;
    v11 = Property;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ in state %@: console user switch", (uint8_t *)&v10, 0x16u);

  }
}

- (void)handleUserLogout
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412546;
    v11 = Property;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ in state %@: console user logout", (uint8_t *)&v10, 0x16u);

  }
}

- (BOOL)handleSetConfiguration
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 138412546;
    v14 = Property;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: set configuration started", (uint8_t *)&v13, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "requestInstall");
  return 1;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id Property;
  objc_class *v9;
  NSString *v10;
  void *v11;
  const char *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;

  v3 = a3;
  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v7, 16, 1);
    else
      Property = 0;
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v14 = 138412802;
    v15 = Property;
    v16 = 2112;
    v17 = v11;
    v18 = 1024;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ in state %@: set configuration completed with result %d", (uint8_t *)&v14, 0x1Cu);

  }
  if (self)
    v13 = objc_getProperty(self, v12, 16, 1);
  else
    v13 = 0;
  objc_msgSend(v13, "notifyChangedExtendedStatus");
}

- (BOOL)handleClearConfiguration
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 138412546;
    v14 = Property;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: clear configuration started", (uint8_t *)&v13, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "requestUninstall");
  return 1;
}

- (void)handleClearConfigurationResult:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id Property;
  objc_class *v9;
  NSString *v10;
  void *v11;
  const char *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;

  v3 = a3;
  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v7, 16, 1);
    else
      Property = 0;
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v14 = 138412802;
    v15 = Property;
    v16 = 2112;
    v17 = v11;
    v18 = 1024;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ in state %@: clear configuration completed with result %d", (uint8_t *)&v14, 0x1Cu);

  }
  if (self)
    v13 = objc_getProperty(self, v12, 16, 1);
  else
    v13 = 0;
  objc_msgSend(v13, "notifyChangedExtendedStatus");
}

- (void)handleUpdateConfiguration
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  SEL v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v17 = 138412546;
    v18 = Property;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: update configuration", (uint8_t *)&v17, 0x16u);

  }
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v10, 16, 1), "prepareConfigurationForStart");
    v12 = objc_getProperty(self, v11, 16, 1);
  }
  else
  {
    objc_msgSend(0, "prepareConfigurationForStart");
    v12 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryTunnelPlugin"));
  if (self)
    v15 = objc_getProperty(self, v13, 16, 1);
  else
    v15 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configuration"));
  sub_1000171EC(v14, v16);

}

- (void)handlePluginStatusDidChangeToUpdating:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id Property;
  objc_class *v10;
  NSString *v11;
  void *v12;
  const char *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v8, 16, 1);
    else
      Property = 0;
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v15 = 138412802;
    v16 = Property;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to updating", (uint8_t *)&v15, 0x20u);

  }
  if (self)
    v14 = objc_getProperty(self, v13, 16, 1);
  else
    v14 = 0;
  objc_msgSend(v14, "setState:", 9);

}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

+ (NESMVPNSessionState)stateWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return (NESMVPNSessionState *)0;
  else
    return (NESMVPNSessionState *)objc_alloc_init(*(&off_1000BE368)[a3 - 1]);
}

@end
