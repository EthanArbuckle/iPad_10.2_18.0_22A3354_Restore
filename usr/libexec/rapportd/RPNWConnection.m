@implementation RPNWConnection

+ (void)initialize
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_opt_self(RPNWConnection, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 10);
    v6 = (void *)qword_100132038;
    qword_100132038 = (uint64_t)v5;

  }
}

- (id)description
{
  id v3;
  NSUUID *connectionUUID;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *applicationService;
  const char *v9;
  void *v10;
  void *v11;
  NSUUID *endpointUUID;
  OS_nw_framer *v13;
  id v14;

  v3 = objc_alloc_init((Class)NSMutableString);
  connectionUUID = self->_connectionUUID;
  if (self->_inbound)
    v5 = "IN";
  else
    v5 = "OUT";
  -[NSNumber doubleValue](self->_version, "doubleValue");
  v7 = v6;
  applicationService = self->_applicationService;
  if (self->_isConnected)
    v9 = "yes";
  else
    v9 = "no";
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWPeer destinationDevice](self->_peer, "destinationDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  endpointUUID = self->_endpointUUID;
  v13 = self->_framer;
  v14 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v14, "appendFormat:", CFSTR("%p"), v13);

  objc_msgSend(v3, "appendFormat:", CFSTR("CONN[%@] (%s): version=%.2f appSvc=%@ connected=%s EP={%@:%@} framer=%@"), connectionUUID, v5, v7, applicationService, v9, v11, endpointUUID, v14);
  return v3;
}

- (RPNWConnection)init
{
  RPNWConnection *v2;
  RPNWConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPNWConnection;
  v2 = -[RPNWConnection init](&v5, "init");
  if (v2)
  {
    +[RPNWConnection addConnection:](RPNWConnection, "addConnection:", v2);
    v3 = v2;
  }

  return v2;
}

- (RPNWConnection)initWithPeer:(id)a3 version:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RPNWConnection *v20;
  RPNWConnection *v21;
  RPNWPeer *v22;
  void *v23;
  RPNWConnection *v24;
  objc_super v26;

  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)RPNWConnection;
  v20 = -[RPNWConnection init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    -[RPNWConnection setVersion:](v20, "setVersion:", v16);
    -[RPNWConnection setInbound:](v21, "setInbound:", v12);
    -[RPNWConnection setInternal:](v21, "setInternal:", v11);
    -[RPNWConnection setApplicationService:](v21, "setApplicationService:", v17);
    -[RPNWConnection setConnectionUUID:](v21, "setConnectionUUID:", v18);
    -[RPNWConnection setEndpointUUID:](v21, "setEndpointUUID:", v19);
    v22 = objc_alloc_init(RPNWPeer);
    -[RPNWConnection setPeer:](v21, "setPeer:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v21, "peer"));
    objc_msgSend(v23, "setDestinationDevice:", v15);

    +[RPNWConnection addConnection:](RPNWConnection, "addConnection:", v21);
    v24 = v21;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[RPNWConnection removeConnection:](RPNWConnection, "removeConnection:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection endpointUUID](self, "endpointUUID"));
  +[RPNWEndpoint ageOutEndpointMapping:](RPNWEndpoint, "ageOutEndpointMapping:", v3);

  v4.receiver = self;
  v4.super_class = (Class)RPNWConnection;
  -[RPNWConnection dealloc](&v4, "dealloc");
}

- (void)sendStatusUpdate:(int)a3
{
  -[RPNWPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:](self->_peer, "sendStatusUpdateForConnection:connectionID:status:responseHandler:", self->_applicationService, self->_connectionUUID, *(_QWORD *)&a3, 0);
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
  if (dword_100130A80 <= 30)
  {
    if (dword_100130A80 != -1 || (v5 = _LogCategory_Initialize(&dword_100130A80, 30), v3 = v8, v5))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
      LogPrintF(&dword_100130A80, "+[RPNWConnection addConnection:]", 30, "addConnection for key=%@\n", v4);

      v3 = v8;
    }
  }
  v6 = (void *)qword_100132038;
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
  if (dword_100130A80 <= 30)
  {
    if (dword_100130A80 != -1 || (v5 = _LogCategory_Initialize(&dword_100130A80, 30), v3 = v8, v5))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
      LogPrintF(&dword_100130A80, "+[RPNWConnection removeConnection:]", 30, "removeConnection for key=%@\n", v4);

      v3 = v8;
    }
  }
  v6 = (void *)qword_100132038;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionUUID"));
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

+ (void)stopAllOutgoingConnectionsNotForPeer:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  if (dword_100130A80 <= 40 && (dword_100130A80 != -1 || _LogCategory_Initialize(&dword_100130A80, 40)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    LogPrintF(&dword_100130A80, "+[RPNWConnection stopAllOutgoingConnectionsNotForPeer:]", 40, "Stop connections not for peer %@\n", v4);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)qword_100132038;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132038, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i)));
        v11 = v10;
        if (v10)
        {
          if (objc_msgSend(v10, "isConnected"))
          {
            if ((objc_msgSend(v11, "inbound") & 1) == 0
              && (objc_msgSend(v11, "internal") & 1) == 0)
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peer"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "destinationDevice"));
              v14 = objc_msgSend(v13, "isEqualToDevice:", v3);

              if ((v14 & 1) == 0)
              {
                if (dword_100130A80 <= 30
                  && (dword_100130A80 != -1 || _LogCategory_Initialize(&dword_100130A80, 30)))
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectionUUID"));
                  LogPrintF(&dword_100130A80, "+[RPNWConnection stopAllOutgoingConnectionsNotForPeer:]", 30, "Signaling error on framer for connection=%@\n", v15);

                }
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "framer"));
                +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v16, 50);

              }
            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

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
  if (objc_msgSend((id)qword_100132038, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (id)qword_100132038;
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
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132038, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)));
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

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
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

- (RPNWPeer)peer
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

- (NSMutableData)outgoingBuffer
{
  return self->_outgoingBuffer;
}

- (void)setOutgoingBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingBuffer, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_framer, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
