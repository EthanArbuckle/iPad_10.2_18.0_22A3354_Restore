@implementation NESMFilterSession

- (NESMFilterSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6;
  NESMFilterSession *v7;
  NESMFilterSession *v8;
  NESMPolicySession *v9;
  void *v10;
  id v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NESMFilterSession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v13, "initWithConfiguration:andServer:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_state = 0;
    v7->_externallyStopped = 0;
    v7->_restartIntervalMsecs = 500;
    v7->_restartIntervalAttempts = 0;
    v9 = [NESMPolicySession alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v11 = objc_msgSend(v6, "grade");
    if (v9)
      v9 = (NESMPolicySession *)sub_10002EB54((id *)&v9->super.isa, v10, 4, v11, (void *)1, (void *)1);
    -[NESMSession setPolicySession:](v8, "setPolicySession:", v9);

    sub_10007AAF8(v8);
  }

  return v8;
}

- (int)type
{
  return 4;
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
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
  unsigned __int8 v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentFilter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filterDataProviderBundleIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentFilter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "provider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterPacketProviderBundleIdentifier"));

  if (v8 && (objc_msgSend(v4, "isEqualToString:", v8) & 1) != 0)
  {
    v13 = 1;
  }
  else if (v12)
  {
    v13 = objc_msgSend(v4, "isEqualToString:", v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)handleInitializeState
{
  sub_100070FD8((id *)&self->super.super.isa, (const char *)1);
}

- (void)handleStartMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int controlUnit;
  const char *v20;
  xpc_object_t value;
  void *v22;
  const char *v23;
  void *v24;
  xpc_connection_t remote_connection;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  id Property;
  id v35;
  BOOL v36;
  id v37;
  const char *v38;
  void *v39;
  SEL v40;
  id v41;
  uint64_t v42;
  xpc_object_t v43;
  void *v44;
  void *v45;
  NETestAgent *v46;
  void *v47;
  void *v48;
  id *v49;
  uint64_t v50;
  uint64_t v51;
  NEFilterPlugin *v52;
  NSObject *v53;
  NEFilterPlugin *v54;
  SEL v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  uint64_t v59;
  uint64_t v60;
  objc_super v61;
  uint8_t buf[4];
  NESMFilterSession *v63;
  __int16 v64;
  unsigned int v65;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "externalIdentifier"));
  if (!v6)
  {

LABEL_9:
    if (self)
    {
      self->_externallyStopped = 0;
      objc_setProperty_atomic(self, v10, v4, 416);
      sub_100070F54(self, 0);
    }
    v61.receiver = self;
    v61.super_class = (Class)NESMFilterSession;
    v15 = -[NESMSession handleStartMessage:](&v61, "handleStartMessage:", v4);
    v17 = ne_log_obj(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      controlUnit = self->_controlUnit;
      *(_DWORD *)buf = 138412546;
      v63 = self;
      v64 = 1024;
      v65 = controlUnit;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Starting with control unit %u", buf, 0x12u);

    }
    else
    {

      if (!self)
      {
LABEL_15:
        value = xpc_dictionary_get_value(v4, "SessionOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue(value);
        v24 = v22;
        if (v22 && xpc_get_type(v22) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v24, "test-agent"))
        {
          remote_connection = xpc_dictionary_get_remote_connection(v4);
          v26 = objc_claimAutoreleasedReturnValue(remote_connection);
          v28 = (void *)v26;
          if (!v26)
          {
LABEL_22:
            v31 = ne_log_obj(v26, v27);
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
LABEL_23:

              if (self)
                Property = objc_getProperty(self, v33, 376, 1);
              else
                Property = 0;
              objc_msgSend(Property, "handleStartMessage:", v4);

              goto LABEL_29;
            }
            *(_DWORD *)buf = 136315138;
            v63 = (NESMFilterSession *)"com.apple.private.networkextension.test-control";
            v56 = "Test provider does not have the %s entitlement";
            v57 = v32;
            v58 = 12;
LABEL_39:
            _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
            goto LABEL_23;
          }
          v29 = (void *)xpc_connection_copy_entitlement_value(v26, "com.apple.private.networkextension.test-control");
          v30 = v29;
          if (!v29 || xpc_get_type(v29) != (xpc_type_t)&_xpc_type_BOOL)
          {

            goto LABEL_22;
          }
          v36 = xpc_BOOL_get_value(v30);

          if (!v36)
            goto LABEL_22;
          v37 = objc_msgSend(objc_alloc((Class)NEProcessIdentity), "initFromXPCConnection:", v28);
          v39 = v37;
          if (self)
          {
            objc_setProperty_atomic(self, v38, v37, 368);

            v41 = objc_getProperty(self, v40, 368, 1);
            if (v41)
            {
              v43 = xpc_dictionary_get_value(v24, "listener-endpoint");
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              v45 = v44;
              if (v44 && xpc_get_type(v44) == (xpc_type_t)&_xpc_type_endpoint)
              {
                v46 = [NETestAgent alloc];
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "pluginType"));
                v49 = sub_100063C34((id *)&v46->super.super.isa, v48, 4, v4);

                if (v49)
                {
                  v52 = [NEFilterPlugin alloc];
                  v53 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
                  v54 = -[NEPlugin initWithAgent:delegateQueue:andDelegate:](v52, "initWithAgent:delegateQueue:andDelegate:", v49, v53, self);
                  objc_setProperty_atomic(self, v55, v54, 400);

                }
                else
                {
                  v59 = ne_log_obj(v50, v51);
                  v53 = objc_claimAutoreleasedReturnValue(v59);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to create a test agent", buf, 2u);
                  }
                }

              }
              goto LABEL_27;
            }
          }
          else
          {

          }
          v60 = ne_log_obj(v41, v42);
          v32 = objc_claimAutoreleasedReturnValue(v60);
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          *(_WORD *)buf = 0;
          v56 = "Failed to create a process identity from the session connection";
          v57 = v32;
          v58 = 2;
          goto LABEL_39;
        }
        if (!self)
        {
          v35 = 0;
          goto LABEL_28;
        }
