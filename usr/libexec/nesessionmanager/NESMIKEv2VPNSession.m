@implementation NESMIKEv2VPNSession

- (NESMIKEv2VPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7
{

  return 0;
}

- (BOOL)initializePlugins
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NEAgent *v8;
  void *v9;
  NSObject *v10;
  NEVPNTunnelPlugin *v11;
  void *v12;
  NEVPNTunnelPlugin *v13;
  void *v14;
  void *v15;
  void *v16;
  NEAgent *v17;
  void *v18;
  void *v19;
  NEAgent *v20;
  NEVPNAuthenticationPlugin *v21;
  void *v22;
  NEVPNAuthenticationPlugin *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  NESMIKEv2VPNSession *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));

  if (v3)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));

  if (v5)
  {
    v8 = [NEAgent alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    v10 = -[NEAgent initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:](v8, "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:", CFSTR("com.apple.NetworkExtension.IKEv2Provider"), 1, 5, &off_1000C18A8, v9);

    if (v10)
    {
      v11 = [NEVPNTunnelPlugin alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v13 = -[NEVPNTunnelPlugin initWithAgent:delegateQueue:andDelegate:](v11, "initWithAgent:delegateQueue:andDelegate:", v10, v12, self);
      -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession extensibleSSOProvider](self, "extensibleSSOProvider"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession extensibleSSOProvider](self, "extensibleSSOProvider", CFSTR("plugin-path")));
      v28 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));

      v17 = [NEAgent alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
      v20 = -[NEAgent initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:](v17, "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:", v18, 0, 8, v16, v19);

      v21 = [NEVPNAuthenticationPlugin alloc];
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v23 = -[NEPlugin initWithAgent:delegateQueue:andDelegate:](v21, "initWithAgent:delegateQueue:andDelegate:", v20, v22, self);
      -[NESMVPNSession setAuthenticationPlugin:](self, "setAuthenticationPlugin:", v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    v4 = v24 != 0;

  }
  else
  {
    v25 = ne_log_obj(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: No UID available, cannot create plugin", buf, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  NESMIKEv2VPNSession *v12;
  const char *v13;
  NESMIKEv2VPNSession *v14;
  id v15;
  void *v16;
  const char *v17;
  void *v18;
  NESMIKEv2VPNSession *Property;
  SEL v20;
  id v21;
  _DWORD *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  NSObject *v35;
  objc_super v36;
  char v37;
  uint8_t buf[4];
  const char *v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  if (-[NESMVPNSession sessionType](self, "sessionType") == 3)
  {
    if (!objc_msgSend(v5, "natKeepAliveOffloadEnable"))
      objc_msgSend(v5, "setNatKeepAliveOffloadEnable:", 2);
    buf[0] = 0;
    v37 = 0;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName")));
    NEGetInterfaceType(objc_msgSend(v6, "UTF8String"), buf, &v37);

    if (buf[0] && v37)
    {
      objc_msgSend(v5, "setNatKeepAliveOffloadInterval:", 20);
    }
    else if (!buf[0]
           && (!objc_msgSend(v5, "natKeepAliveOffloadInterval")
            || objc_msgSend(v5, "natKeepAliveOffloadInterval") == 110))
    {
      v7 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
      v8 = (void *)v7;
      if (v7)
        v9 = *(_DWORD *)(v7 + 356);
      else
        v9 = 0;
      if (v9 <= 0x6E)
        v10 = 110;
      else
        v10 = v9;
      objc_msgSend(v5, "setNatKeepAliveOffloadInterval:", v10);

    }
    objc_msgSend(v5, "setDisableMOBIKERetryOnWake:", 1);
  }
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v12 = self;
    v14 = v12;
    if (v11)
    {
      if (v12)
      {
        v15 = objc_msgSend(objc_getProperty(v11, v13, 360, 1), "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v18 = v16;
        if (v16)
          Property = (NESMIKEv2VPNSession *)objc_getProperty(v16, v17, 24, 1);
        else
          Property = 0;

        v21 = objc_getProperty(v11, v20, 360, 1);
        if (Property == v14)
        {
          v29 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 1));
          if (v29)
            v23 = v29[2];
          else
            v23 = 0;

          v32 = ne_log_obj(v30, v31);
          v27 = objc_claimAutoreleasedReturnValue(v32);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            goto LABEL_32;
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v23;
          v28 = "shouldDisableInitialContactForSession fallback session status %d";
        }
        else
        {
          v22 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
          if (v22)
            v23 = v22[2];
          else
            v23 = 0;

          v26 = ne_log_obj(v24, v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            goto LABEL_32;
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v23;
          v28 = "shouldDisableInitialContactForSession primary session status %d";
        }
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 8u);
LABEL_32:

        v33 = v23 > 1;
LABEL_33:

        objc_msgSend(v5, "setDisableInitialContact:", v33);
        goto LABEL_34;
      }
      v34 = ne_log_obj(0, v13);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[NESMIKEv2VPNFallbackSession shouldDisableInitialContactForSession:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "%s called with null session", buf, 0xCu);
      }

    }
    v33 = 0;
    goto LABEL_33;
  }
