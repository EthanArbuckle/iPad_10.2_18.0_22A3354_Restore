@implementation HIDService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHumanInterfaceDeviceServiceString);
}

- (HIDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  HIDService *v5;
  HIDService *v6;
  uint64_t v7;
  NSMapTable *reportInfoMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HIDService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v10, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1);
    -[ClientService setPriority:](v6, "setPriority:", 2);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    reportInfoMap = v6->_reportInfoMap;
    v6->_reportInfoMap = (NSMapTable *)v7;

    -[HIDService setPmService:](v6, "setPmService:", 0);
    -[HIDService setPmNotifier:](v6, "setPmNotifier:", 0);
  }
  return v6;
}

- (void)start
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
  objc_super v13;
  _QWORD v14[7];

  v13.receiver = self;
  v13.super_class = (Class)HIDService;
  -[ClientService start](&v13, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDReportMapCharacteristicString));
  v14[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDReportCharacteristicString));
  v14[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHIDControlPointCharacteristicString));
  v14[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHIDInformationCharacteristicString));
  v14[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("D31D8DEA-47DB-4796-A6B9-E38909CB34FF")));
  v14[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBootKeyboardInputReportCharacteristicString));
  v14[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBootMouseInputReportCharacteristicString));
  v14[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v11, "discoverCharacteristics:forService:", v10, v12);

}

- (void)stop
{
  objc_super v3;

  -[HIDService deregisterForPowerManagementEvents](self, "deregisterForPowerManagementEvents");
  -[HIDService destroyHIDDevice](self, "destroyHIDDevice");
  v3.receiver = self;
  v3.super_class = (Class)HIDService;
  -[ClientService stop](&v3, "stop");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HIDService;
  -[HIDService dealloc](&v4, "dealloc");
}

- (void)createReportInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HIDReportInfo *v8;
  HIDReportInfo *v9;
  NSMapTable *reportInfoMap;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  __int16 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v5));

  v17 = 0;
  if (objc_msgSend(v6, "readUint8:", (char *)&v17 + 1)
    && objc_msgSend(v6, "readUint8:", &v17))
  {
    LOBYTE(v17) = v17 - 1;
    v7 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    {
      v14 = v17;
      v15 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v14));
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = HIBYTE(v17);
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Found %@ report for ID #%u", buf, 0x12u);

    }
    v8 = [HIDReportInfo alloc];
    v9 = -[HIDReportInfo initWithID:type:](v8, "initWithID:type:", HIBYTE(v17), v17);
    reportInfoMap = self->_reportInfoMap;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristic"));
    -[NSMapTable setObject:forKey:](reportInfoMap, "setObject:forKey:", v9, v11);

    if (!(_BYTE)v17)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristic"));
      objc_msgSend(v12, "setNotifyValue:forCharacteristic:", 1, v13);

    }
    -[HIDService createHIDDeviceIfEverythingReady](self, "createHIDDeviceIfEverythingReady");

  }
}

