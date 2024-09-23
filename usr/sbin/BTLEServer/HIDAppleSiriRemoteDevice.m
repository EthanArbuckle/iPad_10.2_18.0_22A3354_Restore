@implementation HIDAppleSiriRemoteDevice

+ (id)getTouchHIDReportDescriptor
{
  _OWORD v3[2];

  v3[0] = xmmword_100086221;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_100086221 + 15);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, 31));
}

+ (id)getButtonsHIDReportDescriptor:(unsigned __int16)a3
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  _BYTE v7[40];

  if ((a3 & 0xFFFE) == 0x314)
  {
    *(_OWORD *)v7 = xmmword_100086260;
    *(_OWORD *)&v7[16] = unk_100086270;
    *(_QWORD *)&v7[31] = 0xC00102B201950680;
    v5 = xmmword_100086240;
    v6 = unk_100086250;
    v3 = 71;
  }
  else
  {
    v5 = xmmword_100086287;
    v6 = unk_100086297;
    *(_OWORD *)v7 = xmmword_1000862A7;
    *(_QWORD *)&v7[15] = 0xC00102B201950680;
    v3 = 55;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v5, v3, v5, v6, *(_OWORD *)v7, *(_OWORD *)&v7[16], *(_QWORD *)&v7[32]));
}

+ (id)getInertialHIDReportDescriptor
{
  __int128 v3;
  _OWORD v4[2];

  v3 = xmmword_1000862BE;
  v4[0] = unk_1000862CE;
  *(_OWORD *)((char *)v4 + 15) = unk_1000862DD;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 47));
}

+ (id)getInfraredHIDReportDescriptor
{
  _OWORD v3[2];

  v3[0] = xmmword_1000862ED;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_1000862ED + 15);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, 31));
}

+ (id)getAudioHIDReportDescriptor
{
  _OWORD v3[2];

  v3[0] = xmmword_10008630C;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_10008630C + 15);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, 31));
}

+ (id)getRadioHIDReportDescriptor
{
  _OWORD v3[2];

  v3[0] = xmmword_10008632B;
  *(_OWORD *)((char *)v3 + 15) = *(__int128 *)((char *)&xmmword_10008632B + 15);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, 31));
}

+ (id)getDeviceManagementHIDReportDescriptor
{
  __int128 v3;
  _BYTE v4[19];

  v3 = xmmword_10008634A;
  *(_OWORD *)v4 = unk_10008635A;
  *(_DWORD *)&v4[15] = -1073675598;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 35));
}

+ (id)getProximityHIDReportDescriptor
{
  _OWORD v3[2];
  char v4;

  v3[0] = xmmword_10008636D;
  v3[1] = unk_10008637D;
  v4 = -64;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, 33));
}

+ (id)properties:(id)a3 locationIdOffset:(unsigned int)a4 hidDescriptor:(id)a5 extendedData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "mutableCopy");
  v13 = v12;
  if (v10)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("ReportDescriptor"));
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("ExtendedData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LocationID")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "unsignedLongValue") + a4));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("LocationID"));

  return v13;
}

- (HIDAppleSiriRemoteDevice)initWithProperties:(id)a3 reports:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  HIDAppleSiriRemoteDevice *v16;
  HIDAppleSiriRemoteDevice *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *serialNumber;
  NSMutableArray *v24;
  NSMutableArray *audioBuffer;
  NSMutableSet *v26;
  NSMutableSet *pathIDs;
  NSMutableData *v28;
  NSMutableData *touchData;
  NSMutableData *v30;
  NSMutableData *inertialData;
  NSMutableArray *v32;
  NSMutableArray *cachedButtonsAndTimestamps;
  dispatch_group_t v34;
  OS_dispatch_group *groupInit;
  dispatch_group_t v36;
  OS_dispatch_group *groupStart;
  dispatch_group_t v38;
  OS_dispatch_group *groupDeviceManagement;
  dispatch_group_t v40;
  OS_dispatch_group *groupTouch;
  dispatch_group_t v42;
  OS_dispatch_group *groupInertial;
  dispatch_group_t v44;
  OS_dispatch_group *groupProximity;
  _BOOL4 v46;
  dispatch_semaphore_t v47;
  OS_dispatch_semaphore *gotDeviceExtendedInfoReport;
  dispatch_semaphore_t v49;
  OS_dispatch_semaphore *sentHostReadyReport;
  dispatch_semaphore_t v51;
  OS_dispatch_semaphore *doapAudioStart;
  OS_dispatch_queue *v53;
  OS_dispatch_queue *queue;
  char v55;
  IONotificationPort *v56;
  IONotificationPort *notificationPort;
  objc_super v59;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100069D94(v8, v9, v10, v11, v12, v13, v14, v15);
  if (byte_1000C9170)
    kdebug_trace(730595328, dword_1000C9008, 0, 0, 0);
  v59.receiver = self;
  v59.super_class = (Class)HIDAppleSiriRemoteDevice;
  v16 = -[HIDBluetoothDevice initWithProperties:reports:](&v59, "initWithProperties:reports:", v6, v7);
  v17 = v16;
  if (v16)
  {
    v18 = dword_1000C9008++;
    v16->_instanceID = v18;
    v16->_firstButton = 1;
    v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17->_instanceID));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("InstanceID"));

    objc_storeStrong((id *)&v17->_properties, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductID")));
    v17->_productID = (unsigned __int16)objc_msgSend(v21, "unsignedIntValue");

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SerialNumber")));
    serialNumber = v17->_serialNumber;
    v17->_serialNumber = (NSString *)v22;

    v17->_latency = 0;
    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    audioBuffer = v17->_audioBuffer;
    v17->_audioBuffer = v24;

    v17->_connectedStandbyToken = -1;
    v26 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pathIDs = v17->_pathIDs;
    v17->_pathIDs = v26;

    v28 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 512);
    touchData = v17->_touchData;
    v17->_touchData = v28;

    v30 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 512);
    inertialData = v17->_inertialData;
    v17->_inertialData = v30;

    v32 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedButtonsAndTimestamps = v17->_cachedButtonsAndTimestamps;
    v17->_cachedButtonsAndTimestamps = v32;

    v34 = dispatch_group_create();
    groupInit = v17->_groupInit;
    v17->_groupInit = (OS_dispatch_group *)v34;

    v36 = dispatch_group_create();
    groupStart = v17->_groupStart;
    v17->_groupStart = (OS_dispatch_group *)v36;

    v38 = dispatch_group_create();
    groupDeviceManagement = v17->_groupDeviceManagement;
    v17->_groupDeviceManagement = (OS_dispatch_group *)v38;

    v40 = dispatch_group_create();
    groupTouch = v17->_groupTouch;
    v17->_groupTouch = (OS_dispatch_group *)v40;

    v42 = dispatch_group_create();
    groupInertial = v17->_groupInertial;
    v17->_groupInertial = (OS_dispatch_group *)v42;

    v44 = dispatch_group_create();
    groupProximity = v17->_groupProximity;
    v17->_groupProximity = (OS_dispatch_group *)v44;

    v46 = v17->_groupInit
       && v17->_groupStart
       && v17->_groupDeviceManagement
       && v17->_groupTouch
       && v17->_groupInertial
       && v17->_groupProximity;
    v47 = dispatch_semaphore_create(0);
    gotDeviceExtendedInfoReport = v17->_gotDeviceExtendedInfoReport;
    v17->_gotDeviceExtendedInfoReport = (OS_dispatch_semaphore *)v47;

    v49 = dispatch_semaphore_create(0);
    sentHostReadyReport = v17->_sentHostReadyReport;
    v17->_sentHostReadyReport = (OS_dispatch_semaphore *)v49;

    v51 = dispatch_semaphore_create(1);
    doapAudioStart = v17->_doapAudioStart;
    v17->_doapAudioStart = (OS_dispatch_semaphore *)v51;

    if (!v17->_gotDeviceExtendedInfoReport || !v17->_sentHostReadyReport || !v17->_doapAudioStart)
      v46 = 0;
    v53 = -[HIDBluetoothDevice allocHIDQueue](v17, "allocHIDQueue");
    queue = v17->_queue;
    v17->_queue = v53;

    v55 = 0;
    if (v46 && v17->_queue)
    {
      v56 = IONotificationPortCreate(kIOMainPortDefault);
      v17->_notificationPort = v56;
      if (v56)
      {
        IONotificationPortSetDispatchQueue(v56, (dispatch_queue_t)v17->_queue);
        dispatch_set_context((dispatch_object_t)v17->_queue, v17);
        dispatch_set_finalizer_f((dispatch_object_t)v17->_queue, (dispatch_function_t)sub_10000AB54);
        v55 = 1;
      }
      else
      {
        v55 = 0;
      }
    }
    if (byte_1000C9170)
      kdebug_trace(730595332, v17->_instanceID, 0, 0, 0);
    if ((v55 & 1) == 0)
    {
      notificationPort = v17->_notificationPort;
      if (notificationPort)
      {
        IONotificationPortDestroy(notificationPort);
        v17->_notificationPort = 0;
      }

      v17 = 0;
    }

  }
  return v17;
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100069E74(v3, v4, v5, v6, v7, v8, v9, v10);
  if (self->_doapAudioRelay)
    -[HIDAppleSiriRemoteDevice stop](self, "stop");
  v11.receiver = self;
  v11.super_class = (Class)HIDAppleSiriRemoteDevice;
  -[HIDBluetoothDevice dealloc](&v11, "dealloc");
}

