@implementation CARCarPlayServiceConnector

- (CARCarPlayServiceConnector)initWithVehicleStore:(id)a3
{
  id v5;
  CARCarPlayServiceConnector *v6;
  void *v7;
  CBCentralManager *v8;
  CBCentralManager *centralManager;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *servicesForBluetoothIdentifiers;
  NSMutableDictionary *v13;
  NSMutableDictionary *vehiclesForBluetoothIdentifiers;
  NSUUID *pairingPeripheralIdentifier;
  NSString *pairingPeripheralName;
  CBPeripheral *activePeripheral;
  id currentConnectionCompletion;
  id actionPendingPowerOn;
  objc_super v21;
  NSString *v22;
  void *v23;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CARCarPlayServiceConnector;
  v6 = -[CARCarPlayServiceConnector init](&v21, "init");
  if (v6)
  {
    v22 = CBCentralManagerOptionShowPowerAlertKey;
    v23 = &__kCFBooleanTrue;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    objc_storeStrong((id *)&v6->_vehicleStore, a3);
    objc_msgSend(v5, "addObserver:", v6);
    v8 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:options:", v6, &_dispatch_main_q, v7);
    centralManager = v6->_centralManager;
    v6->_centralManager = v8;

    v10 = -[CBCentralManager sharedPairingAgent](v6->_centralManager, "sharedPairingAgent");
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    servicesForBluetoothIdentifiers = v6->_servicesForBluetoothIdentifiers;
    v6->_servicesForBluetoothIdentifiers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    vehiclesForBluetoothIdentifiers = v6->_vehiclesForBluetoothIdentifiers;
    v6->_vehiclesForBluetoothIdentifiers = v13;

    pairingPeripheralIdentifier = v6->_pairingPeripheralIdentifier;
    v6->_pairingPeripheralIdentifier = 0;

    pairingPeripheralName = v6->_pairingPeripheralName;
    v6->_pairingPeripheralName = 0;

    activePeripheral = v6->_activePeripheral;
    v6->_activePeripheral = 0;

    currentConnectionCompletion = v6->_currentConnectionCompletion;
    v6->_currentConnectionCompletion = 0;

    actionPendingPowerOn = v6->_actionPendingPowerOn;
    v6->_actionPendingPowerOn = 0;

    if (+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))
    {
      -[CARCarPlayServiceConnector _updateDiscoverer](v6, "_updateDiscoverer");
    }

  }
  return v6;
}

- (void)invalidate
{
  -[CBDiscovery invalidate](self->_discoverer, "invalidate");
}