- (id)hidDeviceProperties
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned __int8 v55;
  _QWORD v56[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientServiceForUUID:", v5));

  if (v6)
  {
    if (objc_msgSend(v6, "hasIDs"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "vendorIDSource")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("VendorIDSource"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v6, "vendorID")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("VendorID"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v6, "productID")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ProductID"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v6, "productVersion")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("VersionNumber"));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firmwareRevision"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firmwareRevision"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", &stru_1000B11F8, &stru_1000AE858));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kBTFirmwareRevisionKey"));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hardwareRevision"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hardwareRevision"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", &stru_1000B11F8, &stru_1000AE858));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("kBTHardwareRevisionKey"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", &stru_1000B11F8, &stru_1000AE858));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("SerialNumber"));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelNumber"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelNumber"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", &stru_1000B11F8, &stru_1000AE858));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("ModelNumber"));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manufacturerName"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manufacturerName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", &stru_1000B11F8, &stru_1000AE858));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("Manufacturer"));

    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "value"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v27, 1));

  LOWORD(v56[0]) = 0;
  v55 = 0;
  objc_msgSend(v28, "readUint16:", v56);
  if (objc_msgSend(v28, "readUint8:", &v55))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v55));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("CountryCode"));

  }
  v56[0] = 0;
  v56[1] = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
  objc_msgSend(v31, "getUUIDBytes:", v56);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", LODWORD(v56[0])));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("LocationID"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("PhysicalDeviceUniqueID"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("Product"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "value"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("ReportDescriptor"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("BluetoothLowEnergy"), CFSTR("Transport"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1000B3D20, CFSTR("RequestTimeout"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("HIDVirtualDevice"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "clientServiceForUUID:", v43));

  if (v44)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Authenticated"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v45, "addObserver:selector:name:object:", self, "authDidSucceedNotification:", CFSTR("AuthenticationServiceAuthDidSucceedNotification"), v46);

  }
  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v48 = objc_msgSend(v47, "hasTag:", CFSTR("needsMFiAuthentication4.0"));

    if (v48)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Authenticated"));
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "value"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v51));

    LOBYTE(v56[0]) = 0;
    if (objc_msgSend(v52, "readUint8:", v56))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", LOBYTE(v56[0])));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("IAPHIDAccessoryCategory"));

    }
  }
  return v3;
}

- (void)createHIDDeviceIfEverythingReady
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;

  v39 = (id)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "value"));
  if (!v3)
    goto LABEL_8;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  if (!v6 || -[NSMapTable count](self->_reportInfoMap, "count") != self->_numReports)
  {

LABEL_8:
    return;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
  if (!v7)
  {

LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDeviceProperties](self, "hidDeviceProperties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    if ((objc_msgSend(v12, "isLinkEncrypted") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));

      if (!v13)
      {
        v14 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          sub_10006E02C((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_reportInfoMap, "objectEnumerator"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[HIDBluetoothDevice hidDeviceWithProperties:reports:](HIDBluetoothDevice, "hidDeviceWithProperties:reports:", v11, v22));
        -[HIDService setHidDevice:](self, "setHidDevice:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          objc_msgSend(v25, "setService:", self);

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          objc_msgSend(v27, "setPeripheral:", v26);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "desiredConnectionParameters"));

          v30 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            sub_10006DFC8((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
          objc_msgSend(v37, "clientService:desiresConnectionParameters:", self, v29);

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          objc_msgSend(v38, "start");

        }
        else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        {
          sub_10006DF9C();
        }
LABEL_22:

        return;
      }
    }
    else
    {

    }
    if (-[HIDService allInputReportsReady](self, "allInputReportsReady")
      && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006E090();
    }
    goto LABEL_22;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));

  if (v10)
    goto LABEL_10;
}

- (void)destroyHIDDevice
{
  void *v3;
  NSMapTable *reportInfoMap;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));

  if (v3)
  {
    reportInfoMap = self->_reportInfoMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003DA74;
    v6[3] = &unk_1000ADE30;
    v6[4] = self;
    -[NSMapTable enumerateKeysAndObjectsUsingBlock:](reportInfoMap, "enumerateKeysAndObjectsUsingBlock:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
    objc_msgSend(v5, "stop");

  }
}

- (void)signalCommandCondition:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandCondition"));
  objc_msgSend(v7, "lock");

  objc_msgSend(v6, "setCommandPending:", 0);
  objc_msgSend(v6, "setCommandError:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandCondition"));
  objc_msgSend(v8, "signal");

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandCondition"));
  objc_msgSend(v9, "unlock");

}

- (BOOL)isPowerManagementBasedOnDisplayState
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v3 = objc_msgSend(v2, "hasTag:", CFSTR("A2538"));

  return v3;
}

