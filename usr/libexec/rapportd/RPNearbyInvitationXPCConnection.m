@implementation RPNearbyInvitationXPCConnection

- (RPNearbyInvitationXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7;
  id v8;
  RPNearbyInvitationXPCConnection *v9;
  RPNearbyInvitationXPCConnection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPNearbyInvitationXPCConnection;
  v9 = -[RPNearbyInvitationXPCConnection init](&v12, "init");
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
  RPNearbyInvitationDiscovery *activatedDiscovery;
  RPNearbyInvitationServer *v4;
  RPNearbyInvitationServer *activatedServer;
  NSMutableDictionary *activatedServerXPCCnxMap;
  void *v7;
  RPNearbyInvitationSession *activatedSession;
  NSMutableSet *activatedSessionSet;
  RPNearbyInvitationSession *v10;
  RPNearbyInvitationSession *v11;
  RPNearbyInvitationDiscovery *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130D88 <= 20 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 20)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection connectionInvalidated]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  v12 = self->_activatedDiscovery;
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  if (v12)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedDiscoverySet, "removeObject:", v12);
    -[RPNearbyInvitationDiscovery invalidate](v12, "invalidate");
  }
  v4 = self->_activatedServer;
  activatedServer = self->_activatedServer;
  self->_activatedServer = 0;

  if (v4)
  {
    activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationServer serviceType](v4, "serviceType"));
    -[NSMutableDictionary removeObjectForKey:](activatedServerXPCCnxMap, "removeObjectForKey:", v7);

    -[RPNearbyInvitationServer invalidate](v4, "invalidate");
  }
  activatedSession = self->_activatedSession;
  if (activatedSession)
  {
    activatedSessionSet = self->_daemon->_activatedSessionSet;
    v10 = activatedSession;
    -[NSMutableSet removeObject:](activatedSessionSet, "removeObject:", v10);
    -[RPNearbyInvitationSession invalidate](v10, "invalidate");
    v11 = self->_activatedSession;
    self->_activatedSession = 0;

  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.NearbyInvitation")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if ((v7 & 1) != 0)
  {
    v14 = 0;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection _entitledAndReturnError:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.rapport.NearbyInvitation"));
    }
    v15 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)CFSTR("com.apple.rapport.NearbyInvitation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }
  v16 = objc_retainAutorelease(v14);
  *a3 = v16;

  return self->_entitled;
}

- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  RPConnection *netCnx;
  id v14;
  NSXPCConnection *xpcCnx;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)RPNearbyInvitationDevice);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDeviceInfo"));
  if (v12)
    objc_msgSend(v11, "updateWithEndpoint:", v12);
  netCnx = self->_netCnx;
  self->_netCnx = (RPConnection *)v9;
  v14 = v9;

  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection sessionStartWithID:netCnx:completion:]", 30, "Server session started: %@ device:%@\n", v8, v11);
  xpcCnx = self->_xpcCnx;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005BC0C;
  v18[3] = &unk_100112C08;
  v19 = v10;
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v18));
  objc_msgSend(v17, "nearbyInvitationStartServerSessionID:device:completion:", v8, v11, v16);

}

- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->_activatedServer)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection sessionEndedWithID:netCnx:]", 30, "Server session ended: %@\n", v8);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    objc_msgSend(v7, "nearbyInvitationSessionEndedWithID:", v8);

  }
}

- (void)sessionActivatedWithError:(id)a3
{
  void (**activateCompletionHandler)(id, id);
  id v5;
  id v6;

  v6 = a3;
  -[RPNearbyInvitationSession setWaitingToConnect:](self->_activatedSession, "setWaitingToConnect:", 0);
  -[RPNearbyInvitationSession setFailedToConnect:](self->_activatedSession, "setFailedToConnect:", v6 != 0);
  activateCompletionHandler = (void (**)(id, id))self->_activateCompletionHandler;
  if (activateCompletionHandler)
  {
    activateCompletionHandler[2](activateCompletionHandler, v6);
    v5 = self->_activateCompletionHandler;
    self->_activateCompletionHandler = 0;

  }
}

