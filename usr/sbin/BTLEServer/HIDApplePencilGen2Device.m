@implementation HIDApplePencilGen2Device

+ (unint64_t)btClockMask
{
  return 0xFFFFFFLL;
}

+ (BOOL)hasWirelessCharging
{
  return 1;
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HIDApplePencilGen2Device;
  -[HIDApplePencilDevice start](&v3, "start");
  -[HIDChargerNotifier start](self->_chargerNotifier, "start");
  -[HIDApplePencilGen2Device startCollectionTimer](self, "startCollectionTimer");
}

- (HIDApplePencilGen2Device)initWithProperties:(id)a3 reports:(id)a4
{
  return -[HIDApplePencilGen2Device initWithProperties:reports:loggingIdentifier:](self, "initWithProperties:reports:loggingIdentifier:", a3, a4, CFSTR("Pencil2"));
}

- (HIDApplePencilGen2Device)initWithProperties:(id)a3 reports:(id)a4 loggingIdentifier:(id)a5
{
  id v9;
  HIDApplePencilGen2Device *v10;
  double v11;
  HIDApplePencilGen2Device *v12;
  HIDTimestampSync *v13;
  uint64_t v14;
  HIDTimestampSync *v15;
  HIDTimestampSync *timestampSync;
  HIDChargerNotifier *v17;
  void *v18;
  HIDChargerNotifier *v19;
  HIDChargerNotifier *chargerNotifier;
  HIDChargerNotifier *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HIDApplePencilGen2Device *v26;
  objc_super v28;

  v9 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HIDApplePencilGen2Device;
  v10 = -[HIDApplePencilDevice initWithProperties:reports:loggingIdentifier:](&v28, "initWithProperties:reports:loggingIdentifier:", v9, a4, a5);
  v12 = v10;
  if (!v10)
    goto LABEL_5;
  LODWORD(v11) = 15.0;
  -[HIDApplePencilGen2Device setPreferredInterval:](v10, "setPreferredInterval:", v11);
  -[HIDApplePencilGen2Device setPreferredPeripheralLatency:](v12, "setPreferredPeripheralLatency:", 6);
  -[HIDApplePencilGen2Device setMaxPeripheralLatency:](v12, "setMaxPeripheralLatency:", 100);
  v13 = [HIDTimestampSync alloc];
  v15 = -[HIDTimestampSync initWithBtClockMask:](v13, "initWithBtClockMask:", objc_msgSend((id)objc_opt_class(v12, v14), "btClockMask"));
  timestampSync = v12->_timestampSync;
  v12->_timestampSync = v15;

  if (!v12->_timestampSync)
    goto LABEL_5;
  v17 = [HIDChargerNotifier alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice queue](v12, "queue"));
  v19 = -[HIDChargerNotifier initWithQueue:](v17, "initWithQueue:", v18);
  chargerNotifier = v12->_chargerNotifier;
  v12->_chargerNotifier = v19;

  v21 = v12->_chargerNotifier;
  if (v21)
  {
    -[HIDChargerNotifier setDelegate:](v21, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_properties, a3);
    v12->_authStatus = 0;
    v12->_accdPairingFinished = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](v12, "peripheral"));
    objc_msgSend(v22, "addObserver:selector:name:object:", v12, "authSuccessNotification", CFSTR("AuthenticationServiceAuthDidSucceedNotification"), v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](v12, "peripheral"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, "authFailureNotification", CFSTR("AuthenticationServiceAuthDidFailNotification"), v25);

    v26 = v12;
  }
  else
  {
LABEL_5:
    v26 = 0;
  }

  return v26;
}

- (id)newDeviceMgntDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  _OWORD v10[2];

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_1000B3BC0, CFSTR("ExtendedData"));
  v10[0] = xmmword_1000865DA;
  *(_OWORD *)((char *)v10 + 14) = *(__int128 *)((char *)&xmmword_1000865DA + 14);
  v8 = -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", v7, v10, 30, v4);

  return v8;
}

- (id)newForceDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _OWORD v5[2];

  v5[0] = xmmword_1000865F8;
  *(_OWORD *)((char *)v5 + 9) = *(__int128 *)((char *)&xmmword_1000865F8 + 9);
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 25, a4);
}

- (id)newTouchDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _BYTE v5[23];

  *(_OWORD *)v5 = xmmword_100086611;
  *(_QWORD *)&v5[15] = 0xC002810001000077;
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 23, a4);
}