LABEL_34:
  v36.receiver = self;
  v36.super_class = (Class)NESMIKEv2VPNSession;
  -[NESMVPNSession createConnectParametersWithStartMessage:](&v36, "createConnectParametersWithStartMessage:", v4);

}

- (BOOL)prepareConfigurationForStart
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NESMIKEv2VPNSession *v22;
  __int16 v23;
  void *v24;

  if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)1)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
  v5 = sub_10000A998((uint64_t)v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alwaysOnVPN"));
  objc_msgSend(v8, "setActiveInterfaceProtocolKey:", v6);

  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "alwaysOnVPN"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeInterfaceProtocolKey"));
    v21 = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@: prepareConfigurationForStart: activeInterfaceProtocolKey %@", (uint8_t *)&v21, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alwaysOnVPN"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeInterfaceProtocolKey"));
  v16 = v15 != 0;

  return v16;
}

- (void)setStatus:(int)a3
{
  uint64_t v3;
  unsigned int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int64_t v19;
  __CFString *v20;
  __CFString *v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  __CFString *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[4];
  __CFString *v38;
  unint64_t v39;
  id v40;
  id v41;
  unsigned __int8 v42;
  unsigned __int8 v43;

  v3 = *(_QWORD *)&a3;
  v5 = -[NESMSession status](self, "status");
  v36.receiver = self;
  v36.super_class = (Class)NESMIKEv2VPNSession;
  -[NESMVPNSession setStatus:](&v36, "setStatus:", v3);
  if (self && (_DWORD)v3 == 3)
    self->_sessionDidConnect = 1;
  if (!-[NESMSession isOnDemand](self, "isOnDemand")
    && (id)-[NESMVPNSession tunnelKind](self, "tunnelKind") == (id)1
    && -[NESMVPNSession sessionType](self, "sessionType") != 3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationIdentifier"));
    if (v7)
    {

    }
    else
    {
      if (self)
        v25 = !self->_sessionDidConnect;
      else
        v25 = 1;

      if ((_DWORD)v3 == 1 && v25 && v5 != 1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](self, "lastDisconnectError"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userInfo"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("LocalizedHeader")));

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](self, "lastDisconnectError"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "userInfo"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

        if (v28 && v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession notification](self, "notification"));
          objc_msgSend(v32, "cancel");

          v33 = objc_alloc((Class)NEUserNotification);
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
          v35 = objc_msgSend(v33, "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:", v28, v31, 0, 0, 0, 0, 0, v34, &stru_1000BE3D8);
          -[NESMVPNSession setNotification:](self, "setNotification:", v35);

        }
        if (self)
          goto LABEL_12;
        return;
      }
    }
  }
  if ((_DWORD)v3 == 5)
  {
    if (self)
    {
      if (qword_1000CF900 != -1)
        dispatch_once(&qword_1000CF900, &stru_1000BE3F8);
      if (-[NESMSession connectTime](self, "connectTime"))
      {
        v8 = (unint64_t)(*(double *)&qword_1000CF908 * (double)mach_absolute_time());
        v9 = -[NESMSession connectTime](self, "connectTime");
        v10 = v8 - v9;
        if (v8 != v9)
        {
          v11 = -[NESMVPNSession copyStatistics](self, "copyStatistics");
          v12 = v11;
          if (v11)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VPN")));
            v14 = v13;
            if (v13)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BytesIn")));
              v16 = objc_msgSend(v15, "unsignedLongLongValue");

              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BytesOut")));
              v18 = objc_msgSend(v17, "unsignedLongLongValue");

              v19 = -[NESMVPNSession tunnelKind](self, "tunnelKind");
              v20 = CFSTR("Fallback Tunnel");
              if (v19 == 1)
                v20 = CFSTR("Primary Tunnel");
              v21 = v20;
              v22 = -[NESMSession isOnDemand](self, "isOnDemand");
              v23 = sub_100076E38(self);
              v37[0] = _NSConcreteStackBlock;
              v37[1] = 3221225472;
              v37[2] = sub_10006D58C;
              v37[3] = &unk_1000BE420;
              v42 = v23;
              v43 = v22;
              v38 = v21;
              v39 = v10;
              v40 = v16;
              v41 = v18;
              v24 = v21;
              AnalyticsSendEventLazy(CFSTR("com.apple.NetworkExtension.IKEv2Tunnel"), v37);

            }
          }

        }
      }
    }
  }
  else if ((_DWORD)v3 == 1 && self)
  {
LABEL_12:
    self->_sessionDidConnect = 0;
  }
}

- (int)getVirtualInterfaceMTU:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v6 = objc_msgSend(v5, "mtu");
  if ((unint64_t)v6 >= 0x3E8 && (v6 = objc_msgSend(v5, "mtu"), (unint64_t)v6 < 0x5DD))
  {
    v11 = objc_msgSend(v5, "mtu");
  }
  else
  {
    v8 = ne_log_obj(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = objc_msgSend(v5, "mtu");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "requested mtu size out of range %lu", (uint8_t *)&v13, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MTU"));
    v11 = objc_msgSend(v10, "intValue");

  }
  return v11;
}

@end