- (void)nearbyInvitationActivateDiscovery:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id);
  BOOL v9;
  id v10;
  NSMutableSet *activatedDiscoverySet;
  NSMutableSet *v12;
  RPNearbyInvitationDaemon *daemon;
  NSMutableSet *v14;
  NSMutableDictionary *discoveredDevices;
  _QWORD v16[4];
  id v17;
  RPNearbyInvitationXPCConnection *v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v19 = 0;
  v9 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v19);
  v10 = v19;
  self->_entitled = v9;
  if (v9)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateDiscovery:completion:]", 30, "Activate discovery from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    if (!activatedDiscoverySet)
    {
      v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      v14 = daemon->_activatedDiscoverySet;
      daemon->_activatedDiscoverySet = v12;

      activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    }
    -[NSMutableSet addObject:](activatedDiscoverySet, "addObject:", v7);
    if (v8)
      v8[2](v8, v10);
    -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
    discoveredDevices = self->_daemon->_discoveredDevices;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005BF94;
    v16[3] = &unk_100112F70;
    v17 = v7;
    v18 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
  else if (v8)
  {
    v8[2](v8, v10);
  }

}

- (void)nearbyInvitationActivateServer:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  unsigned __int8 v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *activatedServerXPCCnxMap;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v33 = 0;
  v9 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v33);
  v10 = v33;
  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));

    if (v11)
    {
      activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activatedServerXPCCnxMap, "objectForKey:", v19));

      if (v20)
      {
        if (v8)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
          v28 = RPErrorF(4294960575, (uint64_t)"Server with service type %@ is already active", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v8[2](v8, v29);

        }
      }
      else
      {
        if (dword_100130D88 <= 30
          && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
        {
          LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateServer:completion:]", 30, "Activate server %@ from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
        }
        objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
        objc_storeStrong((id *)&self->_activatedServer, a3);
        -[RPNearbyInvitationDaemon _handleServerActivation:](self->_daemon, "_handleServerActivation:", self);
        if (v8)
          v8[2](v8, v10);
        -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
      }

    }
    else
    {
      v30 = RPErrorF(4294896129, (uint64_t)"Missing service type for server\n", v12, v13, v14, v15, v16, v17, v32);
      v31 = objc_claimAutoreleasedReturnValue(v30);

      if (v8)
        v8[2](v8, (void *)v31);
      v10 = (id)v31;
    }
  }
  else if (v8)
  {
    v8[2](v8, v10);
  }

}

- (void)nearbyInvitationActivateSession:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  id activateCompletionHandler;
  NSMutableSet *activatedSessionSet;
  NSMutableSet *v56;
  RPNearbyInvitationDaemon *daemon;
  NSMutableSet *v58;
  uint64_t v59;
  id obj;
  _QWORD v61[4];
  id v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = sub_10000F9A8;
  v68 = sub_10000F960;
  v69 = 0;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10005C578;
  v61[3] = &unk_1001120F8;
  v63 = &v64;
  v9 = v8;
  v62 = v9;
  v10 = objc_retainBlock(v61);
  v11 = (id *)(v65 + 5);
  obj = (id)v65[5];
  v12 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    if (self->_activatedSession)
    {
      v19 = RPErrorF(4294960575, (uint64_t)"Session already active", v13, v14, v15, v16, v17, v18, v59);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)v65[5];
      v65[5] = v20;
LABEL_19:

      goto LABEL_20;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationDevice"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));

    if (v21)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _findMatchingDeviceWithIdentifier:](self->_daemon, "_findMatchingDeviceWithIdentifier:", v21));
      v36 = v29;
      if (v29)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
        v38 = objc_msgSend(v21, "isEqualToString:", v37);

        if ((v38 & 1) != 0)
        {
          objc_msgSend(v7, "setDaemonDevice:", v36);
          if (dword_100130D88 <= 30
            && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
          {
            v45 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
            LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateSession:completion:]", 30, "Activate session from %#{pid} service type %@ to %@\n", v45, v46, v36);

          }
          objc_msgSend(v7, "setWaitingToConnect:", 1);
          objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
          objc_storeStrong((id *)&self->_activatedSession, a3);
          v53 = objc_retainBlock(v9);
          activateCompletionHandler = self->_activateCompletionHandler;
          self->_activateCompletionHandler = v53;

          activatedSessionSet = self->_daemon->_activatedSessionSet;
          if (!activatedSessionSet)
          {
            v56 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
            daemon = self->_daemon;
            v58 = daemon->_activatedSessionSet;
            daemon->_activatedSessionSet = v56;

            activatedSessionSet = self->_daemon->_activatedSessionSet;
          }
          -[NSMutableSet addObject:](activatedSessionSet, "addObject:", v7);
          -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
          goto LABEL_18;
        }
        v51 = RPErrorF(4294960548, (uint64_t)"Destination device identifier did not match the cached device identifier", v39, v40, v41, v42, v43, v44, v59);
        v50 = objc_claimAutoreleasedReturnValue(v51);
      }
      else
      {
        v49 = RPErrorF(4294960569, (uint64_t)"Destination device not found", v30, v31, v32, v33, v34, v35, v59);
        v50 = objc_claimAutoreleasedReturnValue(v49);
      }
      v52 = (void *)v65[5];
      v65[5] = v50;

    }
    else
    {
      v47 = RPErrorF(4294960591, (uint64_t)"No destination device", v23, v24, v25, v26, v27, v28, v59);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      v36 = (void *)v65[5];
      v65[5] = v48;
    }
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v64, 8);
}