- (void)stop
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  HIDAppleSiriRemoteDevice *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id location;
  objc_super v20;

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100069EE4(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v11);

  v12 = self;
  objc_sync_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));
    dispatch_semaphore_signal(v14);

  }
  objc_sync_exit(v12);

  -[HIDAppleSiriRemoteDevice setButtonData:](v12, "setButtonData:", 0);
  -[HIDAppleSiriRemoteDevice handleButtonData](v12, "handleButtonData");
  if (-[HIDAppleSiriRemoteDevice proximityData](v12, "proximityData"))
  {
    -[HIDAppleSiriRemoteDevice setProximityData:](v12, "setProximityData:", 0);
    -[HIDAppleSiriRemoteDevice handleProximityData](v12, "handleProximityData");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioRelay](v12, "doapAudioRelay"));
  objc_msgSend(v15, "invalidate");

  -[HIDAppleSiriRemoteDevice setDoapAudioRelay:](v12, "setDoapAudioRelay:", 0);
  v20.receiver = v12;
  v20.super_class = (Class)HIDAppleSiriRemoteDevice;
  -[HIDBluetoothDevice stop](&v20, "stop");
  location = 0;
  objc_initWeak(&location, v12);
  v16 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](v12, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADF0;
  block[3] = &unk_1000AD208;
  objc_copyWeak(&v18, &location);
  block[4] = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];
  objc_super v37;

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100069F54(v3, v4, v5, v6, v7, v8, v9, v10);
  v37.receiver = self;
  v37.super_class = (Class)HIDAppleSiriRemoteDevice;
  -[HIDBluetoothDevice start](&v37, "start");
  v11 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupDeviceManagement](self, "groupDeviceManagement"));
  dispatch_group_enter(v11);

  v12 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupTouch](self, "groupTouch"));
  dispatch_group_enter(v12);

  v13 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInertial](self, "groupInertial"));
  dispatch_group_enter(v13);

  v14 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupProximity](self, "groupProximity"));
  dispatch_group_enter(v14);

  v15 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  global_queue = dispatch_get_global_queue(21, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B598;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_group_async(v15, v17, block);

  v18 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000B8D0;
  v35[3] = &unk_1000AD230;
  v35[4] = self;
  dispatch_group_async(v18, v17, v35);

  v19 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000BB70;
  v34[3] = &unk_1000AD230;
  v34[4] = self;
  dispatch_group_async(v19, v17, v34);

  if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 788
    || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 789)
  {
    if (byte_1000C9170)
      kdebug_trace(730595368, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
    v20 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInertial](self, "groupInertial"));
    dispatch_group_leave(v20);

    if (byte_1000C9170)
      kdebug_trace(730595372, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
  }
  else
  {
    v21 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000BE14;
    v33[3] = &unk_1000AD230;
    v33[4] = self;
    dispatch_group_async(v21, v17, v33);

  }
  v22 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000C010;
  v32[3] = &unk_1000AD230;
  v32[4] = self;
  dispatch_group_async(v22, v17, v32);

  v23 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInit](self, "groupInit"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000C20C;
  v31[3] = &unk_1000AD230;
  v31[4] = self;
  dispatch_group_async(v23, v17, v31);

  if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 614
    || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 621)
  {
    location = 0;
    objc_initWeak(&location, self);
    v24 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupStart](self, "groupStart"));
    v25 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000C954;
    v28[3] = &unk_1000AD258;
    objc_copyWeak(&v29, &location);
    dispatch_group_async(v24, v25, v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  v26 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupStart](self, "groupStart"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000CA6C;
  v27[3] = &unk_1000AD230;
  v27[4] = self;
  dispatch_group_async(v26, v17, v27);

}

- (void)clearAppleMultitouchDeviceNotification
{
  if (-[HIDAppleSiriRemoteDevice amdNotification](self, "amdNotification"))
  {
    IOObjectRelease(-[HIDAppleSiriRemoteDevice amdNotification](self, "amdNotification"));
    -[HIDAppleSiriRemoteDevice setAmdNotification:](self, "setAmdNotification:", 0);
  }
}

- (void)clearDeviceManagementNotification
{
  if (-[HIDAppleSiriRemoteDevice deviceMgtNotification](self, "deviceMgtNotification"))
  {
    IOObjectRelease(-[HIDAppleSiriRemoteDevice deviceMgtNotification](self, "deviceMgtNotification"));
    -[HIDAppleSiriRemoteDevice setDeviceMgtNotification:](self, "setDeviceMgtNotification:", 0);
  }
}

- (void)clearButtonInterestNotification
{
  if (-[HIDAppleSiriRemoteDevice buttonInterestNotification](self, "buttonInterestNotification"))
  {
    IOObjectRelease(-[HIDAppleSiriRemoteDevice buttonInterestNotification](self, "buttonInterestNotification"));
    -[HIDAppleSiriRemoteDevice setButtonInterestNotification:](self, "setButtonInterestNotification:", 0);
  }
}