LABEL_27:
        v35 = objc_getProperty(self, v23, 376, 1);
LABEL_28:
        objc_msgSend(v35, "handleStartMessage:", v4);
LABEL_29:

        goto LABEL_30;
      }
    }
    objc_setProperty_atomic(self, v20, 0, 368);
    goto LABEL_15;
  }
  v7 = (void *)v6;
  v8 = -[NESMFilterSession waitForPerApp](self, "waitForPerApp");

  if (!v8)
    goto LABEL_9;
  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Ignore Start for perApp Content Filter - no appRule or app not installed", buf, 0xCu);
  }

  if (self)
    v14 = objc_getProperty(self, v13, 376, 1);
  else
    v14 = 0;
  objc_msgSend(v14, "handleStop");
LABEL_30:

}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3;
  const char *v5;
  id Property;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  if (self && a3 != 37)
  {
    self->_externallyStopped = 1;
    objc_setProperty_atomic(self, a2, 0, 416);
  }
  sub_100070F54(self, (const char *)((_DWORD)v3 != 37));
  v7.receiver = self;
  v7.super_class = (Class)NESMFilterSession;
  -[NESMSession handleStopMessageWithReason:](&v7, "handleStopMessageWithReason:", v3);
  if (self)
    Property = objc_getProperty(self, v5, 376, 1);
  else
    Property = 0;
  objc_msgSend(Property, "handleStop");
}

- (BOOL)handleSleep
{
  if (self)
    self = (NESMFilterSession *)objc_getProperty(self, a2, 376, 1);
  return -[NESMFilterSession handleSleep](self, "handleSleep");
}

- (void)handleWakeup
{
  if (self)
    self = (NESMFilterSession *)objc_getProperty(self, a2, 376, 1);
  -[NESMFilterSession handleWakeup](self, "handleWakeup");
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[9];

  if ((a3 & 0xFFFFFFFB) == 1)
  {
    block[7] = v3;
    block[8] = v4;
    v6 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070F1C;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)handleInstalledAppsChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070E58;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)pluginDidDispose:(id)a3
{
  const char *v4;
  id Property;
  id v6;

  v6 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 376, 1);
  else
    Property = 0;
  objc_msgSend(Property, "handlePluginDisposeComplete:", v6);

}

