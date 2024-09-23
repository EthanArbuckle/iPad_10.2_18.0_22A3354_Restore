@implementation NESMVPNSessionStateReasserting

- (NESMVPNSessionStateReasserting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateReasserting;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 6, 0);
}

- (void)enterWithSession:(id)a3
{
  objc_super v3;

  if (self)
    self->_setConfigurationInProgress = 0;
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState enterWithSession:](&v3, "enterWithSession:", a3);
}

- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4
{
  const char *v5;
  id Property;
  _DWORD *v7;
  const char *v8;
  int v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  unsigned __int8 v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v20.receiver = self;
  v20.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleInterfaceAvailable:changed:](&v20, "handleInterfaceAvailable:changed:", a3, a4);
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "primaryTunnelPlugin"));
  if (v7)
  {
    v9 = v7[16];

    if (v9 == 5)
      return;
  }
  if (!self)
  {
    v19 = objc_msgSend(0, "reassertedByPlugin");
    v10 = 0;
    if ((v19 & 1) != 0)
      goto LABEL_7;
LABEL_13:
    objc_msgSend(v10, "setState:", 4);
    return;
  }
  v10 = objc_msgSend(objc_getProperty(self, v8, 16, 1), "reassertedByPlugin");
  if (!(_DWORD)v10)
  {
    v10 = objc_getProperty(self, v11, 16, 1);
    goto LABEL_13;
  }
LABEL_7:
  v12 = ne_log_obj(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      v15 = objc_getProperty(self, v14, 16, 1);
    else
      v15 = 0;
    v16 = (objc_class *)objc_opt_class(self);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    v23 = 2112;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ in state %@: skipping a transition to running, because the plugin reasserted us", buf, 0x16u);

  }
}

- (void)handleTimeout
{
  const char *v3;
  SEL v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleTimeout](&v6, "handleTimeout");
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 16, 1), "setLastStopReason:", 13);
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    objc_msgSend(0, "setLastStopReason:", 13);
    Property = 0;
  }
  objc_msgSend(Property, "setState:", 5);
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  const char *v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handlePluginStatusDidChangeToConnected:](&v6, "handlePluginStatusDidChangeToConnected:", a3);
  if (self)
  {
    if (self->_setConfigurationInProgress)
      return;
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    Property = 0;
  }
  objc_msgSend(Property, "setState:", 4);
}

- (BOOL)handleSleep
{
  NESMVPNSessionStateReasserting *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id Property;
  objc_class *v11;
  NSString *v12;
  void *v13;
  const char *v14;
  SEL v15;
  SEL v16;
  id v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v2 = self;
  if (self)
    self = (NESMVPNSessionStateReasserting *)objc_getProperty(self, a2, 16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSessionStateReasserting protocol](self, "protocol"));
  v4 = objc_msgSend(v3, "disconnectOnSleep");

  if (v4)
  {
    v7 = ne_log_obj(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v2)
        Property = objc_getProperty(v2, v9, 16, 1);
      else
        Property = 0;
      v11 = (objc_class *)objc_opt_class(v2);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v21 = Property;
      v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ in state %@: delaying sleep until disconnected", buf, 0x16u);

    }
    if (v2)
    {
      objc_msgSend(objc_getProperty(v2, v14, 16, 1), "setSleepOnDisconnect:", 1);
      objc_msgSend(objc_getProperty(v2, v15, 16, 1), "setLastStopReason:", 9);
      v17 = objc_getProperty(v2, v16, 16, 1);
    }
    else
    {
      objc_msgSend(0, "setSleepOnDisconnect:", 1);
      objc_msgSend(0, "setLastStopReason:", 9);
      v17 = 0;
    }
    objc_msgSend(v17, "setState:", 5);
  }
  else
  {
    v19.receiver = v2;
    v19.super_class = (Class)NESMVPNSessionStateReasserting;
    -[NESMVPNSessionState handleSleep](&v19, "handleSleep");
  }
  return 1;
}

- (void)handleUserSwitch
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleUserSwitch](&v2, "handleUserSwitch");
}

- (void)handleUserLogout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleUserLogout](&v2, "handleUserLogout");
}

- (BOOL)handleSetConfiguration
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateReasserting;
  v3 = -[NESMVPNSessionState handleSetConfiguration](&v5, "handleSetConfiguration");
  if (self && v3)
    self->_setConfigurationInProgress = 1;
  return v3;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  const char *v4;
  id Property;
  _DWORD *v6;
  int v7;
  const char *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleSetConfigurationResult:](&v10, "handleSetConfigurationResult:", a3);
  if (self)
  {
    self->_setConfigurationInProgress = 0;
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    Property = 0;
  }
  v6 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "primaryTunnelPlugin"));
  if (v6)
  {
    v7 = v6[16];

    if (v7 == 4)
    {
      if (self)
        v9 = objc_getProperty(self, v8, 16, 1);
      else
        v9 = 0;
      objc_msgSend(v9, "setState:", 4);
    }
  }
}

@end
