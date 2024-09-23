@implementation NESMVPNSessionStateStopping

- (NESMVPNSessionStateStopping)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateStopping;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 5, 20);
}

- (void)enterWithSession:(id)a3
{
  SEL v4;
  id Property;
  objc_super v6;

  if (self)
  {
    self->_isUninstalled = 0;
    v6.receiver = self;
    v6.super_class = (Class)NESMVPNSessionStateStopping;
    -[NESMVPNSessionState enterWithSession:](&v6, "enterWithSession:", a3);
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    v6.receiver = 0;
    v6.super_class = (Class)NESMVPNSessionStateStopping;
    -[NESMVPNSessionState enterWithSession:](&v6, "enterWithSession:", a3);
    Property = 0;
  }
  objc_msgSend(Property, "requestUninstall");
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin disconnecting, ignoring set configuration request", (uint8_t *)&v11, 0x16u);

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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin disconnecting, ignoring set configuration result", (uint8_t *)&v11, 0x16u);

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin disconnecting, ignoring clear configuration request", (uint8_t *)&v11, 0x16u);

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
  const char *v11;
  SEL v12;
  id v13;
  const char *v14;
  id v15;
  SEL v16;
  id v17;
  const char *v18;
  id v19;
  id v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  id v24;
  _DWORD *v25;
  int v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  id v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  const char *v36;
  id v37;
  const char *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  _DWORD *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  id v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  const char *v54;
  id v55;
  int v56;
  id v57;
  __int16 v58;
  void *v59;

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
    v56 = 138412546;
    v57 = Property;
    v58 = 2112;
    v59 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: session is now uninstalled", (uint8_t *)&v56, 0x16u);

  }
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v11, 16, 1), "setPluginConfigurationEntities:", 0);
    self->_isUninstalled = 1;
    v13 = objc_getProperty(self, v12, 16, 1);
  }
  else
  {
    objc_msgSend(0, "setPluginConfigurationEntities:", 0);
    v13 = 0;
  }
  if (objc_msgSend(v13, "virtualInterface"))
  {
    if (self)
    {
      v15 = objc_msgSend(objc_getProperty(self, v14, 16, 1), "virtualInterface");
      NEVirtualInterfaceInvalidate(v15);
      v17 = objc_getProperty(self, v16, 16, 1);
    }
    else
    {
      NEVirtualInterfaceInvalidate(objc_msgSend(0, "virtualInterface"));
      v17 = 0;
    }
    CFRelease(objc_msgSend(v17, "virtualInterface"));
    if (self)
      v19 = objc_getProperty(self, v18, 16, 1);
    else
      v19 = 0;
    objc_msgSend(v19, "setVirtualInterface:", 0);
  }
  if (self)
    v20 = objc_getProperty(self, v14, 16, 1);
  else
    v20 = 0;
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryTunnelPlugin"));
  v23 = (void *)v21;
  if (v21 && *(_DWORD *)(v21 + 64) == 6)
    goto LABEL_32;
  if (self)
    v24 = objc_getProperty(self, v22, 16, 1);
  else
    v24 = 0;
  v25 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "primaryTunnelPlugin"));
  if (!v25)
  {
    v42 = 0;
    goto LABEL_31;
  }
  v26 = v25[16];

  if (!v26)
    goto LABEL_33;
  v29 = ne_log_obj(v27, v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      v32 = objc_getProperty(self, v31, 16, 1);
    else
      v32 = 0;
    v33 = (objc_class *)objc_opt_class(self);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v56 = 138412546;
    v57 = v32;
    v58 = 2112;
    v59 = v35;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ in state %@: disconnecting the plugin", (uint8_t *)&v56, 0x16u);

  }
  if (self)
    v37 = objc_getProperty(self, v36, 16, 1);
  else
    v37 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "primaryTunnelPlugin"));
  if (self)
    v39 = objc_getProperty(self, v38, 16, 1);
  else
    v39 = 0;
  v40 = objc_msgSend(v39, "lastStopReason");
  if (v23)
  {
    v41 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remotePluginObject"));
    objc_msgSend(v42, "disconnectWithReason:", v41);
LABEL_31:

  }
LABEL_32:

LABEL_33:
  if (self)
    v43 = objc_getProperty(self, v28, 16, 1);
  else
    v43 = 0;
  v44 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "primaryTunnelPlugin"));
  if (!v44 || (v46 = v44[16], v44, !v46))
  {
    v47 = ne_log_obj(v44, v45);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        v50 = objc_getProperty(self, v49, 16, 1);
      else
        v50 = 0;
      v51 = (objc_class *)objc_opt_class(self);
      v52 = NSStringFromClass(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      v56 = 138412546;
      v57 = v50;
      v58 = 2112;
      v59 = v53;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin already disconnected, disposing all plugins", (uint8_t *)&v56, 0x16u);

    }
    if (self)
      v55 = objc_getProperty(self, v54, 16, 1);
    else
      v55 = 0;
    objc_msgSend(v55, "setState:", 8);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4;
  const char *v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  id v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  SEL v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v4 = *(_QWORD *)&a4;
  v27.receiver = self;
  v27.super_class = (Class)NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handlePlugin:statusDidChangeToDisconnectedWithReason:](&v27, "handlePlugin:statusDidChangeToDisconnectedWithReason:", a3);
  if (self)
    Property = objc_getProperty(self, v6, 16, 1);
  else
    Property = 0;
  v8 = objc_msgSend(Property, "setLastStopReason:", v4);
  v10 = ne_log_obj(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      v13 = objc_getProperty(self, v12, 16, 1);
    else
      v13 = 0;
    v14 = (objc_class *)objc_opt_class(self);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    v29 = v13;
    v30 = 2112;
    v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin set status to disconnected", buf, 0x16u);

  }
  if (self && self->_isUninstalled)
  {
    v19 = ne_log_obj(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_getProperty(self, v21, 16, 1);
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412546;
      v29 = v22;
      v30 = 2112;
      v31 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ in state %@: disposing all plugins", buf, 0x16u);

    }
    objc_msgSend(objc_getProperty(self, v26, 16, 1), "setState:", 8);
  }
}

- (void)handleTimeout
{
  const char *v3;
  id Property;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handleTimeout](&v5, "handleTimeout");
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  objc_msgSend(Property, "setState:", 8);
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

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v5, "handlePlugin:didStartWithPID:error:", a3, 0, a5);
}

@end
