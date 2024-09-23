@implementation HIDApplePencilDevice

- (id)newUserDevice:(id)a3 descriptor:(void *)a4 descriptorLength:(int64_t)a5 keyholeID:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  HIDKeyholeUserDevice *v12;

  v6 = a6;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, a5));
  v12 = -[HIDKeyholeUserDevice initWithProperties:hidDescriptor:keyholeID:delegate:]([HIDKeyholeUserDevice alloc], "initWithProperties:hidDescriptor:keyholeID:delegate:", v10, v11, v6, self);

  return v12;
}

- (id)newDeviceMgntDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  _QWORD v10[2];

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_1000B3B78, CFSTR("ExtendedData"));
  v10[0] = 0x1A1000B0AFF0006;
  *(_QWORD *)((char *)v10 + 6) = 0xC002B1000B0A01A1;
  v8 = -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", v7, v10, 14, v4);

  return v8;
}

- (id)newInertialSensorDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  __int128 v5;
  int v6;

  v5 = xmmword_100086452;
  v6 = -1073577711;
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, &v5, 20, a4);
}

- (id)newRadioDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _QWORD v5[2];

  v5[0] = 0x1A100120AFF0006;
  *(_QWORD *)((char *)v5 + 6) = 0xC002B100120A01A1;
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 14, a4);
}

- (id)newForceDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _OWORD v5[2];
  _OWORD v6[2];

  v5[0] = xmmword_100086474;
  v5[1] = unk_100086484;
  v6[0] = xmmword_100086494;
  *(_OWORD *)((char *)v6 + 10) = *(__int128 *)((char *)&xmmword_100086494 + 10);
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 58, a4);
}

- (id)newUserDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];

  v4 = a3;
  v5 = -[HIDApplePencilDevice newDeviceMgntDevice:keyholeID:](self, "newDeviceMgntDevice:keyholeID:", v4, 240);
  v6 = -[HIDApplePencilDevice newInertialSensorDevice:keyholeID:](self, "newInertialSensorDevice:keyholeID:", v4, 243);
  v7 = -[HIDApplePencilDevice newRadioDevice:keyholeID:](self, "newRadioDevice:keyholeID:", v4, 245);
  v8 = -[HIDApplePencilDevice newForceDevice:keyholeID:](self, "newForceDevice:keyholeID:", v4, 248);

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BCD0();
    goto LABEL_15;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BCFC();
    goto LABEL_15;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BD28();
    goto LABEL_15;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BD54();
LABEL_15:
    v9 = 0;
    goto LABEL_6;
  }
  objc_storeStrong((id *)&self->_deviceMgntUserDevice, v5);
  objc_storeStrong((id *)&self->_forceUserDevice, v8);
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v7;
  v11[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));
LABEL_6:

  return v9;
}