- (BOOL)matchInstanceIDInHidEventDriver:(unsigned int)a3
{
  void *CFProperty;
  void *v6;
  unsigned int v7;
  kern_return_t ParentEntry;
  BOOL v9;
  io_object_t v10;
  kern_return_t v11;
  io_object_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  io_registry_entry_t entry;
  io_registry_entry_t parent;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("SerialNumber"), kCFAllocatorDefault, 0);
  if (CFProperty
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice serialNumber](self, "serialNumber")),
        v7 = objc_msgSend(v6, "isEqualToString:", CFProperty),
        v6,
        v7))
  {
    parent = 0;
    ParentEntry = IORegistryEntryGetParentEntry(a3, "IOService", &parent);
    v9 = 0;
    v10 = parent;
    if (!ParentEntry && parent)
    {
      entry = 0;
      v11 = IORegistryEntryGetParentEntry(parent, "IOService", &entry);
      v9 = 0;
      v12 = entry;
      if (!v11 && entry)
      {
        v13 = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("InstanceID"), kCFAllocatorDefault, 0);
        v14 = v13;
        if (v13
          && (v15 = objc_msgSend(v13, "unsignedIntValue"),
              v15 == -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID")))
        {
          v16 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            sub_10006A044(v16, self);
          v9 = 1;
        }
        else
        {
          v9 = 0;
        }

        v12 = entry;
      }
      IOObjectRelease(v12);
      v10 = parent;
    }
    IOObjectRelease(v10);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)verifyButtonDriverOpenedByEventSystem:(unsigned int)a3
{
  void *CFProperty;
  NSObject *v5;
  HIDAppleSiriRemoteDevice *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  unsigned int v22;
  _BYTE v23[128];

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("DeviceOpenedByEventSystem"), kCFAllocatorDefault, 0);
  if (objc_msgSend(CFProperty, "BOOLValue"))
  {
    v16 = CFProperty;
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HID event system ready to dispatch keyboard/button events", buf, 2u);
    }
    -[HIDAppleSiriRemoteDevice clearButtonInterestNotification](self, "clearButtonInterestNotification");
    v6 = self;
    objc_sync_enter(v6);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](v6, "cachedButtonsAndTimestamps"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
          v14 = (id)qword_1000C9178;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(v12, "unsignedIntValue");
            *(_DWORD *)buf = 67109120;
            v22 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Send cached button 0x%04X", buf, 8u);
          }

          -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:](v6, "sendButtonDataToUserDevice:withTimestamp:", (unsigned __int16)objc_msgSend(v12, "unsignedIntValue"), objc_msgSend(v13, "unsignedLongLongValue"));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v8);
    }

    -[HIDAppleSiriRemoteDevice setCachedButtonsAndTimestamps:](v6, "setCachedButtonsAndTimestamps:", 0);
    objc_sync_exit(v6);

    CFProperty = v16;
  }

}

- (void)deviceMgtDriverArrived:(unsigned int)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  CFBooleanRef v11;
  uint8_t v12[4];
  unsigned int v13;

  v5 = IOIteratorNext(a3);
  if ((_DWORD)v5)
  {
    v6 = v5;
    do
    {
      if (-[HIDAppleSiriRemoteDevice matchInstanceIDInHidEventDriver:](self, "matchInstanceIDInHidEventDriver:", v6))
      {
        v7 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          sub_10006A0C0(v12, v7, self, &v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice peripheral](self, "peripheral"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("181E")));
        v10 = objc_msgSend(v8, "isSupportingService:", v9);

        if (v10)
          v11 = kCFBooleanTrue;
        else
          v11 = kCFBooleanFalse;
        IORegistryEntrySetCFProperty(v6, CFSTR("BondManagement"), v11);
      }
      v6 = IOIteratorNext(a3);
    }
    while ((_DWORD)v6);
  }
}

- (void)appleMultitouchDeviceArrived:(unsigned int)a3
{
  io_object_t i;
  BOOL v6;
  NSObject *v7;
  uint8_t v8;
  _BYTE v9[11];
  io_registry_entry_t parent;

  for (i = IOIteratorNext(a3); i; i = IOIteratorNext(a3))
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(i, "IOService", &parent))
      v6 = 1;
    else
      v6 = parent == 0;
    if (!v6 && -[HIDAppleSiriRemoteDevice matchInstanceIDInHidEventDriver:](self, "matchInstanceIDInHidEventDriver:"))
    {
      v7 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_10006A134(&v8, v9, v7);
      -[HIDAppleSiriRemoteDevice setNormalPeripheralLatency](self, "setNormalPeripheralLatency");
    }
  }
}

- (id)desiredConnectionParameters
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  unsigned int v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  float v20;
  void *v21;
  void *v22;
  objc_super v24;

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006A170(v3, v4, v5, v6, v7, v8, v9, v10);
  if (-[HIDBluetoothDevice state](self, "state") == 2)
  {
    v24.receiver = self;
    v24.super_class = (Class)HIDAppleSiriRemoteDevice;
    v11 = -[HIDBluetoothDevice desiredConnectionParameters](&v24, "desiredConnectionParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v12, "setPreferredPeripheralLatency:", -[HIDAppleSiriRemoteDevice latency](self, "latency"));
    objc_msgSend(v12, "setMaxPeripheralLatency:", -[HIDAppleSiriRemoteDevice latency](self, "latency"));
    objc_msgSend(v12, "setMinCELength:", 6);
    objc_msgSend(v12, "setMaxDeferment:", 1);
    LODWORD(v13) = 15.0;
    objc_msgSend(v12, "setMinInterval:", v13);
    LODWORD(v14) = 15.0;
    objc_msgSend(v12, "setPreferredInterval:", v14);
    v15 = -[HIDAppleSiriRemoteDevice latency](self, "latency");
    if (v15)
    {
      if (v15 == 199)
      {
        v16 = (float)(int)(objc_msgSend(v12, "preferredPeripheralLatency") + 1);
        objc_msgSend(v12, "preferredInterval");
        v18 = (float)((float)(v17 * v16) * 4.0) + 1.0;
      }
      else
      {
        objc_msgSend(v12, "preferredInterval");
        v18 = (float)(v20 * 5.0) * (float)(int)(objc_msgSend(v12, "preferredPeripheralLatency") + 1);
      }
      v19 = (int)v18;
    }
    else
    {
      v19 = 2000;
    }
    objc_msgSend(v12, "setTimeout:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("ConnectionTimeout")));

    if (v22)
      objc_msgSend(v12, "setTimeout:", objc_msgSend(v21, "integerForKey:", CFSTR("ConnectionTimeout")));

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)setSleepPeripheralLatency
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006A1E0(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D4E8;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v11, block);

}

- (void)setNormalPeripheralLatency
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006A250(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D618;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v11, block);

}

- (void)setZeroPeripheralLatency
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006A2C0(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7B4;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v11, block);

}

