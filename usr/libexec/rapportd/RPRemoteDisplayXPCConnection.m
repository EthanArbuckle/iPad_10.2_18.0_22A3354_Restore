@implementation RPRemoteDisplayXPCConnection

- (RPRemoteDisplayXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7;
  id v8;
  RPRemoteDisplayXPCConnection *v9;
  RPRemoteDisplayXPCConnection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPRemoteDisplayXPCConnection;
  v9 = -[RPRemoteDisplayXPCConnection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
  }

  return v10;
}

- (void)connectionInvalidated
{
  NSMutableDictionary *tcpServerConnections;
  RPRemoteDisplayDiscovery *v4;
  RPRemoteDisplayDiscovery *activatedDiscovery;
  RPRemoteDisplayServer *activatedServer;
  RPRemoteDisplaySession *v7;
  RPRemoteDisplaySession *activatedSession;
  RPConnection *activeNetCnx;
  RPConnection *clientNetCnx;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  NSMutableSet *serverNetCnxs;
  NSXPCConnection *xpcCnx;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131A18 <= 20 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection connectionInvalidated]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  tcpServerConnections = self->_daemon->_tcpServerConnections;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A9D44;
  v22[3] = &unk_1001149B8;
  v22[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v22);
  v4 = self->_activatedDiscovery;
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  if (v4)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedDiscoverySet, "removeObject:", v4);
    -[RPRemoteDisplayDiscovery invalidate](v4, "invalidate");
  }
  -[RPRemoteDisplayServer invalidate](self->_activatedServer, "invalidate");
  activatedServer = self->_activatedServer;
  self->_activatedServer = 0;

  v7 = self->_activatedSession;
  activatedSession = self->_activatedSession;
  self->_activatedSession = 0;

  if (v7)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:", v7);
    -[RPRemoteDisplaySession invalidate](v7, "invalidate");
  }
  activeNetCnx = self->_activeNetCnx;
  self->_activeNetCnx = 0;

  -[RPConnection invalidate](self->_clientNetCnx, "invalidate");
  clientNetCnx = self->_clientNetCnx;
  self->_clientNetCnx = 0;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_serverNetCnxs;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "invalidate");
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v13);
  }

  -[NSMutableSet removeAllObjects](self->_serverNetCnxs, "removeAllObjects");
  serverNetCnxs = self->_serverNetCnxs;
  self->_serverNetCnxs = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.RemoteDisplay")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if (v7)
  {
    result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _entitledAndReturnError:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.RemoteDisplay"));
    }
    if (a3)
    {
      v14 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)CFSTR("com.apple.RemoteDisplay"));
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      result = 0;
      *a3 = v15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)netConnectionStartWithDevice:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  RPConnection *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  RPRemoteDisplayDaemon *daemon;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  RPConnection *v31;
  id v32;
  id v33;
  RPConnection *v34;
  BOOL v35;
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  RPRemoteDisplayXPCConnection *v41;
  RPConnection *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  RPConnection *v49;
  _QWORD v50[5];
  _QWORD v51[5];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bonjourDevice"));
  if (!v10)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bonjourDevice"));
    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ipAddress"));

      if (!v11)
      {
        if (a5)
        {
          v37 = RPErrorF(4294960569, (uint64_t)"Bonjour device or address not found", v12, v13, v14, v15, v16, v17, v38);
          v35 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue(v37);
        }
        else
        {
          v35 = 0;
        }
        goto LABEL_19;
      }
      v10 = 0;
    }
  }
  ++self->_daemon->_sessionIDLast;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v19 = self->_clientNetCnx;
  if (!v19)
  {
    v19 = (RPConnection *)objc_alloc_init((Class)RPConnection);
    objc_storeStrong((id *)&self->_clientNetCnx, v19);
    objc_storeStrong((id *)&self->_activeNetCnx, v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ipAddress"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ipAddress"));
    -[RPConnection setDestinationString:](v19, "setDestinationString:", v21);

  }
  else
  {
    -[RPConnection setBonjourPeerDevice:](v19, "setBonjourPeerDevice:", v10);
  }
  -[RPConnection setControlFlags:](v19, "setControlFlags:", 576);
  if (((unint64_t)objc_msgSend(v8, "statusFlags") & 0x1000080000) == 0)
    -[RPConnection setControlFlags:](v19, "setControlFlags:", (unint64_t)-[RPConnection controlFlags](v19, "controlFlags") | 0x400000000000);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pairingInfo"));

  if (v22)
    -[RPConnection setControlFlags:](v19, "setControlFlags:", (unint64_t)-[RPConnection controlFlags](v19, "controlFlags") | 0x8000000000);
  -[RPConnection setDispatchQueue:](v19, "setDispatchQueue:", self->_dispatchQueue);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v19, "setIdentityDaemon:", v23);

  -[RPConnection setKeepAliveSeconds:](v19, "setKeepAliveSeconds:", 10);
  v24 = objc_alloc((Class)NSString);
  daemon = self->_daemon;
  v26 = daemon->_cnxIDLast + 1;
  daemon->_cnxIDLast = v26;
  v27 = objc_msgSend(v24, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("RDLink"), v26);
  -[RPConnection setLabel:](v19, "setLabel:", v27);

  -[RPConnection setLocalDeviceInfo:](v19, "setLocalDeviceInfo:", self->_daemon->_localDeviceInfo);
  -[RPConnection setPasswordType:](v19, "setPasswordType:", objc_msgSend(v9, "passwordType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  -[RPConnection setPeerIdentifier:](v19, "setPeerIdentifier:", v28);

  -[RPConnection setPresent:](v19, "setPresent:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serviceType"));
  -[RPConnection setServiceType:](v19, "setServiceType:", v29);

  if ((objc_msgSend(v9, "internalAuthFlags") & 8) != 0)
  {
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000AA34C;
    v51[3] = &unk_100111860;
    v51[4] = self;
    -[RPConnection setAuthCompletionHandler:](v19, "setAuthCompletionHandler:", v51);
  }
  if ((objc_msgSend(v9, "internalAuthFlags") & 4) != 0)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000AA358;
    v50[3] = &unk_100114C10;
    v50[4] = self;
    -[RPConnection setPromptForPasswordHandler:](v19, "setPromptForPasswordHandler:", v50);
  }
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000AA368;
  v47[3] = &unk_1001116C8;
  v47[4] = self;
  v30 = v18;
  v48 = v30;
  v31 = v19;
  v49 = v31;
  -[RPConnection setInvalidationHandler:](v31, "setInvalidationHandler:", v47);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000AA378;
  v45[3] = &unk_100111950;
  v45[4] = self;
  v32 = v30;
  v46 = v32;
  -[RPConnection setReceivedEventHandler:](v31, "setReceivedEventHandler:", v45);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000AA390;
  v43[3] = &unk_100111978;
  v43[4] = self;
  v44 = v32;
  v33 = v32;
  -[RPConnection setReceivedRequestHandler:](v31, "setReceivedRequestHandler:", v43);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000AA3AC;
  v39[3] = &unk_1001119F0;
  v40 = v9;
  v41 = self;
  v42 = v31;
  v34 = v31;
  -[RPConnection setStateChangedHandler:](v34, "setStateChangedHandler:", v39);
  -[RPConnection activate](v34, "activate");

  v35 = 1;