- (id)pluginDidRequestContentFilterSocket:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t KernelControlSocket;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  id v33;
  char *v35;
  unsigned int v36;
  unsigned int v37;
  uint8_t buf[4];
  char *v39;

  v4 = a3;
  if (!self || !self->_controlUnit)
    goto LABEL_17;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "externalIdentifier"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "perApp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appRules"));
    v12 = objc_msgSend(v11, "count");

    if (!v12)
      goto LABEL_17;
  }
  else
  {

  }
  v37 = self->_controlUnit & 0x1FFFFFFF;
  KernelControlSocket = NEHelperGetKernelControlSocket("com.apple.content-filter");
  if ((_DWORD)KernelControlSocket == -1)
  {
    v23 = ne_log_obj(KernelControlSocket, v14);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to create the content filter control socket", buf, 2u);
    }

    goto LABEL_17;
  }
  v15 = KernelControlSocket;
  v16 = NEHelperInterfaceSetOption(KernelControlSocket, 1, &v37, 4);
  if ((_DWORD)v16)
  {
    v18 = v16;
    v19 = ne_log_obj(v16, v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = strerror(v18);
      *(_DWORD *)buf = 136315138;
      v39 = v21;
      v22 = "Error setting CFIL_OPT_NECP_CONTROL_UNIT on socket: %s\n";
LABEL_22:
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentFilter"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "provider"));
  v28 = objc_msgSend(v27, "preserveExistingConnections");

  v36 = v28;
  v29 = NEHelperInterfaceSetOption(v15, 3, &v36, 4);
  if ((_DWORD)v29)
  {
    v31 = v29;
    v32 = ne_log_obj(v29, v30);
    v20 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v35 = strerror(v31);
      *(_DWORD *)buf = 136315138;
      v39 = v35;
      v22 = "Error setting CFIL_OPT_PRESERVE_CONNECTIONS on socket: %s\n";
      goto LABEL_22;
    }
LABEL_16:

    close(v15);
    goto LABEL_17;
  }
  if ((v15 & 0x80000000) == 0)
  {
    v33 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v15, 1);
    goto LABEL_18;
  }
LABEL_17:
  v33 = 0;
LABEL_18:

  return v33;
}

- (void)pluginDidRequestAgentClientServer:(id)a3
{
  if (self)
    self->_acceptAgentClients = 1;
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  id Property;
  id v23;
  uint64_t v24;
  int v25;
  NESMFilterSession *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;

  v8 = a3;
  v9 = a5;
  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!a4 || v9)
  {
    if (v13)
    {
      v25 = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Failed to start with error: %@", (uint8_t *)&v25, 0x16u);
    }

    if (v9)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NEAgentErrorDomain")) & 1) != 0)
      {
        v20 = objc_msgSend(v9, "code");

        if (v20 == (id)2)
        {
          -[NESMSession setLastStopReason:](self, "setLastStopReason:", 6);
          if (self)
            Property = objc_getProperty(self, v21, 376, 1);
          else
            Property = 0;
          v23 = v8;
          v24 = 0;
LABEL_21:
          objc_msgSend(Property, "handlePlugin:statusDidChangeToIdleWithError:", v23, v24);
          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    if (self)
      Property = objc_getProperty(self, v18, 376, 1);
    else
      Property = 0;
    v23 = v8;
    v24 = 1;
    goto LABEL_21;
  }
  if (v13)
  {
    v25 = 138412802;
    v26 = self;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Plugin %@ started with pid %d", (uint8_t *)&v25, 0x1Cu);
  }

  v14 = v8;
  v15 = objc_opt_class(NEFilterPlugin);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);
  if (v14 && (isKindOfClass & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remotePluginObject"));
    objc_msgSend(v17, "startFilter");

  }
LABEL_22:

}

- (void)plugin:(id)a3 didSetStatus:(int64_t)a4 andError:(int64_t)a5
{
  id v8;
  const char *v9;
  id Property;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v15 = v8;
  switch(a4)
  {
    case 0:
      if (self)
        Property = objc_getProperty(self, v9, 376, 1);
      else
        Property = 0;
      objc_msgSend(Property, "handlePlugin:statusDidChangeToIdleWithError:", v15, a5);
      goto LABEL_17;
    case 1:
      if (self)
        v14 = objc_getProperty(self, v9, 376, 1);
      else
        v14 = 0;
      objc_msgSend(v14, "handlePluginStatusDidChangeToStarting:", v15);
      goto LABEL_17;
    case 2:
      if (self)
        v11 = objc_getProperty(self, v9, 376, 1);
      else
        v11 = 0;
      objc_msgSend(v11, "handlePluginStatusDidChangeToRunning:", v15);
      goto LABEL_17;
    case 3:
      if (self)
        v12 = objc_getProperty(self, v9, 376, 1);
      else
        v12 = 0;
      objc_msgSend(v12, "handlePlugin:statusDidChangeToStoppingWithError:", v15, a5);
      goto LABEL_17;
    case 4:
      if (self)
        v13 = objc_getProperty(self, v9, 376, 1);
      else
        v13 = 0;
      objc_msgSend(v13, "handlePluginStatusDidChangeToUpdating:", v15);
LABEL_17:
      v8 = v15;
      break;
    default:
      break;
  }

}

- (id)pluginDidRequestPacketFilterChannel:(id)a3
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int *v8;
  void *v9;
  const char *v10;
  void *v11;
  SEL v12;
  id Property;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  NESMFilterSession *v24;
  __int16 v25;
  unsigned int *v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v4 = (unsigned int *)a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Plugin %@ requested a packet filter channel", (uint8_t *)&v23, 0x16u);
  }

  v8 = sub_10001755C(v4);
  v9 = (void *)nw_interpose_client_register(v8, 0);
  v11 = v9;
  if (self)
  {
    objc_setProperty_atomic(self, v10, v9, 448);

    Property = objc_getProperty(self, v12, 448, 1);
    if (Property)
    {
      v29 = 0;
      v30 = 0;
LABEL_10:
      v17 = objc_getProperty(self, v14, 448, 1);
      goto LABEL_11;
    }
  }
  else
  {

  }
  v15 = ne_log_obj(Property, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v23 = 138412546;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Plugin %@ failed to register for necp interpose client", (uint8_t *)&v23, 0x16u);
  }

  v29 = 0;
  v30 = 0;
  if (self)
    goto LABEL_10;
  v17 = 0;