- (void)_updateDiscoverer
{
  uint64_t *p_identifiersToDiscover;
  NSSet *identifiersToDiscover;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  NSSet *v17;
  id v18;
  NSObject *v19;
  CBDiscovery *discoverer;
  CBDiscovery **p_discoverer;
  CBDiscovery *v22;
  void *v23;
  void *v24;
  xpc_object_t v25;
  xpc_object_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  xpc_object_t v32;
  id v33;
  NSObject *v34;
  xpc_object_t v35;
  xpc_object_t v36;
  id v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id location;
  uint8_t buf[4];
  xpc_object_t v47;
  _BYTE v48[128];

  p_identifiersToDiscover = (uint64_t *)&self->_identifiersToDiscover;
  identifiersToDiscover = self->_identifiersToDiscover;
  if (identifiersToDiscover
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _pairedBLEIdentifiers](self, "_pairedBLEIdentifiers")),
        v6 = -[NSSet isEqualToSet:](identifiersToDiscover, "isEqualToSet:", v5),
        v5,
        v6))
  {
    v7 = sub_100056C84(2uLL);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10006FD28(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v16 = (NSSet *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _pairedBLEIdentifiers](self, "_pairedBLEIdentifiers"));
    v17 = self->_identifiersToDiscover;
    self->_identifiersToDiscover = v16;

    v18 = sub_100056C84(2uLL);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_10006FCB4(p_identifiersToDiscover, v19);

    p_discoverer = &self->_discoverer;
    discoverer = self->_discoverer;
    if (discoverer)
    {
      -[CBDiscovery invalidate](discoverer, "invalidate");
      v22 = *p_discoverer;
      *p_discoverer = 0;

    }
    v8 = objc_alloc_init((Class)CBDiscovery);
    -[NSObject setDispatchQueue:](v8, "setDispatchQueue:", &_dispatch_main_q);
    -[NSObject setDiscoveryFlags:](v8, "setDiscoveryFlags:", 0x200000);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector identifiersToDiscover](self, "identifiersToDiscover"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
    -[NSObject setDeviceFilter:](v8, "setDeviceFilter:", v24);

    objc_initWeak(&location, self);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100064E40;
    v43[3] = &unk_1000B7A28;
    objc_copyWeak(&v44, &location);
    -[NSObject setDeviceFoundHandler:](v8, "setDeviceFoundHandler:", v43);
    -[NSObject activateWithCompletion:](v8, "activateWithCompletion:", &stru_1000B7A48);
    objc_storeStrong((id *)&self->_discoverer, v8);
    v25 = xpc_dictionary_create(0, 0, 0);
    v26 = xpc_array_create(0, 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector identifiersToDiscover](self, "identifiersToDiscover", 0));
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v40;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(v27);
          v31 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v30)), "UTF8String");
          if (v31)
          {
            v32 = xpc_string_create(v31);
            xpc_array_append_value(v26, v32);

          }
          v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v28);
    }

    xpc_dictionary_set_value(v25, "deviceFilter", v26);
    xpc_set_event("com.apple.bluetooth.discovery", "CarPlay", v25);
    v33 = sub_100056C84(2uLL);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v25;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "setup BLE XPC event for devices: %@", buf, 0xCu);
    }

    v35 = xpc_dictionary_create(0, 0, 0);
    v36 = xpc_string_create((const char *)objc_msgSend(CBUUIDLECarPlayServiceString, "UTF8String"));
    xpc_dictionary_set_value(v35, "serviceUUIDs", v36);
    xpc_set_event("com.apple.bluetooth.connections", "CarPlay", v35);
    v37 = sub_100056C84(2uLL);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "setup BLE XPC event for service connections", buf, 2u);
    }

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

}

- (NSSet)connectedVehicles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector vehiclesForBluetoothIdentifiers](self, "vehiclesForBluetoothIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (void)pairWithBluetoothLEIdentifier:(id)a3 deviceName:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_100056C84(2uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v19 = 1752392040;
    v20 = 2113;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "attempt to BLE pair to: %{private, mask.hash}@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
  v11 = objc_msgSend(v10, "state") == (id)5;

  if (v11)
  {
    -[CARCarPlayServiceConnector _pairWithBluetoothIdentifier:deviceName:](self, "_pairWithBluetoothIdentifier:deviceName:", v6, v7);
  }
  else
  {
    v12 = sub_100056C84(2uLL);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      v19 = 1752392040;
      v20 = 2113;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "pending pairing to %{private, mask.hash}@ until BLE is ready", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100065188;
    v14[3] = &unk_1000B6D80;
    objc_copyWeak(&v17, (id *)buf);
    v15 = v6;
    v16 = v7;
    -[CARCarPlayServiceConnector setActionPendingPowerOn:](self, "setActionPendingPowerOn:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

- (void)connectWithBluetoothLEIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = sub_100056C84(2uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v15 = 1752392040;
    v16 = 2113;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "attempt to BLE connect to: %{private, mask.hash}@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
  v8 = objc_msgSend(v7, "state") == (id)5;

  if (v8)
  {
    -[CARCarPlayServiceConnector _connectWithBluetoothIdentifier:completion:](self, "_connectWithBluetoothIdentifier:completion:", v4, 0);
  }
  else
  {
    v9 = sub_100056C84(2uLL);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      v15 = 1752392040;
      v16 = 2113;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pending connection to %{private, mask.hash}@ until BLE is ready", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000653CC;
    v11[3] = &unk_1000B55B0;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    -[CARCarPlayServiceConnector setActionPendingPowerOn:](self, "setActionPendingPowerOn:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)unpairWithBluetoothLEIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v20;
  void *v21;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector servicesForBluetoothIdentifiers](self, "servicesForBluetoothIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

    if (v6)
    {
      v7 = sub_100056C84(2uLL);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "removing connected service: %@", (uint8_t *)&v20, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector servicesForBluetoothIdentifiers](self, "servicesForBluetoothIdentifiers"));
      objc_msgSend(v9, "removeObjectForKey:", v4);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _periperalForIdentifier:](self, "_periperalForIdentifier:", v4));
    v11 = v10 != 0;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
      v13 = objc_msgSend(v4, "isEqual:", v12);

      if (v13)
      {
        -[CARCarPlayServiceConnector setPairingPeripheralIdentifier:](self, "setPairingPeripheralIdentifier:", 0);
        -[CARCarPlayServiceConnector setPairingPeripheralName:](self, "setPairingPeripheralName:", 0);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sharedPairingAgent"));
      objc_msgSend(v15, "unpairPeer:", v10);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector activePeripheral](self, "activePeripheral"));
      LODWORD(v15) = objc_msgSend(v10, "isEqual:", v16);

      if ((_DWORD)v15)
        -[CARCarPlayServiceConnector setActivePeripheral:](self, "setActivePeripheral:", 0);
    }
    else
    {
      v17 = sub_100056C84(2uLL);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10006FDF0();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_pairedBLEIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector vehicleStore](self, "vehicleStore", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allStoredVehicles"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "supportsBluetoothLE") && objc_msgSend(v10, "pairingStatus") == (id)2)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress"));
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_periperalForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
  v12 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "retrievePeripheralsWithIdentifiers:", v6));

  v8 = sub_100056C84(2uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10006FE50();

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  return v10;
}

