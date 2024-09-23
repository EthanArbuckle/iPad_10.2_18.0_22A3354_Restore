@implementation GHSService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDGenericHealthSensorServiceString);
}

- (GHSService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  GHSService *v5;
  GHSService *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GHSService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v10, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1);
    -[ClientService setPriority:](v6, "setPriority:", 7);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "consentDidSucceed:", CFSTR("UserDataServiceConsentDidSucceedNotification"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, "consentDidFail:", CFSTR("UserDataServiceConsentDidFailNotification"), 0);

    v6->_isExtraLoggingEnabled = -[GHSService getDebugLoggingEnabled](v6, "getDebugLoggingEnabled");
  }
  return v6;
}

- (void)start
{
  NSMutableData *v3;
  NSMutableData *liveObservationData;
  NSMutableData *v5;
  NSMutableData *storedObservationData;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[6];

  v20.receiver = self;
  v20.super_class = (Class)GHSService;
  -[ClientService start](&v20, "start");
  self->_isRACPInProgress = 0;
  self->_currentRACPOpCode = -1;
  v3 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  liveObservationData = self->_liveObservationData;
  self->_liveObservationData = v3;

  v5 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  storedObservationData = self->_storedObservationData;
  self->_storedObservationData = v5;

  self->_lastSyncedRecordNum = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUserDataServiceString));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientServiceForUUID:", v8));

  self->_isUDSConsentGranted = v9 == 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHealthSensorFeaturesCharacteristicString));
  v21[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDLiveHealthObservationsCharacteristicString));
  v21[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStoredHealthObservationsCharacteristicString));
  v21[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDRACPCharacteristicString));
  v21[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDGHSControlPointCharacteristicString));
  v21[4] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDObservationScheduleChangedCharacteristicString));
  v21[5] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 6));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v17, "discoverCharacteristics:forService:", v16, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "connectionIdleTimeout", 0, 0, 30.0));
  -[GHSService setConnectionIdleTimer:](self, "setConnectionIdleTimer:", v19);

}

- (void)stop
{
  NSMutableData *liveObservationData;
  NSMutableData *storedObservationData;
  void *v5;
  objc_super v6;

  self->_isRACPInProgress = 0;
  self->_isUDSConsentGranted = 0;
  self->_currentRACPOpCode = -1;
  liveObservationData = self->_liveObservationData;
  self->_liveObservationData = 0;

  storedObservationData = self->_storedObservationData;
  self->_storedObservationData = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService connectionIdleTimer](self, "connectionIdleTimer"));
  objc_msgSend(v5, "invalidate");

  -[GHSService setConnectionIdleTimer:](self, "setConnectionIdleTimer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)GHSService;
  -[ClientService stop](&v6, "stop");
}

- (void)consentDidSucceed:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v8 = 141558275;
    v9 = 1752392040;
    v10 = 2113;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "UDS consent succeeded for peripheral \"%{private, mask.hash}@\", (uint8_t *)&v8, 0x16u);

  }
  self->_isUDSConsentGranted = 1;
  -[GHSService createGHSDeviceIfReady](self, "createGHSDeviceIfReady");

}

- (void)consentDidFail:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006BE30(v4);

}

- (id)ghsDeviceProperties
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  unsigned int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  unsigned int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  unsigned __int8 v42;
  unsigned int v43;
  __int16 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  int v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientServiceForUUID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manufacturerName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ManufacturerName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelNumber"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ModelNumber"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("SerialNumber"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hardwareRevision"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("HardwareRevision"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "softwareRevision"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SoftwareRevision"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firmwareRevision"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("FirmwareRevision"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "udiForMedicalDevices"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("UDIForMedicalDevices"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("UUID"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("kGHSDeviceNameKey"));

  }
  if (self->_deviceType)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("kBTDeviceTypeMDCDevSpecKey"));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService featuresCharacteristic](self, "featuresCharacteristic"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v23, 1));

    v44 = 0;
    objc_msgSend(v21, "readUint8:", (char *)&v44 + 1);
    if (objc_msgSend(v21, "readUint8:", &v44) && (_BYTE)v44)
    {
      v25 = 0;
      *(_QWORD *)&v24 = 141558531;
      v40 = v24;
      do
      {
        v43 = 0;
        objc_msgSend(v21, "readUint32:", &v43, v40);
        v26 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
          *(_DWORD *)buf = v40;
          v46 = 1752392040;
          v47 = 2113;
          v48 = v29;
          v49 = 1024;
          v50 = v43;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": observationType %u", buf, 0x1Cu);

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v43));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("kBTObservationTypesMDCCodeKey"));

        ++v25;
      }
      while (v25 < v44);
    }
    if ((v44 & 0x100) != 0 && objc_msgSend(v21, "readUint8:", &v44) && (_BYTE)v44)
    {
      v32 = 0;
      *(_QWORD *)&v31 = 141558787;
      v41 = v31;
      do
      {
        LOWORD(v43) = 0;
        v42 = 0;
        objc_msgSend(v21, "readUint16:", &v43, v41);
        objc_msgSend(v21, "readUint8:", &v42);
        v33 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "name"));
          *(_DWORD *)buf = v41;
          v46 = 1752392040;
          v47 = 2113;
          v48 = v36;
          v49 = 1024;
          v50 = (unsigned __int16)v43;
          v51 = 1024;
          v52 = v42;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": deviceType %u, version %u", buf, 0x22u);

        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v43));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("kBTDeviceTypeMDCDevSpecKey"));

        ++v32;
      }
      while (v32 < v44);
    }
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isExtraLoggingEnabled));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("kGHSPDebugLoggingEnabledKey"));

  return v3;
}

