@implementation NESMVPNSessionStateUpdating

- (NESMVPNSessionStateUpdating)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateUpdating;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 9, 300);
}

- (void)enterWithSession:(id)a3
{
  const char *v4;
  SEL v5;
  id Property;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NESMVPNSessionStateUpdating;
  -[NESMVPNSessionState enterWithSession:](&v7, "enterWithSession:", a3);
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v4, 16, 1), "requestUninstall");
    Property = objc_getProperty(self, v5, 16, 1);
  }
  else
  {
    objc_msgSend(0, "requestUninstall");
    Property = 0;
  }
  sub_10007B40C((uint64_t)Property, 1);
}

- (void)leave
{
  NESMVPNSessionStateUpdating *v2;
  NESMVPNSessionStateUpdating *v3;
  NSObject *v4;
  NESMVPNSessionStateUpdating *v5;
  objc_super v6;
  _QWORD block[4];
  NESMVPNSessionStateUpdating *v8;

  v2 = self;
  if (self)
    self = (NESMVPNSessionStateUpdating *)objc_getProperty(self, a2, 16, 1);
  v3 = self;
  v4 = objc_claimAutoreleasedReturnValue(-[NESMVPNSessionStateUpdating queue](v3, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069778;
  block[3] = &unk_1000BEB80;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = v2;
  v6.super_class = (Class)NESMVPNSessionStateUpdating;
  -[NESMVPNSessionState leave](&v6, "leave");

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received establish IPC message", (uint8_t *)&v12, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "sendEstablishIPCReply");
}

- (void)handleTimeout
{
  const char *v3;
  id Property;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateUpdating;
  -[NESMVPNSessionState handleTimeout](&v5, "handleTimeout");
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  objc_msgSend(Property, "setState:", 8);
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v10, 0x16u);

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received sleep event", (uint8_t *)&v11, 0x16u);

  }
  return 0;
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: update configuration", (uint8_t *)&v10, 0x16u);

  }
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ disconnected with reason %s", (uint8_t *)&v17, 0x2Au);

  }
  if (self)
    v16 = objc_getProperty(self, v15, 16, 1);
  else
    v16 = 0;
  objc_msgSend(v16, "setState:", 8);

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
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;

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
    v15 = 138413058;
    v16 = Property;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v6;
    v21 = 2080;
    v22 = ne_session_stop_reason_to_string(v4);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to disconnecting with reason %s", (uint8_t *)&v15, 0x2Au);

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: rejecting set configuration", (uint8_t *)&v11, 0x16u);

  }
  return 0;
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: rejecting clear configuration", (uint8_t *)&v11, 0x16u);

  }
  return 0;
}

@end
