@implementation CARMessagingServiceConnector

- (CARMessagingServiceConnector)initWithVehicleStore:(id)a3
{
  id v4;
  CARMessagingServiceConnector *v5;
  uint64_t v6;
  CRVehicleAccessoryManager *accessoryManager;
  ACCConnectionInfo *v8;
  ACCConnectionInfo *coreAccessoriesManager;
  CARCarPlayServiceConnector *v10;
  CARCarPlayServiceConnector *serviceConnector;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CARMessagingServiceConnector;
  v5 = -[CARMessagingServiceConnector init](&v13, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[CRVehicleAccessoryManager sharedInstance](CRVehicleAccessoryManager, "sharedInstance"));
    accessoryManager = v5->_accessoryManager;
    v5->_accessoryManager = (CRVehicleAccessoryManager *)v6;

    -[CRVehicleAccessoryManager addObserver:](v5->_accessoryManager, "addObserver:", v5);
    v8 = (ACCConnectionInfo *)objc_alloc_init((Class)ACCConnectionInfo);
    coreAccessoriesManager = v5->_coreAccessoriesManager;
    v5->_coreAccessoriesManager = v8;

    -[ACCConnectionInfo registerDelegate:](v5->_coreAccessoriesManager, "registerDelegate:", v5);
    v10 = -[CARCarPlayServiceConnector initWithVehicleStore:]([CARCarPlayServiceConnector alloc], "initWithVehicleStore:", v4);
    serviceConnector = v5->_serviceConnector;
    v5->_serviceConnector = v10;

    -[CARCarPlayServiceConnector setDelegate:](v5->_serviceConnector, "setDelegate:", v5);
  }

  return v5;
}

- (NSSet)connectedVehicles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector accessoryManager](self, "accessoryManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedVehicleAccessories"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector serviceConnector](self, "serviceConnector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedVehicles"));

  if (objc_msgSend(v4, "count") && objc_msgSend(v6, "count"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setByAddingObjectsFromSet:", v6));
  }
  else if (objc_msgSend(v4, "count"))
  {
    v7 = v4;
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return (NSSet *)v8;
}

- (void)pairWithBluetoothLEIdentifier:(id)a3 deviceName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector serviceConnector](self, "serviceConnector"));
  objc_msgSend(v8, "pairWithBluetoothLEIdentifier:deviceName:", v7, v6);

}

- (void)connectWithBluetoothLEIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector serviceConnector](self, "serviceConnector"));
  objc_msgSend(v5, "connectWithBluetoothLEIdentifier:", v4);

}

- (BOOL)unpairWithBluetoothLEIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector serviceConnector](self, "serviceConnector"));
  v6 = objc_msgSend(v5, "unpairWithBluetoothLEIdentifier:", v4);

  return v6;
}

- (void)beginWiredBluetoothPairingWithVehicle:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(CRVehicleAccessory);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    objc_msgSend(v5, "beginWiredBluetoothPairing:", v6);
  }
  else
  {
    v8 = sub_100056C84(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000691EC();

  }
}

- (void)requestWiFiCredentialsFromVehicle:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  v4 = objc_opt_class(CRVehicleAccessory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    objc_msgSend(v3, "requestWiFiCredentials");
  }
  else
  {
    v5 = sub_100056C84(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100069218();

  }
}

