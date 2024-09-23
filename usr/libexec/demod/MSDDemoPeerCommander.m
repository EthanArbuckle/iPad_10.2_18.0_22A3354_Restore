@implementation MSDDemoPeerCommander

+ (id)sharedInstance
{
  if (qword_1001751F0 != -1)
    dispatch_once(&qword_1001751F0, &stru_10013E0D8);
  return (id)qword_1001751F8;
}

- (MSDDemoPeerCommander)init
{
  MSDDemoPeerCommander *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  void *v6;
  MSDNearbyObjectMonitor *v7;
  MSDRapportDeviceExplorer *v8;
  MSDRapportMessageHandler *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MSDDemoPeerCommander;
  v2 = -[MSDDemoPeerCommander init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MobileStoreDemo.DemoPeerCommander", 0);
    -[MSDDemoPeerCommander setQueue:](v2, "setQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDDemoPeerCommander setNearbyObjects:](v2, "setNearbyObjects:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDDemoPeerCommander setDiscoveredPeers:](v2, "setDiscoveredPeers:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDDemoPeerCommander setPairingHandlers:](v2, "setPairingHandlers:", v6);

    v7 = -[MSDNearbyObjectMonitor initWithObserver:]([MSDNearbyObjectMonitor alloc], "initWithObserver:", v2);
    -[MSDDemoPeerCommander setNearbyObjectMonitor:](v2, "setNearbyObjectMonitor:", v7);

    v8 = -[MSDRapportDeviceExplorer initWithObserver:]([MSDRapportDeviceExplorer alloc], "initWithObserver:", v2);
    -[MSDDemoPeerCommander setRpDeviceExplorer:](v2, "setRpDeviceExplorer:", v8);

    v9 = -[MSDRapportMessageHandler initWithObserver:]([MSDRapportMessageHandler alloc], "initWithObserver:", v2);
    -[MSDDemoPeerCommander setRpMessageHandler:](v2, "setRpMessageHandler:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    -[MSDDemoPeerCommander setXpcListener:](v2, "setXpcListener:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcListener](v2, "xpcListener"));
    objc_msgSend(v11, "setDelegate:", v2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcListener](v2, "xpcListener"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](v2, "queue"));
    objc_msgSend(v12, "_setQueue:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcListener](v2, "xpcListener"));
    objc_msgSend(v14, "activate");

  }
  return v2;
}

- (id)createXPCEndpoint
{
  MSDDemoPeerCommander *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcListener](v2, "xpcListener"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endpoint"));

  objc_sync_exit(v2);
  return v4;
}

- (void)_sendRequestMessageOfID:(id)a3 andPayload:(id)a4 toPeerOfID:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  void *v20;
  MSDRapportMessage *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2114;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Sending request message of ID: %{public}@ to peer of ID: %{public}@", buf, 0x16u);
  }

  if (v13)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileStoreDemo.InitiateIPDReset")))
      v17 = &off_10014D7C0;
    else
      v17 = &off_10014D7D8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v17, CFSTR("Timeout")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander discoveredPeers](self, "discoveredPeers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v12));

    v21 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:]([MSDRapportMessage alloc], "initWithIdentifier:andPayload:usingOptions:", v10, v11, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander rpMessageHandler](self, "rpMessageHandler"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "device"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100026A6C;
    v24[3] = &unk_10013E128;
    v24[4] = self;
    v25 = v13;
    objc_msgSend(v22, "sendOutgoingRequestMessage:toDevice:withCompletion:", v21, v23, v24);

  }
}

- (void)_handleDiscoveryOfNewPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Found new peer: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander discoveredPeers](self, "discoveredPeers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

  if (v10)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Ignore already discovered peer device.", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander discoveredPeers](self, "discoveredPeers"));
    objc_msgSend(v13, "setObject:forKey:", v4, v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander nearbyObjects](self, "nearbyObjects"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v8));

    if (v12)
      v15 = -[NSObject isInBubble](v12, "isInBubble");
    else
      v15 = 0;
    objc_msgSend(v4, "setIsInBubble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcConnection](self, "xpcConnection"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcConnection](self, "xpcConnection"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteObjectProxy"));
      objc_msgSend(v18, "providerDidDiscoverNewPeer:", v4);

    }
    if (objc_msgSend(v4, "authenticated"))
      -[MSDDemoPeerCommander fetchDeviceInfoFromPeerOfID:withCompletion:](self, "fetchDeviceInfoFromPeerOfID:withCompletion:", v8, &stru_10013E168);
  }

}