- (void)sendButtonDataToUserDevice:(unsigned __int16)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v5;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  __IOHIDUserDevice *v11;
  __IOHIDUserDevice *v12;
  uint64_t v13;
  CFIndex v14;
  uint8_t report;
  uint8_t report_1[2];
  _QWORD v17[4];
  id v18;

  v5 = a3;
  if (-[HIDAppleSiriRemoteDevice firstButton](self, "firstButton") && byte_1000C9170)
    kdebug_trace(730595424, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
  if (-[HIDBluetoothDevice state](self, "state") < 3
    || (v7 = -[HIDBluetoothDevice state](self, "state"), !(_DWORD)v5) && v7 == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000D9DC;
    v17[3] = &unk_1000AD280;
    v18 = v8;
    v10 = v8;
    objc_msgSend(v9, "logBlock:", v17);

    if (-[HIDAppleSiriRemoteDevice productID](self, "productID") == 788
      || -[HIDAppleSiriRemoteDevice productID](self, "productID") == 789)
    {
      report = -5;
      *(_WORD *)report_1 = v5;
      v11 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice buttons](self, "buttons"));
      v12 = v11;
      v13 = a4;
      v14 = 3;
    }
    else
    {
      report = -6;
      report_1[0] = v5;
      v11 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice buttons](self, "buttons"));
      v12 = v11;
      v13 = a4;
      v14 = 2;
    }
    IOHIDUserDeviceHandleReportWithTimeStamp(v11, v13, &report, v14);

  }
  if (-[HIDAppleSiriRemoteDevice firstButton](self, "firstButton"))
  {
    if (byte_1000C9170)
      kdebug_trace(730595428, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
    -[HIDAppleSiriRemoteDevice setFirstButton:](self, "setFirstButton:", 0);
  }
}

- (void)handleButtonData
{
  void *v3;
  void *v4;
  HIDAppleSiriRemoteDevice *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  uint8_t buf[4];
  unsigned int v14;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006A330(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](self, "cachedButtonsAndTimestamps"));

  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](v5, "cachedButtonsAndTimestamps"));

    if (v6)
    {
      v7 = (id)qword_1000C9178;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = -[HIDAppleSiriRemoteDevice buttonData](v5, "buttonData");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cache button 0x%04X", buf, 8u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice cachedButtonsAndTimestamps](v5, "cachedButtonsAndTimestamps"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", -[HIDAppleSiriRemoteDevice buttonData](v5, "buttonData")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[HIDAppleSiriRemoteDevice inputReportTimestamp](v5, "inputReportTimestamp", v9)));
      v12[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
      objc_msgSend(v8, "addObject:", v11);

    }
    else
    {
      -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:](v5, "sendButtonDataToUserDevice:withTimestamp:", -[HIDAppleSiriRemoteDevice buttonData](v5, "buttonData"), -[HIDAppleSiriRemoteDevice inputReportTimestamp](v5, "inputReportTimestamp"));
    }
    objc_sync_exit(v5);

  }
  else
  {
    -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:](self, "sendButtonDataToUserDevice:withTimestamp:", -[HIDAppleSiriRemoteDevice buttonData](self, "buttonData"), -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp"));
  }
}

- (void)handleProximityData
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  __IOHIDUserDevice *v7;
  uint8_t report[2];
  _QWORD v9[4];
  id v10;

  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupProximity](self, "groupProximity"));
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[HIDAppleSiriRemoteDevice proximityData](self, "proximityData")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000DD9C;
    v9[3] = &unk_1000AD280;
    v10 = v4;
    v6 = v4;
    objc_msgSend(v5, "logBlock:", v9);

    report[0] = 1;
    report[1] = -[HIDAppleSiriRemoteDevice proximityData](self, "proximityData");
    v7 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice proximity](self, "proximity"));
    IOHIDUserDeviceHandleReportWithTimeStamp(v7, -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp"), report, 2);

  }
}

- (void)handleTouchData
{
  id v3;
  const uint8_t *v4;
  int v5;
  NSObject *v7;
  __IOHIDUserDevice *v8;
  uint64_t v9;
  void *v10;

  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData")));
    v4 = (const uint8_t *)objc_msgSend(v3, "bytes");

    v5 = *v4;
    if (v5 == 96 && byte_1000C9170 != 0)
      kdebug_trace(730595436, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
    v7 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupTouch](self, "groupTouch"));
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    v8 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touch](self, "touch"));
    v9 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    IOHIDUserDeviceHandleReportWithTimeStamp(v8, v9, v4, (CFIndex)objc_msgSend(v10, "length"));

    if (v5 == 96)
    {
      if (byte_1000C9170)
        kdebug_trace(730595440, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
    }
    -[HIDAppleSiriRemoteDevice logTouchData](self, "logTouchData");
  }
}

- (void)logTouchData
{
  id v3;
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  char v12;
  unsigned int v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  unint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v64;
  NSObject *v65;
  uint64_t v66;
  unsigned __int8 v67;
  uint64_t v68;
  unint64_t v69;
  int v70;
  int v71;
  unsigned int v72;
  _QWORD v73[5];
  _QWORD v74[5];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t buf[4];
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[5];
  const __CFString *v85;
  id v86;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData")));
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  if (objc_msgSend(v5, "length") == (id)12)
  {

    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  v7 = objc_msgSend(v6, "length");

  if (v7 == (id)19)
  {
LABEL_4:
    v8 = v4[11];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    if (objc_msgSend(v9, "length") == (id)19)
      v70 = v4[18] & 7;
    else
      v70 = 0;

    if ((v4[11] & 8) != 0)
      v10 = 1;
    else
      v10 = 2;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    if (objc_msgSend(v11, "length") == (id)19)
    {
      if ((v4[18] & 8) != 0)
        v12 = 1;
      else
        v12 = 2;
      v67 = v12;
    }
    else
    {
      v67 = 0;
    }

    v13 = v4[2];
    v14 = v4[3];
    v15 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
    v16 = qword_1000C9018;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    v18 = v8 & 7;
    v19 = (v13 >> 1) | (v14 << 7);
    if (objc_msgSend(v17, "count"))
    {

    }
    else
    {

      v20 = 0;
      v72 = 0;
      if (v18 == 3 || v70 == 3)
        goto LABEL_22;
    }
    v20 = v15 - v16;
    v72 = v19 - dword_1000C9020;
    if (v19 < dword_1000C9020)
      v72 = (v19 | 0x8000) - dword_1000C9020;
LABEL_22:
    v69 = v20;
    v71 = v8 & 7;
    v21 = dword_1000C9010;
    if (!dword_1000C9010)
    {
      mach_timebase_info((mach_timebase_info_t)&dword_1000C900C);
      v21 = dword_1000C9010;
    }
    v68 = dword_1000C900C;
    dword_1000C9020 = v19;
    qword_1000C9018 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
    if (v18 == 4)
      goto LABEL_36;
    if (v18 == 3)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v10));
      v24 = objc_msgSend(v22, "containsObject:", v23);

      if (v24)
      {
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006A41C();
        goto LABEL_36;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v10));
      objc_msgSend(v34, "addObject:", v35);
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v10));
      objc_msgSend(v34, "removeObject:", v35);
    }