- (void)createGHSDeviceIfReady
{
  void *v2;
  void *v3;
  int deviceType;
  void *v6;
  _BOOL4 isUDSConsentGranted;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  deviceType = self->_deviceType;
  if (!self->_deviceType)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[GHSService featuresCharacteristic](self, "featuresCharacteristic"));
    if (!v8)
      return;
    v39 = (id)v8;
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService featuresCharacteristic](self, "featuresCharacteristic"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));
    if (!v9)
    {

      return;
    }
    v3 = (void *)v9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  if (v6)
  {
    isUDSConsentGranted = self->_isUDSConsentGranted;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService storedObservationCharacteristic](self, "storedObservationCharacteristic"));
    if (v10)
      isUDSConsentGranted = self->_isUDSConsentGranted;
    else
      isUDSConsentGranted = 0;

  }
  if (deviceType)
  {
    if (!isUDSConsentGranted)
      return;
  }
  else
  {

    if (!isUDSConsentGranted)
      return;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDeviceProperties](self, "ghsDeviceProperties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDevice](self, "ghsDevice"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GHSBluetoothDevice ghsDeviceWithProperties:](GHSBluetoothDevice, "ghsDeviceWithProperties:", v11));
    -[GHSService setGhsDevice:](self, "setGhsDevice:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDevice](self, "ghsDevice"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDevice](self, "ghsDevice"));
      objc_msgSend(v16, "setPeripheral:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "customProperty:", CFSTR("UserSelectedHealthDataSyncConfig")));

      if (!self->_lastSyncedRecordNum)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "customProperty:", CFSTR("HealthDataSyncLastStoredRecordNumber")));

        if (v20)
        {
          v21 = objc_alloc_init((Class)NSNumberFormatter);
          objc_msgSend(v21, "setNumberStyle:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "numberFromString:", v20));
          v23 = v22;
          if (v22)
          {
            self->_lastSyncedRecordNum = objc_msgSend(v22, "unsignedIntValue");
          }
          else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            sub_10006BEE8();
          }

        }
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));

      v33 = objc_msgSend(v18, "isEqualToString:", CFSTR("HealthDataSyncAlways"));
      if (v32)
      {
        if ((v33 & 1) != 0
          || objc_msgSend(v18, "isEqualToString:", CFSTR("HealthDataSyncWithUserConfirm")))
        {
          -[GHSService startLiveHealthObservation](self, "startLiveHealthObservation");
        }
      }
      else if (v33)
      {
        -[GHSService retrieveStoredObservationsAfterRecordNumber:](self, "retrieveStoredObservationsAfterRecordNumber:", self->_lastSyncedRecordNum);
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("HealthDataSyncWithUserConfirm")))
      {
        -[GHSService retrieveLastStoredObservation](self, "retrieveLastStoredObservation");
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_msgSend(v34, "postNotificationName:object:", CFSTR("PeerIsUsingBuiltinServiceNotification"), v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService connectionIdleTimer](self, "connectionIdleTimer"));
      objc_msgSend(v36, "invalidate");

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDevice](self, "ghsDevice"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "connectionIdleTimeout", 0, 0, (double)objc_msgSend(v37, "linkIdleTimeout")));
      -[GHSService setConnectionIdleTimer:](self, "setConnectionIdleTimer:", v38);

      -[ClientService notifyDidStart](self, "notifyDidStart");
    }
    else
    {
      v24 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006BEB8(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

}

- (void)startLiveHealthObservation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));

    if (v5)
    {
      v9 = 1;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v9, 1, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));
      objc_msgSend(v7, "writeValue:forCharacteristic:type:", v6, v8, 0);

    }
  }
}

- (void)stopLiveHealthObservation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));

    if (v5)
    {
      v9 = 2;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v9, 1, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));
      objc_msgSend(v7, "writeValue:forCharacteristic:type:", v6, v8, 0);

    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  int deviceType;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  int v78;
  _BYTE v79[128];

  v8 = a3;
  v9 = v8;
  if (a5)
    goto LABEL_50;
  v66 = v8;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (!v11)
    goto LABEL_37;
  v12 = v11;
  v13 = *(_QWORD *)v68;
  v65 = CBUUIDHealthSensorFeaturesCharacteristicString;
  v63 = CBUUIDStoredHealthObservationsCharacteristicString;
  v64 = CBUUIDLiveHealthObservationsCharacteristicString;
  v61 = CBUUIDGHSControlPointCharacteristicString;
  v62 = CBUUIDRACPCharacteristicString;
  v60 = CBUUIDObservationScheduleChangedCharacteristicString;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v68 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService featuresCharacteristic](self, "featuresCharacteristic"));
      if (v16)
      {

      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v65));
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (v19)
        {
          -[GHSService setFeaturesCharacteristic:](self, "setFeaturesCharacteristic:", v15);
          objc_msgSend(v66, "readValueForCharacteristic:", v15);
          continue;
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
      if (v20)
      {

      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v64));
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v23)
        {
          -[GHSService setLiveObservationCharacteristic:](self, "setLiveObservationCharacteristic:", v15);
          goto LABEL_19;
        }
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService storedObservationCharacteristic](self, "storedObservationCharacteristic"));
      if (v24)
      {

        goto LABEL_21;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v63));
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (v27)
      {
        -[GHSService setStoredObservationCharacteristic:](self, "setStoredObservationCharacteristic:", v15);
LABEL_19:
        if ((objc_msgSend(v15, "properties") & 0x10) == 0)
        {
LABEL_33:
          if ((objc_msgSend(v15, "properties") & 0x20) == 0)
            continue;
        }
        objc_msgSend(v66, "setNotifyValue:forCharacteristic:", 1, v15);
        continue;
      }