- (id)newWakeDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _OWORD v5[2];

  v5[0] = xmmword_100086628;
  *(_OWORD *)((char *)v5 + 12) = *(__int128 *)((char *)&xmmword_100086628 + 12);
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 28, a4);
}

- (id)forceUserDevice
{
  return -[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B3738);
}

- (id)deviceMgntUserDevice
{
  return -[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B3750);
}

- (id)newUserDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *userDevices;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[4];

  v4 = a3;
  v5 = -[HIDApplePencilGen2Device newDeviceMgntDevice:keyholeID:](self, "newDeviceMgntDevice:keyholeID:", v4, 0);
  v6 = -[HIDApplePencilGen2Device newTouchDevice:keyholeID:](self, "newTouchDevice:keyholeID:", v4, 1);
  v7 = -[HIDApplePencilGen2Device newForceDevice:keyholeID:](self, "newForceDevice:keyholeID:", v4, 8);
  v8 = -[HIDApplePencilGen2Device newWakeDevice:keyholeID:](self, "newWakeDevice:keyholeID:", v4, 4);

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006F7D8();
    goto LABEL_15;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006F804();
    goto LABEL_15;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C71C();
    goto LABEL_15;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C6C4();
LABEL_15:
    v11 = 0;
    goto LABEL_6;
  }
  v13[0] = &off_1000B3750;
  v13[1] = &off_1000B3768;
  v14[0] = v5;
  v14[1] = v6;
  v13[2] = &off_1000B3780;
  v13[3] = &off_1000B3738;
  v14[2] = v8;
  v14[3] = v7;
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  userDevices = self->_userDevices;
  self->_userDevices = v9;

  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_userDevices, "enumerateKeysAndObjectsUsingBlock:", &stru_1000AE020);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_userDevices, "allValues"));
LABEL_6:

  return v11;
}

- (void)stop
{
  void *v3;
  HIDChargerNotifier *chargerNotifier;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[HIDChargerNotifier stop](self->_chargerNotifier, "stop");
  chargerNotifier = self->_chargerNotifier;
  self->_chargerNotifier = 0;

  -[HIDApplePencilGen2Device unpublishProperties](self, "unpublishProperties");
  -[HIDApplePencilGen2Device stopCollectionTimer](self, "stopCollectionTimer");
  v5.receiver = self;
  v5.super_class = (Class)HIDApplePencilGen2Device;
  -[HIDApplePencilDevice stop](&v5, "stop");
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  unsigned __int8 *v11;
  unint64_t v12;
  uint64_t *v13;
  unsigned __int16 v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  unsigned int v20;
  _QWORD *v21;
  int v22;
  id v23;
  NSDictionary *userDevices;
  void *v25;
  void *v26;
  id v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  char *v34;
  void *v35;
  unint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  id v39;
  uint64_t v40;

  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  v10 = objc_retainAutorelease(v8);
  v11 = (unsigned __int8 *)objc_msgSend(v10, "bytes");
  v35 = v10;
  if (objc_msgSend(v10, "length") && *v11 == 189)
  {
    v12 = (unint64_t)v9 - 1;
    if (v9 != (id)1)
    {
      v13 = (uint64_t *)(v11 + 1);
      v34 = (char *)&v40 + 3;
      while (1)
      {
        v40 = 0;
        if (v12 <= 7)
          break;
        v16 = *v13;
        v15 = v13 + 1;
        v14 = v16;
        v40 = v16;
        v17 = (unsigned __int16)((v16 & 0xF00 | BYTE2(v16)) - 1);
        if (v12 - 8 < v17)
        {
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006F8A8();
          goto LABEL_16;
        }
        v36 = v12 - 8;
        v38 = v17;
        v39 = 0;
        v18 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", v17 + 13);
        objc_msgSend(v18, "appendBytes:length:", (char *)&v40 + 7, 1);
        if ((*(_DWORD *)((_BYTE *)&v40 + 3) & 0x80000000) == 0)
        {
          objc_msgSend(v18, "appendBytes:length:", v34, 4);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timestampSync](self, "timestampSync"));
          v39 = objc_msgSend(v19, "applyTimestampOffset:precise:");

          objc_msgSend(v18, "appendBytes:length:", &v39, 8);
        }
        v20 = (v14 >> 12) & 0xFFFFF00F | (16 * v14);
        objc_msgSend(v18, "appendBytes:length:", v15, v17, v34, v35);
        v21 = v15;
        v22 = 0;
        v37 = (_QWORD *)((char *)v21 + v17);
        do
        {
          if (((v20 >> v22) & 1) != 0)
          {
            v23 = objc_retainAutorelease(v18);
            -[HIDApplePencilGen2Device handleAnalyticsData:data:length:](self, "handleAnalyticsData:data:length:", v22, objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"));
            userDevices = self->_userDevices;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v22));
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](userDevices, "objectForKeyedSubscript:", v25));
            v27 = objc_retainAutorelease(v23);
            objc_msgSend(v26, "handleInputReport:reportLength:timestamp:", objc_msgSend(v27, "bytes"), objc_msgSend(v27, "length"), a5);

            -[HIDApplePencilGen2Device checkAndLogHostInputReportCollision:reportID:](self, "checkAndLogHostInputReportCollision:reportID:", v22, *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v27), "bytes"));
          }
          ++v22;
        }
        while (v22 != 12);
        v12 = v36 - v38;

        v13 = v37;
        if (v36 == v38)
          goto LABEL_16;
      }
      v32 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006F830(v12, v32, v33);
    }
  }
  else
  {
    v28 = self->_userDevices;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v29));
    v31 = objc_retainAutorelease(v10);
    objc_msgSend(v30, "handleInputReport:reportLength:timestamp:", objc_msgSend(v31, "bytes"), objc_msgSend(v31, "length"), a5);

  }
