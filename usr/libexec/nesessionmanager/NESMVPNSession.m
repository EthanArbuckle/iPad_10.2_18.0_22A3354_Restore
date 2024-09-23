@implementation NESMVPNSession

- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7 sessionQueue:(id)a8 messageQueue:(id)a9 tunnelKind:(int64_t)a10 parent:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NESMVPNSession *v23;
  NESMVPNSession *v24;
  OS_xpc_object *establishIPCReply;
  OS_xpc_object *establishIPCMessage;
  dispatch_queue_attr_t v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *tunnelConfigQueue;
  NSMutableArray *v31;
  NSMutableArray *setConfigurationCompletionHandlerArray;
  id pluginCompletionHandler;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NESMPolicySession *v42;
  void *v43;
  id *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NESMVPNSessionRetryCounter *v57;
  SEL v58;
  NESMVPNSession *v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  id v65;
  id v66;
  uint8_t buf[16];
  objc_super v68;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v66 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v68.receiver = self;
  v68.super_class = (Class)NESMVPNSession;
  v23 = -[NESMSession initWithConfiguration:andServer:sessionQueue:messageQueue:](&v68, "initWithConfiguration:andServer:sessionQueue:messageQueue:", v17, v18, v20, v21);
  v24 = v23;
  if (!v23)
    goto LABEL_19;
  v65 = v18;
  v23->_sessionType = a7;
  v23->_state = 0;
  objc_storeStrong((id *)&v23->_protocol, a5);
  establishIPCReply = v24->_establishIPCReply;
  v24->_establishIPCReply = 0;

  establishIPCMessage = v24->_establishIPCMessage;
  v24->_establishIPCMessage = 0;

  v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = dispatch_queue_create("tunnel changes queue", v28);
  tunnelConfigQueue = v24->_tunnelConfigQueue;
  v24->_tunnelConfigQueue = (OS_dispatch_queue *)v29;

  NEInitCFTypes();
  v31 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  setConfigurationCompletionHandlerArray = v24->_setConfigurationCompletionHandlerArray;
  v24->_setConfigurationCompletionHandlerArray = v31;

  pluginCompletionHandler = v24->_pluginCompletionHandler;
  v24->_pluginCompletionHandler = 0;

  v24->_tunnelKind = a10;
  v24->_stopped = 1;
  if (v22)
  {
    v34 = objc_opt_class(NESMAlwaysOnSession);
    if ((objc_opt_isKindOfClass(v22, v34) & 1) != 0)
    {
      v35 = 1;
    }
    else
    {
      v36 = objc_opt_class(NESMIKEv2VPNFallbackSession);
      if ((objc_opt_isKindOfClass(v22, v36) & 1) == 0)
        abort();
      v35 = 2;
    }
    v24->_parentType = v35;
    objc_storeWeak((id *)&v24->_parent, v22);
  }
  if (a7 <= 6 && ((1 << a7) & 0x46) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "VPN"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "VPN"));
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appVPN"));

      if (!v39)
      {
        v41 = 1;
        goto LABEL_15;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appVPN"));
    }
    v40 = v38;
    v41 = (uint64_t)objc_msgSend(v38, "tunnelType");

LABEL_15:
    v42 = [NESMPolicySession alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    v44 = sub_10002EB54((id *)&v42->super.isa, v43, a7, objc_msgSend(v17, "grade"), (void *)v41, (void *)a10);
    -[NESMSession setPolicySession:](v24, "setPolicySession:", v44);

    sub_10007AAF8(v24);
  }
  v45 = objc_msgSend(objc_alloc((Class)NEPolicySession), "initWithSessionName:", CFSTR("VPN control"));
  -[NESMSession setControlPolicySession:](v24, "setControlPolicySession:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v24, "controlPolicySession"));
  if (!v46)
  {
    v60 = ne_log_obj(v47, v48);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      v59 = 0;
      v18 = v65;
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v62 = "Failed to create VPN control policy session";
LABEL_27:
    _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, v62, buf, 2u);
    goto LABEL_23;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v24, "controlPolicySession"));
  objc_msgSend(v49, "setPriority:", 100);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v24, "controlPolicySession"));
  objc_msgSend(v50, "lockSessionToCurrentProcess");

  v51 = objc_msgSend(objc_alloc((Class)NEPolicySession), "initWithSessionName:", CFSTR("VPN high"));
  -[NESMSession setHighPolicySession:](v24, "setHighPolicySession:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v24, "highPolicySession"));
  if (!v52)
  {
    v63 = ne_log_obj(v53, v54);
    v61 = objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v62 = "Failed to create VPN high policy session";
    goto LABEL_27;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v24, "highPolicySession"));
  objc_msgSend(v55, "setPriority:", 400);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v24, "highPolicySession"));
  objc_msgSend(v56, "lockSessionToCurrentProcess");

  v57 = objc_alloc_init(NESMVPNSessionRetryCounter);
  objc_setProperty_atomic(v24, v58, v57, 456);

  v18 = v65;
LABEL_19:
  v59 = v24;
LABEL_24:

  return v59;
}

- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7
{
  return -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sessionQueue:messageQueue:tunnelKind:parent:](self, "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sessionQueue:messageQueue:tunnelKind:parent:", a3, a4, a5, a6, *(_QWORD *)&a7, 0, 0, 1, 0);
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NESMVPNSession parentType](self, "parentType");
  if (self)
  {
    v7 = -[NESMVPNSession tunnelKind](self, "tunnelKind");
    v8 = CFSTR("Fallback Tunnel");
    if (v7 != 2)
      v8 = &stru_1000BF2E8;
    if (v7 == 1)
      v8 = CFSTR("Primary Tunnel");
  }
  else
  {
    v8 = 0;
  }
  if (v6)
    v9 = CFSTR("Child:");
  else
    v9 = &stru_1000BF2E8;
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@%@:%@:%@:%@]"), v5, v9, v10, v12, v15, v16));

  return (NSString *)v17;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  const char *v5;
  NSObject *Property;
  SEL v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession notification](self, "notification"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession notification](self, "notification"));
    objc_msgSend(v4, "cancel");

  }
  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
    CFRelease(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
  if (self && objc_getProperty(self, v5, 448, 1))
  {
    Property = objc_getProperty(self, v5, 448, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(self, v7, 0, 448);
  }
  sub_100023B9C(self, v5);
  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSession;
  -[NESMSession dealloc](&v8, "dealloc");
}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int64_t state;
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const char *v21;
  dispatch_time_t v22;
  NSObject *v23;
  const char *v24;
  void (**Property)(void);
  SEL v26;
  _QWORD v27[5];
  int v28;

  if (self->_state == a3)
    return;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers"));

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7)),
        v7,
        v6,
        !v8))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NESMVPNSessionState stateWithType:](NESMVPNSessionState, "stateWithType:", a3));
    if (!v9)
      __assert_rtn("-[NESMVPNSession setState:]", "NESMVPNSession.m", 466, "0");
    v8 = (void *)v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers"));

    if (!v10)
    {
      v11 = objc_alloc_init((Class)NSMutableDictionary);
      -[NESMVPNSession setCachedStateHandlers:](self, "setCachedStateHandlers:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v13);

  }
  state = self->_state;
  -[NESMVPNSessionState leave](self->_stateHandler, "leave");
  self->_state = a3;
  objc_storeStrong((id *)&self->_stateHandler, v8);
  -[NESMVPNSessionState enterWithSession:](self->_stateHandler, "enterWithSession:", self);
  if (state)
  {
    if (state == 10)
    {
      v15 = self->_state;
      if (v15 == 1)
        goto LABEL_24;
    }
    else
    {
      v15 = self->_state;
    }
    v16 = 2;
    switch(v15)
    {
      case 0:
      case 1:
      case 9:
      case 10:
        if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)1)
          sub_100023968(self);
        goto LABEL_16;
      case 2:
      case 3:
      case 7:
        goto LABEL_23;
      case 4:
        v16 = 3;
        goto LABEL_23;
      case 5:
      case 8:
        v16 = 5;
        goto LABEL_23;
      case 6:
        v16 = 4;
        goto LABEL_23;
      default:
LABEL_16:
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "VPN"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "protocol"));
        v20 = objc_msgSend(v19, "includeAllNetworks");

        if (v20)
        {
          v22 = dispatch_time(0, 1000000000);
          v23 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100029EF0;
          v27[3] = &unk_1000BECF8;
          v27[4] = self;
          v28 = 1;
          dispatch_after(v22, v23, v27);

          goto LABEL_25;
        }
        v16 = 1;
        if (objc_getProperty(self, v21, 464, 1))
        {
          Property = (void (**)(void))objc_getProperty(self, v24, 464, 1);
          Property[2]();
          objc_setProperty_atomic_copy(self, v26, 0, 464);
        }
LABEL_23:
        -[NESMVPNSession setStatus:](self, "setStatus:", v16);
        break;
    }
  }
LABEL_24:
  -[NESMVPNSession applyNWPathOverridesIfNeeded](self, "applyNWPathOverridesIfNeeded");
LABEL_25:

}

- (void)addDefaultDropPolicyForPluginUUIDs:(id)a3
{
  id v4;
  void *v5;
  NESMVPNSession *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  NESMVPNSession *v13;
  id v14;

  v4 = a3;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v6 = self;
    v7 = v4;
    if (v5 && v6)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000BB44;
      block[3] = &unk_1000BE878;
      block[4] = v5;
      v13 = v6;
      v14 = v7;
      dispatch_async(v8, block);

    }
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100029D04;
    v10[3] = &unk_1000BEB58;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v9, v10);

  }
}

- (int64_t)agentPluginClass
{
  return 5;
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
  if (v5)
    v6 = objc_msgSend(v4, "isEqualToString:", v5);
  else
    v6 = 0;

  return v6;
}

- (NSString)providerBundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "providerBundleIdentifier"));

  return (NSString *)v3;
}

- (NSString)authenticationPluginBundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "authenticationPluginType"));

  return (NSString *)v3;
}

- (NSString)providerDesignatedRequirement
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "designatedRequirement"));

  return (NSString *)v3;
}

- (void)setProviderDesignatedRequirement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  objc_msgSend(v5, "setDesignatedRequirement:", v4);

}

- (NSString)extensibleSSOProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "extensibleSSOProvider"));

  return (NSString *)v3;
}

- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NESMVPNSession sessionType](self, "sessionType") == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "VPN"));
LABEL_5:
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protocol"));

    goto LABEL_7;
  }
  if (-[NESMVPNSession sessionType](self, "sessionType") == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appVPN"));
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  v7 = objc_opt_class(NETunnelProviderProtocol);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerDesignatedRequirement](self, "providerDesignatedRequirement"));
    objc_msgSend(v6, "setDesignatedRequirement:", v8);

  }
}

- (BOOL)initializePlugins
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **p_cache;
  objc_class *v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  int64_t v23;
  void *v24;
  id v25;
  int64_t v26;
  __objc2_class **v27;
  __objc2_class **v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  NESMVPNSession *v33;
  NSObject *v34;
  __CFString *v35;
  const __SCPreferences *v36;
  uint64_t v37;
  const __SCPreferences *v38;
  CFPropertyListRef Value;
  CFTypeID TypeID;
  uint64_t v41;
  CFTypeID v42;
  NESMVPNSession *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  NEVPNAuthenticationPlugin *v79;
  void *v80;
  NEVPNAuthenticationPlugin *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  NEVPNAuthenticationPlugin *v89;
  void *v90;
  NEVPNAuthenticationPlugin *v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  int v96;
  const char *v97;
  uint64_t v98;
  _UNKNOWN **v99;
  void *i;
  void *v101;
  id v102;
  id v103;
  void *v104;
  unsigned __int8 v105;
  NESMVPNSession *v106;
  void *v107;
  NESMVPNSession *v108;
  __CFString *v109;
  NESMVPNSession *v110;
  NSObject *v111;
  uint64_t v112;
  NSObject *obj;
  NSObject *v114;
  id v115;
  id v116;
  NSObject *log;
  id v118;
  unsigned __int8 v119;
  const __CFString *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  id v124[2];
  uint8_t buf[4];
  NESMVPNSession *v126;
  __int16 v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));

  if (!v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));

    if (!v6)
    {
      v4 = 1;
LABEL_72:

      return v4;
    }
    if (!self)
      goto LABEL_37;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pluginType"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerDesignatedRequirement](self, "providerDesignatedRequirement"));
    p_cache = &OBJC_METACLASS___NESMFilterSessionStateIdle.cache;
    v14 = (objc_class *)objc_opt_class(NEAgent);
    if (v11)
    {
      v15 = sub_10000C1FC();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = sub_10000D860((uint64_t)v16, v11, -[NESMVPNSession agentPluginClass](self, "agentPluginClass"));

      if (v17)
      {
        v18 = objc_opt_class(NESMAgent);
        if (!v12)
        {
          v66 = ne_log_obj(v18, v19);
          v20 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v126 = self;
            v127 = 2112;
            v128 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: Cannot create agent for plugin type %@, missing designated requirement", buf, 0x16u);
          }
          v25 = 0;
LABEL_19:

          if (v25)
          {
            v26 = -[NESMVPNSession agentPluginClass](self, "agentPluginClass");
            v27 = &off_1000BC520;
            v28 = &off_1000BC4E8;
            if (v26 != 3)
              v28 = &off_1000BC658;
            if (v26 != 2)
              v27 = v28;
            v29 = objc_alloc((Class)objc_opt_class(*v27));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
            v31 = objc_msgSend(v29, "initWithAgent:delegateQueue:andDelegate:", v25, v30, self);
            -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v31);

            v32 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPluginBundleIdentifier](self, "authenticationPluginBundleIdentifier"));
            if (!v32)
              goto LABEL_64;
            v33 = v6;
            v34 = v32;
            v35 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("VPN-%@.plist"), v33);
            v36 = SCPreferencesCreate(0, CFSTR("NEPluginPreferences"), v35);
            if (!v36)
            {
              v64 = ne_log_obj(0, v37);
              v65 = objc_claimAutoreleasedReturnValue(v64);
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                v96 = SCError();
                v97 = SCErrorString(v96);
                *(_DWORD *)buf = 138412546;
                v126 = v33;
                v127 = 2080;
                v128 = (id)v97;
                _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to create preferences for %@: %s", buf, 0x16u);
              }

              v60 = 0;
              goto LABEL_62;
            }
            v38 = v36;
            Value = SCPreferencesGetValue(v36, CFSTR("ApplicationURL"));
            TypeID = CFDataGetTypeID();
            if (!Value || (v42 = TypeID, TypeID = CFGetTypeID(Value), TypeID != v42))
            {
              v62 = ne_log_obj(TypeID, v41);
              v63 = objc_claimAutoreleasedReturnValue(v62);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v126 = (NESMVPNSession *)v35;
                _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "No ApplicationURL available in %@", buf, 0xCu);
              }

              CFRelease(v38);
              v60 = 0;
              p_cache = (void **)(&OBJC_METACLASS___NESMFilterSessionStateIdle + 16);
              goto LABEL_62;
            }
            v124[0] = 0;
            v43 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(+[NSURL URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:](NSURL, "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", Value, 0, 0, 0, v124));
            v115 = v124[0];
            CFRelease(v38);
            if (!v43)
            {
              v67 = ne_log_obj(v44, v45);
              v68 = objc_claimAutoreleasedReturnValue(v67);
              p_cache = (void **)(&OBJC_METACLASS___NESMFilterSessionStateIdle + 16);
              v114 = v68;
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v126 = v33;
                v127 = 2112;
                v128 = v115;
                _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Failed to resolve app bookmark from data for %@: %@", buf, 0x16u);
              }
              v60 = 0;
              goto LABEL_61;
            }
            v46 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithURL:", v43);
            p_cache = &OBJC_METACLASS___NESMFilterSessionStateIdle.cache;
            v114 = v46;
            if (!v46)
            {
              v69 = ne_log_obj(0, v47);
              log = objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v126 = v43;
                _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create a bundle from %@", buf, 0xCu);
              }
              v60 = 0;
              goto LABEL_60;
            }
            v109 = v35;
            v110 = v33;
            v48 = objc_claimAutoreleasedReturnValue(-[NSObject builtInPlugInsURL](v46, "builtInPlugInsURL"));
            v119 = 0;
            log = v48;
            if (v48)
            {
              v108 = v43;
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](log, "path"));
              if ((objc_msgSend(v50, "fileExistsAtPath:isDirectory:", v51, &v119) & 1) != 0)
              {
                v52 = v119;

                v43 = v108;
                if (v52)
                {
                  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](log, "path"));
                  v118 = 0;
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "contentsOfDirectoryAtPath:error:", v54, &v118));
                  v56 = v118;

                  v111 = v56;
                  v107 = v55;
                  if (v56)
                  {
                    v59 = ne_log_obj(v57, v58);
                    obj = objc_claimAutoreleasedReturnValue(v59);
                    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
                    {
                      v106 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NSObject path](log, "path"));
                      *(_DWORD *)buf = 138412546;
                      v126 = v106;
                      v127 = 2112;
                      v128 = v56;
                      _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "Failed to get the contents of %@: %@", buf, 0x16u);

                    }
                  }
                  else
                  {
                    v131 = 0u;
                    v132 = 0u;
                    v129 = 0u;
                    v130 = 0u;
                    obj = v55;
                    v116 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v129, buf, 16);
                    if (v116)
                    {
                      v98 = *(_QWORD *)v130;
                      v99 = &AnalyticsSendEventLazy_ptr;
                      v112 = *(_QWORD *)v130;
                      while (2)
                      {
                        for (i = 0; i != v116; i = (char *)i + 1)
                        {
                          if (*(_QWORD *)v130 != v98)
                            objc_enumerationMutation(obj);
                          v101 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)i);
                          if (objc_msgSend(v101, "hasSuffix:", CFSTR(".vpnplugin")))
                          {
                            v102 = objc_msgSend(objc_alloc((Class)v99[228]), "initWithString:relativeToURL:", v101, log);
                            if (v102)
                            {
                              v103 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithURL:", v102);
                              v60 = v103;
                              if (v103)
                              {
                                v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "bundleIdentifier"));
                                v105 = objc_msgSend(v104, "isEqualToString:", v34);

                                v99 = &AnalyticsSendEventLazy_ptr;
                                if ((v105 & 1) != 0)
                                {

                                  p_cache = (void **)(&OBJC_METACLASS___NESMFilterSessionStateIdle + 16);
                                  goto LABEL_89;
                                }
                              }

                              v98 = v112;
                            }

                            p_cache = (void **)(&OBJC_METACLASS___NESMFilterSessionStateIdle + 16);
                          }
                        }
                        v116 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v129, buf, 16);
                        if (v116)
                          continue;
                        break;
                      }
                    }
                  }
                  v60 = 0;