LABEL_21:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));
      if (v28)
      {

        goto LABEL_25;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v62));
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (v31)
      {
        -[GHSService setRacpCharacteristic:](self, "setRacpCharacteristic:", v15);
        goto LABEL_33;
      }
LABEL_25:
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));
      if (v32)
      {

        goto LABEL_29;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v61));
      v35 = objc_msgSend(v33, "isEqual:", v34);

      if (v35)
      {
        -[GHSService setGhsControlPointCharacteristic:](self, "setGhsControlPointCharacteristic:", v15);
        goto LABEL_33;
      }
LABEL_29:
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService observationScheduleChangedCharacteristic](self, "observationScheduleChangedCharacteristic"));
      if (v36)
      {

        continue;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v60));
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (v39)
      {
        -[GHSService setObservationScheduleChangedCharacteristic:](self, "setObservationScheduleChangedCharacteristic:", v15);
        goto LABEL_33;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  }
  while (v12);
LABEL_37:

  if (!self->_deviceType)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "customProperty:", CFSTR("GHSDeviceType")));

    if (v41)
    {
      v42 = objc_alloc_init((Class)NSNumberFormatter);
      objc_msgSend(v42, "setNumberStyle:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "numberFromString:", v41));
      v44 = v43;
      if (v43)
      {
        self->_deviceType = (unsigned __int16)objc_msgSend(v43, "intValue");
        v45 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v45;
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
          deviceType = self->_deviceType;
          *(_DWORD *)buf = 138544131;
          v72 = CFSTR("GHSDeviceType");
          v73 = 2160;
          v74 = 1752392040;
          v75 = 2113;
          v76 = v48;
          v77 = 1024;
          v78 = deviceType;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Read property \"%{public}@\" from \"%{private, mask.hash}@\" = “%d”", buf, 0x26u);

        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006BFB8();
      }

    }
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  if (v50)
  {

    v9 = v66;
    goto LABEL_49;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService storedObservationCharacteristic](self, "storedObservationCharacteristic"));

  v9 = v66;
  if (v51)
  {
LABEL_49:
    -[GHSService createGHSDeviceIfReady](self, "createGHSDeviceIfReady");
  }
  else
  {
    v52 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BF88(v52, v53, v54, v55, v56, v57, v58, v59);
  }
LABEL_50:

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a4;
  if (!a5)
  {
    v17 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[GHSService featuresCharacteristic](self, "featuresCharacteristic"));

    if (v8 == v17)
    {
      -[GHSService extractHealthSensorFeatures](self, "extractHealthSensorFeatures");
      -[GHSService createGHSDeviceIfReady](self, "createGHSDeviceIfReady");
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));

      if (v9 == v17)
      {
        -[GHSService extractLiveHealthObservation](self, "extractLiveHealthObservation");
      }
      else
      {
        v10 = (id)objc_claimAutoreleasedReturnValue(-[GHSService storedObservationCharacteristic](self, "storedObservationCharacteristic"));

        if (v10 == v17)
        {
          -[GHSService extractStoredHealthObservation](self, "extractStoredHealthObservation");
        }
        else
        {
          v11 = (id)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));

          if (v11 == v17)
          {
            -[GHSService extractRACPResponse](self, "extractRACPResponse");
          }
          else
          {
            v12 = (id)objc_claimAutoreleasedReturnValue(-[GHSService observationScheduleChangedCharacteristic](self, "observationScheduleChangedCharacteristic"));

            if (v12 == v17)
            {
              -[GHSService extractObservationScheduleChanged](self, "extractObservationScheduleChanged");
            }
            else
            {
              v13 = (id)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));

              if (v13 == v17)
                -[GHSService extractGHSControlPointResponse](self, "extractGHSControlPointResponse");
            }
          }
        }
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService connectionIdleTimer](self, "connectionIdleTimer"));
    objc_msgSend(v14, "invalidate");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDevice](self, "ghsDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "connectionIdleTimeout", 0, 0, (double)objc_msgSend(v15, "linkIdleTimeout")));
    -[GHSService setConnectionIdleTimer:](self, "setConnectionIdleTimer:", v16);

    v7 = v17;
  }

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006C058();

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C0EC();
    v11 = (id)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));

    if (v11 == v9)
    {
      self->_currentRACPOpCode = -1;
      self->_isRACPInProgress = 0;
    }
  }

}

