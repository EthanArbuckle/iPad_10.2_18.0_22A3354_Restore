@implementation NESMVPNSessionStateDisposing

- (NESMVPNSessionStateDisposing)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateDisposing;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 8, 5);
}

- (void)enterWithSession:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  void *v7;
  const char *v8;
  id v9;
  _BYTE *v10;
  const char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  _BYTE *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  NSObject *v26;
  _QWORD block[5];
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NESMVPNSessionStateDisposing;
  -[NESMVPNSessionState enterWithSession:](&v28, "enterWithSession:", v4);
  if (self)
  {
    self->_pendingDisposeCount = 0;
    Property = objc_getProperty(self, v5, 16, 1);
  }
  else
  {
    Property = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "authenticationPlugin"));

  if (v7)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      v9 = objc_getProperty(self, v8, 16, 1);
    }
    else
    {
      v9 = 0;
    }
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authenticationPlugin"));
    sub_100016D0C(v10, v11);

  }
  if (self)
    v12 = objc_getProperty(self, v8, 16, 1);
  else
    v12 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryTunnelPlugin"));

  if (v13)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      v16 = objc_getProperty(self, v15, 16, 1);
    }
    else
    {
      v16 = 0;
    }
    v17 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "primaryTunnelPlugin"));
    sub_100016D0C(v17, v18);

  }
  if (!self || !self->_pendingDisposeCount)
  {
    v19 = ne_log_obj(v14, v15);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        v22 = objc_getProperty(self, v21, 16, 1);
      else
        v22 = 0;
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412546;
      v30 = v22;
      v31 = 2112;
      v32 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ in state %@: no plugins to dispose", buf, 0x16u);

    }
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A208;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v26, block);

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
  SEL v14;
  SEL v15;
  id v16;
  void *v17;
  SEL v18;
  const char *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v23.receiver = self;
  v23.super_class = (Class)NESMVPNSessionStateDisposing;
  v4 = -[NESMVPNSessionState handlePluginDisposeComplete:](&v23, "handlePluginDisposeComplete:", a3);
  if (!self || (--self->_pendingDisposeCount, !self->_pendingDisposeCount))
  {
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
      *(_DWORD *)buf = 138412546;
      v25 = Property;
      v26 = 2112;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: all plugins have disposed", buf, 0x16u);

    }
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v13, 16, 1), "setAuthenticationPlugin:", 0);
      objc_msgSend(objc_getProperty(self, v14, 16, 1), "setPrimaryTunnelPlugin:", 0);
      v16 = objc_msgSend(objc_getProperty(self, v15, 16, 1), "policySession");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      sub_10002C464((uint64_t)v17);

      if (objc_msgSend(objc_getProperty(self, v18, 16, 1), "restartPending"))
      {
LABEL_9:
        sub_100069EEC(self, (uint64_t)v19);
        return;
      }
      v20 = objc_getProperty(self, v19, 16, 1);
    }
    else
    {
      objc_msgSend(0, "setAuthenticationPlugin:", 0);
      objc_msgSend(0, "setPrimaryTunnelPlugin:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "policySession"));
      sub_10002C464((uint64_t)v21);

      v22 = objc_msgSend(0, "restartPending");
      v20 = 0;
      if ((v22 & 1) != 0)
        goto LABEL_9;
    }
    objc_msgSend(v20, "setState:", 1);
  }
}

- (void)handleTimeout
{
  const char *v3;
  id Property;
  void *v5;
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  SEL v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  const char *v18;
  SEL v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NESMVPNSessionStateDisposing;
  -[NESMVPNSessionState handleTimeout](&v27, "handleTimeout");
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "authenticationPlugin"));

  if (v5)
  {
    if (self)
    {
      v7 = objc_msgSend(objc_getProperty(self, v6, 16, 1), "authenticationPlugin");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      sub_100017538(v8, v9);

      v11 = objc_getProperty(self, v10, 16, 1);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "authenticationPlugin"));
      sub_100017538(v23, v24);

      v11 = 0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authenticationPlugin"));
    -[NESMVPNSessionStateDisposing handlePluginDisposeComplete:](self, "handlePluginDisposeComplete:", v12);

  }
  if (self)
    v13 = objc_getProperty(self, v6, 16, 1);
  else
    v13 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primaryTunnelPlugin"));

  if (v14)
  {
    if (self)
    {
      v16 = objc_msgSend(objc_getProperty(self, v15, 16, 1), "primaryTunnelPlugin");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      sub_100017538(v17, v18);

      v20 = objc_getProperty(self, v19, 16, 1);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "primaryTunnelPlugin"));
      sub_100017538(v25, v26);

      v20 = 0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryTunnelPlugin"));
    -[NESMVPNSessionStateDisposing handlePluginDisposeComplete:](self, "handlePluginDisposeComplete:", v21);

  }
  else
  {
    if (self)
      v22 = objc_getProperty(self, v15, 16, 1);
    else
      v22 = 0;
    objc_msgSend(v22, "setState:", 1);
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

@end
