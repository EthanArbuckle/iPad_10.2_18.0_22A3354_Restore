@implementation UARPService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUnifiedAccessoryRestoreProtocolServiceString);
}

- (UARPService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  id v7;
  UARPService *v8;
  UARPService *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  objc_super v16;
  uint8_t buf[4];
  unsigned int v18;

  v16.receiver = self;
  v16.super_class = (Class)UARPService;
  v7 = a4;
  v8 = -[ClientService initWithManager:peripheral:service:](&v16, "initWithManager:peripheral:service:", a3, v7, a5);
  v9 = v8;
  if (v8)
    -[ClientService setIsPrimary:](v8, "setIsPrimary:", 1, v16.receiver, v16.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance", v16.receiver, v16.super_class));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  -[UARPService setUarpOverAACP:](v9, "setUarpOverAACP:", objc_msgSend(v10, "getAndRemoveFromUARPTransportDict:", v11));
  v12 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = -[UARPService uarpOverAACP](v9, "uarpOverAACP");
    *(_DWORD *)buf = 67109120;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UARPService: setting uarpOverAACP to %u", buf, 8u);

  }
  return v9;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[16];
  void *v17;

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting UARP procedure", buf, 2u);
  }
  v15.receiver = self;
  v15.super_class = (Class)UARPService;
  -[ClientService start](&v15, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  if ((objc_msgSend(v4, "tapToRadarIsOngoing") & 1) == 0)
  {

    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LoggingManager instance](LoggingManager, "instance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = objc_msgSend(v5, "wasUUIDRequestedForLogRetrieval:", v7);

  if (!v8)
  {
LABEL_7:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v9, "setOpportunisticConnection:", v10);
    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  objc_msgSend(v9, "removeOpportunisticConnection:", v10);
LABEL_8:

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUARPDataControlPointCharacteristicString));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v13, "discoverCharacteristics:forService:", v12, v14);

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping UARP procedure", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
  objc_msgSend(v4, "unregisterUARPService:withUARPAccessory:", self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UARPService;
  -[ClientService stop](&v6, "stop");
}

- (void)_prepareForFirmwareDownload
{
  NSObject *v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_prepareForFirmwareDownload", v10, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v5 = (char *)objc_msgSend(v4, "maximumWriteValueLengthForType:", 0);

  -[UARPService setMaxPayloadSize:](self, "setMaxPayloadSize:", v5 - 1);
  v6 = objc_alloc_init((Class)NSMutableArray);
  -[UARPService setTxDataQueue:](self, "setTxDataQueue:", v6);

  v7 = objc_alloc_init((Class)NSMutableData);
  -[UARPService setRecvDataMessage:](self, "setRecvDataMessage:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpDataControlPointCharacteristic](self, "uarpDataControlPointCharacteristic"));
  objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 1, v9);

}

- (void)sendData:(id)a3
{
  id v4;
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
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  const char *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v4 = a3;
  if (-[UARPService uarpOverAACP](self, "uarpOverAACP"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v29[0] = CFSTR("kUARPDeviceUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v29[1] = CFSTR("kUARPData");
    v30[0] = v8;
    v30[1] = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    objc_msgSend(v5, "sendMsg:args:", CFSTR("UARPDataOverAACP"), v9);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService _packetizeData:](self, "_packetizeData:", v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
    objc_msgSend(v10, "addObjectsFromArray:", v5);

    if (-[UARPService isSendingData](self, "isSendingData"))
    {
LABEL_9:

      goto LABEL_10;
    }
    -[UARPService setIsSendingData:](self, "setIsSendingData:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
    objc_msgSend(v13, "removeObjectAtIndex:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpDataControlPointCharacteristic](self, "uarpDataControlPointCharacteristic"));
    objc_msgSend(v14, "writeValue:forCharacteristic:type:", v12, v15, 0);

  }
  v16 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    v20 = objc_msgSend(v4, "length");
    v21 = -[UARPService uarpOverAACP](self, "uarpOverAACP");
    v22 = "GATT";
    v23 = 138412802;
    v24 = v19;
    if (v21)
      v22 = "AACP";
    v25 = 2048;
    v26 = v20;
    v27 = 2080;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sendData - peripheral:%@ length:%lu profile: %s", (uint8_t *)&v23, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)recvDataOverAACP:(id)a3
{
  -[UARPService _parseRecvdAACPData:](self, "_parseRecvdAACPData:", a3);
}

- (id)_packetizeData:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = -[UARPService maxPayloadSize](self, "maxPayloadSize");
  if (v6 >= (unint64_t)objc_msgSend(v4, "length"))
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService _createPacket:payloadOffset:payloadLength:payload:](self, "_createPacket:payloadOffset:payloadLength:payload:", 0, v7, -[UARPService maxPayloadSize](self, "maxPayloadSize"), v4));
      objc_msgSend(v5, "addObject:", v8);
      v7 += -[UARPService maxPayloadSize](self, "maxPayloadSize");

      v9 = (char *)-[UARPService maxPayloadSize](self, "maxPayloadSize") + v7;
    }
    while (v9 < objc_msgSend(v4, "length"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService _createPacket:payloadOffset:payloadLength:payload:](self, "_createPacket:payloadOffset:payloadLength:payload:", 1, v7, (char *)objc_msgSend(v4, "length") - v7, v4));
  objc_msgSend(v5, "addObject:", v10);

  return v5;
}

- (id)_createPacket:(unint64_t)a3 payloadOffset:(unint64_t)a4 payloadLength:(unint64_t)a5 payload:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v13;

  v13 = a3;
  v8 = a6;
  v9 = objc_alloc_init((Class)NSMutableData);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13, 1));
  objc_msgSend(v9, "appendData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", a4, a5));

  objc_msgSend(v9, "appendData:", v11);
  return v9;
}

