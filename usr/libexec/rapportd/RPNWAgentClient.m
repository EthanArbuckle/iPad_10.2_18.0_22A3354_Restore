@implementation RPNWAgentClient

+ (unsigned)findAgentClientPort:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint16_t port;

  v3 = nw_agent_client_copy_path(a3, a2);
  v4 = nw_path_copy_effective_local_endpoint(v3);
  v5 = v4;
  if (v4)
    port = nw_endpoint_get_port(v4);
  else
    port = 0;

  return port;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setLocalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_localEndpoint, a3);
}

- (void)setFlowAssignHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setApplicationService:(id)a3
{
  objc_storeStrong((id *)&self->_applicationService, a3);
}

- (void)setAgentClientID:(id)a3
{
  objc_storeStrong((id *)&self->_agentClientID, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (RPNWAgentClient)init
{
  RPNWAgentClient *v2;
  RPNWAgentClient *v3;
  RPNWAgentClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNWAgentClient;
  v2 = -[RPNWAgentClient init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (const)getTypeDescription
{
  unint64_t type;

  type = self->_type;
  if (type > 4)
    return "LSTNR";
  else
    return off_100113D20[type];
}

- (id)description
{
  id v3;
  NSString *persona;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("RPNWAgentClient[%p]"), self);
  if (self->_type)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%s): < "), -[RPNWAgentClient getTypeDescription](self, "getTypeDescription"));
    if (self->_applicationService)
      objc_msgSend(v3, "appendFormat:", CFSTR("appSvc=%@ "), self->_applicationService);
    persona = self->_persona;
    if (persona)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](persona, "substringToIndex:", 8));
      objc_msgSend(v3, "appendFormat:", CFSTR("persona:%@ "), v5);

    }
    if (self->_pid)
      objc_msgSend(v3, "appendFormat:", CFSTR("PID=%d "), self->_pid);
    if (self->_browseClient)
      objc_msgSend(v3, "appendFormat:", CFSTR("browse_client=%p "), self->_browseClient);
    if (self->_browseResponse)
      objc_msgSend(v3, "appendFormat:", CFSTR("browse_response=%p "), self->_browseResponse);
    if (self->_flowClient)
      objc_msgSend(v3, "appendFormat:", CFSTR("flow_client=%p "), self->_flowClient);
    if (self->_isUsingQUIC)
      objc_msgSend(v3, "appendFormat:", CFSTR("using_QUIC=YES "));
    if (self->_port)
      objc_msgSend(v3, "appendFormat:", CFSTR("port=%d "), self->_port);
    if (self->_isTCP)
      objc_msgSend(v3, "appendFormat:", CFSTR("(TCP) "));
    if (self->_advertiseDescriptor)
      objc_msgSend(v3, "appendFormat:", CFSTR("adesc=%@ "), self->_advertiseDescriptor);
    if (self->_advertiseInvitationRoute)
      objc_msgSend(v3, "appendFormat:", CFSTR("advertise_invitation_route=%d"), self->_advertiseInvitationRoute);
    if (self->_advertiseInvitationScope)
      objc_msgSend(v3, "appendFormat:", CFSTR("advertise_invitation_scope=%d"), self->_advertiseInvitationScope);
    if (self->_browseDescriptor)
      objc_msgSend(v3, "appendFormat:", CFSTR("bdesc=%@ "), self->_browseDescriptor);
    if (self->_browseInvitationScope)
      objc_msgSend(v3, "appendFormat:", CFSTR("browse_invitation_scope=%d"), self->_browseInvitationScope);
    if (self->_listen_framer)
      objc_msgSend(v3, "appendFormat:", CFSTR("lframer=%@ "), self->_listen_framer);
    objc_msgSend(v3, "appendString:", CFSTR(">"));
  }
  return v3;
}