- (BOOL)getDebugLoggingEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("GHSP"), CFSTR("com.apple.MobileBluetooth.debug"));
  v4 = objc_opt_class(NSDictionary, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("GHSPEnableLogging")));
    v7 = objc_opt_class(NSNumber, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      v8 = objc_msgSend(v5, "BOOLValue");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)extractGHSControlPointResponse
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[15];
  unsigned __int8 v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsControlPointCharacteristic](self, "ghsControlPointCharacteristic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v3));

  v14 = 0;
  if (objc_msgSend(v4, "readUint8:", &v14))
  {
    v5 = qword_1000C9178;
    if (v14 == 128)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GHS control point success response received", v13, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006C180(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

}

- (void)extractHealthSensorFeatures
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  BOOL v7;
  unsigned int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __int128 v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21;
  int v22;
  __int16 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  v23 = 0;
  objc_msgSend(v5, "readUint8:", (char *)&v23 + 1);
  if (objc_msgSend(v5, "readUint8:", &v23))
    v7 = v23 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = 0;
    *(_QWORD *)&v6 = 141558531;
    v19 = v6;
    do
    {
      v22 = 0;
      objc_msgSend(v5, "readUint32:", &v22, v19);
      v9 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        *(_DWORD *)buf = v19;
        v25 = 1752392040;
        v26 = 2113;
        v27 = v12;
        v28 = 1024;
        v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": observationType %u", buf, 0x1Cu);

      }
      ++v8;
    }
    while (v8 < v23);
  }
  if ((v23 & 0x100) != 0 && objc_msgSend(v5, "readUint8:", &v23) && (_BYTE)v23)
  {
    v14 = 0;
    *(_QWORD *)&v13 = 141558787;
    v20 = v13;
    do
    {
      LOWORD(v22) = 0;
      v21 = 0;
      objc_msgSend(v5, "readUint16:", &v22, v20);
      objc_msgSend(v5, "readUint8:", &v21);
      v15 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        *(_DWORD *)buf = v20;
        v25 = 1752392040;
        v26 = 2113;
        v27 = v18;
        v28 = 1024;
        v29 = (unsigned __int16)v22;
        v30 = 1024;
        v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": deviceType %u, version %u", buf, 0x22u);

      }
      ++v14;
    }
    while (v14 < v23);
  }

}

- (void)extractHealthObservationBodySegmentFromData:(id)a3 isLive:(BOOL)a4
{
  void *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  unsigned __int16 v55;
  NSObject *v56;
  const char *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  const char *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  const char *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  const char *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  const char *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  const char *v88;
  void *v89;
  void *v90;
  unsigned int v91;
  const char *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  const char *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  _BOOL4 v104;
  char v106;
  unsigned __int16 v107;
  unsigned __int8 v108;
  int v109;
  unsigned __int8 v110;
  unsigned int v111;
  unsigned int v112;
  unsigned __int16 v113;
  unsigned __int16 v114;
  unsigned __int8 v115;
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  _BYTE v123[10];
  __int16 v124;
  int v125;

  v104 = a4;
  v102 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:"));
  v115 = 0;
  v114 = 0;
  v113 = 0;
  v111 = 0;
  v112 = -1;
  v110 = 0;
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (objc_msgSend(v4, "readUint8:", &v115))
  {
    v5 = (id)qword_1000C9178;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v6 = "Live";
      else
        v6 = "Stored";
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v6;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v8;
      v122 = 1024;
      *(_DWORD *)v123 = v115;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": classType %u", buf, 0x26u);

    }
  }
  if (objc_msgSend(v4, "readUint16:", &v114))
  {
    v9 = (id)qword_1000C9178;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v10 = "Live";
      else
        v10 = "Stored";
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v10;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v12;
      v122 = 1024;
      *(_DWORD *)v123 = v114;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": len %u", buf, 0x26u);

    }
  }
  if (objc_msgSend(v4, "readUint16:", &v113))
  {
    v13 = (id)qword_1000C9178;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v14 = "Live";
      else
        v14 = "Stored";
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v14;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v16;
      v122 = 1024;
      *(_DWORD *)v123 = v113;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": flags %u", buf, 0x26u);

    }
  }
  if ((v113 & 1) != 0)
  {
    if (objc_msgSend(v4, "readUint32:", &v112))
    {
      v18 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104)
          v19 = "Live";
        else
          v19 = "Stored";
        v20 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v19;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v22;
        v122 = 1024;
        *(_DWORD *)v123 = v112;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": observationType %d", buf, 0x26u);

      }
    }
  }
  else
  {
    v17 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C1B0(v104, &v113, v17);
  }
  v23 = v113;
  if ((v113 & 2) != 0)
  {
    v24 = objc_alloc_init((Class)NSMutableData);
    objc_msgSend(v4, "readNumBytes:toData:", 9, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDElapsedTimeServiceString));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "clientServiceForUUID:", v26));

    if (v27)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateWithElapsedTimeData:", v24));

      v29 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104)
          v30 = "Live";
        else
          v30 = "Stored";
        v31 = v29;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v30;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v33;
        v122 = 2112;
        *(_QWORD *)v123 = v24;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": timeData %@", buf, 0x2Au);

      }
    }
    else
    {
      v34 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        if (v104)
          v98 = "Live";
        else
          v98 = "Stored";
        v99 = v34;
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v98;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v101;
        v122 = 2112;
        *(_QWORD *)v123 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%s Health Observation for peripheral \"%{private, mask.hash}@\": timeData %@ without ETS", buf, 0x2Au);

      }
      v28 = (uint64_t)v103;
    }

    v23 = v113;
    v103 = (void *)v28;
    if ((v113 & 4) == 0)
    {
LABEL_33:
      if ((v23 & 8) == 0)
        goto LABEL_34;
      goto LABEL_52;
    }
  }
  else if ((v113 & 4) == 0)
  {
    goto LABEL_33;
  }
  v109 = 0;
  if (objc_msgSend(v4, "readUint32:", &v109))
  {
    v35 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v36 = "Live";
      else
        v36 = "Stored";
      v37 = v35;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v36;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v39;
      v122 = 1024;
      *(_DWORD *)v123 = v109;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": measurementDuration %u", buf, 0x26u);

    }
  }
  v23 = v113;
  if ((v113 & 8) == 0)
  {
LABEL_34:
    if ((v23 & 0x10) == 0)
      goto LABEL_65;
    goto LABEL_59;
  }