- (void)sendDeviceTransportIdentifiersToVehicle:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  v4 = objc_opt_class(CRVehicleAccessory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    objc_msgSend(v3, "sendDeviceTransportIdentifiers");
  }
  else
  {
    v5 = sub_100056C84(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100069244();

  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 wirelessCarPlayAvailable:(id)a4 themeAssetsAvailable:(id)a5 toVehicle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  CARCarPlayServiceMessageAvailability *v24;
  const __CFString *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "BOOLValue"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector _usbSerialNumber](self, "_usbSerialNumber"));
  else
    v14 = 0;
  v15 = objc_msgSend(v11, "BOOLValue");
  if ((_DWORD)v15)
  {
    v15 = (id)MGGetStringAnswer(CFSTR("BluetoothAddress"));
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  v17 = CarPairingLogging(v15);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v10)
    {
      if (objc_msgSend(v10, "BOOLValue"))
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
    }
    else
    {
      v20 = CFSTR("unset");
    }
    v25 = v20;
    if (v11)
    {
      if (objc_msgSend(v11, "BOOLValue"))
        v19 = CFSTR("YES");
      if (v12)
        goto LABEL_17;
    }
    else
    {
      v19 = CFSTR("unset");
      if (v12)
      {
LABEL_17:
        if (objc_msgSend(v12, "BOOLValue"))
          v21 = CFSTR("YES");
        else
          v21 = CFSTR("NO");
        goto LABEL_22;
      }
    }
    v21 = CFSTR("unset");
LABEL_22:
    *(_DWORD *)buf = 138544386;
    v27 = v25;
    v28 = 2112;
    v29 = v14;
    v30 = 2114;
    v31 = v19;
    v32 = 2112;
    v33 = v16;
    v34 = 2114;
    v35 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sending CarPlayAvailability {wired: %{public}@ USB: %@} {wireless: %{public}@ BT: %@} {assets: %{public}@}", buf, 0x34u);
  }

  v22 = objc_opt_class(CRVehicleAccessory);
  if ((objc_opt_isKindOfClass(v13, v22) & 1) != 0)
  {
    objc_msgSend(v13, "sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:themeAssetsAvailable:", v10, v14, v11, v16, v12);
  }
  else
  {
    v23 = objc_opt_class(CARCarPlayServiceVehicle);
    if ((objc_opt_isKindOfClass(v13, v23) & 1) != 0)
    {
      v24 = -[CARCarPlayServiceMessageAvailability initWithWirelessAvailable:wiredAvailable:usbIdentifier:themeAssetsAvailable:]([CARCarPlayServiceMessageAvailability alloc], "initWithWirelessAvailable:wiredAvailable:usbIdentifier:themeAssetsAvailable:", v11 != 0, v10, v14, v12);
      objc_msgSend(v13, "sendCarPlayAvailability:", v24);

    }
  }

}

- (id)vehicleAccessoryForiAPConnectionIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector accessoryManager](self, "accessoryManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleAccessoryForiAPConnectionIdentifier:", a3));

  return v5;
}

- (id)vehicleAccessoryForCertificateSerial:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector accessoryManager](self, "accessoryManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleAccessoryForCertificateSerial:", v4));

  return v6;
}

- (id)_usbSerialNumber
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  void *CFProperty;
  void *v5;
  void *v6;

  v2 = IOServiceMatching("IOUSBDeviceController");
  if (v2 && (MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2)) != 0)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("DeviceDescription"), kCFAllocatorDefault, 0);
    v5 = CFProperty;
    if (CFProperty)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFProperty, "objectForKey:", CFSTR("serialNumber")));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)serviceConnector:(id)a3 requestsPairingConfirmationForBluetoothLEIdentifier:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v15 = (void *)v14;
  if (v14
    && (objc_opt_respondsToSelector(v14, "serviceConnector:requestsPairingConfirmationForBluetoothLEIdentifier:name:numericCode:responseHandler:") & 1) != 0)
  {
    objc_msgSend(v15, "serviceConnector:requestsPairingConfirmationForBluetoothLEIdentifier:name:numericCode:responseHandler:", self, v16, v11, v12, v13);
  }

}

- (void)serviceConnector:(id)a3 failedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v12 = (void *)v11;
  if (v11
    && (objc_opt_respondsToSelector(v11, "serviceConnector:failedPairingForBluetoothLEIdentifier:name:error:") & 1) != 0)
  {
    objc_msgSend(v12, "serviceConnector:failedPairingForBluetoothLEIdentifier:name:error:", self, v13, v9, v10);
  }

}