LABEL_36:
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    v37 = objc_msgSend(v36, "length") == (id)19;

    if (v37 && v70 != 4)
    {
      if (v70 == 3)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v67));
        v40 = objc_msgSend(v38, "containsObject:", v39);

        if (v40)
        {
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006A41C();
        }
        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v67));
          objc_msgSend(v43, "addObject:", v44);

        }
      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v67));
        objc_msgSend(v41, "removeObject:", v42);

      }
    }
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = sub_10000E848;
    v79 = sub_10000E858;
    v80 = 0;
    v83[0] = CFSTR("touch");
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "description"));
    v84[0] = v46;
    v83[1] = CFSTR("fwTimestampMs");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v19));
    v84[1] = v47;
    v83[2] = CFSTR("fwTimestampDeltaMs");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v72));
    v49 = v69 * v68 / v21;
    v84[2] = v48;
    v83[3] = CFSTR("inputReportDeltaMs");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v49 / 0xF4240));
    v84[3] = v50;
    v83[4] = CFSTR("numTouches");
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "count")));
    v84[4] = v52;
    v80 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v84, v83, 5));

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10000E870;
    v73[3] = &unk_1000AD2A8;
    v73[4] = &v75;
    objc_msgSend(v53, "logBlock:", v73);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    v55 = objc_msgSend(v54, "count") == 0;

    if (!v55)
    {
      if (15 * (((double)v72 + 7.5) / 0xF) < 0x10)
      {
        v64 = v70 == 3 || v71 == 3 || v49 >= 0x989680;
        if (!v64 || v49 >= 0x1406F40)
        {
          v65 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
          {
            v66 = v76[5];
            *(_DWORD *)buf = 138412290;
            v82 = v66;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Delayed multitouch data: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        v56 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006A3B0((uint64_t)&v76, v56, v57, v58, v59, v60, v61, v62);
      }
    }
    _Block_object_dispose(&v75, 8);

    return;
  }
  v25 = objc_alloc((Class)NSMutableString);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  v27 = objc_msgSend(v25, "initWithFormat:", CFSTR("{length = %lu, bytes = 0x"), objc_msgSend(v26, "length"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  v29 = objc_msgSend(v28, "length");

  if (v29)
  {
    v30 = 0;
    do
    {
      objc_msgSend(v27, "appendFormat:", CFSTR("%02x"), v4[v30]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      ++v30;
      v32 = objc_msgSend(v31, "length");

    }
    while (v30 < (unint64_t)v32);
  }
  objc_msgSend(v27, "appendString:", CFSTR("}"));
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_10000E848;
  v79 = sub_10000E858;
  v80 = 0;
  v85 = CFSTR("touch");
  v86 = v27;
  v80 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10000E860;
  v74[3] = &unk_1000AD2A8;
  v74[4] = &v75;
  objc_msgSend(v33, "logBlock:", v74);

  _Block_object_dispose(&v75, 8);
}

- (void)handleInertialData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __IOHIDUserDevice *v8;
  uint64_t v9;
  id v10;
  const uint8_t *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupInertial](self, "groupInertial"));
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertial](self, "inertial"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000EA00;
      v14[3] = &unk_1000AD280;
      v15 = v6;
      v13 = v6;
      objc_msgSend(v7, "logBlock:", v14);

      v8 = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertial](self, "inertial"));
      v9 = -[HIDAppleSiriRemoteDevice inputReportTimestamp](self, "inputReportTimestamp");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData")));
      v11 = (const uint8_t *)objc_msgSend(v10, "bytes");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
      IOHIDUserDeviceHandleReportWithTimeStamp(v8, v9, v11, (CFIndex)objc_msgSend(v12, "length"));

    }
  }
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  HIDAppleSiriRemoteDevice *v12;
  HIDAppleSiriRemoteDevice *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  id v21;
  _QWORD v22[4];
  HIDAppleSiriRemoteDevice *v23;

  if (-[HIDBluetoothDevice state](self, "state") > 2)
    return;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));

  if (!v7)
    return;
  v8 = -[HIDAppleSiriRemoteDevice productID](self, "productID");
  if (v8 - 788 >= 2)
  {
    if (v8 == 621 && !a4)
      goto LABEL_14;
  }
  else if (a3 && a4 >= 5 && !a3[4])
  {
LABEL_14:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    objc_msgSend(v16, "logBlock:", &stru_1000AD2E8);

    v12 = self;
    objc_sync_enter(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));

    if (v17)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](v12, "doapAudioStop"));
      dispatch_semaphore_signal(v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice audioBuffer](v12, "audioBuffer"));
    objc_msgSend(v19, "removeAllObjects");

    objc_sync_exit(v12);
    goto LABEL_19;
  }
  if (a3 && a4 >= 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[HIDAppleSiriRemoteDevice setLastAudioDate:](self, "setLastAudioDate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000ED08;
    v22[3] = &unk_1000AD280;
    v12 = v10;
    v23 = v12;
    objc_msgSend(v11, "logBlock:", v22);

    v13 = self;
    objc_sync_enter(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice audioBuffer](v13, "audioBuffer"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice audioBuffer](v13, "audioBuffer"));
      objc_msgSend(v15, "addObject:", v12);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioRelay](v13, "doapAudioRelay"));
      objc_msgSend(v15, "sendAudioFrame:", v12);
    }

    objc_sync_exit(v13);
LABEL_19:

  }
  v20 = -[HIDAppleSiriRemoteDevice productID](self, "productID");
  if (v20 == 621 || v20 == 614)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice pathIDs](self, "pathIDs"));
    objc_msgSend(v21, "removeAllObjects");

  }
}

- (void)handleDeviceManagementData:(char *)a3 dataLength:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  __IOHIDUserDevice *device;

  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice groupDeviceManagement](self, "groupDeviceManagement"));
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    device = (__IOHIDUserDevice *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice deviceManagement](self, "deviceManagement"));
    v8 = mach_absolute_time();
    IOHIDUserDeviceHandleReportWithTimeStamp(device, v8, (const uint8_t *)a3, a4);

  }
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  unsigned int v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  -[HIDAppleSiriRemoteDevice setInputReportTimestamp:](self, "setInputReportTimestamp:", a5);
  v9 = -[HIDAppleSiriRemoteDevice productID](self, "productID");
  if (v9 - 788 < 2)
  {
    -[HIDAppleSiriRemoteDevice handleInputReportDataV2:reportID:](self, "handleInputReportDataV2:reportID:", v8, v6);
  }
  else if (v9 == 621 || v9 == 614)
  {
    -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:](self, "handleInputReportDataV1:reportID:", v8, v6);
  }
  else
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006A47C(v10, self);
  }

}

