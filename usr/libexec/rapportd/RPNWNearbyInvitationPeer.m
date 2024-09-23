@implementation RPNWNearbyInvitationPeer

- (RPNWNearbyInvitationPeer)init
{
  RPNWNearbyInvitationPeer *v2;
  RPNWNearbyInvitationPeer *v3;
  RPNWNearbyInvitationPeer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNWNearbyInvitationPeer;
  v2 = -[RPNWNearbyInvitationPeer init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWNearbyInvitationPeer;
  -[RPNWNearbyInvitationPeer dealloc](&v2, "dealloc");
}

- (void)startDiscovery:(id)a3 foundHandler:(id)a4 updateHandler:(id)a5 lostHandler:(id)a6 invalidationHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RPNWNearbyInvitationPeer *v17;
  id v18;
  RPNearbyInvitationDiscovery *v19;
  RPNearbyInvitationDiscovery *nearbyInvitationDiscovery;
  void *v21;
  void *v22;
  RPNearbyInvitationDiscovery *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (self->_nearbyInvitationDiscovery)
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:]", 90, "Failed to start RPNearbyInvitationDiscovery while existing discovery running.");
    }
  }
  else
  {
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      v17 = self;
      v18 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v18, "appendFormat:", CFSTR("%p"), v17);

      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:]", 30, "Starting RPNWNearbyInvitationPeer[%@] discovery", v18);
    }
    v19 = (RPNearbyInvitationDiscovery *)objc_alloc_init((Class)RPNearbyInvitationDiscovery);
    nearbyInvitationDiscovery = self->_nearbyInvitationDiscovery;
    self->_nearbyInvitationDiscovery = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dispatchQueue"));
    -[RPNearbyInvitationDiscovery setDispatchQueue:](self->_nearbyInvitationDiscovery, "setDispatchQueue:", v22);

    -[RPNearbyInvitationDiscovery setDiscoveryFlags:](self->_nearbyInvitationDiscovery, "setDiscoveryFlags:", 1);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10006C684;
    v31[3] = &unk_1001133F8;
    v32 = v13;
    -[RPNearbyInvitationDiscovery setDeviceFoundHandler:](self->_nearbyInvitationDiscovery, "setDeviceFoundHandler:", v31);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10006C690;
    v29[3] = &unk_100113420;
    v30 = v14;
    -[RPNearbyInvitationDiscovery setDeviceChangedHandler:](self->_nearbyInvitationDiscovery, "setDeviceChangedHandler:", v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10006C6A4;
    v27[3] = &unk_1001133F8;
    v28 = v15;
    -[RPNearbyInvitationDiscovery setDeviceLostHandler:](self->_nearbyInvitationDiscovery, "setDeviceLostHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10006C6B0;
    v25[3] = &unk_100113448;
    v26 = v16;
    -[RPNearbyInvitationDiscovery setInvalidationHandler:](self->_nearbyInvitationDiscovery, "setInvalidationHandler:", v25);
    v23 = self->_nearbyInvitationDiscovery;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006C6BC;
    v24[3] = &unk_100111860;
    v24[4] = self;
    -[RPNearbyInvitationDiscovery activateWithCompletion:](v23, "activateWithCompletion:", v24);

  }
}

- (void)stopDiscovery
{
  RPNWNearbyInvitationPeer *v3;
  id v4;

  if (!self->_nearbyInvitationDiscovery)
  {
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      v3 = self;
      v4 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v4, "appendFormat:", CFSTR("%p"), v3);

      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer stopDiscovery]", 30, "Stopping RPNWNearbyInvitationPeer[%@] discovery", v4);
    }
    -[RPNearbyInvitationDiscovery invalidate](self->_nearbyInvitationDiscovery, "invalidate");
  }
}