- (void)_parseRecvdAACPData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
  objc_msgSend(v5, "appendData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uarpController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
  objc_msgSend(v7, "recvDataFromAccessory:data:error:", v8, v9, 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
  objc_msgSend(v10, "setLength:", 0);

}

- (void)_parseRecvdData:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = -[UARPService _extractHeader:](self, "_extractHeader:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[UARPService _extractPayload:](self, "_extractPayload:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
  objc_msgSend(v6, "appendData:", v12);

  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uarpController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
    objc_msgSend(v8, "recvDataFromAccessory:data:error:", v9, v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
    objc_msgSend(v11, "setLength:", 0);

  }
}

- (unsigned)_extractHeader:(id)a3
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subdataWithRange:", 0, 1));
  objc_msgSend(v3, "getBytes:length:", &v6, 1);
  v4 = v6;

  return v4;
}

- (id)_extractPayload:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 1, (char *)objc_msgSend(v3, "length") - 1));

  return v4;
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didDiscoverCharacteristicsForService - peripheral:%@ service:%@ error:%@", buf, 0x20u);
  }
  if (!v10)
  {
    v23 = v9;
    v24 = v8;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristics"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      v16 = CBUUIDUARPDataControlPointCharacteristicString;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpDataControlPointCharacteristic](self, "uarpDataControlPointCharacteristic"));
          if (v19)
          {

          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v16));
            v22 = objc_msgSend(v20, "isEqual:", v21);

            if (v22)
            {
              -[UARPService setUarpDataControlPointCharacteristic:](self, "setUarpDataControlPointCharacteristic:", v18);
              -[UARPService _prepareForFirmwareDownload](self, "_prepareForFirmwareDownload");
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    -[ClientService notifyDidStart](self, "notifyDidStart");
    v9 = v23;
    v8 = v24;
    v10 = 0;
  }

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  NSObject *v28;
  id v29;
  unsigned int v30;
  const char *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  _QWORD v40[2];
  _QWORD v41[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100072608((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
    objc_msgSend(v18, "removeAllObjects");

    -[UARPService setIsSendingData:](self, "setIsSendingData:", 0);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
      objc_msgSend(v21, "removeObjectAtIndex:", 0);

      if (-[UARPService uarpOverAACP](self, "uarpOverAACP"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
        v40[0] = CFSTR("kUARPDeviceUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
        v40[1] = CFSTR("kUARPData");
        v41[0] = v25;
        v41[1] = v20;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
        objc_msgSend(v22, "sendMsg:args:", CFSTR("UARPDataOverAACP"), v26);

      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpDataControlPointCharacteristic](self, "uarpDataControlPointCharacteristic"));
        objc_msgSend(v22, "writeValue:forCharacteristic:type:", v20, v23, 0);
      }

      v27 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v27;
        v29 = objc_msgSend(v20, "length");
        v30 = -[UARPService uarpOverAACP](self, "uarpOverAACP");
        v31 = "GATT";
        v32 = 138413058;
        v34 = 2048;
        v33 = v20;
        if (v30)
          v31 = "AACP";
        v35 = v29;
        v36 = 2112;
        v37 = 0;
        v38 = 2080;
        v39 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "didWriteValueForCharacteristic - peripheral:%@ length:%lu error:%@ profile:%s", (uint8_t *)&v32, 0x2Au);

      }
    }
    else
    {
      -[UARPService setIsSendingData:](self, "setIsSendingData:", 0);
    }

  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10007266C((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    -[UARPService _parseRecvdData:](self, "_parseRecvdData:", v18);

  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t *p_loggingSuperbinaryURL;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v43 = v8;
    v44 = 2112;
    v45 = v9;
    v46 = 2112;
    v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didUpdateNotificationStateForCharacteristic - peripheral:%@ characteristic:%@ error:%@", buf, 0x20u);
  }
  if (!v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientServiceForUUID:", v13));

    v15 = objc_msgSend(objc_alloc((Class)UARPAccessoryHardwareBluetooth), "initWithVendorIDSource:vendorID:productID:productVersion:", 1, objc_msgSend(v14, "vendorID"), objc_msgSend(v14, "productID"), objc_msgSend(v14, "productVersion"));
    v16 = objc_alloc((Class)UARPAccessory);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v18 = objc_msgSend(v16, "initWithHardwareID:uuid:", v15, v17);
    -[UARPService setUarpAccessory:](self, "setUarpAccessory:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
    objc_msgSend(v19, "setAutoDownloadAllowed:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
    if (v20)
    {
      v21 = objc_msgSend(objc_alloc((Class)UARPAssetID), "initWithLocationType:remoteURL:", 3, 0);
      -[UARPService setUarpAssetID:](self, "setUarpAssetID:", v21);

      v22 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAssetID](self, "uarpAssetID"));
        *(_DWORD *)buf = 138412546;
        v43 = v24;
        v44 = 2112;
        v45 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Created uarpAccessory:%@ uarpAssetID:%@", buf, 0x16u);

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAssetID](self, "uarpAssetID"));
      v29 = objc_msgSend(v26, "registerUARPService:withUARPAccessory:withUARPAssetID:", self, v27, v28);

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("log_%@.uarp"), v32));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "uarpLogPath"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v35, 1));
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "URLByAppendingPathComponent:isDirectory:", v33, 0));
        p_loggingSuperbinaryURL = (uint64_t *)&self->_loggingSuperbinaryURL;
        v39 = (void *)*p_loggingSuperbinaryURL;
        *p_loggingSuperbinaryURL = v37;

        v40 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          sub_100072710(p_loggingSuperbinaryURL, v40);

      }
    }
    else
    {
      v41 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_1000726D0(v41);
    }

  }
}

