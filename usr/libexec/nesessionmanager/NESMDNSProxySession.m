@implementation NESMDNSProxySession

- (NESMDNSProxySession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6
{
  NESMDNSProxySession *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NESMDNSProxySession;
  result = -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:](&v7, "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:", a3, a4, a5, a6, 6);
  if (result)
    result->_restartIntervalSecs = 1;
  return result;
}

- (int64_t)agentPluginClass
{
  return 3;
}

- (id)providerBundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "providerBundleIdentifier"));

  return v3;
}

- (id)authenticationPluginBundleIdentifier
{
  return 0;
}

- (id)providerDesignatedRequirement
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "designatedRequirement"));

  return v3;
}

- (void)setProviderDesignatedRequirement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  objc_msgSend(v5, "setDesignatedRequirement:", v4);

}

- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dnsProxy"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protocol"));

  v5 = objc_opt_class(NEDNSProxyProviderProtocol);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMDNSProxySession providerDesignatedRequirement](self, "providerDesignatedRequirement"));
    objc_msgSend(v7, "setDesignatedRequirement:", v6);

  }
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession createConnectParametersWithStartMessage:](&v10, "createConnectParametersWithStartMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dnsProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "protocol"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "providerConfiguration"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "providerConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("VendorData"));

  }
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  char v3;
  NSObject *v5;
  _QWORD block[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession handleNetworkConfigurationChange:](&v7, "handleNetworkConfigurationChange:");
  if ((v3 & 2) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C038;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  NESMDNSProxySession *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dnsProxy"));
    if (objc_msgSend(v6, "isEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dnsProxy"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "perApp"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appRules"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "perApp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appRules"));
      v14 = v10 != v13;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  v24.receiver = self;
  v24.super_class = (Class)NESMDNSProxySession;
  v15 = (id)-[NESMFlowDivertSession handleUpdateConfiguration:](&v24, "handleUpdateConfiguration:", v5);
  v17 = (char)v15;
  if ((_DWORD)v15)
    v18 = !v14;
  else
    v18 = 1;
  if (!v18)
  {
    v19 = ne_log_obj(v15, v16);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: Handling Update Configuration - updating policies <%@>", buf, 0x16u);

    }
    -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 1);
  }

  return v17;
}

- (void)handleInstalledAppsChanged
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  NESMDNSProxySession *v8;
  __int16 v9;
  void *v10;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Handling installed apps change <%@>", (uint8_t *)&v7, 0x16u);

  }
  -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 2);
}

- (void)handleCaptiveNetworkPluginsChanged
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  NESMDNSProxySession *v8;
  __int16 v9;
  void *v10;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Handling installed captive plugins change (%@>", (uint8_t *)&v7, 0x16u);

  }
  -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 2);
}

- (void)handleChangeEventForRankedInterfaces
{
  -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 1);
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  NESMDNSProxySession *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;

  if (a3 <= 5)
  {
    v3 = *(_QWORD *)&a3;
    if (((1 << a3) & 0x26) != 0)
    {
      v5 = ne_log_obj(self, a2);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = inputNotification2String(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        *(_DWORD *)buf = 138412802;
        v13 = self;
        v14 = 2080;
        v15 = v7;
        v16 = 2112;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: received a %s notification <%@>", buf, 0x20u);

      }
      if ((v3 - 1) <= 1)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002BE90;
        block[3] = &unk_1000BEB80;
        block[4] = self;
        dispatch_async(v10, block);

      }
      -[NESMSession restartSession](self, "restartSession");
    }
  }
}