+ (id)findAgentClient:(id)a3 tryPort:(BOOL)a4 isTCP:(BOOL)a5 isFlowHandler:(BOOL)a6
{
  _BOOL4 v6;
  int v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v6 = a6;
  v7 = a5;
  v9 = a3;
  if (a4)
  {
    v10 = +[RPNWAgentClient findAgentClientPort:](RPNWAgentClient, "findAgentClientPort:", v9);
    if (!(_DWORD)v10)
      goto LABEL_39;
    v11 = v10;
    if (dword_100131630 <= 30
      && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    {
      v12 = CFSTR("NO");
      if (v7)
        v12 = CFSTR("YES");
      LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]", 30, "Looking up agent client from port=%d/isTCP=%@", v11, v12);
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = (id)qword_100132258;
    v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v15);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v27, "port") == (_DWORD)v11 && objc_msgSend(v27, "isTCP") == v7)
          {
            if (dword_100131630 <= 30
              && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
            {
              LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]", 30, "Found matching client %@", v27);
            }
            v29 = v27;
            goto LABEL_51;
          }
        }
        v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v24)
          continue;
        break;
      }
    }
  }
  else
  {
    if (dword_100131630 <= 30
      && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    {
      v13 = v9;
      v14 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v14, "appendFormat:", CFSTR("%p"), v13);

      LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]", 30, "Looking up agent client from client=%@", v14);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = (id)qword_100132258;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      while (2)
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
          if (v6)
          {
            v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "flowClient"));
            if (v21 == v9)
            {

LABEL_25:
              if (dword_100131630 <= 30
                && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
              {
                LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]", 30, "Found matching client %@", v20);
              }
              v29 = v20;
LABEL_51:
              v28 = v29;

              goto LABEL_52;
            }

          }
          else
          {
            v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "browseClient"));

            if (v22 == v9)
              goto LABEL_25;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v17)
          continue;
        break;
      }
    }
  }

LABEL_39:
  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]", 30, "Failed to find agent client");
  v28 = 0;
LABEL_52:

  return v28;
}

+ (id)addAgentClient
{
  RPNWAgentClient *v2;
  void *v3;

  v2 = objc_alloc_init(RPNWAgentClient);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[RPNWAgentClient setAgentClientID:](v2, "setAgentClientID:", v3);

  objc_msgSend((id)qword_100132258, "addObject:", v2);
  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    LogPrintF(&dword_100131630, "+[RPNWAgentClient addAgentClient]", 30, "Created agentClient: %@", v2);
  return v2;
}

+ (void)initialize
{
  if (qword_100132260 != -1)
    dispatch_once(&qword_100132260, &stru_100113CC0);
}

- (void)dealloc
{
  objc_super v3;

  -[RPNWAgentClient stopAgentClient](self, "stopAgentClient");
  v3.receiver = self;
  v3.super_class = (Class)RPNWAgentClient;
  -[RPNWAgentClient dealloc](&v3, "dealloc");
}

