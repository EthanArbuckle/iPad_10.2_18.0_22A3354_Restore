@implementation NESMVPNSessionStateRunning

- (NESMVPNSessionStateRunning)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateRunning;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 4, 0);
}

- (BOOL)handleSleep
{
  NESMVPNSessionStateRunning *v2;
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
    self = (NESMVPNSessionStateRunning *)objc_getProperty(self, a2, 16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSessionStateRunning protocol](self, "protocol"));
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
    v19.super_class = (Class)NESMVPNSessionStateRunning;
    -[NESMVPNSessionState handleSleep](&v19, "handleSleep");
  }
  return 1;
}

- (void)handleUserSwitch
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handleUserSwitch](&v2, "handleUserSwitch");
}

- (void)handleUserLogout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handleUserLogout](&v2, "handleUserLogout");
}

- (void)handlePluginStatusDidChangeToReasserting:(id)a3
{
  const char *v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handlePluginStatusDidChangeToReasserting:](&v6, "handlePluginStatusDidChangeToReasserting:", a3);
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  objc_msgSend(Property, "setState:", 6);
}

- (void)handleInterfaceUnavailable:(id)a3
{
  const char *v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handleInterfaceUnavailable:](&v6, "handleInterfaceUnavailable:", a3);
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  objc_msgSend(Property, "setState:", 6);
}

@end
