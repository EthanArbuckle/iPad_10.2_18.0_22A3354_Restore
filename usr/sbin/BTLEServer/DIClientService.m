@implementation DIClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString);
}

- (DIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  DIClientService *v5;
  DIClientService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DIClientService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setPriority:](v5, "setPriority:", 1);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
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
  void *v13;
  objc_super v14;
  _QWORD v15[8];

  v14.receiver = self;
  v14.super_class = (Class)DIClientService;
  -[ClientService start](&v14, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDPnPIDCharacteristicString));
  v15[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSoftwareRevisionStringCharacteristicString));
  v15[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDFirmwareRevisionStringCharacteristicString));
  v15[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHardwareRevisionStringCharacteristicString));
  v15[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSerialNumberStringCharacteristicString));
  v15[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDModelNumberStringCharacteristicString));
  v15[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDManufacturerNameStringCharacteristicString));
  v15[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUDIForMedicalDevicesCharacteristicString));
  v15[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v12, "discoverCharacteristics:forService:", v11, v13);

}

- (BOOL)hasIDs
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));
  v4 = v3 != 0;

  return v4;
}

- (void)extractIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v4, 1));

  if (objc_msgSend(v5, "readUint8:", &self->_vendorIDSource))
  {
    if (objc_msgSend(v5, "readUint16:", &self->_vendorID))
    {
      if (objc_msgSend(v5, "readUint16:", &self->_productID))
      {
        if (objc_msgSend(v5, "readUint16:", &self->_productVersion))
        {
          v6 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            v7 = v6;
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService vendorIDSourceString](self, "vendorIDSourceString"));
            v11 = 138413314;
            v12 = v9;
            v13 = 2112;
            v14 = v10;
            v15 = 1024;
            v16 = -[DIClientService vendorID](self, "vendorID");
            v17 = 1024;
            v18 = -[DIClientService productID](self, "productID");
            v19 = 1024;
            v20 = -[DIClientService productVersion](self, "productVersion");
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PnP ID for peripheral \"%@\": %@ / 0x%04X / 0x%04X / 0x%04X", (uint8_t *)&v11, 0x28u);

          }
        }
      }
    }
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v8 = a3;
  if (!a5)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (!v9)
      goto LABEL_42;
    v10 = v9;
    v11 = *(_QWORD *)v56;
    v53 = CBUUIDPnPIDCharacteristicString;
    v51 = CBUUIDFirmwareRevisionStringCharacteristicString;
    v52 = CBUUIDSoftwareRevisionStringCharacteristicString;
    v49 = CBUUIDSerialNumberStringCharacteristicString;
    v50 = CBUUIDHardwareRevisionStringCharacteristicString;
    v47 = CBUUIDManufacturerNameStringCharacteristicString;
    v48 = CBUUIDModelNumberStringCharacteristicString;
    v46 = CBUUIDUDIForMedicalDevicesCharacteristicString;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));
        if (v14)
        {

        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v53));
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {
            -[DIClientService setPnpIDCharacteristic:](self, "setPnpIDCharacteristic:", v13);
LABEL_39:
            objc_msgSend(v8, "readValueForCharacteristic:", v13);
            goto LABEL_40;
          }
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService swRevisionCharacteristic](self, "swRevisionCharacteristic"));
        if (v18)
        {

        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v52));
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if (v21)
          {
            -[DIClientService setSwRevisionCharacteristic:](self, "setSwRevisionCharacteristic:", v13);
            goto LABEL_39;
          }
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService fwRevisionCharacteristic](self, "fwRevisionCharacteristic"));
        if (v22)
        {

        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v51));
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if (v25)
          {
            -[DIClientService setFwRevisionCharacteristic:](self, "setFwRevisionCharacteristic:", v13);
            goto LABEL_39;
          }
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService hwRevisionCharacteristic](self, "hwRevisionCharacteristic"));
        if (v26)
        {

        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v50));
          v29 = objc_msgSend(v27, "isEqual:", v28);

          if (v29)
          {
            -[DIClientService setHwRevisionCharacteristic:](self, "setHwRevisionCharacteristic:", v13);
            goto LABEL_39;
          }
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService serialNumberCharacteristic](self, "serialNumberCharacteristic"));
        if (v30)
        {

        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v49));
          v33 = objc_msgSend(v31, "isEqual:", v32);

          if (v33)
          {
            -[DIClientService setSerialNumberCharacteristic:](self, "setSerialNumberCharacteristic:", v13);
            goto LABEL_39;
          }
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService modelNumberCharacteristic](self, "modelNumberCharacteristic"));
        if (v34)
        {

        }
        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v48));
          v37 = objc_msgSend(v35, "isEqual:", v36);

          if (v37)
          {
            -[DIClientService setModelNumberCharacteristic:](self, "setModelNumberCharacteristic:", v13);
            goto LABEL_39;
          }
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService manufacturerNameCharacteristic](self, "manufacturerNameCharacteristic"));
        if (v38)
        {

        }
        else
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v47));
          v41 = objc_msgSend(v39, "isEqual:", v40);

          if (v41)
          {
            -[DIClientService setManufacturerNameCharacteristic:](self, "setManufacturerNameCharacteristic:", v13);
            goto LABEL_39;
          }
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService udiForMedicalDevicesCharacteristic](self, "udiForMedicalDevicesCharacteristic"));
        if (v42)
        {

          goto LABEL_40;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v46));
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (v45)
        {
          -[DIClientService setUdiForMedicalDevicesCharacteristic:](self, "setUdiForMedicalDevicesCharacteristic:", v13);
          -[DIClientService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", 1, v13);
          goto LABEL_39;
        }
LABEL_40:
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (!v10)
      {
LABEL_42:

        -[ClientService notifyDidStart](self, "notifyDidStart");
        break;
      }
    }
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSString *v18;
  NSString *udiForMedicalDevices;
  uint64_t v20;
  id v21;
  void *v22;
  NSString *v23;
  NSString *softwareRevision;
  id v25;
  void *v26;
  NSString *v27;
  NSString *firmwareRevision;
  id v29;
  void *v30;
  NSString *v31;
  NSString *hardwareRevision;
  id v33;
  void *v34;
  NSString *v35;
  NSString *serialNumber;
  id v37;
  void *v38;
  NSString *v39;
  NSString *modelNumber;
  id v41;
  void *v42;
  NSString *v43;
  NSString *manufacturerName;
  id v45;

  v45 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));

    if (v8 == v45)
    {
      -[DIClientService extractIDs](self, "extractIDs");
      v20 = 0;
      goto LABEL_18;
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService swRevisionCharacteristic](self, "swRevisionCharacteristic"));

    if (v9 == v45)
    {
      v21 = objc_alloc((Class)NSString);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v23 = (NSString *)objc_msgSend(v21, "initWithData:encoding:", v22, 4);
      softwareRevision = self->_softwareRevision;
      self->_softwareRevision = v23;

      v20 = 1;
      goto LABEL_18;
    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService fwRevisionCharacteristic](self, "fwRevisionCharacteristic"));

    if (v10 == v45)
    {
      v25 = objc_alloc((Class)NSString);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v27 = (NSString *)objc_msgSend(v25, "initWithData:encoding:", v26, 4);
      firmwareRevision = self->_firmwareRevision;
      self->_firmwareRevision = v27;

      v20 = 2;
      goto LABEL_18;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService hwRevisionCharacteristic](self, "hwRevisionCharacteristic"));

    if (v11 == v45)
    {
      v29 = objc_alloc((Class)NSString);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v31 = (NSString *)objc_msgSend(v29, "initWithData:encoding:", v30, 4);
      hardwareRevision = self->_hardwareRevision;
      self->_hardwareRevision = v31;

      v20 = 3;
      goto LABEL_18;
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService serialNumberCharacteristic](self, "serialNumberCharacteristic"));

    if (v12 == v45)
    {
      v33 = objc_alloc((Class)NSString);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v20 = 4;
      v35 = (NSString *)objc_msgSend(v33, "initWithData:encoding:", v34, 4);
      serialNumber = self->_serialNumber;
      self->_serialNumber = v35;

      goto LABEL_18;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService modelNumberCharacteristic](self, "modelNumberCharacteristic"));

    if (v13 == v45)
    {
      v37 = objc_alloc((Class)NSString);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v39 = (NSString *)objc_msgSend(v37, "initWithData:encoding:", v38, 4);
      modelNumber = self->_modelNumber;
      self->_modelNumber = v39;

      v20 = 5;
      goto LABEL_18;
    }
    v14 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService manufacturerNameCharacteristic](self, "manufacturerNameCharacteristic"));

    if (v14 == v45)
    {
      v41 = objc_alloc((Class)NSString);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v43 = (NSString *)objc_msgSend(v41, "initWithData:encoding:", v42, 4);
      manufacturerName = self->_manufacturerName;
      self->_manufacturerName = v43;

      v20 = 6;
      goto LABEL_18;
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService udiForMedicalDevicesCharacteristic](self, "udiForMedicalDevicesCharacteristic"));

    if (v15 == v45)
    {
      v16 = objc_alloc((Class)NSString);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
      v18 = (NSString *)objc_msgSend(v16, "initWithData:encoding:", v17, 4);
      udiForMedicalDevices = self->_udiForMedicalDevices;
      self->_udiForMedicalDevices = v18;

      v20 = 7;
LABEL_18:
      -[DIClientService notifyListeners:](self, "notifyListeners:", v20);
    }
  }

}

