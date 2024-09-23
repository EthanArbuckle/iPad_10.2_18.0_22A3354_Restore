@implementation GHSBluetoothDevice

+ (id)ghsDeviceWithProperties:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  __objc2_class **v7;
  id v8;

  v3 = a3;
  if (qword_1000C9168 != -1)
    dispatch_once(&qword_1000C9168, &stru_1000AE5A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kBTDeviceTypeMDCDevSpecKey")));
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v5 > 4110)
  {
    if (v5 == 4111)
    {
      v7 = off_1000AC6A8;
      goto LABEL_13;
    }
    if (v5 == 4113)
    {
      v7 = off_1000AC688;
      goto LABEL_13;
    }
LABEL_12:
    v7 = off_1000AC698;
    goto LABEL_13;
  }
  if (v5 == 4103)
  {
    v7 = off_1000AC690;
    goto LABEL_13;
  }
  if (v5 != 4104)
    goto LABEL_12;
  v7 = off_1000AC6A0;
LABEL_13:
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(*v7, v6)), "initWithProperties:healthStore:", v3, qword_1000C9160);

  return v8;
}

- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  void *v9;

  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10007217C(v9, self);
  return 0;
}

- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  void *v9;

  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100072218(v9, self);
  return 0;
}

- (GHSBluetoothDevice)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GHSBluetoothDevice init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Calling %@ is not allowed"), v3);

  return 0;
}

- (GHSBluetoothDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6;
  GHSBluetoothDevice *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  objc_super v22;

  v6 = a3;
  v21 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GHSBluetoothDevice;
  v7 = -[GHSBluetoothDevice init](&v22, "init");
  if (v7)
  {
    v20 = objc_alloc((Class)HKDevice);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kGHSDeviceNameKey")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ManufacturerName")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ModelNumber")));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HardwareRevision")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FirmwareRevision")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SoftwareRevision")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UUID")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UDIForMedicalDevices")));
    v15 = (void *)v10;
    v16 = objc_msgSend(v20, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v19, v8, v9, v10, v11, v12, v13, v14);
    -[GHSBluetoothDevice setHkDevice:](v7, "setHkDevice:", v16);

    -[GHSBluetoothDevice setHkStore:](v7, "setHkStore:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kGHSPDebugLoggingEnabledKey")));
    -[GHSBluetoothDevice setDebugLoggingEnabled:](v7, "setDebugLoggingEnabled:", v17);

  }
  return v7;
}

- (GHSBluetoothDevice)initWithProperties:(id)a3 healthStore:(id)a4 healthSampleTypes:(id)a5
{
  id v8;
  GHSBluetoothDevice *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  GHSBluetoothDevice *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  GHSBluetoothDevice *v27;
  objc_super v28;

  v8 = a3;
  v25 = a4;
  v24 = a5;
  v28.receiver = self;
  v28.super_class = (Class)GHSBluetoothDevice;
  v9 = -[GHSBluetoothDevice init](&v28, "init");
  if (v9)
  {
    v23 = objc_alloc((Class)HKDevice);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kGHSDeviceNameKey")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ManufacturerName")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ModelNumber")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HardwareRevision")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FirmwareRevision")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SoftwareRevision")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UUID")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UDIForMedicalDevices")));
    v16 = objc_msgSend(v23, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v22, v21, v10, v11, v12, v13, v14, v15);
    -[GHSBluetoothDevice setHkDevice:](v9, "setHkDevice:", v16);

    -[GHSBluetoothDevice setHkStore:](v9, "setHkStore:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkStore](v9, "hkStore"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100061634;
    v26[3] = &unk_1000AD3C0;
    v18 = v9;
    v27 = v18;
    objc_msgSend(v17, "requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:", v24, v24, 0, v26);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kGHSPDebugLoggingEnabledKey")));
    -[GHSBluetoothDevice setDebugLoggingEnabled:](v18, "setDebugLoggingEnabled:", v19);

    v18->_linkIdleTimeout = 30;
  }

  return v9;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (unsigned)linkIdleTimeout
{
  return self->_linkIdleTimeout;
}

- (HKDevice)hkDevice
{
  return self->_hkDevice;
}

- (void)setHkDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hkDevice, a3);
}

- (HKHealthStore)hkStore
{
  return self->_hkStore;
}

- (void)setHkStore:(id)a3
{
  objc_storeStrong((id *)&self->_hkStore, a3);
}

- (NSNumber)debugLoggingEnabled
{
  return self->_debugLoggingEnabled;
}

- (void)setDebugLoggingEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_debugLoggingEnabled, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLoggingEnabled, 0);
  objc_storeStrong((id *)&self->_hkStore, 0);
  objc_storeStrong((id *)&self->_hkDevice, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
