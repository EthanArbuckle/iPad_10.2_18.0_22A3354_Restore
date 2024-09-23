@implementation ANCService

- (ANCService)init
{
  ANCService *v2;
  id v3;
  void *v4;
  CBMutableCharacteristic *v5;
  CBMutableCharacteristic *controlPointCharacteristic;
  id v7;
  void *v8;
  CBMutableCharacteristic *v9;
  CBMutableCharacteristic *notificationSourceCharacteristic;
  id v11;
  void *v12;
  CBMutableCharacteristic *v13;
  CBMutableCharacteristic *dataSourceCharacteristic;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  uint64_t v22;
  NSString *v23;
  id v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  objc_super v28;
  _QWORD v29[3];

  v28.receiver = self;
  v28.super_class = (Class)ANCService;
  v2 = -[ANCService init](&v28, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDANCSControlPointCharacteristicString));
    v5 = (CBMutableCharacteristic *)objc_msgSend(v3, "initWithType:properties:value:permissions:", v4, 8, 0, 34);
    controlPointCharacteristic = v2->_controlPointCharacteristic;
    v2->_controlPointCharacteristic = v5;

    v7 = objc_alloc((Class)CBMutableCharacteristic);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDANCSNotificationSourceCharacteristicString));
    v9 = (CBMutableCharacteristic *)objc_msgSend(v7, "initWithType:properties:value:permissions:", v8, 1040, 0, 0);
    notificationSourceCharacteristic = v2->_notificationSourceCharacteristic;
    v2->_notificationSourceCharacteristic = v9;

    v11 = objc_alloc((Class)CBMutableCharacteristic);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDANCSDataSourceCharacteristicString));
    v13 = (CBMutableCharacteristic *)objc_msgSend(v11, "initWithType:properties:value:permissions:", v12, 1040, 0, 0);
    dataSourceCharacteristic = v2->_dataSourceCharacteristic;
    v2->_dataSourceCharacteristic = v13;

    v15 = objc_alloc((Class)CBMutableService);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAppleNotificationCenterServiceString));
    v17 = objc_msgSend(v15, "initWithType:primary:", v16, 1);
    -[ServerService setService:](v2, "setService:", v17);

    v29[0] = v2->_controlPointCharacteristic;
    v29[1] = v2->_notificationSourceCharacteristic;
    v29[2] = v2->_dataSourceCharacteristic;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ServerService service](v2, "service"));
    objc_msgSend(v19, "setCharacteristics:", v18);

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(v2, v22));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v23));
    v25 = dispatch_queue_create((const char *)objc_msgSend(v24, "UTF8String"), v21);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v25;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ANCService stopNotifications](self, "stopNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ANCService;
  -[ANCService dealloc](&v3, "dealloc");
}

- (void)handleWriteRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBATTRequest consolidatedDataForRequests:](CBATTRequest, "consolidatedDataForRequests:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService controlPointCharacteristic](self, "controlPointCharacteristic"));

  if (v7 == v8)
  {
    v17 = 0;
    v10 = -[ANCService handleControlPointWrite:responseData:](self, "handleControlPointWrite:responseData:", v5, &v17);
    v9 = v17;
  }
  else
  {
    v9 = 0;
    v10 = 10;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025790;
  block[3] = &unk_1000AD6F0;
  block[4] = self;
  v14 = v4;
  v15 = v9;
  v16 = v10;
  v11 = v9;
  v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (int64_t)handleControlPointWrite:(id)a3 responseData:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  char v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v6, 1));
  v12 = 0;
  if (!objc_msgSend(v7, "readUint8:", &v12))
    goto LABEL_9;
  if (v12 == 2)
  {
    v8 = -[ANCService handlePerformNotificationActionCommand:](self, "handlePerformNotificationActionCommand:", v7);
  }
  else if (v12 == 1)
  {
    v8 = -[ANCService handleGetAppAttributesCommand:responseData:](self, "handleGetAppAttributesCommand:responseData:", v7, a4);
  }
  else
  {
    if (v12)
    {
      v9 = 160;
      goto LABEL_12;
    }
    v8 = -[ANCService handleGetNotificationAttributesCommand:responseData:](self, "handleGetNotificationAttributesCommand:responseData:", v7, a4);
  }
  v9 = v8;
  if (v8 == 161)
  {
LABEL_9:
    v10 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C5DC((uint64_t)v6, v10);
    v9 = 161;
  }