LABEL_89:
                  v35 = v109;
                  v33 = v110;
                  v43 = v108;

                  goto LABEL_59;
                }
              }
              else
              {

                v43 = v108;
              }
            }
            v70 = ne_log_obj(v48, v49);
            v71 = objc_claimAutoreleasedReturnValue(v70);
            v111 = v71;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v126 = (NESMVPNSession *)log;
              _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Invalid plugins URL: %@", buf, 0xCu);
            }
            v60 = 0;
            v35 = v109;
            v33 = v110;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
            if (v60)
            {
              v122 = CFSTR("plugin-path");
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bundlePath"));
              v123 = v74;
              v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1));

              v76 = objc_alloc((Class)(p_cache + 223));
              v77 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
              v78 = objc_msgSend(v76, "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:", v34, 0, 1, v75, v77);

              v79 = [NEVPNAuthenticationPlugin alloc];
              v80 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
              v81 = -[NEPlugin initWithAgent:delegateQueue:andDelegate:](v79, "initWithAgent:delegateQueue:andDelegate:", v78, v80, self);
              -[NESMVPNSession setAuthenticationPlugin:](self, "setAuthenticationPlugin:", v81);

LABEL_64:
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession extensibleSSOProvider](self, "extensibleSSOProvider"));

              if (v82)
              {
                v120 = CFSTR("plugin-path");
                v83 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession extensibleSSOProvider](self, "extensibleSSOProvider"));
                v121 = v83;
                v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));

                v85 = objc_alloc((Class)(p_cache + 223));
                v86 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
                v87 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
                v88 = objc_msgSend(v85, "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:", v86, 0, 8, v84, v87);

                v89 = [NEVPNAuthenticationPlugin alloc];
                v90 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
                v91 = -[NEPlugin initWithAgent:delegateQueue:andDelegate:](v89, "initWithAgent:delegateQueue:andDelegate:", v88, v90, self);
                -[NESMVPNSession setAuthenticationPlugin:](self, "setAuthenticationPlugin:", v91);

              }
              v92 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
              v4 = v92 != 0;

              v34 = v32;
              goto LABEL_71;
            }
            v93 = ne_log_obj(v72, v73);
            v94 = objc_claimAutoreleasedReturnValue(v93);
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v126 = self;
              v127 = 2112;
              v128 = v34;
              _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%@: Failed to obtain the bundle for %@", buf, 0x16u);
            }

            -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", 0);
LABEL_70:
            v4 = 0;
LABEL_71:

            goto LABEL_72;
          }
LABEL_37:
          v61 = ne_log_obj(v7, v8);
          v34 = objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v126 = self;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@: Failed to create an NEAgent", buf, 0xCu);
          }
          v25 = 0;
          goto LABEL_70;
        }
        v14 = (objc_class *)v18;
        v124[0] = CFSTR("plugin-requirement");
        v124[1] = CFSTR("extension-identifier");
        *(_QWORD *)&v129 = v12;
        *((_QWORD *)&v129 + 1) = v11;
        v20 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v129, v124, 2));
LABEL_18:
        v22 = [v14 alloc];
        v23 = -[NESMVPNSession agentPluginClass](self, "agentPluginClass");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
        v25 = objc_msgSend(v22, "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:", v10, 1, v23, v20, v24);

        goto LABEL_19;
      }
      v21 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, CFSTR("extension-identifier"));
      if (!v12)
      {
LABEL_12:
        if (objc_msgSend(v21, "count"))
          v20 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v21);
        else
          v20 = 0;

        goto LABEL_18;
      }
    }
    else
    {
      v21 = objc_alloc_init((Class)NSMutableDictionary);
      if (!v12)
        goto LABEL_12;
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, CFSTR("plugin-requirement"));
    goto LABEL_12;
  }
  return 1;
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  NESMVPNSession *v25;

  v4 = (void (**)(id, uint64_t))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
  if (!v6)
  {
LABEL_12:
    v4[2](v4, 1);
    goto LABEL_13;
  }
  if (+[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v6))
  {
    v4[2](v4, (uint64_t)objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.")));
    goto LABEL_13;
  }
  if ((id)-[NESMVPNSession state](self, "state") == (id)9)
  {
    v9 = ne_log_obj(9, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Plugin is being updated", (uint8_t *)&v24, 0xCu);
    }

    v4[2](v4, 0);
    goto LABEL_13;
  }
  v11 = sub_10000C1FC();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = sub_10000D860((uint64_t)v12, v7, -[NESMVPNSession agentPluginClass](self, "agentPluginClass"));

  if (v13)
  {
    v16 = ne_log_obj(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: Plugin is registered with provider manager", (uint8_t *)&v24, 0xCu);
    }

    goto LABEL_12;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v18, v6, -[NESMVPNSession agentPluginClass](self, "agentPluginClass"), 0));

  if (!v19)
  {
    v22 = ne_log_obj(v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Plugin is not available in launch services", (uint8_t *)&v24, 0xCu);
    }

  }
  v4[2](v4, v19 != 0);

LABEL_13:
}

- (void)handleInitializeState
{
  NESMVPNSession *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;

  v2 = self;
  objc_sync_enter(v2);
  if ((id)-[NESMVPNSession parentType](v2, "parentType") == (id)1
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v2, "interfaceName")),
        v3,
        v3))
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v2, "interfaceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%d"), v6, v7, -[NESMVPNSession type](v2, "type")));
    -[NESMSession setAuxiliaryDataKey:](v2, "setAuxiliaryDataKey:", v8);
  }
  else
  {
    v9 = -[NESMVPNSession tunnelKind](v2, "tunnelKind");
    v10 = CFSTR("Fallback Tunnel");
    if (v9 == (id)1)
      v10 = CFSTR("Primary Tunnel");
    v4 = v10;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%d"), v7, v4, -[NESMVPNSession type](v2, "type")));
    -[NESMSession setAuxiliaryDataKey:](v2, "setAuxiliaryDataKey:", v8);
  }

  -[NESMSession setupFromAuxiliaryData](v2, "setupFromAuxiliaryData");
  objc_sync_exit(v2);

  -[NESMVPNSession setState:](v2, "setState:", 1);
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  xpc_object_t value;
  void *v5;
  id v6;
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
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  unsigned __int8 v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  int v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  unsigned int v102;
  void *v103;
  void *v104;
  void *v105;
  const char *string;
  const char *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  const void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  xpc_object_t xdict;

  xdict = a3;
  value = xpc_dictionary_get_value(xdict, "SessionOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  -[NESMVPNSession setConnectParameters:](self, "setConnectParameters:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverAddress"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverAddress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("ServerAddress"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("AccountName"));

  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "passwordKeychainItem"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "passwordKeychainItem"));
    v22 = objc_msgSend(v21, "domain");

    if (v22)
      goto LABEL_10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "passwordKeychainItem"));
    v17 = objc_msgSend(v24, "copyPassword");

    if (v17)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, CFSTR("Password"));

    }
  }

LABEL_10:
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v27 = objc_msgSend(v26, "disconnectOnIdle");

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "disconnectOnIdleTimeout")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("IdleTimer"));

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v32 = objc_msgSend(v31, "type");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v34 = v33;
  if (v32 == (id)4)
  {
    if (!objc_msgSend(v33, "authenticationMethod"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v35, "setObject:forKeyedSubscript:", CFSTR("Password"), CFSTR("AuthMethod"));

    }
    if (objc_msgSend(v34, "authenticationMethod") == (id)1)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("Certificate"), CFSTR("AuthMethod"));

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identityReferenceInternal"));

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identityReferenceInternal"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("CertificateRef"));

      }
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "providerConfiguration"));

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "providerConfiguration"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("VendorData"));

    }
    if (!v5)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
      v82 = +[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v81);

      if ((v82 & 1) != 0)
      {
LABEL_57:

        goto LABEL_58;
      }
      v45 = objc_alloc_init((Class)NSMutableDictionary);
      -[NESMVPNSession setConnectParameters:](self, "setConnectParameters:", v45);
      goto LABEL_56;
    }
    v45 = (id)_CFXPCCreateCFObjectFromXPCObject(v5);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
    v47 = +[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v46);

    if (!v47)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v83, "addEntriesFromDictionary:", v45);
LABEL_55:

      goto LABEL_56;
    }
    v48 = kSCEntNetVPN;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", kSCEntNetVPN));
    v50 = isa_nsdictionary(v49);

    if (!v50)
    {
LABEL_53:
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pluginType"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v96));
      v98 = isa_nsdictionary(v97);

      if (v98)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pluginType"));
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v83));
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
        objc_msgSend(v100, "setObject:forKeyedSubscript:", v99, CFSTR("VendorData"));

        goto LABEL_55;
      }
LABEL_56:

      goto LABEL_57;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v48));
    v52 = kSCPropNetVPNRemoteAddress;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNRemoteAddress));
    v54 = isa_nsstring(v53);

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v52));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("ServerAddress"));

    }
    v57 = kSCPropNetVPNAuthName;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNAuthName));
    v59 = isa_nsstring(v58);

    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v57));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, CFSTR("AccountName"));

    }
    v62 = kSCPropNetVPNAuthPassword;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNAuthPassword));
    v64 = isa_nsstring(v63);

    if (v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v62));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("Password"));

    }
    v67 = kSCPropNetVPNAuthenticationMethod;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNAuthenticationMethod));
    v69 = isa_nsstring(v68);

    if (!v69)
    {
LABEL_47:
      v89 = kSCPropNetVPNDisconnectOnIdle;
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNDisconnectOnIdle));
      if (isa_nsnumber())
      {
        v91 = kSCPropNetVPNDisconnectOnIdleTimer;
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNDisconnectOnIdleTimer));
        v93 = isa_nsnumber();

        if (!v93)
        {
LABEL_52:

          goto LABEL_53;
        }
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v89));
        if (objc_msgSend(v90, "BOOLValue"))
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v91));
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
          objc_msgSend(v95, "setObject:forKeyedSubscript:", v94, CFSTR("IdleTimer"));

        }
      }

      goto LABEL_52;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v67));
    if (objc_msgSend(v70, "isEqualToString:", kSCValNetVPNAuthenticationMethodPassword))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v71, "setObject:forKeyedSubscript:", CFSTR("Password"), CFSTR("AuthMethod"));
    }
    else
    {
      if (!objc_msgSend(v70, "isEqualToString:", kSCValNetVPNAuthenticationMethodCertificate))
        goto LABEL_46;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v84, "setObject:forKeyedSubscript:", CFSTR("Certificate"), CFSTR("AuthMethod"));

      v85 = kSCPropNetVPNLocalCertificate;
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", kSCPropNetVPNLocalCertificate));
      v87 = isa_nsdata();

      if (!v87)
        goto LABEL_46;
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v85));
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v88, "setObject:forKeyedSubscript:", v71, CFSTR("CertificateRef"));

    }
LABEL_46:

    goto LABEL_47;
  }
  v72 = objc_msgSend(v33, "type");

  if (v72 == (id)5 && v5)
  {
    v34 = (void *)_CFXPCCreateCFObjectFromXPCObject(v5);
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", NEVPNConnectionStartOptionUsername));
    v74 = isa_nsstring(v73);

    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", NEVPNConnectionStartOptionUsername));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v76, "setObject:forKeyedSubscript:", v75, CFSTR("AccountName"));

    }
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", NEVPNConnectionStartOptionPassword));
    v78 = isa_nsstring(v77);

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", NEVPNConnectionStartOptionPassword));
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      objc_msgSend(v80, "setObject:forKeyedSubscript:", v79, CFSTR("Password"));

    }
    v45 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    objc_msgSend(v45, "addEntriesFromDictionary:", v34);
    goto LABEL_56;
  }