LABEL_16:

}

- (void)handleAnalyticsData:(unsigned __int8)a3 data:(const void *)a4 length:(unint64_t)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;

  if (!a3 && a5 == 5 && *(_BYTE *)a4 == 68)
  {
    v6 = *(unsigned int *)((char *)a4 + 1);
    v16 = CFSTR("TimeOn0_1C");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
    v17 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

    -[HIDApplePencilDevice sendAnalyticsEvent:withPayload:](self, "sendAnalyticsEvent:withPayload:", CFSTR("com.apple.MConnector.ExcessCharge.0_1C"), v8);
    v9 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006F918(v6, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)piconetClockNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006F97C(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PiconetClockUserInfoKey")));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PiconetPhaseClockUserInfoKey")));
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timestampSync](self, "timestampSync"));
  objc_msgSend(v12, "processTimestampSync:phase:", v8, v11);

}

- (void)chargerStateChanged:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  double v12;
  void *v13;
  unsigned __int16 v14;
  void *v15;
  BOOL v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v3 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HIDChargerNotifier stateToStr:](HIDChargerNotifier, "stateToStr:", v3));
    v20 = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ received HID charger notification: %@", (uint8_t *)&v20, 0x16u);

  }
  if ((_DWORD)v3 == 3)
  {
    v9 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring no accessories notification", (uint8_t *)&v20, 2u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("enableBTSyncBeforeConnectionParametersUpdate"));

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
      v14 = (unsigned __int16)-[HIDApplePencilDevice btSyncPeriod](self, "btSyncPeriod");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](self, "peripheral"));
      objc_msgSend(v13, "sendEnableBTSyncMsg:forPeer:", v14, v15);

    }
    v16 = (_DWORD)v3 == 1;
    v17 = (_DWORD)v3 == 1;
    LODWORD(v12) = 1110704128;
    if (v16)
    {
      v18 = 1;
    }
    else
    {
      *(float *)&v12 = 15.0;
      v18 = 6;
    }
    if (v16)
      v19 = 1;
    else
      v19 = 100;
    -[HIDApplePencilGen2Device setPreferredInterval:](self, "setPreferredInterval:", v12);
    -[HIDApplePencilGen2Device setPreferredPeripheralLatency:](self, "setPreferredPeripheralLatency:", v18);
    -[HIDApplePencilGen2Device setMaxPeripheralLatency:](self, "setMaxPeripheralLatency:", v19);
    -[HIDBluetoothDevice notifyDesiredConnectionParametersDidChange](self, "notifyDesiredConnectionParametersDidChange");
    -[HIDApplePencilGen2Device notifyPencilOnChargerState:](self, "notifyPencilOnChargerState:", v17);
    -[HIDApplePencilGen2Device chargeStateCollection:](self, "chargeStateCollection:", v17);
  }
}