LABEL_12:

  return v9;
}

- (int64_t)handleGetNotificationAttributesCommand:(id)a3 responseData:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  int64_t v13;
  unsigned __int8 v15;
  unsigned int v16;
  uint8_t buf[4];
  unsigned int v18;

  v6 = a3;
  v16 = 0;
  if (!objc_msgSend(v6, "readUint32:", &v16))
  {
    v13 = 161;
    goto LABEL_19;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService notificationForUID:](self, "notificationForUID:", v16));
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received \"Get Notification Attributes\" command for notification #%u", buf, 8u);
  }
  if (!v7)
  {
    v13 = 162;
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
  objc_msgSend(v9, "writeUint8:", 0);
  objc_msgSend(v9, "writeUint32:", objc_msgSend(v7, "UID"));
  v15 = 0;
  if (!objc_msgSend(v6, "readUint8:", &v15))
  {
LABEL_14:
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    objc_msgSend(v7, "setIsDirty:", 0);
    v13 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    *(_WORD *)buf = 0;
    v10 = v15;
    if (v15 - 1 <= 2)
      break;
    v11 = 512;
LABEL_13:
    *(_WORD *)buf = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService responseForNotificationAttributeID:maxLength:notification:](self, "responseForNotificationAttributeID:maxLength:notification:", v10));
    objc_msgSend(v9, "writeData:", v12);

    if ((objc_msgSend(v6, "readUint8:", &v15) & 1) == 0)
      goto LABEL_14;
  }
  if (objc_msgSend(v6, "readUint16:", buf))
  {
    if (*(unsigned __int16 *)buf >= 0x200u)
      v11 = 512;
    else
      v11 = *(_WORD *)buf;
    v10 = v15;
    goto LABEL_13;
  }
  v13 = 161;
LABEL_15:

LABEL_18:
LABEL_19:

  return v13;
}

- (int64_t)handleGetAppAttributesCommand:(id)a3 responseData:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  if (objc_msgSend(v6, "readString:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
    v9 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received \"Get App Attributes\" command for identifier %@", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(v8, "writeUint8:", 1);
    objc_msgSend(v8, "writeString:", v7);
    LOBYTE(v13) = 0;
    if (objc_msgSend(v6, "readUint8:", &v13))
    {
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService responseForAppAttributeID:appIdentifier:](self, "responseForAppAttributeID:appIdentifier:", v13, v7));
        objc_msgSend(v8, "writeData:", v10);

      }
      while ((objc_msgSend(v6, "readUint8:", &v13) & 1) != 0);
    }
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));

    v11 = 0;
  }
  else
  {
    v11 = 161;
  }

  return v11;
}

