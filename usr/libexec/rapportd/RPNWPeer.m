@implementation RPNWPeer

- (RPNWPeer)init
{
  RPNWPeer *v2;
  RPNWPeer *v3;
  RPNWPeer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNWPeer;
  v2 = -[RPNWPeer init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWPeer;
  -[RPNWPeer dealloc](&v2, "dealloc");
}

- (void)startDiscovery:(unsigned int)a3 applicationService:(id)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 connectedHandler:(id)a7 updateHandler:(id)a8 lostHandler:(id)a9 invalidationHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void **p_vtable;
  void *v21;
  RPNWPeer *v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  unint64_t v43;
  unsigned int v44;

  v15 = a4;
  v34 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  p_vtable = &OBJC_METACLASS___RPNWListener.vtable;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v32 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v22 = self;
    v23 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v23, "appendFormat:", CFSTR("%p"), v22);

    p_vtable = (void **)(&OBJC_METACLASS___RPNWListener + 24);
    LogPrintF(&dword_1001316A0, "-[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:]", 30, "%@ Starting RPNWPeer[%@] discovery", v21, v23);

    v15 = v32;
  }
  -[RPNWPeer setControlFlags:](self, "setControlFlags:", a5);
  -[RPNWPeer setDeviceFilter:](self, "setDeviceFilter:", v34);
  -[RPNWPeer setRssiThreshold:](self, "setRssiThreshold:", -[RPNWPeer _rssiThresholdForApplicationService:](self, "_rssiThresholdForApplicationService:", v15));
  v24 = _os_feature_enabled_impl("Rapport", "nw_rescan_interval");
  if ((a5 & 0x10000) != 0 && v24)
  {
    -[RPNWPeer setBleScreenOffRescanInterval:](self, "setBleScreenOffRescanInterval:", 900);
LABEL_13:
    -[RPNWPeer setBleScreenOffScanRate:](self, "setBleScreenOffScanRate:", 10);
    goto LABEL_14;
  }
  if (dword_1001316A0 <= 10 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 10)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:]", 10, "No rescan interval enabled");
  if ((a5 & 0x10000) != 0)
    goto LABEL_13;
LABEL_14:
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 312, "sharedNetworkAgent"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dispatchQueue"));
  -[RPNWPeer setDispatchQueue:](self, "setDispatchQueue:", v26);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10007F8F4;
  v41[3] = &unk_100113D50;
  v44 = a3;
  v42 = v16;
  v43 = a5;
  v27 = v16;
  -[RPNWPeer setDeviceFoundHandler:](self, "setDeviceFoundHandler:", v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10007FB54;
  v39[3] = &unk_100113D78;
  v40 = v17;
  v28 = v17;
  -[RPNWPeer setDeviceChangedHandler:](self, "setDeviceChangedHandler:", v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007FB68;
  v37[3] = &unk_100113DA0;
  v38 = v18;
  v29 = v18;
  -[RPNWPeer setDeviceLostHandler:](self, "setDeviceLostHandler:", v37);
  -[RPNWPeer setInvalidationHandler:](self, "setInvalidationHandler:", v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWPeer invalidationHandler](self, "invalidationHandler"));
  -[RPNWPeer setInterruptionHandler:](self, "setInterruptionHandler:", v30);

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10007FB74;
  v35[3] = &unk_100112C08;
  v36 = v19;
  v31 = v19;
  -[RPNWPeer activateWithCompletion:](self, "activateWithCompletion:", v35);

}

- (void)stopDiscovery
{
  RPNWPeer *v3;
  id v4;

  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v3 = self;
    v4 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v4, "appendFormat:", CFSTR("%p"), v3);

    LogPrintF(&dword_1001316A0, "-[RPNWPeer stopDiscovery]", 30, "Stopping RPNWPeer[%@] discovery", v4);
  }
  -[RPNWPeer invalidate](self, "invalidate");
}