- (void)start
{
  NSArray *userDevices;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  objc_super v17;

  kdebug_trace(730595736, 0, 0, 0, 0);
  v17.receiver = self;
  v17.super_class = (Class)HIDApplePencilDevice;
  -[HIDBluetoothDevice start](&v17, "start");
  dispatch_set_context((dispatch_object_t)self->_queue, self);
  dispatch_set_finalizer_f((dispatch_object_t)self->_queue, (dispatch_function_t)j__objc_msgSend_notifyDidStop);
  userDevices = self->_userDevices;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001F11C;
  v16[3] = &unk_1000AD688;
  v16[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](userDevices, "enumerateObjectsUsingBlock:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("BTSyncPeriod"));
  if (v5)
    v6 = (uint64_t)v5;
  else
    v6 = 4;
  -[HIDApplePencilDevice setBtSyncPeriod:](self, "setBtSyncPeriod:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](self, "peripheral"));
  v8 = objc_msgSend(v7, "hasTag:", CFSTR("A2538"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = objc_msgSend(v9, "integerForKey:", CFSTR("BTSyncPeriod"));
    if ((unint64_t)v10 <= 1)
      v11 = 1;
    else
      v11 = (uint64_t)v10;
    -[HIDApplePencilDevice setBtSyncPeriod:](self, "setBtSyncPeriod:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
  v13 = (unsigned __int16)-[HIDApplePencilDevice btSyncPeriod](self, "btSyncPeriod");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](self, "peripheral"));
  objc_msgSend(v12, "sendEnableBTSyncMsg:forPeer:", v13, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "piconetClockNotification:", CFSTR("PiconetClockNotification"), 0);

  -[HIDApplePencilDevice notifyDidStart](self, "notifyDidStart");
  kdebug_trace(730595740, 0, 0, 0, 0);
}

- (void)notifyDidStart
{
  OS_dispatch_queue *queue;
  NSObject *notifyQueue;
  OS_dispatch_queue *v4;
  _QWORD block[5];

  queue = self->_queue;
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F1B4;
  block[3] = &unk_1000AD230;
  block[4] = self;
  v4 = queue;
  dispatch_async(notifyQueue, block);

}

- (void)notifyDidStop
{
  NSObject *notifyQueue;
  _QWORD block[5];

  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F29C;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(notifyQueue, block);
}

- (id)desiredConnectionParameters
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HIDApplePencilDevice;
  v3 = -[HIDBluetoothDevice desiredConnectionParameters](&v6, "desiredConnectionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[HIDApplePencilDevice preferredInterval](self, "preferredInterval");
  objc_msgSend(v4, "setMinInterval:");
  -[HIDApplePencilDevice preferredInterval](self, "preferredInterval");
  objc_msgSend(v4, "setPreferredInterval:");
  objc_msgSend(v4, "setPreferredPeripheralLatency:", -[HIDApplePencilDevice preferredPeripheralLatency](self, "preferredPeripheralLatency"));
  objc_msgSend(v4, "setMaxPeripheralLatency:", -[HIDApplePencilDevice preferredPeripheralLatency](self, "preferredPeripheralLatency"));
  objc_msgSend(v4, "setMinCELength:", 4);
  objc_msgSend(v4, "setMaxCELength:", 4);
  objc_msgSend(v4, "setMaxDeferment:", 1);
  return v4;
}

- (HIDApplePencilDevice)initWithProperties:(id)a3 reports:(id)a4
{
  return -[HIDApplePencilDevice initWithProperties:reports:loggingIdentifier:](self, "initWithProperties:reports:loggingIdentifier:", a3, a4, CFSTR("Pencil"));
}

- (HIDApplePencilDevice)initWithProperties:(id)a3 reports:(id)a4 loggingIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HIDApplePencilDevice *v11;
  NSSet *v12;
  NSSet *forceInputReportSet;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *hostReadySentSemaphore;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *notifyQueue;
  NSArray *v26;
  NSArray *userDevices;
  __CFNotificationCenter *DarwinNotifyCenter;
  double v29;
  HIDApplePencilDevice *v30;
  objc_super v32;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  kdebug_trace(730595728, 0, 0, 0, 0);
  v32.receiver = self;
  v32.super_class = (Class)HIDApplePencilDevice;
  v11 = -[HIDBluetoothDevice initWithProperties:reports:](&v32, "initWithProperties:reports:", v8, v10);

  if (!v11)
    goto LABEL_8;
  v12 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1000B3588, &off_1000B35A0, &off_1000B35B8, &off_1000B35D0, 0);
  forceInputReportSet = v11->_forceInputReportSet;
  v11->_forceInputReportSet = v12;

  if (!v11->_forceInputReportSet)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BD80();
    goto LABEL_19;
  }
  v14 = -[HIDBluetoothDevice allocHIDQueue](v11, "allocHIDQueue");
  queue = v11->_queue;
  v11->_queue = v14;

  if (!v11->_queue)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BDAC();
    goto LABEL_19;
  }
  v16 = dispatch_semaphore_create(0);
  hostReadySentSemaphore = v11->_hostReadySentSemaphore;
  v11->_hostReadySentSemaphore = (OS_dispatch_semaphore *)v16;

  if (!v11->_hostReadySentSemaphore)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BDD8();
    goto LABEL_19;
  }
  v19 = (objc_class *)objc_opt_class(v11, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.BTLEServer.%@"), v21));

  v23 = objc_retainAutorelease(v22);
  v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), 0);
  notifyQueue = v11->_notifyQueue;
  v11->_notifyQueue = (OS_dispatch_queue *)v24;

  if (!v11->_notifyQueue)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BE04();
    goto LABEL_18;
  }
  v26 = -[HIDApplePencilDevice newUserDevices:](v11, "newUserDevices:", v8);
  userDevices = v11->_userDevices;
  v11->_userDevices = v26;

  if (!v11->_userDevices)
  {
LABEL_18:

LABEL_19:
    kdebug_trace(730595732, 0, 0, 0, 0);
    v30 = 0;
    goto LABEL_9;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)sub_10001F6C8, CFSTR("com.apple.hid.sessionFilterPlugin.fireflyManager.willPowerOn"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  LODWORD(v29) = 15.0;
  -[HIDApplePencilDevice setPreferredInterval:](v11, "setPreferredInterval:", v29);
  -[HIDApplePencilDevice setPreferredPeripheralLatency:](v11, "setPreferredPeripheralLatency:", 10);
  objc_storeStrong((id *)&v11->_loggingIdentifier, a5);

LABEL_8:
  kdebug_trace(730595732, 0, 0, 0, 0);
  v30 = v11;
LABEL_9:

  return v30;
}