LABEL_52:
  LOWORD(v109) = 0;
  if (objc_msgSend(v4, "readUint16:", &v109))
  {
    v40 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v41 = "Live";
      else
        v41 = "Stored";
      v42 = v40;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v41;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v44;
      v122 = 1024;
      *(_DWORD *)v123 = (unsigned __int16)v109;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": measurementStatus %u", buf, 0x26u);

    }
  }
  if ((v113 & 0x10) != 0)
  {
LABEL_59:
    if (objc_msgSend(v4, "readUint32:", &v111))
    {
      v45 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104)
          v46 = "Live";
        else
          v46 = "Stored";
        v47 = v45;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v46;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v49;
        v122 = 1024;
        *(_DWORD *)v123 = v111;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": observationId %u", buf, 0x26u);

      }
    }
  }
LABEL_65:
  if ((v113 & 0x20) != 0)
  {
    if (objc_msgSend(v4, "readUint8:", &v110))
    {
      v50 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104)
          v51 = "Live";
        else
          v51 = "Stored";
        v52 = v50;
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v51;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v54;
        v122 = 1024;
        *(_DWORD *)v123 = v110;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": userId %u", buf, 0x26u);

      }
    }
  }
  v55 = v113;
  if ((v113 & 0x40) != 0)
  {
    LOBYTE(v107) = 0;
    v109 = 0;
    if (objc_msgSend(v4, "readUint8:", &v107))
    {
      v56 = (id)qword_1000C9178;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        if (v104)
          v57 = "Live";
        else
          v57 = "Stored";
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v57;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v59;
        v122 = 1024;
        *(_DWORD *)v123 = v107;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);

      }
    }
    if ((_BYTE)v107)
    {
      v60 = 0;
      if (v104)
        v61 = "Live";
      else
        v61 = "Stored";
      do
      {
        if (objc_msgSend(v4, "readUint32:", &v109))
        {
          v62 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            v63 = v62;
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "name"));
            *(_DWORD *)buf = 136315907;
            v117 = v61;
            v118 = 2160;
            v119 = 1752392040;
            v120 = 2113;
            v121 = v65;
            v122 = 1024;
            *(_DWORD *)v123 = v109;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": derivedObservationId %u", buf, 0x26u);

          }
        }
        ++v60;
      }
      while (v60 < v107);
    }
    v55 = v113;
    if ((v113 & 0x80) == 0)
    {
LABEL_74:
      if ((v55 & 0x100) == 0)
        goto LABEL_75;
      goto LABEL_109;
    }
  }
  else if ((v113 & 0x80) == 0)
  {
    goto LABEL_74;
  }
  LOBYTE(v107) = 0;
  v109 = 0;
  if (objc_msgSend(v4, "readUint8:", &v107))
  {
    v66 = (id)qword_1000C9178;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v67 = "Live";
      else
        v67 = "Stored";
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v67;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v69;
      v122 = 1024;
      *(_DWORD *)v123 = v107;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);

    }
  }
  if ((_BYTE)v107)
  {
    v70 = 0;
    if (v104)
      v71 = "Live";
    else
      v71 = "Stored";
    do
    {
      if (objc_msgSend(v4, "readUint32:", &v109))
      {
        v72 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v73 = v72;
          v74 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "name"));
          *(_DWORD *)buf = 136315907;
          v117 = v71;
          v118 = 2160;
          v119 = 1752392040;
          v120 = 2113;
          v121 = v75;
          v122 = 1024;
          *(_DWORD *)v123 = v109;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": derivedObservationId %u", buf, 0x26u);

        }
      }
      ++v70;
    }
    while (v70 < v107);
  }
  v55 = v113;
  if ((v113 & 0x100) == 0)
  {
LABEL_75:
    if ((v55 & 0x200) == 0)
      goto LABEL_140;
    goto LABEL_125;
  }
LABEL_109:
  LOBYTE(v107) = 0;
  v109 = 0;
  if (objc_msgSend(v4, "readUint8:", &v107))
  {
    v76 = (id)qword_1000C9178;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      if (v104)
        v77 = "Live";
      else
        v77 = "Stored";
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "name"));
      *(_DWORD *)buf = 136315907;
      v117 = v77;
      v118 = 2160;
      v119 = 1752392040;
      v120 = 2113;
      v121 = v79;
      v122 = 1024;
      *(_DWORD *)v123 = v107;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);

    }
  }
  if ((_BYTE)v107)
  {
    v80 = 0;
    if (v104)
      v81 = "Live";
    else
      v81 = "Stored";
    do
    {
      if (objc_msgSend(v4, "readUint32:", &v109))
      {
        v82 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v83 = v82;
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "name"));
          *(_DWORD *)buf = 136315907;
          v117 = v81;
          v118 = 2160;
          v119 = 1752392040;
          v120 = 2113;
          v121 = v85;
          v122 = 1024;
          *(_DWORD *)v123 = v109;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": IsMemberOfObservationId %u", buf, 0x26u);

        }
      }
      ++v80;
    }
    while (v80 < v107);
  }
  if ((v113 & 0x200) != 0)
  {
LABEL_125:
    v108 = 0;
    v109 = 0;
    v107 = 0;
    v106 = 0;
    v86 = objc_alloc_init((Class)NSMutableData);
    if (objc_msgSend(v4, "readUint8:", &v108))
    {
      v87 = (id)qword_1000C9178;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        if (v104)
          v88 = "Live";
        else
          v88 = "Stored";
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "name"));
        *(_DWORD *)buf = 136315907;
        v117 = v88;
        v118 = 2160;
        v119 = 1752392040;
        v120 = 2113;
        v121 = v90;
        v122 = 1024;
        *(_DWORD *)v123 = v108;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%s Health Observation TLVs for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);

      }
    }
    if (v108)
    {
      v91 = 0;
      if (v104)
        v92 = "Live";
      else
        v92 = "Stored";
      do
      {
        objc_msgSend(v4, "readUint32:", &v109);
        objc_msgSend(v4, "readUint16:", &v107);
        objc_msgSend(v4, "readUint8:", &v106);
        objc_msgSend(v4, "readNumBytes:toData:", v114, v86);
        v93 = (id)qword_1000C9178;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "name"));
          *(_DWORD *)buf = 136316419;
          v117 = v92;
          v118 = 2160;
          v119 = 1752392040;
          v120 = 2113;
          v121 = v95;
          v122 = 1024;
          *(_DWORD *)v123 = v91;
          *(_WORD *)&v123[4] = 1024;
          *(_DWORD *)&v123[6] = v109;
          v124 = 1024;
          v125 = v107;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%s Health Observation TLVs for peripheral \"%{private, mask.hash}@\": item # %u type %d length %d", buf, 0x32u);

        }
        ++v91;
      }
      while (v91 < v108);
    }

  }