LABEL_19:

  return v35;
}

- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  RPConnection *v16;
  NSXPCConnection *xpcCnx;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  RPRemoteDisplayXPCConnection *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _BYTE v61[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)RPRemoteDisplayDevice);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDeviceInfo"));
  if (v12)
    objc_msgSend(v11, "updateWithEndpoint:", v12);

  v13 = objc_msgSend(v9, "linkType");
  v14 = v13;
  if ((_DWORD)v13 == 4)
  {
    v15 = 8;
LABEL_7:
    objc_msgSend(v11, "setStatusFlags:", (unint64_t)objc_msgSend(v11, "statusFlags") | v15);
    goto LABEL_8;
  }
  if ((v13 & 0xFFFFFFFE) == 8)
  {
    v15 = 0x1000000;
    goto LABEL_7;
  }
LABEL_8:
  v16 = self->_activeNetCnx;
  if (v16
    && dword_100131A18 < 31
    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionStartWithID:netCnx:completion:]", 30, "Replacing active connection: %@ -> %@\n", v16, v9);
  }

  objc_storeStrong((id *)&self->_activeNetCnx, a4);
  xpcCnx = self->_xpcCnx;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000AAB48;
  v58[3] = &unk_100113508;
  v18 = v8;
  v59 = v18;
  v19 = v10;
  v60 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v58));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000AABF0;
  v53[3] = &unk_1001122A8;
  v54 = v18;
  v55 = v11;
  v56 = self;
  v45 = v19;
  v46 = v54;
  v57 = v45;
  v47 = v11;
  objc_msgSend(v20, "remoteDisplayStartServerSessionID:device:linkType:completion:", v54, v11, v21, v53);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "receivedMessages"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestID"));
        if (v28)
        {
          v29 = (void *)v28;
          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "request"));
          if (v30)
          {
            v31 = (void *)v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sessionID"));

            if (v32)
            {
              if (dword_100131A18 <= 30
                && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestID"));
                LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionStartWithID:netCnx:completion:]", 30, "Delivering buffered requestID %@\n", v33);

              }
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestID"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "request"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "options"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseHandler"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sessionID"));
              -[RPRemoteDisplayXPCConnection _receivedRequestID:request:options:responseHandler:sessionID:](self, "_receivedRequestID:request:options:responseHandler:sessionID:", v35, v40, v41, v42, v43);

              goto LABEL_35;
            }
          }
          else
          {

          }
        }
        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventID"));
        if (!v34)
          continue;
        v35 = (void *)v34;
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "event"));
        if (!v36)
          goto LABEL_36;
        v37 = (void *)v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sessionID"));

        if (!v38)
          continue;
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventID"));
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionStartWithID:netCnx:completion:]", 30, "Delivering buffered eventID %@\n", v39);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "event"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "options"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sessionID"));
        -[RPRemoteDisplayXPCConnection _receivedEventID:event:options:sessionID:](self, "_receivedEventID:event:options:sessionID:", v35, v40, v41, v42);