- (id)_vehicleForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheral"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector vehiclesForBluetoothIdentifiers](self, "vehiclesForBluetoothIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (!v8)
  {
    v9 = sub_100056C84(2uLL);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006FEC0();

  }
  return v8;
}

- (void)_pairWithBluetoothIdentifier:(id)a3 deviceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CARCarPlayServiceConnector *v13;

  v6 = a3;
  v7 = a4;
  -[CARCarPlayServiceConnector setPairingPeripheralIdentifier:](self, "setPairingPeripheralIdentifier:", v6);
  -[CARCarPlayServiceConnector setPairingPeripheralName:](self, "setPairingPeripheralName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedPairingAgent"));
  objc_msgSend(v9, "setDelegate:", self);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065A04;
  v11[3] = &unk_1000B7A70;
  v12 = v6;
  v13 = self;
  v10 = v6;
  -[CARCarPlayServiceConnector _connectWithBluetoothIdentifier:completion:](self, "_connectWithBluetoothIdentifier:completion:", v10, v11);

}

- (void)_finishedCurrentPairing
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_100056C84(2uLL);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "finished current pairing attempt", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedPairingAgent"));
  objc_msgSend(v6, "setDelegate:", 0);

  -[CARCarPlayServiceConnector setCurrentConnectionCompletion:](self, "setCurrentConnectionCompletion:", 0);
  -[CARCarPlayServiceConnector setPairingPeripheralIdentifier:](self, "setPairingPeripheralIdentifier:", 0);
  -[CARCarPlayServiceConnector setPairingPeripheralName:](self, "setPairingPeripheralName:", 0);
}

- (void)_connectWithBluetoothIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector servicesForBluetoothIdentifiers](self, "servicesForBluetoothIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (v9)
  {
    v10 = sub_100056C84(2uLL);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100070010();

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector servicesForBluetoothIdentifiers](self, "servicesForBluetoothIdentifiers"));
    objc_msgSend(v12, "removeObjectForKey:", v6);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _periperalForIdentifier:](self, "_periperalForIdentifier:", v6));
  v14 = sub_100056C84(2uLL);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      v18 = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_connectWithBluetoothIdentifier peripheral %@ name: %@", (uint8_t *)&v18, 0x16u);

    }
    -[CARCarPlayServiceConnector setCurrentConnectionCompletion:](self, "setCurrentConnectionCompletion:", v7);
    -[CARCarPlayServiceConnector setActivePeripheral:](self, "setActivePeripheral:", v13);
    v16 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
    -[NSObject connectPeripheral:options:](v16, "connectPeripheral:options:", v13, 0);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    sub_10006FFB0();
  }

}