LABEL_140:
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService ghsDevice](self, "ghsDevice"));
  v97 = v96;
  if (v104)
    objc_msgSend(v96, "handleLiveHealthObservationsData:observationClassType:observationType:userID:observationID:timestamp:", v4, v115, v112, v110, v111, v103);
  else
    objc_msgSend(v96, "handleStoredHealthObservationsData:observationClassType:observationType:userID:observationID:timestamp:", v4, v115, v112, v110, v111, v103);

}

- (void)extractLiveHealthObservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  unsigned __int8 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v4, 1));

  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    *(_DWORD *)buf = 141558531;
    v24 = 1752392040;
    v25 = 2113;
    v26 = (uint64_t)v9;
    v27 = 2112;
    *(_QWORD *)v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Live Health Observation for peripheral \"%{private, mask.hash}@\": rawDataBytes %@", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService liveObservationCharacteristic](self, "liveObservationCharacteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
  v12 = objc_msgSend(v11, "length");

  v22 = 0;
  if (objc_msgSend(v5, "readUint8:", &v22))
  {
    v13 = v22;
    v14 = v12 - 1;
    v15 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v19 = (void *)v18;
      v20 = "Y";
      *(_DWORD *)buf = 141559555;
      v24 = 1752392040;
      v25 = 2113;
      if ((v13 & 1) != 0)
        v21 = "Y";
      else
        v21 = "N";
      v26 = v18;
      if ((v13 & 2) == 0)
        v20 = "N";
      v27 = 1024;
      *(_DWORD *)v28 = v22;
      *(_WORD *)&v28[4] = 2080;
      *(_QWORD *)&v28[6] = v21;
      v29 = 2080;
      v30 = v20;
      v31 = 1024;
      v32 = v13 >> 2;
      v33 = 1024;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Live Health Observation for peripheral \"%{private, mask.hash}@\": header %u, firstSeg %s, lastSeg %s, segCount %u, len %u", buf, 0x3Cu);

    }
    if ((v13 & 1) != 0)
      -[NSMutableData setLength:](self->_liveObservationData, "setLength:", 0);
    objc_msgSend(v5, "readNumBytes:toData:", v14, self->_liveObservationData);
    if ((v13 & 2) != 0)
      -[GHSService extractHealthObservationBodySegmentFromData:isLive:](self, "extractHealthObservationBodySegmentFromData:isLive:", self->_liveObservationData, 1);
  }

}

- (void)extractStoredHealthObservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned __int8 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  const char *v35;
  __int16 v36;
  unsigned int v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService storedObservationCharacteristic](self, "storedObservationCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v4, 1));

  if (self->_isExtraLoggingEnabled)
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      *(_DWORD *)buf = 141558531;
      v29 = 1752392040;
      v30 = 2113;
      v31 = (uint64_t)v9;
      v32 = 2112;
      *(_QWORD *)v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": rawDataBytes %@", buf, 0x20u);

    }
  }
  v27 = 0;
  v26 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService storedObservationCharacteristic](self, "storedObservationCharacteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
  v12 = objc_msgSend(v11, "length");

  if (objc_msgSend(v5, "readUint8:", &v27))
  {
    v13 = v27;
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      v18 = (void *)v17;
      v19 = "Y";
      *(_DWORD *)buf = 141559299;
      v29 = 1752392040;
      v30 = 2113;
      if ((v13 & 1) != 0)
        v20 = "Y";
      else
        v20 = "N";
      v31 = v17;
      if ((v13 & 2) == 0)
        v19 = "N";
      v32 = 1024;
      *(_DWORD *)v33 = v27;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = v20;
      v34 = 2080;
      v35 = v19;
      v36 = 1024;
      v37 = v13 >> 2;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": header %u, firstSeg %s, lastSeg %s, segCount %u", buf, 0x36u);

    }
    if ((v13 & 1) != 0)
    {
      if (objc_msgSend(v5, "readUint32:", &v26))
      {
        v22 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
          *(_DWORD *)buf = 141558531;
          v29 = 1752392040;
          v30 = 2113;
          v31 = (uint64_t)v25;
          v32 = 1024;
          *(_DWORD *)v33 = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": recordNum %u", buf, 0x1Cu);

        }
        self->_lastSyncedRecordNum = v26;
      }
      -[NSMutableData setLength:](self->_storedObservationData, "setLength:", 0);
      v21 = v12 - 5;
    }
    else
    {
      v21 = v12 - 1;
    }
    objc_msgSend(v5, "readNumBytes:toData:", v21, self->_storedObservationData);
    if ((v13 & 2) != 0)
      -[GHSService extractHealthObservationBodySegmentFromData:isLive:](self, "extractHealthObservationBodySegmentFromData:isLive:", self->_storedObservationData, 0);
  }

}

