@implementation BTSmartRoutingDaemon

+ (id)sharedBTSmartRoutingDaemon
{
  if (qword_1002125A8 != -1)
    dispatch_once(&qword_1002125A8, &stru_1001E2C68);
  return (id)qword_1002125A0;
}

- (BTSmartRoutingDaemon)init
{
  BTSmartRoutingDaemon *v2;
  BTSmartRoutingDaemon *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueueAVSys;
  uint64_t v12;
  NSString *myModel;
  BTSmartRoutingDaemon *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BTSmartRoutingDaemon;
  v2 = -[BTSmartRoutingDaemon init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_activityLevel = 0;
    v2->_activityLevelDeltaInSeconds = 25;
    v2->_activityLevelNotifyToken = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("BTSmartRouting", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("BTSmartRoutingAVSys", v9);
    dispatchQueueAVSys = v3->_dispatchQueueAVSys;
    v3->_dispatchQueueAVSys = (OS_dispatch_queue *)v10;

    v3->_forcedDisconnectionRSSI = -60;
    v3->_lowBatteryResetNotifyToken = -1;
    v12 = GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
    myModel = v3->_myModel;
    v3->_myModel = (NSString *)v12;

    v3->_ownershipToken = -1;
    v3->_prefsChangedNotifyToken = -1;
    v3->_prefSmartRoutingForcedDisconnectionStartSeconds = 1.0;
    v3->_ringerStateToken = -1;
    v3->_splitterStateOnToken = -1;
    v3->_smartRoutingDisconnectToken = -1;
    v3->_cbDaemonNotifyToken = -1;
    v3->_tipiElectionPhase1 = 0;
    v14 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  OS_dispatch_queue *dispatchQueue;
  id v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10001E9DC;
  v12 = sub_10001E9EC;
  v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E9F4;
  block[3] = &unk_1001E2C90;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)_descriptionWithLevel:(int)a3
{
  id v4;
  unint64_t activityLevel;
  const char *v6;
  uint64_t score;
  const char *v8;
  const char *v9;
  const char *v10;
  int sleepWakeState;
  const char *v12;
  _BOOL4 isBTRoute;
  _BOOL4 isSpeakerRoute;
  _BOOL4 isBuiltInReceiverRoute;
  _BOOL4 pairedDeviceSupportsSmartRouting;
  _BOOL4 isHSA2Account;
  _BOOL4 ringerState;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  BTBannerUISession *v29;
  BTBannerUISession *v30;
  id *v31;
  BTBannerUISession *v32;
  BTBannerUISession *v33;
  id *v34;
  CUUserNotificationSession *v35;
  CUUserNotificationSession *v36;
  id *v37;
  CUUserNotificationSession *v38;
  CUUserNotificationSession *v39;
  id *v40;
  id *v41;
  id *v42;
  NSMutableDictionary *connectedDevices;
  id *v44;
  id *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id *v52;
  id *v53;
  id *v54;
  NSMutableDictionary *nearbyInfoDevices;
  id *v56;
  id *v57;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  id *v59;
  NSMutableDictionary *wxDevices;
  id *v61;
  id *v62;
  CFAbsoluteTime Current;
  NSMutableDictionary *lowBatteryDeviceMap;
  id *v65;
  id v66;
  void *v68;
  _BOOL4 activityLevelMediaPlaying;
  unint64_t prefSmartRoutingBlockHijackWindowinSeconds;
  int64_t totalCloudDeviceCount;
  id *location;
  const char *v73;
  int v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  NSString *v79;
  id v80;
  _QWORD v81[6];
  id v82;
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  id v87;
  id v88;
  _QWORD v89[5];
  id v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  id v98;
  _QWORD v99[5];
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id obj;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _BYTE v113[128];

  v107 = 0;
  v108 = &v107;
  v109 = 0x3032000000;
  v110 = sub_10001E9DC;
  v111 = sub_10001E9EC;
  v112 = 0;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v79 = self->_myAddress;
  obj = (id)v108[5];
  activityLevel = (char)self->_activityLevel;
  if (activityLevel > 0xE)
    v6 = "?";
  else
    v6 = off_1001E3B30[activityLevel];
  score = self->_score;
  if (score > 0xF)
    v8 = "?";
  else
    v8 = off_1001E3C88[score];
  if (self->_prefSmartRoutingEnabledPhase3)
    v9 = "yes";
  else
    v9 = "no";
  if (self->_sleeping)
    v10 = "yes";
  else
    v10 = "no";
  sleepWakeState = self->_sleepWakeState;
  v68 = v4;
  location = (id *)(v108 + 5);
  v77 = v8;
  v78 = v6;
  v75 = v10;
  v76 = v9;
  if (sleepWakeState > 29)
  {
    switch(sleepWakeState)
    {
      case 30:
        v12 = "FullWake";
        goto LABEL_27;
      case 40:
        v12 = "Restart";
        goto LABEL_27;
      case 50:
        v12 = "PowerOff";
        goto LABEL_27;
    }
  }
  else
  {
    switch(sleepWakeState)
    {
      case 0:
        v12 = "Unknown";
        goto LABEL_27;
      case 10:
        v12 = "Sleep";
        goto LABEL_27;
      case 20:
        v12 = "DarkWake";
        goto LABEL_27;
    }
  }
  v12 = "?";
LABEL_27:
  v73 = v12;
  v74 = -[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount");
  activityLevelMediaPlaying = self->_activityLevelMediaPlaying;
  isBTRoute = self->_isBTRoute;
  isSpeakerRoute = self->_isSpeakerRoute;
  isBuiltInReceiverRoute = self->_isBuiltInReceiverRoute;
  pairedDeviceSupportsSmartRouting = self->_pairedDeviceSupportsSmartRouting;
  isHSA2Account = self->_isHSA2Account;
  ringerState = self->_ringerState;
  prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
  totalCloudDeviceCount = self->_totalCloudDeviceCount;
  v19 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
  v20 = (void *)v19;
  if (ringerState)
    v21 = "yes";
  else
    v21 = "no";
  if (isHSA2Account)
    v22 = "yes";
  else
    v22 = "no";
  if (pairedDeviceSupportsSmartRouting)
    v23 = "yes";
  else
    v23 = "no";
  if (isBuiltInReceiverRoute)
    v24 = "yes";
  else
    v24 = "no";
  if (isSpeakerRoute)
    v25 = "yes";
  else
    v25 = "no";
  if (isBTRoute)
    v26 = "yes";
  else
    v26 = "no";
  if (activityLevelMediaPlaying)
    v27 = "yes";
  else
    v27 = "no";
  if (v74 <= 0)
    v28 = "no";
  else
    v28 = "yes";
  NSAppendPrintF_safe(&obj, "-- BTSmartRouting: Addr %@ AcLv %s, Score %s, Phase3 %s, Sleeping %s (%s), Call %s StreamPlayback %s isRouteBT %s isRouteSpeaker %s isRouteInBandReceiver %s PairedDeviceSRFlagFound %s isHSA2Enabled %s TotaliCloudDevicesFound %d RingerState %s BlockHijackWindowinSeconds %llu isFirstConnectionAfterSREnable %@ last SR active Date %@--\n", v79, v78, v77, v76, v75, v73, v28, v27, v26, v25, v24, v23, v22, totalCloudDeviceCount, v21,
    prefSmartRoutingBlockHijackWindowinSeconds,
    v19,
    CFSTR("n/a"));
  objc_storeStrong(location, obj);

  v29 = self->_uiLowBatteryBanner;
  v30 = v29;
  if (v29)
  {
    v31 = (id *)(v108 + 5);
    v105 = (id)v108[5];
    NSAppendPrintF(&v105, "Banner: LowBattery: %@\n", v29);
    objc_storeStrong(v31, v105);
  }

  v32 = self->_uiSmartRoutingBanner;
  v33 = v32;
  if (v32)
  {
    v34 = (id *)(v108 + 5);
    v104 = (id)v108[5];
    NSAppendPrintF(&v104, "Banner: Routing: %@\n", v32);
    objc_storeStrong(v34, v104);
  }

  v35 = self->_uiNoteSessionLowBattery;
  v36 = v35;
  if (v35)
  {
    v37 = (id *)(v108 + 5);
    v103 = (id)v108[5];
    NSAppendPrintF(&v103, "UINote: LowBattery: %@\n", v35);
    objc_storeStrong(v37, v103);
  }

  v38 = self->_uiNoteSessionSmartRouting;
  v39 = v38;
  if (v38)
  {
    v40 = (id *)(v108 + 5);
    v102 = (id)v108[5];
    NSAppendPrintF(&v102, "UINote: Routing: %@\n", v38);
    objc_storeStrong(v40, v102);
  }

  v41 = (id *)(v108 + 5);
  v101 = (id)v108[5];
  NSAppendPrintF(&v101, "\n");
  objc_storeStrong(v41, v101);
  v42 = (id *)(v108 + 5);
  v100 = (id)v108[5];
  NSAppendPrintF(&v100, "Connected: %d, %@\n", -[NSMutableDictionary count](self->_connectedDevices, "count"), self->_connectedDiscovery);
  objc_storeStrong(v42, v100);
  connectedDevices = self->_connectedDevices;
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_10001F2CC;
  v99[3] = &unk_1001E2CB8;
  v99[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v99);
  v44 = (id *)(v108 + 5);
  v98 = (id)v108[5];
  NSAppendPrintF(&v98, "\n");
  objc_storeStrong(v44, v98);
  v45 = (id *)(v108 + 5);
  v97 = (id)v108[5];
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  NSAppendPrintF(&v97, "Paired: %d, %@\n", objc_msgSend(v46, "count"), self->_pairedDiscovery);
  objc_storeStrong(v45, v97);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v94;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v94 != v49)
          objc_enumerationMutation(v47);
        v51 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v50);
        v52 = (id *)(v108 + 5);
        v92 = (id)v108[5];
        NSAppendPrintF(&v92, "    %@\n", v51);
        objc_storeStrong(v52, v92);
        v50 = (char *)v50 + 1;
      }
      while (v48 != v50);
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
    }
    while (v48);
  }

  v53 = (id *)(v108 + 5);
  v91 = (id)v108[5];
  NSAppendPrintF(&v91, "\n");
  objc_storeStrong(v53, v91);
  v54 = (id *)(v108 + 5);
  v90 = (id)v108[5];
  NSAppendPrintF(&v90, "NearbyInfo: %d, %@\n", -[NSMutableDictionary count](self->_nearbyInfoDevices, "count"), self->_nearbyInfoDiscovery);
  objc_storeStrong(v54, v90);
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_10001F318;
  v89[3] = &unk_1001E2CE0;
  v89[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v89);
  v56 = (id *)(v108 + 5);
  v88 = (id)v108[5];
  NSAppendPrintF(&v88, "\n");
  objc_storeStrong(v56, v88);
  v57 = (id *)(v108 + 5);
  v87 = (id)v108[5];
  NSAppendPrintF(&v87, "-- SmartRouting Devices: %d, --\n", -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"));
  objc_storeStrong(v57, v87);
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10001F37C;
  v86[3] = &unk_1001E2D08;
  v86[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v86);
  v59 = (id *)(v108 + 5);
  v85 = (id)v108[5];
  NSAppendPrintF(&v85, "Wx: %d, %@\n", -[NSMutableDictionary count](self->_wxDevices, "count"), self->_wxDiscovery);
  objc_storeStrong(v59, v85);
  wxDevices = self->_wxDevices;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_10001F6D8;
  v84[3] = &unk_1001E2CE0;
  v84[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", v84);
  v61 = (id *)(v108 + 5);
  v83 = (id)v108[5];
  NSAppendPrintF(&v83, "\n");
  objc_storeStrong(v61, v83);
  v62 = (id *)(v108 + 5);
  v82 = (id)v108[5];
  NSAppendPrintF(&v82, "-- BTLowBattery (devices %d) --\n", -[NSMutableDictionary count](self->_lowBatteryDeviceMap, "count"));
  objc_storeStrong(v62, v82);
  Current = CFAbsoluteTimeGetCurrent();
  lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_10001F73C;
  v81[3] = &unk_1001E2D30;
  *(CFAbsoluteTime *)&v81[5] = Current;
  v81[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lowBatteryDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v81);
  v65 = (id *)(v108 + 5);
  v80 = (id)v108[5];
  NSAppendPrintF(&v80, "\n");
  objc_storeStrong(v65, v80);
  v66 = (id)v108[5];

  _Block_object_dispose(&v107, 8);
  return v66;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F8D8;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  AADeviceManagerDaemon *v3;
  AADeviceManagerDaemon *aaDeviceManagerDaemon;
  OS_dispatch_queue *dispatchQueue;
  BTSmartRoutingSourceDevice *v6;
  BTSmartRoutingSourceDevice *sourceDevice;
  NSMutableDictionary *v8;
  NSMutableDictionary *srDiscoveredDeviceMap;
  OS_dispatch_queue *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *sigTermSource;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id DeviceClass;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *v26;
  OS_dispatch_queue *v27;
  OS_dispatch_queue *v28;
  OS_dispatch_queue *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD handler[5];

  self->_smartRoutingCapable = 1;
  v3 = (AADeviceManagerDaemon *)objc_claimAutoreleasedReturnValue(+[AADeviceManagerDaemon sharedAADeviceManagerDaemon](AADeviceManagerDaemon, "sharedAADeviceManagerDaemon"));
  aaDeviceManagerDaemon = self->_aaDeviceManagerDaemon;
  self->_aaDeviceManagerDaemon = v3;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _activate]", 30, "AADeviceManagerDaemon shared instance %@", self->_aaDeviceManagerDaemon);
  if (self->_lowBatteryResetNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001FE4C;
    handler[3] = &unk_1001E2398;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.lowBatteryReset", &self->_lowBatteryResetNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  if (!self->_sourceDevice)
  {
    v6 = objc_alloc_init(BTSmartRoutingSourceDevice);
    sourceDevice = self->_sourceDevice;
    self->_sourceDevice = v6;

  }
  if (!self->_srDiscoveredDeviceMap)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
    self->_srDiscoveredDeviceMap = v8;

  }
  -[BTSmartRoutingDaemon _statsEnsureStarted](self, "_statsEnsureStarted");
  if (self->_prefsChangedNotifyToken == -1)
  {
    v10 = self->_dispatchQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001FEBC;
    v38[3] = &unk_1001E2398;
    v38[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)v10, v38);
  }
  -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");
  if (!self->_sigTermSource)
  {
    v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_dispatchQueue);
    sigTermSource = self->_sigTermSource;
    self->_sigTermSource = v11;

    v13 = self->_sigTermSource;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001FF2C;
    v37[3] = &unk_1001E20E8;
    v37[4] = self;
    dispatch_source_set_event_handler(v13, v37);
    dispatch_activate((dispatch_object_t)self->_sigTermSource);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
  self->_totalCloudDeviceCount = (int64_t)objc_msgSend(v14, "totalCloudDeviceCount");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_setTotalCountIDSDevices:", CFSTR("BTTotalIDSDeviceCountChanged"), 0);
  if (!self->_localDeviceAudioCatogory)
    -[BTSmartRoutingDaemon _updateLocalAudioCategory:](self, "_updateLocalAudioCategory:", &off_1001F4500);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "_handleTriangleRecoveryInitiated:", CFSTR("com.apple.BTServer.TriangleRecoveryInitiated"), 0);

  DeviceClass = (id)GestaltGetDeviceClass(v17, v18);
  if ((_DWORD)DeviceClass == 1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", self, "_handlePairedWatchStatusDidChange", NRPairedDeviceRegistryDeviceDidUnpairNotification, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "addObserver:selector:name:object:", self, "_handlePairedWatchStatusDidChange", NRPairedDeviceRegistryDeviceDidPairNotification, 0);

    -[BTSmartRoutingDaemon _handlePairedWatchStatusDidChange](self, "_handlePairedWatchStatusDidChange");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", self, "_checkIfPairedCompanionDeviceSupportsSmartRouting", NRPairedDeviceRegistryDeviceDidBecomeActive, 0);

    DeviceClass = -[BTSmartRoutingDaemon _checkIfPairedCompanionDeviceSupportsSmartRouting](self, "_checkIfPairedCompanionDeviceSupportsSmartRouting");
  }
  if (GestaltGetDeviceClass(DeviceClass, v20) == 6)
    self->_pairedCompanionDeviceSupportsSmartRouting = 1;
  v24 = self->_dispatchQueue;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001FF34;
  v36[3] = &unk_1001E2398;
  v36[4] = self;
  notify_register_dispatch("com.apple.bluetooth.daemonStarted", &self->_cbDaemonNotifyToken, (dispatch_queue_t)v24, v36);
  v25 = self->_dispatchQueue;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100020080;
  v35[3] = &unk_1001E2398;
  v35[4] = self;
  notify_register_dispatch("com.apple.bluetooth.SmartRoutingDisconnectReason", &self->_smartRoutingDisconnectToken, (dispatch_queue_t)v25, v35);
  v26 = self->_dispatchQueue;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000204B4;
  v34[3] = &unk_1001E2398;
  v34[4] = self;
  notify_register_dispatch("com.apple.BluetoothServices.AudioRoutingOwnershipTaken", &self->_ownershipToken, (dispatch_queue_t)v26, v34);
  if (self->_ringerStateToken == -1)
  {
    v27 = self->_dispatchQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100020854;
    v33[3] = &unk_1001E2398;
    v33[4] = self;
    notify_register_dispatch("com.apple.springboard.ringerstate", &self->_ringerStateToken, (dispatch_queue_t)v27, v33);
  }
  if (self->_splitterStateOnToken == -1)
  {
    v28 = self->_dispatchQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002091C;
    v32[3] = &unk_1001E2398;
    v32[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &self->_splitterStateOnToken, (dispatch_queue_t)v28, v32);
  }
  v29 = self->_dispatchQueue;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000209E4;
  v31[3] = &unk_1001E2398;
  v31[4] = self;
  notify_register_dispatch("com.apple.bluetooth.magnet", &self->_magnetStateToken, (dispatch_queue_t)v29, v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Zoom"), CFSTR("Webex"), CFSTR("google.Tachyon"), CFSTR("google.meetings"), 0));
  -[BTSmartRoutingSourceDevice setConferencingCallSets:](self->_sourceDevice, "setConferencingCallSets:", v30);

}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020B08;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  BOOL v11;
  OS_dispatch_queue *dispatchQueue;
  id *v13;
  _QWORD *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a4;
  v7 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("_input"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (!v10)
    goto LABEL_4;
  if (!objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("lbReset")))
  {
    dispatchQueue = self->_dispatchQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002103C;
    v18[3] = &unk_1001E1FF8;
    v18[4] = self;
    v13 = &v19;
    v19 = v6;
    v14 = v18;
LABEL_7:
    dispatch_async((dispatch_queue_t)dispatchQueue, v14);

    v11 = 1;
    goto LABEL_8;
  }
  if (!objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("lbSave")))
  {
    dispatchQueue = self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000210C4;
    v16[3] = &unk_1001E1FF8;
    v16[4] = self;
    v13 = &v17;
    v17 = v6;
    v14 = v16;
    goto LABEL_7;
  }
LABEL_4:
  v11 = 0;
LABEL_8:

  return v11;
}

- (id)_myBluetoothAddressString
{
  NSString *myAddress;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;

  myAddress = self->_myAddress;
  if (!myAddress
    || (id)-[NSString length](myAddress, "length") != (id)17
    || !strcmp(-[NSString UTF8String](self->_myAddress, "UTF8String"), "00:00:00:00:00:00"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBController controllerInfoAndReturnError:](CBController, "controllerInfoAndReturnError:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hardwareAddressData"));
    v6 = CUPrintNSDataAddress();
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_myAddress;
    self->_myAddress = v7;

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _myBluetoothAddressString]", 30, "myBluetoothAddressString is %@", self->_myAddress);
    }
  }
  return self->_myAddress;
}

- (void)_prefsChanged
{
  double v3;
  BOOL v4;
  double v5;
  double prefLowBatteryDelaySeconds;
  uint64_t Int64;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v12;
  const char *v13;
  double Double;
  double prefLowBatteryForceLevel;
  double v16;
  BOOL v17;
  double v18;
  double prefLowBatterySaveSeconds;
  double v20;
  BOOL v21;
  double v22;
  double prefLowBatteryStaleSeconds;
  uint64_t v24;
  BOOL v25;
  _BOOL4 v26;
  const char *v27;
  const char *v28;
  double v29;
  double v30;
  double secondsBetweenConnectBanner;
  int v32;
  _BOOL4 v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 smartRoutingCapable;
  uint64_t v39;
  int v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  BOOL v53;
  _BOOL4 v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  BOOL v58;
  _BOOL4 v59;
  const char *v60;
  const char *v61;
  unint64_t v62;
  double v63;
  unint64_t prefSmartRoutingBlockHijackWindowinSeconds;
  uint64_t v65;
  BOOL v66;
  _BOOL4 v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  BOOL v71;
  _BOOL4 v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  BOOL v76;
  _BOOL4 v77;
  const char *v78;
  const char *v79;
  double v80;
  double prefSmartRoutingForcedDisconnectionStartSeconds;
  double v82;
  uint64_t v83;
  uint64_t v87;
  uint64_t forcedDisconnectionRSSI;
  uint64_t v89;
  BOOL v90;
  _BOOL4 v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  BOOL v95;
  _BOOL4 v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  BOOL v100;
  _BOOL4 v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  BOOL v105;
  _BOOL4 v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  BOOL v110;
  _BOOL4 v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  BOOL v115;
  _BOOL4 v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  BOOL v120;
  _BOOL4 v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  BOOL v125;
  _BOOL4 v126;
  const char *v127;
  const char *v128;
  int v129;
  int prefSmartRoutingPreemptiveConnectedBanner;
  _BOOL4 v131;
  const char *v132;
  const char *v133;
  _BOOL4 v134;
  const char *v135;
  const char *v136;
  _BOOL4 v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  BOOL v141;
  _BOOL4 v142;
  const char *v143;
  const char *v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t prefSmartRoutingWatchTriangleMagnet;
  double v148;
  double v149;
  double prefConnectionDelaySeconds;
  int v151;
  _BOOL4 v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  BOOL v156;
  _BOOL4 v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  BOOL v161;
  _BOOL4 v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t prefSmartRoutingInUseBannerTimeout;
  int v168;
  const __CFString *v169;
  void *v170;

  v168 = 0;
  CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("lbDelaySeconds"), &v168);
  if (v168)
    v4 = 1;
  else
    v4 = v3 < 5.0;
  if (v4)
    v5 = 57600.0;
  else
    v5 = v3;
  prefLowBatteryDelaySeconds = self->_prefLowBatteryDelaySeconds;
  if (v5 != prefLowBatteryDelaySeconds)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_12;
        prefLowBatteryDelaySeconds = self->_prefLowBatteryDelaySeconds;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "LowBatteryDelaySeconds: %.0f -> %.0f", prefLowBatteryDelaySeconds, v5);
    }
LABEL_12:
    self->_prefLowBatteryDelaySeconds = v5;
  }
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("lbEnabled"), &v168);
  v9 = Int64 != 0;
  if (v168)
  {
    v10 = Int64;
    v9 = GestaltGetDeviceClass(Int64, v8) - 1 < 3 || v10 != 0;
  }
  if (self->_prefLowBatteryEnabled != v9)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v12 = "yes";
      if (v9)
        v13 = "no";
      else
        v13 = "yes";
      if (!v9)
        v12 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "LowBatteryEnabled: %s -> %s", v13, v12);
    }
    self->_prefLowBatteryEnabled = v9;
  }
  Double = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("lbForceLevel"), 0);
  prefLowBatteryForceLevel = self->_prefLowBatteryForceLevel;
  if (Double != prefLowBatteryForceLevel)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_36;
        prefLowBatteryForceLevel = self->_prefLowBatteryForceLevel;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "LowBatteryForceLevel: %f -> %f", prefLowBatteryForceLevel, Double);
    }
LABEL_36:
    self->_prefLowBatteryForceLevel = Double;
  }
  v16 = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("lbSaveSeconds"), &v168);
  if (v168)
    v17 = 1;
  else
    v17 = v16 < 5.0;
  if (v17)
    v18 = 1800.0;
  else
    v18 = v16;
  prefLowBatterySaveSeconds = self->_prefLowBatterySaveSeconds;
  if (v18 != prefLowBatterySaveSeconds)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_48;
        prefLowBatterySaveSeconds = self->_prefLowBatterySaveSeconds;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "LowBatterySaveSeconds: %.0f -> %.0f", prefLowBatterySaveSeconds, v18);
    }
LABEL_48:
    self->_prefLowBatterySaveSeconds = v18;
  }
  v20 = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("lbStaleSeconds"), &v168);
  if (v168)
    v21 = 1;
  else
    v21 = v20 < 5.0;
  if (v21)
    v22 = 57600.0;
  else
    v22 = v20;
  prefLowBatteryStaleSeconds = self->_prefLowBatteryStaleSeconds;
  if (v22 != prefLowBatteryStaleSeconds)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_60;
        prefLowBatteryStaleSeconds = self->_prefLowBatteryStaleSeconds;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "LowBatteryStaleSeconds: %.0f -> %.0f", prefLowBatteryStaleSeconds, v22);
    }
LABEL_60:
    self->_prefLowBatteryStaleSeconds = v22;
  }
  v24 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srConnectionAlert"), &v168);
  if (v168)
    v25 = 1;
  else
    v25 = v24 == 0;
  v26 = !v25;
  if (self->_prefSmartRoutingConnectionAlert != v26)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v27 = "yes";
      if (v26)
        v28 = "no";
      else
        v28 = "yes";
      if (!v26)
        v27 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingConnectionAlert: %s -> %s", v28, v27);
    }
    self->_prefSmartRoutingConnectionAlert = v26;
  }
  v29 = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("srSecondsBetweenBanner"), &v168);
  if (v168)
    v30 = 300.0;
  else
    v30 = v29;
  secondsBetweenConnectBanner = self->_secondsBetweenConnectBanner;
  if (v30 != secondsBetweenConnectBanner)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_86;
        secondsBetweenConnectBanner = self->_secondsBetweenConnectBanner;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingSecondsBetweenConnectedBanner: %.0f -> %.0f", secondsBetweenConnectBanner, v30);
    }
LABEL_86:
    self->_secondsBetweenConnectBanner = v30;
  }
  v32 = _os_feature_enabled_impl("AudioAccessoryFeatures", "SmartRoutingOnWatch");
  if (self->_prefSmartRoutingWatchAutomaticSwitching != v32)
  {
    v33 = v32;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v34 = "yes";
      if (v33)
        v35 = "no";
      else
        v35 = "yes";
      if (!v33)
        v34 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "WatchAutomaticSwitching: %s -> %s", v35, v34);
    }
    self->_prefSmartRoutingWatchAutomaticSwitching = v33;
  }
  v36 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srEnabledPhase3"), &v168);
  smartRoutingCapable = v36 != 0;
  if (v168)
  {
    v39 = v36;
    if (GestaltGetDeviceClass(v36, v37) != 7
      && (self->_totalCloudDeviceCount > 1 || self->_pairedDeviceContainsCompanionWatch)
      && self->_pairedDeviceSupportsSmartRouting)
    {
      smartRoutingCapable = self->_isHSA2Account || v39 != 0;
    }
  }
  v41 = dword_10020FA58;
  if (self->_prefSmartRoutingEnabledPhase3 != smartRoutingCapable)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v42 = "yes";
      if (smartRoutingCapable)
        v43 = "no";
      else
        v43 = "yes";
      if (!smartRoutingCapable)
        v42 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingEnabledPhase3: %s -> %s", v43, v42);
    }
    self->_prefSmartRoutingEnabledPhase3 = smartRoutingCapable;
    v41 = dword_10020FA58;
  }
  if (v41 <= 30 && (v41 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v44 = "no";
    if (smartRoutingCapable)
      v45 = "yes";
    else
      v45 = "no";
    if (self->_isHSA2Account)
      v46 = "yes";
    else
      v46 = "no";
    if (self->_pairedDeviceSupportsSmartRouting)
      v47 = "yes";
    else
      v47 = "no";
    if (self->_isFirstUpdated)
      v44 = "yes";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingEnabledPhase3 %s _totalCloudDeviceCount %d _isHSA2Account %s _pairedDeviceSupportsSmartRouting %s _isFirstUpdated %s", v45, self->_totalCloudDeviceCount, v46, v47, v44);
  }
  if ((self->_totalCloudDeviceCount > 1 || self->_pairedDeviceContainsCompanionWatch) && self->_isHSA2Account)
    smartRoutingCapable = 1;
  if (self->_smartRoutingCapable != smartRoutingCapable || !self->_isFirstUpdated)
  {
    self->_smartRoutingCapable = smartRoutingCapable;
    self->_isFirstUpdated = 1;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_143:
        v48 = "yes";
        if (!smartRoutingCapable)
          v48 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "Sending smartRoutingCapable %s", v48);
        goto LABEL_147;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        smartRoutingCapable = self->_smartRoutingCapable;
        goto LABEL_143;
      }
    }
LABEL_147:
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v169 = CFSTR("srCapable");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_smartRoutingCapable));
    v170 = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1));
    objc_msgSend(v49, "sendCloudKitMsg:args:", CFSTR("smartRoutingCapable"), v51);

  }
  v52 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srNoBackOffTimers"), &v168);
  if (v168)
    v53 = 1;
  else
    v53 = v52 == 0;
  v54 = !v53;
  if (self->_prefSmartRoutingNoBackOffTimers != v54)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v55 = "yes";
      if (v54)
        v56 = "no";
      else
        v56 = "yes";
      if (!v54)
        v55 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingNoBackOffTimers: %s -> %s", v56, v55);
    }
    self->_prefSmartRoutingNoBackOffTimers = v54;
  }
  v57 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srPipe"), &v168);
  if (v168)
    v58 = 0;
  else
    v58 = v57 == 0;
  v59 = !v58;
  if (self->_prefSmartRoutingPipeEnabled != v59)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v60 = "yes";
      if (v59)
        v61 = "no";
      else
        v61 = "yes";
      if (!v59)
        v60 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingPipeEnabled: %s -> %s", v61, v60);
    }
    self->_prefSmartRoutingPipeEnabled = v59;
  }
  v62 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srBlockHijackingWindowinSceconds"), &v168);
  if (v168)
    v63 = 90.0;
  else
    v63 = (double)v62;
  prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
  if (v63 != (double)prefSmartRoutingBlockHijackWindowinSeconds)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_190;
        prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingHijackBlocking: %d -> %d", prefSmartRoutingBlockHijackWindowinSeconds, LODWORD(v63));
    }
LABEL_190:
    self->_prefSmartRoutingBlockHijackWindowinSeconds = (unint64_t)v63;
  }
  v65 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srEnabledTipiElection"), &v168);
  if (v168)
    v66 = 1;
  else
    v66 = v65 == 0;
  v67 = !v66;
  if (self->_prefSmartRoutingTipiElection != v67)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v68 = "yes";
      if (v67)
        v69 = "no";
      else
        v69 = "yes";
      if (!v67)
        v68 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingTipiElection: %s -> %s", v69, v68);
    }
    self->_prefSmartRoutingTipiElection = v67;
  }
  v70 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srTiPiHealingv2"), &v168);
  if (v168)
    v71 = 0;
  else
    v71 = v70 == 0;
  v72 = !v71;
  if (self->_prefSmartRoutingTipiHealingv2 != v72)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v73 = "yes";
      if (v72)
        v74 = "no";
      else
        v74 = "yes";
      if (!v72)
        v73 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingTiPiHealing2.0: %s -> %s", v74, v73);
    }
    self->_prefSmartRoutingTipiHealingv2 = v72;
  }
  v75 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("forceDisconnect"), &v168);
  if (v168)
    v76 = 0;
  else
    v76 = v75 == 0;
  v77 = !v76;
  if (self->_prefSmartRoutingForcedDisconnection != v77)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v78 = "yes";
      if (v77)
        v79 = "no";
      else
        v79 = "yes";
      if (!v77)
        v78 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingForcedDisconnect: %s -> %s", v79, v78);
    }
    self->_prefSmartRoutingForcedDisconnection = v77;
  }
  v80 = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("forceDisconnectStartSeconds"), &v168);
  prefSmartRoutingForcedDisconnectionStartSeconds = self->_prefSmartRoutingForcedDisconnectionStartSeconds;
  if (v168)
    v82 = self->_prefSmartRoutingForcedDisconnectionStartSeconds;
  else
    v82 = v80;
  if (v82 != prefSmartRoutingForcedDisconnectionStartSeconds)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_250;
        prefSmartRoutingForcedDisconnectionStartSeconds = self->_prefSmartRoutingForcedDisconnectionStartSeconds;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "forceDisconnectStartSeconds: %f -> %f", prefSmartRoutingForcedDisconnectionStartSeconds, v82);
    }
LABEL_250:
    self->_prefSmartRoutingForcedDisconnectionStartSeconds = v82;
  }
  v83 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("forceDisconnectRSSI"), &v168);
  if (v83 <= 999 && v83 >= -999 && v83 != 0 && v168 == 0)
    v87 = v83;
  else
    v87 = -60;
  forcedDisconnectionRSSI = self->_forcedDisconnectionRSSI;
  if (v87 != forcedDisconnectionRSSI)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_268;
        LODWORD(forcedDisconnectionRSSI) = self->_forcedDisconnectionRSSI;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingForcedDisconnectionRSSI: %d -> %lld", forcedDisconnectionRSSI, v87);
    }
LABEL_268:
    self->_forcedDisconnectionRSSI = v87;
  }
  v89 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srNoNeabyFallBack"), &v168);
  if (v168)
    v90 = 0;
  else
    v90 = v89 == 0;
  v91 = !v90;
  if (self->_prefSmartRoutingNoNearbyFallBack != v91)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v92 = "yes";
      if (v91)
        v93 = "no";
      else
        v93 = "yes";
      if (!v91)
        v92 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingNoNearbyFallBack: %s -> %s", v93, v92);
    }
    self->_prefSmartRoutingNoNearbyFallBack = v91;
  }
  v94 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srEligible"), &v168);
  if (v168)
    v95 = 1;
  else
    v95 = v94 == 0;
  v96 = !v95;
  if (self->_prefSmartRoutingEligible != v96)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v97 = "yes";
      if (v96)
        v98 = "no";
      else
        v98 = "yes";
      if (!v96)
        v97 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SmartRoutingEligible: %s -> %s", v98, v97);
    }
    self->_prefSmartRoutingEligible = v96;
  }
  v99 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("speakRoute"), &v168);
  if (v168)
    v100 = 1;
  else
    v100 = v99 == 0;
  v101 = !v100;
  if (self->_prefSpeakRoute != v101)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v102 = "yes";
      if (v101)
        v103 = "no";
      else
        v103 = "yes";
      if (!v101)
        v102 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "SpeakRoute: %s -> %s", v103, v102);
    }
    self->_prefSpeakRoute = v101;
  }
  v104 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("routeIndication"), &v168);
  if (v168)
    v105 = 0;
  else
    v105 = v104 == 0;
  v106 = !v105;
  if (self->_prefRouteIndicationEnable != v106)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v107 = "yes";
      if (v106)
        v108 = "no";
      else
        v108 = "yes";
      if (!v106)
        v107 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "RouteIndication Enable: %s -> %s", v108, v107);
    }
    self->_prefRouteIndicationEnable = v106;
  }
  v109 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srProactiveOwnershipArbitration"), &v168);
  if (v168)
    v110 = 0;
  else
    v110 = v109 == 0;
  v111 = !v110;
  if (self->_prefProactiveOwnershipArbitration != v111)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v112 = "yes";
      if (v111)
        v113 = "no";
      else
        v113 = "yes";
      if (!v111)
        v112 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "ProactiveOwnershipArbitration: %s -> %s", v113, v112);
    }
    self->_prefProactiveOwnershipArbitration = v111;
  }
  v114 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srNoAutoRouteMac"), &v168);
  if (v168)
    v115 = 0;
  else
    v115 = v114 == 0;
  v116 = !v115;
  if (self->_prefSmartRoutingNoAutoRouteMac != v116)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v117 = "yes";
      if (v116)
        v118 = "no";
      else
        v118 = "yes";
      if (!v116)
        v117 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "NoAutoRouteMac: %s -> %s", v118, v117);
    }
    self->_prefSmartRoutingNoAutoRouteMac = v116;
  }
  v119 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srforceRejectLePipe"), &v168);
  if (v168)
    v120 = 1;
  else
    v120 = v119 == 0;
  v121 = !v120;
  if (self->_prefSmartRoutingForceRejectLePipe != v121)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v122 = "yes";
      if (v121)
        v123 = "no";
      else
        v123 = "yes";
      if (!v121)
        v122 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "ForceRejectLePipe: %s -> %s", v123, v122);
    }
    self->_prefSmartRoutingForceRejectLePipe = v121;
  }
  v124 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srforceTipiv2"), &v168);
  if (v168)
    v125 = 0;
  else
    v125 = v124 == 0;
  v126 = !v125;
  if (self->_prefSmartRoutingForceTipiv2 != v126)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v127 = "yes";
      if (v126)
        v128 = "no";
      else
        v128 = "yes";
      if (!v126)
        v127 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "ForceTipiv2: %s -> %s", v128, v127);
    }
    self->_prefSmartRoutingForceTipiv2 = v126;
  }
  v129 = _os_feature_enabled_impl("AudioAccessoryFeatures", "PreemptiveConnectedBanner");
  prefSmartRoutingPreemptiveConnectedBanner = self->_prefSmartRoutingPreemptiveConnectedBanner;
  if (prefSmartRoutingPreemptiveConnectedBanner != v129)
  {
    v131 = v129;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_408:
        v132 = "yes";
        if (prefSmartRoutingPreemptiveConnectedBanner)
          v133 = "yes";
        else
          v133 = "no";
        if (!v131)
          v132 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "Preemptive Connected Banner: %s -> %s", v133, v132);
        goto LABEL_415;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        prefSmartRoutingPreemptiveConnectedBanner = self->_prefSmartRoutingPreemptiveConnectedBanner;
        goto LABEL_408;
      }
    }
LABEL_415:
    self->_prefSmartRoutingPreemptiveConnectedBanner = v131;
  }
  v134 = (_os_feature_enabled_impl("BluetoothFeatures", "SmartRoutingMacOS") & 1) != 0
      || CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srMacAutomaticSwitching"), &v168) != 0;
  if (self->_prefSmartRoutingMacAutomaticSwitching != v134)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v135 = "yes";
      if (v134)
        v136 = "no";
      else
        v136 = "yes";
      if (!v134)
        v135 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "MacAutomaticSwitching: %s -> %s", v136, v135);
    }
    self->_prefSmartRoutingMacAutomaticSwitching = v134;
  }
  v137 = (_os_feature_enabled_impl("BluetoothFeatures", "SmartRoutingMacOS") & 1) != 0
      || CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srMacMxAudioScore"), &v168) != 0;
  if (self->_prefSmartRoutingMacMxAudioScore != v137)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v138 = "yes";
      if (v137)
        v139 = "no";
      else
        v139 = "yes";
      if (!v137)
        v138 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "MxAudioScore: %s -> %s", v139, v138);
    }
    self->_prefSmartRoutingMacMxAudioScore = v137;
  }
  v140 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srforceTipiv2"), &v168);
  if (v168)
    v141 = 0;
  else
    v141 = v140 == 0;
  v142 = !v141;
  if (self->_prefSmartRoutingForcedHijackv2 != v142)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v143 = "yes";
      if (v142)
        v144 = "no";
      else
        v144 = "yes";
      if (!v142)
        v143 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "Hijackv2: %s -> %s", v144, v143);
    }
    self->_prefSmartRoutingForcedHijackv2 = v142;
  }
  v145 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srWatchTriangleMagnet"), &v168);
  if (v168)
    v146 = 30;
  else
    v146 = v145;
  prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
  if (v146 != prefSmartRoutingWatchTriangleMagnet)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_469;
        prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "Watch triangle with Magnet: %d -> %d", prefSmartRoutingWatchTriangleMagnet, v146);
    }
LABEL_469:
    self->_prefSmartRoutingWatchTriangleMagnet = v146;
  }
  v148 = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("SRConnectionDelaySeconds"), &v168);
  if (v168)
    v149 = 0.0;
  else
    v149 = v148;
  prefConnectionDelaySeconds = self->_prefConnectionDelaySeconds;
  if (v149 != prefConnectionDelaySeconds)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_478;
        prefConnectionDelaySeconds = self->_prefConnectionDelaySeconds;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "ConnectionDelaySeconds: %.0f -> %.0f", prefConnectionDelaySeconds, v149);
    }
LABEL_478:
    self->_prefConnectionDelaySeconds = v149;
  }
  v151 = _os_feature_enabled_impl("AudioAccessoryFeatures", "SmartRoutingPrioritizeCall");
  if (self->_prefSmartRoutingPrioritizedCall != v151)
  {
    v152 = v151;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v153 = "yes";
      if (v152)
        v154 = "no";
      else
        v154 = "yes";
      if (!v152)
        v153 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "PriortizedCall: %s -> %s", v154, v153);
    }
    self->_prefSmartRoutingPrioritizedCall = v152;
  }
  v155 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srPriortizedCallMuteMac"), &v168);
  if (v168)
    v156 = 0;
  else
    v156 = v155 == 0;
  v157 = !v156;
  if (self->_prefSmartRoutingPrioritizedCallMuteMac != v157)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v158 = "yes";
      if (v157)
        v159 = "no";
      else
        v159 = "yes";
      if (!v157)
        v158 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "PriortizedCall muteMac: %s -> %s", v159, v158);
    }
    self->_prefSmartRoutingPrioritizedCallMuteMac = v157;
  }
  v160 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srInUseBanner"), &v168);
  if (v168)
    v161 = 0;
  else
    v161 = v160 == 0;
  v162 = !v161;
  if (self->_prefSmartRoutingInUseBanner != v162)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v163 = "yes";
      if (v162)
        v164 = "no";
      else
        v164 = "yes";
      if (!v162)
        v163 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "In-Use banner: %s -> %s", v164, v163);
    }
    self->_prefSmartRoutingInUseBanner = v162;
  }
  v165 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("srInUseBannerTimeout"), &v168);
  if (v168)
    v166 = 3;
  else
    v166 = v165;
  prefSmartRoutingInUseBannerTimeout = self->_prefSmartRoutingInUseBannerTimeout;
  if (v166 != prefSmartRoutingInUseBannerTimeout)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_532;
        prefSmartRoutingInUseBannerTimeout = self->_prefSmartRoutingInUseBannerTimeout;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _prefsChanged]", 30, "In-Use banner timeout: %d -> %d", prefSmartRoutingInUseBannerTimeout, v166);
    }
LABEL_532:
    self->_prefSmartRoutingInUseBannerTimeout = v166;
  }
  -[BTSmartRoutingDaemon _update](self, "_update");
}

- (void)_sigTermReceived
{
  id v3;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sigTermReceived]", 30, "SIGTERM received\n");
  v3 = -[BTSmartRoutingDaemon _stopAudioStateSnapshotTimer:](self, "_stopAudioStateSnapshotTimer:", 1);
  if (self->_lowBatterySaveTimer)
    v3 = -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 1);
  xpc_transaction_exit_clean(v3);
}

- (void)_update
{
  _BOOL4 effectiveScreenLocked;
  unsigned int v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 prefSmartRoutingEnabledPhase3;
  id v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;

  effectiveScreenLocked = self->_effectiveScreenLocked;
  if (-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn"))
  {
    v4 = -[CUSystemMonitor screenLocked](self->_powerMonitor, "screenLocked");
    if (effectiveScreenLocked)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  if (self->_effectiveScreenLocked != v5)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _update]", 30, "Effective ScreenLocked changed: %s -> %s", v7, v6);
    }
    self->_effectiveScreenLocked = v5;
    if (v5)
    {
      -[BTSmartRoutingDaemon _nearbyInfoActivityChanged](self, "_nearbyInfoActivityChanged");
      -[BTSmartRoutingDaemon _resetInUserBannerShown](self, "_resetInUserBannerShown");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getActiveNearbyWxAdress](self, "_getActiveNearbyWxAdress"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v8));
      v10 = mach_absolute_time();
      if (UpTicksToSecondsF(v10 - (_QWORD)objc_msgSend(v9, "inUseBannerBackoffTick")) < 1.5)
      {
        objc_msgSend(v9, "_setInUseBannerBackoffReason:", 0);
        -[SmartRoutingStats setBannerAction:](self->_stats, "setBannerAction:", CFSTR("ScreenLocked"));
      }
      objc_msgSend(v9, "_setNearbyPrevInEar:", objc_msgSend(v9, "nearbyInEar"));

      -[BTSmartRoutingDaemon _powerMonitorScreenLockChanged](self, "_powerMonitorScreenLockChanged");
    }
    else
    {
      -[BTSmartRoutingDaemon _powerMonitorScreenLockChanged](self, "_powerMonitorScreenLockChanged");
      -[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent](self, "_iPhoneScreenOnPowerEvent");
      if (self->_prefSmartRoutingEnabledPhase3)
      {
        -[BTSmartRoutingDaemon _startHighActivityLevelTimer:](self, "_startHighActivityLevelTimer:", 1);
        -[SmartRoutingStats setProactiveRoutingTrigger:](self->_stats, "setProactiveRoutingTrigger:", CFSTR("Unlock"));
      }
    }
  }
  prefSmartRoutingEnabledPhase3 = self->_prefSmartRoutingEnabledPhase3;
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
    {
      -[BTSmartRoutingDaemon _pipeEnsureStarted](self, "_pipeEnsureStarted");
      -[BTSmartRoutingDaemon _TUMonitorEnsureStarted](self, "_TUMonitorEnsureStarted");
    }
    else
    {
      -[BTSmartRoutingDaemon _pipeEnsureStopped](self, "_pipeEnsureStopped");
      -[BTSmartRoutingDaemon _TUMonitorEnsureStopped](self, "_TUMonitorEnsureStopped");
    }
  }
  else
  {
    -[BTSmartRoutingDaemon _pipeEnsureStopped](self, "_pipeEnsureStopped");
    -[BTSmartRoutingDaemon _TUMonitorEnsureStopped](self, "_TUMonitorEnsureStopped");
    if (!self->_watchRecoveryEnabled)
      goto LABEL_32;
  }
  if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
  {
    -[BTSmartRoutingDaemon _activityMonitorEnsureStarted](self, "_activityMonitorEnsureStarted");
    if (!prefSmartRoutingEnabledPhase3)
      goto LABEL_30;
    goto LABEL_33;
  }
LABEL_32:
  -[BTSmartRoutingDaemon _activityMonitorEnsureStopped](self, "_activityMonitorEnsureStopped");
  if (!prefSmartRoutingEnabledPhase3)
  {
LABEL_30:
    -[BTSmartRoutingDaemon _callMonitorEnsureStopped](self, "_callMonitorEnsureStopped");
    if (!self->_prefLowBatteryEnabled)
      goto LABEL_38;
    goto LABEL_36;
  }
LABEL_33:
  if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
    -[BTSmartRoutingDaemon _callMonitorEnsureStarted](self, "_callMonitorEnsureStarted");
  else
    -[BTSmartRoutingDaemon _callMonitorEnsureStopped](self, "_callMonitorEnsureStopped");
LABEL_36:
  if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
  {
    -[BTSmartRoutingDaemon _evaluatorEnsureStarted](self, "_evaluatorEnsureStarted");
    goto LABEL_39;
  }
LABEL_38:
  -[BTSmartRoutingDaemon _evaluatorEnsureStopped](self, "_evaluatorEnsureStopped");
LABEL_39:
  if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
  {
    -[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStarted](self, "_connectedDeviceMonitorEnsureStarted");
    -[BTSmartRoutingDaemon _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
    if (prefSmartRoutingEnabledPhase3)
      goto LABEL_44;
  }
  else
  {
    -[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStopped](self, "_connectedDeviceMonitorEnsureStopped");
    -[BTSmartRoutingDaemon _aaControllerEnsureStopped](self, "_aaControllerEnsureStopped");
    if (prefSmartRoutingEnabledPhase3)
      goto LABEL_44;
  }
  if (!self->_prefSpeakRoute)
  {
LABEL_46:
    -[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStopped](self, "_mediaRouteMonitorEnsureStopped");
    goto LABEL_47;
  }
LABEL_44:
  if (!-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
    goto LABEL_46;
  -[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStarted](self, "_mediaRouteMonitorEnsureStarted");
LABEL_47:
  if (!self->_watchRecoveryEnabled
    || !-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked")
    || self->_sleeping)
  {
    if (!prefSmartRoutingEnabledPhase3)
      goto LABEL_62;
    goto LABEL_51;
  }
  v12 = -[NSMutableDictionary count](self->_watchWxDevices, "count");
  if (prefSmartRoutingEnabledPhase3 && !v12)
  {
LABEL_51:
    if (!-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked") || self->_sleeping)
      goto LABEL_62;
    v12 = -[NSMutableDictionary count](self->_wxDevices, "count");
  }
  if (v12
    && ((-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn") & 1) != 0
     || !-[CUSystemMonitor screenLocked](self->_powerMonitor, "screenLocked")
     || self->_screenLockedLingerTimer
     || -[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount")))
  {
    -[BTSmartRoutingDaemon _nearbyInfoDiscoveryEnsureStarted](self, "_nearbyInfoDiscoveryEnsureStarted");
    goto LABEL_63;
  }
LABEL_62:
  -[BTSmartRoutingDaemon _nearbyInfoDiscoveryEnsureStopped](self, "_nearbyInfoDiscoveryEnsureStopped");
LABEL_63:
  if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
    -[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStarted](self, "_pairedDeviceMonitorEnsureStarted");
  else
    -[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStopped](self, "_pairedDeviceMonitorEnsureStopped");
  -[BTSmartRoutingDaemon _powerMonitorEnsureStarted](self, "_powerMonitorEnsureStarted");
  if (self->_prefSmartRoutingEnabledPhase3
    && -[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
  {
    -[BTSmartRoutingDaemon _relayConduitMessageEnsureStarted](self, "_relayConduitMessageEnsureStarted");
    if (!prefSmartRoutingEnabledPhase3)
      goto LABEL_69;
LABEL_72:
    -[BTSmartRoutingDaemon _systemUIMonitorEnsureStarted](self, "_systemUIMonitorEnsureStarted");
    goto LABEL_75;
  }
  -[BTSmartRoutingDaemon _relayConduitMessageEnsureStopped](self, "_relayConduitMessageEnsureStopped");
  if (prefSmartRoutingEnabledPhase3)
    goto LABEL_72;
LABEL_69:
  if (self->_prefLowBatteryEnabled)
    -[BTSmartRoutingDaemon _systemUIMonitorEnsureStarted](self, "_systemUIMonitorEnsureStarted");
  else
    -[BTSmartRoutingDaemon _systemUIMonitorEnsureStopped](self, "_systemUIMonitorEnsureStopped");
  if (!self->_prefLowBatteryEnabled)
    goto LABEL_77;
LABEL_75:
  if (!-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
  {
LABEL_77:
    v13 = 0;
    goto LABEL_78;
  }
  v13 = !self->_sleeping;
LABEL_78:
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (prefSmartRoutingEnabledPhase3)
      v14 = "yes";
    else
      v14 = "no";
    if (self->_prefLowBatteryEnabled)
      v15 = "yes";
    else
      v15 = "no";
    if (-[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked"))
      v16 = "yes";
    else
      v16 = "no";
    if (self->_sleeping)
      v17 = "yes";
    else
      v17 = "no";
    if (-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn"))
      v18 = "yes";
    else
      v18 = "no";
    if (-[CUSystemMonitor screenLocked](self->_powerMonitor, "screenLocked"))
      v19 = "yes";
    else
      v19 = "no";
    if (self->_screenLockedLingerTimer)
      v20 = "yes";
    else
      v20 = "no";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _update]", 30, "anySmartRouting %s _prefLowBatteryEnabled %s _powerMonitor.firstUnlocked %s _sleeping %s, _powerMonitor.screenOn %s, _powerMonitor.screenLocked %s, _screenLockedLingerTimer %s", v14, v15, v16, v17, v18, v19, v20);
  }
  if (v13
    && ((-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn") & 1) != 0
     || !-[CUSystemMonitor screenLocked](self->_powerMonitor, "screenLocked")
     || self->_screenLockedLingerTimer
     || -[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount")))
  {
    -[BTSmartRoutingDaemon _wxDiscoveryEnsureStarted](self, "_wxDiscoveryEnsureStarted");
  }
  else
  {
    -[BTSmartRoutingDaemon _wxDiscoveryEnsureStopped](self, "_wxDiscoveryEnsureStopped");
  }
  if (self->_watchRecoveryEnabled
    && -[CUSystemMonitor firstUnlocked](self->_powerMonitor, "firstUnlocked")
    && !self->_sleeping)
  {
    -[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryEnsureStarted](self, "_wxDiscoveryWatchRecoveryEnsureStarted");
  }
  else
  {
    -[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryEnsureStopped](self, "_wxDiscoveryWatchRecoveryEnsureStopped");
  }
  -[BTSmartRoutingDaemon _lowBatteryUpdate](self, "_lowBatteryUpdate");
  -[BTSmartRoutingDaemon _evaluatorRun](self, "_evaluatorRun");
}

- (void)_evaluatorEnsureStarted
{
  CUCoalescer *v3;
  CUCoalescer *evaluatorCoalescer;
  CUCoalescer *v5;
  _QWORD v6[6];

  if (!self->_evaluatorCoalescer)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorEnsureStarted]", 30, "Start");
    }
    v3 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    evaluatorCoalescer = self->_evaluatorCoalescer;
    self->_evaluatorCoalescer = v3;
    v5 = v3;

    -[CUCoalescer setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](v5, "setMinDelay:", 0.05);
    -[CUCoalescer setMaxDelay:](v5, "setMaxDelay:", 0.1);
    -[CUCoalescer setLeeway:](v5, "setLeeway:", 0.05);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000231C4;
    v6[3] = &unk_1001E23E8;
    v6[4] = v5;
    v6[5] = self;
    -[CUCoalescer setActionHandler:](v5, "setActionHandler:", v6);

  }
}

- (void)_evaluatorEnsureStopped
{
  CUCoalescer *evaluatorCoalescer;
  SFDevice *connectDevice;
  CBConnection *connectSession;
  OS_dispatch_source *smartRoutingLowerScanRateTimer;
  OS_dispatch_source *v7;
  NSObject *v8;

  if (self->_evaluatorCoalescer
    && dword_10020FA58 <= 30
    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorEnsureStopped]", 30, "Stop");
  }
  -[CUCoalescer invalidate](self->_evaluatorCoalescer, "invalidate");
  evaluatorCoalescer = self->_evaluatorCoalescer;
  self->_evaluatorCoalescer = 0;

  connectDevice = self->_connectDevice;
  self->_connectDevice = 0;

  -[CBConnection invalidate](self->_connectSession, "invalidate");
  connectSession = self->_connectSession;
  self->_connectSession = 0;

  smartRoutingLowerScanRateTimer = self->_smartRoutingLowerScanRateTimer;
  if (smartRoutingLowerScanRateTimer)
  {
    v8 = smartRoutingLowerScanRateTimer;
    dispatch_source_cancel(v8);
    v7 = self->_smartRoutingLowerScanRateTimer;
    self->_smartRoutingLowerScanRateTimer = 0;

  }
}

- (void)_evaluatorRun
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  const char *v9;
  id v10;
  BOOL v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  NSMutableDictionary *connectedDevices;
  NSMutableDictionary *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  NSMutableDictionary *v22;
  NSMutableDictionary *disconnectTicksMap;
  NSMutableDictionary *v24;
  BTBannerUISession *uiSmartRoutingBanner;
  BTBannerUISession *v26;
  OS_dispatch_source *tipiHealingTimer;
  NSObject *v28;
  OS_dispatch_source *v29;
  NSMutableArray *smartRoutingManualDisconnectionList;
  NSMutableArray *v31;
  NSMutableDictionary *srBudswapDeviceMap;
  NSMutableDictionary *v33;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  NSMutableDictionary *v35;
  NSMutableDictionary *smartRoutingBackOffMap;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  OS_dispatch_source *highActivityLevelTimer;
  NSObject *v41;
  OS_dispatch_source *v42;
  OS_dispatch_source *phoneOwnershipTriangleTimer;
  NSObject *v44;
  OS_dispatch_source *v45;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  const char *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  unint64_t v51;
  id v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  unsigned int v56;
  const __CFString *v57;
  void *v58;
  _QWORD v59[6];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    v4 = objc_msgSend(v3, "count");
    v5 = -[NSMutableDictionary count](self->_connectedDevices, "count");
    v6 = -[NSMutableDictionary count](self->_nearbyInfoDevices, "count");
    v7 = -[NSMutableDictionary count](self->_wxDevices, "count");
    v8 = (unint64_t)-[CBDiscovery bluetoothState](self->_connectedDiscovery, "bluetoothState");
    if (v8 > 0xA)
      v9 = "?";
    else
      v9 = off_1001E3978[v8];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: Paired %d Connected %d, NearbyInfo %d, Wx %d BluetoothState %s", v4, v5, v6, v7, v9);

  }
  v10 = -[CBDiscovery bluetoothState](self->_connectedDiscovery, "bluetoothState");
  if (v10)
    v11 = v10 == (id)5;
  else
    v11 = 1;
  if (v11)
  {
    if (!self->_prefSmartRoutingEnabledPhase3)
      return;
    if (self->_connectSession)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: skip, already connecting: %@", self->_connectDevice);
      }
      v50 = CFSTR("Already connecting to headset");
LABEL_79:
      -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", v50);
      return;
    }
    if (self->_connectTicks)
    {
      v14 = mach_absolute_time();
      v15 = UpTicksToSeconds(v14 - self->_connectTicks);
      if (v15 <= 0x1DF)
      {
        if (dword_10020FA58 <= 30)
        {
          v51 = v15;
          if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: skip, too soon, %ll{dur} remaining", 480 - v51);
        }
        v50 = CFSTR("Too soon since last connection");
        goto LABEL_79;
      }
    }
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = sub_10001E9DC;
    v64 = sub_10001E9EC;
    v65 = 0;
    self->_connected3rdPartyDevice = 0;
    connectedDevices = self->_connectedDevices;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100023B84;
    v59[3] = &unk_1001E2D80;
    v59[4] = self;
    v59[5] = &v60;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v59);
    if (self->_connected3rdPartyDevice
      && dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: already connected to 3rd party device, allowing SR device to connect");
    }
    if (v61[5]
      && dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: already connected to SR device, allowing another SR connection.");
    }
    v52 = -[CUSystemMonitor connectedCallCount](self->_callMonitor, "connectedCallCount");
    if ((int)v52 >= 1 && GestaltGetDeviceClass(v52, v53) == 1)
    {
      if ((-[CUSystemMonitor callFlags](self->_callMonitor, "callFlags") == 1
         || -[CUSystemMonitor callFlags](self->_callMonitor, "callFlags") == 2)
        && !self->_isBuiltInReceiverRoute
        && !self->_isSpeakerRoute)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          v54 = -[CUSystemMonitor callFlags](self->_callMonitor, "callFlags");
          v55 = "FTaudio";
          if (v54 == 1)
            v55 = "telephony call";
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: skip, current route not builtInReceiver or speakeroniPhone during %s", v55);
        }
        v56 = -[CUSystemMonitor callFlags](self->_callMonitor, "callFlags");
        v57 = CFSTR("FTaudio");
        if (v56 == 1)
          v57 = CFSTR("telephony call");
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("current route not builtInReceiver or speakeroniPhone during %@"), v57));
        -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", v58);

      }
      else
      {
        if ((-[CUSystemMonitor callFlags](self->_callMonitor, "callFlags") & 4) == 0
          || self->_isSpeakerRoute)
        {
          goto LABEL_97;
        }
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: skip, current route not speaker during FT Video");
        }
        -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", CFSTR("Current route not speaker during FT Video"));
      }
      _Block_object_dispose(&v60, 8);

      return;
    }
LABEL_97:
    -[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:](self, "_evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:", self->_wxDevices, self->_nearbyInfoDevices, self->_score);
    _Block_object_dispose(&v60, 8);

    return;
  }
  v12 = (unint64_t)v10;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (v12 - 1 > 9)
      v13 = "?";
    else
      v13 = off_1001E3830[v12 - 1];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRun]", 30, "Evaluator: skip, Bluetooth unsupported state: %s", v13);
  }
  -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.PreemptivePortDisconnected");
  v17 = self->_connectedDevices;
  if (v17)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v17, "allValues"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v20)
            objc_enumerationMutation(v18);
          -[BTSmartRoutingDaemon _connectedDeviceLost:](self, "_connectedDeviceLost:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i));
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v19);
    }

    v22 = self->_connectedDevices;
    self->_connectedDevices = 0;

  }
  disconnectTicksMap = self->_disconnectTicksMap;
  if (disconnectTicksMap)
  {
    -[NSMutableDictionary removeAllObjects](disconnectTicksMap, "removeAllObjects");
    v24 = self->_disconnectTicksMap;
  }
  else
  {
    v24 = 0;
  }
  self->_disconnectTicksMap = 0;

  if (self->_connectTicks)
    self->_connectTicks = 0;
  if (self->_tipiSetupTicks)
    self->_tipiSetupTicks = 0;
  uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
  if (uiSmartRoutingBanner)
  {
    -[BTBannerUISession invalidate](uiSmartRoutingBanner, "invalidate");
    v26 = self->_uiSmartRoutingBanner;
    self->_uiSmartRoutingBanner = 0;

  }
  if (self->_tipiElectionInProgress)
    self->_tipiElectionInProgress = 0;
  -[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:](self, "_setTipiElectionReceivedLePipe:", &stru_1001ED4C0);
  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    v28 = tipiHealingTimer;
    dispatch_source_cancel(v28);
    v29 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = 0;

  }
  smartRoutingManualDisconnectionList = self->_smartRoutingManualDisconnectionList;
  if (smartRoutingManualDisconnectionList)
  {
    -[NSMutableArray removeAllObjects](smartRoutingManualDisconnectionList, "removeAllObjects");
    v31 = self->_smartRoutingManualDisconnectionList;
  }
  else
  {
    v31 = 0;
  }
  self->_smartRoutingManualDisconnectionList = 0;

  srBudswapDeviceMap = self->_srBudswapDeviceMap;
  if (srBudswapDeviceMap)
  {
    -[NSMutableDictionary removeAllObjects](srBudswapDeviceMap, "removeAllObjects");
    v33 = self->_srBudswapDeviceMap;
  }
  else
  {
    v33 = 0;
  }
  self->_srBudswapDeviceMap = 0;

  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  if (smartRoutingWxDeviceMap)
  {
    -[NSMutableDictionary removeAllObjects](smartRoutingWxDeviceMap, "removeAllObjects");
    v35 = self->_smartRoutingWxDeviceMap;
  }
  else
  {
    v35 = 0;
  }
  self->_smartRoutingWxDeviceMap = 0;

  smartRoutingBackOffMap = self->_smartRoutingBackOffMap;
  if (smartRoutingBackOffMap)
  {
    -[NSMutableDictionary removeAllObjects](smartRoutingBackOffMap, "removeAllObjects");
    v37 = self->_smartRoutingBackOffMap;
  }
  else
  {
    v37 = 0;
  }
  self->_smartRoutingBackOffMap = 0;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
    objc_msgSend(v39, "removeAllObjects");

  }
  -[BTSmartRoutingSourceDevice setIsFirstConnectionAfterSREnable:](self->_sourceDevice, "setIsFirstConnectionAfterSREnable:", 0);
  highActivityLevelTimer = self->_highActivityLevelTimer;
  if (highActivityLevelTimer)
  {
    v41 = highActivityLevelTimer;
    dispatch_source_cancel(v41);
    v42 = self->_highActivityLevelTimer;
    self->_highActivityLevelTimer = 0;

  }
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  if (phoneOwnershipTriangleTimer)
  {
    v44 = phoneOwnershipTriangleTimer;
    dispatch_source_cancel(v44);
    v45 = self->_phoneOwnershipTriangleTimer;
    self->_phoneOwnershipTriangleTimer = 0;

  }
  phase1ConnectConfig = self->_phase1ConnectConfig;
  self->_phase1ConnectConfig = 0;

  -[BTSmartRoutingSourceDevice setAudioRoute:](self->_sourceDevice, "setAudioRoute:", 1);
  if (v12 > 0xA)
    v47 = "?";
  else
    v47 = off_1001E3978[v12];
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v47));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bluetooth unsupported state: %@"), v48));
  -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", v49);

}

- (void)_evaluatorRunInUseBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  void *v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  unint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  const char *v32;
  void *v33;

  v4 = a3;
  v33 = v4;
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getActiveNearbyWxAdress](self, "_getActiveNearbyWxAdress"));
  if (self->_prefSmartRoutingInUseBanner)
  {
    if (v4)
    {
      if (!self->_effectiveScreenLocked)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inUseBannerBackoffReason"));

        if (v6)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inUseBannerBackoffReason"));
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, reason %@", v28);

          }
          goto LABEL_43;
        }
        if (objc_msgSend(v5, "inUseBannerShown"))
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, banner shown already");
          }
          goto LABEL_43;
        }
        if (objc_msgSend(v5, "connectionState"))
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, Wx connecting/connected");
          }
          goto LABEL_43;
        }
        if (!objc_msgSend(v5, "nearbyConnectedSourceCount"))
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, connected source count is 0");
          }
          goto LABEL_43;
        }
        if (!-[BTSmartRoutingDaemon _supportsTipi:](self, "_supportsTipi:", v4))
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, headset not supports SR");
          }
          goto LABEL_43;
        }
        v31 = objc_msgSend(v5, "nearbyPrevInEar");
        v7 = objc_msgSend(v5, "nearbyInEar");
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nearbyLastRouteHost"));
        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nearbyLastRouteHost"));
          v10 = -[BTSmartRoutingDaemon _isDevicePairedCheck:](self, "_isDevicePairedCheck:", v9);

        }
        else
        {
          v10 = 0;
        }

        v11 = objc_msgSend(v5, "nearbyiCloudSignIn");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nearbyName"));
        v13 = objc_msgSend(v5, "nearbyProductID");
        v14 = objc_msgSend(v5, "nearbyOutOfCaseTime");
        v15 = mach_absolute_time();
        v16 = UpTicksToSecondsF(v15 - -[BTSmartRoutingSourceDevice callStartTicks](self->_sourceDevice, "callStartTicks"));
        if ((v10 & 1) != 0 || (v11 & 1) != 0)
          goto LABEL_42;
        v17 = v16;
        v18 = 0;
        if (objc_msgSend(v5, "nearbyStreamState") || v7 != 1)
        {
LABEL_32:
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxChipVersion:](self, "_getWxChipVersion:", v13));
            if (v18)
              v20 = "yes";
            else
              v20 = "no";
            v21 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerTrigger](self->_stats, "bannerTrigger"));
            if (v7 > 7)
              v22 = "?";
            else
              v22 = off_1001E3BA8[v7];
            v30 = (void *)v21;
            if (v31 > 7)
              v23 = "?";
            else
              v23 = off_1001E3BA8[v31];
            v32 = v23;
            v24 = (unint64_t)objc_msgSend(v5, "nearbyStreamState");
            if (v24 > 3)
              v25 = "?";
            else
              v25 = off_1001E3C08[v24];
            if (v11)
              v26 = "yes";
            else
              v26 = "no";
            if (v14 > 3)
              v27 = "?";
            else
              v27 = off_1001E3958[(char)v14];
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "Evaluator: InUseBanner, wx %@ addr %@ shouldShow %s trigger %@ inEarSt %s prevInEarSt %s streamState %s isLastHost3rdParty %s isLastHostPaired %s name %@ productID %u iCloudSignedIn %s outOfCaseTime %s timeout %d callStart %.2fs", v29, v4, v20, v30, v22, v32, v25, "yes", "no", v12, v13, v26, v27,
              self->_prefSmartRoutingInUseBannerTimeout,
              *(_QWORD *)&v17);

            if ((v18 & 1) == 0)
              goto LABEL_42;
            goto LABEL_41;
          }
          if (v18)
          {
LABEL_41:
            -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 3, v12, v4, v13, CFSTR("In Use by Other Device"), 0, 20.0);
            objc_msgSend(v5, "_setInUseBannerShown:", 1);
          }
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        v18 = 0;
        v19 = (_DWORD)v13 - 8202;
        if (((_DWORD)v13 - 8202) <= 0x1A)
        {
          if (((1 << v19) & 0x20033F) != 0)
          {
            if (v31 != 2)
            {
              v18 = 0;
              goto LABEL_27;
            }
          }
          else
          {
            if (((1 << v19) & 0x45A8400) == 0)
              goto LABEL_27;
            if (self->_prefSmartRoutingInUseBannerTimeout <= v14)
            {
              v18 = 0;
              if ((_DWORD)v13 != 8223 || v31 != 2)
                goto LABEL_27;
            }
          }
          -[SmartRoutingStats setBannerTrigger:](self->_stats, "setBannerTrigger:", CFSTR("3rdPartyHeadset-Unlock"));
          v18 = 1;
        }
LABEL_27:
        if (v19 <= 0x1A && (((1 << v19) & 0x20033F) != 0 || ((1 << v19) & 0x45A8400) != 0) && v17 < 1.5)
        {
          -[SmartRoutingStats setBannerTrigger:](self->_stats, "setBannerTrigger:", CFSTR("3rdPartyHeadset-PhoneCall"));
          v18 = 1;
        }
        goto LABEL_32;
      }
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, screen locked");
      }
    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, Missing Wx address");
    }
  }
  else if (dword_10020FA58 <= 30
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunInUseBanner:]", 30, "InUseBanner: Skip, not enabled");
  }
LABEL_44:

}

- (void)_evaluatorRunTipiElection:(id)a3 nearbyInfoDevicesMap:(id)a4 localScore:(int)a5
{
  id v8;
  id v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  void *v19;
  unsigned int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  _BOOL8 v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
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
  id v42;
  _BOOL8 v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  BTSmartRoutingPipe *smartRoutingPipe;
  uint64_t v54;
  const __CFString *v55;
  id v56;
  _QWORD v57[7];
  _QWORD v58[8];
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[6];
  int v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[3];
  int v75;

  v8 = a3;
  v9 = a4;
  if (a5 > 1 || self->_playbackStart || -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue") > 300)
  {
    if (self->_tipiElectionInProgress && !self->_callConnected && !self->_playbackStart)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: tipi election already in progress back off. ");
      }
      v29 = CFSTR("Tipi election already in progress back off");
      goto LABEL_75;
    }
    self->_tipiElectionThroughLEPipe = 0;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    v75 = 0;
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = 0x3032000000;
    v72[3] = sub_10001E9DC;
    v72[4] = sub_10001E9EC;
    v73 = 0;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100024E3C;
    v70[3] = &unk_1001E2DA8;
    v71 = a5;
    v70[4] = v74;
    v70[5] = v72;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v70);
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = sub_10001E9DC;
    v68 = sub_10001E9EC;
    v69 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100024FB8;
    v58[3] = &unk_1001E2DF8;
    v59 = a5;
    v58[4] = self;
    v58[5] = &v64;
    v58[6] = v74;
    v58[7] = &v60;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v58);
    v10 = v65;
    if (v65[5] && self->_tipiElectionPhase1)
      *((_BYTE *)v61 + 24) = 1;
    self->_tipiElectionPhase1 = 0;
    v11 = (void *)v10[5];
    if (!v11)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: skip, no eligible headset.");
      }
      self->_callConnected = 0;
      self->_playbackStart = 0;
      -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", CFSTR("No eligible headset"));
      goto LABEL_101;
    }
    if (self->_eligibleHeadsetTicks)
    {
      v12 = mach_absolute_time();
      v13 = UpTicksToSeconds(v12 - self->_eligibleHeadsetTicks);
      if (v13 < 0x78)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: skip tipi selection, too soon, %ll{dur} remaining", 120 - v13);
        }
        goto LABEL_101;
      }
      v11 = (void *)v65[5];
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bluetoothAddress"));

    v56 = v15;
    if (objc_msgSend(v15, "length") == (id)6)
    {
      v16 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v15), "bytes")));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v16);
    }
    else
    {
      v17 = 0;
    }
    phase1ConnectConfig = self->_phase1ConnectConfig;
    if (phase1ConnectConfig && dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_40;
        phase1ConnectConfig = self->_phase1ConnectConfig;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingConnectConfig address](phase1ConnectConfig, "address"));
      v20 = -[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type");
      if (v20 > 3)
        v21 = "?";
      else
        v21 = off_1001E3D08[v20];
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: Phase1Config Wx %@ type %s", v19, v21);

    }
LABEL_40:
    v22 = v65[5];
    if (self->_tipiElectionThroughLEPipe)
    {
      if (v22)
      {
        if (!self->_phase1ConnectConfig)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self->_lePipeDevice, "idsIdentifier"));
          if (v17)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingBackOffMap, "objectForKeyedSubscript:", v17));
            v25 = objc_msgSend(v24, "containsString:", v23);

            if (v25)
            {
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: skip headset connected to source that disabled SR");
              }
            }
            else
            {
              self->_tipiElectionInProgress = 1;
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: Tipi election won with headset %@", v65[5]);
              }
              objc_storeStrong((id *)&self->_eligibleHeadset, (id)v65[5]);
              LOBYTE(v54) = 1;
              -[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:](self, "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:", self->_eligibleHeadset, 3, 0, 0, 0, 1, v54);
              -[SmartRoutingStats setPipeStartTime:](self->_stats, "setPipeStartTime:", mach_absolute_time());
              smartRoutingPipe = self->_smartRoutingPipe;
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472;
              v57[2] = sub_100026C1C;
              v57[3] = &unk_1001E2E20;
              v57[4] = self;
              v57[5] = v17;
              v57[6] = &v64;
              -[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:](smartRoutingPipe, "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:", v23, v17, 1, 0, v57);
            }
          }
          else if (dword_10020FA58 <= 90
                 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 90, "Evaluator: Unable to get address from eligible headset");
          }

          goto LABEL_100;
        }
LABEL_49:
        if (dword_10020FA58 <= 30)
        {
          if (dword_10020FA58 == -1)
          {
            if (!_LogCategory_Initialize(&dword_10020FA58, 30))
              goto LABEL_53;
            v22 = v65[5];
          }
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: Phase 1, Tipi election won with headset %@", v22);
        }
LABEL_53:
        -[SmartRoutingStats setPipeStartTime:](self->_stats, "setPipeStartTime:", 0);
        objc_storeStrong((id *)&self->_eligibleHeadset, (id)v65[5]);
        self->_tipiElectionInProgress = 1;
        v26 = -[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress");
        if (v26)
        {
          -[BTSmartRoutingPipe _invalidate](self->_smartRoutingPipe, "_invalidate");
          v27 = 2;
        }
        else
        {
          v27 = 3;
        }
        LOBYTE(v54) = 1;
        -[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:](self, "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:", self->_eligibleHeadset, v27, 0, 0, 0, v26, v54);
        if (self->_forcedConnection)
        {
          if (v17)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));

            if (v28)
            {
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Backing off from Tipi healing due to ongoing FD!");
              }
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));
              objc_msgSend(v30, "setTipiHealingBackoff:", 1);

            }
          }
        }
        if (self->_prefSmartRoutingPreemptiveConnectedBanner)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));
          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "deviceName"));

            if (!v33)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "deviceManager"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "fetchDeviceSyncWithAddress:", v17));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "nickname"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));
              objc_msgSend(v38, "setDeviceName:", v37);

            }
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v65[5], "identifier"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "UUIDString"));

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v40));
          v42 = objc_msgSend(v41, "audioState");

          v55 = v17;
          v43 = -[BTSmartRoutingDaemon _inEarNearbyCheck:](self, "_inEarNearbyCheck:", v17);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v40));
          v45 = objc_msgSend(v44, "preemptiveBannerShown");
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v40));
          LODWORD(v45) = -[BTSmartRoutingDaemon _isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:](self, "_isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:", v45, objc_msgSend(v46, "firstPreemptiveBannerShown"), v43, -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"), v42, v55);

          if ((_DWORD)v45)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v55));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "deviceName"));
            if (v55)
              v49 = v55;
            else
              v49 = CFSTR("?");
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:"));
            -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v48, v49, objc_msgSend(v50, "productID"), CFSTR("Connected"), 0, 4.0);

            if (dword_10020FA58 <= 30
              && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
            {
              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Smart Routing posting preemptive connected banner!");
            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v40));
            objc_msgSend(v51, "setPreemptiveBannerShown:", 1);

            -[SmartRoutingStats setLocalAudioScore:](self->_stats, "setLocalAudioScore:", self->_localDeviceAudioCatogory);
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v40));
            objc_msgSend(v52, "setFirstPreemptiveBannerShown:", 1);

            self->_preemptiveBannerShownTicks = mach_absolute_time();
            self->_preemptiveBannerConnectionInProgress = 1;
            -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.PreemptivePortChanged");
          }

          v17 = (__CFString *)v55;
        }
        -[BTSmartRoutingDaemon _smartRoutingConnectToEligibleHeadset:](self, "_smartRoutingConnectToEligibleHeadset:", self->_eligibleHeadset);
      }
    }
    else if (v22)
    {
      goto LABEL_49;
    }
LABEL_100:

LABEL_101:
    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(v72, 8);
    _Block_object_dispose(v74, 8);
    goto LABEL_102;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]", 30, "Evaluator: skip, tipi score below low");
  v29 = CFSTR("Tipi score below low");
LABEL_75:
  -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", v29);
LABEL_102:

}

- (void)_resetInUserBannerShown
{
  if (self->_prefSmartRoutingInUseBanner)
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_srDiscoveredDeviceMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001E2E60);
}

- (void)_smartRoutingAddWxMapDevice:(id)a3 routingAction:(int)a4 otherAddress:(id)a5 otherName:(id)a6 otherSourceVersion:(id)a7 isRoutingInitialized:(BOOL)a8 newWx:(BOOL)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  BTSmartRoutingWxDevice *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t Int64Ranged;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  BTSmartRoutingBudswapDevice *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *budSwapAddress;
  OS_dispatch_source *budSwapTimer;
  NSObject *v47;
  OS_dispatch_source *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  NSMutableDictionary *v58;
  NSMutableDictionary *v59;
  void *v60;
  unsigned int v61;
  _BOOL4 v62;
  unsigned int v63;
  id v64;
  id v65;

  v9 = a8;
  v65 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = objc_alloc_init(BTSmartRoutingWxDevice);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bleDevice"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bluetoothAddress"));

  if (objc_msgSend(v20, "length") == (id)6
    && (v21 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v20), "bytes"))),
        (v22 = objc_claimAutoreleasedReturnValue(v21)) != 0))
  {
    v23 = (void *)v22;
    v62 = v9;
    v63 = a4;
    v64 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bleDevice"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "advertisementFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v25, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);

    if (-[BTSmartRoutingDaemon _supportsSR:andProductID:](self, "_supportsSR:andProductID:", v23, Int64Ranged))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v23));

      if (!v27 || a9)
      {
        if (a9)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v23));

          if (v29)
          {
            if (dword_10020FA58 <= 90
              && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
            {
              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:]", 90, "Wx exists before we create! Cleanup device %@ first", v23);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", 0, v23);
          }
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));

        v32 = (void *)v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v31));
        v34 = objc_msgSend(v33, "isInEar");

        if (dword_10020FA58 <= 50
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
        {
          if (v63 > 5)
            v35 = "?";
          else
            v35 = off_1001E3E40[v63];
          v36 = "no";
          if (v62)
            v37 = "yes";
          else
            v37 = "no";
          if (a9)
            v38 = "yes";
          else
            v38 = "no";
          if (v34)
            v36 = "yes";
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:]", 50, "Creating SR WX device %@ with action %s otherAddress %@ otherName %@ routingInitialized %s newWx %s inEar %s, Tipi connection!", v23, v35, v64, v16, v37, v38, v36);
        }
        v61 = v34;
        v28 = v32;
        v39 = v63;
        if (-[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v23))
        {
          if (dword_10020FA58 <= 50
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:]", 50, "Marking the reconnection state as isConnected - _srBudswapDeviceMap");
          }
          if (self->_hfpBudswapDetected)
            self->_hfpBudswapDetected = 0;
          v40 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v23));
          if (!v40)
            v40 = objc_alloc_init(BTSmartRoutingBudswapDevice);
          -[BTSmartRoutingBudswapDevice setReconnectionState:](v40, "setReconnectionState:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v40, "otherTipiDeviceBTAddress"));

          if (v41)
          {
            v60 = v28;
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v40, "otherTipiDeviceBTAddress"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTName](v40, "otherTipiDeviceBTName"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceVersion](v40, "otherTipiDeviceVersion"));
            -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](self, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v23, v42, v43, v44);

            v28 = v60;
          }
          budSwapAddress = self->_budSwapAddress;
          self->_budSwapAddress = 0;

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_srBudswapDeviceMap, "setObject:forKeyedSubscript:", v40, v23);
          budSwapTimer = self->_budSwapTimer;
          if (budSwapTimer)
          {
            v47 = budSwapTimer;
            dispatch_source_cancel(v47);
            v48 = self->_budSwapTimer;
            self->_budSwapTimer = 0;

          }
          v39 = v63;
        }
        -[BTSmartRoutingWxDevice setDeviceAddress:](v18, "setDeviceAddress:", v23);
        -[BTSmartRoutingWxDevice setDeviceVersion:](v18, "setDeviceVersion:", 0);
        -[BTSmartRoutingWxDevice _setOtherTipiAudioCategory:](v18, "_setOtherTipiAudioCategory:", 0);
        -[BTSmartRoutingWxDevice _setHijackBackoffTick:](v18, "_setHijackBackoffTick:", 0);
        -[BTSmartRoutingWxDevice _setRoutedState:](v18, "_setRoutedState:", (_DWORD)v39 == 1);
        -[BTSmartRoutingWxDevice setConnected:](v18, "setConnected:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "name"));
        -[BTSmartRoutingWxDevice setDeviceName:](v18, "setDeviceName:", v49);

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "UUIDString"));
        -[BTSmartRoutingWxDevice setConduitDeviceID:](v18, "setConduitDeviceID:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "UUIDString"));
        -[BTSmartRoutingWxDevice setIdentifier:](v18, "setIdentifier:", v53);

        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bleDevice"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "advertisementFields"));
        -[BTSmartRoutingWxDevice setProductID:](v18, "setProductID:", CFDictionaryGetInt64Ranged(v55, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0));

        -[BTSmartRoutingWxDevice setInEar:](v18, "setInEar:", v61);
        -[BTSmartRoutingWxDevice setIsTipiHealingV2Eligible:](v18, "setIsTipiHealingV2Eligible:", 0);
        -[BTSmartRoutingWxDevice _setRoutingInitialized:](v18, "_setRoutingInitialized:", v62);
        -[BTSmartRoutingWxDevice setTipitableUpdated:](v18, "setTipitableUpdated:", 0);
        -[BTSmartRoutingWxDevice _setRoutingAction:](v18, "_setRoutingAction:", v39);
        v15 = v64;
        -[BTSmartRoutingWxDevice _setOtherTipiDeviceInfo:andName:andVersion:](v18, "_setOtherTipiDeviceInfo:andName:andVersion:", v64, v16, v17);
        -[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:](self, "_lowestBatteryInfoForSFDevice:", v65);
        -[BTSmartRoutingWxDevice setLowestBudBatteryInfo:](v18, "setLowestBudBatteryInfo:");
        if (v61)
          v56 = 1;
        else
          v56 = 3;
        -[BTSmartRoutingWxDevice _setRoutingUI:](v18, "_setRoutingUI:", v56);
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        if (!smartRoutingWxDeviceMap)
        {
          v58 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v59 = self->_smartRoutingWxDeviceMap;
          self->_smartRoutingWxDeviceMap = v58;

          smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", v18, v23);
        self->_autoRoutingTicks = mach_absolute_time();
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v23));
        v15 = v64;
        objc_msgSend(v28, "_setOtherTipiDeviceInfo:andName:andVersion:", v64, v16, v17);
      }

      if (-[BTSmartRoutingWxDevice routingAction](v18, "routingAction") == 2)
        ++self->_autoRoutingSingle;
      else
        ++self->_autoRoutingTipi;
    }
    else
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:]", 30, "Skip creating SR Wx device since headset doesn't support SR");
      }
      v15 = v64;
    }
  }
  else
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:]", 90, "No deviceAddressStr while creating SR WX device");
    }
    v23 = 0;
  }

}

- (void)_smartRoutingAddWxMapDeviceFromConnectedDevice:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BTSmartRoutingWxDevice *v12;
  BTSmartRoutingBudswapDevice *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *budSwapAddress;
  OS_dispatch_source *budSwapTimer;
  NSObject *v20;
  OS_dispatch_source *v21;
  NSMutableDictionary *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  const char *v31;
  unsigned int v32;
  uint64_t v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v4 = a3;
  if (!self->_smartRoutingWxDeviceMap)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    self->_smartRoutingWxDeviceMap = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
  v8 = CUPrintNSDataAddress();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (-[BTSmartRoutingDaemon _supportsSR:andProductID:](self, "_supportsSR:andProductID:", v9, objc_msgSend(v4, "productID")))
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v9));

      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice audioDestination](self->_sourceDevice, "audioDestination"));
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 30, "Creating SR WX device with address %@ from CONNECTED event. Current audio route %@", v9, v11);
        }
        self->_smartRoutingDisconnectReason = 0;
        v35 = 0;
        v36 = &v35;
        v37 = 0x2020000000;
        v38 = 0;
        v12 = objc_alloc_init(BTSmartRoutingWxDevice);
        if (-[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v9))
        {
          *((_BYTE *)v36 + 24) = 1;
          if (dword_10020FA58 <= 50
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 50, "Marking the reconnection state as isConnected - _srBudswapDeviceMap");
          }
          v13 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v9));
          if (!v13)
            v13 = objc_alloc_init(BTSmartRoutingBudswapDevice);
          -[BTSmartRoutingBudswapDevice setReconnectionState:](v13, "setReconnectionState:", 1);
          if (self->_hfpBudswapDetected)
            self->_hfpBudswapDetected = 0;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v13, "otherTipiDeviceBTAddress"));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v13, "otherTipiDeviceBTAddress"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTName](v13, "otherTipiDeviceBTName"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceVersion](v13, "otherTipiDeviceVersion"));
            -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](self, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v9, v15, v16, v17);

          }
          budSwapAddress = self->_budSwapAddress;
          self->_budSwapAddress = 0;

          budSwapTimer = self->_budSwapTimer;
          if (budSwapTimer)
          {
            v20 = budSwapTimer;
            dispatch_source_cancel(v20);
            v21 = self->_budSwapTimer;
            self->_budSwapTimer = 0;

          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_srBudswapDeviceMap, "setObject:forKeyedSubscript:", v13, v9);
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 30, "SmartRouting budswap re-connection, set routing appropriately");
          }

        }
        if (-[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"))
        {
          v22 = self->_smartRoutingWxDeviceMap;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100028000;
          v34[3] = &unk_1001E2D08;
          v34[4] = &v35;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v34);
        }
        v23 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", objc_msgSend(v4, "productID"))|| objc_msgSend(v4, "primaryPlacement") == 1|| objc_msgSend(v4, "secondaryPlacement") == 1;
        -[BTSmartRoutingWxDevice setDeviceAddress:](v12, "setDeviceAddress:", v9);
        -[BTSmartRoutingWxDevice setDeviceVersion:](v12, "setDeviceVersion:", 0);
        -[BTSmartRoutingWxDevice _setHijackBackoffTick:](v12, "_setHijackBackoffTick:", 0);
        -[BTSmartRoutingWxDevice _setRoutedState:](v12, "_setRoutedState:", 1);
        -[BTSmartRoutingWxDevice setConnected:](v12, "setConnected:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        -[BTSmartRoutingWxDevice setDeviceName:](v12, "setDeviceName:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        -[BTSmartRoutingWxDevice setConduitDeviceID:](v12, "setConduitDeviceID:", v25);

        -[BTSmartRoutingWxDevice setProductID:](v12, "setProductID:", objc_msgSend(v4, "productID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        -[BTSmartRoutingWxDevice setIdentifier:](v12, "setIdentifier:", v26);

        -[BTSmartRoutingWxDevice setInEar:](v12, "setInEar:", v23);
        -[BTSmartRoutingWxDevice setInEarDisabled:](v12, "setInEarDisabled:", objc_msgSend(v4, "primaryPlacement") == 7);
        -[BTSmartRoutingWxDevice setIsTipiHealingV2Eligible:](v12, "setIsTipiHealingV2Eligible:", 0);
        -[BTSmartRoutingWxDevice _setOtherTipiAudioCategory:](v12, "_setOtherTipiAudioCategory:", 0);
        -[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:](self, "_lowestBatteryInfoForCBDevice:", v4);
        -[BTSmartRoutingWxDevice setLowestBudBatteryInfo:](v12, "setLowestBudBatteryInfo:");
        -[BTSmartRoutingWxDevice _setRoutingInitialized:](v12, "_setRoutingInitialized:", -[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v9));
        -[BTSmartRoutingWxDevice setTipitableUpdated:](v12, "setTipitableUpdated:", 0);
        if (((unint64_t)objc_msgSend(v4, "deviceFlags") & 0x400000) != 0)
          v27 = 1;
        else
          v27 = 3;
        if (*((_BYTE *)v36 + 24))
          v28 = v27;
        else
          v28 = 2;
        -[BTSmartRoutingWxDevice _setRoutingAction:](v12, "_setRoutingAction:", v28);
        if (v23)
          v29 = 1;
        else
          v29 = 3;
        -[BTSmartRoutingWxDevice _setRoutingUI:](v12, "_setRoutingUI:", v29);
        -[BTSmartRoutingWxDevice _setOtherTipiDeviceInfo:andName:andVersion:](v12, "_setOtherTipiDeviceInfo:andName:andVersion:", 0, 0, 0);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", v12, v9);
        self->_autoRoutingTicks = mach_absolute_time();
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          v30 = -[BTSmartRoutingWxDevice routingAction](v12, "routingAction");
          if (v30 > 5)
            v31 = "?";
          else
            v31 = off_1001E3E40[v30];
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 30, "Current device route decision is %s", v31);
        }
        if (self->_prefSmartRoutingEnabledPhase3
          && !self->_tipiElectionInProgress
          && -[BTSmartRoutingDaemon _aacpConnectedCheck:](self, "_aacpConnectedCheck:", v4))
        {
          -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
        }
        if (-[NSMutableArray containsObject:](self->_smartRoutingManualDisconnectionList, "containsObject:", v9))
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 30, "Remove Wx from manual disconnect list");
          }
          -[NSMutableArray removeObject:](self->_smartRoutingManualDisconnectionList, "removeObject:", v9);
        }
        v32 = -[BTSmartRoutingWxDevice routingAction](v12, "routingAction");
        v33 = 112;
        if (v32 == 2)
          v33 = 96;
        ++*(_DWORD *)((char *)&self->super.isa + v33);

        _Block_object_dispose(&v35, 8);
      }
    }
    else if (dword_10020FA58 <= 90
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 90, "No address found when creating Wx");
    }
  }
  else if (dword_10020FA58 <= 30
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]", 30, "Skip creating SR Wx device since headset doesn't support SR");
  }

}

- (void)_smartRoutingShowBanner:(int)a3 withDevice:(id)a4 andDeviceAddress:(id)a5 andProductID:(unsigned int)a6 andCentralContentItemTxt:(id)a7 andTimeout:(double)a8 andDeviceType:(unsigned int)a9
{
  uint64_t v12;
  __CFString *v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  const char *v22;
  unsigned int v23;
  const char *v24;
  const char *v25;
  const char *v26;
  __CFString *v27;
  __CFString *v28;
  unsigned int v29;
  uint64_t v32;
  __CFString *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  double v43;
  __CFString *v44;
  _QWORD v45[6];
  id v46;
  uint64_t *v47;
  int v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;

  v12 = *(_QWORD *)&a6;
  v16 = (__CFString *)a4;
  v17 = a5;
  v18 = a7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v17));
  v20 = -[BTSmartRoutingDaemon _inEarConnectedCheck:](self, "_inEarConnectedCheck:", v17);
  if (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v12))
  {
    v20 = 1;
  }
  else if (!objc_msgSend(v19, "primaryPlacement")
         && !objc_msgSend(v19, "secondaryPlacement"))
  {
    v20 = -[BTSmartRoutingDaemon _inEarNearbyCheck:](self, "_inEarNearbyCheck:", v17);
  }
  if (-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn")
    && (!self->_systemUIProxCardPresent ? (v21 = v20) : (v21 = 0), v21 == 1 && !self->_effectiveScreenLocked))
  {
    if (a9)
    {
      v27 = CFSTR("Speaker");
      if (a9 == 20)
        v27 = CFSTR("Headset");
      v28 = v27;
    }
    else
    {
      if ((_DWORD)v12 == 8228)
        v29 = 8212;
      else
        v29 = v12;
      if ((v29 & 0xFFFFFFFD) == 0x2019 || v29 == 8222 || v29 == 8224)
        v32 = 8217;
      else
        v32 = v29;
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _productColorAssetLookup:andAddress:](self, "_productColorAssetLookup:andAddress:", v32, v17));
    }
    v33 = v28;
    v34 = objc_alloc_init((Class)BTBannerUISession);
    objc_storeStrong((id *)&self->_uiSmartRoutingBanner, v34);
    if (v16)
      v35 = v16;
    else
      v35 = &stru_1001ED4C0;
    objc_msgSend(v34, "setCenterContentText:", v35);
    objc_msgSend(v34, "setCenterContentItemsText:", v18);
    objc_msgSend(v34, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v34, "setLeadingAccessoryImageName:", v33);
    objc_msgSend(v34, "setTimeoutSeconds:", a8);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));
    objc_msgSend(v36, "lowestBudBatteryInfo");
    v38 = v37;

    if (v38 == 0.0)
    {
      v44 = v33;
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:]", 30, "Battery being shown on SR banner comes from nearbydevice map");
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v17));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v39));
      objc_msgSend(v41, "lowestBudBatteryInfo");
      objc_msgSend(v34, "setBatteryLevelInfo:");

      v33 = v44;
    }
    else
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:]", 30, "Battery being shown on SR banner comes from SR map");
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v17));
      objc_msgSend(v39, "lowestBudBatteryInfo");
      objc_msgSend(v34, "setBatteryLevelInfo:");
    }

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      if (a3 > 5)
        v42 = "?";
      else
        v42 = off_1001E3898[a3];
      objc_msgSend(v34, "batteryLevelInfo");
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:]", 30, "PostingBanner: Type %s, battery being shown %f", v42, v43);
    }
    if ((a3 - 3) <= 2)
      objc_msgSend(v34, "setTrailingAccessoryText:", *((_QWORD *)&off_1001E3880 + a3 - 3));
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = a3;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000285F8;
    v45[3] = &unk_1001E2EB0;
    v45[4] = v34;
    v45[5] = self;
    v48 = a3;
    v47 = &v49;
    v46 = v17;
    objc_msgSend(v34, "setActionHandler:", v45);
    if (*((_DWORD *)v50 + 6) == 1)
      -[BTSmartRoutingDaemon _setConnectedBannerTick:](self, "_setConnectedBannerTick:", mach_absolute_time());
    objc_msgSend(v34, "activate");

    _Block_object_dispose(&v49, 8);
  }
  else if (dword_10020FA58 <= 30
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn"))
      v22 = "on";
    else
      v22 = "off";
    v23 = -[CUSystemMonitor screenLocked](self->_powerMonitor, "screenLocked");
    v24 = "unlocked";
    if (v23)
      v24 = "locked";
    if (self->_systemUIProxCardPresent)
      v25 = "present";
    else
      v25 = "not present";
    v26 = "no";
    if (v20)
      v26 = "yes";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:]", 30, "SmartRouting unable to post banner screen is %s and it's %s and prox status card is %s inEarState is %s", v22, v24, v25, v26);
  }

}

- (void)_smartRoutingConnectionCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t Int64Ranged;
  unsigned int v12;
  unsigned int v13;
  const char *v14;
  const char *v15;
  const char *v16;
  SFDevice *connectDevice;
  CBConnection *connectSession;
  CBConnection *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *disconnectTicksMap;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  BTSmartRoutingPipe *smartRoutingPipe;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  unsigned __int8 v46;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  void *v48;
  BTSmartRoutingPipe *v49;
  SFDevice *eligibleHeadset;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_eligibleHeadset, "bleDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothAddress"));

  if (objc_msgSend(v6, "length") == (id)6)
  {
    v7 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v6), "bytes")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_eligibleHeadset, "bleDevice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v10, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);

  v12 = -[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress");
  if (dword_10020FA58 <= 30)
  {
    v13 = v12;
    if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
    {
      v14 = "yes";
      if (self->_forcedConnection)
        v15 = "yes";
      else
        v15 = "no";
      if (self->_tipiElectionInProgress)
        v16 = "yes";
      else
        v16 = "no";
      if (!v13)
        v14 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]", 30, "Evaluator: smartRoutingConnectionCompleted cleaning up items, FD %s, tipi election %s OnDemand %s", v15, v16, v14);
    }
  }
  connectDevice = self->_connectDevice;
  if (connectDevice)
  {
    self->_connectDevice = 0;

  }
  connectSession = self->_connectSession;
  if (connectSession)
  {
    -[CBConnection invalidate](connectSession, "invalidate");
    v19 = self->_connectSession;
    self->_connectSession = 0;

  }
  if (!self->_disconnectTicksMap)
  {
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    disconnectTicksMap = self->_disconnectTicksMap;
    self->_disconnectTicksMap = v20;

  }
  if (v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_disconnectTicksMap, "setObject:forKeyedSubscript:", &off_1001F4500, v8);
  self->_connectTicks = 0;
  self->_eligibleHeadsetTicks = 0;
  if (!v4)
  {
    if (!self->_prefSmartRoutingEnabledPhase3 || !self->_tipiElectionInProgress)
      goto LABEL_74;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "otherTipiDeviceVersion"));
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    if (v25 >= 1.2)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]", 30, "Version 1.2 cleanup pipes....");
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self->_lePipeDevice, "idsIdentifier"));
      smartRoutingPipe = self->_smartRoutingPipe;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10002945C;
      v53[3] = &unk_1001E2410;
      v53[4] = self;
      v53[5] = v8;
      -[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:](smartRoutingPipe, "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:", v30, v8, 0, CFSTR("connectionResultSuccess"), v53);

    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]", 30, "Legacy pipes.");
    }
    if (v8)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v8));

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
        objc_msgSend(v33, "setConnected:", 1);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v8));
      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v8));
        if (objc_msgSend(v35, "primaryPlacement") == 1)
        {
          v36 = 1;
        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v8));
          v36 = objc_msgSend(v37, "secondaryPlacement") == 1;

        }
      }
      else
      {
        v36 = 0;
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
      if (objc_msgSend(v38, "routingAction") == 3)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v8));
        objc_msgSend(v39, "reconnectionState");

      }
    }
    else
    {
      v36 = 0;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self->_eligibleHeadset, "identifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "UUIDString"));

    if (!v36)
      goto LABEL_68;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
    if (objc_msgSend(v42, "routingAction") == 1)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v8));
      v44 = objc_msgSend(v43, "reconnectionState");

      if (v44 == 1)
        goto LABEL_68;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v41));
      v46 = objc_msgSend(v45, "preemptiveBannerShown");

      if ((v46 & 1) != 0)
        goto LABEL_68;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice name](self->_eligibleHeadset, "name"));
      -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v42, v8, Int64Ranged, CFSTR("Connected"), 0, 4.0);
    }

LABEL_68:
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100029530;
    v52[3] = &unk_1001E2E88;
    v52[4] = v8;
    v52[5] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v52);

    goto LABEL_74;
  }
  if (self->_prefSmartRoutingNoBackOffTimers)
  {
    -[BTSmartRoutingDaemon _smartRoutingConnectToEligibleHeadset:](self, "_smartRoutingConnectToEligibleHeadset:", self->_eligibleHeadset);
    goto LABEL_78;
  }
  if (self->_prefSmartRoutingEnabledPhase3 && self->_tipiElectionInProgress)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "otherTipiDeviceVersion"));
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    if (v29 >= 1.2)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]", 30, "Sending connection failure reuslt");
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self->_lePipeDevice, "idsIdentifier"));
      v49 = self->_smartRoutingPipe;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000293B0;
      v54[3] = &unk_1001E2110;
      v54[4] = self;
      -[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:](v49, "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:", v48, v8, 0, CFSTR("connectionResultError"), v54);

    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]", 30, "Phase 1/Legacy pipes connection failure, skip sending connection result");
    }
    -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.PreemptivePortDisconnected");
  }
LABEL_74:
  self->_tipiElectionInProgress = 0;
  eligibleHeadset = self->_eligibleHeadset;
  self->_eligibleHeadset = 0;

  -[BTSmartRoutingDaemon _submitConnectionMetric:andError:](self, "_submitConnectionMetric:andError:", v8, v4);
  if (v4)
  {
    self->_forcedConnection = 0;
    phase1ConnectConfig = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = 0;

    if (v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", 0, v8);
  }
  -[BTSmartRoutingDaemon _submitNearbyDeviceMetric:](self, "_submitNearbyDeviceMetric:", Int64Ranged);
LABEL_78:

}

- (void)_smartRoutingConnectToEligibleHeadset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  SmartRoutingWxInfo *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_source_t v28;
  SmartRoutingWxInfo *v29;
  _QWORD handler[6];
  SmartRoutingWxInfo *v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bluetoothAddress"));

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_10001E9DC;
  v40 = sub_10001E9EC;
  v8 = objc_msgSend(v7, "length");
  v9 = 0;
  if (v8 == (id)6)
  {
    v10 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v7), "bytes")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  v41 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  v13 = mach_absolute_time();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v37[5]));
  v15 = UpTicksToMilliseconds(v13 - (_QWORD)objc_msgSend(v14, "lastWxAdvTicks"));

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectToEligibleHeadset:]", 30, "Evaluator: connect start: %@, %@, last wx adv is seen %llums", v37[5], v5, v15);
  objc_storeStrong((id *)&self->_connectDevice, a3);
  v16 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v16, "setIdentifier:", v37[5]);
  v17 = mach_absolute_time();
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v12));
  objc_msgSend(v18, "setLastConnectionTicks:", v17);

  v19 = objc_alloc_init((Class)CBConnection);
  objc_storeStrong((id *)&self->_connectSession, v19);
  objc_msgSend(v19, "setConnectionFlags:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));

  if (!v20)
  {
    v21 = objc_alloc_init((Class)NSMutableDictionary);
    -[BTSmartRoutingSourceDevice setEvalWxMap:](self->_sourceDevice, "setEvalWxMap:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
  v23 = (SmartRoutingWxInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v37[5]));

  if (!v23)
    v23 = objc_alloc_init(SmartRoutingWxInfo);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v12));
  -[SmartRoutingWxInfo setLastConnectTicks:](v23, "setLastConnectTicks:", objc_msgSend(v24, "lastConnectionTicks"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v37[5]);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v37[5]));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "otherTipiDeviceBTAddress"));

  if (v27)
    objc_msgSend(v19, "setConnectionFlags:", objc_msgSend(v19, "connectionFlags") | 8);
  objc_msgSend(v19, "setServiceFlags:", 0xFFFFFFFFLL);
  objc_msgSend(v19, "setPeerDevice:", v16);
  objc_msgSend(v19, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v19, "setConnectTimeoutSeconds:", 20.0);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10001E9DC;
  v34[4] = sub_10001E9EC;
  v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
  v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_connectDispatchTimer, v28);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100029C00;
  handler[3] = &unk_1001E2F40;
  handler[4] = v19;
  handler[5] = self;
  v32 = &v36;
  v33 = v34;
  v29 = v23;
  v31 = v29;
  dispatch_source_set_event_handler(v28, handler);
  CUDispatchTimerSet(v28, self->_prefConnectionDelaySeconds, -1.0, -10.0);
  dispatch_activate(v28);
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingConnectToEligibleHeadset:]", 30, "Connection Fired in %ll{dur}", (unint64_t)self->_prefConnectionDelaySeconds);
  self->_prefSpeakRouteConnection = 1;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);

}

- (void)_respondRoutingRequest:(id)a3 withResponseHandler:(id)a4 wxAddress:(id)a5
{
  void (**v8)(id, id);
  id v9;
  unsigned int v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  OS_dispatch_source *tipiHealingHijackTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = (void (**)(id, id))a4;
  v9 = a5;
  if (v8)
  {
    if (v19)
    {
      if (dword_10020FA58 <= 50
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
      {
        v10 = objc_msgSend(v19, "action");
        if (v10 > 5)
          v11 = "?";
        else
          v11 = off_1001E3E40[v10];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reason"));
        v13 = objc_msgSend(v19, "clientID");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceAddress"));
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]", 50, "RoutingRequestResponse: Action %s reason %@ CID 0x%X address %@", v11, v12, v13, v14);

      }
      tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
      if (tipiHealingHijackTimer)
      {
        v16 = tipiHealingHijackTimer;
        dispatch_source_cancel(v16);
        v17 = self->_tipiHealingHijackTimer;
        self->_tipiHealingHijackTimer = 0;

      }
      v8[2](v8, v19);
      if (v9)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v9));
        objc_msgSend(v18, "setAudioRoutingResponse:", 0);
        objc_msgSend(v18, "setAudioRoutingClientID:", 0);

      }
    }
    else if (dword_10020FA58 <= 90
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]", 90, "RoutingRequestResponse: Skip, response is  null");
    }
  }
  else if (dword_10020FA58 <= 90
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]", 90, "RoutingRequestResponse: Skip, no response handler");
  }

}

- (void)_hijackBlockingModeChangedFromClient:(id)a3 mode:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  BTSmartRoutingSourceDevice *sourceDevice;
  void *v14;
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v17 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (dword_10020FA58 <= 50 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceAddress"));
    v10 = (void *)v9;
    v11 = "no";
    if (v6)
      v11 = "yes";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _hijackBlockingModeChangedFromClient:mode:completion:]", 50, "HijackBlockingModeChangedFromClient: Wx %@ mode %s control %@", v9, v11, v17);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appBundleID"));

  if (v12)
  {
    sourceDevice = self->_sourceDevice;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appBundleID"));
    -[BTSmartRoutingSourceDevice _updateHijackBlockingClientWithBundleID:mode:](sourceDevice, "_updateHijackBlockingClientWithBundleID:mode:", v14, v6);

    v8[2](v8, 0);
  }
  else
  {
    if (dword_10020FA58 <= 50
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _hijackBlockingModeChangedFromClient:mode:completion:]", 50, "HijackBlockingModeChangedFromClient: Update failed. bundle ID is NULL");
    }
    v15 = objc_alloc((Class)NSError);
    v16 = objc_msgSend(v15, "initWithDomain:code:userInfo:", off_10020FA50, 1, 0);
    ((void (**)(id, id))v8)[2](v8, v16);

  }
}

- (void)_smartRoutingAudioRoutingRequest:(id)a3 withResponseHandler:(id)a4
{
  id v5;
  void *v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  __CFString *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  unsigned __int8 v15;
  id v16;
  const char *v17;
  NSMutableDictionary *v18;
  unsigned int v19;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  id v26;
  id v27;
  NSString *budSwapAddress;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  __CFString *v45;
  id v46;
  id v48;
  _QWORD v49[4];
  id v50;
  BTSmartRoutingDaemon *v51;
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  char v59;
  _QWORD v60[9];
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  __CFString *v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  _QWORD v84[5];
  _QWORD v85[5];

  v5 = a3;
  v46 = a4;
  v48 = objc_alloc_init((Class)BTAudioRoutingResponse);
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = sub_10001E9DC;
  v78 = sub_10001E9EC;
  v79 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceAddress"));
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = sub_10001E9DC;
  v72[4] = sub_10001E9EC;
  v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = sub_10001E9DC;
  v70[4] = sub_10001E9EC;
  v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = sub_10001E9DC;
  v68[4] = sub_10001E9EC;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_10001E9DC;
  v66 = sub_10001E9EC;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "options"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("AudioRequestCategory"), TypeID, 0);
  v9 = CFSTR("Not set");
  if (TypedValue)
    v9 = (__CFString *)TypedValue;
  v67 = v9;

  if (dword_10020FA58 <= 50 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceAddress"));
    v11 = objc_msgSend(v5, "audioScore");
    v12 = objc_msgSend(v5, "flags");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appBundleID"));
    if ((objc_msgSend(v5, "flags") & 2) != 0)
      v14 = "yes";
    else
      v14 = "no";
    v15 = objc_msgSend(v5, "flags");
    v16 = objc_msgSend(v5, "clientID");
    if ((v15 & 0x20) != 0)
      v17 = "yes";
    else
      v17 = "no";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]", 50, "Routing request Wx %@ score %d flag %d app %@ fake hijack %s wentInEar %s, CID 0x%X, category %@", v10, v11, v12, v13, v14, v17, v16, v63[5]);

  }
  if ((objc_msgSend(v5, "flags") & 0x10) != 0)
  {
    objc_msgSend(v48, "setAction:", 5);
    objc_msgSend(v48, "setReason:", CFSTR("Connecting"));
    objc_msgSend(v48, "setClientID:", objc_msgSend(v5, "clientID"));
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10002ABF0;
    v61[3] = &unk_1001E2D08;
    v61[4] = &v74;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v61);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v75[5]));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));

    objc_msgSend(v48, "setDeviceAddress:", v75[5]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v22));
    if (objc_msgSend(v23, "productID"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v22));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BTHeadphones76,%u"), objc_msgSend(v24, "productID")));

    }
    else
    {
      v45 = &stru_1001ED4C0;
    }

    v85[0] = v45;
    v84[0] = CFSTR("RouteModel");
    v84[1] = CFSTR("RouteName");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v22));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "name"));
    v31 = (void *)v30;
    v32 = CFSTR("Airpods");
    if (v30)
      v32 = (const __CFString *)v30;
    v85[1] = v32;
    v84[2] = CFSTR("RouteUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v22));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "address"));
    v35 = (void *)v34;
    if (v34)
      v36 = (const __CFString *)v34;
    else
      v36 = &stru_1001ED4C0;
    v85[2] = v36;
    v84[3] = CFSTR("BatteryLeft");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v22));
    objc_msgSend(v37, "batteryLeft");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v85[3] = v38;
    v84[4] = CFSTR("BatteryRight");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v22));
    objc_msgSend(v39, "batteryRight");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v85[4] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 5));
    objc_msgSend(v48, "setWxInfo:", v41);

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "wxInfo"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]", 30, "[Preemptive] nearby wx info %@", v42);

    }
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v48, v46, v75[5]);
    *((_BYTE *)v81 + 24) = 1;

  }
  else
  {
    if (v75[5])
      goto LABEL_50;
    v18 = self->_smartRoutingWxDeviceMap;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10002AC24;
    v60[3] = &unk_1001E2F68;
    v60[4] = self;
    v60[5] = &v74;
    v60[6] = v72;
    v60[7] = v70;
    v60[8] = v68;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v60);
    if (v75[5])
    {
LABEL_50:
      if (_os_feature_enabled_impl("AudioAccessoryFeatures", "SmartRoutingInEarQuery"))
        v19 = (objc_msgSend(v5, "flags") >> 5) & 1;
      else
        LOBYTE(v19) = 0;
      v25 = self->_smartRoutingWxDeviceMap;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10002ADBC;
      v49[3] = &unk_1001E2F90;
      v54 = &v74;
      v26 = v5;
      v50 = v26;
      v51 = self;
      v52 = v48;
      v27 = v46;
      v53 = v27;
      v55 = &v80;
      v56 = &v62;
      v57 = v68;
      v58 = v72;
      v59 = v19;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v25, "enumerateKeysAndObjectsUsingBlock:", v49);
      if (!*((_BYTE *)v81 + 24))
      {
        budSwapAddress = self->_budSwapAddress;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "deviceAddress"));
        LODWORD(budSwapAddress) = -[NSString isEqualToString:](budSwapAddress, "isEqualToString:", v29);

        if ((_DWORD)budSwapAddress)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]", 30, "Hijack: Budswap reconnect in progress. Respond DontRoute before Wx connected. Budswap Wx %@", self->_budSwapAddress);
          }
          objc_msgSend(v48, "setAction:", 3);
          objc_msgSend(v48, "setDeviceAddress:", 0);
          v43 = CFSTR("Budswap reconnect will happen soon");
        }
        else
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]", 30, "Hijack: respond MX to route if we don't find any SR Wx");
          }
          objc_msgSend(v48, "setAction:", 2);
          objc_msgSend(v48, "setDeviceAddress:", 0);
          v43 = CFSTR("Not tipi device");
        }
        objc_msgSend(v48, "setReason:", v43);
        objc_msgSend(v48, "setClientID:", objc_msgSend(v26, "clientID"));
        -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v48, v27, v75[5]);
      }

    }
    else
    {
      objc_msgSend(v48, "setAction:", 3);
      objc_msgSend(v48, "setDeviceAddress:", 0);
      objc_msgSend(v48, "setReason:", CFSTR("Tipi device, do not route, not inEar and/or inEar is not disabled."));
      objc_msgSend(v48, "setClientID:", objc_msgSend(v5, "clientID"));
      -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v48, v46, v75[5]);
    }
  }
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
}

- (void)_submitNearbyDeviceMetric:(unsigned int)a3
{
  NSMutableDictionary *nearbyInfoDevices;
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
  _QWORD v16[11];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  _QWORD v45[9];
  _QWORD v46[9];

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002C404;
  v16[3] = &unk_1001E2FB8;
  v16[4] = &v41;
  v16[5] = &v37;
  v16[6] = &v33;
  v16[7] = &v29;
  v16[8] = &v25;
  v16[9] = &v21;
  v16[10] = &v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v16);
  v45[0] = CFSTR("iPhoneNearby");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v42 + 6)));
  v46[0] = v5;
  v45[1] = CFSTR("iPadNearby");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v38 + 6)));
  v46[1] = v6;
  v45[2] = CFSTR("iPodNearby");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v34 + 6)));
  v46[2] = v7;
  v45[3] = CFSTR("macNearby");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v30 + 6)));
  v46[3] = v8;
  v45[4] = CFSTR("watchNearby");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v26 + 6)));
  v46[4] = v9;
  v45[5] = CFSTR("appleTvNearby");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v22 + 6)));
  v46[5] = v10;
  v45[6] = CFSTR("homePodNearby");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v18 + 6)));
  v46[6] = v11;
  v45[7] = CFSTR("totalNearby");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_nearbyInfoDevices, "count")));
  v46[7] = v12;
  v45[8] = CFSTR("wxPD");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3));
  v46[8] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 9));
  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.nearbyDevice"), v14);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

- (void)submitHijackMetric:(id)a3 withV1:(BOOL)a4
{
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  _QWORD v39[13];
  _QWORD v40[13];

  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:"));
    if (a4)
    {
      v7 = CFSTR("V1");
    }
    else
    {
      -[SmartRoutingStats setHijackContinuousTimeoutCount:](self->_stats, "setHijackContinuousTimeoutCount:", 0);
      -[SmartRoutingStats setHijackRelaySent:](self->_stats, "setHijackRelaySent:", 0);
      -[SmartRoutingStats setHijackRoundTripTime:](self->_stats, "setHijackRoundTripTime:", 0);
      v7 = CFSTR("V2");
    }
    v8 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackAnswer](self->_stats, "hijackAnswer"));
    v9 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    else
      v10 = CFSTR("NA");
    v11 = v10;

    v12 = v11;
    v36 = v11;
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Backoff")))
      v13 = CFSTR("All");
    else
      v13 = v7;
    v39[0] = CFSTR("askForHijack");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SmartRoutingStats hijackRelaySent](self->_stats, "hijackRelaySent")));
    v40[0] = v38;
    v39[1] = CFSTR("audioScore");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SmartRoutingStats hijackScore](self->_stats, "hijackScore")));
    v40[1] = v37;
    v39[2] = CFSTR("otherTipiDeviceScore");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "otherTipiAudioCategory")));
    v40[2] = v35;
    v39[3] = CFSTR("otherTipiDevicePlayingApp");
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "otherTipiDevicePlayingApp"));
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = CFSTR("NA");
    v40[3] = v16;
    v40[4] = v12;
    v39[4] = CFSTR("hijackAnswer");
    v39[5] = CFSTR("hijackVersion");
    v40[5] = v13;
    v39[6] = CFSTR("hijackContinousCount");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SmartRoutingStats hijackContinuousTimeoutCount](self->_stats, "hijackContinuousTimeoutCount")));
    v40[6] = v34;
    v39[7] = CFSTR("hijackRoundTripTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SmartRoutingStats hijackRoundTripTime](self->_stats, "hijackRoundTripTime")));
    v40[7] = v17;
    v39[8] = CFSTR("playingApp");
    v18 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingApp](self->_stats, "hijackPlayingApp"));
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1001ED4C0;
    v40[8] = v20;
    v39[9] = CFSTR("playingCategory");
    v21 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingCategory](self->_stats, "hijackPlayingCategory"));
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = &stru_1001ED4C0;
    v40[9] = v23;
    v39[10] = CFSTR("theOtherTipiDevice");
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "otherTipiDeviceBTName"));
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = &stru_1001ED4C0;
    v40[10] = v26;
    v39[11] = CFSTR("wxPD");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "productID")));
    v40[11] = v27;
    v39[12] = CFSTR("wxStreamState");
    v28 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats wxStreamState](self->_stats, "wxStreamState"));
    v32 = v6;
    v29 = (void *)v28;
    if (v28)
      v30 = (const __CFString *)v28;
    else
      v30 = &stru_1001ED4C0;
    v40[12] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 13, v32));
    CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.hijack"), v31);

    -[SmartRoutingStats setHijackRoundTripTime:](self->_stats, "setHijackRoundTripTime:", 0);
  }
}

- (void)submitRouteActivityMetric:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  unsigned int v16;
  __CFString *v17;
  const __CFString **v18;
  const __CFString **v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  id v44;
  void *v45;
  id v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  unsigned int v53;
  uint64_t v54;
  _QWORD v55[13];
  _QWORD v56[13];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v54 = 0;
    v53 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Manual_Route")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteDestination](self->_stats, "manualRouteDestination"));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Non-BT"));

      if (v10)
      {
        v11 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _findActiveWxDevice](self, "_findActiveWxDevice"));

        v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
        v8 = (void *)v12;
        v6 = (id)v11;
      }
    }
    v13 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
    v14 = (void *)v13;
    v15 = CFSTR("Unknown");
    if (v8)
    {
      if (v13)
      {
        v16 = -[BTSmartRoutingDaemon _deviceSupportsHijackV2:withDevice:](self, "_deviceSupportsHijackV2:withDevice:", v13, v8);
        v15 = CFSTR("V1");
        if (v16)
          v15 = CFSTR("V2");
      }
    }
    v17 = v15;
    v45 = v14;
    v46 = v6;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Hijack_Away")))
    {
      v51 = &stru_1001ED4C0;
      v52 = &stru_1001ED4C0;
      v18 = &v52;
      v19 = &v51;
      -[BTSmartRoutingDaemon getHijackedAwayAudioInfo:appCount:playingApp:route:remote:](self, "getHijackedAwayAudioInfo:appCount:playingApp:route:remote:", &v54, (char *)&v54 + 4, &v52, &v51, &v53);
    }
    else if (objc_msgSend(v7, "hasPrefix:", CFSTR("Hijack_")))
    {
      v49 = &stru_1001ED4C0;
      v50 = &stru_1001ED4C0;
      v18 = &v50;
      v19 = &v49;
      -[BTSmartRoutingDaemon getHijackAudioInfo:appCount:playingApp:route:remote:](self, "getHijackAudioInfo:appCount:playingApp:route:remote:", &v54, (char *)&v54 + 4, &v50, &v49, &v53);
    }
    else
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Remote_Manual_Route")) & 1) == 0
        && (objc_msgSend(v7, "hasPrefix:", CFSTR("Manual_Route")) & 1) == 0
        && !objc_msgSend(v7, "isEqualToString:", CFSTR("Reverse")))
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon submitRouteActivityMetric:activity:]", 30, "Metric submit unsupported activity %@", v7);
        }
        v38 = &stru_1001ED4C0;
        v35 = &stru_1001ED4C0;
        goto LABEL_32;
      }
      v47 = &stru_1001ED4C0;
      v48 = &stru_1001ED4C0;
      v18 = &v48;
      v19 = &v47;
      -[BTSmartRoutingDaemon getLocalAudioInfofromSnapshot:appCount:playingApp:route:remote:](self, "getLocalAudioInfofromSnapshot:appCount:playingApp:route:remote:", &v54, (char *)&v54 + 4, &v48, &v47, &v53);
    }
    v42 = (id)*v18;
    v39 = (id)*v19;
    v55[0] = CFSTR("Activity");
    v55[1] = CFSTR("BundleID");
    v56[0] = v7;
    v56[1] = v42;
    v55[2] = CFSTR("DestinationRoute");
    v20 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteDestination](self->_stats, "manualRouteDestination"));
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = CFSTR("NA");
    v56[2] = v22;
    v56[3] = v17;
    v55[3] = CFSTR("HijackVersion");
    v55[4] = CFSTR("InTipi");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherTipiDeviceBTAddress"));
    v23 = CFSTR("YES");
    if (!v41)
      v23 = CFSTR("NO");
    v56[4] = v23;
    v55[5] = CFSTR("LocalScore");
    v44 = v7;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v54));
    v56[5] = v40;
    v55[6] = CFSTR("ManualRouteInputOutput");
    v24 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteInputOutput](self->_stats, "manualRouteInputOutput"));
    v43 = v17;
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = CFSTR("NA");
    v56[6] = v26;
    v55[7] = CFSTR("ManualRouteUISource");
    v27 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteUISource](self->_stats, "manualRouteUISource"));
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = CFSTR("NA");
    v56[7] = v29;
    v55[8] = CFSTR("NumOfApps");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v54)));
    v56[8] = v30;
    v55[9] = CFSTR("OtherTipiDeviceModel");
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherTipiDeviceBTName"));
    v32 = (void *)v31;
    if (v31)
      v33 = (const __CFString *)v31;
    else
      v33 = CFSTR("NA");
    v56[9] = v33;
    v55[10] = CFSTR("RemoteScore");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v53));
    v35 = v39;
    v56[10] = v34;
    v56[11] = v39;
    v55[11] = CFSTR("Route");
    v55[12] = CFSTR("ProductID");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "productID")));
    v56[12] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 13));
    CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.RouteActivity"), v37);

    v7 = v44;
    v38 = v42;

    v17 = v43;
    v14 = v45;
    v6 = v46;
LABEL_32:

  }
}

- (void)_smartRoutingChangeRoute:(id)a3
{
  id v4;
  CFIndex v5;
  const void *ValueAtIndex;
  const void *v7;
  void *v8;
  id v9;
  uint64_t SharedAudioPresentationContext;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (!-[__CFArray count](self->_mediaRemoteOutputDevices, "count"))
    goto LABEL_13;
  v5 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(self->_mediaRemoteOutputDevices, v5);
    if (ValueAtIndex)
      break;
LABEL_6:
    if (++v5 >= (unint64_t)-[__CFArray count](self->_mediaRemoteOutputDevices, "count"))
      goto LABEL_13;
  }
  v7 = ValueAtIndex;
  v8 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
  v9 = objc_msgSend(v8, "containsString:", v4);
  if (!(_DWORD)v9)
  {

    goto LABEL_6;
  }
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1 || (v9 = (id)_LogCategory_Initialize(&dword_10020FA58, 30), (_DWORD)v9))
      v9 = (id)LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingChangeRoute:]", 30, "Set Route for device: %@", v7);
  }
  self->_routeChangeInProgress = 1;
  SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext(v9);
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002CF98;
  v12[3] = &unk_1001E2FE0;
  v12[4] = self;
  v13 = v4;
  MRAVOutputContextSetOutputDevice(SharedAudioPresentationContext, v7, dispatchQueue, v12);

LABEL_13:
}

- (void)_smartRoutingRouteCompleted:(__CFError *)a3 withUUID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  BTSmartRoutingDaemon *v17;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (dword_10020FA58 <= 90)
    {
      v12 = v6;
      if (dword_10020FA58 != -1 || (v8 = _LogCategory_Initialize(&dword_10020FA58, 90), v7 = v12, v8))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingRouteCompleted:withUUID:]", 90, "SmartRouting unable to set route due to: %{error}", a3);
LABEL_18:
        v7 = v12;
      }
    }
  }
  else
  {
    if (dword_10020FA58 <= 40)
    {
      v13 = v6;
      if (dword_10020FA58 != -1 || (v9 = _LogCategory_Initialize(&dword_10020FA58, 40), v7 = v13, v9))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingRouteCompleted:withUUID:]", 40, "SmartRouting successfully set route to %@", v7);
        v7 = v13;
      }
    }
    if (!self->_proactiveRoutingInProgress)
    {
      v12 = v7;
      if (self->_prefSmartRoutingEnabledPhase3
        && ((objc_msgSend(v7, "containsString:", CFSTR("-tacl")) & 1) != 0
         || objc_msgSend(v12, "containsString:", CFSTR("-tsco"))))
      {
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10002D170;
        v15[3] = &unk_1001E2E88;
        v16 = v12;
        v17 = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v15);

      }
      else
      {
        v11 = self->_smartRoutingWxDeviceMap;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10002D238;
        v14[3] = &unk_1001E3008;
        v14[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v14);
      }
      goto LABEL_18;
    }
    self->_proactiveRoutingInProgress = 0;
  }

}

- (void)_smartRoutingLowerRateScan
{
  dispatch_time_t v3;
  NSObject *smartRoutingLowerScanRateTimer;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  _QWORD handler[5];

  v3 = dispatch_time(0, 10000000000);
  smartRoutingLowerScanRateTimer = self->_smartRoutingLowerScanRateTimer;
  if (smartRoutingLowerScanRateTimer)
  {
    dispatch_source_set_timer(smartRoutingLowerScanRateTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v6 = self->_smartRoutingLowerScanRateTimer;
    self->_smartRoutingLowerScanRateTimer = v5;

    v7 = self->_smartRoutingLowerScanRateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002D460;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_smartRoutingLowerScanRateTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_smartRoutingLowerScanRateTimer);
  }
}

- (void)_lowBatteryLoad
{
  BTSmartRoutingDaemon *v2;
  CFTypeID TypeID;
  id v4;
  void **p_vtable;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  CFTypeID v12;
  uint64_t TypedValue;
  void *v14;
  BTLowBatteryDevice *v15;
  CFTypeID v16;
  CFTypeID v17;
  NSMutableDictionary *lowBatteryDeviceMap;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  char *v26;
  const char *v27;
  uint64_t v28;
  int v29;
  BTSmartRoutingDaemon *v30;
  int v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  if (!self->_lowBatteryLoaded)
  {
    v2 = self;
    TypeID = CFArrayGetTypeID();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), CFSTR("lowBatteryDevices"), TypeID, 0);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
    if (v4)
    {
      v6 = v4;
      v7 = 0;
      v8 = *(_QWORD *)v34;
      v30 = v2;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = CFStringGetTypeID();
            TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("id"), v12, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
            if (v14)
            {
              v15 = objc_alloc_init(BTLowBatteryDevice);
              v16 = CFStringGetTypeID();
              -[BTLowBatteryDevice setDeviceAddress:](v15, "setDeviceAddress:", CFDictionaryGetTypedValue(v10, CFSTR("deviceAddress"), v16, 0));
              -[BTLowBatteryDevice setIdentifier:](v15, "setIdentifier:", v14);
              v17 = CFStringGetTypeID();
              -[BTLowBatteryDevice setName:](v15, "setName:", CFDictionaryGetTypedValue(v10, CFSTR("name"), v17, 0));
              CFDictionaryGetDouble(v10, CFSTR("batteryLevel"), 0);
              -[BTLowBatteryDevice setLastBatteryLevel:](v15, "setLastBatteryLevel:");
              -[BTLowBatteryDevice setLastBatteryType:](v15, "setLastBatteryType:", (int)CFDictionaryGetInt64Ranged(v10, CFSTR("batteryType"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0));
              CFDictionaryGetDouble(v10, CFSTR("lastSeen"), 0);
              -[BTLowBatteryDevice setLastSeenTime:](v15, "setLastSeenTime:");
              -[BTLowBatteryDevice setProductID:](v15, "setProductID:", CFDictionaryGetInt64Ranged(v10, CFSTR("productID"), 0, 0xFFFFFFFFLL, 0));
              CFDictionaryGetDouble(v10, CFSTR("reportTime"), 0);
              -[BTLowBatteryDevice setReportTime:](v15, "setReportTime:");
              lowBatteryDeviceMap = v2->_lowBatteryDeviceMap;
              if (!lowBatteryDeviceMap)
              {
                v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                v20 = v2->_lowBatteryDeviceMap;
                v2->_lowBatteryDeviceMap = v19;

                lowBatteryDeviceMap = v2->_lowBatteryDeviceMap;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](lowBatteryDeviceMap, "setObject:forKeyedSubscript:", v15, v14);
              v21 = *((_DWORD *)p_vtable + 662);
              if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                v31 = v7;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[BTLowBatteryDevice deviceAddress](v15, "deviceAddress"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[BTLowBatteryDevice name](v15, "name"));
                -[BTLowBatteryDevice lastBatteryLevel](v15, "lastBatteryLevel");
                v25 = v24;
                v26 = -[BTLowBatteryDevice lastBatteryType](v15, "lastBatteryType");
                v27 = "?";
                if ((unint64_t)(v26 - 1) <= 3)
                  v27 = off_1001E3BE8[(_QWORD)(v26 - 1)];
                -[BTLowBatteryDevice reportTime](v15, "reportTime");
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryLoad]", 30, "Low battery loaded: DA %@, Name '%@', Battery %.0f%% (%s), ReportTime %{DateCF}", v22, v23, v25 * 100.0, v27, v28);

                v2 = v30;
                v7 = v31;
                p_vtable = (void **)(_TtC15audioaccessoryd11XPCMessages + 24);
              }
              ++v7;

            }
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v2->_lowBatteryLoaded = 1;
    v29 = *((_DWORD *)p_vtable + 662);
    if (v29 <= 30 && (v29 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryLoad]", 30, "Low battery loaded: %d total", v7);

  }
}

- (void)_lowBatterySave:(BOOL)a3
{
  id *p_lowBatterySaveTimer;
  OS_dispatch_source *lowBatterySaveTimer;
  NSObject *v6;
  id v7;
  NSMutableDictionary *lowBatteryDeviceMap;
  dispatch_source_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD handler[5];

  p_lowBatterySaveTimer = (id *)&self->_lowBatterySaveTimer;
  lowBatterySaveTimer = self->_lowBatterySaveTimer;
  if (a3)
  {
    if (lowBatterySaveTimer)
    {
      v6 = lowBatterySaveTimer;
      dispatch_source_cancel(v6);
      v7 = *p_lowBatterySaveTimer;
      *p_lowBatterySaveTimer = 0;

    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_10001E9DC;
    v15 = sub_10001E9EC;
    v16 = 0;
    lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002DB2C;
    v10[3] = &unk_1001E3030;
    v10[4] = &v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lowBatteryDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v10);
    CFPrefs_SetValue(CFSTR("com.apple.bluetooth"), CFSTR("lowBatteryDevices"), v12[5]);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatterySave:]", 30, "Low battery saved: %d total", objc_msgSend((id)v12[5], "count"));
    }
    _Block_object_dispose(&v11, 8);

  }
  else if (!lowBatterySaveTimer)
  {
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong(p_lowBatterySaveTimer, v9);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002DB20;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    CUDispatchTimerSet(v9, self->_prefLowBatterySaveSeconds, -1.0, -10.0);
    dispatch_activate(v9);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatterySave:]", 30, "Low battery save in %ll{dur}", (unint64_t)self->_prefLowBatterySaveSeconds);
    }

  }
}

- (void)_lowBatteryUpdate
{
  NSMutableDictionary *lowBatteryWxDevices;
  double Current;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  BTBannerUISession *uiLowBatteryBanner;
  unsigned int v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[10];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  int v58;
  _BYTE v59[128];
  _BYTE v60[128];

  if (self->_prefLowBatteryEnabled)
  {
    -[BTSmartRoutingDaemon _lowBatteryLoad](self, "_lowBatteryLoad");
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = sub_10001E9DC;
    v43 = sub_10001E9EC;
    v44 = 0;
    lowBatteryWxDevices = self->_lowBatteryWxDevices;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10002E308;
    v38[3] = &unk_1001E3058;
    v38[4] = self;
    v38[5] = v45;
    v38[6] = &v55;
    v38[7] = &v51;
    v38[8] = &v47;
    v38[9] = &v39;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lowBatteryWxDevices, "enumerateKeysAndObjectsUsingBlock:", v38);
    Current = CFAbsoluteTimeGetCurrent();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_lowBatteryDeviceMap, "allKeys"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v60, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lowBatteryDeviceMap, "objectForKeyedSubscript:", v10));
          objc_msgSend(v11, "lastSeenTime");
          if (vabdd_f64(Current, v12) >= self->_prefLowBatteryStaleSeconds)
          {
            objc_msgSend(v11, "reportTime");
            if (vabdd_f64(Current, v13) >= self->_prefLowBatteryStaleSeconds)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lowBatteryDeviceMap, "setObject:forKeyedSubscript:", 0, v10);
              ++v7;
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceAddress"));
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryUpdate]", 30, "Low battery removed stale: %@ '%@'", v14, v15);

              }
            }
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v60, 16);
      }
      while (v6);

      if (v7 >= 1)
        -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0);
    }
    else
    {

      v7 = 0;
    }
    if (-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn")
      && !self->_effectiveScreenLocked
      && !self->_uiLowBatteryBanner
      && !self->_uiNoteSessionLowBattery
      && !self->_systemUIProxCardPresent)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = (id)v40[5];
      v17 = 0;
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v59, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v21, "lastBatteryType"))
            {
              objc_msgSend(v17, "lastBatteryLevel");
              v23 = v22;
              if (v22 == 0.0 || (objc_msgSend(v21, "lastBatteryLevel"), v23 >= v24))
              {
                v25 = v21;

                v17 = v25;
              }
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v59, 16);
        }
        while (v18);
      }

      v26 = v17;
      if (v26)
        -[BTSmartRoutingDaemon _lowBatteryShowAlertWithLowBatteryDevice:](self, "_lowBatteryShowAlertWithLowBatteryDevice:", v26);

    }
    if (self->_uiLowBatteryBanner && self->_systemUIProxCardPresent)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryUpdate]", 30, "Low battery dismiss on prox card");
      }
      -[BTBannerUISession invalidate](self->_uiLowBatteryBanner, "invalidate");
      uiLowBatteryBanner = self->_uiLowBatteryBanner;
      self->_uiLowBatteryBanner = 0;

    }
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v28 = -[NSMutableDictionary count](self->_lowBatteryWxDevices, "count");
      v29 = "yes";
      if (!self->_systemUIProxCardPresent)
        v29 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryUpdate]", 30, "Low battery update: %d total, %d AC, %d high, %d low, %d stale, Prox %s", v28, *((_DWORD *)v56 + 6), *((_DWORD *)v52 + 6), *((_DWORD *)v48 + 6), v7, v29);
    }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
  }
}

- (void)_lowBatteryDeviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *lowBatteryWxDevices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v4 = a3;
  if (self->_prefLowBatteryEnabled)
  {
    v10 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

    if (v6)
    {
      lowBatteryWxDevices = self->_lowBatteryWxDevices;
      if (!lowBatteryWxDevices)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v9 = self->_lowBatteryWxDevices;
        self->_lowBatteryWxDevices = v8;

        lowBatteryWxDevices = self->_lowBatteryWxDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](lowBatteryWxDevices, "setObject:forKeyedSubscript:", v10, v6);
      -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    }

    v4 = v10;
  }

}

- (void)_lowBatteryDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v5 = v6;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lowBatteryWxDevices, "setObject:forKeyedSubscript:", 0, v6);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    v5 = v6;
  }

}

- (BOOL)_lowBatteryTrackSFDevice:(id)a3 batteryLevel:(double)a4 batteryType:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t CFDataOfLength;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t Int64Ranged;
  uint64_t v19;
  BTLowBatteryDevice *v20;
  NSMutableDictionary *lowBatteryDeviceMap;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  BOOL v24;
  int64_t v26;
  void *v27;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

  if (v10)
  {
    v26 = a5;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "advertisementFields"));
    CFDataOfLength = CFDictionaryGetCFDataOfLength(v11, CFSTR("publicAddress"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    v14 = v13;
    if (v13)
    {
      v15 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v13), "bytes")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v11, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);
    v19 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lowBatteryDeviceMap, "objectForKeyedSubscript:", v10));
    v20 = (BTLowBatteryDevice *)v19;
    if (!v19)
    {
      v20 = objc_alloc_init(BTLowBatteryDevice);
      -[BTLowBatteryDevice setIdentifier:](v20, "setIdentifier:", v10);
      lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
      if (!lowBatteryDeviceMap)
      {
        v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v23 = self->_lowBatteryDeviceMap;
        self->_lowBatteryDeviceMap = v22;

        lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](lowBatteryDeviceMap, "setObject:forKeyedSubscript:", v20, v10);
    }
    -[BTLowBatteryDevice setDeviceAddress:](v20, "setDeviceAddress:", v16);
    -[BTLowBatteryDevice setLastBatteryLevel:](v20, "setLastBatteryLevel:", a4);
    -[BTLowBatteryDevice setLastBatteryType:](v20, "setLastBatteryType:", v26);
    -[BTLowBatteryDevice setLastSeenTime:](v20, "setLastSeenTime:", CFAbsoluteTimeGetCurrent());
    -[BTLowBatteryDevice setName:](v20, "setName:", v17);
    -[BTLowBatteryDevice setProductID:](v20, "setProductID:", Int64Ranged);
    -[BTLowBatteryDevice setReportTime:](v20, "setReportTime:", 0.0);
    if (!v19
      && dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryTrackSFDevice:batteryLevel:batteryType:]", 30, "Low battery tracked: DA %@, PID %u, Name '%@', %@", v16, Int64Ranged, v17, v27);
    }
    -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0);

    v24 = v19 == 0;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)_lowBatteryClearSFDevice:(id)a3 reason:(const char *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lowBatteryDeviceMap, "objectForKeyedSubscript:", v8));
    v10 = v9;
    v11 = v9 != 0;
    if (v9)
    {
      objc_msgSend(v9, "setLastBatteryLevel:", 0.0);
      objc_msgSend(v10, "setLastBatteryType:", 0);
      objc_msgSend(v10, "setLastSeenTime:", CFAbsoluteTimeGetCurrent());
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceAddress"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryClearSFDevice:reason:]", 30, "Low battery cleared: DA %@, Name '%@', %@, %s", v12, v13, v14, a4);

      }
      -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_lowBatteryReportGood:(id)a3
{
  CFTypeID TypeID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  TypeID = CFDictionaryGetTypeID();
  v4 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), CFSTR("lowBatteryInfo"), TypeID, 0);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));

      if (v8)
      {
        v8 = objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v7);
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "counterpartIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));

      if (v11)
      {
        if (!v8)
          v8 = objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v10);
      }
    }
    if (v8)
    {
      CFPrefs_SetValue(CFSTR("com.apple.bluetooth"), CFSTR("lowBatteryInfo"), v8);
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryReportGood:]", 30, "Low battery cleared: %@", v5);
      }
    }

  }
}

- (void)_lowBatteryReset
{
  NSMutableDictionary *lowBatteryDeviceMap;

  CFPrefs_RemoveValue(CFSTR("com.apple.bluetooth"), CFSTR("lowBatteryInfo"));
  CFPrefs_RemoveValue(CFSTR("com.apple.bluetooth"), CFSTR("lowBatteryDevices"));
  lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
  self->_lowBatteryDeviceMap = 0;

  self->_lowBatteryLoaded = 0;
  -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");
}

- (void)_lowBatteryShowAlertWithLowBatteryDevice:(id)a3
{
  id v4;
  double v5;
  double v6;
  char *v7;
  __CFString *v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[6];

  v4 = a3;
  objc_msgSend(v4, "lastBatteryLevel");
  v6 = v5;
  v7 = (char *)objc_msgSend(v4, "lastBatteryType");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v9 = objc_msgSend(v4, "productID");
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceAddress"));
    if ((unint64_t)(v7 - 1) > 3)
      v11 = "?";
    else
      v11 = off_1001E3BE8[(_QWORD)(v7 - 1)];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowBatteryShowAlertWithLowBatteryDevice:]", 30, "Low Battery banner: DA %@, PID %u, Name '%@', Battery %.0f%% (%s)", v10, v9, v8, v6 * 100.0, v11);

  }
  v12 = objc_alloc_init((Class)BTBannerUISession);
  objc_storeStrong((id *)&self->_uiLowBatteryBanner, v12);
  objc_msgSend(v12, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v12, "setLowBatteryLevel:", v6);
  objc_msgSend(v12, "setTimeoutSeconds:", 4.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceAddress"));
  if (v7 == (char *)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductIDToCaseAsset:andAddress:](self, "_bluetoothProductIDToCaseAsset:andAddress:", v9, v13));
    v15 = CFSTR("AirPods Case");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductIDToAsset:](self, "_bluetoothProductIDToAsset:", v9));
    v15 = v8;
  }
  objc_msgSend(v12, "setCenterContentText:", v15);
  objc_msgSend(v12, "setLeadingAccessoryImageName:", v14);
  objc_msgSend(v12, "setCenterContentItemsIcon:", CFSTR("LowBattery"));
  v16 = objc_alloc_init((Class)NSNumberFormatter);
  objc_msgSend(v16, "setNumberStyle:", 3);
  objc_msgSend(v16, "setMaximumFractionDigits:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromNumber:", v17));
  objc_msgSend(v12, "setCenterContentItemsText:", v18);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002F260;
  v19[3] = &unk_1001E29B8;
  v19[4] = v12;
  v19[5] = self;
  objc_msgSend(v12, "setActionHandler:", v19);
  objc_msgSend(v12, "activate");
  objc_msgSend(v4, "setReportTime:", CFAbsoluteTimeGetCurrent());
  -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 1);

}

- (void)_aaControllerEnsureStarted
{
  AAController **p_aaController;
  AAController *v4;
  AAController *v5;
  _QWORD v6[4];
  AAController *v7;
  BTSmartRoutingDaemon *v8;

  p_aaController = &self->_aaController;
  v4 = self->_aaController;
  if (!v4)
  {
    v5 = objc_alloc_init(AAController);
    -[AAController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    -[AAController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_1001E3078);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F454;
    v6[3] = &unk_1001E2410;
    v4 = v5;
    v7 = v4;
    v8 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v6);

  }
}

- (void)_aaControllerEnsureStopped
{
  AAController *aaController;
  AAController *v4;

  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    v4 = self->_aaController;
    self->_aaController = 0;

  }
}

- (void)_activityMonitorEnsureStarted
{
  int *p_activityLevelNotifyToken;
  OS_dispatch_queue *dispatchQueue;
  int activityLevelNotifyToken;
  _QWORD v6[5];
  uint64_t state64;

  p_activityLevelNotifyToken = &self->_activityLevelNotifyToken;
  if (self->_activityLevelNotifyToken == -1)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _activityMonitorEnsureStarted]", 30, "Activity Monitor Ensure Started");
    }
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F690;
    v6[3] = &unk_1001E2398;
    v6[4] = self;
    notify_register_dispatch("com.apple.sharing.activity-level-changed", p_activityLevelNotifyToken, (dispatch_queue_t)dispatchQueue, v6);
    activityLevelNotifyToken = self->_activityLevelNotifyToken;
    state64 = 0;
    notify_get_state(activityLevelNotifyToken, &state64);
    self->_activityLevel = state64;
    -[BTSmartRoutingDaemon _nearbyInfoActivityChanged](self, "_nearbyInfoActivityChanged");
    -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
  }
}

- (void)_activityMonitorEnsureStopped
{
  int activityLevelNotifyToken;
  CBController *smartRoutingController;
  CBController *v5;

  if (self->_activityLevelNotifyToken != -1)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _activityMonitorEnsureStopped]", 30, "Activity Monitor Ensure Stopped");
    }
    self->_activityLevel = 0;
    -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
    activityLevelNotifyToken = self->_activityLevelNotifyToken;
    if (activityLevelNotifyToken != -1)
    {
      notify_cancel(activityLevelNotifyToken);
      self->_activityLevelNotifyToken = -1;
    }
  }
  smartRoutingController = self->_smartRoutingController;
  if (smartRoutingController)
  {
    -[CBController invalidate](smartRoutingController, "invalidate");
    v5 = self->_smartRoutingController;
    self->_smartRoutingController = 0;

  }
}

- (void)_callMonitorEnsureStarted
{
  CUSystemMonitor *v3;
  CUSystemMonitor *callMonitor;
  CUSystemMonitor *v5;
  _QWORD *v6;
  _QWORD v7[6];

  if (!self->_callMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    callMonitor = self->_callMonitor;
    self->_callMonitor = v3;
    v5 = v3;

    -[CUSystemMonitor setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002F924;
    v7[3] = &unk_1001E23E8;
    v7[4] = v5;
    v7[5] = self;
    v6 = objc_retainBlock(v7);
    -[CUSystemMonitor setCallChangedHandler:](v5, "setCallChangedHandler:", v6);
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);

  }
}

- (void)_callMonitorEnsureStopped
{
  CUSystemMonitor *callMonitor;

  -[CUSystemMonitor invalidate](self->_callMonitor, "invalidate");
  callMonitor = self->_callMonitor;
  self->_callMonitor = 0;

}

- (void)_connectedDeviceMonitorEnsureStarted
{
  CBDiscovery *v3;
  CBDiscovery *connectedDiscovery;
  CBDiscovery *v5;
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_connectedDiscovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStarted]", 30, "_connectedDeviceMonitorEnsureStarted");
    }
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    connectedDiscovery = self->_connectedDiscovery;
    self->_connectedDiscovery = v3;
    v5 = v3;

    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setLabel:](v5, "setLabel:", CFSTR("SmartRouting"));
    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", (unint64_t)-[CBDiscovery discoveryFlags](v5, "discoveryFlags") | 0x80000200000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002FC98;
    v9[3] = &unk_1001E30A0;
    v9[4] = self;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002FCA4;
    v8[3] = &unk_1001E20E8;
    v8[4] = self;
    -[CBDiscovery setBluetoothStateChangedHandler:](v5, "setBluetoothStateChangedHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002FDBC;
    v7[3] = &unk_1001E30A0;
    v7[4] = self;
    -[CBDiscovery setDeviceLostHandler:](v5, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002FDC8;
    v6[3] = &unk_1001E2410;
    v6[4] = self;
    v6[5] = v5;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);

  }
}

- (void)_connectedDeviceMonitorEnsureStopped
{
  CBDiscovery *connectedDiscovery;

  if (self->_connectedDiscovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStopped]", 30, "_connectedDeviceMonitorEnsureStopped");
    }
    -[CBDiscovery invalidate](self->_connectedDiscovery, "invalidate");
    connectedDiscovery = self->_connectedDiscovery;
    self->_connectedDiscovery = 0;

  }
}

- (void)_connectedDeviceFound:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *connectedDevices;
  NSMutableDictionary *v12;
  NSMutableDictionary *connectedDevicesInEarCache;
  void *v14;
  void **p_vtable;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 hijackBackOffInitiator;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  SFDevice *connectDevice;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  unint64_t v75;
  void *v76;
  void *v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  int v81;
  const char *v82;
  const char *v83;
  const char *v84;
  void *v85;
  void *v86;
  id v87;
  int v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  unsigned int v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  unsigned int v100;
  const char *v101;
  void *v102;
  unsigned int v103;
  unint64_t v104;
  void *v105;
  void *v106;
  unsigned int v107;
  _BOOL8 v108;
  unsigned int v109;
  unsigned int v110;
  _BOOL4 forcedConnection;
  int v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  BOOL v117;
  char v118;
  void *v119;
  void *v120;
  unsigned int v121;
  void *v122;
  int v123;
  int v124;
  void *v125;
  int v126;
  const char *v127;
  const char *v128;
  const char *v129;
  unsigned int v130;
  const char *v131;
  int v132;
  const char *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  int v139;
  const char *v140;
  const char *v141;
  unsigned int v142;
  const char *v143;
  int v144;
  const char *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  int v150;
  void *v151;
  void *v152;
  void *v153;
  unsigned __int8 v154;
  int v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  _BOOL4 v161;
  const char *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  int v168;
  unsigned int v169;
  _BOOL4 v170;
  unsigned int v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;

  v176 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "btAddressData"));
  v5 = CUPrintNSDataAddress();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "identifier"));
    objc_msgSend(v8, "connectionUpdatedForBluetoothIdentifier:connected:", v9, 1);

    if ((objc_msgSend(v176, "connectedServices") & 0x11) == 0)
    {
LABEL_279:

      goto LABEL_280;
    }
    if (!self->_connectedDevices)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      connectedDevices = self->_connectedDevices;
      self->_connectedDevices = v10;

    }
    if (!self->_connectedDevicesInEarCache)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      connectedDevicesInEarCache = self->_connectedDevicesInEarCache;
      self->_connectedDevicesInEarCache = v12;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));

    p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
    if (v14)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Connected device updated: %@", v176);
      }
    }
    else
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "First connected device found %@", v176);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
      if (v16)
      {
        if ((unint64_t)-[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count") >= 2)
        {
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001E30E0);
          -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
        if (objc_msgSend(CFSTR("5A187"), "compare:options:", v17, 64) == (id)1
          && (objc_msgSend(v16, "isRoutingActionInitialized") & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "otherTipiDeviceBTAddress"));

          if (!v18)
          {
            if (dword_10020FA58 <= 30
              && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
            {
              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Update routing action for regular phase 1 fw %@", v17);
            }
            if (self->_pairedCompanionDeviceSupportsSmartRouting)
              v19 = 1;
            else
              v19 = 2;
            objc_msgSend(v16, "_setRoutingAction:", v19);
            objc_msgSend(v16, "_setRoutingInitialized:", 1);
            -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
          }
        }
        -[BTSmartRoutingDaemon _triggerTipiTableUpdate:](self, "_triggerTipiTableUpdate:", v6);

      }
      -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:](self, "_updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:", v176, 2);
      -[BTSmartRoutingDaemon _startAudioStateSnapshotTimer](self, "_startAudioStateSnapshotTimer");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v6));
      v21 = objc_msgSend(v20, "_setInUseBannerBackoffReason:", 0);
      if (GestaltGetDeviceClass(v21, v22) == 1)
        -[BTSmartRoutingDaemon _checkTriangleRecovery](self, "_checkTriangleRecovery");

    }
    if ((objc_msgSend(v176, "deviceFlags") & 0x40000) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));

      if (!v23)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Connected device BT_UI_INITIATED_CONNECTION_REQUEST");
        }
        -[BTSmartRoutingDaemon _submitManualConnectionMetric:](self, "_submitManualConnectionMetric:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v6));
        objc_msgSend(v24, "_setUserConnectedState:", 1);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
          objc_msgSend(v26, "_setRoutingAction:", 1);

        }
      }
    }
    if ((objc_msgSend(v176, "deviceFlags") & 0x40) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
      if (objc_msgSend(v27, "hijackBackoffTicks"))
      {
        hijackBackOffInitiator = self->_hijackBackOffInitiator;

        if (hijackBackOffInitiator)
        {
          v29 = mach_absolute_time();
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
          v31 = UpTicksToSeconds(v29 - (_QWORD)objc_msgSend(v30, "hijackBackoffTicks"));

          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "_connectedDeviceFound, hijackblocking is active. It has started for %llus and ownership is not owned", v31);
          }
          if (v31 >= 5)
            -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:](self, "_hijackBackoffReset:withReason:", v6, CFSTR("ownershipLost"));
        }
      }
      else
      {

      }
    }
    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "name"));
    v32 = -[BTSmartRoutingDaemon _supportsSR:andProductID:](self, "_supportsSR:andProductID:", v6, objc_msgSend(v176, "productID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
    if (v33)
    {
      v170 = 0;
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
      if (v34)
        v170 = 0;
      else
        v170 = ((unint64_t)objc_msgSend(v176, "deviceFlags") & 0x40000) == 0;

      p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
    if (v35)
      v36 = 0;
    else
      v36 = v32;
    if ((v36 & 1) != 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));

      if (!v37)
      {
        -[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:](self, "_smartRoutingAddWxMapDeviceFromConnectedDevice:", v176);
        -[BTSmartRoutingDaemon _triggerTipiTableUpdate:](self, "_triggerTipiTableUpdate:", v6);
        -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
      }
    }
    else
    {

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
    if (!v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v6));
      v40 = objc_msgSend(v39, "mode");

      v117 = v40 == 1;
      p_vtable = (void **)(_TtC15audioaccessoryd11XPCMessages + 24);
      if (v117
        || (-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:](self, "_lowestBatteryInfoForCBDevice:", v176),
            v41 == 0.0))
      {
LABEL_71:
        v173 = v7;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));

        v175 = v43;
        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesInEarCache, "objectForKeyedSubscript:", v6));
          LODWORD(v45) = objc_msgSend(v44, "BOOLValue");
        }
        else
        {
          v45 = -[BTSmartRoutingDaemon _inEarNearbyCheck:](self, "_inEarNearbyCheck:", v6);
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v45));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedDevicesInEarCache, "setObject:forKeyedSubscript:", v46, v6);

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
          if (!v47)
          {
LABEL_76:
            connectDevice = self->_connectDevice;
            if (connectDevice && self->_connectSession)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](connectDevice, "bleDevice"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bluetoothAddress"));

              if (objc_msgSend(v50, "length") == (id)6)
              {
                v51 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v50), "bytes")));
                v52 = (id)objc_claimAutoreleasedReturnValue(v51);

              }
              else
              {
                v52 = 0;
              }
              if (objc_msgSend(v6, "isEqual:", v52)
                && (objc_msgSend(v176, "connectedServices") & 0x80000) != 0)
              {
                v53 = *((_DWORD *)p_vtable + 662);
                if (v53 <= 30 && (v53 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                  LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Finished connection setup");
                if (self->_eligibleHeadset)
                  self->_smartRoutingDisconnectReason = 0;
                v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));

                -[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:](self, "_smartRoutingConnectionCompleted:", 0);
                if (v55)
                {
                  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v55));
                  v57 = objc_msgSend(v56, "preemptiveBannerShown");

                  if (v57)
                  {
                    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                    objc_msgSend(v58, "_setFirstBannerShown:", 0);

                  }
                }

              }
            }
            if (!v32)
            {
LABEL_142:
              v96 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
              -[BTSmartRoutingDaemon _smartRoutingModeCheck:](self, "_smartRoutingModeCheck:", v176);
              v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));

              v169 = v32;
              if (v97 || !v96)
              {
                v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
                v7 = v173;
                if (v102)
                {

                }
                else
                {
                  v103 = objc_msgSend(v176, "productID") - 8194;
                  if (v103 < 0x25)
                  {
                    v104 = (0x1C7BB7FF9BuLL >> v103) & 1;
LABEL_163:
                    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedDevices, "setObject:forKeyedSubscript:", v176, v6);
                    v108 = -[BTSmartRoutingDaemon _inEarConnectedCheck:](self, "_inEarConnectedCheck:", v6);
                    if (!objc_msgSend(v176, "primaryPlacement")
                      && !objc_msgSend(v176, "secondaryPlacement"))
                    {
                      v108 = -[BTSmartRoutingDaemon _inEarNearbyCheck:](self, "_inEarNearbyCheck:", v6);
                    }
                    v172 = v96;
                    if ((_DWORD)v104)
                      -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
                    v109 = -[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress");
                    v110 = v109;
                    forcedConnection = self->_forcedConnection;
                    if (!self->_forcedConnection && !v109)
                    {
LABEL_185:
                      if (v175)
                        v117 = !self->_prefSmartRoutingPreemptiveConnectedBanner;
                      else
                        v117 = 1;
                      v118 = v117 || v108;
                      v119 = v172;
                      if ((v118 & 1) == 0)
                      {
                        objc_msgSend(v172, "_setFirstBannerShown:", 1);
                        v120 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v7));
                        v121 = objc_msgSend(v120, "preemptiveBannerShown");

                        if (v121)
                        {
                          v122 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v7));
                          objc_msgSend(v122, "setPreemptiveBannerShown:", 0);

                        }
                      }
                      v123 = v104;
                      if (v170 && !v108)
                      {
                        v124 = *((_DWORD *)p_vtable + 662);
                        v125 = v176;
                        if (v124 > 30)
                        {
LABEL_222:
                          if ((_DWORD)v45 != v108)
                          {
                            v139 = *((_DWORD *)p_vtable + 662);
                            if (v139 <= 30)
                            {
                              if (v139 != -1
                                || (v144 = _LogCategory_Initialize(&dword_10020FA58, 30), v125 = v176, v144))
                              {
                                if ((_DWORD)v45)
                                  v140 = "yes";
                                else
                                  v140 = "no";
                                if (v108)
                                  v141 = "yes";
                                else
                                  v141 = "no";
                                v142 = objc_msgSend(v125, "audioStreamState");
                                if (v142 > 3)
                                  v143 = "?";
                                else
                                  v143 = off_1001E3DD8[v142];
                                if (self->_activityLevelMediaPlaying)
                                  v145 = "yes";
                                else
                                  v145 = "no";
                                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "InEarStateChanged %s -> %s WxStream %s activityLevelMediaPlaying %s isHidden %s", v140, v141, v143, v145, "no");
                                v119 = v172;
                                v7 = v173;
                                v123 = v104;
                              }
                            }
                            if (v175 && v108)
                            {
                              if (objc_msgSend(v119, "otherTipiDeviceIsWatch")
                                && objc_msgSend(v119, "otherTipiAudioCategory") == 100
                                && !self->_phoneOwnershipTriangleTimer
                                && (objc_msgSend(v119, "routed") & 1) == 0)
                              {
                                -[BTSmartRoutingDaemon _startPhoneTriangleOwnershipTimer:](self, "_startPhoneTriangleOwnershipTimer:", 10);
                              }
                              v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "identifier"));
                              if (objc_msgSend(v119, "firstBannerShown"))
                              {
                                v147 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v146));
                                v148 = objc_msgSend(v147, "preemptiveBannerShown") ^ 1;

                              }
                              else
                              {
                                v148 = 0;
                              }
                              objc_msgSend(v119, "_setFirstBannerShown:", v148);
                              -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");

                              p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
                            }
                          }
                          v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v108));
                          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedDevicesInEarCache, "setObject:forKeyedSubscript:", v149, v6);

                          objc_msgSend(v119, "setInEar:", v108);
                          if (((v123 ^ 1 | v169) & 1) == 0)
                          {
                            v150 = *((_DWORD *)p_vtable + 662);
                            if (v150 <= 30
                              && (v150 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                            {
                              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Showing banner for SR disabled device");
                            }
                            v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "name"));
                            -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v151, v6, objc_msgSend(v176, "productID"), CFSTR("Connected"), 0, 4.0);

                          }
                          if (!self->_uiSmartRoutingBanner
                            && objc_msgSend(v119, "firstBannerShown") & v108
                            && !self->_tipiElectionInProgress)
                          {
                            v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "identifier"));
                            v153 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v152));
                            v154 = objc_msgSend(v153, "preemptiveBannerShown");

                            if ((v154 & 1) == 0)
                            {
                              v155 = *((_DWORD *)p_vtable + 662);
                              if (v155 <= 30
                                && (v155 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                              {
                                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Posting first banner upon inEar");
                              }
                              objc_msgSend(v119, "_setFirstBannerShown:", 0);
                              v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "name"));
                              -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v156, v6, objc_msgSend(v176, "productID"), CFSTR("Connected"), 0, 4.0);

                            }
                          }
                          if (self->_prefSmartRoutingEnabledPhase3)
                            -[BTSmartRoutingDaemon _mediaRouteDiscoveryStarted](self, "_mediaRouteDiscoveryStarted");
                          v157 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                          if (v157)
                          {
                            v158 = (void *)v157;
                            v159 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                            v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "otherTipiDeviceBTAddress"));
                            if (v160
                              || self->_tipiElectionInProgress
                              || !-[BTSmartRoutingDaemon _aacpConnectedCheck:](self, "_aacpConnectedCheck:", v176))
                            {

                            }
                            else
                            {
                              v161 = self->_forcedConnection;

                              if (!v161)
                              {
                                if (dword_10020FA58 <= 30
                                  && (dword_10020FA58 != -1
                                   || _LogCategory_Initialize(&dword_10020FA58, 30)))
                                {
                                  LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Trying to do tipi healings from connected events");
                                }
                                -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
                              }
                            }
                          }
                          -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");

                          goto LABEL_279;
                        }
                        if (v124 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
                          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Incoming connection is out of ear");
                      }
                      v126 = *((_DWORD *)p_vtable + 662);
                      v125 = v176;
                      if (v126 <= 30)
                      {
                        if (v126 != -1 || (v132 = _LogCategory_Initialize(&dword_10020FA58, 30), v125 = v176, v132))
                        {
                          if ((_DWORD)v45)
                            v127 = "yes";
                          else
                            v127 = "no";
                          if (v108)
                            v128 = "yes";
                          else
                            v128 = "no";
                          v166 = v128;
                          v167 = v127;
                          if (v175)
                            v129 = "yes";
                          else
                            v129 = "no";
                          v165 = v129;
                          v130 = objc_msgSend(v172, "routingAction");
                          if (v130 > 5)
                            v131 = "?";
                          else
                            v131 = off_1001E3E40[v130];
                          v164 = v131;
                          if (objc_msgSend(v172, "routed"))
                            v133 = "yes";
                          else
                            v133 = "no";
                          v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "otherTipiDeviceBTAddress"));
                          v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "otherTipiDeviceVersion"));
                          v136 = objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "otherTipiDeviceBTName"));
                          v137 = (void *)v136;
                          if (v170)
                            v138 = "yes";
                          else
                            v138 = "no";
                          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "SmartRouting posting device %@ inEar state originalInEarState %s, newInEarState %s, previous connected %s, routing Action %s, Route %s otherTipiDeviceAddress %@ otherTipiVersion %@ otherTipiDeviceName %@ incomingConn %s", v6, v167, v166, v165, v164, v133, v134, v135, v136, v138);

                          v119 = v172;
                          v125 = v176;
                          v7 = v173;
                          p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
                          v123 = v104;
                        }
                      }
                      goto LABEL_222;
                    }
                    v112 = *((_DWORD *)p_vtable + 662);
                    if (v112 <= 30)
                    {
                      if (v112 == -1)
                      {
                        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
                          goto LABEL_179;
                        forcedConnection = self->_forcedConnection;
                      }
                      v113 = "yes";
                      if (forcedConnection)
                        v114 = "yes";
                      else
                        v114 = "no";
                      if (!v110)
                        v113 = "no";
                      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Update Tipi table to disconnect other Tipi device. FD %s, OnDemand %s", v114, v113);
                    }
LABEL_179:
                    -[BTSmartRoutingDaemon _disconnectOtherTipiDevice:](self, "_disconnectOtherTipiDevice:", v6);
                    if (self->_forcedConnection)
                    {
                      v115 = 4;
                    }
                    else
                    {
                      if (-[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type") != 2)
                      {
LABEL_184:
                        self->_forcedConnection = 0;
                        phase1ConnectConfig = self->_phase1ConnectConfig;
                        self->_phase1ConnectConfig = 0;

                        goto LABEL_185;
                      }
                      -[BTSmartRoutingDaemon _removeTiPiState:](self, "_removeTiPiState:", v6);
                      -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 9);
                      v115 = 10;
                    }
                    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, v115);
                    goto LABEL_184;
                  }
                }
              }
              else
              {
                v7 = v173;
                if (objc_msgSend(v96, "routingAction"))
                {
                  v98 = *((_DWORD *)p_vtable + 662);
                  if (v98 <= 30 && (v98 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                  {
                    v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v6));
                    v100 = objc_msgSend(v99, "reconnectionState");
                    v101 = "?";
                    if (v100 == 1)
                      v101 = "Connected";
                    if (!v100)
                      v101 = "Not connected";
                    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Smart Routing posting first banner! Budswap state: %s", v101);

                  }
                  v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v173));
                  if (objc_msgSend(v105, "preemptiveBannerShown"))
                  {

                  }
                  else
                  {
                    v106 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v6));
                    v107 = objc_msgSend(v106, "reconnectionState");

                    if (v107 != 1)
                      objc_msgSend(v96, "_setFirstBannerShown:", 1);
                  }
                }
                -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
              }
              LODWORD(v104) = 0;
              goto LABEL_163;
            }
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "deviceName"));
            v61 = objc_msgSend(v60, "isEqualToString:", v174);

            if ((v61 & 1) == 0)
            {
              v62 = *((_DWORD *)p_vtable + 662);
              if (v62 <= 30 && (v62 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "deviceName"));
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "name"));
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "SmartRouting updating device name from %@ to %@", v64, v65);

              }
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "name"));
              v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
              objc_msgSend(v67, "setDeviceName:", v66);

            }
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "deviceVersion"));

            if (!v69 && (objc_opt_respondsToSelector(v176, "firmwareVersion") & 1) != 0)
            {
              v70 = *((_DWORD *)p_vtable + 662);
              if (v70 <= 30 && (v70 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "firmwareVersion"));
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "SmartRouting updating device version to %@ ", v71);

              }
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "firmwareVersion"));
              v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
              objc_msgSend(v73, "setDeviceVersion:", v72);

            }
            v168 = v45;
            v45 = (uint64_t)p_vtable;
            v74 = v32;
            v75 = (unint64_t)objc_msgSend(v176, "deviceFlags");
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
            if ((objc_msgSend(v76, "manualRouteChangeInProgress") & 1) != 0 || (v75 & 0x400000) == 0)
            {

              v78 = 0;
              v79 = 0;
              v80 = 0;
              if ((v75 & 0x400000) == 0)
                goto LABEL_113;
            }
            else
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
              v78 = objc_msgSend(v77, "manuallyRouted") ^ 1;

            }
            v80 = -[BTSmartRoutingDaemon _isInEarToOutOfEar:](self, "_isInEarToOutOfEar:", v176);
            v79 = v78;
LABEL_113:
            v81 = *(_DWORD *)(v45 + 2648);
            v32 = v74;
            if (v81 <= 30 && (v81 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
            {
              v82 = "no";
              v171 = v80;
              if ((v75 & 0x400000) != 0)
                v83 = "yes";
              else
                v83 = "no";
              if (v79)
                v84 = "yes";
              else
                v84 = "no";
              v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
              if (objc_msgSend(v85, "manualRouteChangeInProgress"))
                v82 = "yes";
              v163 = v82;
              v32 = v74;
              v162 = v83;
              v80 = v171;
              v45 = 0x10020F000;
              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "SmartRouting headset %@ manuallyRouted %s firstManualRoute %s manualRouteChangeInProgress %s %llu", v6, v162, v84, v163, objc_msgSend(v176, "deviceFlags"));

            }
            p_vtable = (void **)v45;
            LODWORD(v45) = v168;
            if (v79)
            {
              -[BTSmartRoutingDaemon _updateRoutingActionForManuallyRoute](self, "_updateRoutingActionForManuallyRoute");
              -[BTSmartRoutingDaemon _startManualRouteChangeDetectionTimer:](self, "_startManualRouteChangeDetectionTimer:", v6);
              if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
              {
                v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                v87 = objc_msgSend(v86, "hijackBackoffTicks");

                if (v87)
                {
                  v88 = *((_DWORD *)p_vtable + 662);
                  if (v88 <= 30 && (v88 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Hijackblocking: Clear Block ticks due to manual routing");
                  -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:](self, "_hijackBackoffReset:withReason:", v6, CFSTR("manualRoute"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "otherTipiDeviceBTAddress"));
                  -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, &off_1001F40E8, v6, v90);

                }
              }
            }
            if (v80)
            {
              v91 = *((_DWORD *)p_vtable + 662);
              if (v91 <= 30 && (v91 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceFound:]", 30, "Resetting manaully route flag for out of ear");
              -[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:](self, "_setManualRouteFlag:withManualRoute:", v6, 0);
            }
            else
            {
              v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
              objc_msgSend(v92, "_setManualRoute:", (v75 >> 22) & 1);

              if ((v75 & 0x400000) == 0)
              {
                v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                v94 = objc_msgSend(v93, "manualRouteChangeInProgress");

                if (v94)
                {
                  v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
                  objc_msgSend(v95, "_setManualRouteChangeInProgress:", 0);

                }
              }
            }
            goto LABEL_142;
          }
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
          objc_msgSend(v44, "setInEar:", v45);
        }

        goto LABEL_76;
      }
      v42 = v41;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v7));
      objc_msgSend(v38, "setLowestBudBatteryInfo:", v42);
    }

    goto LABEL_71;
  }
LABEL_280:

}

- (void)_connectedDeviceLost:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *disconnectTicksMap;
  NSNumber *v16;
  void *v17;
  void *v18;
  BTBannerUISession *uiSmartRoutingBanner;
  BTBannerUISession *v20;
  void *v21;
  id v22;
  void *v23;
  OS_dispatch_source *tipiHealingTimer;
  NSObject *v25;
  OS_dispatch_source *v26;
  OS_dispatch_source *hijackBackOffTimer;
  NSObject *v28;
  OS_dispatch_source *v29;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  id v31;

  v31 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "btAddressData"));
  v5 = CUPrintNSDataAddress();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
    objc_msgSend(v7, "connectionUpdatedForBluetoothIdentifier:connected:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
    if (v9)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _connectedDeviceLost:]", 30, "Connected device lost: disconnectReason %llu, device %@", self->_smartRoutingDisconnectReason, v31);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedDevices, "setObject:forKeyedSubscript:", 0, v6);
      -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:](self, "_hijackBackoffReset:withReason:", v6, CFSTR("wxDisconnected"));
      -[NSMutableDictionary removeObjectForKey:](self->_smartRoutingWxStatsMap, "removeObjectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
      if (v31)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v11));
        objc_msgSend(v12, "setPreemptiveBannerShown:", 0);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v11));
        objc_msgSend(v13, "setFirstPreemptiveBannerShown:", 0);

        -[BTSmartRoutingDaemon _submitMetric:](self, "_submitMetric:", v31);
        if (objc_msgSend(CFSTR("6A221"), "compare:options:", v10, 64) != (id)-1)
        {
          if (!self->_disconnectTicksMap)
          {
            v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            disconnectTicksMap = self->_disconnectTicksMap;
            self->_disconnectTicksMap = v14;

          }
          v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_disconnectTicksMap, "setObject:forKeyedSubscript:", v17, v6);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v6));
        uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
        if (uiSmartRoutingBanner)
        {
          -[BTBannerUISession invalidate](uiSmartRoutingBanner, "invalidate");
          v20 = self->_uiSmartRoutingBanner;
          self->_uiSmartRoutingBanner = 0;

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "audioRoutingResponse"));

        if (v21)
        {
          v22 = objc_alloc_init((Class)BTAudioRoutingResponse);
          objc_msgSend(v22, "setAction:", 3);
          objc_msgSend(v22, "setReason:", CFSTR("Wx disconnecting"));
          objc_msgSend(v22, "setClientID:", objc_msgSend(v18, "audioRoutingClientID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "audioRoutingResponse"));
          -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v22, v23, v6);

        }
        -[NSMutableDictionary removeObjectForKey:](self->_smartRoutingWxDeviceMap, "removeObjectForKey:", v6);
        if (self->_tipiElectionInProgress)
          self->_tipiElectionInProgress = 0;
        tipiHealingTimer = self->_tipiHealingTimer;
        if (tipiHealingTimer)
        {
          v25 = tipiHealingTimer;
          dispatch_source_cancel(v25);
          v26 = self->_tipiHealingTimer;
          self->_tipiHealingTimer = 0;

        }
        hijackBackOffTimer = self->_hijackBackOffTimer;
        if (hijackBackOffTimer)
        {
          v28 = hijackBackOffTimer;
          dispatch_source_cancel(v28);
          v29 = self->_hijackBackOffTimer;
          self->_hijackBackOffTimer = 0;

        }
        -[BTSmartRoutingSourceDevice _setShouldStayOnVirtual:](self->_sourceDevice, "_setShouldStayOnVirtual:", 0);

      }
      if (!-[NSMutableDictionary count](self->_connectedDevices, "count") && !self->_tipiElectionInProgress)
      {
        -[BTSmartRoutingDaemon _mediaRouteDiscoveryStopped](self, "_mediaRouteDiscoveryStopped");
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        self->_smartRoutingWxDeviceMap = 0;

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedDevicesSrModeCache, "setObject:forKeyedSubscript:", 0, v6);
      -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:](self, "_updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:", v31, 0);
      -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");

    }
  }

}

- (void)_mediaRouteDiscoveryStarted
{
  OS_dispatch_queue *dispatchQueueAVSys;
  _QWORD block[5];

  if (!self->_discoverySession && !self->_discoverySessionInitializing)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteDiscoveryStarted]", 30, "Media Route Discovery Started");
    }
    self->_discoverySessionInitializing = 1;
    dispatchQueueAVSys = self->_dispatchQueueAVSys;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031B60;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
  }
}

- (void)_mediaRouteDiscoveryStopped
{
  void *discoverySessionToken;
  void *discoverySession;
  OS_dispatch_queue *dispatchQueueAVSys;
  __CFArray *mediaRemoteOutputDevices;
  _QWORD v7[6];

  discoverySessionToken = self->_discoverySessionToken;
  self->_discoverySessionToken = 0;
  discoverySession = self->_discoverySession;
  self->_discoverySession = 0;
  if (discoverySession)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteDiscoveryStopped]", 30, "Media Route Discovery Stop");
    }
    dispatchQueueAVSys = self->_dispatchQueueAVSys;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100031DE0;
    v7[3] = &unk_1001E3178;
    v7[4] = discoverySession;
    v7[5] = discoverySessionToken;
    dispatch_async((dispatch_queue_t)dispatchQueueAVSys, v7);
  }
  mediaRemoteOutputDevices = self->_mediaRemoteOutputDevices;
  if (mediaRemoteOutputDevices)
    CFRelease(mediaRemoteOutputDevices);
  self->_mediaRemoteOutputDevices = 0;
}

- (void)_mediaRouteMonitorEnsureStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (!self->_mediaRouteMonitorObservingActiveAudioRoute)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStarted]", 30, "Media Ensure Started");
    }
    if (self->_prefSmartRoutingEnabledPhase3)
    {
      self->_mediaRouteMonitorObservingActiveAudioRoute = 1;
      v10 = (id)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", AVSystemController_SomeSessionIsPlayingDidChangeNotification, AVSystemController_NowPlayingAppIsPlayingDidChangeNotification, AVSystemController_CallIsActiveDidChangeNotification, AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification, 0));
      objc_msgSend(v10, "setAttribute:forKey:error:", v4, AVSystemController_SubscribeToNotificationsAttribute, 0);
      objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_SomeSessionIsPlayingDidChangeNotification, v10);
      objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, v10);
      objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_NowPlayingAppIsPlayingDidChangeNotification, v10);
      objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_CallIsActiveDidChangeNotification, v10);
      objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification, v10);
      objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CdSignalAudioInterruptedChanged"), 0);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_mediaRouteMonitorActivityLevelUpdate:", AVSystemController_SomeSessionIsPlayingDidChangeNotification, v10);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleMediaServerConnectionDied:", AVSystemController_ServerConnectionDiedNotification, v10);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleMediaPlayStateChange:", AVSystemController_NowPlayingAppIsPlayingDidChangeNotification, v10);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleCallStateChange:", AVSystemController_CallIsActiveDidChangeNotification, v10);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleHighestAudioCategoryChange:", AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification, v10);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleMediaPauseStateChanged", CFSTR("CdSignalAudioInterruptedChanged"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributeForKey:", AVSystemController_HighestArbitrationPriorityForTipiAttribute));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AVSystemController_HighestArbitrationPriorityForTipi_AudioScore));
      -[BTSmartRoutingDaemon _updateLocalAudioCategory:](self, "_updateLocalAudioCategory:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v8 = kMRAVOutputContextDevicesDidChangeNotification;
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_mediaRouteMonitorActiveAudioRouteChanged:", kMRAVOutputContextDevicesDidChangeNotification, MRAVOutputContextGetSharedSystemAudioContext());

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "addObserver:selector:name:object:", self, "_mediaRouteMonitorActiveAudioRouteChanged:", v8, MRAVOutputContextGetSharedAudioPresentationContext(v9));

      MRMediaRemoteSetWantsRouteChangeNotifications(1);
      -[BTSmartRoutingDaemon _mediaRouteMonitorActiveAudioRouteChanged:](self, "_mediaRouteMonitorActiveAudioRouteChanged:", 0);

    }
  }
}

- (void)_mediaRouteMonitorEnsureStopped
{
  id v3;

  if (self->_mediaRouteMonitorObservingActiveAudioRoute)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStopped]", 30, "Media Ensure Stopped");
    }
    self->_mediaRouteMonitorObservingActiveAudioRoute = 0;
    self->_activityLevelMediaPlaying = 0;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, kMRMediaRemotePickableRoutesDidChangeNotification, 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_SomeSessionIsPlayingDidChangeNotification, 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MRAVOutputContextOutputDevicesDidChangeNotification"), MRAVOutputContextGetSharedSystemAudioContext(objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, 0)));

  }
}

- (void)_mediaRouteMonitorActiveAudioRouteChanged:(id)a3
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032308;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_mediaRouteMonitorSpeakRoute
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  _QWORD v10[5];

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteMonitorSpeakRoute]", 30, "Speak route start");
  v3 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.BTUserNotifications.bundle")));
  v4 = (void *)v3;
  if (!v3)
  {
    v7 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
    goto LABEL_9;
  }
  v5 = CULocalizedStringEx(v3, CFSTR("Localizable"), CFSTR("SPEAK_CONNECTED_FORMAT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
  if (!v6)
  {
LABEL_9:
    v8 = CFSTR("?");
    goto LABEL_10;
  }
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7));

LABEL_10:
  v9 = objc_alloc_init((Class)CUVoiceSession);
  objc_msgSend(v9, "setDispatchQueue:", self->_dispatchQueue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000330B4;
  v10[3] = &unk_1001E2110;
  v10[4] = v9;
  objc_msgSend(v9, "speakText:flags:completion:", v8, 0, v10);

}

- (void)_mediaRouteMonitorActivityLevelUpdate:(id)a3
{
  OS_dispatch_queue *dispatchQueueAVSys;
  _QWORD block[5];

  dispatchQueueAVSys = self->_dispatchQueueAVSys;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003319C;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
}

- (void)_mediaRouteHijackResponseHandlerFor:(id)a3 allowedToHijack:(BOOL)a4 withReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  const char *v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  id v35;

  v6 = a4;
  v35 = a3;
  v8 = a5;
  v9 = objc_alloc_init((Class)BTAudioRoutingResponse);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v35));
  if (v6)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]", 30, "SmartRoutingAudioHijackAnswerAccepted");
    }
    v11 = 1;
    objc_msgSend(v9, "setAction:", 1);
    objc_msgSend(v9, "setDeviceAddress:", v35);
    objc_msgSend(v9, "setReason:", CFSTR("Tipi device hijack was successful"));
    self->_autoRoutingResponseTicks = mach_absolute_time();
  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]", 30, "SmartRoutingAudioHijackAnswerRejected");
    }
    v12 = 3;
    objc_msgSend(v9, "setAction:", 3);
    objc_msgSend(v9, "setDeviceAddress:", 0);
    objc_msgSend(v9, "setReason:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reason"));
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Backoff"));

    if (v14)
    {
      v12 = 4;
      objc_msgSend(v9, "setAction:", 4);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reason"));
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Ambiguity"));

    if (v16)
      v11 = 2;
    else
      v11 = v12;
  }
  objc_msgSend(v9, "setClientID:", objc_msgSend(v10, "audioRoutingClientID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioRoutingResponse"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioRoutingResponse"));
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v9, v18, v35);

  }
  if (v6)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "otherTipiDeviceBTAddress"));

    if (v19)
    {
      v20 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v20, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("audioRoutingSetOwnershipToFalse"));
      objc_msgSend(v20, "setObject:forKey:", CFSTR("Hijackv2"), CFSTR("reason"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "otherTipiAudioCategory")));
      objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("localscore"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SmartRoutingStats hijackScore](self->_stats, "hijackScore")));
      objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("audioRoutingScore"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SmartRoutingStats hijackScore](self->_stats, "hijackScore")));
      objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("remotescore"));

      if (objc_msgSend(v10, "otherTipiAudioCategory") >= 0xC9)
        objc_msgSend(v20, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SmartRoutingKeyShowNearbyUI"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "otherTipiDeviceBTAddress"));
      -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v20, v35, v24);

    }
    v25 = mach_absolute_time();
    v26 = UpTicksToSeconds(v25 - self->_showBannerConnectedLastTicks);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v27 = objc_msgSend(v10, "routed");
      v28 = "no";
      if (v27)
        v28 = "yes";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]", 30, "Show connected banner after hijack routed %s secondSinceLastBanner %d", v28, v26);
    }
    if ((objc_msgSend(v10, "routed") & 1) != 0
      || self->_showBannerConnectedLastTicks && self->_secondsBetweenConnectBanner > (double)v26)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        if (objc_msgSend(v10, "inEar"))
          v29 = "yes";
        else
          v29 = "no";
        if (objc_msgSend(v10, "inEarDisabled"))
          v30 = "yes";
        else
          v30 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]", 30, "Connected banner cool off period is %llus, inEar state is %s inEar state disabled %s", v26, v29, v30);
      }
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName"));
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceAddress"));
      v33 = (void *)v32;
      if (v32)
        v34 = (const __CFString *)v32;
      else
        v34 = CFSTR("?");
      -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v31, v34, objc_msgSend(v10, "productID"), CFSTR("Connected"), 0, 4.0);

    }
  }
  -[BTSmartRoutingDaemon _startHijackMetricSubmission:wxAddress:version:](self, "_startHijackMetricSubmission:wxAddress:version:", v11, v35, CFSTR("V2"));

}

- (void)_mediaRouteHijackResponse:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5 andAllowedToHijack:(BOOL)a6 withReason:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void **p_vtable;
  uint64_t audioScoreOtherTipiDevice;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  id v23;
  id v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  const char *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v8 = a6;
  v10 = *(_QWORD *)&a3;
  v54 = a4;
  v12 = a5;
  v13 = a7;
  v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("audioRoutingRequestID"));
  objc_msgSend(v14, "setObject:forKey:", self->_localDeviceAudioCatogory, CFSTR("remotescore"));
  if (v8)
  {
    if (self->_audioScoreOtherTipiDevice != (_DWORD)v10)
      self->_audioScoreOtherTipiDevice = v10;
    p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
    if (dword_10020FA58 > 30)
      goto LABEL_11;
    audioScoreOtherTipiDevice = v10;
    if (dword_10020FA58 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10020FA58, 30))
        goto LABEL_11;
      audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    }
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]", 30, "Allowed hijacking for address %@, now set ownership to false with score %u", v54, audioScoreOtherTipiDevice);
LABEL_11:
    self->_autoRoutingTicks = mach_absolute_time();
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceVersion"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "otherTipiDeviceVersion"));
    objc_msgSend(v20, "doubleValue");
    v22 = v21 < 1.2 || objc_msgSend(CFSTR("3E725"), "compare:options:", v18, 64) == (id)1;

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v23 = v12;
      v24 = v13;
      v25 = v10;
      if (v22)
        v26 = "yes";
      else
        v26 = "no";
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "otherTipiDeviceVersion"));
      v48 = v26;
      v10 = v25;
      v13 = v24;
      v12 = v23;
      p_vtable = (void **)(_TtC15audioaccessoryd11XPCMessages + 24);
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]", 30, "Legacy routing behavior = %s %@ %@", v48, v28, v18);

    }
    if (v22)
      -[BTSmartRoutingDaemon _setOwnership:withHijackRequest:withOwnership:](self, "_setOwnership:withHijackRequest:withOwnership:", v54, v12, 0);
    v31 = *((_DWORD *)p_vtable + 662);
    if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]", 30, "Hijacking passed for address %@", v54);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v14, "setObject:forKey:", v32, CFSTR("audioRoutingHijackAnswer"));

    if (self->_score > 3 || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") >= 1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
      v34 = objc_msgSend(v33, "routed");

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
        v36 = objc_msgSend(v35, "otherTipiDeviceIsWatch");

        if ((v36 & 1) == 0)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[BTBannerUISession trailingAccessoryText](self->_uiSmartRoutingBanner, "trailingAccessoryText"));
          v38 = objc_msgSend(v37, "containsString:", CFSTR("Reverse"));

          if ((v38 & 1) == 0)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "deviceName"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "deviceAddress"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
            v49 = objc_msgSend(v51, "productID");
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "otherTipiDeviceBTName"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v41));
            -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 5, v39, v40, v49, v42, 0, 20.0);

          }
        }
      }
    }
    -[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:](self, "_setManualRouteFlag:withManualRoute:", v54, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
    v44 = objc_msgSend(v43, "routed");

    if (v44)
    {
      -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v14, v54, 0);
      -[SmartRoutingStats setHijackAwayRemoteScore:](self->_stats, "setHijackAwayRemoteScore:", v10);
      -[SmartRoutingStats setHijackAwayLocalScore:](self->_stats, "setHijackAwayLocalScore:", -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

      if (!v45)
        -[SmartRoutingStats setFalseRouteCheckReason:](self->_stats, "setFalseRouteCheckReason:", CFSTR("Hijacked_Away"));
      -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:](self, "submitRouteActivityMetric:activity:", v54, CFSTR("Hijack_Away"));
      -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v54, 8);
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v54));
      v47 = objc_msgSend(v46, "routed");

      if ((v47 & 1) == 0)
        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v14, v54, 0);
    }

    goto LABEL_45;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]", 30, "Hijacking is not allowed with address %@ with reason %@", v54, v13);
  if (objc_msgSend(v13, "isEqual:", CFSTR("LowerPriority")))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
    objc_msgSend(v14, "setObject:forKey:", v29, CFSTR("audioRoutingHijackAnswer"));

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v14, v54, 0);
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("AmbiguousPriority")))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    objc_msgSend(v14, "setObject:forKey:", v30, CFSTR("audioRoutingHijackAnswer"));

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v14, v54, 0);
  }
LABEL_45:

}

- (void)_mediaRouteHijackWithAudioScore:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _BOOL4 hijackBackOffInitiator;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  OS_dispatch_queue *dispatchQueueAVSys;
  void *v29;
  _QWORD block[4];
  id v31;
  BTSmartRoutingDaemon *v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  int v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[5];
  id v40;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10001E9DC;
  v39[4] = sub_10001E9EC;
  v40 = 0;
  if (!v9)
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 90, "No valid audioResponseID found");
    }
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v12, "setObject:forKey:", 0, CFSTR("audioRoutingRequestID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("audioRoutingHijackAnswer"));

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v12, v8, 0);
    goto LABEL_28;
  }
  if (!v8)
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 90, "No valid Wx address passed for hijacking request");
    }
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("audioRoutingRequestID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
    objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("audioRoutingHijackAnswer"));

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v12, 0, 0);
LABEL_28:

    goto LABEL_45;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "otherTipiDeviceBTAddress"));

  if (v11)
  {
    if (dword_10020FA58 <= 50
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 50, "Received request to hijack audio for Wx %@ audioID %@ and audioScore %u", v8, v9, v6);
    }
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    if (!self->_prefSmartRoutingBlockHijackWindowinSeconds)
      goto LABEL_43;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
    if (objc_msgSend(v14, "hijackBackoffTicks"))
    {
      hijackBackOffInitiator = self->_hijackBackOffInitiator;

      if (!hijackBackOffInitiator)
      {
LABEL_43:
        dispatchQueueAVSys = self->_dispatchQueueAVSys;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100034554;
        block[3] = &unk_1001E3218;
        v34 = v37;
        v36 = v6;
        v35 = v39;
        v31 = v8;
        v32 = self;
        v33 = v9;
        dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);

        v14 = v31;
LABEL_44:

        _Block_object_dispose(v37, 8);
        goto LABEL_45;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
      v17 = -[BTSmartRoutingDaemon _checkTickswithinWindow:withWindow:](self, "_checkTickswithinWindow:withWindow:", objc_msgSend(v16, "hijackBackoffTicks"), self->_prefSmartRoutingBlockHijackWindowinSeconds);

      v14 = objc_alloc_init((Class)NSMutableDictionary);
      if (v17 >= 1)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          v19 = UpTicksToSeconds(v17);
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 30, "###Hijackblocking: Hijack request from remote, device %@ hijack block with %ll{dur} remaining with ticks %lld", v8, v19, v17);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17));
        objc_msgSend(v14, "setObject:forKey:", v26, CFSTR("hijackBackoffTicks"));
        objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("audioRoutingRequestID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
        objc_msgSend(v14, "setObject:forKey:", v27, CFSTR("audioRoutingHijackAnswer"));

        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v14, v8, 0);
        goto LABEL_44;
      }
      if (v17 + SecondsToUpTicks(1, v18))
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          v22 = SecondsToUpTicks(1, v21);
          v23 = UpTicksToSeconds(v22 + v17);
          v25 = SecondsToUpTicks(1, v24);
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 30, "###Hijackblocking: Tick has exhausted but timer has not fired yet. Tick expires less than 1s, remaining %ll{dur}, ticks %lld", v23, v25 + v17);
        }
        objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("audioRoutingRequestID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
        objc_msgSend(v14, "setObject:forKey:", v29, CFSTR("audioRoutingHijackAnswer"));

        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v14, v8, 0);
        goto LABEL_44;
      }
      -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:](self, "_hijackBackoffReset:withReason:", v8, CFSTR("tickerExhausted"));
      if (dword_10020FA58 <= 90
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 90, "###Hijackblocking: Tick has exhausted but timer has not fired yet. Tick expires more than 1s. Cancel hijackblocking");
      }
    }

    goto LABEL_43;
  }
  if (dword_10020FA58 <= 90 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]", 90, "Wrong state please file radar under 'Smart Routing|All'. We are not in Tipi with Wx address %@", v8);
  if (!self->_tipiElectionInProgress)
    -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
LABEL_45:
  _Block_object_dispose(v39, 8);

}

- (void)_updateRoutingActionForManuallyRoute
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  _QWORD v3[5];

  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000346CC;
  v3[3] = &unk_1001E3008;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)_nearbyInfoDiscoveryEnsureStarted
{
  SFDeviceDiscovery **p_nearbyInfoDiscovery;
  id v4;
  id v5;
  uint64_t v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *prefSmartRoutingForcedDisconnectionStartTimer;
  NSObject *v9;
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];

  if (!self->_nearbyInfoDiscovery)
  {
    p_nearbyInfoDiscovery = &self->_nearbyInfoDiscovery;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDiscoveryEnsureStarted]", 30, "NearbyInfo discovery start");
    }
    v4 = objc_alloc_init((Class)SFDeviceDiscovery);
    objc_storeStrong((id *)p_nearbyInfoDiscovery, v4);
    objc_msgSend(v4, "setChangeFlags:", 9);
    objc_msgSend(v4, "setDiscoveryFlags:", 33);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v4, "setPurpose:", CFSTR("SmartRouting"));
    objc_msgSend(v4, "setScanRate:", 20);
    v5 = objc_msgSend(v4, "setRssiThreshold:", -75);
    if (self->_prefSmartRoutingEnabledPhase3 && GestaltGetDeviceClass(v5, v6) != 6)
      objc_msgSend(v4, "setOverrideScreenOff:", 1);
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStarted:](self, "_powerLogSmartRoutingScanStarted:", 16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100034B00;
    v14[3] = &unk_1001E3240;
    v14[4] = self;
    v14[5] = v4;
    objc_msgSend(v4, "setDeviceFoundHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100034B24;
    v13[3] = &unk_1001E3240;
    v13[4] = self;
    v13[5] = v4;
    objc_msgSend(v4, "setDeviceLostHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100034B48;
    v12[3] = &unk_1001E3268;
    v12[4] = self;
    v12[5] = v4;
    objc_msgSend(v4, "setDeviceChangedHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100034B6C;
    v11[3] = &unk_1001E2410;
    v11[4] = self;
    v11[5] = v4;
    objc_msgSend(v4, "activateWithCompletion:", v11);
    self->_prefSmartRoutingForcedDisconnectionTicks = mach_absolute_time();
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    prefSmartRoutingForcedDisconnectionStartTimer = self->_prefSmartRoutingForcedDisconnectionStartTimer;
    self->_prefSmartRoutingForcedDisconnectionStartTimer = v7;
    v9 = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100034C20;
    v10[3] = &unk_1001E23E8;
    v10[4] = v9;
    v10[5] = self;
    dispatch_source_set_event_handler(v9, v10);
    CUDispatchTimerSet(v9, self->_prefSmartRoutingForcedDisconnectionStartSeconds + 1.0, -1.0, -10.0);
    dispatch_activate(v9);
    -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");

  }
}

- (void)_nearbyInfoDiscoveryEnsureStopped
{
  SFDeviceDiscovery *nearbyInfoDiscovery;
  OS_dispatch_source *tipiHealingTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *prefSmartRoutingForcedDisconnectionStartTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  NSMutableDictionary *nearbyInfoDevices;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  NSMutableDictionary *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (self->_nearbyInfoDiscovery)
  {
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStopped:](self, "_powerLogSmartRoutingScanStopped:", 16);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDiscoveryEnsureStopped]", 30, "NearbyInfo discovery stop");
    }
    -[SFDeviceDiscovery invalidate](self->_nearbyInfoDiscovery, "invalidate");
    nearbyInfoDiscovery = self->_nearbyInfoDiscovery;
    self->_nearbyInfoDiscovery = 0;

    self->_prefSmartRoutingForcedDisconnectionTicks = 0;
    if (self->_tipiElectionInProgress)
      self->_tipiElectionInProgress = 0;
    tipiHealingTimer = self->_tipiHealingTimer;
    if (tipiHealingTimer)
    {
      v5 = tipiHealingTimer;
      dispatch_source_cancel(v5);
      v6 = self->_tipiHealingTimer;
      self->_tipiHealingTimer = 0;

    }
    if (self->_prefSmartRoutingWatchTriangleMagnet)
    {
      nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
      if (nearbyInfoDevicesTriangleRecoveryTimer)
      {
        v8 = nearbyInfoDevicesTriangleRecoveryTimer;
        dispatch_source_cancel(v8);
        v9 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

      }
    }
    prefSmartRoutingForcedDisconnectionStartTimer = self->_prefSmartRoutingForcedDisconnectionStartTimer;
    if (prefSmartRoutingForcedDisconnectionStartTimer)
    {
      v11 = prefSmartRoutingForcedDisconnectionStartTimer;
      dispatch_source_cancel(v11);
      v12 = self->_prefSmartRoutingForcedDisconnectionStartTimer;
      self->_prefSmartRoutingForcedDisconnectionStartTimer = 0;

    }
    nearbyInfoDevices = self->_nearbyInfoDevices;
    if (nearbyInfoDevices)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](nearbyInfoDevices, "allValues", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            -[BTSmartRoutingDaemon _nearbyInfoDeviceLost:](self, "_nearbyInfoDeviceLost:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v16);
      }

      v19 = self->_nearbyInfoDevices;
      self->_nearbyInfoDevices = 0;

    }
  }
}

- (BOOL)_checkValidBatteryValue:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "batteryType") == (id)2
    || objc_msgSend(v3, "batteryType") == (id)3
    || objc_msgSend(v3, "batteryType") == (id)4;

  return v4;
}

- (BOOL)_isSmartRoutingCapableDevice:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("Mac")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("iPad")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("Watch")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("iPod")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isSmartRoutingCapableDevice:]", 30, "Device is %@, should not add to nearby device map", v3);
    }
    v4 = 0;
  }

  return v4;
}

- (void)_checkTriangleRecovery
{
  NSMutableDictionary *nearbyInfoDevices;
  unsigned int v4;
  int v5;
  unsigned int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  char v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035198;
  v11[3] = &unk_1001E2CE0;
  v11[4] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v11);
  v4 = -[BTSmartRoutingDaemon isInAnyTipi](self, "isInAnyTipi");
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v5 = *((unsigned __int8 *)v13 + 24);
    v6 = -[BTSmartRoutingSourceDevice magnetConnected](self->_sourceDevice, "magnetConnected");
    v7 = "yes";
    if (v5)
      v8 = "yes";
    else
      v8 = "no";
    if (v6)
      v9 = "yes";
    else
      v9 = "no";
    if (!v4)
      v7 = "no";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _checkTriangleRecovery]", 30, "TriangleRecovery: SrDeviceNearby %s magnet %s inAnyTipi %s timeout %d", v8, v9, v7, self->_prefSmartRoutingWatchTriangleMagnet);
  }
  if (*((_BYTE *)v13 + 24))
    v10 = 1;
  else
    v10 = v4;
  if ((v10 & 1) != 0 || !-[BTSmartRoutingSourceDevice magnetConnected](self->_sourceDevice, "magnetConnected"))
    -[BTSmartRoutingDaemon _cancelTriangleRecoveryTimer](self, "_cancelTriangleRecoveryTimer");
  else
    -[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer](self, "_nearbyDeviceInfoTriangleRecoveryTimer");
  _Block_object_dispose(&v12, 8);
}

- (void)_cancelTriangleRecoveryTimer
{
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _cancelTriangleRecoveryTimer]", 30, "TriangleRecovery: cancel timer");
  nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
  if (nearbyInfoDevicesTriangleRecoveryTimer)
  {
    v5 = nearbyInfoDevicesTriangleRecoveryTimer;
    dispatch_source_cancel(v5);
    v4 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

  }
}

- (void)_nearbyInfoDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  NSMutableDictionary *nearbyInfoDevices;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v19;
  OS_dispatch_source *v20;
  id v21;

  v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = objc_msgSend(v21, "audioRoutingScore");
    if (dword_10020FA58 <= 30)
    {
      v7 = v6;
      if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        v9 = (void *)v8;
        if (v7 > 0xF)
          v10 = "?";
        else
          v10 = off_1001E3C88[(int)v7];
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDeviceFound:]", 30, "NearbyInfo device found/updated: ID %@, Name '%@', audio score %d (%s)", v5, v8, v7, v10);

      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "model"));
    v12 = -[BTSmartRoutingDaemon _isSmartRoutingCapableDevice:](self, "_isSmartRoutingCapableDevice:", v11);

    if (v12)
    {
      nearbyInfoDevices = self->_nearbyInfoDevices;
      if (!nearbyInfoDevices)
      {
        v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v17 = self->_nearbyInfoDevices;
        self->_nearbyInfoDevices = v16;

        nearbyInfoDevices = self->_nearbyInfoDevices;
      }
      v13 = -[NSMutableDictionary setObject:forKeyedSubscript:](nearbyInfoDevices, "setObject:forKeyedSubscript:", v21, v5);
    }
    if (GestaltGetDeviceClass(v13, v14) == 1)
    {
      if (self->_prefSmartRoutingWatchTriangleMagnet)
      {
        -[BTSmartRoutingDaemon _checkTriangleRecovery](self, "_checkTriangleRecovery");
      }
      else if (-[NSMutableDictionary count](self->_nearbyInfoDevices, "count") == (id)1)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDeviceFound:]", 30, "Smart Routing starting timer for legacy triangle recovery.");
        }
        -[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer](self, "_nearbyDeviceInfoTriangleRecoveryTimer");
      }
      else
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDeviceFound:]", 30, "Smart Routing cancelling legacy triangle recovery.");
        }
        nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        if (nearbyInfoDevicesTriangleRecoveryTimer)
        {
          v19 = nearbyInfoDevicesTriangleRecoveryTimer;
          dispatch_source_cancel(v19);
          v20 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
          self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

        }
      }
    }
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }

}

- (void)_nearbyInfoDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]", 30, "NearbyInfo device lost: ID %@, IDS %@, Name '%@'", v5, v6, v7);

    }
    v8 = -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nearbyInfoDevices, "setObject:forKeyedSubscript:", 0, v5);
    if (GestaltGetDeviceClass(v8, v9) == 1)
    {
      if (self->_prefSmartRoutingWatchTriangleMagnet)
      {
        -[BTSmartRoutingDaemon _checkTriangleRecovery](self, "_checkTriangleRecovery");
      }
      else if (-[NSMutableDictionary count](self->_nearbyInfoDevices, "count") == (id)1)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]", 30, "Smart Routing starting timer for legacy triangle recovery.");
        }
        -[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer](self, "_nearbyDeviceInfoTriangleRecoveryTimer");
      }
      else
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]", 30, "Smart Routing cancelling legacy triangle recovery.");
        }
        nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        if (nearbyInfoDevicesTriangleRecoveryTimer)
        {
          v11 = nearbyInfoDevicesTriangleRecoveryTimer;
          dispatch_source_cancel(v11);
          v12 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
          self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

        }
      }
    }
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }

}

- (void)_nearbyInfoSetAudioRoutingScore
{
  id v3;
  uint64_t score;
  _QWORD v5[6];

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore]", 30, "NearbyInfo set audio routing score: %d", self->_score);
  v3 = objc_alloc_init((Class)SFClient);
  if (-[CBDiscovery bluetoothState](self->_connectedDiscovery, "bluetoothState") == (id)5)
    score = self->_score;
  else
    score = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035870;
  v5[3] = &unk_1001E2410;
  v5[4] = v3;
  v5[5] = self;
  objc_msgSend(v3, "setAudioRoutingScore:completion:", score, v5);
  -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");

}

- (void)_nearbyInfoActivityChanged
{
  uint64_t score;
  const char *v4;
  uint64_t v5;
  unint64_t activityLevelDeltaInSeconds;
  unint64_t v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  uint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  BOOL v15;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  int v17;
  uint64_t v18;
  const char *v19;
  int v20;
  uint64_t v21;
  const char *v22;
  OS_dispatch_source *activityLevelDelayTimer;
  NSObject *v24;
  OS_dispatch_source *v25;
  OS_dispatch_source *highActivityLevelTimer;
  NSObject *v27;
  OS_dispatch_source *v28;
  _QWORD v29[6];
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    score = self->_score;
    if (score > 0xF)
      v4 = "?";
    else
      v4 = off_1001E3C88[score];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityChanged]", 30, "NearbyInfoActivityChanged: AL %d, current score is %d (%s)", self->_activityLevel, self->_score, v4);
  }
  if (self->_activityLevelTicks)
  {
    v5 = mach_absolute_time();
    activityLevelDeltaInSeconds = self->_activityLevelDeltaInSeconds + UpTicksToSeconds(v5 - self->_activityLevelTicks);
    self->_activityLevelDeltaInSeconds = activityLevelDeltaInSeconds;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_12:
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityChanged]", 30, "NearbyInfoActivityChanged: activity evaluation ALDS %ll{dur}, AL %d", activityLevelDeltaInSeconds, self->_activityLevel);
        goto LABEL_14;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        activityLevelDeltaInSeconds = self->_activityLevelDeltaInSeconds;
        goto LABEL_12;
      }
    }
  }
LABEL_14:
  switch(self->_activityLevel)
  {
    case 3u:
      if (self->_activityLevelMediaPlaying)
      {
        v13 = 4;
        goto LABEL_39;
      }
      v14 = self->_activityLevelDeltaInSeconds;
      if (v14 > 0x19)
        goto LABEL_38;
      if (v14 == 25)
      {
        *((_DWORD *)v32 + 6) = 2;
        if (!self->_activityLevelTicks)
          self->_activityLevelTicks = mach_absolute_time();
        activityLevelDelayTimer = self->_activityLevelDelayTimer;
        if (activityLevelDelayTimer)
        {
          v24 = activityLevelDelayTimer;
          dispatch_source_cancel(v24);
          v25 = self->_activityLevelDelayTimer;
          self->_activityLevelDelayTimer = 0;

        }
        v11 = 25;
        goto LABEL_26;
      }
      break;
    case 7u:
    case 0xAu:
      v7 = self->_activityLevelDeltaInSeconds;
      if (v7 <= 0x1DF && self->_screenOn)
      {
        if (v7 == 25 || !v7)
        {
          if (!self->_activityLevelTicks)
            self->_activityLevelTicks = mach_absolute_time();
          *((_DWORD *)v32 + 6) = 2;
          v8 = self->_activityLevelDelayTimer;
          if (v8)
          {
            v9 = v8;
            dispatch_source_cancel(v9);
            v10 = self->_activityLevelDelayTimer;
            self->_activityLevelDelayTimer = 0;

          }
          if (self->_screenOn)
            v11 = 480;
          else
            v11 = 25;
LABEL_26:
          -[BTSmartRoutingDaemon _nearbyInfoActivityDelayCheck:](self, "_nearbyInfoActivityDelayCheck:", v11);
        }
      }
      else
      {
LABEL_38:
        v13 = 1;
LABEL_39:
        *((_DWORD *)v32 + 6) = v13;
      }
      break;
    case 0xBu:
    case 0xEu:
      self->_activityLevelDeltaInSeconds = 25;
      self->_activityLevelTicks = 0;
      if (self->_activityCriticalTimer)
        v12 = 7;
      else
        v12 = 6;
      *((_DWORD *)v32 + 6) = v12;
      if (-[SFDeviceDiscovery scanRate](self->_nearbyInfoDiscovery, "scanRate") != (id)40)
        -[SFDeviceDiscovery setScanRate:](self->_nearbyInfoDiscovery, "setScanRate:", 40);
      if (-[SFDeviceDiscovery scanRate](self->_wxDiscovery, "scanRate") != (id)40)
        -[SFDeviceDiscovery setScanRate:](self->_wxDiscovery, "setScanRate:", 40);
      -[BTSmartRoutingDaemon _smartRoutingLowerRateScan](self, "_smartRoutingLowerRateScan");
      break;
    default:
      break;
  }
  v15 = self->_activityLevelMediaPlaying
     || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") > 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100035DF8;
  v29[3] = &unk_1001E3290;
  v30 = v15;
  v29[4] = self;
  v29[5] = &v31;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v29);
  v17 = *((_DWORD *)v32 + 6);
  if (v17)
  {
    v18 = self->_score;
    if (v17 != (_DWORD)v18)
    {
      if (dword_10020FA58 <= 30)
      {
        if (dword_10020FA58 != -1
          || (v20 = _LogCategory_Initialize(&dword_10020FA58, 30), v18 = self->_score, v20))
        {
          if (v18 > 0xF)
            v19 = "?";
          else
            v19 = off_1001E3C88[(int)v18];
          v21 = *((int *)v32 + 6);
          if (v21 > 0xF)
            v22 = "?";
          else
            v22 = off_1001E3C88[v21];
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityChanged]", 30, "NearbyInfoActivityChanged: audio routing score has changed %d (%s) -> %d (%s)\n", v18, v19, *((_DWORD *)v32 + 6), v22);
          v18 = self->_score;
        }
      }
      self->_score = *((_DWORD *)v32 + 6);
      -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
      -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
      if (self->_prefProactiveOwnershipArbitration)
      {
        -[BTSmartRoutingDaemon _notifyOtherTipiDeviceTipiScoreChanged:andNewScore:](self, "_notifyOtherTipiDeviceTipiScoreChanged:andNewScore:", v18, self->_score);
        if (*((_DWORD *)v32 + 6) == 1 && !self->_cdDeviceIdentifier)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityChanged]", 30, "ProactiveRouting: Start idle tick");
          }
          self->_startIdleTicks = mach_absolute_time();
          highActivityLevelTimer = self->_highActivityLevelTimer;
          if (highActivityLevelTimer)
          {
            v27 = highActivityLevelTimer;
            dispatch_source_cancel(v27);
            v28 = self->_highActivityLevelTimer;
            self->_highActivityLevelTimer = 0;

          }
        }
        else
        {
          self->_startIdleTicks = 0;
        }
      }
    }
  }
  _Block_object_dispose(&v31, 8);
}

- (void)_nearbyInfoActivityCriticalStart
{
  OS_dispatch_source **p_activityCriticalTimer;
  OS_dispatch_source *v4;
  NSObject *v5;
  dispatch_source_t v6;
  _QWORD handler[4];
  NSObject *v8;
  BTSmartRoutingDaemon *v9;

  p_activityCriticalTimer = &self->_activityCriticalTimer;
  v4 = self->_activityCriticalTimer;
  if (v4)
  {
    v5 = v4;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityCriticalStart]", 30, "Activity critical timer extend: %d seconds", 5);
    }
    CUDispatchTimerSet(v5, 5.0, -1.0, -10.0);
  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityCriticalStart]", 30, "Activity critical timer start: %d seconds", 5);
    }
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_activityCriticalTimer, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003605C;
    handler[3] = &unk_1001E23E8;
    v5 = v6;
    v8 = v5;
    v9 = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(v5, 5.0, -1.0, -10.0);
    dispatch_activate(v5);

  }
}

- (void)_pairedDeviceMonitorEnsureStarted
{
  CBDiscovery *v3;
  CBDiscovery *pairedDiscovery;
  CBDiscovery *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];

  if (!self->_pairedDiscovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStarted]", 30, "Pairing Monitor Started.");
    }
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    pairedDiscovery = self->_pairedDiscovery;
    self->_pairedDiscovery = v3;
    v5 = v3;

    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setLabel:](v5, "setLabel:", CFSTR("SmartRouting"));
    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", (unint64_t)-[CBDiscovery discoveryFlags](v5, "discoveryFlags") | 0x80000800000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000362B8;
    v8[3] = &unk_1001E23C0;
    v8[4] = self;
    v8[5] = v5;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100036358;
    v7[3] = &unk_1001E23C0;
    v7[4] = self;
    v7[5] = v5;
    -[CBDiscovery setDeviceLostHandler:](v5, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000363F8;
    v6[3] = &unk_1001E2410;
    v6[4] = self;
    v6[5] = v5;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);

  }
}

- (void)_pairedDeviceMonitorEnsureStopped
{
  CBDiscovery *pairedDiscovery;

  if (self->_pairedDiscovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStopped]", 30, "Pairing Monitor Ended.");
    }
    -[CBDiscovery invalidate](self->_pairedDiscovery, "invalidate");
    pairedDiscovery = self->_pairedDiscovery;
    self->_pairedDiscovery = 0;

  }
}

- (void)_nearbyInfoActivityDelayCheck:(unint64_t)a3
{
  dispatch_time_t v5;
  NSObject *activityLevelDelayTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[5];

  v5 = dispatch_time(0, 1000000000 * a3);
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyInfoActivityDelayCheck:]", 30, "Check activity in %llus", a3);
  activityLevelDelayTimer = self->_activityLevelDelayTimer;
  if (activityLevelDelayTimer)
  {
    dispatch_source_set_timer(activityLevelDelayTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v8 = self->_activityLevelDelayTimer;
    self->_activityLevelDelayTimer = v7;

    v9 = self->_activityLevelDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100036690;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_activityLevelDelayTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_activityLevelDelayTimer);
  }
}

- (void)_pipeEnsureStarted
{
  BTSmartRoutingPipe *v3;
  BTSmartRoutingPipe *smartRoutingPipe;

  if (!self->_smartRoutingPipe)
  {
    v3 = objc_alloc_init(BTSmartRoutingPipe);
    smartRoutingPipe = self->_smartRoutingPipe;
    self->_smartRoutingPipe = v3;

    -[BTSmartRoutingPipe _activateWithDispatch:](self->_smartRoutingPipe, "_activateWithDispatch:", self->_dispatchQueue);
  }
}

- (void)_pipeEnsureStopped
{
  BTSmartRoutingPipe *smartRoutingPipe;
  BTSmartRoutingPipe *v4;

  smartRoutingPipe = self->_smartRoutingPipe;
  if (smartRoutingPipe)
  {
    -[BTSmartRoutingPipe _invalidate](smartRoutingPipe, "_invalidate");
    v4 = self->_smartRoutingPipe;
    self->_smartRoutingPipe = 0;

  }
}

- (void)_powerMonitorEnsureStarted
{
  CUSystemMonitor *v3;
  CUSystemMonitor *powerMonitor;
  CUSystemMonitor *v5;
  _QWORD *v6;
  CUSleepWakeMonitor *v7;
  CUSleepWakeMonitor *sleepWakeMonitor;
  CUSleepWakeMonitor *v9;
  _QWORD v10[6];
  _QWORD v11[6];

  if (!self->_powerMonitor)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _powerMonitorEnsureStarted]", 30, "Power monitor start");
    }
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    powerMonitor = self->_powerMonitor;
    self->_powerMonitor = v3;
    v5 = v3;

    -[CUSystemMonitor setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100036944;
    v11[3] = &unk_1001E23E8;
    v11[4] = v5;
    v11[5] = self;
    v6 = objc_retainBlock(v11);
    -[CUSystemMonitor setScreenOnChangedHandler:](v5, "setScreenOnChangedHandler:", v6);
    -[CUSystemMonitor setScreenLockedChangedHandler:](v5, "setScreenLockedChangedHandler:", v6);
    -[CUSystemMonitor setFirstUnlockHandler:](v5, "setFirstUnlockHandler:", v6);
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](v5, "setPrimaryAppleIDChangedHandler:", v6);
    -[CUSystemMonitor setScreenLockedChangedHandler:](v5, "setScreenLockedChangedHandler:", v6);
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);

  }
  if (!self->_sleepWakeMonitor)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _powerMonitorEnsureStarted]", 30, "sleep/wake monitor start");
    }
    v7 = (CUSleepWakeMonitor *)objc_alloc_init((Class)CUSleepWakeMonitor);
    sleepWakeMonitor = self->_sleepWakeMonitor;
    self->_sleepWakeMonitor = v7;
    v9 = v7;

    -[CUSleepWakeMonitor setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
    -[CUSleepWakeMonitor setLabel:](v9, "setLabel:", CFSTR("SmartRouting"));
    self->_sleeping = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100036BE0;
    v10[3] = &unk_1001E32B8;
    v10[4] = v9;
    v10[5] = self;
    -[CUSleepWakeMonitor setSleepWakeHandler:](v9, "setSleepWakeHandler:", v10);
    -[CUSleepWakeMonitor activateWithCompletion:](v9, "activateWithCompletion:", 0);

  }
}

- (void)_powerMonitorEnsureStopped
{
  CUSystemMonitor *powerMonitor;
  OS_dispatch_source *screenLockedLingerTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  CUSleepWakeMonitor *sleepWakeMonitor;
  CUSleepWakeMonitor *v8;

  if (self->_powerMonitor)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _powerMonitorEnsureStopped]", 30, "Power monitor stop");
    }
    -[CUSystemMonitor invalidate](self->_powerMonitor, "invalidate");
    powerMonitor = self->_powerMonitor;
    self->_powerMonitor = 0;

  }
  screenLockedLingerTimer = self->_screenLockedLingerTimer;
  if (screenLockedLingerTimer)
  {
    v5 = screenLockedLingerTimer;
    dispatch_source_cancel(v5);
    v6 = self->_screenLockedLingerTimer;
    self->_screenLockedLingerTimer = 0;

  }
  sleepWakeMonitor = self->_sleepWakeMonitor;
  if (sleepWakeMonitor)
  {
    -[CUSleepWakeMonitor invalidate](sleepWakeMonitor, "invalidate");
    v8 = self->_sleepWakeMonitor;
    self->_sleepWakeMonitor = 0;

    self->_sleeping = 0;
    self->_sleepWakeState = 0;
  }
}

- (void)_powerMonitorScreenLockChanged
{
  OS_dispatch_source *screenLockedLingerTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  _QWORD handler[5];

  if (self->_powerMonitor)
  {
    screenLockedLingerTimer = self->_screenLockedLingerTimer;
    if (self->_effectiveScreenLocked)
    {
      if (!screenLockedLingerTimer)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _powerMonitorScreenLockChanged]", 30, "Screen locked linger timer start: %d seconds", 60);
        }
        v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        v6 = self->_screenLockedLingerTimer;
        self->_screenLockedLingerTimer = v5;
        v4 = v5;

        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100037000;
        handler[3] = &unk_1001E20E8;
        handler[4] = self;
        dispatch_source_set_event_handler(v4, handler);
        CUDispatchTimerSet(v4, 60.0, -1.0, 1.0);
        dispatch_activate(v4);
LABEL_17:

      }
    }
    else if (screenLockedLingerTimer)
    {
      if (dword_10020FA58 >= 31)
      {
        v4 = screenLockedLingerTimer;
      }
      else
      {
        if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _powerMonitorScreenLockChanged]", 30, "Screen locked linger timer stop on screen unlock");
        v4 = self->_screenLockedLingerTimer;
        if (!v4)
          goto LABEL_18;
      }
      dispatch_source_cancel(v4);
      v7 = self->_screenLockedLingerTimer;
      self->_screenLockedLingerTimer = 0;

      goto LABEL_17;
    }
LABEL_18:
    -[BTSmartRoutingDaemon _update](self, "_update");
  }
}

- (void)_relayConduitMessageEnsureStarted
{
  CBController *v3;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  _QWORD v5[4];
  CBController *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = self->_smartRoutingController;
  if (!v3)
  {
    v3 = (CBController *)objc_alloc_init((Class)CBController);
    objc_storeStrong((id *)&self->_smartRoutingController, v3);
    -[CBController setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
  }
  if (!self->_relayConduitMessageEnsureStarted)
  {
    self->_relayConduitMessageEnsureStarted = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100037238;
    v9[3] = &unk_1001E32E0;
    v9[4] = self;
    -[CBController setRelayMessageHandler:](v3, "setRelayMessageHandler:", v9);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageEnsureStarted]", 30, "Listening for relay/Tipi update message");
    }
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100037330;
    v8[3] = &unk_1001E3008;
    v8[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003733C;
    v7[3] = &unk_1001E30A0;
    v7[4] = self;
    -[CBController setTipiChangedHandler:](v3, "setTipiChangedHandler:", v7);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100037B88;
    v5[3] = &unk_1001E2110;
    v6 = v3;
    -[CBController activateWithCompletion:](v6, "activateWithCompletion:", v5);

  }
}

- (void)_relayConduitMessageEnsureStopped
{
  self->_relayConduitMessageEnsureStarted = 0;
}

- (void)_relayConduitMessageSend:(unsigned __int8)a3 withOptions:(id)a4 andWxAddress:(id)a5 andOtherAddress:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  unsigned int v34;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_smartRoutingController)
  {
    v34 = 0;
    v13 = (void *)OPACKEncoderCreateData(v10, 0, &v34);
    v14 = v34;
    if (!v34)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = sub_10001E9DC;
      v32 = sub_10001E9EC;
      v33 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = sub_10001E9DC;
      v26 = sub_10001E9EC;
      v27 = 0;
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100038010;
      v16[3] = &unk_1001E3308;
      v17 = v11;
      v20 = &v22;
      v21 = &v28;
      v18 = v12;
      v19 = v10;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v16);
      if (v23[5])
      {
        if (v29[5])
        {
          -[CBController sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:](self->_smartRoutingController, "sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:", v8, v13);
        }
        else if (dword_10020FA58 <= 90
               && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]", 90, "Other tipi device address not found");
        }
      }
      else if (dword_10020FA58 <= 90
             && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]", 90, "Wx headset not found not able to relay the message");
      }

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);

      goto LABEL_27;
    }
    if (dword_10020FA58 <= 90)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 90))
          goto LABEL_27;
        v14 = v34;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]", 90, "Error %@ encoding options into relay message", v14);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]", 30, "Relay logic is not running");
LABEL_28:

}

- (void)_relayConduitMessageReceived:(id)a3 andSourceDevice:(id)a4 messageType:(unsigned __int8)a5 messageData:(id)a6
{
  int v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  void *v33;
  BOOL v34;
  void *v35;
  char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  BOOL v45;
  CFTypeID TypeID;
  uint64_t TypedValue;
  CFTypeID v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  void *v53;
  BOOL v54;
  CFTypeID v55;
  uint64_t v56;
  CFTypeID v57;
  uint64_t v58;
  uint64_t NSNumber;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  NSString *myModel;
  const __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  NSMutableDictionary *v70;
  void *v71;
  CFTypeID v72;
  uint64_t v73;
  void *v74;
  CFTypeID v75;
  uint64_t v76;
  uint64_t v77;
  CFTypeID v78;
  uint64_t v79;
  void *v80;
  BOOL v81;
  void *v82;
  BOOL v83;
  void *v84;
  uint64_t v85;
  void *v86;
  double v87;
  OS_dispatch_source *tipiHealingTimer;
  NSObject *v89;
  OS_dispatch_source *v90;
  void *v91;
  double v92;
  void *v93;
  _BOOL4 v94;
  NSMutableDictionary *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  unsigned int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[4];
  id v108;
  BTSmartRoutingDaemon *v109;
  uint64_t *v110;
  _QWORD v111[4];
  id v112;
  BTSmartRoutingDaemon *v113;
  uint64_t *v114;
  char v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  _QWORD v120[4];
  id v121;
  void *v122;
  id v123;
  BTSmartRoutingDaemon *v124;
  int v125;
  _QWORD v126[4];
  _QWORD v127[4];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 30, "Received message: %@", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btAddressData"));
  v14 = CUPrintNSDataAddress();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v125 = 0;
  if (v15)
  {
    if (v7)
    {
      if (v7 == 1)
      {
        v106 = (void *)OPACKDecodeData(v12, 0, &v125);
        if (v125)
        {
          if (dword_10020FA58 > 90
            || dword_10020FA58 == -1 && !_LogCategory_Initialize(&dword_10020FA58, 90))
          {
            goto LABEL_59;
          }
          v16 = CUPrintErrorCode();
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 90, "Unable to decode relay message with %@", v17);
LABEL_12:

LABEL_59:
          goto LABEL_60;
        }
        if (!v106)
          goto LABEL_59;
        if (dword_10020FA58 <= 40
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 40)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 40, "Receive relay message with dictionary %@", v106);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("audioRoutingHijackRequest")));
        v19 = v18 == 0;

        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("audioRoutingScore")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("audioRoutingRequestID")));
          if (dword_10020FA58 <= 40
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 40)))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "otherTipiDeviceBTAddress"));
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 40, "Received Hijack request from %@ audioScore %u", v23, objc_msgSend(v20, "intValue"));

          }
          -[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:](self, "_mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:", objc_msgSend(v20, "intValue"), v15, v21);

          goto LABEL_52;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("audioRoutingHijackAnswer")));
        v25 = v24 == 0;

        if (!v25)
        {
          if (dword_10020FA58 <= 40
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 40)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 40, "SmartRoutingKeyAudioHijackAnswer");
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("remotescore")));
          -[SmartRoutingStats setHijackActiveRemoteScore:](self->_stats, "setHijackActiveRemoteScore:", 0xFFFFFFFFLL);
          if (v30)
            -[SmartRoutingStats setHijackActiveRemoteScore:](self->_stats, "setHijackActiveRemoteScore:", objc_msgSend(v30, "intValue"));
          -[BTSmartRoutingDaemon _setHighPriorityTag:withHighPriority:](self, "_setHighPriorityTag:withHighPriority:", v15, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("audioRoutingRequestID")));
          smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
          v120[0] = _NSConcreteStackBlock;
          v120[1] = 3221225472;
          v120[2] = sub_100039240;
          v120[3] = &unk_1001E3350;
          v121 = v15;
          v122 = v31;
          v123 = v106;
          v124 = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v120);

          goto LABEL_52;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("callState")));
        v27 = v26 == 0;

        if (!v27)
        {
LABEL_52:
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("hijackBackoffTicks")));
          v34 = v33 == 0;

          if (v34)
            goto LABEL_59;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("hijackBackoffTicks")));
          v17 = v35;
          if (self->_prefSmartRoutingBlockHijackWindowinSeconds && v35)
          {
            if (objc_msgSend(v35, "unsignedLongLongValue"))
            {
              v36 = (char *)objc_msgSend(v17, "unsignedLongLongValue");
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
              v38 = mach_absolute_time();
              objc_msgSend(v37, "_setHijackBackoffTick:", &v36[v38 - SecondsToUpTicks(self->_prefSmartRoutingBlockHijackWindowinSeconds, v39)]);

              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                v40 = UpTicksToSeconds(v36);
                v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 30, "Hijackblocking: Relay message from remote updates hijack blocking ticks, device %@ hijack block with %ll{dur} remaining, last ticks %llu", v15, v40, objc_msgSend(v41, "hijackBackoffTicks"));

              }
            }
            else
            {
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 30, "Hijackblocking: Clear Block ticks because remaining timer is zero");
              }
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
              v43 = objc_msgSend(v42, "hijackBackoffTicks");

              if (v43)
                -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:](self, "_hijackBackoffReset:withReason:", v15, CFSTR("relayTimerZero"));
            }
          }
          goto LABEL_12;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("audioRoutingSetOwnershipToFalse")));
        v29 = v28 == 0;

        if (!v29)
        {
          -[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:](self, "_receivedRelinquishOwnership:wxAddress:", v106, v15);
          goto LABEL_52;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("tipiHealingAttempt")));
        v45 = v44 == 0;

        if (!v45)
        {
          TypeID = CFStringGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingStreaming"), TypeID, 0);
          v98 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          v48 = CFStringGetTypeID();
          v49 = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingPreferMac"), v48, 0);
          v97 = (void *)objc_claimAutoreleasedReturnValue(v49);
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 30, "Tipi healing attempt from remote side, send an ACK. otherSideHasRoute %@ allowPreferOnMac %@", v98, v97);
          }
          v55 = CFStringGetTypeID();
          v56 = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingAttempt"), v55, 0);
          v104 = (void *)objc_claimAutoreleasedReturnValue(v56);
          v57 = CFStringGetTypeID();
          v58 = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingName"), v57, 0);
          v102 = (void *)objc_claimAutoreleasedReturnValue(v58);
          NSNumber = NSDictionaryGetNSNumber(v106, CFSTR("version"), 0);
          v100 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
          objc_msgSend(v60, "_setOtherTipiDeviceInfo:andName:andVersion:", v104, v102, v100);

          v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
          objc_msgSend(v61, "_setRoutingInitialized:", 1);

          if (self->_activityLevelMediaPlaying
            || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") > 0)
          {
            v99 = 1;
          }
          else
          {
            v99 = -[NSString isEqualToString:](self->_cdDeviceIdentifier, "isEqualToString:", v15);
          }
          v126[0] = CFSTR("tipiHealingAck");
          v62 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
          v63 = (void *)v62;
          v64 = &stru_1001ED4C0;
          if (v62)
            v64 = (const __CFString *)v62;
          myModel = self->_myModel;
          v127[0] = v64;
          v127[1] = myModel;
          v126[1] = CFSTR("tipiHealingName");
          v126[2] = CFSTR("version");
          v126[3] = CFSTR("tipiHealingStreaming");
          v66 = CFSTR("NO");
          if (v99)
            v66 = CFSTR("YES");
          v127[2] = &off_1001F3D38;
          v127[3] = v66;
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 4));

          -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v67, v15, 0);
          self->_tipiElectionInProgress = 0;
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "otherTipiDeviceBTAddress"));

          -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v15, v69, 0, 1);
          v116 = 0;
          v117 = &v116;
          v118 = 0x2020000000;
          v119 = 0;
          v70 = self->_smartRoutingWxDeviceMap;
          v111[0] = _NSConcreteStackBlock;
          v111[1] = 3221225472;
          v111[2] = sub_1000397EC;
          v111[3] = &unk_1001E3378;
          v112 = v15;
          v113 = self;
          v114 = &v116;
          v115 = v99;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v70, "enumerateKeysAndObjectsUsingBlock:", v111);
          if (*((_BYTE *)v117 + 24))
            -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");

          _Block_object_dispose(&v116, 8);
          goto LABEL_52;
        }
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("tipiHealingAck")));
        if (!v50
          || (v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15)), v52 = objc_msgSend(v51, "isTipiHealingV2Eligible"), v51, v50, (v52 & 1) != 0))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("nearbyAudioScore")));
          v54 = v53 == 0;

          if (v54)
          {
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("otherDeviceAudioCategory")));
            v81 = v80 == 0;

            if (v81)
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("disableSmartRouting")));
              v83 = v82 == 0;

              if (!v83)
              {
                if (dword_10020FA58 <= 30
                  && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                {
                  LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 30, "Other Tipi device disabled SR, disconnect it since I'm routed");
                }
                -[BTSmartRoutingDaemon _disconnectOtherTipiDevice:](self, "_disconnectOtherTipiDevice:", v15);
              }
            }
            else
            {
              -[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:](self, "_receivedAudioCategory:withOptions:", v15, v106);
            }
          }
          else
          {
            -[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:](self, "_otherTipiDeviceTipiScoreChanged:withOptions:", v15, v106);
          }
          goto LABEL_52;
        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
        v72 = CFStringGetTypeID();
        v73 = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingAck"), v72, 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v75 = CFStringGetTypeID();
        v76 = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingName"), v75, 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue(v76);
        v77 = NSDictionaryGetNSNumber(v106, CFSTR("version"), 0);
        v105 = (void *)objc_claimAutoreleasedReturnValue(v77);
        objc_msgSend(v71, "_setOtherTipiDeviceInfo:andName:andVersion:", v74, v103, v105);
        v78 = CFStringGetTypeID();
        v79 = CFDictionaryGetTypedValue(v106, CFSTR("tipiHealingStreaming"), v78, 0);
        v101 = (void *)objc_claimAutoreleasedReturnValue(v79);
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 30, "Tipi healing attempt succeeded! Booyaaa!!! otherSideRoute %@", v101);
        }
        objc_msgSend(v71, "_setRoutingInitialized:", 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxStatsMap, "objectForKeyedSubscript:", v15));

        if (v84)
        {
          v85 = mach_absolute_time();
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxStatsMap, "objectForKeyedSubscript:", v15));
          v87 = UpTicksToSecondsF(v85 - (_QWORD)objc_msgSend(v86, "thV2Ticks"));

          -[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:](self, "_submitMetricTipiHealingforDevice:withDuration:andLegacy:", v71, 1, v87);
        }
        self->_tipiElectionInProgress = 0;
        -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v15, v74, 0, 1);
        tipiHealingTimer = self->_tipiHealingTimer;
        if (tipiHealingTimer)
        {
          v89 = tipiHealingTimer;
          dispatch_source_cancel(v89);
          v90 = self->_tipiHealingTimer;
          self->_tipiHealingTimer = 0;

        }
        v116 = 0;
        v117 = &v116;
        v118 = 0x2020000000;
        v119 = 0;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "otherTipiDeviceVersion"));
        objc_msgSend(v91, "doubleValue");
        if (v92 < 1.2)
        {

        }
        else
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "otherTipiDeviceVersion"));
          v94 = v93 == 0;

          if (!v94)
          {
            if (-[BTSmartRoutingDaemon _isManualConnection:](self, "_isManualConnection:", v15)
              && (objc_msgSend(v71, "ignoreManualConnect") & 1) == 0)
            {
              if (dword_10020FA58 <= 40
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 40)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 40, "Manually connected, route to iOS!");
              }
              v96 = 1;
              objc_msgSend(v71, "_setRoutingAction:", 1);
            }
            else
            {
              if (dword_10020FA58 <= 40
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 40)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 40, "Tipi 1.2 new healing behavior... iOS we shouldn't route, set ownership to false");
              }
              objc_msgSend(v71, "_setRoutingAction:", 3);
              v96 = 0;
            }
            -[BTSmartRoutingDaemon _setOwnership:withHijackRequest:withOwnership:](self, "_setOwnership:withHijackRequest:withOwnership:", v15, 0, v96);
            *((_BYTE *)v117 + 24) = 1;
LABEL_127:
            -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
LABEL_128:
            _Block_object_dispose(&v116, 8);

            goto LABEL_52;
          }
        }
        if (dword_10020FA58 <= 40
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 40)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 40, "Tipi healing legacy behavior");
        }
        v95 = self->_smartRoutingWxDeviceMap;
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_100039AD4;
        v107[3] = &unk_1001E33A0;
        v108 = v15;
        v109 = self;
        v110 = &v116;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v95, "enumerateKeysAndObjectsUsingBlock:", v107);

        if (!*((_BYTE *)v117 + 24))
          goto LABEL_128;
        goto LABEL_127;
      }
      if (dword_10020FA58 <= 90
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 90, "Received unknown value for relay message type");
      }
    }
    else if (dword_10020FA58 <= 90
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 90, "Received CBRelayMessageTypeInvalid");
    }
  }
  else if (dword_10020FA58 <= 90
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]", 90, "ConduitID passed does not match any connected Wx.");
  }
LABEL_60:

}

- (BOOL)_shouldDelayRouteToSpeaker:(id)a3
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  const char *v11;
  BOOL v12;

  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v5));

  if (dword_10020FA58 <= 90 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    v8 = objc_msgSend(v6, "audioRoutingScore");
    v9 = objc_msgSend(v6, "otherTipiAudioCategory");
    v10 = objc_msgSend(v7, "audioStreamState");
    if (v10 > 3)
      v11 = "?";
    else
      v11 = off_1001E3DD8[v10];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _shouldDelayRouteToSpeaker:]", 90, "Checking delay speaker route routingScore %d remoteScore %d WxSt %s", v8, v9, v11);
  }
  v12 = objc_msgSend(v6, "audioRoutingScore") == 201
     && objc_msgSend(v6, "otherTipiAudioCategory") != 501
     && (objc_msgSend(v6, "otherTipiAudioCategory")
      || objc_msgSend(v7, "audioStreamState") != 3);

  return v12;
}

- (void)_updateAccessoryID:(id)a3 connectionDeviceAddresses:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  CBController *v9;
  _QWORD v10[5];

  v7 = a3;
  v8 = a4;
  v9 = self->_smartRoutingController;
  if (!v9)
  {
    v9 = (CBController *)objc_alloc_init((Class)CBController);
    objc_storeStrong((id *)&self->_smartRoutingController, v9);
    -[CBController setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100039F00;
  v10[3] = &unk_1001E2110;
  v10[4] = self;
  -[CBController modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:](v9, "modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:", v7, v8, v10, 4.0);

}

- (void)_updateNearbyDeviceState:(id)a3 withAddress:(id)a4 withEasyPairing:(BOOL)a5 withState:(int)a6
{
  _BOOL4 v7;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  const __CFString *v13;
  const __CFString *v14;
  id v15;
  id v16;
  uint64_t v17;
  __CFString *v18;

  v7 = a5;
  v18 = (__CFString *)a3;
  v10 = (__CFString *)a4;
  v11 = v10;
  if (a6 == 3)
  {

    v11 = CFSTR("FF:FF:FF:FF:FF:FF");
  }
  if (v18 && v11)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      if (a6 > 3)
        v12 = "?";
      else
        v12 = off_1001E3938[a6];
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]", 30, "NearbyDevice State updated to %s with Wx address %@ and nearbyAddress %@", v12, v18, v11);
    }
    v15 = objc_alloc_init((Class)CBDevice);
    objc_msgSend(v15, "setIdentifier:", v18);
    v16 = objc_alloc_init((Class)CBDevice);
    objc_msgSend(v16, "setIdentifier:", v11);
    if (v7)
      v17 = 0;
    else
      v17 = 16;
    -[CBController modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:](self->_smartRoutingController, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:", v15, v16, (char)a6, v17, &stru_1001E33C0);

  }
  else if (dword_10020FA58 <= 90
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    v13 = &stru_1001ED4C0;
    if (v18)
      v14 = v18;
    else
      v14 = &stru_1001ED4C0;
    if (v11)
      v13 = v11;
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]", 90, "NearbyDevice State update failed wxAddress %@ nearbyAddress %@", v14, v13);
  }

}

- (void)_systemUIMonitorEnsureStarted
{
  void *v3;
  FBSDisplayLayoutMonitor *v4;
  FBSDisplayLayoutMonitor *systemUIMonitor;
  _QWORD v6[5];

  if (!self->_systemUIMonitor)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _systemUIMonitorEnsureStarted]", 30, "System UI monitor start");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005D84;
    v6[3] = &unk_1001E33E8;
    v6[4] = self;
    objc_msgSend(v3, "setTransitionHandler:", v6);
    v4 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3));
    systemUIMonitor = self->_systemUIMonitor;
    self->_systemUIMonitor = v4;

  }
}

- (void)_systemUIMonitorEnsureStopped
{
  FBSDisplayLayoutMonitor *systemUIMonitor;

  if (self->_systemUIMonitor)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _systemUIMonitorEnsureStopped]", 30, "System UI monitor stop");
    }
    -[FBSDisplayLayoutMonitor invalidate](self->_systemUIMonitor, "invalidate");
    systemUIMonitor = self->_systemUIMonitor;
    self->_systemUIMonitor = 0;

  }
}

- (void)_wxDiscoveryEnsureStarted
{
  SFDeviceDiscovery *wxDiscovery;
  _BOOL8 v4;
  id v5;
  SFDeviceDiscovery *v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];

  wxDiscovery = self->_wxDiscovery;
  if (wxDiscovery)
  {
    if (self->_prefSmartRoutingEnabledPhase3)
    {
      v4 = GestaltGetDeviceClass(wxDiscovery, a2) != 6;
      if (v4 == -[SFDeviceDiscovery overrideScreenOff](self->_wxDiscovery, "overrideScreenOff"))
        return;
    }
    else
    {
      if ((-[SFDeviceDiscovery overrideScreenOff](wxDiscovery, "overrideScreenOff") & 1) == 0)
        return;
      v4 = 0;
    }
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_wxDiscovery, "setOverrideScreenOff:", v4);
    return;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDiscoveryEnsureStarted]", 30, "Wx discovery start");
  v5 = objc_alloc_init((Class)SFDeviceDiscovery);
  objc_msgSend(v5, "setChangeFlags:", 9);
  objc_msgSend(v5, "setDiscoveryFlags:", 2);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v5, "setPurpose:", CFSTR("SmartRouting"));
  objc_msgSend(v5, "setScanRate:", 20);
  if (self->_prefSmartRoutingEnabledPhase3)
    objc_msgSend(v5, "setOverrideScreenOff:", 1);
  v6 = self->_wxDiscovery;
  self->_wxDiscovery = (SFDeviceDiscovery *)v5;
  v7 = v5;

  -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStarted:](self, "_powerLogSmartRoutingScanStarted:", 7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A790;
  v12[3] = &unk_1001E3240;
  v12[4] = self;
  v12[5] = v7;
  objc_msgSend(v7, "setDeviceFoundHandler:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003A7F8;
  v11[3] = &unk_1001E3240;
  v11[4] = self;
  v11[5] = v7;
  objc_msgSend(v7, "setDeviceLostHandler:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003A860;
  v10[3] = &unk_1001E3268;
  v10[4] = self;
  v10[5] = v7;
  objc_msgSend(v7, "setDeviceChangedHandler:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A8C8;
  v9[3] = &unk_1001E23E8;
  v9[4] = self;
  v9[5] = v7;
  objc_msgSend(v7, "setInvalidationHandler:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A8E4;
  v8[3] = &unk_1001E2410;
  v8[4] = self;
  v8[5] = v7;
  objc_msgSend(v7, "activateWithCompletion:", v8);

}

- (void)_wxDiscoveryEnsureStopped
{
  SFDeviceDiscovery *wxDiscovery;
  NSMutableDictionary *wxDevices;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableDictionary *v10;
  NSMutableDictionary *lowBatteryWxDevices;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_wxDiscovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDiscoveryEnsureStopped]", 30, "Wx discovery stop");
    }
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStopped:](self, "_powerLogSmartRoutingScanStopped:", 7);
    -[SFDeviceDiscovery invalidate](self->_wxDiscovery, "invalidate");
    wxDiscovery = self->_wxDiscovery;
    self->_wxDiscovery = 0;

    wxDevices = self->_wxDevices;
    if (wxDevices)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](wxDevices, "allValues", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            -[BTSmartRoutingDaemon _wxDeviceLost:](self, "_wxDeviceLost:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      v10 = self->_wxDevices;
      self->_wxDevices = 0;

    }
    -[NSMutableDictionary removeAllObjects](self->_lowBatteryWxDevices, "removeAllObjects");
    lowBatteryWxDevices = self->_lowBatteryWxDevices;
    self->_lowBatteryWxDevices = 0;

  }
}

- (void)_wxDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *wxDevices;
  void *v8;
  void *v9;
  uint64_t CFDataOfLength;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  char v15;
  char v16;
  unsigned __int8 v17;
  char v18;
  uint64_t Int64;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const __CFString *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _BOOL4 hijackBackOffInitiator;
  void *v53;
  unsigned int v54;
  void *v55;
  unsigned int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int16 v67;
  void *v68;
  void *v69;
  unsigned __int16 v70;
  NSString *budSwapAddress;
  void *v72;
  BTSmartRoutingBudswapDevice *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  id v83;
  unsigned __int16 *v84;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 tipiElectionInProgress;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  unsigned int v99;
  unsigned int v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  unsigned __int8 v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  unsigned int v118;
  unsigned int v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t Int64Ranged;
  unsigned int v128;
  void *v129;
  id v130;

  v130 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    if (!self->_wxDevices)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      wxDevices = self->_wxDevices;
      self->_wxDevices = v6;

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "bleDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advertisementFields"));
    if (!CFDictionaryGetInt64(v9, CFSTR("paired"), 0))
      goto LABEL_173;
    Int64Ranged = CFDictionaryGetInt64Ranged(v9, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);
    v120 = CFDictionaryGetInt64Ranged(v9, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);
    CFDataOfLength = CFDictionaryGetCFDataOfLength(v9, CFSTR("publicAddress"), 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    v124 = v11;
    v125 = v8;
    if (v11)
    {
      v12 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v11), "bytes")));
      v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v12);

    }
    else
    {
      v13 = 0;
    }
    v122 = CFDictionaryGetInt64Ranged(v9, CFSTR("asCount"), 0, 0xFFFFFFFFLL, 0);
    v119 = CFDictionaryGetInt64Ranged(v9, CFSTR("aState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
    v14 = CFDictionaryGetCFDataOfLength(v9, CFSTR("lch"), 3, 0);
    v126 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = CFDictionaryGetInt64Ranged(v9, CFSTR("srAudioRoutingScore1"), 0, 255, 0);
    v16 = CFDictionaryGetInt64Ranged(v9, CFSTR("srAudioRoutingScore2"), 0, 255, 0);
    v17 = CFDictionaryGetInt64Ranged(v9, CFSTR("audioIdleTime"), 0, 255, 0);
    v18 = CFDictionaryGetInt64Ranged(v9, CFSTR("budsOutofCaseTime"), 0, 255, 0);
    Int64 = CFDictionaryGetInt64(v9, CFSTR("primaryiCloudSignIn"), 0);
    if (dword_10020FA58 <= 30)
    {
      v20 = Int64;
      if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "bleDevice"));
        v22 = CFSTR("Primary");
        if ((Int64Ranged & 0x100) == 0)
          v22 = CFSTR("Secondary");
        v23 = CFSTR("Right");
        if ((Int64Ranged & 0x80) != 0)
          v23 = CFSTR("Left");
        if (v119 >> 2)
          v24 = "?";
        else
          v24 = off_1001E3C08[v119];
        if ((v15 & 0xF0) != 0)
          v25 = "?";
        else
          v25 = off_1001E3C88[v15];
        if ((v16 & 0xF0) != 0)
          v26 = "?";
        else
          v26 = off_1001E3C88[v16];
        if ((v18 & 0xFC) != 0)
          v27 = "?";
        else
          v27 = off_1001E3958[v18];
        v28 = CFSTR("YES");
        if (!v20)
          v28 = CFSTR("NO");
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Wx Device found/updated: %@, headphone Status 0x%0X, bud is %@/%@, source device count: %u audio state: %s lastConnect: %@, tipiScore1: %s, tipiScore2: %s, idle time: %d, outofCaseTime %s, icloud Signed in %@", v21, Int64Ranged, v22, v23, v122, v24, v126, v25, v26, v17, v27, v28);

      }
    }
    if ((Int64Ranged & 0x24) != 0)
      v29 = 1;
    else
      v29 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v120);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
    v31 = objc_msgSend(v30, "isInEar");

    -[BTSmartRoutingDaemon _nearbyWxChanged:](self, "_nearbyWxChanged:", v130);
    -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:](self, "_updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:", v130, 1);
    if (v13)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));

      if (v32)
      {
        -[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:](self, "_lowestBatteryInfoForSFDevice:", v130);
        v34 = v33;
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "_wxDeviceFound, Adding battery info to SR map, Address %@ batteryLevel: %f", v13, *(_QWORD *)&v34);
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
        objc_msgSend(v35, "setLowestBudBatteryInfo:", v34);

      }
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5));
    v37 = v36;
    if (!v13 || !v36)
    {

      if (!v13)
        goto LABEL_66;
      goto LABEL_56;
    }
    v38 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v13));
    if (v38)
    {
      v39 = (void *)v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
      v41 = v40;
      if (v40 && (_DWORD)v122 == 1)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
        v43 = v9;
        v44 = v13;
        v45 = v5;
        v46 = v29;
        v47 = v31;
        v48 = v42;
        v118 = objc_msgSend(v42, "tipiHealingBackoff");

        v31 = v47;
        v29 = v46;
        v5 = v45;
        v13 = v44;
        v9 = v43;

        if (!v118)
          goto LABEL_56;
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "_wxDeviceFound, resetting Tipi Backoff flag here!");
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
        objc_msgSend(v37, "setTipiHealingBackoff:", 0);
      }
      else
      {

      }
    }

LABEL_56:
    v49 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
    if (v49)
    {
      v50 = (void *)v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
      if (objc_msgSend(v51, "hijackBackoffTicks"))
      {
        hijackBackOffInitiator = self->_hijackBackOffInitiator;

        if (!hijackBackOffInitiator && v122 <= 1)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "_wxDeviceFound, hijackblocking resetting hijackBackoffTicks");
          }
          -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:](self, "_hijackBackoffReset:withReason:", v13, CFSTR("wxtipiGone"));
        }
      }
      else
      {

      }
    }
LABEL_66:
    if ((Int64Ranged & 1) == 0
      && !-[BTSmartRoutingDaemon _bluetoothProductIDNoUTP:](self, "_bluetoothProductIDNoUTP:", v120))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5));

      if (v55)
      {
        v56 = v31;
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing, one bud scenario check on already known device.");
        }
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "bleDevice"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "advertisementFields"));
        v67 = CFDictionaryGetInt64Ranged(v66, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);

        if ((v67 & 0x100) != 0 && (Int64Ranged & 0x100) == 0)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing, No UTP detected for both primary / secondary buds, back off.");
          }

          goto LABEL_172;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", v130, v5);

        v31 = v56;
      }
      else
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing, one bud Wx device.");
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", v130, v5);
        -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
      }
LABEL_151:
      v91 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
      if (v91)
      {
        v92 = (void *)v91;
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "deviceName"));

        if (!v94)
        {
          v129 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "deviceManager"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "fetchDeviceSyncWithAddress:", v13));
          v97 = v9;
          v98 = v5;
          v99 = v29;
          v100 = v31;
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "nickname"));
          v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
          objc_msgSend(v102, "setDeviceName:", v101);

          v31 = v100;
          v29 = v99;
          v5 = v98;
          v9 = v97;

        }
      }
      if (self->_prefSmartRoutingPreemptiveConnectedBanner)
      {
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));

        v104 = v103 ? v31 ^ 1 : 0;
        if ((v104 & v29) == 1)
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
          if (objc_msgSend(v105, "preemptiveBannerShown"))
          {

          }
          else
          {
            v106 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
            v107 = objc_msgSend(v106, "firstPreemptiveBannerShown");

            if ((v107 & 1) == 0)
            {
              v108 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
              v109 = objc_msgSend(v108, "preemptiveBannerShown");
              v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
              LODWORD(v109) = -[BTSmartRoutingDaemon _isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:](self, "_isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:", v109, objc_msgSend(v110, "firstPreemptiveBannerShown"), 1, -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"), (int)v119, v13);

              if ((_DWORD)v109)
              {
                v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
                v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "deviceName"));
                if (v13)
                  v113 = v13;
                else
                  v113 = CFSTR("?");
                v114 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
                -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v112, v113, objc_msgSend(v114, "productID"), CFSTR("Connected"), 0, 4.0);

                v115 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
                objc_msgSend(v115, "setPreemptiveBannerShown:", 1);

                -[SmartRoutingStats setLocalAudioScore:](self->_stats, "setLocalAudioScore:", self->_localDeviceAudioCatogory);
                v116 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5));
                objc_msgSend(v116, "setFirstPreemptiveBannerShown:", 1);

                if (dword_10020FA58 <= 30
                  && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                {
                  LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing posting preemptive connected banner upon first inEar event!");
                }
                self->_preemptiveBannerShownTicks = mach_absolute_time();
                self->_preemptiveBannerConnectionInProgress = 1;
                -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.PreemptivePortChanged");
              }
            }
          }
        }
      }
      -[BTSmartRoutingDaemon _evaluatorRunInUseBanner:](self, "_evaluatorRunInUseBanner:", v13);
      -[BTSmartRoutingDaemon _startAudioStateSnapshotTimer](self, "_startAudioStateSnapshotTimer");
LABEL_172:

      v8 = v125;
LABEL_173:

      goto LABEL_174;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5));

    if (!v53)
    {
LABEL_145:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", v130, v5);
      -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
      if (v13)
      {
        v86 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
        if (v86)
        {
          v87 = (void *)v86;
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "otherTipiDeviceBTAddress"));
          if (v89)
          {

          }
          else
          {
            tipiElectionInProgress = self->_tipiElectionInProgress;

            if (!tipiElectionInProgress)
              -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
          }
        }
      }
      goto LABEL_151;
    }
    v54 = v29;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing headset status %u", Int64Ranged);
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5));
    if (!v13)
      goto LABEL_144;
    v58 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
    if (!v58)
      goto LABEL_144;
    v59 = (void *)v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "otherTipiDeviceBTAddress"));

    if (!v61)
      goto LABEL_144;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "otherTipiDeviceBTAddress"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing headset in Tipi with %@", v63);

    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bleDevice"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "advertisementFields"));
    v70 = CFDictionaryGetInt64Ranged(v69, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);

    if (((v70 ^ (unsigned __int16)Int64Ranged) & 0x100) != 0)
    {
      if (((v70 ^ Int64Ranged) & 0x80) != 0)
        goto LABEL_121;
      if (dword_10020FA58 <= 30)
      {
        if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing, A2DP / HFP budswap detected from placement...");
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Saving budswap info since we are in Tipi", v117);
        }
      }
    }
    else
    {
      if (((v70 ^ Int64Ranged) & 0x80) == 0)
        goto LABEL_121;
      if (dword_10020FA58 <= 30)
      {
        if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Smart Routing, A2DP / HFP budswap detected from primary...");
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Saving budswap info since we are in Tipi %@", v13);
        }
      }
    }
    budSwapAddress = self->_budSwapAddress;
    self->_hfpBudswapDetected = 1;
    if (!budSwapAddress)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v13));

      if (!v72)
      {
        v73 = objc_alloc_init(BTSmartRoutingBudswapDevice);
        -[BTSmartRoutingBudswapDevice setReconnectionState:](v73, "setReconnectionState:", 0);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_srBudswapDeviceMap, "setObject:forKeyedSubscript:", v73, v13);
        objc_storeStrong((id *)&self->_budSwapAddress, v13);
        -[BTSmartRoutingDaemon _budSwapDetectionStartTimer:](self, "_budSwapDetectionStartTimer:", v13);

      }
    }
LABEL_121:
    if (self->_tipiSetupTicks)
    {
      v74 = mach_absolute_time();
      v75 = UpTicksToMilliseconds(v74 - self->_tipiSetupTicks);
      if ((_DWORD)v122 == 1)
      {
        v76 = v75;
        if (v75 > 0x2710 || !self->_tipiSetupTicks)
          goto LABEL_128;
      }
    }
    else if ((_DWORD)v122 == 1)
    {
      v76 = 0;
LABEL_128:
      v128 = v31;
      v77 = CFDictionaryGetCFDataOfLength(v9, CFSTR("lch"), 3, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
      if (v78)
      {
        v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString")));
        v80 = (const char *)objc_msgSend(v79, "UTF8String");
        if (!v80)
          v80 = "";
        v81 = NSDataWithHex(v80, -1, 22, 0, 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
        if (objc_msgSend(v82, "length") == (id)6)
        {
          v123 = v79;
          v83 = objc_retainAutorelease(v82);
          v121 = (char *)objc_msgSend(v83, "bytes");
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceFound:]", 30, "Evaluator: One source detected Wx: %@, myAddress: %@. mSecondsSinceTipiConnectSetup %llu", v78, v83, v76);
          }
          v84 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v78), "bytes");
          v79 = v123;
          if (*v84 == *(unsigned __int16 *)(v121 + 3) && *((unsigned __int8 *)v84 + 2) == v121[5])
            -[BTSmartRoutingDaemon _removeTiPiState:](self, "_removeTiPiState:", v13);
        }

      }
      self->_tipiSetupTicks = 0;

      v31 = v128;
    }
LABEL_144:

    v29 = v54;
    goto LABEL_145;
  }
LABEL_174:

}

- (void)_wxDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t Int64Ranged;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bleDevice"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v8 = (void *)v7;
      v9 = &stru_1001ED4C0;
      if (v7)
        v9 = (const __CFString *)v7;
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDeviceLost:]", 30, "Wx Device lost: %@ %@", v5, v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bleDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "advertisementFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v11, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);

    if (!-[NSMutableDictionary count](self->_wxDevices, "count"))
      -[BTSmartRoutingDaemon _submitMetricNearby:](self, "_submitMetricNearby:", Int64Ranged);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", 0, v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nearbyWxDeviceMap, "setObject:forKeyedSubscript:", 0, v5);
    -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:](self, "_updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:", v13, 0);
    -[BTSmartRoutingDaemon _stopAudioStateSnapshotTimer:](self, "_stopAudioStateSnapshotTimer:", 0);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }

}

- (void)_wxDiscoveryWatchRecoveryEnsureStarted
{
  CUBLEScanner *v3;
  CUBLEScanner *wxDiscoveryWatchRecovery;
  CUBLEScanner *v5;
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_wxDiscoveryWatchRecovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryEnsureStarted]", 30, "Wx discovery for watch recovery started");
    }
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStarted:](self, "_powerLogSmartRoutingScanStarted:", 7);
    v3 = (CUBLEScanner *)objc_alloc_init((Class)CUBLEScanner);
    wxDiscoveryWatchRecovery = self->_wxDiscoveryWatchRecovery;
    self->_wxDiscoveryWatchRecovery = v3;
    v5 = v3;

    -[CUBLEScanner setChangeFlags:](v5, "setChangeFlags:", 16);
    -[CUBLEScanner setScanFlags:](v5, "setScanFlags:", 16);
    -[CUBLEScanner setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBLEScanner setLabel:](v5, "setLabel:", CFSTR("SmartRouting"));
    -[CUBLEScanner setScanRate:](v5, "setScanRate:", 50);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003BF70;
    v8[3] = &unk_1001E3410;
    v8[4] = self;
    -[CUBLEScanner setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003BF7C;
    v7[3] = &unk_1001E3410;
    v7[4] = self;
    -[CUBLEScanner setDeviceLostHandler:](v5, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003BF88;
    v6[3] = &unk_1001E23E8;
    v6[4] = v5;
    v6[5] = self;
    -[CUBLEScanner setInvalidationHandler:](v5, "setInvalidationHandler:", v6);
    -[CUBLEScanner activate](v5, "activate");

  }
}

- (void)_wxDiscoveryWatchRecoveryEnsureStopped
{
  CUBLEScanner *wxDiscoveryWatchRecovery;
  NSMutableDictionary *watchWxDevices;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableDictionary *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_wxDiscoveryWatchRecovery)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryEnsureStopped]", 30, "Wx discovery for watch recovery stopped");
    }
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStopped:](self, "_powerLogSmartRoutingScanStopped:", 7);
    -[CUBLEScanner invalidate](self->_wxDiscoveryWatchRecovery, "invalidate");
    wxDiscoveryWatchRecovery = self->_wxDiscoveryWatchRecovery;
    self->_wxDiscoveryWatchRecovery = 0;

    watchWxDevices = self->_watchWxDevices;
    if (watchWxDevices)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](watchWxDevices, "allValues", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            -[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryLostDevice:](self, "_wxDiscoveryWatchRecoveryLostDevice:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

      v10 = self->_watchWxDevices;
      self->_watchWxDevices = 0;

    }
  }
}

- (void)_wxDiscoveryWatchRecoveryFoundDevice:(id)a3
{
  void *v4;
  NSMutableDictionary *watchWxDevices;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 tipiElectionInProgress;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  if (v4)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryFoundDevice:]", 30, "Wx watch recovery device found/updated: %@", v17);
    }
    watchWxDevices = self->_watchWxDevices;
    if (!watchWxDevices)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v7 = self->_watchWxDevices;
      self->_watchWxDevices = v6;

      watchWxDevices = self->_watchWxDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](watchWxDevices, "setObject:forKeyedSubscript:", v17, v4);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addressData"));
    v9 = v8;
    if (v8)
    {
      v10 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v8), "bytes")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (v11)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
        if (v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "otherTipiDeviceBTAddress"));
          if (v15)
          {

          }
          else
          {
            tipiElectionInProgress = self->_tipiElectionInProgress;

            if (!tipiElectionInProgress)
              -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
          }
        }
      }
    }
    else
    {
      v11 = 0;
    }
    if (-[NSMutableDictionary count](self->_watchWxDevices, "count") == (id)1)
      -[BTSmartRoutingDaemon _update](self, "_update");

  }
}

- (void)_wxDiscoveryWatchRecoveryLostDevice:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  if (v4)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryLostDevice:]", 30, "Wx watch recovery device lost: %@", v5);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchWxDevices, "setObject:forKeyedSubscript:", 0, v4);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }

}

- (void)_setConnectedBannerTick:(unint64_t)a3
{
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setConnectedBannerTick:]", 30, "Setting connected banner tick %u", a3);
  self->_showBannerConnectedLastTicks = a3;
}

- (BOOL)_isInHijackBlockingMode
{
  BOOL v2;
  void *v4;

  if (self->_splitterStateOn || self->_hijackBackOffInitiator)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice hijackBlockingClientSet](self->_sourceDevice, "hijackBlockingClientSet"));
  v2 = objc_msgSend(v4, "count") != 0;

  return v2;
}

- (void)getLocalAudioInfofromSnapshot:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalDeviceAudioScore](self->_stats, "snapshotLocalDeviceAudioScore"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalDeviceAudioScore](self->_stats, "snapshotLocalDeviceAudioScore"));
    *a3 = objc_msgSend(v14, "intValue");

  }
  else
  {
    *a3 = -1;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
    *a4 = objc_msgSend(v16, "intValue");

  }
  else
  {
    *a4 = 0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp"));
  if (v17)
  {
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp")));
    *a5 = v18;

  }
  else
  {
    *a5 = CFSTR("NA");
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalRoute](self->_stats, "snapshotLocalRoute"));
  if (v19)
  {
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalRoute](self->_stats, "snapshotLocalRoute")));
    *a6 = v20;

  }
  else
  {
    *a6 = CFSTR("NA");
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotRemoteDeviceAudioScore](self->_stats, "snapshotRemoteDeviceAudioScore"));
  if (v21)
  {
    v23 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotRemoteDeviceAudioScore](self->_stats, "snapshotRemoteDeviceAudioScore"));
    *a7 = objc_msgSend(v22, "intValue");

    v21 = v23;
  }
  else
  {
    *a7 = -1;
  }

}

- (void)getHijackAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  void *v13;
  void *v14;
  unsigned int v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
    *a4 = objc_msgSend(v14, "intValue");

  }
  else
  {
    *a4 = 0;
  }

  *a3 = -[SmartRoutingStats hijackScore](self->_stats, "hijackScore");
  v15 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
  if (v15 > 4)
    v16 = "?";
  else
    v16 = off_1001E3DF8[v15];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
  *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingApp](self->_stats, "hijackPlayingApp"));
  if (v18)
  {
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingApp](self->_stats, "hijackPlayingApp")));
    *a5 = v19;

  }
  else
  {
    *a5 = CFSTR("NA");
  }

  *a7 = -[SmartRoutingStats hijackActiveRemoteScore](self->_stats, "hijackActiveRemoteScore");
  -[SmartRoutingStats setManualRouteDestination:](self->_stats, "setManualRouteDestination:", CFSTR("NA"));
  -[SmartRoutingStats setManualRouteInputOutput:](self->_stats, "setManualRouteInputOutput:", CFSTR("NA"));
  -[SmartRoutingStats setManualRouteUISource:](self->_stats, "setManualRouteUISource:", CFSTR("NA"));
}

- (void)getHijackedAwayAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  void *v13;
  void *v14;
  unsigned int v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
    *a4 = objc_msgSend(v14, "intValue");

  }
  else
  {
    *a4 = 0;
  }

  *a3 = -[SmartRoutingStats hijackAwayLocalScore](self->_stats, "hijackAwayLocalScore");
  v15 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
  if (v15 > 4)
    v16 = "?";
  else
    v16 = off_1001E3DF8[v15];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
  *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp"));
  if (v18)
  {
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp")));
    *a5 = v19;

  }
  else
  {
    *a5 = CFSTR("NA");
  }

  *a7 = -[SmartRoutingStats hijackAwayRemoteScore](self->_stats, "hijackAwayRemoteScore");
  -[SmartRoutingStats setManualRouteDestination:](self->_stats, "setManualRouteDestination:", CFSTR("NA"));
  -[SmartRoutingStats setManualRouteInputOutput:](self->_stats, "setManualRouteInputOutput:", CFSTR("NA"));
  -[SmartRoutingStats setManualRouteUISource:](self->_stats, "setManualRouteUISource:", CFSTR("NA"));
}

- (void)_startHijackMetricSubmission:(int64_t)a3 wxAddress:(id)a4 version:(id)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  const char *v20;
  const __CFString *v21;
  void *v22;
  id v23;

  v23 = a4;
  v8 = a5;
  v9 = mach_absolute_time();
  v10 = UpTicksToSeconds(v9 - -[SmartRoutingStats hijackInputTick](self->_stats, "hijackInputTick"));
  v11 = mach_absolute_time();
  v12 = UpTicksToSeconds(v11 - -[SmartRoutingStats hijackAmbientTick](self->_stats, "hijackAmbientTick"));
  v13 = mach_absolute_time();
  v14 = UpTicksToSeconds(v13 - -[SmartRoutingStats hijackMediaTick](self->_stats, "hijackMediaTick"));
  v15 = mach_absolute_time();
  v16 = UpTicksToSeconds(v15 - -[SmartRoutingStats hijackCallTick](self->_stats, "hijackCallTick"));
  v17 = mach_absolute_time();
  v18 = UpTicksToSeconds(v17 - -[BTSmartRoutingSourceDevice predictiveRouteTicks](self->_sourceDevice, "predictiveRouteTicks"));
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startHijackMetricSubmission:wxAddress:version:]", 30, "HijackStats: Version %@ lastMediaSubmission %us lastCallSubmission %us lastAmbientSubmission %us lastsInputSubmission %us lastPredictiveRoute %us", v8, v14, v16, v12, v10, v18);
  if (v18 >= 3)
  {
    if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 200)
    {
      if (v10 < 3)
        goto LABEL_27;
      -[SmartRoutingStats setHijackInputTick:](self->_stats, "setHijackInputTick:", mach_absolute_time());
    }
    if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 201)
    {
      if (v12 < 3)
        goto LABEL_27;
      -[SmartRoutingStats setHijackAmbientTick:](self->_stats, "setHijackAmbientTick:", mach_absolute_time());
    }
    else if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 301)
    {
      if (v14 < 3)
        goto LABEL_27;
      -[SmartRoutingStats setHijackMediaTick:](self->_stats, "setHijackMediaTick:", mach_absolute_time());
    }
    else if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 501)
    {
      if (v16 < 3)
        goto LABEL_27;
      -[SmartRoutingStats setHijackCallTick:](self->_stats, "setHijackCallTick:", mach_absolute_time());
    }
    switch(a3)
    {
      case 1:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats reverseRouteReason](self->_stats, "reverseRouteReason"));

        if (!v19)
          -[SmartRoutingStats setReverseRouteReason:](self->_stats, "setReverseRouteReason:", CFSTR("Hijack"));
        v20 = "Accepted";
        v21 = CFSTR("Hijack_Accepted");
        break;
      case 2:
        v20 = "Ambiguity";
        v21 = CFSTR("Hijack_Ambiguity");
        break;
      case 3:
        v20 = "Rejected";
        v21 = CFSTR("Hijack_Rejected");
        break;
      case 4:
        v20 = "Backoff";
        v21 = CFSTR("Hijack_Backoff");
        break;
      default:
        v20 = "?";
        v21 = CFSTR("NA");
        break;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
    -[SmartRoutingStats setHijackAnswer:](self->_stats, "setHijackAnswer:", v22);

    -[SmartRoutingStats setHijackVersion:](self->_stats, "setHijackVersion:", CFSTR("V2"));
    -[BTSmartRoutingDaemon submitHijackMetric:withV1:](self, "submitHijackMetric:withV1:", v23, objc_msgSend(v8, "isEqualToString:", CFSTR("V1")));
    -[BTSmartRoutingDaemon _startRouteChangeDetectionTimer:andAnswer:](self, "_startRouteChangeDetectionTimer:andAnswer:", v23, a3);
    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v23, 5);
    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v23, 6);
    -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:](self, "submitRouteActivityMetric:activity:", v23, v21);
  }
LABEL_27:

}

- (void)_statsEnsureStarted
{
  SmartRoutingStats *v3;
  SmartRoutingStats *stats;
  NSMutableDictionary *v5;
  NSMutableDictionary *smartRoutingWxStatsMap;

  if (!self->_stats)
  {
    v3 = objc_alloc_init(SmartRoutingStats);
    stats = self->_stats;
    self->_stats = v3;

  }
  if (!self->_smartRoutingWxStatsMap)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    smartRoutingWxStatsMap = self->_smartRoutingWxStatsMap;
    self->_smartRoutingWxStatsMap = v5;

  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _statsEnsureStarted]", 30, "init SmartRoutingStats");
}

- (void)_submitManualConnectionMetric:(id)a3
{
  id v4;
  uint64_t score;
  const char *v6;
  uint64_t v7;
  uint64_t audioScoreOtherTipiDevice;
  const char *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  _QWORD v63[21];
  _QWORD v64[21];

  v4 = a3;
  if (v4)
  {
    score = self->_score;
    if (score > 0xF)
      v6 = "?";
    else
      v6 = off_1001E3C88[score];
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    if (audioScoreOtherTipiDevice > 0xF)
      v9 = "?";
    else
      v9 = off_1001E3C88[audioScoreOtherTipiDevice];
    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
    v12 = objc_msgSend(v11, "routingAction");
    if (v12 > 5)
      v13 = "?";
    else
      v13 = off_1001E3E40[v12];
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
    v14 = mach_absolute_time();
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v4));
    v58 = UpTicksToMilliseconds(v14 - (_QWORD)objc_msgSend(v15, "lastConnectionTicks"));

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "otherTipiDeviceBTName"));
    v17 = (void *)v16;
    v18 = CFSTR("NA");
    if (v16)
      v18 = (__CFString *)v16;
    v61 = v18;

    v19 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v4));
    v20 = (void *)v19;
    if (v19)
      v21 = (__CFString *)v19;
    else
      v21 = &stru_1001ED4C0;
    v59 = v21;

    v60 = v11;
    if (-[BTSmartRoutingSourceDevice evalTicks](self->_sourceDevice, "evalTicks"))
    {
      v22 = mach_absolute_time();
      v23 = UpTicksToMilliseconds(v22 - -[BTSmartRoutingSourceDevice evalTicks](self->_sourceDevice, "evalTicks"));
    }
    else
    {
      v23 = -1;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v4));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v4));
    if (objc_msgSend(v27, "lastEvalTicks"))
    {
      v28 = mach_absolute_time();
      v29 = UpTicksToMilliseconds(v28 - (_QWORD)objc_msgSend(v25, "lastEvalTicks"));
    }
    else
    {
      v29 = -1;
    }

    if (objc_msgSend(v25, "lastConnectTicks"))
    {
      v30 = mach_absolute_time();
      v31 = UpTicksToSeconds(v30 - (_QWORD)objc_msgSend(v25, "lastConnectTicks"));
    }
    else
    {
      v31 = -1;
    }
    v64[0] = v7;
    v63[0] = CFSTR("audioScore");
    v63[1] = CFSTR("forceConnect");
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_forcedConnection));
    v64[1] = v57;
    v63[2] = CFSTR("lastConnectSecond");
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v31));
    v64[2] = v56;
    v63[3] = CFSTR("lastConnectResult");
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastConnectResult"));
    v55 = (void *)v32;
    if (v32)
      v33 = (const __CFString *)v32;
    else
      v33 = &stru_1001ED4C0;
    v64[3] = v33;
    v63[4] = CFSTR("lastEvalSourceResult");
    v34 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalResult](self->_sourceDevice, "evalResult"));
    v54 = (void *)v34;
    if (v34)
      v35 = (const __CFString *)v34;
    else
      v35 = &stru_1001ED4C0;
    v64[4] = v35;
    v63[5] = CFSTR("lastEvalSourceMS");
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v23));
    v64[5] = v53;
    v63[6] = CFSTR("lastEvalWxResult");
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v4));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lastEvalResult"));
    v37 = (void *)v36;
    if (v36)
      v38 = (const __CFString *)v36;
    else
      v38 = &stru_1001ED4C0;
    v64[6] = v38;
    v63[7] = CFSTR("lastEvalWxMS");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v29));
    v64[7] = v48;
    v63[8] = CFSTR("nearbyDeviceCount");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_nearbyInfoDevices, "count")));
    v64[8] = v39;
    v63[9] = CFSTR("nearbyWxCount");
    v49 = v25;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_wxDevices, "count")));
    v64[9] = v40;
    v64[10] = v10;
    v63[10] = CFSTR("peerAudioScore");
    v63[11] = CFSTR("peerConnectTime");
    v64[11] = &off_1001F4518;
    v64[12] = v61;
    v63[12] = CFSTR("peerModel");
    v63[13] = CFSTR("peerConnectTry");
    v64[13] = &off_1001F4518;
    v64[14] = v62;
    v63[14] = CFSTR("routingAction");
    v63[15] = CFSTR("tipiConnect");
    v50 = (void *)v7;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "otherTipiDeviceBTAddress"));
    v42 = CFSTR("Yes");
    if (!v41)
      v42 = CFSTR("No");
    v64[15] = v42;
    v63[16] = CFSTR("wxConnectTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v58));
    v64[16] = v43;
    v63[17] = CFSTR("wxProductID");
    v47 = (void *)v10;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v60, "productID")));
    v64[17] = v44;
    v63[18] = CFSTR("srCapable");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_prefSmartRoutingEnabledPhase3));
    v64[18] = v45;
    v64[19] = &off_1001F4530;
    v63[19] = CFSTR("wxConnectTry");
    v63[20] = CFSTR("wxBuildVersion");
    v64[20] = v59;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 21));
    CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.ManualConnect"), v46);

  }
}

- (void)_submitConnectionMetric:(id)a3 andError:(id)a4
{
  id v6;
  uint64_t score;
  const char *v8;
  uint64_t audioScoreOtherTipiDevice;
  const char *v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BOOL8 v31;
  unsigned int v32;
  unsigned int v33;
  __CFString *v34;
  void *v35;
  void *v36;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  NSMutableDictionary *nearbyInfoDevices;
  void *v39;
  void *v40;
  unint64_t v41;
  const char *v42;
  const __CFString *v43;
  const __CFString *v44;
  __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  __CFString *v70;
  void *v71;
  __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  unint64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[5];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  _QWORD v89[28];
  _QWORD v90[28];

  v6 = a3;
  v80 = a4;
  v81 = v6;
  if (v6)
  {
    score = self->_score;
    if (score > 0xF)
      v8 = "?";
    else
      v8 = off_1001E3C88[score];
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
    audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    if (audioScoreOtherTipiDevice > 0xF)
      v10 = "?";
    else
      v10 = off_1001E3C88[audioScoreOtherTipiDevice];
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "identifier"));
    v11 = objc_msgSend(v82, "routingAction");
    if (v11 > 5)
      v12 = "?";
    else
      v12 = off_1001E3E40[v11];
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
    v13 = mach_absolute_time();
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v83));
    v57 = UpTicksToMilliseconds(v13 - (_QWORD)objc_msgSend(v14, "lastConnectionTicks"));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "otherTipiDeviceBTName"));
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = CFSTR("NA");
    v70 = v17;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v83));
    v19 = objc_msgSend(v18, "preemptiveBannerShown");

    if (v19)
    {
      v20 = mach_absolute_time();
      v79 = UpTicksToMilliseconds(v20 - self->_preemptiveBannerShownTicks);
      if (v79 >> 5 >= 0x271)
        v79 = UpTicksToMilliseconds(20);
      self->_preemptiveBannerShownTicks = 0;
      if (self->_preemptiveBannerConnectionInProgress)
        self->_preemptiveBannerConnectionInProgress = 0;
    }
    else
    {
      v79 = 0;
    }
    v21 = CUPrintNSError(v80);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
    v22 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v81));
    v23 = (void *)v22;
    if (v22)
      v24 = (__CFString *)v22;
    else
      v24 = &stru_1001ED4C0;
    v62 = v24;

    v25 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats onDemandCategory](self->_stats, "onDemandCategory"));
    v26 = (void *)v25;
    if (v25)
      v27 = (__CFString *)v25;
    else
      v27 = CFSTR("NA");
    v72 = v27;

    if (-[SmartRoutingStats pipeStartTime](self->_stats, "pipeStartTime"))
    {
      v28 = mach_absolute_time();
      v29 = UpTicksToMilliseconds(v28 - -[SmartRoutingStats pipeStartTime](self->_stats, "pipeStartTime"));
    }
    else
    {
      v29 = 0;
    }
    v30 = -[SmartRoutingStats firstPipeMessageRTT](self->_stats, "firstPipeMessageRTT");
    v55 = -[BTSmartRoutingDaemon _inEarNearbyCheck:](self, "_inEarNearbyCheck:", v81);
    v31 = -[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress");
    v32 = -[BTSmartRoutingDaemon _isConnectionTipiv2](self, "_isConnectionTipiv2");
    v33 = v32;
    if (v29 != 0 && ~v31)
      v34 = CFSTR("Legacy Tipi");
    else
      v34 = CFSTR("Phase 1");
    if (v32)
      v34 = CFSTR("Tipi2.0");
    v66 = v34;
    v78 = -[BTSmartRoutingDaemon _inCaseLidClosed:](self, "_inCaseLidClosed:", v81);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v83));
    v56 = objc_msgSend(v35, "preemptiveBannerShown");

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v83));
    v54 = objc_msgSend(v36, "sourceCount");

    if (v78
      && dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _submitConnectionMetric:andError:]", 90, "### Shall not connect when buds in case and case is closed");
    }
    if (v33)
    {
      phase1ConnectConfig = self->_phase1ConnectConfig;
      self->_phase1ConnectConfig = 0;

    }
    v85 = 0;
    v86 = &v85;
    v87 = 0x2020000000;
    v88 = 0;
    nearbyInfoDevices = self->_nearbyInfoDevices;
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10003DCD8;
    v84[3] = &unk_1001E2CE0;
    v84[4] = &v85;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v84);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v83));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v83));
      v41 = (unint64_t)objc_msgSend(v40, "audioState");
      if (v41 > 3)
        v42 = "?";
      else
        v42 = off_1001E3C08[v41];
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v42));

    }
    else
    {
      v58 = CFSTR("Unknown");
    }
    v90[0] = v77;
    v89[0] = CFSTR("audioScore");
    v89[1] = CFSTR("firstPipeMessageRTT");
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v30));
    v90[1] = v76;
    v89[2] = CFSTR("forceConnect");
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_forcedConnection));
    v90[2] = v75;
    v89[3] = CFSTR("localAudioScore");
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats localAudioScore](self->_stats, "localAudioScore"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v74, "intValue")));
    v90[3] = v71;
    v89[4] = CFSTR("nearbyDeviceCount");
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v86 + 6)));
    v90[4] = v68;
    v89[5] = CFSTR("nearbyWxCount");
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_wxDevices, "count")));
    v90[5] = v65;
    v90[6] = v72;
    v89[6] = CFSTR("onDemandCategory");
    v89[7] = CFSTR("onDemandConnect");
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v31));
    v90[7] = v64;
    v89[8] = CFSTR("setupSupportsTipiv2");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SmartRoutingStats setupSupportsTipiv2](self->_stats, "setupSupportsTipiv2")));
    v90[8] = v61;
    v90[9] = v73;
    v89[9] = CFSTR("peerAudioScore");
    v89[10] = CFSTR("peerModel");
    v90[10] = v70;
    v89[11] = CFSTR("pipeToConnectionCompleteTime");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v29));
    v90[11] = v60;
    v89[12] = CFSTR("preemptiveBannerFailureReason");
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalPreemptiveBannerResult](self->_sourceDevice, "evalPreemptiveBannerResult"));
    v43 = v59;
    if (!v59)
      v43 = &stru_1001ED4C0;
    if (v56)
      v44 = CFSTR("Yes");
    else
      v44 = CFSTR("No");
    v90[12] = v43;
    v90[13] = v44;
    v89[13] = CFSTR("preemptiveBannerShown");
    v89[14] = CFSTR("preemptiveBannerTime");
    if (v79)
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    else
      v45 = CFSTR("Not initialized");
    v90[14] = v45;
    v90[15] = v69;
    v89[15] = CFSTR("routingAction");
    v89[16] = CFSTR("systemAudioRoute");
    v90[16] = v67;
    v89[17] = CFSTR("tipiConnect");
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "otherTipiDeviceBTAddress"));
    if (v46)
      v47 = CFSTR("Yes");
    else
      v47 = CFSTR("No");
    v90[17] = v47;
    v90[18] = v66;
    v89[18] = CFSTR("tipiConnectType");
    v89[19] = CFSTR("wxConnectTime");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v57));
    v90[19] = v48;
    v89[20] = CFSTR("wxProductID");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v82, "productID")));
    v90[20] = v49;
    v90[21] = v63;
    v89[21] = CFSTR("wxConnectResult");
    v89[22] = CFSTR("wxConnectResult2");
    v90[22] = v63;
    v90[23] = v62;
    v89[23] = CFSTR("wxBuildVersion");
    v89[24] = CFSTR("wxInEar");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v55));
    v90[24] = v50;
    v89[25] = CFSTR("wxInCasewithLidClosed");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v78));
    v90[25] = v51;
    v89[26] = CFSTR("wxSourceCount");
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v54));
    v89[27] = CFSTR("wxStreamState");
    v90[26] = v52;
    v90[27] = v58;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 28));
    CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.headsetConnection"), v53);

    if (v79)
    if (v80)
      -[SmartRoutingStats setOnDemandCategory:](self->_stats, "setOnDemandCategory:", 0);

    _Block_object_dispose(&v85, 8);
  }

}

- (void)_submitHijackBlockMetric:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[7];

  v6 = a3;
  v7 = a4;
  v8 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  v10 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
  v11 = (void *)v10;
  v12 = &stru_1001ED4C0;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v14 = -[SmartRoutingStats mediaPlaying](self->_stats, "mediaPlaying")
     || -[SmartRoutingStats callConnected](self->_stats, "callConnected");
  v15 = mach_absolute_time();
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
  v17 = UpTicksToSeconds(v15 - (_QWORD)objc_msgSend(v16, "hijackBackoffTicks"))
      + self->_prefSmartRoutingBlockHijackWindowinSeconds * self->_hijackBackoffCount;

  v23[0] = CFSTR("initiator");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hijackBackOffInitiator));
  v24[0] = v18;
  v23[1] = CFSTR("isPlaying");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
  v24[1] = v19;
  v24[2] = v9;
  v23[2] = CFSTR("route");
  v23[3] = CFSTR("terminateReason");
  v24[3] = v7;
  v23[4] = CFSTR("blockTimeSeconds");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17));
  v24[4] = v20;
  v24[5] = v13;
  v23[5] = CFSTR("wxBuildVersion");
  v23[6] = CFSTR("wxProductID");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
  v24[6] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 7));
  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.PreventRepetitiveHijacking"), v22);

}

- (void)_submitRouteCheckMetric:(id)a3 andType:(int)a4
{
  id v6;
  unsigned int v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  _BOOL8 v58;
  _BOOL8 v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  signed int v90;
  void *v91;
  void *v92;
  unsigned int v93;
  int v94;
  __CFString *v95;
  const __CFString *v96;
  __CFString *v97;
  __CFString *v98;
  __CFString *v99;
  __CFString *v100;
  void *v101;
  void *v102;
  void *v103;
  __CFString *v104;
  __CFString *v105;
  void *v106;
  __CFString *v107;
  __CFString *v108;
  __CFString *v109;
  _QWORD v110[24];
  _QWORD v111[24];

  v6 = a3;
  if (v6)
  {
    v93 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v6);
    v7 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
    if (v7 > 4)
      v8 = "?";
    else
      v8 = off_1001E3DF8[v7];
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));

    v10 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats onDemandCategory](self->_stats, "onDemandCategory"));
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = CFSTR("NA");
    v105 = v12;

    v13 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
    v14 = (void *)v13;
    v15 = &stru_1001ED4C0;
    if (v13)
      v15 = (__CFString *)v13;
    v104 = v15;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    v90 = -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue");
    if (a4 > 0xE)
      v17 = "?";
    else
      v17 = off_1001E3D28[a4];
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "otherTipiDeviceBTName"));
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = CFSTR("NA");
    v107 = v20;

    v21 = -[BTSmartRoutingSourceDevice bluetoothState](self->_sourceDevice, "bluetoothState");
    if (v21 > 0xA)
      v22 = "?";
    else
      v22 = off_1001E3978[v21];
    v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
    v92 = v24;
    if (v24)
    {
      v25 = objc_msgSend(v24, "audioStreamState");
      if (v25 > 3)
        v26 = "?";
      else
        v26 = off_1001E3DD8[v25];
      v100 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v26));
    }
    else
    {
      v100 = CFSTR("NA");
    }
    v108 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));
    v27 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackVersion](self->_stats, "hijackVersion"));
    v28 = (void *)v27;
    if (v27)
      v29 = (__CFString *)v27;
    else
      v29 = CFSTR("NA");
    v30 = v29;

    v31 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackAnswer](self->_stats, "hijackAnswer"));
    v32 = (void *)v31;
    if (v31)
      v33 = (__CFString *)v31;
    else
      v33 = CFSTR("NA");
    v99 = v33;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v6));
    v35 = v34;
    v84 = v6;
    v101 = (void *)v23;
    if (v9 && v16)
    {
      v36 = objc_msgSend(v16, "inEar");
    }
    else
    {
      if (v9)
      {
        v97 = CFSTR("NA");
LABEL_43:
        v38 = 0;
        v39 = 0;
        v40 = CFSTR("NA");
        v82 = v35;
        v109 = CFSTR("NA");
        switch(a4)
        {
          case 5:
          case 6:
            v39 = -[SmartRoutingStats hijackScore](self->_stats, "hijackScore");
            goto LABEL_45;
          case 7:
          case 9:
          case 10:
          case 11:
            goto LABEL_68;
          case 8:
            v41 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats reverseRouteReason](self->_stats, "reverseRouteReason"));

            v39 = 0;
            v38 = 0;
            v40 = CFSTR("NA");
            v108 = (__CFString *)v41;
            goto LABEL_67;
          case 12:
            if (v16)
            {
              if (objc_msgSend(v16, "otherTipiDeviceIdleTick"))
              {
                v42 = mach_absolute_time();
                v39 = 0;
                v38 = UpTicksToSeconds(v42 - (_QWORD)objc_msgSend(v16, "otherTipiDeviceIdleTick")) - 25;
              }
              else
              {
                v39 = 0;
LABEL_45:
                v38 = 0;
              }
              v40 = CFSTR("NA");
            }
            else
            {
              v39 = 0;
              v38 = 0;
            }
            goto LABEL_67;
          case 13:

            v43 = objc_alloc_init((Class)NSMutableDictionary);
            v44 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerAction](self->_stats, "bannerAction"));
            v95 = v30;
            v45 = (void *)v44;
            if (v44)
              v46 = (const __CFString *)v44;
            else
              v46 = CFSTR("NA");
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, CFSTR("BannerAction"), v82);

            v47 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerTrigger](self->_stats, "bannerTrigger"));
            v48 = (void *)v47;
            if (v47)
              v49 = (const __CFString *)v47;
            else
              v49 = CFSTR("NA");
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v49, CFSTR("BannerTrigger"));

            v50 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getJsonStringFromDictionary:](self, "_getJsonStringFromDictionary:", v43));
            v51 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerTrigger](self->_stats, "bannerTrigger"));
            v52 = (void *)v51;
            if (v51)
              v53 = (__CFString *)v51;
            else
              v53 = CFSTR("NA");
            v54 = v53;

            v55 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerAction](self->_stats, "bannerAction"));
            v56 = (void *)v55;
            if (v55)
              v57 = (__CFString *)v55;
            else
              v57 = CFSTR("NA");
            v109 = v57;

            v40 = v54;
            v39 = 0;
            v38 = 0;
            v107 = CFSTR("NA");
            v108 = (__CFString *)v50;
            v30 = v95;
            goto LABEL_68;
          default:
LABEL_67:
            v109 = CFSTR("NA");
LABEL_68:
            v98 = (__CFString *)v40;
            v103 = v16;
            v94 = a4;
            if (-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("Backoff"), v82))
            {

              v96 = CFSTR("All");
            }
            else
            {
              v96 = v30;
            }
            v58 = v90 > 100;
            v59 = v9 != 0;
            v110[0] = CFSTR("ActivePlayingApp");
            v60 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
            v91 = (void *)v60;
            if (v60)
              v61 = (const __CFString *)v60;
            else
              v61 = CFSTR("NA");
            v111[0] = v61;
            v111[1] = v109;
            v110[1] = CFSTR("BannerAction");
            v110[2] = CFSTR("BluetoothState");
            v111[2] = v101;
            v110[3] = CFSTR("HijackAnswer");
            v62 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackAnswer](self->_stats, "hijackAnswer"));
            v89 = (void *)v62;
            if (v62)
              v63 = (const __CFString *)v62;
            else
              v63 = CFSTR("NA");
            v111[3] = v63;
            v110[4] = CFSTR("HijackScore");
            v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v39));
            v111[4] = v88;
            v110[5] = CFSTR("HijackVersion");
            v64 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackVersion](self->_stats, "hijackVersion"));
            v65 = (void *)v64;
            if (v64)
              v66 = (const __CFString *)v64;
            else
              v66 = CFSTR("NA");
            v111[5] = v66;
            v111[6] = v97;
            v110[6] = CFSTR("InEar");
            v110[7] = CFSTR("IsConnected");
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v59));
            v111[7] = v87;
            v110[8] = CFSTR("IsPlaying");
            v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v58));
            v111[8] = v86;
            v110[9] = CFSTR("LocalAudioCategory");
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue")));
            v111[9] = v85;
            v111[10] = v105;
            v110[10] = CFSTR("OnDemandCategory");
            v110[11] = CFSTR("OtherTipiDevice");
            v111[11] = v107;
            v110[12] = CFSTR("OtherTipiDeviceIdleTime");
            v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38));
            v111[12] = v67;
            v110[13] = CFSTR("OtherTipiAudioCategory");
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "otherTipiAudioCategory")));
            v111[13] = v68;
            v110[14] = CFSTR("OtherTipiDevicePlayingApp");
            v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "otherTipiDevicePlayingApp"));
            v70 = (void *)v69;
            if (v69)
              v71 = (const __CFString *)v69;
            else
              v71 = CFSTR("NA");
            v111[14] = v71;
            v110[15] = CFSTR("ProactiveRoutingTrigger");
            v72 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats proactiveRoutingTrigger](self->_stats, "proactiveRoutingTrigger"));
            v73 = (void *)v72;
            if (v72)
              v74 = (const __CFString *)v72;
            else
              v74 = CFSTR("NA");
            v111[15] = v74;
            v110[16] = CFSTR("ProactiveRoutingWxRSSI");
            v75 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SmartRoutingStats proactiveRoutingWxRSSI](self->_stats, "proactiveRoutingWxRSSI")));
            v76 = (void *)v75;
            v77 = v108;
            if (!v108)
              v77 = CFSTR("NA");
            v111[16] = v75;
            v111[17] = v77;
            v110[17] = CFSTR("Reason");
            v110[18] = CFSTR("Route");
            v111[18] = v106;
            v111[19] = v98;
            v110[19] = CFSTR("Trigger");
            v110[20] = CFSTR("Type");
            v111[20] = v102;
            v111[21] = v104;
            v110[21] = CFSTR("WxBuildVersion");
            v110[22] = CFSTR("WxProductID");
            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v93));
            v110[23] = CFSTR("WxStreamState");
            v111[22] = v78;
            v111[23] = v100;
            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v111, v110, 24));
            CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.RouteCheck"), v79);

            if (v94 == 6)
            {
              -[SmartRoutingStats setHijackAnswer:](self->_stats, "setHijackAnswer:", 0);
              v80 = v83;
              v6 = v84;
              v81 = (__CFString *)v96;
            }
            else
            {
              v80 = v83;
              v6 = v84;
              v81 = (__CFString *)v96;
              if (v94 == 10)
                -[SmartRoutingStats setOnDemandCategory:](self->_stats, "setOnDemandCategory:", 0);
            }

            break;
        }
        goto LABEL_93;
      }
      v36 = objc_msgSend(v34, "nearbyInEar") == 1;
    }
    v37 = CFSTR("NO");
    if (v36)
      v37 = CFSTR("YES");
    v97 = v37;
    goto LABEL_43;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _submitRouteCheckMetric:andType:]", 30, "Failed to submit route check metric since Wx is null");
LABEL_93:

}

- (void)updateCurrentAudioSnapshot
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
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  -[SmartRoutingStats setSnapshotLocalNumOfApps:](self->_stats, "setSnapshotLocalNumOfApps:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
  -[SmartRoutingStats setSnapshotLocalPlayingApp:](self->_stats, "setSnapshotLocalPlayingApp:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  -[SmartRoutingStats setSnapshotLocalRoute:](self->_stats, "setSnapshotLocalRoute:", v5);

  -[SmartRoutingStats setSnapshotLocalDeviceAudioScore:](self->_stats, "setSnapshotLocalDeviceAudioScore:", self->_localDeviceAudioCatogory);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
  -[SmartRoutingStats setSnapshotRemoteDeviceAudioScore:](self->_stats, "setSnapshotRemoteDeviceAudioScore:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _findActiveWxDevice](self, "_findActiveWxDevice"));
  v17 = v7;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v7));
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "otherTipiAudioCategory")));
      -[SmartRoutingStats setSnapshotRemoteDeviceAudioScore:](self->_stats, "setSnapshotRemoteDeviceAudioScore:", v10);

    }
    v7 = v17;
  }
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1 || (v16 = _LogCategory_Initialize(&dword_10020FA58, 30), v7 = v17, v16))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalRoute](self->_stats, "snapshotLocalRoute"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalDeviceAudioScore](self->_stats, "snapshotLocalDeviceAudioScore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotRemoteDeviceAudioScore](self->_stats, "snapshotRemoteDeviceAudioScore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon updateCurrentAudioSnapshot]", 30, "AudioStateSnapshot: Route:%@ App %@, Score %@, Remote %@NumofApp %@", v11, v12, v13, v14, v15);

      v7 = v17;
    }
  }

}

- (void)_updateSRDiscoveredDeviceForCBDeviceChanged:(id)a3 connectionStatus:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  SRDiscoveredDevice *v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_prefSmartRoutingInUseBanner)
  {
    v4 = a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "btAddressData"));
    v7 = CUPrintNSDataAddress();
    v11 = objc_claimAutoreleasedReturnValue(v7);

    v8 = (void *)v11;
    if (v11)
    {
      v9 = (SRDiscoveredDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v11));
      if (!v9)
        v9 = objc_alloc_init(SRDiscoveredDevice);
      -[SRDiscoveredDevice _setBtAddress:](v9, "_setBtAddress:", v11);
      -[SRDiscoveredDevice _setConnectionState:](v9, "_setConnectionState:", v4);
      v10 = v11;
      if (!(_DWORD)v4)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:]", 30, "SRDiscoveredDevice: Clearing Wx %@ state for disconnection", v11);
        }
        -[SRDiscoveredDevice _setRouteToWxAfterUnhide:](v9, "_setRouteToWxAfterUnhide:", 0);
        v10 = v11;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_srDiscoveredDeviceMap, "setObject:forKeyedSubscript:", v9, v10);

      v8 = (void *)v11;
    }

  }
}

- (void)_updateSRDiscoveredDeviceForNearbyWxChanged:(id)a3 isNearby:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t CFDataOfLength;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t Int64;
  void *v18;
  void *v19;
  uint64_t v20;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  SRDiscoveredDevice *v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  unsigned int Int64Ranged;
  uint64_t v40;
  void *v41;

  v4 = a4;
  v6 = a3;
  if (self->_prefSmartRoutingInUseBanner)
  {
    v41 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bleDevice"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));

      CFDataOfLength = CFDictionaryGetCFDataOfLength(v10, CFSTR("publicAddress"), 6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
      v13 = v12;
      if (v12)
      {
        v14 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v12), "bytes")));
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          v16 = (void *)v15;
          v37 = v4;
          v36 = v8;
          Int64Ranged = CFDictionaryGetInt64Ranged(v10, CFSTR("aState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
          Int64 = CFDictionaryGetInt64(v10, CFSTR("paired"), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bleDevice"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "advertisementFields"));
          v40 = CFDictionaryGetInt64Ranged(v19, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);

          v20 = CFDictionaryGetInt64(v10, CFSTR("primaryiCloudSignIn"), 0);
          TypeID = CFStringGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("name"), TypeID, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          v23 = CFDictionaryGetCFDataOfLength(v10, CFSTR("lch"), 3, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bleDevice"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "advertisementFields"));
          v27 = CFDictionaryGetInt64Ranged(v26, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);

          v28 = 1;
          if ((v27 & 0x24) == 0)
          {
            if (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v40))
              v28 = 1;
            else
              v28 = 2;
          }
          v34 = CFDictionaryGetInt64Ranged(v10, CFSTR("budsOutofCaseTime"), 0, 255, 0);
          v35 = CFDictionaryGetInt64Ranged(v10, CFSTR("asCount"), 0, 0xFFFFFFFFLL, 0);
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            v29 = "no";
            if (v37)
              v30 = "yes";
            else
              v30 = "no";
            if (Int64Ranged >> 2)
              v31 = "?";
            else
              v31 = off_1001E3C08[Int64Ranged];
            if (Int64)
              v32 = "yes";
            else
              v32 = "no";
            if (v20)
              v29 = "yes";
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:]", 30, "SRDiscoveredDevice: Nearby Wx changed addr %@ name %@ found %s streamState %s productID %u paired %s iCloudSignedIn %s lastConnect %@", v16, v38, v30, v31, v40, v32, v29, v24);
          }
          v33 = (SRDiscoveredDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v16));
          if (!v33)
            v33 = objc_alloc_init(SRDiscoveredDevice);
          -[SRDiscoveredDevice _setBtAddress:](v33, "_setBtAddress:", v16);
          -[SRDiscoveredDevice _setIsNearby:](v33, "_setIsNearby:", v37);
          -[SRDiscoveredDevice _setNearbyiCloudSignIn:](v33, "_setNearbyiCloudSignIn:", v20 != 0);
          -[SRDiscoveredDevice _setNearbyName:](v33, "_setNearbyName:", v38);
          -[SRDiscoveredDevice _setNearbyPaired:](v33, "_setNearbyPaired:", Int64 != 0);
          -[SRDiscoveredDevice _setNearbyProductID:](v33, "_setNearbyProductID:", v40);
          -[SRDiscoveredDevice _setNearbyWxDevice:](v33, "_setNearbyWxDevice:", v41);
          -[SRDiscoveredDevice _setNearbyLastRouteHost:](v33, "_setNearbyLastRouteHost:", v24);
          -[SRDiscoveredDevice _setNearbyPrevInEar:](v33, "_setNearbyPrevInEar:", -[SRDiscoveredDevice nearbyInEar](v33, "nearbyInEar"));
          -[SRDiscoveredDevice _setNearbyInEar:](v33, "_setNearbyInEar:", v28);
          -[SRDiscoveredDevice _setNearbyOutOfCaseTime:](v33, "_setNearbyOutOfCaseTime:", v34);
          -[SRDiscoveredDevice _setNearbyStreamState:](v33, "_setNearbyStreamState:", (int)Int64Ranged);
          -[SRDiscoveredDevice _setNearbyConnectedSourceCount:](v33, "_setNearbyConnectedSourceCount:", v35);
          if (!v37)
            -[SRDiscoveredDevice _setNearbyPrevInEar:](v33, "_setNearbyPrevInEar:", 0);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_srDiscoveredDeviceMap, "setObject:forKeyedSubscript:", v33, v16);

          v8 = v36;
        }
      }

    }
    v6 = v41;
  }

}

- (void)_cancelInUseBannerForCallTimer
{
  OS_dispatch_source *inUseBannerTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _cancelInUseBannerForCallTimer]", 30, "Cancel InUseBanner timer");
  inUseBannerTimer = self->_inUseBannerTimer;
  if (inUseBannerTimer)
  {
    v5 = inUseBannerTimer;
    dispatch_source_cancel(v5);
    v4 = self->_inUseBannerTimer;
    self->_inUseBannerTimer = 0;

  }
}

- (void)_cancelRingtoneTimer
{
  OS_dispatch_source *ringtoneTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _cancelRingtoneTimer]", 30, "Cancel ringtone timer");
  ringtoneTimer = self->_ringtoneTimer;
  if (ringtoneTimer)
  {
    v5 = ringtoneTimer;
    dispatch_source_cancel(v5);
    v4 = self->_ringtoneTimer;
    self->_ringtoneTimer = 0;

  }
}

- (void)_clearCallSession
{
  -[BTSmartRoutingDaemon _updateLocalAudioCategory:](self, "_updateLocalAudioCategory:", &off_1001F4548);
}

- (void)_handleTUCallStateChange:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTSmartRoutingDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F2A0;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (BOOL)_isPhoneCall:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice conferencingCallSets](self->_sourceDevice, "conferencingCallSets"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
          v15 = objc_msgSend(v14, "rangeOfString:options:", v9, 1);

          if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (dword_10020FA58 <= 30
              && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
            {
              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isPhoneCall:]", 30, "TUNotification: New Call is conferencing call %@", v9);
            }
            v16 = 0;
            goto LABEL_18;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_18:

  return v16;
}

- (void)_notifyOtherTipiCallState:(int)a3
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  _QWORD v4[5];
  int v5;

  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040068;
  v4[3] = &unk_1001E3438;
  v5 = a3;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)_startInUseBannerTimer
{
  dispatch_source_t v3;
  _QWORD handler[5];

  -[BTSmartRoutingDaemon _cancelInUseBannerForCallTimer](self, "_cancelInUseBannerForCallTimer");
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_inUseBannerTimer, v3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004027C;
  handler[3] = &unk_1001E20E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startInUseBannerTimer]", 30, "InUseBanner: Evaluate it in %ds", 1);
  CUDispatchTimerSet(v3, 1.0, -1.0, -10.0);
  dispatch_activate(v3);

}

- (void)_startRingtoneTimer
{
  dispatch_source_t v3;
  _QWORD handler[5];

  -[BTSmartRoutingDaemon _cancelRingtoneTimer](self, "_cancelRingtoneTimer");
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_ringtoneTimer, v3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100040400;
  handler[3] = &unk_1001E20E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startRingtoneTimer]", 30, "Clear ringtone state in %ds", 40);
  CUDispatchTimerSet(v3, 40.0, -1.0, -10.0);
  dispatch_activate(v3);

}

- (void)_TUMonitorEnsureStarted
{
  TUCallCenter *v3;
  TUCallCenter *tuCallCenter;
  void *v5;
  id v6;

  if (!self->_tuCallCenter)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _TUMonitorEnsureStarted]", 30, "TU Monitor start");
    }
    v3 = (TUCallCenter *)objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", self->_dispatchQueue));
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleTUCallStateChange:", TUCallCenterCallStatusChangedNotification, 0);

    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_handleTUCallStateChange:", TUCallCenterVideoCallStatusChangedNotification, 0);

  }
}

- (void)_TUMonitorEnsureStopped
{
  TUCallCenter *tuCallCenter;
  id v4;

  if (self->_tuCallCenter)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _TUMonitorEnsureStopped]", 30, "TU Monitor stop");
    }
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = 0;

    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, TUCallCenterCallStatusChangedNotification, 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, TUCallCenterVideoCallStatusChangedNotification, 0);

  }
}

- (void)_anyPairedDeviceSupportsSmartRouting
{
  void *v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  BTBannerUISession *uiSmartRoutingBanner;
  BTBannerUISession *v20;
  NSMutableDictionary *disconnectTicksMap;
  NSMutableDictionary *v22;
  OS_dispatch_source *tipiHealingTimer;
  NSObject *v24;
  OS_dispatch_source *v25;
  NSMutableArray *smartRoutingManualDisconnectionList;
  NSMutableArray *v27;
  NSMutableDictionary *srBudswapDeviceMap;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *smartRoutingBackOffMap;
  NSMutableDictionary *v33;
  OS_dispatch_source *highActivityLevelTimer;
  NSObject *v35;
  OS_dispatch_source *v36;
  OS_dispatch_source *phoneOwnershipTriangleTimer;
  NSObject *v38;
  OS_dispatch_source *v39;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "deviceFlags") & 0x10) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "btAddressData"));
          if (objc_msgSend(v10, "length") == (id)6)
          {
            v11 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v10), "bytes")));
            v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            if (v12)
            {
              v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v12));
              if (v13)
              {
                v14 = (void *)v13;
                v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v12));

                if (!v15)
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v12));
                  -[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:](self, "_smartRoutingAddWxMapDeviceFromConnectedDevice:", v16);
                  -[BTSmartRoutingDaemon _triggerTipiTableUpdate:](self, "_triggerTipiTableUpdate:", v12);

                }
              }
            }
          }
          else
          {
            v12 = 0;
          }

          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (self->_pairedDeviceSupportsSmartRouting != (v6 & 1))
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v17 = "not found";
      if ((v6 & 1) != 0)
        v17 = "found";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _anyPairedDeviceSupportsSmartRouting]", 30, "Tipi paired device %s.", v17);
    }
    self->_pairedDeviceSupportsSmartRouting = v6 & 1;
    if ((v6 & 1) == 0)
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100040A7C;
      v41[3] = &unk_1001E3008;
      v41[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v41);
      uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
      if (uiSmartRoutingBanner)
      {
        -[BTBannerUISession invalidate](uiSmartRoutingBanner, "invalidate");
        v20 = self->_uiSmartRoutingBanner;
        self->_uiSmartRoutingBanner = 0;

      }
      disconnectTicksMap = self->_disconnectTicksMap;
      if (disconnectTicksMap)
      {
        -[NSMutableDictionary removeAllObjects](disconnectTicksMap, "removeAllObjects");
        v22 = self->_disconnectTicksMap;
      }
      else
      {
        v22 = 0;
      }
      self->_disconnectTicksMap = 0;

      self->_connectTicks = 0;
      self->_tipiSetupTicks = 0;
      if (self->_tipiElectionInProgress)
        self->_tipiElectionInProgress = 0;
      -[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:](self, "_setTipiElectionReceivedLePipe:", &stru_1001ED4C0);
      tipiHealingTimer = self->_tipiHealingTimer;
      if (tipiHealingTimer)
      {
        v24 = tipiHealingTimer;
        dispatch_source_cancel(v24);
        v25 = self->_tipiHealingTimer;
        self->_tipiHealingTimer = 0;

      }
      smartRoutingManualDisconnectionList = self->_smartRoutingManualDisconnectionList;
      if (smartRoutingManualDisconnectionList)
      {
        -[NSMutableArray removeAllObjects](smartRoutingManualDisconnectionList, "removeAllObjects");
        v27 = self->_smartRoutingManualDisconnectionList;
      }
      else
      {
        v27 = 0;
      }
      self->_smartRoutingManualDisconnectionList = 0;

      srBudswapDeviceMap = self->_srBudswapDeviceMap;
      if (srBudswapDeviceMap)
      {
        -[NSMutableDictionary removeAllObjects](srBudswapDeviceMap, "removeAllObjects");
        v29 = self->_srBudswapDeviceMap;
      }
      else
      {
        v29 = 0;
      }
      self->_srBudswapDeviceMap = 0;

      v30 = self->_smartRoutingWxDeviceMap;
      if (v30)
      {
        -[NSMutableDictionary removeAllObjects](v30, "removeAllObjects");
        v31 = self->_smartRoutingWxDeviceMap;
      }
      else
      {
        v31 = 0;
      }
      self->_smartRoutingWxDeviceMap = 0;

      smartRoutingBackOffMap = self->_smartRoutingBackOffMap;
      if (smartRoutingBackOffMap)
      {
        -[NSMutableDictionary removeAllObjects](smartRoutingBackOffMap, "removeAllObjects");
        v33 = self->_smartRoutingBackOffMap;
      }
      else
      {
        v33 = 0;
      }
      self->_smartRoutingBackOffMap = 0;

      highActivityLevelTimer = self->_highActivityLevelTimer;
      if (highActivityLevelTimer)
      {
        v35 = highActivityLevelTimer;
        dispatch_source_cancel(v35);
        v36 = self->_highActivityLevelTimer;
        self->_highActivityLevelTimer = 0;

      }
      phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
      if (phoneOwnershipTriangleTimer)
      {
        v38 = phoneOwnershipTriangleTimer;
        dispatch_source_cancel(v38);
        v39 = self->_phoneOwnershipTriangleTimer;
        self->_phoneOwnershipTriangleTimer = 0;

      }
      phase1ConnectConfig = self->_phase1ConnectConfig;
      self->_phase1ConnectConfig = 0;

    }
    -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");
  }
}

- (BOOL)_aacpConnectedCheck:(id)a3
{
  return (objc_msgSend(a3, "connectedServices") >> 19) & 1;
}

- (BOOL)allowHijackWithAudioScore:(unsigned int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5
{
  uint64_t v6;
  id v8;
  void **p_vtable;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unsigned int v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  const char *v22;
  const char *v23;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int DeviceClass;
  unsigned int v30;
  unsigned int v31;
  id v32;
  const char *v33;
  void *v34;
  id v35;
  const char *v36;
  char v39;
  int v40;
  id v41;
  id v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
  if (v6 <= 0xC7)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]", 30, "[Hijackv2] Dont allow hijack for score < %d ", 200);
    }
    LOBYTE(v15) = 0;
    goto LABEL_36;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v8));
  v11 = objc_msgSend(v10, "audioStreamState");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
  v13 = objc_msgSend(v12, "otherTipiAudioCategory");
  -[SmartRoutingStats setHijackActiveRemoteScore:](self->_stats, "setHijackActiveRemoteScore:", v13);
  v14 = objc_msgSend(v12, "otherTipiDeviceIsWatch");
  if (!v8)
  {
    v15 = 0;
    v19 = CFSTR("WxAddress is NULL");
    goto LABEL_13;
  }
  v15 = v14;
  v16 = v11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v8));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "otherTipiDeviceBTAddress"));

  if (v18)
  {
    if ((_DWORD)v6 == 401)
    {
      if (!v15)
      {
        v20 = CFSTR("3rd Party ringtone shall not hijack non-watch tipi device");
        goto LABEL_22;
      }
      if ((_DWORD)v13)
      {
        LODWORD(v11) = (_DWORD)v16;
        if (v13 > 0x190)
        {
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Rejected, Remote Category %d >= Local Category %d"), v13, 401)));
          *a5 = v32;

          v15 = 0;
        }
        else
        {
          *a5 = CFSTR("Allowed");
          v15 = 1;
        }
        goto LABEL_24;
      }
      goto LABEL_20;
    }
    if (!(_DWORD)v13)
    {
LABEL_20:
      v15 = 0;
      v20 = CFSTR("Fall back to legacy hijack");
      goto LABEL_22;
    }
    v15 = v13 <= v6;
    if (v13 > v6)
    {
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Rejected, Remote Category %d > Local Category %d, audio streaming state %d"), v13, v6, v16)));
      *a5 = v25;

    }
    else
    {
      *a5 = CFSTR("Allowed");
    }
    v26 = objc_msgSend(v12, "otherTipiDeviceMajorBuildVersion");
    if (self->_prefSmartRoutingPrioritizedCall)
    {
      v28 = (uint64_t)v26;
      DeviceClass = GestaltGetDeviceClass(v26, v27);
      v30 = 0;
      if ((_DWORD)v6 == 501 && DeviceClass == 1)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice TUCallMap](self->_sourceDevice, "TUCallMap"));
        if (objc_msgSend(v45, "count"))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "otherTipiDeviceBTName"));
          v31 = objc_msgSend(v43, "isEqualToString:", CFSTR("Mac"));
          if (v28 > 14)
            v30 = v31;
          else
            v30 = 0;

        }
        else
        {
          v30 = 0;
        }

      }
    }
    else
    {
      v30 = 0;
    }
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v33 = "no";
      if (v30)
        v33 = "yes";
      v44 = v33;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice TUCallMap](self->_sourceDevice, "TUCallMap"));
      v42 = objc_msgSend(v46, "count");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "otherTipiDeviceBTName"));
      v41 = objc_msgSend(v12, "otherTipiDeviceMajorBuildVersion");
      v35 = objc_msgSend(v12, "otherTipiDeviceMinorBuildVersion");
      v36 = "no";
      if (self->_prefSmartRoutingPrioritizedCall)
        v36 = "yes";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]", 30, "[Hijackv2] local %u vs remote %u isPhoneCallHijack %s CallCount %d otherTipi %@ %d.%d prioritizedCall %s", v6, v13, v44, v42, v34, v41, v35, v36);

    }
    if ((_DWORD)v6 == 501 && v13 <= 0x1F5 && (_DWORD)v13 == 501)
      v39 = v30;
    else
      v39 = 1;
    if ((v39 & 1) == 0)
    {
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Ambiguity"));
    }
    if ((v30 & 1) != 0)
      goto LABEL_23;
    LODWORD(v11) = (_DWORD)v16;
    if ((_DWORD)v16 == 3)
    {
      p_vtable = (void **)(_TtC15audioaccessoryd11XPCMessages + 24);
      if ((_DWORD)v13 == 121
        || (_DWORD)v13 == 501
        || -[BTSmartRoutingSourceDevice incomingCallRingtone](self->_sourceDevice, "incomingCallRingtone"))
      {
        goto LABEL_25;
      }
    }
    else
    {
      p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
      if ((_DWORD)v11 != 2 || (_DWORD)v13 != 501)
        goto LABEL_25;
    }
    v40 = *((_DWORD *)p_vtable + 662);
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]", 30, "[Hijackv2] Wx stream state not matches remote score, fallback to legacy hijack");
    v15 = 0;
    v19 = CFSTR("Fall back to legacy hijack");
LABEL_13:
    *a5 = v19;
    goto LABEL_25;
  }
  v15 = 0;
  v20 = CFSTR("Other Tipi device does not exist");
LABEL_22:
  *a5 = v20;
LABEL_23:
  LODWORD(v11) = (_DWORD)v16;
LABEL_24:
  p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
LABEL_25:
  v21 = *((_DWORD *)p_vtable + 662);
  if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v22 = "no";
    if (v15)
      v22 = "yes";
    if (v11 > 3)
      v23 = "?";
    else
      v23 = off_1001E3DD8[(int)v11];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]", 30, "[Hijackv2] Allow hijack=%s, Local audio category=%u, Remote audio category=%u, wx stream state=%s, Deny reason=%@", v22, v6, v13, v23, *a5);
  }

LABEL_36:
  return v15;
}

- (BOOL)_bluetoothProductIDNoEarDetect:(unsigned int)a3
{
  return (a3 - 8195 < 0x24) & (0xC0090064DuLL >> (a3 - 3));
}

- (id)_bluetoothProductIDToAsset:(unsigned int)a3
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Banner-PID-%u"), *(_QWORD *)&a3);
}

- (id)_bluetoothProductIDToColorAsset:(unsigned int)a3 withColor:(unsigned __int8)a4
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Banner-PID-%u-%d"), *(_QWORD *)&a3, a4);
}

- (id)_bluetoothProductIDToCaseAsset:(unsigned int)a3 andAddress:(id)a4
{
  id v6;
  unsigned int v9;
  uint64_t v12;
  unsigned int v14;
  id v15;
  void *v16;
  uint64_t v18;

  v6 = a4;
  if (a3 == 8216 || a3 == 8213 || a3 == 8228)
    v9 = 8212;
  else
    v9 = a3;
  if (v9 - 8219 < 2 || v9 == 8222 || v9 == 8224)
    v12 = 8217;
  else
    v12 = v9;
  if ((v12 - 8210) > 0xB || ((1 << (v12 - 18)) & 0x811) == 0)
  {
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Banner-PID-%u-Case"), v12, v18);
  }
  else
  {
    v14 = -[BTSmartRoutingDaemon _getWxColorCode:](self, "_getWxColorCode:", v6);
    if (!-[BTSmartRoutingDaemon _productColorAssetExists:withColor:](self, "_productColorAssetExists:withColor:", v12, (char)v14)|| v14 == 255)
    {
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Banner-PID-%u-default-Case"), v12, v18);
    }
    else
    {
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Banner-PID-%u-%d-Case"), v12, v14);
    }
  }
  v16 = v15;

  return v16;
}

- (id)_bluetoothProductIDToLocalizationString:(unsigned int)a3 withActionButton:(BOOL)a4
{
  char v4;
  const __CFString *v5;
  const __CFString *v6;

  v4 = a3 - 2;
  if (a3 - 8194 > 0x24)
    goto LABEL_10;
  if (((1 << v4) & 0x145A977A0BLL) != 0)
  {
    v5 = CFSTR("CONNECTED_EARBUDS");
LABEL_4:
    v6 = CFSTR("CONNECT");
    goto LABEL_7;
  }
  if (((1 << v4) & 0x820200594) == 0)
  {
LABEL_10:
    v5 = CFSTR("CONNECTED");
    goto LABEL_4;
  }
  v5 = CFSTR("CONNECTED_OVEREAR_HEADPHONES");
  v6 = CFSTR("CONNECT_OVEREAR_HEADPHONES");
LABEL_7:
  if (a4)
    return (id)v6;
  else
    return (id)v5;
}

- (id)_bluetoothProductDefaultAsset:(unsigned int)a3
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Banner-PID-%u-default"), *(_QWORD *)&a3);
}

- (BOOL)_bluetoothProductIDNoUTP:(unsigned int)a3
{
  return (a3 - 8197 < 0x21) & (0x1042409B3uLL >> (a3 - 5));
}

- (void)_budSwapDetectionStartTimer:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *budSwapTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[5];
  id v11;
  uint64_t v12;

  v4 = a3;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _budSwapDetectionStartTimer:]", 30, "Start budswap timer. Cache will be cleared in %us", 20);
  v5 = dispatch_time(0, 20000000000);
  budSwapTimer = self->_budSwapTimer;
  if (budSwapTimer)
  {
    dispatch_source_set_timer(budSwapTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v8 = self->_budSwapTimer;
    self->_budSwapTimer = v7;

    v9 = self->_budSwapTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000414E0;
    handler[3] = &unk_1001E3460;
    handler[4] = self;
    v12 = 20;
    v11 = v4;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_budSwapTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_budSwapTimer);

  }
}

- (void)_cacheBudswapInfo:(id)a3
{
  id v4;
  NSMutableDictionary *srBudswapDeviceMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  BTSmartRoutingBudswapDevice *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  srBudswapDeviceMap = self->_srBudswapDeviceMap;
  v15 = v4;
  if (!srBudswapDeviceMap)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7 = self->_srBudswapDeviceMap;
    self->_srBudswapDeviceMap = v6;

    v4 = v15;
    srBudswapDeviceMap = self->_srBudswapDeviceMap;
  }
  v8 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](srBudswapDeviceMap, "objectForKeyedSubscript:", v4));
  if (!v8)
    v8 = objc_alloc_init(BTSmartRoutingBudswapDevice);
  -[BTSmartRoutingBudswapDevice setReconnectionState:](v8, "setReconnectionState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v15));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "otherTipiDeviceBTAddress"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "otherTipiDeviceBTAddress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "otherTipiDeviceBTName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "otherTipiDeviceVersion"));
      -[BTSmartRoutingBudswapDevice _cacheInfo:andAddress:andName:andVersion:](v8, "_cacheInfo:andAddress:andName:andVersion:", v15, v12, v13, v14);

    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_srBudswapDeviceMap, "setObject:forKeyedSubscript:", v8, v15);

}

- (int64_t)_checkTickswithinWindow:(unint64_t)a3 withWindow:(unint64_t)a4
{
  uint64_t v5;

  v5 = SecondsToUpTicks(a4, a2);
  return v5 + a3 - mach_absolute_time();
}

- (void)_checkIfPairedCompanionDeviceSupportsSmartRouting
{
  NRPairedDeviceRegistry *NRRegistry;
  NRPairedDeviceRegistry *v4;
  NRPairedDeviceRegistry *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  void *v12;

  NRRegistry = self->_NRRegistry;
  if (!NRRegistry)
  {
    v4 = (NRPairedDeviceRegistry *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v5 = self->_NRRegistry;
    self->_NRRegistry = v4;

    NRRegistry = self->_NRRegistry;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRPairedDeviceRegistry getActivePairedDevice](NRRegistry, "getActivePairedDevice"));
  v7 = v6;
  v12 = v6;
  if (v6)
  {
    self->_pairedCompanionDeviceSupportsSmartRouting = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", NRDevicePropertySystemVersion));
    if (GestaltGetDeviceClass(v8, v9) == 1
      && objc_msgSend(v8, "compare:options:", CFSTR("11.0"), 64) == (id)-1)
    {
      self->_pairedCompanionDeviceSupportsSmartRouting = 0;
    }

    v7 = v12;
  }
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1 || (v11 = _LogCategory_Initialize(&dword_10020FA58, 30), v7 = v12, v11))
    {
      if (self->_pairedCompanionDeviceSupportsSmartRouting)
        v10 = "yes";
      else
        v10 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _checkIfPairedCompanionDeviceSupportsSmartRouting]", 30, "Paired companion device supports smart routing %s", v10);
      v7 = v12;
    }
  }

}

- (void)_disconnectOtherTipiDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    v8[0] = v5;
    v8[1] = CFSTR("FF:FF:FF:FF:FF:FF");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _disconnectOtherTipiDevice:]", 30, "Disconnect other Tipi device with Tipi table %@", v6);
    }
    -[BTSmartRoutingDaemon _updateAccessoryID:connectionDeviceAddresses:completion:](self, "_updateAccessoryID:connectionDeviceAddresses:completion:", v7, v6, &stru_1001E3480);

  }
}

- (void)_disconnectReason:(id)a3 reason:(unint64_t)smartRoutingDisconnectReason
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a3;
  v7 = v6;
  self->_smartRoutingDisconnectReason = smartRoutingDisconnectReason;
  if (dword_10020FA58 <= 30)
  {
    v9 = v6;
    if (dword_10020FA58 == -1)
    {
      v8 = _LogCategory_Initialize(&dword_10020FA58, 30);
      v7 = v9;
      if (!v8)
        goto LABEL_5;
      smartRoutingDisconnectReason = self->_smartRoutingDisconnectReason;
    }
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _disconnectReason:reason:]", 30, "Smart Routing disconnect reason %llu", smartRoutingDisconnectReason);
    v7 = v9;
  }
LABEL_5:

}

- (void)_dumpNearbyWxDevice
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_nearbyWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001E34C0);
}

- (void)_dumpSrWxDevice
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001E34E0);
}

- (id)_findActiveWxDevice
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001E9DC;
  v10 = sub_10001E9EC;
  v11 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041DDC;
  v5[3] = &unk_1001E2D58;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_isDevicePairedCheck:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  char *v19;
  char *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int16 *v24;
  const char *v26;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a3;
  if (self->_prefSmartRoutingWatchAutomaticSwitching
    && -[BTSmartRoutingDaemon _isMagnetConnectedDeviceforConnectionCheck:](self, "_isMagnetConnectedDeviceforConnectionCheck:", v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.icloudpairing"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v7)
    {
      v8 = v7;
      v28 = v6;
      v9 = *(_QWORD *)v31;
      v10 = obj;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v10);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicAddressForIDSDevice:", v14));

          if (v15)
          {
            v16 = objc_retainAutorelease(v15);
            v17 = NSDataWithHex(objc_msgSend(v16, "UTF8String"), -1, 22, 0, 0);
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v17));
            v19 = (char *)objc_msgSend(v18, "bytes");
            if (v19)
            {
              v20 = v19;
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                v21 = v4;
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modelIdentifier"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isDevicePairedCheck:]", 30, "Evaluator: comparing, Wx: %@, IDS: %@, Model: %u, name: %@", v21, v18, v22, v23);

                v4 = v21;
                v10 = obj;
              }
              v24 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
              if (*v24 == *(unsigned __int16 *)(v20 + 3) && *((unsigned __int8 *)v24 + 2) == v20[5])
              {

                v5 = 1;
                goto LABEL_24;
              }
            }

          }
        }
        v8 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v8)
          continue;
        break;
      }
      v5 = 0;
LABEL_24:
      v6 = v28;
    }
    else
    {
      v5 = 0;
    }

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v26 = "no";
      if (v5)
        v26 = "yes";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isDevicePairedCheck:]", 30, "Evaluator: Found paired Device %s", v26);
    }

  }
  return v5;
}

- (BOOL)_isMagnetConnectedDeviceforTipiHealingCheck:(id)a3
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
  BOOL v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  if (!self->_NRRegistry)
    objc_storeStrong((id *)&self->_NRRegistry, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getActivePairedDevice"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", NRDevicePropertyBluetoothMACAddress));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", NRDevicePropertyUDID));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", NRDevicePropertyName));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", NRDevicePropertySystemBuildVersion));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", NRDevicePropertyMarketingProductName));
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isMagnetConnectedDeviceforTipiHealingCheck:]", 30, "TipiTableEvent: current magnet paired device is %@ %@ (%@) %@ %@, the other tipi address is (%@)", v9, v10, v8, v11, v12, v4);
    }
    if (v8)
      v13 = objc_msgSend(v8, "caseInsensitiveCompare:", v4) == 0;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_isMagnetConnectedDeviceforConnectionCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  char *v11;
  id v12;
  unsigned __int16 *v13;
  BOOL v14;
  BOOL v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getActivePairedDevice"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", NRDevicePropertyBluetoothMACAddress)));
    v8 = NSDataWithHex(objc_msgSend(v7, "UTF8String"), -1, 22, 0, 0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
    v10 = (char *)objc_msgSend(v9, "bytes");
    if (v10
      && ((v11 = v10,
           v12 = objc_retainAutorelease(v3),
           v13 = (unsigned __int16 *)objc_msgSend(v12, "bytes"),
           *v13 == *(unsigned __int16 *)(v11 + 3))
        ? (v14 = *((unsigned __int8 *)v13 + 2) == v11[5])
        : (v14 = 0),
          v14))
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isMagnetConnectedDeviceforConnectionCheck:]", 30, "Evaluator: comparing phone - watch addresses, Wx: %@, Addr: %@ ", v12, v9);
      }
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_isOnDemandConnectInProgress
{
  return -[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type") == 2;
}

- (BOOL)_isConnectionTipiv2
{
  return -[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type") == 3;
}

- (id)_getActiveNearbyWxAdress
{
  NSMutableDictionary *srDiscoveredDeviceMap;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001E9DC;
  v10 = sub_10001E9EC;
  v11 = 0;
  srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042658;
  v5[3] = &unk_1001E3508;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](srDiscoveredDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getCurrentRoute
{
  if (self->_isBTRoute)
    return CFSTR("Bluetooth");
  if (self->_isSpeakerRoute)
    return CFSTR("Speaker");
  if (self->_isBuiltInReceiverRoute)
    return CFSTR("Receiver");
  return CFSTR("NA");
}

- (BOOL)_getForceDisconnectBit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v4));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "advertisementFields"));

      v9 = CFDictionaryGetInt64(v8, CFSTR("srConnected"), 0) != 0;
    }
    else
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _getForceDisconnectBit:]", 30, "Couldn't find Wx SfDevice with uuid %@", v4);
      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_getIDSDeviceFromBtAddress:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.icloudpairing"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v14 = v4;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publicAddressForIDSDevice:", v11));

          if (v12 && (objc_msgSend(v12, "isEqualToString:", v3) & 1) != 0)
          {
            v6 = v9;

            goto LABEL_16;
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
LABEL_16:
      v4 = v14;
    }

  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _getIDSDeviceFromBtAddress:]", 30, "Failed to get IDS device from address %@", 0);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_getInEarSrWxDevice
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001E9DC;
  v10 = sub_10001E9EC;
  v11 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042AEC;
  v5[3] = &unk_1001E2D08;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getJsonStringFromDictionary:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a3, 1, 0));
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);

  return v4;
}

- (int64_t)_getRssiNearby:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v4));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
      v8 = objc_msgSend(v7, "rssi");

    }
    else
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _getRssiNearby:]", 30, "Couldn't find Wx SfDevice with uuid %@", v4);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (int64_t)v8;
}

- (void)getSmartRoutingStateForDeviceAddress:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042D00;
  v7[3] = &unk_1001E23E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (id)_getWxChipVersion:(unsigned int)a3
{
  if (a3 - 8194 > 0x24)
    return CFSTR("NA");
  else
    return (id)*((_QWORD *)&off_1001E3A08 + (int)(a3 - 8194));
}

- (unsigned)_getWxColorCode:(id)a3
{
  id v4;
  NSMutableDictionary *wxDevices;
  id v6;
  int v7;
  NSMutableDictionary *connectedDevices;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -1;
  wxDevices = self->_wxDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042FA8;
  v13[3] = &unk_1001E3530;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  v7 = *((unsigned __int8 *)v17 + 24);
  if (v7 == 255)
  {
    connectedDevices = self->_connectedDevices;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100043134;
    v10[3] = &unk_1001E2D80;
    v11 = v6;
    v12 = &v16;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v10);

    LOBYTE(v7) = *((_BYTE *)v17 + 24);
  }

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_getWxFWVersion:(id)a3
{
  id v4;
  NSMutableDictionary *wxFirmwareCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  wxFirmwareCache = self->_wxFirmwareCache;
  if (!wxFirmwareCache)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7 = self->_wxFirmwareCache;
    self->_wxFirmwareCache = v6;

    wxFirmwareCache = self->_wxFirmwareCache;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](wxFirmwareCache, "objectForKeyedSubscript:", v4));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxFirmwareCache, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "btAddressData"));
          v18 = CUPrintNSDataAddress();
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          if (v4)
          {
            if (v19)
            {
              if (objc_msgSend(v4, "isEqualToString:", v19))
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firmwareVersion"));
                v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("0.0.1"));

                if ((v21 & 1) == 0)
                {
                  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firmwareVersion"));
                  if (dword_10020FA58 <= 30
                    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                  {
                    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _getWxFWVersion:]", 30, "Airpods fw version is %@, pairing record %@", v9, v16, (_QWORD)v23);
                  }

                  goto LABEL_22;
                }
              }
            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_22:

  }
  return v9;
}

- (unsigned)_getWxProductID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btAddressData", (_QWORD)v15));
          v12 = CUPrintNSDataAddress();
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

          if (v13 && (objc_msgSend(v4, "isEqualToString:", v13) & 1) != 0)
          {
            LODWORD(v7) = objc_msgSend(v10, "productID");

            goto LABEL_14;
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LODWORD(v7) = 0;
  }

  return v7;
}

- (void)_handleCallStateChange:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTSmartRoutingDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043650;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_handleMediaPlayStateChange:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTSmartRoutingDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000437E4;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_handleMediaPauseStateChanged
{
  void *v3;
  unsigned int v4;
  void *v5;
  NSString *v6;
  NSString *cdDeviceIdentifier;
  NSString *v8;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleMediaPauseStateChanged]", 30, "Handle _handleMediaPauseStateChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AAConversationDetectSessionManager sharedCDSessionManager](AAConversationDetectSessionManager, "sharedCDSessionManager"));
  v4 = objc_msgSend(v3, "cdSignalAudioInterrupted");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AAConversationDetectSessionManager sharedCDSessionManager](AAConversationDetectSessionManager, "sharedCDSessionManager"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCDDeviceIdentifier"));
    cdDeviceIdentifier = self->_cdDeviceIdentifier;
    self->_cdDeviceIdentifier = v6;

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleMediaPauseStateChanged]", 30, "cdDeviceIdentifier: %@", self->_cdDeviceIdentifier);
    }
  }
  else
  {
    v8 = self->_cdDeviceIdentifier;
    self->_cdDeviceIdentifier = 0;

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleMediaPauseStateChanged]", 30, "cdDeviceIdentifier is nil!");
    }
  }
}

- (void)_handleHighestAudioCategoryChange:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTSmartRoutingDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043B68;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_handleHRMSessionChanged:(BOOL)a3
{
  if (a3)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleHRMSessionChanged:]", 30, "HRM session started");
    }
    if (-[BTSmartRoutingDaemon _isAnyHRMEnabledDeviceConnected](self, "_isAnyHRMEnabledDeviceConnected"))
    {
      if (!self->_isActiveHRMSession)
      {
        self->_score = 7;
        -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
        self->_isActiveHRMSession = 1;
      }
    }
  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleHRMSessionChanged:]", 30, "HRM session ended");
    }
    if (self->_isActiveHRMSession)
    {
      self->_isActiveHRMSession = 0;
      -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
    }
  }
}

- (void)_handleMediaServerConnectionDied:(id)a3
{
  -[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStopped](self, "_mediaRouteMonitorEnsureStopped", a3);
  -[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStarted](self, "_mediaRouteMonitorEnsureStarted");
}

- (void)_handleHijackBlockingwithDevice:(id)a3
{
  id v4;
  OS_dispatch_source **p_hijackBackOffTimer;
  OS_dispatch_source *hijackBackOffTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  dispatch_source_t v9;
  NSObject *v10;
  id v11;
  dispatch_time_t v12;
  void *v13;
  _QWORD handler[6];
  id v15;

  v4 = a3;
  if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
  {
    p_hijackBackOffTimer = &self->_hijackBackOffTimer;
    hijackBackOffTimer = self->_hijackBackOffTimer;
    if (hijackBackOffTimer)
    {
      v7 = hijackBackOffTimer;
      dispatch_source_cancel(v7);
      v8 = *p_hijackBackOffTimer;
      *p_hijackBackOffTimer = 0;

    }
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_hijackBackOffTimer, v9);
    self->_hijackBackoffCount = 0;
    v10 = self->_hijackBackOffTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100043FDC;
    handler[3] = &unk_1001E2570;
    handler[4] = v9;
    handler[5] = self;
    v11 = v4;
    v15 = v11;
    dispatch_source_set_event_handler(v10, handler);
    v12 = dispatch_time(0x8000000000000000, 1000000000 * self->_prefSmartRoutingBlockHijackWindowinSeconds);
    dispatch_source_set_timer((dispatch_source_t)self->_hijackBackOffTimer, v12, 1000000000 * self->_prefSmartRoutingBlockHijackWindowinSeconds, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_hijackBackOffTimer);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
    objc_msgSend(v13, "_setHijackBackoffTick:", mach_absolute_time());

    self->_hijackBackOffInitiator = 1;
    -[BTSmartRoutingDaemon _updateLocalAudioCategory:](self, "_updateLocalAudioCategory:", self->_localDeviceAudioCatogory);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleHijackBlockingwithDevice:]", 30, "Start hijackblocking backoff timer");
    }

  }
}

- (void)_handlePairedWatchStatusDidChange
{
  NRPairedDeviceRegistry *NRRegistry;
  NRPairedDeviceRegistry *v4;
  NRPairedDeviceRegistry *v5;
  const char *v6;
  id v7;

  NRRegistry = self->_NRRegistry;
  if (!NRRegistry)
  {
    v4 = (NRPairedDeviceRegistry *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v5 = self->_NRRegistry;
    self->_NRRegistry = v4;

    NRRegistry = self->_NRRegistry;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NRPairedDeviceRegistry getActivePairedDevice](NRRegistry, "getActivePairedDevice"));
  if (v7)
  {
    self->_pairedDeviceContainsCompanionWatch = 1;
    -[BTSmartRoutingDaemon _checkIfPairedCompanionDeviceSupportsSmartRouting](self, "_checkIfPairedCompanionDeviceSupportsSmartRouting");
  }
  else
  {
    *(_WORD *)&self->_pairedDeviceContainsCompanionWatch = 0;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (self->_pairedDeviceContainsCompanionWatch)
      v6 = "yes";
    else
      v6 = "no";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handlePairedWatchStatusDidChange]", 30, "_pairedDeviceContainsCompanionWatch %s", v6);
  }
  -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");

}

- (void)_handlePhoneOwnershipTriangleTimer
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  const __CFString *v11;
  uint64_t *v12;
  id v13;
  void *v14;
  uint64_t *v15;
  const __CFString *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10001E9DC;
  v22 = sub_10001E9EC;
  v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100044630;
  v17[3] = &unk_1001E24F8;
  v17[4] = self;
  v17[5] = &v18;
  v3 = objc_retainBlock(v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getInEarSrWxDevice](self, "_getInEarSrWxDevice"));
  v5 = v4;
  if (!v4)
  {
    v10 = v19;
    v6 = (void *)v19[5];
    v11 = CFSTR("Couldn't find inEar Wx");
LABEL_15:
    v10[5] = (uint64_t)v11;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "proactiveRoutingBackoff"))
  {
    v10 = v19;
    v6 = (void *)v19[5];
    v11 = CFSTR("Proactive Routing backoff is in effect!");
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceAddress"));
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Already routed: %@"), v6);
  if (objc_msgSend(v5, "routed"))
  {
    v12 = v19;
    v13 = v7;
    v14 = (void *)v12[5];
    v12[5] = (uint64_t)v13;
  }
  else
  {
    if ((objc_msgSend(v5, "otherTipiDeviceIsWatch") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceBTAddress"));

      if (v8)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handlePhoneOwnershipTriangleTimer]", 30, "PhoneTriangleOwnershipTimer: Taking the route");
        }
        self->_proactiveRoutingInProgress = 1;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("-tacl")));
        -[BTSmartRoutingDaemon _smartRoutingChangeRoute:](self, "_smartRoutingChangeRoute:", v9);

        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, &off_1001F41B0, v6, 0);
        -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 12);
        goto LABEL_11;
      }
      v15 = v19;
      v14 = (void *)v19[5];
      v16 = CFSTR("Not in Tipi");
    }
    else
    {
      v15 = v19;
      v14 = (void *)v19[5];
      v16 = CFSTR("Other tipi device is not watch");
    }
    v15[5] = (uint64_t)v16;
  }

LABEL_11:
LABEL_12:

  ((void (*)(_QWORD *))v3[2])(v3);
  _Block_object_dispose(&v18, 8);

}

- (void)_handleProactiveRoutingRouteCheck:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Bluetooth")) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    if (v5)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleProactiveRoutingRouteCheck:]", 30, "ProactiveRouting: Backoff proactive routing for %@ current route %@", v6, v4);
      }
      objc_msgSend(v5, "setProactiveRoutingBackoff:", 1);
    }

  }
}

- (void)_handleSmartRoutingDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  const char *v12;
  const char *v13;
  const char *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
    if (v5)
    {
      -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceBTAddress"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesInEarCache, "objectForKeyedSubscript:", v4));
      v9 = objc_msgSend(v8, "BOOLValue");

      v10 = -[BTSmartRoutingDaemon _isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:](self, "_isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:", v7, 16, 13);
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        v11 = objc_msgSend(v5, "routed");
        v12 = "no";
        if (v11)
          v13 = "yes";
        else
          v13 = "no";
        if (v9)
          v14 = "yes";
        else
          v14 = "no";
        if (v10)
          v12 = "yes";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]", 30, "SR disabled: routed %s otherTipi %@ inEar %s isOtherTipiLegacyBuild %s", v13, v7, v14, v12);
      }
      if (objc_msgSend(v5, "otherTipiDeviceIsWatch"))
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]", 30, "SR disabled: Other tipi device is watch; do not disconnect either device");
        }
      }
      else
      {
        if ((objc_msgSend(v5, "routed") & 1) != 0)
          goto LABEL_26;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceBTAddress"));
        v16 = v9 ^ 1;
        if (!v15)
          v16 = 1;
        v17 = v16 | v10;

        if (v17 == 1)
        {
LABEL_26:
          -[BTSmartRoutingDaemon _disconnectOtherTipiDevice:](self, "_disconnectOtherTipiDevice:", v4);
        }
        else
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]", 30, "SR disabled: Not routed, ask the other Tipi device to disconnect ME");
          }
          v22 = CFSTR("disableSmartRouting");
          v23 = v6;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceBTAddress"));
          -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v18, v4, v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
          if (!v20)
          {
            v21 = objc_alloc_init((Class)NSMutableDictionary);
            -[BTSmartRoutingSourceDevice setIsFirstConnectionAfterSREnable:](self->_sourceDevice, "setIsFirstConnectionAfterSREnable:", v21);

          }
          -[BTSmartRoutingDaemon _setIsFirstConnentionAfterSREnable:forDevice:](self, "_setIsFirstConnentionAfterSREnable:forDevice:", 1, v4);

        }
      }

    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]", 30, "SR disabled: srWxDevice %@ not found", v4);
    }

  }
}

- (void)_handleTriangleRecoveryInitiated:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTSmartRoutingDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044BC0;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_hijackBackoffReset:(id)a3 withReason:(id)a4
{
  id v6;
  OS_dispatch_source *hijackBackOffTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _hijackBackoffReset:withReason:]", 30, "Hijackblocking: Reset hijackBackOffTimer for wx %@ with reason %@", v11, v6);
  -[BTSmartRoutingDaemon _submitHijackBlockMetric:withReason:](self, "_submitHijackBlockMetric:withReason:", v11, v6);
  hijackBackOffTimer = self->_hijackBackOffTimer;
  if (hijackBackOffTimer)
  {
    v8 = hijackBackOffTimer;
    dispatch_source_cancel(v8);
    v9 = self->_hijackBackOffTimer;
    self->_hijackBackOffTimer = 0;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
  objc_msgSend(v10, "_setHijackBackoffTick:", 0);

  self->_hijackBackOffInitiator = 0;
  -[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:](self, "_sendAudioCategory:withAudioCategory:", v11, self->_localDeviceAudioCatogory);
  -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");

}

- (BOOL)_isAnyWxStream
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100044F14;
  v5[3] = &unk_1001E2D58;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAddDeviceToBackoffDueToDisconnect
{
  unint64_t smartRoutingDisconnectReason;

  smartRoutingDisconnectReason = self->_smartRoutingDisconnectReason;
  return smartRoutingDisconnectReason == 10720 || smartRoutingDisconnectReason == 328;
}

- (BOOL)_isForceRejectPipe
{
  return self->_prefSmartRoutingForceRejectLePipe;
}

- (BOOL)_isForceTipiv2
{
  return self->_prefSmartRoutingForceTipiv2;
}

- (BOOL)_isEligibleForTipiV2:(id)a3 firstDeviceTipiScore:(int)a4 secondDeviceTipiScore:(int)a5 currentDeviceScore:(int)a6 sourceDeviceCount:(unsigned int)a7 isOnDemandConnect:(BOOL)a8 address:(id)a9 lastConnectedHost:(id)a10
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  unint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  const char *v34;
  const char *v37;
  const char *v38;
  const char *v39;
  id v40;
  unsigned int v41;

  v10 = a8;
  v15 = a3;
  v16 = a9;
  v17 = a10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v16));
  v19 = v18;
  if (v18)
  {
    v41 = a5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "address"));
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      if (a4 > 0xF)
        v21 = "?";
      else
        v21 = off_1001E3C88[a4];
      v39 = v21;
      if (v41 > 0xF)
        v22 = "?";
      else
        v22 = off_1001E3C88[v41];
      v38 = v22;
      v40 = v17;
      if (a6 > 0xF)
        v23 = "?";
      else
        v23 = off_1001E3C88[a6];
      v37 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v20));
      if (v10)
        v26 = "yes";
      else
        v26 = "no";
      v27 = (unint64_t)objc_msgSend(v19, "audioState");
      if (v27 > 3)
        v28 = "?";
      else
        v28 = off_1001E3C08[v27];
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:sourceDeviceCount:isOnDemandConnect:address:lastConnectedHost:]", 30, "Evaluator: Evaluating Tipi2.0 eligibility: address %@, identifier %@, fwVersion %@, tipiScore1 %s, tipiScore2 %s, inScore %s, first connection after SR enable %@, connectForCallA2DP %s, wx streaming state %s", v20, v16, v15, v39, v38, v37, v25, v26, v28);

      v17 = v40;
      if (v10)
        goto LABEL_43;
    }
    else if (v10)
    {
      goto LABEL_43;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v20));

    if (!v30)
    {
      if (v15)
      {
        if (objc_msgSend(CFSTR("5A187"), "compare:options:", v15, 64) == (id)-1)
        {
          v31 = (id)-[BTSmartRoutingDaemon _isForceTipiv2](self, "_isForceTipiv2");
          if ((_DWORD)v31)
          {
            if (a7 == 1)
            {
              v33 = (a4 - 1) < 7;
              if (a4 == 12)
              {
                v31 = objc_msgSend(v19, "outOfCaseTime");
                if (v31 > 2)
                {
                  v33 = 0;
                }
                else
                {
                  v31 = objc_msgSend(v19, "audioState");
                  v33 = v31 == 0;
                }
              }
              if (GestaltGetDeviceClass(v31, v32) == 1)
                v33 |= -[BTSmartRoutingDaemon _isMagnetConnectedDeviceforConnectionCheck:](self, "_isMagnetConnectedDeviceforConnectionCheck:", v17);
            }
            else
            {
              LOBYTE(v33) = 0;
              if ((a4 - 1) <= 6 && a7 == 2)
                LOBYTE(v33) = v41 == 9 || v41 - 1 < 7;
            }
            goto LABEL_44;
          }
        }
      }
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        if (self->_prefSmartRoutingForceTipiv2)
          v34 = "yes";
        else
          v34 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:sourceDeviceCount:isOnDemandConnect:address:lastConnectedHost:]", 30, "Evaluator: Tipi 2.0 failing firmware version check fwVersion %@, _prefSmartRoutingForceTipiv2 %s", v15, v34);
      }
    }
LABEL_43:
    LOBYTE(v33) = 0;
LABEL_44:

    goto LABEL_45;
  }
  if (dword_10020FA58 <= 90 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:sourceDeviceCount:isOnDemandConnect:address:lastConnectedHost:]", 90, "Don't see nearby wx device for device %@", v16);
  LOBYTE(v33) = 0;
LABEL_45:

  return v33;
}

- (BOOL)_isEligibleForPreemptiveBanner:(BOOL)a3 firstPreemptiveBanner:(BOOL)a4 inEarState:(BOOL)a5 srDeviceCount:(unint64_t)a6 audioState:(int64_t)a7 inAddress:(id)a8
{
  _BOOL4 v10;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  BOOL v17;
  const __CFString *v18;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;

  v10 = a4;
  v13 = a8;
  if (a3 || v10)
  {
    v18 = CFSTR("Preemptive Banner shown already");
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v13));

  if (v14)
  {
    v18 = CFSTR("Device already connected");
    goto LABEL_13;
  }
  if (-[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue") >= 201
    && !-[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_localDeviceAudioCatogory check failed, _localDeviceAudioCatogory : %u"), -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue")));
    -[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:](self, "_logPreemptiveBannerEvalError:", v22);
LABEL_27:

    goto LABEL_14;
  }
  if (self->_playbackStart && !self->_playbackStartTimer)
  {
    v18 = CFSTR("Playback start timer has expired");
LABEL_13:
    -[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:](self, "_logPreemptiveBannerEvalError:", v18);
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  if (!a5)
  {
    v18 = CFSTR("inEar state is NO");
    goto LABEL_13;
  }
  if (a7 >= 2)
  {
    v20 = "?";
    if (a7 == 2)
      v20 = "HFP Call";
    if (a7 == 3)
      v21 = "HFP Other";
    else
      v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("audioState is %@"), v22));
    -[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:](self, "_logPreemptiveBannerEvalError:", v23);

    goto LABEL_27;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v13));
  v16 = objc_msgSend(v15, "reconnectionState");

  if (v16 == 1)
  {
    v18 = CFSTR("Budswap reconnection");
    goto LABEL_13;
  }
  v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)_isInEarToOutOfEar:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
  v6 = CUPrintNSDataAddress();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v7));
  v9 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", objc_msgSend(v8, "productID"));

  v10 = (v9 & 1) == 0
     && -[BTSmartRoutingDaemon _inEarConnectedCheck:](self, "_inEarConnectedCheck:", v7)
     && objc_msgSend(v4, "primaryPlacement") != 1
     && objc_msgSend(v4, "secondaryPlacement") != 1;

  return v10;
}

- (BOOL)isInAnyTipi
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000456AC;
  v5[3] = &unk_1001E2D58;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInTipi
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000458C8;
  v5[3] = &unk_1001E2D08;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_inEarConnectedCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  unsigned int v14;
  const char *v15;
  void *v16;
  unsigned int v17;
  const char *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
    if (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", objc_msgSend(v6, "productID")))
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
      if (objc_msgSend(v8, "primaryPlacement") == 1)
      {
        v7 = 1;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
        if (objc_msgSend(v9, "secondaryPlacement") == 1)
        {
          v7 = 1;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
          if (objc_msgSend(v10, "primaryPlacement") == 7)
          {
            v7 = 1;
          }
          else
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
            v7 = objc_msgSend(v11, "secondaryPlacement") == 7;

          }
        }

      }
    }

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      if (v7)
        v12 = "yes";
      else
        v12 = "no";
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
      v14 = objc_msgSend(v13, "primaryPlacement");
      if (v14 > 7)
        v15 = "?";
      else
        v15 = off_1001E3BA8[v14];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
      v17 = objc_msgSend(v16, "secondaryPlacement");
      if (v17 > 7)
        v18 = "?";
      else
        v18 = off_1001E3BA8[v17];
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _inEarConnectedCheck:]", 30, "SmartRouting CONNECTED STATE shows inEar: %s for device %@ primary:%s secondary:%s", v12, v4, v15, v18);

    }
  }
  else
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _inEarConnectedCheck:]", 90, "SmartRouting have not found connected Wx device, assume not routed");
    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_inEarNearbyCheck:(id)a3
{
  id v4;
  NSMutableDictionary *wxDevices;
  id v6;
  char v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  BTSmartRoutingDaemon *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  wxDevices = self->_wxDevices;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100045CF4;
  v12 = &unk_1001E3558;
  v6 = v4;
  v13 = v6;
  v14 = self;
  v15 = &v21;
  v16 = &v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", &v9);
  if (!*((_BYTE *)v18 + 24)
    && dword_10020FA58 <= 90
    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _inEarNearbyCheck:]", 90, "SmartRouting have not found nearby Wx device, assume routing is NO", v9, v10, v11, v12);
  }
  v7 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

- (BOOL)_inCaseLidClosed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  const char *v11;
  const char *v12;
  char v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v6));
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "primaryInCase"))
        v9 = objc_msgSend(v8, "secondaryInCase");
      else
        v9 = 0;
      v10 = objc_msgSend(v8, "lidClosed");
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v11 = "no";
      if (v9)
        v12 = "yes";
      else
        v12 = "no";
      if (v10)
        v11 = "yes";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _inCaseLidClosed:]", 30, "_inCaseLidClose: device %@ prox status shows buds in case: %s, lid status: %s", v4, v12, v11);
    }
    v13 = v9 & v10;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_isAnyConnectedWxInEarCheck
{
  NSMutableDictionary *connectedDevices;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connectedDevices = self->_connectedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000460F4;
  v5[3] = &unk_1001E2D80;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAllWxEnabledInEarDetection
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100046254;
  v5[3] = &unk_1001E2D58;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAnyHRMEnabledDeviceConnected
{
  NSMutableDictionary *connectedDevices;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connectedDevices = self->_connectedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004633C;
  v5[3] = &unk_1001E2CB8;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInEarDetectionDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5
    && (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", objc_msgSend(v5, "productID"))|| objc_msgSend(v6, "primaryPlacement") == 7|| objc_msgSend(v6, "secondaryPlacement") == 7))
  {
    if (dword_10020FA58 > 30)
    {
      v7 = 1;
    }
    else
    {
      if (dword_10020FA58 == -1)
      {
        v7 = 1;
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_18;
      }
      else
      {
        v7 = 1;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isInEarDetectionDisabled:]", 30, "Device %@ IED disabled", v4);
    }
  }
  else if (dword_10020FA58 > 30)
  {
    v7 = 0;
  }
  else
  {
    if (dword_10020FA58 == -1)
    {
      v7 = 0;
      if (!_LogCategory_Initialize(&dword_10020FA58, 30))
        goto LABEL_18;
    }
    else
    {
      v7 = 0;
    }
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isInEarDetectionDisabled:]", 30, "Device %@ IED enabled", v4);
  }
LABEL_18:

  return v7;
}

- (BOOL)_isManualConnection:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
    v5 = ((unint64_t)objc_msgSend(v3, "deviceFlags") >> 18) & 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_isMyAddress:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  unsigned __int16 *v10;
  BOOL v12;

  v4 = a3;
  if (v4)
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString")));
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    if (!v6)
      v6 = "";
    v7 = NSDataWithHex(v6, -1, 22, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (objc_msgSend(v8, "length") == (id)6)
    {
      v9 = (char *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      v10 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
      v12 = *v10 == *(unsigned __int16 *)(v9 + 3) && *((unsigned __int8 *)v10 + 2) == v9[5];
    }
    else
    {
      if (dword_10020FA58 <= 90
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isMyAddress:]", 90, "Address length not correct");
      }
      v12 = 0;
    }

  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isMyAddress:]", 30, "lastRoutedHost is null");
    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isOtherTipiDeviceBeforeTrain:(id)a3 withIOS:(unsigned int)a4 withMacOS:(unsigned int)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v7 = a3;
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.icloudpairing"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "devices"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v21 = v8;
      v11 = *(_QWORD *)v26;
      v22 = a5;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "publicAddressForIDSDevice:", v15));

          if (v16 && objc_msgSend(v16, "isEqualToString:", v7))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productName"));
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("iPhone OS")))
            {
              if (v13)
              {
                objc_msgSend(v13, "operatingSystemVersion");
                v18 = v24;
              }
              else
              {
                v18 = 0;
                v24 = 0;
              }
              if (v18 < a4)
              {

LABEL_27:
                LOBYTE(v10) = 1;
                goto LABEL_28;
              }
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelIdentifier"));
            if ((objc_msgSend(v19, "containsString:", CFSTR("Mac")) & 1) != 0)
            {
              if (v13)
              {
                objc_msgSend(v13, "operatingSystemVersion");
                v13 = v23;
              }
              else
              {
                v23 = 0;
              }

              if ((uint64_t)v13 < v22)
                goto LABEL_27;
            }
            else
            {

            }
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
          continue;
        break;
      }
LABEL_28:
      v8 = v21;
    }

  }
  else
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:]", 90, "Other Tipi device is null while checking its build");
    }
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (BOOL)_isReceivedLegacyTipiConnect:(id)a3
{
  return -[NSString isEqualToString:](self->_tipiElectionReceivedLePipe, "isEqualToString:", a3);
}

- (void)_iPhoneScreenOnPowerEvent
{
  const __CFString *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSMutableDictionary *connectedDevices;
  void *v15;
  void *v16;
  _BOOL4 isBTRoute;
  OS_dispatch_queue *dispatchQueueAVSys;
  _QWORD block[8];
  _QWORD v20[8];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  -[BTSmartRoutingDaemon _update](self, "_update");
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (self->_uiSmartRoutingBanner)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]", 30, "Smart Routing Screen On. Existing banner %@", v3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTBannerUISession trailingAccessoryText](self->_uiSmartRoutingBanner, "trailingAccessoryText"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Reverse"));

  if (v5)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]", 30, "Screen on, not showing connected banner since reverse is shown");
    }
    goto LABEL_34;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTBannerUISession centerContentItemsText](self->_uiSmartRoutingBanner, "centerContentItemsText"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Connected"));

  if (!v7)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = sub_10001E9DC;
    v36 = sub_10001E9EC;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = sub_10001E9DC;
    v30 = sub_10001E9EC;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100046D78;
    v21[3] = &unk_1001E2D58;
    v21[4] = self;
    v21[5] = &v32;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v21);
    if (!v33[5])
      goto LABEL_39;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceName"));
    v11 = (void *)v27[5];
    v27[5] = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v33[5]));
    v13 = objc_msgSend(v12, "productID");
    *((_DWORD *)v23 + 6) = v13;

    if (!v33[5])
    {
LABEL_39:
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]", 30, "No inEar SR device");
      }
      connectedDevices = self->_connectedDevices;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100046F44;
      v20[3] = &unk_1001E3580;
      v20[4] = self;
      v20[5] = &v32;
      v20[6] = &v26;
      v20[7] = &v22;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v20);
      if (!v33[5])
        goto LABEL_33;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:"));
    if (!v15)
      goto LABEL_33;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v33[5]));
    if (objc_msgSend(v16, "hijackBackoffTicks"))
    {
      isBTRoute = self->_isBTRoute;

      if (!isBTRoute)
        goto LABEL_33;
    }
    else
    {

    }
    dispatchQueueAVSys = self->_dispatchQueueAVSys;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004707C;
    block[3] = &unk_1001E35A8;
    block[4] = self;
    block[5] = &v32;
    block[6] = &v26;
    block[7] = &v22;
    dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
LABEL_33:
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    goto LABEL_34;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]", 30, "Screen on, not showing connected banner since one is shown already");
LABEL_34:
  if (!self->_uiSmartRoutingBanner && self->_prefSmartRoutingInUseBanner)
    -[BTSmartRoutingDaemon _evaluatorRunInUseBanner:](self, "_evaluatorRunInUseBanner:", 0);
}

- (BOOL)_lastConnectIsWatchCheck:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *nearbyInfoDevices;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (v4)
  {
    nearbyInfoDevices = self->_nearbyInfoDevices;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100047354;
    v9[3] = &unk_1001E3530;
    v10 = v4;
    v11 = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v9);
    LODWORD(nearbyInfoDevices) = *((unsigned __int8 *)v13 + 24);

    v7 = (_DWORD)nearbyInfoDevices != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_logEvalError:(id)a3
{
  uint64_t v4;

  -[BTSmartRoutingSourceDevice setEvalResult:](self->_sourceDevice, "setEvalResult:", a3);
  v4 = mach_absolute_time();
  -[BTSmartRoutingSourceDevice setEvalTicks:](self->_sourceDevice, "setEvalTicks:", v4);
}

- (void)_logPreemptiveBannerEvalError:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1 || (v5 = _LogCategory_Initialize(&dword_10020FA58, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:]", 30, "Preemptive banner error: %@", v4);
      v4 = v6;
    }
  }
  -[BTSmartRoutingSourceDevice setEvalPreemptiveBannerResult:](self->_sourceDevice, "setEvalPreemptiveBannerResult:", v4);

}

- (void)_logEvalWxError:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  SmartRoutingWxInfo *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));

    if (!v7)
    {
      v8 = objc_alloc_init((Class)NSMutableDictionary);
      -[BTSmartRoutingSourceDevice setEvalWxMap:](self->_sourceDevice, "setEvalWxMap:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    v10 = (SmartRoutingWxInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v12));

    if (!v10)
      v10 = objc_alloc_init(SmartRoutingWxInfo);
    -[SmartRoutingWxInfo setLastEvalResult:](v10, "setLastEvalResult:", v6);
    -[SmartRoutingWxInfo setLastEvalTicks:](v10, "setLastEvalTicks:", mach_absolute_time());
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
}

- (double)_lowestBatteryInfoForCBDevice:(id)a3
{
  id v4;
  float v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;

  v4 = a3;
  if (-[BTSmartRoutingDaemon _bluetoothProductIDNoUTP:](self, "_bluetoothProductIDNoUTP:", objc_msgSend(v4, "productID")))
  {
    objc_msgSend(v4, "batteryLevelMain");
    if (v5 == 0.0)
    {
      v7 = 0.0;
    }
    else
    {
      objc_msgSend(v4, "batteryLevelMain");
      v7 = v6;
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]", 30, "cbDevice found main battery, LowestBatteryInfo: %f");
      }
    }
    goto LABEL_27;
  }
  objc_msgSend(v4, "batteryLevelLeft");
  if (v8 != 0.0)
  {
    objc_msgSend(v4, "batteryLevelRight");
    if (v9 != 0.0)
    {
      objc_msgSend(v4, "batteryLevelLeft");
      v11 = v10;
      objc_msgSend(v4, "batteryLevelRight");
      v12 = v4;
      if (v11 <= v13)
        goto LABEL_17;
      goto LABEL_11;
    }
  }
  objc_msgSend(v4, "batteryLevelRight");
  v12 = v4;
  if (v14 != 0.0)
  {
LABEL_11:
    objc_msgSend(v12, "batteryLevelRight");
    v7 = v15;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]", 30, "cbDevice found right battery, LowestBatteryInfo: %f");
    }
    goto LABEL_27;
  }
  objc_msgSend(v4, "batteryLevelLeft");
  if (v16 != 0.0)
  {
    v12 = v4;
LABEL_17:
    objc_msgSend(v12, "batteryLevelLeft");
    v7 = v17;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]", 30, "cbDevice found left battery, LowestBatteryInfo: %f");
    }
    goto LABEL_27;
  }
  v7 = 0.0;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]", 30, "no battery level found for cbDevice , LowestBatteryInfo: %f");
LABEL_27:

  return v7;
}

- (double)_lowestBatteryInfoForSFDevice:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  char *v14;
  const char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "batteryInfo"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 1.1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "batteryLevel");
        v12 = v11;
        if (-[BTSmartRoutingDaemon _checkValidBatteryValue:](self, "_checkValidBatteryValue:", v10))
          v13 = v12 < v8;
        else
          v13 = 0;
        if (v13 && v12 != 0.0)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            v14 = (char *)objc_msgSend(v10, "batteryType");
            v15 = "?";
            if ((unint64_t)(v14 - 1) <= 3)
              v15 = off_1001E3BE8[(_QWORD)(v14 - 1)];
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:]", 30, "wxDevice found %s battery, LowestBatteryInfo: %f", v15, v12);
          }
          v8 = v12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.1;
  }

  return v8;
}

- (void)_nearbyDeviceInfoTriangleRecoveryTimer
{
  dispatch_time_t v3;
  unint64_t prefSmartRoutingWatchTriangleMagnet;
  dispatch_time_t v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v8;
  _QWORD handler[5];

  v3 = dispatch_time(0, 120000000000);
  prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
  if (prefSmartRoutingWatchTriangleMagnet)
  {
    v5 = dispatch_time(0x8000000000000000, 1000000000 * prefSmartRoutingWatchTriangleMagnet);
  }
  else
  {
    v5 = v3;
    LODWORD(prefSmartRoutingWatchTriangleMagnet) = 120;
  }
  if (self->_nearbyInfoDevicesTriangleRecoveryTimer)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer]", 30, "TriangleRecovery: Skip, timer exists");
    }
  }
  else
  {
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = v6;

    v8 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100047C1C;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer]", 30, "TriangleRecovery: Start in %us", prefSmartRoutingWatchTriangleMagnet);
    }
    dispatch_source_set_timer((dispatch_source_t)self->_nearbyInfoDevicesTriangleRecoveryTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_nearbyInfoDevicesTriangleRecoveryTimer);
  }
}

- (void)_nearbyDeviceInfoCheck
{
  NSMutableDictionary *nearbyInfoDevices;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (self->_nearbyInfoDiscovery && !self->_tipiElectionInProgress)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    if (-[NSMutableDictionary count](self->_nearbyInfoDevices, "count") == (id)1)
    {
      nearbyInfoDevices = self->_nearbyInfoDevices;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100047F80;
      v9[3] = &unk_1001E2CE0;
      v9[4] = &v10;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v9);
    }
    if (*((_BYTE *)v11 + 24))
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100048034;
      v8[3] = &unk_1001E3008;
      v8[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v8);
    }
    nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    if (nearbyInfoDevicesTriangleRecoveryTimer)
    {
      v6 = nearbyInfoDevicesTriangleRecoveryTimer;
      dispatch_source_cancel(v6);
      v7 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
      self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

    }
    _Block_object_dispose(&v10, 8);
  }
}

- (id)_nearbyMacAddressTranslate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicAddressForIDSDevice:", v5));

    if (v7)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]", 30, "Evaluator: publicDeviceAddress %@", v7);
      }
      v8 = NSDataWithHex(objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, 22, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else if (dword_10020FA58 <= 90
             && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]", 90, "Evaluator: Translation of public address mapping for %@ failed.", 0);
      }

    }
    else
    {
      if (dword_10020FA58 <= 90
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]", 90, "Evaluator: No public address mapping for %@", v5);
      }
      v10 = 0;
    }

  }
  else
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]", 90, "Evaluator: Skip translation. Ids ID is null");
    }
    v10 = 0;
  }

  return v10;
}

- (int)_nearbyDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Mac")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("iPod")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_nearbyWxChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *nearbyWxDeviceMap;
  void *v9;
  void *v10;
  unsigned int Int64Ranged;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t CFDataOfLength;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  CFTypeID TypeID;
  uint64_t TypedValue;
  __CFString *v27;
  NearbyWxDevice *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  __CFString *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  id v40;
  unint64_t v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  unsigned int v56;
  uint64_t Int64;
  int v58;
  unsigned __int8 v59;
  const char *v60;
  unsigned __int8 v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  void *v70;
  void *v71;
  BTSmartRoutingDaemon *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  if (v6)
  {
    if (!self->_nearbyWxDeviceMap)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      nearbyWxDeviceMap = self->_nearbyWxDeviceMap;
      self->_nearbyWxDeviceMap = v7;

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "advertisementFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v10, CFSTR("hsStatus"), 0, 0xFFFFFFFFLL, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "advertisementFields"));
    v14 = CFDictionaryGetInt64Ranged(v13, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "advertisementFields"));

    v65 = CFDictionaryGetInt64Ranged(v16, CFSTR("asCount"), 0, 0xFFFFFFFFLL, 0);
    CFDataOfLength = CFDictionaryGetCFDataOfLength(v16, CFSTR("lch"), 3, 0);
    v18 = objc_claimAutoreleasedReturnValue(CFDataOfLength);
    v19 = CFDictionaryGetCFDataOfLength(v16, CFSTR("publicAddress"), 6, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v74 = v4;
    v68 = v20;
    if (v20)
    {
      v21 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v20), "bytes")));
      v22 = objc_claimAutoreleasedReturnValue(v21);
    }
    else
    {
      v22 = 0;
    }
    v23 = CFDictionaryGetInt64Ranged(v16, CFSTR("aState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
    v63 = v14;
    Int64 = CFDictionaryGetInt64(v16, CFSTR("paired"), 0);
    v58 = CFDictionaryGetInt64Ranged(v16, CFSTR("lc"), 0, 0xFFFFFFFFLL, 0);
    if ((Int64Ranged & 0x24) != 0)
      v56 = 1;
    else
      v56 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v14);
    v61 = CFDictionaryGetInt64Ranged(v16, CFSTR("audioIdleTime"), 0, 255, 0);
    v59 = CFDictionaryGetInt64Ranged(v16, CFSTR("budsOutofCaseTime"), 0, 255, 0);
    v24 = CFDictionaryGetInt64(v16, CFSTR("primaryiCloudSignIn"), 0);
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v16, CFSTR("name"), TypeID, 0);
    v27 = &stru_1001ED4C0;
    if (TypedValue)
      v27 = (__CFString *)TypedValue;
    v69 = v27;
    v71 = v6;
    v28 = (NearbyWxDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v6));
    if (!v28)
      v28 = objc_alloc_init(NearbyWxDevice);
    v72 = self;
    v70 = (void *)v18;
    v67 = (void *)v22;
    -[NearbyWxDevice setAddress:](v28, "setAddress:", v22);
    -[NearbyWxDevice setAudioState:](v28, "setAudioState:", v23);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "batteryInfo"));
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v34, "batteryType") == (id)2)
          {
            objc_msgSend(v34, "batteryLevel");
            -[NearbyWxDevice setBatteryLeft:](v28, "setBatteryLeft:");
          }
          if (objc_msgSend(v34, "batteryType") == (id)3)
          {
            objc_msgSend(v34, "batteryLevel");
            -[NearbyWxDevice setBatteryRight:](v28, "setBatteryRight:");
          }
          if (objc_msgSend(v34, "batteryType") == (id)4)
          {
            objc_msgSend(v34, "batteryLevel");
            -[NearbyWxDevice setBatteryMain:](v28, "setBatteryMain:");
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      }
      while (v31);
    }

    v4 = v74;
    -[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:](v72, "_lowestBatteryInfoForSFDevice:", v74);
    -[NearbyWxDevice setLowestBudBatteryInfo:](v28, "setLowestBudBatteryInfo:");
    -[NearbyWxDevice setPaired:](v28, "setPaired:", Int64 != 0);
    -[NearbyWxDevice setProductID:](v28, "setProductID:", v63);
    -[NearbyWxDevice setSourceCount:](v28, "setSourceCount:", v65);
    v35 = v70;
    -[NearbyWxDevice setLastConnectHost:](v28, "setLastConnectHost:", v70);
    -[NearbyWxDevice setLidClosed:](v28, "setLidClosed:", v58 == 1);
    -[NearbyWxDevice setPrimaryInEar:](v28, "setPrimaryInEar:", (Int64Ranged >> 2) & 1);
    -[NearbyWxDevice setSecondaryInEar:](v28, "setSecondaryInEar:", (Int64Ranged >> 5) & 1);
    -[NearbyWxDevice setPrimaryInCase:](v28, "setPrimaryInCase:", (Int64Ranged >> 1) & 1);
    -[NearbyWxDevice setSecondaryInCase:](v28, "setSecondaryInCase:", (Int64Ranged >> 4) & 1);
    -[NearbyWxDevice setIsInEar:](v28, "setIsInEar:", v56);
    -[NearbyWxDevice setIsUTPConnected:](v28, "setIsUTPConnected:", Int64Ranged & 1);
    -[NearbyWxDevice setIdleTime:](v28, "setIdleTime:", v61);
    -[NearbyWxDevice setOutOfCaseTime:](v28, "setOutOfCaseTime:", v59);
    -[NearbyWxDevice setIcloudSignedIn:](v28, "setIcloudSignedIn:", v24 != 0);
    v36 = v69;
    -[NearbyWxDevice setName:](v28, "setName:", v69);
    -[NearbyWxDevice setLastWxAdvTicks:](v28, "setLastWxAdvTicks:", mach_absolute_time());
    if ((_DWORD)v65 == 1)
    {
      -[NearbyWxDevice setOneSourceLastRouteHost:](v28, "setOneSourceLastRouteHost:", v70);
      v6 = v71;
    }
    else
    {
      v6 = v71;
      if (!(_DWORD)v65)
        -[NearbyWxDevice setZeroSourceLastRouteHost:](v28, "setZeroSourceLastRouteHost:", v70);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v72->_nearbyWxDeviceMap, "setObject:forKeyedSubscript:", v28, v6);
    if (dword_10020FA58 <= 50
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
    {
      v37 = objc_claimAutoreleasedReturnValue(-[NearbyWxDevice address](v28, "address"));
      v38 = "yes";
      if (-[NearbyWxDevice isUTPConnected](v28, "isUTPConnected"))
        v39 = "yes";
      else
        v39 = "no";
      v40 = (id)-[NearbyWxDevice sourceCount](v28, "sourceCount");
      v41 = -[NearbyWxDevice audioState](v28, "audioState");
      v73 = (void *)v37;
      v64 = v40;
      v66 = v39;
      if (v41 > 3)
        v42 = "?";
      else
        v42 = off_1001E3C08[v41];
      v60 = v42;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyWxDevice lastConnectHost](v28, "lastConnectHost"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyWxDevice zeroSourceLastRouteHost](v28, "zeroSourceLastRouteHost"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyWxDevice oneSourceLastRouteHost](v28, "oneSourceLastRouteHost"));
      if (-[NearbyWxDevice lidClosed](v28, "lidClosed"))
        v45 = "yes";
      else
        v45 = "no";
      if (-[NearbyWxDevice primaryInEar](v28, "primaryInEar"))
        v46 = "yes";
      else
        v46 = "no";
      if (-[NearbyWxDevice secondaryInEar](v28, "secondaryInEar"))
        v47 = "yes";
      else
        v47 = "no";
      if (-[NearbyWxDevice primaryInCase](v28, "primaryInCase"))
        v48 = "yes";
      else
        v48 = "no";
      if (!-[NearbyWxDevice secondaryInCase](v28, "secondaryInCase"))
        v38 = "no";
      -[NearbyWxDevice batteryLeft](v28, "batteryLeft");
      v50 = v49;
      -[NearbyWxDevice batteryRight](v28, "batteryRight");
      v52 = v51;
      -[NearbyWxDevice batteryMain](v28, "batteryMain");
      v55 = v38;
      v54 = v45;
      v6 = v71;
      v36 = v69;
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _nearbyWxChanged:]", 50, "Nearby Wx device %@ changed, name %@, addr %@, UTP %s, sourceCount %u, audioState %s, lastRoute %@, zeroLastRoute %@, oneLastRoute %@, lidClosed %s, primaryInEar %s, secondaryInEar %s, primaryInCase %s, secondaryInCase %s, battery Left %f, battery right %f, battery main %f", v71, v69, v73, v66, v64, v60, v62, v43, v44, v54, v46, v47, v48,
        v55,
        v50,
        v52,
        v53);

      v4 = v74;
      v35 = v70;
    }

  }
}

- (void)_notifyOtherTipiDeviceTipiScoreChanged:(int)a3 andNewScore:(int)a4
{
  int v7;
  OS_dispatch_source *nearbyDeviceNotificationTimer;
  NSObject *v9;
  OS_dispatch_source *v10;

  if (self->_prefProactiveOwnershipArbitration)
  {
    v7 = a4 | a3;
    if (!(a4 | a3))
      goto LABEL_9;
    if (-[BTSmartRoutingDaemon _isInTipi](self, "_isInTipi"))
    {
      nearbyDeviceNotificationTimer = self->_nearbyDeviceNotificationTimer;
      if (nearbyDeviceNotificationTimer)
      {
        v9 = nearbyDeviceNotificationTimer;
        dispatch_source_cancel(v9);
        v10 = self->_nearbyDeviceNotificationTimer;
        self->_nearbyDeviceNotificationTimer = 0;

      }
      if ((a4 - 1) < 2 || (a3 - 1) <= 1)
LABEL_9:
        -[BTSmartRoutingDaemon _sendAudioScoreChanged:](self, "_sendAudioScoreChanged:", v7 == 0);
    }
  }
}

- (void)_otherTipiDeviceTipiScoreChanged:(id)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  uint64_t NSNumber;
  void *v9;
  id v10;
  unsigned int v11;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t score;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  OS_dispatch_source *highActivityLevelTimer;
  NSObject *v31;
  OS_dispatch_source *v32;
  id v33;

  v6 = a4;
  if (self->_prefProactiveOwnershipArbitration)
  {
    v33 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", a3));
    NSNumber = NSDictionaryGetNSNumber(v33, CFSTR("nearbyAudioScore"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v10 = objc_msgSend(v9, "intValue");

    v11 = objc_msgSend(v7, "otherTipiDeviceAudioScore");
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v33, CFSTR("btAddress"), TypeID, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("newTipi")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherTipiDeviceBTAddress"));
    if (v16)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        if (v11 > 0xF)
          v17 = "?";
        else
          v17 = off_1001E3C88[v11];
        if (v10 > 0xF)
          v18 = "?";
        else
          v18 = off_1001E3C88[(int)v10];
        v19 = "yes";
        if (!v15)
          v19 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]", 30, "ProactiveRouting: Received other Tipi device update %@ %s -> %s newTipi %s", v14, v17, v18, v19);
      }
      objc_msgSend(v7, "setOtherTipiDeviceAudioScore:", v10);
      if ((_DWORD)v10 == 1)
      {
        if (v11 != 1)
        {
          v20 = NSDictionaryGetNSNumber(v33, CFSTR("idleTime"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = objc_msgSend(v21, "intValue");

          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherTipiDeviceBTAddress"));
            v24 = (void *)v23;
            score = self->_score;
            if (score > 0xF)
              v26 = "?";
            else
              v26 = off_1001E3C88[score];
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]", 30, "ProactiveRouting: Other Tipi %@ has been idle for %ds, my audio score %s", v23, v22, v26);

          }
          v28 = mach_absolute_time();
          objc_msgSend(v7, "setOtherTipiDeviceIdleTick:", v28 - SecondsToUpTicks((int)v22, v29));
          if (v15)
          {
            -[BTSmartRoutingDaemon _startHighActivityLevelTimer:](self, "_startHighActivityLevelTimer:", 1);
            -[SmartRoutingStats setProactiveRoutingTrigger:](self->_stats, "setProactiveRoutingTrigger:", CFSTR("Tipi connection"));
          }
        }
      }
      else if ((int)v10 >= 3)
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          if (((_DWORD)v10 - 4) > 0xB)
            v27 = "?";
          else
            v27 = off_1001E3C28[(int)v10 - 4];
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]", 30, "ProactiveRouting: Cancel high activity timer since other Tipi device is %s", v27);
        }
        highActivityLevelTimer = self->_highActivityLevelTimer;
        if (highActivityLevelTimer)
        {
          v31 = highActivityLevelTimer;
          dispatch_source_cancel(v31);
          v32 = self->_highActivityLevelTimer;
          self->_highActivityLevelTimer = 0;

        }
      }
    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]", 30, "ProactiveRouting: Not in Tipi with %@", v14);
    }

    v6 = v33;
  }

}

- (void)_postNotification:(const char *)a3
{
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _postNotification:]", 30, "Posting %s", a3);
  notify_post(a3);
}

- (void)_powerLogSmartRoutingScanStarted:(unsigned __int8)a3
{
  uint64_t v3;
  double Current;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[3];

  if (self->_prefSmartRoutingEnabledPhase3)
  {
    v3 = a3;
    Current = CFAbsoluteTimeGetCurrent();
    v9[0] = CFSTR("ScanStart");
    v8[0] = CFSTR("kEventType");
    v8[1] = CFSTR("kScanType");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v3));
    v9[1] = v5;
    v8[2] = CFSTR("timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    v9[2] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

    PLLogRegisteredEvent(99, CFSTR("SmartRouting"), v7, 0);
  }
}

- (void)_powerLogSmartRoutingScanStopped:(unsigned __int8)a3
{
  uint64_t v3;
  double Current;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[3];

  if (self->_prefSmartRoutingEnabledPhase3)
  {
    v3 = a3;
    Current = CFAbsoluteTimeGetCurrent();
    v9[0] = CFSTR("ScanStop");
    v8[0] = CFSTR("kEventType");
    v8[1] = CFSTR("kScanType");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v3));
    v9[1] = v5;
    v8[2] = CFSTR("timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    v9[2] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

    PLLogRegisteredEvent(99, CFSTR("SmartRouting"), v7, 0);
  }
}

- (void)_powerLogSmartIncomingConnection
{
  NSNumber *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[2];

  if (self->_prefSmartRoutingEnabledPhase3)
  {
    v5[0] = CFSTR("kIncomingLEPipe");
    v5[1] = CFSTR("timestamp");
    v6[0] = &__kCFBooleanTrue;
    v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v6[1] = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));

    PLLogRegisteredEvent(99, CFSTR("SmartRouting"), v4, 0);
  }
}

- (void)_proactivelyTakeOwnership
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unsigned int v17;
  const char *v18;
  void *v19;
  uint64_t *v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10001E9DC;
  v29 = sub_10001E9EC;
  v30 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100049744;
  v24[3] = &unk_1001E24F8;
  v24[4] = self;
  v24[5] = &v25;
  v3 = objc_retainBlock(v24);
  v23 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getInEarSrWxDevice](self, "_getInEarSrWxDevice"));
  v5 = v4;
  if (!v4)
  {
    v6 = (void *)v26[5];
    v26[5] = (uint64_t)CFSTR("Couldn't find inEar Wx");
    goto LABEL_33;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceAddress"));
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Already has ownership: %@"), v6);
  if (objc_msgSend(v5, "hasOwnership"))
  {
    v20 = v26;
    v21 = v7;
LABEL_38:
    v7 = v21;
    v10 = (void *)v20[5];
    v20[5] = (uint64_t)v21;
    goto LABEL_32;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceBTAddress"));

  if (!v8)
  {
    v10 = (void *)v26[5];
    v26[5] = (uint64_t)CFSTR("Not in Tipi");
    goto LABEL_32;
  }
  v9 = (objc_msgSend(v5, "otherTipiDeviceAudioScore") == 1
     || objc_msgSend(v5, "otherTipiDeviceAudioScore") == 2)
    && objc_msgSend(v5, "otherTipiDeviceIdleTick") != 0;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("The other Tipi device is not idle, audioScore %d idleTick %llu"), objc_msgSend(v5, "otherTipiDeviceAudioScore"), objc_msgSend(v5, "otherTipiDeviceIdleTick"));

  if (!v9)
  {
    v20 = v26;
    v21 = v22;
    goto LABEL_38;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6));
  v12 = -[BTSmartRoutingDaemon _getRssiNearby:](self, "_getRssiNearby:", v10);
  v13 = mach_absolute_time();
  v14 = UpTicksToSeconds(v13 - (_QWORD)objc_msgSend(v5, "otherTipiDeviceIdleTick"));
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v10));
    v16 = objc_msgSend(v15, "audioState");

  }
  else
  {
    v16 = 0;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v17 = objc_msgSend(v11, "audioStreamState");
    if (v17 > 3)
      v18 = "?";
    else
      v18 = off_1001E3DD8[v17];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _proactivelyTakeOwnership]", 30, "ProactiveRouting: StreamState %s otherTipiDeviceIdle %llus, wxRssiConnected %d wxRssiNearby %d ", v18, v14, objc_msgSend(v11, "rssi"), v12);
  }
  if (objc_msgSend(v11, "audioStreamState") != 1)
  {
    if (objc_msgSend(v11, "audioStreamState") || v16 || v12 <= -70)
      goto LABEL_31;
LABEL_26:
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _proactivelyTakeOwnership]", 30, "ProactiveRouting: Taking the route");
    }
    self->_proactiveRoutingInProgress = 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("-tacl")));
    -[BTSmartRoutingDaemon _smartRoutingChangeRoute:](self, "_smartRoutingChangeRoute:", v19);

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, &off_1001F41D8, v6, 0);
    -[SmartRoutingStats setProactiveRoutingWxRSSI:](self->_stats, "setProactiveRoutingWxRSSI:", objc_msgSend(v11, "rssi"));
    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 12);
    goto LABEL_31;
  }
  if (v12 >= -69)
    goto LABEL_26;
LABEL_31:

  v7 = v22;
  v3 = v23;
LABEL_32:

LABEL_33:
  ((void (*)(_QWORD *))v3[2])(v3);

  _Block_object_dispose(&v25, 8);
}

- (BOOL)_productColorAssetExists:(unsigned int)a3 withColor:(char)a4
{
  unsigned int v4;
  _BOOL4 v5;

  switch(a3)
  {
    case 0x2011u:
      if (a4 == 1)
        goto LABEL_18;
      goto LABEL_22;
    case 0x2012u:
      if (a4 >= 0xA)
        goto LABEL_22;
      goto LABEL_18;
    case 0x2013u:
    case 0x2014u:
    case 0x2015u:
    case 0x2018u:
    case 0x2019u:
    case 0x201Bu:
    case 0x201Cu:
    case 0x201Eu:
    case 0x2020u:
    case 0x2021u:
    case 0x2022u:
    case 0x2023u:
    case 0x2024u:
      goto LABEL_22;
    case 0x2016u:
      if (a4 >= 5)
        goto LABEL_22;
      goto LABEL_18;
    case 0x2017u:
      if (a4 >= 0xA)
        goto LABEL_22;
      v4 = 762;
      return (v4 >> a4) & 1;
    case 0x201Au:
      goto LABEL_19;
    case 0x201Du:
    case 0x2026u:
      if ((a4 - 1) >= 4u)
        goto LABEL_22;
      goto LABEL_18;
    case 0x201Fu:
      if ((a4 - 18) >= 5)
        goto LABEL_22;
      goto LABEL_18;
    case 0x2025u:
      if (a4 >= 3)
      {
LABEL_19:
        if (a4 >= 5)
        {
LABEL_22:
          LOBYTE(v5) = 0;
        }
        else
        {
          v4 = 22;
          return (v4 >> a4) & 1;
        }
      }
      else
      {
LABEL_18:
        LOBYTE(v5) = 1;
      }
      return v5;
    default:
      if (a3 != 8202 || a4 >= 0x12)
        goto LABEL_22;
      v4 = 229388;
      return (v4 >> a4) & 1;
  }
}

- (id)_productColorAssetLookup:(unsigned int)a3 andAddress:(id)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *wxAssetCache;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v15;
  void *v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[BTSmartRoutingDaemon _productHasColors:](self, "_productHasColors:", v4))
  {
    wxAssetCache = self->_wxAssetCache;
    if (!wxAssetCache)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_wxAssetCache;
      self->_wxAssetCache = v8;

      wxAssetCache = self->_wxAssetCache;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](wxAssetCache, "objectForKeyedSubscript:", v6));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxAssetCache, "objectForKeyedSubscript:", v6));
      if (dword_10020FA58 <= 50
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
      {
        v15 = v6;
        v16 = v11;
        v12 = "%@ banner asset found in cache %@";
LABEL_14:
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _productColorAssetLookup:andAddress:]", 50, v12, v15, v16);
      }
    }
    else
    {
      v13 = -[BTSmartRoutingDaemon _getWxColorCode:](self, "_getWxColorCode:", v6);
      if (!-[BTSmartRoutingDaemon _productColorAssetExists:withColor:](self, "_productColorAssetExists:withColor:", v4, (char)v13)|| (_DWORD)v13 == 255)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductDefaultAsset:](self, "_bluetoothProductDefaultAsset:", v4));
        if (dword_10020FA58 <= 60
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 60)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _productColorAssetLookup:andAddress:]", 60, "%@ banner asset and color not found using default %@", v6, v11);
        }
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductIDToColorAsset:withColor:](self, "_bluetoothProductIDToColorAsset:withColor:", v4, v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxAssetCache, "setObject:forKeyedSubscript:", v11, v6);
        if (dword_10020FA58 <= 50
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
        {
          v15 = v6;
          v16 = v11;
          v12 = "%@ new banner asset, caching it now %@";
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductIDToAsset:](self, "_bluetoothProductIDToAsset:", v4));
  }

  return v11;
}

- (BOOL)_productHasColors:(unsigned int)a3
{
  return (a3 - 8202 < 0x1D) & (0x18293181u >> (a3 - 10));
}

- (void)_receivedAudioCategory:(id)a3 withOptions:(id)a4
{
  id v6;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  OS_dispatch_source *tipiHealingHijackTimer;
  NSObject *v21;
  OS_dispatch_source *v22;
  NSInteger v23;
  unsigned int v24;
  const char *v25;
  void *v26;
  void *v27;
  char v28;
  OS_dispatch_source *phoneOwnershipTriangleTimer;
  OS_dispatch_source *v30;
  NSObject *v31;
  OS_dispatch_source *v32;
  void *v33;
  id v34;

  v6 = a3;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("otherDeviceAudioCategory")));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("btAddress")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("btName")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("playingApp")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("hostStreamingState")));

  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("YES"));
  objc_msgSend(v9, "_setOtherTipiDeviceIsStreamingAudio:", v15);
  if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "otherTipiDeviceBTAddress"));
    v17 = objc_msgSend(v16, "isEqualToString:", v12);

    if ((v17 & 1) == 0)
    {
      if (dword_10020FA58 <= 90
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "otherTipiDeviceBTAddress"));
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]", 90, "Host device address does not match, current cached host address %@, the other device address %@; Updated the Tipi info!",
          v18,
          v12);

      }
      -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](self, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v6, v12, v33, &off_1001F3D38);
      -[BTSmartRoutingDaemon _tipihHealingV2Handling:](self, "_tipihHealingV2Handling:", v6);
    }
  }
  if (!self->_prefSmartRoutingForcedHijackv2)
    goto LABEL_12;
  v19 = 0;
  if (!objc_msgSend(v9, "otherTipiAudioCategory") && v11 >= 0x12D)
  {
    if (objc_msgSend(v9, "routingAction") == 1)
    {
LABEL_12:
      v19 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v9, "_setOtherTipiAudioCategory:", v11);
    v23 = -[NSNumber integerValue](self->_localDeviceAudioCatogory, "integerValue");
    v34 = 0;
    v24 = -[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:](self, "allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:", v23, v6, &v34);
    v19 = v34;
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      v25 = "no";
      if (v24)
        v25 = "yes";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]", 90, "[HijackV2]: Arbitrate again while receiving audio score of other Tipi device for the first time. ShouldHijack %s", v25);
    }
    if (v24)
    {
      objc_msgSend(v9, "_setRoutingAction:", 1);
      -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
    }
  }
LABEL_13:
  objc_msgSend(v9, "_setOtherTipiAudioCategory:", v11);
  objc_msgSend(v9, "_setOtherTipiPlayingApp:", v13);
  tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
  if (tipiHealingHijackTimer)
  {
    v21 = tipiHealingHijackTimer;
    dispatch_source_cancel(v21);
    v22 = self->_tipiHealingHijackTimer;
    self->_tipiHealingHijackTimer = 0;

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]", 30, "Received audio score and tipi healing hijack timer is running, service pending MX request");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioRoutingRequest"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioRoutingResponse"));
    -[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:](self, "_smartRoutingAudioRoutingRequest:withResponseHandler:", v26, v27);

  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]", 30, "[Hijackv2] Received audio category %u from tipi device %@ through relay message", objc_msgSend(v9, "otherTipiAudioCategory"), v12);
  if (objc_msgSend(v9, "otherTipiDeviceIsWatch"))
  {
    if (objc_msgSend(v9, "otherTipiAudioCategory") == 100)
      v28 = (char)v15;
    else
      v28 = 1;
    phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
    if ((v28 & 1) != 0)
    {
      if (!phoneOwnershipTriangleTimer)
        goto LABEL_40;
    }
    else if (!phoneOwnershipTriangleTimer)
    {
      -[BTSmartRoutingDaemon _startPhoneTriangleOwnershipTimer:](self, "_startPhoneTriangleOwnershipTimer:", 10);
      goto LABEL_40;
    }
    if (((objc_msgSend(v9, "otherTipiAudioCategory") < 0x65) & ~(_DWORD)v15) == 0)
    {
      v30 = self->_phoneOwnershipTriangleTimer;
      if (v30)
      {
        v31 = v30;
        dispatch_source_cancel(v31);
        v32 = self->_phoneOwnershipTriangleTimer;
        self->_phoneOwnershipTriangleTimer = 0;

      }
    }
  }
LABEL_40:

}

- (void)_receivedRelinquishOwnership:(id)a3 wxAddress:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int audioScoreOtherTipiDevice;
  void *v11;
  id v12;
  const char *v13;
  uint64_t score;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CUUserNotificationSession *uiNoteSessionSmartRouting;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  SmartRoutingStats *stats;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  id v45;

  v45 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("reason")));
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "ReceivedOwnershipLost: Reason %@", v7);
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    if (!v8)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "ReceivedOwnershipLost: No Wx SR device");
      }
      goto LABEL_91;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("audioRoutingScore")));
    audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    if (audioScoreOtherTipiDevice != objc_msgSend(v9, "intValue"))
      self->_audioScoreOtherTipiDevice = objc_msgSend(v9, "intValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("localscore")));
    v12 = objc_msgSend(v11, "intValue");

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      if (self->_activityLevelMediaPlaying
        || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") >= 1)
      {
        v13 = "yes";
      }
      else
      {
        v13 = "no";
      }
      v43 = (void *)v13;
      score = self->_score;
      v15 = v9;
      if (score > 0xF)
        v16 = "?";
      else
        v16 = off_1001E3C88[score];
      v17 = self->_audioScoreOtherTipiDevice;
      if (objc_msgSend(v8, "routed"))
        v18 = "yes";
      else
        v18 = "no";
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](self->_uiNoteSessionSmartRouting, "identifier"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "ReceivedOwnershipLost: Reason %@ hijackedScoreFromRemote %u activeAudio %s localTipiScore %s OtherTipiDeviceScore %u wxRouteState %s bannerType %@", v7, v12, v43, v16, v17, v18, v19);

      v9 = v15;
    }
    -[BTSmartRoutingDaemon _setOwnership:withHijackRequest:withOwnership:](self, "_setOwnership:withHijackRequest:withOwnership:", v6, 0, 0);
    if (!objc_msgSend(v8, "routed"))
    {
LABEL_58:
      uiNoteSessionSmartRouting = self->_uiNoteSessionSmartRouting;
      if (uiNoteSessionSmartRouting)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](uiNoteSessionSmartRouting, "identifier"));
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("ReverseRoute"));

        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AutoResume")) & 1) != 0)
        {
          if ((v31 & 1) != 0)
            goto LABEL_90;
          goto LABEL_63;
        }
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AutoResume")) & 1) != 0)
      {
LABEL_63:
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "ReceivedOwnershipLost: Show reverse banner for autoResume");
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceName"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceAddress"));
        v39 = objc_msgSend(v8, "productID");
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherTipiDeviceBTName"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v40));
        -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 5, v32, v38, v39, v41, 0, 20.0);

LABEL_89:
        goto LABEL_90;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Hijackv2")))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("localscore")));
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "ReceivedOwnershipLost: Hijackv2 localScore %@ remoteHijackScore %@", v32, v9);
        }
        -[SmartRoutingStats setHijackAwayLocalScore:](self->_stats, "setHijackAwayLocalScore:", 0xFFFFFFFFLL);
        -[SmartRoutingStats setHijackAwayRemoteScore:](self->_stats, "setHijackAwayRemoteScore:", 0xFFFFFFFFLL);
        if (v32)
          -[SmartRoutingStats setHijackAwayLocalScore:](self->_stats, "setHijackAwayLocalScore:", objc_msgSend(v32, "intValue"));
        if (v9)
          -[SmartRoutingStats setHijackAwayRemoteScore:](self->_stats, "setHijackAwayRemoteScore:", objc_msgSend(v9, "intValue"));
        -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:](self, "submitRouteActivityMetric:activity:", v6, CFSTR("Hijack_Away"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

        if (!v42)
          -[SmartRoutingStats setFalseRouteCheckReason:](self->_stats, "setFalseRouteCheckReason:", CFSTR("Hijacked_Away"));
        -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 8);
        goto LABEL_89;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("ManualRoute")))
      {
        -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:](self, "submitRouteActivityMetric:activity:", v6, CFSTR("Remote_Manual_Route"));
        objc_msgSend(v8, "_setOtherTipiManuallyRouteTick:", mach_absolute_time());
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

        if (v33)
        {
LABEL_90:

LABEL_91:
          goto LABEL_92;
        }
        stats = self->_stats;
        v35 = CFSTR("Remote_Manual_Route");
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ReverseBannerTapped")))
          goto LABEL_90;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

        if (v36)
          goto LABEL_90;
        stats = self->_stats;
        v35 = CFSTR("Remote_reverse_banner_tapped");
      }
      -[SmartRoutingStats setFalseRouteCheckReason:](stats, "setFalseRouteCheckReason:", v35);
      goto LABEL_90;
    }
    v20 = v45;
    if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("audioRoutingShowReverseUI")));

      v20 = v45;
      if (v12)
      {
        objc_msgSend(v8, "_setHijackBackoffTick:", mach_absolute_time());
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "Hijackblocking: Hijack backoff starts due to the other device clicks the revserse banner");
        }
        self->_hijackBackOffInitiator = 0;
        -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
        v20 = v45;
      }
    }
    v21 = self->_audioScoreOtherTipiDevice;
    if (v21 <= 0)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("audioRoutingShowReverseUI")));
      if (v23)
      {
        v12 = (id)v23;
        v22 = 0;
      }
      else
      {
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("SmartRoutingKeyShowNearbyUI")));
        if (!v37)
          goto LABEL_57;
        v43 = (void *)v37;
        v12 = 0;
        v22 = 1;
      }
    }
    else
    {
      v22 = 0;
    }
    if (self->_score <= 3 && (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") < 1)
    {
      v24 = 0;
      if (v22)
      {
LABEL_49:

        if (v21 >= 1)
          goto LABEL_50;
LABEL_54:

        if (v24)
          goto LABEL_55;
LABEL_57:
        objc_msgSend(v8, "_setRoutedState:", 0);
        objc_msgSend(v8, "_setRoutingAction:", 3);
        -[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:](self, "_setManualRouteFlag:withManualRoute:", v6, 0);
        goto LABEL_58;
      }
    }
    else
    {
      v24 = objc_msgSend(v9, "intValue") != 200;
      if ((v22 & 1) != 0)
        goto LABEL_49;
    }
    if (v21 > 0)
    {
LABEL_50:
      if (!v24)
        goto LABEL_57;
LABEL_55:
      if ((objc_msgSend(v8, "otherTipiDeviceIsWatch") & 1) == 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceName"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceAddress"));
        v44 = objc_msgSend(v8, "productID");
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherTipiDeviceBTName"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v27));
        -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 5, v25, v26, v44, v28, 0, 20.0);

      }
      goto LABEL_57;
    }
    goto LABEL_54;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]", 30, "ReceivedOwnershipLost: No Wx address");
LABEL_92:

}

- (void)_removeTiPiState:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  OS_dispatch_source *phoneOwnershipTriangleTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1 || (v5 = _LogCategory_Initialize(&dword_10020FA58, 30), v4 = v14, v5))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _removeTiPiState:]", 30, "Evaluator: Delete tipi states.");
      v4 = v14;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingResponse"));

  if (v7)
  {
    v8 = objc_alloc_init((Class)BTAudioRoutingResponse);
    objc_msgSend(v8, "setAction:", 1);
    objc_msgSend(v8, "setDeviceAddress:", v14);
    objc_msgSend(v8, "setReason:", CFSTR("Tipi device should be routed"));
    objc_msgSend(v8, "setClientID:", objc_msgSend(v6, "audioRoutingClientID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingResponse"));
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v8, v9, v14);

  }
  objc_msgSend(v6, "_setOtherTipiDeviceInfo:andName:andVersion:", 0, 0, 0);
  objc_msgSend(v6, "_setOtherTipiAudioCategory:", 0);
  objc_msgSend(v6, "_setOtherTipiDeviceIsWatch:", 0);
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  if (phoneOwnershipTriangleTimer)
  {
    v11 = phoneOwnershipTriangleTimer;
    dispatch_source_cancel(v11);
    v12 = self->_phoneOwnershipTriangleTimer;
    self->_phoneOwnershipTriangleTimer = 0;

  }
  if (-[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count") == (id)1)
  {
    if (self->_pairedCompanionDeviceSupportsSmartRouting)
      v13 = 1;
    else
      v13 = 2;
    objc_msgSend(v6, "_setRoutingAction:", v13);
    -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
  }
  if (-[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count") == (id)1)
    -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v14, &stru_1001ED4C0, 0, 3);

}

- (void)_relayConduitMessageStartTimer:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD handler[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 3500000000);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10001E9DC;
  v21 = sub_10001E9EC;
  v22 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend((id)v18[5], "setConduitMessageTimer:", v9);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004AB28;
  handler[3] = &unk_1001E35D0;
  handler[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v17;
  v16 = 0x400C000000000000;
  v10 = v7;
  v11 = v6;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_source_set_timer(v9, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)_setOwnership:(id)a3 withHijackRequest:(id)a4 withOwnership:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  CBController *smartRoutingController;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  BTSmartRoutingDaemon *v20;
  id v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v10 = "no";
    if (v5)
      v10 = "yes";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setOwnership:withHijackRequest:withOwnership:]", 30, "Setting ownership for Wx %@ %s", v8, v10);
  }
  v11 = objc_alloc_init((Class)CBDeviceSettings);
  v12 = v11;
  if (v5)
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v11, "setRelinquishAudioRoute:", v13);
  v14 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v14, "setIdentifier:", v8);
  smartRoutingController = self->_smartRoutingController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004B07C;
  v18[3] = &unk_1001E35F8;
  v19 = v9;
  v20 = self;
  v21 = v8;
  v16 = v8;
  v17 = v9;
  -[CBController modifyDevice:settings:completion:](smartRoutingController, "modifyDevice:settings:completion:", v14, v12, v18);

}

- (void)_sendAudioCategory:(id)a3 withAudioCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned int v12;
  signed int v13;
  BOOL v14;
  _UNKNOWN **v15;
  char v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *myModel;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    v11 = objc_msgSend(v10, "otherTipiDeviceIsWatch");

    v12 = objc_msgSend(v9, "intValue");
    if (-[BTSmartRoutingSourceDevice incomingCallRingtone](self->_sourceDevice, "incomingCallRingtone"))
    {
      v13 = -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue");
      if (!-[BTSmartRoutingDaemon _isInHijackBlockingMode](self, "_isInHijackBlockingMode"))
      {
        v14 = v13 > 500;
        if (v12 == 401)
          v14 = v11;
        if (v14)
          goto LABEL_19;
LABEL_17:
        v15 = &off_1001F4590;
        goto LABEL_18;
      }
    }
    else if (!-[BTSmartRoutingDaemon _isInHijackBlockingMode](self, "_isInHijackBlockingMode"))
    {
      if (v12 == 401)
        v16 = v11;
      else
        v16 = 1;
      if ((v16 & 1) != 0)
        goto LABEL_19;
      goto LABEL_17;
    }
    v15 = &off_1001F4578;
LABEL_18:

    v9 = v15;
LABEL_19:
    v17 = CFSTR("YES");
    if (!self->_activityLevelMediaPlaying
      && (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") <= 0)
    {
      v17 = CFSTR("NO");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "otherTipiDeviceBTAddress"));

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:]", 30, "[Hijackv2] Send audio category through relay message via %@ to device %@ with score %d", v6, v20, objc_msgSend(v9, "integerValue"));
    }
    v26[0] = CFSTR("btAddress");
    v26[1] = CFSTR("btName");
    myModel = self->_myModel;
    v27[0] = v18;
    v27[1] = myModel;
    v26[2] = CFSTR("hostStreamingState");
    v26[3] = CFSTR("otherDeviceAudioCategory");
    v27[2] = v17;
    v27[3] = v9;
    v26[4] = CFSTR("playingApp");
    v22 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
    v23 = (void *)v22;
    v24 = CFSTR("NA");
    if (v22)
      v24 = (const __CFString *)v22;
    v27[4] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 5));

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v25, v6, v20);
    goto LABEL_29;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:]", 30, "[Hijackv2] Error: audioCategory is nil");
LABEL_29:

}

- (void)_sendAudioCategoryToAllTipiDevices
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  _QWORD v3[5];

  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004B52C;
  v3[3] = &unk_1001E3008;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)_sendTipiHealingRequest:(id)a3 andOtherTipiAddress:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  NSString *myModel;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  if (self->_tipiElectionInProgress)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sendTipiHealingRequest:andOtherTipiAddress:]", 30, "Evaluator: Tipi election in progress, Tipi healing attempt back off");
    }
  }
  else
  {
    self->_tipiElectionInProgress = 1;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sendTipiHealingRequest:andOtherTipiAddress:]", 30, "Evaluator: Initiating tipi healing request");
    }
    -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v6, v7, 0, 1);
    v8 = CFSTR("YES");
    if (!self->_activityLevelMediaPlaying)
    {
      if ((int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") <= 0)
        v8 = CFSTR("NO");
      else
        v8 = CFSTR("YES");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    v14[0] = CFSTR("tipiHealingAttempt");
    v14[1] = CFSTR("tipiHealingName");
    myModel = self->_myModel;
    v15[0] = v9;
    v15[1] = myModel;
    v14[2] = CFSTR("version");
    v14[3] = CFSTR("tipiHealingStreaming");
    v15[2] = &off_1001F3D38;
    v15[3] = v8;
    v14[4] = CFSTR("tipiHealingPreferMac");
    v11 = -[BTSmartRoutingDaemon _isManualConnection:](self, "_isManualConnection:", v6);
    v12 = CFSTR("Don't route for manual connection");
    if (!v11)
      v12 = CFSTR("YES");
    v15[4] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));
    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:](self, "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:", 1, v13, v6, v7);
    -[BTSmartRoutingDaemon _tipiHealingStartTimer:](self, "_tipiHealingStartTimer:", v6);

  }
}

- (void)_sendRouteReversedTipiEventForTipsSupport
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams discoverabilitySignal](BMStreams, "discoverabilitySignal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "source"));
  v5 = objc_msgSend(objc_alloc((Class)BMDiscoverabilitySignalEvent), "initWithIdentifier:bundleID:context:", CFSTR("com.apple.bluetooth.audio-reversed"), CFSTR("com.apple.cloudpaird"), 0);
  objc_msgSend(v4, "sendEvent:", v5);

  objc_autoreleasePoolPop(v2);
}

- (void)_sendAudioScoreChanged:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  _QWORD v8[6];
  BOOL v9;

  if (self->_startIdleTicks)
  {
    v5 = mach_absolute_time();
    v6 = UpTicksToSeconds(v5 - self->_startIdleTicks);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sendAudioScoreChanged:]", 30, "ProactiveRouting: I'm idle for %llus", v6);
    }
  }
  else
  {
    v6 = 0;
  }
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004B948;
  v8[3] = &unk_1001E3620;
  v8[4] = self;
  v8[5] = v6;
  v9 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v8);
}

- (void)_sendTipiScoreUpdateToWx
{
  CBController *v3;
  NSMutableDictionary *srDiscoveredDeviceMap;
  CBController *v5;
  _QWORD v6[5];
  CBController *v7;

  if (self->_isActiveHRMSession)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx]", 30, "SendTipiScoreToWx: Active HRM session, skip sending score to the buds");
    }
  }
  else
  {
    v3 = self->_smartRoutingController;
    if (!v3)
    {
      v3 = (CBController *)objc_alloc_init((Class)CBController);
      objc_storeStrong((id *)&self->_smartRoutingController, v3);
      -[CBController setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
    }
    srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004BC94;
    v6[3] = &unk_1001E3670;
    v6[4] = self;
    v7 = v3;
    v5 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](srDiscoveredDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

- (void)_setAutoRoute:(id)a3 withAutoRoute:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  CBController *smartRoutingController;
  _QWORD v12[5];

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)CBDeviceSettings);
  v8 = v7;
  if (v4)
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v7, "setAllowsAutoRoute:", v9);
  v10 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v10, "setIdentifier:", v6);

  smartRoutingController = self->_smartRoutingController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004BFE0;
  v12[3] = &unk_1001E2110;
  v12[4] = self;
  -[CBController modifyDevice:settings:completion:](smartRoutingController, "modifyDevice:settings:completion:", v10, v8, v12);

}

- (void)_setIsHiddenProperty:(id)a3 withIsHidden:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v6 = "no";
    if (v4)
      v6 = "yes";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setIsHiddenProperty:withIsHidden:]", 30, "Setting isHidden for Wx %@ %s", v11, v6);
  }
  v7 = objc_alloc_init((Class)CBDeviceSettings);
  v8 = v7;
  if (v4)
    v9 = 1;
  else
    v9 = 2;
  objc_msgSend(v7, "setAudioRouteHidden:", v9);
  v10 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v10, "setIdentifier:", v11);
  -[CBController modifyDevice:settings:completion:](self->_smartRoutingController, "modifyDevice:settings:completion:", v10, v8, &stru_1001E3690);

}

- (void)_setHighPriorityTag:(id)a3 withHighPriority:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  CBController *smartRoutingController;
  _QWORD v12[5];

  v6 = a3;
  v7 = objc_alloc_init((Class)CBDeviceSettings);
  v8 = v7;
  if (a4)
  {
    v9 = 80;
LABEL_5:
    objc_msgSend(v7, "setAclPriority:", v9);
    goto LABEL_6;
  }
  if (self->_highPriorityTagSent)
  {
    v9 = 1;
    goto LABEL_5;
  }
LABEL_6:
  v10 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v10, "setIdentifier:", v6);

  smartRoutingController = self->_smartRoutingController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004C2DC;
  v12[3] = &unk_1001E2110;
  v12[4] = self;
  -[CBController modifyDevice:settings:completion:](smartRoutingController, "modifyDevice:settings:completion:", v10, v8, v12);

}

- (void)_setManualRouteFlag:(id)a3 withManualRoute:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = objc_alloc_init((Class)CBDeviceSettings);
  objc_msgSend(v6, "setDeviceFlagsMask:", 0x400000);
  objc_msgSend(v6, "setDeviceFlagsValue:", v4);
  v7 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v7, "setIdentifier:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
  if (objc_msgSend(v8, "manuallyRouted"))
    objc_msgSend(v8, "_setManualRouteChangeInProgress:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11));
  objc_msgSend(v9, "_setManualRoute:", 0);

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v10 = "no";
    if (v4)
      v10 = "yes";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:]", 30, "Setting manual route flag %s", v10);
  }
  -[CBController modifyDevice:settings:completion:](self->_smartRoutingController, "modifyDevice:settings:completion:", v7, v6, &stru_1001E36B0);

}

- (void)_setOtherTipiDeviceBTAddress:(id)a3 andName:(id)a4 sourceVersion:(id)a5 withResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (self->_eligibleHeadset)
  {
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_eligibleHeadset, "bleDevice"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bluetoothAddress"));

      if (objc_msgSend(v15, "length") == (id)6)
      {
        v16 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(v15), "bytes")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v17));
          if (v18)
          {

          }
          else if (!-[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress"))
          {
            if (dword_10020FA58 <= 30
              && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
            {
              LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setOtherTipiDeviceBTAddress:andName:sourceVersion:withResult:]", 30, "Deleting SR Wx %@", v17);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", 0, v17);
          }
        }
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
      -[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:](self, "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:", v19);
      -[BTSmartRoutingDaemon _smartRoutingConnectToEligibleHeadset:](self, "_smartRoutingConnectToEligibleHeadset:", self->_eligibleHeadset);
    }
  }

}

- (void)_setPhase1ConnectConfig:(id)a3 andType:(int)a4
{
  uint64_t v4;
  const char *v6;
  SmartRoutingConnectConfig *phase1ConnectConfig;
  SmartRoutingConnectConfig *v8;
  SmartRoutingConnectConfig *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (v4 > 3)
      v6 = "?";
    else
      v6 = off_1001E3D08[(int)v4];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setPhase1ConnectConfig:andType:]", 30, "Setting phase1 connect Wx %@ type %s", v10, v6);
  }
  phase1ConnectConfig = self->_phase1ConnectConfig;
  if (!phase1ConnectConfig)
  {
    v8 = objc_alloc_init(SmartRoutingConnectConfig);
    v9 = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = v8;

    phase1ConnectConfig = self->_phase1ConnectConfig;
  }
  -[SmartRoutingConnectConfig setAddress:](phase1ConnectConfig, "setAddress:", v10);
  -[SmartRoutingConnectConfig setType:](self->_phase1ConnectConfig, "setType:", v4);

}

- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3 forDevice:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v6, "_setTipiAndRoutedStateFlags:", v4);

  -[AADeviceManagerDaemon smartRoutingStateUpdated:ForDeviceIdentifier:](self->_aaDeviceManagerDaemon, "smartRoutingStateUpdated:ForDeviceIdentifier:", v4, v7);
}

- (void)_setTipiElectionInProgress:(BOOL)a3
{
  self->_tipiElectionInProgress = a3;
}

- (void)_setIsFirstConnentionAfterSREnable:(BOOL)a3 forDevice:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setValue:forKey:", CFSTR("YES"), v13);

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setIsFirstConnentionAfterSREnable:forDevice:]", 30, "Marking _isFirstConnectionAfterSREnable as YES for %@ %@", v13, v9);

LABEL_13:
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v13));

    if (v10)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v13));
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setIsFirstConnentionAfterSREnable:forDevice:]", 30, "Marking _isFirstConnectionAfterSREnable as NO for %@ %@", v13, v12);

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable](self->_sourceDevice, "isFirstConnectionAfterSREnable"));
      objc_msgSend(v8, "removeObjectForKey:", v13);
      goto LABEL_13;
    }
  }

}

- (void)_setTipiElectionReceivedLePipe:(id)a3
{
  void *v4;
  NSString **p_tipiElectionReceivedLePipe;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", &stru_1001ED4C0))
    v4 = 0;
  else
    v4 = v6;
  p_tipiElectionReceivedLePipe = &self->_tipiElectionReceivedLePipe;
  objc_storeStrong((id *)p_tipiElectionReceivedLePipe, v4);
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:]", 30, "Setting legacy Tipi connect Wx %@", *p_tipiElectionReceivedLePipe);

}

- (void)_setTotalCountIDSDevices:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTSmartRoutingDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CB20;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_smartRoutingModeCheck:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BTSmartRoutingModeDevice *v8;
  unsigned int v9;
  id v10;
  void *v11;
  NSMutableDictionary *connectedDevicesSrModeCache;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "btAddressData"));
  v5 = CUPrintNSDataAddress();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v6));
  if (v7)
  {
    v8 = (BTSmartRoutingModeDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v6));
    v9 = -[BTSmartRoutingModeDevice mode](v8, "mode");
    if (objc_msgSend(v15, "smartRoutingMode") != v9)
    {
      if (v9 == 2)
      {
        if (objc_msgSend(v15, "smartRoutingMode") == 1)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingModeCheck:]", 30, "SR enabled for %@", v6);
          }
          -[BTSmartRoutingModeDevice setMode:](v8, "setMode:", 1);
          -[BTSmartRoutingModeDevice setEnableCount:](v8, "setEnableCount:", -[BTSmartRoutingModeDevice enableCount](v8, "enableCount") + 1);
          -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
        }
      }
      else if (v9 == 1)
      {
        if (objc_msgSend(v15, "smartRoutingMode") == 2)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _smartRoutingModeCheck:]", 30, "SR disabled for %@", v6);
          }
          -[BTSmartRoutingModeDevice setMode:](v8, "setMode:", 2);
          -[BTSmartRoutingModeDevice setDisableCount:](v8, "setDisableCount:", -[BTSmartRoutingModeDevice disableCount](v8, "disableCount") + 1);
          -[BTSmartRoutingDaemon _handleSmartRoutingDisabled:](self, "_handleSmartRoutingDisabled:", v6);
        }
      }
      else if (!(_BYTE)v9 && objc_msgSend(v15, "smartRoutingMode"))
      {
        v10 = objc_msgSend(v15, "smartRoutingMode");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v6));
        objc_msgSend(v11, "setMode:", v10);

      }
    }
  }
  else
  {
    v8 = objc_alloc_init(BTSmartRoutingModeDevice);
    -[BTSmartRoutingModeDevice setMode:](v8, "setMode:", objc_msgSend(v15, "smartRoutingMode"));
    -[BTSmartRoutingModeDevice setEnableCount:](v8, "setEnableCount:", 0);
    -[BTSmartRoutingModeDevice setDisableCount:](v8, "setDisableCount:", 0);
    connectedDevicesSrModeCache = self->_connectedDevicesSrModeCache;
    if (!connectedDevicesSrModeCache)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_connectedDevicesSrModeCache;
      self->_connectedDevicesSrModeCache = v13;

      connectedDevicesSrModeCache = self->_connectedDevicesSrModeCache;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](connectedDevicesSrModeCache, "setObject:forKeyedSubscript:", v8, v6);
  }

}

- (void)_startHighActivityLevelTimer:(unint64_t)a3
{
  void *v5;
  void *v6;
  const char *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *highActivityLevelTimer;
  NSObject *v10;
  _QWORD handler[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getInEarSrWxDevice](self, "_getInEarSrWxDevice"));
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]", 30, "ProactiveRouting: Start high acitivity timer with device %@", v5);
  if (objc_msgSend(v5, "proactiveRoutingBackoff"))
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]", 30, "ProactiveRouting: Skip, backoff for %@", v6);

    }
  }
  else if (v5 && !self->_highActivityLevelTimer)
  {
    if (objc_msgSend(v5, "otherTipiDeviceAudioScore") == 1
      || objc_msgSend(v5, "otherTipiDeviceAudioScore") == 2)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]", 30, "ProactiveRouting: Start high activity level timer with delay %us", a3);
      }
      v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      highActivityLevelTimer = self->_highActivityLevelTimer;
      self->_highActivityLevelTimer = v8;
      v10 = v8;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10004D110;
      handler[3] = &unk_1001E3108;
      handler[4] = self;
      handler[5] = a3;
      dispatch_source_set_event_handler(v10, handler);
      CUDispatchTimerSet(v10, (double)a3, -1.0, -10.0);
      dispatch_activate(v10);

    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v7 = sub_10001F2A8(objc_msgSend(v5, "otherTipiDeviceAudioScore"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]", 30, "ProactiveRouting: Skip, other Tipi device score %s", v7);
    }
  }

}

- (void)_startPhoneTriangleOwnershipTimer:(unint64_t)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *phoneOwnershipTriangleTimer;
  NSObject *v7;
  _QWORD handler[5];

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startPhoneTriangleOwnershipTimer:]", 30, "PhoneTriangleOwnershipTimer: Start timer with delay %us", a3);
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  self->_phoneOwnershipTriangleTimer = v5;
  v7 = v5;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004D2EC;
  handler[3] = &unk_1001E20E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  CUDispatchTimerSet(v7, (double)a3, -1.0, -10.0);
  dispatch_activate(v7);

}

- (void)_startAudioStateSnapshotTimer
{
  OS_dispatch_source **p_audioStateSnapshotTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  dispatch_source_t v6;
  _QWORD handler[5];

  p_audioStateSnapshotTimer = &self->_audioStateSnapshotTimer;
  if (!self->_audioStateSnapshotTimer
    && (-[NSMutableDictionary count](self->_wxDevices, "count")
     || -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"))
    && -[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn"))
  {
    if (*p_audioStateSnapshotTimer)
    {
      v4 = *p_audioStateSnapshotTimer;
      dispatch_source_cancel(v4);
      v5 = *p_audioStateSnapshotTimer;
      *p_audioStateSnapshotTimer = 0;

    }
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_audioStateSnapshotTimer, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004D500;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    if (v6)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startAudioStateSnapshotTimer]", 30, "AudioStateSnapshot: Start timer for nearby devices, count: %d", -[NSMutableDictionary count](self->_wxDevices, "count"));
      }
      CUDispatchTimerSet(v6, 1.0, 3.0, -10.0);
      dispatch_activate(v6);
    }
    else if (dword_10020FA58 <= 30
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startAudioStateSnapshotTimer]", 30, "AudioStateSnapshot: Fail to start timer");
    }

  }
}

- (void)_stopAudioStateSnapshotTimer:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  OS_dispatch_source *audioStateSnapshotTimer;
  NSObject *v7;
  OS_dispatch_source *v8;

  v3 = a3;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _stopAudioStateSnapshotTimer:]", 30, "AudioStateSnapshot: check Stop timer %d, %d", -[NSMutableDictionary count](self->_wxDevices, "count"), v3);
  if (-[NSMutableDictionary count](self->_wxDevices, "count"))
    v5 = !v3;
  else
    v5 = 0;
  if (!v5)
  {
    audioStateSnapshotTimer = self->_audioStateSnapshotTimer;
    if (audioStateSnapshotTimer)
    {
      v7 = audioStateSnapshotTimer;
      dispatch_source_cancel(v7);
      v8 = self->_audioStateSnapshotTimer;
      self->_audioStateSnapshotTimer = 0;

    }
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _stopAudioStateSnapshotTimer:]", 30, "AudioStateSnapshot: timer Stopped", -[NSMutableDictionary count](self->_wxDevices, "count"), v3);
    }
  }
}

- (void)_startManualRouteChangeDetectionTimer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteChangeDetectionTimer](self->_stats, "manualRouteChangeDetectionTimer"));
  v6 = v5;
  if (v5)
    dispatch_source_cancel(v5);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  -[SmartRoutingStats setManualRouteChangeDetectionTimer:](self->_stats, "setManualRouteChangeDetectionTimer:", v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004D718;
  v9[3] = &unk_1001E23E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_source_set_event_handler(v7, v9);
  CUDispatchTimerSet(v7, 4.0, -1.0, -10.0);
  dispatch_activate(v7);

}

- (void)_startPlaybackTimer
{
  OS_dispatch_source *playbackStartTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD handler[5];

  playbackStartTimer = self->_playbackStartTimer;
  if (playbackStartTimer)
  {
    v4 = playbackStartTimer;
    dispatch_source_cancel(v4);
    v5 = self->_playbackStartTimer;
    self->_playbackStartTimer = 0;

  }
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v7 = self->_playbackStartTimer;
  self->_playbackStartTimer = v6;
  v8 = v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004D864;
  handler[3] = &unk_1001E20E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet(v8, 0.5, -1.0, -10.0);
  dispatch_activate(v8);

}

- (void)_startRouteChangeDetectionTimer:(id)a3 andAnswer:(int64_t)a4
{
  id v6;
  OS_dispatch_source *routeChangeDetectionTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  id v13;
  _QWORD handler[5];
  id v15;
  int64_t v16;

  v6 = a3;
  routeChangeDetectionTimer = self->_routeChangeDetectionTimer;
  if (routeChangeDetectionTimer)
  {
    v8 = routeChangeDetectionTimer;
    dispatch_source_cancel(v8);
    v9 = self->_routeChangeDetectionTimer;
    self->_routeChangeDetectionTimer = 0;

  }
  v10 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v11 = self->_routeChangeDetectionTimer;
  self->_routeChangeDetectionTimer = v10;
  v12 = v10;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004D9C8;
  handler[3] = &unk_1001E3460;
  handler[4] = self;
  v15 = v6;
  v16 = a4;
  v13 = v6;
  dispatch_source_set_event_handler(v12, handler);
  CUDispatchTimerSet(v12, 5.0, -1.0, -10.0);
  dispatch_activate(v12);

}

- (void)_startRouteCheckTimer:(id)a3 andType:(int)a4
{
  id v6;
  NSObject *v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  id v13;
  _QWORD handler[5];
  id v15;
  int v16;

  v6 = a3;
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v8 = 0.0;
  switch(a4)
  {
    case 1:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckOwnLostTimer](self->_stats, "routeCheckOwnLostTimer"));
      -[SmartRoutingStats setRouteCheckOwnLostTimer:](self->_stats, "setRouteCheckOwnLostTimer:", v7);

      goto LABEL_3;
    case 2:
LABEL_3:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckOwnLostTimer](self->_stats, "falseRouteCheckOwnLostTimer"));
      -[SmartRoutingStats setFalseRouteCheckOwnLostTimer:](self->_stats, "setFalseRouteCheckOwnLostTimer:", v7);

      goto LABEL_4;
    case 4:
LABEL_4:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckForceDisconnectTimer](self->_stats, "falseRouteCheckForceDisconnectTimer"));
      -[SmartRoutingStats setFalseRouteCheckForceDisconnectTimer:](self->_stats, "setFalseRouteCheckForceDisconnectTimer:", v7);
      goto LABEL_11;
    case 5:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckHijackTimer](self->_stats, "routeCheckHijackTimer"));
      -[SmartRoutingStats setRouteCheckHijackTimer:](self->_stats, "setRouteCheckHijackTimer:", v7);
      goto LABEL_24;
    case 6:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckHijackTimer](self->_stats, "falseRouteCheckHijackTimer"));
      -[SmartRoutingStats setFalseRouteCheckHijackTimer:](self->_stats, "setFalseRouteCheckHijackTimer:", v7);
      goto LABEL_11;
    case 8:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckHijackAwayTimer](self->_stats, "falseRouteCheckHijackAwayTimer"));
      -[SmartRoutingStats setFalseRouteCheckHijackAwayTimer:](self->_stats, "setFalseRouteCheckHijackAwayTimer:", v7);
      -[SmartRoutingStats setReverseRouteReason:](self->_stats, "setReverseRouteReason:", 0);
      goto LABEL_12;
    case 9:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckOnDemandTimer](self->_stats, "routeCheckOnDemandTimer"));
      -[SmartRoutingStats setRouteCheckOnDemandTimer:](self->_stats, "setRouteCheckOnDemandTimer:", v7);
      goto LABEL_24;
    case 10:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckOnDemandTimer](self->_stats, "falseRouteCheckOnDemandTimer"));
      -[SmartRoutingStats setFalseRouteCheckOnDemandTimer:](self->_stats, "setFalseRouteCheckOnDemandTimer:", v7);
      goto LABEL_11;
    case 12:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckProactiveRoutingTimer](self->_stats, "falseRouteCheckProactiveRoutingTimer"));
      -[SmartRoutingStats setFalseRouteCheckProactiveRoutingTimer:](self->_stats, "setFalseRouteCheckProactiveRoutingTimer:", v7);
LABEL_11:
      -[SmartRoutingStats setFalseRouteCheckReason:](self->_stats, "setFalseRouteCheckReason:", 0);
LABEL_12:
      v8 = 25.0;
      if (v11)
        goto LABEL_13;
      break;
    case 13:
      v11 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckInUseBannerTimer](self->_stats, "routeCheckInUseBannerTimer"));
      -[SmartRoutingStats setRouteCheckInUseBannerTimer:](self->_stats, "setRouteCheckInUseBannerTimer:", v7);
LABEL_24:
      v8 = 5.0;
      if (!v11)
        break;
LABEL_13:
      dispatch_source_cancel(v11);

      break;
    default:
      break;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (a4 > 0xE)
      v12 = "?";
    else
      v12 = off_1001E3D28[a4];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startRouteCheckTimer:andType:]", 30, "Start route check timer for Wx %@ type %s timeout %fs score %u", v6, v12, *(_QWORD *)&v8, -[SmartRoutingStats hijackScore](self->_stats, "hijackScore"));
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004DD28;
  handler[3] = &unk_1001E2800;
  v16 = a4;
  handler[4] = self;
  v15 = v6;
  v13 = v6;
  dispatch_source_set_event_handler(v7, handler);
  CUDispatchTimerSet(v7, v8, -1.0, -10.0);
  dispatch_activate(v7);

}

- (void)_startTipiHealing:(id)a3 withLastConnect:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *v22;
  unsigned __int16 *v23;
  BOOL v24;
  void *v25;
  unsigned __int16 *v26;
  BOOL v27;
  uint64_t *v28;
  id v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *nearbyInfoDevices;
  id v33;
  id v34;
  id obj;
  BTSmartRoutingDaemon *v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];

  v34 = a3;
  v6 = a4;
  if (!v6)
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]", 90, "Evaluator: Failed to tipi healing, invalid lastConnected device address");
    }
    goto LABEL_51;
  }
  if (-[BTSmartRoutingDaemon _isMyAddress:](self, "_isMyAddress:", v6))
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]", 30, "Evaluator: Wx is advertising my address, back off");
    }
    goto LABEL_51;
  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_10001E9DC;
  v48 = sub_10001E9EC;
  v49 = 0;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v36 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (!v8)
    goto LABEL_47;
  v9 = *(_QWORD *)v41;
  obj = v7;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v41 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceID"));
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]", 30, "Evaluator: Tipi healing PD %@ idsId %@", v11, v12);

      }
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "btAddressData")));
      v14 = (char *)objc_msgSend(v13, "bytes");
      v15 = CUPrintNSDataAddress(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:](v36, "_nearbyMacAddressTranslate:", v17));

      v19 = objc_retainAutorelease(v18);
      v20 = (char *)objc_msgSend(v19, "bytes");
      v21 = CUPrintNSDataAddress(v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]", 30, "Evaluator: Tipi healing comparing, Wx lastConnect: %@, PdAddr %@ transAddr %@", v6, v16, v22);
      }
      if (v13
        && ((v23 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v6), "bytes"),
             *v23 == *(unsigned __int16 *)(v14 + 3))
          ? (v24 = *((unsigned __int8 *)v23 + 2) == v14[5])
          : (v24 = 0),
            v25 = v16,
            v24)
        || v19
        && ((v26 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v6), "bytes"),
             *v26 == *(unsigned __int16 *)(v20 + 3))
          ? (v27 = *((unsigned __int8 *)v26 + 2) == v20[5])
          : (v27 = 0),
            v25 = v22,
            v27))
      {
        v28 = v45;
        v29 = v25;
        v30 = (void *)v28[5];
        v28[5] = (uint64_t)v29;

      }
      v31 = v45[5];
      if (v31)
      {
        if (dword_10020FA58 <= 30)
        {
          if (dword_10020FA58 == -1)
          {
            if (!_LogCategory_Initialize(&dword_10020FA58, 30))
              goto LABEL_46;
            v31 = v45[5];
          }
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]", 30, "Evaluator: Tipi healing found via PD %@", v31);
        }
LABEL_46:

        v7 = obj;
        goto LABEL_47;
      }

    }
    v7 = obj;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v8)
      continue;
    break;
  }
LABEL_47:

  if (v45[5])
    goto LABEL_49;
  nearbyInfoDevices = v36->_nearbyInfoDevices;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10004E2E0;
  v37[3] = &unk_1001E36D8;
  v37[4] = v36;
  v33 = v6;
  v38 = v33;
  v39 = &v44;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v37);

  if (v45[5])
  {
LABEL_49:
    -[BTSmartRoutingDaemon _sendTipiHealingRequest:andOtherTipiAddress:](v36, "_sendTipiHealingRequest:andOtherTipiAddress:", v34);
  }
  else if (dword_10020FA58 <= 90
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]", 90, "Evaluator: Tipi healing address not found for %@", v33);
  }
  _Block_object_dispose(&v44, 8);

LABEL_51:
}

- (void)_startTipiSetupTicks
{
  self->_tipiSetupTicks = mach_absolute_time();
}

- (void)_submitMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  const char *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[7];
  _QWORD v56[7];
  _QWORD v57[11];
  _QWORD v58[11];
  _QWORD v59[8];
  _QWORD v60[8];

  v4 = a3;
  v59[0] = CFSTR("nearbyAction");
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nearbyBannerActionCount));
  v60[0] = v52;
  v59[1] = CFSTR("nearbyIgnored");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nearbyBannerTimeoutCount));
  v60[1] = v5;
  v59[2] = CFSTR("connectIgnored");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_connectedBannerTimeoutCount));
  v60[2] = v6;
  v59[3] = CFSTR("connectDismissed");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_connectedBannerDismissedCount));
  v60[3] = v7;
  v59[4] = CFSTR("reverseAudioIgnored");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_reverseBannerTimeoutCount));
  v60[4] = v8;
  v59[5] = CFSTR("reverseAudioAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_reverseBannerActionCount));
  v60[5] = v9;
  v59[6] = CFSTR("wxPD");
  v48 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "productID")));
  v60[6] = v10;
  v59[7] = CFSTR("wxBuildVersion");
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firmwareVersion"));
  v12 = (void *)v11;
  v13 = &stru_1001ED4C0;
  if (v11)
    v13 = (const __CFString *)v11;
  v60[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 8));
  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRoutingUI"), v14);

  v57[0] = CFSTR("nearbyRouting");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nearbyBannerRouting));
  v58[0] = v53;
  v57[1] = CFSTR("autoRoutingSingle");
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_autoRoutingSingle));
  v58[1] = v50;
  v57[2] = CFSTR("autoRoutingTipi");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_autoRoutingTipi));
  v58[2] = v49;
  v57[3] = CFSTR("autoRoutingHijack");
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_autoRoutingHijack));
  v58[3] = v47;
  v57[4] = CFSTR("autoRoutingHijackError");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_autoRoutingHijackError));
  v58[4] = v15;
  v57[5] = CFSTR("reverseRouting");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_reverseRoutingCount));
  v58[5] = v16;
  v57[6] = CFSTR("routingManual");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_routingManualCount));
  v58[6] = v17;
  v57[7] = CFSTR("wxPD");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v48, "productID")));
  v58[7] = v18;
  v57[8] = CFSTR("fakeHfpSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_fakeHfpSessionCount));
  v58[8] = v19;
  v57[9] = CFSTR("fakeHfpSessionReject");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_fakeHfpSessionRejectCount));
  v58[9] = v20;
  v57[10] = CFSTR("wxBuildVersion");
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firmwareVersion"));
  v22 = (void *)v21;
  v23 = &stru_1001ED4C0;
  if (v21)
    v23 = (const __CFString *)v21;
  v58[10] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 11));
  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRoutingAudioRouting"), v24);

  v25 = v48;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "btAddressData"));
  v27 = CUPrintNSDataAddress(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v28));
    v30 = objc_msgSend(v29, "mode");
    if (v30 > 2)
      v31 = "?";
    else
      v31 = off_1001E3DA0[v30];
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v28));
    v34 = objc_msgSend(v33, "mode");

    if (v34 == 1)
    {
      v35 = 1;
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v28));
      v37 = objc_msgSend(v36, "mode");

      if (v37 == 2)
        v35 = 4294957297;
      else
        v35 = 0;
    }
    v55[0] = CFSTR("enableSR");
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v28));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v54, "enableCount")));
    v56[0] = v51;
    v55[1] = CFSTR("disableSR");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevicesSrModeCache, "objectForKeyedSubscript:", v28));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v38, "disableCount")));
    v56[1] = v39;
    v56[2] = v32;
    v55[2] = CFSTR("mode");
    v55[3] = CFSTR("modeOffset");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v35));
    v56[3] = v40;
    v55[4] = CFSTR("srCapable");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_prefSmartRoutingEnabledPhase3));
    v56[4] = v41;
    v55[5] = CFSTR("wxBuildVersion");
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firmwareVersion"));
    v43 = (void *)v42;
    v44 = &stru_1001ED4C0;
    if (v42)
      v44 = (const __CFString *)v42;
    v56[5] = v44;
    v55[6] = CFSTR("wxPD");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v48, "productID")));
    v56[6] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 7));
    CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRoutingMode"), v46);

    v25 = v48;
  }
  *(_QWORD *)&self->_nearbyBannerActionCount = 0;
  *(_QWORD *)&self->_connectedBannerDismissedCount = 0;
  *(_QWORD *)&self->_reverseBannerActionCount = 0;
  self->_nearbyBannerRouting = 0;
  self->_autoRoutingSingle = 0;
  *(_QWORD *)&self->_autoRoutingTipi = 0;
  self->_autoRoutingHijackError = 0;
  self->_reverseRoutingCount = 0;
  self->_routingManualCount = 0;
  *(_QWORD *)&self->_fakeHfpSessionCount = 0;

}

- (void)_submitMetricNearby:(unsigned int)a3
{
  BTSmartRoutingNearbyStats *nearByStats;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[4];

  nearByStats = self->_nearByStats;
  if (nearByStats)
  {
    v5 = *(_QWORD *)&a3;
    v11[0] = CFSTR("noNB");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[BTSmartRoutingNearbyStats noNearbyDeviceFoundCount](nearByStats, "noNearbyDeviceFoundCount")));
    v12[0] = v6;
    v11[1] = CFSTR("nbTp");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[BTSmartRoutingNearbyStats nearbyDeviceNoTipiScoreCount](self->_nearByStats, "nearbyDeviceNoTipiScoreCount")));
    v12[1] = v7;
    v11[2] = CFSTR("wxPD");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
    v12[2] = v8;
    v11[3] = CFSTR("FDBT");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[BTSmartRoutingNearbyStats SRConnectedSetCount](self->_nearByStats, "SRConnectedSetCount")));
    v12[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
    CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.backOff"), v10);

    -[BTSmartRoutingNearbyStats setNoNearbyDeviceFoundCount:](self->_nearByStats, "setNoNearbyDeviceFoundCount:", 0);
    -[BTSmartRoutingNearbyStats setNearbyDeviceNoTipiScoreCount:](self->_nearByStats, "setNearbyDeviceNoTipiScoreCount:", 0);
    -[BTSmartRoutingNearbyStats setSRConnectedSetCount:](self->_nearByStats, "setSRConnectedSetCount:", 0);
    -[BTSmartRoutingNearbyStats setMinRSSIHeadset:](self->_nearByStats, "setMinRSSIHeadset:", 0);
  }
}

- (void)_submitMetricTipiHealingforDevice:(id)a3 withDuration:(double)a4 andLegacy:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  _BOOL8 v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[8];
  _QWORD v31[8];

  v5 = a5;
  v8 = a3;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceAddress"));
  v9 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:"));
  v10 = (void *)v9;
  v11 = &stru_1001ED4C0;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherTipiDeviceBTName"));
  v14 = (void *)v13;
  v15 = CFSTR("Null");
  if (v13)
    v15 = (__CFString *)v13;
  v16 = v15;

  LODWORD(v17) = vcvtpd_s64_f64(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(a4 * 1000.0)));
  if (a4 > 10.0
    && dword_10020FA58 <= 90
    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    v20 = "yes";
    if (v5)
      v20 = "no";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:]", 90, "### Tipi healing duration %@ is larger than 10s, isV2 %s", v18, v20);
  }
  v21 = -[SmartRoutingStats mediaPlaying](self->_stats, "mediaPlaying")
     || -[SmartRoutingStats callConnected](self->_stats, "callConnected");
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v22 = "yes";
    if (v5)
      v23 = "no";
    else
      v23 = "yes";
    if (!v21)
      v22 = "no";
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:]", 30, "Submit TiPiHealing stats, duration: %@s, TH V2: %s, audio playing: %s", v18, v23, v22);
  }
  v30[0] = CFSTR("Thv2");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", !v5));
  v31[0] = v24;
  v31[1] = v18;
  v30[1] = CFSTR("duration");
  v30[2] = CFSTR("durationMS");
  v31[2] = v19;
  v30[3] = CFSTR("isPlaying");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v21));
  v31[3] = v25;
  v31[4] = v16;
  v30[4] = CFSTR("otherTiPiDevice");
  v30[5] = CFSTR("tipiV2Eligible");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isTipiHealingV2Eligible")));
  v31[5] = v26;
  v31[6] = v12;
  v30[6] = CFSTR("wxBuildVersion");
  v30[7] = CFSTR("wxPD");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "productID")));
  v31[7] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 8));
  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.TiPiHealing"), v28);

}

- (void)_submitManualRouteDetectionMetric:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = a3;
  v5 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v4));

  v8 = &stru_1001ED4C0;
  if (v7)
    v8 = v7;
  v9 = v8;

  v10 = mach_absolute_time();
  v11 = UpTicksToSeconds(v10 - self->_hijackAcceptedTime);
  if (objc_msgSend(v6, "containsString:", CFSTR("Speaker"))
    && dword_10020FA58 <= 30
    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _submitManualRouteDetectionMetric:]", 30, "Route check after manual routing action is Speaker");
  }
  v17[0] = v6;
  v16[0] = CFSTR("route");
  v16[1] = CFSTR("srCapable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_prefSmartRoutingEnabledPhase3));
  v17[1] = v12;
  v16[2] = CFSTR("wxProductID");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
  v17[2] = v13;
  v16[3] = CFSTR("timeSinceLastHijack");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
  v16[4] = CFSTR("wxFWVersion");
  v17[3] = v14;
  v17[4] = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 5));

  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.ManualRoute"), v15);
}

- (void)_submitRouteChangeDetectionMetric:(id)a3 andAnswer:(int64_t)a4
{
  const char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];

  if ((unint64_t)(a4 - 1) > 3)
    v5 = "?";
  else
    v5 = off_1001E3DB8[a4 - 1];
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  v8 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _submitRouteChangeDetectionMetric:andAnswer:]", 30, "Route check after hijack %@ for %ds current route %@", v7, 5, v9);
  v12[0] = CFSTR("hijackAnswer");
  v12[1] = CFSTR("route");
  v13[0] = v7;
  v13[1] = v9;
  v12[2] = CFSTR("wxProductID");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
  v13[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRouting.hijackRouteDetection"), v11);

}

- (BOOL)_supportsSR:(id)a3 andProductID:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t DeviceClass;
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v6 = -[BTSmartRoutingDaemon _supportsTipi:](self, "_supportsTipi:", a3);
  if (v6)
    return 1;
  DeviceClass = GestaltGetDeviceClass(v6, v7);
  if ((_DWORD)DeviceClass == 1 || GestaltGetDeviceClass(DeviceClass, v10) == 6)
    return -[BTSmartRoutingDaemon _supportsPhoneWatchTipi:](self, "_supportsPhoneWatchTipi:", v4);
  else
    return 0;
}

- (BOOL)_supportsTipi:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "btAddressData"));
        v13 = CUPrintNSDataAddress(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        if (v4 && v14 && objc_msgSend(v4, "isEqualToString:", v14))
          v8 |= ((unint64_t)objc_msgSend(v11, "deviceFlags") >> 4) & 1;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)_supportsPhoneWatchTipi:(unsigned int)a3
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  uint64_t v6;

  v3 = a3 - 8194;
  if (a3 - 8194 <= 0xE)
    v4 = (0x3F64u >> (a3 - 2)) & 1;
  else
    LOBYTE(v4) = 1;
  v5 = v3 > 0x22;
  v6 = (1 << v3) & 0x47A877F9BLL;
  if (v5 || v6 == 0)
    return 0;
  else
    return v4;
}

- (void)_setTipiElectionType:(BOOL)a3 withDevice:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  SFDevice *lePipeDevice;
  int v9;
  SFDevice *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  v11 = v6;
  if (v4)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setTipiElectionType:withDevice:]", 30, "Start Phase1 TiPi connection");
    }
    self->_tipiElectionThroughLEPipe = 0;
    lePipeDevice = self->_lePipeDevice;
    self->_lePipeDevice = 0;
  }
  else
  {
    v7 = v6;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1 || (v9 = _LogCategory_Initialize(&dword_10020FA58, 30), v7 = v11, v9))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setTipiElectionType:withDevice:]", 30, "Start LE Pipe TiPi connection");
        v7 = v11;
      }
    }
    self->_tipiElectionThroughLEPipe = 1;
    v10 = v7;
    lePipeDevice = self->_lePipeDevice;
    self->_lePipeDevice = v10;
  }

}

- (void)_tipiHealingAttempt
{
  NSMutableDictionary *smartRoutingWxDeviceMap;
  const char *v4;
  void *v5;
  unsigned int v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10001E9DC;
  v18 = sub_10001E9EC;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10001E9DC;
  v12 = sub_10001E9EC;
  v13 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004FB5C;
  v7[3] = &unk_1001E3700;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (v9[5])
  {
    if (v15[5])
    {
      if (-[BTSmartRoutingDaemon _lastConnectIsWatchCheck:](self, "_lastConnectIsWatchCheck:"))
      {
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          v4 = "Evaluator: Skip tipi healing, lastConnected device address is Watch";
LABEL_14:
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealingAttempt]", 30, v4);
        }
      }
      else
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v9[5]));
        v6 = objc_msgSend(v5, "tipiHealingBackoff");

        if (v6)
        {
          if (dword_10020FA58 <= 30
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
          {
            v4 = "Tipi healing backoff for ongoing FD";
            goto LABEL_14;
          }
        }
        else
        {
          -[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:](self, "_startTipiHealing:withLastConnect:", v9[5], v15[5]);
        }
      }
    }
    else if (dword_10020FA58 <= 90
           && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealingAttempt]", 90, "Unable to heal Tipi, lastConnected device address is not valid.");
    }
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (void)_tipiHealing:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v33;
  OS_dispatch_source *v34;
  OS_dispatch_source *tipiHealingTimer;
  NSObject *v36;
  OS_dispatch_source *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  unsigned int v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  _UNKNOWN **v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  unsigned int v54;
  BTSmartRoutingDaemon *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v6));
  if (objc_msgSend(CFSTR("5A187"), "compare:options:", v8, 64) == (id)1)
  {
    objc_msgSend(v9, "setIsTipiHealingV2Eligible:", 0);
    if (dword_10020FA58 <= 60
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 60)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 60, "###TipiTableEvent: Skip tipi healing, wx fw version is %@ < %@", v8, CFSTR("5A187"));
    }
    -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
    goto LABEL_59;
  }
  if (self->_prefSmartRoutingWatchAutomaticSwitching
    && -[BTSmartRoutingDaemon _isMagnetConnectedDeviceforTipiHealingCheck:](self, "_isMagnetConnectedDeviceforTipiHealingCheck:", v7))
  {
    if (self->_pairedCompanionDeviceSupportsSmartRouting)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRPairedDeviceRegistry getActivePairedDevice](self->_NRRegistry, "getActivePairedDevice"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", NRDevicePropertyProductType));
      v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("Watch"));
      v13 = CFSTR("iPhone");
      if (v12)
        v13 = CFSTR("Watch");
      v14 = v13;
      v15 = -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](self, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v6, v7, v14, &off_1001F3D38);
      if (dword_10020FA58 <= 30)
      {
        if (dword_10020FA58 != -1 || (v15 = (id)_LogCategory_Initialize(&dword_10020FA58, 30), (_DWORD)v15))
          v15 = (id)LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 30, "TipiTableEvent: the other device is magnet paired device; Tipi healing attempt succeeded! Booyaaa!"
                      "!! update the other tipi address %@, name %@, TiPi Version %@",
                      v7,
                      v14,
                      &off_1001F3D38);
      }
      if (GestaltGetDeviceClass(v15, v16) == 1)
        objc_msgSend(v9, "_setOtherTipiDeviceIsWatch:", 1);
      -[BTSmartRoutingDaemon _tipihHealingV2Handling:](self, "_tipihHealingV2Handling:", v6);

    }
    goto LABEL_59;
  }
  v55 = self;
  v58 = v6;
  v59 = v9;
  v57 = v8;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v56 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.icloudpairing"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "devices"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (!v18)
    goto LABEL_54;
  v19 = v18;
  v20 = *(_QWORD *)v69;
  while (2)
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v69 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "publicAddressForIDSDevice:", v24));

      if (v25 && objc_msgSend(v25, "isEqualToString:", v7))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productName"));
        if (!objc_msgSend(v26, "isEqualToString:", CFSTR("iPhone OS"))
          || v22 && (objc_msgSend(v22, "operatingSystemVersion"), v67 >= 16))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelIdentifier"));
          if ((objc_msgSend(v27, "containsString:", CFSTR("Mac")) & 1) == 0)
          {

            goto LABEL_33;
          }
          if (v22)
          {
            objc_msgSend(v22, "operatingSystemVersion");

            if (v66 < 13)
            {
LABEL_44:
              objc_msgSend(v59, "setIsTipiHealingV2Eligible:", 0);
              if (dword_10020FA58 <= 60
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 60)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 60, "###TipiTableEvent: Skip tipi healing, other source device is not running eligible software; Use legacy Tipi Healing");
              }
              -[BTSmartRoutingDaemon _tipiHealingAttempt](v55, "_tipiHealingAttempt");
LABEL_53:

              goto LABEL_54;
            }
LABEL_33:
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productName"));
            v29 = objc_msgSend(v28, "hasPrefix:", CFSTR("Watch"));

            if (v29)
            {
              if (dword_10020FA58 <= 60
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 60)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 60, "###TipiTableEvent: Skip tipi healing, lastConnected device address is Watch");
              }
              goto LABEL_53;
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelIdentifier"));
            v31 = objc_msgSend(v30, "hasPrefix:", CFSTR("AppleTV"));

            if (v31)
            {
              if (dword_10020FA58 <= 60
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 60)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 60, "###TipiTableEvent: Skip tipi healing, other source is AppleTV");
              }
              goto LABEL_53;
            }
            if (objc_msgSend(v59, "tipiHealingBackoff"))
            {
              if (dword_10020FA58 <= 60
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 60)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 60, "###TipiTableEvent: Skip tipi healing, backoff for ongoing FD");
              }
              goto LABEL_53;
            }
            nearbyInfoDevicesTriangleRecoveryTimer = v55->_nearbyInfoDevicesTriangleRecoveryTimer;
            if (nearbyInfoDevicesTriangleRecoveryTimer)
            {
              v33 = nearbyInfoDevicesTriangleRecoveryTimer;
              dispatch_source_cancel(v33);
              v34 = v55->_nearbyInfoDevicesTriangleRecoveryTimer;
              v55->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

            }
            tipiHealingTimer = v55->_tipiHealingTimer;
            if (!tipiHealingTimer)
            {
LABEL_77:
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelIdentifier"));
              v39 = CFSTR("Mac");
              if ((objc_msgSend(v38, "containsString:", CFSTR("Mac")) & 1) == 0)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelIdentifier"));
                v41 = objc_msgSend(v40, "hasPrefix:", CFSTR("iPad"));
                v42 = CFSTR("iPhone");
                if (v41)
                  v42 = CFSTR("iPad");
                v39 = v42;

              }
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelIdentifier"));
              v54 = objc_msgSend(v43, "containsString:", CFSTR("Mac"));

              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productName"));
              if (objc_msgSend(v44, "isEqualToString:", CFSTR("iPhone OS")))
              {
                if (v22)
                {
                  objc_msgSend(v22, "operatingSystemVersion");
                  if (v65 >= 17)
                  {

                    goto LABEL_88;
                  }
                }
              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelIdentifier"));
              if (objc_msgSend(v45, "containsString:", CFSTR("Mac")))
              {
                if (v22)
                {
                  objc_msgSend(v22, "operatingSystemVersion");

                  if (v64 < 14)
                  {
                    v46 = &off_1001F3D48;
                    goto LABEL_94;
                  }
LABEL_88:
                  v46 = &off_1001F3D38;
LABEL_94:
                  -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](v55, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v6, v7, v39, v46);
                  goto LABEL_95;
                }

                -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](v55, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v6, v7, v39, &off_1001F3D48);
              }
              else
              {

                v46 = &off_1001F3D48;
                -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](v55, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v6, v7, v39, &off_1001F3D48);
                if (v22)
                {
LABEL_95:
                  objc_msgSend(v22, "operatingSystemVersion");
                  v48 = v63;
                  objc_msgSend(v22, "operatingSystemVersion");
                  v49 = 0;
                  v47 = v62;
LABEL_96:
                  objc_msgSend(v59, "_setOtherTipiDeviceBuildVersion:andMinorBuildVersion:", v48, v47);
                  if (dword_10020FA58 <= 30
                    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
                  {
                    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productName"));
                    if ((v49 & 1) != 0)
                    {
                      v51 = 0;
                      v52 = 0;
                    }
                    else
                    {
                      objc_msgSend(v22, "operatingSystemVersion");
                      v52 = v61;
                      objc_msgSend(v22, "operatingSystemVersion");
                      v51 = v60;
                    }
                    v53 = "no";
                    if (v54)
                      v53 = "yes";
                    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 30, "TipiTableEvent: Tipi healing attempt succeeded! Booyaaa!!! update the other tipi address %@, name %@, TiPi Version %@, model %@ build %d.%d, otherIsMac %s", v7, v39, v46, v50, v52, v51, v53);

                  }
                  -[BTSmartRoutingDaemon _tipihHealingV2Handling:](v55, "_tipihHealingV2Handling:", v58);

                  goto LABEL_53;
                }
              }
              v47 = 0;
              v48 = 0;
              v49 = 1;
              v46 = &off_1001F3D48;
              goto LABEL_96;
            }
            if (dword_10020FA58 >= 31)
            {
              v36 = tipiHealingTimer;
            }
            else
            {
              if (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]", 30, "TipiTableEvent: Cancel legacy Tipi healing timer");
              v36 = v55->_tipiHealingTimer;
              if (!v36)
                goto LABEL_76;
            }
            dispatch_source_cancel(v36);
            v37 = v55->_tipiHealingTimer;
            v55->_tipiHealingTimer = 0;

LABEL_76:
            v55->_tipiElectionInProgress = 0;
            goto LABEL_77;
          }

        }
        goto LABEL_44;
      }

    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v19)
      continue;
    break;
  }
LABEL_54:

  v8 = v57;
  v6 = v58;
  v9 = v59;
LABEL_59:

}

- (void)_tipihHealingV2Handling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  char v25;
  unsigned int v26;
  int v27;
  void **p_vtable;
  void *v29;
  OS_dispatch_source *nearbyInfoDevicesTriangleRecoveryTimer;
  NSObject *v31;
  OS_dispatch_source *v32;
  OS_dispatch_source *tipiHealingTimer;
  int v34;
  OS_dispatch_source *v35;
  OS_dispatch_source *v36;
  OS_dispatch_source *tipiHealingHijackTimer;
  NSObject *v38;
  OS_dispatch_source *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void **v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  double v54;
  int v55;
  unsigned int v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  char v63;
  unsigned int v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;

  v4 = a3;
  -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v4));
  if (self->_activityLevelMediaPlaying
    || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") > 0)
  {
    LODWORD(v7) = 1;
  }
  else
  {
    LODWORD(v7) = -[NSString isEqualToString:](self->_cdDeviceIdentifier, "isEqualToString:", v4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v8));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zeroSourceLastRouteHost"));

  v65 = (void *)v10;
  v64 = -[BTSmartRoutingDaemon _isMyAddress:](self, "_isMyAddress:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v4));
  v12 = objc_msgSend(v11, "userConnectedState");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
  if (objc_msgSend(v13, "audioStreamState"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v4));
    v15 = (int)objc_msgSend(v14, "audioStreamState") > 1;

  }
  else
  {
    v15 = 1;
  }

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    if (self->_isBTRoute)
      v16 = "yes";
    else
      v16 = "no";
    if ((_DWORD)v7)
      v17 = "yes";
    else
      v17 = "no";
    v61 = v17;
    v62 = v16;
    if (v64)
      v18 = "yes";
    else
      v18 = "no";
    v60 = v18;
    if (objc_msgSend(v5, "lastPlay"))
      v19 = "yes";
    else
      v19 = "no";
    v59 = v19;
    v63 = (char)v7;
    v7 = v8;
    if (objc_msgSend(v5, "otherTipiDeviceLastPlay"))
      v20 = "yes";
    else
      v20 = "no";
    if (v15)
      v21 = "yes";
    else
      v21 = "no";
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v4));
    if (v22)
      v23 = "yes";
    else
      v23 = "no";
    if (v12)
      v24 = "yes";
    else
      v24 = "no";
    v58 = v20;
    v8 = v7;
    LOBYTE(v7) = v63;
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]", 30, "TipiTableEvent: isBTRoute %s streaming %s isLastRoute %s isLastPlay %s otherLastPlay %s audioState %s budswap %s UserConnected %s", v62, v61, v60, v59, v58, v21, v23, v24);

  }
  if (self->_isBTRoute)
    v25 = (char)v7;
  else
    v25 = 0;
  if ((v25 & 1) != 0
    || (v8 ? (v26 = v64) : (v26 = 0),
        v26 == 1 && !objc_msgSend(v5, "otherTipiDeviceLastPlay")
     || self->_callConnected
     || (self->_splitterStateOn ? (v27 = 1) : (v27 = v12), v27 == 1)))
  {
    objc_msgSend(v5, "_setRoutingAction:", 1);
    p_vtable = _TtC15audioaccessoryd11XPCMessages.vtable;
    if (v12)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v4));
      objc_msgSend(v29, "_setUserConnectedState:", 0);

    }
  }
  else
  {
    objc_msgSend(v5, "_setRoutingAction:", 3);
    p_vtable = (void **)(_TtC15audioaccessoryd11XPCMessages + 24);
  }
  objc_msgSend(v5, "setIsTipiHealingV2Eligible:", 1);
  nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
  if (nearbyInfoDevicesTriangleRecoveryTimer)
  {
    v31 = nearbyInfoDevicesTriangleRecoveryTimer;
    dispatch_source_cancel(v31);
    v32 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;

  }
  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    v34 = *((_DWORD *)p_vtable + 662);
    if (v34 >= 31)
    {
      v35 = tipiHealingTimer;
    }
    else
    {
      if (v34 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30))
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]", 30, "TipiTableEvent: Cancel legacy Tipi healing timer");
      v35 = self->_tipiHealingTimer;
      if (!v35)
        goto LABEL_62;
    }
    dispatch_source_cancel((dispatch_source_t)v35);
    v36 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = 0;

LABEL_62:
    self->_tipiElectionInProgress = 0;
  }
  -[BTSmartRoutingDaemon _notifyOtherTipiDeviceTipiScoreChanged:andNewScore:](self, "_notifyOtherTipiDeviceTipiScoreChanged:andNewScore:", 0, 0);
  objc_msgSend(v5, "_setRoutingInitialized:", 1);
  if (self->_tipiHealingHijackTimer
    && !-[BTSmartRoutingDaemon _deviceSupportsHijackV2:withDevice:](self, "_deviceSupportsHijackV2:withDevice:", v6, v5))
  {
    tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
    if (tipiHealingHijackTimer)
    {
      v38 = tipiHealingHijackTimer;
      dispatch_source_cancel(v38);
      v39 = self->_tipiHealingHijackTimer;
      self->_tipiHealingHijackTimer = 0;

    }
    v40 = *((_DWORD *)p_vtable + 662);
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]", 30, "TipiTableEvent: Tipi healing complete now but device FW does not support HijackV2, service pending MX request");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioRoutingRequest"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioRoutingResponse"));
    -[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:](self, "_smartRoutingAudioRoutingRequest:withResponseHandler:", v41, v42);

  }
  if ((objc_msgSend(v5, "tipitableUpdated") & 1) == 0)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceBTAddress"));
    v45 = v8;
    if (objc_msgSend(v5, "routingAction") == 1)
    {
      v71 = v43;
      v46 = &v71;
      v47 = v44;
    }
    else
    {
      v70 = v44;
      v46 = &v70;
      v47 = v43;
    }
    v46[1] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _verifyWxConnectedBTAddress:withVersion:](self, "_verifyWxConnectedBTAddress:withVersion:", v4, &off_1001F45A8));
    v50 = *((_DWORD *)p_vtable + 662);
    if (v50 <= 90 && (v50 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]", 90, "TipiTableEvent: update wx Tipi table for Wx %@, addresses %@", v4, v48);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100050F28;
    v66[3] = &unk_1001E35F8;
    v67 = v4;
    v68 = v48;
    v69 = v5;
    -[BTSmartRoutingDaemon _updateAccessoryID:connectionDeviceAddresses:completion:](self, "_updateAccessoryID:connectionDeviceAddresses:completion:", v49, v48, v66);

    v8 = v45;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxStatsMap, "objectForKeyedSubscript:", v4));

  if (v51)
  {
    v52 = mach_absolute_time();
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxStatsMap, "objectForKeyedSubscript:", v4));
    v54 = UpTicksToSecondsF(v52 - (_QWORD)objc_msgSend(v53, "thV2Ticks"));

    -[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:](self, "_submitMetricTipiHealingforDevice:withDuration:andLegacy:", v5, 0, v54);
  }
  v55 = *((_DWORD *)p_vtable + 662);
  if (v55 <= 30 && (v55 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v56 = objc_msgSend(v5, "routingAction");
    if (v56 > 5)
      v57 = "?";
    else
      v57 = off_1001E3E40[v56];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]", 30, "TipiTableEvent: current route action is %s", v57);
  }

}

- (void)_tipiHealingStartTimer:(id)a3
{
  dispatch_time_t v4;
  NSObject *tipiHealingTimer;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD handler[5];

  v4 = dispatch_time(0, 10000000000);
  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    dispatch_source_set_timer(tipiHealingTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v7 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = v6;

    v8 = self->_tipiHealingTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000510B0;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_tipiHealingTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_tipiHealingTimer);
  }
}

- (void)_triggerTipiTableUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AAController *aaController;
  unsigned int v8;
  const char *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:"));
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      aaController = self->_aaController;
      v8 = -[BTSmartRoutingDaemon _aacpConnectedCheck:](self, "_aacpConnectedCheck:", v6);
      v9 = "no";
      if (v8)
        v9 = "yes";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _triggerTipiTableUpdate:]", 30, "TriggerTipiTableUpdate: aaController %@ AACP connected %s", aaController, v9);
    }
    -[AAController sendGetTipiTableMessageToDestinationIdentifier:completionHandler:](self->_aaController, "sendGetTipiTableMessageToDestinationIdentifier:completionHandler:", v11, &stru_1001E3720);

    goto LABEL_12;
  }
  if (dword_10020FA58 <= 90)
  {
    v11 = 0;
    if (dword_10020FA58 != -1 || (v10 = _LogCategory_Initialize(&dword_10020FA58, 90), v5 = 0, v10))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _triggerTipiTableUpdate:]", 90, "TriggerTipiTableUpdate: Skip, no wx address ");
LABEL_12:
      v5 = v11;
    }
  }

}

- (BOOL)_deviceSupportsHijackV2:(id)a3 withDevice:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;

  v5 = a4;
  if (objc_msgSend(CFSTR("5E135"), "compare:options:", a3, 64) == (id)1)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "otherTipiDeviceVersion"));
    v6 = (int)objc_msgSend(v7, "intValue") > 1;

  }
  return v6;
}

- (void)_tipiHealingHijackTimerStart:(id)a3 withScore:(int)a4
{
  id v6;
  OS_dispatch_source *v7;
  dispatch_source_t v8;
  _QWORD handler[5];
  id v10;
  _QWORD *v11;
  int v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = self->_tipiHealingHijackTimer;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10001E9DC;
  v13[4] = sub_10001E9EC;
  v14 = 0;
  if (v7)
  {
    v8 = (dispatch_source_t)v7;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealingHijackTimerStart:withScore:]", 30, "Tipi Healing hijack timer already running!");
    }
  }
  else
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _tipiHealingHijackTimerStart:withScore:]", 30, "Tipi Healing hijack timer start : %d seconds, waiting for Tipi healing", 2);
    }
    v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_tipiHealingHijackTimer, v8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005154C;
    handler[3] = &unk_1001E3748;
    handler[4] = self;
    v12 = a4;
    v10 = v6;
    v11 = v13;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet(v8, 2.0, -1.0, -10.0);
    dispatch_activate(v8);

  }
  _Block_object_dispose(v13, 8);

}

- (BOOL)_arbitrationTimeout:(id)a3 withScore:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *connectedDevices;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  id v12;
  _BOOL4 v14;
  _BOOL4 v15;
  const __CFString *v16;
  const char *v17;

  v4 = *(_QWORD *)&a4;
  connectedDevices = self->_connectedDevices;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](connectedDevices, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "audioStreamState");

  if (v9 - 1 > 2)
    v10 = 0;
  else
    v10 = dword_100184734[v9 - 1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v7));

  v12 = objc_msgSend(v11, "hijackBackoffTicks");
  v14 = (_DWORD)v4 == 501 || (int)v10 <= (int)v4;
  if (v12)
    v15 = 0;
  else
    v15 = v14;

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v16 = CFSTR("DontRoute");
    if (v15)
      v16 = CFSTR("Route");
    if (v9 > 3)
      v17 = "?";
    else
      v17 = off_1001E3DD8[v9];
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _arbitrationTimeout:withScore:]", 30, "Arbitration timeout: Decision is %@, remote category %d, local category %d wxStreamState %s", v16, v10, v4, v17);
  }
  return v15;
}

- (void)_setPipeMessageStats:(unint64_t)a3
{
  -[SmartRoutingStats setFirstPipeMessageRTT:](self->_stats, "setFirstPipeMessageRTT:", a3);
  if ((unint64_t)UpTicksToSeconds(-[SmartRoutingStats firstPipeMessageRTT](self->_stats, "firstPipeMessageRTT")) >= 4
    && dword_10020FA58 <= 90
    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _setPipeMessageStats:]", 90, "First Pipe message took more than 3 seconds!");
  }
}

- (void)_updateAudioRoute:(int)a3 withUUID:(id)a4
{
  uint64_t v4;
  unsigned int v6;
  const char *v7;
  const char *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v9 = a4;
  if ((_DWORD)v4 && -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute") != (_DWORD)v4)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v6 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
      if (v6 > 4)
        v7 = "?";
      else
        v7 = off_1001E3DF8[v6];
      if (v4 > 4)
        v8 = "?";
      else
        v8 = off_1001E3E20[(int)v4 - 1];
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateAudioRoute:withUUID:]", 30, "Device audio route changed: %s -> %s %@", v7, v8, v9);
    }
    -[BTSmartRoutingSourceDevice setAudioRoute:](self->_sourceDevice, "setAudioRoute:", v4);
    -[BTSmartRoutingSourceDevice setAudioDestination:](self->_sourceDevice, "setAudioDestination:", v9);
  }

}

- (void)_updateLocalAudioCategory:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  int v7;
  unsigned int v8;
  id v9;
  NSNumber *localDeviceAudioCatogory;
  id v11;
  id v12;
  void *v13;
  NSMutableDictionary *smartRoutingWxDeviceMap;
  NSNumber *v15;
  _QWORD v16[5];
  NSNumber *v17;

  v5 = (NSNumber *)a3;
  v6 = v5;
  v15 = v5;
  if (self->_prefSmartRoutingPreemptiveConnectedBanner)
  {
    v7 = -[NSNumber intValue](v5, "intValue");
    v6 = v15;
    if (v7 >= 301)
    {
      v8 = -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue");
      v6 = v15;
      if (v8 == 100)
      {
        v9 = -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count");
        v6 = v15;
        if (!v9)
        {
          if (dword_10020FA58 <= 90
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateLocalAudioCategory:]", 90, "Running preemptive evaluator for onDemand Connect for transition from idle to media playing!");
          }
          objc_storeStrong((id *)&self->_localDeviceAudioCatogory, a3);
          -[BTSmartRoutingDaemon _evaluatorRun](self, "_evaluatorRun");
          v6 = v15;
          if (self->_preemptiveBannerConnectionInProgress)
          {
            -[SmartRoutingStats setLocalAudioScore:](self->_stats, "setLocalAudioScore:", self->_localDeviceAudioCatogory);
            v6 = v15;
          }
        }
      }
    }
  }
  localDeviceAudioCatogory = self->_localDeviceAudioCatogory;
  if (localDeviceAudioCatogory != v6)
  {
    if (dword_10020FA58 <= 90)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 90))
          goto LABEL_16;
        localDeviceAudioCatogory = self->_localDeviceAudioCatogory;
      }
      v11 = (id)-[NSNumber intValue](localDeviceAudioCatogory, "intValue");
      v12 = (id)-[NSNumber intValue](v15, "intValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateLocalAudioCategory:]", 90, "Updating local audio category %d -> %d app %@", v11, v12, v13);

    }
LABEL_16:
    objc_storeStrong((id *)&self->_localDeviceAudioCatogory, a3);
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100051B20;
    v16[3] = &unk_1001E2E88;
    v16[4] = self;
    v17 = v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v16);

    v6 = v15;
  }

}

- (void)_updateOtherTipiBuildVersion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NRPairedDeviceRegistry *NRRegistry;
  NRPairedDeviceRegistry *v9;
  NRPairedDeviceRegistry *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "otherTipiDeviceBTAddress"));

  if (v5)
  {
    v6 = objc_msgSend(v4, "otherTipiDeviceIsWatch");
    if ((v6 & 1) != 0 || GestaltGetDeviceClass(v6, v7) == 6)
    {
      NRRegistry = self->_NRRegistry;
      if (!NRRegistry)
      {
        v9 = (NRPairedDeviceRegistry *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
        v10 = self->_NRRegistry;
        self->_NRRegistry = v9;

        NRRegistry = self->_NRRegistry;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRPairedDeviceRegistry getActivePairedDevice](NRRegistry, "getActivePairedDevice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForProperty:", NRDevicePropertySystemVersion));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(".")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
      v15 = objc_msgSend(v14, "integerValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(".")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 1));
      v18 = objc_msgSend(v17, "integerValue");

      objc_msgSend(v4, "_setOtherTipiDeviceBuildVersion:andMinorBuildVersion:", v15, v18);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "otherTipiDeviceBTAddress"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getIDSDeviceFromBtAddress:](self, "_getIDSDeviceFromBtAddress:", v19));

      if (v11)
      {
        objc_msgSend(v11, "operatingSystemVersion");
        v20 = v25;
        objc_msgSend(v11, "operatingSystemVersion");
        v21 = v23;
      }
      else
      {
        v21 = 0;
        v20 = 0;
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v23 = 0;
        v24 = 0;
        v22 = 0;
      }
      objc_msgSend(v4, "_setOtherTipiDeviceBuildVersion:andMinorBuildVersion:", v20, v21, v22, v23, v24, v25, v26, v27);
    }

  }
}

- (void)_updateOtherTipiDevice:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6 withResult:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v19));
  v16 = v15;
  if (v15)
  {
    if (a7)
    {
      objc_msgSend(v15, "_setRoutingAction:", 2);
      objc_msgSend(v16, "_setOtherTipiDeviceInfo:andName:andVersion:", 0, 0, 0);
      -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v19, &stru_1001ED4C0, 0, 3);
    }
    else
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:]", 30, "Smart Routing updating device %@ with otherAddress %@ otherName %@ otherVersion %@", v19, v12, v13, v14);
      }
      v17 = v12;
      objc_msgSend(v16, "_setRoutingAction:", 1);
      objc_msgSend(v16, "_setOtherTipiDeviceInfo:andName:andVersion:", v17, v13, v14);
      -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v19, v17, 0, 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v19));
      objc_msgSend(v18, "_setOtherTipiAudioCategory:", 0);

    }
    -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged");
  }
  else if (dword_10020FA58 <= 90
         && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:]", 90, "SR device not found. Something went wrong please file a radar.");
  }

}

- (void)_updateOtherTipiDevicewithAudioCategory:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v19));
  v14 = v10;
  if (v13)
  {
    objc_msgSend(v13, "_setOtherTipiDeviceInfo:andName:andVersion:", v14, v11, v12);
    v15 = -[BTSmartRoutingDaemon _isMagnetConnectedDeviceforTipiHealingCheck:](self, "_isMagnetConnectedDeviceforTipiHealingCheck:", v14);
    if (v15 && GestaltGetDeviceClass(v15, v16) == 1)
      objc_msgSend(v13, "_setOtherTipiDeviceIsWatch:", 1);
    if (self->_isBTRoute)
      v17 = 1;
    else
      v17 = 3;
    objc_msgSend(v13, "_setRoutingAction:", v17);
    if (v14)
    {
      -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:](self, "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:", v19, v14, 0, 1);
      objc_msgSend(v12, "doubleValue");
      if (v18 >= 2.0)
      {
        if (self->_localDeviceAudioCatogory)
          -[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:](self, "_sendAudioCategory:withAudioCategory:", v19);
      }
    }
  }

}

- (id)_verifyWxConnectedBTAddress:(id)a3 withVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BTSmartRoutingDaemon *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v6)), v8, !v8))
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _verifyWxConnectedBTAddress:withVersion:]", 30, "Wx %@ is not connected", v6);
    }
    v22 = 0;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v25 = self;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "btAddressData"));
          if (objc_msgSend(v15, "length") != (id)6)
          {
            objc_msgSend(v7, "doubleValue");
            v18 = 0;
LABEL_14:

            goto LABEL_15;
          }
          v16 = objc_retainAutorelease(v15);
          v17 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(v16, "bytes")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          objc_msgSend(v7, "doubleValue");
          if (v19 < 1.1)
          {
            if (!v18 || (objc_msgSend(v14, "deviceFlags") & 0x10) == 0)
              goto LABEL_14;
            v20 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v25->_connectedDevices, "objectForKeyedSubscript:", v18));
            goto LABEL_26;
          }
          if (!v18)
            goto LABEL_14;
          if (objc_msgSend(v6, "isEqualToString:", v18)
            && (objc_msgSend(v14, "deviceFlags") & 0x10) != 0)
          {
            v20 = v14;
LABEL_26:
            v22 = v20;
            goto LABEL_29;
          }
          if (!objc_msgSend(v6, "isEqualToString:", v18)
            || (objc_msgSend(v14, "deviceFlags") & 0x10) != 0)
          {
            goto LABEL_14;
          }
          v21 = objc_alloc_init((Class)CBDevice);
          objc_msgSend(v21, "setIdentifier:", CFSTR("FF:FF:FF:FF:FF:FF"));
          v22 = v21;
          if (dword_10020FA58 <= 50
            && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 50)))
          {
            LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _verifyWxConnectedBTAddress:withVersion:]", 50, "Source is connected to headset %@ however Tipi flag is missing", v6);
          }

LABEL_29:
          if (v22)
            goto LABEL_33;
LABEL_15:
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v11 = v23;
      }
      while (v23);
    }
    v22 = 0;
LABEL_33:

  }
  return v22;
}

- (BOOL)_verifyWxConnectedRouted:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "routed");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
  if (objc_msgSend(v7, "inEar"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherTipiDeviceBTAddress"));

    if (!v9)
      v6 = 1;
  }
  else
  {
    v6 = 1;
  }

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v10 = "yes";
    if (v6)
      v11 = "yes";
    else
      v11 = "no";
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
    if (!objc_msgSend(v12, "inEar"))
      v10 = "no";
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "otherTipiDeviceBTAddress"));
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _verifyWxConnectedRouted:]", 30, "Smart Routing %@ routed %s inEar %s otherTipiAddress %@", v4, v11, v10, v14);

  }
  return v6;
}

- (void)_watchHintingRecovery
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052568;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_watchMediaControl
{
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingDaemon _watchMediaControl]", 30, "Watch being used as media remote to control music..");
}

- (void)_watchRecoveryStartTimer
{
  dispatch_time_t v3;
  NSObject *watchRecoveryTimer;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  _QWORD handler[5];

  v3 = dispatch_time(0, 120000000000);
  watchRecoveryTimer = self->_watchRecoveryTimer;
  if (watchRecoveryTimer)
  {
    dispatch_source_set_timer(watchRecoveryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v6 = self->_watchRecoveryTimer;
    self->_watchRecoveryTimer = v5;

    v7 = self->_watchRecoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000527F8;
    handler[3] = &unk_1001E20E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_watchRecoveryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_watchRecoveryTimer);
  }
}

- (BTSmartRoutingRouteRequest)pipePendingRequest
{
  return self->_pipePendingRequest;
}

- (void)setPipePendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pipePendingRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipePendingRequest, 0);
  objc_storeStrong((id *)&self->_wxAssetCache, 0);
  objc_storeStrong((id *)&self->_wxFirmwareCache, 0);
  objc_storeStrong((id *)&self->_wxDiscoveryWatchRecovery, 0);
  objc_storeStrong((id *)&self->_wxDiscovery, 0);
  objc_storeStrong((id *)&self->_wxDevices, 0);
  objc_storeStrong((id *)&self->_watchWxDevices, 0);
  objc_storeStrong((id *)&self->_watchRecoveryTimer, 0);
  objc_storeStrong(&self->_virtualIOExpiredBlock, 0);
  objc_storeStrong((id *)&self->_uiSmartRoutingBanner, 0);
  objc_storeStrong((id *)&self->_uiLowBatteryBanner, 0);
  objc_storeStrong((id *)&self->_uiNoteSessionSmartRoutingXROSType, 0);
  objc_storeStrong((id *)&self->_uiNoteSessionSmartRouting, 0);
  objc_storeStrong((id *)&self->_uiNoteSessionLowBattery, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
  objc_storeStrong((id *)&self->_tipiHealingHijackTimer, 0);
  objc_storeStrong((id *)&self->_tipiHealingTimer, 0);
  objc_storeStrong((id *)&self->_tipiElectionReceivedLePipe, 0);
  objc_storeStrong((id *)&self->_systemUIMonitor, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_srDiscoveredDeviceMap, 0);
  objc_storeStrong((id *)&self->_srBudswapDeviceMap, 0);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
  objc_storeStrong((id *)&self->_smartRoutingWxStatsMap, 0);
  objc_storeStrong((id *)&self->_smartRoutingWxDeviceMap, 0);
  objc_storeStrong((id *)&self->_smartRoutingLowerScanRateTimer, 0);
  objc_storeStrong((id *)&self->_smartRoutingPipe, 0);
  objc_storeStrong((id *)&self->_smartRoutingManualRoutingList, 0);
  objc_storeStrong((id *)&self->_smartRoutingManualDisconnectionList, 0);
  objc_storeStrong((id *)&self->_smartRoutingBackOffMap, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);
  objc_storeStrong((id *)&self->_screenLockedLingerTimer, 0);
  objc_storeStrong((id *)&self->_routeIndicationSetRouteTimer, 0);
  objc_storeStrong((id *)&self->_routeIndicationQualifiedTickMap, 0);
  objc_storeStrong((id *)&self->_routeIndicationBulletinTimer, 0);
  objc_storeStrong((id *)&self->_routeIndicationBackOffMap, 0);
  objc_storeStrong((id *)&self->_routeChangeToSpeakerTimer, 0);
  objc_storeStrong((id *)&self->_routeChangeDetectionTimer, 0);
  objc_storeStrong((id *)&self->_ringtoneTimer, 0);
  objc_storeStrong((id *)&self->_smartRoutingController, 0);
  objc_storeStrong((id *)&self->_previousRoute, 0);
  objc_storeStrong((id *)&self->_prefSmartRoutingForcedDisconnectionStartTimer, 0);
  objc_storeStrong((id *)&self->_predictiveRouteTimer, 0);
  objc_storeStrong((id *)&self->_playbackStartTimer, 0);
  objc_storeStrong((id *)&self->_phoneOwnershipTriangleTimer, 0);
  objc_storeStrong((id *)&self->_phase1ConnectConfig, 0);
  objc_storeStrong((id *)&self->_pairedDiscovery, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);
  objc_storeStrong((id *)&self->_ownershipLostTimer, 0);
  objc_storeStrong(&self->_ownershipChangedBlock, 0);
  objc_storeStrong((id *)&self->_NRRegistry, 0);
  objc_storeStrong((id *)&self->_myModel, 0);
  objc_storeStrong((id *)&self->_myAddress, 0);
  objc_storeStrong((id *)&self->_nearbyWxDeviceMap, 0);
  objc_storeStrong((id *)&self->_nearByStats, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDiscovery, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDevicesTriangleRecoveryTimer, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDevices, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceNotificationTimer, 0);
  objc_storeStrong((id *)&self->_lowBatteryWxDevices, 0);
  objc_storeStrong((id *)&self->_lowBatterySaveTimer, 0);
  objc_storeStrong((id *)&self->_lowBatteryDeviceMap, 0);
  objc_storeStrong((id *)&self->_localDeviceAudioCatogory, 0);
  objc_storeStrong((id *)&self->_lePipeDevice, 0);
  objc_storeStrong(&self->_isMuteStateChangedBlock, 0);
  objc_storeStrong(&self->_outputIsRunningChangedBlock, 0);
  objc_storeStrong(&self->_isHiddenChangedBlock, 0);
  objc_storeStrong((id *)&self->_inUseBannerTimer, 0);
  objc_storeStrong((id *)&self->_hijackBackOffTimer, 0);
  objc_storeStrong((id *)&self->_highActivityLevelTimer, 0);
  objc_storeStrong((id *)&self->_evaluatorCoalescer, 0);
  objc_storeStrong((id *)&self->_eligibleHeadset, 0);
  objc_storeStrong((id *)&self->_dispatchQueueAVSys, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_disconnectTicksMap, 0);
  objc_storeStrong(&self->_connectionCompletion, 0);
  objc_storeStrong((id *)&self->_connectedDevicesSrModeCache, 0);
  objc_storeStrong((id *)&self->_connectedDevicesInEarCache, 0);
  objc_storeStrong((id *)&self->_connectSession, 0);
  objc_storeStrong((id *)&self->_connectDispatchTimer, 0);
  objc_storeStrong((id *)&self->_connectDevice, 0);
  objc_storeStrong((id *)&self->_connectedDiscovery, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_cdDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_callMonitor, 0);
  objc_storeStrong((id *)&self->_budSwapTimer, 0);
  objc_storeStrong((id *)&self->_budSwapAddress, 0);
  objc_storeStrong((id *)&self->_audioStateSnapshotTimer, 0);
  objc_storeStrong((id *)&self->_audioCategoryScores, 0);
  objc_storeStrong((id *)&self->_activityLevelDelayTimer, 0);
  objc_storeStrong((id *)&self->_activityCriticalTimer, 0);
  objc_storeStrong((id *)&self->_aaDeviceManagerDaemon, 0);
  objc_storeStrong((id *)&self->_aaController, 0);
}

@end