LABEL_58:
  if (-[NESMSession isOnDemand](self, "isOnDemand"))
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
    v102 = +[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v101);

    if (v102)
    {
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("IdleTimer")));

      if (!v104)
      {
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
        objc_msgSend(v105, "setObject:forKeyedSubscript:", &off_1000C1690, CFSTR("IdleTimer"));

      }
      if (v5)
      {
        string = xpc_dictionary_get_string(v5, "match-domain");
        v107 = xpc_dictionary_get_string(v5, "match-hostname");
        if (string)
        {
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
          v109 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
          objc_msgSend(v109, "setObject:forKeyedSubscript:", v108, CFSTR("OnDemandMatchDomain"));

        }
        if (v107)
        {
          v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v107));
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
          objc_msgSend(v111, "setObject:forKeyedSubscript:", v110, CFSTR("OnDemandHostName"));

        }
      }
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "appVPN"));

      if (v113)
      {
        if ((int)xpc_dictionary_get_int64(xdict, "SessionPID") >= 1)
        {
          v114 = NECopySigningIdentifierForPID();
          if (v114)
          {
            v115 = (const void *)v114;
            v116 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "appVPN"));
            v118 = objc_msgSend(v117, "copyAppRuleBySigningIdentifier:", v115);

            if (v118)
            {
              v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "matchSigningIdentifier"));
              v120 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
              objc_msgSend(v120, "setObject:forKeyedSubscript:", v119, CFSTR("AppRuleID"));

            }
            CFRelease(v115);

          }
        }
      }
    }
  }

}

- (void)registerSession:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  NESMVPNSession *v8;
  id v9;
  id v10;
  NESMVPNSession *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NESMVPNSession *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  objc_super v20;
  __int128 buf;
  void *v22;
  void *v23;
  NESMVPNSession *v24;
  NESMVPNSession *v25;
  NESMVPNSession *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v8 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v9 = v6;
    v10 = v7;
    v11 = self;
    if (v8)
    {
      v12 = (id)-[NESMSession status](v8, "status");
      if ((_DWORD)v12 == 1)
      {
        v14 = objc_claimAutoreleasedReturnValue(-[NESMSession messageQueue](v8, "messageQueue"));
        dispatch_suspend(v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v8, "server"));
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v22 = sub_100086D98;
        v23 = &unk_1000BE918;
        v24 = v8;
        v25 = (NESMVPNSession *)v10;
        v26 = v11;
        v27 = v9;
        objc_msgSend(v15, "registerSession:withCompletionHandler:", v8, &buf);

        v16 = v25;
      }
      else
      {
        v17 = ne_log_obj(v12, v13);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ Already registered", (uint8_t *)&buf, 0xCu);
        }

        v19 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](v11, "queue"));
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v22 = sub_100086E58;
        v23 = &unk_1000BEB58;
        v24 = v11;
        v25 = (NESMVPNSession *)v9;
        dispatch_async(v19, &buf);

        v16 = v24;
      }

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NESMVPNSession;
    -[NESMSession registerSession:fromClient:](&v20, "registerSession:fromClient:", v6, v7);
  }

}

- (void)handleStartMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  xpc_object_t value;
  void *v15;
  xpc_connection_t remote_connection;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  NETestAgent *v25;
  void *v26;
  void *v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  NEVPNTunnelPlugin *v31;
  NSObject *v32;
  NEVPNTunnelPlugin *v33;
  uint64_t v34;
  objc_super v35;
  uint8_t buf[4];
  NESMVPNSession *v37;

  v4 = a3;
  -[NESMVPNSession setLastStartMessage:](self, "setLastStartMessage:", v4);
  -[NESMVPNSession setStopped:](self, "setStopped:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "externalIdentifier"));
  if (!v6)
  {

LABEL_7:
    if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)1)
      sub_100023214(self);
    if ((id)-[NESMVPNSession state](self, "state") != (id)9)
    {
      v35.receiver = self;
      v35.super_class = (Class)NESMVPNSession;
      -[NESMSession handleStartMessage:](&v35, "handleStartMessage:", v4);
    }
    value = xpc_dictionary_get_value(v4, "SessionOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue(value);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    if (v15)
      goto LABEL_12;
    if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_dictionary || !xpc_dictionary_get_BOOL(v13, "test-agent"))
      goto LABEL_13;
    remote_connection = xpc_dictionary_get_remote_connection(v4);
    v17 = objc_claimAutoreleasedReturnValue(remote_connection);
    v15 = (void *)v17;
    if (v17)
    {
      v19 = (void *)xpc_connection_copy_entitlement_value(v17, "com.apple.private.networkextension.test-control");
      v20 = v19;
      if (v19 && xpc_get_type(v19) == (xpc_type_t)&_xpc_type_BOOL)
      {
        v24 = xpc_BOOL_get_value(v20);

        if (v24)
        {
          v25 = [NETestAgent alloc];
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pluginType"));
          v28 = sub_100063C34((id *)&v25->super.super.isa, v27, -[NESMVPNSession agentPluginClass](self, "agentPluginClass"), v4);

          if (v28)
          {
            v31 = [NEVPNTunnelPlugin alloc];
            v32 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
            v33 = -[NEVPNTunnelPlugin initWithAgent:delegateQueue:andDelegate:](v31, "initWithAgent:delegateQueue:andDelegate:", v28, v32, self);
            -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v33);

          }
          else
          {
            v34 = ne_log_obj(v29, v30);
            v32 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to create a test agent", buf, 2u);
            }
          }

LABEL_12:
LABEL_13:
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
          objc_msgSend(v15, "handleStartMessage:", v4);
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {

      }
    }
    v21 = ne_log_obj(v17, v18);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = (NESMVPNSession *)"com.apple.private.networkextension.test-control";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Test provider does not have the %s entitlement", buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    objc_msgSend(v23, "handleStartMessage:", v4);

    goto LABEL_14;
  }
  v7 = (void *)v6;
  v8 = -[NESMSession waitForPerApp](self, "waitForPerApp");

  if (!v8)
    goto LABEL_7;
  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Ignore start for perApp session - no appRule or app not installed", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v13, "handleStop");
LABEL_15:

}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  int v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  -[NESMVPNSession setStopped:](self, "setStopped:", 1);
  -[NESMVPNSession setLastStartMessage:](self, "setLastStartMessage:", 0);
  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSession;
  -[NESMSession handleStopMessageWithReason:](&v10, "handleStopMessageWithReason:", v3);
  if (-[NESMSession status](self, "status") && -[NESMSession status](self, "status") != 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    objc_msgSend(v7, "handleStop");

  }
  else
  {
    v5 = sub_10004EDE8((uint64_t)NESMServer);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100029CEC;
    v8[3] = &unk_1000BECF8;
    v9 = v3;
    v8[4] = self;
    sub_100052CA0((uint64_t)v6, self, v8);

  }
}

- (void)handleEstablishIPCMessage:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  xpc_connection_t remote_connection;
  uint64_t v8;
  _xpc_connection_s *v9;
  void *v10;
  xpc_connection_t v11;
  void *v12;
  void *v13;
  xpc_connection_t v14;
  void *v15;
  uint64_t v16;
  xpc_connection_t v17;
  void *v18;
  void *v19;
  xpc_connection_t v20;
  void *v21;
  const char *type;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  xpc_connection_t v26;
  void *v27;
  xpc_object_t v28;
  xpc_object_t reply;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  xpc_connection_t v33;
  _xpc_connection_s *v34;
  xpc_connection_t v35;
  _xpc_connection_s *v36;
  NSNumber *v37;
  void *v38;
  const char *v39;
  xpc_connection_t v40;
  pid_t v41;
  void *v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  int v51;
  NESMVPNSession *v52;
  __int16 v53;
  pid_t pid;
  __int16 v55;
  void *v56;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v6 = -[NESMSession status](self, "status");
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v8 = objc_claimAutoreleasedReturnValue(remote_connection);
  v9 = (_xpc_connection_s *)v8;
  if (!v6)
  {
    reply = xpc_dictionary_create_reply(v4);
    xpc_connection_send_message(v9, reply);

    goto LABEL_20;
  }
  v10 = (void *)xpc_connection_copy_entitlement_value(v8, "com.apple.developer.networking.networkextension");

  if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_array || (NEGetEntitlement(v10) & 3) == 0)
    goto LABEL_10;
  v11 = xpc_dictionary_get_remote_connection(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)xpc_connection_copy_entitlement_value(v12, "application-identifier");

  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_string)
  {
    v14 = xpc_dictionary_get_remote_connection(v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = xpc_connection_copy_entitlement_value(v15, "com.apple.application-identifier");

    v13 = (void *)v16;
    if (!v16)
      goto LABEL_9;
  }
  if (xpc_get_type(v13) != (xpc_type_t)&_xpc_type_string
    || (v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v13)), v44 = (void *)objc_claimAutoreleasedReturnValue(v43), v45 = NEGetBundleIdentifierFromAppID(), v46 = (void *)objc_claimAutoreleasedReturnValue(v45), v44, !v46))
  {
LABEL_9:

    goto LABEL_10;
  }
  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));
  if (!v47)
  {

    goto LABEL_9;
  }
  v48 = (void *)v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));
  v50 = objc_msgSend(v46, "hasPrefix:", v49);

  if ((v50 & 1) != 0)
    goto LABEL_23;
LABEL_10:
  v17 = xpc_dictionary_get_remote_connection(v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)xpc_connection_copy_entitlement_value(v18, "com.apple.private.nehelper.privileged");

  if (v19 && xpc_get_type(v19) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v19))
  {
    v10 = v19;
    goto LABEL_23;
  }
  v20 = xpc_dictionary_get_remote_connection(v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v10 = (void *)xpc_connection_copy_entitlement_value(v21, "com.apple.private.networkextension.configuration");

  if (v10)
  {
    type = (const char *)xpc_get_type(v10);
    if (type == (const char *)&_xpc_type_string)
    {
      type = xpc_string_get_string_ptr(v10);
      if (type)
      {
        type = (const char *)strcmp(type, "super");
        if (!(_DWORD)type)
        {
LABEL_23:
          v30 = -[NESMVPNSession establishIPCPending](self, "establishIPCPending");
          if (!v30)
          {
            v35 = xpc_dictionary_get_remote_connection(v4);
            v36 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v35);
            v37 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", xpc_connection_get_euid(v36));
            v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            -[NESMSession setUID:](self, "setUID:", v38);

            if (self)
              objc_setProperty_atomic(self, v39, v4, 392);
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
            objc_msgSend(v27, "handleEstablishIPC");
            goto LABEL_18;
          }
          v32 = ne_log_obj(v30, v31);
          v25 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v33 = xpc_dictionary_get_remote_connection(v4);
            v34 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v33);
            v51 = 138412546;
            v52 = self;
            v53 = 1024;
            pid = xpc_connection_get_pid(v34);
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: cannot establish IPC with %d because IPC is already in the process of being established", (uint8_t *)&v51, 0x12u);
LABEL_30:

            goto LABEL_17;
          }
          goto LABEL_17;
        }
      }
    }
  }
  v24 = ne_log_obj(type, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v40 = xpc_dictionary_get_remote_connection(v4);
    v34 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v40);
    v41 = xpc_connection_get_pid(v34);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pluginType"));
    v51 = 138412802;
    v52 = self;
    v53 = 1024;
    pid = v41;
    v55 = 2112;
    v56 = v42;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@: process %d is not entitled to establish IPC with plugins of type %@", (uint8_t *)&v51, 0x1Cu);

    goto LABEL_30;
  }
LABEL_17:

  v26 = xpc_dictionary_get_remote_connection(v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = xpc_dictionary_create_reply(v4);
  xpc_connection_send_message((xpc_connection_t)v27, v28);

LABEL_18:
LABEL_20:

}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t reply;
  id v7;
  void *v8;
  void *v9;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v11;
  xpc_object_t xdict;

  xdict = a3;
  reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    v7 = -[NESMVPNSession copyExtendedStatus](self, "copyExtendedStatus");
  }
  else
  {
    if (a4 != 1)
      goto LABEL_7;
    v7 = -[NESMVPNSession copyStatistics](self, "copyStatistics");
  }
  v8 = v7;
  if (v7)
  {
    v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
    xpc_dictionary_set_value(reply, "SessionInfo", v9);

  }
LABEL_7:
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v11, reply);

}

- (id)copyStatistics
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  uint64_t v8;

  if (!-[NESMVPNSession virtualInterface](self, "virtualInterface"))
    return 0;
  v3 = NEVirtualInterfaceCopyStatistics(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
  v4 = (void *)v3;
  if (v3)
  {
    v7 = CFSTR("VPN");
    v8 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyExtendedStatus
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *matched;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  NESMVPNSession *v45;
  id Property;
  uint64_t v47;
  void *v48;
  const char *v49;
  id v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  NSNumber *v66;
  void *v67;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  objc_super v82;
  uint8_t buf[4];
  void *v84;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v82.receiver = self;
  v82.super_class = (Class)NESMVPNSession;
  v4 = -[NESMSession copyExtendedStatus](&v82, "copyExtendedStatus");
  v5 = objc_msgSend(v3, "initWithDictionary:", v4);

  v80 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    v76 = NEVirtualInterfaceCopyVPNServerAddress(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "protocol"));
    if (objc_msgSend(v9, "type") == (id)1)
    {
      v10 = 1;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "VPN"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "protocol"));
      if (objc_msgSend(v19, "type") == (id)2)
      {
        v10 = 1;
      }
      else
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v71 = v6;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "VPN"));
        v79 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "protocol"));
        v10 = objc_msgSend(v21, "type") == (id)3;

        v17 = v79;
        v6 = v71;

      }
    }

    v78 = (void *)NEVirtualInterfaceCopyIPStateDictionary(-[NESMVPNSession virtualInterface](self, "virtualInterface"), 2, v10);
    v12 = (void *)NEVirtualInterfaceCopyIPStateDictionary(-[NESMVPNSession virtualInterface](self, "virtualInterface"), 30, v10);
    v13 = (void *)NEVirtualInterfaceCopyDNSDomain(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    v14 = (void *)NEVirtualInterfaceCopyDNSServers(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    v15 = (void *)NEVirtualInterfaceCopyDNSSearchDomains(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    matched = (void *)NEVirtualInterfaceCopyDNSSupplementalMatchDomains(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    v11 = v76;
    if (v76)
      objc_msgSend(v80, "setObject:forKeyedSubscript:", v76, CFSTR("RemoteAddress"));
  }
  else
  {
    v11 = 0;
    v78 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    matched = 0;
  }
  v77 = (void *)v11;
  if (-[NESMSession status](self, "status") == 3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[NESMSession connectTime](self, "connectTime")));
    v23 = CFSTR("ConnectTime");
  }
  else
  {
    if (-[NESMSession status](self, "status") == 2)
      goto LABEL_16;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession lastStopReason](self, "lastStopReason")));
    v23 = CFSTR("LastCause");
  }
  objc_msgSend(v80, "setObject:forKeyedSubscript:", v22, v23);