- (void)extractRACPResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  int v29;
  __int16 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;

  v30 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v4, 1));

  if ((objc_msgSend(v5, "readUint8:", (char *)&v30 + 1) & 1) == 0)
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C2F8(v6);
  }
  if (objc_msgSend(v5, "readUint8:", &v30))
    v7 = v30 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
      *(_DWORD *)buf = 141558787;
      v32 = 1752392040;
      v33 = 2113;
      v34 = v25;
      v35 = 1024;
      v36 = HIBYTE(v30);
      v37 = 1024;
      v38 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "RACP response for peripheral \"%{private, mask.hash}@\": opCode %u, operator %u", buf, 0x22u);

    }
  }
  if (HIBYTE(v30) == 5)
  {
    if (self->_currentRACPOpCode != 4)
    {
LABEL_22:
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006C250();
      goto LABEL_32;
    }
    self->_currentRACPOpCode = -1;
    self->_isRACPInProgress = 0;
    v29 = 0;
    if (objc_msgSend(v5, "readUint32:", &v29))
    {
      v15 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        *(_DWORD *)buf = 141558531;
        v32 = 1752392040;
        v33 = 2113;
        v34 = v18;
        v35 = 1024;
        v36 = v29;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "RACP response for peripheral \"%{private, mask.hash}@\": numOfRecord %d", buf, 0x1Cu);

      }
    }
  }
  else
  {
    if (HIBYTE(v30) != 6)
    {
      if (HIBYTE(v30) == 8 && self->_currentRACPOpCode == 7)
      {
        self->_currentRACPOpCode = -1;
        self->_isRACPInProgress = 0;
        v29 = 0;
        if (objc_msgSend(v5, "readUint32:", &v29))
        {
          v9 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            v10 = v9;
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            *(_DWORD *)buf = 141558531;
            v32 = 1752392040;
            v33 = 2113;
            v34 = v12;
            v35 = 1024;
            v36 = v29;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RACP response for peripheral \"%{private, mask.hash}@\": retrieved numOfRecord %d", buf, 0x1Cu);

          }
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_lastSyncedRecordNum));
        objc_msgSend(v13, "setCustomProperty:value:", CFSTR("HealthDataSyncLastStoredRecordNumber"), v14);

        goto LABEL_32;
      }
      goto LABEL_22;
    }
    LOBYTE(v29) = 0;
    v28 = 0;
    if (objc_msgSend(v5, "readUint8:", &v29) && v29 == self->_currentRACPOpCode)
    {
      if (objc_msgSend(v5, "readUint8:", &v28))
      {
        if (v28)
        {
          v19 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
            *(_DWORD *)buf = 141558787;
            v32 = 1752392040;
            v33 = 2113;
            v34 = v22;
            v35 = 1024;
            v36 = v29;
            v37 = 1024;
            v38 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "RACP for peripheral \"%{private, mask.hash}@\" failed: opCode %d responseCode %d", buf, 0x22u);

          }
        }
        else if (self->_currentRACPOpCode == 1)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_lastSyncedRecordNum));
          objc_msgSend(v26, "setCustomProperty:value:", CFSTR("HealthDataSyncLastStoredRecordNumber"), v27);

        }
        self->_currentRACPOpCode = -1;
        self->_isRACPInProgress = 0;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006C250();
    }
  }
LABEL_32:

}

- (void)retrieveStoredObservationsAfterRecordNumber:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;

  v4 = (void *)qword_1000C9178;
  if (self->_isRACPInProgress)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C38C(v4);
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v20 = 141558275;
      v21 = 1752392040;
      v22 = 2113;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Request stored observation for peripheral \"%{private, mask.hash}@\", (uint8_t *)&v20, 0x16u);

    }
    self->_isRACPInProgress = 1;
    self->_currentRACPOpCode = 7;
    if ((_DWORD)v5)
      v9 = 3;
    else
      v9 = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
    objc_msgSend(v10, "writeUint8:", self->_currentRACPOpCode);
    objc_msgSend(v10, "writeUint8:", v9);
    if ((_DWORD)v5)
    {
      objc_msgSend(v10, "writeUint8:", 1);
      objc_msgSend(v10, "writeUint32:", v5);
    }
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
      v16 = objc_msgSend(v15, "length");
      v20 = 141559043;
      v21 = 1752392040;
      v22 = 2113;
      v23 = v14;
      v24 = 1024;
      v25 = v9;
      v26 = 1024;
      v27 = v5;
      v28 = 2048;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "RACP Retrieve for peripheral \"%{private, mask.hash}@\" operator: %d | recordNum: %d | total len: %lu", (uint8_t *)&v20, 0x2Cu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));
    objc_msgSend(v17, "writeValue:forCharacteristic:type:", v18, v19, 0);

  }
}