- (void)_handleLossOfExistingPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  id v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Lost existing peer: %{public}@", (uint8_t *)&v18, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander discoveredPeers](self, "discoveredPeers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

  if (!v10)
  {
    v17 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Ignore unknown peer device!", (uint8_t *)&v18, 2u);
    }
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander discoveredPeers](self, "discoveredPeers"));
  objc_msgSend(v11, "removeObjectForKey:", v8);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander rpMessageHandler](self, "rpMessageHandler"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
  objc_msgSend(v12, "invalidateOutgoingConnectionForDevice:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcConnection](self, "xpcConnection"));
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcConnection](self, "xpcConnection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remoteObjectProxy](v15, "remoteObjectProxy"));
    objc_msgSend(v16, "providerDidLoseExistingPeerOfID:", v8);

LABEL_8:
  }

}

- (void)_handleUpdateOfExistingPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received update of existing peer: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander rpMessageHandler](self, "rpMessageHandler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
  objc_msgSend(v8, "invalidateOutgoingConnectionForDevice:", v9);

}

- (void)_handleUpdateDeviceEventMessage:(id)a3 fromPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received device info update for peer: %{public}@ properties: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(v6, "refreshDevicePropertiesUsingProperties:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcConnection](self, "xpcConnection"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander xpcConnection](self, "xpcConnection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteObjectProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v14, "providerDidUpdateDeviceInfoOnPeerOfID:withNewProperties:", v15, v9);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id buf;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "processIdentifier");
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: A new XPC connection received from client: %d", (uint8_t *)&buf, 8u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.mobilestoredemo.enabledemo")));
  if (v12
    && (v13 = objc_opt_class(NSArray, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && (objc_msgSend(v12, "containsObject:", CFSTR("PeerDemoDevice")) & 1) != 0)
  {
    objc_initWeak(&buf, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MSDDemoPeerServiceProviderProtocol));
    objc_msgSend(v7, "setExportedInterface:", v14);

    objc_msgSend(v7, "setExportedObject:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MSDDemoPeerServiceConsumerProtocol));
    objc_msgSend(v7, "setRemoteObjectInterface:", v15);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000276F0;
    v26[3] = &unk_10013D840;
    objc_copyWeak(&v27, &buf);
    objc_msgSend(v7, "setInterruptionHandler:", v26);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002774C;
    v24[3] = &unk_10013D840;
    objc_copyWeak(&v25, &buf);
    objc_msgSend(v7, "setInvalidationHandler:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
    objc_msgSend(v7, "_setQueue:", v16);

    objc_msgSend(v7, "activate");
    -[MSDDemoPeerCommander setXpcConnection:](self, "setXpcConnection:", v7);
    v17 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000277A8;
    v22[3] = &unk_10013DDB8;
    objc_copyWeak(&v23, &buf);
    v22[4] = self;
    dispatch_async(v17, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&buf);
    v18 = 1;
  }
  else
  {
    v19 = sub_1000604F0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Client is not entitled to use peer service.", (uint8_t *)&buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (void)startPeerDiscoveryWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander nearbyObjectMonitor](self, "nearbyObjectMonitor"));
  objc_msgSend(v5, "start");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander rpDeviceExplorer](self, "rpDeviceExplorer"));
  objc_msgSend(v6, "activate");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander rpMessageHandler](self, "rpMessageHandler"));
  objc_msgSend(v7, "listenForIncomingEventMessageOfID:", CFSTR("com.apple.MobileStoreDemo.UpdateDeviceInfo"));

  v8[2](v8, 0);
}