LABEL_35:

LABEL_36:
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v24);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "receivedMessages"));
  objc_msgSend(v44, "removeAllObjects");

}

- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4
{
  RPConnection *v6;
  uint64_t v7;
  RPConnection *v8;
  uint64_t DeviceClass;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v6 = (RPConnection *)a4;
  v8 = v6;
  if (self->_activatedServer)
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 != -1 || (v6 = (RPConnection *)_LogCategory_Initialize(&dword_100131A18, 30), (_DWORD)v6))
        v6 = (RPConnection *)LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionEndedWithID:netCnx:]", 30, "Server session ended: %@\n", v22);
    }
    DeviceClass = GestaltGetDeviceClass(v6, v7);
    if ((_DWORD)DeviceClass == 1 || GestaltGetDeviceClass(DeviceClass, v10) == 3)
      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](self->_daemon, "_postNotificationForWombatActivity:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    objc_msgSend(v11, "remoteDisplaySessionEndedWithID:", v22);

    -[NSMutableSet removeObject:](self->_serverNetCnxs, "removeObject:", v8);
    if (self->_activeNetCnx == v8)
    {
      self->_activeNetCnx = 0;

    }
  }
  else if (self->_activatedSession)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionEndedWithID:netCnx:]", 30, "Client session ended: %@\n", v22);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    v19 = RPErrorF(4294960543, (uint64_t)"Session ended", v13, v14, v15, v16, v17, v18, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v12, "remoteDisplaySessionError:", v20);

  }
  else if (dword_100131A18 <= 30
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionEndedWithID:netCnx:]", 30, "Session ended: %@\n", v22);
  }

}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  RPRemoteDisplayServer *activatedServer;
  NSXPCConnection *xpcCnx;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a6;
  activatedServer = self->_activatedServer;
  xpcCnx = self->_xpcCnx;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy"));
  v16 = v15;
  if (activatedServer)
    objc_msgSend(v15, "remoteDisplayReceivedEventID:event:options:sessionID:", v14, v13, v12, v17);
  else
    objc_msgSend(v15, "remoteDisplayReceivedEventID:event:options:", v14, v13, v12);

}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v12;
  id v13;
  RPRemoteDisplayServer *activatedServer;
  NSXPCConnection *xpcCnx;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v12 = a6;
  v13 = a7;
  activatedServer = self->_activatedServer;
  xpcCnx = self->_xpcCnx;
  if (activatedServer)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000AB164;
    v28[3] = &unk_100112C08;
    v25 = &v29;
    v16 = v12;
    v29 = v16;
    v17 = a5;
    v18 = a4;
    v19 = a3;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v28));
    objc_msgSend(v20, "remoteDisplayReceivedRequestID:request:options:responseHandler:sessionID:", v19, v18, v17, v16, v13);
  }
  else
  {
    v26[1] = 3221225472;
    v26[2] = sub_1000AB208;
    v26[3] = &unk_100112C08;
    v25 = &v27;
    v26[0] = _NSConcreteStackBlock;
    v21 = v12;
    v27 = v21;
    v22 = a5;
    v23 = a4;
    v24 = a3;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v26));
    objc_msgSend(v20, "remoteDisplayReceivedRequestID:request:options:responseHandler:", v24, v23, v22, v21);
  }

}

- (void)_authCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _authCompletion:]", 30, "Session auth completion: %{error}\n", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v4, "remoteDisplayAuthCompleted:", v5);

}

- (void)showPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection showPassword:flags:]", 30, "Server show password with flags %#{flags}\n", v4, &unk_10010B5E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v6, "remoteDisplayShowPassword:flags:", v7, v4);

}

- (void)hidePasswordWithFlags:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection hidePasswordWithFlags:]", 30, "Server hide password with flags %#{flags}\n", v3, &unk_10010B5E8);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v5, "remoteDisplayHidePasswordWithFlags:", v3);

}

- (void)_promptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _promptForPasswordWithFlags:throttleSeconds:]", 30, "Session prompt for password with flags %#{flags}, throttle seconds %d\n", v5, &unk_10010B5E8, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v7, "remoteDisplayPromptForPasswordWithFlags:throttleSeconds:", v5, v4);

}

