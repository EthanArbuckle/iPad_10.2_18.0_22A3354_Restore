@implementation BatteryClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBatteryServiceString);
}

- (BatteryClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BatteryClientService;
  return -[ClientService initWithManager:peripheral:service:](&v6, "initWithManager:peripheral:service:", a3, a4, a5);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v8.receiver = self;
  v8.super_class = (Class)BatteryClientService;
  -[ClientService start](&v8, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBatteryLevelCharacteristicString));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBatteryPowerStateCharacteristicString));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v6, "discoverCharacteristics:forService:", v5, v7);

}

- (void)stop
{
  objc_super v3;

  if (-[BatteryClientService powerSourceID](self, "powerSourceID"))
    IOPSReleasePowerSource(-[BatteryClientService powerSourceID](self, "powerSourceID"));
  v3.receiver = self;
  v3.super_class = (Class)BatteryClientService;
  -[ClientService stop](&v3, "stop");
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v8 = a3;
  if (a5)
    goto LABEL_23;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  v12 = *(_QWORD *)v28;
  v26 = CBUUIDBatteryLevelCharacteristicString;
  v25 = CBUUIDBatteryPowerStateCharacteristicString;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic", v25));
      if (v15)
      {

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v26));
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (v18)
        {
          -[BatteryClientService setBatteryLevelCharacteristic:](self, "setBatteryLevelCharacteristic:", v14);
LABEL_15:
          if ((objc_msgSend(v14, "properties") & 0x10) != 0)
            objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 1, v14);
          objc_msgSend(v8, "readValueForCharacteristic:", v14);
          goto LABEL_18;
        }
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateCharacteristic](self, "batteryPowerStateCharacteristic"));
      if (v19)
      {

        goto LABEL_18;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v25));
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (v22)
      {
        -[BatteryClientService setBatteryPowerStateCharacteristic:](self, "setBatteryPowerStateCharacteristic:", v14);
        goto LABEL_15;
      }
LABEL_18:
      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v11);
LABEL_20:

  -[ClientService notifyDidStart](self, "notifyDidStart");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));

  if (!v23)
  {
    v24 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071FBC(v24);
  }
LABEL_23:

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  if (!a5)
  {
    v10 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));

    if (v8 == v10)
    {
      -[BatteryClientService extractBatteryLevel](self, "extractBatteryLevel");
      goto LABEL_6;
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateCharacteristic](self, "batteryPowerStateCharacteristic"));

    v7 = v10;
    if (v9 == v10)
    {
      -[BatteryClientService extractBatteryPowerState](self, "extractBatteryPowerState");
LABEL_6:
      v7 = v10;
    }
  }

}

- (void)extractBatteryLevel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  v12 = 0;
  if (objc_msgSend(v5, "readUint8:", &v12))
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 1024;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Battery level for peripheral \"%@\": %u%%", buf, 0x12u);

    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005EF2C;
    v10[3] = &unk_1000AE498;
    v10[4] = self;
    v11 = v12;
    -[BatteryClientService updatePowerSource:](self, "updatePowerSource:", v10);
  }

}

- (void)extractBatteryPowerState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  unsigned __int8 v12;
  unsigned __int8 v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateCharacteristic](self, "batteryPowerStateCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  v13 = 0;
  if (objc_msgSend(v5, "readUint8:", &v13))
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateString:](self, "batteryPowerStateString:", v13));
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Battery power state for peripheral \"%@\": %{public}@", buf, 0x16u);

    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005F12C;
    v11[3] = &unk_1000AE498;
    v12 = v13;
    v11[4] = self;
    -[BatteryClientService updatePowerSource:](self, "updatePowerSource:", v11);
  }

}

- (void)updatePowerSource:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  unsigned int v29;
  OpaqueIOPSPowerSourceID *v30;
  void *v31;
  int v32;
  void *v33;
  _QWORD v34[6];
  _QWORD v35[6];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));

  if (!v5)
  {
    v6 = objc_alloc((Class)NSMutableDictionary);
    v34[0] = CFSTR("Type");
    v34[1] = CFSTR("Transport Type");
    v35[0] = CFSTR("Accessory Source");
    v35[1] = CFSTR("Bluetooth LE");
    v35[2] = CFSTR("Battery Power");
    v34[2] = CFSTR("Power Source State");
    v34[3] = CFSTR("Accessory Identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v35[3] = v9;
    v35[4] = &off_1000B37F8;
    v34[4] = CFSTR("Max Capacity");
    v34[5] = CFSTR("Low Warn Level");
    v35[5] = &off_1000B3810;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 6));
    v11 = objc_msgSend(v6, "initWithDictionary:", v10);
    -[BatteryClientService setPowerSourceDetails:](self, "setPowerSourceDetails:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("Name"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientServiceForUUID:", v18));

    if (objc_msgSend(v19, "hasIDs"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v19, "vendorIDSource")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("Vendor ID Source"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v19, "vendorID")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("Vendor ID"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v19, "productID")));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("Product ID"));

      if (-[BatteryClientService isAccessoryCategoryPencil:](self, "isAccessoryCategoryPencil:", v19))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("Pencil"), CFSTR("Accessory Category"));

      }
    }

  }
  v4[2](v4);
  if (!-[BatteryClientService powerSourceID](self, "powerSourceID"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v29 = objc_msgSend(v27, "isAlwaysConnecting:", v28);

    if (v29)
      IOPSCreatePowerSource(&self->_powerSourceID);
  }
  if (-[BatteryClientService powerSourceID](self, "powerSourceID"))
  {
    v30 = -[BatteryClientService powerSourceID](self, "powerSourceID");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
    v32 = IOPSSetPowerSourceDetails(v30, v31);

    if (v32)
    {
      v33 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071FFC(v33, self, v32);
    }
  }

}

- (id)batteryPowerStateString:(unsigned __int8)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ / %@ / %@ / %@"), off_1000AE4B8[a3 & 3], off_1000AE4F8[(a3 >> 2) & 3], off_1000AE4D8[(a3 >> 4) & 3], off_1000AE518[a3 >> 6]);
}

- (BOOL)isAccessoryCategoryPencil:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "productID") == 546
    || objc_msgSend(v3, "productID") == 332
    || objc_msgSend(v3, "productID") == 482
    || objc_msgSend(v3, "productID") == 1106;
  if (objc_msgSend(v3, "vendorIDSource") == 1)
  {
    if (objc_msgSend(v3, "vendorID") != 76)
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CBCharacteristic)batteryLevelCharacteristic
{
  return self->_batteryLevelCharacteristic;
}

- (void)setBatteryLevelCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelCharacteristic, a3);
}

- (CBCharacteristic)batteryPowerStateCharacteristic
{
  return self->_batteryPowerStateCharacteristic;
}

- (void)setBatteryPowerStateCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_batteryPowerStateCharacteristic, a3);
}

- (OpaqueIOPSPowerSourceID)powerSourceID
{
  return self->_powerSourceID;
}

- (void)setPowerSourceID:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceID = a3;
}

- (NSMutableDictionary)powerSourceDetails
{
  return self->_powerSourceDetails;
}

- (void)setPowerSourceDetails:(id)a3
{
  objc_storeStrong((id *)&self->_powerSourceDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSourceDetails, 0);
  objc_storeStrong((id *)&self->_batteryPowerStateCharacteristic, 0);
  objc_storeStrong((id *)&self->_batteryLevelCharacteristic, 0);
}

@end