- (void)resolvePeer:(id)a3 controlFlags:(unint64_t)a4 applicationService:(id)a5 clientPublicKey:(id)a6 resolveHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  RPNWPeer *v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    LogPrintF(&dword_1001316A0, "-[RPNWPeer resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:]", 30, "%@ Resolving peer device '%@'", v16, v12);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dispatchQueue"));
  -[RPNWPeer setDispatchQueue:](self, "setDispatchQueue:", v18);

  -[RPNWPeer setDestinationDevice:](self, "setDestinationDevice:", v12);
  -[RPNWPeer setControlFlags:](self, "setControlFlags:", a4);
  if (_os_feature_enabled_impl("Rapport", "SpawnApplicationServiceListener"))
    -[RPNWPeer setServiceType:](self, "setServiceType:", v13);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10007FEEC;
  v23[3] = &unk_100113DF0;
  v27 = v14;
  v28 = v15;
  v24 = v12;
  v25 = self;
  v26 = v13;
  v19 = v14;
  v20 = v13;
  v21 = v15;
  v22 = v12;
  -[RPNWPeer activateWithCompletion:](self, "activateWithCompletion:", v23);

}

- (void)connectToOneAPIPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 automapListener:(BOOL)a7 connectionID:(id)a8 connectHandler:(id)a9
{
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v13 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = v19;
  if (v18 && v13)
  {
    (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 2, 0);
  }
  else
  {
    if (v18)
      v21 = CFSTR("com.apple.oneapi.connection");
    else
      v21 = CFSTR("com.apple.oneapi.browsing");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000801F0;
    v23[3] = &unk_100113E18;
    v24 = v15;
    v25 = v20;
    LOBYTE(v22) = a7;
    -[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:](self, "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:", v21, 0, 0, v16, 0, v17, v22, v18, v23);

  }
}

- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 automapListener:(BOOL)a7 connectionID:(id)a8 connectHandler:(id)a9 lostHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  RPNWPeer *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    LogPrintF(&dword_1001316A0, "-[RPNWPeer connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:]", 30, "%@ Connecting to peer device '%@'", v21, v15);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dispatchQueue"));
  -[RPNWPeer setDispatchQueue:](self, "setDispatchQueue:", v23);

  -[RPNWPeer setDestinationDevice:](self, "setDestinationDevice:", v15);
  -[RPNWPeer setControlFlags:](self, "setControlFlags:", 32774);
  if (_os_feature_enabled_impl("Rapport", "SpawnApplicationServiceListener") && !a4)
    -[RPNWPeer setServiceType:](self, "setServiceType:", v16);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100080514;
  v31[3] = &unk_100113E40;
  v32 = v15;
  v33 = self;
  v37 = v19;
  v38 = v20;
  v39 = a4;
  v34 = v16;
  v35 = v17;
  v40 = a7;
  v36 = v18;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v20;
  v28 = v19;
  v29 = v15;
  -[RPNWPeer activateWithCompletion:](self, "activateWithCompletion:", v31);

}

- (int)findListenerAndCreateConnection:(id)a3 version:(id)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  RPNWConnection *v19;
  RPNWConnection *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  RPNWConnection *v38;
  _OWORD buffer[7];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (dword_1001316A0 <= 40 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 40)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 40, "Received request for appSvc='%@' from '%@'", v13, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWListener findListenerForID:applicationService:fromPeer:](RPNWListener, "findListenerForID:applicationService:fromPeer:", v14, v13, v11));
  v17 = v16;
  if (v16)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getConnectionWithID:", v15));
    if (v18)
    {
      v19 = (RPNWConnection *)v18;
      if (dword_1001316A0 <= 40
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 40)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 40, "Found RPNWConnection[%@] on listener\n", v19, v33);
      }
    }
    else
    {
      v20 = [RPNWConnection alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v19 = -[RPNWConnection initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:](v20, "initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:", v11, v12, 1, 1, v13, v15, v21);

      objc_msgSend(v17, "addIncomingConnection:", v19);
      if (dword_1001316A0 <= 30
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 30, "Created incoming RPNWConnection[%@] and attached to listener %@", v19, v17);
      }
    }
    memset(buffer, 0, 96);
    if (proc_pidinfo((int)objc_msgSend(v17, "pid"), 4, 0, buffer, 96) == 96)
    {
      if (dword_1001316A0 <= 30
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 30, "Succeeded accessing client app PID (%d)", objc_msgSend(v17, "pid"));
      }
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "agentClient"));
      if (v23)
      {
        v24 = (void *)v23;
        v25 = v12;
        if (dword_1001316A0 <= 30
          && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
        {
          LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 30, "Listener mapping has listener agent client, starting connection");
        }
        -[RPNWConnection setIsConnected:](v19, "setIsConnected:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "listen_framer"));
        +[RPNWFramer startConnection:](RPNWFramer, "startConnection:", v26);

        objc_msgSend(v17, "markConnectionAsTriggered:", v19);
        v12 = v25;
        objc_msgSend(v25, "doubleValue");
        if (v27 >= 2.0)
          v22 = 1;
        else
          v22 = 2;
      }
      else
      {
        v36 = v12;
        if (dword_1001316A0 <= 30
          && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
        {
          LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 30, "Listener mapping has no listener agent client");
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v19, "peer"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v19, "peer"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "destinationDevice"));
        v34 = -[RPNWConnection inbound](v19, "inbound");
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection endpointUUID](v19, "endpointUUID"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection connectionUUID](v19, "connectionUUID"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100080DA4;
        v37[3] = &unk_100113E68;
        v38 = v19;
        objc_msgSend(v28, "connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:", v29, v34, v13, v30, 0, v31, v37, &stru_100113E88);

        v24 = 0;
        v22 = 1;
        v12 = v36;
      }
    }
    else
    {
      if (dword_1001316A0 <= 30
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 30, "Failed to access client app PID info (%d)", objc_msgSend(v17, "pid"));
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "agentClient"));
      if (dword_1001316A0 <= 30
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 30, "Agent client process no longer live, rejecting connection");
      }
      v22 = 0;
    }

  }
  else
  {
    if (dword_1001316A0 <= 90
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]", 90, "Failed to find listener\n");
    }
    v22 = 0;
  }

  return v22;
}