LABEL_11:
  if (nw_interpose_get_client_uuid(v17, &v29))
  {
    v18 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v29);
    v20 = ne_log_obj(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412802;
      v24 = self;
      v25 = 2112;
      v26 = v4;
      v27 = 2112;
      v28 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@: Plugin %@ registered for necp interpose client %@", (uint8_t *)&v23, 0x20u);
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)pluginDidAcknowledgeSleep:(id)a3
{
  const char *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server", a3));
  sub_1000517BC(v4, v3);

}

- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4
{
  id v6;
  id v7;
  int64_t int64;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int uint64;
  NESMFilterSession *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  int v21;
  NSObject *v22;
  BOOL v23;
  _QWORD v25[5];
  id v26;
  id v27;
  int v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  _BOOL4 v32;

  v6 = a3;
  v7 = a4;
  int64 = xpc_dictionary_get_int64(v7, "command");
  v9 = int64;
  v11 = ne_log_obj(int64, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received a request for a new filter connection", buf, 2u);
  }

  if (v9 != 1)
    goto LABEL_10;
  uint64 = xpc_dictionary_get_uint64(v7, "control-unit");
  v14 = self;
  objc_sync_enter(v14);
  v15 = v14 ? v14->_controlUnit : 0;
  objc_sync_exit(v14);

  v18 = ne_log_obj(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = uint64 & 0x1FFFFFFF;
  v21 = v15 & uint64 & 0x1FFFFFFF;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v30 = v20;
    v31 = 1024;
    v32 = v21 != 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Received unit %u, matches %u", buf, 0xEu);
  }

  if (v21)
  {
    v22 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](v14, "queue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100070A6C;
    v25[3] = &unk_1000BE470;
    v28 = 1;
    v25[4] = v14;
    v26 = v6;
    v27 = v7;
    dispatch_async(v22, v25);

    v23 = 1;
  }
  else
  {
LABEL_10:
    v23 = 0;
  }

  return v23;
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  id Property;
  const char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  int v18;
  NESMFilterSession *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  Property = a3;
  v7 = Property;
  if (Property)
    Property = objc_getProperty(Property, v6, 24, 1);
  v8 = Property;
  v9 = objc_opt_class(NETestAgent);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0)
  {
    v13 = ne_log_obj(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      v18 = 138412802;
      v19 = self;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@: Invalid attempt to pin filter plugin %@ to configuration %@", (uint8_t *)&v18, 0x20u);

    }
  }

  return isKindOfClass & 1;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentFilter"));
  if (!objc_msgSend(v7, "isEnabled"))
  {

LABEL_9:
    return 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentFilter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "perApp"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentFilter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "perApp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    objc_msgSend(v13, "updateAppRulesForUID:", objc_msgSend(v14, "unsignedIntValue"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentFilter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "perApp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appRules"));
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentFilter"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "perApp"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "appRules"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
      sub_10003A874((uint64_t)v20, v24, (uint64_t)objc_msgSend(v25, "intValue"));

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentFilter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "perApp"));
    v29 = objc_msgSend(v28, "copyCachedMachOUUIDs");

    if (v29)
      return 0;
  }
  return 1;
}

- (void)install
{
  if (self && self->_controlUnit)
    sub_10006F774(self);
  self->_isInstalled = 1;
}