- (void)handleInputReportDataV1:(id)a3 reportID:(unsigned __int8)a4
{
  int v4;
  id v6;
  char *v7;
  char *v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  v7 = (char *)objc_msgSend(v6, "length");
  v8 = v7 + 1;
  v9 = (char *)&v12 - ((unint64_t)(v7 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, (size_t)(v7 + 1));
  *v9 = v4;
  objc_msgSend(v6, "getBytes:length:", v9 + 1, objc_msgSend(v6, "length"));

  switch(v4)
  {
    case 96:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      objc_msgSend(v10, "setLength:", 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      objc_msgSend(v11, "appendBytes:length:", v9, v8);

      -[HIDAppleSiriRemoteDevice handleTouchData](self, "handleTouchData");
      break;
    case 224:
      -[HIDAppleSiriRemoteDevice handleDeviceManagementData:dataLength:](self, "handleDeviceManagementData:dataLength:", v9, v8);
      break;
    case 252:
      -[HIDAppleSiriRemoteDevice demultiplexInputReport:reportLength:reportID:](self, "demultiplexInputReport:reportLength:reportID:", v9, v8, 252);
      break;
    default:
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006A508();
      break;
  }
}

- (void)handleInputReportDataV2:(id)a3 reportID:(unsigned __int8)a4
{
  int v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE v22[5];
  char v23;
  unsigned __int16 v24;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  switch(v4)
  {
    case 250:
      v8 = objc_msgSend(v6, "length");
      __chkstk_darwin();
      v10 = &v22[-v9];
      bzero(&v22[-v9], (size_t)v8);
      objc_msgSend(v7, "getBytes:length:", v10, v8);
      -[HIDAppleSiriRemoteDevice handleAudioData:dataLength:](self, "handleAudioData:dataLength:", v10, v8);
      break;
    case 251:
      v24 = 0;
      objc_msgSend(v6, "getBytes:length:", &v24, 2);
      -[HIDAppleSiriRemoteDevice setButtonData:](self, "setButtonData:", v24);
      -[HIDAppleSiriRemoteDevice handleButtonData](self, "handleButtonData");
      break;
    case 252:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      objc_msgSend(v16, "setLength:", 0);

      v23 = -5;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      objc_msgSend(v17, "appendBytes:length:", &v23, 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
      objc_msgSend(v18, "appendData:", v7);

      -[HIDAppleSiriRemoteDevice handleTouchData](self, "handleTouchData");
      break;
    case 253:
      if (objc_msgSend(v6, "length") == (id)1)
      {
        objc_msgSend(v7, "getBytes:length:", &self->_proximityData, 1);
        -[HIDAppleSiriRemoteDevice handleProximityData](self, "handleProximityData");
      }
      break;
    case 254:
      v19 = (char *)objc_msgSend(v6, "length") + 1;
      __chkstk_darwin();
      v21 = &v22[-v20];
      bzero(&v22[-v20], (size_t)v19);
      *v21 = -32;
      objc_msgSend(v7, "getBytes:length:", v21 + 1, objc_msgSend(v7, "length"));
      -[HIDAppleSiriRemoteDevice handleDeviceManagementData:dataLength:](self, "handleDeviceManagementData:dataLength:", v21, v19);
      break;
    default:
      if (v4 == 96)
      {
        v11 = (char *)objc_msgSend(v6, "length") + 1;
        __chkstk_darwin();
        v13 = &v22[-v12];
        bzero(&v22[-v12], (size_t)v11);
        *v13 = 96;
        objc_msgSend(v7, "getBytes:length:", v13 + 1, objc_msgSend(v7, "length"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
        objc_msgSend(v14, "setLength:", 0);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
        objc_msgSend(v15, "appendBytes:length:", v13, v11);

        -[HIDAppleSiriRemoteDevice handleTouchData](self, "handleTouchData");
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006A508();
      }
      break;
  }

}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7
{
  return -[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:](self, "setReport:reportLength:reportID:reportType:keyholeID:error:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, 0);
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v15;
  int v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSErrorUserInfoKey v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  int v37;

  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v15 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
    v28 = 1024;
    v29 = v9;
    v30 = 1024;
    v31 = v11;
    v32 = 1024;
    v33 = v10;
    v34 = 2048;
    v35 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld", buf, 0x28u);
  }
  v16 = -536870206;
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    v17 = a4 > 0 && a3 == 0;
    if (!v17 && v11 <= 0xFF)
    {
      if ((_DWORD)v9 == 241 && -[HIDAppleSiriRemoteDevice latency](self, "latency") == 199)
      {
        v16 = -536870173;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0));
        if (byte_1000C9170)
          kdebug_trace(730595452, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), v11, v9, 0);
        v16 = -[HIDBluetoothDevice setReportData:reportID:reportType:error:](self, "setReportData:reportID:reportType:error:", v18, v9, v10, a8);
        if (byte_1000C9170)
          kdebug_trace(730595456, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), v11, v9, 0);

        if (!v16)
        {
          v22 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
            v28 = 1024;
            v29 = v9;
            v30 = 1024;
            v31 = v11;
            v32 = 1024;
            v33 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s keyholeID 0x%02x reportID 0x%02x reportType %d success", buf, 0x1Eu);
          }
          return 0;
        }
      }
    }
  }
  else
  {
    v16 = -536870185;
  }
  v19 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316418;
    v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
    v28 = 1024;
    v29 = v9;
    v30 = 1024;
    v31 = v11;
    v32 = 1024;
    v33 = v10;
    v34 = 2048;
    v35 = a4;
    v36 = 1024;
    v37 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld failure 0x%08X", buf, 0x2Eu);
    if (!a8)
      return v16;
  }
  else if (!a8)
  {
    return v16;
  }
  if (!*a8)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld"), v9, v11, v10, a4));
    v24 = NSLocalizedDescriptionKey;
    v25 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, v16, v21));

  }
  return v16;
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v13;
  int v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  int64_t v39;
  NSObject *v40;
  NSObject *v41;
  int64_t v43;
  int64_t v44;
  int64_t v45;
  id v46;
  id v47;
  _BYTE v48[2];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  int v60;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v13 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    if (a4)
      v15 = *a4;
    else
      v15 = 0;
    *(_DWORD *)buf = 136316162;
    v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
    v51 = 1024;
    v52 = v7;
    v53 = 1024;
    v54 = v9;
    v55 = 1024;
    v56 = v8;
    v57 = 2048;
    v58 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s keyholeID 0x%02x reportID 0x%02x reportType %d length %ld", buf, 0x28u);
  }
  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    v14 = -536870206;
    if (a3 && a4)
    {
      if (*a4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = -536870168;
      }
      else if (*a4 < 1)
      {
        v14 = -536870169;
      }
      else if ((_DWORD)v7 == 241 && -[HIDAppleSiriRemoteDevice latency](self, "latency") == 199)
      {
        v14 = -536870173;
      }
      else
      {
        if (byte_1000C9170)
          kdebug_trace(730595444, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), v9, v7, 1);
        v48[0] = -16;
        v48[1] = v9;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v48, 2, 0));
        v17 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        {
          v43 = *a4;
          *(_DWORD *)buf = 136316162;
          v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
          v51 = 1024;
          v52 = v7;
          v53 = 1024;
          v54 = v9;
          v55 = 1024;
          v56 = v8;
          v57 = 2048;
          v58 = v43;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s PART 1 SET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld", buf, 0x28u);
        }
        v14 = -[HIDBluetoothDevice setReportData:reportID:reportType:error:](self, "setReportData:reportID:reportType:error:", v16, 240, v8, 0);
        if (byte_1000C9170)
          kdebug_trace(730595448, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), v9, v7, 1);
        v18 = qword_1000C9178;
        if (v14)
        {
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v19 = *a4;
            *(_DWORD *)buf = 136316418;
            v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
            v51 = 1024;
            v52 = v7;
            v53 = 1024;
            v54 = v9;
            v55 = 1024;
            v56 = v8;
            v57 = 2048;
            v58 = v19;
            v59 = 1024;
            v60 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s PART 1 SET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld failure 0x%08X", buf, 0x2Eu);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            sub_10006A64C(v18, v20, v21, v22, v23, v24, v25, v26);
          if (byte_1000C9170)
            kdebug_trace(730595444, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), v9, v7, 0);
          v27 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          {
            v44 = *a4;
            *(_DWORD *)buf = 136316162;
            v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
            v51 = 1024;
            v52 = v7;
            v53 = 1024;
            v54 = v9;
            v55 = 1024;
            v56 = v8;
            v57 = 2048;
            v58 = v44;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s PART 2 GET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld", buf, 0x28u);
          }
          v47 = 0;
          v14 = -[HIDBluetoothDevice getReportData:reportID:reportType:error:](self, "getReportData:reportID:reportType:error:", &v47, v7, v8, 0);
          v46 = v47;
          if (byte_1000C9170)
            kdebug_trace(730595448, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), v9, v7, 0);
          v28 = qword_1000C9178;
          if (v14)
          {
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            {
              v45 = *a4;
              *(_DWORD *)buf = 136316418;
              v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
              v51 = 1024;
              v52 = v7;
              v53 = 1024;
              v54 = v9;
              v55 = 1024;
              v56 = v8;
              v57 = 2048;
              v58 = v45;
              v59 = 1024;
              v60 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s PART 2 GET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld failure 0x%08X", buf, 0x2Eu);
            }
            v29 = v46;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              sub_10006A5DC(v28, v30, v31, v32, v33, v34, v35, v36);
            v29 = v46;
            objc_msgSend(v46, "getBytes:length:", a3, *a4);
            if (*a3 == (_DWORD)v9)
            {
              v37 = *a4;
              v38 = objc_msgSend(v46, "length");
              v14 = 0;
              if (v37 >= (unint64_t)v38)
                v39 = (int64_t)v38;
              else
                v39 = v37;
              *a4 = v39;
            }
            else
            {
              v40 = qword_1000C9178;
              if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
                sub_10006A568((uint64_t)a3, v9, v40);
              v14 = -536870160;
            }
          }

        }
      }
    }
  }
  else
  {
    v14 = -536870185;
  }
  if ((_DWORD)v9 == 219 && (_DWORD)v7 == 241)
  {
    v41 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice gotDeviceExtendedInfoReport](self, "gotDeviceExtendedInfoReport"));
    dispatch_semaphore_signal(v41);

    if (byte_1000C9170)
      kdebug_trace(730595432, -[HIDAppleSiriRemoteDevice instanceID](self, "instanceID"), 0, 0, 0);
  }
  return v14;
}

