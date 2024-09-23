@implementation NESMFlowDivertSession

- (NESMFlowDivertSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NESMFlowDivertSession *v16;
  objc_super v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_msgSend(a3, "copy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appVPN"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
  objc_msgSend(v14, "updateAppRulesForUID:", objc_msgSend(v15, "unsignedIntValue"));

  v18.receiver = self;
  v18.super_class = (Class)NESMFlowDivertSession;
  v16 = -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:](&v18, "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:", v13, v12, v11, v10, 2);

  return v16;
}

- (void)dealloc
{
  __SCDynamicStore *scstore;
  objc_super v4;

  if (self)
  {
    scstore = self->_scstore;
    if (scstore)
      CFRelease(scstore);
  }
  v4.receiver = self;
  v4.super_class = (Class)NESMFlowDivertSession;
  -[NESMVPNSession dealloc](&v4, "dealloc");
}

- (int64_t)agentPluginClass
{
  return 2;
}

- (void)setConfigurationWithCompletionHandler:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F18C;
  v3[3] = &unk_1000BD5B0;
  v3[4] = self;
  -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:](self, "queueChangesToTunnelConfiguration:completionHandler:", v3, a3);
}

- (void)requestInstall
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_opt_class(NESMVPNSession);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0 && (id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    objc_msgSend(v4, "requestInstallForSession:withParentSession:exclusive:", self, v5, 0);

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    objc_msgSend(v5, "requestInstallForSession:withParentSession:exclusive:", self, 0, 0);
  }

}

- (void)install
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F110;
  v3[3] = &unk_1000BD5D8;
  objc_copyWeak(&v4, &location);
  -[NESMFlowDivertSession setConfigurationWithCompletionHandler:](self, "setConfigurationWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)uninstall
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  __CFString *NetworkServiceEntity;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFArray *v13;
  void *v14;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002EF6C((uint64_t)v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002C404((uint64_t)v4);

  sub_10007BFA4(self, v5);
  if (self)
  {
    if (self->_scstore)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, (CFStringRef)objc_msgSend(v8, "UUIDString"), kSCEntNetProxies);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v12 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, (CFStringRef)objc_msgSend(v11, "UUIDString"), kSCEntNetDNS);

      v15[0] = NetworkServiceEntity;
      v15[1] = v12;
      v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      SCDynamicStoreSetMultiple(self->_scstore, 0, v13, 0);

    }
    objc_setProperty_atomic(self, v6, 0, 688);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v14, "handleClearConfigurationResult:", 1);

}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  const char *v8;
  xpc_object_t reply;
  id Property;
  void *v11;
  const char *v12;
  id v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  xpc_object_t v19;
  xpc_object_t value;
  void *v21;
  void *v22;
  xpc_object_t v23;
  void *v24;
  void *v25;
  uint64_t uint64;
  const char *string;
  void *v28;
  void *v29;
  xpc_object_t v30;
  void *v31;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v33;
  objc_super v34;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  if ((_DWORD)v4 == 4)
  {
    reply = xpc_dictionary_create_reply(v6);
    if (self)
      Property = objc_getProperty(self, v8, 688, 1);
    else
      Property = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "keyMaterial"));

    if (v11)
    {
      if (self)
        v13 = objc_getProperty(self, v12, 688, 1);
      else
        v13 = 0;
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyMaterial")));
      v16 = objc_msgSend(v14, "bytes");
      if (self)
        v17 = objc_getProperty(self, v15, 688, 1);
      else
        v17 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keyMaterial"));
      v19 = xpc_data_create(v16, (size_t)objc_msgSend(v18, "length"));

      value = xpc_dictionary_get_value(v7, "SessionOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue(value);
      v22 = v21;
      if (v21 && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v23 = xpc_dictionary_get_value(v22, "SessionFlowDivertTokenProperties");
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = v24;
        if (v24 && xpc_get_type(v24) == (xpc_type_t)&_xpc_type_dictionary)
        {
          uint64 = xpc_dictionary_get_uint64(v22, "SessionFlowDivertTokenControlUnit");
          string = xpc_dictionary_get_string(v22, "SessionFlowDivertTokenSigningIdentifier");
          v28 = (void *)ne_session_policy_copy_flow_divert_token_with_key(uint64, v25, string, v19);
          v29 = v28;
          if (v28 && xpc_get_type(v28) == (xpc_type_t)&_xpc_type_data)
          {
            v30 = xpc_dictionary_create(0, 0, 0);
            v31 = v30;
            if (v30 && xpc_get_type(v30) == (xpc_type_t)&_xpc_type_dictionary)
            {
              xpc_dictionary_set_value(v31, "SessionFlowDivertTokenKey", v29);
              xpc_dictionary_set_value(reply, "SessionInfo", v31);
            }

          }
        }

      }
    }
    remote_connection = xpc_dictionary_get_remote_connection(v7);
    v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v33, reply);

  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)NESMFlowDivertSession;
    -[NESMVPNSession handleGetInfoMessage:withType:](&v34, "handleGetInfoMessage:withType:", v6, v4);
  }

}