- (void)handleConnectionData:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100080F1C;
  v3[3] = &unk_100113578;
  v4 = a3;
  -[RPNWPeer receiveDataForConnection:statusHandler:](self, "receiveDataForConnection:statusHandler:", v3, &stru_100113EA8);
}

+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPNWEndpoint *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(RPNWEndpoint);
  -[RPNWEndpoint setEndpointUUID:](v11, "setEndpointUUID:", v10);

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
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *dictionary;
  void *v30;
  void *v31;
  id v32;
  const char *v33;
  size_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  const char *v41;
  size_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  const char *v47;
  size_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  const char *v53;
  size_t v54;
  uint64_t v56[3];
  _QWORD v57[2];
  _QWORD v58[2];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_retainAutorelease(a5), "UTF8String");
  v58[0] = 0;
  v58[1] = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endpointUUID"));
  objc_msgSend(v10, "getUUIDBytes:", v58);

  application_service = (void *)nw_endpoint_create_application_service(v9, v58);
  if (v8)
  {
    v57[0] = 0;
    v57[1] = 0;
    objc_msgSend(v8, "getUUIDBytes:", v57);
    nw_endpoint_set_agent_identifier(application_service, v57);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name")));
      nw_endpoint_set_device_name(application_service, objc_msgSend(v16, "UTF8String"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contactID"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contactID")));
      nw_endpoint_set_contact_id(application_service, objc_msgSend(v20, "UTF8String"));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "model"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "model")));
      nw_endpoint_set_device_model(application_service, objc_msgSend(v24, "UTF8String"));

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsDeviceIdentifier"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "idsDeviceIdentifier")));
      nw_endpoint_set_device_id(application_service, objc_msgSend(v28, "UTF8String"));

    }
    dictionary = nw_txt_record_create_dictionary();
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v30, "activityLevel")));
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringValue")));
    v33 = (const char *)objc_msgSend(v32, "cStringUsingEncoding:", 4);

    v34 = strlen(v33);
    nw_txt_record_set_key(dictionary, "ActivityLevel", (const uint8_t *)v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "idsDeviceIdentifier"));
    v38 = objc_msgSend(v35, "featureFlagsForIdentityMatchingIDSDeviceIdentifier:", v37);

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38));
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringValue")));
      v41 = (const char *)objc_msgSend(v40, "cStringUsingEncoding:", 4);

      v42 = strlen(v41);
      nw_txt_record_set_key(dictionary, "FeatureFlags", (const uint8_t *)v41, v42);
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v44 = objc_msgSend(v43, "statusFlags");

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v44));
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringValue")));
      v47 = (const char *)objc_msgSend(v46, "cStringUsingEncoding:", 4);

      v48 = strlen(v47);
      nw_txt_record_set_key(dictionary, "StatusFlags", (const uint8_t *)v47, v48);
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v50 = v49;
    if (v49)
      objc_msgSend(v49, "operatingSystemVersion");
    else
      memset(v56, 0, sizeof(v56));
    v51 = sub_100017F40(v56);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

    if (v52)
    {
      v53 = (const char *)objc_msgSend(objc_retainAutorelease(v52), "cStringUsingEncoding:", 4);
      v54 = strlen(v53);
      nw_txt_record_set_key(dictionary, "OSVersion", (const uint8_t *)v53, v54);
    }
    nw_endpoint_set_txt_record(application_service, dictionary);

  }
  return application_service;
}