- (void)stopAgentClient
{
  RPNWAgentClient *v3;
  id v4;
  RPNWDiscoverySession *discoverySession;
  RPNWDiscoverySession *v6;
  id v7;
  int v8;
  RPNWDiscoverySession *v9;
  RPNWNearbyInvitationDiscoverySession *nearbyInvitationDiscoverySession;
  RPNWNearbyInvitationDiscoverySession *v11;
  id v12;
  int v13;
  RPNWNearbyInvitationDiscoverySession *v14;
  RPNWConnection *connection;
  RPNWConnection *v16;
  id v17;
  unsigned int v18;
  const char *v19;
  int v20;
  unsigned int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  RPNWConnection *v26;
  RPNWNearbyInvitationConnection *nearbyInvitationConnection;
  RPNWNearbyInvitationConnection *v28;
  id v29;
  unsigned int v30;
  const char *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  RPNWNearbyInvitationConnection *v39;
  RPServer *applicationServiceServer;
  RPServer *v41;
  RPNWNearbyInvitationPeer *nearbyInvitationServer;
  RPNWNearbyInvitationPeer *v43;
  _QWORD v44[4];
  id v45;

  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
  {
    v3 = self;
    v4 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v4, "appendFormat:", CFSTR("%p"), v3);

    LogPrintF(&dword_100131630, "-[RPNWAgentClient stopAgentClient]", 30, "Stopping RPNWAgentClient[%@]", v4);
  }
  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    if (dword_100131630 <= 30)
    {
      if (dword_100131630 != -1
        || (v8 = _LogCategory_Initialize(&dword_100131630, 30), discoverySession = self->_discoverySession, v8))
      {
        v6 = discoverySession;
        v7 = objc_alloc_init((Class)NSMutableString);
        objc_msgSend(v7, "appendFormat:", CFSTR("%p"), v6);

        LogPrintF(&dword_100131630, "-[RPNWAgentClient stopAgentClient]", 30, "Stopping RPNWDiscoverySession[%@]", v7);
        discoverySession = self->_discoverySession;
      }
    }
    -[RPNWDiscoverySession stopDiscovery](discoverySession, "stopDiscovery");
    v9 = self->_discoverySession;
    self->_discoverySession = 0;

  }
  nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
  if (nearbyInvitationDiscoverySession)
  {
    if (dword_100131630 <= 30)
    {
      if (dword_100131630 != -1
        || (v13 = _LogCategory_Initialize(&dword_100131630, 30),
            nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession,
            v13))
      {
        v11 = nearbyInvitationDiscoverySession;
        v12 = objc_alloc_init((Class)NSMutableString);
        objc_msgSend(v12, "appendFormat:", CFSTR("%p"), v11);

        LogPrintF(&dword_100131630, "-[RPNWAgentClient stopAgentClient]", 30, "Stopping RPNWNearbyInvitationDiscoverySession[%@]", v12);
        nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
      }
    }
    -[RPNWNearbyInvitationDiscoverySession stopDiscovery](nearbyInvitationDiscoverySession, "stopDiscovery");
    v14 = self->_nearbyInvitationDiscoverySession;
    self->_nearbyInvitationDiscoverySession = 0;

  }
  connection = self->_connection;
  if (connection)
  {
    if (dword_100131630 <= 30)
    {
      if (dword_100131630 != -1
        || (v20 = _LogCategory_Initialize(&dword_100131630, 30), connection = self->_connection, v20))
      {
        v16 = connection;
        v17 = objc_alloc_init((Class)NSMutableString);
        objc_msgSend(v17, "appendFormat:", CFSTR("%p"), v16);

        v18 = -[RPNWConnection isConnected](self->_connection, "isConnected");
        v19 = "no";
        if (v18)
          v19 = "yes";
        LogPrintF(&dword_100131630, "-[RPNWAgentClient stopAgentClient]", 30, "Stopping RPNWConnection[%@], isConnected=%s", v17, v19);

        connection = self->_connection;
      }
    }
    v21 = -[RPNWConnection isConnected](connection, "isConnected");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](self->_connection, "peer"));
    v23 = v22;
    if (v21)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection applicationService](self->_connection, "applicationService"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection connectionUUID](self->_connection, "connectionUUID"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10007E1A0;
      v44[3] = &unk_1001115C8;
      v45 = v23;
      v23 = v23;
      objc_msgSend(v23, "sendStatusUpdateForConnection:connectionID:status:responseHandler:", v24, v25, 1, v44);

    }
    else
    {
      objc_msgSend(v22, "deregisterRequestID:", CFSTR("com.apple.oneapi.data"));
      objc_msgSend(v23, "invalidate");
    }

    -[RPNWConnection setFramer:](self->_connection, "setFramer:", 0);
    v26 = self->_connection;
    self->_connection = 0;

  }
  nearbyInvitationConnection = self->_nearbyInvitationConnection;
  if (nearbyInvitationConnection)
  {
    if (dword_100131630 <= 30)
    {
      if (dword_100131630 != -1
        || (v32 = _LogCategory_Initialize(&dword_100131630, 30),
            nearbyInvitationConnection = self->_nearbyInvitationConnection,
            v32))
      {
        v28 = nearbyInvitationConnection;
        v29 = objc_alloc_init((Class)NSMutableString);
        objc_msgSend(v29, "appendFormat:", CFSTR("%p"), v28);

        v30 = -[RPNWNearbyInvitationConnection isConnected](self->_nearbyInvitationConnection, "isConnected");
        v31 = "no";
        if (v30)
          v31 = "yes";
        LogPrintF(&dword_100131630, "-[RPNWAgentClient stopAgentClient]", 30, "Stopping RPNWNearbyInvitationConnection[%@], isConnected=%s", v29, v31);

        nearbyInvitationConnection = self->_nearbyInvitationConnection;
      }
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](nearbyInvitationConnection, "peer"));
    v34 = v33;
    if (self->_type == 3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection applicationService](self->_nearbyInvitationConnection, "applicationService"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection connectionUUID](self->_nearbyInvitationConnection, "connectionUUID"));
      objc_msgSend(v34, "sendStatusUpdateForConnection:connectionID:status:responseHandler:", v35, v36, 4, &stru_100113D00);

    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "nearbyInvitationSession"));
      objc_msgSend(v37, "deregisterRequestID:", CFSTR("com.apple.oneapi.nearbyinvitation.data"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "nearbyInvitationSession"));
      objc_msgSend(v35, "invalidate");
    }

    if (self->_type == 1)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "nearbyInvitationSession"));
      objc_msgSend(v38, "deregisterRequestID:", CFSTR("com.apple.oneapi.nearbyinvitation.connection"));

    }
    -[RPNWNearbyInvitationConnection setFramer:](self->_nearbyInvitationConnection, "setFramer:", 0);
    v39 = self->_nearbyInvitationConnection;
    self->_nearbyInvitationConnection = 0;

  }
  applicationServiceServer = self->_applicationServiceServer;
  if (applicationServiceServer)
  {
    -[RPServer invalidate](applicationServiceServer, "invalidate");
    v41 = self->_applicationServiceServer;
    self->_applicationServiceServer = 0;

  }
  nearbyInvitationServer = self->_nearbyInvitationServer;
  if (nearbyInvitationServer)
  {
    -[RPNWNearbyInvitationPeer stopServer](nearbyInvitationServer, "stopServer");
    v43 = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = 0;

  }
}