- (int64_t)handlePerformNotificationActionCommand:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  int64_t v9;
  void *v10;
  unsigned int v11;
  char v13;
  unsigned int v14;
  uint8_t buf[4];
  unsigned int v16;

  v4 = a3;
  v14 = 0;
  v13 = 0;
  if (objc_msgSend(v4, "readUint32:", &v14) && objc_msgSend(v4, "readUint8:", &v13))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService notificationForUID:](self, "notificationForUID:", v14));
    v6 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received \"Perform Notification Action\" command for notification #%u", buf, 8u);
    }
    if (!v5)
    {
      v9 = 162;
      goto LABEL_14;
    }
    if (v13)
    {
      if (v13 == 1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alert"));
        v8 = objc_msgSend(v7, "performNegativeAction");

        if ((v8 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alert"));
      v11 = objc_msgSend(v10, "performPositiveAction");

      if (v11)
      {
LABEL_9:
        v9 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    v9 = 163;
    goto LABEL_14;
  }
  v9 = 161;
LABEL_15:

  return v9;
}

- (void)updateNotificationSource:(unsigned __int8)a3 notification:(id)a4 sourceFlags:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a3;
  v12 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService activeCentrals](self, "activeCentrals"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService activeCentrals](self, "activeCentrals"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    -[ANCService updateNotificationSource:notification:sourceFlags:centrals:](self, "updateNotificationSource:notification:sourceFlags:centrals:", v6, v12, v5, v11);

  }
}

- (void)updateNotificationSource:(unsigned __int8)a3 notification:(id)a4 sourceFlags:(unsigned __int8)a5 centrals:(id)a6
{
  int v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  unsigned int v32;
  id v33;
  void *v34;
  _QWORD block[5];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;

  v7 = a5;
  v32 = a3;
  v9 = a4;
  v33 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alert"));
  v12 = objc_msgSend(v11, "categoryID");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService alertSource](self, "alertSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alertsForCategoryID:", v12));

  v15 = objc_msgSend(v11, "isSilent") | v7;
  if (objc_msgSend(v11, "isImportant"))
    v15 = v7 & 0xFC | 2;
  if (objc_msgSend(v11, "hasPositiveAction"))
    v16 = 8;
  else
    v16 = 0;
  v17 = v16 | v15;
  if (objc_msgSend(v11, "hasNegativeAction"))
    v18 = 16;
  else
    v18 = 0;
  if (objc_msgSend(v11, "hasExtraContent"))
    v19 = 32;
  else
    v19 = 0;
  v20 = v18 | v19;
  v21 = v9;
  v22 = v17 | v20;
  objc_msgSend(v10, "writeUint8:", v32);
  objc_msgSend(v10, "writeUint8:", v22);
  objc_msgSend(v10, "writeUint8:", v12);
  v34 = v14;
  objc_msgSend(v10, "writeUint8:", objc_msgSend(v14, "count"));
  objc_msgSend(v10, "writeUint32:", objc_msgSend(v9, "UID"));
  v23 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService eventIDToString:](self, "eventIDToString:", v32));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService categoryIDToString:](self, "categoryIDToString:", v12));
    v27 = objc_msgSend(v9, "UID");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService eventFlagsToString:](self, "eventFlagsToString:", v22));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appIdentifier"));
    *(_DWORD *)buf = 138413314;
    v39 = v25;
    v40 = 2112;
    v41 = v26;
    v42 = 1024;
    v43 = v27;
    v44 = 2112;
    v45 = v28;
    v46 = 2112;
    v47 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@ \"%@\" notification #%u (%@) from %@", buf, 0x30u);

    v21 = v9;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000261DC;
  block[3] = &unk_1000AD718;
  block[4] = self;
  v36 = v10;
  v37 = v33;
  v30 = v33;
  v31 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)updateDataSource:(id)a3 central:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = 0;
    do
    {
      v9 = (char *)((_BYTE *)objc_msgSend(v6, "length") - v8);
      v10 = (char *)objc_msgSend(v7, "maximumUpdateValueLength");
      if (v9 >= v10)
        v9 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", v8, v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService dataSourceCharacteristic](self, "dataSourceCharacteristic"));
      v14 = v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      -[ServerService updateValue:forCharacteristic:onSubscribedCentrals:](self, "updateValue:forCharacteristic:onSubscribedCentrals:", v11, v12, v13);

      v8 = &v8[(_QWORD)v9];
    }
    while (v8 != objc_msgSend(v6, "length"));
  }

}