- (void)startServer:(id)a3 withCompletion:(id)a4 disconnectHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPNearbyInvitationServer *v11;
  RPNearbyInvitationServer *nearbyInvitationServer;
  void *v13;
  RPNearbyInvitationServer *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_nearbyInvitationServer)
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]", 90, "Server: Failed to start server while one already active.\n");
    }
  }
  else
  {
    v11 = (RPNearbyInvitationServer *)objc_alloc_init((Class)RPNearbyInvitationServer);
    nearbyInvitationServer = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationService"));
    -[RPNearbyInvitationServer setServiceType:](self->_nearbyInvitationServer, "setServiceType:", v13);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006CA40;
    v19[3] = &unk_100113498;
    v19[4] = self;
    v21 = v10;
    v20 = v8;
    -[RPNearbyInvitationServer setSessionStartHandler:](self->_nearbyInvitationServer, "setSessionStartHandler:", v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006CDA4;
    v18[3] = &unk_1001134C0;
    v18[4] = self;
    -[RPNearbyInvitationServer setSessionEndedHandler:](self->_nearbyInvitationServer, "setSessionEndedHandler:", v18);
    -[RPNearbyInvitationServer setInvalidationHandler:](self->_nearbyInvitationServer, "setInvalidationHandler:", &stru_1001134E0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006CEBC;
    v17[3] = &unk_1001110F8;
    v17[4] = self;
    -[RPNearbyInvitationServer setInterruptionHandler:](self->_nearbyInvitationServer, "setInterruptionHandler:", v17);
    v14 = self->_nearbyInvitationServer;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006CF54;
    v15[3] = &unk_100113508;
    v15[4] = self;
    v16 = v9;
    -[RPNearbyInvitationServer activateWithCompletion:](v14, "activateWithCompletion:", v15);

  }
}

- (void)stopServer
{
  RPNearbyInvitationServer *nearbyInvitationServer;
  RPNearbyInvitationServer *v4;

  nearbyInvitationServer = self->_nearbyInvitationServer;
  if (nearbyInvitationServer)
  {
    -[RPNearbyInvitationServer invalidate](nearbyInvitationServer, "invalidate");
    v4 = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = 0;

  }
}

- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7 connectHandler:(id)a8 disconnectHandler:(id)a9
{
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RPNearbyInvitationSession *v21;
  RPNearbyInvitationSession *nearbyInvitationSession;
  void *v23;
  void *v24;
  RPNearbyInvitationSession *v25;
  _QWORD v26[4];
  id v27;
  RPNWNearbyInvitationPeer *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v13 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (v13 && !self->_nearbyInvitationSession)
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]", 90, "Connect called for incoming connection without an existing NearbyInvitationSession.");
    }
    (*((void (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
  }
  else
  {
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]", 30, "Client: Connecting to peer device '%@'", v15);
    }
    v21 = (RPNearbyInvitationSession *)objc_alloc_init((Class)RPNearbyInvitationSession);
    nearbyInvitationSession = self->_nearbyInvitationSession;
    self->_nearbyInvitationSession = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dispatchQueue"));
    -[RPNearbyInvitationSession setDispatchQueue:](self->_nearbyInvitationSession, "setDispatchQueue:", v24);

    -[RPNearbyInvitationSession setDestinationDevice:](self->_nearbyInvitationSession, "setDestinationDevice:", v15);
    v25 = self->_nearbyInvitationSession;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10006D328;
    v26[3] = &unk_100113558;
    v27 = v15;
    v32 = v19;
    v28 = self;
    v33 = v20;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    -[RPNearbyInvitationSession activateWithCompletion:](v25, "activateWithCompletion:", v26);

  }
}

- (BOOL)findNearbyInvitationListenerAndCreateConnection:(id)a3 applicationService:(id)a4 listenerID:(id)a5 connectionID:(id)a6 agentClient:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPNWNearbyInvitationConnection *v14;
  void *v15;
  void *v16;
  RPNWNearbyInvitationConnection *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a7;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = [RPNWNearbyInvitationConnection alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destinationDevice"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v17 = -[RPNWNearbyInvitationConnection initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:](v14, "initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:", v15, v13, 1, 1, v12, v11, v16);

  objc_msgSend(v10, "setNearbyInvitationConnection:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyInvitationConnection"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "listen_framer"));
    +[RPNWFramer startConnection:](RPNWFramer, "startConnection:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyInvitationConnection"));
    objc_msgSend(v20, "setIsConnected:", 1);

  }
  return v18 != 0;
}

- (void)handleConnectionData:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006D910;
  v3[3] = &unk_100113578;
  v4 = a3;
  -[RPNWNearbyInvitationPeer receiveDataForConnection:statusHandler:](self, "receiveDataForConnection:statusHandler:", v3, &stru_1001135B8);
}

- (void)handleConnectionRequest:(id)a3 agentClient:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  RPNWNearbyInvitationPeer *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006DCB8;
  v7[3] = &unk_1001135E0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:](v8, "receiveWithRequestID:receiveHandler:", CFSTR("com.apple.oneapi.nearbyinvitation.connection"), v7);

}

+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPNWNearbyInvitationEndpoint *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(RPNWNearbyInvitationEndpoint);
  -[RPNWNearbyInvitationEndpoint setEndpointUUID:](v11, "setEndpointUUID:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createNWEndpointForEndpoint:agentID:applicationService:", v11, v9, v8));
  return v12;
}

+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *application_service;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_retainAutorelease(a5), "UTF8String");
  v26[0] = 0;
  v26[1] = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endpointUUID"));
  objc_msgSend(v10, "getUUIDBytes:", v26);

  application_service = (void *)nw_endpoint_create_application_service(v9, v26);
  if (v8)
  {
    v25[0] = 0;
    v25[1] = 0;
    objc_msgSend(v8, "getUUIDBytes:", v25);
    nw_endpoint_set_agent_identifier(application_service, v25);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "model"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "model")));
      nw_endpoint_set_device_model(application_service, objc_msgSend(v16, "UTF8String"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier")));
      nw_endpoint_set_device_id(application_service, objc_msgSend(v20, "UTF8String"));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v22 = objc_msgSend(v21, "deviceColor");

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      nw_endpoint_set_device_color(application_service, objc_msgSend(v23, "deviceColor"));

    }
  }

  return application_service;
}

+ (const)responseCodeToString:(int)a3
{
  if (a3 > 3)
    return "N/A";
  else
    return (&off_1001136A0)[a3];
}