- (id)longDescription
{
  id v3;
  void *v4;
  RPNWDiscoverySession *discoverySession;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient description](self, "description"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

  if (self->_connection)
    objc_msgSend(v3, "appendFormat:", CFSTR("   + %@\n"), self->_connection);
  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWDiscoverySession description](discoverySession, "description"));
    objc_msgSend(v3, "appendString:", v6);

  }
  return v3;
}

- (void)startDiscovery:(id)a3 deviceTypes:(unsigned int)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 agentUUID:(id)a7 applicationService:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  RPNWAgentClient *v17;
  id v18;
  RPNWDiscoverySession *v19;
  RPNWDiscoverySession *discoverySession;
  id v21;
  id v22;

  v12 = *(_QWORD *)&a4;
  v22 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
  {
    v17 = self;
    v18 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v18, "appendFormat:", CFSTR("%p"), v17);

    LogPrintF(&dword_100131630, "-[RPNWAgentClient startDiscovery:deviceTypes:controlFlags:deviceFilter:agentUUID:applicationService:]", 30, "RPNWAgentClient[%@] starting discovery...", v18);
  }
  v19 = objc_alloc_init(RPNWDiscoverySession);
  discoverySession = self->_discoverySession;
  self->_discoverySession = v19;

  -[RPNWDiscoverySession setBrowseClient:](self->_discoverySession, "setBrowseClient:", self->_browseClient);
  -[RPNWDiscoverySession setBrowseResponse:](self->_discoverySession, "setBrowseResponse:", v22);
  if (self->_isUsingQUIC)
    v21 = 0;
  else
    v21 = v15;
  -[RPNWDiscoverySession setAgentUUID:](self->_discoverySession, "setAgentUUID:", v21);
  -[RPNWDiscoverySession setPid:](self->_discoverySession, "setPid:", self->_pid);
  -[RPNWDiscoverySession setApplicationService:](self->_discoverySession, "setApplicationService:", v16);
  -[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:](self->_discoverySession, "startDiscovery:controlFlags:deviceFilter:", v12, a5, v14);

}

