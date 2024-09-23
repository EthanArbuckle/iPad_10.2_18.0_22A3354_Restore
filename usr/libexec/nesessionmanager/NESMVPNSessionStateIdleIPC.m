@implementation NESMVPNSessionStateIdleIPC

- (NESMVPNSessionStateIdleIPC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateIdleIPC;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 10, 0);
}

- (void)enterWithSession:(id)a3
{
  id v4;
  const char *v5;
  _BYTE *v6;
  id Property;
  void *v8;
  BOOL v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState enterWithSession:](&v10, "enterWithSession:", v4);
  if (self)
    self->_didAttachIPC = 0;
  if (!objc_msgSend(v4, "initializePlugins")
    || !objc_msgSend(v4, "prepareConfigurationForStart")
    || ((v6 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryTunnelPlugin")), !self)
      ? (Property = 0)
      : (Property = objc_getProperty(self, v5, 16, 1)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "configuration")),
        v9 = sub_100015D40(v6, v8),
        v8,
        v6,
        !v9))
  {
    objc_msgSend(v4, "sendEstablishIPCReply");
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: ignoring duplicate request to establish IPC", (uint8_t *)&v10, 0x16u);

  }
}

- (void)handleStartMessage:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  id v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  const char *v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handleStartMessage:](&v24, "handleStartMessage:", v4);
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "primaryTunnelPlugin"));
  if (v7)
    v8 = v7[16] & 1;
  else
    v8 = 0;

  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      if (self)
        v15 = objc_getProperty(self, v14, 16, 1);
      else
        v15 = 0;
      v16 = (objc_class *)objc_opt_class(self);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin previously started, going back to the idle state to handle the start message", buf, 0x16u);

    }
    sub_100068C24(self, v4);
  }
  else
  {
    if (v13)
    {
      if (self)
        v19 = objc_getProperty(self, v14, 16, 1);
      else
        v19 = 0;
      v20 = (objc_class *)objc_opt_class(self);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin has not yet started, saving the start message", buf, 0x16u);

    }
    if (self)
      objc_setProperty_atomic(self, v23, v4, 48);
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v11, 0x16u);

  }
  if (self)
    objc_setProperty_atomic(self, v10, 0, 48);
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  id v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  id Property;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  id v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  const char *v32;
  id v33;
  id v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  const char *v38;
  id v39;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v40, "handlePlugin:didStartWithPID:error:", v8, v6, a5);
  if ((int)v6 < 1)
  {
    if (self)
      Property = objc_getProperty(self, v9, 16, 1);
    else
      Property = 0;
    v23 = objc_msgSend(Property, "establishIPCPending");
    if ((_DWORD)v23)
    {
      v25 = ne_log_obj(v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        if (self)
          v28 = objc_getProperty(self, v27, 16, 1);
        else
          v28 = 0;
        v29 = (objc_class *)objc_opt_class(self);
        v30 = NSStringFromClass(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138412546;
        v42 = v28;
        v43 = 2112;
        v44 = v31;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin failed to start, cannot attach IPC", buf, 0x16u);

      }
      if (self)
        v33 = objc_getProperty(self, v32, 16, 1);
      else
        v33 = 0;
      objc_msgSend(v33, "sendEstablishIPCReply");
    }
  }
  else
  {
    if (self)
      v10 = objc_getProperty(self, v9, 16, 1);
    else
      v10 = 0;
    v11 = objc_msgSend(v10, "shouldSendIPCAttachForPlugin:", v8);
    v12 = (int)v11;
    v14 = ne_log_obj(v11, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v16)
      {
        if (self)
          v18 = objc_getProperty(self, v17, 16, 1);
        else
          v18 = 0;
        v19 = (objc_class *)objc_opt_class(self);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138412546;
        v42 = v18;
        v43 = 2112;
        v44 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: attaching IPC", buf, 0x16u);

      }
      sub_10001780C(v8);
    }
    else
    {
      if (v16)
      {
        if (self)
          v34 = objc_getProperty(self, v17, 16, 1);
        else
          v34 = 0;
        v35 = (objc_class *)objc_opt_class(self);
        v36 = NSStringFromClass(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        *(_DWORD *)buf = 138412546;
        v42 = v34;
        v43 = 2112;
        v44 = v37;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: IPC is no longer needed, going back to idle", buf, 0x16u);

      }
      if (self)
      {
        v39 = objc_getProperty(self, v38, 48, 1);
        sub_100068C24(self, v39);
      }
    }
  }

}

- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  objc_super v4;

  if (self && a4)
    self->_didAttachIPC = 1;
  v4.receiver = self;
  v4.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePlugin:didAttachIPCWithEndpoint:](&v4, "handlePlugin:didAttachIPCWithEndpoint:", a3, a4);
}

- (void)handleEstablishIPCReplySent
{
  id v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id Property;
  objc_class *v9;
  NSString *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v16.receiver = self;
  v16.super_class = (Class)NESMVPNSessionStateIdleIPC;
  v3 = -[NESMVPNSessionState handleEstablishIPCReplySent](&v16, "handleEstablishIPCReplySent");
  if (!self || !self->_didAttachIPC || (v3 = objc_getProperty(self, v4, 48, 1)) != 0)
  {
    v5 = ne_log_obj(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        Property = objc_getProperty(self, v7, 16, 1);
      else
        Property = 0;
      v9 = (objc_class *)objc_opt_class(self);
      v10 = NSStringFromClass(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (self)
        v13 = objc_getProperty(self, v11, 48, 1);
      else
        v13 = 0;
      *(_DWORD *)buf = 138412802;
      v18 = Property;
      v19 = 2112;
      v20 = v12;
      v21 = 2048;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ in state %@: IPC did not attach or there is a pending start message, moving to idle and handling pending start message (%p)", buf, 0x20u);

    }
    if (self)
    {
      v15 = objc_getProperty(self, v14, 48, 1);
      sub_100068C24(self, v15);
    }
  }
}

- (void)handleUpdateConfiguration
{
  const char *v3;
  id Property;
  void *v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
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
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v23.receiver = self;
  v23.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handleUpdateConfiguration](&v23, "handleUpdateConfiguration");
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
  if (objc_msgSend(v6, "isEnabled"))
  {

LABEL_15:
    return;
  }
  if (self)
    v8 = objc_getProperty(self, v7, 16, 1);
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appVPN"));
  v11 = objc_msgSend(v10, "isEnabled");

  if ((v11 & 1) == 0)
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
      v25 = v17;
      v26 = 2112;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: the configuration is now disabled, tearing down IPC", buf, 0x16u);

    }
    if (self)
      v22 = objc_getProperty(self, v21, 16, 1);
    else
      v22 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "primaryTunnelPlugin"));
    -[NESMVPNSessionStateIdleIPC handlePluginDidDetachIPC:](self, "handlePluginDidDetachIPC:", v5);
    goto LABEL_15;
  }
}

- (void)handlePluginDidDetachIPC:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  void *v7;
  const char *v8;
  id v9;
  _BYTE *v10;
  const char *v11;
  SEL v12;
  id v13;
  _BYTE *v14;
  const char *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePluginDidDetachIPC:](&v16, "handlePluginDidDetachIPC:", v4);
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "primaryTunnelPlugin"));

  if (v7)
  {
    if (self)
    {
      v9 = objc_msgSend(objc_getProperty(self, v8, 16, 1), "primaryTunnelPlugin");
      v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(v9);
      sub_100016D0C(v10, v11);

      v13 = objc_getProperty(self, v12, 16, 1);
    }
    else
    {
      v14 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "primaryTunnelPlugin"));
      sub_100016D0C(v14, v15);

      v13 = 0;
    }
    objc_msgSend(v13, "setPrimaryTunnelPlugin:", 0);
  }
  else
  {
    -[NESMVPNSessionStateIdleIPC handlePluginDisposeComplete:](self, "handlePluginDisposeComplete:", v4);
  }

}

- (void)handlePluginDisposeComplete:(id)a3
{
  const char *v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePluginDisposeComplete:](&v6, "handlePluginDisposeComplete:", a3);
  if (self)
  {
    Property = objc_getProperty(self, v4, 48, 1);
    sub_100068C24(self, Property);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingStartMessage, 0);
}

@end