- (void)attemptPairingWithPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  MSDRapportPairingHandler *v16;
  void *v17;
  id v18;
  MSDRapportPairingHandler *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  MSDDemoPeerCommander *v26;
  id v27;
  void (**v28)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander discoveredPeers](self, "discoveredPeers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

  if (!v10)
  {
    v11 = CFSTR("Cannot find specified demo peer.");
    v12 = 3727741104;
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", v12, v11));
    v7[2](v7, v15);

    goto LABEL_10;
  }
  if (!objc_msgSend(v10, "authenticated"))
  {
    if ((objc_msgSend(v10, "pairingMode") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander pairingHandlers](self, "pairingHandlers"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v6));

      if (!v14)
      {
        v16 = [MSDRapportPairingHandler alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "device"));
        v21 = _NSConcreteStackBlock;
        v22 = 3221225472;
        v23 = sub_100027C04;
        v24 = &unk_10013E190;
        v25 = v10;
        v28 = v7;
        v26 = self;
        v18 = v6;
        v27 = v18;
        v19 = -[MSDRapportPairingHandler initWithDevice:andCompletion:](v16, "initWithDevice:andCompletion:", v17, &v21);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander pairingHandlers](self, "pairingHandlers", v21, v22, v23, v24));
        objc_msgSend(v20, "setObject:forKey:", v19, v18);

        -[MSDRapportPairingHandler activate](v19, "activate");
        goto LABEL_10;
      }
      v12 = 3727744771;
      v11 = CFSTR("Operation already in progress.");
    }
    else
    {
      v12 = 3727741105;
      v11 = CFSTR("Cannot operate on demo peer not in pairing mode.");
    }
    goto LABEL_9;
  }
  v7[2](v7, 0);
LABEL_10:

}

- (void)subscribeDeviceInfoFromPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100027DD4;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.SubscribeDeviceInfo"), 0, v7, v10);

}

- (void)fetchDeviceInfoFromPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027EBC;
  v11[3] = &unk_10013E1E0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.FetchDeviceInfo"), 0, v10, v11);

}

- (void)initiateAirPlayAssistedFromPeerOfID:(id)a3 usingParameters:(id)a4 discoveryMode:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  if (v11 && a5 < 3)
  {
    v19[0] = CFSTR("APParameters");
    v19[1] = CFSTR("APDiscoveryMode");
    v20[0] = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v20[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000282AC;
    v17[3] = &unk_10013E1B8;
    v18 = v12;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.InitiateAirPlayAssisted"), v15, v10, v17);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v12 + 2))(v12, v16);

  }
}

- (void)triggerSnapshotRevertOnPeerOfID:(id)a3 rebootDevice:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  void *v17;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v16 = CFSTR("RebootAfterRevert");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002840C;
  v14[3] = &unk_10013E1B8;
  v15 = v8;
  v13 = v8;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.TriggerSnapshotRevert"), v12, v9, v14);

}

- (void)triggerSnapshotRevertOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000284E0;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.TriggerSnapshotRevert"), 0, v7, v10);

}

- (void)invokeInputRecoveryOnPeerOfID:(id)a3 forType:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (a4 < 4)
  {
    v16 = CFSTR("IREnrollmentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v17 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028680;
    v14[3] = &unk_10013E1B8;
    v15 = v9;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.InvokeInputRecovery"), v13, v8, v14);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v9 + 2))(v9, v11);

  }
}

- (void)adjustVolumeOnPeerOfID:(id)a3 toValue:(float)a4 forCategory:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *);
  _QWORD v21[2];
  _QWORD v22[2];

  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  v12 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  if (a4 < 0.0 || (a4 <= 1.0 ? (v14 = a5 >= 4) : (v14 = 1), v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    v11[2](v11, v15);

  }
  else
  {
    v21[0] = CFSTR("VolumeValue");
    *(float *)&v13 = a4;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    v22[0] = v16;
    v21[1] = CFSTR("VolumeCategory");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v22[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100028868;
    v19[3] = &unk_10013E1B8;
    v20 = v11;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.AdjustVolume"), v18, v10, v19);

  }
}

- (void)listAppsOnPeerOfID:(id)a3 appKind:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (a4 < 2)
  {
    v16 = CFSTR("AppListKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v17 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028A0C;
    v14[3] = &unk_10013E1B8;
    v15 = v9;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ListApps"), v13, v8, v14);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v11);

  }
}

- (void)launchAppOnPeerOfID:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (v9)
  {
    v16 = CFSTR("AppIdentifier");
    v17 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028E08;
    v14[3] = &unk_10013E1B8;
    v15 = v10;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.LaunchApp"), v12, v8, v14);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v10 + 2))(v10, v13);

  }
}