- (void)startNearbyInvitationDiscovery:(id)a3 agentUUID:(id)a4 applicationService:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPNWNearbyInvitationDiscoverySession *v11;
  RPNWNearbyInvitationDiscoverySession *nearbyInvitationDiscoverySession;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(RPNWNearbyInvitationDiscoverySession);
  nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
  self->_nearbyInvitationDiscoverySession = v11;

  -[RPNWNearbyInvitationDiscoverySession setBrowseClient:](self->_nearbyInvitationDiscoverySession, "setBrowseClient:", self->_browseClient);
  -[RPNWNearbyInvitationDiscoverySession setBrowseResponse:](self->_nearbyInvitationDiscoverySession, "setBrowseResponse:", v10);

  if (self->_isUsingQUIC)
    v13 = 0;
  else
    v13 = v9;
  -[RPNWNearbyInvitationDiscoverySession setAgentUUID:](self->_nearbyInvitationDiscoverySession, "setAgentUUID:", v13);

  -[RPNWNearbyInvitationDiscoverySession setApplicationService:](self->_nearbyInvitationDiscoverySession, "setApplicationService:", v8);
  -[RPNWNearbyInvitationDiscoverySession startDiscovery](self->_nearbyInvitationDiscoverySession, "startDiscovery");
}

- (void)updateAgentClientInfo:(id)a3 browseResponse:(id)a4 listener:(id)a5 bundleID:(id)a6 advertiseDescriptor:(id)a7 browseDescriptor:(id)a8 isFlowHandler:(BOOL)a9 isUsingQUIC:(BOOL)a10 isTCP:(BOOL)a11 agentClientPID:(int)a12 persona:(id)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id browseResponse;
  void *v27;
  const char *application_service_name;
  NSString *v29;
  NSString *applicationService;
  int64_t v31;
  OS_nw_advertise_descriptor *v32;
  OS_nw_advertise_descriptor *advertiseDescriptor;
  const char *v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  RPServer *applicationServiceServer;
  id v39;
  RPServer *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[5];

  v44 = a3;
  v20 = a4;
  v43 = a5;
  v45 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a13;
  if (v23)
    objc_storeStrong((id *)&self->_persona, a13);
  v24 = 96;
  if (a9)
    v24 = 112;
  objc_storeStrong((id *)((char *)&self->super.isa + v24), a3);
  if (v20)
  {
    v25 = objc_retainBlock(v20);
    browseResponse = self->_browseResponse;
    self->_browseResponse = v25;

  }
  self->_isUsingQUIC = a10;
  v27 = v44;
  if (!self->_port)
    self->_port = +[RPNWAgentClient findAgentClientPort:](RPNWAgentClient, "findAgentClientPort:", v44);
  if (!self->_pid)
    self->_pid = a12;
  self->_isTCP = a11;
  if (v21)
  {
    objc_storeStrong((id *)&self->_advertiseDescriptor, a7);
    self->_advertiseInvitationRoute = nw_advertise_descriptor_get_invitation_route(v21);
    self->_advertiseInvitationScope = nw_advertise_descriptor_get_invitation_scope(v21);
  }
  if (v22)
  {
    objc_storeStrong((id *)&self->_browseDescriptor, a8);
    self->_browseInvitationScope = nw_browse_descriptor_get_invitation_scope(v22);
    application_service_name = nw_browse_descriptor_get_application_service_name((nw_browse_descriptor_t)self->_browseDescriptor);
    if (application_service_name)
    {
      v29 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", application_service_name));
      applicationService = self->_applicationService;
      self->_applicationService = v29;

    }
  }
  if (self->_advertiseDescriptor)
  {
    if (dword_100131630 <= 30
      && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    {
      LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]", 30, "Upgrading agentClient to listener");
    }
    v34 = nw_advertise_descriptor_get_application_service_name((nw_advertise_descriptor_t)self->_advertiseDescriptor);
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34));
      if (v45)
      {
        v36 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v45, v35));
        v37 = self->_applicationService;
        self->_applicationService = v36;

        if (dword_100131630 <= 30
          && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
        {
          LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]", 30, "Constructing bundleID+appSvc=%@", self->_applicationService);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_applicationService, v35);
        if (dword_100131630 <= 30
          && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
        {
          LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]", 30, "Using appSvc without bundleID=%@", self->_applicationService);
        }
      }
      applicationServiceServer = self->_applicationServiceServer;
      if (!applicationServiceServer)
      {
        v39 = objc_alloc_init((Class)RPServer);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10007E9A4;
        v47[3] = &unk_100111860;
        v47[4] = self;
        objc_msgSend(v39, "setErrorHandler:", v47);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10007EA38;
        v46[3] = &unk_1001110F8;
        v46[4] = self;
        objc_msgSend(v39, "setInterruptionHandler:", v46);
        objc_msgSend(v39, "activate");
        v40 = self->_applicationServiceServer;
        self->_applicationServiceServer = (RPServer *)v39;
        v41 = v39;

        v27 = v44;
        applicationServiceServer = self->_applicationServiceServer;
      }
      -[RPServer setServiceType:](applicationServiceServer, "setServiceType:", self->_applicationService);

    }
    self->_type = 1;
    +[RPNWListener addListenerAgentClient:](RPNWListener, "addListenerAgentClient:", self);
  }
  else
  {
    if (self->_browseDescriptor)
    {
      v31 = 2;
    }
    else
    {
      if (v43)
      {
        self->_type = 3;
        v32 = (OS_nw_advertise_descriptor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "advertiseDescriptor"));
        advertiseDescriptor = self->_advertiseDescriptor;
        self->_advertiseDescriptor = v32;

        goto LABEL_42;
      }
      v31 = 4;
    }
    self->_type = v31;
  }
