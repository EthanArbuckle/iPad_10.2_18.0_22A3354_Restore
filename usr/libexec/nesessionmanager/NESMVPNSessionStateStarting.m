@implementation NESMVPNSessionStateStarting

- (NESMVPNSessionStateStarting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateStarting;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 3, 0);
}

- (void)enterWithSession:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  id v7;
  const char *v8;
  _BYTE *v9;
  id v10;
  void *v11;
  BOOL v12;
  SEL v13;
  id Property;
  unsigned __int8 v15;
  objc_super v16;

  v4 = a3;
  kdebug_trace(726990912, 0, 0, 0, 0);
  v16.receiver = self;
  v16.super_class = (Class)NESMVPNSessionStateStarting;
  -[NESMVPNSessionState enterWithSession:](&v16, "enterWithSession:", v4);

  if (self)
  {
    self->_tunnelConfigurationInstallState = 1;
    if (!objc_msgSend(objc_getProperty(self, v5, 16, 1), "prepareConfigurationForStart"))
    {
LABEL_8:
      objc_msgSend(objc_getProperty(self, v6, 16, 1), "setLastStopReason:", 7);
      Property = objc_getProperty(self, v13, 16, 1);
LABEL_9:
      objc_msgSend(Property, "setState:", 5);
      return;
    }
    v7 = objc_getProperty(self, v6, 16, 1);
  }
  else
  {
    v15 = objc_msgSend(0, "prepareConfigurationForStart");
    v7 = 0;
    if ((v15 & 1) == 0)
      goto LABEL_12;
  }
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryTunnelPlugin"));
  if (self)
    v10 = objc_getProperty(self, v8, 16, 1);
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
  v12 = sub_100015D40(v9, v11);

  if (!v12)
  {
    if (self)
      goto LABEL_8;
LABEL_12:
    objc_msgSend(0, "setLastStopReason:", 7);
    Property = 0;
    goto LABEL_9;
  }
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  _DWORD *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id Property;
  uint64_t v33;
  const char *v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  kdebug_trace(726990916, 0, 0, 0, 0);
  v36.receiver = self;
  v36.super_class = (Class)NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v36, "handlePlugin:didStartWithPID:error:", v8, v6, v9);
  if ((int)v6 < 1)
  {
    if (v9)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if ((objc_msgSend(v30, "isEqualToString:", CFSTR("NEAgentErrorDomain")) & 1) != 0)
      {
        v31 = objc_msgSend(v9, "code");

        if (v31 == (id)2)
        {
          if (self)
            Property = objc_getProperty(self, v10, 16, 1);
          else
            Property = 0;
          v33 = 6;
LABEL_27:
          objc_msgSend(Property, "setLastStopReason:", v33);
          if (self)
            v35 = objc_getProperty(self, v34, 16, 1);
          else
            v35 = 0;
          objc_msgSend(v35, "setState:", 5);
          goto LABEL_30;
        }
      }
      else
      {

      }
    }
    if (self)
      Property = objc_getProperty(self, v10, 16, 1);
    else
      Property = 0;
    v33 = 7;
    goto LABEL_27;
  }
  if (self)
    v11 = objc_getProperty(self, v10, 16, 1);
  else
    v11 = 0;
  v12 = objc_msgSend(v11, "shouldSendIPCAttachForPlugin:", v8);
  if ((_DWORD)v12)
  {
    v14 = ne_log_obj(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        v17 = objc_getProperty(self, v16, 16, 1);
      else
        v17 = 0;
      v18 = (objc_class *)objc_opt_class(self);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412546;
      v38 = v17;
      v39 = 2112;
      v40 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: attaching IPC", buf, 0x16u);

    }
    sub_10001780C(v8);
  }
  kdebug_trace(726990984, 0, 0, 0, 0);
  if (self)
    v22 = objc_getProperty(self, v21, 16, 1);
  else
    v22 = 0;
  v24 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "primaryTunnelPlugin"));
  if (self)
    v25 = objc_getProperty(self, v23, 16, 1);
  else
    v25 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "connectParameters"));
  v27 = v26;
  if (v24)
  {
    v24[16] = 1;
    v28 = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "remotePluginObject"));
    objc_msgSend(v29, "connectWithParameters:", v28);

  }
LABEL_30:

}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  const char *v4;
  int64_t tunnelConfigurationInstallState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handlePluginStatusDidChangeToConnected:](&v6, "handlePluginStatusDidChangeToConnected:", a3);
  if (self)
  {
    tunnelConfigurationInstallState = self->_tunnelConfigurationInstallState;
    if (tunnelConfigurationInstallState == 3)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "setState:", 4);
    }
    else if (tunnelConfigurationInstallState == 1)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "requestInstall");
    }
  }
}

- (BOOL)handleSetConfiguration
{
  objc_super v4;

  kdebug_trace(726990928, 0, 0, 0, 0);
  if (self)
    self->_tunnelConfigurationInstallState = 2;
  v4.receiver = self;
  v4.super_class = (Class)NESMVPNSessionStateStarting;
  return -[NESMVPNSessionState handleSetConfiguration](&v4, "handleSetConfiguration");
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  const char *v4;
  id v5;
  _DWORD *v6;
  int v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handleSetConfigurationResult:](&v9, "handleSetConfigurationResult:", a3);
  kdebug_trace(726990932, 0, 0, 0, 0);
  if (self)
  {
    self->_tunnelConfigurationInstallState = 3;
    v5 = objc_msgSend(objc_getProperty(self, v4, 16, 1), "primaryTunnelPlugin");
    v6 = (_DWORD *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      v7 = v6[16];

      if (v7 == 4)
        objc_msgSend(objc_getProperty(self, v8, 16, 1), "setState:", 4);
    }
  }
}

- (void)handleTimeout
{
  const char *v3;
  SEL v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handleTimeout](&v6, "handleTimeout");
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 16, 1), "setLastStopReason:", 12);
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    objc_msgSend(0, "setLastStopReason:", 12);
    Property = 0;
  }
  objc_msgSend(Property, "setState:", 5);
}

@end