- (void)notifyListeners:(int)a3
{
  __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  switch(a3)
  {
    case 0:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PID:0x%04X VID:0x%04X"), self->_productID, self->_vendorID));
      v5 = CFSTR("PnP");
      if (v4)
        goto LABEL_16;
      goto LABEL_18;
    case 1:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService softwareRevision](self, "softwareRevision"));
      v5 = CFSTR("SoftwareRevision");
      if (!v4)
        goto LABEL_18;
      goto LABEL_16;
    case 2:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService firmwareRevision](self, "firmwareRevision"));
      v5 = CFSTR("FirmwareRevision");
      if (!v4)
        goto LABEL_18;
      goto LABEL_16;
    case 3:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService hardwareRevision](self, "hardwareRevision"));
      v5 = CFSTR("HardwareRevision");
      if (!v4)
        goto LABEL_18;
      goto LABEL_16;
    case 4:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService serialNumber](self, "serialNumber"));
      v5 = CFSTR("SerialNumber");
      if (!v4)
        goto LABEL_18;
      goto LABEL_16;
    case 5:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService modelNumber](self, "modelNumber"));
      v5 = CFSTR("ModelNumber");
      if (!v4)
        goto LABEL_18;
      goto LABEL_16;
    case 6:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService manufacturerName](self, "manufacturerName"));
      v5 = CFSTR("ManufacturerName");
      if (v4)
        goto LABEL_16;
      goto LABEL_18;
    case 7:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService udiForMedicalDevices](self, "udiForMedicalDevices"));
      v5 = CFSTR("UDIForMedicalDevices");
      if (v4)
        goto LABEL_16;