- (void)retrieveLastStoredObservation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;

  v3 = (void *)qword_1000C9178;
  if (self->_isRACPInProgress)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C420(v3);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      v17 = 141558275;
      v18 = 1752392040;
      v19 = 2113;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request last stored observation for peripheral \"%{private, mask.hash}@\", (uint8_t *)&v17, 0x16u);

    }
    self->_isRACPInProgress = 1;
    self->_currentRACPOpCode = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
    objc_msgSend(v7, "writeUint8:", self->_currentRACPOpCode);
    objc_msgSend(v7, "writeUint8:", 6);
    v8 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
      v13 = objc_msgSend(v12, "length");
      v17 = 141558787;
      v18 = 1752392040;
      v19 = 2113;
      v20 = v11;
      v21 = 1024;
      v22 = 6;
      v23 = 2048;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RACP Retrieve for peripheral \"%{private, mask.hash}@\" operator: %d | total len: %lu", (uint8_t *)&v17, 0x26u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));
    objc_msgSend(v14, "writeValue:forCharacteristic:type:", v15, v16, 0);

  }
}

- (void)deleteAllStoredObservation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;

  if (self->_isRACPInProgress)
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C4B4(v3);
  }
  else
  {
    self->_isRACPInProgress = 1;
    self->_currentRACPOpCode = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
    objc_msgSend(v4, "writeUint8:", 2);
    objc_msgSend(v4, "writeUint8:", 1);
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
      v13 = 141558787;
      v14 = 1752392040;
      v15 = 2113;
      v16 = v8;
      v17 = 1024;
      v18 = 1;
      v19 = 2048;
      v20 = objc_msgSend(v9, "length");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RACP Delelte for peripheral \"%{private, mask.hash}@\" operator: %d | total len: %lu", (uint8_t *)&v13, 0x26u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));
    objc_msgSend(v10, "writeValue:forCharacteristic:type:", v11, v12, 0);

  }
}

- (void)abortRACPRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;

  self->_isRACPInProgress = 1;
  self->_currentRACPOpCode = 3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
  objc_msgSend(v3, "writeUint8:", 3);
  objc_msgSend(v3, "writeUint8:", 0);
  v4 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
    v12 = 141558787;
    v13 = 1752392040;
    v14 = 2113;
    v15 = v7;
    v16 = 1024;
    v17 = 0;
    v18 = 2048;
    v19 = objc_msgSend(v8, "length");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RACP Abort for peripheral \"%{private, mask.hash}@\" operator: %d | total len: %lu", (uint8_t *)&v12, 0x26u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService racpCharacteristic](self, "racpCharacteristic"));
  objc_msgSend(v9, "writeValue:forCharacteristic:type:", v10, v11, 0);

}

- (void)extractObservationScheduleChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  float v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;

  v11 = 0;
  v10 = 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GHSService observationScheduleChangedCharacteristic](self, "observationScheduleChangedCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v4, 1));

  objc_msgSend(v5, "readUint32:", (char *)&v11 + 4);
  objc_msgSend(v5, "readIEEEFloat:", &v11);
  objc_msgSend(v5, "readIEEEFloat:", &v10);
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    *(_DWORD *)buf = 141559043;
    v13 = 1752392040;
    v14 = 2113;
    v15 = v9;
    v16 = 1024;
    v17 = HIDWORD(v11);
    v18 = 2048;
    v19 = *(float *)&v11;
    v20 = 2048;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Observation schedule changed for peripheral \"%{private, mask.hash}@\" observationType %d measurementPeriod %f updateInterval %f", buf, 0x30u);

  }
}

- (void)connectionIdleTimeout
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006C548(v3);
  -[GHSService stop](self, "stop");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PeerDidIdleTimeoutNotification"), v5);

}

- (CBCharacteristic)featuresCharacteristic
{
  return self->_featuresCharacteristic;
}

- (void)setFeaturesCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_featuresCharacteristic, a3);
}

- (CBCharacteristic)liveObservationCharacteristic
{
  return self->_liveObservationCharacteristic;
}

- (void)setLiveObservationCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_liveObservationCharacteristic, a3);
}

- (CBCharacteristic)storedObservationCharacteristic
{
  return self->_storedObservationCharacteristic;
}

- (void)setStoredObservationCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_storedObservationCharacteristic, a3);
}

- (CBCharacteristic)racpCharacteristic
{
  return self->_racpCharacteristic;
}

- (void)setRacpCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_racpCharacteristic, a3);
}

- (CBCharacteristic)ghsControlPointCharacteristic
{
  return self->_ghsControlPointCharacteristic;
}

- (void)setGhsControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_ghsControlPointCharacteristic, a3);
}

- (CBCharacteristic)observationScheduleChangedCharacteristic
{
  return self->_observationScheduleChangedCharacteristic;
}

- (void)setObservationScheduleChangedCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_observationScheduleChangedCharacteristic, a3);
}

- (GHSBluetoothDevice)ghsDevice
{
  return self->_ghsDevice;
}

- (void)setGhsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_ghsDevice, a3);
}

- (NSTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (void)setConnectionIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIdleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong((id *)&self->_ghsDevice, 0);
  objc_storeStrong((id *)&self->_observationScheduleChangedCharacteristic, 0);
  objc_storeStrong((id *)&self->_ghsControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_racpCharacteristic, 0);
  objc_storeStrong((id *)&self->_storedObservationCharacteristic, 0);
  objc_storeStrong((id *)&self->_liveObservationCharacteristic, 0);
  objc_storeStrong((id *)&self->_featuresCharacteristic, 0);
  objc_storeStrong((id *)&self->_storedObservationData, 0);
  objc_storeStrong((id *)&self->_liveObservationData, 0);
}

@end