- (void)terminateAppOnPeerOfID:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (v9)
  {
    v16 = CFSTR("AppIdentifier");
    v17 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028F90;
    v14[3] = &unk_10013E1B8;
    v15 = v10;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.TerminateApp"), v12, v8, v14);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v10 + 2))(v10, v13);

  }
}

- (void)listAvailableEnvironmentsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029064;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ListAvailableEnvironments"), 0, v7, v10);

}

- (void)setActiveEnvironmentOnPeerOfID:(id)a3 environmentID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v16 = CFSTR("EnvIdentifier");
  v17 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029424;
  v14[3] = &unk_10013E1B8;
  v15 = v8;
  v13 = v8;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.SetActiveEnvironment"), v12, v10, v14);

}

- (void)seImmersionLevelOnPeerOfID:(id)a3 immersionLevel:(float)a4 animationDuration:(float)a5 withCompletion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *);
  _QWORD v21[2];
  _QWORD v22[2];

  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  v12 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  if (a4 < 0.0 || a4 > 1.0 || a5 < 0.0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    v11[2](v11, v18);

  }
  else
  {
    v21[0] = CFSTR("ImmersionLevel");
    *(float *)&v13 = a4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    v22[0] = v14;
    v21[1] = CFSTR("AnimationDuration");
    *(float *)&v15 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15));
    v22[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100029610;
    v19[3] = &unk_10013E1B8;
    v20 = v11;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.SetImmersionLevel"), v17, v10, v19);

  }
}

- (void)resetToPassThroughOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000296E4;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ResetToPassThrough"), 0, v7, v10);

}

- (void)enumerateTestScriptsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000297B8;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.EnumerateScripts"), 0, v7, v10);

}

- (void)launchTestScriptOnPeerOfID:(id)a3 ofIdentifier:(id)a4 asRoot:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  if (v11)
  {
    v19[0] = CFSTR("TestIdentifier");
    v19[1] = CFSTR("RunAsRoot");
    v20[0] = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    v20[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100029BEC;
    v17[3] = &unk_10013E1B8;
    v18 = v12;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.LaunchScript"), v15, v10, v17);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v12 + 2))(v12, v16);

  }
}

- (void)obtainGKResultsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029CC0;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ObtainGKResults"), 0, v7, v10);

}

- (void)obtainGKMetricsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029EDC;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ObtainGKMetrics"), 0, v7, v10);

}

- (void)loadLSMeasurementsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A0F8;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.LoadLSMeasurements"), 0, v7, v10);

}

- (void)retrieveHSCoachingSuggestionFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A290;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.RetrieveHSCoachingSuggestion"), 0, v7, v10);

}

- (void)readIPDStatusFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A3C8;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ReadIPDStatus"), 0, v7, v10);

}

- (void)skipAutoIPDAdjustmentFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A5E4;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.SkipAutoIPDAdjustment"), 0, v7, v10);

}

- (void)initiateIPDResetOnPeer:(id)a3 targetIPD:(double)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, void *, double);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, void *, double);
  const __CFString *v16;
  void *v17;

  v8 = a3;
  v9 = (void (**)(id, void *, double))a5;
  v10 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (a4 < 45.0 || a4 > 85.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    v9[2](v9, v13, 0.0);

  }
  else
  {
    v16 = CFSTR("TargetIPD");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    v17 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002A7A8;
    v14[3] = &unk_10013E1B8;
    v15 = v9;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.InitiateIPDReset"), v12, v8, v14);

  }
}

- (void)queryIPDResetStageOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A988;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.QueryIPDResetStage"), 0, v7, v10);

}

- (void)getAccessibiltiySettingsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AB6C;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.GetAXSettings"), 0, v7, v10);

}