LABEL_16:
  v75 = matched;
  if ((sub_100076E38(self) & 1) != 0 || sub_100076F3C(self))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession matchedRule](self, "matchedRule"));

    if (v24)
    {
      v25 = v15;
      v26 = v14;
      v27 = v13;
      v28 = v6;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession matchedRule](self, "matchedRule"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v29, "action")));
      objc_msgSend(v80, "setObject:forKeyedSubscript:", v30, CFSTR("OnDemandAction"));

      v6 = v28;
      v13 = v27;
      v14 = v26;
      v15 = v25;
      matched = v75;
    }
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, CFSTR("VPN"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMVPNSession state](self, "state")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("SessionState"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession status](self, "status")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("NEStatus"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession SCNCStatus](self, "SCNCStatus")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("Status"));

  if (v78)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("IsNULL")));
    v35 = v34;
    if (!v34 || (objc_msgSend(v34, "BOOLValue") & 1) == 0)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v78, CFSTR("IPv4"));

  }
  if (v12)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IsNULL")));
    v37 = v36;
    if (!v36 || (objc_msgSend(v36, "BOOLValue") & 1) == 0)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("IPv6"));

  }
  v73 = v12;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMSession connectCount](self, "connectCount")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("ConnectCount"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMSession connectedCount](self, "connectedCount")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("ConnectedCount"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMSession disconnectedCount](self, "disconnectedCount")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("DisconnectedCount"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[NESMSession maxConnectTime](self, "maxConnectTime")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("MaxConnectTime"));

  v42 = v77;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v69 = v13;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v45 = self;
    if (v43)
    {
      Property = objc_getProperty(v43, v44, 408, 1);
      v47 = -1;
      if (v45 && Property)
      {
        v72 = v6;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v45, "interfaceName"));

        if (v48)
        {
          v50 = objc_getProperty(v43, v49, 408, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v45, "interfaceName"));
          v52 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v51));

          if (v52)
          {
            v47 = v52[1];

          }
          else
          {
            v47 = -1;
          }
        }
        v6 = v72;
      }
    }
    else
    {
      v47 = 0;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v47));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("RetryInterval"));

    matched = v75;
    v42 = v77;
    v13 = v69;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ConnectionStatistics"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](self, "lastDisconnectError"));
  if (v54)
  {
    v70 = v14;
    v55 = v13;
    v56 = v42;
    v81 = 0;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v54, 1, &v81));
    v58 = v81;
    v60 = v58;
    if (v57)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("LastDisconnectError"));
    }
    else
    {
      v61 = ne_log_obj(v58, v59);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = v60;
        _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to serialize the last disconnect error: %@", buf, 0xCu);
      }

    }
    v42 = v56;
    v13 = v55;
    v14 = v70;
    matched = v75;
  }
  v63 = v42;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastStatusChangeTime](self, "lastStatusChangeTime"));

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastStatusChangeTime](self, "lastStatusChangeTime"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("LastStatusChangeTime"));

  }
  if (v14)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("DNSServers"));
  if (v13)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("DNSDomain"));
  if (v15)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("DNSSearchDomains"));
  if (matched)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", matched, CFSTR("DNSSupplementalMatchDomains"));
  v66 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", NEVirtualInterfaceIsPrimary(-[NESMVPNSession virtualInterface](self, "virtualInterface")));
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("IsPrimaryInterface"));

  return v5;
}

- (BOOL)handleSleep
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029CBC;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

  return 1;
}

- (void)handleSleepTime:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029C10;
  v6[3] = &unk_1000BEA98;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)handleWakeup
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029BC8;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleUserLogout
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029B80;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleUserSwitch
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029B38;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)interface:(id)a3 hasIPAddress:(id)a4 currentFlags:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  int v10;
  int v11;
  unsigned __int8 v12;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  NSObject *v23;
  int *v24;
  char *v25;
  uint8_t buf[4];
  NESMVPNSession *v27;
  __int16 v28;
  char *v29;
  char __dst[8];
  uint64_t v31;
  _QWORD v32[2];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = NEGetAddressFamilyFromString();
  v11 = v10;
  if ((v5 & 1) == 0 && v10 == 2)
  {
LABEL_3:
    v12 = 0;
    goto LABEL_4;
  }
  v12 = 0;
  v15 = (v5 & 2) == 0 && v10 == 30;
  if (v10 && !v15)
  {
    v31 = 0;
    v32[0] = 0;
    v32[1] = 0;
    BYTE1(v32[0]) = v10;
    strncpy(__dst, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0xFuLL);
    v16 = socket(v11, 2, 0);
    v17 = ioctl(v16, 0xC0206921uLL, __dst);
    v18 = close(v16);
    if (v17 < 0)
    {
      v22 = ne_log_obj(v18, v19);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        v25 = strerror(*v24);
        *(_DWORD *)buf = 138412546;
        v27 = self;
        v28 = 2080;
        v29 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@: ioctl(SIOCGIFADDR) failed: %s", buf, 0x16u);
      }

    }
    else
    {
      v20 = NECreateAddressString(v32);
      if (v20)
      {
        v21 = (const void *)v20;
        v12 = objc_msgSend(v9, "isEqualToString:", v20);
        CFRelease(v21);
        goto LABEL_4;
      }
    }
    goto LABEL_3;
  }
LABEL_4:

  return v12;
}

- (id)pluginPIDArray
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *v8;
  NSNumber *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  NSNumber *v16;
  void *v17;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    v7 = sub_10001755C(v6);

    if (v7)
    {
      v8 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
      v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sub_10001755C(v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v3, "addObject:", v10);

    }
  }
  v11 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPlugin](self, "authenticationPlugin"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPlugin](self, "authenticationPlugin"));
    v14 = sub_10001755C(v13);

    if (v14)
    {
      v15 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPlugin](self, "authenticationPlugin"));
      v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sub_10001755C(v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v3, "addObject:", v17);

    }
  }
  return v3;
}

- (BOOL)proxyEnabled:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFArray *ValueAtIndex;
  const __CFArray *v9;
  uint64_t v10;

  v3 = a3;
  v4 = SCDynamicStoreCopyProxiesWithOptions(0, 0);
  v10 = v4;
  if (v4)
  {
    v5 = (const __CFArray *)SCNetworkProxiesCopyMatching(v4, 0, v3);
    v6 = v5;
    v9 = v5;
    if (v5)
    {
      if (CFArrayGetCount(v5) < 1)
        goto LABEL_15;
      ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v6, 0);
      v6 = ValueAtIndex;
      if (ValueAtIndex)
      {
        if (NEGetIntFromDictionary(ValueAtIndex, kSCPropNetProxiesHTTPEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesHTTPSEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesProxyAutoConfigEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesFTPEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesGopherEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesRTSPEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesSOCKSEnable, 0)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesProxyAutoDiscoveryEnable, 0))
        {
          LOBYTE(v6) = 1;
          goto LABEL_16;
        }
LABEL_15:
        LOBYTE(v6) = 0;
      }
    }
LABEL_16:
    myCFRelease(&v10);
    myCFRelease(&v9);
    goto LABEL_17;
  }
  LOBYTE(v6) = 0;
LABEL_17:

  return (char)v6;
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NESMVPNSession;
  -[NESMSession handleChangeEventForInterface:newFlags:previousFlags:](&v14, "handleChangeEventForInterface:newFlags:previousFlags:", v8, a4, a5);
  v9 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029684;
  block[3] = &unk_1000BE850;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)handleNetworkPrepareResult:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSession;
  v4 = a3;
  -[NESMSession handleNetworkPrepareResult:](&v6, "handleNetworkPrepareResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler", v6.receiver, v6.super_class));
  objc_msgSend(v5, "handleNetworkPrepareResult:", v4);

}

- (void)handleNetworkDetectionNotification:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD v8[5];
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 <= 1)
  {
    v10 = v3;
    v11 = v4;
    v7 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000295A8;
    v8[3] = &unk_1000BECF8;
    v8[4] = self;
    v9 = a3;
    dispatch_async(v7, v8);

  }
}

- (void)handleCaptiveNetworkPluginsChanged
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NESMVPNSession *v6;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: handleCaptiveNetworkPluginsChanged", (uint8_t *)&v5, 0xCu);
  }

  sub_100023214(self);
}

- (void)handleChangeEventForRankedInterfaces
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  NESMVPNSession *v20;
  __int16 v21;
  _BYTE v22[20];

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NESMVPNSession stopped](self, "stopped");
    v6 = ne_session_status_to_string(-[NESMSession status](self, "status"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "VPN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "protocol"));
    v19 = 138413058;
    v20 = self;
    v21 = 1024;
    *(_DWORD *)v22 = v5;
    *(_WORD *)&v22[4] = 2080;
    *(_QWORD *)&v22[6] = v6;
    *(_WORD *)&v22[14] = 1024;
    *(_DWORD *)&v22[16] = objc_msgSend(v9, "includeAllNetworks");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: handleChangeEventForRankedInterfaces - stopped %d status %s includeAllNetworks %d", (uint8_t *)&v19, 0x22u);

  }
  if (!-[NESMVPNSession stopped](self, "stopped") && -[NESMSession status](self, "status") == 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "VPN"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "protocol"));
    v13 = objc_msgSend(v12, "includeAllNetworks");

    if (v13)
    {
      v14 = sub_100025C40(self);
      if ((v14 & 1) == 0)
      {
        v16 = ne_log_obj(v14, v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
          v19 = 138412802;
          v20 = self;
          v21 = 2112;
          *(_QWORD *)v22 = v18;
          *(_WORD *)&v22[8] = 2080;
          *(_QWORD *)&v22[10] = "-[NESMVPNSession handleChangeEventForRankedInterfaces]";
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@[%@]:%s: applyTunnelDataPolicies failed", (uint8_t *)&v19, 0x20u);

        }
      }
    }
  }
}

- (void)pluginDidDispose:(id)a3
{
  id v4;
  void *v5;
  NESMVPNSession *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  _QWORD block[5];
  NESMVPNSession *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v5, "handlePluginDisposeComplete:", v4);

  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v6 = self;
    if (v9)
    {
      if (v6)
      {
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000BC20;
        block[3] = &unk_1000BEB58;
        block[4] = v9;
        v12 = v6;
        dispatch_async(v7, block);

      }
    }

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100029564;
    v10[3] = &unk_1000BEB80;
    v10[4] = self;
    dispatch_async(v8, v10);

  }
}

- (void)plugin:(id)a3 didFinishAuthenticationWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v13, "handlePlugin:authenticationCompleteWithResults:status:andError:", v12, v11, v6, v10);

}

- (void)pluginDidAcknowledgeSleep:(id)a3
{
  const char *v4;
  id v5;

  if ((id)-[NESMVPNSession parentType](self, "parentType", a3) == (id)2)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    sub_100086214(v5);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    sub_1000517BC(v5, v4);
  }

}

- (void)pluginDidDetachIPC:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v5, "handlePluginDidDetachIPC:", v4);

}

- (void)plugin:(id)a3 didSetStatus:(int)a4 andDisconnectError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  CoreTelephonyClient *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CoreTelephonyClient *v31;
  const char *v32;
  CoreTelephonyClient *v33;
  id Property;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  id v40;
  SEL v41;
  id v42;
  uint8_t buf[4];
  NESMVPNSession *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 != 6 && a4)
  {
    v13 = 0;
    goto LABEL_35;
  }
  if (!v9)
  {
    v13 = 3;
    goto LABEL_35;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("NEAgentErrorDomain"));

  if (v12)
  {
    if (objc_msgSend(v10, "code") == (id)2)
    {
      v13 = 6;
    }
    else if (objc_msgSend(v10, "code") == (id)1)
    {
      v13 = 7;
    }
    else
    {
      v13 = 3;
    }
    goto LABEL_34;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v15 = objc_msgSend(v14, "isEqualToString:", kCFErrorDomainVPNTunnel);

  if (v15)
  {
    v16 = (uint64_t)objc_msgSend(v10, "code");
    if (v16 <= 199)
    {
      switch(v16)
      {
        case 'd':
          v13 = 10;
          break;
        case 'e':
          v13 = 15;
          break;
        case 'f':
          v13 = 16;
          break;
        case 'g':
          v13 = 17;
          break;
        case 'h':
          v13 = 18;
          break;
        case 'i':
          v13 = 19;
          break;
        case 'j':
          v13 = 20;
          break;
        case 'k':
          v13 = 21;
          break;
        case 'l':
          v13 = 22;
          break;
        default:
          if (v16 == 1)
          {
            v13 = 7;
          }
          else
          {
            if (v16 != 2)
              goto LABEL_33;
            v13 = 14;
          }
          break;
      }
      goto LABEL_34;
    }
    if (v16 > 399)
    {
      if (v16 <= 499)
      {
        switch(v16)
        {
          case 400:
            v13 = 24;
            break;
          case 401:
            v13 = 25;
            break;
          case 402:
            v13 = 26;
            break;
          case 403:
            v13 = 27;
            break;
          default:
            goto LABEL_33;
        }
        goto LABEL_34;
      }
      switch(v16)
      {
        case 500:
          v13 = 28;
          goto LABEL_34;
        case 501:
          v13 = 29;
          goto LABEL_34;
        case 502:
          v13 = 30;
          goto LABEL_34;
      }
LABEL_33:
      v13 = 3;
      goto LABEL_34;
    }
    if (v16 == 200)
    {
      v13 = 4;
      goto LABEL_34;
    }
    if (v16 == 201)
    {
      v13 = 5;
      goto LABEL_34;
    }
    if (v16 != 300)
      goto LABEL_33;
    v13 = 23;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("IKEv2ProviderDisconnectionErrorDomain"));

    if (!v18)
      goto LABEL_33;
    v13 = (uint64_t)objc_msgSend(v10, "code");
  }
LABEL_34:
  -[NESMVPNSession setLastDisconnectError:](self, "setLastDisconnectError:", v10);
LABEL_35:
  v19 = v8;
  v42 = v19;
  if (self)
  {
    v21 = ne_log_obj(v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = self;
      v45 = 1024;
      LODWORD(v46) = a4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: didSetStatus - %d", buf, 0x12u);
    }

    switch(a4)
    {
      case 0:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v23, "handlePlugin:statusDidChangeToDisconnectedWithReason:", v42, v13);

        v24 = (CoreTelephonyClient *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v25 = objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient appVPN](v24, "appVPN"));
        if (!v25)
        {
          v30 = 0;
LABEL_54:

          goto LABEL_55;
        }
        v26 = (void *)v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "appVPN"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "protocol"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "sliceUUID"));

        if (v30)
        {
          v31 = self->_coreTelephonyClient;
          if (v31)
          {
            v33 = v31;
            Property = objc_getProperty(self, v32, 496, 1);

            if (Property)
            {
              v37 = ne_log_obj(v35, v36);
              v38 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                v40 = objc_getProperty(self, v39, 496, 1);
                *(_DWORD *)buf = 138412802;
                v44 = self;
                v45 = 2112;
                v46 = v30;
                v47 = 2112;
                v48 = v40;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%@: VPN Slice deactivate - sliceUUID %@ : sliceInterfaceName %@ ", buf, 0x20u);
              }

              v24 = self->_coreTelephonyClient;
              -[CoreTelephonyClient requestSliceDeactivation:](v24, "requestSliceDeactivation:", objc_getProperty(self, v41, 496, 1));
              goto LABEL_54;
            }
          }
        }
LABEL_55:

        break;
      case 1:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePluginStatusDidChangeToContacting:", v42);
        goto LABEL_55;
      case 2:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePluginStatusDidChangeToAuthenticating:", v42);
        goto LABEL_55;
      case 3:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePluginStatusDidChangeToNegotiating:", v42);
        goto LABEL_55;
      case 4:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePluginStatusDidChangeToConnected:", v42);
        goto LABEL_55;
      case 5:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePluginStatusDidChangeToReasserting:", v42);
        goto LABEL_55;
      case 6:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePlugin:statusDidChangeToDisconnectingWithReason:", v42, v13);
        goto LABEL_55;
      case 7:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
        objc_msgSend(v30, "handlePluginStatusDidChangeToUpdating:", v42);
        goto LABEL_55;
      default:
        break;
    }
  }

}

- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  int v13;
  NESMVPNSession *v14;
  __int16 v15;
  void *v16;

  v5 = (void (**)(id, void *))a4;
  v7 = ne_log_obj(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@: Handling clear config request: session interface %@", (uint8_t *)&v13, 0x16u);

  }
  -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  v10 = objc_msgSend(v9, "handleClearConfiguration");

  if (v10)
  {
    -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", 0);
  }
  else if (v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0));
    v5[2](v5, v11);
    -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", 0);

  }
}

- (void)plugin:(id)a3 didRequestVirtualInterfaceWithParameters:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  void *v18;
  const char *v19;
  void *v20;
  _QWORD *Property;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  dispatch_queue_attr_t v42;
  NSObject *v43;
  dispatch_queue_t v44;
  _NECompletion *v45;
  const char *v46;
  id *p_isa;
  id *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  _QWORD v67[2];
  uint64_t (*v68)(uint64_t, uint64_t);
  void *v69;
  NESMVPNSession *v70;
  id v71;
  void (**v72)(_QWORD);
  id v73;
  _QWORD v74[5];
  uint8_t v75[16];
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[4];
  _BYTE buf[24];
  void *v80;

  v8 = a4;
  v9 = a5;
  v10 = (char *)objc_msgSend(v8, "type");
  v11 = kdebug_trace(726990972, 0, 0, 0, 0);
  v13 = ne_log_obj(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating a virtual interface with type %ld", buf, 0xCu);
  }

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10002922C;
  v74[3] = &unk_1000BEB80;
  v74[4] = self;
  v15 = objc_retainBlock(v74);
  v17 = (void (**)(_QWORD))v15;
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 == (char *)3)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ethernetAddress"));
      if (v23)
      {
        v25 = (void *)v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mtu"));

        if (v26)
        {
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v68 = sub_100029424;
          v69 = &unk_1000BD850;
          v70 = self;
          v27 = v8;
          v71 = v27;
          v72 = v17;
          v73 = v9;
          v28 = v67;
          if (v27)
          {
            v29 = objc_msgSend(v27, "type");
            if (v29 == (id)3)
            {
              v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ethernetAddress"));
              if (v31)
              {
                v33 = (void *)v31;
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mtu"));

                if (v34)
                {
                  v78[0] = CFSTR("Product Name");
                  v78[1] = kIOUserEthernetInterfaceRole;
                  *(_QWORD *)buf = CFSTR("TAP network interface");
                  *(_QWORD *)&buf[8] = CFSTR("TAP");
                  v78[2] = CFSTR("HiddenInterface");
                  v78[3] = CFSTR("IsEphemeral");
                  *(_QWORD *)&buf[16] = &__kCFBooleanTrue;
                  v80 = &__kCFBooleanTrue;
                  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v78, 4));
                  v76[0] = kIOEthernetHardwareAddress;
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ethernetAddress"));
                  v77[0] = v36;
                  v76[1] = CFSTR("MaxTransferUnit");
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mtu"));
                  v77[1] = v37;
                  v77[2] = CFSTR("utap");
                  v76[2] = CFSTR("NamePrefix");
                  v76[3] = kIOUserEthernetInterfaceMergeProperties;
                  v77[3] = v35;
                  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 4));

                  v39 = IOEthernetControllerCreate(kCFAllocatorDefault, v38);
                  if (v39)
                  {
                    v41 = (const void *)v39;
                    v42 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v43 = objc_claimAutoreleasedReturnValue(v42);
                    v44 = dispatch_queue_create("User Ethernet Controller queue", v43);

                    IOEthernetControllerSetDispatchQueue(v41, v44);
                    v45 = objc_alloc_init(_NECompletion);
                    p_isa = (id *)&v45->super.isa;
                    if (v45)
                    {
                      objc_setProperty_nonatomic_copy(v45, v46, v28, 16);
                      objc_storeStrong(p_isa + 1, a4);
                    }
                    v48 = p_isa;
                    IOEthernetControllerRegisterBSDAttachCallback(v41, sub_10007EC14, v48);
                    v49 = IOEthernetControllerSetLinkStatus(v41, 1);
                    if ((_DWORD)v49)
                    {
                      v51 = ne_log_obj(v49, v50);
                      v52 = objc_claimAutoreleasedReturnValue(v51);
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v75 = 0;
                        _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to bring up the user ethernet link", v75, 2u);
                      }

                      IOEthernetControllerSetDispatchQueue(v41, 0);
                      CFRelease(v41);
                      sub_10007EC14(0, v48);
                    }

                  }
                  else
                  {
                    v63 = ne_log_obj(0, v40);
                    v64 = objc_claimAutoreleasedReturnValue(v63);
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)v75 = 0;
                      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failed to create a ethernet controller", v75, 2u);
                    }

                    v68((uint64_t)v28, 0);
                  }

                  goto LABEL_42;
                }
              }
              v60 = ne_log_obj(v31, v32);
              v58 = objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ethernetAddress"));
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mtu"));
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v65;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v66;
                _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Cannot create a user ethernet interface without an ethernet address (%p) or an MTU (%p)", buf, 0x16u);

              }
            }
            else
            {
              v57 = ne_log_obj(v29, v30);
              v58 = objc_claimAutoreleasedReturnValue(v57);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v59 = objc_msgSend(v27, "type");
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v59;
                _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Wrong type for creating a user ethernet interface: %ld", buf, 0xCu);
              }
            }

            v68((uint64_t)v28, 0);
          }
LABEL_42:

          goto LABEL_36;
        }
      }
      v56 = ne_log_obj(v23, v24);
      v55 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ethernetAddress"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mtu"));
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v62;
        _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Cannot create a user ethernet interface without a ethernet address (%p) or an MTU (%p)", buf, 0x16u);

      }
    }
    else
    {
      v54 = ne_log_obj(v15, v16);
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Cannot create a virtual interface with unknown type %ld", buf, 0xCu);
      }
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    goto LABEL_36;
  }
  if (v10 == (char *)1 && -[NESMVPNSession type](self, "type") == 2)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    v20 = v18;
    v22 = v18 && (Property = objc_getProperty(v18, v19, 24, 1)) != 0 && Property[5] == 1;

  }
  else
  {
    v22 = 0;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  -[NESMVPNSession setVirtualInterface:](self, "setVirtualInterface:", NEVirtualInterfaceCreateNexusExtended(kCFAllocatorDefault, v10, v53, self, 1, v22, 0, 4096, 0, 0, 0));

  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    NEVirtualInterfaceEnableFlowswitch(-[NESMVPNSession virtualInterface](self, "virtualInterface"), 1);
    if (v10 == (char *)1)
      NEVirtualInterfaceSetMaxPendingPackets(-[NESMVPNSession virtualInterface](self, "virtualInterface"), 64);
    v17[2](v17);
  }
  (*((void (**)(id, NEVirtualInterface_s *))v9 + 2))(v9, -[NESMVPNSession virtualInterface](self, "virtualInterface"));
LABEL_36:

}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  NESMVPNSession *v9;
  id v10;
  NESMVPNSession *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int64_t v16;
  NESMVPNSession *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  CoreTelephonyClient *v39;
  CoreTelephonyClient *coreTelephonyClient;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  CoreTelephonyClient *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  char v57;
  _BYTE block[24];
  void *v59;
  NESMVPNSession *v60;
  id v61;
  NESMVPNSession *v62;
  id v63;
  int v64;

  v6 = *(_QWORD *)&a4;
  v56 = a3;
  v8 = a5;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v9 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v10 = v56;
    v11 = self;
    v12 = v8;
    v14 = v12;
    if (v9 && v11)
    {
      if ((_DWORD)v6)
      {
        v15 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](v9, "queue"));
        *(_QWORD *)block = _NSConcreteStackBlock;
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = sub_10000B384;
        v59 = &unk_1000BD478;
        v60 = v9;
        v64 = v6;
        v61 = v10;
        v62 = v11;
        v63 = v14;
        dispatch_async(v15, block);

      }
      else
      {
        v49 = ne_log_obj(v12, v13);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)block = 138412546;
          *(_QWORD *)&block[4] = v9;
          *(_WORD *)&block[12] = 2080;
          *(_QWORD *)&block[14] = "-[NESMAlwaysOnSession didStartWithPIDForSession:andVPNSession:andPID:error:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%@:%s: Got 0 pid, proceed with clean up", block, 0x16u);
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](v11, "stateHandler"));
        objc_msgSend(v51, "handlePlugin:didStartWithPID:error:", v10, 0, v14);

      }
    }

    goto LABEL_27;
  }
  v16 = -[NESMVPNSession tunnelKind](self, "tunnelKind");
  v17 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  v9 = v17;
  if (v16 != 2)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryPhysicalInterface](v17, "primaryPhysicalInterface"));
    if (objc_msgSend(v19, "type") != (id)1 && self)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appVPN"));
      if (v21)
      {
        v22 = (void *)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v55 = v19;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "appVPN"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "protocol"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sliceUUID"));

        v19 = v55;
        if (v26)
        {
          v27 = v56;
          v54 = v8;
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "appVPN"));
          if (v29)
          {
            v30 = (void *)v29;
            v53 = v27;
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "appVPN"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "protocol"));
            v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "sliceUUID"));

            if (v34)
            {
              if (self->_coreTelephonyClient)
                goto LABEL_16;
              v37 = objc_alloc((Class)CoreTelephonyClient);
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
              v39 = (CoreTelephonyClient *)objc_msgSend(v37, "initWithQueue:", v38);
              coreTelephonyClient = self->_coreTelephonyClient;
              self->_coreTelephonyClient = v39;

              v35 = -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
              if (self->_coreTelephonyClient)
              {
LABEL_16:
                v41 = ne_log_obj(v35, v36);
                v42 = objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "primaryPhysicalInterface"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "interfaceName"));
                  *(_DWORD *)block = 138412802;
                  *(_QWORD *)&block[4] = self;
                  *(_WORD *)&block[12] = 2112;
                  *(_QWORD *)&block[14] = v34;
                  *(_WORD *)&block[22] = 2112;
                  v59 = v45;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@: VPN Slice request in progress - sliceUUID %@ : primary-ifname %@ ", block, 0x20u);

                }
                v46 = self->_coreTelephonyClient;
                *(_QWORD *)block = _NSConcreteStackBlock;
                *(_QWORD *)&block[8] = 3221225472;
                *(_QWORD *)&block[16] = sub_100028E68;
                v59 = &unk_1000BD9C0;
                v60 = self;
                v34 = v34;
                v61 = v34;
                v27 = v53;
                v62 = v53;
                v64 = v6;
                v47 = v54;
                v63 = v54;
                -[CoreTelephonyClient requestSliceByUUID:completion:](v46, "requestSliceByUUID:completion:", v34, block);
                v57 = 1;

                v48 = v55;
LABEL_32:

                if ((v57 & 1) != 0)
                  goto LABEL_28;
                goto LABEL_25;
              }
            }
            v27 = v53;
          }
          else
          {

            v34 = 0;
          }
          v57 = 0;
          v47 = v54;
          v48 = v55;
          goto LABEL_32;
        }
      }
      else
      {

      }
    }

LABEL_25:
    v9 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryPhysicalInterface](v9, "primaryPhysicalInterface"));
    goto LABEL_26;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryCellularInterface](v17, "primaryCellularInterface"));
LABEL_26:
  v10 = v18;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interfaceName"));
  sub_100022920(self, v56, v6, v8, v52);

LABEL_27:
LABEL_28:

}

- (void)plugin:(id)a3 didInitializeWithUUIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NESMVPNSession *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v9 = ne_log_obj(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Plugin %@ initialized with Mach-O UUIDs %@", (uint8_t *)&v11, 0x20u);
  }

  -[NESMVPNSession addDefaultDropPolicyForPluginUUIDs:](self, "addDefaultDropPolicyForPluginUUIDs:", v7);
}

- (void)setDelegateInterfaceName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  NESMVPNSession *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: manager set delegate interface name to %@", buf, 0x16u);
  }

  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100028BD4;
    v9[3] = &unk_1000BD878;
    v9[4] = self;
    v10 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100028DBC;
    v8[3] = &unk_1000BD8A0;
    v8[4] = self;
    -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:](self, "queueChangesToTunnelConfiguration:completionHandler:", v9, v8);

  }
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  return 1;
}

- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  uint64_t is_debug_logging_enabled;
  int v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NESMVPNSession *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    v11 = objc_opt_class(NEPacketTunnelNetworkSettings);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
      __assert_rtn("-[NESMVPNSession plugin:didSetConfiguration:completionHandler:]", "NESMVPNSession.m", 1938, "[configuration isKindOfClass:[NEPacketTunnelNetworkSettings class]]");
    v12 = -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", v9);
    v14 = ne_log_obj(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      v17 = objc_retainBlock(v10);
      v26 = 138412802;
      v27 = self;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Handling set config request: session interface %@ - completionHandler %@", (uint8_t *)&v26, 0x20u);

    }
    -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    v19 = objc_msgSend(v18, "handleSetConfiguration");

    if (v19)
    {
      is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      v21 = is_debug_logging_enabled;
      v22 = ne_log_large_obj(is_debug_logging_enabled);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = v23;
      if (v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v26 = 138412546;
          v27 = self;
          v28 = 2112;
          v29 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@: plugin set tunnel network settings: %@", (uint8_t *)&v26, 0x16u);
        }
      }
      else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "descriptionWithIndent:options:", 0, 2));
        v26 = 138412546;
        v27 = self;
        v28 = 2112;
        v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@: plugin set tunnel network settings: %@", (uint8_t *)&v26, 0x16u);

      }
      goto LABEL_13;
    }
    -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", 0);
    if (v10)
    {
      v24 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0));
      (*((void (**)(id, NSObject *))v10 + 2))(v10, v24);
      -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", 0);
LABEL_13:

    }
  }

}

- (void)plugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v8, "handlePlugin:didAttachIPCWithEndpoint:", v7, v6);

}

- (void)sendEstablishIPCReply
{
  const char *v3;
  id Property;
  xpc_object_t reply;
  SEL v6;
  id v7;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v9;
  const char *v10;
  _xpc_connection_s *v11;
  id v12;
  SEL v13;
  SEL v14;
  xpc_object_t original;

  if (self)
  {
    if (!objc_getProperty(self, a2, 384, 1))
    {
      Property = objc_getProperty(self, v3, 392, 1);
      reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v6, reply, 384);

    }
    v7 = objc_getProperty(self, v3, 392, 1);
  }
  else
  {

    v7 = 0;
  }
  remote_connection = xpc_dictionary_get_remote_connection(v7);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  v11 = v9;
  if (self)
  {
    v12 = objc_getProperty(self, v10, 384, 1);
    xpc_connection_send_message(v11, v12);

    objc_setProperty_atomic(self, v13, 0, 384);
    objc_setProperty_atomic(self, v14, 0, 392);
  }
  else
  {
    xpc_connection_send_message(v9, 0);

  }
  original = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(original, "handleEstablishIPCReplySent");

}