- (void)incOpportunisticConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  void *v12;

  if (!-[UARPService opportunisticRefCount](self, "opportunisticRefCount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v3, "removeOpportunisticConnection:", v4);

  }
  -[UARPService setOpportunisticRefCount:](self, "setOpportunisticRefCount:", (char *)-[UARPService opportunisticRefCount](self, "opportunisticRefCount") + 1);
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = -[UARPService opportunisticRefCount](self, "opportunisticRefCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
    v9 = 134218242;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "incOpportunisticConnection refCount:%ld %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)decOpportunisticConnection
{
  void *v3;
  NSObject *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  void *v12;

  -[UARPService setOpportunisticRefCount:](self, "setOpportunisticRefCount:", (char *)-[UARPService opportunisticRefCount](self, "opportunisticRefCount") - 1);
  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = -[UARPService opportunisticRefCount](self, "opportunisticRefCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
    v9 = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "decOpportunisticConnection refCount:%ld %@", (uint8_t *)&v9, 0x16u);

  }
  if (-[UARPService opportunisticRefCount](self, "opportunisticRefCount") <= 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v7, "setOpportunisticConnection:", v8);

    -[UARPService setOpportunisticRefCount:](self, "setOpportunisticRefCount:", 0);
  }
}

- (void)assetSolicitationComplete
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSURL *loggingSuperbinaryURL;
  void *v37;
  void *v38;
  void *v39;
  NSMutableSet *v40;
  id obj;
  void *v42;
  void *v44;
  id v45;
  time_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[4];
  void *v53;
  __int16 v54;
  void *v55;
  tm buf;
  _BYTE v57[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v40 = objc_opt_new(NSMutableSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uarpLogPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("temp"), 1));
  v39 = v5;
  if (sub_100011B08())
    v6 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/private/var/log/"), 1));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByDeletingLastPathComponent"));
  v42 = (void *)v6;
  objc_msgSend(v2, "removeItemAtURL:error:", v44, 0);
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v44, 1, 0, 0);
  v7 = objc_msgSend(objc_alloc((Class)UARPSuperBinaryAsset), "initWithURL:", self->_loggingSuperbinaryURL);
  v51 = 0;
  v38 = v7;
  objc_msgSend(v7, "decomposeToURL:error:", v44, &v51);
  v8 = v51;
  if (v8)
  {
    v9 = v8;
    v10 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100072784((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v17, 0));

  v19 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    buf.tm_sec = 138412290;
    *(_QWORD *)&buf.tm_min = v42;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Moving files to directory %@", (uint8_t *)&buf, 0xCu);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v18;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        memset(&buf, 0, sizeof(buf));
        v46 = 0;
        v46 = time(0);
        localtime_r(&v46, &buf);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AccessoryUARP_%@_%04d-%02d-%02d-%02d-%02d-%02d_%@"), v27, (buf.tm_year + 1900), (buf.tm_mon + 1), buf.tm_mday, buf.tm_hour, buf.tm_min, buf.tm_sec, v24));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "URLByAppendingPathComponent:isDirectory:", v24, 0));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URLByAppendingPathComponent:isDirectory:", v28, 0));
        objc_msgSend(v2, "removeItemAtURL:error:", v30, 0);
        v31 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v52 = 138412546;
          v53 = v29;
          v54 = 2112;
          v55 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Moving %@ to %@", v52, 0x16u);
        }
        v45 = 0;
        objc_msgSend(v2, "moveItemAtURL:toURL:error:", v29, v30, &v45);
        v32 = v45;
        if (v32)
        {
          v33 = v32;
          v34 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v52 = 138412290;
            v53 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "assetSolicitationComplete: moveItemAtURL error %@", v52, 0xCu);
          }
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "path"));
          -[NSMutableSet addObject:](v40, "addObject:", v33);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v21);
  }

  v35 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    loggingSuperbinaryURL = self->_loggingSuperbinaryURL;
    buf.tm_sec = 138412290;
    *(_QWORD *)&buf.tm_min = loggingSuperbinaryURL;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Adding superbinary LOGS asset %@", (uint8_t *)&buf, 0xCu);
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_loggingSuperbinaryURL, "path"));
  -[NSMutableSet addObject:](v40, "addObject:", v37);

  -[UARPService decOpportunisticConnection](self, "decOpportunisticConnection");
}