- (void)updateErrorFlags:(unint64_t)a3
{
  RPRemoteDisplayDiscovery *v5;
  BOOL v6;
  void *v7;
  RPRemoteDisplayDiscovery *v8;

  v5 = self->_activatedDiscovery;
  if (v5)
  {
    v8 = v5;
    v6 = -[RPRemoteDisplayDiscovery errorFlags](v5, "errorFlags") == (id)a3;
    v5 = v8;
    if (!v6)
    {
      -[RPRemoteDisplayDiscovery setErrorFlags:](v8, "setErrorFlags:", a3);
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection updateErrorFlags:]", 30, "Update error flags for %#{pid}, %#ll{flags}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), a3, &unk_10010B75C);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v7, "remoteDisplayUpdateErrorFlags:", a3);

      v5 = v8;
    }
  }

}

- (void)_handleContinuityCameraDisabledAlertResponse
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _handleContinuityCameraDisabledAlertResponse]", 30, "Opening Settings from Continuity Camera disabled user notification response.\n");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=General&path=CONTINUITY_SPEC")));
  v3 = dispatch_queue_create("RPOpenURL", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB720;
  block[3] = &unk_1001110F8;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

- (void)_showContinuityCameraDisabledAlert
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB844;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)remoteDisplayActivateDiscovery:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id, id);
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v12;
  NSMutableSet *activatedDiscoverySet;
  NSMutableSet *v14;
  RPRemoteDisplayDaemon *daemon;
  NSMutableSet *v16;
  NSMutableDictionary *discoveredDevices;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  RPRemoteDisplayXPCConnection *v32;
  id v33;

  v7 = a3;
  v8 = (void (**)(id, id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v33 = 0;
  v9 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v33);
  v10 = v33;
  if ((v9 & 1) != 0)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateDiscovery:completion:]", 30, "Activate discovery %@ from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    v12 = objc_msgSend(v11, "errorFlags");

    objc_msgSend(v7, "setErrorFlags:", v12);
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    if (!activatedDiscoverySet)
    {
      v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      v16 = daemon->_activatedDiscoverySet;
      daemon->_activatedDiscoverySet = v14;

      activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    }
    -[NSMutableSet addObject:](activatedDiscoverySet, "addObject:", v7);
    if (v8)
      v8[2](v8, v12, v10);
    -[RPRemoteDisplayDaemon _updateForXPCClientChange](self->_daemon, "_updateForXPCClientChange");
    discoveredDevices = self->_daemon->_discoveredDevices;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000ABCE8;
    v30[3] = &unk_100114C38;
    v31 = v7;
    v32 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
    v19 = v18 != 0;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
    if (v20)
      v23 = 1;
    else
      v23 = 2;
    objc_msgSend(v21, "remoteDisplayNotifyDiscoverySessionState:forDevice:startReason:", v19, v22, v23);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_xpcCnx, "valueForEntitlement:", CFSTR("com.apple.RemoteDisplay.Dedicated")));
    if (v26)
    {
      v27 = objc_opt_class(NSNumber, v24, v25);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        if (objc_msgSend(v26, "BOOLValue"))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self->_daemon, "dedicatedDevice"));
          objc_msgSend(v28, "remoteDisplayDedicatedDeviceChanged:", v29);

        }
      }
    }

  }
  else if (v8)
  {
    v8[2](v8, 0, v10);
  }

}

- (void)remoteDisplayActivateServer:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  unsigned __int8 v9;
  id v10;
  void *v11;
  NSMutableDictionary *activatedServerXPCCnxMap;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *dispatchQueue;
  uint64_t v24;
  _QWORD block[5];
  id v26;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v26 = 0;
  v9 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  v10 = v26;
  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));

    if (!v11)
      objc_msgSend(v7, "setServiceType:", CFSTR("_rdlink._tcp"));
    activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activatedServerXPCCnxMap, "objectForKey:", v13));

    if (v14)
    {
      if (v8)
      {
        v21 = RPErrorF(4294960575, (uint64_t)"Server is already active", v15, v16, v17, v18, v19, v20, v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v8[2](v8, v22);

      }
    }
    else
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateServer:completion:]", 30, "Activate server %@ from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
      }
      objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
      objc_storeStrong((id *)&self->_activatedServer, a3);
      -[RPRemoteDisplayDaemon _handleServerActivation:](self->_daemon, "_handleServerActivation:", self);
      if (v8)
        v8[2](v8, v10);
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000ABF58;
      block[3] = &unk_1001110F8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
      -[RPRemoteDisplayDaemon _update](self->_daemon, "_update");
    }

  }
  else if (v8)
  {
    v8[2](v8, v10);
  }

}

