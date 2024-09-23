@implementation NESMVPNSessionStateIdle

- (NESMVPNSessionStateIdle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateIdle;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 1, 0);
}

- (void)enterWithSession:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  id v16;
  unsigned __int8 v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NESMVPNSessionStateIdle;
  v4 = a3;
  -[NESMVPNSessionState enterWithSession:](&v18, "enterWithSession:", v4);
  sub_100029F64(v4);

  if (self)
  {
    Property = objc_getProperty(self, v5, 16, 1);
    if (!objc_msgSend(Property, "sleepOnDisconnect", v18.receiver, v18.super_class))
      goto LABEL_15;
    v8 = objc_getProperty(self, v7, 16, 1);
  }
  else
  {
    v17 = objc_msgSend(0, "sleepOnDisconnect", v18.receiver, v18.super_class);
    v8 = 0;
    v16 = 0;
    if ((v17 & 1) == 0)
      goto LABEL_16;
  }
  if (objc_msgSend(v8, "parentType") == (id)2)
  {
    if (self)
      v10 = objc_getProperty(self, v9, 16, 1);
    else
      v10 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));
    if (self)
      objc_getProperty(self, v11, 16, 1);
    sub_100086214(v12);
  }
  else
  {
    if (self)
      v13 = objc_getProperty(self, v9, 16, 1);
    else
      v13 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "server"));
    sub_1000517BC(v12, v14);
  }

  if (!self)
  {
    objc_msgSend(0, "setSleepOnDisconnect:", 0);
    v16 = 0;
    goto LABEL_16;
  }
  objc_msgSend(objc_getProperty(self, v15, 16, 1), "setSleepOnDisconnect:", 0);
LABEL_15:
  self->_establishIPCWhenEnabled = 0;
  v16 = objc_getProperty(self, v7, 16, 1);
LABEL_16:
  objc_msgSend(v16, "setRestartPending:", 0);
}

- (void)leave
{
  NESMVPNSessionStateIdle *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (NESMVPNSessionStateIdle *)objc_getProperty(self, a2, 16, 1);
  sub_100029F64(self);
  v3.receiver = v2;
  v3.super_class = (Class)NESMVPNSessionStateIdle;
  -[NESMVPNSessionState leave](&v3, "leave");
}

- (void)handleStartMessage:(id)a3
{
  id v4;
  const char *v5;
  SEL v6;
  id Property;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSessionStateIdle;
  -[NESMVPNSessionState handleStartMessage:](&v8, "handleStartMessage:", v4);
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v5, 16, 1), "createConnectParametersWithStartMessage:", v4);
    Property = objc_getProperty(self, v6, 16, 1);
  }
  else
  {
    objc_msgSend(0, "createConnectParametersWithStartMessage:", v4);
    Property = 0;
  }
  objc_msgSend(Property, "setState:", 2);

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
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  id v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;

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
    v29 = 138412546;
    v30 = Property;
    v31 = 2112;
    v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received establish IPC message", (uint8_t *)&v29, 0x16u);

  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "VPN"));
  if (objc_msgSend(v13, "isEnabled"))
  {

LABEL_12:
    if (self)
      v21 = objc_getProperty(self, v15, 16, 1);
    else
      v21 = 0;
    objc_msgSend(v21, "setState:", 10);
    return;
  }
  if (self)
    v16 = objc_getProperty(self, v14, 16, 1);
  else
    v16 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appVPN"));
  v19 = objc_msgSend(v18, "isEnabled");

  if ((v19 & 1) != 0)
    goto LABEL_12;
  v22 = ne_log_obj(v20, v15);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      v25 = objc_getProperty(self, v24, 16, 1);
    else
      v25 = 0;
    v26 = (objc_class *)objc_opt_class(self);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = 138412546;
    v30 = v25;
    v31 = 2112;
    v32 = v28;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ in state %@: delaying IPC establish until the configuration is enabled", (uint8_t *)&v29, 0x16u);

  }
  if (self)
    self->_establishIPCWhenEnabled = 1;
}

- (void)handleUpdateConfiguration
{
  const char *v3;
  id Property;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v21.receiver = self;
  v21.super_class = (Class)NESMVPNSessionStateIdle;
  -[NESMVPNSessionState handleUpdateConfiguration](&v21, "handleUpdateConfiguration");
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
  if (objc_msgSend(v6, "isEnabled"))
  {

    if (!self)
      return;
  }
  else
  {
    if (self)
      v10 = objc_getProperty(self, v7, 16, 1);
    else
      v10 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appVPN"));
    v13 = objc_msgSend(v12, "isEnabled");

    if (!self || !v13)
      return;
  }
  if (self->_establishIPCWhenEnabled)
  {
    v14 = ne_log_obj(v8, v9);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_getProperty(self, v16, 16, 1);
      v18 = (objc_class *)objc_opt_class(self);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412546;
      v23 = v17;
      v24 = 2112;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: the configuration is now enabled, establishing IPC", buf, 0x16u);

    }
    self->_establishIPCWhenEnabled = 0;
    -[NESMVPNSessionStateIdle handleEstablishIPC](self, "handleEstablishIPC");
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring set configuration request", (uint8_t *)&v11, 0x16u);

  }
  return 0;
}

- (void)handleSetConfigurationResult:(BOOL)a3
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring set configuration result", (uint8_t *)&v11, 0x16u);

  }
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring clear configuration request", (uint8_t *)&v11, 0x16u);

  }
  return 0;
}

- (void)handleClearConfigurationResult:(BOOL)a3
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring clear configuration result", (uint8_t *)&v11, 0x16u);

  }
}

@end