- (void)startNotifications
{
  void *v3;
  void *v4;
  ANCAlertSource *v5;
  ANCAlertSource *v6;
  id v7;

  -[ANCService setUidGenerator:](self, "setUidGenerator:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[ANCService setUidMap:](self, "setUidMap:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[ANCService setAlertMap:](self, "setAlertMap:", v4);

  v5 = [ANCAlertSource alloc];
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ANCService queue](self, "queue"));
  v6 = -[ANCAlertSource initWithDelegate:queue:](v5, "initWithDelegate:queue:", self, v7);
  -[ANCService setAlertSource:](self, "setAlertSource:", v6);

}

- (void)stopNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v6[0] = 67109120;
    v6[1] = -[ServerService restrictedMode](self, "restrictedMode");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v6, 8u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService alertSource](self, "alertSource"));
  objc_msgSend(v5, "invalidate");

  -[ANCService setAlertSource:](self, "setAlertSource:", 0);
  -[ANCService setAlertMap:](self, "setAlertMap:", 0);
  -[ANCService setUidMap:](self, "setUidMap:", 0);
  -[ANCService setUidGenerator:](self, "setUidGenerator:", 0);
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[ANCService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000265CC;
  v8[3] = &unk_1000AD740;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  ANCService *v29;
  _QWORD block[5];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;

  v7 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ANCService notificationSourceCharacteristic](self, "notificationSourceCharacteristic"));

  if (v9 == v8)
  {
    v10 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Central %@ subscribed to NotificationSourceCharacteristic", buf, 0xCu);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService notificationSourceCharacteristic](self, "notificationSourceCharacteristic"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subscribedCentrals"));
    v13 = objc_msgSend(v12, "count");

    if (v13 == (id)1)
    {
      v14 = objc_alloc_init((Class)NSMutableSet);
      -[ANCService setActiveCentrals:](self, "setActiveCentrals:", v14);

      if (objc_msgSend(v7, "hasTag:", CFSTR("ANCSAuthorized")))
      {
        v15 = objc_claimAutoreleasedReturnValue(-[ANCService queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000268E0;
        block[3] = &unk_1000AD740;
        block[4] = self;
        v31 = v7;
        dispatch_sync(v15, block);

      }
      -[ANCService startNotifications](self, "startNotifications");
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(-[ANCService queue](self, "queue"));
      v24 = _NSConcreteStackBlock;
      v25 = 3221225472;
      v26 = sub_100026920;
      v27 = &unk_1000AD740;
      v28 = v7;
      v29 = self;
      dispatch_sync(v16, &v24);

    }
    if ((objc_msgSend(v7, "hasTag:", CFSTR("IsHearingAid"), v24, v25, v26, v27) & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("PeerIsUsingBuiltinServiceNotification"), v7);

    }
    v18 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService activeCentrals](self, "activeCentrals"));
      v21 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 138412546;
      v33 = v7;
      v34 = 2048;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "After subscription from %@ for ANCS, active centrals count %ld", buf, 0x16u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    objc_msgSend(v22, "sendANCSNotificationSourceRegisteredMsg:", v23);

  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v7 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ANCService notificationSourceCharacteristic](self, "notificationSourceCharacteristic"));

  if (v9 == v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService notificationSourceCharacteristic](self, "notificationSourceCharacteristic"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subscribedCentrals"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[ANCService queue](self, "queue"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100026C50;
      v18[3] = &unk_1000AD740;
      v18[4] = self;
      v19 = v7;
      dispatch_sync(v13, v18);

    }
    else
    {
      -[ANCService stopNotifications](self, "stopNotifications");
      -[ANCService setActiveCentrals:](self, "setActiveCentrals:", 0);
    }
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService activeCentrals](self, "activeCentrals"));
      v17 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2048;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Central %@ unsubscribed from ANCS. Active centrals count %ld", buf, 0x16u);

    }
  }

}

- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ANCService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026D30;
  block[3] = &unk_1000AD790;
  v12 = a5;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(v8, block);

}