- (void)setAccessibiltiySettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v19));

  v13 = v19;
  if (v12)
  {
    v20 = CFSTR("AXSettingsArchive");
    v21 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002AEA4;
    v17[3] = &unk_10013E1B8;
    v18 = v9;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.SetAXSettings"), v14, v8, v17);

  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000BB3FC(v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }

}

- (void)wipeCustomerAssetsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AF78;
  v10[3] = &unk_10013E1B8;
  v11 = v6;
  v9 = v6;
  -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.WipeCustomerAssets"), 0, v7, v10);

}

- (void)syncCurrentWiFiSettingsToPeer:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getCurrentWiFiSettings:", 1));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("SSID")));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Password")));
    v12 = (void *)v11;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13
      || (v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4)) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741073, CFSTR("Failed to read current WiFi settings.")));
      v6[2](v6, v17);

    }
    else
    {
      v15 = v14;
      v16 = objc_msgSend(objc_alloc((Class)MSDKPeerDemoWiFiSettings), "initWithSSID:password:", v10, v14);
      -[MSDDemoPeerCommander changeWiFiSettingsOnPeer:newSettings:withCompletion:](self, "changeWiFiSettingsOnPeer:newSettings:withCompletion:", v18, v16, v6);

      v10 = v16;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741073, CFSTR("Failed to read current WiFi settings.")));
    v6[2](v6, v10);
  }

}

- (void)changeWiFiSettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v19));

  v13 = v19;
  if (v12)
  {
    v20 = CFSTR("WiFiSettingsArchive");
    v21 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002B320;
    v17[3] = &unk_10013E1B8;
    v18 = v9;
    -[MSDDemoPeerCommander _sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:](self, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:", CFSTR("com.apple.MobileStoreDemo.ChangeWiFiSettings"), v14, v8, v17);

  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000BB474(v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }

}

- (void)removePairedPeer:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoPeerPairingManager sharedInstance](MSDDemoPeerPairingManager, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002B3E0;
  v9[3] = &unk_10013DB70;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "removePairedPeer:withCompletion:", v6, v9);

}

- (void)monitorDidUpdateRegionOfNearbyObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MSDDemoPeerCommander *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B484;
  v7[3] = &unk_10013DE28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)explorerDidFindDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MSDDemoPeerCommander *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B718;
  v7[3] = &unk_10013DE28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)explorerDidLoseDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B7FC;
  v7[3] = &unk_10013DE28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)explorerDidUpdateDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B914;
  v7[3] = &unk_10013DE28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)didReceiveRequestMessage:(id)a3 fromDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received request message: %{public}@ from device: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

- (void)didReceiveEventMessage:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MSDDemoPeerCommander *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDemoPeerCommander queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BB20;
  block[3] = &unk_10013E208;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (MSDNearbyObjectMonitor)nearbyObjectMonitor
{
  return self->_nearbyObjectMonitor;
}

- (void)setNearbyObjectMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyObjectMonitor, a3);
}

- (MSDRapportDeviceExplorer)rpDeviceExplorer
{
  return self->_rpDeviceExplorer;
}

- (void)setRpDeviceExplorer:(id)a3
{
  objc_storeStrong((id *)&self->_rpDeviceExplorer, a3);
}

- (MSDRapportMessageHandler)rpMessageHandler
{
  return self->_rpMessageHandler;
}

- (void)setRpMessageHandler:(id)a3
{
  objc_storeStrong((id *)&self->_rpMessageHandler, a3);
}

- (NSMutableDictionary)nearbyObjects
{
  return self->_nearbyObjects;
}

- (void)setNearbyObjects:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyObjects, a3);
}

- (NSMutableDictionary)discoveredPeers
{
  return self->_discoveredPeers;
}

- (void)setDiscoveredPeers:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredPeers, a3);
}

- (NSMutableDictionary)pairingHandlers
{
  return self->_pairingHandlers;
}

- (void)setPairingHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_pairingHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingHandlers, 0);
  objc_storeStrong((id *)&self->_discoveredPeers, 0);
  objc_storeStrong((id *)&self->_nearbyObjects, 0);
  objc_storeStrong((id *)&self->_rpMessageHandler, 0);
  objc_storeStrong((id *)&self->_rpDeviceExplorer, 0);
  objc_storeStrong((id *)&self->_nearbyObjectMonitor, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