+ (const)responseCodeToString:(int)a3
{
  if (a3 > 3)
    return "N/A";
  else
    return (&off_100113F18)[a3];
}

+ (const)statusCodeToString:(int)a3
{
  if ((a3 - 1) > 4)
    return "N/A";
  else
    return (&off_100113F38)[a3 - 1];
}

- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]", 30, "Registering RX DATA: requestID=%@", v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100081CFC;
  v10[3] = &unk_100113608;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[RPNWPeer registerRequestID:options:handler:](self, "registerRequestID:options:handler:", v9, 0, v10);

}

- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 clientPublicKey:(id)a7 listenerID:(id)a8 automapListener:(BOOL)a9 connectionID:(id)a10 responseHandler:(id)a11
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  const __CFString *v40;
  _UNKNOWN **v41;

  v14 = *(_QWORD *)&a5;
  v33 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v32 = a11;
  v21 = objc_alloc_init((Class)NSMutableDictionary);
  v22 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_10011ADE0, CFSTR("version"));
  if (v16)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("request"));
    objc_msgSend(v22, "appendFormat:", CFSTR(" data=%zu bytes"), objc_msgSend(v16, "length"));
  }
  else if ((_DWORD)v14)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("status"));
    objc_msgSend(v22, "appendFormat:", CFSTR(" status=%s"), +[RPNWPeer statusCodeToString:](RPNWPeer, "statusCodeToString:", v14));

  }
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("applicationService"));
  if (v18)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("clientPublicKey"));
    objc_msgSend(v22, "appendFormat:", CFSTR(" clientPublicKey=%zu bytes"), objc_msgSend(v18, "length"));
  }
  if (v19)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("listenerID"));
    objc_msgSend(v22, "appendFormat:", CFSTR(" listenerID=%@"), v19);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a9));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("automapListener"));

  if (v20)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("connectionID"));
    objc_msgSend(v22, "appendFormat:", CFSTR(" connectionID=%@"), v20);
  }
  v34 = v16;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWPeer destinationDevice](self, "destinationDevice"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
    LogPrintF(&dword_1001316A0, "-[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:]", 30, "%@ TX REQ to '%@': requestID=%@ appSvc=%@%@\n", v25, v27, v33, v17, v22);

  }
  v40 = CFSTR("timeoutSeconds");
  v41 = &off_10011AC80;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000827C4;
  v36[3] = &unk_100113630;
  v36[4] = self;
  v37 = v33;
  v38 = v17;
  v39 = v32;
  v29 = v32;
  v30 = v17;
  v31 = v33;
  -[RPNWPeer sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", v31, v21, CFSTR("rapport:rdid:DirectPeer"), v28, v36);

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
  v8[2] = sub_100082B3C;
  v8[3] = &unk_100113ED0;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[RPNWPeer receiveWithRequestID:receiveHandler:](self, "receiveWithRequestID:receiveHandler:", CFSTR("com.apple.oneapi.data"), v8);

}

- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6
{
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100082E18;
  v12[3] = &unk_100113EF8;
  v13 = a6;
  v10 = v13;
  LOBYTE(v11) = 0;
  -[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:](self, "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:", CFSTR("com.apple.oneapi.data"), a3, 0, a4, 0, 0, v11, a5, v12);

}

- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:]", 30, "Sending status %s for connection %@", +[RPNWPeer statusCodeToString:](RPNWPeer, "statusCodeToString:", v7), v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100082F5C;
  v15[3] = &unk_100113EF8;
  v16 = v12;
  v13 = v12;
  LOBYTE(v14) = 0;
  -[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:](self, "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:", CFSTR("com.apple.oneapi.data"), 0, v7, v10, 0, 0, v14, v11, v15);

}

- (int64_t)_rssiThresholdForApplicationService:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.sharingd.AirDrop")))
    return -80;
  else
    return 0;
}

@end