- (void)_startServiceForPeripheral:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;

  v4 = a3;
  v5 = sub_100056C84(2uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting CarPlay service for %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100065F38;
  v8[3] = &unk_1000B7A98;
  v8[4] = self;
  -[CARCarPlayServiceConnector _connectWithBluetoothIdentifier:completion:](self, "_connectWithBluetoothIdentifier:completion:", v7, v8);

}

- (void)_addConnectedVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = sub_100056C84(2uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connected vehicle: %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = objc_alloc((Class)NSUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  v9 = objc_msgSend(v7, "initWithUUIDString:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector vehiclesForBluetoothIdentifiers](self, "vehiclesForBluetoothIdentifiers"));
  objc_msgSend(v10, "setObject:forKey:", v4, v9);

  v11 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector delegate](self, "delegate"));
  v12 = (void *)v11;
  if (v11 && (objc_opt_respondsToSelector(v11, "serviceConnector:didConnectVehicle:") & 1) != 0)
    objc_msgSend(v12, "serviceConnector:didConnectVehicle:", self, v4);

}

- (void)_removeConnectedVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = sub_100056C84(2uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "disconnected vehicle: %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = objc_alloc((Class)NSUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  v9 = objc_msgSend(v7, "initWithUUIDString:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector vehiclesForBluetoothIdentifiers](self, "vehiclesForBluetoothIdentifiers"));
  objc_msgSend(v10, "removeObjectForKey:", v9);

  v11 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector delegate](self, "delegate"));
  v12 = (void *)v11;
  if (v11 && (objc_opt_respondsToSelector(v11, "serviceConnector:didDisconnectVehicle:") & 1) != 0)
    objc_msgSend(v12, "serviceConnector:didDisconnectVehicle:", self, v4);

}

- (void)_handleIdentificationMessage:(id)a3 fromService:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = sub_100056C84(2uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedIdentification", (const char *)&unk_1000A929A, (uint8_t *)&v15, 2u);
  }

  v10 = sub_100056C84(2uLL);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received identification: %@", (uint8_t *)&v15, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peripheral"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  v14 = -[CARCarPlayServiceVehicle initFromBluetoothIdentifier:service:identificationMessage:]([CARCarPlayServiceVehicle alloc], "initFromBluetoothIdentifier:service:identificationMessage:", v13, v7, v6);
  -[CARCarPlayServiceConnector _addConnectedVehicle:](self, "_addConnectedVehicle:", v14);

}

- (void)_handleStartSessionMessage:(id)a3 fromService:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100056C84(2uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedCarPlayStartSession", (const char *)&unk_1000A929A, (uint8_t *)&v13, 2u);
  }

  v10 = sub_100056C84(2uLL);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received start session: %@", (uint8_t *)&v13, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _vehicleForService:](self, "_vehicleForService:", v7));
  if (v12)
    objc_msgSend(v12, "_handleStartSessionMessage:", v6);

}

- (void)_mainQueue_handleDidDiscoverDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  int v26;
  id v27;
  NSObject *v28;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _pairedBLEIdentifiers](self, "_pairedBLEIdentifiers"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
    v28 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "retrievePeripheralsWithIdentifiers:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    if (!v12)
    {
      v17 = sub_100056C84(2uLL);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000700D8();
      goto LABEL_16;
    }
    if ((objc_msgSend(v12, "isConnectedToSystem") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector activePeripheral](self, "activePeripheral"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      if (objc_msgSend(v13, "isEqual:", v15))
      {

      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector servicesForBluetoothIdentifiers](self, "servicesForBluetoothIdentifiers"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v8));

        if (!v22)
        {
          v24 = sub_100056C84(2uLL);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = 138412290;
            v27 = v4;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "attempt to locally connect to discovered & connected device: %@", (uint8_t *)&v26, 0xCu);
          }

          -[CARCarPlayServiceConnector connectWithBluetoothLEIdentifier:](self, "connectWithBluetoothLEIdentifier:", v8);
          goto LABEL_17;
        }
      }
      v23 = sub_100056C84(2uLL);
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v12;
        v20 = "discovered peripheral is already connecting: %@";
        goto LABEL_15;
      }
    }
    else
    {
      v19 = sub_100056C84(2uLL);
      v18 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v12;
        v20 = "discovered peripheral is not connected: %@";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v26, 0xCu);
      }
    }
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  v16 = sub_100056C84(2uLL);
  v8 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100070138();
