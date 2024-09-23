@implementation RPCompanionLinkDaemon

- (void)_xpcConnectionInvalidated:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v5, "connectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

  -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
  -[RPCompanionLinkDaemon _updateRBSMonitorStateForXPCClients](self, "_updateRBSMonitorStateForXPCClients");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPCompanionLinkXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSXPCInterface *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSXPCInterface *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v67;
  id v68;
  id v69;
  _QWORD v70[6];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = -[RPCompanionLinkXPCConnection initWithDaemon:xpcCnx:]([RPCompanionLinkXPCConnection alloc], "initWithDaemon:xpcCnx:", self, v5);
  -[RPCompanionLinkXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  ++self->_xpcLastID;
  -[RPCompanionLinkXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v10 = self->_xpcClientInterface;
  if (!v10)
  {
    v68 = objc_alloc((Class)NSSet);
    v13 = objc_opt_class(NSArray, v11, v12);
    v16 = objc_opt_class(NSDictionary, v14, v15);
    v19 = objc_opt_class(NSData, v17, v18);
    v22 = objc_opt_class(NSDate, v20, v21);
    v25 = objc_opt_class(NSNull, v23, v24);
    v28 = objc_opt_class(NSNumber, v26, v27);
    v31 = objc_opt_class(NSString, v29, v30);
    v34 = objc_msgSend(v68, "initWithObjects:", v13, v16, v19, v22, v25, v28, v31, objc_opt_class(NSUUID, v32, v33), 0);
    v10 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPCompanionLinkXPCClientInterface));
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v34, "companionLinkReceivedEventID:event:options:", 1, 0);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v34, "companionLinkReceivedRequestID:request:options:responseHandler:", 1, 0);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v34, "companionLinkReceivedRequestID:request:options:responseHandler:", 0, 1);
    objc_storeStrong((id *)&self->_xpcClientInterface, v10);

  }
  v35 = self->_xpcServerInterface;
  if (!v35)
  {
    v69 = objc_alloc((Class)NSSet);
    v67 = objc_opt_class(NSArray, v36, v37);
    v40 = objc_opt_class(NSDictionary, v38, v39);
    v43 = objc_opt_class(NSData, v41, v42);
    v46 = objc_opt_class(NSDate, v44, v45);
    v49 = objc_opt_class(NSNull, v47, v48);
    v52 = objc_opt_class(NSNumber, v50, v51);
    v55 = objc_opt_class(NSString, v53, v54);
    v58 = objc_msgSend(v69, "initWithObjects:", v67, v40, v43, v46, v49, v52, v55, objc_opt_class(NSUUID, v56, v57), 0);
    v35 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPCompanionLinkXPCServerInterface));
    v59 = objc_alloc((Class)NSSet);
    v62 = objc_opt_class(NSArray, v60, v61);
    v65 = objc_msgSend(v59, "initWithObjects:", v62, objc_opt_class(RPCompanionLinkDevice, v63, v64), 0);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v35, "setClasses:forSelector:argumentIndex:ofReply:", v65, "companionLinkActivateClient:completion:", 0, 1);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v35, "setClasses:forSelector:argumentIndex:ofReply:", v58, "companionLinkSendEventID:event:destinationID:options:completion:", 1, 0);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v35, "setClasses:forSelector:argumentIndex:ofReply:", v58, "companionLinkSendRequestID:request:destinationID:options:responseHandler:", 1, 0);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v35, "setClasses:forSelector:argumentIndex:ofReply:", v58, "companionLinkSendRequestID:request:destinationID:options:responseHandler:", 0, 1);
    objc_storeStrong((id *)&self->_xpcServerInterface, v35);

  }
  objc_msgSend(v5, "setExportedInterface:", v35);
  objc_msgSend(v5, "setExportedObject:", v6);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10000FAC8;
  v70[3] = &unk_100111928;
  v70[4] = self;
  v70[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v70);
  objc_msgSend(v5, "setRemoteObjectInterface:", v10);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(v5, "resume");
  if (dword_100130248 <= 20 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));
  -[RPCompanionLinkDaemon _updateRBSMonitorStateForXPCClients](self, "_updateRBSMonitorStateForXPCClients");

  return 1;
}

- (void)_clientBLEDiscoveryDeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableDictionary *bleDevices;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  unsigned int v50;
  void *v51;
  void *v52;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsIdentifier"));
  if (!v7)
  {
    v10 = 0;
LABEL_9:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

    if (v7 && v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", v15));
      if (v16)
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 30, "Replacing BLE device identifier %@ with IDS identifier %@, DFl current %#{flags} new %#{flags}\n", v15, v7, objc_msgSend(v16, "deviceFlags"), &unk_1001098C8, v4, &unk_1001098C8);
        }
        v4 = objc_msgSend(v16, "deviceFlags") | v4;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bleDevice"));
        -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:](self, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:", v17, 1, 7);

      }
    }
    if (v7)
      v18 = v7;
    else
      v18 = v15;
    v19 = v18;
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", v19));
      if (v20)
      {
        v21 = v20;
        v51 = v15;
        v52 = v10;
        v22 = objc_msgSend(v20, "statusFlags");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bleDevice"));
        v24 = objc_msgSend(v23, "isBLEDeviceReplaced");

        if (v24
          && dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bleDevice"));
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 30, "Replaced BLE device %@ -> %@", v25, v6);

        }
        v44 = objc_msgSend(v21, "updateWithSFDevice:", v6);
        objc_msgSend(v21, "setDeviceFlags:", objc_msgSend(v21, "deviceFlags") | v4);
        if (dword_100130248 <= 10)
        {
          if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10))
          {
            v45 = CUDescriptionWithLevel(v6, 30);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 10, "BLE device changed: %@ DFl %#{flags}\n", v46, v4, &unk_1001098C8);

          }
          if (dword_100130248 <= 10
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
          {
            v47 = CUDescriptionWithLevel(v21, 30);
            v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 10, "BLE device in cache: %@\n", v48);

          }
        }
        v15 = v51;
        if ((_DWORD)v44)
        {
          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v21, v44);
          v49 = objc_msgSend(v21, "statusFlags");
          if ((v22 & 0x200000) == 0 && (v49 & 0x200000) != 0)
            -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryUINoteDevice:](self, "_reportXPCMatchingDiscoveryUINoteDevice:", v21);
          v50 = objc_msgSend(v21, "statusFlags");
          if ((v22 & 0x40000000) == 0 && (v50 & 0x40000000) != 0)
            -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:](self, "_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:", v21);
          if ((v44 & 1) != 0)
          {
            if (-[RPCompanionLinkDevice isEqualToDevice:](self->_bleNearbyActionV2Device, "isEqualToDevice:", v21))
            {
              -[RPCompanionLinkDevice updateWithSFDevice:](self->_bleNearbyActionV2Device, "updateWithSFDevice:", v6);
              -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserUpdate](self, "_clientBLENearbyActionV2AdvertiserUpdate");
            }
            if (-[RPCompanionLinkDevice isEqualToDevice:](self->_bleNeedsCLinkDevice, "isEqualToDevice:", v21))
            {
              -[RPCompanionLinkDevice updateWithSFDevice:](self->_bleNeedsCLinkDevice, "updateWithSFDevice:", v6);
              -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserUpdate](self, "_clientBLENeedsCLinkAdvertiserUpdate");
            }
          }
        }

        v10 = v52;
      }
      else
      {
        v26 = v15;
        if (dword_100130248 < 31
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v27 = CUDescriptionWithLevel(v6, 30);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 30, "BLE device found: %@ at RSSI %ld DFl %#{flags}\n", v28, objc_msgSend(v29, "rssi"), v4, &unk_1001098C8);

        }
        v30 = objc_alloc_init((Class)RPCompanionLinkDevice);
        objc_msgSend(v30, "setIdentifier:", v19);
        v31 = v10;
        objc_msgSend(v30, "setIdsDevice:", v10);
        objc_msgSend(v30, "setIdsDeviceIdentifier:", v7);
        objc_msgSend(v30, "updateWithSFDevice:", v6);
        objc_msgSend(v30, "setDeviceFlags:", objc_msgSend(v30, "deviceFlags") | v4);
        if (self->_prefIgnoreCompanionLinkChecks)
        {
          v32 = RPVersionToSourceVersionString(4000000);
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          objc_msgSend(v30, "setSourceVersion:", v33);

        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "idsFamilyEndpointMap"));

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v7));
        v37 = v36;
        if (v36)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "familyEndpointData"));
          objc_msgSend(v30, "updateWithFamilyEndpoint:", v38);

        }
        bleDevices = self->_bleDevices;
        if (!bleDevices)
        {
          v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v41 = self->_bleDevices;
          self->_bleDevices = v40;

          bleDevices = self->_bleDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](bleDevices, "setObject:forKeyedSubscript:", v30, v19);
        -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v30);
        if ((objc_msgSend(v30, "statusFlags") & 0x200000) != 0)
          -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryUINoteDevice:](self, "_reportXPCMatchingDiscoveryUINoteDevice:", v30);
        if ((objc_msgSend(v30, "statusFlags") & 0x40000000) != 0)
          -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:](self, "_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:", v30);
        if (dword_100130248 <= 10
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
        {
          v42 = CUDescriptionWithLevel(v30, 30);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 10, "BLE device in cache: %@\n", v43);

        }
        v10 = v31;
        v15 = v26;
      }
    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 90, "### Ignoring BLE device found: no ID, %@\n", v6);
    }

    goto LABEL_69;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (!v10 || self->_prefIgnoreCompanionLinkChecks)
    goto LABEL_9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = GestaltProductTypeStringToDeviceClass();
    objc_msgSend(v10, "operatingSystemVersion");
    if (!(_DWORD)v13 || (wInTP56r94EFs9NAAi(v13, 0, 0, 0) & 1) != 0)
    {

      goto LABEL_9;
    }
    if (dword_100130248 <= 20
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 20, "Ignoring BLE device found: old OS %d.%d.%d, %@\n", (unsigned __int128)0, 0, v6);
    }

  }
  else if (dword_100130248 <= 90
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]", 90, "### Ignoring BLE device found: no model: %@\n", v6);
  }
LABEL_69:

}

- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_xpcConnections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "reportChangedDevice:changes:", v6, v4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_clientReportFoundDevice:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "reportFoundDevice:outReason:", v4, 0, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)logDictionaryOfStringArrays:(id)a3 withPrefix:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v5 = a3;
  v22 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v6 = 0;
    v7 = 0;
    v23 = v5;
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v12)
        {
          v13 = v12;
          v26 = v9;
          v14 = *(_QWORD *)v30;
          while (2)
          {
            v15 = 0;
            v16 = v6;
            v17 = v7;
            do
            {
              v18 = v15;
              if (*(_QWORD *)v30 != v14)
                objc_enumerationMutation(v11);
              v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15);
              v28 = v17;
              NSAppendPrintF(&v28, "%@, ", v19);
              v7 = v28;

              v6 = v16 + v15 + 1;
              if (v6 >= 0x11)
              {
                v27 = v7;
                NSAppendPrintF(&v27, " ... %d more not shown", objc_msgSend(v11, "count") + ~(_DWORD)v16 - v15);
                v20 = v27;

                v7 = v20;
                goto LABEL_16;
              }
              ++v15;
              v17 = v7;
            }
            while (v13 != (id)(v18 + 1));
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            v6 = v16 + v15;
            if (v13)
              continue;
            break;
          }
          v6 = v16 + v18 + 1;
LABEL_16:
          v5 = v23;
          v9 = v26;
        }

        if (dword_100130248 <= 10
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon logDictionaryOfStringArrays:withPrefix:]", 10, "%@.%@: %@", v22, v9, v7);
        }

      }
      v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateForXPCClientChange
{
  uint64_t v2;
  id v3;
  int v4;
  int v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  _BOOL4 v25;
  NSMutableDictionary *xpcMatchingMap;
  unsigned int v27;
  int64_t v28;
  _BOOL4 needsAWDLTransaction;
  const char *v30;
  const char *v31;
  NSSet *screenOffDeviceFilter;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSMutableSet *obj;
  unsigned int v38;
  id v39;
  uint64_t v40;
  char v42;
  id v43;
  int DeviceClass;
  int v45;
  _QWORD v46[6];
  _QWORD v47[4];
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];

  v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  DeviceClass = GestaltGetDeviceClass(v43, v2);
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (!v3)
  {
    LOBYTE(v4) = 0;
    LOBYTE(v45) = 0;
    v38 = 0;
    LOBYTE(v5) = 0;
    v42 = 0;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    v35 = 0;
    v6 = -60;
    goto LABEL_49;
  }
  v4 = 0;
  v45 = 0;
  v38 = 0;
  v5 = 0;
  v42 = 0;
  v40 = *(_QWORD *)v51;
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  v35 = 0;
  v6 = -60;
  do
  {
    v7 = 0;
    v39 = v3;
    do
    {
      if (*(_QWORD *)v51 != v40)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
      v10 = (unint64_t)objc_msgSend(v9, "controlFlags");

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceFilter"));

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10001D5CC;
      v47[3] = &unk_100111678;
      v48 = v43;
      v49 = v8;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v47);
      if ((v10 & 0x10000) != 0)
        v42 |= objc_msgSend(v12, "count") == 0;
      if ((v10 & 0x2104000000) != 0 && !self->_prefCommunal)
      {
        v59[3] |= v10;
        *((_BYTE *)v55 + 24) = 1;
        if ((v10 & 2) == 0)
          goto LABEL_12;
LABEL_11:
        v59[3] |= v10;
        goto LABEL_12;
      }
      if ((v10 & 2) != 0)
        goto LABEL_11;
LABEL_12:
      if ((v10 & 0x8000) != 0)
        *((_BYTE *)v55 + 24) = 1;
      if (DeviceClass != 11
        && (v10 & 0x10000000000) != 0
        && ((objc_msgSend(v8, "needsCLink") & 1) != 0
         || objc_msgSend(v8, "needsNearbyActionV2")))
      {
        LOBYTE(v35) = 1;
      }
      if ((v10 & 0x200000000) != 0)
      {
        BYTE4(v35) = 1;
        *((_BYTE *)v55 + 24) = 1;
      }
      if ((v10 & 0x20000) != 0
        && ((objc_msgSend(v8, "needsCLink") & 1) != 0
         || objc_msgSend(v8, "needsNearbyActionV2")))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destinationDevice"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

        objc_msgSend(v36, "addObject:", v15);
      }
      if ((v10 & 0x10000) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
        v17 = (uint64_t)objc_msgSend(v16, "bleScreenOffRescanInterval") > 0;

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
          v34 = (uint64_t)objc_msgSend(v18, "bleScreenOffRescanInterval");

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
        if (objc_msgSend(v19, "bleScreenOffScanRate") <= v38)
          goto LABEL_31;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
        v21 = objc_msgSend(v20, "bleScreenOffScanRate") < 0x15;

        if (v21)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
          v38 = objc_msgSend(v19, "bleScreenOffScanRate");
LABEL_31:

        }
      }
      if (DeviceClass == 6 && (v10 & 0x10000000000000) != 0)
        _os_feature_enabled_impl("Rapport", "WatchWiFiDiscovery");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
      v23 = objc_msgSend(v22, "rssiThreshold");

      if ((uint64_t)v23 < v6 && v23 != 0)
        v6 = (int64_t)v23;
      v25 = *((_BYTE *)v55 + 24) != 0;

      v5 |= (v10 >> 16) & 1;
      v4 |= (v10 >> 13) & 1;
      v45 |= (v10 >> 35) & 1;
      if ((v25 & v5 & 1) != 0)
      {
        LOBYTE(v5) = 1;
        goto LABEL_49;
      }
      v7 = (char *)v7 + 1;
    }
    while (v39 != v7);
    v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  }
  while (v3);
LABEL_49:

  if (!self->_prefCommunal)
  {
    xpcMatchingMap = self->_xpcMatchingMap;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000098C8;
    v46[3] = &unk_1001116A0;
    v46[4] = &v58;
    v46[5] = &v54;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v46);
  }
  self->_bleDiscoveryControlFlags = v59[3];
  self->_bleDiscoveryForce = *((_BYTE *)v55 + 24);
  self->_bleProximityDetection = BYTE4(v35) & 1;
  self->_discoverPairedDevices = v4 & 1;
  self->_bleRSSIThreshold = v6;
  self->_enableAWDLGuestDiscovery = v45 & 1;
  if (v38)
    v27 = v38;
  else
    v27 = 10;
  self->_bleDiscoveryScreenOffScanRate = v27;
  if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    v28 = 0;
  else
    v28 = v34;
  self->_bleDiscoveryScreenOffRescanInterval = v28;
  needsAWDLTransaction = self->_needsAWDLTransaction;
  if (needsAWDLTransaction != (v35 & 1))
  {
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 != -1)
        goto LABEL_60;
      if (_LogCategory_Initialize(&dword_100130248, 30))
      {
        needsAWDLTransaction = self->_needsAWDLTransaction;
LABEL_60:
        v30 = "yes";
        if (needsAWDLTransaction)
          v31 = "yes";
        else
          v31 = "no";
        if ((v35 & 1) == 0)
          v30 = "no";
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateForXPCClientChange]", 30, "Needs AWDL Transaction: %s -> %s\n", v31, v30);
      }
    }
    self->_needsAWDLTransaction = v35 & 1;
  }
  if ((v42 & 1) != 0)
  {
    screenOffDeviceFilter = self->_screenOffDeviceFilter;
    self->_screenOffDeviceFilter = 0;

    v33 = 1;
  }
  else
  {
    objc_storeStrong((id *)&self->_screenOffDeviceFilter, v43);
    v33 = (v5 & 1) != 0 && objc_msgSend(v43, "count") != 0;
  }
  self->_bleDiscoveryScreenOff = v33;
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v36, "minusSet:", self->_needsAWDLSentToPeers);
    if (objc_msgSend(v36, "count"))
      objc_storeStrong((id *)&self->_needsAWDLNewPeers, v36);
  }
  -[RPCompanionLinkDaemon _update](self, "_update");
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v58, 8);
}

- (void)_homeKitEnsureStarted
{
  CUHomeKitManager *v3;
  CUHomeKitManager *homeKitManager;
  uint64_t v5;
  RPHomeKitManager *v6;
  RPHomeKitManager *rpHomeKitManager;
  unsigned int v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  if (!self->_homeKitManager)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitEnsureStarted]", 30, "HomeKit monitor start\n");
    }
    v3 = (CUHomeKitManager *)objc_alloc_init((Class)CUHomeKitManager);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v3;

    -[CUHomeKitManager setDispatchQueue:](self->_homeKitManager, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_prefCommunal)
      v5 = 842;
    else
      v5 = 1600;
    -[CUHomeKitManager setFlags:](self->_homeKitManager, "setFlags:", v5);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000321E8;
    v17[3] = &unk_1001110F8;
    v17[4] = self;
    -[CUHomeKitManager setResolvableAccessoriesChangedHandler:](self->_homeKitManager, "setResolvableAccessoriesChangedHandler:", v17);
    if ((v5 & 2) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100032268;
      v16[3] = &unk_1001110F8;
      v16[4] = self;
      -[CUHomeKitManager setSelfAccessoryMediaAccessUpdatedHandler:](self->_homeKitManager, "setSelfAccessoryMediaAccessUpdatedHandler:", v16);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10003227C;
      v15[3] = &unk_1001110F8;
      v15[4] = self;
      -[CUHomeKitManager setSelfAccessoryMediaSystemUpdatedHandler:](self->_homeKitManager, "setSelfAccessoryMediaSystemUpdatedHandler:", v15);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100032294;
      v14[3] = &unk_1001110F8;
      v14[4] = self;
      -[CUHomeKitManager setSelfAccessoryUpdatedHandler:](self->_homeKitManager, "setSelfAccessoryUpdatedHandler:", v14);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000322A8;
      v13[3] = &unk_1001110F8;
      v13[4] = self;
      -[CUHomeKitManager setSelfAccessorySiriAccessUpdatedHandler:](self->_homeKitManager, "setSelfAccessorySiriAccessUpdatedHandler:", v13);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000322BC;
    v12[3] = &unk_100111C70;
    v12[4] = self;
    -[CUHomeKitManager setStateChangedHandler:](self->_homeKitManager, "setStateChangedHandler:", v12);
    -[CUHomeKitManager activate](self->_homeKitManager, "activate");
  }
  if (!self->_rpHomeKitManager)
  {
    v6 = -[RPHomeKitManager initWithQueue:]([RPHomeKitManager alloc], "initWithQueue:", self->_dispatchQueue);
    rpHomeKitManager = self->_rpHomeKitManager;
    self->_rpHomeKitManager = v6;

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100032368;
    v11[3] = &unk_1001110F8;
    v11[4] = self;
    -[RPHomeKitManager setPersonalRequestsStateChangedHandler:](self->_rpHomeKitManager, "setPersonalRequestsStateChangedHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100032370;
    v10[3] = &unk_100111EF0;
    v10[4] = self;
    -[RPHomeKitManager setRoomUpdatedHandler:](self->_rpHomeKitManager, "setRoomUpdatedHandler:", v10);
  }
  v8 = -[CUHomeKitManager state](self->_homeKitManager, "state");
  if (v8 == 1)
    -[RPCompanionLinkDaemon _homeKitGetPairingIdentities](self, "_homeKitGetPairingIdentities");
  if (!self->_receiveHomeKitPairingUpdated)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", self, "_homeKitPairingUpdated:", CFSTR("HMAccessoryPairingIdentityUpdatedNotification"), 0);
    self->_receiveHomeKitPairingUpdated = 1;

  }
  if (v8 == 1)
    -[RPCompanionLinkDaemon _homeKitUpdateUserIdentifiers](self, "_homeKitUpdateUserIdentifiers");
}

- (void)_clientReportLostDevice:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "reportLostDevice:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_clientBLEDiscoveryDeviceLost:(id)a3 force:(BOOL)a4 deviceFlags:(unsigned __int8)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  RPCompanionLinkDevice *bleNearbyActionV2Device;
  RPCompanionLinkDevice *bleNeedsCLinkDevice;
  void *v28;
  id v29;

  v5 = a5;
  v29 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "idsIdentifier"));
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v9;
  v13 = v12;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", v13));
    if (!v14 && v9)
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", v9));
    if (!v14)
      goto LABEL_43;
    if (!a4)
    {
      if (objc_msgSend(v29, "isBLEDeviceReplaced"))
      {
        objc_msgSend(v14, "setDeviceFlags:", objc_msgSend(v14, "deviceFlags") & ~(_DWORD)v5);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]", 30, "Ignoring BLE device lost, BLE Device is being replaced: %@\n", v29);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bleDevice"));
        objc_msgSend(v28, "setIsBLEDeviceReplaced:", 1);

        -[RPCompanionLinkDaemon _schedulePendingLostBLEDeviceTimer](self, "_schedulePendingLostBLEDeviceTimer");
LABEL_43:

        goto LABEL_44;
      }
      if (!v11 || (objc_msgSend(v29, "deviceFlags") & 0x8000) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bleDevice"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));

        if ((objc_msgSend(v9, "isEqual:", v17) & 1) == 0)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]", 30, "Ignoring BLE device lost for BLE device ID current:%@ old:%@ cached device %@\n", v9, v17, v14);
          }

          goto LABEL_43;
        }

      }
    }
    objc_msgSend(v14, "setDeviceFlags:", objc_msgSend(v14, "deviceFlags") & ~(_DWORD)v5);
    v18 = (unint64_t)objc_msgSend(v14, "statusFlags");
    v19 = -[RPCompanionLinkDaemon _nearbyActionDeviceActionTypes](self, "_nearbyActionDeviceActionTypes");
    if ((objc_msgSend(v14, "deviceFlags") & 7) != 0)
    {
      if ((objc_msgSend(v14, "deviceFlags") & 2) != 0 || (v19 & v18) == 0)
      {
        if (dword_100130248 <= 10
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
        {
          v24 = CUDescriptionWithLevel(v14, 30);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]", 10, "BLE device in cache: %@\n", v25);

        }
      }
      else
      {
        objc_msgSend(v14, "setStatusFlags:", (unint64_t)objc_msgSend(v14, "statusFlags") & ~v19);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v20 = CUDescriptionWithLevel(v14, 30);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]", 30, "BLE device lost for NearbyAction: %@\n", v21);

        }
        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14);
      }
    }
    else
    {
      if (v9)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleDevices, "setObject:forKeyedSubscript:", 0, v9);
      if (v11)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleDevices, "setObject:forKeyedSubscript:", 0, v11);
      objc_msgSend(v14, "removeSFDevice:", v29);
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v22 = CUDescriptionWithLevel(v14, 30);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]", 30, "BLE device lost: %@ DFl %#{flags}\n", v23, v5, &unk_1001098C8);

      }
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14);
      if (-[RPCompanionLinkDevice isEqualToDevice:](self->_bleNearbyActionV2Device, "isEqualToDevice:", v14))
      {
        bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
        self->_bleNearbyActionV2Device = 0;

        -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserRestart](self, "_clientBLENearbyActionV2AdvertiserRestart");
      }
      if (-[RPCompanionLinkDevice isEqualToDevice:](self->_bleNeedsCLinkDevice, "isEqualToDevice:", v14))
      {
        bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
        self->_bleNeedsCLinkDevice = 0;

        -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserRestart](self, "_clientBLENeedsCLinkAdvertiserRestart");
      }
    }
    goto LABEL_43;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]", 90, "### Ignoring BLE device lost: no ID, %@\n", v29);
LABEL_44:

}

- (unint64_t)_nearbyActionDeviceActionTypes
{
  return 1210056704;
}

- (void)_reportXPCMatchingDiscoveryCLink
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *xpcMatchingMap;
  _QWORD v12[4];
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeDevices, "allValues"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleDevices, "allValues"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v8 += ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "statusFlags") >> 19) & 1;
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
    LOBYTE(v7) = v8 > 0;
  }

  xpcMatchingMap = self->_xpcMatchingMap;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009374;
  v12[3] = &unk_1001115E8;
  v13 = (char)v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v12);

}

- (void)_clientBLEDiscoveryEnsureStarted
{
  NSSet *screenOffDeviceFilter;
  NSSet *v4;
  SFDeviceDiscovery *bleDiscovery;
  unsigned __int8 v6;
  _BOOL4 bleProximityDetection;
  unsigned __int8 v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  NSSet *v15;
  NSSet *v16;
  NSSet *v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  const __CFString *v21;
  void *v22;
  int v23;
  unsigned int bleDiscoveryID;
  SFDeviceDiscovery *v25;
  SFDeviceDiscovery *v26;
  int64_t bleRSSIThreshold;
  uint64_t v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int bleDiscoveryScreenOff;
  uint64_t bleDiscoveryScreenOffScanRate;
  SFDeviceDiscovery *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  unsigned int v37;
  _QWORD v38[5];
  unsigned int v39;
  _QWORD v40[5];
  unsigned int v41;
  _QWORD v42[5];
  unsigned int v43;

  if ((-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) == 0
    && self->_bleDiscoveryScreenOff
    && -[NSSet count](self->_screenOffDeviceFilter, "count"))
  {
    screenOffDeviceFilter = self->_screenOffDeviceFilter;
  }
  else
  {
    screenOffDeviceFilter = 0;
  }
  v4 = screenOffDeviceFilter;
  bleDiscovery = self->_bleDiscovery;
  if (!bleDiscovery)
    goto LABEL_46;
  v6 = -[SFDeviceDiscovery changeFlags](bleDiscovery, "changeFlags");
  bleProximityDetection = self->_bleProximityDetection;
  if (self->_bleProximityDetection != (v6 & 2) >> 1)
  {
    if (dword_100130248 <= 30)
    {
      v8 = v6;
      if (dword_100130248 != -1
        || (v11 = _LogCategory_Initialize(&dword_100130248, 30),
            bleProximityDetection = self->_bleProximityDetection,
            v11))
      {
        if ((v8 & 2) != 0)
          v9 = CFSTR("YES");
        else
          v9 = CFSTR("NO");
        if (bleProximityDetection)
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]", 30, "Proximity state already enabled %@ needs to be enabled %@\n", v9, v10);
        bleProximityDetection = self->_bleProximityDetection;
      }
    }
    -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", -[SFDeviceDiscovery changeFlags](self->_bleDiscovery, "changeFlags") & 0xFFFFFFFD | (2 * bleProximityDetection));
  }
  if (-[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold") != (id)self->_bleRSSIThreshold)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]", 30, "BLE discovery RSSI threshold changed from %ld -> %ld\n", -[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold"), self->_bleRSSIThreshold);
    }
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold);
  }
  if (-[NSSet count](v4, "count")
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_bleDiscovery, "deviceFilter")),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_bleDiscovery, "deviceFilter"));
    v15 = v4;
    v16 = v14;
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      if ((v15 == 0) == (v16 != 0))
      {

LABEL_34:
        v20 = 0;
        v19 = 30;
LABEL_35:
        if ((int)v19 >= dword_100130248
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, v19)))
        {
          if (v20)
            v21 = CFSTR("NO");
          else
            v21 = CFSTR("YES");
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_bleDiscovery, "deviceFilter"));
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]", v19, "deviceFilterChanged %@, bleDiscoveryFilter %@, deviceFilter: %@", v21, v22, v15);

        }
        if ((v20 & 1) == 0)
          -[SFDeviceDiscovery setDeviceFilter:](self->_bleDiscovery, "setDeviceFilter:", v15);
        goto LABEL_44;
      }
      v18 = -[NSSet isEqual:](v15, "isEqual:", v16);

      if (!v18)
        goto LABEL_34;
    }
    v19 = 10;
    v20 = 1;
    goto LABEL_35;
  }
LABEL_44:
  if (self->_bleDiscovery)
  {
    v23 = 0;
    goto LABEL_56;
  }
LABEL_46:
  bleDiscoveryID = self->_bleDiscoveryID;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]", 30, "BLE discovery start ID %u\n", bleDiscoveryID);
  v25 = (SFDeviceDiscovery *)objc_alloc_init(off_1001302B8());
  v26 = self->_bleDiscovery;
  self->_bleDiscovery = v25;

  -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", 1);
  if (self->_bleProximityDetection)
    -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", -[SFDeviceDiscovery changeFlags](self->_bleDiscovery, "changeFlags") | 2);
  v23 = 1;
  -[SFDeviceDiscovery setRssiChangeDetection:](self->_bleDiscovery, "setRssiChangeDetection:", 1);
  -[SFDeviceDiscovery setDispatchQueue:](self->_bleDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setPurpose:](self->_bleDiscovery, "setPurpose:", CFSTR("CLink"));
  if (self->_bleRSSIThreshold)
    bleRSSIThreshold = self->_bleRSSIThreshold;
  else
    bleRSSIThreshold = -60;
  -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", bleRSSIThreshold);
  -[SFDeviceDiscovery setDeviceFilter:](self->_bleDiscovery, "setDeviceFilter:", v4);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10000FAFC;
  v42[3] = &unk_1001117E8;
  v42[4] = self;
  v43 = bleDiscoveryID;
  -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleDiscovery, "setDeviceFoundHandler:", v42);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000F924;
  v40[3] = &unk_1001117E8;
  v40[4] = self;
  v41 = bleDiscoveryID;
  -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleDiscovery, "setDeviceLostHandler:", v40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000FAD4;
  v38[3] = &unk_100111810;
  v38[4] = self;
  v39 = bleDiscoveryID;
  -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleDiscovery, "setDeviceChangedHandler:", v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001E6C0;
  v36[3] = &unk_100111838;
  v36[4] = self;
  v37 = bleDiscoveryID;
  -[SFDeviceDiscovery setInterruptionHandler:](self->_bleDiscovery, "setInterruptionHandler:", v36);
LABEL_56:
  if ((self->_bleDiscoveryControlFlags & 0x380000103C00) != 0)
  {
    v28 = 1;
  }
  else
  {
    v29 = -[RPCompanionLinkDaemon _clientShouldFindNonSameAccountDevices](self, "_clientShouldFindNonSameAccountDevices");
    if (v4)
      v30 = 1;
    else
      v30 = v29;
    if (v30)
      v28 = 1;
    else
      v28 = 33;
  }
  if ((id)v28 != -[SFDeviceDiscovery discoveryFlags](self->_bleDiscovery, "discoveryFlags"))
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", v28);
  v31 = -[SFDeviceDiscovery overrideScreenOff](self->_bleDiscovery, "overrideScreenOff");
  bleDiscoveryScreenOff = self->_bleDiscoveryScreenOff;
  if (bleDiscoveryScreenOff != v31)
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleDiscovery, "setOverrideScreenOff:", bleDiscoveryScreenOff != 0);
  if (-[SFDeviceDiscovery overrideScreenOffRescanInterval](self->_bleDiscovery, "overrideScreenOffRescanInterval") != (id)self->_bleDiscoveryScreenOffRescanInterval)
    -[SFDeviceDiscovery setOverrideScreenOffRescanInterval:](self->_bleDiscovery, "setOverrideScreenOffRescanInterval:");
  if ((-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) != 0)
    bleDiscoveryScreenOffScanRate = 0;
  else
    bleDiscoveryScreenOffScanRate = self->_bleDiscoveryScreenOffScanRate;
  -[SFDeviceDiscovery setScanRate:](self->_bleDiscovery, "setScanRate:", bleDiscoveryScreenOffScanRate);
  if (v23)
  {
    v34 = self->_bleDiscovery;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10001E754;
    v35[3] = &unk_100111860;
    v35[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v34, "activateWithCompletion:", v35);
  }

}

- (void)_localDeviceUpdate
{
  _BOOL8 v3;
  int v4;
  uint64_t v5;
  int DeviceClass;
  _BOOL4 v7;
  NSUserDefaults *soundBoardPrefs;
  NSUserDefaults *v9;
  NSUserDefaults *v10;
  uint64_t Int64;
  CFTypeID TypeID;
  void *v13;
  RPCompanionLinkDevice *v14;
  RPCompanionLinkDevice *localDeviceInfo;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSData *v43;
  NSData *uniqueIDData;
  uint64_t v45;
  NSString *v46;
  NSString *uniqueIDStr;
  NSString *v48;
  void *v49;
  NSString *v50;
  NSString *v51;
  NSString *v52;
  unsigned __int8 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  unsigned __int8 v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  unsigned __int8 v72;
  const char *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  void *i;
  void *v80;
  NSUserDefaults *airplayPrefs;
  NSUserDefaults *v83;
  NSUserDefaults *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *j;
  void *v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unsigned int v100;
  uint64_t v101;
  void *v102;
  NSString *btAdvAddrStr;
  void *v104;
  NSString *v105;
  NSString *v106;
  NSString *v107;
  unsigned __int8 v108;
  unsigned int v109;
  id v110;
  NSMutableSet *v111;
  id v112;
  id v113;
  uint64_t v114;
  void *k;
  void *v116;
  NSMutableDictionary *xpcMatchingMap;
  id v118;
  RPCompanionLinkDaemon *v119;
  NSMutableSet *v120;
  id v121;
  id v122;
  uint64_t v123;
  void *m;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  unsigned __int8 v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  unint64_t v147;
  int v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  unsigned __int8 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD v161[4];
  id v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  timespec v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  unsigned __int8 v179[128];
  uuid_t v180;

  v156 = -[RPCompanionLinkDevice changed](self->_localDeviceInfo, "changed");
  v3 = sub_100018154();
  v4 = v3;
  DeviceClass = GestaltGetDeviceClass(v3, v5);
  if (!self->_localDeviceInfo)
  {
    v14 = (RPCompanionLinkDevice *)objc_alloc_init((Class)RPCompanionLinkDevice);
    localDeviceInfo = self->_localDeviceInfo;
    self->_localDeviceInfo = v14;

    -[RPCompanionLinkDevice setDaemon:](self->_localDeviceInfo, "setDaemon:", 1);
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:", -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x40);
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:", -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x80);
    if (DeviceClass == 4)
    {
      -[RPCompanionLinkDevice setStatusFlags:](self->_localDeviceInfo, "setStatusFlags:", (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags") | 0x10000);
      v7 = 0;
      goto LABEL_12;
    }
    if (DeviceClass == 7)
      -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:", -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 2);
  }
  v7 = DeviceClass == 7;
  if (!self->_soundBoardUserLeaderKVO && DeviceClass == 7)
  {
    soundBoardPrefs = self->_soundBoardPrefs;
    if (!soundBoardPrefs)
    {
      v9 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.soundboard"));
      v10 = self->_soundBoardPrefs;
      self->_soundBoardPrefs = v9;

      soundBoardPrefs = self->_soundBoardPrefs;
    }
    v7 = 1;
    -[NSUserDefaults addObserver:forKeyPath:options:context:](soundBoardPrefs, "addObserver:forKeyPath:options:context:", self, CFSTR("stereo_leader"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_soundBoardPrefs, "addObserver:forKeyPath:options:context:", self, CFSTR("stereo_leader_info"), 1, 0);
    self->_soundBoardUserLeaderKVO = 1;
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.soundboard"), CFSTR("stereo_leader"), 0);
    self->_soundBoardUserLeader = Int64 != 0;
    if (!Int64)
    {
      TypeID = CFDictionaryGetTypeID();
      v13 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.soundboard"), CFSTR("stereo_leader_info"), TypeID, 0);
      self->_soundBoardUserLeader = CFDictionaryGetInt64(v13, CFSTR("stereo_leader"), 0) != 0;

      v7 = 1;
    }
  }
LABEL_12:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice deviceColor](self->_localDeviceInfo, "deviceColor"));

  if (!v16)
  {
    v17 = (void *)GestaltCopyAnswer(CFSTR("DeviceColor"), 0, 0);
    if (v17)
    {
      -[RPCompanionLinkDevice setDeviceColor:](self->_localDeviceInfo, "setDeviceColor:", v17);
      v156 = 1;
    }

  }
  v18 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags");
  if ((v18 & 0xFFFFF2DF | (32 * (-[CUSystemMonitor wifiFlags](self->_systemMonitor, "wifiFlags") & 1)) | (self->_prefHIDEnabled << 10) | (self->_prefMediaControlEnabled << 8) | (self->_prefSiriEnabled << 11)) != v18)
  {
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:");
    v156 = 1;
  }
  if (!self->_needsPrimaryAppleIDUpdate)
  {
    v25 = 0;
    v21 = 0;
    goto LABEL_35;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _getAltDSID](self, "_getAltDSID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice accountAltDSID](self->_localDeviceInfo, "accountAltDSID"));
  v21 = v19;
  v22 = v20;
  if (v21 == v22)
  {

    goto LABEL_27;
  }
  v23 = v22;
  if ((v21 == 0) == (v22 != 0))
  {

    goto LABEL_26;
  }
  v24 = objc_msgSend(v21, "isEqual:", v22);

  if ((v24 & 1) == 0)
  {
LABEL_26:
    -[RPCompanionLinkDevice setAccountAltDSID:](self->_localDeviceInfo, "setAccountAltDSID:", v21);
    v156 = 1;
  }
LABEL_27:
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _getAppleID](self, "_getAppleID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice accountID](self->_localDeviceInfo, "accountID"));
  v25 = v26;
  v28 = v27;
  if (v25 == v28)
  {

  }
  else
  {
    v29 = v28;
    if ((v25 == 0) != (v28 != 0))
    {
      v30 = objc_msgSend(v25, "isEqual:", v28);

      if ((v30 & 1) != 0)
        goto LABEL_34;
    }
    else
    {

    }
    -[RPCompanionLinkDevice setAccountID:](self->_localDeviceInfo, "setAccountID:", v25);
    v156 = 1;
  }
LABEL_34:
  self->_needsPrimaryAppleIDUpdate = 0;
LABEL_35:
  if (-[RPCompanionLinkDaemon _shouldSendActivityLevelOverWiFi](self, "_shouldSendActivityLevelOverWiFi"))
  {
    if (-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn"))
      v31 = 7;
    else
      v31 = 3;
    -[RPCompanionLinkDevice setActivityLevel:](self->_localDeviceInfo, "setActivityLevel:", v31);
  }
  if (self->_prefHomeKitEnabled)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice homeKitIdentifier](self->_localDeviceInfo, "homeKitIdentifier"));

    if (v32)
    {
      v33 = 0;
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "uniqueIdentifier"));

      if (v33)
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, "HomeKit SelfAccessory identifier: %@\n", v33);
        }
        -[RPCompanionLinkDevice setHomeKitIdentifier:](self->_localDeviceInfo, "setHomeKitIdentifier:", v33);
        v156 = 1;
      }
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "homeKitIdentity"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice accountID](self->_localDeviceInfo, "accountID"));
    if (v37)
    {
      v152 = v25;
    }
    else
    {
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "accountID"));

      v152 = (void *)v38;
      if (v38)
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v39 = (const char *)sub_1000181FC((uint64_t)"HomeKit SelfAccessory accountID: ", v4);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, v39, v38);
        }
        -[RPCompanionLinkDevice setAccountID:](self->_localDeviceInfo, "setAccountID:", v38);
        v156 = 1;
      }
      else
      {
        v152 = 0;
      }
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers"));

    if (v40
      || (v151 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager homeKitUserIdentifiers](self->_rpHomeKitManager, "homeKitUserIdentifiers"))) == 0)
    {
      v151 = 0;
    }
    else
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v41 = (const char *)sub_1000181FC((uint64_t)"HomeKit SelfAccessory homeKitUserIdentifiers: ", v4);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, v41, v151);
      }
      -[RPCompanionLinkDevice setHomeKitUserIdentifiers:](self->_localDeviceInfo, "setHomeKitUserIdentifiers:", v151);
      v156 = 1;
    }

  }
  else
  {
    v151 = 0;
    v152 = v25;
    v33 = 0;
  }
  if (!self->_uniqueIDData)
  {
    memset(v180, 0, sizeof(v180));
    v175.tv_sec = 0;
    v175.tv_nsec = 0;
    if (gethostuuid(v180, &v175))
    {
      v42 = NSRandomData(6, 0);
      v43 = (NSData *)objc_claimAutoreleasedReturnValue(v42);
    }
    else
    {
      v43 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v180, 6);
    }
    uniqueIDData = self->_uniqueIDData;
    self->_uniqueIDData = v43;

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, "Unique ID updated: <%@>\n", self->_uniqueIDData);
    }
    v45 = NSPrintF("%.3H", -[NSData bytes](self->_uniqueIDData, "bytes"), -[NSData length](self->_uniqueIDData, "length"), -[NSData length](self->_uniqueIDData, "length"));
    v46 = (NSString *)objc_claimAutoreleasedReturnValue(v45);
    uniqueIDStr = self->_uniqueIDStr;
    self->_uniqueIDStr = v46;

  }
  v48 = self->_uniqueIDStr;
  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
    v50 = v48;
    v51 = v49;
    if (v50 == v51)
    {

      goto LABEL_85;
    }
    v52 = v51;
    if (v51)
    {
      v53 = -[NSString isEqual:](v50, "isEqual:", v51);

      if ((v53 & 1) != 0)
        goto LABEL_85;
    }
    else
    {

    }
    -[RPCompanionLinkDevice setIdentifier:](self->_localDeviceInfo, "setIdentifier:", self->_uniqueIDStr);
    v156 = 1;
  }
LABEL_85:
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self->_localDeviceInfo, "idsDeviceIdentifier"));

  if (!v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "idsDeviceIDSelf"));

    if (v56)
    {
      -[RPCompanionLinkDevice setIdsDeviceIdentifier:](self->_localDeviceInfo, "setIdsDeviceIdentifier:", v56);
      v156 = 1;
    }

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "idsCorrelationIdentifier"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsCorrelationIdentifier](self->_localDeviceInfo, "idsCorrelationIdentifier"));
  v60 = v58;
  v61 = v59;
  if (v60 == v61)
  {

  }
  else
  {
    v62 = v61;
    if ((v60 == 0) == (v61 != 0))
    {

LABEL_96:
      v155 = v60;
      -[RPCompanionLinkDevice setIdsCorrelationIdentifier:](self->_localDeviceInfo, "setIdsCorrelationIdentifier:");
      v156 = 1;
      goto LABEL_97;
    }
    v63 = objc_msgSend(v60, "isEqual:", v61);

    if ((v63 & 1) == 0)
      goto LABEL_96;
  }
  v155 = 0;
LABEL_97:
  if ((int)-[RPCompanionLinkDevice listeningPort](self->_localDeviceInfo, "listeningPort") > 0
    || (v64 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"), (int)v64 < 1))
  {
    v148 = 0;
  }
  else
  {
    -[RPCompanionLinkDevice setListeningPort:](self->_localDeviceInfo, "setListeningPort:", v64);
    v148 = 1;
    v156 = 1;
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));

  if (!v65)
  {
    v66 = (void *)GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
    if (v66)
    {
      -[RPCompanionLinkDevice setModel:](self->_localDeviceInfo, "setModel:", v66);
      v156 = 1;
    }

  }
  if (self->_prefCommunal)
  {
    v67 = (id)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceIDSDeviceID](self->_systemMonitor, "meDeviceIDSDeviceID"));

    v60 = v67;
  }
  else
  {
    v67 = 0;
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsPersonalDeviceIdentifier](self->_localDeviceInfo, "idsPersonalDeviceIdentifier"));
  v69 = v67;
  v70 = v68;
  v150 = v21;
  v153 = v69;
  if (v69 == v70)
  {

    goto LABEL_133;
  }
  v71 = v70;
  if ((v69 == 0) != (v70 != 0))
  {
    v72 = objc_msgSend(v69, "isEqual:", v70);

    if ((v72 & 1) != 0)
      goto LABEL_133;
  }
  else
  {

  }
  if (dword_100130248 <= 30)
  {
    if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30))
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, "PersonalIDSDeviceIdentifier (me device) changed: ");
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      if (v4)
        v73 = "%@ -> %@\n";
      else
        v73 = "%~@ -> %~@\n";
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsPersonalDeviceIdentifier](self->_localDeviceInfo, "idsPersonalDeviceIdentifier"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, v73, v74, v69);

    }
  }
  -[RPCompanionLinkDevice setIdsPersonalDeviceIdentifier:](self->_localDeviceInfo, "setIdsPersonalDeviceIdentifier:", v69);
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v171, v179, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v172;
    do
    {
      for (i = 0; i != v77; i = (char *)i + 1)
      {
        if (*(_QWORD *)v172 != v78)
          objc_enumerationMutation(v75);
        v80 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v80, "setIdsPersonalDeviceIdentifier:", v153);
        objc_msgSend(v80, "setChanged:", 1);
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v171, v179, 16);
    }
    while (v77);
  }

  -[RPCompanionLinkDaemon _personalDeviceUpdate](self, "_personalDeviceUpdate");
  v156 = 1;
LABEL_133:
  if (!self->_mediaAccessControlKVO && v7)
  {
    airplayPrefs = self->_airplayPrefs;
    if (!airplayPrefs)
    {
      v83 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.airplay"));
      v84 = self->_airplayPrefs;
      self->_airplayPrefs = v83;

      airplayPrefs = self->_airplayPrefs;
    }
    -[NSUserDefaults addObserver:forKeyPath:options:context:](airplayPrefs, "addObserver:forKeyPath:options:context:", self, CFSTR("accessControlLevel"), 1, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_airplayPrefs, "addObserver:forKeyPath:options:context:", self, CFSTR("p2pAllow"), 1, 0);
    self->_mediaAccessControlKVO = 1;
  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRemoteIdentifier](self->_localDeviceInfo, "mediaRemoteIdentifier"));

  if (!v85)
    -[RPCompanionLinkDaemon _mediaRemoteIDGet](self, "_mediaRemoteIDGet");
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier"));

  if (!v86)
    -[RPCompanionLinkDaemon _mediaRouteIDGet](self, "_mediaRouteIDGet");
  v87 = -[RPCompanionLinkDevice personalDeviceState](self->_localDeviceInfo, "personalDeviceState");
  if (self->_prefCommunal && -[CUSystemMonitor meDeviceValid](self->_systemMonitor, "meDeviceValid"))
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceFMFDeviceID](self->_systemMonitor, "meDeviceFMFDeviceID"));
    if (objc_msgSend(v88, "length"))
      v89 = 6;
    else
      v89 = 5;

  }
  else
  {
    v89 = 0;
  }
  if ((_DWORD)v89 != v87)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      if (v87 >= 8)
      {
        v90 = "?";
        if (v87 > 9)
          v90 = "User";
      }
      else
      {
        v90 = off_100112478[v87];
      }
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, "PersonalDeviceState changed: %s -> %s\n", v90, off_1001123D0[v89]);
    }
    -[RPCompanionLinkDevice setPersonalDeviceState:](self->_localDeviceInfo, "setPersonalDeviceState:", v89);
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v167, v178, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v168;
      do
      {
        for (j = 0; j != v93; j = (char *)j + 1)
        {
          if (*(_QWORD *)v168 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v96, "setPersonalDeviceState:", v89);
          objc_msgSend(v96, "setChanged:", 1);
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v167, v178, 16);
      }
      while (v93);
    }

    v156 = 1;
  }
  v97 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
  if (-[NSMutableSet containsObject:](self->_registeredProfileIDs, "containsObject:", CFSTR("DuetSync")))
  {
    -[RPCompanionLinkDaemon _duetSyncEnsureStarted](self, "_duetSyncEnsureStarted");
    v98 = 256;
  }
  else
  {
    -[RPCompanionLinkDaemon _duetSyncEnsureStopped](self, "_duetSyncEnsureStopped");
    v98 = 0;
  }
  v99 = v98 | v97 & 0xFFFFFEFFFFFFFEFFLL;
  v100 = -[CUSystemMonitor meDeviceIsMe](self->_systemMonitor, "meDeviceIsMe");
  v101 = 0x10000000000;
  if (!v100)
    v101 = 0;
  v102 = (void *)(v99 | v101);
  if (v102 != (void *)v97)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _localDeviceUpdate]", 30, "StatusFlags changed: %#ll{flags} -> %#ll{flags}\n", v97, &unk_10010992F, v102, &unk_10010992F);
    }
    -[RPCompanionLinkDevice setStatusFlags:](self->_localDeviceInfo, "setStatusFlags:", v102);
    v156 = 1;
  }
  v146 = v102;
  v147 = v97;
  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr)
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice publicIdentifier](self->_localDeviceInfo, "publicIdentifier"));
    v105 = btAdvAddrStr;
    v106 = v104;
    if (v105 == v106)
    {

    }
    else
    {
      v107 = v106;
      if (v106)
      {
        v108 = -[NSString isEqual:](v105, "isEqual:", v106);

        if ((v108 & 1) != 0)
          goto LABEL_188;
      }
      else
      {

      }
      -[RPCompanionLinkDevice setPublicIdentifier:](self->_localDeviceInfo, "setPublicIdentifier:", self->_btAdvAddrStr);
      v156 = 1;
    }
  }
LABEL_188:
  v109 = -[RPCompanionLinkDevice serversChangedState](self->_localDeviceInfo, "serversChangedState");
  v149 = (void *)v33;
  if (v109 != 6 && v109)
  {
    v154 = 0;
  }
  else
  {
    v110 = objc_alloc_init((Class)NSMutableArray);
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v111 = self->_activeServers;
    v112 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v163, v177, 16);
    if (v112)
    {
      v113 = v112;
      v114 = *(_QWORD *)v164;
      do
      {
        for (k = 0; k != v113; k = (char *)k + 1)
        {
          if (*(_QWORD *)v164 != v114)
            objc_enumerationMutation(v111);
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)k), "serviceType"));
          if (v116)
            objc_msgSend(v110, "addObject:", v116);

        }
        v113 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v163, v177, 16);
      }
      while (v113);
    }

    xpcMatchingMap = self->_xpcMatchingMap;
    v161[0] = _NSConcreteStackBlock;
    v161[1] = 3221225472;
    v161[2] = sub_100030048;
    v161[3] = &unk_100111D88;
    v118 = v110;
    v162 = v118;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v161);
    v154 = v118;
    -[RPCompanionLinkDevice setServiceTypes:](self->_localDeviceInfo, "setServiceTypes:", v118);
    -[RPCompanionLinkDevice setServersChangedState:](self->_localDeviceInfo, "setServersChangedState:", 5);

  }
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v119 = self;
  v120 = self->_xpcConnections;
  v121 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v157, v176, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v158;
    do
    {
      for (m = 0; m != v122; m = (char *)m + 1)
      {
        if (*(_QWORD *)v158 != v123)
          objc_enumerationMutation(v120);
        v125 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)m);
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "client"));

        if (v126)
        {
          v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "netCnx"));
          v128 = v127;
          if (v127)
          {
            v129 = v127;
          }
          else
          {
            v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "session"));
            v129 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "cnx"));

          }
          if ((objc_msgSend(v129, "controlFlags") & 0x200) != 0)
          {
            v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "client"));
            v132 = objc_msgSend(v131, "usingOnDemandConnection");

            if ((v132 & 1) == 0)
            {
              v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "client"));
              objc_msgSend(v133, "setUsingOnDemandConnection:", 1);

              v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "xpcCnx"));
              v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "remoteObjectProxy"));
              v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "client"));
              objc_msgSend(v135, "companionLinkUpdateClientState:", v136);

            }
          }
          if ((v156 & 1) != 0 || (objc_msgSend(v125, "localDeviceUpdated") & 1) == 0)
          {
            v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "xpcCnx"));
            v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "remoteObjectProxy"));
            objc_msgSend(v138, "companionLinkLocalDeviceUpdated:", v119->_localDeviceInfo);

            objc_msgSend(v125, "setLocalDeviceUpdated:", 1);
          }

        }
      }
      v122 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v157, v176, 16);
    }
    while (v122);
  }

  v139 = objc_alloc_init((Class)NSMutableDictionary);
  v140 = v139;
  if (v150)
    objc_msgSend(v139, "setObject:forKeyedSubscript:", v150, CFSTR("_accAltDSID"));
  if (v152)
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v152, CFSTR("_accID"));
  if (v149)
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v149, CFSTR("_hkID"));
  if (v151)
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v151, CFSTR("_hkUID"));
  if (v154)
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v154, CFSTR("_stA"));
  if (v148)
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[RPCompanionLinkDevice listeningPort](v119->_localDeviceInfo, "listeningPort")));
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v141, CFSTR("_lP"));

  }
  if (v146 != (void *)v147)
  {
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)-[RPCompanionLinkDevice statusFlags](v119->_localDeviceInfo, "statusFlags") & 0x10000010100));
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v142, CFSTR("_sf"));

  }
  if (v155)
  {
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsCorrelationIdentifier](v119->_localDeviceInfo, "idsCorrelationIdentifier"));
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v143, CFSTR("_idsCID"));

  }
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "allKeys"));
  v145 = objc_msgSend(v144, "count");

  if (v145)
    -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](v119, "sendEventID:event:destinationID:options:completion:", CFSTR("_systemInfoUpdate"), v140, CFSTR("rapport:rdid:SameHome"), 0, 0);
  -[RPCompanionLinkDevice setChanged:](v119->_localDeviceInfo, "setChanged:", 0);

}

- (void)_update
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CBAdvertiser *v5;
  CBAdvertiser *cbAdvertiser;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  int v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  CUWiFiManager *wifiManager;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10001D3B0;
    v31[3] = &unk_1001110F8;
    v31[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001D3B8;
    v30[3] = &unk_1001110F8;
    v30[4] = self;
    -[CUSystemMonitor setMeDeviceChangedHandler:](self->_systemMonitor, "setMeDeviceChangedHandler:", v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001D470;
    v29[3] = &unk_1001110F8;
    v29[4] = self;
    -[CUSystemMonitor setPowerUnlimitedChangedHandler:](self->_systemMonitor, "setPowerUnlimitedChangedHandler:", v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001D478;
    v28[3] = &unk_1001110F8;
    v28[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v28);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001D48C;
    v27[3] = &unk_1001110F8;
    v27[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](self->_systemMonitor, "setScreenLockedChangedHandler:", v27);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001D494;
    v26[3] = &unk_1001110F8;
    v26[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v26);
    if (self->_prefIPEnabled)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10001D49C;
      v25[3] = &unk_1001110F8;
      v25[4] = self;
      -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v25);
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001D4A4;
    v24[3] = &unk_1001110F8;
    v24[4] = self;
    -[CUSystemMonitor setBluetoothAddressChangedHandler:](self->_systemMonitor, "setBluetoothAddressChangedHandler:", v24);
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", 0);
  }
  if (!self->_cbAdvertiser)
  {
    v5 = (CBAdvertiser *)objc_alloc_init((Class)CBAdvertiser);
    cbAdvertiser = self->_cbAdvertiser;
    self->_cbAdvertiser = v5;

    -[CBAdvertiser setDispatchQueue:](self->_cbAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAdvertiser activateWithCompletion:](self->_cbAdvertiser, "activateWithCompletion:", &stru_100111650);
  }
  v7 = self->_prefServerEnabled && !self->_disabled;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identitiesOfType:error:", 13, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identitiesOfType:error:", 15, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identitiesOfType:error:", 12, 0));

  if (!v7)
    goto LABEL_19;
  if (!self->_prefCommunal)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    if ((objc_msgSend(v14, "idsIsSignedIn") & 1) != 0
      || objc_msgSend(v9, "count")
      || objc_msgSend(v11, "count")
      || objc_msgSend(v13, "count"))
    {

      goto LABEL_17;
    }
    v16 = sub_100017404();

    if (v16)
      goto LABEL_17;
LABEL_19:
    v15 = -[RPNearFieldDaemon hasCurrentTransaction](self->_nearfieldDaemon, "hasCurrentTransaction");
    goto LABEL_20;
  }
LABEL_17:
  v15 = 1;
LABEL_20:
  self->_prefServerShouldRun = v15;
  if (!self->_prefClientEnabled && !self->_prefServerEnabled)
  {
    -[RPCompanionLinkDaemon _localDeviceCleanup](self, "_localDeviceCleanup");
    v17 = 0;
LABEL_26:
    -[RPCompanionLinkDaemon _homeKitEnsureStopped](self, "_homeKitEnsureStopped");
    if (!v17)
      goto LABEL_29;
    goto LABEL_27;
  }
  -[RPCompanionLinkDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
  if (!self->_prefHomeKitEnabled)
  {
    v17 = 1;
    goto LABEL_26;
  }
  -[RPCompanionLinkDaemon _homeKitEnsureStarted](self, "_homeKitEnsureStarted");
  LOBYTE(v17) = 1;
LABEL_27:
  if (self->_prefIPEnabled)
  {
    -[RPCompanionLinkDaemon _reachabilityEnsureStarted](self, "_reachabilityEnsureStarted");
    goto LABEL_30;
  }
LABEL_29:
  -[RPCompanionLinkDaemon _reachabilityEnsureStopped](self, "_reachabilityEnsureStopped");
LABEL_30:
  v18 = v17 ^ 1;
  if (self->_disabled)
    v18 = 1;
  if ((v18 & 1) != 0)
    -[RPCompanionLinkDaemon _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
  else
    -[RPCompanionLinkDaemon _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  if (self->_prefBTPipeEnabled)
    -[RPCompanionLinkDaemon _btPipeEnsureStarted](self, "_btPipeEnsureStarted");
  else
    -[RPCompanionLinkDaemon _btPipeEnsureStopped](self, "_btPipeEnsureStopped");
  if (!self->_prefClientEnabled || self->_disabled || self->_homeKitWaiting && !self->_homeKitLTPK)
    -[RPCompanionLinkDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
  else
    -[RPCompanionLinkDaemon _clientEnsureStarted](self, "_clientEnsureStarted");
  if (self->_prefServerShouldRun || self->_serverBonjourInfraPairing)
    -[RPCompanionLinkDaemon _serverEnsureStarted](self, "_serverEnsureStarted");
  else
    -[RPCompanionLinkDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
  v19 = v17 ^ 1;
  if (!self->_prefHIDEnabled)
    v19 = 1;
  if ((v19 & 1) != 0)
    -[RPCompanionLinkDaemon _hidEnsureStopped](self, "_hidEnsureStopped");
  else
    -[RPCompanionLinkDaemon _hidEnsureStarted](self, "_hidEnsureStarted");
  v20 = v17 ^ 1;
  if (!self->_prefMediaControlEnabled)
    v20 = 1;
  if ((v20 & 1) != 0)
    -[RPCompanionLinkDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
  else
    -[RPCompanionLinkDaemon _mediaControlEnsureStarted](self, "_mediaControlEnsureStarted");
  if (self->_prefClientEnabled || self->_prefServerEnabled)
    -[RPCompanionLinkDaemon _miscEnsureStarted](self, "_miscEnsureStarted");
  else
    -[RPCompanionLinkDaemon _miscEnsureStopped](self, "_miscEnsureStopped");
  v21 = v17 ^ 1;
  if (!self->_prefSiriEnabled)
    v21 = 1;
  if ((v21 & 1) != 0)
    -[RPCompanionLinkDaemon _siriEnsureStopped](self, "_siriEnsureStopped");
  else
    -[RPCompanionLinkDaemon _siriEnsureStarted](self, "_siriEnsureStarted");
  -[RPCompanionLinkDaemon _clientSendActivityLevelOverWiFiIfNecessary](self, "_clientSendActivityLevelOverWiFiIfNecessary");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  if (self->_prefIPEnabled)
    v22 = v17;
  else
    v22 = 0;
  if ((v22 & 1) == 0)
  {
    -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0;

  }
}

- (void)_updateAssertions
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  OS_os_transaction *osTransaction;
  CUWiFiManager *wifiManager;
  CUWiFiManager *v8;
  CUWiFiManager *v9;
  CUWiFiManager **p_wifiManager;
  uint64_t v11;
  OS_os_transaction *v12;
  OS_os_transaction *v13;

  if (!self->_prefClientEnabled && !self->_prefServerEnabled && !self->_prefBTPipeEnabled)
    goto LABEL_7;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  if (objc_msgSend(v3, "sigTermPending"))
  {

    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  v5 = objc_msgSend(v4, "languageChangePending");

  if ((v5 & 1) != 0)
  {
LABEL_7:
    if (self->_osTransaction)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateAssertions]", 30, "OS transaction stop\n");
      }
      osTransaction = self->_osTransaction;
      self->_osTransaction = 0;

    }
    goto LABEL_17;
  }
  if (!self->_osTransaction)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateAssertions]", 30, "OS transaction start\n");
    }
    v12 = (OS_os_transaction *)os_transaction_create(off_100130260);
    v13 = self->_osTransaction;
    self->_osTransaction = v12;

    if (!self->_osTransaction
      && dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateAssertions]", 90, "### Create transaction failed\n");
    }
  }
LABEL_17:
  if (!-[NSMutableDictionary count](self->_tcpClientConnections, "count")
    && !-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")
    && !-[NSMutableSet count](self->_tcpServerConnections, "count"))
  {
    if (!-[CUWiFiManager wakeOnWirelessEnabled](self->_wifiManager, "wakeOnWirelessEnabled"))
      return;
    v11 = 0;
    p_wifiManager = &self->_wifiManager;
LABEL_25:
    -[CUWiFiManager setWakeOnWirelessEnabled:](*p_wifiManager, "setWakeOnWirelessEnabled:", v11);
    return;
  }
  wifiManager = self->_wifiManager;
  if (!wifiManager)
  {
    v8 = (CUWiFiManager *)objc_alloc_init((Class)CUWiFiManager);
    v9 = self->_wifiManager;
    self->_wifiManager = v8;

    -[CUWiFiManager setDispatchQueue:](self->_wifiManager, "setDispatchQueue:", self->_dispatchQueue);
    -[CUWiFiManager setLabel:](self->_wifiManager, "setLabel:", CFSTR("CLink"));
    -[CUWiFiManager activateWithCompletion:](self->_wifiManager, "activateWithCompletion:", 0);
    wifiManager = self->_wifiManager;
  }
  if ((-[CUWiFiManager wakeOnWirelessEnabled](wifiManager, "wakeOnWirelessEnabled") & 1) == 0)
  {
    p_wifiManager = &self->_wifiManager;
    v11 = 1;
    goto LABEL_25;
  }
}

- (void)_siriEnsureStopped
{
  RPSiriDaemon *siriDaemon;

  if (self->_siriDaemon)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _siriEnsureStopped]", 30, "Siri daemon stop\n");
    }
    -[RPSiriDaemon invalidate](self->_siriDaemon, "invalidate");
    siriDaemon = self->_siriDaemon;
    self->_siriDaemon = 0;

  }
}

- (void)_serverTCPEnsureStopped
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  CUTCPServer *tcpServer;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_tcpServer)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverTCPEnsureStopped]", 30, "TCP server stop\n");
    }
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_tcpServerConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v9);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_tcpServerConnections, "removeAllObjects");
    -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
    tcpServer = self->_tcpServer;
    self->_tcpServer = 0;

  }
}

- (void)_serverEnsureStopped
{
  -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStopped](self, "_serverBLENeedsCLinkScannerEnsureStopped");
  -[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryEnsureStopped](self, "_serverNearbyActionV2DiscoveryEnsureStopped");
  -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStopped](self, "_serverBonjourAWDLAdvertiserEnsureStopped");
  -[RPCompanionLinkDaemon _serverBonjourEnsureStopped](self, "_serverBonjourEnsureStopped");
  -[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStopped](self, "_serverBTAddressMonitorEnsureStopped");
  -[RPCompanionLinkDaemon _serverTCPEnsureStopped](self, "_serverTCPEnsureStopped");
}

- (void)_serverNearbyActionV2DiscoveryEnsureStopped
{
  RPNearbyActionV2Discovery *bleNearbyActionV2Discovery;
  RPNearbyActionV2Discovery *v4;

  bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
  if (bleNearbyActionV2Discovery)
  {
    -[RPNearbyActionV2Discovery invalidate](bleNearbyActionV2Discovery, "invalidate");
    v4 = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = 0;

  }
}

- (void)_serverBonjourEnsureStopped
{
  CUBonjourAdvertiser *bonjourAdvertiser;

  if (self->_bonjourAdvertiser)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourEnsureStopped]", 30, "Bonjour advertiser stop\n");
    }
    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = 0;

  }
}

- (void)_serverBonjourAWDLAdvertiserEnsureStopped
{
  CUBonjourAdvertiser *bonjourAWDLAdvertiser;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  CUBonjourAdvertiser *v8;
  NSData *deviceAWDLRandomID;

  bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
  if (bonjourAWDLAdvertiser)
  {
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 != -1
        || (v6 = _LogCategory_Initialize(&dword_100130248, 30),
            bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser,
            v6))
      {
        v4 = CUDescriptionWithLevel(bonjourAWDLAdvertiser, 30);
        v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStopped]", 30, "Bonjour AWDL advertiser stop: %@\n", v5);

        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
      }
    }
    -[CUBonjourAdvertiser invalidate](bonjourAWDLAdvertiser, "invalidate");
    if (!self->_bonjourBrowserAWDL)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
      objc_msgSend(v7, "invalidateForClient:", CFSTR("Ensemble"));

    }
    v8 = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = 0;

    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;

  }
}

- (void)_serverBTAddressMonitorEnsureStopped
{
  CUSystemMonitor *btAdvAddrMonitor;

  if (self->_btAdvAddrMonitor)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStopped]", 30, "BT address monitor stop\n");
    }
    -[CUSystemMonitor invalidate](self->_btAdvAddrMonitor, "invalidate");
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = 0;

  }
}

- (void)_serverBLENeedsCLinkScannerEnsureStopped
{
  SFDeviceDiscovery *bleNeedsCLinkScanner;
  NSObject *pendingLostNeedsCLinkDevicesTimer;
  OS_dispatch_source *v5;

  if (self->_bleNeedsCLinkScanner)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStopped]", 30, "BLE NeedsCLink scanner stop ID %u\n", self->_bleNeedsCLinkScannerID);
    }
    -[SFDeviceDiscovery invalidate](self->_bleNeedsCLinkScanner, "invalidate");
    bleNeedsCLinkScanner = self->_bleNeedsCLinkScanner;
    self->_bleNeedsCLinkScanner = 0;

    ++self->_bleNeedsCLinkScannerID;
    -[NSMutableDictionary removeAllObjects](self->_bleNeedsCLinkDevices, "removeAllObjects");
    pendingLostNeedsCLinkDevicesTimer = self->_pendingLostNeedsCLinkDevicesTimer;
    if (pendingLostNeedsCLinkDevicesTimer)
    {
      dispatch_source_cancel(pendingLostNeedsCLinkDevicesTimer);
      v5 = self->_pendingLostNeedsCLinkDevicesTimer;
      self->_pendingLostNeedsCLinkDevicesTimer = 0;

    }
  }
}

- (void)_reachabilityEnsureStarted
{
  CUNetLinkManager *v3;
  CUNetLinkManager *netLinkManager;

  if (!self->_netLinkManager)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _reachabilityEnsureStarted]", 30, "Reachability start\n");
    }
    v3 = (CUNetLinkManager *)objc_alloc_init((Class)CUNetLinkManager);
    netLinkManager = self->_netLinkManager;
    self->_netLinkManager = v3;

    -[CUNetLinkManager setDispatchQueue:](self->_netLinkManager, "setDispatchQueue:", self->_dispatchQueue);
    -[CUNetLinkManager setLabel:](self->_netLinkManager, "setLabel:", CFSTR("CLink"));
    -[CUNetLinkManager activate](self->_netLinkManager, "activate");
  }
}

- (void)_miscEnsureStarted
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  const __CFString *v9;
  _UNKNOWN **v10;
  const __CFString *v11;
  _UNKNOWN **v12;

  if (!self->_miscStarted)
  {
    v11 = CFSTR("statusFlags");
    v12 = &off_10011A9F8;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _miscEnsureStarted]", 30, "== Registering for _launchApp request\n");
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000308C4;
    v8[3] = &unk_100111BF8;
    v8[4] = self;
    -[RPCompanionLinkDaemon registerRequestID:options:handler:](self, "registerRequestID:options:handler:", CFSTR("_launchApp"), v3, v8);
    if (self->_prefCommunal)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000308D0;
      v7[3] = &unk_100111BF8;
      v7[4] = self;
      -[RPCompanionLinkDaemon registerRequestID:options:handler:](self, "registerRequestID:options:handler:", CFSTR("_speak"), v3, v7);
    }
    v9 = CFSTR("statusFlags");
    v10 = &off_10011AA10;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000308DC;
    v6[3] = &unk_100111E28;
    v6[4] = self;
    -[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:](self, "_registerConnectionRequestID:options:handler:", CFSTR("_sessionStart"), v4, v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000308EC;
    v5[3] = &unk_100111E28;
    v5[4] = self;
    -[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:](self, "_registerConnectionRequestID:options:handler:", CFSTR("_sessionStop"), v4, v5);
    self->_miscStarted = 1;

  }
}

- (void)_mediaControlEnsureStopped
{
  RPMediaControlDaemon *mediaControlDaemon;

  if (self->_mediaControlDaemon)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaControlEnsureStopped]", 30, "MediaControl daemon stop\n");
    }
    -[RPMediaControlDaemon invalidate](self->_mediaControlDaemon, "invalidate");
    mediaControlDaemon = self->_mediaControlDaemon;
    self->_mediaControlDaemon = 0;

  }
}

- (void)_hidEnsureStopped
{
  RPHIDDaemon *hidDaemon;

  if (self->_hidDaemon)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _hidEnsureStopped]", 30, "HID daemon stop\n");
    }
    -[RPHIDDaemon invalidate](self->_hidDaemon, "invalidate");
    hidDaemon = self->_hidDaemon;
    self->_hidDaemon = 0;

  }
}

- (void)_duetSyncEnsureStarted
{
  SFClient *v3;
  SFClient *duetSyncClient;

  if (!self->_duetSyncClient)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _duetSyncEnsureStarted]", 30, "DuetSync advertiser start\n");
    }
    v3 = (SFClient *)objc_alloc_init(off_1001302C8());
    duetSyncClient = self->_duetSyncClient;
    self->_duetSyncClient = v3;

    -[SFClient setDispatchQueue:](self->_duetSyncClient, "setDispatchQueue:", self->_dispatchQueue);
    -[SFClient activateAssertionWithIdentifier:](self->_duetSyncClient, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.DuetSync"));
  }
}

- (void)_clientSendActivityLevelOverWiFiIfNecessary
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  _BYTE v26[128];

  if (-[RPCompanionLinkDaemon _shouldSendActivityLevelOverWiFi](self, "_shouldSendActivityLevelOverWiFi"))
  {
    v3 = -[RPCompanionLinkDevice activityLevel](self->_localDeviceInfo, "activityLevel");
    if ((_DWORD)v3 != self->_lastSentActivityLevelOverWiFi)
    {
      v4 = v3;
      v5 = objc_alloc_init((Class)NSMutableSet);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceArray"));

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100029C18;
      v24[3] = &unk_100111AB8;
      v24[4] = self;
      v8 = v5;
      v25 = v8;
      v18 = v7;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
            v19 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:](self, "findConnectedDeviceForIdentifier:controlFlags:cnx:", v14, 0x400000, &v19));
            if (v15
              && (objc_msgSend(v19, "linkType") == 6
               || objc_msgSend(v19, "linkType") == 8
               || objc_msgSend(v19, "linkType") == 7))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("_actLvl"));

              objc_msgSend(v19, "sendEncryptedEventID:event:options:completion:", CFSTR("_systemInfoUpdate"), v16, 0, &stru_100111AD8);
            }
            self->_lastSentActivityLevelOverWiFi = (int)v4;

            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        }
        while (v11);
      }

    }
  }
}

- (BOOL)_shouldSendActivityLevelOverWiFi
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableString);
  if (self->_prefSendActLvlInfra)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _shouldSendActivityLevelOverWiFi]", 30, "Sending activity levels to phone over infra wifi changed from %s -> %s. Clients: %@", "yes", "no", v3);
    }
    self->_prefSendActLvlInfra = 0;
  }

  return 0;
}

- (void)_clientEnsureStarted
{
  if (self->_prefBLEClient || self->_bleDiscoveryForce)
    -[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted](self, "_clientBLEDiscoveryEnsureStarted");
  else
    -[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStopped](self, "_clientBLEDiscoveryEnsureStopped");
  if (-[RPCompanionLinkDaemon _clientBLEActionDiscoveryShouldRun](self, "_clientBLEActionDiscoveryShouldRun"))
    -[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted](self, "_clientBLEActionDiscoveryEnsureStarted");
  else
    -[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStopped](self, "_clientBLEActionDiscoveryEnsureStopped");
  if (self->_prefIPEnabled)
    -[RPCompanionLinkDaemon _clientBonjourEnsureStarted](self, "_clientBonjourEnsureStarted");
  else
    -[RPCompanionLinkDaemon _clientBonjourEnsureStopped](self, "_clientBonjourEnsureStopped");
  if (-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserShouldRun](self, "_clientBLENeedsCLinkAdvertiserShouldRun"))
    -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted](self, "_clientBLENeedsCLinkAdvertiserEnsureStarted");
  else
    -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped](self, "_clientBLENeedsCLinkAdvertiserEnsureStopped");
  if (-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserShouldRun](self, "_clientBLENearbyActionV2AdvertiserShouldRun"))
  {
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted](self, "_clientBLENearbyActionV2AdvertiserEnsureStarted");
  }
  else
  {
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped](self, "_clientBLENearbyActionV2AdvertiserEnsureStopped");
  }
  if (-[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryShouldRun](self, "_serverNearbyInfoV2DiscoveryShouldRun"))
    -[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStarted](self, "_serverNearbyInfoV2DiscoveryEnsureStarted");
  else
    -[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStopped](self, "_serverNearbyInfoV2DiscoveryEnsureStopped");
  if (-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserShouldRun](self, "_clientBonjourAWDLBrowserShouldRun"))
    -[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStarted](self, "_clientBonjourAWDLBrowserEnsureStarted");
  else
    -[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStopped](self, "_clientBonjourAWDLBrowserEnsureStopped");
}

- (BOOL)_serverNearbyInfoV2DiscoveryShouldRun
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  int DeviceClass;
  _BOOL4 v8;

  if (_os_feature_enabled_impl("Sharing", "AskToAirDrop"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identitiesOfType:error:", 15, 0));

    v5 = objc_msgSend(v4, "count");
    if (v5
      && ((DeviceClass = GestaltGetDeviceClass(v5, v6), DeviceClass == 1) || DeviceClass == 100 || DeviceClass == 3))
    {
      v8 = (BYTE5(self->_bleDiscoveryControlFlags) >> 5) & 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)_serverNearbyInfoV2DiscoveryEnsureStopped
{
  RPNearbyInfoV2Discovery *bleNearbyInfoV2Discovery;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->_bleNearbyInfoV2Discovery)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStopped]", 30, "Stopping NearbyInfoV2 discovery");
    }
    -[RPNearbyInfoV2Discovery invalidate](self->_bleNearbyInfoV2Discovery, "invalidate");
    bleNearbyInfoV2Discovery = self->_bleNearbyInfoV2Discovery;
    self->_bleNearbyInfoV2Discovery = 0;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_nearbyInfoV2Devices, "allKeys", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyInfoV2Devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)));
          v10 = v9;
          if (v9)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbDevice"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDeviceIdentifier"));
            -[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:](self, "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:", v11, v12, 1, 4);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
}

- (void)_clientBonjourEnsureStarted
{
  CUBonjourBrowser *v3;
  CUBonjourBrowser *bonjourBrowser;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_bonjourBrowser)
  {
    if (self->_btAdvAddrData || !self->_prefServerShouldRun)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourEnsureStarted]", 30, "Bonjour browser start\n");
      }
      v3 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
      bonjourBrowser = self->_bonjourBrowser;
      self->_bonjourBrowser = v3;

      -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowser, "setChangeFlags:", 0xFFFFFFFFLL);
      -[CUBonjourBrowser setControlFlags:](self->_bonjourBrowser, "setControlFlags:", 1);
      -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowser, "setDispatchQueue:", self->_dispatchQueue);
      -[CUBonjourBrowser setDomain:](self->_bonjourBrowser, "setDomain:", CFSTR("local."));
      -[CUBonjourBrowser setLabel:](self->_bonjourBrowser, "setLabel:", CFSTR("CLink"));
      -[CUBonjourBrowser setServiceType:](self->_bonjourBrowser, "setServiceType:", CFSTR("_companion-link._tcp"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000208DC;
      v7[3] = &unk_1001118D8;
      v7[4] = self;
      -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowser, "setDeviceFoundHandler:", v7);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000208F8;
      v6[3] = &unk_1001118D8;
      v6[4] = self;
      -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowser, "setDeviceLostHandler:", v6);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100020910;
      v5[3] = &unk_100111900;
      v5[4] = self;
      -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowser, "setDeviceChangedHandler:", v5);
      -[CUBonjourBrowser activate](self->_bonjourBrowser, "activate");
    }
    else if (dword_100130248 <= 20
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourEnsureStarted]", 20, "Deferring Bonjour browse without BT addr\n");
    }
  }
}

- (BOOL)_clientBonjourAWDLBrowserShouldRun
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_bonjourBrowserAWDLForce)
    return 1;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_xpcConnections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "needsCLink", (_QWORD)v12) & 1) != 0
          || objc_msgSend(v8, "needsNearbyActionV2"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
          v10 = objc_msgSend(v9, "controlFlags");

          if ((v10 & 0x400000) == 0)
          {

            return 1;
          }
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  return -[RPCompanionLinkDaemon _haveActiveClientConnectionsOnAWDL](self, "_haveActiveClientConnectionsOnAWDL");
}

- (BOOL)_haveActiveClientConnectionsOnAWDL
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_tcpOnDemandClientConnections, "allValues", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "state") == 1 && objc_msgSend(v6, "linkType") == 4)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)_clientBonjourAWDLBrowserEnsureStopped
{
  CUBonjourBrowser *bonjourBrowserAWDL;
  NSMutableDictionary *bonjourAWDLDevices;
  NSMutableDictionary *authenticatedAWDLPairingModeDevices;
  id v6;

  if (self->_bonjourBrowserAWDL)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStopped]", 30, "Bonjour AWDL browser stop\n");
    }
    -[CUBonjourBrowser invalidate](self->_bonjourBrowserAWDL, "invalidate");
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = 0;

    -[NSMutableDictionary removeAllObjects](self->_bonjourAWDLDevices, "removeAllObjects");
    bonjourAWDLDevices = self->_bonjourAWDLDevices;
    self->_bonjourAWDLDevices = 0;

    -[NSMutableDictionary removeAllObjects](self->_authenticatedAWDLPairingModeDevices, "removeAllObjects");
    authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
    self->_authenticatedAWDLPairingModeDevices = 0;

    if (!self->_needsAWDLTransaction && !self->_bonjourAWDLAdvertiser)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
      objc_msgSend(v6, "invalidateForClient:", CFSTR("Ensemble"));

    }
  }
}

- (BOOL)_clientBLENeedsCLinkAdvertiserShouldRun
{
  NSMutableSet *v2;
  id v3;
  id v4;
  char v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "needsCLink"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "netCnx"));
          v11 = objc_msgSend(v10, "state");

          if (v11 != 1)
          {
            if (GestaltGetDeviceClass(v12, v13) == 1)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "client"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serviceType"));
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ApplicationService.chrono")) & 1) != 0)
              {
                LOBYTE(v16) = 1;
              }
              else
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "client"));
                v16 = ((unint64_t)objc_msgSend(v17, "controlFlags") >> 51) & 1;

              }
            }
            else
            {
              LOBYTE(v16) = 0;
            }
            v5 |= v16;
            v6 = 1;
          }
        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  self->_bleNeedsCLinkAdvertiserScreenOff = v5 & 1;
  return v6 & 1;
}

- (void)_clientBLENeedsCLinkAdvertiserEnsureStopped
{
  SFService *bleNeedsCLinkAdvertiser;
  RPCompanionLinkDevice *bleNeedsCLinkDevice;

  if (self->_bleNeedsCLinkAdvertiser)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped]", 30, "BLE NeedsCLink advertiser stop\n");
    }
    -[RPCompanionLinkDaemon _clientPurgeUnauthAWDLDevices](self, "_clientPurgeUnauthAWDLDevices");
    -[SFService invalidate](self->_bleNeedsCLinkAdvertiser, "invalidate");
    bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
    self->_bleNeedsCLinkAdvertiser = 0;

    bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
    self->_bleNeedsCLinkDevice = 0;

    -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0);
  }
}

- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun
{
  NSMutableSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "needsNearbyActionV2", (_QWORD)v11))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "netCnx"));
          v8 = objc_msgSend(v7, "state");

          if (v8 != 1)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bonjourDevice"));

            if (!v9)
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped
{
  RPNearbyActionV2Advertiser *bleNearbyActionV2Advertiser;
  RPNearbyActionV2Advertiser *v4;
  RPCompanionLinkDevice *bleNearbyActionV2Device;

  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser)
  {
    -[RPNearbyActionV2Advertiser invalidate](bleNearbyActionV2Advertiser, "invalidate");
    v4 = self->_bleNearbyActionV2Advertiser;
    self->_bleNearbyActionV2Advertiser = 0;

    bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    self->_bleNearbyActionV2Device = 0;

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped]", 30, "BLE NearbyActionV2 advertiser stopped\n");
    }
    -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0);
  }
}

- (BOOL)_clientBLEActionDiscoveryShouldRun
{
  unint64_t bleDiscoveryControlFlags;
  BOOL v3;

  bleDiscoveryControlFlags = self->_bleDiscoveryControlFlags;
  v3 = (bleDiscoveryControlFlags & (unint64_t)&_mh_execute_header) != 0
    || (bleDiscoveryControlFlags & 0x2000000000) != 0;
  return bleDiscoveryControlFlags && v3;
}

- (void)_clientBLEActionDiscoveryEnsureStarted
{
  SFDeviceDiscovery *bleActionDiscovery;
  SFDeviceDiscovery *v4;
  unsigned int bleActionDiscoveryID;
  SFDeviceDiscovery *v6;
  SFDeviceDiscovery *v7;
  uint64_t v8;
  SFDeviceDiscovery *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  unsigned int v12;
  _QWORD v13[5];
  unsigned int v14;
  _QWORD v15[5];
  unsigned int v16;
  _QWORD v17[5];
  unsigned int v18;

  bleActionDiscovery = self->_bleActionDiscovery;
  v4 = bleActionDiscovery;
  if (!bleActionDiscovery)
  {
    bleActionDiscoveryID = self->_bleActionDiscoveryID;
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted]", 30, "BLE action discovery start ID %u\n", bleActionDiscoveryID);
    }
    v6 = (SFDeviceDiscovery *)objc_alloc_init(off_1001302B8());
    v7 = self->_bleActionDiscovery;
    self->_bleActionDiscovery = v6;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_bleActionDiscovery, "setPurpose:", CFSTR("CLink"));
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleActionDiscovery, "setRssiThreshold:", -60);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001E2FC;
    v17[3] = &unk_1001117E8;
    v17[4] = self;
    v18 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleActionDiscovery, "setDeviceFoundHandler:", v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001E324;
    v15[3] = &unk_1001117E8;
    v15[4] = self;
    v16 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleActionDiscovery, "setDeviceLostHandler:", v15);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001E350;
    v13[3] = &unk_100111810;
    v13[4] = self;
    v14 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleActionDiscovery, "setDeviceChangedHandler:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001E378;
    v11[3] = &unk_100111838;
    v11[4] = self;
    v12 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleActionDiscovery, "setInterruptionHandler:", v11);
    v4 = self->_bleActionDiscovery;
  }
  if ((self->_bleDiscoveryControlFlags & 0x382000103C00) != 0)
    v8 = 16;
  else
    v8 = 48;
  if ((id)v8 != -[SFDeviceDiscovery discoveryFlags](v4, "discoveryFlags"))
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleActionDiscovery, "setDiscoveryFlags:", v8);
  if (!bleActionDiscovery)
  {
    v9 = self->_bleActionDiscovery;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001E40C;
    v10[3] = &unk_100111860;
    v10[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v10);
  }
}

- (void)_btPipeEnsureStarted
{
  id v3;
  uint64_t v4;
  CUBluetoothScalablePipe *v5;
  CUBluetoothScalablePipe *btPipe;
  CUBluetoothScalablePipe *v7;
  CUBluetoothScalablePipe *btPipeHighPriority;
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[5];
  _QWORD v13[5];
  const __CFString *v14;
  _UNKNOWN **v15;

  v3 = -[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked");
  if ((v3 & 1) != 0)
  {
    if (!self->_btPipe)
    {
      v5 = (CUBluetoothScalablePipe *)objc_alloc_init((Class)CUBluetoothScalablePipe);
      btPipe = self->_btPipe;
      self->_btPipe = v5;

      -[CUBluetoothScalablePipe setIdentifier:](self->_btPipe, "setIdentifier:", CFSTR("CLink"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10002B8D0;
      v13[3] = &unk_1001110F8;
      v13[4] = self;
      -[CUBluetoothScalablePipe setPeerHostStateChangedHandler:](self->_btPipe, "setPeerHostStateChangedHandler:", v13);
      v3 = -[RPCompanionLinkDaemon _btPipeSetup:withPriority:](self, "_btPipeSetup:withPriority:", self->_btPipe, 2);
    }
    if (!self->_btPipeHighPriority)
    {
      v7 = (CUBluetoothScalablePipe *)objc_alloc_init((Class)CUBluetoothScalablePipe);
      btPipeHighPriority = self->_btPipeHighPriority;
      self->_btPipeHighPriority = v7;

      -[CUBluetoothScalablePipe setIdentifier:](self->_btPipeHighPriority, "setIdentifier:", CFSTR("CLinkHP"));
      v3 = -[RPCompanionLinkDaemon _btPipeSetup:withPriority:](self, "_btPipeSetup:withPriority:", self->_btPipeHighPriority, 3);
    }
    if (GestaltGetDeviceClass(v3, v4) == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      if ((objc_msgSend(v9, "idsHasWatch") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", CFSTR("_ctxtColl")));
        if (v10)
        {

        }
        else
        {
          v11 = _os_feature_enabled_impl("Rapport", "WatchWiFiDiscovery");

          if (!v11)
            return;
          v14 = CFSTR("statusFlags");
          v15 = &off_10011A9F8;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_10002B97C;
          v12[3] = &unk_100111BF8;
          v12[4] = self;
          -[RPCompanionLinkDaemon registerRequestID:options:handler:](self, "registerRequestID:options:handler:", CFSTR("_ctxtColl"), v9, v12);
        }
      }

    }
  }
  else if (dword_100130248 <= 30
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeEnsureStarted]", 30, "Deferring BTPipe start until FirstUnlock\n");
  }
}

- (void)_bleServerEnsureStarted
{
  CUBLEServer *v3;
  CUBLEServer *bleServer;
  CUBLEServer *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_bleServer)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _bleServerEnsureStarted]", 30, "BLE server start\n");
    }
    v3 = (CUBLEServer *)objc_alloc_init((Class)CUBLEServer);
    bleServer = self->_bleServer;
    self->_bleServer = v3;

    -[CUBLEServer setDispatchQueue:](self->_bleServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBLEServer setLabel:](self->_bleServer, "setLabel:", CFSTR("CLink"));
    -[CUBLEServer setListenPSM:](self->_bleServer, "setListenPSM:", 129);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002AF54;
    v7[3] = &unk_100111BD0;
    v7[4] = self;
    -[CUBLEServer setConnectionStartedHandler:](self->_bleServer, "setConnectionStartedHandler:", v7);
    v5 = self->_bleServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002AF60;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[CUBLEServer activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)_clientShouldFindNonSameAccountDevices
{
  int DeviceClass;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  if (DeviceClass == 1)
  {
LABEL_4:
    if (self->_inDiscoverySession)
      goto LABEL_5;
    return 0;
  }
  if (DeviceClass != 4)
  {
    if (DeviceClass != 3)
      return 0;
    goto LABEL_4;
  }
LABEL_5:
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identitiesOfType:error:", 12, 0));

  if (objc_msgSend(v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identitiesOfType:error:", 13, 0));

    v6 = objc_msgSend(v8, "count") != 0;
  }

  return v6;
}

+ (id)sharedCompanionLinkDaemon
{
  if (qword_100131F50 != -1)
    dispatch_once(&qword_100131F50, &stru_1001112C0);
  return (id)qword_100131F48;
}

- (RPCompanionLinkDaemon)init
{
  RPCompanionLinkDaemon *v2;
  RPCompanionLinkDaemon *v3;
  RPCompanionLinkDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPCompanionLinkDaemon;
  v2 = -[RPCompanionLinkDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_coreDeviceChangedNotifier = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_needsPrimaryAppleIDUpdate = 1;
    -[RPCompanionLinkDaemon _createDestinationIdentifierMaps](v3, "_createDestinationIdentifierMaps");
    RandomBytes(&v3->_sessionIDLast, 4);
    RandomBytes(&v3->_loopbackXid, 4);
    v4 = v3;
  }

  return v3;
}

- (void)_createDestinationIdentifierMaps
{
  NSDictionary *v3;
  NSDictionary *destinationIdentifierModelMap;
  NSDictionary *v5;
  NSDictionary *destinationIdentifierRelMap;
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[7];
  _QWORD v10[7];

  v9[0] = CFSTR("rapport:rdid:ModelAppleTV");
  v9[1] = CFSTR("rapport:rdid:ModelAppleTV");
  v10[0] = &stru_100111300;
  v10[1] = &stru_100111320;
  v9[2] = CFSTR("rapport:rdid:ModelAppleTV");
  v9[3] = CFSTR("rapport:rdid:ModelAppleTV");
  v10[2] = &stru_100111340;
  v10[3] = &stru_100111360;
  v9[4] = CFSTR("rapport:rdid:ModelAppleTV");
  v9[5] = CFSTR("rapport:rdid:ModelAppleTV");
  v10[4] = &stru_100111380;
  v10[5] = &stru_1001113A0;
  v9[6] = CFSTR("rapport:rdid:ModelAppleTV");
  v10[6] = &stru_1001113C0;
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 7));
  destinationIdentifierModelMap = self->_destinationIdentifierModelMap;
  self->_destinationIdentifierModelMap = v3;

  v7[0] = CFSTR("rapport:rdid:RelationMyiCloud");
  v7[1] = CFSTR("rapport:rdid:RelationFamily");
  v8[0] = &stru_100111400;
  v8[1] = &stru_100111420;
  v7[2] = CFSTR("rapport:rdid:RelationFriend");
  v7[3] = CFSTR("rapport:rdid:RelationSharedHome");
  v8[2] = &stru_100111440;
  v8[3] = &stru_100111460;
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  destinationIdentifierRelMap = self->_destinationIdentifierRelMap;
  self->_destinationIdentifierRelMap = v5;

}

- (id)findServerClientFromID:(id)a3 senderIDS:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon findServerClientFromID:senderIDS:]", 30, "findServerClientFromID: deviceID=%@, senderIDS=%@\n", v6, v7);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10000F988;
  v20 = sub_10000F950;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000189BC;
  v12[3] = &unk_100111488;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)findDeviceFromID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10000F988;
  v14 = sub_10000F950;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018D38;
  v9[3] = &unk_1001114B0;
  v9[4] = &v10;
  -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:](self, "_forEachMatchingDestinationID:handler:", v4, v9);
  v5 = (void *)v11[5];
  if (v5)
  {
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 30))
          goto LABEL_11;
        v5 = (void *)v11[5];
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon findDeviceFromID:]", 30, "Found match for deviceID='%@', returning device='%@'\n", v4, v6);

    }
  }
  else if (dword_100130248 <= 30
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon findDeviceFromID:]", 30, "Failed to find matching device for deviceID='%@'\n", v4);
  }
LABEL_11:
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  id *v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeID TypeID;
  uint64_t TypedValue;
  id *v16;
  const char *v17;
  id *v18;
  const char *v19;
  id *v20;
  const char *v21;
  void *v22;
  id *v23;
  const char *v24;
  void *v25;
  id *v26;
  id *v27;
  const char *v28;
  void *v29;
  id *v30;
  const char *v31;
  void *v32;
  id *v33;
  const char *v34;
  void *v35;
  id *v36;
  id *v37;
  id *v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  SFDeviceDiscovery *v44;
  SFDeviceDiscovery *v45;
  id *v46;
  uint64_t v47;
  void *v48;
  SFService *v49;
  SFService *v50;
  id *v51;
  uint64_t v52;
  void *v53;
  SFDeviceDiscovery *v54;
  SFDeviceDiscovery *v55;
  id *v56;
  uint64_t v57;
  void *v58;
  NSMutableDictionary *bleNeedsCLinkDevices;
  RPNearbyActionV2Advertiser *v60;
  RPNearbyActionV2Advertiser *v61;
  id *v62;
  RPNearbyActionV2Discovery *v63;
  RPNearbyActionV2Discovery *v64;
  id *v65;
  RPNearbyInfoV2Discovery *v66;
  RPNearbyInfoV2Discovery *v67;
  id *v68;
  id *v69;
  CUBonjourAdvertiser *v70;
  CUBonjourAdvertiser *v71;
  id *v72;
  uint64_t v73;
  void *v74;
  CUBonjourAdvertiser *v75;
  CUBonjourAdvertiser *v76;
  id *v77;
  uint64_t v78;
  void *v79;
  id *v80;
  CUBonjourBrowser *v81;
  CUBonjourBrowser *v82;
  id *v83;
  uint64_t v84;
  void *v85;
  CUBonjourBrowser *v86;
  CUBonjourBrowser *v87;
  id *v88;
  uint64_t v89;
  void *v90;
  id *v91;
  CUBluetoothScalablePipe *v92;
  CUBluetoothScalablePipe *v93;
  id *v94;
  CUBluetoothScalablePipe *v95;
  CUBluetoothScalablePipe *v96;
  id *v97;
  CUNetLinkManager *v98;
  CUNetLinkManager *v99;
  id *v100;
  uint64_t v101;
  void *v102;
  CUTCPServer *v103;
  CUTCPServer *v104;
  id *v105;
  CUTCPServer *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id *v113;
  _BOOL8 v114;
  char *v115;
  id v116;
  char *v117;
  id *v118;
  RPConnection *btPipeConnection;
  id *v120;
  uint64_t v121;
  void *v122;
  NSMutableDictionary *tcpClientConnections;
  NSMutableDictionary *tcpOnDemandClientConnections;
  NSMutableDictionary *bleClientConnections;
  char *v126;
  char *v127;
  id *v128;
  NSMutableSet *v129;
  id v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  id *v134;
  uint64_t v135;
  void *v136;
  NSMutableSet *v137;
  id v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  id *v142;
  uint64_t v143;
  void *v144;
  RPConnection *personalCnx;
  id *v146;
  uint64_t v147;
  void *v148;
  RPConnection *stereoCnx;
  id *v150;
  uint64_t v151;
  void *v152;
  id v153;
  id v154;
  id *v155;
  NSMutableDictionary *unauthDevices;
  id v157;
  id v158;
  id *v159;
  NSMutableDictionary *bleDevices;
  id v161;
  id v162;
  id *v163;
  NSMutableDictionary *nearbyInfoV2Devices;
  id v165;
  id v166;
  id *v167;
  NSMutableDictionary *pairedDevices;
  id v169;
  id v170;
  id *v171;
  NSMutableDictionary *homeHubDevices;
  id *v173;
  NSMutableDictionary *uiNoteDevices;
  CUUserNotificationSession *v175;
  CUUserNotificationSession *v176;
  id *v177;
  id *v178;
  NSMutableDictionary *xpcMatchingMap;
  uint64_t v180;
  id *v181;
  NSMutableDictionary *activeSessions;
  id *v183;
  NSMutableSet *v184;
  id v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  id *v189;
  uint64_t v190;
  void *v191;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  id v204;
  _QWORD v205[6];
  id v206;
  _QWORD v207[5];
  id v208;
  id v209;
  _QWORD v210[5];
  int v211;
  id v212;
  _QWORD v213[7];
  int v214;
  id v215;
  _QWORD v216[7];
  int v217;
  id v218;
  _QWORD v219[7];
  int v220;
  id v221;
  _QWORD v222[7];
  int v223;
  id v224;
  _QWORD v225[7];
  int v226;
  id v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  uint64_t v231;
  id v232;
  id v233;
  id v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  id v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  id v244;
  _QWORD v245[5];
  int v246;
  _QWORD v247[5];
  int v248;
  _QWORD v249[5];
  int v250;
  id v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  id v257;
  id v258;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id v267;
  id v268;
  id v269;
  id v270;
  _QWORD v271[5];
  int v272;
  id v273;
  id v274;
  id v275;
  id v276;
  id v277;
  id v278;
  id v279;
  id v280;
  id v281;
  id v282;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id obj;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t (*v293)(uint64_t, uint64_t);
  void (*v294)(uint64_t);
  id v295;
  _BYTE v296[128];
  _BYTE v297[128];
  _BYTE v298[128];

  if (a3 >= 21)
  {
    v4 = NSPrintF("RPCompanionLinkDaemon %{ptr}", a2, self);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    return v5;
  }
  v6 = *(_QWORD *)&a3;
  v290 = 0;
  v291 = &v290;
  v292 = 0x3032000000;
  v293 = sub_10000F988;
  v294 = sub_10000F950;
  v295 = 0;
  v7 = sub_100018154();
  v8 = (id *)(v291 + 5);
  obj = (id)v291[5];
  NSAppendPrintF(&obj, "-- RPCompanionLinkDaemon --\n");
  objc_storeStrong(v8, obj);
  v9 = (id *)(v291 + 5);
  v288 = (id)v291[5];
  v10 = mach_continuous_time();
  v11 = UpTicksToSeconds(v10 - self->_startTicksFull);
  v12 = mach_absolute_time();
  v13 = UpTicksToSeconds(v12 - self->_startTicks);
  NSAppendPrintF(&v288, "Up %ll{dur} (awake %ll{dur})", v11, v13);
  objc_storeStrong(v9, v288);
  v196 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
  v197 = (void *)WiFiCopyCurrentNetworkInfoEx(0, 0);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v197, CFSTR("ssid"), TypeID, 0);
  v195 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v16 = (id *)(v291 + 5);
  v287 = (id)v291[5];
  v17 = (const char *)sub_1000181FC((uint64_t)", Nm ", v7);
  NSAppendPrintF(&v287, v17, v196);
  objc_storeStrong(v16, v287);
  v18 = (id *)(v291 + 5);
  v286 = (id)v291[5];
  v19 = (const char *)sub_1000181FC((uint64_t)", WiFi ", v7);
  NSAppendPrintF(&v286, v19, v195);
  objc_storeStrong(v18, v286);
  v20 = (id *)(v291 + 5);
  v285 = (id)v291[5];
  v21 = (const char *)sub_1000181FC((uint64_t)", AID ", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _getAppleID](self, "_getAppleID"));
  NSAppendPrintF(&v285, v21, v22);
  objc_storeStrong(v20, v285);

  v193 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "home"));
  if (v198)
  {
    v23 = (id *)(v291 + 5);
    v284 = (id)v291[5];
    v24 = (const char *)sub_1000181FC((uint64_t)", Hm ", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "name"));
    NSAppendPrintF(&v284, v24, v25);
    objc_storeStrong(v23, v284);

  }
  if (self->_prefHomeKitEnabled)
  {
    v26 = (id *)(v291 + 5);
    v283 = (id)v291[5];
    NSAppendPrintF(&v283, ", LTPK <%.4@>", self->_homeKitLTPK);
    objc_storeStrong(v26, v283);
  }
  if (self->_prefCommunal)
  {
    v27 = (id *)(v291 + 5);
    v282 = (id)v291[5];
    v28 = (const char *)sub_1000181FC((uint64_t)", MeDev F ", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceFMFDeviceID](self->_systemMonitor, "meDeviceFMFDeviceID"));
    NSAppendPrintF(&v282, v28, v29);
    objc_storeStrong(v27, v282);

    v30 = (id *)(v291 + 5);
    v281 = (id)v291[5];
    v31 = (const char *)sub_1000181FC((uint64_t)" I ", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceIDSDeviceID](self->_systemMonitor, "meDeviceIDSDeviceID"));
    NSAppendPrintF(&v281, v31, v32);
    objc_storeStrong(v30, v281);

    v33 = (id *)(v291 + 5);
    v280 = (id)v291[5];
    v34 = (const char *)sub_1000181FC((uint64_t)" Nm ", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceName](self->_systemMonitor, "meDeviceName"));
    NSAppendPrintF(&v280, v34, v35);
    objc_storeStrong(v33, v280);

  }
  if ((int)v6 <= 10 && self->_prefHomeKitEnabled)
  {
    v36 = (id *)(v291 + 5);
    v279 = (id)v291[5];
    NSAppendPrintF(&v279, ", AT <%@>, IRK <%.4@>, RID <%@>", self->_homeKitAuthTag, self->_homeKitIRK, self->_homeKitRotatingID);
    objc_storeStrong(v36, v279);
LABEL_13:
    v37 = (id *)(v291 + 5);
    v278 = (id)v291[5];
    NSAppendPrintF(&v278, ", Nonce <%@>", self->_discoveryNonceData);
    objc_storeStrong(v37, v278);
    goto LABEL_14;
  }
  if ((int)v6 <= 10)
    goto LABEL_13;
LABEL_14:
  v38 = (id *)(v291 + 5);
  v277 = (id)v291[5];
  NSAppendPrintF(&v277, "\n");
  objc_storeStrong(v38, v277);
  if ((int)v6 >= 11)
    v39 = 50;
  else
    v39 = 0;
  v40 = (id *)(v291 + 5);
  v276 = (id)v291[5];
  v41 = CUDescriptionWithLevel(self->_localDeviceInfo, v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  NSAppendPrintF(&v276, "Self: %@\n", v42);
  objc_storeStrong(v40, v276);

  if ((int)v6 >= 11)
    v43 = 50;
  else
    v43 = 30;
  v44 = self->_bleDiscovery;
  v45 = v44;
  if (v44)
  {
    v46 = (id *)(v291 + 5);
    v275 = (id)v291[5];
    v47 = CUDescriptionWithLevel(v44, v43);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    NSAppendPrintF(&v275, "%@\n", v48);
    objc_storeStrong(v46, v275);

  }
  v49 = self->_bleNeedsCLinkAdvertiser;
  v50 = v49;
  if (v49)
  {
    v51 = (id *)(v291 + 5);
    v274 = (id)v291[5];
    v52 = CUDescriptionWithLevel(v49, v43);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    NSAppendPrintF(&v274, "%@\n", v53);
    objc_storeStrong(v51, v274);

  }
  v54 = self->_bleNeedsCLinkScanner;
  v55 = v54;
  if (v54)
  {
    v56 = (id *)(v291 + 5);
    v273 = (id)v291[5];
    v57 = CUDescriptionWithLevel(v54, v43);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    NSAppendPrintF(&v273, "%@\n", v58);
    objc_storeStrong(v56, v273);

  }
  bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
  v271[0] = _NSConcreteStackBlock;
  v271[1] = 3221225472;
  v271[2] = sub_10001A364;
  v271[3] = &unk_1001114D8;
  v271[4] = &v290;
  v272 = v43;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleNeedsCLinkDevices, "enumerateKeysAndObjectsUsingBlock:", v271);
  v60 = self->_bleNearbyActionV2Advertiser;
  v61 = v60;
  if (v60)
  {
    v62 = (id *)(v291 + 5);
    v270 = (id)v291[5];
    NSAppendPrintF(&v270, "%@\n", v60);
    objc_storeStrong(v62, v270);
  }

  v63 = self->_bleNearbyActionV2Discovery;
  v64 = v63;
  if (v63)
  {
    v65 = (id *)(v291 + 5);
    v269 = (id)v291[5];
    NSAppendPrintF(&v269, "%@\n", v63);
    objc_storeStrong(v65, v269);
  }

  v66 = self->_bleNearbyInfoV2Discovery;
  v67 = v66;
  if (v66)
  {
    v68 = (id *)(v291 + 5);
    v268 = (id)v291[5];
    NSAppendPrintF(&v268, "%@\n", v66);
    objc_storeStrong(v68, v268);
  }

  if (self->_bonjourAWDLAdvertiseForPairing)
  {
    v69 = (id *)(v291 + 5);
    v267 = (id)v291[5];
    NSAppendPrintF(&v267, "AWDL advertiser for pairing: %s", "yes");
    objc_storeStrong(v69, v267);
  }
  v70 = self->_bonjourAdvertiser;
  v71 = v70;
  if (v70)
  {
    v72 = (id *)(v291 + 5);
    v266 = (id)v291[5];
    v73 = CUDescriptionWithLevel(v70, v43);
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    NSAppendPrintF(&v266, "%@\n", v74);
    objc_storeStrong(v72, v266);

  }
  v75 = self->_bonjourAWDLAdvertiser;
  v76 = v75;
  if (v75)
  {
    v77 = (id *)(v291 + 5);
    v265 = (id)v291[5];
    v78 = CUDescriptionWithLevel(v75, v43);
    v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
    NSAppendPrintF(&v265, "%@\n", v79);
    objc_storeStrong(v77, v265);

  }
  if (self->_bonjourAWDLAdvertiserForce)
  {
    v80 = (id *)(v291 + 5);
    v264 = (id)v291[5];
    NSAppendPrintF(&v264, "Force AWDL Advertiser\n");
    objc_storeStrong(v80, v264);
  }
  v81 = self->_bonjourBrowser;
  v82 = v81;
  if (v81)
  {
    v83 = (id *)(v291 + 5);
    v263 = (id)v291[5];
    v84 = CUDescriptionWithLevel(v81, v6);
    v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    NSAppendPrintF(&v263, "%@", v85);
    objc_storeStrong(v83, v263);

  }
  v86 = self->_bonjourBrowserAWDL;
  v87 = v86;
  if (v86)
  {
    v88 = (id *)(v291 + 5);
    v262 = (id)v291[5];
    v89 = CUDescriptionWithLevel(v86, v6);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    NSAppendPrintF(&v262, "%@", v90);
    objc_storeStrong(v88, v262);

  }
  if (self->_bonjourBrowserAWDLForce)
  {
    v91 = (id *)(v291 + 5);
    v261 = (id)v291[5];
    NSAppendPrintF(&v261, "Force AWDL Browser\n");
    objc_storeStrong(v91, v261);
  }
  v92 = self->_btPipe;
  v93 = v92;
  if (v92)
  {
    v94 = (id *)(v291 + 5);
    v260 = (id)v291[5];
    NSAppendPrintF(&v260, "%@\n", v92);
    objc_storeStrong(v94, v260);
  }

  v95 = self->_btPipeHighPriority;
  v96 = v95;
  if (v95)
  {
    v97 = (id *)(v291 + 5);
    v259 = (id)v291[5];
    NSAppendPrintF(&v259, "%@\n", v95);
    objc_storeStrong(v97, v259);
  }

  v98 = self->_netLinkManager;
  v99 = v98;
  if (v98)
  {
    v100 = (id *)(v291 + 5);
    v258 = (id)v291[5];
    v101 = CUDescriptionWithLevel(v98, v6);
    v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
    NSAppendPrintF(&v258, "%@", v102);
    objc_storeStrong(v100, v258);

  }
  v103 = self->_tcpServer;
  v104 = v103;
  if (v103)
  {
    v105 = (id *)(v291 + 5);
    v257 = (id)v291[5];
    v106 = v103;
    if ((((uint64_t (*)(void))objc_opt_respondsToSelector)() & 1) != 0)
    {
      v107 = objc_claimAutoreleasedReturnValue(-[CUTCPServer detailedDescription](v106, "detailedDescription"));
    }
    else if ((objc_opt_respondsToSelector(v106, "descriptionWithLevel:") & 1) != 0)
    {
      v107 = objc_claimAutoreleasedReturnValue(-[CUTCPServer descriptionWithLevel:](v106, "descriptionWithLevel:", 20));
    }
    else
    {
      v108 = NSPrintF("%@\n", v106);
      v107 = objc_claimAutoreleasedReturnValue(v108);
    }
    v109 = (void *)v107;

    NSAppendPrintF(&v257, "%@", v109);
    objc_storeStrong(v105, v257);

  }
  if (self->_hidDaemon)
  {
    v256 = 0;
    NSAppendPrintF(&v256, " HID");
    v110 = v256;
  }
  else
  {
    v110 = 0;
  }
  if (self->_mediaControlDaemon)
  {
    v255 = v110;
    NSAppendPrintF(&v255, " MediaControl");
    v111 = v255;

    v110 = v111;
  }
  if (self->_siriDaemon)
  {
    v254 = v110;
    NSAppendPrintF(&v254, " Siri");
    v112 = v254;

  }
  else
  {
    v112 = v110;
  }
  v194 = v112;
  if (v112)
  {
    v113 = (id *)(v291 + 5);
    v253 = (id)v291[5];
    NSAppendPrintF(&v253, "Profiles: <%@ >\n", v194);
    objc_storeStrong(v113, v253);
  }
  v114 = self->_btPipeConnection != 0;
  v115 = (char *)-[NSMutableDictionary count](self->_bleClientConnections, "count");
  v116 = -[NSMutableDictionary count](self->_tcpClientConnections, "count");
  v117 = &v115[v114
             + (unint64_t)-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")
             + (_QWORD)v116];
  if (v117)
  {
    v118 = (id *)(v291 + 5);
    v252 = (id)v291[5];
    NSAppendPrintF(&v252, "%d Client Cnx\n", (_DWORD)v117);
    objc_storeStrong(v118, v252);
  }
  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    v120 = (id *)(v291 + 5);
    v251 = (id)v291[5];
    v121 = CUDescriptionWithLevel(btPipeConnection, v39);
    v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
    NSAppendPrintF(&v251, "    %@\n", v122);
    objc_storeStrong(v120, v251);

  }
  tcpClientConnections = self->_tcpClientConnections;
  v249[0] = _NSConcreteStackBlock;
  v249[1] = 3221225472;
  v249[2] = sub_10001A3E8;
  v249[3] = &unk_100111500;
  v249[4] = &v290;
  v250 = v39;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpClientConnections, "enumerateKeysAndObjectsUsingBlock:", v249);
  tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
  v247[0] = _NSConcreteStackBlock;
  v247[1] = 3221225472;
  v247[2] = sub_10001A450;
  v247[3] = &unk_100111500;
  v247[4] = &v290;
  v248 = v39;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpOnDemandClientConnections, "enumerateKeysAndObjectsUsingBlock:", v247);
  bleClientConnections = self->_bleClientConnections;
  v245[0] = _NSConcreteStackBlock;
  v245[1] = 3221225472;
  v245[2] = sub_10001A4B8;
  v245[3] = &unk_100111500;
  v245[4] = &v290;
  v246 = v39;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleClientConnections, "enumerateKeysAndObjectsUsingBlock:", v245);
  v126 = (char *)-[NSMutableSet count](self->_bleServerConnections, "count");
  v127 = &v126[(_QWORD)-[NSMutableSet count](self->_tcpServerConnections, "count")];
  if (v127)
  {
    v128 = (id *)(v291 + 5);
    v244 = (id)v291[5];
    NSAppendPrintF(&v244, "%d Server Cnx\n", (_DWORD)v127);
    objc_storeStrong(v128, v244);
  }
  v242 = 0u;
  v243 = 0u;
  v240 = 0u;
  v241 = 0u;
  v129 = self->_tcpServerConnections;
  v130 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v129, "countByEnumeratingWithState:objects:count:", &v240, v298, 16);
  if (v130)
  {
    v131 = *(_QWORD *)v241;
    do
    {
      v132 = 0;
      do
      {
        if (*(_QWORD *)v241 != v131)
          objc_enumerationMutation(v129);
        v133 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * (_QWORD)v132);
        v134 = (id *)(v291 + 5);
        v239 = (id)v291[5];
        v135 = CUDescriptionWithLevel(v133, v39);
        v136 = (void *)objc_claimAutoreleasedReturnValue(v135);
        NSAppendPrintF(&v239, "    %@\n", v136);
        objc_storeStrong(v134, v239);

        v132 = (char *)v132 + 1;
      }
      while (v130 != v132);
      v130 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v129, "countByEnumeratingWithState:objects:count:", &v240, v298, 16);
    }
    while (v130);
  }

  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  v137 = self->_bleServerConnections;
  v138 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v137, "countByEnumeratingWithState:objects:count:", &v235, v297, 16);
  if (v138)
  {
    v139 = *(_QWORD *)v236;
    do
    {
      v140 = 0;
      do
      {
        if (*(_QWORD *)v236 != v139)
          objc_enumerationMutation(v137);
        v141 = *(_QWORD *)(*((_QWORD *)&v235 + 1) + 8 * (_QWORD)v140);
        v142 = (id *)(v291 + 5);
        v234 = (id)v291[5];
        v143 = CUDescriptionWithLevel(v141, v39);
        v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
        NSAppendPrintF(&v234, "    %@\n", v144);
        objc_storeStrong(v142, v234);

        v140 = (char *)v140 + 1;
      }
      while (v138 != v140);
      v138 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v137, "countByEnumeratingWithState:objects:count:", &v235, v297, 16);
    }
    while (v138);
  }

  personalCnx = self->_personalCnx;
  if (personalCnx)
  {
    v146 = (id *)(v291 + 5);
    v233 = (id)v291[5];
    v147 = CUDescriptionWithLevel(personalCnx, v39);
    v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
    NSAppendPrintF(&v233, "Personal: %@\n", v148);
    objc_storeStrong(v146, v233);

  }
  stereoCnx = self->_stereoCnx;
  if (stereoCnx)
  {
    v150 = (id *)(v291 + 5);
    v232 = (id)v291[5];
    v151 = CUDescriptionWithLevel(stereoCnx, v39);
    v152 = (void *)objc_claimAutoreleasedReturnValue(v151);
    NSAppendPrintF(&v232, "Stereo: %@\n", v152);
    objc_storeStrong(v150, v232);

  }
  v228 = 0;
  v229 = &v228;
  v230 = 0x2020000000;
  v231 = 0;
  v153 = -[NSMutableDictionary count](self->_unauthDevices, "count");
  v154 = v153;
  if (v153)
  {
    v155 = (id *)(v291 + 5);
    v227 = (id)v291[5];
    NSAppendPrintF(&v227, "%d Unauth\n", (_DWORD)v153);
    objc_storeStrong(v155, v227);
  }
  unauthDevices = self->_unauthDevices;
  v225[0] = _NSConcreteStackBlock;
  v225[1] = 3221225472;
  v225[2] = sub_10001A520;
  v225[3] = &unk_100111528;
  v226 = v39;
  v225[4] = &v290;
  v225[5] = &v228;
  v225[6] = v154;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](unauthDevices, "enumerateKeysAndObjectsUsingBlock:", v225);
  v229[3] = 0;
  v157 = -[NSMutableDictionary count](self->_bleDevices, "count");
  v158 = v157;
  if (v157)
  {
    v159 = (id *)(v291 + 5);
    v224 = (id)v291[5];
    NSAppendPrintF(&v224, "%d BLE\n", (_DWORD)v157);
    objc_storeStrong(v159, v224);
  }
  bleDevices = self->_bleDevices;
  v222[0] = _NSConcreteStackBlock;
  v222[1] = 3221225472;
  v222[2] = sub_10001A600;
  v222[3] = &unk_100111528;
  v223 = v39;
  v222[4] = &v290;
  v222[5] = &v228;
  v222[6] = v158;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleDevices, "enumerateKeysAndObjectsUsingBlock:", v222);
  v229[3] = 0;
  v161 = -[NSMutableDictionary count](self->_nearbyInfoV2Devices, "count");
  v162 = v161;
  if (v161)
  {
    v163 = (id *)(v291 + 5);
    v221 = (id)v291[5];
    NSAppendPrintF(&v221, "%d NearbyInfoV2\n", (_DWORD)v161);
    objc_storeStrong(v163, v221);
  }
  nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472;
  v219[2] = sub_10001A6E0;
  v219[3] = &unk_100111528;
  v220 = v39;
  v219[4] = &v290;
  v219[5] = &v228;
  v219[6] = v162;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoV2Devices, "enumerateKeysAndObjectsUsingBlock:", v219);
  v229[3] = 0;
  v165 = -[NSMutableDictionary count](self->_pairedDevices, "count");
  v166 = v165;
  if (v165)
  {
    v167 = (id *)(v291 + 5);
    v218 = (id)v291[5];
    NSAppendPrintF(&v218, "%d Paired\n", (_DWORD)v165);
    objc_storeStrong(v167, v218);
  }
  pairedDevices = self->_pairedDevices;
  v216[0] = _NSConcreteStackBlock;
  v216[1] = 3221225472;
  v216[2] = sub_10001A7C0;
  v216[3] = &unk_100111528;
  v217 = v39;
  v216[4] = &v290;
  v216[5] = &v228;
  v216[6] = v166;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pairedDevices, "enumerateKeysAndObjectsUsingBlock:", v216);
  v229[3] = 0;
  v169 = -[NSMutableDictionary count](self->_homeHubDevices, "count");
  v170 = v169;
  if (v169)
  {
    v171 = (id *)(v291 + 5);
    v215 = (id)v291[5];
    NSAppendPrintF(&v215, "%d HomeHub\n", (_DWORD)v169);
    objc_storeStrong(v171, v215);
  }
  homeHubDevices = self->_homeHubDevices;
  v213[0] = _NSConcreteStackBlock;
  v213[1] = 3221225472;
  v213[2] = sub_10001A8A0;
  v213[3] = &unk_100111528;
  v214 = v39;
  v213[4] = &v290;
  v213[5] = &v228;
  v213[6] = v170;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](homeHubDevices, "enumerateKeysAndObjectsUsingBlock:", v213);
  if (-[NSMutableDictionary count](self->_uiNoteDevices, "count"))
  {
    v173 = (id *)(v291 + 5);
    v212 = (id)v291[5];
    NSAppendPrintF(&v212, "%d UINote\n", -[NSMutableDictionary count](self->_uiNoteDevices, "count"));
    objc_storeStrong(v173, v212);
    uiNoteDevices = self->_uiNoteDevices;
    v210[0] = _NSConcreteStackBlock;
    v210[1] = 3221225472;
    v210[2] = sub_10001A980;
    v210[3] = &unk_100111550;
    v210[4] = &v290;
    v211 = v39;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](uiNoteDevices, "enumerateKeysAndObjectsUsingBlock:", v210);
  }
  v175 = self->_uiNoteSession;
  v176 = v175;
  if (v175)
  {
    v177 = (id *)(v291 + 5);
    v209 = (id)v291[5];
    NSAppendPrintF(&v209, "    %@\n", v175);
    objc_storeStrong(v177, v209);
  }

  if (-[NSMutableDictionary count](self->_xpcMatchingMap, "count"))
  {
    v178 = (id *)(v291 + 5);
    v208 = (id)v291[5];
    NSAppendPrintF(&v208, "%d LaunchOnDemand\n", -[NSMutableDictionary count](self->_xpcMatchingMap, "count"));
    objc_storeStrong(v178, v208);
    xpcMatchingMap = self->_xpcMatchingMap;
    v207[0] = _NSConcreteStackBlock;
    v207[1] = 3221225472;
    v207[2] = sub_10001A9E8;
    v207[3] = &unk_100111578;
    v207[4] = &v290;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v207);
  }
  v180 = mach_absolute_time();
  if (-[NSMutableDictionary count](self->_activeSessions, "count"))
  {
    v181 = (id *)(v291 + 5);
    v206 = (id)v291[5];
    NSAppendPrintF(&v206, "%d Session(s)\n", -[NSMutableDictionary count](self->_activeSessions, "count"));
    objc_storeStrong(v181, v206);
    activeSessions = self->_activeSessions;
    v205[0] = _NSConcreteStackBlock;
    v205[1] = 3221225472;
    v205[2] = sub_10001AACC;
    v205[3] = &unk_1001115A0;
    v205[4] = &v290;
    v205[5] = v180;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSessions, "enumerateKeysAndObjectsUsingBlock:", v205);
  }
  if (-[NSMutableSet count](self->_xpcConnections, "count"))
  {
    v183 = (id *)(v291 + 5);
    v204 = (id)v291[5];
    NSAppendPrintF(&v204, "%d XPC Cnx\n", -[NSMutableSet count](self->_xpcConnections, "count"));
    objc_storeStrong(v183, v204);
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v184 = self->_xpcConnections;
    v185 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v184, "countByEnumeratingWithState:objects:count:", &v200, v296, 16);
    if (v185)
    {
      v186 = *(_QWORD *)v201;
      do
      {
        v187 = 0;
        do
        {
          if (*(_QWORD *)v201 != v186)
            objc_enumerationMutation(v184);
          v188 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)v187);
          v189 = (id *)(v291 + 5);
          v199 = (id)v291[5];
          v190 = CUDescriptionWithLevel(v188, v39);
          v191 = (void *)objc_claimAutoreleasedReturnValue(v190);
          NSAppendPrintF(&v199, "    %@", v191);
          objc_storeStrong(v189, v199);

          v187 = (char *)v187 + 1;
        }
        while (v185 != v187);
        v185 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v184, "countByEnumeratingWithState:objects:count:", &v200, v296, 16);
      }
      while (v185);
    }

  }
  v5 = (id)v291[5];
  _Block_object_dispose(&v228, 8);

  _Block_object_dispose(&v290, 8);
  return v5;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ABE8;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  RPCompanionLinkDaemon *v2;
  int DeviceClass;
  _BOOL8 v4;
  uint64_t v5;
  NSXPCListener *v6;
  NSXPCListener *xpcListener;
  NSObject *dispatchQueue;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  RPNearFieldDaemon *nearfieldDaemon;
  RPAppleTVDeviceInfoManager *v15;
  RPAppleTVDeviceInfoManager *tvDeviceInfoManager;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD block[5];
  _QWORD handler[5];

  v2 = self;
  if (dword_100130248 <= 30)
  {
    if (dword_100130248 != -1
      || (self = (RPCompanionLinkDaemon *)_LogCategory_Initialize(&dword_100130248, 30), (_DWORD)self))
    {
      self = (RPCompanionLinkDaemon *)LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activate]", 30, "Activate\n");
    }
  }
  DeviceClass = GestaltGetDeviceClass(self, a2);
  v4 = sub_100018144(DeviceClass);
  v2->_prefCommunal = v4;
  v2->_prefServerBonjourOpportunitistic = GestaltGetDeviceClass(v4, v5) == 3;
  v2->_startTicks = mach_absolute_time();
  v2->_startTicksFull = mach_continuous_time();
  RandomBytes(&v2->_xidLast, 4);
  if (!v2->_xpcListener)
  {
    v6 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.CompanionLink"));
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v6;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_xpcListener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
  }
  if (v2->_coreDeviceChangedNotifier == -1)
  {
    dispatchQueue = v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001AE60;
    handler[3] = &unk_1001115C8;
    handler[4] = v2;
    notify_register_dispatch("com.apple.dt.coredevice.devicePaired", &v2->_coreDeviceChangedNotifier, dispatchQueue, handler);
  }
  v2->_homeKitWaiting = 1;
  v9 = dispatch_time(0, 2000000000);
  v10 = v2->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AE68;
  block[3] = &unk_1001110F8;
  block[4] = v2;
  dispatch_after(v9, v10, block);
  if (!v2->_nearfieldDaemon)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[RPNearFieldDaemon sharedNearFieldDaemon](RPNearFieldDaemon, "sharedNearFieldDaemon"));
    nearfieldDaemon = v2->_nearfieldDaemon;
    v2->_nearfieldDaemon = (RPNearFieldDaemon *)v13;

    -[RPNearFieldDaemon setDispatchQueue:](v2->_nearfieldDaemon, "setDispatchQueue:", v2->_dispatchQueue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001AF24;
    v18[3] = &unk_1001110F8;
    v18[4] = v2;
    v11 = -[RPNearFieldDaemon setTransactionChangedHandler:](v2->_nearfieldDaemon, "setTransactionChangedHandler:", v18);
  }
  if (!v2->_tvDeviceInfoManager && GestaltGetDeviceClass(v11, v12) == 4)
  {
    v15 = -[RPAppleTVDeviceInfoManager initWithQueue:]([RPAppleTVDeviceInfoManager alloc], "initWithQueue:", v2->_dispatchQueue);
    tvDeviceInfoManager = v2->_tvDeviceInfoManager;
    v2->_tvDeviceInfoManager = v15;

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001AF2C;
    v17[3] = &unk_1001110F8;
    v17[4] = v2;
    -[RPAppleTVDeviceInfoManager setDeviceInfoChangedHandler:](v2->_tvDeviceInfoManager, "setDeviceInfoChangedHandler:", v17);
  }
  -[RPCompanionLinkDaemon prefsChanged](v2, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AFCC;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *xpcMatchingMap;
  int coreDeviceChangedNotifier;
  NSMutableSet *needsAWDLNewPeers;
  NSMutableSet *needsAWDLSentToPeers;
  NSMutableSet *needsAWDLRequestIdentifiers;
  OS_dispatch_source *needsAWDLRequestTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  NSMutableDictionary *registeredEvents;
  NSMutableSet *registeredProfileIDs;
  NSMutableDictionary *registeredRequests;
  CUSystemMonitor *systemMonitor;
  CBAdvertiser *cbAdvertiser;
  RPNearFieldDaemon *nearfieldDaemon;
  RPAppleTVDeviceInfoManager *tvDeviceInfoManager;
  RBSProcessMonitor *rbsProcessMonitor;
  RBSProcessMonitor *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _invalidate]", 30, "Invalidating\n");
    }
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = self->_xpcConnections;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "xpcCnx", (_QWORD)v27));
          objc_msgSend(v9, "invalidate");

        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v6);
    }

    -[NSMutableDictionary removeAllObjects](self->_xpcMatchingMap, "removeAllObjects");
    xpcMatchingMap = self->_xpcMatchingMap;
    self->_xpcMatchingMap = 0;

    -[RPCompanionLinkDaemon _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
    -[RPCompanionLinkDaemon _btPipeEnsureStopped](self, "_btPipeEnsureStopped");
    -[RPCompanionLinkDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    coreDeviceChangedNotifier = self->_coreDeviceChangedNotifier;
    if (coreDeviceChangedNotifier != -1)
    {
      notify_cancel(coreDeviceChangedNotifier);
      self->_coreDeviceChangedNotifier = -1;
    }
    -[RPCompanionLinkDaemon _duetSyncEnsureStopped](self, "_duetSyncEnsureStopped", (_QWORD)v27);
    -[RPCompanionLinkDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPCompanionLinkDaemon _homeKitEnsureStopped](self, "_homeKitEnsureStopped");
    -[RPCompanionLinkDaemon _hidEnsureStopped](self, "_hidEnsureStopped");
    -[RPCompanionLinkDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
    -[RPCompanionLinkDaemon _miscEnsureStopped](self, "_miscEnsureStopped");
    -[RPCompanionLinkDaemon _siriEnsureStopped](self, "_siriEnsureStopped");
    -[RPCompanionLinkDaemon _reachabilityEnsureStopped](self, "_reachabilityEnsureStopped");
    -[RPCompanionLinkDaemon _localDeviceCleanup](self, "_localDeviceCleanup");
    -[NSMutableSet removeAllObjects](self->_needsAWDLNewPeers, "removeAllObjects");
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    self->_needsAWDLNewPeers = 0;

    -[NSMutableSet removeAllObjects](self->_needsAWDLSentToPeers, "removeAllObjects");
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;

    -[NSMutableSet removeAllObjects](self->_needsAWDLRequestIdentifiers, "removeAllObjects");
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    self->_needsAWDLRequestIdentifiers = 0;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      v16 = needsAWDLRequestTimer;
      dispatch_source_cancel(v16);
      v17 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;

    }
    -[NSMutableDictionary removeAllObjects](self->_registeredEvents, "removeAllObjects");
    registeredEvents = self->_registeredEvents;
    self->_registeredEvents = 0;

    -[NSMutableSet removeAllObjects](self->_registeredProfileIDs, "removeAllObjects");
    registeredProfileIDs = self->_registeredProfileIDs;
    self->_registeredProfileIDs = 0;

    -[NSMutableDictionary removeAllObjects](self->_registeredRequests, "removeAllObjects");
    registeredRequests = self->_registeredRequests;
    self->_registeredRequests = 0;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    -[CBAdvertiser invalidate](self->_cbAdvertiser, "invalidate");
    cbAdvertiser = self->_cbAdvertiser;
    self->_cbAdvertiser = 0;

    -[RPNearFieldDaemon setTransactionChangedHandler:](self->_nearfieldDaemon, "setTransactionChangedHandler:", 0);
    nearfieldDaemon = self->_nearfieldDaemon;
    self->_nearfieldDaemon = 0;

    -[RPAppleTVDeviceInfoManager invalidate](self->_tvDeviceInfoManager, "invalidate");
    tvDeviceInfoManager = self->_tvDeviceInfoManager;
    self->_tvDeviceInfoManager = 0;

    rbsProcessMonitor = self->_rbsProcessMonitor;
    if (rbsProcessMonitor)
    {
      -[RBSProcessMonitor invalidate](rbsProcessMonitor, "invalidate");
      v26 = self->_rbsProcessMonitor;
      self->_rbsProcessMonitor = 0;

    }
    -[RPCompanionLinkDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  CUWiFiManager *wifiManager;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_bleClientConnections, "count")
    && !-[NSMutableSet count](self->_bleServerConnections, "count")
    && !self->_bonjourAdvertiser
    && !self->_bonjourBrowser
    && !self->_btAdvAddrMonitor
    && !self->_btPipeConnection
    && !-[NSMutableDictionary count](self->_tcpClientConnections, "count")
    && !-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")
    && !-[NSMutableSet count](self->_tcpServerConnections, "count")
    && !self->_tcpServer
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0;

    self->_invalidateDone = 1;
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  NSString *deviceAuthTagStr;
  NSData *deviceAWDLRandomID;
  void *v7;
  id v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((a3 & 0x10) != 0)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon daemonInfoChanged:]", 30, "Resetting on sign out\n");
    }
    -[RPCompanionLinkDaemon _btPipeEnsureStopped](self, "_btPipeEnsureStopped");
    -[RPCompanionLinkDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPCompanionLinkDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPCompanionLinkDaemon _update](self, "_update");
    if ((a3 & 0x40) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  -[RPCompanionLinkDaemon _update](self, "_update");
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 1) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_26:
  if (self->_deviceAuthTagStr)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon daemonInfoChanged:]", 30, "Clearing cached DeviceAuthTag to re-generate for updated SelfIdentity\n");
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;

  }
  if (self->_deviceAWDLRandomID)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon daemonInfoChanged:]", 30, "Clearing cached AWDL Random ID to re-generate for updated SelfIdentity\n");
    }
    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;

  }
  -[RPCompanionLinkDaemon _update](self, "_update");
  if ((a3 & 1) == 0)
  {
LABEL_5:
    if ((a3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  -[RPCompanionLinkDaemon _update](self, "_update");
  if ((a3 & 0x100) == 0)
  {
LABEL_6:
    if ((a3 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
  -[RPCompanionLinkDaemon _disconnectUnpairedDevices](self, "_disconnectUnpairedDevices");
  if ((a3 & 0x200) == 0)
  {
LABEL_7:
    if ((a3 & 8) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
  -[RPCompanionLinkDaemon _disconnectRemovedSharedHomeDevices](self, "_disconnectRemovedSharedHomeDevices");
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((a3 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
  if ((a3 & 0x20) == 0)
  {
LABEL_9:
    if ((a3 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_43:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  v8 = objc_msgSend(v7, "errorFlags");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_xpcConnections;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "updateErrorFlags:", v8);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((a3 & 0x800) == 0)
  {
LABEL_10:
    if ((a3 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_51:
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon daemonInfoChanged:]", 30, "Daemon info changed: %#ll{flags}\n", a3, &unk_100109740, (_QWORD)v14);
  -[RPCompanionLinkDaemon _clientBLEFamilyDeviceReportChanges](self, "_clientBLEFamilyDeviceReportChanges");
  if ((a3 & 0x4000) == 0)
  {
LABEL_11:
    if ((a3 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_56:
  -[RPCompanionLinkDaemon _update](self, "_update");
  if ((a3 & 0x40000) != 0)
LABEL_12:
    -[RPCompanionLinkDaemon _update](self, "_update");
LABEL_13:
  if ((a3 & 0x18000) != 0)
  {
    self->_inDiscoverySession = (a3 & 0x8000) != 0;
    -[RPCompanionLinkDaemon _update](self, "_update");
  }
  if ((a3 & 0x2000) != 0)
    -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
  if ((a3 & 2) != 0)
    -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v5;
  _BOOL4 bonjourAWDLAdvertiserForce;
  const char *v7;
  const char *v8;
  _BOOL4 bonjourBrowserAWDLForce;
  const char *v10;
  const char *v11;
  BOOL v12;
  uint64_t v14;
  NSData *v15;
  NSData *btAdvAddrData;
  uint64_t v17;
  NSString *v18;
  NSString *btAdvAddrStr;
  uint64_t v20;
  NSData *v21;
  NSData *homeKitLTPK;
  id v23;
  NSData *v24;
  NSString *deviceAuthTagStr;
  id v26;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("clAWDLa"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("clAWDLb"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("clUpdate"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v5, "isEqual:", CFSTR("eval")))
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: Re-evaluate devices\n");
          }
          -[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices](self, "_clientBonjourReevaluateAllDevices");
          goto LABEL_36;
        }
        if (objc_msgSend(v5, "isEqual:", CFSTR("hkbad")))
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: Force bad HomeKit LTPK\n");
          }
          v20 = NSRandomData(32, 0);
          v21 = (NSData *)objc_claimAutoreleasedReturnValue(v20);
          homeKitLTPK = self->_homeKitLTPK;
          self->_homeKitLTPK = v21;

          v12 = 1;
          v23 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1);
          -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1);
          -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
          goto LABEL_53;
        }
        if (!objc_msgSend(v5, "isEqual:", CFSTR("hkgood")))
        {
          if (!objc_msgSend(v5, "isEqual:", CFSTR("rotate")))
          {
            v12 = 0;
            goto LABEL_37;
          }
          v14 = NSRandomData(6, 0);
          v15 = (NSData *)objc_claimAutoreleasedReturnValue(v14);
          btAdvAddrData = self->_btAdvAddrData;
          self->_btAdvAddrData = v15;

          v17 = NSPrintF("%.6a", COERCE_DOUBLE((id)-[NSData bytes](self->_btAdvAddrData, "bytes")));
          v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
          btAdvAddrStr = self->_btAdvAddrStr;
          self->_btAdvAddrStr = v18;

          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: Bluetooth address changed: %.6a\n", COERCE_DOUBLE((id)-[NSData bytes](self->_btAdvAddrData, "bytes")));
          }
          deviceAuthTagStr = self->_deviceAuthTagStr;
          self->_deviceAuthTagStr = 0;

          v12 = 1;
          v26 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1);
          -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1);
LABEL_53:
          -[RPCompanionLinkDaemon _update](self, "_update");
          goto LABEL_37;
        }
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: Restore HomeKit LTPK\n");
        }
        v24 = self->_homeKitLTPK;
        self->_homeKitLTPK = 0;

      }
      else if (dword_100130248 <= 30
             && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: Update\n");
      }
    }
    else
    {
      bonjourBrowserAWDLForce = self->_bonjourBrowserAWDLForce;
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v10 = "yes";
        if (bonjourBrowserAWDLForce)
          v11 = "yes";
        else
          v11 = "no";
        if (bonjourBrowserAWDLForce)
          v10 = "no";
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: AWDL browser force: %s -> %s\n", v11, v10);
      }
      self->_bonjourBrowserAWDLForce = !bonjourBrowserAWDLForce;
    }
  }
  else
  {
    bonjourAWDLAdvertiserForce = self->_bonjourAWDLAdvertiserForce;
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v7 = "yes";
      if (bonjourAWDLAdvertiserForce)
        v8 = "yes";
      else
        v8 = "no";
      if (bonjourAWDLAdvertiserForce)
        v7 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30, "Diag: AWDL advertiser force: %s -> %s\n", v8, v7);
    }
    self->_bonjourAWDLAdvertiserForce = !bonjourAWDLAdvertiserForce;
  }
  -[RPCompanionLinkDaemon _update](self, "_update");
LABEL_36:
  v12 = 1;
LABEL_37:

  return v12;
}

- (void)prefsChanged
{
  uint64_t v3;
  uint64_t v4;
  unsigned int DeviceClass;
  unsigned int v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  uint64_t Int64;
  BOOL v11;
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  _BOOL4 v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  BOOL v27;
  _BOOL4 v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  BOOL v32;
  _BOOL4 v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  BOOL v37;
  _BOOL4 v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  _BOOL4 v42;
  const char *v44;
  const char *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  _BOOL4 v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  _BOOL4 v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  _BOOL4 v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v68;
  uint64_t prefMaxConnectionCount;
  uint64_t v70;
  _BOOL4 v71;
  const char *v73;
  const char *v74;
  uint64_t v75;
  _BOOL4 v76;
  const char *v79;
  const char *v80;
  uint64_t v81;
  _BOOL4 v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  _BOOL4 v88;
  const char *v90;
  const char *v91;
  uint64_t v92;
  unsigned int v93;
  _BOOL4 v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  BOOL v98;
  _BOOL4 v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  BOOL v103;
  _BOOL4 v104;
  const char *v105;
  const char *v106;
  int v107;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  DeviceClass = GestaltGetDeviceClass(v3, v4);
  v6 = DeviceClass;
  v7 = 1;
  if (DeviceClass != 3 && DeviceClass - 1 >= 2)
    v7 = DeviceClass == 100;
  if (self->_prefAppSignIn != v7)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v8 = "yes";
      if (v7)
        v9 = "no";
      else
        v9 = "yes";
      if (!v7)
        v8 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 30, "AppSignIn enabled: %s -> %s\n", v9, v8);
    }
    self->_prefAppSignIn = v7;
  }
  v107 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("applyNoiWiFiToUSB"), &v107);
  if (v107)
    v11 = 1;
  else
    v11 = Int64 == 0;
  v12 = !v11;
  if (self->_prefApplyNoiWiFiToUSB != v12)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v13 = "yes";
      if (v12)
        v14 = "no";
      else
        v14 = "yes";
      if (!v12)
        v13 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 30, "Apply NoInfraWiFi flag to USB : %s -> %s\n", v14, v13);
    }
    self->_prefApplyNoiWiFiToUSB = v12;
  }
  v15 = 1;
  if (v6 != 3 && v6 - 1 >= 2)
    v15 = v6 == 100;
  if (self->_prefCompanionAuthentication != v15)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 30, "CompanionAuthentication enabled: %s -> %s\n", v17, v16);
    }
    self->_prefCompanionAuthentication = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("clBLEClient"), &v107);
  if (v18)
    v19 = 1;
  else
    v19 = v107 != 0;
  if (v6 != 3)
  {
    if (v107)
    {
      v19 = 1;
      if ((v6 > 0xB || ((1 << v6) & 0x816) == 0) && v6 != 100)
        v19 = v18 != 0;
    }
  }
  if (self->_prefBLEClient != v19)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v20 = "yes";
      if (v19)
        v21 = "no";
      else
        v21 = "yes";
      if (!v19)
        v20 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 30, "BLE client enabled: %s -> %s\n", v21, v20);
    }
    self->_prefBLEClient = v19;
  }
  v22 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("btPipeEnabled"), &v107);
  if (!v107 || (v23 = 1, v6 != 1) && v6 != 6)
    v23 = v22 != 0;
  if (self->_prefBTPipeEnabled != v23)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v24 = "yes";
      if (v23)
        v25 = "no";
      else
        v25 = "yes";
      if (!v23)
        v24 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "BTPipe enabled: %s -> %s\n", v25, v24);
    }
    self->_prefBTPipeEnabled = v23;
  }
  v26 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("clClientEnabled"), &v107);
  if (v107)
    v27 = 0;
  else
    v27 = v26 == 0;
  v28 = !v27;
  if (self->_prefClientEnabled != v28)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v29 = "yes";
      if (v28)
        v30 = "no";
      else
        v30 = "yes";
      if (!v28)
        v29 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Client enabled: %s -> %s\n", v30, v29);
    }
    self->_prefClientEnabled = v28;
  }
  v31 = CFPrefs_GetInt64(CFSTR("com.apple.coredevice"), CFSTR("hasBeenPaired"), &v107);
  if (v107)
    v32 = 1;
  else
    v32 = v31 == 0;
  v33 = !v32;
  if (self->_prefCoreDevicePaired != v33)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v34 = "yes";
      if (v33)
        v35 = "no";
      else
        v35 = "yes";
      if (!v33)
        v34 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "CoreDevicePaired: %s -> %s\n", v35, v34);
    }
    self->_prefCoreDevicePaired = v33;
    if (v33)
      -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
  }
  v36 = CFPrefs_GetInt64(CFSTR("com.apple.coredevice"), CFSTR("enabled"), &v107);
  if (v107)
    v37 = 1;
  else
    v37 = v36 == 0;
  v38 = !v37;
  if (self->_prefCoreDeviceEnabled != v38)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v39 = "yes";
      if (v38)
        v40 = "no";
      else
        v40 = "yes";
      if (!v38)
        v39 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "CoreDeviceEnabled: %s -> %s\n", v40, v39);
    }
    self->_prefCoreDeviceEnabled = v38;
  }
  v41 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("hidEnabled"), &v107);
  v42 = v41 != 0;
  if (v107)
    v42 = self->_prefCommunal || v41 != 0;
  if (self->_prefHIDEnabled != v42)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v44 = "yes";
      if (v42)
        v45 = "no";
      else
        v45 = "yes";
      if (!v42)
        v44 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "HID enabled: %s -> %s\n", v45, v44);
    }
    self->_prefHIDEnabled = v42;
  }
  v46 = CFPrefs_GetInt64(CFSTR("com.apple.homed"), CFSTR("kHomesConfigured"), 0);
  v47 = v46 != 0;
  if (v46 && !self->_prefHomeKitConfigured)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "HomeKit configured: %s -> %s\n", "no", "yes");
    }
    self->_prefHomeKitConfigured = v47;
  }
  v48 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("clHomeKit"), &v107);
  v51 = v6 != 6 && v107 != 0 || v48 != 0;
  if (self->_prefHomeKitEnabled != v51)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v52 = "yes";
      if (v51)
        v53 = "no";
      else
        v53 = "yes";
      if (!v51)
        v52 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "HomeKit enabled: %s -> %s\n", v53, v52);
    }
    self->_prefHomeKitEnabled = v51;
  }
  v54 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("ignoreCompanionLinkChecks"), &v107);
  v55 = v54 != 0;
  if (self->_prefIgnoreCompanionLinkChecks != v55)
  {
    if (dword_100130248 <= 30)
    {
      v56 = v54;
      if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30))
      {
        v57 = "yes";
        if (v56)
          v58 = "no";
        else
          v58 = "yes";
        if (!v56)
          v57 = "no";
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 30, "Ignore CompanionLink Checks: %s -> %s\n", v58, v57);
      }
    }
    self->_prefIgnoreCompanionLinkChecks = v55;
  }
  v59 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("ipEnabled"), &v107);
  v62 = v6 != 6 && v107 != 0 || v59 != 0;
  if (self->_prefIPEnabled != v62)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v63 = "yes";
      if (v62)
        v64 = "no";
      else
        v64 = "yes";
      if (!v62)
        v63 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "IP enabled: %s -> %s\n", v64, v63);
    }
    self->_prefIPEnabled = v62;
  }
  v65 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("clMaxConnectionCount"), &v107);
  if (v65 <= 1000 && v65 >= 0 && v107 == 0)
    v68 = v65;
  else
    v68 = 100;
  prefMaxConnectionCount = self->_prefMaxConnectionCount;
  if (v68 != prefMaxConnectionCount)
  {
    if (dword_100130248 <= 40)
    {
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 40))
          goto LABEL_223;
        LODWORD(prefMaxConnectionCount) = self->_prefMaxConnectionCount;
      }
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Max connections: %u -> %lld\n", prefMaxConnectionCount, v68);
    }
LABEL_223:
    self->_prefMaxConnectionCount = v68;
  }
  v70 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("mcEnabled"), &v107);
  v71 = v70 != 0;
  if (v107)
    v71 = self->_prefCommunal || v70 != 0;
  if (self->_prefMediaControlEnabled != v71)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v73 = "yes";
      if (v71)
        v74 = "no";
      else
        v74 = "yes";
      if (!v71)
        v73 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "MediaControl enabled: %s -> %s\n", v74, v73);
    }
    self->_prefMediaControlEnabled = v71;
  }
  v75 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("clServerBonjourAlways"), &v107);
  v76 = v107 && self->_prefCommunal || v6 == 100 && v107 != 0 || v75 != 0;
  if (self->_prefServerBonjourAlways != v76)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v79 = "yes";
      if (v76)
        v80 = "no";
      else
        v80 = "yes";
      if (!v76)
        v79 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Server Bonjour always: %s -> %s\n", v80, v79);
    }
    self->_prefServerBonjourAlways = v76;
  }
  v81 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("clServerEnabled"), &v107);
  v84 = v6 != 6 && v107 != 0 || v81 != 0;
  if (self->_prefServerEnabled != v84)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v85 = "yes";
      if (v84)
        v86 = "no";
      else
        v86 = "yes";
      if (!v84)
        v85 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Server enabled: %s -> %s\n", v86, v85);
    }
    self->_prefServerEnabled = v84;
  }
  v87 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("siriEnabled"), &v107);
  v88 = v87 != 0;
  if (v107)
    v88 = self->_prefCommunal || v87 != 0;
  if (self->_prefSiriEnabled != v88)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v90 = "yes";
      if (v88)
        v91 = "no";
      else
        v91 = "yes";
      if (!v88)
        v90 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Siri enabled: %s -> %s\n", v91, v90);
    }
    self->_prefSiriEnabled = v88;
  }
  v92 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("touchEnabled"), &v107);
  LOBYTE(v93) = v92 != 0;
  if (v107 && v6 - 1 <= 0xA)
    v93 = (0x42Fu >> (v6 - 1)) | (v92 != 0);
  v94 = v93 & 1;
  if (self->_prefTouchEnabled != v94)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v95 = "yes";
      if (v94)
        v96 = "no";
      else
        v96 = "yes";
      if (!v94)
        v95 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Touch enabled: %s -> %s\n", v96, v95);
    }
    self->_prefTouchEnabled = v94;
  }
  v97 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("uiNotes"), &v107);
  if (v107)
    v98 = 0;
  else
    v98 = v97 == 0;
  v99 = !v98;
  if (self->_prefUINotesEnabled != v99)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v100 = "yes";
      if (v99)
        v101 = "no";
      else
        v101 = "yes";
      if (!v99)
        v100 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "UI Notes enabled: %s -> %s\n", v101, v100);
    }
    self->_prefUINotesEnabled = v99;
  }
  v102 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("useTargetAuthTag"), &v107);
  if (v107)
    v103 = 0;
  else
    v103 = v102 == 0;
  v104 = !v103;
  if (self->_prefUseTargetAuthTag != v104)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v105 = "yes";
      if (v104)
        v106 = "no";
      else
        v106 = "yes";
      if (!v104)
        v105 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon prefsChanged]", 40, "Use target AuthTag for AWDL bring up: %s -> %s\n", v106, v105);
    }
    self->_prefUseTargetAuthTag = v104;
  }
  -[RPCompanionLinkDaemon _update](self, "_update");
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  RPXPCMatchingEntry *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSMutableDictionary *xpcMatchingMap;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  BOOL v22;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(RPXPCMatchingEntry);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("type"), TypeID, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v14 = CFStringGetTypeID();
  v15 = CFDictionaryGetTypedValue(v8, CFSTR("serviceType"), v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!objc_msgSend(v13, "isEqual:", CFSTR("discovery")))
  {
    if (objc_msgSend(v13, "isEqual:", CFSTR("server"))
      && (objc_msgSend(v16, "isEqual:", CFSTR("_companion-link._tcp")) & 1) == 0
      && (objc_msgSend(v16, "isEqual:", CFSTR("_rdlink._tcp")) & 1) == 0
      && objc_msgSend(v16, "length"))
    {
      v17 = objc_alloc_init((Class)RPServer);
      objc_msgSend(v17, "setServiceType:", v16);
      -[RPCompanionLinkDevice setServersChangedState:](self->_localDeviceInfo, "setServersChangedState:", 6);
      -[RPXPCMatchingEntry setServer:](v10, "setServer:", v17);

      goto LABEL_13;
    }
LABEL_18:
    v22 = 0;
    goto LABEL_21;
  }
  if (!self->_prefAppSignIn || !objc_msgSend(v16, "isEqual:", CFSTR("RPUserNotificationAppSignIn")))
  {
    if ((objc_msgSend(v16, "isEqual:", CFSTR("_companion-link._tcp")) & 1) != 0
      || self->_prefCompanionAuthentication
      && (objc_msgSend(v16, "isEqual:", CFSTR("com.apple.CompanionAuthentication")) & 1) != 0)
    {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  -[RPXPCMatchingEntry setAppSignIn:](v10, "setAppSignIn:", 1);
LABEL_13:
  -[RPXPCMatchingEntry setEvent:](v10, "setEvent:", v8);
  -[RPXPCMatchingEntry setHandler:](v10, "setHandler:", v9);
  -[RPXPCMatchingEntry setToken:](v10, "setToken:", a3);
  xpcMatchingMap = self->_xpcMatchingMap;
  if (!xpcMatchingMap)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v20 = self->_xpcMatchingMap;
    self->_xpcMatchingMap = v19;

    xpcMatchingMap = self->_xpcMatchingMap;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](xpcMatchingMap, "setObject:forKeyedSubscript:", v10, v21);

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon addXPCMatchingToken:event:handler:]", 30, "LaunchOnDemand added: %##@, token %llu\n", v8, a3);
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
  v22 = 1;
LABEL_21:

  return v22;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_xpcMatchingMap, "objectForKeyedSubscript:", v5));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_xpcMatchingMap, "setObject:forKeyedSubscript:", 0, v5);
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "event"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon removeXPCMatchingToken:]", 30, "LaunchOnDemand removed: %##@, token %llu\n", v7, a3);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "server"));
    if (v8)
      -[RPCompanionLinkDevice setServersChangedState:](self->_localDeviceInfo, "setServersChangedState:", 6);

    -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
  }

  return v6 != 0;
}

- (void)_reportXPCMatchingDiscoveryUINoteDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  NSMutableDictionary *xpcMatchingMap;
  id v9;
  __CFString *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effectiveIdentifier"));
  v6 = (void *)v5;
  v7 = CFSTR("?");
  if (v5)
    v7 = (__CFString *)v5;
  v10 = v7;

  xpcMatchingMap = self->_xpcMatchingMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CF08;
  v11[3] = &unk_100111610;
  v11[4] = v10;
  v12 = v4;
  v9 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (void)_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  NSMutableDictionary *xpcMatchingMap;
  id v9;
  __CFString *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effectiveIdentifier"));
  v6 = (void *)v5;
  v7 = CFSTR("?");
  if (v5)
    v7 = (__CFString *)v5;
  v10 = v7;

  xpcMatchingMap = self->_xpcMatchingMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D1B8;
  v11[3] = &unk_100111610;
  v11[4] = v10;
  v12 = v4;
  v9 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (void)_updateForXPCServerChange
{
  NSMutableSet *v2;
  id v3;
  id v4;
  int v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "server"));
        v10 = v9;
        if (v9)
        {
          if ((~(unsigned __int16)objc_msgSend(v9, "controlFlags") & 0x404) == 0)
          {
            v11 = objc_msgSend(v10, "passwordType");
            if (v11 > 4 || ((1 << v11) & 0x19) == 0)
              v6 = 1;
          }
          v5 |= objc_msgSend(v10, "advertiseDeviceName");
        }

      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
    v6 = 0;
  }

  if (self->_serverBonjourInfraPairing != (v6 & 1))
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v13 = "yes";
      if ((v6 & 1) != 0)
        v14 = "no";
      else
        v14 = "yes";
      if ((v6 & 1) == 0)
        v13 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateForXPCServerChange]", 30, "Bonjour Infra Pairing: %s -> %s\n", v14, v13);
    }
    self->_serverBonjourInfraPairing = v6 & 1;
    -[RPCompanionLinkDaemon _update](self, "_update");
  }
  if (self->_bonjourAWDLAdvertiseForPairing != (v5 & 1))
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v15 = "yes";
      if ((v5 & 1) != 0)
        v16 = "no";
      else
        v16 = "yes";
      if ((v5 & 1) == 0)
        v15 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateForXPCServerChange]", 30, "Bonjour AWDL advertise name for guest pairing: %s -> %s\n", v16, v15);
    }
    self->_bonjourAWDLAdvertiseForPairing = v5 & 1;
    -[RPCompanionLinkDaemon _update](self, "_update");
  }
}

- (void)_updateRBSMonitorStateForXPCClients
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D9C4;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isNearbyActionV2AdvertiserActive
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return self->_bleNearbyActionV2Advertiser != 0;
}

- (void)_clientEnsureStopped
{
  -[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStopped](self, "_clientBLEDiscoveryEnsureStopped");
  -[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStopped](self, "_clientBLEActionDiscoveryEnsureStopped");
  -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped](self, "_clientBLENeedsCLinkAdvertiserEnsureStopped");
  -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped](self, "_clientBLENearbyActionV2AdvertiserEnsureStopped");
  -[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStopped](self, "_clientBonjourAWDLBrowserEnsureStopped");
  -[RPCompanionLinkDaemon _clientBonjourEnsureStopped](self, "_clientBonjourEnsureStopped");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_bleClientConnections, "enumerateKeysAndObjectsUsingBlock:", &stru_100111780);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_tcpClientConnections, "enumerateKeysAndObjectsUsingBlock:", &stru_1001117A0);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_tcpOnDemandClientConnections, "enumerateKeysAndObjectsUsingBlock:", &stru_1001117C0);
}

- (void)_clientBLEActionDiscoveryEnsureStopped
{
  SFDeviceDiscovery *bleActionDiscovery;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_bleActionDiscovery)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStopped]", 30, "BLE action discovery stop ID %u\n", self->_bleActionDiscoveryID);
    }
    -[SFDeviceDiscovery invalidate](self->_bleActionDiscovery, "invalidate");
    bleActionDiscovery = self->_bleActionDiscovery;
    self->_bleActionDiscovery = 0;

    ++self->_bleActionDiscoveryID;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleDevices, "allKeys"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i)));
          v10 = v9;
          if (v9)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
            -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:](self, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:", v11, 1, 2);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_clientBLEDiscoveryEnsureStopped
{
  SFDeviceDiscovery *bleDiscovery;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *pendingLostBLEDevicesTimer;
  OS_dispatch_source *v13;
  CUUserNotificationSession *uiNoteSession;
  NSMutableDictionary *uiNoteDevices;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (self->_bleDiscovery)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStopped]", 30, "BLE discovery stop ID %u\n", self->_bleDiscoveryID);
    }
    -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
    bleDiscovery = self->_bleDiscovery;
    self->_bleDiscovery = 0;

    ++self->_bleDiscoveryID;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleDevices, "allKeys"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i)));
          v10 = v9;
          if (v9)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
            -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:](self, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:", v11, 1, 1);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    pendingLostBLEDevicesTimer = self->_pendingLostBLEDevicesTimer;
    if (pendingLostBLEDevicesTimer)
    {
      dispatch_source_cancel(pendingLostBLEDevicesTimer);
      v13 = self->_pendingLostBLEDevicesTimer;
      self->_pendingLostBLEDevicesTimer = 0;

    }
    -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
    uiNoteSession = self->_uiNoteSession;
    self->_uiNoteSession = 0;

    -[NSMutableDictionary removeAllObjects](self->_uiNoteDevices, "removeAllObjects");
    uiNoteDevices = self->_uiNoteDevices;
    self->_uiNoteDevices = 0;

  }
}

- (BOOL)_clientBLETriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t *v15;
  SFDeviceDiscovery *bleDiscovery;
  id v17;
  char v18;
  uint64_t v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = &v21;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    v20[0] = (uint64_t)_NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = (uint64_t)sub_10001EB3C;
    v20[3] = (uint64_t)&unk_100111888;
    v20[4] = (uint64_t)&v21;
    v20[5] = (uint64_t)a5;
    -[SFDeviceDiscovery triggerEnhancedDiscovery:useCase:completion:](bleDiscovery, "triggerEnhancedDiscovery:useCase:completion:", v14, v6, v20);
LABEL_5:
    v15 = v22;
    goto LABEL_6;
  }
  if (a5)
  {
    v17 = RPErrorF(4294960569, (uint64_t)"BLE discovery is not active", v8, v9, v10, v11, v12, v13, v20[0]);
    *a5 = (id)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_5;
  }
LABEL_6:
  v18 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (void)_schedulePendingLostBLEDeviceTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *pendingLostBLEDevicesTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (!self->_pendingLostBLEDevicesTimer)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _schedulePendingLostBLEDeviceTimer]", 30, "Scheduling timer to process replaced BLE devices");
    }
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pendingLostBLEDevicesTimer = self->_pendingLostBLEDevicesTimer;
    self->_pendingLostBLEDevicesTimer = v3;

    v5 = self->_pendingLostBLEDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001ECF4;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(self->_pendingLostBLEDevicesTimer, 0.5, -1.0, 0.5);
    dispatch_activate((dispatch_object_t)self->_pendingLostBLEDevicesTimer);
  }
}

- (void)_processPendingLostBLEDevices
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleDevices, "allValues"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
        v10 = objc_msgSend(v9, "isBLEDeviceReplaced");

        if (v10)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _processPendingLostBLEDevices]", 30, "Process lost event for replaced BLE device: %@\n", v8);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
          objc_msgSend(v11, "setIsBLEDeviceReplaced:", 0);

          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
          -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:](self, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:", v12, 0, 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_serverNearbyInfoV2DeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *i;
  uint64_t v18;
  RPCompanionLinkDaemon *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  NSMutableDictionary *nearbyInfoV2Devices;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddressData"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nearbyInfoV2TempAuthTagData"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolveIdentityForTempAuthTagData:bluetoothAddressData:", v8, v7));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDeviceID"));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyInfoV2Devices, "objectForKeyedSubscript:", v11));
          if (v12)
          {
            v13 = v12;
            v14 = objc_msgSend(v12, "updateWithCBDevice:", v6);
            if ((_DWORD)v14)
              -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v13, v14);
          }
          else
          {
            if (dword_100130248 < 31
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
            {
              v26 = CUDescriptionWithLevel(v6, 30);
              v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]", 30, "NearbyInfoV2 device found: %@ at RSSI %ld DFl %#{flags}\n", v27, (int)objc_msgSend(v6, "rssi"), v4, &unk_1001098C8);

            }
            v13 = objc_alloc_init((Class)RPCompanionLinkDevice);
            objc_msgSend(v13, "setDeviceFlags:", objc_msgSend(v13, "deviceFlags") | v4);
            objc_msgSend(v13, "updateWithIdentity:", v10);
            objc_msgSend(v13, "updateWithCBDevice:", v6);
            objc_msgSend(v13, "setStatusFlags:", (unint64_t)objc_msgSend(v13, "statusFlags") | 0x200);
            nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
            if (!nearbyInfoV2Devices)
            {
              v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v30 = self->_nearbyInfoV2Devices;
              self->_nearbyInfoV2Devices = v29;

              nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](nearbyInfoV2Devices, "setObject:forKeyedSubscript:", v13, v11);
            -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v13);
            if (dword_100130248 <= 10
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
            {
              v31 = CUDescriptionWithLevel(v13, 30);
              v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]", 10, "NearbyInfoV2 device in cache: %@\n", v32);

            }
          }

        }
        else if (dword_100130248 <= 90
               && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]", 90, "### Ignoring NearbyInfoV2 device found: no ID, %@\n", v6);
        }

      }
      else if (dword_100130248 <= 90
             && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]", 90, "### Ignoring NearbyInfoV2 device found: unable to resolve authTag, %@\n", v6);
      }

    }
    else
    {
      v33 = v7;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_nearbyInfoV2Devices, "allKeys"));
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v15)
      {
        v16 = v15;
        v35 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v35)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            v19 = self;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyInfoV2Devices, "objectForKeyedSubscript:", v18));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cbDevice"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
            v23 = v6;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
            v25 = objc_msgSend(v22, "isEqualToString:", v24);

            if (v25)
            {
              if (dword_100130248 <= 90
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
              {
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]", 90, "NearbyInfoV2 device no longer has tempAuthTag");
              }
              v6 = v23;
              -[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:](v19, "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:", v23, v18, 1, 4);

              goto LABEL_31;
            }

            v6 = v23;
            self = v19;
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_31:

      v8 = 0;
      v7 = v33;
    }

  }
}

- (void)_serverNearbyInfoV2DeviceLost:(id)a3 idsIdentifier:(id)a4 force:(BOOL)a5 deviceFlags:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;

  v6 = a6;
  v29 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "idsDeviceID"));
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v10;
  v15 = v14;

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "btAddressData"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "nearbyInfoV2TempAuthTagData"));
    v18 = (void *)v17;
    if (v16 && v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resolveIdentityForTempAuthTagData:bluetoothAddressData:", v18, v16));

      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsDeviceID"));
    }

  }
  if (v15)
    v21 = v15;
  else
    v21 = v11;
  v22 = v21;
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyInfoV2Devices, "objectForKeyedSubscript:", v22));
    if (v23)
      v24 = 1;
    else
      v24 = v11 == 0;
    if (!v24)
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyInfoV2Devices, "objectForKeyedSubscript:", v11));
    if (!v23)
      goto LABEL_28;
    objc_msgSend(v23, "setDeviceFlags:", objc_msgSend(v23, "deviceFlags") & ~(_DWORD)v6);
    if (!a5)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cbDevice"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stableIdentifier"));

      if ((objc_msgSend(v22, "isEqual:", v26) & 1) == 0)
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]", 30, "Ignoring NearbyInfoV2 device lost: stale ID, %@ vs %@\n", v22, v26);
        }

        goto LABEL_28;
      }

    }
    if ((objc_msgSend(v23, "deviceFlags") & 7) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nearbyInfoV2Devices, "setObject:forKeyedSubscript:", 0, v22);
      objc_msgSend(v23, "removeCBDevice:", v29);
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v27 = CUDescriptionWithLevel(v23, 30);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]", 30, "NearbyInfoV2 device lost: %@ DFl %#{flags}\n", v28, v6, &unk_1001098C8);

      }
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v23);
    }
LABEL_28:

    goto LABEL_29;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]", 90, "### Ignoring NearbyInfoV2 device lost: no ID, %@\n", v29);
LABEL_29:

}

- (void)_clientBLEFamilyDeviceReportChanges
{
  RPCompanionLinkDaemon *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  RPCompanionLinkDaemon *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v2 = self;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleDevices, "allKeys"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v20 = *(_QWORD *)v23;
    v21 = v3;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_bleDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i)));
        v9 = v8;
        if (v8)
        {
          if ((objc_msgSend(v8, "deviceFlags") & 2) != 0)
          {
            v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDeviceIdentifier"));
            if (v10)
            {
              v11 = (void *)v10;
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsFamilyEndpointMap"));
              v14 = v2;
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "familyEndpointData"));
              v17 = objc_msgSend(v9, "updateWithFamilyEndpoint:", v16);

              v2 = v14;
              if ((_DWORD)v17)
              {
                if (dword_100130248 <= 30
                  && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceVersion"));
                  LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEFamilyDeviceReportChanges]", 30, "Reporting change in family BLE device to client - idsDeviceID: %@, deviceName: %@, source version: %@", v11, v18, v19);

                }
                -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](v14, "_clientReportChangedDevice:changes:", v9, v17);
              }

              v6 = v20;
              v3 = v21;
            }
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

}

- (void)_clientBLENeedsCLinkAdvertiserEnsureStarted
{
  void *v3;
  void *v4;
  SFService *v6;
  SFService *bleNeedsCLinkAdvertiser;
  void *v8;
  SFService *v9;
  _QWORD v10[5];

  if (!self->_bleNeedsCLinkAdvertiser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientBLENeedsCLinkTargetDevice](self, "_clientBLENeedsCLinkTargetDevice"));
    v4 = v3;
    if (!self->_enableAWDLGuestDiscovery && v3 == 0)
    {
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]", 90, "Could not find device to target authTag advertisement to, not starting NeedsCLink advertiser");
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_bleNeedsCLinkDevice, v3);
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]", 30, "BLE NeedsCLink advertiser start\n");
      }
      v6 = (SFService *)objc_alloc_init(off_1001302C0());
      bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
      self->_bleNeedsCLinkAdvertiser = v6;

      -[SFService setAdvertiseRate:](self->_bleNeedsCLinkAdvertiser, "setAdvertiseRate:", 60);
      -[SFService setDeviceActionType:](self->_bleNeedsCLinkAdvertiser, "setDeviceActionType:", 51);
      -[SFService setDispatchQueue:](self->_bleNeedsCLinkAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
      -[SFService setIdentifier:](self->_bleNeedsCLinkAdvertiser, "setIdentifier:", CFSTR("bb6e0a35-ca03-4151-8feb-f6bcae4d9a41"));
      -[SFService setLabel:](self->_bleNeedsCLinkAdvertiser, "setLabel:", CFSTR("CLink"));
      -[SFService setNeedsKeyboard:](self->_bleNeedsCLinkAdvertiser, "setNeedsKeyboard:", 1);
      -[SFService setPairSetupDisabled:](self->_bleNeedsCLinkAdvertiser, "setPairSetupDisabled:", 1);
      -[SFService setOverrideScreenOff:](self->_bleNeedsCLinkAdvertiser, "setOverrideScreenOff:", self->_bleNeedsCLinkAdvertiserScreenOff);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNeedsCLinkDevice, "bleTargetData"));
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v8);

      v9 = self->_bleNeedsCLinkAdvertiser;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001FB44;
      v10[3] = &unk_100111860;
      v10[4] = self;
      -[SFService activateWithCompletion:](v9, "activateWithCompletion:", v10);
      -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1);
    }

  }
}

- (void)_clientBLENeedsCLinkAdvertiserUpdate
{
  SFService *bleNeedsCLinkAdvertiser;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  id v8;

  bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
  if (bleNeedsCLinkAdvertiser && self->_bleNeedsCLinkDevice)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFService targetAuthTag](bleNeedsCLinkAdvertiser, "targetAuthTag"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNeedsCLinkDevice, "bleTargetData"));
    v8 = v4;
    v6 = v5;
    if (v8 != v6)
    {
      if ((v8 == 0) != (v6 != 0))
      {
        v7 = objc_msgSend(v8, "isEqual:", v6);

        if ((v7 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserUpdate]", 30, "BLE NeedsCLink advertiser updating target data <%.3@> -> <%.3@>\n", v8, v6);
      }
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v6);
      goto LABEL_15;
    }

LABEL_15:
  }
}

- (void)_clientBLENeedsCLinkAdvertiserRestart
{
  RPCompanionLinkDevice *bleNeedsCLinkDevice;
  RPCompanionLinkDevice *v4;
  RPCompanionLinkDevice *v5;
  id v6;

  bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
  self->_bleNeedsCLinkDevice = 0;

  if (-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserShouldRun](self, "_clientBLENeedsCLinkAdvertiserShouldRun"))
  {
    v4 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientBLENeedsCLinkTargetDevice](self, "_clientBLENeedsCLinkTargetDevice"));
    v5 = self->_bleNeedsCLinkDevice;
    self->_bleNeedsCLinkDevice = v4;

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserRestart]", 30, "Restarting BLE NeedsCLink advertiser with a new device %@\n", self->_bleNeedsCLinkDevice);
    }
    if (self->_bleNeedsCLinkAdvertiser)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNeedsCLinkDevice, "bleTargetData"));
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v6);

    }
    else
    {
      -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted](self, "_clientBLENeedsCLinkAdvertiserEnsureStarted");
    }
  }
  else
  {
    -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped](self, "_clientBLENeedsCLinkAdvertiserEnsureStopped");
  }
}

- (id)_clientBLENeedsCLinkTargetDevice
{
  NSMutableSet *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSMutableSet *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v4)
        objc_enumerationMutation(v2);
      v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v5);
      if (objc_msgSend(v6, "needsCLink", (_QWORD)v14))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "netCnx"));
        v8 = objc_msgSend(v7, "state");

        if (v8 != 1)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemonDevice"));

          if (v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemonDevice"));
            v11 = objc_msgSend(v10, "statusFlags");

            if ((v11 & 2) != 0)
              break;
          }
        }
      }
      if (v3 == (id)++v5)
      {
        v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    v12 = v6;

    if (v12)
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet daemonDevice](v12, "daemonDevice"));
      v2 = v12;
      goto LABEL_15;
    }
    return 0;
  }
  else
  {
LABEL_15:

    return v3;
  }
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  RPCompanionLinkDevice *v10;
  RPCompanionLinkDevice *bleNearbyActionV2Device;
  RPNearbyActionV2Advertiser *v12;
  RPNearbyActionV2Advertiser *bleNearbyActionV2Advertiser;
  void *v14;
  RPNearbyActionV2Advertiser *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (self->_bleNearbyActionV2Advertiser)
  {
    -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1);
  }
  else
  {
    if (self->_bleNearbyActionV2Device)
      goto LABEL_16;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = self->_xpcConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v8, "needsNearbyActionV2"))
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bonjourDevice"));

            if (!v9)
            {
              v10 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemonDevice"));
              bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
              self->_bleNearbyActionV2Device = v10;

              goto LABEL_15;
            }
          }
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_15:

    if (self->_bleNearbyActionV2Device)
    {
LABEL_16:
      v12 = objc_alloc_init(RPNearbyActionV2Advertiser);
      bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
      self->_bleNearbyActionV2Advertiser = v12;

      -[RPNearbyActionV2Advertiser setDispatchQueue:](self->_bleNearbyActionV2Advertiser, "setDispatchQueue:", self->_dispatchQueue);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNearbyActionV2Device, "bleTargetData"));
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v14);

      -[RPNearbyActionV2Advertiser setNearbyActionType:](self->_bleNearbyActionV2Advertiser, "setNearbyActionType:", -[RPCompanionLinkDevice nearbyActionV2Type](self->_bleNearbyActionV2Device, "nearbyActionV2Type"));
      v15 = self->_bleNearbyActionV2Advertiser;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000202C4;
      v16[3] = &unk_100111860;
      v16[4] = self;
      -[RPNearbyActionV2Advertiser activateWithCompletion:](v15, "activateWithCompletion:", v16);
      -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1);
    }
    else if (dword_100130248 <= 30
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted]", 30, "BLE NearbyActionV2 advertiser did not start, no known device found\n");
    }
  }
}

- (void)_clientBLENearbyActionV2AdvertiserUpdate
{
  RPNearbyActionV2Advertiser *bleNearbyActionV2Advertiser;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  id v8;

  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser && self->_bleNearbyActionV2Device)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Advertiser targetData](bleNearbyActionV2Advertiser, "targetData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNearbyActionV2Device, "bleTargetData"));
    v8 = v4;
    v6 = v5;
    if (v8 != v6)
    {
      if ((v8 == 0) != (v6 != 0))
      {
        v7 = objc_msgSend(v8, "isEqual:", v6);

        if ((v7 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserUpdate]", 30, "BLE NearbyActionV2 advertiser updating target data <%.3@> -> <%.3@>\n", v8, v6);
      }
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6);
      goto LABEL_15;
    }

LABEL_15:
  }
}

- (void)_clientBLENearbyActionV2AdvertiserRestart
{
  -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped](self, "_clientBLENearbyActionV2AdvertiserEnsureStopped");
  if (-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserShouldRun](self, "_clientBLENearbyActionV2AdvertiserShouldRun"))
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserRestart]", 30, "Restarting BLE NearbyActionV2 advertiser with a new device\n");
    }
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted](self, "_clientBLENearbyActionV2AdvertiserEnsureStarted");
  }
}

- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableSet *needsAWDLSentToPeers;
  NSMutableSet *needsAWDLNewPeers;
  const char *v18;
  id obj;
  _QWORD v20[7];
  _QWORD v21[3];
  BOOL v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = a3;
  v5 = 584;
  if (a3)
    v5 = 568;
  v6 = *(id *)((char *)&self->super.isa + v5);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = "disable";
    v9 = *(_QWORD *)v25;
    if (v3)
      v8 = "enable";
    v18 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v23 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:](self, "findConnectedDeviceForIdentifier:controlFlags:cnx:", v11, 0x400000, &v23));
        if (v12
          && (objc_msgSend(v23, "linkType") == 6
           || objc_msgSend(v23, "linkType") == 8
           || objc_msgSend(v23, "linkType") == 7))
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:]", 30, "Sending NeedsAWDL %s event to %@ over connection %@\n", v18, v12, v23);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("_i"));

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("_ena"));

          v21[0] = 0;
          v21[1] = v21;
          v21[2] = 0x2020000000;
          v22 = v3;
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1000207F8;
          v20[3] = &unk_1001118B0;
          v20[5] = v11;
          v20[6] = v21;
          v20[4] = self;
          objc_msgSend(v23, "sendEncryptedEventID:event:options:completion:", CFSTR("_needsAWDL"), v13, 0, v20);
          _Block_object_dispose(v21, 8);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  if (!v3)
  {
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;

  }
  needsAWDLNewPeers = self->_needsAWDLNewPeers;
  self->_needsAWDLNewPeers = 0;

}

- (void)_clientBonjourEnsureStopped
{
  CUBonjourBrowser *bonjourBrowser;
  OS_dispatch_source *bonjourReevaluateTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  if (self->_bonjourBrowser)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourEnsureStopped]", 30, "Bonjour browser stop\n");
    }
    -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

    bonjourReevaluateTimer = self->_bonjourReevaluateTimer;
    if (bonjourReevaluateTimer)
    {
      v6 = bonjourReevaluateTimer;
      dispatch_source_cancel(v6);
      v5 = self->_bonjourReevaluateTimer;
      self->_bonjourReevaluateTimer = 0;

    }
  }
}

- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4
{
  id v6;
  void *v7;
  CFTypeID v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  CFTypeID TypeID;
  uint64_t TypedValue;
  id v18;
  uint64_t v19;
  int Int64;
  int v21;
  uint64_t v22;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  BOOL v28;
  id v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  CFTypeID v44;
  uint64_t v45;
  uint64_t v46;
  char **p_name;
  id v48;
  void *v49;
  int v50;
  BOOL v51;
  int v52;
  id v53;
  void *v54;
  RPCompanionLinkDaemon *v55;
  id v56;
  uint64_t v57;
  char **v58;
  int v59;
  NSString *uniqueIDStr;
  id v61;
  void *v62;
  unint64_t v63;
  int v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  void *v76;
  void *v77;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txtDictionary"));
  if (!self->_btAdvAddrStr)
  {
LABEL_13:
    CFDictionaryGetInt64(v7, CFSTR("rpRF"), 0);
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("rpVr"), TypeID, 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(TypedValue));
    v18 = objc_msgSend(v11, "UTF8String");
    if (v18)
    {
      v19 = TextToSourceVersion(v18, -1);
      if (v19 > 0x10CA0B)
      {
        Int64 = CFDictionaryGetInt64(v7, CFSTR("rpFl"), 0);
        v21 = Int64;
        if (!self->_prefCommunal && (Int64 & 2) != 0 && (Int64 & 0x20000) != 0)
        {
          v22 = 394;
        }
        else if ((Int64 & 0x200000) == 0 || !self->_prefCoreDevicePaired)
        {
          v22 = 2;
        }
        else
        {
          v22 = 130;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "resolveIdentityForBonjourDevice:typeFlags:", v6, v22));

        v26 = -[RPCompanionLinkDaemon _homeKitAuthMatchForBonjourDevice:](self, "_homeKitAuthMatchForBonjourDevice:", v6);
        v27 = v26;
        if ((v26 & 1) == 0 && !v25)
        {
LABEL_31:
          -[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:](self, "_clientBonjourFoundUnauthDevice:isAWDLDevice:", v6, 0);
          v28 = 0;
LABEL_92:

          goto LABEL_73;
        }
        if (v26
          && (v29 = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _homeKitDecryptRotatingIDForBonjourDevice:](self, "_homeKitDecryptRotatingIDForBonjourDevice:", v6))) != 0)
        {
          v30 = v29;
          v75 = 1;
          v76 = v29;
        }
        else
        {
          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsDeviceID"));
          if (!v31)
          {
            if (dword_100130248 <= 10
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
            {
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring device without uniqueID: %@\n", v6);
            }
            goto LABEL_31;
          }
          v30 = (void *)v31;
          v76 = 0;
          v75 = 0;
        }
        v32 = self->_uniqueIDStr;
        v33 = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self->_localDeviceInfo, "idsDeviceIdentifier"));
        v77 = v33;
        if (v32 && (v33 = -[NSString caseInsensitiveCompare:](v32, "caseInsensitiveCompare:", v30)) == NSOrderedSame
          || v77 && (v33 = objc_msgSend(v77, "caseInsensitiveCompare:", v30)) == 0)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            v35 = sub_1000213B8(v6);
            v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 30, "Ignoring our own resolved Bonjour device: %@\n", v36);

          }
          goto LABEL_90;
        }
        if (!a4)
          v33 = -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
        if ((v21 & 0x100000) != 0)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 30, "Skipping no-auto-connect device: %@\n", v6);
          }
          goto LABEL_90;
        }
        if (GestaltGetDeviceClass(v33, v34) == 6)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 30, "Skipping auto-connect for watch discovered device: %@\n", v6);
          }
LABEL_90:
          v28 = 0;
          goto LABEL_91;
        }
        v39 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v30));
        if (v39)
        {
          v40 = (void *)v39;
LABEL_76:
          v41 = 0;
          goto LABEL_77;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsDeviceID"));
        if (v42)
        {
          v71 = v42;
          v43 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v42));
          if (v43)
          {
            v40 = (void *)v43;

            goto LABEL_76;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _findWiFiConnectionByID:](self, "_findWiFiConnectionByID:", v71));
          if (objc_msgSend(v40, "linkType") == 6
            && (objc_msgSend(v40, "controlFlags") & 0x200) == 0)
          {

            if (v40)
              goto LABEL_76;
LABEL_99:
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txtDictionary"));
            v44 = CFStringGetTypeID();
            v45 = CFDictionaryGetTypedValue(v69, CFSTR("rpBA"), v44, 0);
            v72 = (void *)objc_claimAutoreleasedReturnValue(v45);

            v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v72));
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unauthDevices, "objectForKeyedSubscript:", v72));
            v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bonjourDevice"));

            if (v40)
            {
              v41 = (void *)v68;
LABEL_77:
              objc_msgSend(v40, "setBonjourPeerDevice:", v6);
              objc_msgSend(v40, "setPresent:", 1);
              -[RPCompanionLinkDaemon _activeDeviceChangedForConnection:bonjourDevice:](self, "_activeDeviceChangedForConnection:bonjourDevice:", v40, v6);
              if (v41)
                -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v41);
              goto LABEL_79;
            }
            if (v75)
              v46 = 0x8000000;
            else
              v46 = 0;
            p_name = &OBJC_PROTOCOL___NSSecureCoding.name;
            if (dword_100130248 <= 30)
            {
              if (dword_100130248 != -1
                || (v50 = _LogCategory_Initialize(&dword_100130248, 30),
                    p_name = &OBJC_PROTOCOL___NSSecureCoding.name,
                    v50))
              {
                v48 = sub_1000213B8(v6);
                v73 = v46;
                v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 30, "Bonjour peer found <%@>: %@\n", v30, v49);

                p_name = (char **)(&OBJC_PROTOCOL___NSSecureCoding + 8);
                v46 = v73;
              }
            }
            if (!self->_prefServerBonjourAlways
              || ((v21 & 2) != 0 ? (v51 = !self->_prefCommunal) : (v51 = 0), v51 || (v21 & 0x8000) != 0))
            {
              v55 = self;
              v56 = v6;
              v57 = v46;
            }
            else
            {
              if (self->_prefCommunal && (v21 & 2) == 0)
              {
                v52 = *((_DWORD *)p_name + 146);
                if (v52 > 10 || v52 == -1 && !_LogCategory_Initialize(&dword_100130248, 10))
                  goto LABEL_121;
                v53 = sub_1000213B8(v6);
                v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring non-communal peer: %@\n", v54, v67);
                goto LABEL_127;
              }
              v58 = p_name;
              v74 = v46;
              if ((v27 & v75) == 1)
              {
                if ((-[NSString compare:](self->_uniqueIDStr, "compare:", v76) & 0x8000000000000000) == 0)
                {
                  v59 = *((_DWORD *)v58 + 146);
                  if (v59 > 40 || v59 == -1 && !_LogCategory_Initialize(&dword_100130248, 40))
                    goto LABEL_121;
                  uniqueIDStr = self->_uniqueIDStr;
                  v61 = sub_1000213B8(v6);
                  v54 = (void *)objc_claimAutoreleasedReturnValue(v61);
                  LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 40, "Ignoring lower peer %@ with hkKnown %d, unique local ID %@ vs peer %@, %@\n", v30, 1, uniqueIDStr, v76, v54);
                  goto LABEL_127;
                }
              }
              else
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsDeviceID"));
                v63 = (unint64_t)objc_msgSend(v77, "compare:", v62);

                if ((v63 & 0x8000000000000000) == 0)
                {
                  v64 = *((_DWORD *)v58 + 146);
                  if (v64 > 40 || v64 == -1 && !_LogCategory_Initialize(&dword_100130248, 40))
                    goto LABEL_121;
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "idsDeviceID"));
                  v65 = sub_1000213B8(v6);
                  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
                  LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 40, "Ignoring lower peer %@, IDS local %@ vs peer %@, %@\n", v30, v77, v54, v66);

LABEL_127:
                  goto LABEL_121;
                }
              }
              v55 = self;
              v56 = v6;
              v57 = v74;
            }
            -[RPCompanionLinkDaemon _clientConnectionStart:controlFlags:uniqueID:identity:](v55, "_clientConnectionStart:controlFlags:uniqueID:identity:", v56, v57, v30, v25);
LABEL_121:
            v40 = 0;
            v41 = (void *)v68;
LABEL_79:

            v28 = 1;
LABEL_91:

            goto LABEL_92;
          }

          v42 = v71;
        }

        goto LABEL_99;
      }
    }
    else
    {
      v19 = 0;
    }
    if (dword_100130248 <= 20
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 20, "Ignoring old version (%u) device: %@\n", v19, v6);
    }
    goto LABEL_72;
  }
  v8 = CFStringGetTypeID();
  v9 = CFDictionaryGetTypedValue(v7, CFSTR("rpBA"), v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v10)
  {
    if (dword_100130248 > 10 || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 10))
      goto LABEL_72;
    v14 = v6;
    if ((objc_opt_respondsToSelector(v14, "shortDescription") & 1) != 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shortDescription"));
    }
    else if ((objc_opt_respondsToSelector(v14, "descriptionWithLevel:") & 1) != 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "descriptionWithLevel:", 50));
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
    }
    v37 = (void *)v15;

    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring device with no BLE address: %@\n", v37);
    goto LABEL_71;
  }
  if (!objc_msgSend(v10, "isEqual:", self->_btAdvAddrStr))
  {

    goto LABEL_13;
  }
  if (dword_100130248 > 10 || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 10))
    goto LABEL_72;
  v12 = v6;
  if ((objc_opt_respondsToSelector(v12, "shortDescription") & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortDescription"));
  }
  else if ((objc_opt_respondsToSelector(v12, "descriptionWithLevel:") & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "descriptionWithLevel:", 50));
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
  }
  v37 = (void *)v13;

  LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring our own Bonjour device: %@\n", v37);
LABEL_71:

LABEL_72:
  v28 = 0;
LABEL_73:

  return v28;
}

- (void)_clientBonjourLostDevice:(id)a3
{
  void *v4;
  int Int64;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "txtDictionary"));
  Int64 = CFDictionaryGetInt64(v4, CFSTR("rpFl"), 0);

  if ((*(_QWORD *)&Int64 & 0x20000) != 0 && (Int64 & 2) != 0 && !self->_prefCommunal)
    v8 = 394;
  else
    v8 = 2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolveIdentityForBonjourDevice:typeFlags:", v20, v8));
  v11 = -[RPCompanionLinkDaemon _homeKitAuthMatchForBonjourDevice:](self, "_homeKitAuthMatchForBonjourDevice:", v20);
  if (((v11 & 1) != 0 || v10)
    && (v11
     && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _homeKitDecryptRotatingIDForBonjourDevice:](self, "_homeKitDecryptRotatingIDForBonjourDevice:", v20))) != 0|| (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDeviceID"))) != 0))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v12));
    if (v13)
    {
      v14 = (void *)v13;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDeviceID"));
      if (v15)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v15));
        if (v14)
        {
          v16 = v15;

          v12 = v16;
        }
      }
      else
      {
        v14 = 0;
      }

    }
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v17 = v20;
      if ((objc_opt_respondsToSelector(v17, "shortDescription") & 1) != 0)
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shortDescription"));
      }
      else if ((objc_opt_respondsToSelector(v17, "descriptionWithLevel:") & 1) != 0)
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "descriptionWithLevel:", 50));
      }
      else
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
      }
      v19 = (void *)v18;

      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourLostDevice:]", 30, "Bonjour peer lost <%@>: %@\n", v12, v19);
    }
    if (v14)
      objc_msgSend(v14, "setPresent:", 0);

  }
}

- (void)_clientBonjourFoundUnauthDevice:(id)a3 isAWDLDevice:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  NSMutableDictionary *unauthDevices;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id v30;

  v4 = a4;
  v30 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "txtDictionary"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("rpBA"), TypeID, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v9));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setBonjourPeerDevice:", v30);
      objc_msgSend(v11, "setPresent:", 1);
    }
    if (!self->_discoverPairedDevices
      || !-[RPCompanionLinkDaemon _clientBonjourCheckFoundPairedDevice:publicID:](self, "_clientBonjourCheckFoundPairedDevice:publicID:", v30, v9))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unauthDevices, "objectForKeyedSubscript:", v9));
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, "updateWithBonjourDevice:", v30);
        if ((_DWORD)v14)
        {
          v15 = v14;
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            v16 = v30;
            if ((objc_opt_respondsToSelector(v16, "detailedDescription") & 1) != 0)
            {
              v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "detailedDescription"));
            }
            else if ((objc_opt_respondsToSelector(v16, "descriptionWithLevel:") & 1) != 0)
            {
              v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "descriptionWithLevel:", 20));
            }
            else
            {
              v24 = NSPrintF("%@\n", v16);
              v17 = objc_claimAutoreleasedReturnValue(v24);
            }
            v25 = (void *)v17;

            if (v4)
              v26 = CFSTR("YES");
            else
              v26 = CFSTR("NO");
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]", 30, "Bonjour unauth peer changed. BLE Address: <%@>, device: %@, changed flags: %#{flags}, found over AWDL: %@\n", v9, v25, v15, &unk_1001098EC, v26);

          }
          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v13, v15);
        }
      }
      else
      {
        v18 = objc_alloc_init((Class)RPCompanionLinkDevice);
        objc_msgSend(v18, "updateWithBonjourDevice:", v30);
        objc_msgSend(v18, "setFlags:", objc_msgSend(v18, "flags") | 1);
        if (v4)
        {
          objc_msgSend(v18, "setStatusFlags:", (unint64_t)objc_msgSend(v18, "statusFlags") & 0xFFFFFFFFFFFFFFFBLL);
          objc_msgSend(v18, "setStatusFlags:", (unint64_t)objc_msgSend(v18, "statusFlags") | 8);
        }
        unauthDevices = self->_unauthDevices;
        if (!unauthDevices)
        {
          v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v21 = self->_unauthDevices;
          self->_unauthDevices = v20;

          unauthDevices = self->_unauthDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](unauthDevices, "setObject:forKeyedSubscript:", v18, v9);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v22 = v30;
          if ((objc_opt_respondsToSelector(v22, "detailedDescription") & 1) != 0)
          {
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "detailedDescription"));
          }
          else if ((objc_opt_respondsToSelector(v22, "descriptionWithLevel:") & 1) != 0)
          {
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "descriptionWithLevel:", 20));
          }
          else
          {
            v27 = NSPrintF("%@\n", v22);
            v23 = objc_claimAutoreleasedReturnValue(v27);
          }
          v28 = (void *)v23;

          v29 = CFSTR("NO");
          if (v4)
            v29 = CFSTR("YES");
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]", 30, "Bonjour unauth peer found. BLE Address: <%@>, device: %@, found over AWDL: %@\n", v9, v28, v29);

        }
        -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v18);

      }
    }

  }
  else if (dword_100130248 <= 10
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]", 10, "Ignoring found unauth device without public ID: %@\n", v30);
  }

}

- (BOOL)_clientBonjourCheckFoundPairedDevice:(id)a3 publicID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  NSMutableDictionary *pairedDevices;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolveIdentityForBonjourDevice:typeFlags:", v6, 128));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairedDevices, "objectForKeyedSubscript:", v7));
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "updateWithBonjourDevice:", v6);
      if ((_DWORD)v12)
      {
        v13 = v12;
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v14 = v6;
          if ((objc_opt_respondsToSelector(v14, "shortDescription") & 1) != 0)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shortDescription"));
          }
          else if ((objc_opt_respondsToSelector(v14, "descriptionWithLevel:") & 1) != 0)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "descriptionWithLevel:", 50));
          }
          else
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
          }
          v22 = (void *)v15;

          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourCheckFoundPairedDevice:publicID:]", 30, "Bonjour paired peer changed <%@>: %@, %#{flags}\n", v7, v22, v13, &unk_1001098EC);
        }
        -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v11, v13);
      }
    }
    else
    {
      v16 = objc_alloc_init((Class)RPCompanionLinkDevice);
      objc_msgSend(v16, "updateWithBonjourDevice:", v6);
      objc_msgSend(v16, "setStatusFlags:", (unint64_t)objc_msgSend(v16, "statusFlags") | 0x8000);
      pairedDevices = self->_pairedDevices;
      if (!pairedDevices)
      {
        v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v19 = self->_pairedDevices;
        self->_pairedDevices = v18;

        pairedDevices = self->_pairedDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](pairedDevices, "setObject:forKeyedSubscript:", v16, v7);
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v20 = v6;
        if ((objc_opt_respondsToSelector(v20, "shortDescription") & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "shortDescription"));
        }
        else if ((objc_opt_respondsToSelector(v20, "descriptionWithLevel:") & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "descriptionWithLevel:", 50));
        }
        else
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "description"));
        }
        v23 = (void *)v21;

        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourCheckFoundPairedDevice:publicID:]", 30, "Bonjour paired peer found <%@>: %@\n", v7, v23);
      }
      -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v16);

    }
  }

  return v9 != 0;
}

- (void)_clientBonjourLostUnauthDevice:(id)a3
{
  void *v4;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "txtDictionary"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("rpBA"), TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v7));
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "setPresent:", 0);
    if (!-[RPCompanionLinkDaemon _clientBonjourCheckLostPairedDevice:publicID:](self, "_clientBonjourCheckLostPairedDevice:publicID:", v14, v7))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unauthDevices, "objectForKeyedSubscript:", v7));
      if (v10)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unauthDevices, "setObject:forKeyedSubscript:", 0, v7);
        objc_msgSend(v10, "removeBonjourDevice:", v14);
        objc_msgSend(v10, "setStatusFlags:", (unint64_t)objc_msgSend(v10, "statusFlags") & 0xFFFFFFFFFFFFFFF7);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v11 = v14;
          if ((objc_opt_respondsToSelector(v11, "shortDescription") & 1) != 0)
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortDescription"));
          }
          else if ((objc_opt_respondsToSelector(v11, "descriptionWithLevel:") & 1) != 0)
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "descriptionWithLevel:", 50));
          }
          else
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
          }
          v13 = (void *)v12;

          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:]", 30, "Bonjour unauth peer lost <%@>: %@\n", v7, v13);
        }
        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v10);
      }

    }
  }
  else if (dword_100130248 <= 10
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:]", 10, "Ignoring lost unauth device without public ID: %@\n", v14);
  }

}

- (BOOL)_clientBonjourCheckLostPairedDevice:(id)a3 publicID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairedDevices, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pairedDevices, "setObject:forKeyedSubscript:", 0, v7);
    objc_msgSend(v8, "removeBonjourDevice:", v6);
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v9 = v6;
      if ((objc_opt_respondsToSelector(v9, "shortDescription") & 1) != 0)
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortDescription"));
      }
      else if ((objc_opt_respondsToSelector(v9, "descriptionWithLevel:") & 1) != 0)
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "descriptionWithLevel:", 50));
      }
      else
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      }
      v11 = (void *)v10;

      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourCheckLostPairedDevice:publicID:]", 30, "Bonjour paired peer lost <%@>: %@\n", v7, v11);
    }
    -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v8);
  }

  return v8 != 0;
}

- (void)_clientBonjourReevaluateAllDevices
{
  void *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *bonjourReevaluateTimer;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD handler[6];
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUBonjourBrowser devices](self->_bonjourBrowser, "devices"));
  if (objc_msgSend(v3, "count") && !self->_bonjourReevaluateTimer)
  {
    if (mach_absolute_time() >= self->_bonjourReevaluateNextTicks)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices]", 30, "Re-evaluating all devices: %d total\n", objc_msgSend(v3, "count"));
      }
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            -[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:](self, "_clientBonjourFoundDevice:reevaluate:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), 1);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v9);
      }

      v12 = mach_absolute_time();
      self->_bonjourReevaluateNextTicks = SecondsToUpTicks(30) + v12;
    }
    else
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices]", 30, "Re-evaluating all devices: rate limit\n");
      }
      v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      bonjourReevaluateTimer = self->_bonjourReevaluateTimer;
      self->_bonjourReevaluateTimer = v4;
      v6 = v4;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100022328;
      handler[3] = &unk_100111928;
      handler[4] = v6;
      handler[5] = self;
      dispatch_source_set_event_handler(v6, handler);
      CUDispatchTimerSet(v6, 30.0, -1.0, 1.0);
      dispatch_activate(v6);

    }
  }

}

- (void)_clientBonjourReevaluateUnauthDevices
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (-[NSMutableDictionary count](self->_unauthDevices, "count")
    && dword_100130248 <= 30
    && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices]", 30, "Re-evaluating unauth devices\n");
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_unauthDevices, "allValues"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "bonjourDevice"));
        if (v8
          && -[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:](self, "_clientBonjourFoundDevice:reevaluate:", v8, 1))
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices]", 30, "Removing unauth device after re-evaluating: %@\n", v8);
          }
          -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_clientBonjourAWDLBrowserEnsureStarted
{
  void *v3;
  CUBonjourBrowser *v4;
  CUBonjourBrowser *bonjourBrowserAWDL;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_bonjourBrowserAWDL)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStarted]", 30, "Bonjour AWDL browser start\n");
    }
    if (self->_needsAWDLTransaction)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
      objc_msgSend(v3, "activateForClient:", CFSTR("Ensemble"));

    }
    v4 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = v4;

    -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowserAWDL, "setChangeFlags:", 0xFFFFFFFFLL);
    -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowserAWDL, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBonjourBrowser setDomain:](self->_bonjourBrowserAWDL, "setDomain:", CFSTR("local."));
    -[CUBonjourBrowser setInterfaceName:](self->_bonjourBrowserAWDL, "setInterfaceName:", CFSTR("awdl0"));
    -[CUBonjourBrowser setLabel:](self->_bonjourBrowserAWDL, "setLabel:", CFSTR("CLink"));
    -[CUBonjourBrowser setServiceType:](self->_bonjourBrowserAWDL, "setServiceType:", CFSTR("_companion-link._tcp"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022734;
    v8[3] = &unk_1001118D8;
    v8[4] = self;
    -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowserAWDL, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002274C;
    v7[3] = &unk_1001118D8;
    v7[4] = self;
    -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowserAWDL, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022764;
    v6[3] = &unk_100111900;
    v6[4] = self;
    -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowserAWDL, "setDeviceChangedHandler:", v6);
    -[CUBonjourBrowser activate](self->_bonjourBrowserAWDL, "activate");
  }
}

- (id)_clientShouldConnectOverBonjour:(id)a3 device:(id)a4 identities:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "netCnx"));
  if ((objc_msgSend(v10, "present") & 1) != 0)
  {

LABEL_8:
    v15 = 0;
    goto LABEL_28;
  }
  if ((objc_msgSend(v7, "needsCLink") & 1) != 0)
  {

  }
  else
  {
    v11 = objc_msgSend(v7, "needsNearbyActionV2");

    if ((v11 & 1) == 0)
      goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicIdentifier"));
  v16 = v14;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"));
  if (!v17
    && v16
    && dword_100130248 <= 90
    && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcCnx"));
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientShouldConnectOverBonjour:device:identities:]", 90, "Destination device %@ for connection from pid %d has no IDS identifier\n", v16, objc_msgSend(v18, "processIdentifier"));

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v9;
  v15 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v27 = v16;
    v28 = v9;
    v20 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v19);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "idsDeviceID"));
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (v25)
        {
          v15 = v22;
          goto LABEL_26;
        }
      }
      v15 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v15)
        continue;
      break;
    }
LABEL_26:
    v16 = v27;
    v9 = v28;
  }

LABEL_28:
  return v15;
}

- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t Int64;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CFTypeID TypeID;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableDictionary *bonjourAWDLDevices;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSMutableSet *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSMutableSet *v41;
  id v42;
  id v43;
  void *v44;
  NSMutableSet *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *j;
  NSMutableDictionary *authenticatedAWDLPairingModeDevices;
  NSMutableDictionary *v68;
  NSMutableDictionary *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  void *k;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *m;
  id v80;
  id v81;
  uint64_t v82;
  void *n;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "txtDictionary"));
    Int64 = CFDictionaryGetInt64(v5, CFSTR("rpRF"), 0);
    if (Int64)
    {
      if (dword_100130248 > 30
        || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 30))
      {
        goto LABEL_145;
      }
      v7 = CUDescriptionWithLevel(v3, 30);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Ignoring AWDL device: requirements, %#ll{flags}, %@\n", Int64, &unk_1001098E0, v8);
      goto LABEL_13;
    }
    if ((CFDictionaryGetInt64(v5, CFSTR("rpFl"), 0) & 0x800) == 0)
    {
      if (dword_100130248 > 30
        || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 30))
      {
        goto LABEL_145;
      }
      v11 = CUDescriptionWithLevel(v3, 30);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Ignoring AWDL device: no connect flag for Bonjour device: %@\n", v8);
LABEL_13:

LABEL_145:
      goto LABEL_146;
    }
    TypeID = CFStringGetTypeID();
    objc_msgSend(v3, "setName:", CFDictionaryGetTypedValue(v5, CFSTR("rpNm"), TypeID, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resolveIdentitiesForBonjourDevice:typeFlags:", v3, 19882));
    if (objc_msgSend(v14, "count"))
    {
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      obj = v14;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v118;
LABEL_17:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v118 != v17)
            objc_enumerationMutation(obj);
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * v18), "idsDeviceID"));
          if (v19)
            break;
          if (v16 == (id)++v18)
          {
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
            if (v16)
              goto LABEL_17;
            goto LABEL_23;
          }
        }
        v22 = v19;

        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v23 = CUDescriptionWithLevel(v3, 30);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Found AWDL device: %@, %@\n", v22, v24);

        }
        bonjourAWDLDevices = self->_bonjourAWDLDevices;
        if (!bonjourAWDLDevices)
        {
          v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v27 = self->_bonjourAWDLDevices;
          self->_bonjourAWDLDevices = v26;

          bonjourAWDLDevices = self->_bonjourAWDLDevices;
        }
        v28 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bonjourAWDLDevices, "objectForKeyedSubscript:", v22));
        if (v28
          && dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v29 = CUDescriptionWithLevel(v28, 30);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = CUDescriptionWithLevel(v3, 30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Replacing AWDL device %@ with %@\n", v30, v32);

        }
        v86 = (void *)v28;
        v88 = (void *)v22;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", v3, v22);
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v33 = self->_xpcConnections;
        v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
        v89 = v3;
        v87 = v14;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v114;
LABEL_48:
          v37 = 0;
          while (1)
          {
            if (*(_QWORD *)v114 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "daemonDevice"));
            v40 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientShouldConnectOverBonjour:device:identities:](self, "_clientShouldConnectOverBonjour:device:identities:", v38, v39, obj));
            if (v40)
              break;

            if (v35 == (id)++v37)
            {
              v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
              if (v35)
                goto LABEL_48;
              v84 = v5;
              v85 = v13;
              v41 = 0;
              goto LABEL_69;
            }
          }
          v42 = (id)v40;
          objc_msgSend(v38, "setBonjourDevice:", v89);
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Creating connection for xpcCnx %@", v38);
          }
          v112 = 0;
          v41 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:](self, "_clientCreateConnection:xpcCnx:error:", v39, v38, &v112));
          v43 = v112;
          if (v41)
          {
            if (dword_100130248 <= 30
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "client"));
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Start connection on found AWDL device for client CID 0x%X : %@, %@\n", objc_msgSend(v44, "clientID"), v39, v42);

            }
            v84 = v5;
            v85 = v13;

LABEL_69:
            v3 = v89;
            goto LABEL_70;
          }
          if (dword_100130248 <= 90
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 90, "### Start connection on found AWDL device failed: %@, %{error}\n", v39, v43);
          }

          v41 = v33;
          v21 = v88;
          goto LABEL_142;
        }
        v84 = v5;
        v85 = v13;
        v41 = 0;
LABEL_70:

        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v45 = self->_xpcConnections;
        v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v109;
          do
          {
            for (i = 0; i != v47; i = (char *)i + 1)
            {
              if (*(_QWORD *)v109 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "daemonDevice"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientShouldConnectOverBonjour:device:identities:](self, "_clientShouldConnectOverBonjour:device:identities:", v50, v51, obj));
              if (v52)
              {
                if (dword_100130248 <= 30
                  && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
                {
                  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet label](v41, "label"));
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "client"));
                  LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Using connection %@ for client 0x%X", v53, objc_msgSend(v54, "clientID"));

                  v3 = v89;
                }
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "netCnx"));

                if (v55)
                {
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "netCnx"));
                  objc_msgSend(v56, "processSendsUsingConnection:", v41);

                }
                objc_msgSend(v50, "setNetCnx:", v41);
                objc_msgSend(v50, "setBonjourDevice:", v3);
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "session"));
                objc_msgSend(v57, "setCnx:", v41);

                v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "discoveryTimer"));
                v59 = v58;
                if (v58)
                {
                  dispatch_source_cancel(v58);
                  objc_msgSend(v50, "setDiscoveryTimer:", 0);
                  objc_msgSend(v50, "setNeedsCLink:", 0);
                  objc_msgSend(v50, "setNeedsNearbyActionV2:", 0);
                }

              }
            }
            v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
          }
          while (v47);
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _xpcConnections:withControlFlags:](self, "_xpcConnections:withControlFlags:", self->_xpcConnections, 0x1000000000000));
        v60 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "objectForKeyedSubscript:", v88));
        v42 = (id)v60;
        if (!v60)
          v42 = objc_alloc_init((Class)RPCompanionLinkDevice);
        v61 = objc_msgSend(v42, "updateWithBonjourDevice:", v89);
        objc_msgSend(v42, "setStatusFlags:", (unint64_t)objc_msgSend(v42, "statusFlags") & 0xFFFFFFFFFFFFFFFBLL);
        objc_msgSend(v42, "setStatusFlags:", (unint64_t)objc_msgSend(v42, "statusFlags") | 8);
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v62 = obj;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
        v13 = v85;
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v105;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(_QWORD *)v105 != v65)
                objc_enumerationMutation(v62);
              v61 = (id)(objc_msgSend(v42, "updateTrustStatusFlagsWithIdentity:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)j)) | v61);
            }
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
          }
          while (v64);
        }

        if ((objc_msgSend(v42, "statusFlags") & 0x80000000) == 0)
        {
          v5 = v84;
          v21 = v88;
          if (v60)
          {
            if (dword_100130248 <= 30
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
            {
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Auth AWDL Pairing Mode device lost because pairing mode flag lost: %@\n", v42);
            }
            v94 = 0u;
            v95 = 0u;
            v92 = 0u;
            v93 = 0u;
            v70 = v39;
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v92, v121, 16);
            if (v71)
            {
              v72 = v71;
              v73 = *(_QWORD *)v93;
              do
              {
                for (k = 0; k != v72; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v93 != v73)
                    objc_enumerationMutation(v70);
                  objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)k), "reportLostDevice:", v42);
                }
                v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v92, v121, 16);
              }
              while (v72);
            }

            v21 = v88;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "setObject:forKeyedSubscript:", 0, v88);
          }
          goto LABEL_141;
        }
        authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
        v5 = v84;
        v21 = v88;
        if (!authenticatedAWDLPairingModeDevices)
        {
          v68 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v69 = self->_authenticatedAWDLPairingModeDevices;
          self->_authenticatedAWDLPairingModeDevices = v68;

          authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](authenticatedAWDLPairingModeDevices, "setObject:forKeyedSubscript:", v42, v88);
        if (v60 && (_DWORD)v61)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Auth AWDL Pairing Mode device changed: %@\n", v42);
          }
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v75 = v39;
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v100, v123, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v101;
            do
            {
              for (m = 0; m != v77; m = (char *)m + 1)
              {
                if (*(_QWORD *)v101 != v78)
                  objc_enumerationMutation(v75);
                objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)m), "reportChangedDevice:changes:", v42, v61);
              }
              v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v100, v123, 16);
            }
            while (v77);
          }
        }
        else
        {
          if (v60)
          {
LABEL_141:
            -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
LABEL_142:

            v3 = v89;
            v14 = v87;
            goto LABEL_143;
          }
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Auth AWDL Pairing Mode device found: %@\n", v42);
          }
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v75 = v39;
          v80 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v96, v122, 16);
          if (v80)
          {
            v81 = v80;
            v82 = *(_QWORD *)v97;
            do
            {
              for (n = 0; n != v81; n = (char *)n + 1)
              {
                if (*(_QWORD *)v97 != v82)
                  objc_enumerationMutation(v75);
                objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)n), "reportFoundDevice:outReason:", v42, 0);
              }
              v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v96, v122, 16);
            }
            while (v81);
          }
        }

        v21 = v88;
        goto LABEL_141;
      }
LABEL_23:

      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        v20 = CUDescriptionWithLevel(v3, 30);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 90, "Ignoring AWDL device as ids identifier is not found: %@\n", v21);
LABEL_143:

      }
    }
    else
    {
      -[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:](self, "_clientBonjourFoundUnauthDevice:isAWDLDevice:", v3, 1);
    }

    goto LABEL_145;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v9 = CUDescriptionWithLevel(v3, 30);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Ignoring AWDL device: no ID, %@\n", v10);

  }
LABEL_146:

}

- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolveIdentityForBonjourDevice:typeFlags:", v23, 19882));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
    if (!v7)
    {
      if (dword_100130248 > 90
        || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 90))
      {
        goto LABEL_31;
      }
      v17 = CUDescriptionWithLevel(v23, 30);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]", 90, "Ignoring lost AWDL device with missing IDS device ID: %@\n", v9);
      goto LABEL_30;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourAWDLDevices, "objectForKeyedSubscript:", v7));
    v9 = v8;
    if (!v8)
    {
      if (dword_100130248 > 30
        || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 30))
      {
        goto LABEL_30;
      }
      v22 = CUDescriptionWithLevel(v23, 30);
      v12 = (id)objc_claimAutoreleasedReturnValue(v22);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Ignoring lost AWDL device not in cache\n", v12);
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    v12 = v10;
    v13 = v11;
    v14 = v13;
    if (v12 == v13)
    {

    }
    else
    {
      if ((v12 == 0) == (v13 != 0))
      {

LABEL_39:
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Ignoring lost AWDL device lost: stale ID, %@ vs %@\n", v14, v12);
        }
LABEL_28:

        goto LABEL_29;
      }
      v15 = objc_msgSend(v12, "isEqual:", v13);

      if ((v15 & 1) == 0)
        goto LABEL_39;
    }
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v18 = CUDescriptionWithLevel(v23, 30);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Lost AWDL device: %@, %@\n", v7, v19);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", 0, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "objectForKeyedSubscript:", v7));
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "setStatusFlags:", (unint64_t)objc_msgSend(v20, "statusFlags") & 0xFFFFFFFF7FFFFFFFLL);
      if (dword_100130248 < 31
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Auth AWDL Pairing Mode device lost: %@\n", v21);
      }
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v21);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "setObject:forKeyedSubscript:", 0, v7);
    }

    goto LABEL_28;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v16 = CUDescriptionWithLevel(v23, 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Ignoring lost unresolved AWDL device: %@\n", v7);
LABEL_31:

  }
}

- (void)_clientConnectionStart:(id)a3 controlFlags:(unint64_t)a4 uniqueID:(id)a5 identity:(id)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSMutableDictionary *tcpClientConnections;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[6];
  id v39;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (char *)-[NSMutableDictionary count](self->_tcpClientConnections, "count");
  v14 = &v13[(_QWORD)-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")];
  if ((unint64_t)v14 < self->_prefMaxConnectionCount)
  {
    if (v12)
      v15 = a4 | 0x80;
    else
      v15 = a4;
    v16 = objc_alloc_init((Class)RPConnection);
    objc_msgSend(v16, "setBonjourPeerDevice:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    objc_msgSend(v16, "setCloudDaemon:", v17);

    objc_msgSend(v16, "setControlFlags:", v15);
    objc_msgSend(v16, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v16, "setHomeKitManager:", self->_homeKitManager);
    objc_msgSend(v16, "setIdentityResolved:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    objc_msgSend(v16, "setIdentityDaemon:", v18);

    v19 = objc_alloc((Class)NSString);
    v20 = self->_cnxIDLast + 1;
    self->_cnxIDLast = v20;
    v21 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("CLink"), v20);
    objc_msgSend(v16, "setLabel:", v21);

    objc_msgSend(v16, "setLocalDeviceInfo:", self->_localDeviceInfo);
    objc_msgSend(v16, "setNetLinkManager:", self->_netLinkManager);
    objc_msgSend(v16, "setPeerIdentifier:", v11);
    objc_msgSend(v16, "setPreferredIdentityType:", objc_msgSend(v12, "type"));
    objc_msgSend(v16, "setPresent:", 1);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100024060;
    v38[3] = &unk_1001116C8;
    v38[4] = self;
    v38[5] = v16;
    v22 = v11;
    v39 = v22;
    objc_msgSend(v16, "setInvalidationHandler:", v38);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002408C;
    v37[3] = &unk_100111928;
    v37[4] = self;
    v37[5] = v16;
    objc_msgSend(v16, "setPeerUpdatedHandler:", v37);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000240F0;
    v36[3] = &unk_100111950;
    v36[4] = self;
    v36[5] = v16;
    objc_msgSend(v16, "setReceivedEventHandler:", v36);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002410C;
    v35[3] = &unk_100111978;
    v35[4] = self;
    v35[5] = v16;
    objc_msgSend(v16, "setReceivedRequestHandler:", v35);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10002412C;
    v34[3] = &unk_1001119A0;
    v34[4] = self;
    v34[5] = v16;
    objc_msgSend(v16, "setStateChangedHandler:", v34);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002413C;
    v33[3] = &unk_100111928;
    v33[4] = v16;
    v33[5] = self;
    objc_msgSend(v16, "setHomeKitUserIdentifierHandler:", v33);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000241C0;
    v32[3] = &unk_100111928;
    v32[4] = self;
    v32[5] = v16;
    objc_msgSend(v16, "setProxyDeviceUpdateHandler:", v32);
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v23 = v10;
      if ((objc_opt_respondsToSelector(v23, "detailedDescription") & 1) != 0)
      {
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "detailedDescription"));
      }
      else if ((objc_opt_respondsToSelector(v23, "descriptionWithLevel:") & 1) != 0)
      {
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "descriptionWithLevel:", 20));
      }
      else
      {
        v27 = NSPrintF("%@\n", v23);
        v24 = objc_claimAutoreleasedReturnValue(v27);
      }
      v28 = (void *)v24;

      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionStart:controlFlags:uniqueID:identity:]", 30, "Connection start: UID %@, BD %@, Cnx %@\n", v22, v28, v16);
    }
    tcpClientConnections = self->_tcpClientConnections;
    if (!tcpClientConnections)
    {
      v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v31 = self->_tcpClientConnections;
      self->_tcpClientConnections = v30;

      tcpClientConnections = self->_tcpClientConnections;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](tcpClientConnections, "setObject:forKeyedSubscript:", v16, v22);
    objc_msgSend(v16, "activate");
    -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

    goto LABEL_28;
  }
  if (dword_100130248 <= 60 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 60)))
  {
    v25 = v10;
    if ((objc_opt_respondsToSelector(v25, "shortDescription") & 1) != 0)
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "shortDescription"));
    }
    else if ((objc_opt_respondsToSelector(v25, "descriptionWithLevel:") & 1) != 0)
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "descriptionWithLevel:", 50));
    }
    else
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
    }
    v16 = (id)v26;

    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionStart:controlFlags:uniqueID:identity:]", 60, "Skipping new connection when at our limit of %d: %@\n", v14, v16);
LABEL_28:

  }
}

- (BOOL)_clientConnectionStartOnDemand:(id)a3 xpcCnx:(id)a4 error:(id *)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:](self, "_clientCreateConnection:xpcCnx:error:", a3, a4, a5));
  if (v6)
    -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

  return v6 != 0;
}

- (id)_clientCreateConnection:(id)a3 xpcCnx:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  int v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  unsigned int v68;
  unint64_t v69;
  int v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  NSMutableDictionary *tcpOnDemandClientConnections;
  NSMutableDictionary **p_bleClientConnections;
  NSMutableDictionary *bleClientConnections;
  NSMutableDictionary *v111;
  NSMutableDictionary *v112;
  uint64_t v114;
  void *v115;
  unint64_t v116;
  void *v117;
  unsigned int v118;
  _QWORD v119[5];
  id v120;
  _QWORD v121[4];
  id v122;
  RPCompanionLinkDaemon *v123;
  _QWORD v124[4];
  id v125;
  RPCompanionLinkDaemon *v126;
  id v127;
  _QWORD v128[5];
  id v129;
  _QWORD v130[5];
  id v131;
  _QWORD v132[5];
  id v133;
  void *v134;
  _QWORD v135[4];
  id v136;
  id v137;
  _QWORD v138[4];
  id v139;
  uint64_t v140;

  v8 = a3;
  v9 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "client"));
    v24 = v17;
    if (!v17)
    {
      v44 = RPErrorF(4294960534, (uint64_t)"No client for on-demand connection", v18, v19, v20, v21, v22, v23, v114);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        v46 = v8;
        if ((objc_opt_respondsToSelector(v46, "shortDescription") & 1) != 0)
        {
          v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "shortDescription"));
        }
        else if ((objc_opt_respondsToSelector(v46, "descriptionWithLevel:") & 1) != 0)
        {
          v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "descriptionWithLevel:", 50));
        }
        else
        {
          v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "description"));
        }
        v95 = (void *)v47;

        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 90, "### Start on-demand connection failed: %@, %{error}\n", v95, v45);
      }
      if (a5)
        *a5 = objc_retainAutorelease(v45);

      v72 = 0;
      goto LABEL_136;
    }
    v25 = (unint64_t)objc_msgSend(v17, "controlFlags");
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "netCnx"));
    if (!v26)
    {
      v26 = objc_alloc_init((Class)RPConnection);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "appID"));
      objc_msgSend(v26, "setAppID:", v27);

      objc_msgSend(v26, "setDispatchQueue:", self->_dispatchQueue);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v26, "setIdentityDaemon:", v28);

      objc_msgSend(v9, "setNetCnx:", v26);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ipAddress"));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ipAddress"));
      objc_msgSend(v26, "setDestinationString:", v30);

    }
    else
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bonjourDevice"));
      if (v117 || (v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bonjourDevice"))) != 0)
      {
        v116 = v25;
        v39 = 0;
        v38 = "Infra";
        goto LABEL_20;
      }
      if ((v25 & 0x400000) == 0 && ((v25 & 0x20000) != 0 || GestaltGetDeviceClass(0, v48) != 6))
      {
        v117 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _findMatchingAWDLBonjourDevice:](self, "_findMatchingAWDLBonjourDevice:", v8));
        if (v117)
        {
          v116 = v25;
          objc_msgSend(v9, "setNeedsCLink:", 1);
          v39 = 0;
          v38 = "AWDL";
          goto LABEL_20;
        }
      }
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ipAddress"));

    if (v31)
    {
      v116 = v25;
      v117 = 0;
      v38 = "Infra";
      v39 = 1;
LABEL_20:
      v49 = (char *)-[NSMutableDictionary count](self->_tcpClientConnections, "count");
      if (&v49[(_QWORD)-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")] < (char *)self->_prefMaxConnectionCount)
        goto LABEL_21;
      v62 = RPErrorF(4294896146, (uint64_t)"Too many existing TCP connections", v50, v51, v52, v53, v54, v55, v114);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 90, "### Start on-demand connection failed: %@, %{error}\n", v8, v63);
      }
      if (a5)
        *a5 = objc_retainAutorelease(v63);

      goto LABEL_74;
    }
    if ((v25 & 0x100) != 0)
    {
      v38 = "ForceL2CAP";
      if (!"ForceL2CAP")
        goto LABEL_83;
    }
    else if ((objc_msgSend(v8, "statusFlags") & 0x200) != 0)
    {
      v140 = 0;
      SocketGetInterfaceInfo(0xFFFFFFFFLL, "awdl0", 0, 0, 0, 0, 0, 0, &v140, 0);
      v38 = (const char *)((v140 << 63 >> 63) & (unint64_t)"NoLocalAWDL");
      if (!v38)
        goto LABEL_83;
    }
    else
    {
      v38 = "NoWiFiP2P";
      if (!"NoWiFiP2P")
        goto LABEL_83;
    }
    if ((v25 & 0x20000000000) == 0)
    {
      v116 = v25;
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "identifier"));

      if (!v74)
      {
        v96 = RPErrorF(4294960588, (uint64_t)"No BLE device", v75, v76, v77, v78, v79, v80, v114);
        v92 = (id)objc_claimAutoreleasedReturnValue(v96);
        if (dword_100130248 <= 90
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
        {
          v97 = sub_1000213B8(v8);
          v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 90, "### Start on-demand connection failed: %@, %{error}\n", v98, v92);

        }
        goto LABEL_119;
      }
      v81 = -[NSMutableDictionary count](self->_bleClientConnections, "count");
      if ((unint64_t)v81 >= 4)
      {
        v89 = "Too many existing BLE connections";
        v90 = 4294896146;
LABEL_80:
        v91 = RPErrorF(v90, (uint64_t)v89, v83, v84, v85, v86, v87, v88, v114);
        v92 = (id)objc_claimAutoreleasedReturnValue(v91);
        if (dword_100130248 <= 90
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 90, "### Start on-demand connection failed: %@, %{error}\n", v8, v92);
        }
LABEL_119:
        if (a5)
        {
          v92 = objc_retainAutorelease(v92);
          *a5 = v92;
        }

        goto LABEL_74;
      }
      if (GestaltGetDeviceClass(v81, v82) == 1)
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
        if ((objc_msgSend(v99, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
        {
          v115 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
          v118 = objc_msgSend(v115, "idsHasWatch");

          if (v118)
          {
            v90 = 4294896150;
            v89 = "Phone with a paired watch can not open on-demand connection to another watch";
            goto LABEL_80;
          }
        }
        else
        {

        }
      }
      objc_msgSend(v26, "setBleClientUseCase:", objc_msgSend(v24, "bleClientUseCase"));
      objc_msgSend(v26, "setBlePeerIdentifier:", v74);
      if (objc_msgSend(v26, "bleClientUseCase") == (id)327680)
      {
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "appID"));
        objc_msgSend(v26, "setClientBundleID:", v100);

      }
      v117 = 0;
      v39 = 1;
LABEL_21:
      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "discoveryTimer"));
      v57 = v56;
      if (v56)
      {
        dispatch_source_cancel(v56);
        objc_msgSend(v9, "setDiscoveryTimer:", 0);
      }

      v58 = 576;
      if (v39)
        v58 = 640;
      v59 = v58 | v116 & 0xC08010000400;
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v60 = CUDescriptionWithLevel(v8, 20);
        v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 30, "Start on-demand connection (%s) to %@\n", v38, v61);

      }
      if ((v39 & 1) == 0)
        objc_msgSend(v26, "setBonjourPeerDevice:", v117);
      objc_msgSend(v26, "setClient:", v24);
      objc_msgSend(v26, "setControlFlags:", v59);
      objc_msgSend(v26, "setIdentifierOverride:", v16);
      v64 = objc_alloc((Class)NSString);
      v65 = self->_cnxIDLast + 1;
      self->_cnxIDLast = v65;
      v66 = objc_msgSend(v64, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("CLink"), v65);
      objc_msgSend(v26, "setLabel:", v66);

      objc_msgSend(v26, "setLocalDeviceInfo:", self->_localDeviceInfo);
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "password"));
      objc_msgSend(v26, "setPassword:", v67);

      objc_msgSend(v26, "setPeerIdentifier:", v16);
      objc_msgSend(v26, "setPresent:", 1);
      objc_msgSend(v9, "setNetCnx:", v26);
      v68 = objc_msgSend(v24, "passwordType");
      if (v68 && v68 != 3)
      {
        objc_msgSend(v26, "setPasswordType:");
        if ((objc_msgSend(v24, "internalAuthFlags") & 8) != 0)
        {
          v138[0] = _NSConcreteStackBlock;
          v138[1] = 3221225472;
          v138[2] = sub_100024EE0;
          v138[3] = &unk_100111860;
          v139 = v9;
          objc_msgSend(v26, "setAuthCompletionHandler:", v138);

        }
        if ((objc_msgSend(v24, "internalAuthFlags") & 4) != 0)
        {
          v135[0] = _NSConcreteStackBlock;
          v135[1] = 3221225472;
          v135[2] = sub_100024EEC;
          v135[3] = &unk_1001119C8;
          v136 = v9;
          v137 = v26;
          objc_msgSend(v137, "setPromptForPasswordHandler:", v135);

        }
      }
      v69 = (unint64_t)objc_msgSend(v8, "statusFlags");
      if ((v69 & 0x80000) != 0)
      {
        v70 = 2;
      }
      else if ((v69 & 0x8000) != 0)
      {
        v70 = 8;
      }
      else if ((v69 & 0x2000) != 0)
      {
        v70 = 9;
      }
      else if ((v69 & 0x4000) != 0)
      {
        v70 = 4;
      }
      else if ((v69 & 0x20000) != 0)
      {
        v70 = 6;
      }
      else if ((v69 & 0x4000000000) != 0)
      {
        v70 = 15;
      }
      else if (v69 & 0x2000000000 | v116 & 0x800000000000)
      {
        v70 = 13;
      }
      else
      {
        v70 = 0;
      }
      if ((v116 & 0x8000000000) != 0)
        v101 = 8;
      else
        v101 = v70;
      if (v101)
        objc_msgSend(v26, "setPreferredIdentityType:");
      -[RPCompanionLinkDaemon _configureConnectionForPairing:](self, "_configureConnectionForPairing:", v26);
      v132[0] = _NSConcreteStackBlock;
      v132[1] = 3221225472;
      v132[2] = sub_100024F2C;
      v132[3] = &unk_1001116C8;
      v132[4] = self;
      v102 = v26;
      v133 = v102;
      v134 = v16;
      objc_msgSend(v102, "setInvalidationHandler:", v132);
      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472;
      v130[2] = sub_100025094;
      v130[3] = &unk_100111950;
      v130[4] = self;
      v103 = v102;
      v131 = v103;
      objc_msgSend(v103, "setReceivedEventHandler:", v130);
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_1000250B0;
      v128[3] = &unk_100111978;
      v128[4] = self;
      v104 = v103;
      v129 = v104;
      objc_msgSend(v104, "setReceivedRequestHandler:", v128);
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472;
      v124[2] = sub_1000250D0;
      v124[3] = &unk_1001119F0;
      v125 = v8;
      v126 = self;
      v105 = v104;
      v127 = v105;
      objc_msgSend(v105, "setStateChangedHandler:", v124);
      v121[0] = _NSConcreteStackBlock;
      v121[1] = 3221225472;
      v121[2] = sub_100025130;
      v121[3] = &unk_100111928;
      v106 = v105;
      v122 = v106;
      v123 = self;
      objc_msgSend(v106, "setHomeKitUserIdentifierHandler:", v121);
      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_1000251B4;
      v119[3] = &unk_100111928;
      v119[4] = self;
      v107 = v106;
      v120 = v107;
      objc_msgSend(v107, "setProxyDeviceUpdateHandler:", v119);
      if ((v39 & 1) != 0)
      {
        bleClientConnections = self->_bleClientConnections;
        p_bleClientConnections = &self->_bleClientConnections;
        tcpOnDemandClientConnections = bleClientConnections;
        if (!bleClientConnections)
          goto LABEL_133;
      }
      else
      {
        tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
        if (!tcpOnDemandClientConnections)
        {
          p_bleClientConnections = &self->_tcpOnDemandClientConnections;
LABEL_133:
          v111 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v112 = *p_bleClientConnections;
          *p_bleClientConnections = v111;

          tcpOnDemandClientConnections = *p_bleClientConnections;
        }
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](tcpOnDemandClientConnections, "setObject:forKeyedSubscript:", v107, v16);
      objc_msgSend(v107, "activate");
      v72 = v107;

      goto LABEL_135;
    }
LABEL_83:
    if ((v25 & 0x400000) == 0)
    {
      -[RPCompanionLinkDaemon _clientOnDemandDiscoveryStart:xpcCnx:](self, "_clientOnDemandDiscoveryStart:xpcCnx:", v8, v9);
      v72 = v26;
      goto LABEL_135;
    }
    v93 = RPErrorF(4294960539, (uint64_t)"Skip on-demand connection discovery", v32, v33, v34, v35, v36, v37, v114);
    v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 90, "### Skip on-demand connection discovery as the client opted out of using AWDL\n");
    }
    if (a5)
      *a5 = objc_retainAutorelease(v94);

LABEL_74:
    v72 = 0;
LABEL_135:

LABEL_136:
    goto LABEL_137;
  }
  v40 = RPErrorF(4294960588, (uint64_t)"No identifier for on-demand device", v10, v11, v12, v13, v14, v15, v114);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    v42 = v8;
    if ((objc_opt_respondsToSelector(v42, "shortDescription") & 1) != 0)
    {
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "shortDescription"));
    }
    else if ((objc_opt_respondsToSelector(v42, "descriptionWithLevel:") & 1) != 0)
    {
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "descriptionWithLevel:", 50));
    }
    else
    {
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "description"));
    }
    v71 = (void *)v43;

    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]", 90, "### Start on-demand connection failed: %@, %{error}\n", v71, v41);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v41);

  v72 = 0;
LABEL_137:

  return v72;
}

- (void)_clientConnectionEnded:(id)a3 uniqueID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionEnded:uniqueID:]", 30, "Connection ended: UID %@, Cnx %@\n", v6, v9);
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, v9);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleClientConnections, "objectForKeyedSubscript:", v6));
  if (v7 == v9)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleClientConnections, "setObject:forKeyedSubscript:", 0, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v6));

  if (v8 == v9)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tcpClientConnections, "setObject:forKeyedSubscript:", 0, v6);
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  -[RPCompanionLinkDaemon _update](self, "_update");

}

- (void)_clientOnDemandConnectionEnded:(id)a3 uniqueID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSMutableDictionary **p_tcpOnDemandClientConnections;
  id v10;

  v10 = a3;
  v6 = a4;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandConnectionEnded:uniqueID:]", 30, "On demand connection ended: UID %@, Cnx %@\n", v6, v10);
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, v10);
  -[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:](self, "_sessionHandlePeerDisconnect:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bonjourPeerDevice"));

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpOnDemandClientConnections, "objectForKeyedSubscript:", v6));
    if (v8 == v10)
    {
      p_tcpOnDemandClientConnections = &self->_tcpOnDemandClientConnections;
LABEL_9:
      -[NSMutableDictionary setObject:forKeyedSubscript:](*p_tcpOnDemandClientConnections, "setObject:forKeyedSubscript:", 0, v6);
    }
  }
  else
  {
    p_tcpOnDemandClientConnections = &self->_bleClientConnections;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleClientConnections, "objectForKeyedSubscript:", v6));
    if (v8 == v10)
      goto LABEL_9;
  }

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  -[RPCompanionLinkDaemon _update](self, "_update");

}

- (BOOL)_clientConnectionStartUnauth:(id)a3 client:(id)a4 publicID:(id)a5 xpcCnx:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  char *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  char *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  NSMutableDictionary *tcpClientConnections;
  NSMutableDictionary *v50;
  NSMutableDictionary *v51;
  BOOL v52;
  void *v53;
  id v54;
  uint64_t prefMaxConnectionCount;
  _QWORD v57[6];
  _QWORD v58[6];
  _QWORD v59[6];
  _QWORD v60[6];
  _QWORD v61[6];
  void **v62;
  uint64_t v63;
  id (*v64)(uint64_t);
  void *v65;
  RPCompanionLinkDaemon *v66;
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bonjourDevice"));
  if (!v22)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      v41 = v12;
      if ((objc_opt_respondsToSelector(v41, "shortDescription") & 1) != 0)
      {
        v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "shortDescription"));
      }
      else if ((objc_opt_respondsToSelector(v41, "descriptionWithLevel:") & 1) != 0)
      {
        v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "descriptionWithLevel:", 50));
      }
      else
      {
        v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "description"));
      }
      v45 = (void *)v42;

      prefMaxConnectionCount = (uint64_t)v45;
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]", 90, "Failing new connection without Bonjour device: %@\n");

      if (!a7)
        goto LABEL_47;
    }
    else if (!a7)
    {
LABEL_47:
      v52 = 0;
      goto LABEL_48;
    }
    v46 = "No Bonjour Device";
    v47 = 4294960591;
LABEL_46:
    v54 = RPErrorF(v47, (uint64_t)v46, v16, v17, v18, v19, v20, v21, prefMaxConnectionCount);
    v52 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(v54);
    goto LABEL_48;
  }
  v23 = (char *)-[NSMutableDictionary count](self->_tcpClientConnections, "count");
  v24 = &v23[(_QWORD)-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")];
  if ((unint64_t)v24 >= self->_prefMaxConnectionCount)
  {
    if (dword_100130248 <= 60
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 60)))
    {
      v43 = v12;
      if ((objc_opt_respondsToSelector(v43, "shortDescription") & 1) != 0)
      {
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "shortDescription"));
      }
      else if ((objc_opt_respondsToSelector(v43, "descriptionWithLevel:") & 1) != 0)
      {
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "descriptionWithLevel:", 50));
      }
      else
      {
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "description"));
      }
      v53 = (void *)v44;

      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]", 60, "Failing new connection when at our limit of %d: %@\n", v24, v53);
      if (!a7)
        goto LABEL_47;
    }
    else if (!a7)
    {
      goto LABEL_47;
    }
    prefMaxConnectionCount = self->_prefMaxConnectionCount;
    v46 = "At connection limit %d";
    v47 = 4294960567;
    goto LABEL_46;
  }
  v25 = objc_alloc_init((Class)RPConnection);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appID"));
  objc_msgSend(v25, "setAppID:", v26);

  objc_msgSend(v25, "setBonjourPeerDevice:", v22);
  objc_msgSend(v25, "setClient:", v13);
  objc_msgSend(v25, "setControlFlags:", (unint64_t)objc_msgSend(v13, "controlFlags") | (unint64_t)objc_msgSend(v25, "controlFlags") | 0x200);
  objc_msgSend(v25, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v25, "setFlags:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v25, "setIdentityDaemon:", v27);

  v28 = objc_alloc((Class)NSString);
  v29 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v29;
  v30 = objc_msgSend(v28, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("CLink"), v29);
  objc_msgSend(v25, "setLabel:", v30);

  objc_msgSend(v25, "setLocalDeviceInfo:", self->_localDeviceInfo);
  objc_msgSend(v25, "setNetLinkManager:", self->_netLinkManager);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));
  objc_msgSend(v25, "setPassword:", v31);

  objc_msgSend(v25, "setPeerIdentifier:", v14);
  objc_msgSend(v25, "setPresent:", 1);
  objc_msgSend(v15, "setNetCnx:", v25);
  -[RPCompanionLinkDaemon _configureConnectionForPairing:](self, "_configureConnectionForPairing:", v25);
  v32 = objc_msgSend(v13, "passwordType");
  v33 = "xpcDiscoveryFoundEndpoint:" + 16;
  if ((_DWORD)v32)
  {
    v34 = v32;
    if ((_DWORD)v32 != 3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allowedMACAddresses"));
      objc_msgSend(v25, "setAllowedMACAddresses:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairSetupACL"));
      objc_msgSend(v25, "setPairSetupACL:", v36);

      v33 = "dEndpoint:";
      objc_msgSend(v25, "setPasswordType:", v34);
      if ((objc_msgSend(v13, "internalAuthFlags") & 8) != 0)
      {
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_100025B80;
        v73[3] = &unk_100111860;
        v74 = v15;
        objc_msgSend(v25, "setAuthCompletionHandler:", v73);

      }
      if ((objc_msgSend(v13, "internalAuthFlags") & 4) != 0)
      {
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_100025B8C;
        v70[3] = &unk_1001119C8;
        v71 = v15;
        v72 = v25;
        objc_msgSend(v25, "setPromptForPasswordHandler:", v70);

      }
    }
  }
  v62 = _NSConcreteStackBlock;
  v63 = *((_QWORD *)v33 + 126);
  v37 = v63;
  v64 = sub_100025BCC;
  v65 = &unk_100111A18;
  v66 = self;
  v67 = v25;
  v38 = v14;
  v68 = v38;
  v69 = v15;
  objc_msgSend(v25, "setInvalidationHandler:", &v62);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = v37;
  v61[2] = sub_100025BF8;
  v61[3] = &unk_100111950;
  v61[4] = self;
  v61[5] = v25;
  objc_msgSend(v25, "setReceivedEventHandler:", v61);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = v37;
  v60[2] = sub_100025C14;
  v60[3] = &unk_100111978;
  v60[4] = self;
  v60[5] = v25;
  objc_msgSend(v25, "setReceivedRequestHandler:", v60);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = v37;
  v59[2] = sub_100025C34;
  v59[3] = &unk_1001119A0;
  v59[4] = self;
  v59[5] = v25;
  objc_msgSend(v25, "setStateChangedHandler:", v59);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = v37;
  v58[2] = sub_100025C44;
  v58[3] = &unk_100111928;
  v58[4] = v25;
  v58[5] = self;
  objc_msgSend(v25, "setHomeKitUserIdentifierHandler:", v58);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = v37;
  v57[2] = sub_100025CC8;
  v57[3] = &unk_100111928;
  v57[4] = self;
  v57[5] = v25;
  objc_msgSend(v25, "setProxyDeviceUpdateHandler:", v57);
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v39 = v12;
    if ((objc_opt_respondsToSelector(v39, "shortDescription") & 1) != 0)
    {
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "shortDescription"));
    }
    else if ((objc_opt_respondsToSelector(v39, "descriptionWithLevel:") & 1) != 0)
    {
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "descriptionWithLevel:", 50));
    }
    else
    {
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "description"));
    }
    v48 = (void *)v40;

    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]", 30, "Connection start auth: PID %@, BD %@, Cnx %@\n", v38, v48, v25);
  }
  tcpClientConnections = self->_tcpClientConnections;
  if (!tcpClientConnections)
  {
    v50 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v51 = self->_tcpClientConnections;
    self->_tcpClientConnections = v50;

    tcpClientConnections = self->_tcpClientConnections;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](tcpClientConnections, "setObject:forKeyedSubscript:", v25, v38);
  objc_msgSend(v25, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

  v52 = 1;
LABEL_48:

  return v52;
}

- (void)_clientConnectionEndedUnauth:(id)a3 publicID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientConnectionEndedUnauth:publicID:]", 30, "Connection ended unauth: PID %@, Cnx %@\n", v6, v8);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tcpClientConnections, "objectForKeyedSubscript:", v6));
  if (v7 == v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tcpClientConnections, "setObject:forKeyedSubscript:", 0, v6);
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  -[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices](self, "_clientBonjourReevaluateAllDevices");

}

- (void)_clientOnDemandDiscoveryStart:(id)a3 xpcCnx:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  RPCompanionLinkDevice **p_bleNearbyActionV2Device;
  RPCompanionLinkDevice *bleNearbyActionV2Device;
  RPCompanionLinkDevice *bleNeedsCLinkDevice;
  _QWORD handler[6];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "discoveryTimer"));

  if (!v9)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandDiscoveryStart:xpcCnx:]", 30, "Starting on-demand connection discovery over AWDL for %@\n", v7);
    }
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_msgSend(v8, "setDiscoveryTimer:", v10);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100026038;
    handler[3] = &unk_100111A18;
    handler[4] = v10;
    handler[5] = self;
    v11 = v7;
    v19 = v11;
    v12 = v8;
    v20 = v12;
    dispatch_source_set_event_handler(v10, handler);
    CUDispatchTimerSet(v10, 15.0, -1.0, 1.0);
    dispatch_activate(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "client"));
    objc_msgSend(v11, "setNearbyActionV2Type:", -[RPCompanionLinkDaemon _controlFlagsToNearbyActionType:](self, "_controlFlagsToNearbyActionType:", objc_msgSend(v13, "controlFlags")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleTargetData"));
    if (v14 && objc_msgSend(v11, "nearbyActionV2Type"))
    {
      objc_msgSend(v12, "setNeedsNearbyActionV2:", 1);
      bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
      p_bleNearbyActionV2Device = &self->_bleNearbyActionV2Device;
      if (!bleNearbyActionV2Device)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v12, "setNeedsCLink:", 1);
      bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
      p_bleNearbyActionV2Device = &self->_bleNeedsCLinkDevice;
      if (!bleNeedsCLinkDevice)
LABEL_16:
        objc_storeStrong((id *)p_bleNearbyActionV2Device, a3);
    }

    goto LABEL_18;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandDiscoveryStart:xpcCnx:]", 90, "### Start on-demand connection discovery already started: %@\n", v7);
LABEL_18:

}

- (void)_clientOnDemandAWDLDiscoveryStartForXPC:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  id v12;
  _QWORD handler[5];
  id v14;
  RPCompanionLinkDaemon *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "client"));
  objc_msgSend(v5, "awdlGuestDiscoveryTimeout");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryTimer"));
  if (v8)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:]", 90, "### Restarting on-demand AWDL guest discovery");
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryTimer"));
    dispatch_source_cancel(v9);

    objc_msgSend(v4, "setDiscoveryTimer:", 0);
    objc_msgSend(v4, "setNeedsCLink:", 0);
  }
  v10 = fmax(v7, 15.0);
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:]", 30, "Starting on-demand AWDL guest discovery with time-out %f\n", v10);
  self->_enableAWDLGuestDiscovery = 1;
  v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v4, "setDiscoveryTimer:", v11);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100026260;
  handler[3] = &unk_1001116C8;
  handler[4] = v11;
  v14 = v4;
  v15 = self;
  v12 = v4;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet(v11, v10, -1.0, 1.0);
  dispatch_activate(v11);
  objc_msgSend(v12, "setNeedsCLink:", 1);
  -[RPCompanionLinkDaemon _update](self, "_update");

}

- (void)_clientOnDemandAWDLDiscoveryTimedOutForDevice:(id)a3 xpcCnx:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryTimedOutForDevice:xpcCnx:]", 90, "### Start on-demand connection discovery timed out: %@\n", v21);
  objc_msgSend(v6, "setDiscoveryTimer:", 0);
  objc_msgSend(v6, "setNeedsCLink:", 0);
  objc_msgSend(v6, "setNeedsNearbyActionV2:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemonDevice"));
  v8 = objc_msgSend(v7, "isEqualToDevice:", self->_bleNearbyActionV2Device);

  if (v8)
  {
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserRestart](self, "_clientBLENearbyActionV2AdvertiserRestart");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemonDevice"));
    v10 = objc_msgSend(v9, "isEqualToDevice:", self->_bleNeedsCLinkDevice);

    if (v10)
      -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserRestart](self, "_clientBLENeedsCLinkAdvertiserRestart");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "netCnx"));
  v18 = RPErrorF(4294960574, (uint64_t)"On-demand discovery timeout", v12, v13, v14, v15, v16, v17, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v11, "invalidateWithError:", v19);

  objc_msgSend(v6, "setNetCnx:", 0);
  -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");

}

- (void)_clientPurgeUnauthAWDLDevices
{
  void *v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_unauthDevices;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unauthDevices, "objectForKeyedSubscript:", v9));
        v11 = v10;
        if (v10 && (objc_msgSend(v10, "statusFlags") & 8) != 0)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientPurgeUnauthAWDLDevices]", 30, "Purging device: %@\n", v11);
          }
          objc_msgSend(v11, "setStatusFlags:", (unint64_t)objc_msgSend(v11, "statusFlags") & 0xFFFFFFFFFFFFFFF3);
          objc_msgSend(v3, "addObject:", v9);
          -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v11);
        }

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_unauthDevices, "removeObjectsForKeys:", v3);
}

- (void)_clientReportUINoteDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *uiNoteDevices;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  CUUserNotificationSession *uiNoteSession;
  CUUserNotificationSession *v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (self->_prefUINotesEnabled)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
    if (v6
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"))) != 0
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publicIdentifier"))) != 0)
    {
      v14 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _findDeviceWithDevice:deviceMap:matchedIdentifier:](self, "_findDeviceWithDevice:deviceMap:matchedIdentifier:", v5, self->_uiNoteDevices, &v14));
      if ((objc_msgSend(v5, "statusFlags") & 0x200000) != 0)
      {
        if (!v7
          && dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientReportUINoteDevice:]", 30, "UINote found: %@\n", v5);
        }
        uiNoteDevices = self->_uiNoteDevices;
        if (!uiNoteDevices)
        {
          v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v11 = self->_uiNoteDevices;
          self->_uiNoteDevices = v10;

          uiNoteDevices = self->_uiNoteDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](uiNoteDevices, "setObject:forKeyedSubscript:", v5, v6);
      }
      else if (v7)
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientReportUINoteDevice:]", 30, "UINote lost: %@\n", v7);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uiNoteDevices, "setObject:forKeyedSubscript:", 0, v14);
        objc_msgSend(v7, "setUiTriggered:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](self->_uiNoteSession, "identifier"));
        if (objc_msgSend(v8, "isEqual:", v14))
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientReportUINoteDevice:]", 30, "UINote dismiss UI on lost: %@\n", v7);
          }
          -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
          uiNoteSession = self->_uiNoteSession;
          self->_uiNoteSession = 0;

        }
      }
      if (!self->_uiNoteSession)
        goto LABEL_34;
      if (!-[NSMutableDictionary count](self->_uiNoteDevices, "count"))
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientReportUINoteDevice:]", 30, "UINote stop on empty: %@\n", v7);
        }
        -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
        v13 = self->_uiNoteSession;
        self->_uiNoteSession = 0;

      }
      if (!self->_uiNoteSession)
LABEL_34:
        -[RPCompanionLinkDaemon _clientUINoteProcessPending](self, "_clientUINoteProcessPending");

    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientReportUINoteDevice:]", 90, "### UINote ignore no ID: %@\n", v5);
    }
  }

}

- (void)_clientUINoteProcessPending
{
  NSMutableDictionary *uiNoteDevices;
  NSMutableDictionary *xpcMatchingMap;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10000F988;
  v15 = sub_10000F950;
  v16 = 0;
  uiNoteDevices = self->_uiNoteDevices;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026B00;
  v10[3] = &unk_100111A40;
  v10[4] = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](uiNoteDevices, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (v12[5])
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    xpcMatchingMap = self->_xpcMatchingMap;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100026B64;
    v5[3] = &unk_100111578;
    v5[4] = &v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v5);
    if (*((_BYTE *)v7 + 24))
    {
      -[RPCompanionLinkDaemon _clientUINoteStart:](self, "_clientUINoteStart:", v12[5]);
    }
    else if (dword_100130248 <= 30
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientUINoteProcessPending]", 30, "Ignoring unregistered UINote: %@\n", v12[5]);
    }
    _Block_object_dispose(&v6, 8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)_clientUINoteStart:(id)a3
{
  id v4;
  void *v5;
  CUUserNotificationSession *v6;
  CUUserNotificationSession *uiNoteSession;
  CUUserNotificationSession *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  id v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _getAppleID](self, "_getAppleID"));
  if (v5)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientUINoteStart:]", 30, "UINote start: %@\n", v4);
    }
    objc_msgSend(v4, "setUiTriggered:", 1);
    v6 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
    uiNoteSession = self->_uiNoteSession;
    self->_uiNoteSession = v6;
    v8 = v6;

    -[CUUserNotificationSession setBundleID:](v8, "setBundleID:", CFSTR("com.apple.RPUserNotificationAppSignIn"));
    -[CUUserNotificationSession setCategoryID:](v8, "setCategoryID:", CFSTR("RPUserNotificationAppSignIn"));
    -[CUUserNotificationSession setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
    -[CUUserNotificationSession setFlags:](v8, "setFlags:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effectiveIdentifier"));
    -[CUUserNotificationSession setIdentifier:](v8, "setIdentifier:", v9);

    -[CUUserNotificationSession setLabel:](v8, "setLabel:", CFSTR("CLink"));
    -[CUUserNotificationSession setTitleKey:](v8, "setTitleKey:", CFSTR("APP_SIGN_IN_TITLE"));
    -[CUUserNotificationSession setBodyKey:](v8, "setBodyKey:", CFSTR("APP_SIGN_IN_BODY_FORMAT"));
    v13 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    -[CUUserNotificationSession setBodyArguments:](v8, "setBodyArguments:", v10);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100026E00;
    v11[3] = &unk_100111A68;
    v11[4] = v8;
    v11[5] = self;
    v12 = v4;
    -[CUUserNotificationSession setActionHandler:](v8, "setActionHandler:", v11);
    -[CUUserNotificationSession activate](v8, "activate");

  }
  else if (dword_100130248 <= 30
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientUINoteStart:]", 30, "UINote ignored: No AppleID \n");
  }

}

- (void)_clientUINoteAction:(int)a3 error:(id)a4 device:(id)a5
{
  id v8;
  const char *v9;
  CUUserNotificationSession *uiNoteSession;
  id v11;

  v11 = a4;
  v8 = a5;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    if (a3 > 5)
      v9 = "?";
    else
      v9 = off_100112308[a3];
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientUINoteAction:error:device:]", 30, "UINote action: %s, %{error}, %@, %@\n", v9, v11, self->_uiNoteSession, v8);
  }
  if (a3 == 1)
    -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryUINoteDevice:](self, "_reportXPCMatchingDiscoveryUINoteDevice:", v8);
  -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
  uiNoteSession = self->_uiNoteSession;
  self->_uiNoteSession = 0;

  -[RPCompanionLinkDaemon _clientUINoteProcessPending](self, "_clientUINoteProcessPending");
}

- (BOOL)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  BOOL v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130248 <= 10 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon triggerEnhancedDiscoveryForReason:useCase:error:]", 10, "Incoming enhanced discovery trigger for reason '%@' with use case: 0x%x\n", v8, v6);
  v9 = -[RPCompanionLinkDaemon _clientBLETriggerEnhancedDiscovery:useCase:error:](self, "_clientBLETriggerEnhancedDiscovery:useCase:error:", v8, v6, a5);

  return v9;
}

- (BOOL)createDeviceToEndpointMappingForDeviceID:(id)a3 endpointUUID:(id *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  uint64_t v20;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findDeviceFromID:](self, "findDeviceFromID:", v8));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon createDeviceToEndpointMappingForDeviceID:endpointUUID:error:]", 30, "Will create mapping for device=%@ UUID=%@\n", v15, v16);
    }
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    v17 = +[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:](RPNWEndpoint, "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:", v15, v16, CFSTR("NA"), 0, 0);

  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon createDeviceToEndpointMappingForDeviceID:endpointUUID:error:]", 30, "Failed to find device with deviceID=%@\n", v8);
    }
    if (a5)
    {
      v18 = RPErrorF(4294960569, (uint64_t)"Failed to find device for mapping", v9, v10, v11, v12, v13, v14, v20);
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (void)_serverEnsureStarted
{
  unsigned int v3;
  unsigned __int8 v4;

  v3 = -[RPCompanionLinkDaemon _serverBonjourShouldRun](self, "_serverBonjourShouldRun");
  v4 = -[RPCompanionLinkDaemon _serverBonjourAWDLShouldRun](self, "_serverBonjourAWDLShouldRun");
  if ((v3 & 1) != 0
    || (v4 & 1) != 0
    || -[RPCompanionLinkDaemon _serverTCPHasActiveConnections](self, "_serverTCPHasActiveConnections"))
  {
    -[RPCompanionLinkDaemon _serverTCPEnsureStarted](self, "_serverTCPEnsureStarted");
  }
  else
  {
    -[RPCompanionLinkDaemon _serverTCPEnsureStopped](self, "_serverTCPEnsureStopped");
  }
  -[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStarted](self, "_serverBTAddressMonitorEnsureStarted");
  -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStarted](self, "_serverBLENeedsCLinkScannerEnsureStarted");
  if (-[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryShouldRun](self, "_serverNearbyActionV2DiscoveryShouldRun"))
  {
    -[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryEnsureStarted](self, "_serverNearbyActionV2DiscoveryEnsureStarted");
    if (!v3)
      goto LABEL_13;
  }
  else
  {
    -[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryEnsureStopped](self, "_serverNearbyActionV2DiscoveryEnsureStopped");
    if (!v3)
      goto LABEL_13;
  }
  if (!self->_homeKitWaiting || self->_homeKitLTPK)
  {
    -[RPCompanionLinkDaemon _serverBonjourEnsureStarted](self, "_serverBonjourEnsureStarted");
    goto LABEL_14;
  }
LABEL_13:
  -[RPCompanionLinkDaemon _serverBonjourEnsureStopped](self, "_serverBonjourEnsureStopped");
LABEL_14:
  if (-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun](self, "_serverBonjourAWDLAdvertiserShouldRun"))
    -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted](self, "_serverBonjourAWDLAdvertiserEnsureStarted");
  else
    -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStopped](self, "_serverBonjourAWDLAdvertiserEnsureStopped");
}

- (BOOL)_serverNearbyActionV2DiscoveryShouldRun
{
  void *v2;
  id v3;
  uint64_t v4;
  int DeviceClass;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v3 = objc_msgSend(v2, "idsIsSignedIn");
  v6 = (_DWORD)v3
    && ((DeviceClass = GestaltGetDeviceClass(v3, v4), DeviceClass == 3) || DeviceClass == 100 || DeviceClass == 11)
    && ((objc_msgSend(v2, "idsHasiPad") & 1) != 0
     || (objc_msgSend(v2, "idsHasMac") & 1) != 0
     || objc_msgSend(v2, "idsHasRealityDevice"));

  return v6;
}

- (void)_serverNearbyActionV2DiscoveryEnsureStarted
{
  RPNearbyActionV2Discovery *v3;
  RPNearbyActionV2Discovery *bleNearbyActionV2Discovery;
  RPNearbyActionV2Discovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_bleNearbyActionV2Discovery)
  {
    v3 = objc_alloc_init(RPNearbyActionV2Discovery);
    bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = v3;

    -[RPNearbyActionV2Discovery setDiscoveryFlags:](self->_bleNearbyActionV2Discovery, "setDiscoveryFlags:", 0x402000000);
    -[RPNearbyActionV2Discovery setDispatchQueue:](self->_bleNearbyActionV2Discovery, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027394;
    v7[3] = &unk_1001110F8;
    v7[4] = self;
    -[RPNearbyActionV2Discovery setUpdateHandler:](self->_bleNearbyActionV2Discovery, "setUpdateHandler:", v7);
    v5 = self->_bleNearbyActionV2Discovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000273C0;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[RPNearbyActionV2Discovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_serverNearbyInfoV2DiscoveryEnsureStarted
{
  RPNearbyInfoV2Discovery *v3;
  RPNearbyInfoV2Discovery *bleNearbyInfoV2Discovery;
  RPNearbyInfoV2Discovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_bleNearbyInfoV2Discovery)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStarted]", 30, "Starting NearbyInfoV2 discovery");
    }
    v3 = objc_alloc_init(RPNearbyInfoV2Discovery);
    bleNearbyInfoV2Discovery = self->_bleNearbyInfoV2Discovery;
    self->_bleNearbyInfoV2Discovery = v3;

    -[RPNearbyInfoV2Discovery setDiscoveryType:](self->_bleNearbyInfoV2Discovery, "setDiscoveryType:", 17);
    -[RPNearbyInfoV2Discovery setDispatchQueue:](self->_bleNearbyInfoV2Discovery, "setDispatchQueue:", self->_dispatchQueue);
    -[RPNearbyInfoV2Discovery setUseCase:](self->_bleNearbyInfoV2Discovery, "setUseCase:", 131094);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002754C;
    v8[3] = &unk_100111A90;
    v8[4] = self;
    -[RPNearbyInfoV2Discovery setDeviceFoundHandler:](self->_bleNearbyInfoV2Discovery, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002759C;
    v7[3] = &unk_100111A90;
    v7[4] = self;
    -[RPNearbyInfoV2Discovery setDeviceLostHandler:](self->_bleNearbyInfoV2Discovery, "setDeviceLostHandler:", v7);
    v5 = self->_bleNearbyInfoV2Discovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000275F4;
    v6[3] = &unk_100111860;
    v6[4] = self;
    -[RPNearbyInfoV2Discovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_serverBLENeedsCLinkScannerEnsureStarted
{
  _BOOL8 v3;
  unsigned int bleNeedsCLinkScannerID;
  SFDeviceDiscovery *v5;
  SFDeviceDiscovery *bleNeedsCLinkScanner;
  SFDeviceDiscovery *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  unsigned int v10;
  _QWORD v11[5];
  unsigned int v12;
  _QWORD v13[5];
  unsigned int v14;

  if (self->_bleNeedsCLinkScanner)
  {
    v3 = -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerScreenOff](self, "_serverBLENeedsCLinkScannerScreenOff");
    if (v3 != -[SFDeviceDiscovery overrideScreenOff](self->_bleNeedsCLinkScanner, "overrideScreenOff"))
      -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleNeedsCLinkScanner, "setOverrideScreenOff:", v3);
  }
  else
  {
    bleNeedsCLinkScannerID = self->_bleNeedsCLinkScannerID;
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStarted]", 30, "BLE NeedsCLink scanner start ID %u\n", bleNeedsCLinkScannerID);
    }
    v5 = (SFDeviceDiscovery *)objc_alloc_init(off_1001302B8());
    bleNeedsCLinkScanner = self->_bleNeedsCLinkScanner;
    self->_bleNeedsCLinkScanner = v5;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleNeedsCLinkScanner, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleNeedsCLinkScanner, "setDiscoveryFlags:", 64);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleNeedsCLinkScanner, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleNeedsCLinkScanner, "setOverrideScreenOff:", -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerScreenOff](self, "_serverBLENeedsCLinkScannerScreenOff"));
    -[SFDeviceDiscovery setPurpose:](self->_bleNeedsCLinkScanner, "setPurpose:", CFSTR("CLink"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100027838;
    v13[3] = &unk_1001117E8;
    v14 = bleNeedsCLinkScannerID;
    v13[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleNeedsCLinkScanner, "setDeviceFoundHandler:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100027858;
    v11[3] = &unk_1001117E8;
    v12 = bleNeedsCLinkScannerID;
    v11[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleNeedsCLinkScanner, "setDeviceLostHandler:", v11);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027878;
    v9[3] = &unk_100111810;
    v10 = bleNeedsCLinkScannerID;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleNeedsCLinkScanner, "setDeviceChangedHandler:", v9);
    v7 = self->_bleNeedsCLinkScanner;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100027898;
    v8[3] = &unk_100111860;
    v8[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }
}

- (BOOL)_serverBLENeedsCLinkScannerScreenOff
{
  BOOL v2;
  void *v3;

  if (self->_prefCommunal)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v2 = (objc_msgSend(v3, "idsHasAppleTV") & 1) != 0
    || (objc_msgSend(v3, "idsHasHomePod") & 1) != 0
    || (objc_msgSend(v3, "idsHasMac") & 1) != 0
    || (int)objc_msgSend(v3, "idsHandheldCount") > 2;

  return v2;
}

- (void)_serverBLENeedsCLinkScannerDeviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *bleNeedsCLinkDevices;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  RPCompanionLinkDaemon *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsIdentifier"));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleNeedsCLinkDevices, "objectForKeyedSubscript:", v6));
    if (objc_msgSend(v4, "deviceActionType") != 51)
    {
      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleNeedsCLinkDevices, "setObject:forKeyedSubscript:", 0, v6);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]", 30, "NeedsCLink device lost: %@\n", v8);
        }
      }
      goto LABEL_44;
    }
    bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
    if (!bleNeedsCLinkDevices)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v11 = self->_bleNeedsCLinkDevices;
      self->_bleNeedsCLinkDevices = v10;

      bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bleNeedsCLinkDevices, "setObject:forKeyedSubscript:", v4, v6);
    if (v8)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]", 30, "NeedsCLink device changed: %@\n", v4);
      }
LABEL_44:
      -[RPCompanionLinkDaemon _update](self, "_update");

      goto LABEL_45;
    }
    v27 = v6;
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]", 30, "NeedsCLink device found: %@\n", v4);
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleNeedsCLinkDevices, "allValues"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v13)
    {
LABEL_37:

      self = v26;
      v6 = v27;
LABEL_43:
      v8 = 0;
      goto LABEL_44;
    }
    v14 = v13;
    v15 = *(_QWORD *)v29;
LABEL_23:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsIdentifier"));
      v19 = v7;
      v20 = v19;
      if (v18 == v19)
        break;
      if ((v7 != 0) != (v18 == 0))
      {
        v21 = objc_msgSend(v18, "isEqual:", v19);

        if (v21)
          goto LABEL_31;
      }
      else
      {

      }
LABEL_35:
      if (v14 == (id)++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v14)
          goto LABEL_23;
        goto LABEL_37;
      }
    }

LABEL_31:
    v22 = objc_msgSend(v17, "isBLEDeviceReplaced");

    if (v22)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]", 30, "Replaced NeedsCLink device %@ -> %@", v17, v4);
      }
      self = v26;
      v23 = v26->_bleNeedsCLinkDevices;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", 0, v25);

      v6 = v27;
      goto LABEL_43;
    }
    goto LABEL_35;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]", 30, "Ignoring NeedsCLink found: No ID, %@\n", v4);
LABEL_45:

}

- (void)_serverBLENeedsCLinkScannerDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleNeedsCLinkDevices, "objectForKeyedSubscript:", v5));
    if (v6)
    {
      if (objc_msgSend(v7, "isBLEDeviceReplaced"))
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceLost:]", 30, "Ignoring NeedsCLink lost, BLE Device is being replaced: %@\n", v7);
        }
        objc_msgSend(v6, "setIsBLEDeviceReplaced:", 1);
        -[RPCompanionLinkDaemon _schedulePendingLostNeedsCLinkDeviceTimer](self, "_schedulePendingLostNeedsCLinkDeviceTimer");
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleNeedsCLinkDevices, "setObject:forKeyedSubscript:", 0, v5);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceLost:]", 30, "NeedsCLink device lost: %@\n", v6);
        }
        -[RPCompanionLinkDaemon _update](self, "_update");
      }
    }

  }
  else if (dword_100130248 <= 30
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceLost:]", 30, "Ignoring NeedsCLink lost: No ID, %@\n", v7);
  }

}

- (void)_schedulePendingLostNeedsCLinkDeviceTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *pendingLostNeedsCLinkDevicesTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (!self->_pendingLostNeedsCLinkDevicesTimer)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _schedulePendingLostNeedsCLinkDeviceTimer]", 30, "Scheduling timer to process replaced NeedsCLink devices");
    }
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pendingLostNeedsCLinkDevicesTimer = self->_pendingLostNeedsCLinkDevicesTimer;
    self->_pendingLostNeedsCLinkDevicesTimer = v3;

    v5 = self->_pendingLostNeedsCLinkDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100028104;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(self->_pendingLostNeedsCLinkDevicesTimer, 0.5, -1.0, 0.5);
    dispatch_activate((dispatch_object_t)self->_pendingLostNeedsCLinkDevicesTimer);
  }
}

- (void)_processPendingLostNeedsCLinkDevices
{
  void *v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *bleNeedsCLinkDevices;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleNeedsCLinkDevices, "allValues"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isBLEDeviceReplaced"))
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _processPendingLostNeedsCLinkDevices]", 30, "Process lost event for replaced NeedsCLink device: %@\n", v9);
          }
          bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](bleNeedsCLinkDevices, "setObject:forKeyedSubscript:", 0, v12);

          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
      -[RPCompanionLinkDaemon _update](self, "_update");
  }
  else
  {

  }
}

- (BOOL)_serverBonjourShouldRun
{
  return self->_prefServerBonjourAlways
      || self->_serverBonjourInfraPairing
      || self->_prefServerBonjourOpportunitistic
      && ((-[CUSystemMonitor powerUnlimited](self->_systemMonitor, "powerUnlimited") & 1) != 0
       || !-[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked"));
}

- (BOOL)_serverBonjourAWDLShouldRun
{
  void *v3;
  id v4;
  BOOL result;

  result = -[NSMutableDictionary count](self->_bleNeedsCLinkDevices, "count")
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices")), v4 = objc_msgSend(v3, "count"), v3, v4)|| self->_bonjourAWDLAdvertiserForce|| -[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count") != 0;
  return result;
}

- (void)_serverBonjourEnsureStarted
{
  const char *v3;
  CUBonjourAdvertiser *v4;
  CUBonjourAdvertiser *bonjourAdvertiser;

  if (self->_bonjourAdvertiser)
  {
    -[RPCompanionLinkDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
    return;
  }
  if (!self->_btAdvAddrData)
  {
    if (dword_100130248 > 20 || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 20))
      return;
    v3 = "Deferring Bonjour advertise without BT addr\n";
LABEL_14:
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourEnsureStarted]", 20, v3);
    return;
  }
  if ((int)-[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort") <= 0)
  {
    if (dword_100130248 > 20 || dword_100130248 == -1 && !_LogCategory_Initialize(&dword_100130248, 20))
      return;
    v3 = "Deferring Bonjour advertise without TCP listening port\n";
    goto LABEL_14;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourEnsureStarted]", 30, "Bonjour advertiser start\n");
  v4 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = v4;

  -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourAdvertiser setDomain:](self->_bonjourAdvertiser, "setDomain:", CFSTR("local."));
  -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:", CFSTR("CLink"));
  -[CUBonjourAdvertiser setPort:](self->_bonjourAdvertiser, "setPort:", -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
  -[CUBonjourAdvertiser setServiceType:](self->_bonjourAdvertiser, "setServiceType:", CFSTR("_companion-link._tcp"));
  -[RPCompanionLinkDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
  -[CUBonjourAdvertiser activate](self->_bonjourAdvertiser, "activate");
}

- (id)_serverBonjourAuthTagString
{
  NSString *v3;
  NSString *v4;
  NSString *deviceAuthTagStr;

  v3 = self->_deviceAuthTagStr;
  if (!v3)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _serverBonjourAuthTagStringWithData:](self, "_serverBonjourAuthTagStringWithData:", self->_btAdvAddrData));
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = v4;

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAuthTagString]", 30, "AuthTagDevice updated: <%@>\n", self->_deviceAuthTagStr);
    }
    v3 = self->_deviceAuthTagStr;
  }
  return v3;
}

- (id)_serverBonjourAuthTagStringWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identityOfSelfAndReturnError:", 0));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authTagForData:type:error:", v3, 1, 0));
      v7 = v6;
      if (v6)
      {
        v8 = objc_retainAutorelease(v6);
        v9 = NSPrintF("%.3H", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), objc_msgSend(v8, "length"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_serverBonjourTempAuthTagStringWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identityOfTemporarySelfAndReturnError:", 0));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authTagForData:type:error:", v3, 1, 0));
      v7 = v6;
      if (v6)
      {
        v8 = objc_retainAutorelease(v6);
        v9 = NSPrintF("%.3H", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), objc_msgSend(v8, "length"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_serverBonjourUpdateTXT
{
  id v3;
  void *v4;
  NSString *btAdvAddrStr;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int DeviceClass;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSData *v21;
  NSData *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSData *v28;
  NSData *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _serverBonjourAuthTagString](self, "_serverBonjourAuthTagString"));
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("rpAD"));

  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", btAdvAddrStr, CFSTR("rpBA"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 0));
  v8 = v6;
  if (v6)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = NSPrintF("%.3H", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), objc_msgSend(v9, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rpHN"));

  }
  DeviceClass = GestaltGetDeviceClass(v6, v7);
  v38 = 0;
  RPBonjourFlagsUpdateWithRPCompanionLinkFlags(&v38, -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags"));
  v13 = v38;
  if (DeviceClass == 7)
    v13 = v38 | 0x40000;
  v14 = v13 & 0xFFFFFFFFFFBFFFFDLL | (2 * self->_prefCommunal) | ((unint64_t)self->_prefCoreDeviceEnabled << 22);
  v38 = v14;
  if (DeviceClass == 100)
  {
    v38 = v14 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)self->_prefCoreDevicePaired << 21);
    sub_100018144(100);
LABEL_12:
    v15 = v38 | 0x20000;
    goto LABEL_14;
  }
  if (sub_100018144(DeviceClass))
    goto LABEL_12;
  v15 = v38;
LABEL_14:
  v38 = v15 & 0xFFFFFFFFFFF6DFFFLL | ((unint64_t)self->_serverBonjourInfraPairing << 19) | ((unint64_t)self->_prefMediaControlEnabled << 13) | ((unint64_t)self->_prefTouchEnabled << 16);
  v16 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
  v38 = v38 & 0xFFFFFFFFFFFFBFFFLL | (((v16 >> 16) & 1) << 14);
  v17 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
  v18 = v38 & 0xFFFFFFFFFF7FFFFFLL | (((v17 >> 34) & 1) << 23);
  v38 = v18;
  if (v18)
  {
    v19 = NSPrintF("0x%llX", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("rpFl"));

  }
  v21 = self->_homeKitAuthTag;

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);
    v23 = -[NSData bytes](v22, "bytes");
    v24 = -[NSData length](v22, "length");
    v25 = -[NSData length](v22, "length");
    v26 = NSPrintF("%.3H", v23, v24, v25, v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("rpHA"));

  }
  v28 = self->_homeKitRotatingID;

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);
    v30 = NSPrintF("%.3H", -[NSData bytes](v29, "bytes"), -[NSData length](v29, "length"), -[NSData length](v29, "length"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("rpHI"));

  }
  v32 = -[RPCompanionLinkDaemon _localMediaAccessControlSetting](self, "_localMediaAccessControlSetting");
  if (v32 - 1 >= 2)
    v33 = 0;
  else
    v33 = v32;
  v34 = NSPrintF("%d", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("rpMac"));

  if (self->_prefCommunal)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));
    if (v36)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("rpMd"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("rpVr"));
  if (-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:](self, "_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:", 6))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier"));
    if (v37)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("rpMRtID"));

  }
  -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAdvertiser, "setTxtDictionary:", v3);

}

- (BOOL)_serverBonjourAWDLAdvertiserShouldRun
{
  void *v3;
  id v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char **v12;
  char **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  char *v44;
  char *v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];

  if (self->_bonjourAWDLAdvertiserForce)
    return 1;
  if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
    return 1;
  if (-[RPCompanionLinkDaemon _haveActiveServerConnectionsOnAWDL](self, "_haveActiveServerConnectionsOnAWDL"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  if (!-[NSMutableDictionary count](self->_bleNeedsCLinkDevices, "count"))
    return 0;
  if (!self->_prefUseTargetAuthTag)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identityOfSelfAndReturnError:", 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identityOfTemporarySelfAndReturnError:", 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIRKData"));
  if (!v11)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Enabling Bonjour AWDL advertiser as selfIdentity (%@) does not have selfIRK\n", v8);
    }
    v5 = 1;
    goto LABEL_67;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleNeedsCLinkDevices, "allValues"));
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v50)
  {
    v5 = 0;
    goto LABEL_66;
  }
  v12 = &selRef_sharedInstance;
  v13 = &selRef_connectionInvalidatedCore;
  v49 = *(_QWORD *)v53;
  v46 = v10;
  v47 = v8;
  v43 = v11;
  while (2)
  {
    v14 = 0;
    v44 = v13[76];
    v45 = v12[9];
    do
    {
      if (*(_QWORD *)v53 != v49)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bleDevice"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "advertisementFields"));
      TypeID = CFDataGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v17, CFSTR("tatag"), TypeID, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

      if (!v20)
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v38 = sub_1000213B8(v15);
          v28 = (id)objc_claimAutoreleasedReturnValue(v38);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Enabling Bonjour AWDL advertiser as device (%@) does not have target AuthTag\n", v28);
          goto LABEL_64;
        }
        goto LABEL_65;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authTagForData:type:error:", v21, 2, 0));
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v23 = v15;
        if ((objc_opt_respondsToSelector(v23, v45) & 1) != 0)
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "shortDescription"));
        }
        else if ((objc_opt_respondsToSelector(v23, v44) & 1) != 0)
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "descriptionWithLevel:", 50));
        }
        else
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
        }
        v25 = (void *)v24;

        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Evaluating target AuthTag <%@> from device (%@) using BLE addr %.6a selfAuthTag <%@>\n", v20, v25, objc_msgSend(objc_retainAutorelease(v21), "bytes"), v22);
      }
      v51 = v21;
      v26 = objc_retainAutorelease(v22);
      v27 = objc_msgSend(v26, "bytes");
      v28 = objc_retainAutorelease(v20);
      if (!memcmp(v27, objc_msgSend(v28, "bytes"), (size_t)objc_msgSend(v28, "length")))
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v39 = sub_1000213B8(v15);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Enabling Bonjour AWDL advertiser as target AuthTag from device (%@) is a match\n", v40);

        }
LABEL_64:

LABEL_65:
        v5 = 1;
        v11 = v43;
        goto LABEL_66;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiser advertisingAddressDataNonConnectable](self->_cbAdvertiser, "advertisingAddressDataNonConnectable"));
      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIRKData"));

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authTagForData:type:error:", v29, 2, 0));
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            v32 = sub_1000213B8(v15);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Evaluating target AuthTag <%@> from device (%@) using non-connectable BLE addr %.6a selfTemporaryAuthTag <%@>\n", v28, v33, objc_msgSend(objc_retainAutorelease(v29), "bytes"), v31);

          }
          v34 = objc_retainAutorelease(v31);
          v35 = objc_msgSend(v34, "bytes");
          v36 = objc_retainAutorelease(v28);
          if (!memcmp(v35, objc_msgSend(v36, "bytes"), (size_t)objc_msgSend(v36, "length")))
          {
            v8 = v47;
            if (dword_100130248 <= 30
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
            {
              v41 = sub_1000213B8(v15);
              v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Enabling Bonjour AWDL advertiser as target AuthTag from device (%@) is a match\n", v42);

            }
            v28 = v36;
            v10 = v46;
            goto LABEL_64;
          }
          v8 = v47;
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Skip enabling Bonjour AWDL advertiser as target AuthTag <%@> did not match hash <%@>\n", v36, v26);
          }

          v10 = v46;
        }
      }

      v14 = (char *)v14 + 1;
    }
    while (v50 != v14);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    v5 = 0;
    v11 = v43;
    v12 = &selRef_sharedInstance;
    v13 = &selRef_connectionInvalidatedCore;
    v50 = v37;
    if (v37)
      continue;
    break;
  }
LABEL_66:

LABEL_67:
  return v5;
}

- (void)_serverBonjourAWDLAdvertiserEnsureStarted
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  CUBonjourAdvertiser *v9;
  CUBonjourAdvertiser *bonjourAWDLAdvertiser;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSData *v15;

  if (self->_bonjourAWDLAdvertiser)
  {
    -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
  }
  else
  {
    v15 = self->_btAdvAddrData;
    if (v15)
    {
      v3 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
      if ((int)v3 <= 0)
      {
        if (dword_100130248 <= 20
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted]", 20, "Deferring Bonjour AWDL advertise without TCP listening port\n");
        }
      }
      else
      {
        v5 = v3;
        if (GestaltGetDeviceClass(v3, v4) != 11)
        {
          if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count")
            || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices")), v7 = objc_msgSend(v6, "count"), v6, v7))
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
            objc_msgSend(v8, "activateForClient:", CFSTR("Ensemble"));

          }
        }
        v9 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
        self->_bonjourAWDLAdvertiser = v9;

        -[CUBonjourAdvertiser setAdvertiseFlags:](self->_bonjourAWDLAdvertiser, "setAdvertiseFlags:", 2048);
        -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAWDLAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
        -[CUBonjourAdvertiser setDomain:](self->_bonjourAWDLAdvertiser, "setDomain:", CFSTR("local."));
        -[CUBonjourAdvertiser setInterfaceName:](self->_bonjourAWDLAdvertiser, "setInterfaceName:", CFSTR("awdl0"));
        -[CUBonjourAdvertiser setLabel:](self->_bonjourAWDLAdvertiser, "setLabel:", CFSTR("CLink"));
        v11 = NSPrintF("CLink-%@", v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        -[CUBonjourAdvertiser setName:](self->_bonjourAWDLAdvertiser, "setName:", v12);

        -[CUBonjourAdvertiser setPort:](self->_bonjourAWDLAdvertiser, "setPort:", v5);
        -[CUBonjourAdvertiser setServiceType:](self->_bonjourAWDLAdvertiser, "setServiceType:", CFSTR("_companion-link._tcp"));
        -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v13 = CUDescriptionWithLevel(self->_bonjourAWDLAdvertiser, 30);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted]", 30, "Bonjour AWDL advertiser start: %@\n", v14);

        }
        -[CUBonjourAdvertiser activate](self->_bonjourAWDLAdvertiser, "activate");
      }
    }
    else if (dword_100130248 <= 20
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted]", 20, "Deferring Bonjour AWDL advertise without BT addr\n");
    }

  }
}

- (void)_serverBonjourAWDLAdvertiserUpdateTXT
{
  uint64_t v3;
  NSData *v4;
  NSData *deviceAWDLRandomID;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;

  if (self->_deviceAWDLRandomID
    || (v3 = NSRandomData(6, 0),
        v4 = (NSData *)objc_claimAutoreleasedReturnValue(v3),
        deviceAWDLRandomID = self->_deviceAWDLRandomID,
        self->_deviceAWDLRandomID = v4,
        deviceAWDLRandomID,
        (id)-[NSData length](self->_deviceAWDLRandomID, "length") == (id)6))
  {
    v23 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = self->_deviceAWDLRandomID;
    v7 = v6;
    if (v6)
    {
      v8 = objc_retainAutorelease(v6);
      v9 = NSPrintF("%.6a", COERCE_DOUBLE((id)-[NSData bytes](v8, "bytes")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v10, CFSTR("rpBA"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _serverBonjourAuthTagStringWithData:](self, "_serverBonjourAuthTagStringWithData:", v8));
      if (v11)
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v11, CFSTR("rpAD"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _serverBonjourTempAuthTagStringWithData:](self, "_serverBonjourTempAuthTagStringWithData:", v8));
      if (v12)
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, CFSTR("rpTAD"));
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT]", 30, "Using Bluetooth Identifier %@ and AuthTag %@ for AWDL Bonjour advertisement\n", v10, v11);
      }
      v13 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
      v14 = 18432;
      if ((v13 & 0x10000) == 0)
        v14 = 2048;
      if (self->_bonjourAWDLAdvertiseForPairing)
        v15 = v14 | 0x80000;
      else
        v15 = v14;
      v16 = NSPrintF("0x%llX", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("rpFl"));

      v18 = objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("rpVr"));
      if (dword_100130248 <= 30)
      {
        if (dword_100130248 != -1 || (v18 = (id)_LogCategory_Initialize(&dword_100130248, 30), (_DWORD)v18))
        {
          if (self->_bonjourAWDLAdvertiseForPairing)
            v20 = "yes";
          else
            v20 = "no";
          v18 = (id)LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT]", 30, "Bonjour advertise name: %s\n", v20);
        }
      }
      if (GestaltGetDeviceClass(v18, v19) == 4 || self->_bonjourAWDLAdvertiseForPairing)
      {
        v21 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT]", 30, "Using device name: %@\n", v21);
        }
        if (v21)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, CFSTR("rpNm"));

      }
      if (-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:](self, "_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:", 4))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier"));
        if (v22)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("rpMRtID"));

      }
      -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAWDLAdvertiser, "setTxtDictionary:", v23);

    }
  }
}

- (void)_serverReceivedNeedsAWDLEvent:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  uint64_t NSNumber;
  void *v12;
  unsigned int v13;
  const char *v14;
  NSMutableSet *needsAWDLRequestIdentifiers;
  NSMutableSet *v16;
  NSMutableSet *v17;
  OS_dispatch_source *v18;
  OS_dispatch_source *needsAWDLRequestTimer;
  NSObject *v20;
  NSMutableSet *v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *v23;
  _QWORD handler[5];

  v6 = a3;
  v7 = a4;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("_i"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v10)
  {
    NSNumber = NSDictionaryGetNSNumber(v7, CFSTR("_ena"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v13 = objc_msgSend(v12, "BOOLValue");

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v14 = "disable";
      if (v13)
        v14 = "enable";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverReceivedNeedsAWDLEvent:event:]", 30, "Received NeedsAWDL %s event from peer %@\n", v14, v10);
    }
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    if (v13)
    {
      if (needsAWDLRequestIdentifiers)
        goto LABEL_19;
      v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v17 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = v16;

      -[NSMutableSet addObject:](self->_needsAWDLRequestIdentifiers, "addObject:", v10);
      if (self->_needsAWDLRequestTimer)
        goto LABEL_19;
      v18 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = v18;
      v20 = v18;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100029B48;
      handler[3] = &unk_1001110F8;
      handler[4] = self;
      dispatch_source_set_event_handler(v20, handler);
      CUDispatchTimerSet(v20, 15.0, -1.0, 1.0);
      dispatch_activate(v20);
    }
    else
    {
      -[NSMutableSet removeObject:](needsAWDLRequestIdentifiers, "removeObject:", v10);
      if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
        goto LABEL_19;
      v21 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = 0;

      v22 = self->_needsAWDLRequestTimer;
      if (!v22)
        goto LABEL_19;
      v20 = v22;
      dispatch_source_cancel(v20);
      v23 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;

    }
LABEL_19:
    -[RPCompanionLinkDaemon _update](self, "_update");
    goto LABEL_20;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverReceivedNeedsAWDLEvent:event:]", 90, "Ignoring received NeedsAWDL event '%@' as it does not have peer identifier\n", v6);
LABEL_20:

}

- (BOOL)_shouldReceiveActivityLevelOverWiFi:(int64_t)a3
{
  return a3 == 2;
}

- (void)_serverBTAddressMonitorEnsureStarted
{
  CUSystemMonitor *v3;
  CUSystemMonitor *btAdvAddrMonitor;
  CUSystemMonitor *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_btAdvAddrMonitor)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStarted]", 30, "BT address monitor start\n");
    }
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_btAdvAddrMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100029E18;
    v7[3] = &unk_1001110F8;
    v7[4] = self;
    -[CUSystemMonitor setRotatingIdentifierChangedHandler:](self->_btAdvAddrMonitor, "setRotatingIdentifierChangedHandler:", v7);
    v5 = self->_btAdvAddrMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100029E20;
    v6[3] = &unk_1001110F8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_serverBTAddressChanged
{
  id v3;
  uint64_t v4;
  NSString *v5;
  NSString *btAdvAddrStr;
  NSString *deviceAuthTagStr;
  id v8;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor rotatingIdentifierData](self->_btAdvAddrMonitor, "rotatingIdentifierData"));
  if (objc_msgSend(obj, "length") == (id)6
    && (-[NSData isEqual:](self->_btAdvAddrData, "isEqual:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_btAdvAddrData, obj);
    v3 = objc_retainAutorelease(obj);
    v4 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(v3, "bytes")));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v5;

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBTAddressChanged]", 30, "Bluetooth address changed: %.6a\n", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v3), "bytes")));
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;

    v8 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1);
    -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1);
    -[RPCompanionLinkDaemon _update](self, "_update");
  }

}

- (BOOL)_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:(int)a3
{
  uint64_t Int64;
  uint64_t v5;
  uint64_t v6;
  int DeviceClass;
  int v8;
  _BOOL4 v10;
  _BOOL4 v11;
  const char *v14;
  int v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.airplay"), CFSTR("enabled"), (char *)&v16 + 4);
  v5 = CFPrefs_GetInt64(CFSTR("com.apple.airplay"), CFSTR("p2pAllow"), &v16);
  v6 = CFPrefs_GetInt64(CFSTR("com.apple.airplay"), CFSTR("restrictToInfraAdvertising"), &v15);
  DeviceClass = GestaltGetDeviceClass();
  v8 = GestaltGetDeviceClass();
  v10 = Int64 == 1 || HIDWORD(v16) == -6727;
  if (v5 != 1)
    LODWORD(v5) = (DeviceClass == 4 || v8 == 100) && v16 == -6727;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:]", 30, "AirPlay advertisement preferences: enabled %d, p2p %d, intraOnly %d\n", v10, v5, v6 == 1);
  if (a3 == 6)
    return DeviceClass == 4 && v10;
  if (a3 != 4)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      if (a3 > 0xB)
        v14 = "?";
      else
        v14 = off_100112338[a3];
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:]", 90, "Checking AirPlay advertisement with unsupported linkType %@\n", v14);
    }
    return 0;
  }
  v11 = DeviceClass == 4 && v10;
  return v11 && v6 != 1 && ((v5 ^ 1) & 1) == 0;
}

- (void)_serverTCPEnsureStarted
{
  CUTCPServer *v3;
  CUTCPServer *tcpServer;
  CUTCPServer *v5;
  id v6;
  CUTCPServer *v7;
  id v8;
  _QWORD v9[5];

  if (!self->_tcpServer)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverTCPEnsureStarted]", 30, "TCP server start\n");
    }
    v3 = (CUTCPServer *)objc_alloc_init((Class)CUTCPServer);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v3;

    -[CUTCPServer setDispatchQueue:](self->_tcpServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPServer setFlags:](self->_tcpServer, "setFlags:", 13);
    -[CUTCPServer setLabel:](self->_tcpServer, "setLabel:", CFSTR("CLink"));
    -[CUTCPServer setMaxConnectionCount:](self->_tcpServer, "setMaxConnectionCount:", self->_prefMaxConnectionCount);
    -[CUTCPServer setNetLinkManager:](self->_tcpServer, "setNetLinkManager:", self->_netLinkManager);
    -[CUTCPServer setConnectionPrepareHandler:](self->_tcpServer, "setConnectionPrepareHandler:", &stru_100111B18);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002A30C;
    v9[3] = &unk_100111B40;
    v9[4] = self;
    -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v9);
    v5 = self->_tcpServer;
    v8 = 0;
    -[CUTCPServer activateDirectAndReturnError:](v5, "activateDirectAndReturnError:", &v8);
    v6 = v8;
    if (v6)
    {
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverTCPEnsureStarted]", 90, "### TCP server failed: %{error}\n", v6);
      }
      -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
      v7 = self->_tcpServer;
      self->_tcpServer = 0;

    }
    else
    {
      -[RPCompanionLinkDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
    }

  }
}

- (id)_serverTCPHandleConnectionStarted:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSMutableSet *tcpServerConnections;
  NSMutableSet *v13;
  NSMutableSet *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];

  v4 = a3;
  v5 = objc_alloc_init((Class)RPConnection);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v5, "setHomeKitManager:", self->_homeKitManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  objc_msgSend(v5, "setCloudDaemon:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "setIdentityDaemon:", v7);

  v8 = objc_alloc((Class)NSString);
  v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("CLink"), v9);
  objc_msgSend(v5, "setLabel:", v10);

  objc_msgSend(v5, "setLocalDeviceInfo:", self->_localDeviceInfo);
  objc_msgSend(v5, "setTcpConnection:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "label"));
  objc_msgSend(v4, "setLabel:", v11);

  -[RPCompanionLinkDaemon _connectionConfigureCommon:](self, "_connectionConfigureCommon:", v5);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002A600;
  v23[3] = &unk_100111928;
  v23[4] = v5;
  v23[5] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002A638;
  v22[3] = &unk_100111928;
  v22[4] = v5;
  v22[5] = self;
  objc_msgSend(v5, "setPeerUpdatedHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002A6B8;
  v21[3] = &unk_100111950;
  v21[4] = v5;
  v21[5] = self;
  objc_msgSend(v5, "setReceivedEventHandler:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002A73C;
  v20[3] = &unk_100111978;
  v20[4] = v5;
  v20[5] = self;
  objc_msgSend(v5, "setReceivedRequestHandler:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002A7D4;
  v19[3] = &unk_1001119A0;
  v19[4] = v5;
  v19[5] = self;
  objc_msgSend(v5, "setStateChangedHandler:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002A814;
  v18[3] = &unk_100111928;
  v18[4] = v5;
  v18[5] = self;
  objc_msgSend(v5, "setHomeKitUserIdentifierHandler:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002A898;
  v17[3] = &unk_100111928;
  v17[4] = self;
  v17[5] = v5;
  objc_msgSend(v5, "setProxyDeviceUpdateHandler:", v17);
  -[RPCompanionLinkDaemon _configureConnectionForPairing:](self, "_configureConnectionForPairing:", v5);
  tcpServerConnections = self->_tcpServerConnections;
  if (!tcpServerConnections)
  {
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v14 = self->_tcpServerConnections;
    self->_tcpServerConnections = v13;

    tcpServerConnections = self->_tcpServerConnections;
  }
  -[NSMutableSet addObject:](tcpServerConnections, "addObject:", v5);
  objc_msgSend(v5, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  v15 = v5;

  return v15;
}

- (void)_configureConnectionForPairing:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002A948;
  v4[3] = &unk_100111BA8;
  v5 = a3;
  v3 = v5;
  objc_msgSend(v3, "setConfigurePairingHandler:", v4);

}

- (void)_serverTCPHandleConnectionEnded:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if ((objc_msgSend(v4, "controlFlags") & 0x200) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_xpcConnections;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v6)
      goto LABEL_14;
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "netCnx", (_QWORD)v15));
        if ((id)v11 == v4)
        {

        }
        else
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "session"));
          v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cnx"));

          if (v14 != v4)
            continue;
        }
        objc_msgSend(v10, "updateErrorFlags:", 512);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v7)
      {
LABEL_14:

        break;
      }
    }
  }
  -[NSMutableSet removeObject:](self->_tcpServerConnections, "removeObject:", v4, (_QWORD)v15);
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, v4);
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

}

- (void)_serverTCPRemoveConnectionsWithIdentifier:(id)a3 exceptConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v18 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "clientMode") & 1) == 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = -[NSMutableSet copy](self->_tcpServerConnections, "copy");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (v12 != v6)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "peerDeviceInfo"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDeviceInfo"));
            v15 = objc_msgSend(v13, "isEqualToDeviceBasic:", v14);

            if (v15)
            {
              if (dword_100130248 <= 30
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "label"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "label"));
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverTCPRemoveConnectionsWithIdentifier:exceptConnection:]", 30, "Removing stale connection %@, replacing with new connection %@ for device identifier %@\n", v16, v17, v18);

              }
              objc_msgSend(v12, "setInvalidationHandled:", 1);
              -[RPCompanionLinkDaemon _serverTCPHandleConnectionEnded:](self, "_serverTCPHandleConnectionEnded:", v12);
              objc_msgSend(v12, "invalidate");
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)_serverTCPHasActiveConnections
{
  if (self->_prefServerBonjourOpportunitistic)
    return -[RPCompanionLinkDaemon _haveActiveServerConnectionsOnAWDL](self, "_haveActiveServerConnectionsOnAWDL");
  else
    return -[NSMutableSet count](self->_tcpServerConnections, "count") != 0;
}

- (void)_bleServerEnsureStopped
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  CUBLEServer *bleServer;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_bleServer
    && dword_100130248 <= 30
    && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _bleServerEnsureStopped]", 30, "BLE server stop\n");
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_bleServerConnections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v9);
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_bleServerConnections, "removeAllObjects");
  -[CUBLEServer invalidate](self->_bleServer, "invalidate");
  bleServer = self->_bleServer;
  self->_bleServer = 0;

}

- (void)_bleServerHandleConnectionStarted:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSMutableSet *bleServerConnections;
  NSMutableSet *v11;
  NSMutableSet *v12;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];

  v4 = a3;
  v5 = objc_alloc_init((Class)RPConnection);
  objc_msgSend(v5, "setBleConnection:", v4);

  objc_msgSend(v5, "setControlFlags:", 512);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "setIdentityDaemon:", v6);

  v7 = objc_alloc((Class)NSString);
  v8 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v8;
  v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("CLink"), v8);
  objc_msgSend(v5, "setLabel:", v9);

  objc_msgSend(v5, "setLocalDeviceInfo:", self->_localDeviceInfo);
  -[RPCompanionLinkDaemon _connectionConfigureCommon:](self, "_connectionConfigureCommon:", v5);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002B418;
  v18[3] = &unk_100111928;
  v18[4] = v5;
  v18[5] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002B450;
  v17[3] = &unk_100111950;
  v17[4] = v5;
  v17[5] = self;
  objc_msgSend(v5, "setReceivedEventHandler:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002B4D4;
  v16[3] = &unk_100111978;
  v16[4] = v5;
  v16[5] = self;
  objc_msgSend(v5, "setReceivedRequestHandler:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002B56C;
  v15[3] = &unk_1001119A0;
  v15[4] = v5;
  v15[5] = self;
  objc_msgSend(v5, "setStateChangedHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002B5AC;
  v14[3] = &unk_100111928;
  v14[4] = v5;
  v14[5] = self;
  objc_msgSend(v5, "setHomeKitUserIdentifierHandler:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B630;
  v13[3] = &unk_100111928;
  v13[4] = self;
  v13[5] = v5;
  objc_msgSend(v5, "setProxyDeviceUpdateHandler:", v13);
  bleServerConnections = self->_bleServerConnections;
  if (!bleServerConnections)
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v12 = self->_bleServerConnections;
    self->_bleServerConnections = v11;

    bleServerConnections = self->_bleServerConnections;
  }
  -[NSMutableSet addObject:](bleServerConnections, "addObject:", v5);
  objc_msgSend(v5, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

}

- (void)_bleServerHandleConnectionEnded:(id)a3
{
  NSMutableSet *bleServerConnections;
  id v5;

  bleServerConnections = self->_bleServerConnections;
  v5 = a3;
  -[NSMutableSet removeObject:](bleServerConnections, "removeObject:", v5);
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, v5);

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_btPipeSetup:(id)a3 withPriority:(int)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  RPCompanionLinkDaemon *v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    if (v4 > 3)
      v7 = "?";
    else
      v7 = off_100112398[(int)v4];
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeSetup:withPriority:]", 30, "BTPipe %s priority start\n", v7);
  }
  objc_msgSend(v6, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v6, "setLabel:", CFSTR("CLink"));
  objc_msgSend(v6, "setPriority:", v4);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B824;
  v12[3] = &unk_100111928;
  v8 = v6;
  v13 = v8;
  v14 = self;
  objc_msgSend(v8, "setStateChangedHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002B838;
  v10[3] = &unk_100111860;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "activateWithCompletion:", v10);

}

- (void)_btPipeTearDown:(id)a3
{
  unsigned int v4;
  const char *v5;
  RPConnection *btPipeConnection;
  RPConnection *v7;
  id v8;

  v8 = a3;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v4 = objc_msgSend(v8, "priority");
    if (v4 > 3)
      v5 = "?";
    else
      v5 = off_100112398[v4];
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeTearDown:]", 30, "BTPipe %s priority stop\n", v5);
  }
  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    -[RPConnection invalidate](btPipeConnection, "invalidate");
    v7 = self->_btPipeConnection;
    self->_btPipeConnection = 0;

  }
  objc_msgSend(v8, "invalidate");

}

- (void)_btPipeEnsureStopped
{
  CUBluetoothScalablePipe *btPipe;
  CUBluetoothScalablePipe *btPipeHighPriority;

  if (self->_btPipe)
  {
    -[RPCompanionLinkDaemon _btPipeTearDown:](self, "_btPipeTearDown:");
    btPipe = self->_btPipe;
    self->_btPipe = 0;

  }
  if (self->_btPipeHighPriority)
  {
    -[RPCompanionLinkDaemon _btPipeTearDown:](self, "_btPipeTearDown:");
    btPipeHighPriority = self->_btPipeHighPriority;
    self->_btPipeHighPriority = 0;

  }
}

- (void)_btPipeHandleStateChanged:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  const char *v7;
  const char *v8;
  RPConnection *btPipeConnection;
  NSObject *dispatchQueue;
  RPConnection *v11;
  _QWORD block[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v6 = objc_msgSend(v4, "priority");
    if (v6 > 3)
      v7 = "?";
    else
      v7 = off_100112398[v6];
    if (v5 > 2)
      v8 = "?";
    else
      v8 = off_1001123B8[v5];
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeHandleStateChanged:]", 30, "BTPipe %s priority state changed to %s\n", v7, v8);
  }
  btPipeConnection = self->_btPipeConnection;
  if (v5 == 1)
  {
    if (!btPipeConnection
      && -[CUBluetoothScalablePipe state](self->_btPipe, "state") == 1
      && -[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 1)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002BC34;
      block[3] = &unk_1001110F8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  else if (btPipeConnection
         && -[CUBluetoothScalablePipe state](self->_btPipe, "state") == 2
         && -[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 2)
  {
    -[RPConnection invalidate](self->_btPipeConnection, "invalidate");
    v11 = self->_btPipeConnection;
    self->_btPipeConnection = 0;

  }
}

- (void)_btPipeConnectionStart
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  RPConnection *btPipeConnection;
  RPConnection *v12;
  RPConnection *v13;
  id v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[5];
  _QWORD v22[6];

  v3 = objc_alloc_init((Class)RPConnection);
  objc_msgSend(v3, "setBtPipe:", self->_btPipe);
  objc_msgSend(v3, "setBtPipeHighPriority:", self->_btPipeHighPriority);
  objc_msgSend(v3, "setControlFlags:", 64);
  objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v3, "setIdentityDaemon:", v4);

  v5 = objc_alloc((Class)NSString);
  v6 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v6;
  v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("CLink"), v6);
  objc_msgSend(v3, "setLabel:", v7);

  objc_msgSend(v3, "setLocalDeviceInfo:", self->_localDeviceInfo);
  v8 = objc_msgSend(v3, "setPasswordType:", 3);
  if (GestaltGetDeviceClass(v8, v9) == 6)
    v10 = CFSTR("BTPipe-Phone");
  else
    v10 = CFSTR("BTPipe-Watch");
  objc_msgSend(v3, "setPeerIdentifier:", v10);
  objc_msgSend(v3, "setPresent:", 1);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002BEFC;
  v22[3] = &unk_100111928;
  v22[4] = self;
  v22[5] = v3;
  objc_msgSend(v3, "setInvalidationHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002BF08;
  v21[3] = &unk_100111860;
  v21[4] = self;
  objc_msgSend(v3, "setPairVerifyCompletion:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002BF54;
  v20[3] = &unk_100111928;
  v20[4] = v3;
  v20[5] = self;
  objc_msgSend(v3, "setPeerUpdatedHandler:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002BFA4;
  v19[3] = &unk_100111950;
  v19[4] = self;
  v19[5] = v3;
  objc_msgSend(v3, "setReceivedEventHandler:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002BFC0;
  v18[3] = &unk_100111978;
  v18[4] = self;
  v18[5] = v3;
  objc_msgSend(v3, "setReceivedRequestHandler:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002BFE0;
  v17[3] = &unk_1001119A0;
  v17[4] = self;
  v17[5] = v3;
  objc_msgSend(v3, "setStateChangedHandler:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002BFF0;
  v16[3] = &unk_100111928;
  v16[4] = v3;
  v16[5] = self;
  objc_msgSend(v3, "setHomeKitUserIdentifierHandler:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002C074;
  v15[3] = &unk_100111928;
  v15[4] = self;
  v15[5] = v3;
  objc_msgSend(v3, "setProxyDeviceUpdateHandler:", v15);
  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    -[RPConnection invalidate](btPipeConnection, "invalidate");
    v12 = self->_btPipeConnection;
    self->_btPipeConnection = 0;

  }
  v13 = self->_btPipeConnection;
  self->_btPipeConnection = (RPConnection *)v3;
  v14 = v3;

  objc_msgSend(v14, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

}

- (void)_btPipeConnectionEnded:(id)a3
{
  RPConnection *btPipeConnection;

  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0, a3);
  btPipeConnection = self->_btPipeConnection;
  self->_btPipeConnection = 0;

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_btPipeSyncKeysIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeSyncKeysIfNeeded]", 30, "BTPipe sync keys\n");
  v3 = objc_claimAutoreleasedReturnValue(-[CUBluetoothScalablePipe peerIdentifier](self->_btPipe, "peerIdentifier"));
  v4 = (void *)v3;
  if (v3)
  {
    v11 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceForBluetoothUUID:", v11));

    if (v6)
    {
      v7 = objc_alloc_init((Class)NSMutableDictionary);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v8, "addSelfIdentityInfoToMessage:flags:", v7, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      objc_msgSend(v9, "sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:", v7, CFSTR("com.apple.private.alloy.nearby"), 48, v6, 1, 0, 0);

    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeSyncKeysIfNeeded]", 90, "### No IDS device ID for watch identity request for Bluetooth UUID %@\n", v11);
    }

    goto LABEL_18;
  }
  if (dword_100130248 <= 90)
  {
    v11 = 0;
    if (dword_100130248 != -1 || (v10 = _LogCategory_Initialize(&dword_100130248, 90), v4 = 0, v10))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeSyncKeysIfNeeded]", 90, "### No peer identifier for watch identity request\n");
LABEL_18:
      v4 = v11;
    }
  }

}

- (void)_activeDeviceAdded:(id)a3 cnx:(id)a4
{
  RPConnection *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  RPConnection *personalCnx;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = (RPConnection *)a4;
  objc_msgSend(v20, "setLinkType:", -[RPConnection linkType](v6, "linkType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection btPipe](v6, "btPipe"));

  v8 = (unint64_t)objc_msgSend(v20, "statusFlags");
  v9 = 4;
  if (v7)
    v9 = 1;
  objc_msgSend(v20, "setStatusFlags:", v8 | v9);
  if (!self->_prefCommunal)
    goto LABEL_20;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsDeviceIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsPersonalDeviceIdentifier](self->_localDeviceInfo, "idsPersonalDeviceIdentifier"));
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {

  }
  else
  {
    if ((v12 == 0) == (v13 != 0))
    {

      goto LABEL_11;
    }
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if (!v15)
    {
LABEL_11:
      v16 = ~(unint64_t)objc_msgSend(v20, "statusFlags") & 0x10000080000;

      if (v16)
        goto LABEL_20;
      goto LABEL_12;
    }
  }

LABEL_12:
  if (objc_msgSend(v20, "isPersonal"))
  {
    personalCnx = self->_personalCnx;
    objc_msgSend(v20, "setPersonal:", 1);
    objc_msgSend(v20, "setStatusFlags:", (unint64_t)objc_msgSend(v20, "statusFlags") | 0x80);
    objc_storeStrong((id *)&self->_personalCnx, a4);
    if (personalCnx == v6)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(v20, "setPersonal:", 1);
    objc_msgSend(v20, "setStatusFlags:", (unint64_t)objc_msgSend(v20, "statusFlags") | 0x80);
    objc_storeStrong((id *)&self->_personalCnx, a4);
  }
  if (dword_100130248 > 30)
    goto LABEL_24;
  if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activeDeviceAdded:cnx:]", 30, "Personal device added: %@\n", v20);
LABEL_20:
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v18 = CUDescriptionWithLevel(v20, 20);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activeDeviceAdded:cnx:]", 30, "Add active device: %@\n", v19);

  }
LABEL_24:
  -[RPCompanionLinkDaemon _stereoDeviceUpdate:](self, "_stereoDeviceUpdate:", 0);
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  notify_post("com.apple.rapport.CompanionLinkDeviceAdded");
  -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v20);

}

- (void)_activeDeviceRemoved:(id)a3 cnx:(id)a4
{
  RPConnection *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *tcpClientConnections;
  RPConnection *v15;
  id v16;
  _QWORD v17[4];
  RPConnection *v18;
  void *v19;

  v16 = a3;
  v6 = (RPConnection *)a4;
  -[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:](self, "_sessionHandlePeerDisconnect:", v6);
  objc_msgSend(v16, "setLinkType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection btPipe](v6, "btPipe"));

  v8 = (unint64_t)objc_msgSend(v16, "statusFlags");
  v9 = -2;
  if (!v7)
    v9 = -5;
  objc_msgSend(v16, "setStatusFlags:", v8 & v9);
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v10 = CUDescriptionWithLevel(v16, 20);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:]", 30, "Remove active device: %@\n", v11);

  }
  if (self->_personalCnx == v6)
  {
    self->_personalCnx = 0;

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:]", 30, "Personal device removed: %@\n", v16);
    }
    -[RPCompanionLinkDaemon _personalDeviceUpdate](self, "_personalDeviceUpdate");
  }
  -[RPCompanionLinkDaemon _stereoDeviceUpdate:](self, "_stereoDeviceUpdate:", 0);
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  notify_post("com.apple.rapport.CompanionLinkDeviceRemoved");
  -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v6, "peerDeviceInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceIdentifier"));

  tcpClientConnections = self->_tcpClientConnections;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002C7A0;
  v17[3] = &unk_100111C20;
  v18 = v6;
  v19 = v13;
  v15 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpClientConnections, "enumerateKeysAndObjectsUsingBlock:", v17);

}

- (void)_activeDeviceChangedForConnection:(id)a3 bonjourDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDeviceInfo"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("removedServices")));

    if (v9)
      objc_msgSend(v19, "sendReachabilityProbe:", "Bonjour partial remove");
    v10 = objc_msgSend(v7, "updateWithBonjourDevice:", v6);
    if ((_DWORD)v10)
    {
      v11 = v10;
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "label"));
        v13 = (void *)v12;
        if (v12)
          v14 = (const __CFString *)v12;
        else
          v14 = &stru_100115158;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerIdentifier"));
        v16 = v6;
        if ((objc_opt_respondsToSelector(v16, "shortDescription") & 1) != 0)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shortDescription"));
        }
        else if ((objc_opt_respondsToSelector(v16, "descriptionWithLevel:") & 1) != 0)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "descriptionWithLevel:", 50));
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
        }
        v18 = (void *)v17;

        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activeDeviceChangedForConnection:bonjourDevice:]", 30, "Bonjour peer changed <%@ %@>: %@, %#{flags}\n", v14, v15, v18, v11, &unk_1001098EC);
      }
      -[RPCompanionLinkDaemon _activeDeviceChanged:changes:](self, "_activeDeviceChanged:changes:", v7, v11);
    }
  }

}

- (void)_activeDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_xpcConnections;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "reportChangedDevice:changes:", v6, v4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (int)_airPlayLeaderStateUncached
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystem](self->_homeKitManager, "selfAccessoryMediaSystem", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "mediaProfile"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessory"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

        if (v16
          && (!v10 || ((unint64_t)objc_msgSend(v16, "caseInsensitiveCompare:", v10) & 0x8000000000000000) != 0))
        {
          v17 = v16;

          v10 = v17;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "isEqual:", v5))
    v18 = 6;
  else
    v18 = 5;

  return v18;
}

- (void)_connectionConfigureCommon:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  NSMutableSet *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_activeServers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "passwordType");
        if (v11 > 4 || ((1 << (char)v11) & 0x19) == 0)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allowedMACAddresses"));
          objc_msgSend(v4, "setAllowedMACAddresses:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pairSetupACL"));
          objc_msgSend(v4, "setPairSetupACL:", v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "password"));
          objc_msgSend(v4, "setPassword:", v16);

          objc_msgSend(v4, "setPasswordType:", v13);
          v17 = objc_msgSend(v10, "internalAuthFlags");
          if ((v17 & 1) != 0)
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_10002D088;
            v29[3] = &unk_100111C48;
            v29[4] = v10;
            objc_msgSend(v4, "setShowPasswordHandler:", v29);
          }
          if ((v17 & 2) != 0)
          {
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_10002D0E8;
            v28[3] = &unk_100111C70;
            v28[4] = v10;
            objc_msgSend(v4, "setHidePasswordHandler:", v28);
          }
          goto LABEL_17;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_xpcConnections;
  v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "client", (_QWORD)v24));
        objc_msgSend(v4, "setFlags:", objc_msgSend(v4, "flags") | (unsigned __int16)objc_msgSend(v23, "flags") & 0x4000);

      }
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v20);
  }

}

- (unsigned)_controlFlagsToNearbyActionType:(unint64_t)a3
{
  if ((a3 & 0x10000000000) != 0)
    return 38;
  else
    return 0;
}

- (id)_findExistingActiveDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeDevices, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isEqualToDeviceBasic:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_connectionStateChanged:(int)a3 cnx:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *activeDevices;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a4;
  -[RPCompanionLinkDaemon _update](self, "_update");
  if (a3 != 1)
    -[RPCompanionLinkDaemon _interestRemoveForCnx:](self, "_interestRemoveForCnx:", v15);
  if ((objc_msgSend(v15, "flags") & 1) == 0
    && (objc_msgSend(v15, "controlFlags") & 0x200) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerDeviceInfo"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceIdentifier"));
      if (v8 || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"))) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _findExistingActiveDevice:](self, "_findExistingActiveDevice:", v7));
        v10 = v9;
        if (a3 == 1)
        {
          if (v9)
          {
            if ((objc_msgSend(v15, "clientMode") & 1) != 0)
            {
              v11 = v10;
            }
            else
            {
              if (dword_100130248 <= 30
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
              {
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]", 30, "Replacing stale connection with new: %@, %@\n", v8, v15);
              }
              -[RPCompanionLinkDaemon _serverTCPRemoveConnectionsWithIdentifier:exceptConnection:](self, "_serverTCPRemoveConnectionsWithIdentifier:exceptConnection:", v8, v15);
              v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activeDevices, "objectForKeyedSubscript:", v8));

              if (v11
                && dword_100130248 <= 90
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
              {
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]", 90, "### Remove stale device failed: %@\n", v11);
              }
            }
          }
          else
          {
            v11 = 0;
          }
          activeDevices = self->_activeDevices;
          if (!activeDevices)
          {
            v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v14 = self->_activeDevices;
            self->_activeDevices = v13;

            activeDevices = self->_activeDevices;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](activeDevices, "setObject:forKeyedSubscript:", v7, v8);
          if (!v11)
            -[RPCompanionLinkDaemon _activeDeviceAdded:cnx:](self, "_activeDeviceAdded:cnx:", v7, v15);
        }
        else if (v9)
        {
          if (objc_msgSend(v9, "isEqualToDeviceBasic:", v7))
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeDevices, "setObject:forKeyedSubscript:", 0, v8);
            -[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:](self, "_activeDeviceRemoved:cnx:", v10, v15);
          }
          else if (dword_100130248 <= 90
                 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]", 90, "### Ignoring remove active device on mismatch: ED %@, CD %@, Cnx %@\n", v10, v7, v15);
          }
          v11 = v10;
        }
        else
        {
          v11 = 0;
        }

      }
      else if (dword_100130248 <= 90
             && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]", 90, "State changed with no device identifier for connection: %@\n", v15);
      }
    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]", 90, "State changed with no device for connection: %@\n", v15);
    }

  }
}

- (BOOL)_destinationID:(id)a3 matchesCnx:(id)a4
{
  id v6;
  RPConnection *v7;
  void *v8;
  unsigned __int8 v9;
  char v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  RPConnection *btPipeConnection;
  void *v26;

  v6 = a3;
  v7 = (RPConnection *)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerIdentifier](v7, "peerIdentifier"));
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if ((v9 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = objc_msgSend(v12, "isEqual:", v6);

    if ((v13 & 1) != 0
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceIdentifier")),
          v15 = objc_msgSend(v14, "isEqual:", v6),
          v14,
          (v15 & 1) != 0)
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicIdentifier")),
          v17 = objc_msgSend(v16, "isEqual:", v6),
          v16,
          (v17 & 1) != 0))
    {
      v10 = 1;
LABEL_7:

      goto LABEL_8;
    }
    if ((-[RPConnection controlFlags](v7, "controlFlags") & 0x200) == 0)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_destinationIdentifierModelMap, "objectForKeyedSubscript:", v6));
      if (v19)
      {
        v20 = (uint64_t (**)(_QWORD, _QWORD))v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "model"));
        v23 = ((uint64_t (**)(_QWORD, void *))v20)[2](v20, v22);
LABEL_12:
        v10 = v23;

LABEL_15:
        goto LABEL_7;
      }
      v24 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_destinationIdentifierRelMap, "objectForKeyedSubscript:", v6));
      if (v24)
      {
        v20 = (uint64_t (**)(_QWORD, _QWORD))v24;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
        v10 = ((uint64_t (**)(_QWORD, id))v20)[2](v20, objc_msgSend(v21, "statusFlags"));
        goto LABEL_15;
      }
      if ((objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:ActivePhone")) & 1) != 0
        || (objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:ActiveWatch")) & 1) != 0
        || objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:PairedCompanion")))
      {
        btPipeConnection = self->_btPipeConnection;
LABEL_20:
        v10 = btPipeConnection == v7;
        goto LABEL_7;
      }
      if (-[RPCompanionLinkDaemon _destinationID:matchesProxyDeviceOnCnx:](self, "_destinationID:matchesProxyDeviceOnCnx:", v6, v7))
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerIdentifier](v7, "peerIdentifier"));
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _destinationID:matchesCnx:]", 30, "Connection to %@ is acting as a proxy for destination %@", v26, v6);

        }
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:PersonalCompanion")))
      {
        btPipeConnection = self->_personalCnx;
        goto LABEL_20;
      }
      if (objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:StereoCounterpart")))
      {
        btPipeConnection = self->_stereoCnx;
        goto LABEL_20;
      }
      if (objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:SameHome")))
      {
LABEL_35:
        v10 = ((unint64_t)-[RPConnection statusFlags](v7, "statusFlags") & 0x10000AE000) != 0;
        goto LABEL_7;
      }
      if (objc_msgSend(v6, "isEqual:", CFSTR("rapport:rdid:SameRoom"))
        && ((unint64_t)-[RPConnection statusFlags](v7, "statusFlags") & 0x10000AE000) != 0)
      {
        v20 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice roomName](self->_localDeviceInfo, "roomName"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "roomName"));
        v23 = objc_msgSend(v20, "isEqual:", v22);
        goto LABEL_12;
      }
    }
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 1;
LABEL_8:

  return v10;
}

- (void)_disconnectRemovedSharedHomeDevices
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identitiesOfType:error:", 9, 0));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D9D0;
  v5[3] = &unk_100111C98;
  v5[4] = v4;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v5);

}

- (void)_disconnectUnauthConnections
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[NSMutableSet copy](self->_tcpServerConnections, "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "flags") & 1) != 0)
        {
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _disconnectUnauthConnections]", 30, "Disconnect unauth: %@\n", v7);
          }
          objc_msgSend(v7, "invalidate");
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_disconnectUnpairedDevices
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identitiesOfType:error:", 8, 0));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002DD9C;
  v5[3] = &unk_100111C98;
  v5[4] = v4;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v5);

}

- (id)_discoveryNonceOrRotate:(BOOL)a3
{
  NSData *v4;
  uint64_t v5;

  if (a3 || (v4 = self->_discoveryNonceData) == 0)
  {
    v5 = NSRandomData(6, 0);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue(v5);
    objc_storeStrong((id *)&self->_discoveryNonceData, v4);
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _discoveryNonceOrRotate:]", 30, "Discovery Nonce updated: <%@>\n", v4);
    }
  }
  return v4;
}

- (void)_duetSyncEnsureStopped
{
  SFClient *duetSyncClient;

  if (self->_duetSyncClient)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _duetSyncEnsureStopped]", 30, "DuetSync advertiser stop\n");
    }
    -[SFClient invalidate](self->_duetSyncClient, "invalidate");
    duetSyncClient = self->_duetSyncClient;
    self->_duetSyncClient = 0;

  }
}

- (id)findAuthAWDLPairingModeDeviceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_authenticatedAWDLPairingModeDevices, "allKeys"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "objectForKeyedSubscript:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "publicIdentifier"));
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if ((v16 & 1) != 0)
          {
            v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_authenticatedAWDLPairingModeDevices, "objectForKeyedSubscript:", v13));

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
LABEL_13:
    v6 = 0;
  }

  return v7;
}

- (id)findConnectedDeviceForIdentifier:(id)a3 controlFlags:(unint64_t)a4 cnx:(id *)a5
{
  id v6;
  id v7;
  _QWORD v9[4];
  RPCompanionLinkDaemon *v10;
  id v11;
  uint64_t *v12;
  unint64_t v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10000F988;
  v19 = sub_10000F950;
  v20 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002E340;
  v9[3] = &unk_100111CC0;
  v13 = a4;
  v10 = self;
  v6 = a3;
  v11 = v6;
  v12 = &v15;
  v14 = a5;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](v10, "_forEachConnectionWithHandler:", v9);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)_findWiFiConnectionByID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10000F988;
  v14 = sub_10000F950;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E6F8;
  v7[3] = &unk_100111CE8;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_findMatchingAWDLBonjourDevice:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self->_bonjourAWDLDevices;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
  if (v6
    && (v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6))) != 0
    || (v6, (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"))) != 0)
    && (v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6))) != 0
    || (v6, (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicIdentifier"))) != 0)
    && (v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6))) != 0)
  {
    v8 = (void *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_findDeviceWithDevice:(id)a3 deviceMap:(id)a4 matchedIdentifier:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDeviceIdentifier"));
  if (v9 && (v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9))) != 0
    || (v9, (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"))) != 0)
    && (v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9))) != 0)
  {
    v11 = (void *)v10;
    v12 = (void *)v10;
    if (a5)
    {
LABEL_6:
      objc_storeStrong(a5, v9);
      v12 = v11;
    }
  }
  else
  {

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicIdentifier"));
    if (!v9)
    {
      v12 = 0;
      goto LABEL_15;
    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
    if (v13)
      v12 = (void *)v13;
    else
      v12 = 0;
    if (v13)
    {
      v11 = (void *)v13;
      if (a5)
        goto LABEL_6;
    }
  }
LABEL_15:

  return v12;
}

- (id)findUnauthDeviceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10000F988;
  v15 = sub_10000F950;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unauthDevices, "objectForKeyedSubscript:", v4));
  v5 = (void *)v12[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002EA8C;
    v8[3] = &unk_100111CE8;
    v9 = v4;
    v10 = &v11;
    -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v8);
    v6 = (id)v12[5];

  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_forEachConnectionWithHandler:(id)a3
{
  id v4;
  void *v5;
  RPConnection *btPipeConnection;
  NSMutableDictionary *tcpClientConnections;
  id v8;
  NSMutableDictionary *tcpOnDemandClientConnections;
  id v10;
  NSMutableSet *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *bleClientConnections;
  NSMutableSet *v16;
  NSMutableSet *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  NSMutableSet *v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41[8];
  _BYTE v42[128];
  _BYTE v43[128];

  v4 = a3;
  v5 = v4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41[0] = 0;
  btPipeConnection = self->_btPipeConnection;
  if (!btPipeConnection
    || ((*((void (**)(id, RPConnection *, char *))v4 + 2))(v4, btPipeConnection, v41), !*((_BYTE *)v39 + 24)))
  {
    tcpClientConnections = self->_tcpClientConnections;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002EE54;
    v35[3] = &unk_100111D10;
    v8 = v5;
    v36 = v8;
    v37 = &v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpClientConnections, "enumerateKeysAndObjectsUsingBlock:", v35);
    if (!*((_BYTE *)v39 + 24))
    {
      tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10002EEA8;
      v32[3] = &unk_100111D10;
      v10 = v8;
      v33 = v10;
      v34 = &v38;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpOnDemandClientConnections, "enumerateKeysAndObjectsUsingBlock:", v32);
      if (!*((_BYTE *)v39 + 24))
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = self->_tcpServerConnections;
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v29;
LABEL_7:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v11);
            (*((void (**)(id, _QWORD, uint64_t *))v10 + 2))(v10, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14), v39 + 3);
            if (*((_BYTE *)v39 + 24))
              break;
            if (v12 == (id)++v14)
            {
              v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
              if (v12)
                goto LABEL_7;
              goto LABEL_13;
            }
          }
        }
        else
        {
LABEL_13:

          bleClientConnections = self->_bleClientConnections;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_10002EEFC;
          v25[3] = &unk_100111D10;
          v16 = (NSMutableSet *)v10;
          v26 = v16;
          v27 = &v38;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleClientConnections, "enumerateKeysAndObjectsUsingBlock:", v25);
          if (!*((_BYTE *)v39 + 24))
          {
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            v17 = self->_bleServerConnections;
            v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v21, v42, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v22;
LABEL_16:
              v20 = 0;
              while (1)
              {
                if (*(_QWORD *)v22 != v19)
                  objc_enumerationMutation(v17);
                ((void (*)(NSMutableSet *, _QWORD, uint64_t *))v16[2].super.super.isa)(v16, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20), v39 + 3);
                if (*((_BYTE *)v39 + 24))
                  break;
                if (v18 == (id)++v20)
                {
                  v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v21, v42, 16);
                  if (v18)
                    goto LABEL_16;
                  break;
                }
              }
            }

          }
          v11 = v26;
        }

      }
    }

  }
  _Block_object_dispose(&v38, 8);

}

- (void)_forEachMatchingDestinationID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  RPCompanionLinkDaemon *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002EFF4;
  v7[3] = &unk_100111D38;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](v8, "_forEachConnectionWithHandler:", v7);

}

- (void)_forEachUniqueMatchingDestinationID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableSet *v9;
  _QWORD v10[4];
  NSMutableSet *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F10C;
  v10[3] = &unk_100111D60;
  v11 = objc_opt_new(NSMutableSet);
  v12 = v6;
  v8 = v6;
  v9 = v11;
  -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:](self, "_forEachMatchingDestinationID:handler:", v7, v10);

}

- (id)_getAppleID
{
  id v2;
  id v3;

  v2 = objc_alloc_init((Class)CUAppleIDClient);
  v3 = objc_msgSend(v2, "copyMyAppleIDAndReturnError:", 0);

  return v3;
}

- (BOOL)_haveActiveServerConnectionsOnAWDL
{
  NSMutableSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_tcpServerConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "linkType", (_QWORD)v7) == 4)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)_hidEnsureStarted
{
  RPHIDDaemon *v3;
  RPHIDDaemon *hidDaemon;
  RPHIDDaemon *v5;
  unsigned __int8 v6;
  id v7;
  id v8;

  if (!self->_hidDaemon)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _hidEnsureStarted]", 30, "HID daemon start\n");
    }
    v3 = objc_alloc_init(RPHIDDaemon);
    hidDaemon = self->_hidDaemon;
    self->_hidDaemon = v3;

    -[RPHIDDaemon setMessenger:](self->_hidDaemon, "setMessenger:", self);
    v5 = self->_hidDaemon;
    v8 = 0;
    v6 = -[RPHIDDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    v7 = v8;
    if ((v6 & 1) == 0
      && dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _hidEnsureStarted]", 90, "### HID daemon start failed: %{error}\n", v7);
    }

  }
}

- (void)interestRegisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *interestPeers;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestPeers, "objectForKeyedSubscript:", v9));
  if (!v11)
  {
    if (!self->_interestPeers)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      interestPeers = self->_interestPeers;
      self->_interestPeers = v12;

    }
    v11 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interestPeers, "setObject:forKeyedSubscript:", v11, v9);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v14, "addObject:", v10);
  }
  else
  {
    v15 = objc_alloc_init((Class)NSMutableSet);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v8);
    objc_msgSend(v15, "addObject:", v10);
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon interestRegisterEventID:peerIdentifier:owner:]", 30, "Interest register local: Peer %@, EventID %@\n", v9, v8);
    }
    v18 = v8;
    v19 = CFSTR("_regEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v20 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

    -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_interest"), v17, v9, 0, 0);
  }

}

- (void)interestDeregisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestPeers, "objectForKeyedSubscript:", v9));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "removeObject:", v10);
      if (!objc_msgSend(v14, "count"))
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v8);
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon interestDeregisterEventID:peerIdentifier:owner:]", 30, "Interest deregister local: Peer %@, EventID %@\n", v9, v8);
        }
        v17 = v8;
        v18 = CFSTR("_deregEvents");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
        v19 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

        -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_interest"), v16, v9, 0, 0);
      }
    }

  }
}

- (void)_interestReceived:(id)a3 cnx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSMutableDictionary *interestEvents;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  CFTypeID v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDeviceInfo"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v9)
  {
    v10 = (void *)v9;

LABEL_4:
    v42 = v7;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    TypeID = CFArrayGetTypeID();
    v43 = v6;
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("_regEvents"), TypeID, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v19)
            objc_enumerationMutation(v14);
          v21 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          v22 = objc_opt_class(NSString, v16, v17);
          if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
          {
            v23 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v21));
            v24 = (id)v23;
            if (!v23)
            {
              v24 = objc_alloc_init((Class)NSMutableSet);
              interestEvents = self->_interestEvents;
              if (!interestEvents)
              {
                v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                v27 = self->_interestEvents;
                self->_interestEvents = v26;

                interestEvents = self->_interestEvents;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](interestEvents, "setObject:forKeyedSubscript:", v24, v21);
            }
            objc_msgSend(v24, "addObject:", v10);
            if (dword_100130248 <= 30
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
            {
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _interestReceived:cnx:]", 30, "Interest register remote: Peer %@, EventID %@ (%d total)\n", v10, v21, objc_msgSend(v24, "count"));
            }
            if (!v23)
              -[RPHIDDaemon registeredEventID:](self->_hidDaemon, "registeredEventID:", v21);
            -[RPMediaControlDaemon registeredEventID:](self->_mediaControlDaemon, "registeredEventID:", v21);

          }
        }
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v18);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = CFArrayGetTypeID();
    v29 = CFDictionaryGetTypedValue(v43, CFSTR("_deregEvents"), v28, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v31)
    {
      v34 = v31;
      v35 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(v30);
          v37 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
          v38 = objc_opt_class(NSString, v32, v33);
          if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v37));
            v40 = v39;
            if (v39)
            {
              objc_msgSend(v39, "removeObject:", v10);
              v41 = objc_msgSend(v40, "count");
              if (!v41)
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interestEvents, "setObject:forKeyedSubscript:", 0, v37);
              if (dword_100130248 <= 30
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
              {
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _interestReceived:cnx:]", 30, "Interest deregister remote: Peer %@, EventID %@ (%d total)\n", v10, v37, v41);
              }
              if (!v41)
              {
                -[RPHIDDaemon deregisteredEventID:](self->_hidDaemon, "deregisteredEventID:", v37);
                -[RPMediaControlDaemon deregisteredEventID:](self->_mediaControlDaemon, "deregisteredEventID:", v37);
              }
            }

          }
        }
        v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v34);
    }

    v7 = v42;
    v6 = v43;
    goto LABEL_42;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDeviceInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicIdentifier"));

  if (v10)
    goto LABEL_4;
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _interestReceived:cnx:]", 90, "### Interest received with no peer identifier: %@\n", v7);
LABEL_42:

}

- (void)_interestRemoveForCnx:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerDeviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  if (v6)
  {
    v15 = v4;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_interestEvents, "allKeys"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v12));
          objc_msgSend(v13, "removeObject:", v6);
          v14 = objc_msgSend(v13, "count");
          if (!v14)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interestEvents, "setObject:forKeyedSubscript:", 0, v12);
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _interestRemoveForCnx:]", 30, "Interest deregister remote: Peer %@, EventID %@ (%d total)\n", v6, v12, v14);
          }
          if (!v14)
          {
            -[RPHIDDaemon deregisteredEventID:](self->_hidDaemon, "deregisteredEventID:", v12);
            -[RPMediaControlDaemon deregisteredEventID:](self->_mediaControlDaemon, "deregisteredEventID:", v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v4 = v15;
  }
  else if (dword_100130248 <= 90
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _interestRemoveForCnx:]", 90, "### Interest remove all with no peer identifier: %@\n", v4);
  }

}

- (void)_interestSendEventID:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v6, 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", v6, v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), 0, 0);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_localDeviceCleanup
{
  NSUserDefaults *airplayPrefs;
  NSUserDefaults *soundBoardPrefs;

  if (self->_mediaAccessControlKVO)
  {
    self->_mediaAccessControlKVO = 0;
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_airplayPrefs, "removeObserver:forKeyPath:context:", self, CFSTR("accessControlLevel"), 0);
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_airplayPrefs, "removeObserver:forKeyPath:context:", self, CFSTR("p2pAllow"), 0);
  }
  airplayPrefs = self->_airplayPrefs;
  self->_airplayPrefs = 0;

  if (self->_soundBoardUserLeaderKVO)
  {
    self->_soundBoardUserLeaderKVO = 0;
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_soundBoardPrefs, "removeObserver:forKeyPath:context:", self, CFSTR("stereo_leader"), 0);
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_soundBoardPrefs, "removeObserver:forKeyPath:context:", self, CFSTR("stereo_leader_info"), 0);
  }
  soundBoardPrefs = self->_soundBoardPrefs;
  self->_soundBoardPrefs = 0;

}

- (int)_localMediaAccessControlSetting
{
  uint64_t Int64;
  uint64_t v3;
  int v4;
  _BOOL4 v5;
  uint64_t v7;

  v7 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.airplay"), CFSTR("accessControlLevel"), (char *)&v7 + 4);
  v3 = CFPrefs_GetInt64(CFSTR("com.apple.airplay"), CFSTR("p2pAllow"), &v7);
  v4 = v3 == 1;
  v5 = Int64 == 1;
  if (Int64 == 1)
    v4 = 3;
  if (v3 == 1)
    v5 = 1;
  if (HIDWORD(v7))
    v5 = 1;
  if ((_DWORD)v7)
    v5 = 1;
  if (v5)
    return v4;
  else
    return 2;
}

- (void)_mediaControlEnsureStarted
{
  RPMediaControlDaemon *v3;
  RPMediaControlDaemon *mediaControlDaemon;
  RPMediaControlDaemon *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  _QWORD v9[5];

  if (!self->_mediaControlDaemon)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaControlEnsureStarted]", 30, "MediaControl daemon start\n");
    }
    v3 = objc_alloc_init(RPMediaControlDaemon);
    mediaControlDaemon = self->_mediaControlDaemon;
    self->_mediaControlDaemon = v3;

    -[RPMediaControlDaemon setMessenger:](self->_mediaControlDaemon, "setMessenger:", self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100030344;
    v9[3] = &unk_100111DB0;
    v9[4] = self;
    -[RPMediaControlDaemon setSendInterestEventHandler:](self->_mediaControlDaemon, "setSendInterestEventHandler:", v9);
    v5 = self->_mediaControlDaemon;
    v8 = 0;
    v6 = -[RPMediaControlDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    v7 = v8;
    if ((v6 & 1) == 0
      && dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaControlEnsureStarted]", 90, "### MediaControl daemon start failed: %{error}\n", v7);
    }

  }
}

- (void)_mediaRemoteIDGet
{
  uint64_t LocalOrigin;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v5[5];

  if (!self->_mediaRemoteIDGetting)
  {
    LocalOrigin = MRMediaRemoteGetLocalOrigin();
    if (LocalOrigin)
    {
      self->_mediaRemoteIDGetting = 1;
      dispatchQueue = self->_dispatchQueue;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100030428;
      v5[3] = &unk_100111DD8;
      v5[4] = self;
      MRMediaRemoteGetDeviceInfo(LocalOrigin, dispatchQueue, v5);
    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaRemoteIDGet]", 90, "### MRMediaRemoteGetLocalOrigin failed\n");
    }
  }
}

- (void)_mediaRouteIDGet
{
  id v3;
  _QWORD v4[6];

  if (!self->_mediaRouteIDGetting)
  {
    self->_mediaRouteIDGetting = 1;
    v3 = objc_alloc_init((Class)CUPairingManager);
    objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000306D4;
    v4[3] = &unk_100111E00;
    v4[4] = v3;
    v4[5] = self;
    objc_msgSend(v3, "getPairingIdentityWithOptions:completion:", 5, v4);

  }
}

- (void)_miscEnsureStopped
{
  void *v3;
  unsigned int v4;

  if (self->_miscStarted)
  {
    if (GestaltGetDeviceClass(self, a2) == 1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      v4 = objc_msgSend(v3, "idsHasWatch");

      if (v4)
        -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", CFSTR("_ctxtColl"));
    }
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", CFSTR("_launchApp"));
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", CFSTR("_sessionStart"));
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", CFSTR("_sessionStop"));
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", CFSTR("_speak"));
    self->_miscStarted = 0;
  }
}

- (void)_miscHandleLaunchAppRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v9;
  NSObject *v10;
  CFTypeID v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD block[5];
  id v29;

  v5 = a3;
  v6 = a4;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v5, CFSTR("_bundleID"), TypeID, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v9)
  {
    v10 = dispatch_queue_create("RPLaunchApp", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030BD4;
    block[3] = &unk_100111E50;
    block[4] = v9;
    v29 = v6;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = CFStringGetTypeID();
    v12 = CFDictionaryGetTypedValue(v5, CFSTR("_urlS"), v11, 0);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (v10 && (v19 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v10)) != 0)
    {
      v20 = v19;
      v21 = dispatch_queue_create("RPOpenURL", 0);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100030C2C;
      v25[3] = &unk_100111E50;
      v26 = v20;
      v27 = v6;
      v22 = v20;
      dispatch_async(v21, v25);

    }
    else
    {
      v23 = RPErrorF(4294960591, (uint64_t)"No valid bundleID or URL to LaunchApp", v13, v14, v15, v16, v17, v18, v24);
      v22 = (id)objc_claimAutoreleasedReturnValue(v23);
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _miscHandleLaunchAppRequest:responseHandler:]", 90, "### LaunchApp failed: %{error}\n", v22);
      }
      (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v22);
    }

  }
}

- (void)_miscHandleSpeakRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v6 = a4;
  v7 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("_speakText"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v10)
  {
    v17 = objc_alloc_init((Class)CUVoiceSession);
    objc_msgSend(v17, "setDispatchQueue:", self->_dispatchQueue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100030ED4;
    v21[3] = &unk_100111E78;
    v21[4] = v17;
    v22 = v6;
    objc_msgSend(v17, "speakText:flags:completion:", v10, 0, v21);

  }
  else
  {
    v18 = RPErrorF(4294960591, (uint64_t)"No text to speak", v11, v12, v13, v14, v15, v16, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _miscHandleSpeakRequest:responseHandler:]", 90, "### Speak failed: %{error}\n", v19);
    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v19);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  _BOOL4 v10;
  CFTypeID TypeID;
  void *v12;
  const char *v13;
  NSObject *dispatchQueue;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD block[5];
  BOOL v18;

  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("stereo_leader")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("stereo_leader_info")))
  {
    if (CFDictionaryGetInt64(v9, NSKeyValueChangeNewKey, 0))
    {
      v10 = 1;
    }
    else
    {
      TypeID = CFDictionaryGetTypeID();
      v12 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.soundboard"), CFSTR("stereo_leader_info"), TypeID, 0);
      v10 = CFDictionaryGetInt64(v12, CFSTR("stereo_leader"), 0) != 0;

    }
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v13 = "no";
      if (v10)
        v13 = "yes";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon observeValueForKeyPath:ofObject:change:context:]", 30, "SoundBoard stereo leader changed: %s\n", v13);
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031100;
    block[3] = &unk_100111EA0;
    block[4] = self;
    v18 = v10;
    dispatch_async(dispatchQueue, block);
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("accessControlLevel")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("p2pAllow")))
  {
    v15 = self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100031124;
    v16[3] = &unk_1001110F8;
    v16[4] = self;
    dispatch_async(v15, v16);
  }

}

- (void)_personalDeviceUpdate
{
  void *v3;
  uint64_t *v4;
  RPConnection *v5;
  void *v6;
  int v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10000F988;
  v13 = sub_10000F950;
  v14 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsPersonalDeviceIdentifier](self->_localDeviceInfo, "idsPersonalDeviceIdentifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000312A4;
  v8[3] = &unk_100111488;
  v8[4] = v3;
  v8[5] = self;
  v8[6] = &v9;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v8);
  v4 = v10;
  v5 = (RPConnection *)v10[5];
  if (v5 != self->_personalCnx)
  {
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 == -1)
      {
        v7 = _LogCategory_Initialize(&dword_100130248, 30);
        v4 = v10;
        if (!v7)
          goto LABEL_6;
        v5 = (RPConnection *)v10[5];
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v5, "peerDeviceInfo"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _personalDeviceUpdate]", 30, "Personal device changed: %@\n", v6);

      v4 = v10;
    }
LABEL_6:
    objc_storeStrong((id *)&self->_personalCnx, (id)v4[5]);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_reachabilityEnsureStopped
{
  CUNetLinkManager *netLinkManager;

  if (self->_netLinkManager
    && dword_100130248 <= 30
    && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _reachabilityEnsureStopped]", 30, "Reachability stop\n");
  }
  -[CUNetLinkManager invalidate](self->_netLinkManager, "invalidate");
  netLinkManager = self->_netLinkManager;
  self->_netLinkManager = 0;

}

- (void)_siriEnsureStarted
{
  RPSiriDaemon *v3;
  RPSiriDaemon *siriDaemon;
  RPSiriDaemon *v5;
  unsigned __int8 v6;
  id v7;
  id v8;

  if (!self->_siriDaemon)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _siriEnsureStarted]", 30, "Siri daemon start\n");
    }
    v3 = objc_alloc_init(RPSiriDaemon);
    siriDaemon = self->_siriDaemon;
    self->_siriDaemon = v3;

    -[RPSiriDaemon setMessenger:](self->_siriDaemon, "setMessenger:", self);
    v5 = self->_siriDaemon;
    v8 = 0;
    v6 = -[RPSiriDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    v7 = v8;
    if ((v6 & 1) == 0
      && dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _siriEnsureStarted]", 90, "### Siri daemon start failed: %{error}\n", v7);
    }

  }
}

- (void)_stereoDeviceUpdate:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  int v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  _BOOL4 v16;
  const char *v17;
  const char *v18;
  RPCompanionLinkDevice *localDeviceInfo;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  _BOOL4 v24;
  const char *v25;
  unsigned int v26;
  int soundBoardUserLeader;
  const char *v28;
  const char *v29;
  int v30;
  RPCompanionLinkDevice *v31;
  unint64_t v32;
  RPConnection *v33;
  RPConnection *stereoCnx;
  void *v35;
  void *v36;
  unsigned int v37;
  int v38;
  int airplayBuddyNotReachableState;
  int v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const CFBooleanRef *v44;
  int v45;
  int airplayLeaderState;
  const char *v47;
  const char *v48;
  const CFBooleanRef *v49;
  NSObject *dispatchQueue;
  void *v51;
  void *v52;
  void *v53;
  _QWORD block[5];
  _QWORD v55[7];
  int v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[2];
  _QWORD v70[2];

  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_10000F988;
  v67 = sub_10000F950;
  v68 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_10000F988;
  v61 = sub_10000F950;
  v6 = v5;
  v62 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier"));
  v8 = -[RPCompanionLinkDevice mediaSystemRole](self->_localDeviceInfo, "mediaSystemRole");
  if (v7 && v8 - 1 <= 1)
  {
    v9 = v8 == 2;
    v55[0] = _NSConcreteStackBlock;
    if (v8 == 1)
      v9 = 2;
    v55[1] = 3221225472;
    v55[2] = sub_100031F94;
    v55[3] = &unk_100111EC8;
    v56 = v9;
    v55[4] = v7;
    v55[5] = &v63;
    v55[6] = &v57;
    -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v55);
  }
  v10 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags");
  v11 = (id)v58[5];
  v12 = v6;
  v13 = v12;
  if (v11 == v12)
  {
    v14 = 1;
  }
  else if ((v12 != 0) == (v11 == 0))
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v11, "isEqual:", v12);
  }

  v15 = v10 & 0x80;
  v16 = v15 >> 7 != v14;
  if (v15 >> 7 != v14)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v17 = "yes";
      if (v15)
        v18 = "yes";
      else
        v18 = "no";
      if (!v14)
        v17 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "MediaSystem leader changed: %s -> %s\n", v18, v17);
    }
    localDeviceInfo = self->_localDeviceInfo;
    if (v14)
      v20 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x80;
    else
      v20 = (unint64_t)-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0xFFFFFF7F;
    -[RPCompanionLinkDevice setFlags:](localDeviceInfo, "setFlags:", v20);
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
  }
  if (v7)
  {
    if (v64[5])
      v21 = 4;
    else
      v21 = 2;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));

    v21 = v22 != 0;
  }
  v23 = -[RPCompanionLinkDevice mediaSystemState](self->_localDeviceInfo, "mediaSystemState");
  v24 = v21 != v23;
  if ((_DWORD)v21 != v23)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      if (v23 > 4)
        v25 = "?";
      else
        v25 = off_100112408[v23];
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "MediaSystemState changed: %s -> %s\n", v25, off_100112408[v21]);
    }
    -[RPCompanionLinkDevice setMediaSystemState:](self->_localDeviceInfo, "setMediaSystemState:", v21);
    v16 = 1;
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
  }
  v26 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0x200;
  soundBoardUserLeader = self->_soundBoardUserLeader;
  if (soundBoardUserLeader != v26 >> 9)
  {
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 != -1
        || (v30 = _LogCategory_Initialize(&dword_100130248, 30),
            soundBoardUserLeader = self->_soundBoardUserLeader,
            v30))
      {
        if (v26)
          v28 = "yes";
        else
          v28 = "no";
        if (soundBoardUserLeader)
          v29 = "yes";
        else
          v29 = "no";
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "User leader changed: %s -> %s\n", v28, v29);
        soundBoardUserLeader = self->_soundBoardUserLeader;
      }
    }
    v31 = self->_localDeviceInfo;
    if (soundBoardUserLeader)
      v32 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x200;
    else
      v32 = (unint64_t)-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0xFFFFFDFF;
    -[RPCompanionLinkDevice setFlags:](v31, "setFlags:", v32);
    v16 = 1;
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
  }
  v33 = (RPConnection *)v64[5];
  stereoCnx = self->_stereoCnx;
  if (v33 != stereoCnx)
  {
    if (v33 && !stereoCnx)
    {
      if (dword_100130248 <= 30)
      {
        if (dword_100130248 == -1)
        {
          if (!_LogCategory_Initialize(&dword_100130248, 30))
            goto LABEL_76;
          v33 = (RPConnection *)v64[5];
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v33, "peerDeviceInfo"));
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "Stereo counterpart found: %@\n", v35);
        goto LABEL_70;
      }
LABEL_76:
      objc_storeStrong((id *)&self->_stereoCnx, (id)v64[5]);
      v24 = 1;
      goto LABEL_77;
    }
    if (v33 || !stereoCnx)
    {
      if (dword_100130248 > 30)
        goto LABEL_76;
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 30))
          goto LABEL_76;
        v33 = (RPConnection *)v64[5];
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v33, "peerDeviceInfo"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "Stereo counterpart changed: %@\n", v35);
    }
    else
    {
      if (dword_100130248 > 30)
        goto LABEL_76;
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 30))
          goto LABEL_76;
        v36 = (void *)v64[5];
      }
      else
      {
        v36 = 0;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "peerDeviceInfo"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "Stereo counterpart lost: %@\n", v35);
    }
LABEL_70:

    goto LABEL_76;
  }
LABEL_77:
  if (a3 <= 3 && v24)
    -[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:](self, "_homeKitSelfAccessoryMediaSystemUpdated:", (a3 + 1));
  if (self->_prefCommunal)
  {
    v37 = v21 - 2;
    if ((v21 - 2) > 2)
    {
      v38 = 2;
    }
    else if (self->_stereoCnx)
    {
      v38 = 5;
    }
    else
    {
      v38 = 6;
    }
    airplayBuddyNotReachableState = self->_airplayBuddyNotReachableState;
    if (v38 == airplayBuddyNotReachableState)
      goto LABEL_105;
    if (dword_100130248 <= 30)
    {
      v40 = self->_airplayBuddyNotReachableState;
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 30))
          goto LABEL_100;
        v40 = self->_airplayBuddyNotReachableState;
      }
      if (v40 >= 8)
      {
        if (v40 <= 9)
          v41 = "?";
        else
          v41 = "User";
      }
      else
      {
        v41 = off_100112478[v40];
      }
      v42 = v38 - 2;
      if (v42 > 4)
        v43 = "?";
      else
        v43 = off_100112430[v42];
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "AirPlay not reachable state changed: %s -> %s\n", v41, v43);
    }
LABEL_100:
    self->_airplayBuddyNotReachableState = v38;
    if (v38 == 2)
    {
      CFPrefs_RemoveValue(CFSTR("com.apple.airplay"), CFSTR("tightSyncBuddyNotReachable"));
    }
    else
    {
      v44 = &kCFBooleanTrue;
      if (v38 != 6)
        v44 = &kCFBooleanFalse;
      CFPrefs_SetValue(CFSTR("com.apple.airplay"), CFSTR("tightSyncBuddyNotReachable"), *v44);
    }
LABEL_105:
    if (v37 > 2)
      v45 = 2;
    else
      v45 = -[RPCompanionLinkDaemon _airPlayLeaderStateUncached](self, "_airPlayLeaderStateUncached");
    airplayLeaderState = self->_airplayLeaderState;
    if (v45 == airplayLeaderState)
    {
      if (v38 == airplayBuddyNotReachableState)
        goto LABEL_131;
LABEL_130:
      CFPreferencesAppSynchronize(CFSTR("com.apple.airplay"));
      notify_post("com.apple.airplay.prefsChanged");
      goto LABEL_131;
    }
    if (dword_100130248 <= 30)
    {
      if (dword_100130248 != -1)
      {
LABEL_113:
        if (airplayLeaderState >= 8)
        {
          if (airplayLeaderState <= 9)
            v47 = "?";
          else
            v47 = "User";
        }
        else
        {
          v47 = off_100112478[airplayLeaderState];
        }
        if (v45 >= 8)
        {
          v48 = "?";
          if (v45 > 9)
            v48 = "User";
        }
        else
        {
          v48 = off_100112478[v45];
        }
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]", 30, "AirPlay leader state changed: %s -> %s\n", v47, v48);
        goto LABEL_125;
      }
      if (_LogCategory_Initialize(&dword_100130248, 30))
      {
        airplayLeaderState = self->_airplayLeaderState;
        goto LABEL_113;
      }
    }
LABEL_125:
    self->_airplayLeaderState = v45;
    if (v45 == 2)
    {
      CFPrefs_RemoveValue(CFSTR("com.apple.airplay"), CFSTR("tightSyncIsGroupLeader"));
    }
    else
    {
      v49 = &kCFBooleanTrue;
      if (v45 != 6)
        v49 = &kCFBooleanFalse;
      CFPrefs_SetValue(CFSTR("com.apple.airplay"), CFSTR("tightSyncIsGroupLeader"), *v49);
    }
    goto LABEL_130;
  }
LABEL_131:
  if (v16)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000320A0;
    block[3] = &unk_1001110F8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
    v69[0] = CFSTR("_clFl");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (unint64_t)-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0x280));
    v69[1] = CFSTR("_msSt");
    v70[0] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[RPCompanionLinkDevice mediaSystemState](self->_localDeviceInfo, "mediaSystemState")));
    v70[1] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 2));
    -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_systemInfoUpdate"), v53, CFSTR("rapport:rdid:SameHome"), 0, 0);

  }
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
}

- (id)_xpcConnections:(id)a3 withControlFlags:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableSet);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "client", (_QWORD)v16));
        v14 = (unint64_t)objc_msgSend(v13, "controlFlags") & a4;

        if (v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)_homeKitEnsureStopped
{
  RPHomeKitManager *rpHomeKitManager;
  RPHomeKitManager *v4;
  CUHomeKitManager *homeKitManager;
  CUHomeKitManager *v6;
  void *v7;
  NSData *homeKitAuthTag;
  NSData *homeKitIRK;
  NSData *homeKitLTPK;
  NSData *homeKitRotatingID;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitEnsureStopped]", 30, "HomeKit services stop\n");
  rpHomeKitManager = self->_rpHomeKitManager;
  if (rpHomeKitManager)
  {
    -[RPHomeKitManager invalidate](rpHomeKitManager, "invalidate");
    v4 = self->_rpHomeKitManager;
    self->_rpHomeKitManager = 0;

  }
  homeKitManager = self->_homeKitManager;
  if (homeKitManager)
  {
    -[CUHomeKitManager invalidate](homeKitManager, "invalidate");
    v6 = self->_homeKitManager;
    self->_homeKitManager = 0;

  }
  if (self->_receiveHomeKitPairingUpdated)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("HMAccessoryPairingIdentityUpdatedNotification"), 0);
    self->_receiveHomeKitPairingUpdated = 0;

  }
  homeKitAuthTag = self->_homeKitAuthTag;
  self->_homeKitAuthTag = 0;

  homeKitIRK = self->_homeKitIRK;
  self->_homeKitIRK = 0;

  homeKitLTPK = self->_homeKitLTPK;
  self->_homeKitLTPK = 0;

  homeKitRotatingID = self->_homeKitRotatingID;
  self->_homeKitRotatingID = 0;

}

- (void)_homeKitPairingUpdated:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_100130248 <= 40 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitPairingUpdated:]", 40, "Received notification that HomeKit pairing identity was updated\n");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003253C;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)_homeKitGetPairingIdentities
{
  CUHomeKitManager *homeKitManager;
  _QWORD v4[5];

  if (!self->_homeKitGettingIdentity && (!self->_homeKitLTPK || self->_homeKitForceGetIdentity))
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitGetPairingIdentities]", 30, "HomeKit identity get\n");
    }
    *(_WORD *)&self->_homeKitForceGetIdentity = 256;
    homeKitManager = self->_homeKitManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100032618;
    v4[3] = &unk_100111F18;
    v4[4] = self;
    -[CUHomeKitManager getPairingIdentityWithOptions:completion:](homeKitManager, "getPairingIdentityWithOptions:completion:", 34, v4);
  }
}

- (BOOL)_homeKitAuthMatchForBonjourDevice:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  int v10;
  __int16 v11;
  int v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  int v16;
  __int16 v17;

  v4 = a3;
  if ((id)-[NSData length](self->_homeKitIRK, "length") == (id)16)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "txtDictionary"));
    v15 = 0;
    CFDictionaryGetData(v5, CFSTR("rpHA"), &v16, 6, &v15, 0);
    if (v15 == 6)
    {
      v14 = 0;
      v12 = 0;
      v13 = 0;
      CFDictionaryGetHardwareAddress(v5, CFSTR("rpBA"), &v13, 6, &v12);
      v6 = 0;
      if (!v12)
      {
        v7 = SipHash(-[NSData bytes](self->_homeKitIRK, "bytes"), &v13, 6);
        LOBYTE(v10) = BYTE5(v7);
        BYTE1(v10) = BYTE4(v7);
        BYTE2(v10) = BYTE3(v7);
        HIBYTE(v10) = BYTE2(v7);
        LOBYTE(v11) = BYTE1(v7);
        HIBYTE(v11) = v7;
        v6 = v10 == v16 && v11 == v17;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_homeKitDecryptRotatingIDForBonjourDevice:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v7;
  _BYTE v8[6];
  int v9;
  __int16 v10;
  int v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BYTE v19[32];

  if (!self->_homeKitLTPK)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "txtDictionary"));
  v13 = 0;
  v11 = 0;
  v12 = 0;
  CFDictionaryGetHardwareAddress(v4, CFSTR("rpBA"), &v12, 6, &v11);
  if (v11)
  {
    v5 = 0;
  }
  else
  {
    v14 = 0;
    CFDictionaryGetData(v4, CFSTR("rpHN"), &v9, 6, &v14, 0);
    v5 = 0;
    if (v14 == 6)
    {
      v14 = 0;
      CFDictionaryGetData(v4, CFSTR("rpHI"), v8, 6, &v14, 0);
      v5 = 0;
      if (v14 == 6)
      {
        CryptoHKDF(kCryptoHashDescriptor_SHA512, -[NSData bytes](self->_homeKitLTPK, "bytes"), -[NSData length](self->_homeKitLTPK, "length"), "HomeKitRotatingKey-Salt", 23, "HomeKitRotatingKey-Info", 23, 32, v19);
        v15 = v12;
        v16 = v13;
        v17 = v9;
        v18 = v10;
        chacha20_all_96x32(v19, &v15, 0, v8, 6, v8);
        v7 = NSPrintF("%.3H", v8, 6, 6);
        v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
      }
    }
  }

  return v5;
}

- (void)_homeKitGetUserInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountID"));

        if (!v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userID"));
          objc_msgSend(v12, "setAccountID:", v10);

          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIdentifier"));
          objc_msgSend(v12, "setHomeKitUserIdentifier:", v11);

        }
      }

    }
  }

}

- (void)_homeKitIdentityUpdated:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSData *homeKitLTPK;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "publicKey"));
    if (!objc_msgSend(v7, "length"))
    {
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        objc_msgSend(v7, "length");
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]", 90, "### No HomeKit public key (%d bytes)\n");
      }
      goto LABEL_29;
    }
    homeKitLTPK = self->_homeKitLTPK;
    v9 = v7;
    v10 = homeKitLTPK;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if ((v9 == 0) == (v10 != 0))
      {

        goto LABEL_20;
      }
      v12 = -[NSData isEqual:](v9, "isEqual:", v10);

      if (!v12)
      {
LABEL_20:
        objc_storeStrong((id *)&self->_homeKitLTPK, v7);
        v13 = objc_alloc_init((Class)RPIdentity);
        objc_msgSend(v13, "setEdPKData:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "secretKey"));
        objc_msgSend(v13, "setEdSKData:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
        objc_msgSend(v13, "setIdentifier:", v16);

        -[RPCompanionLinkDaemon _homeKitGetUserInfo:](self, "_homeKitGetUserInfo:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        objc_msgSend(v17, "setHomeKitIdentity:", v13);

        self->_prefHomeKitConfigured = 1;
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]", 30, "HomeKit identity updated: %{mask}\n", v9);
        }
        -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", &stru_100111F58);
        v18 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1);
        -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1);
        -[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices](self, "_clientBonjourReevaluateAllDevices");
        -[RPCompanionLinkDaemon _update](self, "_update");

LABEL_29:
        goto LABEL_30;
      }
    }
    if (dword_100130248 <= 10
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 10)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]", 10, "HomeKit identity unchanged\n");
    }
    goto LABEL_29;
  }
  if (dword_100130248 <= 60 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 60)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]", 60, "### Get HomeKit identity failed: %{error}\n", v6);
LABEL_30:

}

- (void)_homeKitSelfAccessoryMediaAccessUpdated
{
  void *v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  int v7;
  const char *v8;
  const char *v9;
  id v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice password](self->_localDeviceInfo, "password"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaAccessPassword](self->_homeKitManager, "selfAccessoryMediaAccessPassword"));
  v5 = v3;
  v14 = v5;
  if (v4 == v5)
  {

    goto LABEL_6;
  }
  if ((v5 != 0) == (v4 == 0))
  {

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_19;
  }
LABEL_8:
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    if (objc_msgSend(v14, "length"))
      v8 = "set";
    else
      v8 = "not set";
    if (objc_msgSend(v4, "length"))
      v9 = "set";
    else
      v9 = "not set";
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaAccessUpdated]", 30, "HomeKit SelfAccessory MediaAccess password changed: %s -> %s\n", v8, v9);
  }
  -[RPCompanionLinkDevice setPassword:](self->_localDeviceInfo, "setPassword:", v4);
  v7 = 1;
  -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
LABEL_19:
  v10 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags");
  v11 = -[CUHomeKitManager selfAccessoryMediaAccessFlags](self->_homeKitManager, "selfAccessoryMediaAccessFlags");
  v12 = 8 * (v11 & 1);
  v13 = v10 & 0xFFFFFFE3 | (16 * ((v11 >> 1) & 1)) | (4 * (objc_msgSend(v4, "length") != 0)) & 0xF7 | v12;
  if ((_DWORD)v13 != (_DWORD)v10)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaAccessUpdated]", 30, "HomeKit SelfAccessory MediaAccess flags changed: %#{flags} -> %#{flags}\n", v10, &unk_100109AEE, v13, &unk_100109AEE);
    }
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:", v13);
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
LABEL_29:
    -[RPCompanionLinkDaemon _update](self, "_update");
    if (!v12)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (v7)
    goto LABEL_29;
  if (v12)
LABEL_22:
    -[RPCompanionLinkDaemon _disconnectUnauthConnections](self, "_disconnectUnauthConnections");
LABEL_23:

}

- (void)_homeKitSelfAccessoryMediaSystemUpdated:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  CFTypeID TypeID;
  void *v30;
  unsigned int v31;
  void *v32;
  CUHomeKitManager *homeKitManager;
  void *v34;
  id v35;
  uint64_t v36;
  const char *v37;
  id *v38;
  id v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  const char *v43;
  id *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  _QWORD v61[4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystem](self->_homeKitManager, "selfAccessoryMediaSystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));

  v8 = v7;
  v9 = v5;
  v10 = v9;
  v11 = v8 != v9;
  if (v8 == v9)
  {

    v13 = v10;
  }
  else
  {
    if ((v9 != 0) != (v8 == 0))
    {
      v12 = objc_msgSend(v8, "isEqual:", v9);

      if ((v12 & 1) != 0)
      {
        v11 = 0;
        goto LABEL_13;
      }
    }
    else
    {

    }
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]", 30, "HomeKit SelfAccessory MediaSystem identifier changed: %@ -> %@\n", v10, v8);
    }
    -[RPCompanionLinkDevice setMediaSystemIdentifier:](self->_localDeviceInfo, "setMediaSystemIdentifier:", v8);
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    CFPrefs_SetValue(CFSTR("com.apple.airplay"), CFSTR("tightSyncUUID"), v13);
  }

LABEL_13:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemIdentifierEffective](self->_localDeviceInfo, "mediaSystemIdentifierEffective"));

  if (self->_stereoCnx)
    v15 = v8;
  else
    v15 = 0;
  v16 = v15;

  v17 = v16;
  v18 = v14;
  v19 = v18;
  if (v17 == v18)
  {

    v21 = v11;
    goto LABEL_27;
  }
  if ((v18 != 0) != (v17 == 0))
  {
    v20 = objc_msgSend(v17, "isEqual:", v18);

    v21 = v11;
    if ((v20 & 1) != 0)
      goto LABEL_27;
  }
  else
  {

  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]", 30, "Effective MediaSystem identifier changed: %@ -> %@\n", v19, v17);
  -[RPCompanionLinkDevice setMediaSystemIdentifierEffective:](self->_localDeviceInfo, "setMediaSystemIdentifierEffective:", v17);
  v21 = 1;
  -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
LABEL_27:
  v59 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemName](self->_localDeviceInfo, "mediaSystemName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystem](self->_homeKitManager, "selfAccessoryMediaSystem"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));

  v25 = v24;
  v26 = v22;
  v27 = v26;
  if (v25 == v26)
  {

  }
  else
  {
    if ((v26 != 0) == (v25 == 0))
    {

      goto LABEL_40;
    }
    v28 = objc_msgSend(v25, "isEqual:", v26);

    if ((v28 & 1) == 0)
    {
LABEL_40:
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]", 30, "HomeKit SelfAccessory MediaSystem name changed: '%@' -> '%@'\n", v27, v25);
      }
      -[RPCompanionLinkDevice setMediaSystemName:](self->_localDeviceInfo, "setMediaSystemName:", v25);
      v21 = 1;
      -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
      goto LABEL_45;
    }
  }
  if (!objc_msgSend(v25, "length") && !self->_fixedSoundBoardNameIssue && self->_soundBoardPrefs)
  {
    TypeID = CFStringGetTypeID();
    v30 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.airplay"), CFSTR("name"), TypeID, 0);
    if (objc_msgSend(v30, "length"))
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]", 30, "Clearing stale AirPlay name (was '%@')\n", v30);
      }
      CFPrefs_RemoveValue(CFSTR("com.apple.airplay"), CFSTR("name"));
      v11 = 1;
      self->_fixedSoundBoardNameIssue = 1;
    }

  }
LABEL_45:
  v57 = v27;
  v31 = -[RPCompanionLinkDevice mediaSystemRole](self->_localDeviceInfo, "mediaSystemRole");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystemRole](self->_homeKitManager, "selfAccessoryMediaSystemRole"));
  homeKitManager = self->_homeKitManager;
  if (v32)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystemRole](homeKitManager, "selfAccessoryMediaSystemRole"));
    v35 = objc_msgSend(v34, "type");
    if (v35 == (id)1)
      v36 = 1;
    else
      v36 = 2 * (v35 == (id)2);
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](homeKitManager, "selfAccessory"));
    if (v34)
      v36 = 3;
    else
      v36 = 0;
  }
  v58 = v25;

  if ((_DWORD)v36 != v31)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      if (v31 > 3)
        v37 = "?";
      else
        v37 = off_100112458[v31];
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]", 30, "HomeKit SelfAccessory MediaSystem role changed: %s -> %s\n", v37, off_100112458[v36]);
    }
    -[RPCompanionLinkDevice setMediaSystemRole:](self->_localDeviceInfo, "setMediaSystemRole:", v36);
    if ((_DWORD)v36 == 1)
    {
      v38 = (id *)&RPDeviceRoleStereoLeft;
    }
    else
    {
      if ((_DWORD)v36 != 2)
      {
        v39 = 0;
        goto LABEL_67;
      }
      v38 = (id *)&RPDeviceRoleStereoRight;
    }
    v39 = *v38;
LABEL_67:
    -[RPCompanionLinkDevice setRole:](self->_localDeviceInfo, "setRole:", v39);

    v21 = 1;
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
  }
  v40 = -[RPCompanionLinkDevice mediaSystemRoleEffective](self->_localDeviceInfo, "mediaSystemRoleEffective");
  if (self->_stereoCnx)
    v41 = v36;
  else
    v41 = 0;
  if ((_DWORD)v41 == v40)
  {
    if (!v21)
      goto LABEL_103;
    goto LABEL_89;
  }
  if (dword_100130248 <= 30)
  {
    v42 = v40;
    if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30))
    {
      if (v42 > 3)
        v43 = "?";
      else
        v43 = off_100112458[v42];
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]", 30, "Effective MediaSystem role changed: %s -> %s\n", v43, off_100112458[v41]);
    }
  }
  -[RPCompanionLinkDevice setMediaSystemRoleEffective:](self->_localDeviceInfo, "setMediaSystemRoleEffective:", v41);
  -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
  if ((_DWORD)v41 == 1)
  {
    v44 = (id *)&RPDeviceRoleStereoLeft;
  }
  else
  {
    if ((_DWORD)v41 != 2)
    {
      v45 = 0;
      goto LABEL_88;
    }
    v44 = (id *)&RPDeviceRoleStereoRight;
  }
  v45 = objc_retainAutorelease(*v44);
LABEL_88:
  CFPrefs_SetValue(CFSTR("com.apple.soundautoconfig"), CFSTR("ForcedRole"), v45);
  CFPreferencesAppSynchronize(CFSTR("com.apple.soundautoconfig"));
LABEL_89:
  v55 = v17;
  v56 = v11;
  -[RPCompanionLinkDaemon _update](self, "_update");
  v60[0] = CFSTR("_forcedRole");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice role](self->_localDeviceInfo, "role"));
  v47 = v46;
  if (!v46)
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v61[0] = v47;
  v60[1] = CFSTR("_msId");
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier"));
  v49 = v48;
  if (!v48)
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v50 = a3;
  v61[1] = v49;
  v60[2] = CFSTR("_msNm");
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemName](self->_localDeviceInfo, "mediaSystemName"));
  v52 = v51;
  if (!v51)
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v61[2] = v52;
  v60[3] = CFSTR("_msRo");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[RPCompanionLinkDevice mediaSystemRole](self->_localDeviceInfo, "mediaSystemRole")));
  v61[3] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 4));
  -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_systemInfoUpdate"), v54, CFSTR("rapport:rdid:SameHome"), 0, 0);

  if (!v51)
  if (!v48)

  if (!v46)
  v11 = v56;
  v17 = v55;
  if (v50 <= 3)
    -[RPCompanionLinkDaemon _stereoDeviceUpdate:](self, "_stereoDeviceUpdate:", (v50 + 1));
LABEL_103:
  if (v11)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.airplay"));
    notify_post("com.apple.airplay.prefsChanged");
  }

}

- (void)_homeKitSelfAccessoryUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  void *v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;

  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]", 30, "HomeKit SelfAccessory updated\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice roomName](self->_localDeviceInfo, "roomName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "room"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

    v7 = v6;
    v8 = v4;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      if ((v8 != 0) == (v7 == 0))
      {

        goto LABEL_16;
      }
      v10 = objc_msgSend(v7, "isEqual:", v8);

      if ((v10 & 1) == 0)
      {
LABEL_16:
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]", 30, "HomeKit SelfAccessory room changed: %@ -> %@\n", v9, v7);
        }
        -[RPCompanionLinkDevice setRoomName:](self->_localDeviceInfo, "setRoomName:", v7);
        -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
        if (v7)
        {
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v7, CFSTR("_roomName"));
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, CFSTR("_roomName"));

        }
        v11 = 1;
LABEL_26:
        v13 = -[RPCompanionLinkDevice personalRequestsState](self->_localDeviceInfo, "personalRequestsState");
        v14 = -[CUHomeKitManager selfAccessorySiriEnabled](self->_homeKitManager, "selfAccessorySiriEnabled");
        if (v14)
          v15 = 6;
        else
          v15 = 5;
        if ((_DWORD)v15 == v13)
        {
          if (!v11)
            goto LABEL_45;
        }
        else
        {
          if (dword_100130248 <= 30)
          {
            v16 = v14;
            if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30))
            {
              if (v13 >= 8)
              {
                v17 = "?";
                if (v13 > 9)
                  v17 = "User";
              }
              else
              {
                v17 = off_100112478[v13];
              }
              v18 = "No";
              if (v16)
                v18 = "Yes";
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]", 30, "HomeKit SelfAccessory Personal Requests changed: %s -> %s\n", v17, v18);
            }
          }
          -[RPCompanionLinkDevice setPersonalRequestsState:](self->_localDeviceInfo, "setPersonalRequestsState:", v15);
          -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1);
        }
        -[RPCompanionLinkDaemon _update](self, "_update");
LABEL_45:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "home"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentUser"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager currentUser](self->_rpHomeKitManager, "currentUser"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueIdentifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if ((v25 & 1) == 0)
        {
          -[RPHomeKitManager setCurrentUser:](self->_rpHomeKitManager, "setCurrentUser:", 0);
          -[RPCompanionLinkDaemon _updatePersonalRequestsStateForHomeHubDevices](self, "_updatePersonalRequestsStateForHomeHubDevices");
        }
        if (objc_msgSend(v26, "count"))
          -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_systemInfoUpdate"), v26, CFSTR("rapport:rdid:SameHome"), 0, 0);

        goto LABEL_50;
      }
    }
    v11 = 0;
    goto LABEL_26;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]", 30, "HomeKit SelfAccessory update with no accessory\n");
LABEL_50:

}

- (void)_homeKitUpdateInfo:(BOOL)a3
{
  NSData *homeKitAuthTag;
  NSData *homeKitIRK;
  NSData *homeKitRotatingID;
  uint64_t v7;
  NSData *v8;
  NSData *v9;
  NSData *homeKitLTPK;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  void *v14;
  NSUInteger v15;
  NSData *btAdvAddrData;
  id v17;
  NSUInteger v18;
  NSData *uniqueIDData;
  NSData *v20;
  NSData *v21;
  _BYTE v22[6];
  _BYTE v23[6];
  _BYTE v24[6];
  _BYTE v25[32];

  if (a3)
  {
    homeKitAuthTag = self->_homeKitAuthTag;
    self->_homeKitAuthTag = 0;

    homeKitIRK = self->_homeKitIRK;
    self->_homeKitIRK = 0;

    homeKitRotatingID = self->_homeKitRotatingID;
    self->_homeKitRotatingID = 0;

  }
  if (!self->_homeKitIRK)
  {
    homeKitLTPK = self->_homeKitLTPK;
    if (homeKitLTPK)
    {
      CryptoHKDF(kCryptoHashDescriptor_SHA512, -[NSData bytes](homeKitLTPK, "bytes"), -[NSData length](self->_homeKitLTPK, "length"), "HomeKitIRK-Salt", 15, "HomeKitIRK-Info", 15, 16, v25);
      v11 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v25, 16);
      v12 = self->_homeKitIRK;
      self->_homeKitIRK = v11;

      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitUpdateInfo:]", 30, "HomeKit IRK updated: <%.4@>\n", self->_homeKitIRK);
      }
    }
  }
  if (!self->_homeKitAuthTag && (id)-[NSData length](self->_homeKitIRK, "length") == (id)16)
  {
    if (self->_btAdvAddrData)
    {
      v7 = SipHash(-[NSData bytes](self->_homeKitIRK, "bytes"), -[NSData bytes](self->_btAdvAddrData, "bytes"), -[NSData length](self->_btAdvAddrData, "length"));
      v25[0] = BYTE5(v7);
      v25[1] = BYTE4(v7);
      v25[2] = BYTE3(v7);
      v25[3] = BYTE2(v7);
      v25[4] = BYTE1(v7);
      v25[5] = v7;
      v8 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v25, 6);
      v9 = self->_homeKitAuthTag;
      self->_homeKitAuthTag = v8;

      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitUpdateInfo:]", 30, "HomeKit AuthTag updated: <%@>\n", self->_homeKitAuthTag);
      }
    }
  }
  if (!self->_homeKitRotatingID)
  {
    if (self->_btAdvAddrData)
    {
      v13 = self->_homeKitLTPK;
      if (v13)
      {
        if (self->_uniqueIDData)
        {
          v14 = (void *)kCryptoHashDescriptor_SHA512;
          CryptoHKDF(kCryptoHashDescriptor_SHA512, -[NSData bytes](v13, "bytes"), -[NSData length](self->_homeKitLTPK, "length"), "HomeKitRotatingKey-Salt", 23, "HomeKitRotatingKey-Info", 23, 32, v25);
          v15 = -[NSData length](self->_btAdvAddrData, "length");
          btAdvAddrData = self->_btAdvAddrData;
          if (v15 == 6)
          {
            __memcpy_chk(v23, -[NSData bytes](btAdvAddrData, "bytes"), -[NSData length](self->_btAdvAddrData, "length"), 12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 0));
            if (objc_msgSend(v14, "length") == (id)6)
            {
              v17 = objc_retainAutorelease(v14);
              __memcpy_chk(v24, objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), 6);
              v18 = -[NSData length](self->_uniqueIDData, "length");
              uniqueIDData = self->_uniqueIDData;
              if (v18 == 6)
              {
                chacha20_all_96x32(v25, v23, 0, -[NSData bytes](uniqueIDData, "bytes"), -[NSData length](self->_uniqueIDData, "length"), v22);
                v20 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v22, 6);
                v21 = self->_homeKitRotatingID;
                self->_homeKitRotatingID = v20;

                if (dword_100130248 <= 30
                  && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
                {
                  LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitUpdateInfo:]", 30, "HomeKit rotating ID updated: <%@>\n", self->_homeKitRotatingID);
                }

                return;
              }
LABEL_32:
              FatalErrorF("Bad HomeKitUniqueID length %d", -[NSData length](uniqueIDData, "length"));
            }
          }
          else
          {
            FatalErrorF("Bad BTAdvAddr length %d", -[NSData length](btAdvAddrData, "length"));
          }
          uniqueIDData = (NSData *)FatalErrorF("Bad Discovery Nonce length %d", objc_msgSend(v14, "length"));
          goto LABEL_32;
        }
      }
    }
  }
}

- (void)_homeKitUpdateUserIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[RPHomeKitManager resetHomeKitUserIdentifiers](self->_rpHomeKitManager, "resetHomeKitUserIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager homeKitUserIdentifiers](self->_rpHomeKitManager, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers"));
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v3, "count");

  if (v5 == v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers", (_QWORD)v14));
          LODWORD(v12) = objc_msgSend(v13, "containsObject:", v12);

          if (!(_DWORD)v12)
          {

            goto LABEL_12;
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  else
  {
LABEL_12:
    -[RPCompanionLinkDevice setHomeKitUserIdentifiers:](self->_localDeviceInfo, "setHomeKitUserIdentifiers:", 0);
    -[RPCompanionLinkDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
  }

}

- (id)_filterHomeKitUserIdentifiers:(id)a3
{
  return -[RPHomeKitManager filterHomeKitUserIdentifiers:](self->_rpHomeKitManager, "filterHomeKitUserIdentifiers:", a3);
}

- (id)_eventForHomeHubDevice:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    if (v6)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("_i"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeKitIdentifier"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeKitIdentifier"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("_hkID"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaRouteIdentifier"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaRouteIdentifier"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("_mRtID"));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriInfo"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriInfo"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("_siriInfo"));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "roomName"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "roomName"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("_roomName"));

    }
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _eventForHomeHubDevice:]", 30, "Skip notifying about proxy device with no identifier (%@)", v3);
    }
    v5 = 0;
  }

  return v5;
}

- (void)_homeHubDeviceAdded:(id)a3
{
  id v4;
  NSMutableDictionary *homeHubDevices;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  RPHomeKitManager *rpHomeKitManager;
  void *v16;
  RPHomeKitManager *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a3;
  homeHubDevices = self->_homeHubDevices;
  v27 = v4;
  if (!homeHubDevices)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7 = self->_homeHubDevices;
    self->_homeHubDevices = v6;

    v4 = v27;
    homeHubDevices = self->_homeHubDevices;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homeHubDevices, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      v12 = CUDescriptionWithLevel(v27, 20);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeHubDeviceAdded:]", 40, "HomeHub device added %@\n", v13);

    }
    objc_msgSend(v27, "setPersonalDeviceState:", -[RPCompanionLinkDevice personalDeviceState](self->_localDeviceInfo, "personalDeviceState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsPersonalDeviceIdentifier](self->_localDeviceInfo, "idsPersonalDeviceIdentifier"));
    objc_msgSend(v27, "setIdsPersonalDeviceIdentifier:", v14);

    rpHomeKitManager = self->_rpHomeKitManager;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "homeKitIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager homeHubDeviceWithIdentifier:](rpHomeKitManager, "homeHubDeviceWithIdentifier:", v16));

    v17 = self->_rpHomeKitManager;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "homeKitIdentifier"));
    LODWORD(v17) = -[RPHomeKitManager personalRequestsStateForAccessory:](v17, "personalRequestsStateForAccessory:", v18);

    if ((_DWORD)v17)
      v19 = 6;
    else
      v19 = 5;
    objc_msgSend(v27, "setPersonalRequestsState:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "room"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
    objc_msgSend(v27, "setRoomName:", v21);

    v22 = self->_homeHubDevices;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v27, v23);

    -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v27));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v25, "addObject:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v25, CFSTR("_proxyDevs"), 0));
      -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_proxyAdd"), v26, CFSTR("rapport:rdid:SameHome"), 0, &stru_100111F78);

    }
    goto LABEL_19;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v10 = CUDescriptionWithLevel(v9, 20);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeHubDeviceAdded:]", 30, "Ignoring device added (%@) as it already exists: %@\n", v27, v11);
LABEL_19:

  }
}

- (void)_homeHubDeviceRemoved:(id)a3
{
  NSMutableDictionary *homeHubDevices;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "setStatusFlags:", (unint64_t)objc_msgSend(v11, "statusFlags") & 0xFFFFFFFFEFFFFFFFLL);
  objc_msgSend(v11, "setSiriInfo:", 0);
  -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v11);
  homeHubDevices = self->_homeHubDevices;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](homeHubDevices, "setObject:forKeyedSubscript:", 0, v5);

  if (dword_100130248 <= 40 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
  {
    v6 = CUDescriptionWithLevel(v11, 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeHubDeviceRemoved:]", 40, "HomeHub device removed %@\n", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v11));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v9, "addObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, CFSTR("_proxyDevs"), 0));
    -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_proxyRemove"), v10, CFSTR("rapport:rdid:SameHome"), 0, &stru_100111F98);

  }
}

- (void)_updateHomeHubDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *homeHubDevices;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  RPCompanionLinkDaemon *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        homeHubDevices = self->_homeHubDevices;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homeHubDevices, "objectForKeyedSubscript:", v11));

        if (!v12)
          -[RPCompanionLinkDaemon _homeHubDeviceAdded:](self, "_homeHubDeviceAdded:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v6);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
  v14 = objc_msgSend(v13, "copy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    v29 = *(_QWORD *)v38;
    v30 = self;
    do
    {
      v18 = 0;
      v31 = v16;
      do
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v18);
        if ((objc_msgSend(v19, "statusFlags", v29) & 0x20000000) != 0)
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v20 = v4;
          v21 = v4;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v34;
            while (2)
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(_QWORD *)v34 != v24)
                  objc_enumerationMutation(v21);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1)
                                                                                   + 8 * (_QWORD)j), "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
                v28 = objc_msgSend(v26, "isEqual:", v27);

                if ((v28 & 1) != 0)
                {

                  v4 = v20;
                  self = v30;
                  goto LABEL_26;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
              if (v23)
                continue;
              break;
            }
          }

          self = v30;
          -[RPCompanionLinkDaemon _homeHubDeviceRemoved:](v30, "_homeHubDeviceRemoved:", v19);
          v4 = v20;
LABEL_26:
          v17 = v29;
          v16 = v31;
        }
        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v16);
  }

  -[RPCompanionLinkDaemon _update](self, "_update");
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RPEventRegistration *v11;
  NSMutableDictionary *registeredEvents;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v15));

  if (v10)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon registerEventID:options:handler:]", 90, "### RegisterEventID daemon duplicate '%@'\n", v15);
    }
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon registerEventID:options:handler:]", 30, "RegisterEventID daemon '%@'\n", v15);
    }
    v11 = objc_alloc_init(RPEventRegistration);
    -[RPEventRegistration setEventID:](v11, "setEventID:", v15);
    -[RPEventRegistration setOptions:](v11, "setOptions:", v8);
    -[RPEventRegistration setHandler:](v11, "setHandler:", v9);
    registeredEvents = self->_registeredEvents;
    if (!registeredEvents)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_registeredEvents;
      self->_registeredEvents = v13;

      registeredEvents = self->_registeredEvents;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v11, v15);

  }
}

- (void)deregisterEventID:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_100130248 <= 30)
  {
    if (dword_100130248 != -1 || (v5 = _LogCategory_Initialize(&dword_100130248, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon deregisterEventID:]", 30, "DeregisterEventID daemon '%@'\n", v4);
      v4 = v6;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredEvents, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  unsigned int xidLast;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *dispatchQueue;
  id v32;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(id, void *);
  void *v39;
  unsigned int v40;
  NSObject *group;
  void *v42;
  id v43;
  void *v44;
  _QWORD block[4];
  void (**v46)(id, void *);
  _QWORD *v47;
  _QWORD v48[5];
  id v49;
  void *v50;
  id v51;
  _QWORD *v52;
  uint64_t *v53;
  unsigned int v54;
  _QWORD v55[5];
  id v56;
  void *v57;
  id v58;
  _QWORD *v59;
  uint64_t *v60;
  unsigned int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  int v69;
  _QWORD v70[5];
  id v71;
  unsigned int v72;
  _BYTE v73[128];

  v12 = a3;
  v13 = a5;
  v43 = a6;
  v37 = v13;
  v38 = (void (**)(id, void *))a7;
  v44 = v12;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _checkForProxyOrLocalDestinations:eventID:event:options:completion:](self, "_checkForProxyOrLocalDestinations:eventID:event:options:completion:", v13, v12, a4, v43));
  if (v39)
  {
    xidLast = self->_xidLast;
    if (xidLast + 1 > 1)
      v15 = xidLast + 1;
    else
      v15 = 1;
    self->_xidLast = v15;
    v40 = v15;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &off_10011AA28));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("chatty")));
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
      objc_msgSend(v36, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("_cht"));
    v72 = 0;
    v42 = (void *)OPACKEncoderCreateData(v36, 0, &v72);
    if (!v42)
    {
      v29 = RPErrorF(v72, (uint64_t)"OPACK encode failed", v18, v19, v20, v21, v22, v23, (uint64_t)CFSTR("_t"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      if (v38)
        v38[2](v38, v30);

      goto LABEL_33;
    }
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = sub_10000F988;
    v70[4] = sub_10000F950;
    v71 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    group = dispatch_group_create();
    if (objc_msgSend(v13, "isEqual:", CFSTR("rapport:rdid:InterestedPeers")))
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestEvents, "objectForKeyedSubscript:", v12));
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v63 != v26)
              objc_enumerationMutation(v24);
            v28 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_1000354F0;
            v55[3] = &unk_100111FE8;
            v55[4] = group;
            v56 = v44;
            v57 = v42;
            v61 = v40;
            v58 = v43;
            v59 = v70;
            v60 = &v66;
            -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:](self, "_forEachMatchingDestinationID:handler:", v28, v55);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        }
        while (v25);
      }

    }
    else
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000355EC;
      v48[3] = &unk_100111FE8;
      v48[4] = group;
      v49 = v12;
      v50 = v42;
      v54 = v40;
      v51 = v43;
      v52 = v70;
      v53 = &v66;
      -[RPCompanionLinkDaemon _forEachUniqueMatchingDestinationID:handler:](self, "_forEachUniqueMatchingDestinationID:handler:", v13, v48);

    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000356E8;
    block[3] = &unk_100112010;
    v46 = v38;
    v47 = v70;
    dispatch_group_notify(group, dispatchQueue, block);
    if (*((_DWORD *)v67 + 6))
    {
LABEL_32:

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(v70, 8);

LABEL_33:
      goto LABEL_34;
    }
    v32 = v44;
    if ((objc_msgSend(v32, "isEqual:", CFSTR("HIDRelay")) & 1) != 0
      || (objc_msgSend(v32, "isEqual:", CFSTR("synchSetupStateFromStereoCounterpart")) & 1) != 0
      || (objc_msgSend(v32, "isEqual:", CFSTR("_hidT")) & 1) != 0
      || (objc_msgSend(v32, "isEqual:", CFSTR("_laData")) & 1) != 0)
    {

    }
    else
    {
      v34 = objc_msgSend(v32, "isEqual:", CFSTR("_siA"));

      if (!v34)
      {
        v33 = 30;
        goto LABEL_28;
      }
    }
    v33 = 10;
LABEL_28:
    if ((int)v33 >= dword_100130248
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, v33)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]", v33, "SendEventID '%@' to %@ not found\n", v32, v37);
    }
    goto LABEL_32;
  }
LABEL_34:

}

- (void)_receivedEventID:(id)a3 onXPCCnx:(id)a4 event:(id)a5 options:(id)a6 unauth:(BOOL)a7 rpCnx:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v9 = a7;
  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "registeredEvents"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v22));
  if (v19)
  {
    v20 = (void *)v19;

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "registeredEvents"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("*")));

    if (!v20)
      goto LABEL_7;
  }
  if (!v9
    || -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:](self, "_allowMessageForRegistrationOptions:cnx:", v20, v17))
  {
    objc_msgSend(v14, "receivedEventID:event:options:", v22, v15, v16);
  }
LABEL_7:

}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a6;
  v15 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (((unint64_t)objc_msgSend(v14, "statusFlags") & 0x10000AE000) != 0
    && objc_msgSend(v15, "isEqual:", CFSTR("_interest")))
  {
    -[RPCompanionLinkDaemon _interestReceived:cnx:](self, "_interestReceived:cnx:", v12, v14);
    goto LABEL_12;
  }
  if ((objc_msgSend(v15, "isEqual:", CFSTR("_proxyAdd")) & 1) != 0
    || objc_msgSend(v15, "isEqual:", CFSTR("_proxyRemove")))
  {
    if (!v8)
    {
      -[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:](self, "_proxyDeviceListUpdated:content:options:cnx:", v15, v12, v13, v14);
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (objc_msgSend(v15, "isEqual:", CFSTR("_proxyUpdate")))
  {
    if (!v8)
    {
      -[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:](self, "_existingProxyDeviceUpdated:event:isLocal:", v15, v12, 0);
      goto LABEL_12;
    }
LABEL_7:
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _receivedEventID:event:options:unauth:cnx:]", 90, "Ignoring received event '%@' from unauthenticated device (%@) \n", v15, v14);
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v15, "isEqual:", CFSTR("_needsAWDL")))
  {
LABEL_24:
    -[RPCompanionLinkDaemon _deliverEventID:event:options:unauth:cnx:outError:](self, "_deliverEventID:event:options:unauth:cnx:outError:", v15, v12, v13, v8, v14, 0);
    goto LABEL_12;
  }
  if (!v8)
  {
    -[RPCompanionLinkDaemon _serverReceivedNeedsAWDLEvent:event:](self, "_serverReceivedNeedsAWDLEvent:event:", v15, v12);
    goto LABEL_24;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _receivedEventID:event:options:unauth:cnx:]", 90, "Ignoring received event '%@' from unauthenticated device (%@)\n", v15, v14);
LABEL_12:

}

- (void)_deliverEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7 outError:(id *)a8
{
  _BOOL8 v10;
  id v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  unsigned int v19;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSMutableSet *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];

  v10 = a6;
  v14 = a3;
  v55 = a4;
  v54 = a5;
  v52 = v14;
  v53 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v14));
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "handler"));
  if (v16)
  {
    if (!v10
      || (v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "options"))) != 0
      && (v18 = (void *)v17,
          v19 = -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:](self, "_allowMessageForRegistrationOptions:cnx:", v17, v53), v18, v19))
    {
      ((void (**)(_QWORD, id, id))v16)[2](v16, v55, v54);
    }
  }
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v55, CFSTR("proxyID"), TypeID, 0);
  v22 = objc_claimAutoreleasedReturnValue(TypedValue);
  v29 = (void *)v22;
  if (v22)
    v30 = !v10;
  else
    v30 = 1;
  if (!v30)
  {
    if (!a8)
      goto LABEL_27;
    v48 = RPErrorF(4294960542, (uint64_t)"EventID '%@' for proxy device on unauthenticated connection is not allowed", v23, v24, v25, v26, v27, v28, (uint64_t)v52);
    goto LABEL_34;
  }
  if (!v22)
  {
    v49 = 0;
    v50 = v16;
    v51 = v15;
    v39 = 0;
    goto LABEL_15;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v22));
  if (v31)
  {
    v38 = v31;
    v49 = v29;
    v50 = v16;
    v51 = v15;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "launchInstanceID"));

LABEL_15:
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v40 = self->_xpcConnections;
    v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "launchInstanceID"));
          v47 = v46;
          if ((v39 != 0) == (v46 != 0) && (!v39 || objc_msgSend(v46, "isEqual:", v39)))
            -[RPCompanionLinkDaemon _receivedEventID:onXPCCnx:event:options:unauth:rpCnx:](self, "_receivedEventID:onXPCCnx:event:options:unauth:rpCnx:", v52, v45, v55, v54, v10, v53);

        }
        v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v42);
    }

    v16 = v50;
    v15 = v51;
    v29 = v49;
    goto LABEL_27;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _deliverEventID:event:options:unauth:cnx:outError:]", 90, "### Ignoring event ID '%@', proxy device with identifier %@ is not found", v29, v52);
  if (a8)
  {
    v48 = RPErrorF(4294960569, (uint64_t)"Proxy device %@ is not found", v32, v33, v34, v35, v36, v37, (uint64_t)v29);
LABEL_34:
    *a8 = (id)objc_claimAutoreleasedReturnValue(v48);
  }
LABEL_27:

}

- (void)_registerConnectionRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RPRequestRegistration *v11;
  NSMutableDictionary *registeredRequests;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v15));

  if (v10)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:]", 90, "### RegisterRequestID daemon duplicate '%@'\n", v15);
    }
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:]", 30, "RegisterRequestID daemon '%@'\n", v15);
    }
    v11 = objc_alloc_init(RPRequestRegistration);
    -[RPRequestRegistration setRequestID:](v11, "setRequestID:", v15);
    -[RPRequestRegistration setOptions:](v11, "setOptions:", v8);
    -[RPRequestRegistration setCnxHandler:](v11, "setCnxHandler:", v9);
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v11, v15);

  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RPRequestRegistration *v11;
  NSMutableDictionary *registeredRequests;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v15));

  if (v10)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon registerRequestID:options:handler:]", 90, "### RegisterRequestID daemon duplicate '%@'\n", v15);
    }
  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon registerRequestID:options:handler:]", 30, "RegisterRequestID daemon '%@'\n", v15);
    }
    v11 = objc_alloc_init(RPRequestRegistration);
    -[RPRequestRegistration setRequestID:](v11, "setRequestID:", v15);
    -[RPRequestRegistration setOptions:](v11, "setOptions:", v8);
    -[RPRequestRegistration setHandler:](v11, "setHandler:", v9);
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v11, v15);

  }
}

- (void)deregisterRequestID:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_100130248 <= 30)
  {
    if (dword_100130248 != -1 || (v5 = _LogCategory_Initialize(&dword_100130248, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon deregisterRequestID:]", 30, "DeregisterRequestID daemon '%@'\n", v4);
      v4 = v6;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  -[RPCompanionLinkDaemon sendRequestID:request:destinationID:xpcID:options:responseHandler:](self, "sendRequestID:request:destinationID:xpcID:options:responseHandler:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), 0, a5, a6);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  -[RPCompanionLinkDaemon sendRequestID:request:destinationID:xpcID:options:responseHandler:](self, "sendRequestID:request:destinationID:xpcID:options:responseHandler:", a3, a4, a5, 0, a6, a7);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 xpcID:(unsigned int)a6 options:(id)a7 responseHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  RPCompanionLinkDevice *v19;
  RPCompanionLinkDevice *v20;
  void *v21;
  unsigned int v22;
  RPCompanionLinkDevice *localDeviceInfo;
  RPCompanionLinkDaemon *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _addProxyIdentifier:toDictionary:](self, "_addProxyIdentifier:toDictionary:", v15, a4));
  v19 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v15));
  v20 = v19;
  if (v19 && (-[RPCompanionLinkDevice statusFlags](v19, "statusFlags") & 0x20000000) != 0)
  {
    v24 = self;
    localDeviceInfo = v20;
    goto LABEL_9;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](self->_localDeviceInfo, "effectiveIdentifier"));
  v22 = objc_msgSend(v15, "isEqual:", v21);

  if (v22)
  {
    localDeviceInfo = self->_localDeviceInfo;
    v24 = self;
LABEL_9:
    -[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:](v24, "_proxyDevice:loopbackRequestID:request:options:responseHandler:", localDeviceInfo, v14, v18, v16, v17);
    goto LABEL_10;
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100036388;
  v34[3] = &unk_100112038;
  v39 = &v41;
  v35 = v14;
  v36 = v18;
  v40 = a6;
  v37 = v16;
  v25 = v17;
  v38 = v25;
  -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:](self, "_forEachMatchingDestinationID:handler:", v15, v34);

  if (!*((_BYTE *)v42 + 24))
  {
    v32 = RPErrorF(4294960569, (uint64_t)"'%@' not found", v26, v27, v28, v29, v30, v31, (uint64_t)v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    (*((void (**)(id, _QWORD, _QWORD, void *))v25 + 2))(v25, 0, 0, v33);

  }
  _Block_object_dispose(&v41, 8);
LABEL_10:

}

- (BOOL)_receivedRequestID:(id)a3 onXPCCnx:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 unauth:(BOOL)a8 rpCnx:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (((objc_msgSend(v15, "isEqualToString:", CFSTR("_streamStart")) & 1) != 0
     || objc_msgSend(v15, "isEqualToString:", CFSTR("_streamStop")))
    && !-[RPCompanionLinkDaemon _allowStreamRequest:xpcCnx:rpCnx:](self, "_allowStreamRequest:xpcCnx:rpCnx:", v17, v16, v20))
  {
    v23 = 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "registeredRequests"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v15));

    if (v22
      && (!v9
       || -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:](self, "_allowMessageForRegistrationOptions:cnx:", v22, v20)))
    {
      objc_msgSend(v16, "receivedRequestID:request:options:responseHandler:", v15, v17, v18, v19);
      v23 = 1;
    }
    else
    {
      v23 = 0;
    }

  }
  return v23;
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 unauth:(BOOL)a7 cnx:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  NSMutableSet *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *i;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v54 = a5;
  v16 = a6;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v14));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "handler"));
  v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cnxHandler"));
  if (v19 | v53
    && (!v9
     || (v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "options"))) != 0
     && (v21 = (void *)v20,
         v22 = -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:](self, "_allowMessageForRegistrationOptions:cnx:", v20, v17), v21, v22)))
  {
    v23 = (void *)v53;
    if (v53)
      (*(void (**)(uint64_t, id, id, id, id))(v53 + 16))(v53, v17, v15, v54, v16);
    else
      (*(void (**)(uint64_t, id, id, id))(v19 + 16))(v19, v15, v54, v16);
  }
  else
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v15, CFSTR("proxyID"), TypeID, 0);
    v26 = objc_claimAutoreleasedReturnValue(TypedValue);
    v27 = (void *)v26;
    if (v26)
      v28 = !v9;
    else
      v28 = 1;
    if (v28)
    {
      if (v26)
      {
        if (!-[RPCompanionLinkDaemon _proxyDevice:receivedRequestID:request:options:responseHandler:cnx:](self, "_proxyDevice:receivedRequestID:request:options:responseHandler:cnx:", v26, v14, v15, v54, v16, v17))
        {
          v35 = RPErrorF(4294960582, (uint64_t)"No request handler", v29, v30, v31, v32, v33, v34, v50);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          (*((void (**)(id, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, v36);

        }
      }
      else
      {
        v51 = v19;
        v52 = v18;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v37 = self->_xpcConnections;
        v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v56;
          while (2)
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v40)
                objc_enumerationMutation(v37);
              if (-[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:](self, "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:", v14, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), v15, v54, v16, v9, v17))
              {

                goto LABEL_25;
              }
            }
            v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
            if (v39)
              continue;
            break;
          }
        }

        v48 = RPErrorF(4294960582, (uint64_t)"No request handler", v42, v43, v44, v45, v46, v47, v50);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        (*((void (**)(id, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, v49);

LABEL_25:
        v19 = v51;
        v18 = v52;
        v27 = 0;
      }
    }
    else if (dword_100130248 <= 90
           && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _receivedRequestID:request:options:responseHandler:unauth:cnx:]", 90, "### Ignoring request ID %@ received for proxy device %@ on unAuth connection", v14, v27);
    }

    v23 = (void *)v53;
  }

}

- (BOOL)_allowMessageForRegistrationOptions:(id)a3 cnx:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v9 = v6
    && (v8 = (unint64_t)objc_msgSend(v6, "statusFlags") & 0x70000AF000) != 0
    && (CFDictionaryGetInt64(v5, CFSTR("statusFlags"), 0) & v8) != 0
    || CFDictionaryGetInt64(v5, CFSTR("allowUnauthenticated"), 0) != 0;

  return v9;
}

- (BOOL)_allowStreamRequest:(id)a3 xpcCnx:(id)a4 rpCnx:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  id v25;
  unsigned __int8 v26;
  id v27;
  unsigned __int8 v28;
  void *v29;
  id v30;
  void *v31;
  unsigned __int8 v32;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v35;
  id v36;
  void *v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationDevice"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDeviceInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v15 = v13;
    v16 = v14;
    v17 = v16;
    if (v15 == v16)
      goto LABEL_26;
    if (v16)
    {
      v18 = objc_msgSend(v15, "isEqual:", v16);

      if ((v18 & 1) != 0)
        goto LABEL_27;
    }
    else
    {

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceIdentifier"));
    v15 = v15;
    v20 = v19;
    if (v15 == v20)
      goto LABEL_25;
    v21 = v20;
    if (v20)
    {
      v22 = objc_msgSend(v15, "isEqual:", v20);

      if ((v22 & 1) != 0)
        goto LABEL_28;
    }
    else
    {

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceIdentifier"));

  if (!v23)
  {
    v27 = 0;
    goto LABEL_18;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v15 = v23;
  v25 = v24;
  v17 = v25;
  if (v15 == v25)
  {
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  if (v25)
  {
    v26 = objc_msgSend(v15, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_27;
  }
  else
  {

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceIdentifier"));
  v27 = v15;
  v30 = v29;
  if (v27 == v30)
  {
    v15 = v27;
LABEL_25:

    goto LABEL_26;
  }
  v31 = v30;
  if (!v30)
  {
    v28 = 0;
    v15 = v27;
    goto LABEL_36;
  }
  v32 = objc_msgSend(v27, "isEqual:", v30);

  if ((v32 & 1) != 0)
  {
    v15 = v27;
LABEL_28:
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("_streamSrv"), TypeID, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue(TypedValue);
    if (!v17)
    {
      v28 = 0;
LABEL_37:

      v27 = v15;
      goto LABEL_38;
    }
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "client"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serviceType"));
    v17 = v17;
    v36 = v35;
    v37 = v36;
    if (v17 == v36)
    {
      v28 = 1;
    }
    else if (v36)
    {
      v28 = objc_msgSend(v17, "isEqual:", v36);
    }
    else
    {
      v28 = 0;
    }

LABEL_36:
    goto LABEL_37;
  }
LABEL_18:
  v28 = 0;
LABEL_38:

  return v28;
}

- (void)_proxyDeviceListUpdated:(id)a3 content:(id)a4 options:(id)a5 cnx:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t NSArrayOfClass;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v24;
  uint64_t NSUUID;
  void *v26;
  id v27;
  CFTypeID v28;
  uint64_t v29;
  void *v30;
  CFTypeID v31;
  uint64_t v32;
  void *v33;
  CFTypeID v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  unsigned int v42;
  id v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unsigned int v51;
  _BYTE v52[128];

  v9 = a3;
  v10 = a4;
  v44 = a5;
  v11 = a6;
  v51 = 0;
  v14 = objc_opt_class(NSDictionary, v12, v13);
  NSArrayOfClass = NSDictionaryGetNSArrayOfClass(v10, CFSTR("_proxyDevs"), v14, &v51);
  v16 = (void *)objc_claimAutoreleasedReturnValue(NSArrayOfClass);
  if (v16)
  {
    v39 = v10;
    v40 = v9;
    v42 = objc_msgSend(v9, "isEqual:", CFSTR("_proxyAdd"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v38 = v16;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v48;
      v41 = *(_QWORD *)v48;
      do
      {
        v20 = 0;
        v45 = v18;
        do
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v20);
          TypeID = CFStringGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v21, CFSTR("_i"), TypeID, &v51);
          v24 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          if (v24)
          {
            NSUUID = NSDictionaryGetNSUUID(v21, CFSTR("_hkID"), &v51);
            v26 = (void *)objc_claimAutoreleasedReturnValue(NSUUID);
            if (v26)
            {
              v27 = objc_alloc_init((Class)RPCompanionLinkDevice);
              objc_msgSend(v27, "setIdentifier:", v24);
              objc_msgSend(v27, "setHomeKitIdentifier:", v26);
              objc_msgSend(v27, "setStatusFlags:", (unint64_t)objc_msgSend(v27, "statusFlags") | 0x10000000);
              objc_msgSend(v27, "setFlags:", objc_msgSend(v27, "flags") | 0x2000);
              v28 = CFStringGetTypeID();
              v29 = CFDictionaryGetTypedValue(v21, CFSTR("_mRtID"), v28, &v51);
              v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              if (v30)
                objc_msgSend(v27, "setMediaRouteIdentifier:", v30);
              v31 = CFDictionaryGetTypeID();
              v32 = CFDictionaryGetTypedValue(v21, CFSTR("_siriInfo"), v31, 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              if (v33)
                objc_msgSend(v27, "setSiriInfo:", v33);
              v34 = CFStringGetTypeID();
              v35 = CFDictionaryGetTypedValue(v21, CFSTR("_roomName"), v34, 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
              if (v36)
                objc_msgSend(v27, "setRoomName:", v36);
              objc_msgSend(v27, "setStatusFlags:", (unint64_t)objc_msgSend(v27, "statusFlags") | (unint64_t)objc_msgSend(v11, "statusFlags") & 0x10000AE000);
              if (v42)
                -[RPCompanionLinkDaemon _proxyDeviceAdd:options:eventID:deviceInfo:cnx:](self, "_proxyDeviceAdd:options:eventID:deviceInfo:cnx:", v27, v44, v40, v21, v11);
              else
                -[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:](self, "_proxyDeviceRemove:options:cnx:", v27, v44, v11);

              v18 = v45;
              v19 = v41;
            }
            else if (dword_100130248 <= 90
                   && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
            {
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]", 90, "### Received proxy device info without HomeKit identifier: %@\n", v21);
            }

          }
          else if (dword_100130248 <= 90
                 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
          {
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]", 90, "### Received proxy device info without identifier: %@\n", v21);
          }

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        v18 = v37;
      }
      while (v37);
    }

    v10 = v39;
    v9 = v40;
    v16 = v38;
  }
  else if (dword_100130248 <= 90
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]", 90, "### Received proxy device list without device info: %#m\n", v51);
  }

}

- (void)_proxyDeviceAdd:(id)a3 options:(id)a4 eventID:(id)a5 deviceInfo:(id)a6 cnx:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *homeHubDevices;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "proxyDevices"));

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v13, "setProxyDevices:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "proxyDevices"));
  objc_msgSend(v16, "addObject:", v26);

  homeHubDevices = self->_homeHubDevices;
  if (!homeHubDevices)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v19 = self->_homeHubDevices;
    self->_homeHubDevices = v18;

    homeHubDevices = self->_homeHubDevices;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homeHubDevices, "objectForKeyedSubscript:", v20));

  if (v21)
  {
    -[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:](self, "_existingProxyDeviceUpdated:event:isLocal:", v11, v12, 0);
  }
  else
  {
    v22 = self->_homeHubDevices;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v26, v23);

    objc_msgSend(v26, "setLinkType:", objc_msgSend(v13, "linkType"));
    objc_msgSend(v26, "setStatusFlags:", (unint64_t)objc_msgSend(v26, "statusFlags") | 4);
    -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v26);
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v24 = CUDescriptionWithLevel(v26, 20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceAdd:options:eventID:deviceInfo:cnx:]", 30, "Proxy device added %@\n", v25);

    }
  }

}

- (void)_proxyDeviceRemove:(id)a3 options:(id)a4 cnx:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *homeHubDevices;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyDevices"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
      if (-[RPCompanionLinkDaemon _proxyDevice:isEqualTo:](self, "_proxyDevice:isEqualTo:", v14, v7))
        break;
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v14;

    if (!v15)
      goto LABEL_15;
    if ((objc_msgSend(v15, "statusFlags") & 0x20000000) != 0)
    {
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]", 90, " ### Proxy device removed on connection while it is hosted here: %@\n", v7);
      }
    }
    else
    {
      objc_msgSend(v15, "setStatusFlags:", (unint64_t)objc_msgSend(v15, "statusFlags") & 0xFFFFFFFFEFFFFFFFLL);
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyDevices"));
      objc_msgSend(v16, "removeObject:", v15);

      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v17 = CUDescriptionWithLevel(v15, 20);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]", 30, "Proxy device removed %@\n", v18);

      }
      homeHubDevices = self->_homeHubDevices;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](homeHubDevices, "setObject:forKeyedSubscript:", 0, v20);

    }
  }
  else
  {
LABEL_9:

LABEL_15:
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]", 90, "### Proxy device removed is not present on this connection: %@ \n", v7);
    }
    v15 = 0;
  }

}

- (BOOL)_proxyDevice:(id)a3 receivedRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 cnx:(id)a8
{
  id v14;
  void *v15;
  NSMutableSet *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  BOOL v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v14 = a3;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v14));
  if (v15)
  {
    if (dword_100130248 <= 40
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:receivedRequestID:request:options:responseHandler:cnx:]", 40, "Received requestID '%@' for proxy device %@", v32, v14);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v16 = self->_xpcConnections;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v27 = v14;
      v19 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "launchInstanceID"));
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "launchInstanceID"));
            v24 = objc_msgSend(v22, "isEqual:", v23);

            if (v24)
            {
              if (-[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:](self, "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:", v32, v21, v31, v30, v29, 0, v28))
              {

                v25 = 1;
                goto LABEL_21;
              }
            }
          }

        }
        v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v18)
          continue;
        break;
      }
      v25 = 0;
LABEL_21:
      v14 = v27;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:receivedRequestID:request:options:responseHandler:cnx:]", 30, "Proxy device with identifier %@ is not found, ignoring request ID %@", v14, v32);
    }
    v25 = 0;
  }

  return v25;
}

- (BOOL)_proxyDevice:(id)a3 isEqualTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeKitIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitIdentifier"));
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v9 = objc_msgSend(v10, "isEqual:", v11);

  }
  return v9;
}

- (BOOL)_destinationID:(id)a3 matchesProxyDeviceOnCnx:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "proxyDevices", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "identifier"));
        v11 = objc_msgSend(v10, "isEqual:", v5);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)_addProxyIdentifier:(id)a3 toDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("proxyID"));

    v7 = v9;
  }

  return v7;
}

- (void)_sendProxyDeviceUpdateToPeer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_homeHubDevices, "allKeys"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v8)
    {
      v10 = v7;
      goto LABEL_18;
    }
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "statusFlags") & 0x20000000) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v13));
          if (v14)
          {
            if (!v10)
              v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v10, "addObject:", v14);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);

    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("_proxyDevs"), 0));
      -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", CFSTR("_proxyAdd"), v15, v4, 0, &stru_100112058);

LABEL_18:
    }
  }

}

- (void)_proxyLocalDeviceUpdateOnConnection:(id)a3 launchInstanceID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon homeHubDeviceForLaunchInstanceID:](self, "homeHubDeviceForLaunchInstanceID:", v6));
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "changed") & 1) != 0
      || (objc_msgSend(v11, "localDeviceUpdated") & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcCnx"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteObjectProxy"));
      objc_msgSend(v10, "companionLinkLocalDeviceUpdated:", v8);

      if ((objc_msgSend(v11, "localDeviceUpdated") & 1) == 0)
      {
        objc_msgSend(v11, "reportFoundDevice:outReason:", self->_localDeviceInfo, 0);
        objc_msgSend(v11, "setLocalDeviceUpdated:", 1);
      }
      objc_msgSend(v8, "setChanged:", 0);
    }
  }
  else if (dword_100130248 <= 90
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyLocalDeviceUpdateOnConnection:launchInstanceID:]", 90, "### Unable to find HomeHub device with launch instance ID %@", v6);
  }

}

- (id)homeHubDeviceForLaunchInstanceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "launchInstanceID"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_existingProxyDeviceUpdated:(id)a3 event:(id)a4 isLocal:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  void *v12;
  CFTypeID v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  void *v21;
  CFTypeID v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  CFTypeID v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  id v37;

  v5 = a5;
  v37 = a3;
  v8 = a4;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("_i"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v11));
    if (!v12)
    {
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]", 90, "### HomeHub devices with identifier '%@' was not found for event %@", v11, v37);
      }
      goto LABEL_44;
    }
    v13 = CFDictionaryGetTypeID();
    v14 = CFDictionaryGetTypedValue(v8, CFSTR("_siriInfo"), v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v36 = v5;
    if (v15)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "siriInfo"));
      v17 = v15;
      v18 = v17;
      if (v16 == v17)
      {

      }
      else
      {
        if (!v16)
        {

          goto LABEL_19;
        }
        v19 = objc_msgSend(v16, "isEqual:", v17);

        if ((v19 & 1) == 0)
        {
LABEL_19:
          if (dword_100130248 <= 40
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]", 40, "Siri info updated on HomeHub device %@\n", v21);

          }
          objc_msgSend(v12, "setSiriInfo:", v18);
          v20 = 1;
LABEL_26:
          v22 = CFStringGetTypeID();
          v23 = CFDictionaryGetTypedValue(v8, CFSTR("_roomName"), v22, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "roomName"));
            v26 = objc_msgSend(v24, "isEqual:", v25);

            if ((v26 & 1) == 0)
            {
              if (dword_100130248 <= 40
                && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "roomName"));
                LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]", 40, "Room name updated on HomeHub device %@: %@ -> %@\n", v27, v28, v24);

              }
              objc_msgSend(v12, "setRoomName:", v24);
              v20 = 1;
            }
          }
          v29 = CFStringGetTypeID();
          v30 = CFDictionaryGetTypedValue(v8, CFSTR("_mRtID"), v29, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          if (v31
            && (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaRouteIdentifier")),
                v33 = objc_msgSend(v31, "isEqual:", v32),
                v32,
                (v33 & 1) == 0))
          {
            if (dword_100130248 <= 40
              && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaRouteIdentifier"));
              LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]", 40, "Media route identifier updated on HomeHub device %@: %@ -> %@\n", v34, v35, v31);

            }
            objc_msgSend(v12, "setMediaRouteIdentifier:", v31);
          }
          else if ((v20 | v36) != 1)
          {
            goto LABEL_43;
          }
          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:](self, "_clientReportChangedDevice:changes:", v12, 2);
LABEL_43:

LABEL_44:
          goto LABEL_45;
        }
      }
    }
    v20 = 0;
    goto LABEL_26;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]", 90, "### Received eventID '%@' without identifier ", v37);
LABEL_45:

}

- (void)_createRequestEntryForXid:(id)a3 requestID:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPRequestEntry *v14;
  double Double;
  double v16;
  NSObject *v17;
  _QWORD handler[6];
  id v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = objc_alloc_init(RPRequestEntry);
  -[RPRequestEntry setOptions:](v14, "setOptions:", v11);
  -[RPRequestEntry setRequestID:](v14, "setRequestID:", v13);

  -[RPRequestEntry setResponseHandler:](v14, "setResponseHandler:", v12);
  -[RPRequestEntry setSendTicks:](v14, "setSendTicks:", mach_absolute_time());
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loopbackRequests, "setObject:forKeyedSubscript:", v14, v10);
  if (v11)
  {
    Double = CFDictionaryGetDouble(v11, CFSTR("timeoutSeconds"), 0);
    if (Double > 0.0)
    {
      v16 = Double;
      v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100038560;
      handler[3] = &unk_1001116C8;
      handler[4] = v17;
      handler[5] = self;
      v19 = v10;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet(v17, v16, -1.0, -10.0);
      dispatch_resume(v17);
      -[RPRequestEntry setTimer:](v14, "setTimer:", v17);

    }
  }

}

- (void)_proxyDevice:(id)a3 loopbackRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *loopbackRequests;
  unsigned int loopbackXid;
  uint64_t v18;
  NSMutableSet *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  NSObject *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[7];
  id v60;
  int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[3];
  _QWORD v68[3];

  v12 = a3;
  v58 = a4;
  v55 = a5;
  v13 = a6;
  v14 = a7;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  if (!v57)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]", 90, "### Proxy device to send requestID %@ has null identifier", v58);
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v49 = RPErrorF(4294960569, (uint64_t)"'%@' not found", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    (*((void (**)(id, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, v50);

    goto LABEL_35;
  }
  if (!self->_loopbackRequests)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    loopbackRequests = self->_loopbackRequests;
    self->_loopbackRequests = v15;

  }
  loopbackXid = self->_loopbackXid;
  if (loopbackXid + 1 > 1)
    v18 = loopbackXid + 1;
  else
    v18 = 1;
  self->_loopbackXid = v18;
  v53 = v18;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v51 = v14;
  v52 = v13;
  -[RPCompanionLinkDaemon _createRequestEntryForXid:requestID:options:responseHandler:](self, "_createRequestEntryForXid:requestID:options:responseHandler:");
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]", 30, "SendRequestID '%@', XID 0x%x, to device %@ over loopback\n", v58, v53, v57);
  v67[0] = CFSTR("dlt");
  v67[1] = CFSTR("senderID");
  v68[0] = &off_10011AA40;
  v68[1] = v57;
  v67[2] = CFSTR("xid");
  v68[2] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 3));
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v19 = self->_xpcConnections;
  v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (!v20)
    goto LABEL_29;
  v21 = v20;
  v22 = *(_QWORD *)v63;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v63 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "launchInstanceID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "launchInstanceID"));
      v27 = v25;
      v28 = v26;
      if (v27 == v28)
      {

LABEL_24:
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100038BB4;
        v59[3] = &unk_100112080;
        v59[4] = self;
        v59[5] = v56;
        v59[6] = v57;
        v61 = v53;
        v60 = v12;
        v31 = -[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:](self, "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:", v58, v24, v55, v54, v59, 0, 0);

        if ((v31 & 1) != 0)
          goto LABEL_32;
        continue;
      }
      v29 = v28;
      if ((v27 == 0) == (v28 != 0))
      {

        continue;
      }
      v30 = objc_msgSend(v27, "isEqual:", v28);

      if ((v30 & 1) != 0)
        goto LABEL_24;
    }
    v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  }
  while (v21);
LABEL_29:

  v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_loopbackRequests, "objectForKeyedSubscript:", v56));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loopbackRequests, "setObject:forKeyedSubscript:", 0, v56);
  v32 = objc_claimAutoreleasedReturnValue(-[NSMutableSet timer](v19, "timer"));
  -[NSMutableSet setTimer:](v19, "setTimer:", 0);
  if (v32)
    dispatch_source_cancel(v32);
  v33 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableSet responseHandler](v19, "responseHandler"));
  v40 = RPErrorF(4294960582, (uint64_t)"Request '%@' not handled", v34, v35, v36, v37, v38, v39, (uint64_t)v58);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  ((void (**)(_QWORD, _QWORD, _QWORD, void *))v33)[2](v33, 0, 0, v41);

LABEL_32:
  v14 = v51;
  v13 = v52;

LABEL_35:
}

- (id)_checkForProxyOrLocalDestinations:(id)a3 eventID:(id)a4 event:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id))a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v12));
  if (v17
    && (v18 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _addProxyIdentifier:toDictionary:](self, "_addProxyIdentifier:toDictionary:", v12, v14)), v14, v14 = (id)v18, (objc_msgSend(v17, "flags") & 0x20000000) != 0)|| (v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](self->_localDeviceInfo, "effectiveIdentifier")), v20 = objc_msgSend(v12, "isEqual:", v19), v19, v20))
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _checkForProxyOrLocalDestinations:eventID:event:options:completion:]", 30, "Send eventID '%@' to destination %@ over loopback\n", v13, v12);
    }
    v24 = 0;
    -[RPCompanionLinkDaemon _deliverEventID:event:options:unauth:cnx:outError:](self, "_deliverEventID:event:options:unauth:cnx:outError:", v13, v14, v15, 0, 0, &v24);
    v22 = v24;
    if (v16)
      v16[2](v16, v22);

    v21 = 0;
  }
  else
  {
    v14 = v14;
    v21 = v14;
  }

  return v21;
}

- (void)sessionStartSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 completion:(id)a6
{
  id v9;
  unsigned int sessionIDLast;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  RPCompanionLinkDaemon *v29;
  _QWORD v31[6];
  id v32;
  RPCompanionLinkDaemon *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];
  _QWORD v39[3];

  v9 = a4;
  v28 = a6;
  v29 = self;
  sessionIDLast = self->_sessionIDLast;
  v11 = __CFADD__(sessionIDLast, 1);
  v12 = sessionIDLast + 1;
  v13 = sessionIDLast + 2;
  if (v11)
    v14 = v13;
  else
    v14 = v12;
  self->_sessionIDLast = v14;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerIdentifier"));
  v27 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serviceType"));
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sessionStartSend:session:xpcID:completion:]", 30, "Session start request: Service %@, PeerID %@, CSID 0x%llX\n", v17, v16, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "btPipeHighPriority"));
  v19 = objc_msgSend(v18, "state") == 1;

  v39[0] = v17;
  v38[0] = CFSTR("_srvT");
  v38[1] = CFSTR("_sid");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14));
  v39[1] = v20;
  v38[2] = CFSTR("_btHP");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19));
  v39[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));

  v37[0] = &off_10011AA58;
  v36[0] = CFSTR("timeoutSeconds");
  v36[1] = CFSTR("highPriority");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19));
  v37[1] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000392D8;
  v31[3] = &unk_1001120A8;
  v31[4] = v17;
  v31[5] = v16;
  v34 = v28;
  v35 = v14;
  v32 = v27;
  v33 = v29;
  v25 = v27;
  v26 = v28;
  objc_msgSend(v15, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", CFSTR("_sessionStart"), v22, a5, v24, v31);

}

- (void)sessionStopSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[6];
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v9 = a3;
  v22 = a6;
  v10 = a4;
  v11 = objc_msgSend(v10, "sessionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeSessions, "setObject:forKeyedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceType"));

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sessionStopSend:session:xpcID:completion:]", 30, "Session stop request: Service %@, PeerID %@, SID 0x%llX\n", v13, v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "btPipeHighPriority"));
  v15 = objc_msgSend(v14, "state") == 1;

  v30[0] = CFSTR("_sid");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
  v30[1] = CFSTR("_btHP");
  v31[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
  v31[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));

  v29[0] = &off_10011AA70;
  v28[0] = CFSTR("timeoutSeconds");
  v28[1] = CFSTR("highPriority");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
  v29[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000397F0;
  v25[3] = &unk_1001120D0;
  v25[4] = v13;
  v25[5] = v12;
  v26 = v22;
  v27 = v11;
  v21 = v22;
  objc_msgSend(v9, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", CFSTR("_sessionStop"), v18, a5, v20, v25);

}

- (void)_sessionHandleStartRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6
{
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t Int64;
  CFTypeID v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSMutableSet *v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void (**v41)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableDictionary *xpcMatchingMap;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int sessionIDLast;
  BOOL v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSMutableDictionary *activeSessions;
  NSMutableDictionary *v64;
  NSMutableDictionary *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  id v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  _QWORD *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  _QWORD v90[7];
  id v91;
  uint64_t v92;
  _QWORD v93[7];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  id *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  unsigned int v110;
  _QWORD v111[4];
  id v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  const __CFString *v120;
  void *v121;
  _QWORD v122[4];
  _QWORD v123[4];
  _BYTE v124[128];

  v89 = a3;
  v87 = a4;
  v86 = a5;
  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = sub_10000F988;
  v118 = sub_10000F950;
  v119 = 0;
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_10003A008;
  v111[3] = &unk_1001120F8;
  v113 = &v114;
  v85 = a6;
  v112 = v85;
  v84 = objc_retainBlock(v111);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v87, CFSTR("senderID"), TypeID, 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v88)
  {
    v70 = RPErrorF(4294960534, (uint64_t)"No senderID", v12, v13, v14, v15, v16, v17, v83);
    v71 = objc_claimAutoreleasedReturnValue(v70);
    v72 = (void *)v115[5];
    v115[5] = v71;

    goto LABEL_38;
  }
  v110 = 0;
  Int64 = CFDictionaryGetInt64(v89, CFSTR("_sid"), &v110);
  if (v110)
  {
    v73 = RPErrorF(v110, (uint64_t)"No peer sessionID", v18, v19, v20, v21, v22, v23, v83);
    v74 = objc_claimAutoreleasedReturnValue(v73);
LABEL_42:
    v33 = (void *)v115[5];
    v115[5] = v74;
    goto LABEL_37;
  }
  if (!Int64)
  {
    v75 = RPErrorF(4294960591, (uint64_t)"Bad peer sessionID", v18, v19, v20, v21, v22, v23, v83);
    v74 = objc_claimAutoreleasedReturnValue(v75);
    goto LABEL_42;
  }
  v25 = CFStringGetTypeID();
  v26 = CFDictionaryGetTypedValue(v89, CFSTR("_srvT"), v25, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (!v33)
  {
    v76 = RPErrorF(4294896129, (uint64_t)"No service type", v27, v28, v29, v30, v31, v32, v83);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    v78 = (void *)v115[5];
    v115[5] = v77;

    goto LABEL_37;
  }
  v104 = 0;
  v105 = (id *)&v104;
  v106 = 0x3032000000;
  v107 = sub_10000F988;
  v108 = sub_10000F950;
  v109 = 0;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v34 = self->_activeServers;
  v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v101;
    while (2)
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v101 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "serviceType"));
        v40 = objc_msgSend(v39, "isEqual:", v33);

        if ((v40 & 1) != 0)
        {
          objc_storeStrong(v105 + 5, v38);
          goto LABEL_15;
        }
      }
      v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
      if (v35)
        continue;
      break;
    }
  }
LABEL_15:

  v41 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = sub_10000F988;
  v98 = sub_10000F950;
  v99 = 0;
  if (v105[5])
    goto LABEL_18;
  xpcMatchingMap = self->_xpcMatchingMap;
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_10003A0CC;
  v93[3] = &unk_100112120;
  v93[4] = v33;
  v93[5] = &v94;
  v93[6] = &v104;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v93);
  if (v105[5])
  {
    v41 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend((id)v95[5], "handler"));
    if (v41)
    {
LABEL_18:
      sessionIDLast = self->_sessionIDLast;
      v56 = __CFADD__(sessionIDLast, 1);
      v57 = sessionIDLast + 1;
      v58 = sessionIDLast + 2;
      if (v56)
        v59 = v58;
      else
        v59 = v57;
      self->_sessionIDLast = v59;
      v60 = Int64 | (v59 << 32);
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v60));
      v62 = objc_alloc_init((Class)RPSession);
      objc_msgSend(v62, "setPeerID:", v88);
      objc_msgSend(v62, "setServiceType:", v33);
      objc_msgSend(v62, "setSessionID:", v60);
      objc_msgSend(v62, "setStartTicks:", mach_absolute_time());
      objc_msgSend(v62, "setCnx:", v86);
      activeSessions = self->_activeSessions;
      if (!activeSessions)
      {
        v64 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v65 = self->_activeSessions;
        self->_activeSessions = v64;

        activeSessions = self->_activeSessions;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](activeSessions, "setObject:forKeyedSubscript:", v62, v61);
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v66 = (void *)v95[5];
        if (v66)
          v67 = (uint64_t)objc_msgSend(v66, "token");
        else
          v67 = -1;
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandleStartRequest:options:cnx:responseHandler:]", 30, "Session start received: Service %@, PeerID %@, SID 0x%llX, Token %lld\n", v33, v88, v60, v67);
      }
      if (v95[5] && v41)
      {
        v122[0] = CFSTR("type");
        v122[1] = CFSTR("serviceType");
        v123[0] = CFSTR("server");
        v123[1] = v33;
        v122[2] = CFSTR("sessionID");
        v122[3] = CFSTR("replyRequired");
        v123[2] = v61;
        v123[3] = &__kCFBooleanTrue;
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 4));
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472;
        v90[2] = sub_10003A174;
        v90[3] = &unk_100112148;
        v90[4] = self;
        v90[5] = v61;
        v90[6] = v62;
        v91 = v85;
        v92 = v59;
        ((void (**)(_QWORD, _QWORD, void *, _QWORD *))v41)[2](v41, 0, v68, v90);

      }
      else
      {
        v120 = CFSTR("_sid");
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v59));
        v121 = v69;
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));

        (*((void (**)(id, void *, _QWORD, _QWORD))v85 + 2))(v85, v68, 0, 0);
      }

      goto LABEL_36;
    }
    v81 = RPErrorF(4294960534, (uint64_t)"No LaunchOnDemand handler", v49, v50, v51, v52, v53, v54, v83);
    v80 = objc_claimAutoreleasedReturnValue(v81);
  }
  else
  {
    v79 = RPErrorF(4294896131, (uint64_t)"Unsupported service type", v43, v44, v45, v46, v47, v48, v83);
    v80 = objc_claimAutoreleasedReturnValue(v79);
  }
  v82 = (void *)v115[5];
  v115[5] = v80;

LABEL_36:
  _Block_object_dispose(&v94, 8);

  _Block_object_dispose(&v104, 8);
LABEL_37:

LABEL_38:
  ((void (*)(_QWORD *))v84[2])(v84);

  _Block_object_dispose(&v114, 8);
}

- (void)_sessionHandleStopRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t Int64;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  unsigned int v64;
  _QWORD v65[4];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_10000F988;
  v72 = sub_10000F950;
  v73 = 0;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10003A6D8;
  v65[3] = &unk_1001120F8;
  v67 = &v68;
  v13 = a6;
  v66 = v13;
  v14 = objc_retainBlock(v65);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v11, CFSTR("senderID"), TypeID, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v23)
  {
    v51 = RPErrorF(4294896131, (uint64_t)"No senderID", v17, v18, v19, v20, v21, v22, v61);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    v53 = (void *)v69[5];
    v69[5] = v52;

    goto LABEL_21;
  }
  v64 = 0;
  Int64 = CFDictionaryGetInt64(v10, CFSTR("_sid"), &v64);
  v63 = v11;
  if (v64)
  {
    v54 = RPErrorF(v64, (uint64_t)"No sessionID", v24, v25, v26, v27, v28, v29, v61);
    v55 = objc_claimAutoreleasedReturnValue(v54);
LABEL_25:
    v31 = (void *)v69[5];
    v69[5] = v55;
    goto LABEL_20;
  }
  if (!Int64)
  {
    v56 = RPErrorF(4294960591, (uint64_t)"Bad sessionID", v24, v25, v26, v27, v28, v29, v61);
    v55 = objc_claimAutoreleasedReturnValue(v56);
    goto LABEL_25;
  }
  v62 = v10;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", Int64));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activeSessions, "objectForKeyedSubscript:", v31));
  v39 = v32;
  if (v32)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "peerID"));
    v41 = objc_msgSend(v40, "isEqual:", v23);

    if ((v41 & 1) != 0)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "serviceType"));
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandleStopRequest:options:cnx:responseHandler:]", 30, "Session stop: Service %@, PeerID %@, SID 0x%llX, request\n", v48, v23, Int64);

      }
      (*((void (**)(id, void *, _QWORD, _QWORD))v13 + 2))(v13, &__NSDictionary0__struct, 0, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeSessions, "setObject:forKeyedSubscript:", 0, v31);
      objc_msgSend(v39, "setCnx:", 0);
      objc_msgSend(v12, "sessionStopped:", v39);
      if (objc_msgSend(v12, "clientMode")
        && (objc_msgSend(v12, "controlFlags") & 0x200) != 0)
      {
        v49 = -[RPCompanionLinkDaemon _sessionsActiveOnConnection:xpcConnection:](self, "_sessionsActiveOnConnection:xpcConnection:", v12, 0);
        if (v49 < 1)
        {
          objc_msgSend(v12, "invalidate");
        }
        else if (dword_100130248 <= 40
               && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 40)))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "label"));
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandleStopRequest:options:cnx:responseHandler:]", 40, "Connection %@ has %llu active sessions in progress, skip invalidating", v50, v49);

        }
      }
      objc_msgSend(v39, "invalidate");
      goto LABEL_19;
    }
    v59 = RPErrorF(4294960523, (uint64_t)"Not owner of session", v42, v43, v44, v45, v46, v47, v61);
    v58 = objc_claimAutoreleasedReturnValue(v59);
  }
  else
  {
    v57 = RPErrorF(4294960569, (uint64_t)"Session not found", v33, v34, v35, v36, v37, v38, v61);
    v58 = objc_claimAutoreleasedReturnValue(v57);
  }
  v60 = (void *)v69[5];
  v69[5] = v58;

LABEL_19:
  v10 = v62;
LABEL_20:

  v11 = v63;
LABEL_21:

  ((void (*)(_QWORD *))v14[2])(v14);
  _Block_object_dispose(&v68, 8);

}

- (void)_sessionHandlePeerDisconnect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerIdentifier"));
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_activeSessions, "allKeys"));
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activeSessions, "objectForKeyedSubscript:", v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peerID"));
          v13 = objc_msgSend(v12, "isEqual:", v5);

          if (!v13
            || (v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cnx")), v14, v14 != v4))
          {

            goto LABEL_17;
          }
          if (dword_100130248 <= 30
            && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceType"));
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:]", 30, "Session stop: Service %@, PeerID %@, SID 0x%llX, disconnect\n", v15, v5, objc_msgSend(v11, "sessionID"));

          }
          objc_msgSend(v11, "setCnx:", 0);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeSessions, "setObject:forKeyedSubscript:", 0, v10);
          objc_msgSend(v11, "invalidate");

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else if (dword_100130248 <= 90
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:]", 90, "### Session stop without cnx peerID: %@\n", v4);
  }

}

- (int64_t)_sessionsActiveOnConnection:(id)a3 xpcConnection:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *xpcConnections;
  id v9;
  id v10;
  NSMutableDictionary *activeSessions;
  id v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  xpcConnections = self->_xpcConnections;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003AB48;
  v18[3] = &unk_100112170;
  v9 = v7;
  v19 = v9;
  v10 = v6;
  v20 = v10;
  v21 = &v22;
  -[NSMutableSet enumerateObjectsUsingBlock:](xpcConnections, "enumerateObjectsUsingBlock:", v18);
  activeSessions = self->_activeSessions;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003AC08;
  v15[3] = &unk_100112198;
  v12 = v10;
  v16 = v12;
  v17 = &v22;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSessions, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)_handleContextCollectorRequest:(id)a3 responseHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CFTypeID v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _BYTE v53[128];

  v46 = a4;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeDevices, "allValues"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (!v6)
  {
LABEL_12:

LABEL_20:
    v41 = RPErrorF(4294960534, (uint64_t)"No context collector found (proxy discovery)", v19, v20, v21, v22, v23, v24, v45);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v25 = 0;
    v43 = 0;
    v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v46;
    goto LABEL_25;
  }
  v7 = v6;
  v8 = *(_QWORD *)v48;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v48 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bonjourDevice"));

    if (!v11)
      goto LABEL_10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bonjourDevice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "txtDictionary"));

    if ((CFDictionaryGetInt64(v13, CFSTR("rpFl"), 0) & 0x800000) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bonjourDevice"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceInfo"));
      TypeID = CFStringGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v15, CFSTR("deviceID"), TypeID, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

      if (v18)
        break;
    }

LABEL_10:
    if (v7 == (id)++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v7)
        goto LABEL_3;
      goto LABEL_12;
    }
  }
  v25 = v10;

  if (!v25)
    goto LABEL_20;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bonjourDevice"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "deviceInfo"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ipAddress"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bonjourDevice"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "deviceInfo"));
  v31 = CFStringGetTypeID();
  v32 = CFDictionaryGetTypedValue(v30, CFSTR("deviceID"), v31, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v46;
  if (v27 && v28 && v33)
  {
    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _handleContextCollectorRequest:responseHandler:]", 30, "Sending context collector information to paired watch: %@\n", v25);
    }
    v51[0] = CFSTR("_bi");
    v51[1] = CFSTR("_dIP");
    v52[0] = v27;
    v52[1] = v28;
    v51[2] = CFSTR("_i");
    v52[2] = v33;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 3));
    v42 = 0;
  }
  else
  {
    v44 = RPErrorF(4294960534, (uint64_t)"Insufficient context collector device information", v34, v35, v36, v37, v38, v39, v45);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v43 = 0;
  }

LABEL_25:
  ((void (**)(_QWORD, void *, _QWORD, void *))v40)[2](v40, v43, 0, v42);

}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (RPCompanionLinkDevice)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (RPHomeKitManager)rpHomeKitManager
{
  return self->_rpHomeKitManager;
}

- (NSMutableSet)activeServers
{
  return self->_activeServers;
}

- (void)setActiveServers:(id)a3
{
  objc_storeStrong((id *)&self->_activeServers, a3);
}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void)setActiveSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessions, a3);
}

- (NSDictionary)destinationIdentifierModelMap
{
  return self->_destinationIdentifierModelMap;
}

- (NSDictionary)destinationIdentifierRelMap
{
  return self->_destinationIdentifierRelMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationIdentifierRelMap, 0);
  objc_storeStrong((id *)&self->_destinationIdentifierModelMap, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_activeServers, 0);
  objc_storeStrong((id *)&self->_rpHomeKitManager, 0);
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_nearfieldDaemon, 0);
  objc_storeStrong((id *)&self->_tvDeviceInfoManager, 0);
  objc_storeStrong((id *)&self->_siriDaemon, 0);
  objc_storeStrong((id *)&self->_mediaControlDaemon, 0);
  objc_storeStrong((id *)&self->_hidDaemon, 0);
  objc_storeStrong((id *)&self->_xpcMatchingMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcServerInterface, 0);
  objc_storeStrong((id *)&self->_xpcClientInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_uniqueIDStr, 0);
  objc_storeStrong((id *)&self->_uniqueIDData, 0);
  objc_storeStrong((id *)&self->_unauthDevices, 0);
  objc_storeStrong((id *)&self->_uiNoteSession, 0);
  objc_storeStrong((id *)&self->_uiNoteDevices, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_tcpServerConnections, 0);
  objc_storeStrong((id *)&self->_tcpOnDemandClientConnections, 0);
  objc_storeStrong((id *)&self->_tcpClientConnections, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_stereoCnx, 0);
  objc_storeStrong((id *)&self->_soundBoardPrefs, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredProfileIDs, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_rbsProcessMonitor, 0);
  objc_storeStrong((id *)&self->_personalCnx, 0);
  objc_storeStrong((id *)&self->_pendingLostNeedsCLinkDevicesTimer, 0);
  objc_storeStrong((id *)&self->_pendingLostBLEDevicesTimer, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestTimer, 0);
  objc_storeStrong((id *)&self->_needsAWDLSentToPeers, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_needsAWDLNewPeers, 0);
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_loopbackRequests, 0);
  objc_storeStrong((id *)&self->_homeKitRotatingID, 0);
  objc_storeStrong((id *)&self->_homeKitManager, 0);
  objc_storeStrong((id *)&self->_homeKitLTPK, 0);
  objc_storeStrong((id *)&self->_homeKitIRK, 0);
  objc_storeStrong((id *)&self->_homeKitAuthTag, 0);
  objc_storeStrong((id *)&self->_homeHubDevices, 0);
  objc_storeStrong((id *)&self->_interestPeers, 0);
  objc_storeStrong((id *)&self->_interestEvents, 0);
  objc_storeStrong((id *)&self->_duetSyncClient, 0);
  objc_storeStrong((id *)&self->_discoveryNonceData, 0);
  objc_storeStrong((id *)&self->_screenOffDeviceFilter, 0);
  objc_storeStrong((id *)&self->_deviceAWDLRandomID, 0);
  objc_storeStrong((id *)&self->_deviceAuthTagStr, 0);
  objc_storeStrong((id *)&self->_btPipeHighPriority, 0);
  objc_storeStrong((id *)&self->_btPipeConnection, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
  objc_storeStrong((id *)&self->_btAdvAddrMonitor, 0);
  objc_storeStrong((id *)&self->_btAdvAddrStr, 0);
  objc_storeStrong((id *)&self->_btAdvAddrData, 0);
  objc_storeStrong((id *)&self->_bonjourReevaluateTimer, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserAWDL, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLDevices, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLAdvertiser, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleServerConnections, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkScanner, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkDevices, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkDevice, 0);
  objc_storeStrong((id *)&self->_bleNeedsCLinkAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoV2Discovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Device, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Discovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Advertiser, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
  objc_storeStrong((id *)&self->_bleClientConnections, 0);
  objc_storeStrong((id *)&self->_bleActionDiscovery, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2Devices, 0);
  objc_storeStrong((id *)&self->_bleDevices, 0);
  objc_storeStrong((id *)&self->_authenticatedAWDLPairingModeDevices, 0);
  objc_storeStrong((id *)&self->_airplayPrefs, 0);
  objc_storeStrong((id *)&self->_activeDevices, 0);
}

@end