- (BOOL)establishIPCPending
{
  if (self)
    self = (NESMVPNSession *)objc_getProperty(self, a2, 392, 1);
  return self != 0;
}

- (BOOL)shouldSendIPCAttachForPlugin:(id)a3
{
  unsigned int *v4;
  const char *v5;
  const char *v6;
  id Property;
  xpc_object_t reply;
  SEL v9;
  id v10;
  const char *v11;
  BOOL v12;
  id v14;
  id v15;
  signed int v16;

  v4 = (unsigned int *)a3;
  if (!-[NESMVPNSession establishIPCPending](self, "establishIPCPending"))
    goto LABEL_7;
  if (self)
  {
    if (!objc_getProperty(self, v5, 384, 1))
    {
      Property = objc_getProperty(self, v6, 392, 1);
      reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v9, reply, 384);

    }
    v10 = objc_getProperty(self, v6, 384, 1);
  }
  else
  {

    v10 = 0;
  }
  if (!xpc_dictionary_get_int64(v10, "SessionPrimaryPluginPID"))
  {
    if (self)
      v14 = objc_getProperty(self, v11, 384, 1);
    else
      v14 = 0;
    v15 = v14;
    v16 = sub_10001755C(v4);
    xpc_dictionary_set_int64(v15, "SessionPrimaryPluginPID", v16);

    v12 = 1;
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (void)setEndpointInEstablishIPCReply:(id)a3 forPlugin:(id)a4
{
  const char *v6;
  id v7;
  const char *v8;
  id Property;
  xpc_object_t reply;
  SEL v11;
  id v12;
  xpc_object_t value;

  value = a3;
  v7 = a4;
  if (self)
  {
    if (!objc_getProperty(self, v6, 384, 1))
    {
      Property = objc_getProperty(self, v8, 392, 1);
      reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v11, reply, 384);

    }
    v12 = objc_getProperty(self, v8, 384, 1);
  }
  else
  {

    v12 = 0;
  }
  xpc_dictionary_set_value(v12, "SessionPrimaryPluginEndpoint", value);
  -[NESMVPNSession sendEstablishIPCReply](self, "sendEstablishIPCReply");

}

- (void)requestInstall
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NESMVPNSession *v9;
  void *v10;
  NESMVPNSession *v11;
  NSObject *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];
  void *v21;
  void *v22;
  NESMVPNSession *v23;
  char v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "IPv4Settings"));
  v5 = objc_msgSend(v4, "hasDefaultRoute");

  sub_1000289E4(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    if (!v6)
      goto LABEL_13;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v8 = v7;
    v9 = self;
    v10 = v6;
    goto LABEL_9;
  }
  if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v8 = v7;
    v9 = self;
    v10 = 0;
LABEL_9:
    v13 = objc_msgSend(v7, "requestInstallForSession:withParentSession:exclusive:", v9, v10, v5);

    if ((v13 & 1) == 0)
    {
      v16 = ne_log_obj(v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
        *(_DWORD *)v20 = 138412546;
        *(_QWORD *)&v20[4] = self;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: config request: failed to request install [%@]", v20, 0x16u);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0));
      sub_100024740(self, v18);

    }
    goto LABEL_13;
  }
  v11 = self;
  if (v6)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));
    *(_QWORD *)v20 = _NSConcreteStackBlock;
    *(_QWORD *)&v20[8] = 3221225472;
    *(_QWORD *)&v20[16] = sub_100086BB0;
    v21 = &unk_1000BE8C8;
    v24 = (char)v5;
    v22 = v6;
    v23 = v11;
    dispatch_async(v12, v20);

  }
LABEL_13:

}

- (void)requestUninstall
{
  NESMVPNSession *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  NESMVPNSession *v7;

  sub_1000289E4(self);
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v3 = self;
    if (v5)
    {
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100087038;
      block[3] = &unk_1000BEB58;
      block[4] = v5;
      v7 = v3;
      dispatch_async(v4, block);

    }
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    objc_msgSend(v5, "requestUninstallForSession:", self);
  }

}

- (void)install
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NESMVPNSession *v15;
  NESMVPNSession *v16;
  NEVirtualInterface_s *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[5];
  BOOL v52;
  _QWORD v53[5];
  BOOL v54;
  _BYTE buf[24];
  const char *v56;
  NESMVPNSession *v57;
  NESMVPNSession *v58;
  NEVirtualInterface_s *v59;

  kdebug_trace(726990936, 0, 0, 0, 0);
  if (!-[NESMVPNSession virtualInterface](self, "virtualInterface")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities")),
        v3,
        !v3))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    sub_10002EE84((uint64_t)v19);

    sub_100025150(self, 1);
    return;
  }
  if (self)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tunnelRemoteAddress"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tunnelRemoteAddress"));
      v9 = NEGetAddressFamilyFromString(v8);

      if (v9)
      {
        v12 = ne_log_obj(v10, v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: Starting to set the tunnel configuration", buf, 0xCu);
        }

        if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
        {
          v14 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
          v15 = self;
          v16 = v15;
          if (v14 && -[NESMVPNSession virtualInterface](v15, "virtualInterface"))
          {
            v17 = -[NESMVPNSession virtualInterface](v16, "virtualInterface");
            myCFRetain();
            v18 = objc_claimAutoreleasedReturnValue(-[NSObject queue](v14, "queue"));
            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = sub_10000B4FC;
            v56 = (const char *)&unk_1000BE850;
            v57 = (NESMVPNSession *)v14;
            v59 = v17;
            v58 = v16;
            dispatch_async(v18, buf);

          }
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "VPN"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "protocol"));
          v29 = objc_msgSend(v28, "includeAllNetworks");

          if (v29)
          {
            v30 = sub_100025C40(self);
            if ((v30 & 1) == 0)
            {
              v32 = ne_log_obj(v30, v31);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v48;
                *(_WORD *)&buf[22] = 2080;
                v56 = "-[NESMVPNSession setConfiguration]";
                _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@[%@]:%s: applyTunnelDataPolicies failed", buf, 0x20u);

              }
            }
          }
          v34 = sub_1000260FC(self);
          if ((v34 & 1) != 0)
            goto LABEL_28;
          v36 = ne_log_obj(v34, v35);
          v14 = objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
LABEL_27:

LABEL_28:
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "VPN"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "protocol"));
            if (objc_msgSend(v39, "type") == (id)1)
            {
              v40 = 1;
            }
            else
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "VPN"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "protocol"));
              if (objc_msgSend(v43, "type") == (id)2)
              {
                v40 = 1;
              }
              else
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "VPN"));
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "protocol"));
                v40 = objc_msgSend(v45, "type") == (id)3;

              }
            }

            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = sub_1000262A4;
            v56 = (const char *)&unk_1000BD938;
            v57 = self;
            LOBYTE(v58) = v40;
            -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:](self, "queueChangesToTunnelConfiguration:completionHandler:", buf, &stru_1000BD978);
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100026634;
            v53[3] = &unk_1000BD938;
            v53[4] = self;
            v54 = v40;
            -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:](self, "queueChangesToTunnelConfiguration:completionHandler:", v53, &stru_1000BD998);
            v50[4] = self;
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_100027170;
            v51[3] = &unk_1000BD938;
            v51[4] = self;
            v52 = v40;
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_100027FE4;
            v50[3] = &unk_1000BD8A0;
            -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:](self, "queueChangesToTunnelConfiguration:completionHandler:", v51, v50);
            return;
          }
          v16 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2080;
          v56 = "-[NESMVPNSession setConfiguration]";
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@[%@]:%s: updateDNSSkipPolicies failed", buf, 0x20u);
        }

        goto LABEL_27;
      }
    }
    else
    {

    }
    v20 = ne_log_obj(v10, v11);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@: configuration has invalid tunnel remote address", buf, 0xCu);
    }

    v24 = ne_log_obj(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "tunnelRemoteAddress"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@: configuration has invalid tunnel remote address (%@)", buf, 0x16u);

    }
    sub_100025150(self, 0);
  }
}

- (void)installPended
{
  sub_100025150(self, 1);
}

- (id)copyTunnelInterfaceName
{
  return (id)NEVirtualInterfaceCopyName(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
}

- (int)getVirtualInterfaceMTU:(id)a3
{
  void *v3;
  int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "MTU"));
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)queueChangesToTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id Property;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  if (self)
    Property = objc_getProperty(self, v8, 376, 1);
  else
    Property = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024BA4;
  v13[3] = &unk_1000BD910;
  v10 = Property;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100024A98;
  v6[3] = &unk_1000BEA98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)uninstall
{
  int64_t v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  NESMVPNSession *v7;
  NESMVPNSession *v8;
  NEVirtualInterface_s *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  _QWORD v33[5];
  BOOL v34;
  _QWORD v35[5];
  BOOL v36;
  _BYTE block[24];
  const char *v38;
  NSObject *v39;
  id v40;
  NEVirtualInterface_s *v41;

  v3 = -[NESMVPNSession parentType](self, "parentType");
  v5 = v3;
  if (v3 == 1)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v7 = self;
    v8 = v7;
    if (v6 && v7 && -[NESMVPNSession virtualInterface](v7, "virtualInterface"))
    {
      v9 = -[NESMVPNSession virtualInterface](v8, "virtualInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"));
      myCFRetain(v9);
      v11 = objc_claimAutoreleasedReturnValue(-[NSObject queue](v6, "queue"));
      *(_QWORD *)block = _NSConcreteStackBlock;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = sub_10000B9D0;
      v38 = (const char *)&unk_1000BE850;
      v39 = v6;
      v40 = v10;
      v41 = v9;
      v12 = v10;
      dispatch_async(v11, block);

    }
    goto LABEL_6;
  }
  if (!self
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession")),
        v14 = sub_10002F054((uint64_t)v13),
        v13,
        (v14 & 1) == 0))
  {
    v15 = ne_log_obj(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v8 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    *(_DWORD *)block = 138412802;
    *(_QWORD *)&block[4] = self;
    *(_WORD *)&block[12] = 2112;
    *(_QWORD *)&block[14] = v8;
    *(_WORD *)&block[22] = 2080;
    v38 = "-[NESMVPNSession uninstall]";
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@[%@]:%s: removeTunnelDataPolicy failed", block, 0x20u);
LABEL_6:

LABEL_10:
  }
  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "VPN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "protocol"));
    if (objc_msgSend(v18, "type") == (id)1)
    {
      v19 = 1;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "VPN"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "protocol"));
      if (objc_msgSend(v28, "type") == (id)2)
      {
        v19 = 1;
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v32 = v5;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "VPN"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "protocol"));
        v19 = objc_msgSend(v30, "type") == (id)3;

        v5 = v32;
      }

    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002436C;
    v35[3] = &unk_1000BD938;
    v35[4] = self;
    v36 = v19;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100024480;
    v33[3] = &unk_1000BE6F0;
    v33[4] = self;
    v34 = v5 == 1;
    -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:](self, "queueChangesToTunnelConfiguration:completionHandler:", v35, v33);
  }
  else
  {
    if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
      sub_10008731C(v20, self);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    objc_msgSend(v21, "handleClearConfigurationResult:", 1);

    sub_100024630(self);
    sub_10007BFA4(self, v22);
    if (v5 != 1)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EF6C((uint64_t)v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002C404((uint64_t)v24);

      if (!-[NESMVPNSession virtualInterface](self, "virtualInterface"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
        sub_10002C5A0((uint64_t)v25);

      }
    }
    sub_100024740(self, 0);
  }
}

- (BOOL)isSecondaryConnection
{
  NESMVPNSession *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NESMVPNSession type](v2, "type") == 2 || v2->_isSecondaryConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsSecondaryConnection:(BOOL)a3
{
  _BOOL4 v3;
  NESMVPNSession *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NESMVPNSession *v11;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_isSecondaryConnection != v3)
  {
    v4->_isSecondaryConnection = v3;
    if ((id)-[NESMVPNSession parentType](v4, "parentType") == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](v4, "pluginConfigurationEntities"));

      if (v5)
      {
        -[NESMVPNSession requestInstall](v4, "requestInstall");
      }
      else
      {
        v8 = ne_log_obj(v6, v7);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: plugin configuration is not set yet", (uint8_t *)&v10, 0xCu);
        }

      }
    }
  }
  objc_sync_exit(v4);

}

- (unsigned)isInterfaceIPAvailable:(const char *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ifstate;
  uint64_t v9;
  unint64_t flags;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  int v30;
  NESMVPNSession *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;

  v5 = nwi_state_copy(self, a2);
  if (!v5)
  {
    v19 = ne_log_obj(0, v6);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      v30 = 138412802;
      v31 = self;
      v32 = 2112;
      v33 = (uint64_t)v28;
      v34 = 2080;
      v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@[%@]:%s:: no state", (uint8_t *)&v30, 0x20u);

    }
    goto LABEL_16;
  }
  v7 = v5;
  ifstate = nwi_state_get_ifstate(v5, a3);
  if (!ifstate)
  {
    v21 = ne_log_obj(0, v9);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      v30 = 138412802;
      v31 = self;
      v32 = 2112;
      v33 = (uint64_t)v29;
      v34 = 2080;
      v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@[%@]:%s:: no ifState", (uint8_t *)&v30, 0x20u);

    }
    nwi_state_release(v7);
LABEL_16:
    LOBYTE(v14) = 0;
    return v14;
  }
  flags = nwi_ifstate_get_flags(ifstate);
  v12 = ne_log_obj(flags, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    v30 = 138413058;
    v31 = self;
    v32 = 2112;
    v33 = (uint64_t)v24;
    v34 = 2080;
    v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
    v36 = 1024;
    LODWORD(v37) = flags;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: flags %X", (uint8_t *)&v30, 0x26u);

  }
  if ((flags & 3) != 0)
    v14 = (flags >> 2) & 1;
  else
    v14 = 0;
  v15 = nwi_state_release(v7);
  v17 = ne_log_obj(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v25 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    v26 = (void *)v25;
    v27 = "DOWN";
    v30 = 138413058;
    v31 = self;
    if (v14)
      v27 = "UP";
    v32 = 2112;
    v33 = v25;
    v34 = 2080;
    v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
    v36 = 2080;
    v37 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: %s", (uint8_t *)&v30, 0x2Au);

  }
  return v14;
}