- (void)registerForPowerManagementEvents
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[8];

  if (-[HIDService isPowerManagementBasedOnDisplayState](self, "isPowerManagementBasedOnDisplayState"))
  {
    v3 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for display state instead of system sleep state", buf, 2u);
    }
    v4 = objc_alloc_init((Class)CUSystemMonitor);
    -[HIDService setSystemMonitor:](self, "setSystemMonitor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService systemMonitor](self, "systemMonitor"));
    objc_msgSend(v5, "setDispatchQueue:", &_dispatch_main_q);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003DD94;
    v8[3] = &unk_1000AD258;
    objc_copyWeak(&v9, (id *)buf);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService systemMonitor](self, "systemMonitor"));
    objc_msgSend(v6, "setScreenOnChangedHandler:", v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService systemMonitor](self, "systemMonitor"));
    objc_msgSend(v7, "activateWithCompletion:", 0);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[HIDService setPmService:](self, "setPmService:", IORegisterForSystemPower(self, &self->_pmNotificationPort, (IOServiceInterestCallback)j__objc_msgSend_handlePowerManagementNotification_notificationID_, &self->_pmNotifier));
    IONotificationPortSetDispatchQueue(-[HIDService pmNotificationPort](self, "pmNotificationPort"), (dispatch_queue_t)&_dispatch_main_q);
  }
}

- (void)deregisterForPowerManagementEvents
{
  void *v3;

  if (-[HIDService isPowerManagementBasedOnDisplayState](self, "isPowerManagementBasedOnDisplayState"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService systemMonitor](self, "systemMonitor"));
    objc_msgSend(v3, "invalidate");

    -[HIDService setSystemMonitor:](self, "setSystemMonitor:", 0);
  }
  else if (-[HIDService pmService](self, "pmService"))
  {
    IODeregisterForSystemPower(&self->_pmNotifier);
    IONotificationPortDestroy(-[HIDService pmNotificationPort](self, "pmNotificationPort"));
    IOServiceClose(-[HIDService pmService](self, "pmService"));
  }
}

- (void)notifyDidStartIfEverythingReady
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
  if (objc_msgSend(v6, "state") == 2)
  {
    v3 = -[HIDService allInputReportsReady](self, "allInputReportsReady");

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("PeerIsUsingBuiltinServiceNotification"), v5);

      -[ClientService notifyDidStart](self, "notifyDidStart");
    }
  }
  else
  {

  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  id v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v53 = a3;
  if (!a5)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      v51 = CBUUIDReportMapCharacteristicString;
      v11 = CBUUIDReportCharacteristicString;
      v49 = CBUUIDHIDControlPointCharacteristicString;
      v48 = CBUUIDHIDInformationCharacteristicString;
      v50 = CBUUIDBootKeyboardInputReportCharacteristicString;
      v47 = CBUUIDBootMouseInputReportCharacteristicString;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
          if (v14)
          {

          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v51));
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if (v17)
            {
              -[HIDService setReportMapCharacteristic:](self, "setReportMapCharacteristic:", v13);
              objc_msgSend(v53, "discoverDescriptorsForCharacteristic:", v13);
LABEL_25:
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
              if ((objc_msgSend(v33, "isLinkEncrypted") & 1) != 0)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));

                if (v34)
                  goto LABEL_39;
              }
              else
              {

              }
              objc_msgSend(v53, "readValueForCharacteristic:", v13);
              goto LABEL_39;
            }
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v11));
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (v20)
          {
            ++self->_numReports;
            objc_msgSend(v53, "discoverDescriptorsForCharacteristic:", v13);
            goto LABEL_39;
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidControlPointCharacteristic](self, "hidControlPointCharacteristic"));
          if (v21)
          {

          }
          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v49));
            v24 = objc_msgSend(v22, "isEqual:", v23);

            if (v24)
            {
              -[HIDService setHidControlPointCharacteristic:](self, "setHidControlPointCharacteristic:", v13);
              -[HIDService registerForPowerManagementEvents](self, "registerForPowerManagementEvents");
              goto LABEL_39;
            }
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
          if (v25)
          {

          }
          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v48));
            v28 = objc_msgSend(v26, "isEqual:", v27);

            if (v28)
            {
              -[HIDService setHidInformationCharacteristic:](self, "setHidInformationCharacteristic:", v13);
              goto LABEL_25;
            }
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
          if (v29)
          {

          }
          else
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("D31D8DEA-47DB-4796-A6B9-E38909CB34FF")));
            v32 = objc_msgSend(v30, "isEqual:", v31);

            if (v32)
            {
              -[HIDService setAccessoryCategoryCharacteristic:](self, "setAccessoryCategoryCharacteristic:", v13);
              goto LABEL_25;
            }
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v50));
          v37 = objc_msgSend(v35, "isEqual:", v36);

          if (v37)
          {
            v38 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Detected keyboard LE HID", buf, 2u);
            }
            v39 = v53;
            v40 = CFSTR("IsLEKeyboard");
          }
          else
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v47));
            v43 = objc_msgSend(v41, "isEqual:", v42);

            if (!v43)
              goto LABEL_39;
            v44 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Detected mouse LE HID", buf, 2u);
            }
            v39 = v53;
            v40 = CFSTR("IsLEMouse");
          }
          objc_msgSend(v39, "tag:", v40);