- (void)notifyPencilOnChargerState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  _BYTE v11[12];
  __int16 v12;
  const char *v13;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(self, a2), "hasWirelessCharging"))
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
      v8 = (void *)v7;
      v9 = "detached";
      if (v3)
        v9 = "attached";
      *(_DWORD *)v11 = 138412546;
      *(_QWORD *)&v11[4] = v7;
      v12 = 2080;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ notifying pencil that wireless charging is %s", v11, 0x16u);

    }
    v11[0] = -64;
    v11[1] = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device deviceMgntUserDevice](self, "deviceMgntUserDevice", *(_QWORD *)v11));
    objc_msgSend(v10, "setReport:reportLength:reportID:reportType:", v11, 2, 192, 2);

  }
}

- (void)chargeStateCollection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  const char *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _OWORD v25[32];

  v3 = a3;
  memset(v25, 0, sizeof(v25));
  v16 = 512;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B3750));
  v6 = objc_msgSend(v5, "getReport:reportLength:reportID:reportType:", v25, &v16, 35, 2);

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006FA88();
    if (v6)
      goto LABEL_7;
  }
  else if (v6)
  {
    goto LABEL_7;
  }
  if (v16 > 1)
  {
    LOBYTE(v7) = BYTE1(v25[0]);
    v8 = fmin((double)v7, 100.0);
    v23[0] = CFSTR("ChargeState");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v23[1] = CFSTR("AttachState");
    v24[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    v24[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));

    -[HIDApplePencilDevice sendAnalyticsEvent:withPayload:](self, "sendAnalyticsEvent:withPayload:", CFSTR("com.apple.MConnector.ChargeState"), v11);
    v12 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    {
      LOBYTE(v13) = BYTE1(v25[0]);
      v14 = (double)v13;
      v15 = "detached";
      *(_DWORD *)buf = 134218498;
      v18 = v8;
      if (v3)
        v15 = "attached";
      v19 = 2048;
      v20 = v14;
      v21 = 2080;
      v22 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "chargeStateCollection: battery level %lf%% (raw: %lf%%) when %s", buf, 0x20u);
    }

    return;
  }
LABEL_7:
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006FA28();
}

- (void)startCollectionTimer
{
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD handler[5];

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006FAF0();
  v3 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice queue](self, "queue"));
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  -[HIDApplePencilGen2Device setTimer:](self, "setTimer:", v4);

  v5 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timer](self, "timer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100049638;
  handler[3] = &unk_1000AD230;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);

  v6 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timer](self, "timer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100049640;
  v8[3] = &unk_1000AD230;
  v8[4] = self;
  dispatch_source_set_cancel_handler(v6, v8);

  -[HIDApplePencilGen2Device stictionCollectionRestartTimer:](self, "stictionCollectionRestartTimer:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timer](self, "timer"));
  dispatch_resume(v7);

}

- (void)stopCollectionTimer
{
  NSObject *v3;

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006FB1C();
  v3 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timer](self, "timer"));
  dispatch_source_cancel(v3);

}

- (void)stictionCollectionRestartTimer:(double)a3
{
  dispatch_time_t v4;
  NSObject *source;

  source = objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timer](self, "timer"));
  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

}

- (void)stictionCollectionGate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  int v38;
  double v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stictionCollectionGateLastTimeStamp")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "doubleForKey:", v3);
  v6 = v5;

  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006FC14(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSince1970");
  v17 = v16;
  v18 = v16 - v6;
  v19 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006FBAC(v19, v20, v21, v22, v23, v24, v25, v26);
  if (v6 == 0.0 || v18 < 0.0 || v18 > 86400.0)
  {
    v28 = -[HIDApplePencilGen2Device stictionCollection](self, "stictionCollection");
    v29 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006FB48(v28, v29, v30, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v36, "setDouble:forKey:", v3, v17);

    v37 = qword_1000C9178;
    v27 = 86400.0;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 134217984;
      v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "stictionCollectionGate: set timestamp of stiction collection = %lf", (uint8_t *)&v38, 0xCu);
    }
  }
  else
  {
    v27 = 86400.0 - v18;
  }
  -[HIDApplePencilGen2Device stictionCollectionRestartTimer:](self, "stictionCollectionRestartTimer:", v27);

}