- (void)uninstall
{
  void *v3;
  NEFilterSettings *settings;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002C404((uint64_t)v3);

  self->_isInstalled = 0;
  settings = self->_settings;
  self->_settings = 0;

}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  unsigned int v32;
  int v33;
  void *v34;
  void *v35;
  unsigned int v36;
  const char *v37;
  id Property;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  objc_super v48;

  v4 = a3;
  if (!v4)
  {
    -[NESMSession setConfiguration:](self, "setConfiguration:", 0);
    -[NESMSession setConfigurationSignature:](self, "setConfigurationSignature:", 0);
    if (!self)
      goto LABEL_24;
    sub_10006FF24(self, 0);
LABEL_23:
    LOBYTE(self) = 0;
    goto LABEL_24;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentFilter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
  v8 = objc_msgSend(v7, "filterBrowsers");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentFilter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "provider"));
  if (v8 == objc_msgSend(v10, "filterBrowsers"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "contentFilter"));
    v11 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "provider"));
    v13 = objc_msgSend(v12, "filterSockets");
    v46 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentFilter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "provider"));
    v47 = v13 ^ objc_msgSend(v15, "filterSockets");

    v5 = v46;
    v4 = v11;

  }
  else
  {
    v47 = 1;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentFilter"));
  if (objc_msgSend(v16, "isEnabled"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentFilter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perApp"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appRules"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentFilter"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "perApp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appRules"));

    v24 = v20 == v23;
    v25 = v47;
    if (!v24)
      v25 = 1;
  }
  else
  {
    v25 = v47;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentFilter"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "provider"));
  v29 = objc_msgSend(v28, "preserveExistingConnections");
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentFilter"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "provider"));
  v32 = objc_msgSend(v31, "preserveExistingConnections");

  v48.receiver = self;
  v48.super_class = (Class)NESMFilterSession;
  if (!-[NESMSession handleUpdateConfiguration:](&v48, "handleUpdateConfiguration:", v4))
    goto LABEL_23;
  if (self)
    sub_10006FF24(self, 0);
  v33 = v29 ^ v32 | v25;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "contentFilter"));
  v36 = objc_msgSend(v35, "isEnabled");

  if (v36)
  {
    if (self)
      Property = objc_getProperty(self, v37, 376, 1);
    else
      Property = 0;
    objc_msgSend(Property, "handleUpdateConfiguration");
  }
  if (v33)
  {
    sub_1000703E8(self);
    if (self)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "contentFilter"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "provider"));
      v42 = sub_1000709BC((uint64_t)NESMFilterSession, v41);

      self->_controlUnit = self->_controlUnit & 0x1FFFFFFF | v42;
    }
    -[NESMSession stopIfNecessaryWithReason:](self, "stopIfNecessaryWithReason:", 37);
  }
  LOBYTE(self) = 1;
LABEL_24:

  return (char)self;
}

- (id)pluginType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentFilter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pluginType"));

  return v5;
}

- (void)invalidate
{
  NESMFilterSessionState *stateHandler;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NESMFilterSession;
  -[NESMSession invalidate](&v4, "invalidate");
  -[NESMFilterSessionState leave](self->_stateHandler, "leave");
  stateHandler = self->_stateHandler;
  self->_stateHandler = 0;

}

- (void)handleUserLogin
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FEF4;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)plugin:(id)a3 didApplySettings:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_storeStrong((id *)&self->_settings, a4);
  if (self->_isInstalled && self->_controlUnit && (sub_10006F774(self) & 1) == 0)
    v7 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", NEFilterErrorDomain, 1, 0);
  else
    v7 = 0;

  return v7;
}

- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentFilter"));
  v9 = objc_msgSend(v8, "enableManualMode");

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)NESMFilterSession;
    -[NESMSession startWithCommand:isOnDemand:](&v10, "startWithCommand:isOnDemand:", v6, v4);
  }

}

- (BOOL)disableDefaultDropAfterBoot
{
  void *v3;
  void *v4;
  BOOL result;

  if (!-[NESMSession defaultDropType](self, "defaultDropType"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalIdentifier"));

  result = 0;
  if (self)
  {
    if (v4)
      return self->_perAppDropPoliciesInstalled;
  }
  return result;
}

- (BOOL)supportsDefaultDrop
{
  return -[NESMSession defaultDropType](self, "defaultDropType") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpose, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_lastStartMessage, 0);
  objc_storeStrong((id *)&self->_packetPlugin, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_cachedStateHandlers, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_processToFilter, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