- (void)extractButtonDataFromReport:(char *)a3 buttonIndex:(unsigned __int8)a4
{
  -[HIDAppleSiriRemoteDevice setButtonData:](self, "setButtonData:", a3[a4] & 0xBF);
  -[HIDAppleSiriRemoteDevice handleButtonData](self, "handleButtonData");
}

- (void)demultiplexInputReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5
{
  void *v8;
  void *v9;
  unsigned int v10;
  char *v11;
  id v12;
  id v13;
  id v14;

  -[HIDAppleSiriRemoteDevice setButtonData:](self, "setButtonData:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice touchData](self, "touchData"));
  objc_msgSend(v8, "setLength:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice inertialData](self, "inertialData"));
  objc_msgSend(v9, "setLength:", 0);

  if (a3)
  {
    v10 = a3[1];
    switch(v10 >> 5)
    {
      case 0u:
        goto LABEL_4;
      case 1u:
        -[HIDAppleSiriRemoteDevice setProximityData:](self, "setProximityData:", (a3[2] >> 6) & 1);
        -[HIDAppleSiriRemoteDevice handleProximityData](self, "handleProximityData");
LABEL_4:
        -[HIDAppleSiriRemoteDevice extractButtonDataFromReport:buttonIndex:](self, "extractButtonDataFromReport:buttonIndex:", a3, 2);
        if ((v10 & 0x10) == 0 || ((v10 >> 2) & 3) == 0)
          __asm { BR              X10 }
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006A6BC();
        return;
      case 6u:
        if (a4 < 3)
          return;
        v12 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3 + 2, a4 - 2));
        -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:](self, "handleInputReportDataV1:reportID:", v12, 224, v12);
        goto LABEL_18;
      case 7u:
        if (a4 == 5)
        {
          if (-[HIDAppleSiriRemoteDevice productID](self, "productID") != 621)
            return;
          -[HIDAppleSiriRemoteDevice extractButtonDataFromReport:buttonIndex:](self, "extractButtonDataFromReport:buttonIndex:", a3, 2);
          v11 = a3 + 4;
        }
        else
        {
          if (a4 != 4 || -[HIDAppleSiriRemoteDevice productID](self, "productID") != 614)
            return;
          -[HIDAppleSiriRemoteDevice extractButtonDataFromReport:buttonIndex:](self, "extractButtonDataFromReport:buttonIndex:", a3, 2);
          v11 = a3 + 3;
        }
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 1));
        -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:](self, "handleInputReportDataV1:reportID:", v14, 96, v14);
LABEL_18:

        break;
      default:
        return;
    }
  }
}

- (void)logHwFwVersions
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  if (-[HIDBluetoothDevice state](self, "state") <= 2)
  {
    location = 0;
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 5000000000);
    v4 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000101F4;
    block[3] = &unk_1000AD208;
    objc_copyWeak(&v6, &location);
    block[4] = self;
    dispatch_after(v3, v4, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)doapAudioWillStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  NSErrorUserInfoKey v13;
  void *v14;

  v4 = a3;
  if (-[HIDBluetoothDevice state](self, "state") < 3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v8 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010548;
    v9[3] = &unk_1000AD310;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Apple Siri Remote stopped (disconnected)")));
    v13 = NSLocalizedDescriptionKey;
    v14 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870185, v6));

    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }

}

- (void)waitForSiriAudioToStop:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  double v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  HIDAppleSiriRemoteDevice *v33;
  id v34;
  HIDAppleSiriRemoteDevice *v35;
  id v36;
  NSObject *v37;
  _QWORD v38[4];
  void (**v39)(id, void *);
  id v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  _BYTE buf[24];
  NSErrorUserInfoKey v44;
  void *v45;

  v4 = (void (**)(id, void *))a3;
  if (-[HIDBluetoothDevice state](self, "state") >= 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Apple Siri Remote stopped (disconnected)")));
    v44 = NSLocalizedDescriptionKey;
    v45 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870185, v6));

    v4[2](v4, v7);
    v8 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);

    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
  objc_msgSend(v9, "timeIntervalSinceNow");
  v11 = fabs(v10);

  if (v11 >= 0.105)
  {
    v25 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
      objc_msgSend(v27, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = fabs(v28) * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Have not received audio data for %f ms. Stop Siri session.", buf, 0xCu);

    }
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;

    v16 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
    v17 = dispatch_time(0, 1000000 * vcvtpd_s64_f64((v15 + 0.105) * 1000.0));
    v18 = dispatch_semaphore_wait(v16, v17);

    v19 = qword_1000C9178;
    v20 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
        objc_msgSend(v22, "timeIntervalSinceNow");
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = fabs(v23) * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received Siri audio data %f ms ago.", buf, 0xCu);

      }
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v24 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100010FE0;
      v38[3] = &unk_1000AD310;
      objc_copyWeak(&v40, (id *)buf);
      v39 = v4;
      dispatch_async(v24, v38);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
      goto LABEL_18;
    }
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received empty audio input report. Stop Siri session.", buf, 2u);
    }