- (id)pluginDidRequestFlowDivertControlSocket:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  const char *v9;
  void *v10;
  uint64_t v11;
  id Property;
  id v13;
  id v14;
  const char *v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appVPN"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v7 = objc_opt_class(NETransparentProxyProviderProtocol);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v11 = (uint64_t)objc_msgSend(v10, "order");

  }
  else
  {
    v11 = 0x7FFFFFFFLL;
  }
  if (self)
    Property = objc_getProperty(self, v9, 688, 1);
  else
    Property = 0;
  v13 = objc_alloc((Class)NEFlowDivertFileHandle);
  if (Property)
  {
    v14 = objc_msgSend(v13, "initFlowDivertDataSocket");
  }
  else
  {
    v14 = objc_msgSend(v13, "initFlowDivertControlSocketWithParams:order:", v5 == 0, v11);
    if (self)
      objc_setProperty_atomic(self, v15, v14, 688);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "handle"));

  return v16;
}

- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F078;
  v12[3] = &unk_1000BD600;
  v11 = v10;
  v13 = v11;
  objc_copyWeak(&v14, &location);
  -[NESMFlowDivertSession setConfigurationWithCompletionHandler:](self, "setConfigurationWithCompletionHandler:", v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4
{
  -[NESMFlowDivertSession plugin:didSetConfiguration:completionHandler:](self, "plugin:didSetConfiguration:completionHandler:", a3, 0, a4);
}

- (BOOL)resetPerAppPolicy
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  id Property;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint64_t v42;
  NSObject *v43;
  BOOL v44;
  void *v45;
  const char *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _DWORD *v71;
  __int128 buf;
  uint64_t (*v73)(uint64_t, void *);
  void *v74;
  _DWORD *v75;
  id v76;
  id v77;
  id v78;
  unsigned int v79;
  unsigned __int8 v80;
  BOOL v81;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appVPN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appRules"));
  if (!objc_msgSend(v5, "count") || !-[NESMSession isActive](self, "isActive"))
  {

    return 1;
  }
  if (self)
    Property = objc_getProperty(self, v6, 688, 1);
  else
    Property = 0;

  if (!Property)
    return 1;
  v10 = ne_log_obj(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Re-setting app rule policy", (uint8_t *)&buf, 0xCu);
  }

  v12 = objc_alloc_init((Class)NSMutableString);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appVPN"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appRules"));
  objc_msgSend(v12, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("Current app rules"), 0, 0);

  v16 = ne_log_large_obj();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appVPN"));
  if (self)
    v21 = objc_getProperty(self, v19, 688, 1);
  else
    v21 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "handle"));
  v23 = objc_msgSend(v20, "installSigningIdentifiersWithFlowDivertControlSocket:", objc_msgSend(v22, "fileDescriptor"));

  if ((v23 & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "appVPN"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "appRules"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    sub_10003A874((uint64_t)v26, v29, (uint64_t)objc_msgSend(v30, "intValue"));

    v31 = objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "appVPN"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "appRules"));
    if (self)
      v36 = objc_getProperty(self, v34, 688, 1);
    else
      v36 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "controlUnit"));
    v62 = objc_msgSend(v37, "unsignedIntValue");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "DNSSettings"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "proxySettings"));
    v40 = objc_msgSend(v64, "enabled");
    v70 = v32;
    v71 = (_DWORD *)v31;
    v63 = v12;
    v68 = v37;
    v69 = v33;
    v67 = v38;
    if ((v40 & 1) != 0)
    {
      v61 = 1;
    }
    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "proxySettings"));
      v61 = objc_msgSend(v59, "enabled");
    }
    v66 = (void *)v39;
    v44 = v39 != 0;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    v47 = sub_100016BDC(v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "appVPN"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "excludedDomains"));
    v52 = v35;
    v53 = v48;
    v54 = v51;
    v55 = (char)v71;
    if (v71)
    {
      if (isa_nsarray(v52) && v71[2] == 2)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v73 = sub_100040A44;
        v74 = &unk_1000BDDB0;
        v75 = v71;
        v79 = v62;
        v80 = v61;
        v81 = v44;
        v76 = v52;
        v77 = v53;
        v78 = v54;
        v55 = sub_10002C9C8((uint64_t)NESMPolicyMasterSession, &buf);

      }
      else
      {
        v55 = 0;
      }
    }

    if ((v40 & 1) == 0)
    {

    }
    if ((v55 & 1) != 0)
    {

      return 1;
    }
    v58 = ne_log_obj(v56, v57);
    v43 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@: failed to update the flow divert policies after installed applications changed", (uint8_t *)&buf, 0xCu);
    }
    v12 = v63;
  }
  else
  {
    v42 = ne_log_obj(v24, v25);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@: failed to install the signing identifiers in the kernel", (uint8_t *)&buf, 0xCu);
    }
  }

  return 0;
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_msgSend(a3, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appVPN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
  objc_msgSend(v5, "updateAppRulesForUID:", objc_msgSend(v6, "unsignedIntValue"));

  v8.receiver = self;
  v8.super_class = (Class)NESMFlowDivertSession;
  LOBYTE(self) = -[NESMVPNSession handleUpdateConfiguration:](&v8, "handleUpdateConfiguration:", v4);

  return (char)self;
}

- (void)handleInstalledAppsChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EFFC;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleUserLogin
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF80;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowDivertControlSocketHandle, 0);
}

@end