- (void)alertAdded:(id)a3 isPreExisting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ANCNotification *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ANCNotification *v14;

  v4 = a4;
  v6 = a3;
  v7 = [ANCNotification alloc];
  v8 = -[ANCService uidGenerator](self, "uidGenerator");
  -[ANCService setUidGenerator:](self, "setUidGenerator:", (v8 + 1));
  v14 = -[ANCNotification initWithUID:alert:](v7, "initWithUID:alert:", v8, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService uidMap](self, "uidMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[ANCNotification UID](v14, "UID")));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService alertMap](self, "alertMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ANCNotification alert](v14, "alert"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v12);

  if (v4)
    v13 = 5;
  else
    v13 = 0;
  -[ANCService updateNotificationSource:notification:sourceFlags:](self, "updateNotificationSource:notification:sourceFlags:", 0, v14, v13);

}

- (void)alertModified:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ANCService notificationForAlert:](self, "notificationForAlert:", a3));
  if ((objc_msgSend(v4, "isDirty") & 1) == 0)
  {
    objc_msgSend(v4, "setIsDirty:", 1);
    -[ANCService updateNotificationSource:notification:sourceFlags:](self, "updateNotificationSource:notification:sourceFlags:", 1, v4, 0);
  }

}

- (void)alertRemoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ANCService notificationForAlert:](self, "notificationForAlert:", a3));
  -[ANCService updateNotificationSource:notification:sourceFlags:](self, "updateNotificationSource:notification:sourceFlags:", 2, v8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService alertMap](self, "alertMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alert"));
  objc_msgSend(v4, "removeObjectForKey:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService uidMap](self, "uidMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "UID")));
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (id)notificationForUID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService uidMap](self, "uidMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (id)notificationForAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService alertMap](self, "alertMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)responseForAttributeID:(unsigned __int8)a3 maxLength:(unsigned __int16)a4 attribute:(id)a5
{
  unsigned int v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UTF8DataWithMaxLength:ellipsis:isTruncated:", v5, 1, 0));

  objc_msgSend(v8, "writeUint8:", v6);
  objc_msgSend(v8, "writeUint16:", (unsigned __int16)objc_msgSend(v9, "length"));
  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v8, "writeBytes:length:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));

  return v11;
}

- (id)responseForNotificationAttributeID:(unsigned __int8)a3 maxLength:(unsigned __int16)a4 notification:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v5 = a4;
  v6 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "alert"));
  v9 = v8;
  switch((int)v6)
  {
    case 0:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appIdentifier"));
      goto LABEL_13;
    case 1:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      goto LABEL_13;
    case 2:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subtitle"));
      goto LABEL_13;
    case 3:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
      goto LABEL_13;
    case 4:
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 4)));
      goto LABEL_8;
    case 5:
      v11 = objc_alloc_init((Class)NSDateFormatter);
      objc_msgSend(v11, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLocale](NSLocale, "systemLocale"));
      objc_msgSend(v11, "setLocale:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromDate:", v14));

LABEL_8:
      break;
    case 6:
      if (!objc_msgSend(v8, "hasPositiveAction"))
        goto LABEL_14;
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "positiveActionLabel"));
      goto LABEL_13;
    case 7:
      if (!objc_msgSend(v8, "hasNegativeAction"))
        goto LABEL_14;
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "negativeActionLabel"));
LABEL_13:
      v12 = (void *)v10;
      break;
    default:
LABEL_14:
      v12 = 0;
      break;
  }
  v15 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    v18 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService notificationAttributeIDToString:](self, "notificationAttributeIDToString:", v6));
    *(_DWORD *)buf = 138412546;
    v21 = v19;
    v22 = 2112;
    v23 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Sending %@: \"%@\", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService responseForAttributeID:maxLength:attribute:](self, "responseForAttributeID:maxLength:attribute:", v6, v5, v12));

  return v16;
}

- (id)responseForAppAttributeID:(unsigned __int8)a3 appIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v6 = a4;
  if ((_DWORD)v4)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService alertSource](self, "alertSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameForAppIdentifier:", v6));

  }
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService appAttributeIDToString:](self, "appAttributeIDToString:", v4));
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending %@: \"%@\", (uint8_t *)&v14, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ANCService responseForAttributeID:maxLength:attribute:](self, "responseForAttributeID:maxLength:attribute:", v4, 512, v7));

  return v10;
}