- (void)remoteDisplayActivateSession:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  const char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  RPRemoteDisplayDaemon *daemon;
  const char *v53;
  void *v54;
  char Int64Ranged;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  unsigned __int8 v65;
  id v66;
  RPConnection *v67;
  RPConnection *clientNetCnx;
  void *v69;
  NSMutableSet *activatedSessionSet;
  NSMutableSet *v71;
  RPRemoteDisplayDaemon *v72;
  NSMutableSet *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1000AC870;
  v89[3] = &unk_100111E50;
  v90 = 0;
  v9 = v8;
  v91 = v9;
  v10 = objc_retainBlock(v89);
  v88 = 0;
  v11 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v88);
  v12 = v88;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingInfo"));

    if (v13)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.SessionPaired")));
      v21 = objc_msgSend(v20, "isEqual:", &__kCFBooleanTrue);

      if ((v21 & 1) == 0)
      {
        self->_entitled = 0;
        if (dword_100131A18 <= 90
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.rapport.SessionPaired"));
        }
        v41 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v14, v15, v16, v17, v18, v19, (uint64_t)CFSTR("com.apple.rapport.SessionPaired"));
        v25 = objc_claimAutoreleasedReturnValue(v41);
        goto LABEL_24;
      }
    }
    if (self->_activatedSession)
    {
      v22 = "Session already active";
      v23 = 4294960575;
LABEL_6:
      v24 = RPErrorF(v23, (uint64_t)v22, v14, v15, v16, v17, v18, v19, v81);
      v25 = objc_claimAutoreleasedReturnValue(v24);
LABEL_24:
      v29 = v12;
      v12 = (id)v25;
LABEL_25:

      goto LABEL_26;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
    if (objc_msgSend(CFSTR("com.apple.ddui.guestpairing"), "isEqualToString:", v26))
    {
      v27 = off_100131B78[0]();

      if (v27)
      {
        -[RPRemoteDisplayXPCConnection _showContinuityCameraDisabledAlert](self, "_showContinuityCameraDisabledAlert");
        v22 = "Continuity Camera disabled.";
        v23 = 4294960587;
        goto LABEL_6;
      }
    }
    else
    {

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationDevice"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));

    if (!v29)
    {
      v39 = RPErrorF(4294960591, (uint64_t)"No destination device", v30, v31, v32, v33, v34, v35, v81);
      v40 = objc_claimAutoreleasedReturnValue(v39);
LABEL_30:
      v49 = v12;
      v12 = (id)v40;
LABEL_80:

      goto LABEL_25;
    }
    v36 = objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self->_daemon, "_findMatchingDeviceWithIdentifier:", v29));
    if (!v36)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingInfo"));

      if (!v42 || (v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationDevice"))) == 0)
      {
        v48 = RPErrorF(4294960569, (uint64_t)"Destination device not found", v36, v43, v44, v45, v46, v47, v81);
        v40 = objc_claimAutoreleasedReturnValue(v48);
        goto LABEL_30;
      }
    }
    v85 = (void *)v36;
    objc_msgSend(v7, "setDaemonDevice:");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));

    if (!v37)
      objc_msgSend(v7, "setServiceType:", CFSTR("_rdlink._tcp"));
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v38 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
      v81 = v38;
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]", 30, "Activate session from %#{pid} service type %@ to %@\n");

    }
    if ((objc_msgSend(v7, "controlFlags") & 0x40000) != 0)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bonjourDevice"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "deviceInfo"));
      Int64Ranged = CFDictionaryGetInt64Ranged(v54, CFSTR("TrTy"), 0, 0xFFFFFFFFLL, 0);

      if (!v84 || (Int64Ranged & 0x18) == 0)
      {
        v62 = RPErrorF(4294960569, (uint64_t)"ForceUSB with no USB device", v56, v57, v58, v59, v60, v61, v81);
        v63 = objc_claimAutoreleasedReturnValue(v62);

        v12 = (id)v63;
LABEL_79:

        v49 = v85;
        goto LABEL_80;
      }
      v53 = "Infra";
      goto LABEL_50;
    }
    if ((objc_msgSend(v7, "controlFlags") & 0x20000) == 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bonjourDevice"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "deviceInfo"));
      v83 = CFDictionaryGetInt64Ranged(v51, CFSTR("TrTy"), 0, 0xFFFFFFFFLL, 0);

      if ((objc_msgSend(v7, "controlFlags") & 0x200000) != 0
        || (daemon = self->_daemon, daemon->_prefNoInfra))
      {
        if ((v83 & 0x18) != 0 && !self->_daemon->_prefNoUSB)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bonjourDevice"));
          v53 = "USB";
          goto LABEL_47;
        }
      }
      else if (!daemon->_prefNoUSB)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bonjourDevice"));
        if ((v83 & 0x18) != 0)
          v53 = "USB";
        else
          v53 = "Infra";