- (CBCharacteristic)uarpDataControlPointCharacteristic
{
  return self->_uarpDataControlPointCharacteristic;
}

- (void)setUarpDataControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_uarpDataControlPointCharacteristic, a3);
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (BOOL)isSendingData
{
  return self->_isSendingData;
}

- (void)setIsSendingData:(BOOL)a3
{
  self->_isSendingData = a3;
}

- (NSMutableArray)txDataQueue
{
  return self->_txDataQueue;
}

- (void)setTxDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_txDataQueue, a3);
}

- (NSMutableData)recvDataMessage
{
  return self->_recvDataMessage;
}

- (void)setRecvDataMessage:(id)a3
{
  objc_storeStrong((id *)&self->_recvDataMessage, a3);
}

- (UARPAccessory)uarpAccessory
{
  return self->_uarpAccessory;
}

- (void)setUarpAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_uarpAccessory, a3);
}

- (UARPAssetID)uarpAssetID
{
  return self->_uarpAssetID;
}

- (void)setUarpAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_uarpAssetID, a3);
}

- (NSURL)loggingSuperbinaryURL
{
  return self->_loggingSuperbinaryURL;
}

- (void)setLoggingSuperbinaryURL:(id)a3
{
  objc_storeStrong((id *)&self->_loggingSuperbinaryURL, a3);
}

- (int64_t)opportunisticRefCount
{
  return self->_opportunisticRefCount;
}

- (void)setOpportunisticRefCount:(int64_t)a3
{
  self->_opportunisticRefCount = a3;
}

- (BOOL)uarpOverAACP
{
  return self->_uarpOverAACP;
}

- (void)setUarpOverAACP:(BOOL)a3
{
  self->_uarpOverAACP = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingSuperbinaryURL, 0);
  objc_storeStrong((id *)&self->_uarpAssetID, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_storeStrong((id *)&self->_recvDataMessage, 0);
  objc_storeStrong((id *)&self->_txDataQueue, 0);
  objc_storeStrong((id *)&self->_uarpDataControlPointCharacteristic, 0);
}

@end