- (void)setStatus:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NESMVPNSession *v6;
  uint64_t v7;
  NESMVPNSession *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NESMVPNSession *v14;
  NSObject *v15;
  NESMVPNSession *v16;
  NSObject *v17;
  id v18;
  unsigned int v19;
  NSObject *v20;
  SEL v21;
  void *v22;
  const char *v23;
  id v24;
  void *v25;
  NESMAlwaysOnSessionRetryCounter *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  SEL v30;
  id v31;
  void *v32;
  int64_t interval;
  int64_t retryCount;
  int64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  dispatch_time_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  const char *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  SEL v69;
  SEL v70;
  _BOOL8 v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  objc_super v75;
  void **block;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NESMVPNSession *v81;
  _BYTE buf[24];
  const char *v83;
  __int128 v84;
  int v85;

  v3 = *(_QWORD *)&a3;
  v75.receiver = self;
  v75.super_class = (Class)NESMVPNSession;
  -[NESMSession setStatus:](&v75, "setStatus:");
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v6 = self;
    v8 = v6;
    if (!v5 || !v6)
      goto LABEL_44;
    v9 = ne_log_obj(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"));
      v42 = ne_session_status_to_string(v3);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2080;
      v83 = "-[NESMAlwaysOnSession setStatusFromSession:andStatus:]";
      LOWORD(v84) = 2080;
      *(_QWORD *)((char *)&v84 + 2) = v42;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: VPN Status to Parent: %s", buf, 0x2Au);

    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "queue"));
    block = _NSConcreteStackBlock;
    v77 = 3221225472;
    v78 = sub_10000BFBC;
    v79 = &unk_1000BECF8;
    v80 = v5;
    LODWORD(v81) = v3;
    dispatch_async(v11, &block);

    if ((_DWORD)v3 != 1)
    {
      if ((_DWORD)v3 == 3)
        sub_10000A66C((void *)v5, v8);
      goto LABEL_44;
    }
    if ((*(_BYTE *)(v5 + 353) & 1) != 0
      || (v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"))),
          v19 = -[NESMVPNSession isInterfaceIPAvailable:](v8, "isInterfaceIPAvailable:", objc_msgSend(v18, "UTF8String")), v18, !v19))
    {
      v36 = ne_log_obj(v12, v13);
      v20 = objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_43:

        goto LABEL_44;
      }
      v37 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2080;
      v83 = "-[NESMAlwaysOnSession setStatusFromSession:andStatus:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: Session stopped or interface down, no retry", buf, 0x20u);
LABEL_28:

      goto LABEL_43;
    }
    v20 = v8;
    if (!objc_getProperty((id)v5, v21, 408, 1)
      || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interfaceName](v20, "interfaceName")),
          v22,
          !v22))
    {

LABEL_26:
      v40 = ne_log_obj(v38, v39);
      v37 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interfaceName](v20, "interfaceName"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 2080;
        v83 = "-[NESMAlwaysOnSession alwaysOnRetry:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: failed to get retry interval", buf, 0x20u);

      }
      goto LABEL_28;
    }
    v24 = objc_getProperty((id)v5, v23, 408, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interfaceName](v20, "interfaceName"));
    v26 = (NESMAlwaysOnSessionRetryCounter *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v25));

    if (v26
      || (v26 = objc_alloc_init(NESMAlwaysOnSessionRetryCounter),
          v29 = 1,
          v31 = objc_getProperty((id)v5, v30, 408, 1),
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interfaceName](v20, "interfaceName")),
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v26, v32),
          v31,
          v32,
          v26))
    {
      interval = v26->_interval;
      if (interval)
      {
        retryCount = v26->_retryCount;
        v26->_retryCount = retryCount + 1;
        if (retryCount < *(_QWORD *)(v5 + 440))
          goto LABEL_35;
        interval *= *(_QWORD *)(v5 + 432);
        v26->_interval = interval;
        v35 = *(_QWORD *)(v5 + 424);
        if (interval > v35)
        {
          v26->_interval = v35;
          interval = v35;
        }
LABEL_34:
        v26->_retryCount = 0;
LABEL_35:

        if ((interval & 0x8000000000000000) == 0)
        {
          if (interval)
          {
            v45 = ne_log_obj(v38, v39);
            v46 = objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interfaceName](v20, "interfaceName"));
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v5;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v50;
              *(_WORD *)&buf[22] = 2080;
              v83 = "-[NESMAlwaysOnSession alwaysOnRetry:]";
              LOWORD(v84) = 2048;
              *(_QWORD *)((char *)&v84 + 2) = interval;
              _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: Retrying in %ld Secs", buf, 0x2Au);

            }
            v47 = dispatch_time(0, 1000000000 * interval);
            v48 = objc_claimAutoreleasedReturnValue(-[NSObject queue](v20, "queue"));
            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = sub_10000BDD8;
            v83 = (const char *)&unk_1000BEB58;
            *(_QWORD *)&v84 = v5;
            *((_QWORD *)&v84 + 1) = v20;
            dispatch_after(v47, v48, buf);

            goto LABEL_42;
          }
LABEL_41:
          v52 = objc_claimAutoreleasedReturnValue(-[NSObject queue](v20, "queue"));
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_10000BCB4;
          v83 = (const char *)&unk_1000BEB58;
          *(_QWORD *)&v84 = v5;
          *((_QWORD *)&v84 + 1) = v20;
          dispatch_async(v52, buf);

LABEL_42:
          goto LABEL_43;
        }
        goto LABEL_26;
      }
      v29 = 0;
    }
    v43 = ne_log_obj(v27, v28);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interfaceName](v20, "interfaceName"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2080;
      v83 = "-[NESMAlwaysOnSession nextRetryIntervalForSession:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: Retrying now", buf, 0x20u);

    }
    if (v29)
    {

      goto LABEL_41;
    }
    interval = 0;
    v26->_interval = *(_QWORD *)(v5 + 416);
    goto LABEL_34;
  }
  if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)2)
    goto LABEL_45;
  v5 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
  v14 = self;
  v8 = v14;
  if (v5 && v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "queue"));
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100086694;
    v83 = (const char *)&unk_1000BED20;
    *(_QWORD *)&v84 = v5;
    v16 = v8;
    *((_QWORD *)&v84 + 1) = v16;
    v85 = v3;
    dispatch_async(v15, buf);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "queue"));
    block = _NSConcreteStackBlock;
    v77 = 3221225472;
    v78 = sub_100086918;
    v79 = &unk_1000BEB58;
    v80 = v5;
    v81 = v16;
    dispatch_async(v17, &block);

  }
LABEL_44:

LABEL_45:
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "VPN"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "protocol"));
  v56 = objc_msgSend(v55, "includeAllNetworks");

  if (!v56)
  {
LABEL_52:
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "appVPN"));
    if (v62)
    {
      v63 = (void *)v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "appVPN"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "protocol"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "sliceUUID"));

      if ((_DWORD)v3 == 1 && v67)
      {
        if (self)
        {
          objc_setProperty_atomic(self, v68, 0, 496);
          self->_coreTelephonyConnType = 36;
          objc_setProperty_atomic(self, v69, 0, 504);
          self->_slicePendingStartPluginPid = 0;
          objc_setProperty_atomic(self, v70, 0, 512);
        }
      }
    }
    else
    {

    }
    return;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "VPN"));
  v59 = objc_msgSend(v58, "isOnDemandEnabled");

  if ((v59 & 1) != 0)
  {
    if ((_DWORD)v3 == 1)
    {
      -[NESMVPNSession setStopped:](self, "setStopped:", 1);
      return;
    }
    goto LABEL_52;
  }
  if ((_DWORD)v3 != 1)
  {
    if ((_DWORD)v3 == 3)
    {
      sub_100023C98(self, v60);
      return;
    }
    goto LABEL_52;
  }
  v71 = -[NESMVPNSession stopped](self, "stopped");
  if (v71)
  {
    v73 = ne_log_obj(v71, v72);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NESMVPNSession setStatus:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%@:%s: Session stopped, no retry", buf, 0x16u);
    }

  }
  else
  {
    sub_100023CFC(self, v72);
  }
}

- (void)setLastStopReason:(int)a3
{
  void *v5;
  NESMVPNSession *v6;
  NSObject *v7;
  objc_super v8;
  _QWORD block[5];
  NESMVPNSession *v10;
  int v11;

  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSession;
  -[NESMSession setLastStopReason:](&v8, "setLastStopReason:");
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v6 = self;
    if (v5)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000869A8;
      block[3] = &unk_1000BED20;
      block[4] = v5;
      v10 = v6;
      v11 = a3;
      dispatch_async(v7, block);

    }
  }
}

- (void)setLastDisconnectError:(id)a3
{
  id v4;
  void *v5;
  NESMVPNSession *v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  _QWORD block[5];
  NESMVPNSession *v11;
  id v12;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NESMVPNSession;
  -[NESMSession setLastDisconnectError:](&v9, "setLastDisconnectError:", v4);
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v6 = self;
    v7 = v4;
    if (v5)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100086AAC;
      block[3] = &unk_1000BE878;
      block[4] = v5;
      v11 = v6;
      v12 = v7;
      dispatch_async(v8, block);

    }
  }

}

- (void)prepareNetwork
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  unsigned int v7;
  void *v8;
  NESMVPNSession *v9;
  NSObject *v10;
  void *v11;
  id v12;
  objc_super v13;
  _BYTE block[24];
  const char *v15;
  NESMVPNSession *v16;
  id v17;

  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v4 = ne_log_obj(1, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      *(_DWORD *)block = 138412802;
      *(_QWORD *)&block[4] = self;
      *(_WORD *)&block[12] = 2112;
      *(_QWORD *)&block[14] = v11;
      *(_WORD *)&block[22] = 2080;
      v15 = "-[NESMVPNSession prepareNetwork]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: enter", block, 0x20u);

    }
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName")));
    v7 = -[NESMVPNSession isInterfaceIPAvailable:](self, "isInterfaceIPAvailable:", objc_msgSend(v6, "UTF8String"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      -[NESMVPNSession handleNetworkPrepareResult:](self, "handleNetworkPrepareResult:", v8);

    }
  }
  else if ((id)-[NESMVPNSession tunnelKind](self, "tunnelKind") == (id)2
         && (id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v9 = self;
    if (v12)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queue"));
      *(_QWORD *)block = _NSConcreteStackBlock;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = sub_1000862F0;
      v15 = (const char *)&unk_1000BEB58;
      v16 = v9;
      v17 = v12;
      dispatch_async(v10, block);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NESMVPNSession;
    -[NESMSession prepareNetwork](&v13, "prepareNetwork");
  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  uint8_t buf[4];
  NESMVPNSession *v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  void *v49;

  v5 = a3;
  if (!v5)
  {
    sub_100023214(self);
LABEL_15:
    v16 = 0;
    goto LABEL_35;
  }
  if (-[NESMVPNSession type](self, "type") == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));
  }
  else if (-[NESMVPNSession type](self, "type") == 6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "isEnabled");

  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    *(_DWORD *)buf = 138412802;
    v45 = self;
    v46 = 1024;
    v47 = v8;
    v48 = 2112;
    v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@: NESMVPNSession - enabled = %d <%@>", buf, 0x1Cu);

  }
  v43.receiver = self;
  v43.super_class = (Class)NESMVPNSession;
  if (!-[NESMSession handleUpdateConfiguration:](&v43, "handleUpdateConfiguration:", v5))
    goto LABEL_15;
  sub_100023214(self);
  if (!-[NESMSession disableOnDemand](self, "disableOnDemand"))
    goto LABEL_24;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "VPN"));
  if (v15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
    if ((objc_msgSend(v3, "isOnDemandEnabled") & 1) == 0)
    {

LABEL_20:
      -[NESMSession setDisableOnDemand:](self, "setDisableOnDemand:", 0);
      goto LABEL_24;
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appVPN"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));
    v21 = objc_msgSend(v20, "isOnDemandEnabled");

    if (v15)
    {

    }
    if ((v21 & 1) == 0)
      goto LABEL_20;
  }
  else
  {

    if (v15)
    {

    }
  }
LABEL_24:
  if (-[NESMVPNSession type](self, "type") == 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appVPN"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "protocol"));
    -[NESMVPNSession setProtocol:](self, "setProtocol:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));
  }
  else
  {
    v26 = -[NESMVPNSession type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v28 = v27;
    if (v26 != 6)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "VPN"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "protocol"));
      -[NESMVPNSession setProtocol:](self, "setProtocol:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPN"));
      LODWORD(v40) = objc_msgSend(v42, "isEnabled");

      if (!(_DWORD)v40)
        goto LABEL_30;
      goto LABEL_29;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dnsProxy"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "protocol"));
    -[NESMVPNSession setProtocol:](self, "setProtocol:", v30);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dnsProxy"));
  }
  v31 = v25;
  v32 = objc_msgSend(v25, "isEnabled");

  if ((v32 & 1) != 0)
  {
LABEL_29:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    objc_msgSend(v33, "handleUpdateConfiguration");

  }
LABEL_30:
  v34 = -[NESMVPNSession resetPerAppPolicy](self, "resetPerAppPolicy");
  if (!v34)
  {
    v36 = ne_log_obj(v34, v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@: Failed to reset the per-app policy after a configuration update, disconnecting", buf, 0xCu);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    objc_msgSend(v38, "handleStop");

  }
  v16 = 1;
LABEL_35:

  return v16;
}

- (NSString)pluginType
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v4 = objc_msgSend(v3, "type");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v6 = v5;
  if (v4 != (id)4)
  {
    v7 = objc_msgSend(v5, "type");

    if (v7 != (id)5)
    {
      v8 = 0;
      return (NSString *)v8;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pluginType"));

  return (NSString *)v8;
}

- (BOOL)prepareConfigurationForStart
{
  uint64_t v3;
  NSObject *v4;
  int v6;
  NESMVPNSession *v7;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@: Default prepareConfigurationForStart", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (BOOL)resetPerAppPolicy
{
  NESMVPNSession *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  BOOL v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  char v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NESMVPNSession *v80;
  void *v81;
  void *v82;
  void *v83;
  id obj;
  id obja;
  uint64_t v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97[128];
  _BYTE buf[24];
  void *v99;
  uint64_t v100;

  v2 = self;
  v3 = sub_100079A38((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[NESMVPNSession type](v2, "type") != 2 || !-[NESMVPNSession virtualInterface](v2, "virtualInterface"))
    goto LABEL_45;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appVPN"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appRules"));
  if (!objc_msgSend(v7, "count") && !objc_msgSend(v4, "count"))
  {

    goto LABEL_45;
  }
  v8 = -[NESMSession isActive](v2, "isActive");

  if (!v8)
  {
LABEL_45:
    v59 = 1;
    goto LABEL_46;
  }
  v83 = (void *)NEVirtualInterfaceCopyName(-[NESMVPNSession virtualInterface](v2, "virtualInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](v2, "policySession"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appVPN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appRules"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](v2, "uid"));
  sub_10003A874((uint64_t)v9, v12, (uint64_t)objc_msgSend(v13, "intValue"));

  v80 = v2;
  if (v2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appVPN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appRules"));

    if (objc_msgSend(v18, "count"))
    {
      v81 = v4;
      v19 = objc_alloc_init((Class)NSMutableDictionary);
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v78 = v18;
      obj = v18;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
      if (v20)
      {
        v21 = v20;
        v86 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v94 != v86)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
            v89 = 0u;
            v90 = 0u;
            v91 = 0u;
            v92 = 0u;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cachedMachOUUIDs"));
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v90;
              do
              {
                for (j = 0; j != v26; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v90 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)j);
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "matchSigningIdentifier"));
                  objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, v29);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
              }
              while (v26);
            }

          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
        }
        while (v21);
      }

      v2 = v80;
      v4 = v81;
      v18 = v78;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  v31 = ne_log_obj(v14, v15);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v2;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@: Setting the app UUID map with %lu entries", buf, 0x16u);
  }

  v34 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](v2, "primaryTunnelPlugin"));
  v35 = (void *)v34;
  if (v34)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100017B18;
    v99 = &unk_1000BEA00;
    v100 = v34;
    v36 = v19;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "remotePluginObjectWithErrorHandler:", buf));
    objc_msgSend(v37, "setAppUUIDMap:", v36);

  }
  if (!ne_session_disable_restrictions())
    goto LABEL_35;
  v38 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](v2, "protocol"));
  v39 = -[NSObject type](v38, "type");
  v40 = v39 == (id)5;
  if (v39 == (id)5)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](v2, "protocol"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "serverAddress"));
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("0.0.0.0"));

    if (v43)
    {
      v46 = ne_log_obj(v44, v45);
      v38 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v2;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@: Not installing interface tunnel policies", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_35:
    v74 = 0;
    goto LABEL_36;
  }