LABEL_18:

}

- (void)carPlayServiceDidActivate:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066908;
  block[3] = &unk_1000B51B8;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)carPlayService:(id)a3 didSendMessage:(id)a4
{
  id v4;
  _QWORD block[4];
  id v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066A80;
  block[3] = &unk_1000B51B8;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)carPlayService:(id)a3 didFailToSendMessage:(id)a4
{
  id v4;
  _QWORD block[4];
  id v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066BA0;
  block[3] = &unk_1000B51B8;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)carPlayService:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  CARCarPlayServiceConnector *v11;
  id v12;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066C98;
  block[3] = &unk_1000B53B8;
  v10 = a4;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)carPlayServiceDidDeactivate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CARCarPlayServiceConnector *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100066DE8;
  v5[3] = &unk_1000B5390;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  NSObject *v11;
  int v12;
  id v13;

  v4 = a3;
  v5 = sub_100056C84(2uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = objc_msgSend(v4, "state");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector centralManagerDidUpdateState, state is now: %ld", (uint8_t *)&v12, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector centralManager](self, "centralManager"));
  v8 = objc_msgSend(v7, "state");

  if (v8 == (id)5)
  {
    v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector actionPendingPowerOn](self, "actionPendingPowerOn"));
    if (v9)
    {
      v10 = sub_100056C84(2uLL);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "now powered on, starting pending action", (uint8_t *)&v12, 2u);
      }

      v9[2](v9);
    }

  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = sub_100056C84(2uLL);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didDiscoverPeripheral %@ advertisementData: %@, RSSI: %@", (uint8_t *)&v13, 0x20u);
  }

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;

  v5 = a4;
  v6 = sub_100056C84(2uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connected", (const char *)&unk_1000A929A, (uint8_t *)&v20, 2u);
  }

  v8 = sub_100056C84(2uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didConnectPeripheral %@", (uint8_t *)&v20, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _pairedBLEIdentifiers](self, "_pairedBLEIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v13 = objc_msgSend(v10, "containsObject:", v12);

  if (v13)
  {
    v14 = sub_100056C84(2uLL);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector connected periperal is paired, starting service", (uint8_t *)&v20, 2u);
    }

    -[CARCarPlayServiceConnector _startServiceForPeripheral:](self, "_startServiceForPeripheral:", v5);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector activePeripheral](self, "activePeripheral"));
  v17 = objc_msgSend(v5, "isEqual:", v16);

  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector currentConnectionCompletion](self, "currentConnectionCompletion"));
    v19 = (void *)v18;
    if (v18)
    {
      (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v18 + 16))(v18, v5, 1, 0);
      -[CARCarPlayServiceConnector setCurrentConnectionCompletion:](self, "setCurrentConnectionCompletion:", 0);
    }

  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = sub_100056C84(2uLL);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didFailToConnectPeripheral %@: %@", (uint8_t *)&v15, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector activePeripheral](self, "activePeripheral"));
  v12 = objc_msgSend(v7, "isEqual:", v11);

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector currentConnectionCompletion](self, "currentConnectionCompletion"));
    v14 = (void *)v13;
    if (v13)
    {
      (*(void (**)(uint64_t, id, _QWORD, id))(v13 + 16))(v13, v7, 0, v8);
      -[CARCarPlayServiceConnector setCurrentConnectionCompletion:](self, "setCurrentConnectionCompletion:", 0);
    }
    -[CARCarPlayServiceConnector setActivePeripheral:](self, "setActivePeripheral:", 0);

  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = sub_100056C84(2uLL);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Disconnected", (const char *)&unk_1000A929A, (uint8_t *)&v15, 2u);
  }

  v11 = sub_100056C84(2uLL);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didDisconnectPeripheral %@: %@", (uint8_t *)&v15, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector activePeripheral](self, "activePeripheral"));
  v14 = objc_msgSend(v7, "isEqual:", v13);

  if (v14)
    -[CARCarPlayServiceConnector setActivePeripheral:](self, "setActivePeripheral:", 0);

}