LABEL_39:
          v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v9);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
    if (!v45 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E114();
    if (!self->_numReports && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E0E8();
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));

    if (!v46 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E0BC();
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  id v38;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", v7));
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "commandPending") == (id)1)
    {
      v11 = (void *)qword_1000C9178;
      if (v8)
      {
        if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        {
LABEL_17:
          -[HIDService signalCommandCondition:error:](self, "signalCommandCondition:error:", v10, v8);
          goto LABEL_30;
        }
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", objc_msgSend(v10, "type")));
        v33 = 138412802;
        v34 = v13;
        v35 = 1024;
        v36 = objc_msgSend(v10, "ID");
        v37 = 2112;
        v38 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error getting %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);

      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        {
          v25 = v11;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", objc_msgSend(v10, "type")));
          v27 = objc_msgSend(v10, "ID");
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
          v33 = 138412802;
          v34 = v26;
          v35 = 1024;
          v36 = v27;
          v37 = 2112;
          v38 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Did get %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);

        }
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
        objc_msgSend(v10, "setCommandValue:", v12);
      }

      goto LABEL_17;
    }
    if (v8)
    {
      v18 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", objc_msgSend(v10, "type")));
        v33 = 138412802;
        v34 = v20;
        v35 = 1024;
        v36 = objc_msgSend(v10, "ID");
        v37 = 2112;
        v38 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error updating %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);

      }
    }
    else
    {
      v21 = objc_msgSend(v7, "valueTimestamp");
      if (!v21)
        v21 = (id)mach_absolute_time();
      v22 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      {
        v29 = v22;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", objc_msgSend(v10, "type")));
        v31 = objc_msgSend(v10, "ID");
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
        v33 = 138412802;
        v34 = v30;
        v35 = 1024;
        v36 = v31;
        v37 = 2112;
        v38 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Updated %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);

      }
      if (byte_1000C9170)
        kdebug_trace(730005908, v21, 0, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
      objc_msgSend(v23, "handleInputReportData:reportID:timestamp:", v24, objc_msgSend(v10, "ID"), v21);

    }
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
    if (v14 == v7)
    {
      v17 = 0;
    }
    else
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
      if (v15 == v7)
      {
        v17 = 0;
      }
      else
      {
        v16 = (id)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
        v17 = v16 != v7;

      }
    }

    if (!v8 && !v17)
      -[HIDService createHIDDeviceIfEverythingReady](self, "createHIDDeviceIfEverythingReady");
  }