- (void)stop
{
  OS_dispatch_queue *queue;
  void *v4;
  objc_super v5;

  kdebug_trace(730595744, 0, 0, 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)HIDApplePencilDevice;
  -[HIDBluetoothDevice stop](&v5, "stop");
  -[NSArray enumerateObjectsUsingBlock:](self->_userDevices, "enumerateObjectsUsingBlock:", &stru_1000AD6C8);
  queue = self->_queue;
  self->_queue = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  kdebug_trace(730595748, 0, 0, 0, 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.hid.sessionFilterPlugin.fireflyManager.willPowerOn"), 0);
  v4.receiver = self;
  v4.super_class = (Class)HIDApplePencilDevice;
  -[HIDBluetoothDevice dealloc](&v4, "dealloc");
}

- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  int v11;
  id v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  void *v15;
  id v16;
  int v17;
  NSObject *v19;
  void *v20;
  unsigned __int16 v21;
  void *v22;
  uint8_t v23[16];
  objc_super v24;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HIDApplePencilDevice;
  v11 = -[HIDBluetoothDevice setReportData:reportID:reportType:error:](&v24, "setReportData:reportID:reportType:error:", v10, v8, v7, a6);
  v12 = objc_retainAutorelease(v10);
  v13 = (unsigned __int8 *)objc_msgSend(v12, "bytes");
  if (!v11)
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice forceUserDevice](self, "forceUserDevice"));
    if (objc_msgSend(v15, "keyholeID") == (_DWORD)v8)
    {
      v16 = objc_msgSend(v12, "length");

      if ((unint64_t)v16 >= 2)
      {
        v17 = *v14;
        if (v17 == 124)
        {
          v19 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Firefly] Restarting BTSync", v23, 2u);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
          v21 = (unsigned __int16)-[HIDApplePencilDevice btSyncPeriod](self, "btSyncPeriod");
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](self, "peripheral"));
          objc_msgSend(v20, "sendEnableBTSyncMsg:forPeer:", v21, v22);

        }
        else if (v17 == 64 && v14[1] == 1)
        {
          dispatch_semaphore_signal((dispatch_semaphore_t)self->_hostReadySentSemaphore);
        }
      }
    }
    else
    {

    }
  }

  return v11;
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  _BYTE *v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice forceInputReportSet](self, "forceInputReportSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "member:", v10));

  if (v11)
  {
    v12 = (char *)objc_msgSend(v8, "length");
    v13 = (char *)&v15 - ((unint64_t)(v12 + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, (size_t)(v12 + 1));
    *v13 = v6;
    objc_msgSend(v8, "getBytes:length:", v13 + 1, v12);
    kdebug_trace(730595776, v6, v12 + 1, a5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice forceUserDevice](self, "forceUserDevice"));
    objc_msgSend(v14, "handleInputReport:reportLength:timestamp:", v13, v12 + 1, a5);

  }
}

- (void)sendAnalyticsEvent:(id)a3 withPayload:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001FBA4;
  v6[3] = &unk_1000AD280;
  v7 = a4;
  v5 = v7;
  AnalyticsSendEventLazy(a3, v6);

}

- (void)piconetClockNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  _BYTE v15[24];

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)&v15[4] = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Firefly] piconetClockNotification: %s", v15, 0xCu);

  }
  v15[0] = 119;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", *(_QWORD *)v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PiconetClockUserInfoKey")));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  *(_DWORD *)&v15[1] = v10;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PiconetPhaseClockUserInfoKey")));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  *(_DWORD *)&v15[5] = v13;

  kdebug_trace(730595780, 119, v10, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice forceUserDevice](self, "forceUserDevice"));
  objc_msgSend(v14, "handleInputReport:reportLength:", v15, 9);

}

- (void)mtWillPowerOn
{
  double v2;

  LODWORD(v2) = 15.0;
  -[HIDApplePencilDevice setPreferredInterval:](self, "setPreferredInterval:", v2);
  -[HIDApplePencilDevice setPreferredPeripheralLatency:](self, "setPreferredPeripheralLatency:", 4);
  -[HIDBluetoothDevice notifyDesiredConnectionParametersDidChange](self, "notifyDesiredConnectionParametersDidChange");
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

- (HIDKeyholeUserDevice)forceUserDevice
{
  return self->_forceUserDevice;
}

- (HIDKeyholeUserDevice)deviceMgntUserDevice
{
  return self->_deviceMgntUserDevice;
}

- (NSSet)forceInputReportSet
{
  return self->_forceInputReportSet;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)btSyncPeriod
{
  return self->_btSyncPeriod;
}

- (void)setBtSyncPeriod:(int64_t)a3
{
  self->_btSyncPeriod = a3;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_forceInputReportSet, 0);
  objc_storeStrong((id *)&self->_deviceMgntUserDevice, 0);
  objc_storeStrong((id *)&self->_forceUserDevice, 0);
  objc_storeStrong((id *)&self->_hostReadySentSemaphore, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_userDevices, 0);
}

@end