- (id)eventIDToString:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("Added");
  if (a3 == 1)
    v3 = CFSTR("Modified");
  if (a3 == 2)
    return CFSTR("Removed");
  else
    return (id)v3;
}

- (id)categoryIDToString:(unsigned __int8)a3
{
  if ((a3 - 1) > 0xB)
    return CFSTR("Other");
  else
    return *(&off_1000AD7B0 + (char)(a3 - 1));
}

- (id)eventFlagsToString:(unsigned __int8)a3
{
  int v3;
  void *v4;
  int i;
  int v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  for (i = 0; i != 8; ++i)
  {
    if (((1 << i) & v3) != 0)
    {
      v6 = (1 << i);
      v7 = 0;
      switch((1 << i))
      {
        case 1u:
          v7 = CFSTR("S");
          break;
        case 2u:
          v7 = CFSTR("I");
          break;
        case 3u:
        case 5u:
        case 6u:
        case 7u:
          break;
        case 4u:
          v7 = CFSTR("P");
          break;
        case 8u:
          v7 = CFSTR("✓");
          break;
        default:
          if (v6 == 32)
            v8 = CFSTR("E");
          else
            v8 = 0;
          if (v6 == 16)
            v7 = CFSTR("✗");
          else
            v7 = v8;
          break;
      }
      if (objc_msgSend(v4, "length"))
        objc_msgSend(v4, "appendString:", CFSTR("|"));
      objc_msgSend(v4, "appendString:", v7);
    }
  }
  return v4;
}

- (id)notificationAttributeIDToString:(unsigned __int8)a3
{
  if (a3 >= 8u)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%lu)"), a3));
  else
    return *(&off_1000AD810 + (char)a3);
}

- (id)appAttributeIDToString:(unsigned __int8)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%lu)"), a3));
  else
    return CFSTR("Display Name");
}

- (CBMutableCharacteristic)controlPointCharacteristic
{
  return self->_controlPointCharacteristic;
}

- (void)setControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_controlPointCharacteristic, a3);
}

- (CBMutableCharacteristic)notificationSourceCharacteristic
{
  return self->_notificationSourceCharacteristic;
}

- (void)setNotificationSourceCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSourceCharacteristic, a3);
}

- (CBMutableCharacteristic)dataSourceCharacteristic
{
  return self->_dataSourceCharacteristic;
}

- (void)setDataSourceCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceCharacteristic, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableSet)activeCentrals
{
  return self->_activeCentrals;
}

- (void)setActiveCentrals:(id)a3
{
  objc_storeStrong((id *)&self->_activeCentrals, a3);
}

- (unsigned)uidGenerator
{
  return self->_uidGenerator;
}

- (void)setUidGenerator:(unsigned int)a3
{
  self->_uidGenerator = a3;
}

- (NSMutableDictionary)uidMap
{
  return self->_uidMap;
}

- (void)setUidMap:(id)a3
{
  objc_storeStrong((id *)&self->_uidMap, a3);
}

- (NSMutableDictionary)alertMap
{
  return self->_alertMap;
}

- (void)setAlertMap:(id)a3
{
  objc_storeStrong((id *)&self->_alertMap, a3);
}

- (ANCAlertSource)alertSource
{
  return self->_alertSource;
}

- (void)setAlertSource:(id)a3
{
  objc_storeStrong((id *)&self->_alertSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSource, 0);
  objc_storeStrong((id *)&self->_alertMap, 0);
  objc_storeStrong((id *)&self->_uidMap, 0);
  objc_storeStrong((id *)&self->_activeCentrals, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSourceCharacteristic, 0);
  objc_storeStrong((id *)&self->_notificationSourceCharacteristic, 0);
  objc_storeStrong((id *)&self->_controlPointCharacteristic, 0);
}

@end