LABEL_18:
      v14 = (id)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      NSLog(CFSTR("Error updating DeviceInformation for %@‘s %@ - %@"), v13, v5, 0);

      break;
    default:
      v5 = CFSTR("Unknown");
      v4 = &stru_1000AE858;
LABEL_16:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      NSLog(CFSTR("Updated DeviceInformation for %@‘s %@ - %@"), v7, v5, v4);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v15[0] = CFSTR("UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
      v15[1] = v5;
      v16[0] = v11;
      v16[1] = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("DeviceInformationUpdate"), self, v12);

      break;
  }
}

- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v8 = objc_msgSend(v6, "properties");
    v7 = v10;
    if ((v8 & 0x10) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_msgSend(v9, "setNotifyValue:forCharacteristic:", v4, v10);

      v7 = v10;
    }
  }

}

- (id)vendorIDSourceString
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[DIClientService vendorIDSource](self, "vendorIDSource");
  v3 = CFSTR("Unknown");
  if (v2 == 2)
    v3 = CFSTR("USB");
  if (v2 == 1)
    return CFSTR("BT");
  else
    return (id)v3;
}

- (NSString)softwareRevision
{
  return self->_softwareRevision;
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (NSString)udiForMedicalDevices
{
  return self->_udiForMedicalDevices;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)productVersion
{
  return self->_productVersion;
}

- (CBCharacteristic)pnpIDCharacteristic
{
  return self->_pnpIDCharacteristic;
}

- (void)setPnpIDCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_pnpIDCharacteristic, a3);
}

- (CBCharacteristic)swRevisionCharacteristic
{
  return self->_swRevisionCharacteristic;
}

- (void)setSwRevisionCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_swRevisionCharacteristic, a3);
}

- (CBCharacteristic)fwRevisionCharacteristic
{
  return self->_fwRevisionCharacteristic;
}

- (void)setFwRevisionCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_fwRevisionCharacteristic, a3);
}

- (CBCharacteristic)hwRevisionCharacteristic
{
  return self->_hwRevisionCharacteristic;
}

- (void)setHwRevisionCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_hwRevisionCharacteristic, a3);
}

- (CBCharacteristic)serialNumberCharacteristic
{
  return self->_serialNumberCharacteristic;
}

- (void)setSerialNumberCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumberCharacteristic, a3);
}

- (CBCharacteristic)modelNumberCharacteristic
{
  return self->_modelNumberCharacteristic;
}

- (void)setModelNumberCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_modelNumberCharacteristic, a3);
}

- (CBCharacteristic)manufacturerNameCharacteristic
{
  return self->_manufacturerNameCharacteristic;
}

- (void)setManufacturerNameCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturerNameCharacteristic, a3);
}

- (CBCharacteristic)udiForMedicalDevicesCharacteristic
{
  return self->_udiForMedicalDevicesCharacteristic;
}

- (void)setUdiForMedicalDevicesCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_udiForMedicalDevicesCharacteristic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_udiForMedicalDevicesCharacteristic, 0);
  objc_storeStrong((id *)&self->_manufacturerNameCharacteristic, 0);
  objc_storeStrong((id *)&self->_modelNumberCharacteristic, 0);
  objc_storeStrong((id *)&self->_serialNumberCharacteristic, 0);
  objc_storeStrong((id *)&self->_hwRevisionCharacteristic, 0);
  objc_storeStrong((id *)&self->_fwRevisionCharacteristic, 0);
  objc_storeStrong((id *)&self->_swRevisionCharacteristic, 0);
  objc_storeStrong((id *)&self->_pnpIDCharacteristic, 0);
  objc_storeStrong((id *)&self->_udiForMedicalDevices, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_firmwareRevision, 0);
  objc_storeStrong((id *)&self->_softwareRevision, 0);
}

@end