- (int)stictionCollection
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  double v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  memset(v22, 0, sizeof(v22));
  v17 = 512;
  BYTE4(v16) = 0;
  LODWORD(v16) = 3389;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B3750, v16));
  v4 = objc_msgSend(v3, "setReport:reportLength:reportID:reportType:", &v16, 5, 61, 2);

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006FD4C();
    if (v4)
      return v4;
  }
  else if (v4)
  {
    return v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B3750));
  v4 = objc_msgSend(v5, "getReport:reportLength:reportID:reportType:", v22, &v17, 62, 2);

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006FCE4();
    if (v4)
      return v4;
  }
  else if (v4)
  {
    return v4;
  }
  if (v17 < 17)
    return -536870911;
  v6 = *(_DWORD *)((char *)v22 + 13);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  memset(v22, 0, sizeof(v22));
  v17 = 512;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B3780));
  v4 = objc_msgSend(v7, "getReport:reportLength:reportID:reportType:", v22, &v17, 208, 2);

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006FC7C();
    if (v4)
      return v4;
  }
  else if (v4)
  {
    return v4;
  }
  if (v17 < 6)
    return -536870911;
  v8 = (double)(v6 + WORD2(v22[0]));
  v9 = (double)WORD2(v22[0]);
  v20[0] = CFSTR("StictionLifetime");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  v20[1] = CFSTR("StictionSinceBoot");
  v21[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  v21[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

  -[HIDApplePencilDevice sendAnalyticsEvent:withPayload:](self, "sendAnalyticsEvent:withPayload:", CFSTR("com.apple.stylus2.motion"), v12);
  v13 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "stictionCollection: Lifetime Stiction   = %lf", buf, 0xCu);
  }
  v14 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "stictionCollection: Stiction since Boot = %lf", buf, 0xCu);
  }

  return 0;
}

- (void)pairingInfoCompleted
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ received pairing info", (uint8_t *)&v6, 0xCu);

  }
  self->_accdPairingFinished = 1;
  -[HIDApplePencilGen2Device maybeQueryOOBPAndSendStatus](self, "maybeQueryOOBPAndSendStatus");
}

- (id)desiredConnectionParameters
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HIDApplePencilGen2Device;
  v3 = -[HIDApplePencilDevice desiredConnectionParameters](&v6, "desiredConnectionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[HIDApplePencilGen2Device preferredInterval](self, "preferredInterval");
  objc_msgSend(v4, "setMinInterval:");
  -[HIDApplePencilGen2Device preferredInterval](self, "preferredInterval");
  objc_msgSend(v4, "setPreferredInterval:");
  objc_msgSend(v4, "setPreferredPeripheralLatency:", -[HIDApplePencilGen2Device preferredPeripheralLatency](self, "preferredPeripheralLatency"));
  objc_msgSend(v4, "setMaxPeripheralLatency:", -[HIDApplePencilGen2Device maxPeripheralLatency](self, "maxPeripheralLatency"));
  objc_msgSend(v4, "setTimeout:", 2000);
  return v4;
}

- (void)authSuccessNotification
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ authSuccessNotification", buf, 0xCu);

  }
  v6 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049F44;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)authFailureNotification
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ authFailureNotification", buf, 0xCu);

  }
  v6 = objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A064;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)authCompleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  int64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;

  v3 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ authCompleted: %{BOOL}d", (uint8_t *)&v9, 0x12u);

  }
  -[HIDChargerNotifier setBTAuthState:](self->_chargerNotifier, "setBTAuthState:", v3);
  v8 = 1;
  if (!v3)
    v8 = 2;
  self->_authStatus = v8;
  -[HIDApplePencilGen2Device maybeQueryOOBPAndSendStatus](self, "maybeQueryOOBPAndSendStatus");
  if (v3)
    -[HIDApplePencilGen2Device publishProperties](self, "publishProperties");
}