- (void)setStatus:(int)a3
{
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t restartIntervalSecs;
  int64_t v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD handler[4];
  id v20;
  objc_super v21;
  uint8_t buf[4];
  NESMDNSProxySession *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;

  v3 = *(_QWORD *)&a3;
  v5 = -[NESMSession status](self, "status");
  v21.receiver = self;
  v21.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession setStatus:](&v21, "setStatus:", v3);
  if (-[NESMSession status](self, "status") == 1
    && v5 != 1
    && (!self || !self->_externallyStopped)
    && -[NESMSession lastStopReason](self, "lastStopReason") != 3
    && -[NESMSession lastStopReason](self, "lastStopReason") != 6
    && (id)-[NESMVPNSession state](self, "state") != (id)9)
  {
    if (qword_1000CF8B8 != -1)
      dispatch_once(&qword_1000CF8B8, &stru_1000BD9E0);
    v6 = mach_absolute_time();
    if (self && (v6 - self->_pluginStartTicks) / qword_1000CF450 >= 0x3C)
      self->_restartIntervalSecs = 1;
    v8 = ne_log_obj(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = ne_session_stop_reason_to_string(-[NESMSession lastStopReason](self, "lastStopReason"));
      if (self)
        restartIntervalSecs = self->_restartIntervalSecs;
      else
        restartIntervalSecs = 0;
      *(_DWORD *)buf = 138412802;
      v23 = self;
      v24 = 2080;
      v25 = v10;
      v26 = 2048;
      v27 = restartIntervalSecs;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: unexpected disconnect (%s), restarting in ~%lu seconds", buf, 0x20u);
    }

    sub_10002BD08((uint64_t)self, 0);
    if (self)
      v12 = 1000000000 * self->_restartIntervalSecs;
    else
      v12 = 0;
    v13 = dispatch_time(0, v12);
    v14 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);

    if (self)
      v16 = 100000000 * self->_restartIntervalSecs;
    else
      v16 = 0;
    dispatch_source_set_timer(v15, v13, 0xFFFFFFFFFFFFFFFFLL, v16);
    objc_initWeak((id *)buf, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002BD78;
    handler[3] = &unk_1000BDA08;
    objc_copyWeak(&v20, (id *)buf);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate(v15);
    sub_10002BD08((uint64_t)self, v15);
    if (self)
    {
      v17 = self->_restartIntervalSecs;
      if (v17 != 60)
      {
        v18 = 3 * v17;
        self->_restartIntervalSecs = v18;
        if (v18 >= 0x3D)
          self->_restartIntervalSecs = 60;
      }
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

- (void)handleStartMessage:(id)a3
{
  const char *v4;
  id v5;
  xpc_object_t value;
  void *v7;
  void *v8;
  xpc_connection_t remote_connection;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  id v19;
  const char *v20;
  void *v21;
  SEL v22;
  id Property;
  uint64_t v24;
  xpc_object_t v25;
  void *v26;
  void *v27;
  NETestAgent *v28;
  void *v29;
  void *v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  NEDNSProxyPlugin *v34;
  void *v35;
  NEDNSProxyPlugin *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;

  v5 = a3;
  if (self)
    objc_setProperty_atomic(self, v4, 0, 728);
  value = xpc_dictionary_get_value(v5, "SessionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue(value);
  v8 = v7;
  if (!v7 || xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary || !xpc_dictionary_get_BOOL(v8, "test-agent"))
    goto LABEL_26;
  remote_connection = xpc_dictionary_get_remote_connection(v5);
  v10 = objc_claimAutoreleasedReturnValue(remote_connection);
  v12 = (void *)v10;
  if (!v10)
  {
LABEL_10:
    v15 = ne_log_obj(v10, v11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
      objc_msgSend(v17, "handleStartMessage:", v5);

      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v45 = "com.apple.private.networkextension.test-control";
    v37 = "Test provider does not have the %s entitlement";
    v38 = v16;
    v39 = 12;
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_11;
  }
  v13 = (void *)xpc_connection_copy_entitlement_value(v10, "com.apple.private.networkextension.test-control");
  v14 = v13;
  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_BOOL)
  {

    goto LABEL_10;
  }
  v18 = xpc_BOOL_get_value(v14);

  if (!v18)
    goto LABEL_10;
  v19 = objc_msgSend(objc_alloc((Class)NEProcessIdentity), "initFromXPCConnection:", v12);
  v21 = v19;
  if (!self)
  {

    goto LABEL_30;
  }
  objc_setProperty_atomic(self, v20, v19, 728);

  Property = objc_getProperty(self, v22, 728, 1);
  if (!Property)
  {
LABEL_30:
    v42 = ne_log_obj(Property, v24);
    v16 = objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v37 = "Failed to create a process identity from the session connection";
    v38 = v16;
    v39 = 2;
    goto LABEL_20;
  }
  v25 = xpc_dictionary_get_value(v8, "listener-endpoint");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v26 && xpc_get_type(v26) == (xpc_type_t)&_xpc_type_endpoint)
  {
    v28 = [NETestAgent alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "pluginType"));
    v31 = sub_100063C34((id *)&v28->super.super.isa, v30, 3, v5);

    if (v31)
    {
      v34 = [NEDNSProxyPlugin alloc];
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v36 = -[NEVPNTunnelPlugin initWithAgent:delegateQueue:andDelegate:](v34, "initWithAgent:delegateQueue:andDelegate:", v31, v35, self);
      -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v36);

    }
    else
    {
      v40 = ne_log_obj(v32, v33);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to create a test agent", buf, 2u);
      }

    }
  }

