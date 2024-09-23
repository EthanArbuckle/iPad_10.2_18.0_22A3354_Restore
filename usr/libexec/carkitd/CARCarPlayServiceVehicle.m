@implementation CARCarPlayServiceVehicle

- (id)initFromBluetoothIdentifier:(id)a3 service:(id)a4 identificationMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  CARCarPlayServiceVehicle *v11;
  CARCarPlayServiceVehicle *v12;
  uint64_t v13;
  NSString *bluetoothAddress;
  uint64_t v15;
  NSString *vehicleName;
  uint64_t v17;
  NSString *vehicleModelName;
  uint64_t v19;
  NSString *PPID;
  uint64_t v21;
  NSArray *accessoryProtocols;
  uint64_t v23;
  NSData *certificateSerialNumber;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CARCarPlayServiceVehicle;
  v11 = -[CARCarPlayServiceVehicle init](&v26, "init");
  v12 = v11;
  if (v11)
  {
    v11->_transportType = 4;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    bluetoothAddress = v12->_bluetoothAddress;
    v12->_bluetoothAddress = (NSString *)v13;

    objc_storeWeak((id *)&v12->_service, v9);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
    vehicleName = v12->_vehicleName;
    v12->_vehicleName = (NSString *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelName"));
    vehicleModelName = v12->_vehicleModelName;
    v12->_vehicleModelName = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "PPID"));
    PPID = v12->_PPID;
    v12->_PPID = (NSString *)v19;

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryProtocols"));
    accessoryProtocols = v12->_accessoryProtocols;
    v12->_accessoryProtocols = (NSArray *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authenticationSerialNumber"));
    certificateSerialNumber = v12->_certificateSerialNumber;
    v12->_certificateSerialNumber = (NSData *)v23;

    v12->_supportsUSBCarPlay = objc_msgSend(v10, "supportsWiredCarPlay");
    *(_WORD *)&v12->_supportsWirelessCarPlay = 257;
    v12->_supportsWiredBluetoothPairing = objc_msgSend(v10, "supportsWiredToWirelessPairing");
    v12->_supportsCarPlayConnectionRequest = 1;
    v12->_supportsEnhancedIntegration = objc_msgSend(v10, "supportsEnhancedIntegration");
    v12->_supportsThemeAssets = objc_msgSend(v10, "supportsThemeAssets");
  }

  return v12;
}

- (NSString)description
{
  NSString *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v16;
  const __CFString *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CARCarPlayServiceVehicle;
  v3 = -[CARCarPlayServiceVehicle description](&v19, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = -[CARCarPlayServiceVehicle transportType](self, "transportType");
  if ((unint64_t)(v4 - 1) > 3)
    v5 = CFSTR("unknown");
  else
    v5 = *(&off_1000B6EF8 + v4 - 1);
  v17 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle bluetoothAddress](self, "bluetoothAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleName](self, "vehicleName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleModelName](self, "vehicleModelName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle PPID](self, "PPID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle certificateSerialNumber](self, "certificateSerialNumber"));
  if (-[CARCarPlayServiceVehicle supportsUSBCarPlay](self, "supportsUSBCarPlay"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[CARCarPlayServiceVehicle supportsWiredBluetoothPairing](self, "supportsWiredBluetoothPairing"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[CARCarPlayServiceVehicle supportsEnhancedIntegration](self, "supportsEnhancedIntegration"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (-[CARCarPlayServiceVehicle supportsThemeAssets](self, "supportsThemeAssets"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {transport: %@ btID: %@, name: %@, model: %@, PPID: %@, authSerial: %@, wired: %@, oob: %@, enhancedIntegration: %@, assets: %@}"), v18, v17, v16, v6, v7, v8, v9, v10, v11, v12, v13));

  return (NSString *)v14;
}

- (NSDictionary)digitalCarKeyInformation
{
  return 0;
}

- (NSDictionary)analyticsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleName](self, "vehicleName"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleName](self, "vehicleName"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("name"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleModelName](self, "vehicleModelName"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleModelName](self, "vehicleModelName"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("modelName"));

  }
  v8 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v8;
}

- (NSDictionary)vehicleAccessoryInfoKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleName](self, "vehicleName"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleName](self, "vehicleName"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleModelName](self, "vehicleModelName"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle vehicleModelName](self, "vehicleModelName"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("modelName"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle PPID](self, "PPID"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle PPID](self, "PPID"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ppid"));

  }
  v10 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v10;
}

- (void)sendCarPlayAvailability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle service](self, "service"));
    if (v5)
    {
      v6 = sub_100056C84(2uLL);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sending CarPlayAvailability: %@ using service: %@", (uint8_t *)&v10, 0x16u);
      }

      v8 = sub_100056C84(2uLL);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_signpost_enabled(v9))
      {
        LOWORD(v10) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SentCarPlayAvailability", (const char *)&unk_1000A929A, (uint8_t *)&v10, 2u);
      }

      objc_msgSend(v5, "sendMessage:", v4);
    }

  }
}

- (void)_handleStartSessionMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceVehicle delegate](self, "delegate"));
  v5 = (void *)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "serviceVehicle:receivedStartSessionMessage:") & 1) != 0)
    objc_msgSend(v5, "serviceVehicle:receivedStartSessionMessage:", self, v6);

}

- (int64_t)transportType
{
  return self->_transportType;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (NSData)certificateSerialNumber
{
  return self->_certificateSerialNumber;
}

- (NSString)PPID
{
  return self->_PPID;
}

- (NSArray)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (BOOL)supportsUSBCarPlay
{
  return self->_supportsUSBCarPlay;
}

- (BOOL)supportsWirelessCarPlay
{
  return self->_supportsWirelessCarPlay;
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (BOOL)supportsWiredBluetoothPairing
{
  return self->_supportsWiredBluetoothPairing;
}

- (BOOL)supportsCarPlayConnectionRequest
{
  return self->_supportsCarPlayConnectionRequest;
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (BOOL)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (CARCarPlayServiceVehicleDelegate)delegate
{
  return (CARCarPlayServiceVehicleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CARBluetoothCarPlayService)service
{
  return (CARBluetoothCarPlayService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