LABEL_42:
  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient description](self, "description"));
    LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]", 30, "Updated %@", v42);

  }
}

+ (id)findListenerAgentClientFromApplicationServiceName:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    LogPrintF(&dword_100131630, "+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]", 30, "Searching for listener agent client with appSvc='%@'", v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)qword_100132258;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type") == (id)1)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationService"));
          v11 = objc_msgSend(v10, "isEqualToString:", v3);

          if (v11)
          {
            if (dword_100131630 <= 30
              && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
            {
              LogPrintF(&dword_100131630, "+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]", 30, "Listener found agentClient=%@", v9);
            }
            v12 = v9;

            goto LABEL_24;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    LogPrintF(&dword_100131630, "+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]", 30, "Failed to find listener agent client");
  v12 = 0;
LABEL_24:

  return v12;
}

+ (id)findAgentClientFromConnectionID:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClientFromConnectionID:]", 30, "Searching for agent client with connectionID=%@", v3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)qword_100132258;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionUUID"));
        if (objc_msgSend(v10, "isEqual:", v3))
        {

LABEL_18:
          if (dword_100131630 <= 30
            && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
            LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClientFromConnectionID:]", 30, "Found agentClient=%@, connection=%@", v8, v14);

          }
          v15 = v8;

          goto LABEL_25;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nearbyInvitationConnection"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectionUUID"));
        v13 = objc_msgSend(v12, "isEqual:", v3);

        if (v13)
          goto LABEL_18;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
    LogPrintF(&dword_100131630, "+[RPNWAgentClient findAgentClientFromConnectionID:]", 30, "Failed to find agent client");
  v15 = 0;
LABEL_25:

  return v15;
}

+ (void)removeAgentClient:(id)a3 isFlowHandler:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "findAgentClient:tryPort:isTCP:isFlowHandler:", a3, 0, 0, a4));
  v6 = v5;
  if (v5)
  {
    v11 = v5;
    if (v4)
      objc_msgSend(v5, "setFlowClient:", 0);
    else
      objc_msgSend(v5, "setBrowseClient:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flowClient"));
    if (v7)
      goto LABEL_6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "browseClient"));

    v6 = v11;
    if (!v8)
    {
      if (dword_100131630 <= 30)
      {
        if (dword_100131630 != -1 || (v9 = _LogCategory_Initialize(&dword_100131630, 30), v6 = v11, v9))
          LogPrintF(&dword_100131630, "+[RPNWAgentClient removeAgentClient:isFlowHandler:]", 30, "Removing client %@", v6);
      }
      objc_msgSend((id)qword_100132258, "removeObject:", v11);
      objc_msgSend(v11, "stopAgentClient");
      v10 = objc_msgSend(v11, "type");
      v6 = v11;
      if (v10 == (id)1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationService"));
        +[RPNWListener startListenerMappingTimeout:](RPNWListener, "startListenerMappingTimeout:", v7);
LABEL_6:

        v6 = v11;
      }
    }
  }

}

