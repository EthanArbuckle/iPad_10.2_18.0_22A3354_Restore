@implementation RPNWNearbyInvitationConnection

+ (void)initialize
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_opt_self(RPNWNearbyInvitationConnection, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 10);
    v6 = (void *)qword_1001321C0;
    qword_1001321C0 = (uint64_t)v5;

  }
}

- (id)description
{
  id v3;
  NSUUID *connectionUUID;
  NSUUID *endpointUUID;
  const char *v6;
  const char *v7;
  RPNWNearbyInvitationPeer *peer;
  NSString *applicationService;
  OS_nw_framer *v10;
  id v11;

  v3 = objc_alloc_init((Class)NSMutableString);
  endpointUUID = self->_endpointUUID;
  connectionUUID = self->_connectionUUID;
  if (self->_inbound)
    v6 = "IN";
  else
    v6 = "OUT";
  if (self->_isConnected)
    v7 = "yes";
  else
    v7 = "no";
  peer = self->_peer;
  applicationService = self->_applicationService;
  v10 = self->_framer;
  v11 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v11, "appendFormat:", CFSTR("%p"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("CONN[%@] (%s): appSvc=%@ connected=%s EP={%@:%@} framer=%@"), connectionUUID, v6, applicationService, v7, peer, endpointUUID, v11);
  return v3;
}

- (RPNWNearbyInvitationConnection)init
{
  RPNWNearbyInvitationConnection *v2;
  RPNWNearbyInvitationConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPNWNearbyInvitationConnection;
  v2 = -[RPNWNearbyInvitationConnection init](&v5, "init");
  if (v2)
  {
    +[RPNWNearbyInvitationConnection addConnection:](RPNWNearbyInvitationConnection, "addConnection:", v2);
    v3 = v2;
  }

  return v2;
}

- (RPNWNearbyInvitationConnection)initWithPeer:(id)a3 session:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RPNWNearbyInvitationConnection *v20;
  RPNWNearbyInvitationConnection *v21;
  RPNWNearbyInvitationPeer *v22;
  void *v23;
  void *v24;
  RPNWNearbyInvitationConnection *v25;
  objc_super v27;

  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)RPNWNearbyInvitationConnection;
  v20 = -[RPNWNearbyInvitationConnection init](&v27, "init");
  v21 = v20;
  if (v20)
  {
    -[RPNWNearbyInvitationConnection setInbound:](v20, "setInbound:", v12);
    -[RPNWNearbyInvitationConnection setInternal:](v21, "setInternal:", v11);
    -[RPNWNearbyInvitationConnection setApplicationService:](v21, "setApplicationService:", v17);
    -[RPNWNearbyInvitationConnection setConnectionUUID:](v21, "setConnectionUUID:", v18);
    -[RPNWNearbyInvitationConnection setEndpointUUID:](v21, "setEndpointUUID:", v19);
    v22 = objc_alloc_init(RPNWNearbyInvitationPeer);
    -[RPNWNearbyInvitationConnection setPeer:](v21, "setPeer:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v21, "peer"));
    objc_msgSend(v23, "setDestinationDevice:", v15);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v21, "peer"));
    objc_msgSend(v24, "setNearbyInvitationSession:", v16);

    +[RPNWNearbyInvitationConnection addConnection:](RPNWNearbyInvitationConnection, "addConnection:", v21);
    v25 = v21;
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  +[RPNWNearbyInvitationConnection removeConnection:](RPNWNearbyInvitationConnection, "removeConnection:", self);
  v3.receiver = self;
  v3.super_class = (Class)RPNWNearbyInvitationConnection;
  -[RPNWNearbyInvitationConnection dealloc](&v3, "dealloc");
}

- (void)sendStatusUpdate:(int)a3
{
  -[RPNWNearbyInvitationPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:](self->_peer, "sendStatusUpdateForConnection:connectionID:status:responseHandler:", self->_applicationService, self->_connectionUUID, *(_QWORD *)&a3, 0);
}

+ (void)addConnection:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = v3;
  if (dword_1001311D0 <= 30)
  {
    if (dword_1001311D0 != -1 || (v5 = _LogCategory_Initialize(&dword_1001311D0, 30), v3 = v8, v5))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
      LogPrintF(&dword_1001311D0, "+[RPNWNearbyInvitationConnection addConnection:]", 30, "addConnection for key=%@\n", v4);

      v3 = v8;
    }
  }
  v6 = (void *)qword_1001321C0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
  objc_msgSend(v6, "setObject:forKey:", v8, v7);

}

+ (void)removeConnection:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = v3;
  if (dword_1001311D0 <= 30)
  {
    if (dword_1001311D0 != -1 || (v5 = _LogCategory_Initialize(&dword_1001311D0, 30), v3 = v8, v5))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
      LogPrintF(&dword_1001311D0, "+[RPNWNearbyInvitationConnection removeConnection:]", 30, "removeConnection for key=%@\n", v4);

      v3 = v8;
    }
  }
  v6 = (void *)qword_1001321C0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

+ (void)listConnections:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  objc_msgSend(v3, "appendString:", CFSTR("Connections\n"));
  if (objc_msgSend((id)qword_1001321C0, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (id)qword_1001321C0;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001321C0, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)));
          v10 = v9;
          if (v9)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
            objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v11);

          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("  <empty>\n"));
  }

}

- (BOOL)inbound
{
  return self->_inbound;
}

- (void)setInbound:(BOOL)a3
{
  self->_inbound = a3;
}

- (BOOL)internal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
  objc_storeStrong((id *)&self->_applicationService, a3);
}

- (OS_nw_framer)framer
{
  return self->_framer;
}

- (void)setFramer:(id)a3
{
  objc_storeStrong((id *)&self->_framer, a3);
}

- (RPNWNearbyInvitationPeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_framer, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
}

@end