LABEL_47:
        if (v84)
          goto LABEL_50;
      }
    }
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_bonjourAWDLDevices, "objectForKeyedSubscript:", v29));
    if (!v84)
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]", 30, "Deferring connection until found to %@\n", v85);
      }
      -[RPRemoteDisplayDaemon addNeedsAWDLPeer:](self->_daemon, "addNeedsAWDLPeer:", v85);
      if (!self->_clientNetCnx)
      {
        v67 = (RPConnection *)objc_alloc_init((Class)RPConnection);
        clientNetCnx = self->_clientNetCnx;
        self->_clientNetCnx = v67;

        -[RPConnection setDispatchQueue:](self->_clientNetCnx, "setDispatchQueue:", self->_dispatchQueue);
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        -[RPConnection setIdentityDaemon:](self->_clientNetCnx, "setIdentityDaemon:", v69);

        objc_storeStrong((id *)&self->_activeNetCnx, self->_clientNetCnx);
      }
      objc_msgSend(v7, "setNeedsAWDL:", 1);
      v84 = 0;
      goto LABEL_63;
    }
    objc_msgSend(v7, "setBonjourDevice:");
    objc_msgSend(v7, "setNeedsAWDL:", 1);
    v53 = "AWDL";
LABEL_50:
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]", 30, "Start connection (%s) to %@ for service type %@ with bonjour device %@\n", v53, v85, v64, v84);

    }
    v87 = v12;
    v65 = -[RPRemoteDisplayXPCConnection netConnectionStartWithDevice:session:error:](self, "netConnectionStartWithDevice:session:error:", v85, v7, &v87);
    v66 = v87;

    v12 = v66;
    if ((v65 & 1) == 0)
      goto LABEL_79;
LABEL_63:
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_activatedSession, a3);
    activatedSessionSet = self->_daemon->_activatedSessionSet;
    if (!activatedSessionSet)
    {
      v71 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v72 = self->_daemon;
      v73 = v72->_activatedSessionSet;
      v72->_activatedSessionSet = v71;

      activatedSessionSet = self->_daemon->_activatedSessionSet;
    }
    -[NSMutableSet addObject:](activatedSessionSet, "addObject:", v7);
    if (v9)
      (*((void (**)(id, id))v9 + 2))(v9, v12);
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingInfo"));

    if (!v74)
      goto LABEL_78;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingInfo"));
    v86 = 0;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v75, 16, &v86));
    v77 = v86;

    if (v77)
    {
      if (dword_100131A18 > 30)
      {
LABEL_77:
        v78 = objc_alloc_init((Class)RPRemoteDisplayDevice);
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("_pubID")));
        objc_msgSend(v78, "setIdentifier:", v79);

        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("_pinC")));
        -[RPConnection setPassword:](self->_clientNetCnx, "setPassword:", v80);

        -[RPConnection setPasswordType:](self->_clientNetCnx, "setPasswordType:", 10);
        -[RPConnection setPreferredIdentityType:](self->_clientNetCnx, "setPreferredIdentityType:", 13);
        objc_msgSend(v7, "setNeedsAWDL:", 1);

LABEL_78:
        -[RPRemoteDisplayDaemon _update](self->_daemon, "_update");
        goto LABEL_79;
      }
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]", 30, "JSON error: %@\n", v77);
    }
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]", 30, "Session pairing info: %@\n", v76);
    }
    goto LABEL_77;
  }
LABEL_26:
  ((void (*)(_QWORD *))v10[2])(v10);

}

- (void)remoteDisplayInvalidateSessionID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayInvalidateSessionID:]", 30, "Invalidate session %@ from %#{pid}\n", v6, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_tcpServerConnections, "objectForKeyedSubscript:", v6));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "invalidate");

}

- (void)remoteDisplayInvalidateClientSession
{
  RPConnection *clientNetCnx;
  RPConnection *v4;
  RPRemoteDisplaySession *activatedSession;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayInvalidateClientSession]", 30, "Invalidate client session from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  if (self->_activatedSession)
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:");
  clientNetCnx = self->_clientNetCnx;
  if (clientNetCnx)
  {
    -[RPConnection invalidate](clientNetCnx, "invalidate");
    v4 = self->_clientNetCnx;
  }
  else
  {
    v4 = 0;
  }
  self->_clientNetCnx = 0;

  activatedSession = self->_activatedSession;
  self->_activatedSession = 0;

}