- (void)serviceConnector:(id)a3 completedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v9 = (void *)v8;
  if (v8
    && (objc_opt_respondsToSelector(v8, "serviceConnector:completedPairingForBluetoothLEIdentifier:name:") & 1) != 0)
  {
    objc_msgSend(v9, "serviceConnector:completedPairingForBluetoothLEIdentifier:name:", self, v10, v7);
  }

}

- (void)serviceConnector:(id)a3 didConnectVehicle:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "setDelegate:", self);
  v5 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "serviceConnector:didConnectVehicle:") & 1) != 0)
    objc_msgSend(v6, "serviceConnector:didConnectVehicle:", self, v7);

}

- (void)serviceConnector:(id)a3 didDisconnectVehicle:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "serviceConnector:didDisconnectVehicle:") & 1) != 0)
    objc_msgSend(v6, "serviceConnector:didDisconnectVehicle:", self, v7);

}

- (void)serviceVehicle:(id)a3 receivedStartSessionMessage:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v8 = (void *)v7;
  if (v7 && (objc_opt_respondsToSelector(v7, "serviceConnector:receivedStartSessionMessage:fromVehicle:") & 1) != 0)
    objc_msgSend(v8, "serviceConnector:receivedStartSessionMessage:fromVehicle:", self, v6, v9);

}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  -[CARMessagingServiceConnector _updateCarKeyInformationForVehicleAccessory:](self, "_updateCarKeyInformationForVehicleAccessory:");
  v5 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "serviceConnector:didConnectVehicle:") & 1) != 0)
    objc_msgSend(v6, "serviceConnector:didConnectVehicle:", self, v7);

}

- (void)accessoryManager:(id)a3 didUpdateVehicleAccessory:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "serviceConnector:didUpdateVehicle:") & 1) != 0)
    objc_msgSend(v6, "serviceConnector:didUpdateVehicle:", self, v7);

}

- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "serviceConnector:didDisconnectVehicle:") & 1) != 0)
    objc_msgSend(v6, "serviceConnector:didDisconnectVehicle:", self, v7);

}

- (void)accessoryManager:(id)a3 didConnectUnsupportedAccessoryWithBluetoothAddress:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5
    && (objc_opt_respondsToSelector(v5, "serviceConnector:didConnectUnsupportedAccessoryWithBluetoothAddress:") & 1) != 0)
  {
    objc_msgSend(v6, "serviceConnector:didConnectUnsupportedAccessoryWithBluetoothAddress:", self, v7);
  }

}

- (void)_updateCarKeyInformationForVehicleAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v21;
  NSObject *v22;
  __int128 *p_buf;
  uint8_t v24[4];
  uint64_t v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coreAccessoriesEndpointUUID"));
  v6 = sub_100056C84(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetching digital car info for endpoint: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = sub_100010918;
  v29 = sub_100010928;
  v30 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARMessagingServiceConnector coreAccessoriesManager](self, "coreAccessoriesManager"));
  v10 = kACCProperties_Endpoint_DigitalCarKey_Group;
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100010930;
  v21 = &unk_1000B53E0;
  p_buf = &buf;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v9, "accessoryProperty:forEndpoint:connection:withReply:", v10, v5, &stru_1000B87A0, &v18);

  v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    v13 = sub_100056C84(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100069270();

  }
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v15 = sub_100056C84(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v24 = 138477827;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "vehicle declared digital car key support: %{private}@", v24, 0xCu);
    }

    objc_msgSend(v4, "setDigitalCarKeyInformation:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v18, v19, v20, v21);
  }

  _Block_object_dispose(&buf, 8);
}

- (CARMessagingServiceConnectorDelegate)delegate
{
  return (CARMessagingServiceConnectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACCConnectionInfo)coreAccessoriesManager
{
  return self->_coreAccessoriesManager;
}

- (CRVehicleAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (CARCarPlayServiceConnector)serviceConnector
{
  return self->_serviceConnector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnector, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_coreAccessoriesManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