- (void)centralManager:(id)a3 didUpdateANCSAuthorizationForPeripheral:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  v5 = sub_100056C84(2uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CARCarPlayServiceConnector didUpdateANCSAuthorizationForPeripheral %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;

  v5 = a4;
  v6 = sub_100056C84(2uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
    v21 = 141558787;
    v22 = 1752392040;
    v23 = 2113;
    v24 = v8;
    v25 = 2160;
    v26 = 1752392040;
    v27 = 2113;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "peerDidCompletePairing %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", (uint8_t *)&v21, 0x2Au);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    v13 = sub_100056C84(2uLL);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 141558275;
      v22 = 1752392040;
      v23 = 2113;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "completed BLE pairing for %{private, mask.hash}@", (uint8_t *)&v21, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralName](self, "pairingPeripheralName"));
    v16 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector delegate](self, "delegate"));
    v17 = (void *)v16;
    if (v16
      && (objc_opt_respondsToSelector(v16, "serviceConnector:completedPairingForBluetoothLEIdentifier:name:") & 1) != 0)
    {
      objc_msgSend(v17, "serviceConnector:completedPairingForBluetoothLEIdentifier:name:", self, v10, v15);
    }
    -[CARCarPlayServiceConnector _finishedCurrentPairing](self, "_finishedCurrentPairing");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector _periperalForIdentifier:](self, "_periperalForIdentifier:", v10));
    if (v18)
    {
      -[CARCarPlayServiceConnector _startServiceForPeripheral:](self, "_startServiceForPeripheral:", v18);
    }
    else
    {
      v19 = sub_100056C84(2uLL);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100070268();

    }
  }

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v7 = a4;
  v8 = a5;
  v9 = sub_100056C84(2uLL);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100070368(v7, self, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    v14 = sub_100056C84(2uLL);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000702C8(v7, (uint64_t)v8, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralName](self, "pairingPeripheralName"));
    v17 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector delegate](self, "delegate"));
    v18 = (void *)v17;
    if (v17
      && (objc_opt_respondsToSelector(v17, "serviceConnector:failedPairingForBluetoothLEIdentifier:name:error:") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      objc_msgSend(v18, "serviceConnector:failedPairingForBluetoothLEIdentifier:name:error:", self, v19, v16, v8);

    }
    -[CARCarPlayServiceConnector _finishedCurrentPairing](self, "_finishedCurrentPairing");

  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;

  v5 = a4;
  v6 = sub_100056C84(2uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
    v16 = 141558787;
    v17 = 1752392040;
    v18 = 2113;
    v19 = v8;
    v20 = 2160;
    v21 = 1752392040;
    v22 = 2113;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "peerDidUnpair %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", (uint8_t *)&v16, 0x2Au);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    v13 = sub_100056C84(2uLL);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v16 = 141558275;
      v17 = 1752392040;
      v18 = 2113;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "unpaired BLE: %{private, mask.hash}@", (uint8_t *)&v16, 0x16u);

    }
    -[CARCarPlayServiceConnector _finishedCurrentPairing](self, "_finishedCurrentPairing");
  }

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  CARCarPlayServiceConnector *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;

  v9 = a4;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v12 = sub_100056C84(2uLL);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
    *(_DWORD *)buf = 141558787;
    v30 = 1752392040;
    v31 = 2113;
    v32 = v11;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2113;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "peerDidRequestPairing %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", buf, 0x2Au);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralIdentifier](self, "pairingPeripheralIdentifier"));
  v16 = objc_msgSend(v11, "isEqual:", v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector pairingPeripheralName](self, "pairingPeripheralName"));
    v18 = sub_100056C84(2uLL);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558531;
      v30 = 1752392040;
      v31 = 2113;
      v32 = v11;
      v33 = 2113;
      v34 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "requested BLE pairing confirmation for %{private, mask.hash}@ (\"%{private}@\")", buf, 0x20u);
    }

    if (a5 == 4)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceConnector delegate](self, "delegate"));
      v21 = v20;
      if (v20
        && (objc_opt_respondsToSelector(v20, "serviceConnector:requestsPairingConfirmationForBluetoothLEIdentifier:name:numericCode:responseHandler:") & 1) != 0)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100067F0C;
        v23[3] = &unk_1000B7AC0;
        v24 = v11;
        v25 = self;
        v26 = v9;
        v28 = 4;
        v27 = v10;
        -[NSObject serviceConnector:requestsPairingConfirmationForBluetoothLEIdentifier:name:numericCode:responseHandler:](v21, "serviceConnector:requestsPairingConfirmationForBluetoothLEIdentifier:name:numericCode:responseHandler:", self, v24, v17, v27, v23);

      }
    }
    else
    {
      v22 = sub_100056C84(2uLL);
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100070444();
    }

  }
}

- (void)vehicleStoreDidBecomeAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100056C84(2uLL);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updating BLE XPC event now that vehicle store is available", v6, 2u);
  }

  -[CARCarPlayServiceConnector _updateDiscoverer](self, "_updateDiscoverer");
}

- (void)vehicleStore:(id)a3 didSaveVehicle:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  if (objc_msgSend(a4, "supportsBluetoothLE", a3))
  {
    v5 = sub_100056C84(2uLL);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updating BLE XPC event for saved BLE vehicle", v7, 2u);
    }

    -[CARCarPlayServiceConnector _updateDiscoverer](self, "_updateDiscoverer");
  }
}

- (void)vehicleStore:(id)a3 didRemoveVehicle:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  if (objc_msgSend(a4, "supportsBluetoothLE", a3))
  {
    v5 = sub_100056C84(2uLL);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updating BLE XPC event for removed BLE vehicle", v7, 2u);
    }

    -[CARCarPlayServiceConnector _updateDiscoverer](self, "_updateDiscoverer");
  }
}

- (CARCarPlayServiceConnectorDelegate)delegate
{
  return (CARCarPlayServiceConnectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (CBDiscovery)discoverer
{
  return self->_discoverer;
}

- (NSSet)identifiersToDiscover
{
  return self->_identifiersToDiscover;
}

- (NSMutableDictionary)servicesForBluetoothIdentifiers
{
  return self->_servicesForBluetoothIdentifiers;
}

- (NSMutableDictionary)vehiclesForBluetoothIdentifiers
{
  return self->_vehiclesForBluetoothIdentifiers;
}

- (NSUUID)pairingPeripheralIdentifier
{
  return self->_pairingPeripheralIdentifier;
}

- (void)setPairingPeripheralIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairingPeripheralIdentifier, a3);
}

- (NSString)pairingPeripheralName
{
  return self->_pairingPeripheralName;
}

- (void)setPairingPeripheralName:(id)a3
{
  objc_storeStrong((id *)&self->_pairingPeripheralName, a3);
}

- (CBPeripheral)activePeripheral
{
  return self->_activePeripheral;
}

- (void)setActivePeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_activePeripheral, a3);
}

- (id)currentConnectionCompletion
{
  return self->_currentConnectionCompletion;
}

- (void)setCurrentConnectionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)actionPendingPowerOn
{
  return self->_actionPendingPowerOn;
}

- (void)setActionPendingPowerOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionPendingPowerOn, 0);
  objc_storeStrong(&self->_currentConnectionCompletion, 0);
  objc_storeStrong((id *)&self->_activePeripheral, 0);
  objc_storeStrong((id *)&self->_pairingPeripheralName, 0);
  objc_storeStrong((id *)&self->_pairingPeripheralIdentifier, 0);
  objc_storeStrong((id *)&self->_vehiclesForBluetoothIdentifiers, 0);
  objc_storeStrong((id *)&self->_servicesForBluetoothIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToDiscover, 0);
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