- (void)remoteDisplaySendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  unsigned __int8 v14;
  id v15;
  RPConnection *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  RPConnection *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v27 = 0;
  v14 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  v15 = v27;
  if ((v14 & 1) != 0)
  {
    v16 = self->_activeNetCnx;
    v23 = v16;
    if (v16)
    {
      -[RPConnection sendEncryptedEventID:event:options:completion:](v16, "sendEncryptedEventID:event:options:completion:", v10, v11, v12, v13);
    }
    else if (v13)
    {
      v24 = RPErrorF(4294960543, (uint64_t)"No connection", v17, v18, v19, v20, v21, v22, v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v13[2](v13, v25);

    }
  }
  else if (v13)
  {
    v13[2](v13, v15);
  }

}

- (void)remoteDisplayStartPairingServerWithCompletion:(id)a3
{
  NSObject *dispatchQueue;
  void (**v5)(id, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  dispatchQueue = self->_dispatchQueue;
  v5 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_activatedServer)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));

    -[RPRemoteDisplayServer setPasswordType:](self->_activatedServer, "setPasswordType:", 10);
    -[RPRemoteDisplayServer setPassword:](self->_activatedServer, "setPassword:", v15);
    -[RPRemoteDisplayDaemon _startPairingServerWithPassword:completion:](self->_daemon, "_startPairingServerWithPassword:completion:", v15, v5);
  }
  else
  {
    v13 = RPErrorF(4294960569, (uint64_t)"No active server", v6, v7, v8, v9, v10, v11, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue(v13);
    v5[2](v5, 0);
  }

}

- (void)remoteDisplayStopPairingServer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[RPRemoteDisplayDaemon _stopPairingServer](self->_daemon, "_stopPairingServer");
}

- (void)remoteDisplaySendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  RPConnection *activeNetCnx;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v26 = 0;
  v14 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  v21 = v26;
  if ((v14 & 1) != 0)
  {
    activeNetCnx = self->_activeNetCnx;
    if (activeNetCnx)
    {
      -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:](activeNetCnx, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", v10, v11, self->_xpcID, v12, v13);
    }
    else
    {
      v23 = RPErrorF(4294960543, (uint64_t)"No connection", v15, v16, v17, v18, v19, v20, v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v24);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, v21);
  }

}

- (void)remoteDisplayTryPassword:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  RPConnection *v7;
  RPConnection *v8;
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = 0;
  v5 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v9);
  v6 = v9;
  if (v5)
  {
    v7 = self->_activeNetCnx;
    v8 = v7;
    if (v7)
    {
      -[RPConnection tryPassword:](v7, "tryPassword:", v4);
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayTryPassword:]", 90, "### No connection to try password from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

  }
}

- (void)remoteDisplayPersonCanceled:(id)a3
{
  unsigned int v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = 0;
  v4 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v8);
  v5 = v8;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.RemoteDisplay.SessionState")));
    v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

    if ((v7 & 1) != 0)
    {
      -[RPRemoteDisplayDaemon _sendConfirmationCancelToAllDevices](self->_daemon, "_sendConfirmationCancelToAllDevices");
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayPersonCanceled:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.RemoteDisplay.SessionState"));
    }
  }

}

- (void)remoteDisplayPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v12 = 0;
  v7 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  v8 = v12;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.RemoteDisplay.SessionState")));
    v10 = objc_msgSend(v9, "isEqual:", &__kCFBooleanTrue);

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountID"));

      if (v11)
      {
        -[RPRemoteDisplayDaemon _requestConfirmationFromPerson:forDedicated:](self->_daemon, "_requestConfirmationFromPerson:forDedicated:", v6, v4);
      }
      else if (dword_100131A18 <= 90
             && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayPersonSelected:forDedicatedPairing:]", 90, "### Selected person has no accountID\n");
      }
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayPersonSelected:forDedicatedPairing:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.RemoteDisplay.SessionState"));
    }
  }

}

- (void)remoteDisplayChangeDiscoverySessionStateForDevice:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char **v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  int v25;
  id v26;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v26 = 0;
  v8 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  v9 = v26;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_xpcCnx, "valueForEntitlement:", CFSTR("com.apple.RemoteDisplay.SessionState")));
    if (!v12
      || (v13 = objc_opt_class(NSNumber, v10, v11), (objc_opt_isKindOfClass(v12, v13) & 1) == 0)
      || (objc_msgSend(v12, "BOOLValue") & 1) == 0)
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDiscoverySessionStateForDevice:reason:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.RemoteDisplay.SessionState"));
      }
      goto LABEL_32;
    }
    v14 = &off_100131000;
    if (v6)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("EnterOnPersonal")))
        v15 = 2;
      else
        v15 = 0;
      v16 = objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
      if (!v16
        || (v17 = (void *)v16,
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier")), v19 = objc_msgSend(v6, "isEqualToString:", v18), v18, v17, (v19 & 1) != 0))
      {
LABEL_27:
        v25 = *((_DWORD *)v14 + 646);
        if (v25 <= 30 && (v25 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDiscoverySessionStateForDevice:reason:]", 30, "Discovery session state change from %#{pid}, peer %@ reason '%@' start reason %s\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v6, v7, (&off_100114D88)[v15]);
        -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self->_daemon, "_changeDiscoverySessionStateForDevice:startReason:", v6, v15);
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("User disconnect")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self->_daemon, "dedicatedDevice"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsDeviceIdentifier"));
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (v23)
      {
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDiscoverySessionStateForDevice:reason:]", 30, "Exit session with reason '%@' for dedicated device %@ -> clear dedicated device\n", v7, v24);

        }
        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", 0);
      }

      v14 = &off_100131000;
    }
    -[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:](self->_daemon, "_sendDiscoverySessionExitWithReason:", v7);
    goto LABEL_27;
  }