- (void)maybeQueryOOBPAndSendStatus
{
  void *v3;
  NSObject *v4;
  void *v5;
  int64_t authStatus;
  _BOOL4 accdPairingFinished;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD buf[10];

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    authStatus = self->_authStatus;
    accdPairingFinished = self->_accdPairingFinished;
    buf[0] = 138412802;
    *(_QWORD *)&buf[1] = v5;
    LOWORD(buf[3]) = 1024;
    *(_DWORD *)((char *)&buf[3] + 2) = authStatus;
    HIWORD(buf[4]) = 1024;
    buf[5] = accdPairingFinished;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ _authStatus = %u, _accdPairingFinished = %u", (uint8_t *)buf, 0x18u);

  }
  if (self->_authStatus == 1 && self->_accdPairingFinished)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device deviceMgntUserDevice](self, "deviceMgntUserDevice"));

    if (v8)
    {
      memset((char *)buf + 1, 0, 32);
      LOBYTE(buf[0]) = 65;
      v19 = 33;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device deviceMgntUserDevice](self, "deviceMgntUserDevice"));
      v10 = objc_msgSend(v9, "getReport:reportLength:reportID:reportType:", buf, &v19, 65, 2);

      if (!v10 && (v19 == 33 || v19 == 17))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)buf + 1, v19 - 1));
        v12 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          sub_10006FE24((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
        -[HIDChargerNotifier setPairingData:](self->_chargerNotifier, "setPairingData:", v11);

      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006FDC4();
      }
    }
  }
}

- (void)publishProperties
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  _QWORD v30[6];
  _QWORD v31[6];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
    *(_DWORD *)buf = 138412546;
    v33 = v5;
    v34 = 2112;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ publishing device with properties: %@", buf, 0x16u);

  }
  -[HIDApplePencilGen2Device unpublishProperties](self, "unpublishProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PhysicalDeviceUniqueID")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  v29 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createConnectionWithType:andIdentifier:", 2, v8));
  -[HIDApplePencilGen2Device setConnectionUUID:](self, "setConnectionUUID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device connectionUUID](self, "connectionUUID"));
  if (!v11 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006FE88();
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device connectionUUID](self, "connectionUUID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:", 3, 1, 0, 0, v13, 0));

  v31[0] = CFSTR("Apple Pencil");
  v30[0] = kACCInfo_Name;
  v30[1] = kACCInfo_Manufacturer;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Manufacturer")));
  v31[1] = v26;
  v30[2] = kACCInfo_Model;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ModelNumber")));
  v31[2] = v15;
  v30[3] = kACCInfo_SerialNumber;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SerialNumber")));
  v31[3] = v17;
  v30[4] = kACCInfo_HardwareVersion;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kBTHardwareRevisionKey")));
  v31[4] = v19;
  v30[5] = kACCInfo_FirmwareVersionActive;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device properties](self, "properties"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kBTFirmwareRevisionKey")));
  v31[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 6));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  objc_msgSend(v23, "setAccessoryInfo:forEndpointWithUUID:", v22, v28);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device connectionUUID](self, "connectionUUID"));
  objc_msgSend(v24, "publishConnectionWithUUID:", v25);

}

- (void)unpublishProperties
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device connectionUUID](self, "connectionUUID"));

  if (v3)
  {
    v4 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ unpublishing device properties", (uint8_t *)&v9, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device connectionUUID](self, "connectionUUID"));
    objc_msgSend(v7, "destroyConnectionWithUUID:", v8);

  }
}

- (float)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(float)a3
{
  self->_preferredInterval = a3;
}

- (int)preferredPeripheralLatency
{
  return self->_preferredPeripheralLatency;
}

- (void)setPreferredPeripheralLatency:(int)a3
{
  self->_preferredPeripheralLatency = a3;
}

- (int)maxPeripheralLatency
{
  return self->_maxPeripheralLatency;
}

- (void)setMaxPeripheralLatency:(int)a3
{
  self->_maxPeripheralLatency = a3;
}

- (NSDictionary)userDevices
{
  return self->_userDevices;
}

- (void)setUserDevices:(id)a3
{
  objc_storeStrong((id *)&self->_userDevices, a3);
}

- (HIDTimestampSync)timestampSync
{
  return self->_timestampSync;
}

- (void)setTimestampSync:(id)a3
{
  objc_storeStrong((id *)&self->_timestampSync, a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUUID, a3);
}

- (HIDChargerNotifier)chargerNotifier
{
  return self->_chargerNotifier;
}

- (void)setChargerNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_chargerNotifier, a3);
}

- (int64_t)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int64_t)a3
{
  self->_authStatus = a3;
}

- (BOOL)accdPairingFinished
{
  return self->_accdPairingFinished;
}

- (void)setAccdPairingFinished:(BOOL)a3
{
  self->_accdPairingFinished = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_chargerNotifier, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_timestampSync, 0);
  objc_storeStrong((id *)&self->_userDevices, 0);
}

@end