+ (void)removeAgentClient:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    if (dword_100131630 <= 30)
    {
      if (dword_100131630 != -1 || (v5 = _LogCategory_Initialize(&dword_100131630, 30), v4 = v6, v5))
        LogPrintF(&dword_100131630, "+[RPNWAgentClient removeAgentClient:]", 30, "Removing client %@", v4);
    }
    objc_msgSend((id)qword_100132258, "removeObject:", v6);
    v4 = v6;
  }

}

+ (void)listAgentClients:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)qword_100132258;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "longDescription", (_QWORD)v10));
        objc_msgSend(v3, "appendString:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)agentClientID
{
  return self->_agentClientID;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (OS_nw_advertise_descriptor)advertiseDescriptor
{
  return self->_advertiseDescriptor;
}

- (void)setAdvertiseDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_advertiseDescriptor, a3);
}

- (int)advertiseInvitationRoute
{
  return self->_advertiseInvitationRoute;
}

- (void)setAdvertiseInvitationRoute:(int)a3
{
  self->_advertiseInvitationRoute = a3;
}

- (int)advertiseInvitationScope
{
  return self->_advertiseInvitationScope;
}

- (void)setAdvertiseInvitationScope:(int)a3
{
  self->_advertiseInvitationScope = a3;
}

- (RPServer)applicationServiceServer
{
  return self->_applicationServiceServer;
}

- (void)setApplicationServiceServer:(id)a3
{
  objc_storeStrong((id *)&self->_applicationServiceServer, a3);
}

- (OS_nw_framer)listen_framer
{
  return self->_listen_framer;
}

- (void)setListen_framer:(id)a3
{
  objc_storeStrong((id *)&self->_listen_framer, a3);
}

- (OS_nw_browse_descriptor)browseDescriptor
{
  return self->_browseDescriptor;
}

- (void)setBrowseDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_browseDescriptor, a3);
}

- (int)browseInvitationScope
{
  return self->_browseInvitationScope;
}

- (void)setBrowseInvitationScope:(int)a3
{
  self->_browseInvitationScope = a3;
}

- (RPNWDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->_discoverySession, a3);
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
  objc_storeStrong((id *)&self->_browseClient, a3);
}

- (id)browseResponse
{
  return self->_browseResponse;
}

- (void)setBrowseResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (OS_nw_agent_client)flowClient
{
  return self->_flowClient;
}

- (void)setFlowClient:(id)a3
{
  objc_storeStrong((id *)&self->_flowClient, a3);
}

- (BOOL)isUsingQUIC
{
  return self->_isUsingQUIC;
}

- (void)setIsUsingQUIC:(BOOL)a3
{
  self->_isUsingQUIC = a3;
}

- (RPNWNearbyInvitationDiscoverySession)nearbyInvitationDiscoverySession
{
  return self->_nearbyInvitationDiscoverySession;
}

- (void)setNearbyInvitationDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvitationDiscoverySession, a3);
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (BOOL)isTCP
{
  return self->_isTCP;
}

- (void)setIsTCP:(BOOL)a3
{
  self->_isTCP = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (RPNWConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (RPNWNearbyInvitationConnection)nearbyInvitationConnection
{
  return self->_nearbyInvitationConnection;
}

- (void)setNearbyInvitationConnection:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvitationConnection, a3);
}

- (id)flowAssignHandler
{
  return self->_flowAssignHandler;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (RPNWNearbyInvitationPeer)nearbyInvitationServer
{
  return self->_nearbyInvitationServer;
}

- (void)setNearbyInvitationServer:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvitationServer, a3);
}

- (NSString)persona
{
  return self->_persona;
}

- (void)setPersona:(id)a3
{
  objc_storeStrong((id *)&self->_persona, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationServer, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong(&self->_flowAssignHandler, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationDiscoverySession, 0);
  objc_storeStrong((id *)&self->_flowClient, 0);
  objc_storeStrong(&self->_browseResponse, 0);
  objc_storeStrong((id *)&self->_browseClient, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_browseDescriptor, 0);
  objc_storeStrong((id *)&self->_listen_framer, 0);
  objc_storeStrong((id *)&self->_applicationServiceServer, 0);
  objc_storeStrong((id *)&self->_advertiseDescriptor, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_agentClientID, 0);
}

@end