LABEL_34:
  v74 = v40;

LABEL_36:
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](v2, "policySession"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "appVPN"));
  obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "appRules"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginPIDArray](v2, "pluginPIDArray"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](v2, "pluginConfigurationEntities"));
  v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "DNSSettings"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](v2, "pluginConfigurationEntities"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "proxySettings"));
  v53 = objc_msgSend(v52, "enabled");
  v77 = v48;
  v79 = v47;
  v76 = v49;
  if ((v53 & 1) != 0)
  {
    v54 = 1;
  }
  else
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](v2, "protocol"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "proxySettings"));
    v54 = objc_msgSend(v72, "enabled");
  }
  v75 = (void *)v50;
  v55 = v50 != 0;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "appVPN"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "excludedDomains"));
  v59 = sub_10003BDDC((uint64_t)v87, obja, v83, v82, v55, v54, v74, v4, v58);

  if ((v53 & 1) == 0)
  {

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v80, "configuration"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "VPN"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "exceptionApps"));

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](v80, "policySession"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v80, "configuration"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "VPN"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "exceptionApps"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v80, "server"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "primaryPhysicalInterface"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "interfaceName"));
    v69 = v4;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](v80, "uid"));
    sub_10003AA34((uint64_t)v63, v65, v68, (int)objc_msgSend(v70, "intValue"));

    v4 = v69;
  }

LABEL_46:
  return v59;
}

- (void)handleInstalledAppsChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002315C;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)invalidate
{
  NESMVPNSessionState *stateHandler;
  objc_super v4;

  if (self)
  {
    -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  }
  else
  {
    objc_msgSend(0, "setDelegate:", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)NESMVPNSession;
  -[NESMSession invalidate](&v4, "invalidate");
  -[NESMVPNSessionState leave](self->_stateHandler, "leave");
  stateHandler = self->_stateHandler;
  self->_stateHandler = 0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  const char *v12;
  id Property;
  id v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  id v21;
  const char *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t IDSNexusIfIndex;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_super v56;
  uint8_t buf[4];
  unint64_t v58;
  __int16 v59;
  id v60;

  v10 = a3;
  v11 = a4;
  v56.receiver = self;
  v56.super_class = (Class)NESMVPNSession;
  -[NESMSession observeValueForKeyPath:ofObject:change:context:](&v56, "observeValueForKeyPath:ofObject:change:context:", v10, v11, a5, a6);
  if (self)
    Property = objc_getProperty(self, v12, 424, 1);
  else
    Property = 0;
  v14 = Property;
  if (v14 == v11)
  {
    v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("path"));

    if (!v15)
      goto LABEL_5;
    v18 = ne_log_obj(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        v21 = objc_getProperty(self, v20, 424, 1);
      else
        v21 = 0;
      *(_DWORD *)buf = 134218240;
      v58 = (unint64_t)v11;
      v59 = 2048;
      v60 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "IDS Nexus: got EVENT %p %p", buf, 0x16u);
    }

    if (self)
      v23 = objc_getProperty(self, v22, 424, 1);
    else
      v23 = 0;
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
    v24 = objc_msgSend(v14, "status");
    if (v24 == (id)1)
    {
      if (self)
        IDSNexusIfIndex = self->_IDSNexusIfIndex;
      else
        IDSNexusIfIndex = 0;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interface"));
      v28 = objc_msgSend(v27, "interfaceIndex");

      if ((id)IDSNexusIfIndex == v28)
        goto LABEL_4;
      v31 = ne_log_obj(v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        if (self)
          v33 = self->_IDSNexusIfIndex;
        else
          v33 = 0;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interface"));
        v35 = objc_msgSend(v34, "interfaceIndex");
        *(_DWORD *)buf = 134218240;
        v58 = v33;
        v59 = 2048;
        v60 = v35;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "IDS Nexus interface changed %ld -> %ld", buf, 0x16u);

      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interface"));
      v37 = objc_msgSend(v36, "interfaceIndex");
      if (self)
        self->_IDSNexusIfIndex = (unint64_t)v37;

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interface"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "interfaceName"));
      v41 = sub_100042164((uint64_t)v38, v40);

      if ((v41 & 1) != 0)
        goto LABEL_4;
      v44 = ne_log_obj(v42, v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interface"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "interfaceName"));
        *(_DWORD *)buf = 138412290;
        v58 = (unint64_t)v47;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to add IDS Nexus policy for %@", buf, 0xCu);

      }
    }
    else
    {
      v48 = ne_log_obj(v24, v25);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "IDS Nexus interface unusable", buf, 2u);
      }

      if (self)
        self->_IDSNexusIfIndex = 0;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v52 = sub_10002F5BC(v50, v51);

      if ((v52 & 1) != 0)
        goto LABEL_4;
      v55 = ne_log_obj(v53, v54);
      v45 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", buf, 2u);
      }
    }

  }
LABEL_4:

LABEL_5:
}

- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void (**stopCompletionHandler)(void);
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NESMVPNSession;
  -[NESMSession stopIfNecessaryWithReason:](&v11, "stopIfNecessaryWithReason:", v4);
  stopCompletionHandler = (void (**)(void))self->_stopCompletionHandler;
  if (stopCompletionHandler)
  {
    stopCompletionHandler[2]();
    v8 = self->_stopCompletionHandler;
    self->_stopCompletionHandler = 0;

  }
  v9 = objc_retainBlock(v6);
  v10 = self->_stopCompletionHandler;
  self->_stopCompletionHandler = v9;

}

- (BOOL)supportsDefaultDrop
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (!-[NESMSession defaultDropType](self, "defaultDropType") || -[NESMVPNSession type](self, "type") != 1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "VPN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protocol"));
  v6 = objc_msgSend(v5, "includeAllNetworks");

  return v6;
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int coreTelephonyConnType;
  const char *v12;
  void *v13;
  const char *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  const char *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  SEL v34;
  SEL v35;
  void *v36;
  void *v37;
  SEL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  unsigned int v48;
  id v49;
  const char *v50;
  SEL v51;
  id v52;
  int slicePendingStartPluginPid;
  const char *v54;
  id v55;
  uint64_t v56;
  id v57;
  SEL v58;
  id v59;
  SEL v60;
  id v61;
  SEL v62;
  SEL v63;
  void *v64;
  unsigned int v65;
  SEL v66;
  id Property;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  NESMVPNSession *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  unsigned int v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v9)
    goto LABEL_20;
  if (self)
  {
    coreTelephonyConnType = self->_coreTelephonyConnType;
    if (coreTelephonyConnType == 36)
      goto LABEL_20;
  }
  else
  {
    coreTelephonyConnType = 0;
  }
  if (coreTelephonyConnType != a4)
    goto LABEL_20;
  if (objc_msgSend(v9, "state") == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));

    if (v13)
    {
      if (self)
      {
        if (objc_getProperty(self, v12, 496, 1))
        {
          v15 = objc_getProperty(self, v14, 496, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) == 0)
          {
            v20 = ne_log_obj(v18, v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v72 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "appVPN"));
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "protocol"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "sliceUUID"));
              v65 = objc_msgSend(v10, "state");
              Property = objc_getProperty(self, v66, 496, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));
              *(_DWORD *)buf = 138413570;
              v74 = self;
              v75 = 1024;
              v76 = a4;
              v77 = 2112;
              v78 = v64;
              v79 = 1024;
              v80 = v65;
              v81 = 2112;
              v82 = Property;
              v83 = 2112;
              v84 = v68;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@: VPN Slice connectionStateChanged - Invalid transition <type %d> - sliceUUID %@ : <state %d: slice ifname %@ --> %@>", buf, 0x36u);

            }
LABEL_19:
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
            objc_msgSend(v36, "handleStop");

            goto LABEL_20;
          }
          goto LABEL_20;
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));
        objc_setProperty_atomic(self, v38, v37, 496);
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));
      }

      v41 = ne_log_obj(v39, v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "appVPN"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "protocol"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sliceUUID"));
        v48 = objc_msgSend(v10, "state");
        if (self)
          v49 = objc_getProperty(self, v47, 496, 1);
        else
          v49 = 0;
        *(_DWORD *)buf = 138413314;
        v74 = self;
        v75 = 1024;
        v76 = a4;
        v77 = 2112;
        v78 = v46;
        v79 = 1024;
        v80 = v48;
        v81 = 2112;
        v82 = v49;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@: VPN Slice connectionStateChanged <type %d> - sliceUUID %@ : <state %d: slice ifname nil --> %@>", buf, 0x2Cu);

      }
      if (self)
      {
        -[NESMVPNSession setDelegateInterfaceName:](self, "setDelegateInterfaceName:", objc_getProperty(self, v50, 496, 1));
        v52 = objc_getProperty(self, v51, 504, 1);
        if (v52)
        {
          slicePendingStartPluginPid = self->_slicePendingStartPluginPid;

          if (slicePendingStartPluginPid)
          {
            v55 = objc_getProperty(self, v54, 504, 1);
            v56 = self->_slicePendingStartPluginPid;
            v57 = v55;
            v59 = objc_getProperty(self, v58, 512, 1);
            v61 = objc_getProperty(self, v60, 496, 1);
            sub_100022920(self, v57, v56, v59, v61);

            objc_setProperty_atomic(self, v62, 0, 504);
            self->_slicePendingStartPluginPid = 0;
            objc_setProperty_atomic(self, v63, 0, 512);
          }
        }
      }
      else
      {
        objc_msgSend(0, "setDelegateInterfaceName:", 0);
      }
      goto LABEL_20;
    }
  }
  if (self)
  {
    v22 = objc_getProperty(self, v12, 496, 1);
    if (v22)
    {
      v24 = v22;
      v25 = objc_getProperty(self, v23, 496, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interfaceName"));

      if (v25 == v26)
      {
        v29 = ne_log_obj(v27, v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "appVPN"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "protocol"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "sliceUUID"));
          *(_DWORD *)buf = 138413314;
          v74 = self;
          v75 = 1024;
          v76 = a4;
          v77 = 2112;
          v78 = v33;
          v79 = 1024;
          v80 = objc_msgSend(v10, "state");
          v81 = 2112;
          v82 = objc_getProperty(self, v34, 496, 1);
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@: VPN Slice connectionStateChanged <type %d> - sliceUUID %@ : <state %d: slice ifname %@ --> nil>", buf, 0x2Cu);

        }
        objc_setProperty_atomic(self, v35, 0, 496);
        goto LABEL_19;
      }
    }
  }
LABEL_20:

}

- (int64_t)state
{
  return self->_state;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int)a3
{
  self->_sessionType = a3;
}

- (NESMVPNSessionState)stateHandler
{
  return (NESMVPNSessionState *)objc_getProperty(self, a2, 528, 1);
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSMutableDictionary)connectParameters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 536, 1);
}

- (void)setConnectParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (BOOL)sleepOnDisconnect
{
  return self->_sleepOnDisconnect;
}

- (void)setSleepOnDisconnect:(BOOL)a3
{
  self->_sleepOnDisconnect = a3;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (NEVPNAuthenticationPlugin)authenticationPlugin
{
  return (NEVPNAuthenticationPlugin *)objc_getProperty(self, a2, 552, 1);
}

- (void)setAuthenticationPlugin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (NEVPNTunnelPlugin)primaryTunnelPlugin
{
  return (NEVPNTunnelPlugin *)objc_getProperty(self, a2, 560, 1);
}

- (void)setPrimaryTunnelPlugin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NEVPNProtocol)protocol
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 568, 1);
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (NSMutableDictionary)cachedStateHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 576, 1);
}

- (void)setCachedStateHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (NETunnelNetworkSettings)pluginConfigurationEntities
{
  return (NETunnelNetworkSettings *)objc_getProperty(self, a2, 584, 1);
}

- (void)setPluginConfigurationEntities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (int64_t)parentType
{
  return self->_parentType;
}

- (void)setParentType:(int64_t)a3
{
  self->_parentType = a3;
}

- (NESMSession)parent
{
  return (NESMSession *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)isSecondaryInterface
{
  return self->_isSecondaryInterface;
}

- (void)setIsSecondaryInterface:(BOOL)a3
{
  self->_isSecondaryInterface = a3;
}

- (int64_t)tunnelKind
{
  return self->_tunnelKind;
}

- (void)setTunnelKind:(int64_t)a3
{
  self->_tunnelKind = a3;
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 616, 1);
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (NSMutableArray)setConfigurationCompletionHandlerArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSetConfigurationCompletionHandlerArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (id)pluginCompletionHandler
{
  return objc_getProperty(self, a2, 632, 1);
}

- (void)setPluginCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 632);
}

- (BOOL)reassertedByPlugin
{
  return self->_reassertedByPlugin;
}

- (void)setReassertedByPlugin:(BOOL)a3
{
  self->_reassertedByPlugin = a3;
}

- (NEUserNotification)notification
{
  return (NEUserNotification *)objc_getProperty(self, a2, 640, 1);
}

- (void)setNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (NSString)delegateInterfaceAddress
{
  return (NSString *)objc_getProperty(self, a2, 648, 1);
}

- (void)setDelegateInterfaceAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (NEDNSSettingsNetworkAgent)dnsAgent
{
  return (NEDNSSettingsNetworkAgent *)objc_getProperty(self, a2, 656, 1);
}

- (void)setDnsAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (NWNetworkAgentRegistration)dnsAgentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 664, 1);
}

- (void)setDnsAgentRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (OS_xpc_object)lastStartMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 672, 1);
}

- (void)setLastStartMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStartMessage, 0);
  objc_storeStrong((id *)&self->_dnsAgentRegistration, 0);
  objc_storeStrong((id *)&self->_dnsAgent, 0);
  objc_storeStrong((id *)&self->_delegateInterfaceAddress, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong(&self->_pluginCompletionHandler, 0);
  objc_storeStrong((id *)&self->_setConfigurationCompletionHandlerArray, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_pluginConfigurationEntities, 0);
  objc_storeStrong((id *)&self->_cachedStateHandlers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_primaryTunnelPlugin, 0);
  objc_storeStrong((id *)&self->_authenticationPlugin, 0);
  objc_storeStrong((id *)&self->_connectParameters, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_sliceStartError, 0);
  objc_storeStrong((id *)&self->_slicePendingStartPlugin, 0);
  objc_storeStrong((id *)&self->_sliceInterfaceName, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_lastSetPathOverrideData, 0);
  objc_storeStrong((id *)&self->_pathOverrideAgent, 0);
  objc_storeStrong(&self->_stopCompletionHandler, 0);
  objc_storeStrong((id *)&self->_retryCounter, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_IDSNexusDomain, 0);
  objc_storeStrong((id *)&self->_IDSNexusPathEvaluator, 0);
  objc_storeStrong((id *)&self->_pendingConfigurationChangeTimer, 0);
  objc_storeStrong(&self->_pendingConfigurationChangeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_establishIPCMessage, 0);
  objc_storeStrong((id *)&self->_establishIPCReply, 0);
  objc_storeStrong((id *)&self->_tunnelConfigQueue, 0);
}

@end