LABEL_33:

}

- (void)remoteDisplayChangeDedicatedDevice:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (_os_feature_enabled_impl("Sharing", "DedicatedLaguna"))
  {
    v11 = 0;
    v5 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
    v6 = v11;
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_xpcCnx, "valueForEntitlement:", CFSTR("com.apple.RemoteDisplay.Dedicated")));
      if (v9
        && (v10 = objc_opt_class(NSNumber, v7, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
      {
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDedicatedDevice:]", 30, "Dedicated device change from %#{pid}: %@\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v4);
        }
        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", v4);
      }
      else if (dword_100131A18 <= 90
             && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDedicatedDevice:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.RemoteDisplay.Dedicated"));
      }

    }
  }

}

- (void)remoteDisplayDedicatedDeviceConfirmationWithCompletion:(id)a3
{
  void (**v4)(id, id);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;

  v4 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((_os_feature_enabled_impl("Sharing", "DedicatedLaguna") & 1) != 0)
  {
    v28 = 0;
    v11 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v28);
    v12 = v28;
    if ((v11 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_xpcCnx, "valueForEntitlement:", CFSTR("com.apple.RemoteDisplay.Dedicated")));
      if (v15
        && (v16 = objc_opt_class(NSNumber, v13, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self->_daemon, "dedicatedDevice"));
        if (v23)
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayDedicatedDeviceConfirmationWithCompletion:]", 30, "Discovery session will request confirmation from dedicated device %@ for %#{pid}\n", v23, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
          }
          -[RPRemoteDisplayDaemon _requestConfirmationFromDevice:forDedicated:](self->_daemon, "_requestConfirmationFromDevice:forDedicated:", v23, 1);
          if (v4)
            v4[2](v4, v12);
        }
        else if (v4)
        {
          v25 = RPErrorF(4294960578, (uint64_t)"No dedicated device configured", v17, v18, v19, v20, v21, v22, v27);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v4[2](v4, v26);

        }
      }
      else if (dword_100131A18 <= 90
             && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayDedicatedDeviceConfirmationWithCompletion:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.RemoteDisplay.Dedicated"));
      }

      goto LABEL_26;
    }
    if (!v4)
    {
LABEL_26:

      goto LABEL_27;
    }
LABEL_13:
    v4[2](v4, v12);
    goto LABEL_26;
  }
  if (v4)
  {
    v24 = RPErrorF(4294960561, (uint64_t)"Not supported", v5, v6, v7, v8, v9, v10, v27);
    v12 = (id)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_13;
  }
LABEL_27:

}

- (RPRemoteDisplayDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPConnection)activeNetCnx
{
  return self->_activeNetCnx;
}

- (void)setActiveNetCnx:(id)a3
{
  objc_storeStrong((id *)&self->_activeNetCnx, a3);
}

- (RPRemoteDisplayServer)activatedServer
{
  return self->_activatedServer;
}

- (RPRemoteDisplaySession)activatedSession
{
  return self->_activatedSession;
}

- (RPConnection)clientNetCnx
{
  return self->_clientNetCnx;
}

- (void)setClientNetCnx:(id)a3
{
  objc_storeStrong((id *)&self->_clientNetCnx, a3);
}

- (RPRemoteDisplayDaemon)daemon
{
  return self->_daemon;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (NSMutableSet)serverNetCnxs
{
  return self->_serverNetCnxs;
}

- (void)setServerNetCnxs:(id)a3
{
  objc_storeStrong((id *)&self->_serverNetCnxs, a3);
}

- (BOOL)usingNearbyActionV2
{
  return self->_usingNearbyActionV2;
}

- (void)setUsingNearbyActionV2:(BOOL)a3
{
  self->_usingNearbyActionV2 = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (unsigned)xpcID
{
  return self->_xpcID;
}

- (void)setXpcID:(unsigned int)a3
{
  self->_xpcID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_serverNetCnxs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_clientNetCnx, 0);
  objc_storeStrong((id *)&self->_activatedSession, 0);
  objc_storeStrong((id *)&self->_activatedServer, 0);
  objc_storeStrong((id *)&self->_activeNetCnx, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
}

@end