LABEL_26:
  v43.receiver = self;
  v43.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession handleStartMessage:](&v43, "handleStartMessage:", v5);
  sub_10002BD08((uint64_t)self, 0);
  if (self)
    self->_externallyStopped = 0;
LABEL_28:

}

- (void)handleStopMessageWithReason:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession handleStopMessageWithReason:](&v4, "handleStopMessageWithReason:", *(_QWORD *)&a3);
  sub_10002BD08((uint64_t)self, 0);
  if (self)
  {
    self->_externallyStopped = 1;
    self->_restartIntervalSecs = 1;
  }
}

- (void)prepareNetwork
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v2, "handleNetworkPrepareResult:", &stru_1000BF2E8);

}

- (BOOL)waitForPerApp
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalIdentifier"));
  if (!v4)
    goto LABEL_9;
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dnsProxy"));
  if (!objc_msgSend(v7, "isEnabled"))
  {

LABEL_9:
    return 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dnsProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "perApp"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dnsProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "perApp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    objc_msgSend(v13, "updateAppRulesForUID:", objc_msgSend(v14, "unsignedIntValue"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dnsProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "perApp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appRules"));
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dnsProxy"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "perApp"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "appRules"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
      sub_10003A874((uint64_t)v20, v24, (uint64_t)objc_msgSend(v25, "intValue"));

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dnsProxy"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "perApp"));
    v29 = objc_msgSend(v28, "copyCachedMachOUUIDs");

    if (v29)
      return 0;
  }
  return 1;
}

- (void)install
{
  void *v3;
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  NESMDNSProxySession *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002EE84((uint64_t)v3);

  v5 = sub_10002B744(self, v4);
  v7 = v5;
  if ((v5 & 1) == 0)
  {
    v8 = ne_log_obj(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@: failed to set the DNSProxy policies", (uint8_t *)&v11, 0xCu);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v10, "handleSetConfigurationResult:", v7);

  if (self)
    self->_installed = 1;
}

- (void)uninstall
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMDNSProxySession;
  -[NESMFlowDivertSession uninstall](&v5, "uninstall");
  if (self)
  {
    if (self->_externallyStopped)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002C404((uint64_t)v3);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EF6C((uint64_t)v4);

    }
    self->_installed = 0;
  }
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  objc_super v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession plugin:didStartWithPID:error:](&v11, "plugin:didStartWithPID:error:", v8, v6, a5);
  if ((int)v6 >= 1)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));

    if (v9 == v8)
    {
      v10 = mach_absolute_time();
      if (self)
      {
        self->_pluginStartTicks = v10;
        sub_10002BACC(self);
      }
    }
  }

}

- (void)handleUserLogin
{
  sub_10002B744(self, a2);
  -[NESMSession startWithCommand:isOnDemand:](self, "startWithCommand:isOnDemand:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processToFilter, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
}

@end