LABEL_30:

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  id v18;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", a4));
  v9 = v8;
  if (v8 && objc_msgSend(v8, "commandPending") == (id)2)
  {
    v10 = (void *)qword_1000C9178;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", objc_msgSend(v9, "type")));
        v13 = 138412802;
        v14 = v12;
        v15 = 1024;
        v16 = objc_msgSend(v9, "ID");
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error setting %@ report for ID #%u: %@", (uint8_t *)&v13, 0x1Cu);

      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    {
      sub_10006E140(v10, (uint64_t)v9, self);
    }
    -[HIDService signalCommandCondition:error:](self, "signalCommandCondition:error:", v9, v7);
  }

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  id v18;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", a4));
  if (v8)
  {
    v9 = (void *)qword_1000C9178;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", objc_msgSend(v8, "type")));
        v13 = 138412802;
        v14 = v11;
        v15 = 1024;
        v16 = objc_msgSend(v8, "ID");
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error starting notifications on %@ report for ID #%u: %@", (uint8_t *)&v13, 0x1Cu);

      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_10006E1D4(v9, (uint64_t)v8, self);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));

      if (!v12)
        -[HIDService createHIDDeviceIfEverythingReady](self, "createHIDDeviceIfEverythingReady");
      -[HIDService notifyDidStartIfEverythingReady](self, "notifyDidStartIfEverythingReady");
    }
  }

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v26 = a3;
  v7 = a4;
  v8 = v7;
  if (a5)
    goto LABEL_22;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDReportCharacteristicString));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v11)
    goto LABEL_22;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptors"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v13)
  {

    goto LABEL_20;
  }
  v14 = v13;
  v25 = v8;
  v15 = 0;
  v16 = *(_QWORD *)v29;
  v17 = CBUUIDReportReferenceDescriptorString;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v17));
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        if ((objc_msgSend(v23, "isLinkEncrypted") & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));

          if (v24)
          {
            -[HIDService createReportInfo:](self, "createReportInfo:", v19);
LABEL_14:
            v15 = 1;
            continue;
          }
        }
        else
        {

        }
        objc_msgSend(v26, "readValueForDescriptor:", v19);
        goto LABEL_14;
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v14);

  v8 = v25;
  if ((v15 & 1) != 0)
    goto LABEL_22;
LABEL_20:
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006E268();
LABEL_22:

}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v7 = a4;
  if (!a5)
  {
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDReportReferenceDescriptorString));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    v7 = v11;
    if (v10)
    {
      -[HIDService createReportInfo:](self, "createReportInfo:", v11);
      v7 = v11;
    }
  }

}

- (void)hidDeviceDidStop
{
  -[HIDService setHidDevice:](self, "setHidDevice:", 0);
}

- (void)hidDeviceDesiredConnectionParametersDidChange
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "desiredConnectionParameters"));

  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006E294((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  objc_msgSend(v12, "clientService:desiresConnectionParameters:", self, v4);

}

- (int)readReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7;
  int v8;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  int v29;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v11 = -536870212;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService characteristicForReportID:reportType:](self, "characteristicForReportID:reportType:", a4, *(_QWORD *)&a5));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", v12));
    v14 = v13;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commandCondition"));
      objc_msgSend(v15, "lock");

      if (objc_msgSend(v14, "isValid"))
      {
        v16 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        {
          v24 = v16;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v7));
          v26 = 138412546;
          v27 = v25;
          v28 = 1024;
          v29 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Getting %@ report for ID #%u", (uint8_t *)&v26, 0x12u);

        }
        objc_msgSend(v14, "setCommandPending:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        objc_msgSend(v17, "readValueForCharacteristic:", v12);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandCondition"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
        v20 = objc_msgSend(v18, "waitUntilDate:", v19);

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandError"));

          if (v21)
          {
            if (a6)
              *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandError"));
          }
          else
          {
            v11 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandValue"));
          }
        }
        else
        {
          objc_msgSend(v14, "setCommandPending:", 0);
          v11 = -536870186;
        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandCondition"));
      objc_msgSend(v22, "unlock");

    }
    else
    {
      v11 = -536870160;
    }

  }
  else
  {
    v11 = -536870160;
  }

  return v11;
}