LABEL_17:
    v4[2](v4, 0);
    v35 = self;
    objc_sync_enter(v35);
    -[HIDAppleSiriRemoteDevice setDoapAudioStop:](v35, "setDoapAudioStop:", 0);
    v36 = objc_alloc_init((Class)NSMutableArray);
    -[HIDAppleSiriRemoteDevice setAudioBuffer:](v35, "setAudioBuffer:", v36);

    objc_sync_exit(v35);
    v37 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](v35, "doapAudioStart"));
    dispatch_semaphore_signal(v37);

    goto LABEL_18;
  }
  v29 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006A7FC(v29);
  v41 = NSLocalizedDescriptionKey;
  v42 = CFSTR("No doapAudioStop semaphore");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870165, v30));

  v4[2](v4, v31);
  v32 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v32);

  v33 = self;
  objc_sync_enter(v33);
  v34 = objc_alloc_init((Class)NSMutableArray);
  -[HIDAppleSiriRemoteDevice setAudioBuffer:](v33, "setAudioBuffer:", v34);

  objc_sync_exit(v33);
LABEL_18:

}

- (void)doapAudioDidStop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  NSErrorUserInfoKey v14;
  void *v15;

  v4 = a3;
  if (-[HIDBluetoothDevice state](self, "state") < 3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v9 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100011200;
    v10[3] = &unk_1000AD310;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Apple Siri Remote stopped (disconnected)")));
    v14 = NSLocalizedDescriptionKey;
    v15 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870185, v6));

    (*((void (**)(id, void *))v4 + 2))(v4, v7);
    v8 = objc_claimAutoreleasedReturnValue(-[HIDAppleSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);

  }
}

- (int)latency
{
  return self->_latency;
}

- (void)setLatency:(int)a3
{
  self->_latency = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSMutableArray)cachedButtonsAndTimestamps
{
  return self->_cachedButtonsAndTimestamps;
}

- (void)setCachedButtonsAndTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_cachedButtonsAndTimestamps, a3);
}

- (unsigned)buttonData
{
  return self->_buttonData;
}

- (void)setButtonData:(unsigned __int16)a3
{
  self->_buttonData = a3;
}

- (unsigned)proximityData
{
  return self->_proximityData;
}

- (void)setProximityData:(unsigned __int8)a3
{
  self->_proximityData = a3;
}

- (NSMutableSet)pathIDs
{
  return self->_pathIDs;
}

- (NSMutableData)touchData
{
  return self->_touchData;
}

- (NSMutableData)inertialData
{
  return self->_inertialData;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (unint64_t)inputReportTimestamp
{
  return self->_inputReportTimestamp;
}

- (void)setInputReportTimestamp:(unint64_t)a3
{
  self->_inputReportTimestamp = a3;
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
  objc_storeStrong((id *)&self->_doapAudioRelay, a3);
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (BOOL)firstButton
{
  return self->_firstButton;
}

- (void)setFirstButton:(BOOL)a3
{
  self->_firstButton = a3;
}

- (int)connectedStandbyToken
{
  return self->_connectedStandbyToken;
}

- (void)setConnectedStandbyToken:(int)a3
{
  self->_connectedStandbyToken = a3;
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastAudioDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDoapAudioStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDoapAudioStop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAudioBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_group)groupInit
{
  return self->_groupInit;
}

- (OS_dispatch_group)groupStart
{
  return self->_groupStart;
}

- (OS_dispatch_group)groupDeviceManagement
{
  return self->_groupDeviceManagement;
}

- (OS_dispatch_group)groupTouch
{
  return self->_groupTouch;
}

- (OS_dispatch_group)groupInertial
{
  return self->_groupInertial;
}

- (OS_dispatch_group)groupProximity
{
  return self->_groupProximity;
}

- (OS_dispatch_semaphore)sentHostReadyReport
{
  return self->_sentHostReadyReport;
}

- (OS_dispatch_semaphore)gotDeviceExtendedInfoReport
{
  return self->_gotDeviceExtendedInfoReport;
}

- (id)deviceManagement
{
  return self->_deviceManagement;
}

- (void)setDeviceManagement:(id)a3
{
  objc_storeStrong(&self->_deviceManagement, a3);
}

- (id)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
  objc_storeStrong(&self->_touch, a3);
}

- (id)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong(&self->_buttons, a3);
}

- (id)inertial
{
  return self->_inertial;
}

- (void)setInertial:(id)a3
{
  objc_storeStrong(&self->_inertial, a3);
}

- (id)infrared
{
  return self->_infrared;
}

- (void)setInfrared:(id)a3
{
  objc_storeStrong(&self->_infrared, a3);
}

- (id)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
  objc_storeStrong(&self->_audio, a3);
}

- (id)radio
{
  return self->_radio;
}

- (void)setRadio:(id)a3
{
  objc_storeStrong(&self->_radio, a3);
}

- (id)proximity
{
  return self->_proximity;
}

- (void)setProximity:(id)a3
{
  objc_storeStrong(&self->_proximity, a3);
}

- (unsigned)amdNotification
{
  return self->_amdNotification;
}

- (void)setAmdNotification:(unsigned int)a3
{
  self->_amdNotification = a3;
}

- (unsigned)deviceMgtNotification
{
  return self->_deviceMgtNotification;
}

- (void)setDeviceMgtNotification:(unsigned int)a3
{
  self->_deviceMgtNotification = a3;
}

- (unsigned)buttonInterestNotification
{
  return self->_buttonInterestNotification;
}

- (void)setButtonInterestNotification:(unsigned int)a3
{
  self->_buttonInterestNotification = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proximity, 0);
  objc_storeStrong(&self->_radio, 0);
  objc_storeStrong(&self->_audio, 0);
  objc_storeStrong(&self->_infrared, 0);
  objc_storeStrong(&self->_inertial, 0);
  objc_storeStrong(&self->_buttons, 0);
  objc_storeStrong(&self->_touch, 0);
  objc_storeStrong(&self->_deviceManagement, 0);
  objc_storeStrong((id *)&self->_gotDeviceExtendedInfoReport, 0);
  objc_storeStrong((id *)&self->_sentHostReadyReport, 0);
  objc_storeStrong((id *)&self->_groupProximity, 0);
  objc_storeStrong((id *)&self->_groupInertial, 0);
  objc_storeStrong((id *)&self->_groupTouch, 0);
  objc_storeStrong((id *)&self->_groupDeviceManagement, 0);
  objc_storeStrong((id *)&self->_groupStart, 0);
  objc_storeStrong((id *)&self->_groupInit, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_doapAudioStop, 0);
  objc_storeStrong((id *)&self->_doapAudioStart, 0);
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_inertialData, 0);
  objc_storeStrong((id *)&self->_touchData, 0);
  objc_storeStrong((id *)&self->_pathIDs, 0);
  objc_storeStrong((id *)&self->_cachedButtonsAndTimestamps, 0);
}

@end