- (void)nearbyInvitationInvalidateClientSession
{
  RPConnection *v3;
  RPConnection *netCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection nearbyInvitationInvalidateClientSession]", 30, "Invalidate client session from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  if (self->_activatedSession)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:");
    v3 = self->_netCnx;
    -[RPConnection invalidate](v3, "invalidate");
    netCnx = self->_netCnx;
    self->_netCnx = 0;

  }
  -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
}

- (void)nearbyInvitationInvalidateSessionID:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection nearbyInvitationInvalidateSessionID:]", 30, "Invalidate session %@ from %#{pid}\n", v4, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));

}

- (void)nearbyInvitationSendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
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
  v14 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  v15 = v27;
  if ((v14 & 1) != 0)
  {
    v16 = self->_netCnx;
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

- (void)nearbyInvitationSendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
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
  RPConnection *netCnx;
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
  v14 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  v21 = v26;
  if ((v14 & 1) != 0)
  {
    netCnx = self->_netCnx;
    if (netCnx)
    {
      -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:](netCnx, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", v10, v11, self->_xpcID, v12, v13);
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

- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *devices;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __CFString *v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (!v7)
  {
    if (a4)
    {
      v14 = 0;
      v15 = CFSTR("missingDeviceIdentifier");
LABEL_11:
      *a4 = v15;
      goto LABEL_15;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_15;
  }
  if ((-[RPNearbyInvitationDiscovery shouldReportDevice:](self->_activatedDiscovery, "shouldReportDevice:", v6) & 1) == 0)
  {
    if (a4)
    {
      v14 = 0;
      v15 = CFSTR("activateDiscoveryIgnore");
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v7));

  devices = self->_devices;
  if (!devices)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = self->_devices;
    self->_devices = v10;

    devices = self->_devices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  v13 = v12;
  if (v8)
    objc_msgSend(v12, "nearbyInvitationChangedDevice:changes:", v6, 2);
  else
    objc_msgSend(v12, "nearbyInvitationFoundDevice:", v6);

  v14 = 1;
LABEL_15:

  return v14;
}

- (void)reportLostDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v6, "nearbyInvitationLostDevice:", v7);

    }
  }

}

- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  NSMutableDictionary *devices;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v13 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6));
    if (-[RPNearbyInvitationDiscovery shouldReportDevice:](self->_activatedDiscovery, "shouldReportDevice:", v13))
    {
      devices = self->_devices;
      if (v7)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v13, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v9, "nearbyInvitationChangedDevice:changes:", v13, v4);
      }
      else
      {
        v10 = v13;
        if (!devices)
        {
          v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v12 = self->_devices;
          self->_devices = v11;

          v10 = v13;
          devices = self->_devices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v9, "nearbyInvitationFoundDevice:", v13);
      }
    }
    else
    {
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v9, "nearbyInvitationLostDevice:", v13);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (id)activateCompletionHandler
{
  return self->_activateCompletionHandler;
}

- (RPNearbyInvitationDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPNearbyInvitationServer)activatedServer
{
  return self->_activatedServer;
}

- (RPNearbyInvitationSession)activatedSession
{
  return self->_activatedSession;
}

- (RPNearbyInvitationDaemon)daemon
{
  return self->_daemon;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
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

- (RPConnection)netCnx
{
  return self->_netCnx;
}

- (void)setNetCnx:(id)a3
{
  objc_storeStrong((id *)&self->_netCnx, a3);
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
  objc_storeStrong((id *)&self->_netCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activatedSession, 0);
  objc_storeStrong((id *)&self->_activatedServer, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
  objc_storeStrong(&self->_activateCompletionHandler, 0);
}

@end