- (int)writeReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 withResponse:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = a4;
  v12 = -536870212;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService characteristicForReportID:reportType:](self, "characteristicForReportID:reportType:", v10, v9));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", v14));
    v16 = v15;
    if (!v15)
    {
      v12 = -536870160;
LABEL_17:

      goto LABEL_18;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commandCondition"));
    objc_msgSend(v17, "lock");

    if (!objc_msgSend(v16, "isValid"))
      goto LABEL_16;
    v18 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    {
      v24 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v9));
      v29 = 138412802;
      v30 = v25;
      v31 = 1024;
      v32 = v10;
      v33 = 2112;
      v34 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Setting %@ report for ID #%u: %@", (uint8_t *)&v29, 0x1Cu);

      if (v8)
        goto LABEL_6;
    }
    else if (v8)
    {
LABEL_6:
      objc_msgSend(v16, "setCommandPending:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_msgSend(v19, "writeValue:forCharacteristic:type:", v13, v14, 0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandCondition"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
      v22 = objc_msgSend(v20, "waitUntilDate:", v21);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandError"));

        if (v23)
        {
          if (a7)
            *a7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandError"));
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      objc_msgSend(v16, "setCommandPending:", 0);
      v12 = -536870186;
LABEL_16:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandCondition"));
      objc_msgSend(v27, "unlock");

      goto LABEL_17;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v26, "writeValue:forCharacteristic:type:", v13, v14, 1);

LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v12 = -536870160;
LABEL_18:

  return v12;
}

- (void)handlePowerManagementNotification:(unsigned int)a3 notificationID:(int64_t)a4
{
  unint64_t v4;

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
    case 1u:
      -[HIDService enterSuspendModeIfNeeded:](self, "enterSuspendModeIfNeeded:", a4);
      break;
    case 2u:
    case 9u:
      -[HIDService exitSuspendModeIfNeeded](self, "exitSuspendModeIfNeeded", *(_QWORD *)&a3);
      break;
    default:
      return;
  }
}

- (void)enterSuspendModeIfNeeded:(int64_t)a3
{
  dispatch_time_t v5;
  _QWORD v6[6];

  if (-[HIDService pmIsSuspended](self, "pmIsSuspended"))
  {
    IOAllowPowerChange(-[HIDService pmService](self, "pmService"), a3);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006E2F8();
    -[HIDService setPmIsSuspended:](self, "setPmIsSuspended:", 1);
    -[HIDService writeControlPointCommand:](self, "writeControlPointCommand:", 0);
    v5 = dispatch_time(0, 1000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003F658;
    v6[3] = &unk_1000ADE58;
    v6[4] = self;
    v6[5] = a3;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)exitSuspendModeIfNeeded
{
  if (-[HIDService pmIsSuspended](self, "pmIsSuspended"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006E324();
    -[HIDService setPmIsSuspended:](self, "setPmIsSuspended:", 0);
    -[HIDService writeControlPointCommand:](self, "writeControlPointCommand:", 1);
  }
}

- (void)writeControlPointCommand:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidControlPointCharacteristic](self, "hidControlPointCharacteristic"));
  objc_msgSend(v5, "writeValue:forCharacteristic:type:", v4, v6, 1);

}

- (void)screenStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;

  v3 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "suspend (screen off)";
    if (v3)
      v6 = "exit suspend (screen on)";
    v7 = 136446210;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen state changed, sending HID control point command %{public}s", (uint8_t *)&v7, 0xCu);
  }
  -[HIDService writeControlPointCommand:](self, "writeControlPointCommand:", v3);
}

