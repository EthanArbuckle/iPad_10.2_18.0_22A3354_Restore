@implementation NESMFilterSessionState

- (NESMFilterSessionState)initWithType:(int64_t)a3 andTimeout:(int64_t)a4
{
  NESMFilterSessionState *v6;
  NESMFilterSessionState *v7;
  NESMFilterSession *session;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NESMFilterSessionState;
  v6 = -[NESMFilterSessionState init](&v10, "init");
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
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v6 = v4;
  if (self)
    objc_setProperty_atomic(self, v5, v4, 16);
  v7 = ne_log_obj(v4, v5);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: Entering state %@", buf, 0x16u);

  }
  if (self && self->_timeout >= 1 && (objc_opt_respondsToSelector(self, "handleTimeout") & 1) != 0)
  {
    v12 = dispatch_time(0, 1000000000 * self->_timeout);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005C828;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_after(v12, v13, block);

  }
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: Leaving state %@", (uint8_t *)&v11, 0x16u);

  }
  if (self)
    objc_setProperty_atomic(self, v10, 0, 16);
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
  id *v11;
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
    v11 = (id *)objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  sub_100070FD8(v11, (const char *)4);
}

- (void)handlePlugin:(id)a3 statusDidChangeToIdleWithError:(int64_t)a4
{
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
  uint64_t v17;
  id *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int64_t v26;

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
    v19 = 138413058;
    v20 = Property;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v6;
    v25 = 2048;
    v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to idle with error: %ld", (uint8_t *)&v19, 0x2Au);

  }
  if (a4 == 2)
  {
    if (self)
      v16 = objc_getProperty(self, v15, 16, 1);
    else
      v16 = 0;
    v17 = 6;
  }
  else
  {
    if (a4 != 1)
      goto LABEL_14;
    if (self)
      v16 = objc_getProperty(self, v15, 16, 1);
    else
      v16 = 0;
    v17 = 7;
  }
  objc_msgSend(v16, "setLastStopReason:", v17);
LABEL_14:
  if (self)
    v18 = (id *)objc_getProperty(self, v15, 16, 1);
  else
    v18 = 0;
  sub_100070FD8(v18, (const char *)4);

}

- (void)handlePluginStatusDidChangeToStarting:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to starting", (uint8_t *)&v13, 0x20u);

  }
}

- (void)handlePluginStatusDidChangeToRunning:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to running", (uint8_t *)&v13, 0x20u);

  }
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
  id *v14;
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
    v14 = (id *)objc_getProperty(self, v13, 16, 1);
  else
    v14 = 0;
  sub_100070FD8(v14, (const char *)5);

}

- (void)handlePlugin:(id)a3 statusDidChangeToStoppingWithError:(int64_t)a4
{
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
  id *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int64_t v25;

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
    v18 = 138413058;
    v19 = Property;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v6;
    v24 = 2048;
    v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to stopping with error %ld", (uint8_t *)&v18, 0x2Au);

  }
  if (a4 == 1)
  {
    if (self)
      v16 = objc_getProperty(self, v15, 16, 1);
    else
      v16 = 0;
    objc_msgSend(v16, "setLastStopReason:", 7);
  }
  if (self)
    v17 = (id *)objc_getProperty(self, v15, 16, 1);
  else
    v17 = 0;
  sub_100070FD8(v17, (const char *)4);

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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ disposed", (uint8_t *)&v13, 0x20u);

  }
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
  int v11;
  id v12;
  __int16 v13;
  void *v14;

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
    v11 = 138412546;
    v12 = Property;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: handle sleep", (uint8_t *)&v11, 0x16u);

  }
  return 0;
}

- (BOOL)canSleep
{
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: handle wake up", (uint8_t *)&v10, 0x16u);

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
  const char *v10;
  id *v11;
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: timed out", (uint8_t *)&v12, 0x16u);

  }
  if (self)
    v11 = (id *)objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  sub_100070FD8(v11, (const char *)4);
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: configuration changed", (uint8_t *)&v10, 0x16u);

  }
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

+ (id)stateWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return objc_alloc_init(*off_1000BE270[a3 - 1]);
}

@end