+ (const)statusCodeToString:(int)a3
{
  if ((a3 - 1) > 4)
    return "N/A";
  else
    return (&off_1001136C0)[a3 - 1];
}

- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4
{
  id v6;
  id v7;
  RPNearbyInvitationSession *nearbyInvitationSession;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (self->_nearbyInvitationSession)
  {
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]", 30, "Registering RX DATA: requestID=%@", v6);
    }
    nearbyInvitationSession = self->_nearbyInvitationSession;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006E1E8;
    v9[3] = &unk_100113608;
    v10 = v6;
    v11 = v7;
    -[RPNearbyInvitationSession registerRequestID:options:handler:](nearbyInvitationSession, "registerRequestID:options:handler:", v10, 0, v9);

  }
  else if (dword_100131070 <= 90
         && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
  {
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]", 90, "Error registering RX DATA: requestID=%@, no active NearbyInvitationSession", v6);
  }

}

- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 listenerID:(id)a7 connectionID:(id)a8 responseHandler:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  RPNearbyInvitationSession *nearbyInvitationSession;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  const __CFString *v39;
  _UNKNOWN **v40;

  v12 = *(_QWORD *)&a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = v20;
  if (self->_nearbyInvitationSession)
  {
    v33 = v20;
    v22 = objc_alloc_init((Class)NSMutableDictionary);
    v23 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_10011ADD0, CFSTR("version"));
    if (v16)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("request"));
      objc_msgSend(v23, "appendFormat:", CFSTR(" data=%zu bytes"), objc_msgSend(v16, "length"));
    }
    else if ((_DWORD)v12)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("status"));
      objc_msgSend(v23, "appendFormat:", CFSTR(" status=%s"), +[RPNWNearbyInvitationPeer statusCodeToString:](RPNWNearbyInvitationPeer, "statusCodeToString:", v12));

    }
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("applicationService"));
    if (v18)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("listenerID"));

      objc_msgSend(v23, "appendFormat:", CFSTR(" listenerID=%@"), v18);
    }
    if (v19)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("connectionID"));

      objc_msgSend(v23, "appendFormat:", CFSTR(" connectionID=%@"), v19);
    }
    v32 = v18;
    v34 = v16;
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationPeer destinationDevice](self, "destinationDevice"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]", 30, "TX REQ to '%@': requestID=%@ appSvc=%@%@\n", v28, v15, v17, v23);

    }
    nearbyInvitationSession = self->_nearbyInvitationSession;
    v39 = CFSTR("timeoutSeconds");
    v40 = &off_10011AC68;
    v30 = v15;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006EA30;
    v35[3] = &unk_100113630;
    v35[4] = self;
    v36 = v30;
    v37 = v17;
    v21 = v33;
    v38 = v33;
    -[RPNearbyInvitationSession sendRequestID:request:destinationID:options:responseHandler:](nearbyInvitationSession, "sendRequestID:request:destinationID:options:responseHandler:", v36, v22, CFSTR("rapport:rdid:DirectPeer"), v31, v35);

    v15 = v30;
    v16 = v34;
    v18 = v32;
  }
  else if (dword_100131070 <= 90
         && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
  {
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]", 90, "Error sending: requestID=%@, no active NearbyInvitationSession", v15);
  }

}

- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006ED44;
  v8[3] = &unk_100113658;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:](self, "receiveWithRequestID:receiveHandler:", CFSTR("com.apple.oneapi.nearbyinvitation.data"), v8);

}

- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer sendDataForConnection:applicationService:connectionID:responseHandler:]", 30, "Calling send data for NearbyInvitation flow with data: %@", v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006F060;
  v15[3] = &unk_100113680;
  v16 = v13;
  v14 = v13;
  -[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:](self, "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:", CFSTR("com.apple.oneapi.nearbyinvitation.data"), v10, 0, v11, 0, v12, v15);

}

- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:]", 30, "Sending status %s for connection %@", +[RPNWNearbyInvitationPeer statusCodeToString:](RPNWNearbyInvitationPeer, "statusCodeToString:", v7), v11);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006F1A0;
  v14[3] = &unk_100113680;
  v15 = v12;
  v13 = v12;
  -[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:](self, "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:", CFSTR("com.apple.oneapi.nearbyinvitation.data"), 0, v7, v10, 0, v11, v14);

}

- (RPNearbyInvitationDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDestinationDevice:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDevice, a3);
}

- (RPNearbyInvitationDiscovery)nearbyInvitationDiscovery
{
  return self->_nearbyInvitationDiscovery;
}

- (void)setNearbyInvitationDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvitationDiscovery, a3);
}

- (RPNearbyInvitationServer)nearbyInvitationServer
{
  return self->_nearbyInvitationServer;
}

- (void)setNearbyInvitationServer:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvitationServer, a3);
}

- (RPNearbyInvitationSession)nearbyInvitationSession
{
  return self->_nearbyInvitationSession;
}

- (void)setNearbyInvitationSession:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvitationSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyInvitationSession, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationServer, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationDiscovery, 0);
  objc_storeStrong((id *)&self->_destinationDevice, 0);
}

@end