- (void)authDidSucceedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AuthenticationServiceCertClassUserInfoKey")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthenticationServiceAuthVersionKey")));

  if ((int)objc_msgSend(v7, "intValue") <= 2 && (!v10 || objc_msgSend(v10, "unsignedIntValue")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("AuthenticationServiceAuthDidFailNotification"), v9);

  }
}

- (BOOL)allInputReportsReady
{
  NSMapTable *reportInfoMap;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  reportInfoMap = self->_reportInfoMap;
  v9 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003F9F4;
  v5[3] = &unk_1000ADE80;
  v5[4] = &v6;
  -[NSMapTable enumerateKeysAndObjectsUsingBlock:](reportInfoMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)characteristicForReportID:(unsigned int)a3 reportType:(int)a4
{
  uint64_t v4;
  NSMapTable *reportInfoMap;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[24];

  v4 = *(_QWORD *)&a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10003FBD0;
  v20 = sub_10003FBE0;
  v21 = 0;
  reportInfoMap = self->_reportInfoMap;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003FBE8;
  v13[3] = &unk_1000ADEA8;
  v14 = a3;
  v15 = a4;
  v13[4] = &v16;
  -[NSMapTable enumerateKeysAndObjectsUsingBlock:](reportInfoMap, "enumerateKeysAndObjectsUsingBlock:", v13);
  v8 = (void *)v17[5];
  if (!v8)
  {
    v9 = (id)qword_1000C9178;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v4));
      sub_10006E350(v10, buf, a3, v9);
    }

    v8 = (void *)v17[5];
  }
  v11 = v8;
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)reportTypeToString:(int)a3
{
  if (a3 > 2)
    return CFSTR("unknown");
  else
    return *(&off_1000ADEC8 + a3);
}

- (CBCharacteristic)reportMapCharacteristic
{
  return self->_reportMapCharacteristic;
}

- (void)setReportMapCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_reportMapCharacteristic, a3);
}

- (CBCharacteristic)hidControlPointCharacteristic
{
  return self->_hidControlPointCharacteristic;
}

- (void)setHidControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_hidControlPointCharacteristic, a3);
}

- (CBCharacteristic)hidInformationCharacteristic
{
  return self->_hidInformationCharacteristic;
}

- (void)setHidInformationCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_hidInformationCharacteristic, a3);
}

- (CBCharacteristic)accessoryCategoryCharacteristic
{
  return self->_accessoryCategoryCharacteristic;
}

- (void)setAccessoryCategoryCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryCategoryCharacteristic, a3);
}

- (NSMapTable)reportInfoMap
{
  return self->_reportInfoMap;
}

- (void)setReportInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_reportInfoMap, a3);
}

- (unint64_t)numReports
{
  return self->_numReports;
}

- (void)setNumReports:(unint64_t)a3
{
  self->_numReports = a3;
}

- (HIDBluetoothDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hidDevice, a3);
}

- (unsigned)pmService
{
  return self->_pmService;
}

- (void)setPmService:(unsigned int)a3
{
  self->_pmService = a3;
}

- (IONotificationPort)pmNotificationPort
{
  return self->_pmNotificationPort;
}

- (void)setPmNotificationPort:(IONotificationPort *)a3
{
  self->_pmNotificationPort = a3;
}

- (unsigned)pmNotifier
{
  return self->_pmNotifier;
}

- (void)setPmNotifier:(unsigned int)a3
{
  self->_pmNotifier = a3;
}

- (BOOL)pmIsSuspended
{
  return self->_pmIsSuspended;
}

- (void)setPmIsSuspended:(BOOL)a3
{
  self->_pmIsSuspended = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_hidDevice, 0);
  objc_storeStrong((id *)&self->_reportInfoMap, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryCharacteristic, 0);
  objc_storeStrong((id *)&self->_hidInformationCharacteristic, 0);
  objc_storeStrong((id *)&self->_hidControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_reportMapCharacteristic, 0);
}

@end
