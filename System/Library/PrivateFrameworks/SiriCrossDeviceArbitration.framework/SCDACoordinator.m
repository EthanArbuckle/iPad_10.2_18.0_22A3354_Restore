@implementation SCDACoordinator

- (SCDACoordinator)initWithDelegate:(id)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  SCDACoordinator *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  dispatch_queue_t v25;
  void *v26;
  SCDAAdvertisementContextManager *v27;
  void *v28;
  void *v29;
  SCDAInstrumentation *v30;
  void *v31;
  SCDAGoodnessScoreEvaluator *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  SCDAPreferences *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  void *v41;
  SCDAPowerAssertionManager *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  _BOOL4 v48;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  SCDAEmergencyCallPunchout *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  objc_class *v64;
  uint64_t v65;
  void *v66;
  char *v67;
  NSObject *v68;
  void *v69;
  SCDANotifyStatePublisher *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  SCDANotifyStatePublisher *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  SCDANotifyStatePublisher *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  SCDANotifyStatePublisher *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  _QWORD v92[4];
  char *v93;
  objc_super v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE buf[24];
  void *v100;
  uint64_t *v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)SCDACoordinator;
  v5 = -[SCDACoordinator init](&v94, sel_init);
  if (!v5)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_22;
  }
  if (_currentCoordinator)
  {
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SCDACoordinator initWithDelegate:]";
      _os_log_error_impl(&dword_246211000, v6, OS_LOG_TYPE_ERROR, "%s Attempt to initialize MyriadCoordinator when one already exists.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  kdebug_trace();
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 3) = 0;
  objc_storeWeak((id *)v5 + 11, v4);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  v9 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  v11 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  v13 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v12;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  v15 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v14;

  v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  v17 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v16;

  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  v19 = (void *)*((_QWORD *)v5 + 10);
  *((_QWORD *)v5 + 10) = v18;

  v20 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = 0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INTERACTIVE, 0);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = dispatch_queue_create((const char *)scda_work_queue_label, v22);
  v24 = (void *)*((_QWORD *)v5 + 22);
  *((_QWORD *)v5 + 22) = v23;

  v25 = dispatch_queue_create((const char *)scda_context_queue_label, v22);
  v26 = (void *)*((_QWORD *)v5 + 23);
  *((_QWORD *)v5 + 23) = v25;

  if (*((_QWORD *)v5 + 23))
  {
    v27 = -[SCDAAdvertisementContextManager initWithQueue:]([SCDAAdvertisementContextManager alloc], "initWithQueue:", *((_QWORD *)v5 + 23));
    v28 = (void *)*((_QWORD *)v5 + 63);
    *((_QWORD *)v5 + 63) = v27;

  }
  objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(SCDAInstrumentation);
  v31 = (void *)*((_QWORD *)v5 + 78);
  *((_QWORD *)v5 + 78) = v30;

  v32 = [SCDAGoodnessScoreEvaluator alloc];
  +[SCDAAssistantPreferences sharedPreferences](SCDAAssistantPreferences, "sharedPreferences");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[SCDAGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:instrumentation:](v32, "initWithDeviceInstanceContext:preferences:queue:instrumentation:", v29, v33, *((_QWORD *)v5 + 22), *((_QWORD *)v5 + 78));
  v35 = (void *)*((_QWORD *)v5 + 65);
  *((_QWORD *)v5 + 65) = v34;

  objc_msgSend(*((id *)v5 + 65), "setLastActivationTime:", 0.0);
  v36 = [SCDAPreferences alloc];
  +[SCDAAssistantPreferences sharedPreferences](SCDAAssistantPreferences, "sharedPreferences");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[SCDAPreferences initWithDeviceInstanceContext:preferences:](v36, "initWithDeviceInstanceContext:preferences:", v29, v37);
  v39 = (void *)*((_QWORD *)v5 + 74);
  *((_QWORD *)v5 + 74) = v38;

  v5[318] = objc_msgSend(*((id *)v5 + 74), "coordinationEnabled");
  v5[319] = objc_msgSend(*((id *)v5 + 74), "BLEActivityEnabled");
  v5[168] = objc_msgSend(*((id *)v5 + 74), "deviceGroup");
  objc_msgSend(*((id *)v5 + 74), "deviceSlowDown");
  *((_DWORD *)v5 + 75) = (int)(v40 * 1000.0);
  *((_WORD *)v5 + 156) = 0;
  v5[434] = 0;
  v5[314] = 0;
  *(_WORD *)(v5 + 325) = 0;
  *((_WORD *)v5 + 164) = 0;
  *(_WORD *)(v5 + 321) = 0;
  v5[330] = 0;
  v41 = (void *)*((_QWORD *)v5 + 80);
  *((_QWORD *)v5 + 80) = 0;

  v5[280] = 0;
  *((_DWORD *)v5 + 74) = 0;
  v42 = -[SCDAPowerAssertionManager initWithIdentifier:]([SCDAPowerAssertionManager alloc], "initWithIdentifier:", CFSTR("com.apple.assistant.myriad"));
  v43 = (void *)*((_QWORD *)v5 + 28);
  *((_QWORD *)v5 + 28) = v42;

  v44 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v45 = v5[318];
    v46 = v5[319];
    v47 = v44;
    v48 = +[SCDAUtilities isCommunal](SCDAUtilities, "isCommunal");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SCDACoordinator initWithDelegate:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v45;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v46;
    LOWORD(v100) = 1024;
    *(_DWORD *)((char *)&v100 + 2) = v48;
    _os_log_impl(&dword_246211000, v47, OS_LOG_TYPE_INFO, "%s #scda coordinationEnabled=%d, BLEActivityEnabled=%d communal=%d", buf, 0x1Eu);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationCallback, CFSTR("com.apple.siri.myriad.apayload"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)outputTriggerSeenCallback, CFSTR("com.apple.siri.corespeech.selftrigger"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)emergencyCallback, CFSTR("com.apple.siri.myriad.falseemergency"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)myriadDecisionRequestCallback, CFSTR("com.apple.siri.myriad.get.decision"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)inEarTriggerSeenCallback, CFSTR("com.apple.siri.myriad.in.ear"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)carplayTriggerSeenCallback, CFSTR("com.apple.siri.myriad.jarvis"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)*((_QWORD *)v5 + 47);
  *((_QWORD *)v5 + 47) = v50;

  v52 = (void *)*((_QWORD *)v5 + 30);
  *((_QWORD *)v5 + 30) = 0;

  *((_QWORD *)v5 + 31) = 0;
  *((_QWORD *)v5 + 32) = 0;
  *((_QWORD *)v5 + 33) = 0;
  objc_storeStrong((id *)&_currentCoordinator, v5);
  v5[320] = 0;
  v5[327] = 0;
  v53 = (void *)*((_QWORD *)v5 + 24);
  *((_QWORD *)v5 + 24) = &stru_25174CE48;

  *((_QWORD *)v5 + 34) = 0;
  v54 = (void *)*((_QWORD *)v5 + 38);
  *((_QWORD *)v5 + 38) = 0;

  *((_WORD *)v5 + 209) = 0;
  v55 = (void *)*((_QWORD *)v5 + 48);
  *((_QWORD *)v5 + 48) = 0;

  *((_DWORD *)v5 + 98) = 0;
  v5[433] = 0;
  *((_QWORD *)v5 + 51) = 0;
  v5[416] = 0;
  v56 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v57 = (void *)*((_QWORD *)v5 + 43);
  *((_QWORD *)v5 + 43) = v56;

  objc_msgSend(*((id *)v5 + 43), "setDateFormat:", CFSTR("hh:mm:ss.SSS"));
  v58 = objc_alloc_init(SCDAEmergencyCallPunchout);
  v59 = (void *)*((_QWORD *)v5 + 50);
  *((_QWORD *)v5 + 50) = v58;

  objc_msgSend(v5, "_initDeviceClassAndAdjustments");
  *((_QWORD *)v5 + 29) = CFNotificationCenterGetDarwinNotifyCenter();
  v60 = (void *)*((_QWORD *)v5 + 26);
  *((_QWORD *)v5 + 26) = 0;

  v61 = (void *)*((_QWORD *)v5 + 66);
  *((_QWORD *)v5 + 66) = 0;

  objc_msgSend(v5, "_initializeTimer");
  *((_WORD *)v5 + 228) = 0;
  objc_msgSend(v5, "_initializeWiProxReadinessTimer");
  objc_msgSend(v5, "_resetAdvertisementTimings");
  v62 = MEMORY[0x24BDAC760];
  if (v5[319])
  {
    v95 = 0;
    v96 = &v95;
    v97 = 0x2050000000;
    v63 = (void *)getWPHeySiriClass_softClass;
    v98 = getWPHeySiriClass_softClass;
    if (!getWPHeySiriClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getWPHeySiriClass_block_invoke;
      v100 = &unk_25174AB98;
      v101 = &v95;
      __getWPHeySiriClass_block_invoke((uint64_t)buf);
      v63 = (void *)v96[3];
    }
    v64 = objc_retainAutorelease(v63);
    _Block_object_dispose(&v95, 8);
    v65 = objc_msgSend([v64 alloc], "initWithDelegate:queue:", v5, *((_QWORD *)v5 + 22));
    v66 = (void *)*((_QWORD *)v5 + 44);
    *((_QWORD *)v5 + 44) = v65;
  }
  else
  {
    v66 = (void *)*((_QWORD *)v5 + 44);
    *((_QWORD *)v5 + 44) = 0;
  }

  v92[0] = v62;
  v92[1] = 3221225472;
  v92[2] = __36__SCDACoordinator_initWithDelegate___block_invoke;
  v92[3] = &unk_25174AD68;
  v67 = v5;
  v93 = v67;
  objc_msgSend(v67, "waitWiProx:andExecute:", 2000, v92);
  v68 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SCDACoordinator initWithDelegate:]";
    _os_log_impl(&dword_246211000, v68, OS_LOG_TYPE_INFO, "%s Initialized MyriadCoordinator", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObserver:selector:name:object:", v67, sel_updateRequestId_, CFSTR("RequestIdForMyriad"), 0);

  *((_QWORD *)v67 + 53) = 0;
  v70 = [SCDANotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "com.apple.siri.myriad.decision.begin", 4);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[SCDANotifyStatePublisher initWithName:queue:](v70, "initWithName:queue:", v71, *((_QWORD *)v5 + 22));
  v73 = (void *)*((_QWORD *)v67 + 67);
  *((_QWORD *)v67 + 67) = v72;

  v74 = [SCDANotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "com.apple.siri.myriad.decision.won", 4);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[SCDANotifyStatePublisher initWithName:queue:](v74, "initWithName:queue:", v75, *((_QWORD *)v5 + 22));
  v77 = (void *)*((_QWORD *)v67 + 68);
  *((_QWORD *)v67 + 68) = v76;

  v78 = [SCDANotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "com.apple.siri.myriad.decision.lost", 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[SCDANotifyStatePublisher initWithName:queue:](v78, "initWithName:queue:", v79, *((_QWORD *)v5 + 22));
  v81 = (void *)*((_QWORD *)v67 + 69);
  *((_QWORD *)v67 + 69) = v80;

  v82 = [SCDANotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "com.apple.siri.myriad.repost.decision.won", 4);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[SCDANotifyStatePublisher initWithName:queue:](v82, "initWithName:queue:", v83, *((_QWORD *)v5 + 22));
  v85 = (void *)*((_QWORD *)v67 + 70);
  *((_QWORD *)v67 + 70) = v84;

  *((_QWORD *)v67 + 73) = 0;
  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", v29, 1, v67, *((void **)v5 + 22));
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = (void *)*((_QWORD *)v67 + 71);
  *((_QWORD *)v67 + 71) = v86;

  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  if (SCDAIsInternalInstall_isInternal)
  {
    SCDAForceNoActivityNotifyStateObserver(v29, 1, v67, *((void **)v5 + 22));
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = (void *)*((_QWORD *)v67 + 72);
    *((_QWORD *)v67 + 72) = v88;

  }
  v90 = (void *)*((_QWORD *)v67 + 79);
  *((_QWORD *)v67 + 79) = 0;

  kdebug_trace();
  v7 = v67;

LABEL_22:
  return v7;
}

- (void)dealloc
{
  SCDAElectionParticipantIdVendor *electionParticipantIdVendor;
  objc_super v4;

  -[SCDACoordinator _clearWiProxReadinessTimer](self, "_clearWiProxReadinessTimer");
  -[SCDAPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
  if (self->_BLEActivityEnabled)
  {
    -[WPHeySiri stopScanningAndAdvertising](self->_heySiriBTLE, "stopScanningAndAdvertising");
    -[WPHeySiri invalidate](self->_heySiriBTLE, "invalidate");
    self->_heySiriBTLEState = 0;
  }
  electionParticipantIdVendor = self->_electionParticipantIdVendor;
  self->_electionParticipantIdVendor = 0;

  v4.receiver = self;
  v4.super_class = (Class)SCDACoordinator;
  -[SCDACoordinator dealloc](&v4, sel_dealloc);
}

- (void)readDefaults
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SCDACoordinator_readDefaults__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)_readDefaults
{
  NSObject *v3;
  double v4;
  NSObject *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSString *deviceClassName;
  NSString *productTypeName;
  uint64_t deviceClass;
  uint64_t deviceAdjust_DEPRECATED;
  double deviceDelay;
  double deviceTrumpDelay;
  double deviceVTEndtimeDistanceThreshold;
  int v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[SCDACoordinator _readDefaults]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda reading defaults", (uint8_t *)&v18, 0xCu);
  }
  self->_coordinationEnabled = -[SCDAPreferences coordinationEnabled](self->_preferences, "coordinationEnabled");
  self->_BLEActivityEnabled = -[SCDAPreferences BLEActivityEnabled](self->_preferences, "BLEActivityEnabled");
  self->_constantGoodness = -[SCDAPreferences constantGoodnessScore](self->_preferences, "constantGoodnessScore");
  self->_deviceGroup = -[SCDAPreferences deviceGroup](self->_preferences, "deviceGroup");
  -[SCDAPreferences deviceSlowDown](self->_preferences, "deviceSlowDown");
  self->_testInducedSlowdownMsecs = (int)(v4 * 1000.0);
  if (-[SCDAPreferences myriadServerHasProvisioned](self->_preferences, "myriadServerHasProvisioned"))
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[SCDACoordinator _readDefaults]";
      _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s #scda reading server provisioned defaults", (uint8_t *)&v18, 0xCu);
    }
    if (-[SCDAPreferences deviceClass](self->_preferences, "deviceClass"))
      self->_deviceClass = -[SCDAPreferences deviceClass](self->_preferences, "deviceClass");
    -[SCDAPreferences deviceAdjust](self->_preferences, "deviceAdjust");
    self->_deviceAdjust_DEPRECATED = (int)v6;
    -[SCDAPreferences deviceDelay](self->_preferences, "deviceDelay");
    self->_deviceDelay = v7;
    -[SCDAPreferences deviceTrumpDelay](self->_preferences, "deviceTrumpDelay");
    self->_deviceTrumpDelay = v8;
    -[SCDAPreferences voiceTriggerEndtimeDelayThreshold](self->_preferences, "voiceTriggerEndtimeDelayThreshold");
    self->_deviceVTEndtimeDistanceThreshold = v9;
  }
  v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    deviceClassName = self->_deviceClassName;
    productTypeName = self->_productTypeName;
    deviceClass = self->_deviceClass;
    deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
    deviceDelay = self->_deviceDelay;
    deviceTrumpDelay = self->_deviceTrumpDelay;
    deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    v18 = 136316930;
    v19 = "-[SCDACoordinator _readDefaults]";
    v20 = 2112;
    v21 = deviceClassName;
    v22 = 2112;
    v23 = productTypeName;
    v24 = 2048;
    v25 = deviceClass;
    v26 = 2048;
    v27 = deviceAdjust_DEPRECATED;
    v28 = 2048;
    v29 = deviceDelay;
    v30 = 2048;
    v31 = deviceTrumpDelay;
    v32 = 2048;
    v33 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_246211000, v10, OS_LOG_TYPE_INFO, "%s #scda reading defaults: BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, vt_endtime threshold %f", (uint8_t *)&v18, 0x52u);
  }
}

- (void)_initDeviceClassAndAdjustments
{
  NSString *v3;
  NSString *productTypeName;
  NSString *v5;
  NSString *deviceClassName;
  unsigned __int8 v7;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  uint64_t deviceClass;
  uint64_t deviceAdjust_DEPRECATED;
  double deviceDelay;
  double deviceTrumpDelay;
  double deviceInEarInterval;
  double deviceInEarDelay;
  double deviceVTEndtimeDistanceThreshold;
  unsigned __int8 v18;
  uint64_t v19;
  unsigned __int8 v20;
  _BOOL4 v21;
  int v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  self->_productType = 0;
  v3 = (NSString *)MGCopyAnswer();
  productTypeName = self->_productTypeName;
  self->_productTypeName = v3;

  v5 = (NSString *)MGCopyAnswer();
  deviceClassName = self->_deviceClassName;
  self->_deviceClassName = v5;

  *(_OWORD *)&self->_deviceDelay = xmmword_246243810;
  *(_OWORD *)&self->_deviceInEarDelay = xmmword_246243820;
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("iPhone")))
  {
    self->_deviceAdjust_DEPRECATED = 0;
    v7 = 2;
LABEL_8:
    self->_deviceClass = v7;
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("iPod")))
  {
    self->_deviceAdjust_DEPRECATED = 0;
LABEL_7:
    v7 = 3;
    goto LABEL_8;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("iPad")))
  {
    self->_deviceAdjust_DEPRECATED = -4;
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("AppleTV")))
  {
    self->_deviceAdjust_DEPRECATED = 0;
    v18 = 4;
LABEL_16:
    self->_deviceClass = v18;
    self->_deviceTrumpDelay = 0.75;
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("Watch")))
  {
    self->_deviceAdjust_DEPRECATED = 10;
    v18 = 6;
    goto LABEL_16;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("AudioAccessory")))
  {
    self->_deviceAdjust_DEPRECATED = 0;
    self->_deviceClass = 7;
    v19 = MGGetProductType();
    if (v19 > 3348380075)
    {
      if (v19 == 3348380076)
      {
        self->_productType = 3;
        self->_deviceAdjust_DEPRECATED = -2;
        goto LABEL_9;
      }
      if (v19 == 4240173202)
      {
        v20 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      if (v19 == 1540760353)
      {
        v20 = 5;
        goto LABEL_29;
      }
      if (v19 == 2702125347)
      {
        v20 = 2;
LABEL_29:
        self->_productType = v20;
        goto LABEL_9;
      }
    }
    self->_productType = 0;
    self->_deviceAdjust_DEPRECATED = 0;
  }
  else
  {
    v21 = -[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("Bridge"));
    self->_deviceAdjust_DEPRECATED = 0;
    if (v21)
    {
      v7 = 8;
      goto LABEL_8;
    }
    self->_deviceClass = 0;
  }
LABEL_9:
  self->_deviceVTEndtimeDistanceThreshold = 0.5;
  -[SCDACoordinator _readDefaults](self, "_readDefaults");
  v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v9 = self->_deviceClassName;
    v10 = self->_productTypeName;
    deviceClass = self->_deviceClass;
    deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
    deviceDelay = self->_deviceDelay;
    deviceTrumpDelay = self->_deviceTrumpDelay;
    deviceInEarDelay = self->_deviceInEarDelay;
    deviceInEarInterval = self->_deviceInEarInterval;
    deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    v22 = 136317442;
    v23 = "-[SCDACoordinator _initDeviceClassAndAdjustments]";
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2048;
    v29 = deviceClass;
    v30 = 2048;
    v31 = deviceAdjust_DEPRECATED;
    v32 = 2048;
    v33 = deviceDelay;
    v34 = 2048;
    v35 = deviceTrumpDelay;
    v36 = 2048;
    v37 = deviceInEarDelay;
    v38 = 2048;
    v39 = deviceInEarInterval;
    v40 = 2048;
    v41 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, in_ear delay %f interval %f vt_endtime threshold %f", (uint8_t *)&v22, 0x66u);
  }
}

- (void)_setMyriadContext:(id)a3
{
  SCDAContext *v4;
  SCDAContext *currentMyriadContext;

  v4 = (SCDAContext *)objc_msgSend(a3, "copy");
  currentMyriadContext = self->_currentMyriadContext;
  self->_currentMyriadContext = v4;

}

- (void)_updateVoiceTriggerTimeFromFile
{
  void *v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  double v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  safelyGetAudioData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xC)
    objc_msgSend(v3, "getBytes:range:", &v11, 4, 8);
  v4 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  v5 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v4 / 1000000000.0;
  v6 = SCDALogContextCore;
  v7 = v5 - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v11 / 1000000000.0;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v9 = v6;
    objc_msgSend(v3, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v13 = "-[SCDACoordinator _updateVoiceTriggerTimeFromFile]";
    v14 = 2112;
    v15 = *(double *)&v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2048;
    v19 = v7;
    _os_log_debug_impl(&dword_246211000, v9, OS_LOG_TYPE_DEBUG, "%s data=%@, voiceTriggerTimeRaw=%llu, secondsSinceTrigger=%f", buf, 0x2Au);

    v6 = SCDALogContextCore;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v7 <= 2.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SCDACoordinator _updateVoiceTriggerTimeFromFile]";
      v14 = 2048;
      v15 = v7;
      _os_log_debug_impl(&dword_246211000, v6, OS_LOG_TYPE_DEBUG, "%s #scda endTime from a file is good, secondsSinceTrigger=%f", buf, 0x16u);
    }
    self->_voiceTriggerTime = v11;
  }
  else if (v8)
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[SCDACoordinator _updateVoiceTriggerTimeFromFile]";
    v14 = 2048;
    v15 = v7;
    _os_log_debug_impl(&dword_246211000, v6, OS_LOG_TYPE_DEBUG, "%s #scda endTime from a file is too old, secondsSinceTrigger=%f", buf, 0x16u);
  }

}

- (void)preheatWiProx
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SCDACoordinator_preheatWiProx__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingForPHSSetupAfterDelay:(float)a3 maxInterval:(float)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[SCDACoordinator startAdvertisingForPHSSetupAfterDelay:maxInterval:]";
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  -[SCDACoordinator _phsSetupRecord](self, "_phsSetupRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAdvertisementData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  -[SCDACoordinator advertiseWith:afterDelay:maxInterval:](self, "advertiseWith:afterDelay:maxInterval:", v9, v10, v11);

}

- (void)startAdvertisingFromVoiceTrigger
{
  -[SCDACoordinator startAdvertisingFromVoiceTriggerWithContext:](self, "startAdvertisingFromVoiceTriggerWithContext:", 0);
}

- (void)startAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SCDACoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_startAdvertisingFromVoiceTrigger
{
  SCDARecord *v3;
  SCDARecord *triggerRecord;
  int deviceAdjust_DEPRECATED;
  NSObject *v6;
  void *v7;
  double v8;
  NSString *deviceClassName;
  NSString *productTypeName;
  int incomingAdjustment;
  SCDARecord *v12;
  NSObject *v13;
  int v14;
  int constantGoodness;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  SCDARecord *v23;
  NSObject *v24;
  int v25;
  SCDARecord *overrideMyriadRecord;
  NSObject *v27;
  SCDARecord *v28;
  SCDARecord *v29;
  SCDARecord *v30;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v32;
  void *v33;
  int v34;
  const char *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (self->_inTask || self->_inSetupMode)
  {
    -[SCDACoordinator _startAdvertisingFromInTaskVoiceTrigger](self, "_startAdvertisingFromInTaskVoiceTrigger");
  }
  else
  {
    -[SCDACoordinator _initializeTimer](self, "_initializeTimer");
    -[SCDACoordinator voiceTriggerRecord](self, "voiceTriggerRecord");
    v3 = (SCDARecord *)objc_claimAutoreleasedReturnValue();
    triggerRecord = self->_triggerRecord;
    self->_triggerRecord = v3;

    deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
    if (-[SCDAGoodnessScoreEvaluator deviceAdjustTrialEnabled](self->_goodnessScoreEvaluator, "deviceAdjustTrialEnabled"))
    {
      deviceAdjust_DEPRECATED = -[SCDAGoodnessScoreEvaluator deviceAdjustTrialValue](self->_goodnessScoreEvaluator, "deviceAdjustTrialValue");
      v6 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v34 = 136315394;
        v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
        v36 = 1024;
        LODWORD(v37) = deviceAdjust_DEPRECATED;
        _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda Using Trial defined Device Adjust Value: %du", (uint8_t *)&v34, 0x12u);
      }
    }
    v7 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      deviceClassName = self->_deviceClassName;
      productTypeName = self->_productTypeName;
      incomingAdjustment = self->_incomingAdjustment;
      v12 = self->_triggerRecord;
      v13 = v7;
      v14 = -[SCDARecord rawAudioGoodnessScore](v12, "rawAudioGoodnessScore");
      v34 = 136316418;
      v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
      v36 = 2112;
      v37 = *(double *)&deviceClassName;
      v38 = 2112;
      v39 = productTypeName;
      v40 = 1024;
      v41 = deviceAdjust_DEPRECATED;
      v42 = 1024;
      v43 = incomingAdjustment;
      v44 = 1024;
      v45 = v14;
      _os_log_impl(&dword_246211000, v13, OS_LOG_TYPE_INFO, "%s #scda BTLE device class: %@ (%@) detected, adjusting goodness by %d incomingAdjustment %d, rawAudioGoodnessScore: %d", (uint8_t *)&v34, 0x32u);

    }
    LODWORD(v8) = 1.0;
    -[SCDARecord adjustByMultiplier:adding:](self->_triggerRecord, "adjustByMultiplier:adding:", deviceAdjust_DEPRECATED + self->_incomingAdjustment, v8);
    constantGoodness = self->_constantGoodness;
    if ((constantGoodness & 0x80000000) == 0)
    {
      v16 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v34 = 136315394;
        v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
        v36 = 1024;
        LODWORD(v37) = constantGoodness;
        _os_log_impl(&dword_246211000, v16, OS_LOG_TYPE_INFO, "%s #scda BTLE overriding to constant goodness %d", (uint8_t *)&v34, 0x12u);
        constantGoodness = self->_constantGoodness;
      }
      -[SCDARecord setRawAudioGoodnessScore:withBump:](self->_triggerRecord, "setRawAudioGoodnessScore:withBump:", 0, constantGoodness);
    }
    if (self->_wasEmergency)
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "systemUptime");
      v19 = v18 - self->_lastEmergencyAttempt;

      if (v19 < 70.0)
      {
        v20 = -[SCDARecord goodness](self->_triggerRecord, "goodness");
        v21 = v20 >= 0xC ? 12 : v20;
        -[SCDARecord setRawAudioGoodnessScore:withBump:](self->_triggerRecord, "setRawAudioGoodnessScore:withBump:", 0, v21);
        v22 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v23 = self->_triggerRecord;
          v24 = v22;
          v25 = -[SCDARecord goodness](v23, "goodness");
          v34 = 136315650;
          v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
          v36 = 2048;
          v37 = v19;
          v38 = 1024;
          LODWORD(v39) = v25;
          _os_log_impl(&dword_246211000, v24, OS_LOG_TYPE_INFO, "%s #scda Downgrading goodness as HS invocation too soon %f for score %d", (uint8_t *)&v34, 0x1Cu);

        }
      }
      self->_lastEmergencyAttempt = 0.0;
      self->_wasEmergency = 0;
    }
    overrideMyriadRecord = self->_overrideMyriadRecord;
    if (overrideMyriadRecord)
    {
      v27 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v34 = 136315394;
        v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
        v36 = 2112;
        v37 = *(double *)&overrideMyriadRecord;
        _os_log_impl(&dword_246211000, v27, OS_LOG_TYPE_INFO, "%s #scda BTLE overriding to goodness %@", (uint8_t *)&v34, 0x16u);
        overrideMyriadRecord = self->_overrideMyriadRecord;
      }
      v28 = overrideMyriadRecord;
      v29 = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      v30 = self->_triggerRecord;
      self->_triggerRecord = v28;

    }
    myriadInstrumentation = self->_myriadInstrumentation;
    v32 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDAInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:](myriadInstrumentation, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v32, 2, v33, mach_absolute_time());

    self->_clientIsDirectActivating = 0;
    self->_recordType = 10;
    -[SCDACoordinator _enterState:](self, "_enterState:", 1);
  }
}

- (void)resetStateMachine
{
  -[SCDACoordinator enterState:](self, "enterState:", 0);
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3
{
  -[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:](self, "startAdvertisingFromVoiceTriggerAdjusted:withContext:", a3, 0);
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3 withContext:(id)a4
{
  id v6;
  SCDAGoodnessScoreOverrideContext *v7;
  int deviceAdjust_DEPRECATED;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  SCDAGoodnessScoreContext *v12;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(SCDAGoodnessScoreOverrideContext);
  -[SCDAGoodnessScoreOverrideContext setOverrideContext:](v7, "setOverrideContext:", 1);
  deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
  if (-[SCDAGoodnessScoreEvaluator deviceAdjustTrialEnabled](self->_goodnessScoreEvaluator, "deviceAdjustTrialEnabled"))
  {
    deviceAdjust_DEPRECATED = -[SCDAGoodnessScoreEvaluator deviceAdjustTrialValue](self->_goodnessScoreEvaluator, "deviceAdjustTrialValue");
    v9 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
      v16 = 1024;
      v17 = deviceAdjust_DEPRECATED;
      _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s #scda Logging Trial defined Device Adjust Value: %du", (uint8_t *)&v14, 0x12u);
    }
  }
  else if (objc_msgSend(v6, "activationSource") == 13 && self->_deviceClass == 3)
  {
    v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v13 = self->_deviceAdjust_DEPRECATED;
      v14 = 136315394;
      v15 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
      v16 = 1024;
      v17 = v13;
      _os_log_debug_impl(&dword_246211000, v10, OS_LOG_TYPE_DEBUG, "%s #scda removing negative iPad device boost (adding %d back) due to activationSource", (uint8_t *)&v14, 0x12u);
    }
    a3 -= LOBYTE(self->_deviceAdjust_DEPRECATED);
  }
  v11 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315650;
    v15 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
    v16 = 1024;
    v17 = deviceAdjust_DEPRECATED;
    v18 = 1024;
    v19 = a3;
    _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s #scda _deviceAdjust=%d, adjustment= %d", (uint8_t *)&v14, 0x18u);
  }
  -[SCDAGoodnessScoreOverrideContext setOverriddenAdjustedScore:](v7, "setOverriddenAdjustedScore:", a3);
  v12 = objc_alloc_init(SCDAGoodnessScoreContext);
  -[SCDAGoodnessScoreContext setOverridingContext:](v12, "setOverridingContext:", v7);
  -[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:](self, "startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:", v12, v6);

}

- (void)startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *myriadWorkQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SCDACoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke;
  block[3] = &unk_25174A648;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(myriadWorkQueue, block);

}

- (void)startWatchAdvertisingFromVoiceTrigger
{
  -[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:](self, "startWatchAdvertisingFromVoiceTriggerWithContext:", 0);
}

- (void)startWatchAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SCDACoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startWatchAdvertisingFromDirectTrigger
{
  -[SCDACoordinator startWatchAdvertisingFromDirectTriggerWithContext:](self, "startWatchAdvertisingFromDirectTriggerWithContext:", 0);
}

- (void)startWatchAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SCDACoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromDirectTrigger
{
  -[SCDACoordinator startAdvertisingFromDirectTriggerWithContext:](self, "startAdvertisingFromDirectTriggerWithContext:", 0);
}

- (void)startAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SCDACoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromOutgoingTrigger
{
  -[SCDACoordinator startAdvertisingFromOutgoingTriggerWithContext:](self, "startAdvertisingFromOutgoingTriggerWithContext:", 0);
}

- (void)startAdvertisingFromOutgoingTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__SCDACoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromInEarTrigger
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SCDACoordinator_startAdvertisingFromInEarTrigger__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingFromCarPlayTrigger
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SCDACoordinator_startAdvertisingFromCarPlayTrigger__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingEmergencyHandled
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SCDACoordinator_startAdvertisingEmergencyHandled__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingEmergency
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SCDACoordinator_startAdvertisingEmergency__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)_startAdvertisingFromInTaskVoiceTrigger
{
  NSObject *v3;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v5;
  void *v6;
  SCDARecord *v7;
  SCDARecord *triggerRecord;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[SCDACoordinator _startAdvertisingFromInTaskVoiceTrigger]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE in-task voice trigger heard", (uint8_t *)&v10, 0xCu);
  }
  -[SCDACoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
  mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  myriadInstrumentation = self->_myriadInstrumentation;
  v5 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
  -[SCDASession sessionId](self->_myriadSession, "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDAInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:](myriadInstrumentation, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 6, v6, mach_absolute_time());

  if (self->_myriadState == 1 && self->_inTask && !self->_clientIsDirectActivating && !self->_clientIsDeciding)
  {
    -[SCDARecord generateTiebreaker](self->_triggerRecord, "generateTiebreaker");
    v9 = 1;
  }
  else
  {
    -[SCDAInstrumentation updateIsTrump:withReason:](self->_myriadInstrumentation, "updateIsTrump:withReason:", 1, 7);
    -[SCDACoordinator _initializeTimer](self, "_initializeTimer");
    -[SCDACoordinator directTriggerRecord](self, "directTriggerRecord");
    v7 = (SCDARecord *)objc_claimAutoreleasedReturnValue();
    triggerRecord = self->_triggerRecord;
    self->_triggerRecord = v7;

    self->_clientIsDirectActivating = 0;
    self->_recordType = 3;
    v9 = 14;
  }
  -[SCDACoordinator _enterState:](self, "_enterState:", v9);
}

- (void)startAdvertisingFromInTaskVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCDACoordinator *v9;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SCDACoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromInTaskVoiceTrigger
{
  -[SCDACoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:](self, "startAdvertisingFromInTaskVoiceTriggerWithContext:", 0);
}

- (void)startAdvertisingFromAlertFiringVoiceTrigger
{
  -[SCDACoordinator startAdvertisingFromAlertFiringVoiceTriggerWithContext:](self, "startAdvertisingFromAlertFiringVoiceTriggerWithContext:", 0);
}

- (void)startAdvertisingFromAlertFiringVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SCDACoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startResponseAdvertising:(unsigned __int16)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  unsigned __int16 v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_startResponseAdvertising___block_invoke;
  v4[3] = &unk_25174A670;
  v4[4] = self;
  v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)startAdvertisingSlowdown:(unsigned __int16)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  unsigned __int16 v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_startAdvertisingSlowdown___block_invoke;
  v4[3] = &unk_25174A670;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)endAdvertisingAfterDelay:(float)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  float v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke;
  v4[3] = &unk_25174A698;
  v4[4] = self;
  v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)_endAdvertising:(id)a3
{
  id v4;
  NSObject *v5;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[SCDACoordinator _endAdvertising:]";
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v13, 0xCu);
  }
  kdebug_trace();
  -[SCDACoordinator _createElectionParticipantIdVendorIfRequired](self, "_createElectionParticipantIdVendorIfRequired");
  -[SCDAElectionParticipantIdVendor fetchBTLEAddressIfRequired](self->_electionParticipantIdVendor, "fetchBTLEAddressIfRequired");
  if (self->_myriadState != 5)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    v7 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:");
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDAInstrumentation logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:", v7, v8, mach_absolute_time());

  }
  -[SCDACoordinator _stopAdvertising:](self, "_stopAdvertising:", v4);
  if (self->_clientIsDirectActivating || self->_clientIsWatchActivation)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    v11 = v10;

    -[SCDAGoodnessScoreEvaluator setLastActivationTime:](self->_goodnessScoreEvaluator, "setLastActivationTime:", v11);
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "-[SCDACoordinator _endAdvertising:]";
      v15 = 2048;
      v16 = v11;
      _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s BTLE activation time %f", (uint8_t *)&v13, 0x16u);
    }
  }

}

- (void)endAdvertising:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SCDACoordinator_endAdvertising___block_invoke;
  v7[3] = &unk_25174ACA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)endAdvertising
{
  -[SCDACoordinator endAdvertising:](self, "endAdvertising:", 0);
}

- (id)_endAdvertisingAnalyticsContext:(BOOL)a3
{
  SCDARecord **p_triggerRecord;
  void *v4;
  SCDARecord *v5;
  void *v6;
  NSObject *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  SCDARecord *maxSlowdownRecord;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  SCDACoordinator *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  int v43;
  id v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  void *v57;
  SCDACoordinator *v58;
  void *v59;
  id v60;
  SCDAArbitrationParticipationContext *v61;
  NSDate *triggerTime;
  void *v63;
  void *v64;
  id v65;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v67;
  _BOOL4 coordinationEnabled;
  uint64_t deviceGroup;
  void *v70;
  SCDAInstrumentation *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  void *v77;
  NSUUID *currentRequestId;
  uint64_t v80;
  void *v81;
  unint64_t lastDecisionTime;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  id v87;
  NSMutableDictionary *obj;
  id obja;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  uint64_t *v95;
  __int128 *v96;
  _QWORD v97[6];
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  int v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[5];
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  char v112;
  _QWORD v113[4];
  id v114;
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  int v118;
  __int128 v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _QWORD v124[2];
  _BYTE v125[128];
  _QWORD v126[2];
  _QWORD v127[5];

  v84 = a3;
  v127[2] = *MEMORY[0x24BDAC8D0];
  p_triggerRecord = &self->_triggerRecord;
  -[SCDARecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDACoordinator _computeElectionParticipantIds:](self, "_computeElectionParticipantIds:", v4);

  v5 = *p_triggerRecord;
  -[SCDAElectionParticipantIds electionParticipantId](self->_electionParticipantIds, "electionParticipantId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDARecord setElectionParticipantId:](v5, "setElectionParticipantId:", v6);

  -[SCDACoordinator _sortedReplies](self, "_sortedReplies");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v85, "count"));
  if (v85 && objc_msgSend(v85, "count"))
  {
    objc_msgSend(v85, "firstObject");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = MEMORY[0x24BDAC760];
    v113[1] = 3221225472;
    v113[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke;
    v113[3] = &unk_25174A6C0;
    v114 = v83;
    objc_msgSend(v85, "enumerateObjectsUsingBlock:", v113);

  }
  else
  {
    v7 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v119) = 136315138;
      *(_QWORD *)((char *)&v119 + 4) = "-[SCDACoordinator _endAdvertisingAnalyticsContext:]";
      _os_log_error_impl(&dword_246211000, v7, OS_LOG_TYPE_ERROR, "%s Myriad decision is based on 0 replies", (uint8_t *)&v119, 0xCu);
    }
    -[SCDACoordinator emptyRecord](self, "emptyRecord");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_alloc(MEMORY[0x24BDBCED8]);
  if (self->_lastDecision)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v126[1] = CFSTR("previous_decision_time");
  v127[0] = v9;
  v126[0] = CFSTR("previous_decision");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), self->_lastDecisionTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v127, v126, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (id)objc_msgSend(v8, "initWithDictionary:", v11);

  objc_msgSend(v87, "setObject:forKey:", v83, CFSTR("goodness_scores"));
  if (v84)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v87, "setObject:forKey:", v12, CFSTR("decision"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v85, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKey:", v13, CFSTR("device_count"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hhu"), objc_msgSend(v86, "goodness"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKey:", v14, CFSTR("winner_goodness"));

  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord && self->_clientIsRespondingToSlowdown && !self->_clientDoneRespondingToSlowdown)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), -[SCDARecord slowdownDelay](maxSlowdownRecord, "slowdownDelay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setObject:forKey:", v16, CFSTR("max_slowdown"));

  }
  v109 = 0;
  v110 = &v109;
  v111 = 0x2020000000;
  v112 = 0;
  v108[0] = MEMORY[0x24BDAC760];
  v108[1] = 3221225472;
  v108[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_192;
  v108[3] = &unk_25174A6E8;
  v108[4] = &v109;
  objc_msgSend(v85, "enumerateObjectsUsingBlock:", v108);
  if (*((_BYTE *)v110 + 24))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v87, "setObject:forKey:", v17, CFSTR("homepod_involved"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v86, "deviceClass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKey:", v18, CFSTR("winner_device_class"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v86, "productType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKey:", v19, CFSTR("winner_product_type"));

  if (!v84)
  {
    if (objc_msgSend(v86, "isATrump"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    objc_msgSend(v87, "setObject:forKey:", v20, CFSTR("winner_sent_suppresssion"));
  }
  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  if (SCDAIsInternalInstall_isInternal)
  {
    if (self->_coordinationEnabled)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    objc_msgSend(v87, "setObject:forKey:", v21, CFSTR("coordination_allowed"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_deviceGroup);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setObject:forKey:", v22, CFSTR("device-group"));

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    v106[0] = MEMORY[0x24BDAC760];
    v106[1] = 3221225472;
    v106[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_2;
    v106[3] = &unk_25174A710;
    v24 = v23;
    v107 = v24;
    objc_msgSend(v85, "enumerateObjectsUsingBlock:", v106);
    objc_msgSend(v87, "setObject:forKey:", v24, CFSTR("election"));
    v81 = v24;
    v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v26 = self;
    obj = self->_replyCounts;
    v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v103 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v26->_replyCounts, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v124[0] = v31;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_replies, "objectForKeyedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "description");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v124[1] = v33;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v34, v30);

          v26 = self;
        }
        v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
      }
      while (v27);
    }

    objc_msgSend(v87, "setObject:forKey:", v25, CFSTR("counts"));
  }
  v35 = objc_alloc_init(MEMORY[0x24BE94A78]);
  objc_msgSend(v35, "setDeviceClass:", objc_msgSend(v86, "deviceClass"));
  objc_msgSend(v35, "setProductType:", objc_msgSend(v86, "productType"));
  objc_msgSend(v35, "setGoodnessScore:", objc_msgSend(v86, "goodness"));
  objc_msgSend(v86, "electionParticipantId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  SCDAToSISchemaUUID(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setElectionParticipantId:", v37);

  *(_QWORD *)&v119 = 0;
  *((_QWORD *)&v119 + 1) = &v119;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__2296;
  v122 = __Block_byref_object_dispose__2297;
  v123 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  if (v84)
  {
    v123 = v35;
    v38 = objc_msgSend(v86, "rawAudioGoodnessScore");
    *((_DWORD *)v99 + 6) = v38;
    if ((objc_msgSend(v86, "isMe") & 1) == 0)
    {
      v39 = *(void **)(*((_QWORD *)&v119 + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&v119 + 1) + 40) = 0;

      v97[0] = MEMORY[0x24BDAC760];
      v97[1] = 3221225472;
      v97[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_214;
      v97[3] = &unk_25174A738;
      v97[4] = &v98;
      v97[5] = &v119;
      objc_msgSend(v85, "enumerateObjectsUsingBlock:", v97);
      if (!*(_QWORD *)(*((_QWORD *)&v119 + 1) + 40))
      {
        v40 = objc_alloc_init(MEMORY[0x24BE94A78]);
        v41 = *(void **)(*((_QWORD *)&v119 + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&v119 + 1) + 40) = v40;

        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "setDeviceClass:", self->_deviceClass);
        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "setProductType:", self->_productType);
        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "setGoodnessScore:", 0);
      }
    }
    v42 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v43 = *((_DWORD *)v99 + 6);
      *(_DWORD *)buf = 136315394;
      v116 = "-[SCDACoordinator _endAdvertisingAnalyticsContext:]";
      v117 = 1024;
      v118 = v43;
      _os_log_debug_impl(&dword_246211000, v42, OS_LOG_TYPE_DEBUG, "%s #myriad won with rawScore: %d", buf, 0x12u);
    }
  }
  else
  {
    v44 = objc_alloc_init(MEMORY[0x24BE94A78]);
    v45 = *(void **)(*((_QWORD *)&v119 + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&v119 + 1) + 40) = v44;

    objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "setDeviceClass:", self->_deviceClass);
    objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "setProductType:", self->_productType);
    objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "setGoodnessScore:", -[SCDARecord goodness](self->_triggerRecord, "goodness"));
  }
  objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 40), "electionParticipantId");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 == 0;

  if (v47)
  {
    v48 = *(void **)(*((_QWORD *)&v119 + 1) + 40);
    -[SCDAElectionParticipantIds electionParticipantId](self->_electionParticipantIds, "electionParticipantId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    SCDAToSISchemaUUID(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setElectionParticipantId:", v50);

  }
  v51 = *(void **)(*((_QWORD *)&v119 + 1) + 40);
  -[SCDAElectionParticipantIds rotatedElectionParticipantId](self->_electionParticipantIds, "rotatedElectionParticipantId");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  SCDAToSISchemaUUID(v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setRotatedElectionParticipantId:", v53);

  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v93[0] = MEMORY[0x24BDAC760];
  v93[1] = 3221225472;
  v93[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_215;
  v93[3] = &unk_25174A760;
  v95 = &v98;
  v96 = &v119;
  v55 = v54;
  v94 = v55;
  objc_msgSend(v85, "enumerateObjectsUsingBlock:", v93);
  obja = (id)mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  v56 = *(double *)&_SCDAMachAbsoluteTimeRate_rate;
  lastDecisionTime = self->_lastDecisionTime;
  v57 = (void *)-[NSUUID copy](self->_currentRequestId, "copy");
  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  v58 = self;
  if (SCDAIsInternalInstall_isInternal)
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    v91[0] = MEMORY[0x24BDAC760];
    v91[1] = 3221225472;
    v91[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_216;
    v91[3] = &unk_25174A6C0;
    v60 = v59;
    v92 = v60;
    objc_msgSend(v85, "enumerateObjectsUsingBlock:", v91);
    v61 = [SCDAArbitrationParticipationContext alloc];
    triggerTime = self->_triggerTime;
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "UUIDString");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[SCDAArbitrationParticipationContext initAdvertisements:decision:requestStartDate:session:voiceTriggerTime:winnerAdvertisement:](v61, "initAdvertisements:decision:requestStartDate:session:voiceTriggerTime:winnerAdvertisement:", v85, v84, triggerTime, v64, v86, (double)self->_voiceTriggerTime);

    -[SCDAInstrumentation userFeedbackPublishArbitrationParticipationContext:](self->_myriadInstrumentation, "userFeedbackPublishArbitrationParticipationContext:", v65);
    myriadInstrumentation = self->_myriadInstrumentation;
    v67 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
    coordinationEnabled = self->_coordinationEnabled;
    deviceGroup = self->_deviceGroup;
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDAInstrumentation logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:withDeviceGroup:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:withDeviceGroup:withCdaId:withTimestamp:", v67, coordinationEnabled, v60, deviceGroup, v70, mach_absolute_time());

    v58 = self;
  }
  v71 = v58->_myriadInstrumentation;
  v72 = -[SCDACoordinator _myriadStateForSelf:](v58, "_myriadStateForSelf:", v58->_myriadState);
  if (v84)
    v73 = 1;
  else
    v73 = 2;
  if (self->_lastDecision)
    v74 = 1;
  else
    v74 = 2;
  v75 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 40);
  v76 = *((_DWORD *)v99 + 6);
  -[SCDASession sessionId](self->_myriadSession, "sessionId");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v80) = v76;
  -[SCDAInstrumentation logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimestamp:](v71, "logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimestamp:", v72, v73, v74, ((unint64_t)(v56 * (double)(unint64_t)obja) - lastDecisionTime) / 0xF4240, v35, v75, v55, v80, 0, v77, v57, mach_absolute_time());

  currentRequestId = self->_currentRequestId;
  self->_currentRequestId = 0;

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v119, 8);

  _Block_object_dispose(&v109, 8);
  return v87;
}

- (void)_endAdvertisingWithDeviceProhibitions:(id)a3
{
  id v4;
  NSObject *v5;
  SCDARecord *maxSlowdownRecord;
  int v7;
  const __CFString *v8;
  float v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  SCDARecord *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_coordinationEnabled)
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SCDACoordinator _endAdvertisingWithDeviceProhibitions:]";
      _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s BTLE advertising is being ignored", buf, 0xCu);
    }
  }
  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord
    && (v7 = -[SCDARecord slowdownDelay](maxSlowdownRecord, "slowdownDelay")) != 0
    && self->_clientIsRespondingToSlowdown
    && !self->_clientDoneRespondingToSlowdown)
  {
    self->_slowdownMsecs = v7;
    v14 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SCDACoordinator _endAdvertisingWithDeviceProhibitions:]";
      v18 = 1024;
      v19 = v7;
      _os_log_impl(&dword_246211000, v14, OS_LOG_TYPE_INFO, "%s BTLE detected a slowdown signal for %d msecs, resetting election for later time", buf, 0x12u);
    }
    -[SCDACoordinator _advertiseTrigger](self, "_advertiseTrigger");
  }
  else
  {
    self->_clientIsDeciding = 1;
    if (-[SCDACoordinator _deviceShouldContinue:](self, "_deviceShouldContinue:", v4))
    {
      if ((unint64_t)-[NSMutableDictionary count](self->_replies, "count") >= 2)
        -[SCDAPowerAssertionManager takePowerAssertionWithName:](self->_powerAssertionManager, "takePowerAssertionWithName:", 0);
      -[SCDACoordinator _winElection](self, "_winElection");
      -[SCDANotifyStatePublisher publishState:](self->_electionWinPublisher, "publishState:", -[SCDACoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
      v8 = CFSTR("listening late");
      v9 = 0.0;
      v10 = 2;
    }
    else
    {
      -[SCDACoordinator _loseElection](self, "_loseElection");
      if (+[SCDAUtilities deviceCanMakeEmergencyCall](SCDAUtilities, "deviceCanMakeEmergencyCall"))
      {
        v8 = CFSTR("wait until after suppress");
        v9 = 1.0;
        v10 = 7;
      }
      else
      {
        -[SCDACoordinator _stopListening:](self, "_stopListening:", 0);
        v11 = SCDALogContextCore;
        v9 = 0.0;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v17 = "-[SCDACoordinator _endAdvertisingWithDeviceProhibitions:]";
          _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s #scda lost and no need to wait for emergency", buf, 0xCu);
        }
        v10 = 0;
        v8 = &stru_25174CE48;
      }
    }
    v12 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
    self->_lastDecisionTime = (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v12);
    self->_clientDoneRespondingToSlowdown = 0;
    -[SCDACoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
    -[SCDACoordinator _endAdvertising:](self, "_endAdvertising:", 0);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __57__SCDACoordinator__endAdvertisingWithDeviceProhibitions___block_invoke;
    v15[3] = &unk_25174A788;
    v15[4] = self;
    v15[5] = v10;
    -[SCDACoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", v8, v15, COERCE_DOUBLE((unint64_t)LODWORD(v9)));
    -[SCDACoordinator _ageWedgeFilter](self, "_ageWedgeFilter");
    -[SCDACoordinator resetReplies](self, "resetReplies");
    -[SCDACoordinator _resetAudioData](self, "_resetAudioData");
    *(_WORD *)&self->_clientIsDirectActivating = 0;
    v13 = self->_maxSlowdownRecord;
    self->_maxSlowdownRecord = 0;

    self->_clientIsRespondingToSlowdown = 0;
    self->_suppressLateTrigger = 0;
    -[SCDACoordinator _resetAdvertisementTimings](self, "_resetAdvertisementTimings");
  }

}

- (void)endAdvertisingWithDeviceProhibitions:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SCDACoordinator_endAdvertisingWithDeviceProhibitions___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)endTask
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SCDACoordinator_endTask__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (BOOL)inTask
{
  NSObject *myriadWorkQueue;
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
  myriadWorkQueue = self->_myriadWorkQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__SCDACoordinator_inTask__block_invoke;
  v5[3] = &unk_25174AD90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadWorkQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setInTask:(BOOL)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  BOOL v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__SCDACoordinator_setInTask___block_invoke;
  v4[3] = &unk_25174AD40;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)setupEnabled:(BOOL)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  BOOL v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__SCDACoordinator_setupEnabled___block_invoke;
  v4[3] = &unk_25174AD40;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)instrumentationUpdateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  SCDAInstrumentation *myriadInstrumentation;
  SCDAInstrumentation *v8;
  SCDAInstrumentation *v9;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  myriadInstrumentation = self->_myriadInstrumentation;
  if (!myriadInstrumentation)
  {
    v8 = objc_alloc_init(SCDAInstrumentation);
    v9 = self->_myriadInstrumentation;
    self->_myriadInstrumentation = v8;

    myriadInstrumentation = self->_myriadInstrumentation;
  }
  -[SCDAInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", v5, v4);
}

- (void)setCurrentRequestId:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SCDACoordinator_setCurrentRequestId___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)faceDetectedBoostWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SCDACoordinator_faceDetectedBoostWithContext___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_forceLocalWinner:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCDACoordinator *v9;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SCDACoordinator__forceLocalWinner___block_invoke;
  v7[3] = &unk_25174A620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (BOOL)_deviceShouldContinue:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL8 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _BOOL4 v13;
  _BOOL8 clientIsDirectActivating;
  int v15;
  uint64_t v16;
  _BOOL8 clientIsInEarActivation;
  int v19;
  const char *v20;
  __int16 v21;
  _BOOL8 v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  _BOOL8 v26;
  __int16 v27;
  _BOOL8 v28;
  __int16 v29;
  _BOOL8 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v19 = 136315138;
    v20 = "-[SCDACoordinator _deviceShouldContinue:]";
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v19, 0xCu);
  }
  if (self->_coordinationEnabled)
  {
    if (self->_clientIsInEarActivation && -[SCDARecord isATrump](self->_triggerRecord, "isATrump"))
      v6 = !-[SCDARecord isInEarTrump](self->_triggerRecord, "isInEarTrump");
    else
      v6 = 0;
    v7 = self->_suppressLateTrigger && !self->_clientIsDirectActivating;
    v13 = -[SCDACoordinator _shouldContinueFor:](self, "_shouldContinueFor:", v4);
    clientIsDirectActivating = self->_clientIsDirectActivating;
    if (self->_clientIsDirectActivating)
      v15 = 1;
    else
      v15 = v6;
    v9 = (v15 | v13) & !v7;
    v16 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      clientIsInEarActivation = self->_clientIsInEarActivation;
      v19 = 136316418;
      v20 = "-[SCDACoordinator _deviceShouldContinue:]";
      v21 = 2048;
      v22 = v9;
      v23 = 2048;
      v24 = 0;
      v25 = 2048;
      v26 = clientIsDirectActivating;
      v27 = 2048;
      v28 = clientIsInEarActivation;
      v29 = 2048;
      v30 = v7;
      v10 = "%s BTLE deviceShouldContinue:%ld (coordinationDisabled:%ld, isDirectlyActivating:%ld, isInEarTrigger:%ld, su"
            "ppressLateTrigger:%ld.";
      v11 = v16;
      v12 = 62;
      goto LABEL_18;
    }
  }
  else
  {
    v8 = SCDALogContextCore;
    LOBYTE(v9) = 1;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = "-[SCDACoordinator _deviceShouldContinue:]";
      v10 = "%s Coordination disabled, continuing with the request)";
      LOBYTE(v9) = 1;
      v11 = v8;
      v12 = 12;
LABEL_18:
      _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v19, v12);
    }
  }

  return v9;
}

- (void)_winElection
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[SCDACoordinator _winElection]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad won", (uint8_t *)&v13, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained(&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v8, "scdaShouldContinue:", self);

    }
  }
  self->_clientIsListeningAfterRecentWin = 1;
  v9 = -[SCDACoordinator _endAdvertisingAnalyticsContext:](self, "_endAdvertisingAnalyticsContext:", 1);
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemUptime");
  v12 = v11;

  -[SCDAGoodnessScoreEvaluator setLastActivationTime:](self->_goodnessScoreEvaluator, "setLastActivationTime:", v12);
  self->_lastDecision = 1;
}

- (void)_loseElection
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[SCDACoordinator _loseElection]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad loss", (uint8_t *)&v13, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained(&self->_delegate),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v8, "scdaShouldAbortAnotherDeviceBetter:", self);

    self->_nTimesExtended = 0;
  }
  else
  {
    v9 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v11 = objc_loadWeakRetained(&self->_delegate);
      v13 = 136315394;
      v14 = "-[SCDACoordinator _loseElection]";
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_246211000, v10, OS_LOG_TYPE_INFO, "%s BTLE unable to cancel against: %@", (uint8_t *)&v13, 0x16u);

    }
  }
  v12 = -[SCDACoordinator _endAdvertisingAnalyticsContext:](self, "_endAdvertisingAnalyticsContext:", 0);
  kdebug_trace();
  -[SCDANotifyStatePublisher publishState:](self->_electionLossPublisher, "publishState:", -[SCDACoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
  -[SCDAGoodnessScoreEvaluator setLastActivationTime:](self->_goodnessScoreEvaluator, "setLastActivationTime:", 0.0);
  self->_lastDecision = 0;
  self->_inTask = 0;
  self->_ignoreInTaskTimer = 0;
}

- (id)_myriadSession
{
  return self->_myriadSession;
}

- (void)_addElectionAdvertisementDataToMyriadSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  SCDASession **p_myriadSession;
  void *v14;
  SCDASession *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDACoordinator _myriadSession](self, "_myriadSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__SCDACoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke;
    v18[3] = &unk_25174A7B0;
    v18[4] = self;
    v7 = v4;
    v19 = v7;
    v8 = v5;
    v20 = v8;
    objc_msgSend(v6, "mutatedCopyWithMutator:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v12, "myriadCoordinator:didAddAdvertisement:toSession:", self, v7, self->_myriadSession);

    }
    p_myriadSession = &self->_myriadSession;
    objc_storeStrong((id *)p_myriadSession, v9);
    v14 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v15 = *p_myriadSession;
      v16 = v14;
      -[SCDASession sessionId](v15, "sessionId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SCDACoordinator _addElectionAdvertisementDataToMyriadSession:]";
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_246211000, v16, OS_LOG_TYPE_INFO, "%s #scda Election advertisement %@ added to myriad session %@", buf, 0x20u);

    }
  }

}

- (void)_createMyriadSessionIfRequired
{
  void *v3;
  unint64_t myriadState;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  SCDASession *v11;
  SCDASession *myriadSession;
  void *v13;
  SCDASession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  char v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_myriadSession
    || ((v7 = self->_myriadState, v8 = v7 > 0x11, v9 = (1 << v7) & 0x2C003, !v8) ? (v10 = v9 == 0) : (v10 = 1), v10))
  {
    v3 = (void *)SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      return;
    myriadState = self->_myriadState;
    v5 = v3;
    -[SCDACoordinator _stateAsString:](self, "_stateAsString:", myriadState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[SCDACoordinator _createMyriadSessionIfRequired]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s #scda not initializing myriad session, myriad is in state %@", (uint8_t *)&v20, 0x16u);

    goto LABEL_12;
  }
  v11 = +[SCDASession newWithBuilder:](SCDASession, "newWithBuilder:", &__block_literal_global_2293);
  myriadSession = self->_myriadSession;
  self->_myriadSession = v11;

  v13 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v14 = self->_myriadSession;
    v15 = v13;
    -[SCDASession sessionId](v14, "sessionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDACoordinator _stateAsString:](self, "_stateAsString:", self->_myriadState);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315650;
    v21 = "-[SCDACoordinator _createMyriadSessionIfRequired]";
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_246211000, v15, OS_LOG_TYPE_INFO, "%s #scda Initialized myriad session %@ when myriad is in state %@", (uint8_t *)&v20, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(&self->_delegate);
    -[NSObject scdaWillStartWithSession:](v5, "scdaWillStartWithSession:", self->_myriadSession);
LABEL_12:

  }
}

- (void)updateRequestId:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCDACoordinator *v9;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SCDACoordinator_updateRequestId___block_invoke;
  v7[3] = &unk_25174A620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_clearMyriadSession
{
  id *p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  SCDASession *myriadSession;
  NSObject *v9;
  void *v10;
  void *v11;
  SCDASession *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_myriadSession)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(p_delegate);
      objc_msgSend(v6, "scdaWillEndSession:", self->_myriadSession);

    }
    v7 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      myriadSession = self->_myriadSession;
      v9 = v7;
      -[SCDASession sessionId](myriadSession, "sessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[SCDACoordinator _clearMyriadSession]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s #scda Clearing myriad session %@", (uint8_t *)&v13, 0x16u);

    }
    -[SCDASession electionAdvertisementDataByIds](self->_myriadSession, "electionAdvertisementDataByIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_238);

    v12 = self->_myriadSession;
    self->_myriadSession = 0;

  }
}

- (void)_initializeTimer
{
  NSObject *v3;
  NSObject *timer;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSUUID *eventToken;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SCDACoordinator _initializeTimer]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  v6 = self->_timer;
  self->_timer = v5;

  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global_239);
  dispatch_resume((dispatch_object_t)self->_timer);
  eventToken = self->_eventToken;
  self->_eventToken = 0;

}

- (void)_createDispatchTimerWithTime:(unint64_t)a3 toExecute:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  SCDACoordinator *v13;
  id v14;

  v6 = a4;
  dispatch_suspend((dispatch_object_t)self->_timer);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_eventToken, v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SCDACoordinator__createDispatchTimerWithTime_toExecute___block_invoke;
  v11[3] = &unk_25174ACF0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x249555380](v11);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v10);
  dispatch_resume((dispatch_object_t)self->_timer);

}

- (void)_createDispatchTimerFor:(double)a3 toExecute:(id)a4
{
  int64_t v5;
  id v6;

  v5 = (uint64_t)(a3 * 1000000000.0);
  v6 = a4;
  -[SCDACoordinator _createDispatchTimerWithTime:toExecute:](self, "_createDispatchTimerWithTime:toExecute:", dispatch_time(0, v5), v6);

}

- (void)_createDispatchTimerForEvent:(id)a3 toExecute:(id)a4
{
  id v6;
  double v7;
  timespec v8;

  v6 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  v8.tv_sec = (int)v7;
  v8.tv_nsec = (uint64_t)((v7 - (double)(int)v7) * 1000000000.0);
  -[SCDACoordinator _createDispatchTimerWithTime:toExecute:](self, "_createDispatchTimerWithTime:toExecute:", dispatch_walltime(&v8, 0), v6);

}

- (void)_startListenTimer
{
  double v2;

  LODWORD(v2) = 0.5;
  -[SCDACoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", CFSTR("listen"), 0, v2);
}

- (void)_startTimer:(id)a3 for:(float)a4 thenExecute:(id)a5
{
  NSString *v8;
  id v9;
  NSObject *v10;
  double v11;
  NSString *timerLabel;
  NSString *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = (NSString *)a3;
  v9 = a5;
  v10 = SCDALogContextCore;
  v11 = a4;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[SCDACoordinator _startTimer:for:thenExecute:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_246211000, v10, OS_LOG_TYPE_INFO, "%s BTLE starting %@ timer for %f secs", buf, 0x20u);
  }
  timerLabel = self->_timerLabel;
  self->_timerLabel = v8;
  v13 = v8;

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__SCDACoordinator__startTimer_for_thenExecute___block_invoke;
  v15[3] = &unk_25174ACA0;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  -[SCDACoordinator _createDispatchTimerFor:toExecute:](self, "_createDispatchTimerFor:toExecute:", v15, v11);

}

- (void)_startTimer:(id)a3 for:(float)a4 thenEnterState:(unint64_t)a5
{
  id v8;
  double v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SCDACoordinator__startTimer_for_thenEnterState___block_invoke;
  v10[3] = &unk_25174A878;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a5;
  *(float *)&v9 = a4;
  -[SCDACoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", v8, v10, v9);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)_cancelTimer
{
  NSObject *timer;
  void *v4;
  NSString *timerLabel;
  unint64_t myriadState;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  timer = self->_timer;
  if (timer && !dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    dispatch_source_cancel(timer);
    v4 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      timerLabel = self->_timerLabel;
      myriadState = self->_myriadState;
      v7 = v4;
      -[SCDACoordinator _stateAsString:](self, "_stateAsString:", myriadState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315650;
      v10 = "-[SCDACoordinator _cancelTimer]";
      v11 = 2112;
      v12 = timerLabel;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s BTLE timer %@ cancelled (%@)", (uint8_t *)&v9, 0x20u);

    }
  }
}

- (void)_setOverallTimeout
{
  NSObject *v3;
  SCDAWatchdogTimer *v4;
  OS_dispatch_queue *myriadWorkQueue;
  SCDAWatchdogTimer *v6;
  SCDAWatchdogTimer *overallTimeout;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_overallTimeout)
    -[SCDACoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SCDACoordinator _setOverallTimeout]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE Coordinator setting overall timeout", buf, 0xCu);
  }
  v4 = [SCDAWatchdogTimer alloc];
  myriadWorkQueue = self->_myriadWorkQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SCDACoordinator__setOverallTimeout__block_invoke;
  v8[3] = &unk_25174AD68;
  v8[4] = self;
  v6 = -[SCDAWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v4, "initWithTimeoutInterval:onQueue:timeoutHandler:", myriadWorkQueue, v8, 31.0);
  overallTimeout = self->_overallTimeout;
  self->_overallTimeout = v6;

}

- (void)_cancelOverallTimeout
{
  SCDAWatchdogTimer *overallTimeout;
  NSObject *v4;
  SCDAWatchdogTimer *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  overallTimeout = self->_overallTimeout;
  if (overallTimeout)
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[SCDACoordinator _cancelOverallTimeout]";
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s BTLE Coordinator cancelling overall timeout", (uint8_t *)&v9, 0xCu);
      overallTimeout = self->_overallTimeout;
    }
    -[SCDAWatchdogTimer cancelIfNotAlreadyCanceled](overallTimeout, "cancelIfNotAlreadyCanceled");
    v5 = self->_overallTimeout;
    self->_overallTimeout = 0;

    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v8, "myriadCoordinatorOverallTimerCancelled:", self);

    }
  }
}

- (void)_enterState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  double v11;
  id v12;
  SCDARecord *overrideMyriadRecord;
  NSMutableDictionary *v14;
  NSMutableDictionary *multipleContinuations;
  NSMutableDictionary *v16;
  NSMutableDictionary *repliesBeforeDecision;
  NSUUID *eventToken;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v20;
  void *v21;
  SCDAContext *currentMyriadContext;
  id waitForWiproxReadinessToScan;
  NSObject *v24;
  _BOOL4 coordinationEnabled;
  _BOOL4 BLEActivityEnabled;
  NSObject *v27;
  uint64_t v28;
  double TimeInterval;
  void *v30;
  unint64_t latestRecordReceivedTime;
  SCDAContext *v32;
  NSObject *v33;
  uint64_t v34;
  NSMutableDictionary *replies;
  SCDARecord *triggerRecord;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  SCDACoordinator *v41;
  uint64_t v42;
  uint64_t v43;
  int nTimesContinued;
  NSObject *v45;
  int v46;
  void *v47;
  NSObject *v48;
  SCDACoordinator *v49;
  uint64_t v50;
  void *v51;
  id v52;
  char v53;
  NSObject *v54;
  void *v55;
  id v56;
  char v57;
  int nTimesExtended;
  NSObject *v59;
  int v60;
  NSObject *v61;
  _BOOL4 v62;
  _BOOL4 v63;
  __CFNotificationCenter *DarwinNotifyCenter;
  SCDACoordinator *v65;
  uint64_t v66;
  NSObject *myriadWorkQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  _BYTE v72[10];
  double v73;
  __int16 v74;
  unint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    -[SCDACoordinator _stateAsString](self, "_stateAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDACoordinator _stateAsString:](self, "_stateAsString:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v70 = "-[SCDACoordinator _enterState:]";
    v71 = 2112;
    *(_QWORD *)v72 = v7;
    *(_WORD *)&v72[8] = 2112;
    v73 = *(double *)&v8;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s BTLE Coordinator altered state: %@ -> %@", buf, 0x20u);

  }
  self->_previousState = self->_myriadState;
  self->_myriadState = a3;
  -[SCDACoordinator _enteringIntoState:fromState:](self, "_enteringIntoState:fromState:", a3);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v12 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v12, "myriadCoordinator:didEnterState:fromState:", self, self->_myriadState, self->_previousState);

  }
  switch(a3)
  {
    case 0uLL:
      -[SCDACoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");
      -[SCDAPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      overrideMyriadRecord = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      *(_WORD *)&self->_clientIsWatchActivation = 0;
      self->_clientIsInEarActivation = 0;
      *(_WORD *)&self->_clientRespondingToCarPlay = 0;
      -[SCDACoordinator _stopAdvertisingAndListening](self, "_stopAdvertisingAndListening");
      -[SCDACoordinator _resetActionWindows](self, "_resetActionWindows");
      if (self->_ducking)
        -[SCDACoordinator _unduck](self, "_unduck");
      if (-[NSMutableDictionary count](self->_multipleContinuations, "count"))
      {
        v14 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
        multipleContinuations = self->_multipleContinuations;
        self->_multipleContinuations = v14;

      }
      -[SCDACoordinator _cancelTimer](self, "_cancelTimer");
      -[SCDACoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
      -[SCDACoordinator _clearWiProxReadinessTimer](self, "_clearWiProxReadinessTimer");
      -[SCDACoordinator resetReplies](self, "resetReplies");
      v16 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
      repliesBeforeDecision = self->_repliesBeforeDecision;
      self->_repliesBeforeDecision = v16;

      -[SCDACoordinator _handleStateMachineErrorIfNeeded](self, "_handleStateMachineErrorIfNeeded");
      eventToken = self->_eventToken;
      self->_eventToken = 0;

      self->_recordType = 0;
      self->_previousState = 0;
      self->_suppressLateTrigger = 0;
      -[SCDACoordinator _resetAdvertisementTimings](self, "_resetAdvertisementTimings");
      -[SCDACoordinator _resetAudioData](self, "_resetAudioData");
      myriadInstrumentation = self->_myriadInstrumentation;
      v20 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      -[SCDASession sessionId](self->_myriadSession, "sessionId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCDAInstrumentation logCDADeviceStateActivityEnded:withCdaId:withTimestamp:](myriadInstrumentation, "logCDADeviceStateActivityEnded:withCdaId:withTimestamp:", v20, v21, mach_absolute_time());

      -[SCDACoordinator _clearMyriadSession](self, "_clearMyriadSession");
      -[SCDAAdvertisementContextManager reset](self->_advContextManager, "reset");
      currentMyriadContext = self->_currentMyriadContext;
      self->_currentMyriadContext = 0;

      waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
      self->_waitForWiproxReadinessToScan = 0;

      return;
    case 1uLL:
      v24 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        coordinationEnabled = self->_coordinationEnabled;
        BLEActivityEnabled = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        v70 = "-[SCDACoordinator _enterState:]";
        v71 = 1024;
        *(_DWORD *)v72 = coordinationEnabled;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = BLEActivityEnabled;
        _os_log_impl(&dword_246211000, v24, OS_LOG_TYPE_INFO, "%s #scda coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      if (-[SCDACoordinator _shouldStopListeningBeforeAdvertising](self, "_shouldStopListeningBeforeAdvertising"))
      {
        v27 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v70 = "-[SCDACoordinator _enterState:]";
          _os_log_impl(&dword_246211000, v27, OS_LOG_TYPE_INFO, "%s #scda Force stopping BTLE scan", buf, 0xCu);
        }
        -[SCDACoordinator _stopListening:](self, "_stopListening:", 0);
      }
      if (-[SCDAContext activationSource](self->_currentMyriadContext, "activationSource") != 13
        || self->_clientIsDirectActivating)
      {
        goto LABEL_24;
      }
      v28 = mach_absolute_time();
      TimeInterval = SCDAMachAbsoluteTimeGetTimeInterval(v28 - self->_voiceTriggerTime);
      v30 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        latestRecordReceivedTime = self->_latestRecordReceivedTime;
        v32 = self->_currentMyriadContext;
        v33 = v30;
        v34 = -[SCDAContext activationExpirationTime](v32, "activationExpirationTime");
        *(_DWORD *)buf = 136316418;
        v70 = "-[SCDACoordinator _enterState:]";
        v71 = 2048;
        *(_QWORD *)v72 = 13;
        *(_WORD *)&v72[8] = 2048;
        v73 = TimeInterval;
        v74 = 2048;
        v75 = latestRecordReceivedTime;
        v76 = 2048;
        v77 = v28;
        v78 = 2048;
        v79 = v34;
        _os_log_impl(&dword_246211000, v33, OS_LOG_TYPE_INFO, "%s Activation source: %ld, Time since activation: %f, last election record received time: %llu, current time: %llu, activation expiration time: %llu", buf, 0x3Eu);

      }
      if (TimeInterval > 0.949999988
        && v28 < -[SCDAContext activationExpirationTime](self->_currentMyriadContext, "activationExpirationTime")
        && self->_latestRecordReceivedTime >= self->_voiceTriggerTime)
      {
        myriadWorkQueue = self->_myriadWorkQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __31__SCDACoordinator__enterState___block_invoke;
        block[3] = &unk_25174AD68;
        block[4] = self;
        dispatch_async(myriadWorkQueue, block);
      }
      else
      {
LABEL_24:
        self->_inTask = 1;
        self->_ducking = 1;
        self->_nTimesContinued = 0;
        replies = self->_replies;
        triggerRecord = self->_triggerRecord;
        -[SCDARecord deviceID](triggerRecord, "deviceID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "UUIDString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](replies, "setObject:forKey:", triggerRecord, v38);

        self->_lastPHash = -[SCDARecord pHash](self->_triggerRecord, "pHash");
        -[SCDACoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
        -[SCDARecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCDACoordinator _addElectionAdvertisementDataToMyriadSession:](self, "_addElectionAdvertisementDataToMyriadSession:", v39);

        -[SCDACoordinator _setupActionWindows](self, "_setupActionWindows");
        -[SCDACoordinator _setOverallTimeout](self, "_setOverallTimeout");
        -[SCDACoordinator _advertiseTrigger](self, "_advertiseTrigger");
      }
      return;
    case 2uLL:
      self->_slowdownMsecs = 0;
      v40 = CFSTR("listen late");
      LODWORD(v11) = 1.0;
      v41 = self;
      v42 = 4;
      goto LABEL_64;
    case 3uLL:
      self->_recordType = 9;
      -[SCDACoordinator lateSuppressionRecord](self, "lateSuppressionRecord");
      v43 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    case 4uLL:
      if (self->_nTimesContinued >= 5)
        -[SCDAPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
      if ((self->_inSetupMode || self->_inTask)
        && (nTimesContinued = self->_nTimesContinued, self->_nTimesContinued = nTimesContinued + 1, nTimesContinued < 20))
      {
        -[SCDACoordinator _stopAdvertisingAndListening](self, "_stopAdvertisingAndListening");
        v49 = self;
        v50 = 5;
LABEL_69:
        -[SCDACoordinator _duringNextWindowEnterState:](v49, "_duringNextWindowEnterState:", v50);
      }
      else
      {
        -[SCDACoordinator _enterState:](self, "_enterState:", 0);
      }
      return;
    case 5uLL:
      v45 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v46 = self->_nTimesContinued;
        *(_DWORD *)buf = 136315394;
        v70 = "-[SCDACoordinator _enterState:]";
        v71 = 1024;
        *(_DWORD *)v72 = v46;
        _os_log_impl(&dword_246211000, v45, OS_LOG_TYPE_INFO, "%s BTLE task continuation: %d", buf, 0x12u);
      }
      if (!+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman"))
      {
        v65 = self;
        v66 = 4;
        goto LABEL_67;
      }
      self->_recordType = 2;
      -[SCDACoordinator continuationRecord](self, "continuationRecord");
      v43 = objc_claimAutoreleasedReturnValue();
LABEL_38:
      v47 = (void *)v43;
      -[SCDACoordinator _advertise:andMoveTo:](self, "_advertise:andMoveTo:", v43, 4);
LABEL_56:

      break;
    case 6uLL:
      -[SCDACoordinator directTriggerRecord](self, "directTriggerRecord");
      v43 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    case 7uLL:
      v48 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[SCDACoordinator _enterState:]";
        _os_log_impl(&dword_246211000, v48, OS_LOG_TYPE_INFO, "%s BTLE task SCDA_WAIT_EMERGENCY_OR_TASK only stopping advertising, not listening", buf, 0xCu);
      }
      -[SCDACoordinator _stopAdvertising:](self, "_stopAdvertising:", 0);
      -[SCDACoordinator _startListening:](self, "_startListening:", 0);
      -[SCDAPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
      self->_slowdownMsecs = 0;
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      v49 = self;
      v50 = 10;
      goto LABEL_69;
    case 8uLL:
      self->_recordType = 4;
      -[SCDACoordinator emergencyRecord](self, "emergencyRecord");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCDACoordinator _advertise:andMoveTo:](self, "_advertise:andMoveTo:", v51, 11);

      v52 = objc_loadWeakRetained(&self->_delegate);
      v53 = objc_opt_respondsToSelector();

      if ((v53 & 1) == 0)
        return;
      v47 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v47, "myriadCoordinatorIsAdvertisingEmergency:", self);
      goto LABEL_56;
    case 9uLL:
      v54 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[SCDACoordinator _enterState:]";
        _os_log_impl(&dword_246211000, v54, OS_LOG_TYPE_INFO, "%s BTLE emergency is being handled", buf, 0xCu);
      }
      self->_recordType = 5;
      -[SCDACoordinator emergencyHandledRecord](self, "emergencyHandledRecord");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCDACoordinator _advertise:andMoveTo:](self, "_advertise:andMoveTo:", v55, 4);

      -[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad](self->_callPunchout, "initiateEmergencyCallMyriad");
      v56 = objc_loadWeakRetained(&self->_delegate);
      v57 = objc_opt_respondsToSelector();

      if ((v57 & 1) == 0)
        return;
      v47 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v47, "scdaCoordinatorWillHandleEmergency:", self);
      goto LABEL_56;
    case 0xAuLL:
      nTimesExtended = self->_nTimesExtended;
      self->_nTimesExtended = nTimesExtended + 1;
      if (nTimesExtended > 18)
        goto LABEL_65;
      -[SCDACoordinator _startListening:](self, "_startListening:", 0);
      v40 = CFSTR("listen wait/emergency");
      LODWORD(v11) = 0.75;
      goto LABEL_63;
    case 0xBuLL:
      v59 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[SCDACoordinator _enterState:]";
        _os_log_impl(&dword_246211000, v59, OS_LOG_TYPE_INFO, "%s BTLE task SCDA_WAIT_EMERGENCY_HANDLED only stopping advertising, not listening", buf, 0xCu);
      }
      -[SCDACoordinator _stopAdvertising:](self, "_stopAdvertising:", 0);
      v49 = self;
      v50 = 12;
      goto LABEL_69;
    case 0xCuLL:
      v60 = self->_nTimesExtended;
      self->_nTimesExtended = v60 + 1;
      if (v60 > 18)
      {
LABEL_65:
        v65 = self;
        v66 = 0;
LABEL_67:
        -[SCDACoordinator enterState:](v65, "enterState:", v66);
      }
      else
      {
        -[SCDACoordinator _startListening:](self, "_startListening:", 0);
        v40 = CFSTR("listen emergency handled");
        LODWORD(v11) = 0.75;
        v41 = self;
        v42 = 11;
LABEL_64:
        -[SCDACoordinator _startTimer:for:thenEnterState:](v41, "_startTimer:for:thenEnterState:", v40, v42, v11);
      }
      break;
    case 0xDuLL:
      -[SCDACoordinator directTriggerRecord](self, "directTriggerRecord");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCDACoordinator _advertiseIndefinite:](self, "_advertiseIndefinite:", v47);
      goto LABEL_56;
    case 0xEuLL:
      v61 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v62 = self->_coordinationEnabled;
        v63 = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        v70 = "-[SCDACoordinator _enterState:]";
        v71 = 1024;
        *(_DWORD *)v72 = v62;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = v63;
        _os_log_impl(&dword_246211000, v61, OS_LOG_TYPE_INFO, "%s #scda coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.decision.won"), 0, 0, 1u);
      -[SCDACoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
      -[SCDACoordinator _advertiseSuppressTriggerInOutput](self, "_advertiseSuppressTriggerInOutput");
      return;
    case 0xFuLL:
      -[SCDACoordinator resetReplies](self, "resetReplies");
      -[SCDACoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
      -[SCDACoordinator _startListeningAfterWiProxIsReady:inState:completion:](self, "_startListeningAfterWiProxIsReady:inState:completion:", +[SCDAUtilities isMac](SCDAUtilities, "isMac"), 15, 0);
      v40 = CFSTR("preheat timer");
      LODWORD(v11) = 2.0;
      goto LABEL_63;
    case 0x10uLL:
      self->_recordType = 8;
      -[SCDACoordinator _advertiseSlowdown](self, "_advertiseSlowdown");
      return;
    case 0x11uLL:
      -[SCDACoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
      -[SCDACoordinator _startListening:](self, "_startListening:", 0);
      v40 = CFSTR("filter initialization timer");
      LODWORD(v11) = 1.0;
LABEL_63:
      v41 = self;
      v42 = 0;
      goto LABEL_64;
    default:
      return;
  }
}

- (void)enterState:(unint64_t)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[6];

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__SCDACoordinator_enterState___block_invoke;
  v4[3] = &unk_25174A788;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(myriadWorkQueue, v4);
}

- (id)_stateAsString
{
  return -[SCDACoordinator _stateAsString:](self, "_stateAsString:", self->_myriadState);
}

- (id)_stateAsString:(unint64_t)a3
{
  if (a3 > 0x11)
    return CFSTR("<SCDA_State_ERROR>");
  else
    return off_25174ABE8[a3];
}

- (void)_enteringIntoState:(unint64_t)a3 fromState:(unint64_t)a4
{
  if (a4 == 1)
  {
    self->_clientIsDeciding = 0;
    -[SCDACoordinator _resetAdvertisementTimings](self, "_resetAdvertisementTimings", a3);
  }
}

- (void)resetReplies
{
  NSMutableDictionary *v3;
  NSMutableDictionary *replies;
  NSMutableDictionary *v5;
  NSMutableDictionary *replyCounts;

  objc_storeStrong((id *)&self->_repliesBeforeDecision, self->_replies);
  v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  replies = self->_replies;
  self->_replies = v3;

  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  replyCounts = self->_replyCounts;
  self->_replyCounts = v5;

}

- (void)_startListening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  SCDACoordinator *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SCDACoordinator _startListening:]";
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  -[SCDACoordinator _enterBLEDiagnosticMode](self, "_enterBLEDiagnosticMode");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __35__SCDACoordinator__startListening___block_invoke;
  v15 = &unk_25174ACA0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[SCDACoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", &v12);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "scdaListeningDidBegin:", self, v12, v13, v14, v15, v16);

    }
  }

}

- (void)_startListeningAfterWiProxIsReady:(BOOL)a3 inState:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  id waitForWiproxReadinessToScan;
  _QWORD v12[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (v6 && !self->_BTLEReady)
  {
    v9 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[SCDACoordinator _startListeningAfterWiProxIsReady:inState:completion:]";
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s Waiting for wiprox to be ready in state: %lu", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __72__SCDACoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke;
    v12[3] = &unk_25174A8A0;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a4;
    v13 = v8;
    v10 = (void *)MEMORY[0x249555380](v12);
    waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
    self->_waitForWiproxReadinessToScan = v10;

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[SCDACoordinator _startListening:](self, "_startListening:", v8);
  }

}

- (void)startListening
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SCDACoordinator_startListening__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startListening:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SCDACoordinator_startListening___block_invoke;
  v7[3] = &unk_25174ACA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (BOOL)_shouldStopListeningBeforeAdvertising
{
  return (self->_previousState < 0x12) & (0x37FFCu >> self->_previousState);
}

- (void)_stopAdvertising:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  SCDACoordinator *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SCDACoordinator _stopAdvertising:]";
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __36__SCDACoordinator__stopAdvertising___block_invoke;
  v15 = &unk_25174ACA0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[SCDACoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", &v12);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "scdaAdvertisingDidEnd:", self, v12, v13, v14, v15, v16);

    }
  }

}

- (void)_stopListening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  SCDACoordinator *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SCDACoordinator _stopListening:]";
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __34__SCDACoordinator__stopListening___block_invoke;
  v15 = &unk_25174ACA0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[SCDACoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", &v12);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "scdaListeningDidEnd:", self, v12, v13, v14, v15, v16);

    }
  }

}

- (void)stopListening
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SCDACoordinator_stopListening__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)stopListening:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SCDACoordinator_stopListening___block_invoke;
  v7[3] = &unk_25174ACA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_stopAdvertisingAndListening
{
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  _QWORD v13[5];

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__SCDACoordinator__stopAdvertisingAndListening__block_invoke;
  v13[3] = &unk_25174AD68;
  v13[4] = self;
  -[SCDACoordinator _waitWiProx:andExecute:](self, "_waitWiProx:andExecute:", 2000, v13);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v7, "scdaAdvertisingDidEnd:", self);

    }
  }
  v8 = objc_loadWeakRetained(&self->_delegate);
  if (v8)
  {
    v9 = v8;
    v10 = objc_loadWeakRetained(&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v12, "scdaListeningDidEnd:", self);

    }
  }
}

- (void)_unduck
{
  id *p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  if (self->_coordinationEnabled)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained(p_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained(p_delegate);
        objc_msgSend(v8, "scdaShouldUnduck:", self);

      }
    }
  }
}

- (void)_handleStateMachineErrorIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_stateMachineEncounteredError)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[SCDACoordinator _handleStateMachineErrorIfNeeded]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify Myriad win due to state machine error", (uint8_t *)&v10, 0xCu);
    }
    v4 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
    self->_lastDecisionTime = (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v4);
    if (SCDAIsInternalInstall_onceToken != -1)
      dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
    if (SCDAIsInternalInstall_isInternal)
      -[SCDACoordinator _triggerABCForType:context:](self, "_triggerABCForType:context:", CFSTR("state_machine_error"), 0);
    self->_lastDecision = 1;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained(&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v9 = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend(v9, "scdaShouldContinue:", self);

      }
    }
    kdebug_trace();
    -[SCDANotifyStatePublisher publishState:](self->_electionWinPublisher, "publishState:", -[SCDACoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
    self->_stateMachineEncounteredError = 0;
  }
}

- (double)_contextFetchDelayForAdvertimentInterval:(double)a3 advertisementDelay:(double)a4
{
  return a3 + -0.2;
}

- (BOOL)_shouldUseContextCollector
{
  unint64_t myriadState;

  myriadState = self->_myriadState;
  return myriadState == 1 || myriadState == 14;
}

- (id)_testAndFilterAdvertisementsFromContextCollector:(id)a3 voiceTriggerEndTime:(double)a4 advertisementDispatchTime:(double)a5 advertisement:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  double v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __128__SCDACoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke;
    v29[3] = &unk_25174A8C8;
    v32 = a4;
    v29[4] = self;
    v30 = v10;
    v12 = v11;
    v31 = v12;
    v24 = v9;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v29);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            *(_DWORD *)buf = 136315394;
            v34 = "-[SCDACoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDi"
                  "spatchTime:advertisement:]";
            v35 = 2112;
            v36 = v19;
            _os_log_impl(&dword_246211000, v18, OS_LOG_TYPE_INFO, "%s #scda %@", buf, 0x16u);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v15);
    }

    v20 = v31;
    v21 = v13;

    v9 = v24;
  }
  else
  {
    v22 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SCDACoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDispatch"
            "Time:advertisement:]";
      _os_log_impl(&dword_246211000, v22, OS_LOG_TYPE_INFO, "%s #scda Context collector returned 0 SCDAAdvertisementContextRecords instances", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (void)_suppressDeviceIfNeededWithVoiceTriggerEndTime:(double)a3 adverisementDispatchTime:(double)a4
{
  double v7;
  double v8;
  uint64_t v9;
  NSMutableDictionary *replies;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v13;
  float v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;
  _QWORD v20[9];

  v7 = a4 - a3;
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = -v7;
  v9 = -[NSMutableDictionary count](self->_replies, "count");
  if (v8 > 1.45000005 && v9 != 0)
  {
    replies = self->_replies;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91__SCDACoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke;
    v20[3] = &unk_25174A8F0;
    *(double *)&v20[5] = a3;
    *(double *)&v20[6] = a4;
    *(double *)&v20[7] = v8;
    v20[8] = v9;
    v20[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](replies, "enumerateKeysAndObjectsUsingBlock:", v20);
  }
  if (self->_suppressLateTrigger)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    v13 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v15 = mach_absolute_time();
    LODWORD(v16) = -1.0;
    LODWORD(v17) = 0.75;
    v14 = v8;
    *(float *)&v18 = v14;
    -[SCDAInstrumentation logCDAElectionAdvertisingStarting:withDelay:withInterval:withVoiceTriggerLatency:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingStarting:withDelay:withInterval:withVoiceTriggerLatency:withCdaId:withTimestamp:", v13, v19, v15, v16, v17, v18);

  }
}

- (void)_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:(double)a3 advertisementDelay:(double)a4
{
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 clientIsDirectActivating;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  unint64_t voiceTriggerTime;
  SCDAAdvertisementContextRecord *v19;
  int64_t recordType;
  NSUUID *designatedSelfID;
  void *v22;
  SCDAAdvertisementContextRecord *v23;
  SCDAAdvertisementContextRecord *contextRecord;
  void *v25;
  void *v26;
  SCDAAdvertisementContext *v27;
  SCDAAdvertisementContext *v28;
  SCDAAdvertisementContextManager *advContextManager;
  id v30;
  NSObject *v31;
  unint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  double v36;
  double v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  _BYTE v41[28];
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = +[SCDAUtilities isNano](SCDAUtilities, "isNano");
  if (v7 || self->_clientIsDirectActivating || self->_clientIsInEarActivation)
  {
    v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      clientIsDirectActivating = self->_clientIsDirectActivating;
      *(_DWORD *)buf = 136315650;
      v39 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
      v40 = 1024;
      *(_DWORD *)v41 = !v7;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = clientIsDirectActivating;
      _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s #scda Not pushing myriad advertisement context - HAL enabled: %d, direct activation: %d", buf, 0x18u);
    }
  }
  else
  {
    v10 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
    v11 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v10 / 1000000000.0
        - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0;
    if (v11 >= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;
      v15 = v13 - v11;
      -[SCDASession currentElectionAdvertisementData](self->_myriadSession, "currentElectionAdvertisementData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        voiceTriggerTime = self->_voiceTriggerTime;
        *(_DWORD *)buf = 136316674;
        v39 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
        v40 = 2048;
        *(double *)v41 = v14;
        *(_WORD *)&v41[8] = 2048;
        *(double *)&v41[10] = v15;
        *(_WORD *)&v41[18] = 2048;
        *(double *)&v41[20] = v11;
        v42 = 2048;
        v43 = voiceTriggerTime;
        v44 = 2048;
        v45 = v10;
        v46 = 2112;
        v47 = v16;
        _os_log_impl(&dword_246211000, v17, OS_LOG_TYPE_INFO, "%s #scda adv dispatch time: %f, voice trigger end time: %f, time since voice trigger: %f (curr time: %llu, time since device boot: %llu), advertisment: %@", buf, 0x48u);
      }
      if (v16)
      {
        v19 = [SCDAAdvertisementContextRecord alloc];
        recordType = self->_recordType;
        designatedSelfID = self->_designatedSelfID;
        -[SCDAElectionParticipantIds electionParticipantId](self->_electionParticipantIds, "electionParticipantId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SCDAAdvertisementContextRecord initWithAdvertisementRecordType:voiceTriggerEndTime:advertisementPayload:deviceID:electionParticipantId:](v19, "initWithAdvertisementRecordType:voiceTriggerEndTime:advertisementPayload:deviceID:electionParticipantId:", recordType, v16, designatedSelfID, v22, v15);
        contextRecord = self->_contextRecord;
        self->_contextRecord = v23;

        -[SCDAAdvertisementContextRecord setAdvertisementDispatchTime:](self->_contextRecord, "setAdvertisementDispatchTime:", v14);
        -[SCDAAdvertisementContextRecord myriadAdvertisementContextAsData](self->_contextRecord, "myriadAdvertisementContextAsData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCDASession currentElectionAdvertisementId](self->_myriadSession, "currentElectionAdvertisementId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = [SCDAAdvertisementContext alloc];
        -[SCDACoordinator _contextFetchDelayForAdvertimentInterval:advertisementDelay:](self, "_contextFetchDelayForAdvertimentInterval:advertisementDelay:", a3, a4);
        v28 = -[SCDAAdvertisementContext initWithGeneration:contextData:contextFetchDelay:](v27, "initWithGeneration:contextData:contextFetchDelay:", 0, v25);
        advContextManager = self->_advContextManager;
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke;
        v33[3] = &unk_25174A940;
        v33[4] = self;
        v34 = v26;
        v36 = v15;
        v37 = v14;
        v35 = v16;
        v30 = v26;
        -[SCDAAdvertisementContextManager pushSCDAAdvertisementContext:completionHandler:](advContextManager, "pushSCDAAdvertisementContext:completionHandler:", v28, v33);

      }
      else
      {
        v31 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v32 = self->_voiceTriggerTime;
          *(_DWORD *)buf = 136315906;
          v39 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
          v40 = 1024;
          *(_DWORD *)v41 = 1;
          *(_WORD *)&v41[4] = 2048;
          *(_QWORD *)&v41[6] = v32;
          *(_WORD *)&v41[14] = 2048;
          *(_QWORD *)&v41[16] = v10;
          _os_log_impl(&dword_246211000, v31, OS_LOG_TYPE_INFO, "%s #scda Not pushing myriad advertisement context - Valid voicetrigger endtime: %d (curr time: %llu, time since device boot: %llu)", buf, 0x26u);
        }
      }

    }
  }
}

- (void)_resetAudioData
{
  self->_voiceTriggerTime = 0;
}

- (void)_setupActionWindows
{
  NSDate *v3;
  NSDate *triggerTime;
  void *v5;
  NSDateFormatter *dateFormat;
  NSDate *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  triggerTime = self->_triggerTime;
  self->_triggerTime = v3;

  self->_nDeltaTs = 0;
  v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    dateFormat = self->_dateFormat;
    v7 = self->_triggerTime;
    v8 = v5;
    -[NSDateFormatter stringFromDate:](dateFormat, "stringFromDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SCDACoordinator _setupActionWindows]";
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_246211000, v8, OS_LOG_TYPE_DEBUG, "%s BTLE action window trigger time: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_resetActionWindows
{
  NSDate *triggerTime;

  triggerTime = self->_triggerTime;
  self->_triggerTime = 0;

  self->_slowdownMsecs = 0;
}

- (void)_adjustActionWindowsFromSlowdown:(int)a3
{
  NSDate *v5;
  NSDate *triggerTime;
  void *v7;
  NSDateFormatter *dateFormat;
  NSDate *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[NSDate dateByAddingTimeInterval:](self->_triggerTime, "dateByAddingTimeInterval:", (double)a3 / 1000.0);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    triggerTime = self->_triggerTime;
    self->_triggerTime = v5;

    v7 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      dateFormat = self->_dateFormat;
      v9 = self->_triggerTime;
      v10 = v7;
      -[NSDateFormatter stringFromDate:](dateFormat, "stringFromDate:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[SCDACoordinator _adjustActionWindowsFromSlowdown:]";
      v14 = 1024;
      v15 = a3;
      v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_246211000, v10, OS_LOG_TYPE_DEBUG, "%s BTLE action window adjusted by slowdown signal %d msecs new time: %@", (uint8_t *)&v12, 0x1Cu);

    }
  }
}

- (void)_duringNextWindowExecute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_triggerTime)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", self->_triggerTime, (float)((float)self->_nDeltaTs * 1.5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v5) == -1)
    {
      do
      {
        v8 = self->_nDeltaTs + 1;
        self->_nDeltaTs = v8;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", self->_triggerTime, (float)((float)v8 * 1.5));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v7;
      }
      while (objc_msgSend(v7, "compare:", v5) == -1);
    }
    else
    {
      v7 = v6;
    }
    -[NSDateFormatter stringFromDate:](self->_dateFormat, "stringFromDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[SCDACoordinator _duringNextWindowExecute:]";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_246211000, v10, OS_LOG_TYPE_INFO, "%s BTLE next action window: %@", (uint8_t *)&v12, 0x16u);
    }
    -[SCDACoordinator _createDispatchTimerForEvent:toExecute:](self, "_createDispatchTimerForEvent:toExecute:", v7, v4);

  }
  else
  {
    v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[SCDACoordinator _duringNextWindowExecute:]";
      _os_log_error_impl(&dword_246211000, v11, OS_LOG_TYPE_ERROR, "%s BTLE Attempt to execute time windowed action when trigger time not initialized", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)_duringNextWindowEnterState:(unint64_t)a3
{
  _QWORD v5[4];
  id v6[2];
  id location;

  self->_nextState = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SCDACoordinator__duringNextWindowEnterState___block_invoke;
  v5[3] = &unk_25174A878;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  -[SCDACoordinator _duringNextWindowExecute:](self, "_duringNextWindowExecute:", v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)setupAdvIntervalsInDelay:(float *)a3 interval:(float *)a4 voiceTriggerLatency:(float *)a5 withSlowdown:(int)a6
{
  double v11;
  unint64_t voiceTriggerTime;
  float v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  float v19;
  NSObject *v20;
  float v21;
  float v22;
  double v23;
  NSObject *v24;
  const char *v25;
  float v26;
  int v27;
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v11 = (double)a6 / 1000.0;
  voiceTriggerTime = self->_voiceTriggerTime;
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  v13 = v11;
  v14 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
  v15 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  v16 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v15 / 1000000000.0;
  v17 = v16 - v14;
  v18 = v13;
  v19 = v14 + 1.45000005 + v18 - v16;
  v20 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v27 = 136316674;
    v28 = "-[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:]";
    v29 = 2048;
    v30 = v14;
    v31 = 2048;
    v32 = v16 - v14;
    v33 = 2048;
    v34 = v14 + 1.45000005 + v18;
    v35 = 2048;
    v36 = v19;
    v37 = 1024;
    v38 = a6;
    v39 = 2048;
    v40 = v16;
    _os_log_impl(&dword_246211000, v20, OS_LOG_TYPE_INFO, "%s endTime: %f, timeSinceVoiceTrigger: %f, targetTime: %f, advInterval: %f, slowDown: %d (ms), timeSinceDeviceBoot: %f", (uint8_t *)&v27, 0x44u);
  }
  v21 = 1.0;
  if (v19 <= 1.0)
  {
    v22 = 0.0;
    v21 = 0.5;
    if (v19 >= 0.5)
      v21 = v19;
  }
  else if ((float)(v19 + -1.0) <= 0.45)
  {
    v22 = v19 + -1.0;
  }
  else
  {
    v22 = 0.0;
  }
  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  if (SCDAIsInternalInstall_isInternal)
  {
    -[SCDAPreferences testDeviceDelay](self->_preferences, "testDeviceDelay");
    if (v23 != 0.0)
      v22 = v23;
    v24 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v27 = 136315906;
      v28 = "-[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:]";
      v29 = 2048;
      v30 = v21;
      v31 = 2048;
      v32 = v22;
      v33 = 2048;
      v34 = v18;
      v25 = "%s adjusted advInterval: %f (secs) device delay: %f (secs), slowDown: %f (secs)";
LABEL_22:
      _os_log_impl(&dword_246211000, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v27, 0x2Au);
    }
  }
  else
  {
    v24 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v27 = 136315906;
      v28 = "-[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:]";
      v29 = 2048;
      v30 = v21;
      v31 = 2048;
      v32 = v22;
      v33 = 2048;
      v34 = v18;
      v25 = "%s adjusted advInterval: %f (secs) adjusted delay: %f (secs), slowDown: %f (secs)";
      goto LABEL_22;
    }
  }
  *a3 = v22;
  *a4 = v21;
  v26 = v17;
  *a5 = v26;
}

- (void)_resetAdvertisementTimings
{
  NSDate *advertTriggerAdvStartTime;
  NSDate *advertTriggerEndTime;

  advertTriggerAdvStartTime = self->_advTiming.advertTriggerAdvStartTime;
  self->_advTiming.advertTriggerAdvStartTime = 0;

  advertTriggerEndTime = self->_advTiming.advertTriggerEndTime;
  self->_advTiming.advertTriggerEndTime = 0;

}

- (void)_advertiseTrigger
{
  float deviceTrumpDelay;
  float deviceInEarDelay;
  float deviceInEarInterval;
  void *v6;
  int testInducedSlowdownMsecs;
  int slowdownMsecs;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  id WeakRetained;
  char v15;
  id v16;
  double v17;
  SCDARecord *maxSlowdownRecord;
  void *v19;
  double v20;
  double v21;
  double v22;
  _QWORD *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  SCDARecord *v27;
  double v28;
  double v29;
  _QWORD v30[5];
  _QWORD v31[5];
  int v32;
  int v33;
  _QWORD v34[5];
  float v35;
  float v36;
  int v37;
  int v38;
  float v39;
  float v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  _BYTE v44[10];
  double v45[3];

  v45[2] = *(double *)MEMORY[0x24BDAC8D0];
  v39 = 0.5;
  v40 = 0.0;
  v38 = 0;
  if (self->_clientIsWatchTrumpPromote)
  {
LABEL_2:
    if (self->_voiceTriggerTime)
      -[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:](self, "setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:", &v40, &v39, &v38, 0);
    goto LABEL_11;
  }
  if (!self->_clientIsDirectActivating)
  {
    if (self->_clientIsInEarActivation || self->_clientRespondingToCarPlay)
    {
      deviceInEarDelay = self->_deviceInEarDelay;
      deviceInEarInterval = self->_deviceInEarInterval;
      v39 = deviceInEarInterval;
      v40 = deviceInEarDelay;
      goto LABEL_11;
    }
    goto LABEL_2;
  }
  deviceTrumpDelay = self->_deviceTrumpDelay;
  v40 = deviceTrumpDelay;
  if (+[SCDAUtilities isATV](SCDAUtilities, "isATV")
    || +[SCDAUtilities isNano](SCDAUtilities, "isNano"))
  {
    v39 = 0.75;
  }
LABEL_11:
  if (!self->_clientIsDirectActivating)
    -[SCDANotifyStatePublisher publishState:](self->_electionBeginPublisher, "publishState:", -[SCDACoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
  v6 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    testInducedSlowdownMsecs = self->_testInducedSlowdownMsecs;
    slowdownMsecs = self->_slowdownMsecs;
    v9 = v6;
    -[SCDACoordinator _stateAsString](self, "_stateAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v42 = "-[SCDACoordinator _advertiseTrigger]";
    v43 = 1024;
    *(_DWORD *)v44 = testInducedSlowdownMsecs;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = slowdownMsecs;
    LOWORD(v45[0]) = 2112;
    *(_QWORD *)((char *)v45 + 2) = v10;
    _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s BTLE checking if slowdown needed testmsecs=%d msecs=%d state=%@", buf, 0x22u);

  }
  v11 = self->_testInducedSlowdownMsecs;
  if (v11 < 1 || self->_clientDoneRespondingToSlowdown)
  {
    v12 = self->_slowdownMsecs;
    if ((int)v12 <= 0)
    {
      v13 = SCDALogContextCore;
    }
    else
    {
      v13 = SCDALogContextCore;
      if (self->_clientIsRespondingToSlowdown)
      {
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[SCDACoordinator _advertiseTrigger]";
          _os_log_impl(&dword_246211000, v13, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown delay, 2nd pass seen", buf, 0xCu);
          v12 = self->_slowdownMsecs;
        }
        *(_DWORD *)buf = 0;
        v32 = 0;
        v33 = 1056964608;
        -[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:](self, "setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:", buf, &v33, &v32, v12);
        -[SCDACoordinator _adjustActionWindowsFromSlowdown:](self, "_adjustActionWindowsFromSlowdown:", self->_slowdownMsecs);
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) != 0)
        {
          v16 = objc_loadWeakRetained(&self->_delegate);
          *(float *)&v17 = (float)self->_slowdownMsecs;
          objc_msgSend(v16, "myriadCoordinator:willStartAdvertisingWithSlowDownInterval:", self, v17);

        }
        self->_slowdownMsecs = 0;
        self->_clientIsRespondingToSlowdown = 0;
        maxSlowdownRecord = self->_maxSlowdownRecord;
        self->_maxSlowdownRecord = 0;

        -[SCDARecord generateTiebreaker](self->_triggerRecord, "generateTiebreaker");
        -[SCDARecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = *(_DWORD *)buf;
        LODWORD(v22) = v32;
        LODWORD(v21) = v33;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke_320;
        v31[3] = &unk_25174AD68;
        v31[4] = self;
        v23 = v31;
LABEL_28:
        -[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v19, v23, v20, v21, v22);

        return;
      }
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "-[SCDACoordinator _advertiseTrigger]";
      v43 = 2048;
      *(double *)v44 = v40;
      *(_WORD *)&v44[8] = 2048;
      v45[0] = v39;
      _os_log_impl(&dword_246211000, v13, OS_LOG_TYPE_INFO, "%s BTLE computed advertising delay: %f finished, interval: %f", buf, 0x20u);
    }
    -[SCDARecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = v39;
    *(float *)&v20 = v40;
    LODWORD(v22) = v38;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke_321;
    v30[3] = &unk_25174AD68;
    v30[4] = self;
    v23 = v30;
    goto LABEL_28;
  }
  v24 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[SCDACoordinator _advertiseTrigger]";
    _os_log_impl(&dword_246211000, v24, OS_LOG_TYPE_INFO, "%s BTLE advertising TEST INDUCED slowdown delay, 2nd pass seen", buf, 0xCu);
    v11 = self->_testInducedSlowdownMsecs;
  }
  self->_delayTarget = v40;
  self->_advertInterval = v39;
  -[SCDACoordinator slowdownRecord:](self, "slowdownRecord:", (unsigned __int16)v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "asAdvertisementData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  self->_slowdownMsecs = 0;
  self->_clientIsRespondingToSlowdown = 0;
  v27 = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  *(float *)&v28 = self->_delayTarget;
  *(float *)&v29 = self->_advertInterval;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke;
  v34[3] = &unk_25174A968;
  v35 = v40;
  v36 = v39;
  v37 = v38;
  v34[4] = self;
  -[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v26, v34, v28, v29, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-3.0)));

}

- (void)_advertiseSlowdown
{
  NSObject *v3;
  SCDARecord *maxSlowdownRecord;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&self->_delayTarget = 0x3F8000003EE66668;
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[SCDACoordinator _advertiseSlowdown]";
    v12 = 2048;
    v13 = 0x3FDCCCCD00000000;
    v14 = 2048;
    v15 = 0x3FF0000000000000;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE slowdown advertising delay: %f finished, interval: %f", buf, 0x20u);
  }
  self->_clientDoneRespondingToSlowdown = 0;
  maxSlowdownRecord = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  kdebug_trace();
  -[SCDACoordinator slowdownRecord:](self, "slowdownRecord:", LOWORD(self->_slowdownMsecs));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asAdvertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = self->_delayTarget;
  *(float *)&v8 = self->_advertInterval;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__SCDACoordinator__advertiseSlowdown__block_invoke;
  v9[3] = &unk_25174AD68;
  v9[4] = self;
  -[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v6, v9, v7, v8, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-2.0)));

}

- (BOOL)_okayToSuppressOnOutput
{
  return (self->_myriadState > 0x11) | (0x54B5u >> self->_myriadState) & 1;
}

- (void)_advertiseSuppressTriggerInOutput
{
  uint64_t v3;
  double v4;
  unint64_t voiceTriggerTime;
  void *v6;
  float deviceInEarInterval;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t previousState;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 clientIsDeciding;
  unint64_t v18;
  _QWORD v19[5];
  int v20;
  float v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  v4 = *(double *)&_SCDAMachAbsoluteTimeRate_rate;
  voiceTriggerTime = self->_voiceTriggerTime;
  v6 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v12 = v4 * (double)v3 / 1000000000.0
        - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
    previousState = self->_previousState;
    v14 = v6;
    -[SCDACoordinator _stateAsString:](self, "_stateAsString:", previousState);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDACoordinator _stateAsString:](self, "_stateAsString:", self->_myriadState);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    clientIsDeciding = self->_clientIsDeciding;
    v18 = self->_voiceTriggerTime;
    *(_DWORD *)buf = 136316418;
    v23 = "-[SCDACoordinator _advertiseSuppressTriggerInOutput]";
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    v28 = 1024;
    v29 = clientIsDeciding;
    v30 = 2048;
    v31 = v18;
    v32 = 2048;
    v33 = v12;
    _os_log_debug_impl(&dword_246211000, v14, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d, _voiceTriggerTime: %llu, secondsSinceVoiceTrigger: %f", buf, 0x3Au);

  }
  if (-[SCDACoordinator _okayToSuppressOnOutput](self, "_okayToSuppressOnOutput"))
  {
    v21 = 0.5;
    *(_DWORD *)buf = 0;
    if (self->_clientRespondingToCarPlay)
    {
      *(_DWORD *)buf = 0;
      deviceInEarInterval = self->_deviceInEarInterval;
      v21 = deviceInEarInterval;
    }
    v20 = 0;
    if (self->_voiceTriggerTime)
      -[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:](self, "setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:", buf, &v21, &v20, 0);
    -[SCDARecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDACoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
    -[SCDACoordinator _addElectionAdvertisementDataToMyriadSession:](self, "_addElectionAdvertisementDataToMyriadSession:", v8);
    *(float *)&v10 = v21;
    LODWORD(v9) = *(_DWORD *)buf;
    LODWORD(v11) = v20;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __52__SCDACoordinator__advertiseSuppressTriggerInOutput__block_invoke;
    v19[3] = &unk_25174AD68;
    v19[4] = self;
    -[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v8, v19, v9, v10, v11);

  }
}

- (void)_advertise:(id)a3 andMoveTo:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;

  LODWORD(v4) = 0;
  LODWORD(v5) = 0.75;
  LODWORD(v6) = 0;
  -[SCDACoordinator _advertise:afterDelay:maxInterval:voiceTriggerLatency:andMoveTo:](self, "_advertise:afterDelay:maxInterval:voiceTriggerLatency:andMoveTo:", a3, a4, v4, v5, v6);
}

- (void)_advertise:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 voiceTriggerLatency:(float)a6 andMoveTo:(unint64_t)a7
{
  void *v11;
  double v12;
  double v13;
  _QWORD v14[5];

  self->_nextState = a7;
  objc_msgSend(a3, "asAdvertisementData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__SCDACoordinator__advertise_afterDelay_maxInterval_voiceTriggerLatency_andMoveTo___block_invoke;
  v14[3] = &unk_25174AD68;
  v14[4] = self;
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  -[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v11, v14, COERCE_DOUBLE((unint64_t)LODWORD(a4)), v12, v13);

}

- (void)_advertiseIndefinite:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SCDACoordinator *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SCDACoordinator__advertiseIndefinite___block_invoke;
  v6[3] = &unk_25174A620;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[SCDACoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", v6);

}

- (void)startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8;
  NSObject *myriadWorkQueue;
  id v10;
  _QWORD block[5];
  id v12;
  float v13;
  float v14;

  v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SCDACoordinator_startAdvertising_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_25174AD18;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(myriadWorkQueue, block);

}

- (void)_startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  double v8;
  double v9;
  double v10;
  id v11;

  self->_recordType = 7;
  objc_msgSend(a3, "asAdvertisementData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  *(float *)&v9 = a4;
  *(float *)&v10 = a5;
  -[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v11, 0, v9, v10, v8);

}

- (void)advertiseWith:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SCDACoordinator_advertiseWith___block_invoke;
  v7[3] = &unk_25174A620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8;
  NSObject *myriadWorkQueue;
  id v10;
  _QWORD block[5];
  id v12;
  float v13;
  float v14;

  v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_25174AD18;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(myriadWorkQueue, block);

}

- (void)_createElectionParticipantIdVendorIfRequired
{
  SCDACoordinator *v2;
  SCDAElectionParticipantIdVendor *v3;
  SCDAElectionParticipantIdVendor *electionParticipantIdVendor;
  SCDACoordinator *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_electionParticipantIdVendor)
  {
    v3 = objc_alloc_init(SCDAElectionParticipantIdVendor);
    electionParticipantIdVendor = obj->_electionParticipantIdVendor;
    obj->_electionParticipantIdVendor = v3;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (void)_computeElectionParticipantIds:(id)a3
{
  id v4;
  SCDAElectionParticipantIdVendor *electionParticipantIdVendor;
  SCDAElectionParticipantIds *v6;
  SCDAElectionParticipantIds *v7;
  NSObject *v8;
  const char *v9;
  SCDAElectionParticipantIds *electionParticipantIds;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  electionParticipantIdVendor = self->_electionParticipantIdVendor;
  if (!electionParticipantIdVendor)
  {
    v8 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v11 = 136315138;
    v12 = "-[SCDACoordinator _computeElectionParticipantIds:]";
    v9 = "%s #scda No electionParticipantIdVendor. ElectionParticipantId will not be created!";
LABEL_9:
    _os_log_debug_impl(&dword_246211000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v11, 0xCu);
    goto LABEL_7;
  }
  if (!v4)
  {
    electionParticipantIds = self->_electionParticipantIds;
    self->_electionParticipantIds = 0;

    v8 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v11 = 136315138;
    v12 = "-[SCDACoordinator _computeElectionParticipantIds:]";
    v9 = "%s #scda No advertisement data. ElectionParticipantId will not be created!";
    goto LABEL_9;
  }
  -[SCDAElectionParticipantIdVendor computeIds:](electionParticipantIdVendor, "computeIds:", v4);
  v6 = (SCDAElectionParticipantIds *)objc_claimAutoreleasedReturnValue();
  v7 = self->_electionParticipantIds;
  self->_electionParticipantIds = v6;

LABEL_7:
}

- (void)_advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 voiceTriggerLatency:(float)a6 thenExecute:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSData *previousAdvertisedData;
  void *v18;
  id WeakRetained;
  void *v20;
  id v21;
  char v22;
  id v23;
  double v24;
  double v25;
  NSObject *v26;
  double v27;
  NSData *v28;
  NSObject *v29;
  double v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  id v34;
  float v35;
  float v36;
  _QWORD v37[5];
  id v38;
  float v39;
  float v40;
  float v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke;
  v37[3] = &unk_25174A990;
  v37[4] = self;
  v15 = v12;
  v38 = v15;
  v39 = a5;
  v40 = a4;
  v41 = a6;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x249555380](v37);
  previousAdvertisedData = self->_previousAdvertisedData;
  if (previousAdvertisedData && -[NSData isEqualToData:](previousAdvertisedData, "isEqualToData:", v15))
  {
    v18 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v28 = self->_previousAdvertisedData;
      v29 = v18;
      -[NSData description](v28, "description");
      v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v43 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]";
      v44 = 2112;
      v45 = v30;
      _os_log_error_impl(&dword_246211000, v29, OS_LOG_TYPE_ERROR, "%s BTLE error: attempting to readvertise %@", buf, 0x16u);

    }
    self->_stateMachineEncounteredError = 1;
    -[SCDACoordinator _enterState:](self, "_enterState:", 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      v20 = WeakRetained;
      v21 = objc_loadWeakRetained(&self->_delegate);
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        v23 = objc_loadWeakRetained(&self->_delegate);
        *(float *)&v24 = a4;
        *(float *)&v25 = a5;
        objc_msgSend(v23, "scdaAdvertisingWillBeginWithDelay:advertisingInterval:", v24, v25);

      }
    }
    v26 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]";
      v44 = 2048;
      v45 = a4;
      _os_log_impl(&dword_246211000, v26, OS_LOG_TYPE_INFO, "%s BTLE starting advert delay timer for %f secs", buf, 0x16u);
    }
    if (a4 == 0.0)
    {
      ((void (**)(_QWORD, id, id))v16)[2](v16, v15, v13);
    }
    else
    {
      v31[0] = v14;
      v31[1] = 3221225472;
      v31[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_335;
      v31[3] = &unk_25174A9B8;
      v31[4] = self;
      v35 = a4;
      v36 = a5;
      v33 = v16;
      v32 = v15;
      v34 = v13;
      *(float *)&v27 = a4;
      -[SCDACoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", CFSTR("advert delay"), v31, v27);

    }
  }

}

- (id)voiceTriggerRecord
{
  void *v3;
  void *v4;
  SCDARecord *v5;
  unint64_t *p_voiceTriggerTime;
  uint64_t v7;
  uint64_t v9;

  -[SCDAContext perceptualAudioHash](self->_currentMyriadContext, "perceptualAudioHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SCDARecord initWithAudioData:]([SCDARecord alloc], "initWithAudioData:", v4);
  if (objc_msgSend(v4, "length") == 12)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_voiceTriggerTime, 4, 8);
LABEL_3:
    -[SCDARecord generateTiebreaker](v5, "generateTiebreaker");
    goto LABEL_11;
  }
  p_voiceTriggerTime = &self->_voiceTriggerTime;
  if (objc_msgSend(v4, "length") == 13)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_voiceTriggerTime, 4, 8);
    goto LABEL_11;
  }
  if (!*p_voiceTriggerTime)
  {
    *p_voiceTriggerTime = 0;
    goto LABEL_3;
  }
  v7 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
  {
    v9 = v7;
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
    v7 = v9;
  }
  if (*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v7 / 1000000000.0
     - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)*p_voiceTriggerTime / 1000000000.0 > 1.45000005)
    *p_voiceTriggerTime = 0;
LABEL_11:
  -[SCDARecord setIsMe:](v5, "setIsMe:", 1);
  -[SCDARecord setDeviceID:](v5, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v5, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v5, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v5, "setProductType:", self->_productType);

  return v5;
}

- (id)_phsSetupRecord
{
  SCDARecord *v3;

  v3 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v3, "setPHash:", 63993);
  -[SCDARecord setIsMe:](v3, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v3, "generateTiebreaker");
  -[SCDARecord generateRandomConfidence](v3, "generateRandomConfidence");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 249);
  -[SCDARecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)directTriggerRecord
{
  void *v3;
  void *v4;
  unint64_t *p_voiceTriggerTime;
  uint64_t v6;
  SCDARecord *v7;

  -[SCDAContext perceptualAudioHash](self->_currentMyriadContext, "perceptualAudioHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") == 12)
  {
    p_voiceTriggerTime = &self->_voiceTriggerTime;
  }
  else
  {
    v6 = objc_msgSend(v4, "length");
    p_voiceTriggerTime = &self->_voiceTriggerTime;
    if (v6 != 13)
    {
      *p_voiceTriggerTime = 0;
      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "getBytes:range:", p_voiceTriggerTime, 4, 8);
LABEL_6:
  v7 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v7, "setPHash:", 0xFFFFLL);
  -[SCDARecord setIsMe:](v7, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v7, "generateTiebreaker");
  -[SCDARecord generateRandomConfidence](v7, "generateRandomConfidence");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v7, "setRawAudioGoodnessScore:withBump:", 0, 255);
  -[SCDARecord setDeviceID:](v7, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v7, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v7, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v7, "setProductType:", self->_productType);

  return v7;
}

- (id)lateSuppressionRecord
{
  SCDARecord *v3;

  v3 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v3, "setPHash:", self->_lastPHash);
  -[SCDARecord setIsMe:](v3, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v3, "generateTiebreaker");
  -[SCDARecord generateRandomConfidence](v3, "generateRandomConfidence");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 255);
  -[SCDARecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)continuationRecord
{
  SCDARecord *v3;

  v3 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v3, "setPHash:", 0xFFFFLL);
  -[SCDARecord setIsMe:](v3, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v3, "generateTiebreaker");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 0);
  -[SCDARecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)emergencyRecord
{
  SCDARecord *v3;

  v3 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v3, "setPHash:", 0);
  -[SCDARecord setIsMe:](v3, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v3, "generateTiebreaker");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 239);
  -[SCDARecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)emergencyHandledRecord
{
  SCDARecord *v3;

  v3 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v3, "setPHash:", 0);
  -[SCDARecord setIsMe:](v3, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v3, "generateTiebreaker");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 224);
  -[SCDARecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)responseObject:(unsigned __int16)a3
{
  uint64_t v3;
  SCDARecord *v5;

  v3 = a3;
  v5 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v5, "setPHash:", v3);
  -[SCDARecord setIsMe:](v5, "setIsMe:", 1);
  -[SCDARecord generateTiebreaker](v5, "generateTiebreaker");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v5, "setRawAudioGoodnessScore:withBump:", 0, 255);
  -[SCDARecord setDeviceID:](v5, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v5, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v5, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v5, "setProductType:", self->_productType);
  return v5;
}

- (id)slowdownRecord:(unsigned __int16)a3
{
  uint64_t v4;
  SCDARecord *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  SCDARecord *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((a3 >> 3) >= 0xFF)
    v4 = 255;
  else
    v4 = a3 >> 3;
  v5 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v5, "setPHash:", 0);
  -[SCDARecord setIsMe:](v5, "setIsMe:", 1);
  -[SCDARecord setUserConfidence:](v5, "setUserConfidence:", v4);
  -[SCDARecord generateTiebreaker](v5, "generateTiebreaker");
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v5, "setRawAudioGoodnessScore:withBump:", 0, 208);
  -[SCDARecord setDeviceID:](v5, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v5, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v5, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v5, "setProductType:", self->_productType);
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[SCDACoordinator slowdownRecord:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s BTLE created slowdown record %@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)emptyRecord
{
  SCDARecord *v3;
  void *v4;

  v3 = objc_alloc_init(SCDARecord);
  -[SCDARecord setPHash:](v3, "setPHash:", 0);
  -[SCDARecord setIsMe:](v3, "setIsMe:", 1);
  -[SCDARecord setTieBreaker:](v3, "setTieBreaker:", 0);
  -[SCDARecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 0);
  -[SCDARecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[SCDARecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[SCDARecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[SCDARecord setProductType:](v3, "setProductType:", self->_productType);
  +[SCDAElectionParticipantIdVendor nullId](SCDAElectionParticipantIdVendor, "nullId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDARecord setElectionParticipantId:](v3, "setElectionParticipantId:", v4);

  return v3;
}

- (BOOL)_shouldContinueFor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSMutableDictionary *replies;
  NSDate *lastWonBySmallAmountDate;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  char v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSMutableDictionary *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCDACoordinator _sortedReplies](self, "_sortedReplies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SCDALogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    replies = self->_replies;
    *(_DWORD *)buf = 138412546;
    v37 = v7;
    v38 = 2112;
    v39 = replies;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_DEFAULT, "BTLE end advertising.\nPotential winner = %@\nSummary: %@", buf, 0x16u);

  }
  lastWonBySmallAmountDate = self->_lastWonBySmallAmountDate;
  self->_lastWonBySmallAmountDate = 0;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v32;
LABEL_5:
    v15 = 0;
    v30 = v13 + v12;
    while (1)
    {
      if (*(_QWORD *)v32 != v14)
        objc_enumerationMutation(v10);
      if (v4)
      {
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v16, "deviceClass"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v4, "containsObject:", v17);

        if (!v18)
          break;
      }
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v13 = v30;
        if (v12)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    v21 = objc_msgSend(v16, "isATrump");
    v22 = objc_msgSend(v16, "isMe");
    v20 = v21 & v22;
    if ((v21 & 1) == 0)
    {
      v19 = v10;
      if (!v22)
        goto LABEL_29;
      if (v13 + v15 + 1 < (unint64_t)objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndex:", v13 + v15 + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v16, "goodness");
        if ((int)(v24 - objc_msgSend(v23, "goodness")) <= 2)
        {
          v25 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[SCDACoordinator _shouldContinueFor:]";
            _os_log_impl(&dword_246211000, v25, OS_LOG_TYPE_INFO, "%s #scda Won by a small margin, storing state to mitigate recency boost", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x24BDBCE60], "date", self);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = *(void **)(v29 + 640);
          *(_QWORD *)(v29 + 640) = v26;

        }
      }
      v20 = 1;
    }
    v19 = v10;
  }
  else
  {
LABEL_12:

    objc_msgSend(v10, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isATrump"))
      self->_clientLostDueToTrumping = 1;
    if ((objc_msgSend(v19, "isMe", self) & 1) == 0
      && objc_msgSend(v19, "isInEarTrump")
      && -[SCDARecord isInEarTrump](self->_triggerRecord, "isInEarTrump"))
    {
      v20 = 1;
    }
    else
    {
      v20 = objc_msgSend(v19, "isMe");
    }
  }
LABEL_29:

  return v20;
}

- (BOOL)_shouldHandleEmergency
{
  void *v3;
  NSObject *v4;
  NSMutableDictionary *replies;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSMutableDictionary *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[SCDACoordinator _sortedReplies:](self, "_sortedReplies:", self->_repliesBeforeDecision);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    replies = self->_replies;
    *(_DWORD *)buf = 136315394;
    v24 = "-[SCDACoordinator _shouldHandleEmergency]";
    v25 = 2112;
    v26 = replies;
    _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s BTLE emergencyCallSummary: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_337);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      if (-[SCDACoordinator _isAPhone:](self, "_isAPhone:", objc_msgSend(v11, "deviceClass", (_QWORD)v18)))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v13 = objc_msgSend(v11, "isMe");
    v14 = SCDALogContextCore;
    v15 = os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SCDACoordinator _shouldHandleEmergency]";
        v16 = "%s BTLE Emergency call: this device should handle";
LABEL_19:
        _os_log_impl(&dword_246211000, v14, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SCDACoordinator _shouldHandleEmergency]";
      v16 = "%s BTLE Emergency call: This device should NOT handle, another is better";
      goto LABEL_19;
    }

    goto LABEL_21;
  }
LABEL_11:

  v12 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[SCDACoordinator _shouldHandleEmergency]";
    _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s BTLE Emergency Call: No device available to handle this call", buf, 0xCu);
  }
  LOBYTE(v13) = 0;
LABEL_21:

  return v13;
}

- (BOOL)_isAPhone:(unsigned __int8)a3
{
  return a3 == 2;
}

- (id)_sortedReplies
{
  return -[SCDACoordinator _sortedReplies:](self, "_sortedReplies:", self->_replies);
}

- (id)_sortedReplies:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_339);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__SCDACoordinator__sortedReplies___block_invoke_2;
    v9[3] = &unk_25174AA60;
    v10 = v6;
    v11 = v5;
    v7 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  }
  return v5;
}

- (void)_updateRepliesWith:(id)a3 id:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _BYTE v16[24];
  _BYTE v17[10];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKey:](self->_replies, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    goto LABEL_11;
  }
  if (objc_msgSend(v11, "isAContinuation") && (objc_msgSend(v8, "isAContinuation") & 1) == 0)
  {
    v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
LABEL_10:
      *(_DWORD *)v16 = 136315650;
      *(_QWORD *)&v16[4] = "-[SCDACoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v16[12] = 2112;
      *(_QWORD *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2112;
      *(_QWORD *)v17 = v9;
      _os_log_impl(&dword_246211000, v15, OS_LOG_TYPE_INFO, "%s BTLE Updating record table, data= %@, for %@", v16, 0x20u);
    }
LABEL_11:
    -[NSMutableDictionary setObject:forKey:](self->_replies, "setObject:forKey:", v8, v9, *(_OWORD *)v16, *(_QWORD *)&v16[16], *(_QWORD *)v17);
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "isALateSupressionTrumpFor:", v12))
  {
    v13 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)v16 = 136316162;
      *(_QWORD *)&v16[4] = "-[SCDACoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = objc_msgSend(v12, "goodness");
      *(_WORD *)&v16[18] = 1024;
      *(_DWORD *)&v16[20] = objc_msgSend(v8, "goodness");
      *(_WORD *)v17 = 2112;
      *(_QWORD *)&v17[2] = v10;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_246211000, v14, OS_LOG_TYPE_INFO, "%s BTLE Updating record table with a late supression(%hhu -> %hhu), data= %@, for %@", v16, 0x2Cu);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)notifyCurrentDecisionResult
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SCDACoordinator_notifyCurrentDecisionResult__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (unint64_t)_nextElectionPublisherState
{
  unint64_t electionPublisherState;
  unint64_t v3;

  electionPublisherState = self->_electionPublisherState;
  if (electionPublisherState)
    v3 = (electionPublisherState + 1) % 0x3D;
  else
    v3 = 1;
  self->_electionPublisherState = v3;
  return v3;
}

- (int)_myriadStateForSelf:(unint64_t)a3
{
  if (a3 < 0x12)
    return a3 + 1;
  else
    return 0;
}

- (BOOL)_testAndUpdateWedgeFilter:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *incomingTrumps;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  char v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "userConfidence") | (objc_msgSend(v4, "tieBreaker") << 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isATrump"))
    goto LABEL_11;
  incomingTrumps = self->_incomingTrumps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](incomingTrumps, "setObject:forKey:", v7, v5);

  v8 = objc_msgSend(v4, "deviceClass");
  if (+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman") && v8 == 6)
  {
    v9 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SCDACoordinator _testAndUpdateWedgeFilter:]";
      v16 = 2112;
      v17 = v4;
      v10 = "%s BTLE ignoring incoming event bad device class for Horseman %@";
LABEL_9:
      _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_previousTrumps, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_11:
    v12 = objc_msgSend(v4, "isSane");
    goto LABEL_12;
  }
  v9 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[SCDACoordinator _testAndUpdateWedgeFilter:]";
    v16 = 2112;
    v17 = v4;
    v10 = "%s BTLE ignoring as wedged suppress %@";
    goto LABEL_9;
  }
LABEL_10:
  v12 = 0;
LABEL_12:

  return v12;
}

- (void)_ageWedgeFilter
{
  NSMutableDictionary *previousTrumps;
  NSMutableDictionary **p_previousTrumps;
  NSMutableDictionary *v5;
  NSMutableDictionary *incomingTrumps;
  _QWORD v7[5];

  p_previousTrumps = &self->_previousTrumps;
  previousTrumps = self->_previousTrumps;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SCDACoordinator__ageWedgeFilter__block_invoke;
  v7[3] = &unk_25174AA88;
  v7[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](previousTrumps, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_storeStrong((id *)p_previousTrumps, self->_incomingTrumps);
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  incomingTrumps = self->_incomingTrumps;
  self->_incomingTrumps = v5;

}

- (void)_initializeWiProxReadinessTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *waitTimer;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SCDACoordinator _initializeWiProxReadinessTimer]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda WiProx readiness timer initialized", (uint8_t *)&v6, 0xCu);
  }
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  self->_wiproxReadinessTimer.waitTimer = v4;

  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, &__block_literal_global_342);
  -[SCDACoordinator _resumeWiProxReadinessTimer](self, "_resumeWiProxReadinessTimer");
}

- (void)_resumeWiProxReadinessTimer
{
  dispatch_resume((dispatch_object_t)self->_wiproxReadinessTimer.waitTimer);
  self->_wiproxReadinessTimer.isWaitTimerSuspended = 0;
}

- (void)_suspendWiProxReadinessTimer
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!self->_wiproxReadinessTimer.isWaitTimerSuspended)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[SCDACoordinator _suspendWiProxReadinessTimer]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda WiProx readiness timer suspended", (uint8_t *)&v4, 0xCu);
    }
    self->_wiproxReadinessTimer.isWaitTimerSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_wiproxReadinessTimer.waitTimer);
  }
}

- (void)_clearWiProxReadinessTimer
{
  NSObject *v3;
  id waitBlock;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_wiproxReadinessTimer.waitTimer)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[SCDACoordinator _clearWiProxReadinessTimer]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda WiProx readiness timer wait block cleared", (uint8_t *)&v5, 0xCu);
    }
    waitBlock = self->_wiproxReadinessTimer.waitBlock;
    self->_wiproxReadinessTimer.waitBlock = 0;

  }
}

- (void)_createWaitWiProxTimer:(int64_t)a3 waitBlock:(id)a4
{
  id v6;
  NSObject *waitTimer;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id waitBlock;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[5];

  v6 = a4;
  -[SCDACoordinator _suspendWiProxReadinessTimer](self, "_suspendWiProxReadinessTimer");
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  v8 = dispatch_time(0, 1000000 * a3);
  dispatch_source_set_timer(waitTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke;
  v19[3] = &unk_25174AD68;
  v19[4] = self;
  v10 = (void *)MEMORY[0x249555380](v19);
  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, v10);
  v14 = v9;
  v15 = 3221225472;
  v16 = __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke_343;
  v17 = &unk_25174AAD0;
  v18 = v6;
  v11 = v6;
  v12 = (void *)MEMORY[0x249555380](&v14);
  waitBlock = self->_wiproxReadinessTimer.waitBlock;
  self->_wiproxReadinessTimer.waitBlock = v12;

  -[SCDACoordinator _resumeWiProxReadinessTimer](self, "_resumeWiProxReadinessTimer", v14, v15, v16, v17);
}

- (void)_waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  id v6;
  _BOOL4 BTLEReady;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SCDACoordinator *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  BTLEReady = self->_BTLEReady;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __42__SCDACoordinator__waitWiProx_andExecute___block_invoke;
  v16 = &unk_25174ACA0;
  v17 = self;
  v8 = v6;
  v18 = v8;
  v9 = MEMORY[0x249555380](&v13);
  v10 = (void *)v9;
  if (BTLEReady || !self->_BLEActivityEnabled)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    v11 = -[WPHeySiri state](self->_heySiriBTLE, "state", v13, v14, v15, v16, v17);
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[SCDACoordinator _waitWiProx:andExecute:]";
      v21 = 2048;
      v22 = a3;
      v23 = 2048;
      v24 = v11;
      _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s #scda BTLE not ready, waiting to execute for up to %ld msecs (current HeySiri WPState %ld)", buf, 0x20u);
    }
    -[SCDACoordinator _createWaitWiProxTimer:waitBlock:](self, "_createWaitWiProxTimer:waitBlock:", a3, v10);
  }

}

- (void)waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  id v6;
  NSObject *myriadWorkQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SCDACoordinator_waitWiProx_andExecute___block_invoke;
  block[3] = &unk_25174AB20;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(myriadWorkQueue, block);

}

- (void)_waitWiProxAndExecute:(id)a3
{
  -[SCDACoordinator _waitWiProx:andExecute:](self, "_waitWiProx:andExecute:", 100, a3);
}

- (void)_enterBLEDiagnosticMode
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  SFDiagnostics *v7;
  SFDiagnostics *sfdiagnostics;
  SFDiagnostics *v9;
  void *v10;
  SCDAWatchdogTimer *v11;
  SCDAWatchdogTimer *sfDiagnosticsTimer;
  NSObject *v13;
  SCDAWatchdogTimer *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[24];
  SCDAWatchdogTimer *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!self->_myriadWorkQueue)
    __assert_rtn("-[SCDACoordinator _enterBLEDiagnosticMode]", "SCDACoordinator.m", 3888, "_myriadWorkQueue");
  if (!+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman"))
  {
    -[SCDACoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SCDACoordinator _enterBLEDiagnosticMode]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE entering diagnostic mode", buf, 0xCu);
    }
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v4 = (void *)getSFDiagnosticsClass_softClass;
    v20 = getSFDiagnosticsClass_softClass;
    v5 = MEMORY[0x24BDAC760];
    if (!getSFDiagnosticsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSFDiagnosticsClass_block_invoke;
      v22 = (SCDAWatchdogTimer *)&unk_25174AB98;
      v23 = &v17;
      __getSFDiagnosticsClass_block_invoke((uint64_t)buf);
      v4 = (void *)v18[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v17, 8);
    v7 = (SFDiagnostics *)objc_alloc_init(v6);
    sfdiagnostics = self->_sfdiagnostics;
    self->_sfdiagnostics = v7;

    -[SFDiagnostics setDispatchQueue:](self->_sfdiagnostics, "setDispatchQueue:", self->_myriadWorkQueue);
    v9 = self->_sfdiagnostics;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke;
    v16[3] = &unk_25174AB48;
    v16[4] = self;
    -[SFDiagnostics diagnosticBLEModeWithCompletion:](v9, "diagnosticBLEModeWithCompletion:", v16);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke_350;
    v15[3] = &unk_25174AD68;
    v15[4] = self;
    v10 = (void *)MEMORY[0x249555380](v15);
    v11 = -[SCDAWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]([SCDAWatchdogTimer alloc], "initWithTimeoutInterval:onQueue:timeoutHandler:", self->_myriadWorkQueue, v10, 1.45000005);
    sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
    self->_sfDiagnosticsTimer = v11;

    -[SCDAWatchdogTimer start](self->_sfDiagnosticsTimer, "start");
    v13 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v14 = self->_sfDiagnosticsTimer;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SCDACoordinator _enterBLEDiagnosticMode]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0x3FF7333340000000;
      *(_WORD *)&buf[22] = 2112;
      v22 = v14;
      _os_log_impl(&dword_246211000, v13, OS_LOG_TYPE_INFO, "%s BTLE added diagnostic mode timer for %f seconds %@", buf, 0x20u);
    }

  }
}

- (void)_leaveBLEDiagnosticMode
{
  NSObject *v3;
  SFDiagnostics *sfdiagnostics;
  NSObject *v5;
  SCDAWatchdogTimer *sfDiagnosticsTimer;
  SCDAWatchdogTimer *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  SCDAWatchdogTimer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_myriadWorkQueue)
    __assert_rtn("-[SCDACoordinator _leaveBLEDiagnosticMode]", "SCDACoordinator.m", 3918, "_myriadWorkQueue");
  if (self->_sfdiagnostics && !+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman"))
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SCDACoordinator _leaveBLEDiagnosticMode]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE leaving diagnostic mode", (uint8_t *)&v8, 0xCu);
    }
    -[SFDiagnostics invalidate](self->_sfdiagnostics, "invalidate");
    sfdiagnostics = self->_sfdiagnostics;
    self->_sfdiagnostics = 0;

    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
      v8 = 136315650;
      v9 = "-[SCDACoordinator _leaveBLEDiagnosticMode]";
      v10 = 2048;
      v11 = 0x3FF7333340000000;
      v12 = 2112;
      v13 = sfDiagnosticsTimer;
      _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s BTLE cancelling diagnostic mode timer for %f seconds %@", (uint8_t *)&v8, 0x20u);
    }
    -[SCDAWatchdogTimer cancel](self->_sfDiagnosticsTimer, "cancel");
    v7 = self->_sfDiagnosticsTimer;
    self->_sfDiagnosticsTimer = 0;

  }
}

- (void)_triggerABCForType:(id)a3 context:(id)a4
{
  SCDAAdvertisementContextManager *advContextManager;

  advContextManager = self->_advContextManager;
  if (advContextManager)
    -[SCDAAdvertisementContextManager triggerABCForType:subType:context:](advContextManager, "triggerABCForType:subType:context:", CFSTR("Myriad"), a3, a4);
}

- (void)heySiriDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *myriadWorkQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SCDACoordinator heySiriDidUpdateState:]";
    v13 = 2048;
    v14 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s BTLE daemon state changed to: %ld", buf, 0x16u);

  }
  myriadWorkQueue = self->_myriadWorkQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__SCDACoordinator_heySiriDidUpdateState___block_invoke;
  v9[3] = &unk_25174A620;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(myriadWorkQueue, v9);

}

- (void)heySiri:(id)a3 foundDevice:(id)a4 withInfo:(id)a5
{
  void *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SCDARecord *v16;
  id WeakRetained;
  char v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *myriadWorkQueue;
  id v23;
  void *v24;
  NSObject *v25;
  int v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[4];
  SCDARecord *v31;
  SCDACoordinator *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _BYTE buf[38];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v29 = a4;
  v28 = a5;
  -[SCDACoordinator _createElectionParticipantIdVendorIfRequired](self, "_createElectionParticipantIdVendorIfRequired");
  -[SCDAElectionParticipantIdVendor fetchBTLEAddressIfRequired](self->_electionParticipantIdVendor, "fetchBTLEAddressIfRequired");
  getWPHeySiriKeyManufacturerData();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v9 = (id *)getWPHeySiriKeyDeviceAddressSymbolLoc_ptr;
  *(_QWORD *)&buf[24] = getWPHeySiriKeyDeviceAddressSymbolLoc_ptr;
  if (!getWPHeySiriKeyDeviceAddressSymbolLoc_ptr)
  {
    v10 = (void *)WirelessProximityLibrary();
    v9 = (id *)dlsym(v10, "WPHeySiriKeyDeviceAddress");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
    getWPHeySiriKeyDeviceAddressSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(buf, 8);
  if (!v9)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v11 = *v9;
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v28, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_6:
      objc_msgSend(v28, "objectForKey:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
    if (v11)
      goto LABEL_6;
  }
  v14 = 0;
LABEL_9:
  +[SCDAElectionParticipantIdVendor computeId:withPayload:](SCDAElectionParticipantIdVendor, "computeId:withPayload:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SCDARecord initWithDeviceID:data:electionParticipantId:]([SCDARecord alloc], "initWithDeviceID:data:electionParticipantId:", v29, v13, v15);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v19, "myriadCoordinator:didReceiveAdvertisment:", self, v16);

  }
  if (-[SCDARecord deviceGroup](v16, "deviceGroup") == self->_deviceGroup)
  {
    -[SCDARecord deviceID](v16, "deviceID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    myriadWorkQueue = self->_myriadWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SCDACoordinator_heySiri_foundDevice_withInfo___block_invoke;
    block[3] = &unk_25174AB70;
    v31 = v16;
    v32 = self;
    v33 = v29;
    v34 = v14;
    v35 = v13;
    v36 = v21;
    v23 = v21;
    dispatch_async(myriadWorkQueue, block);

  }
  else
  {
    v24 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      v26 = -[SCDARecord deviceGroup](v16, "deviceGroup");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SCDACoordinator heySiri:foundDevice:withInfo:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v26;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v29;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v13;
      _os_log_impl(&dword_246211000, v25, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert from other deviceGroup %d: %@ data= %@", buf, 0x26u);

    }
  }

}

- (void)heySiriStartedAdvertisingAt:(id)a3 timeStamp:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t Milliseconds;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman", a3)
    || +[SCDAUtilities isATV](SCDAUtilities, "isATV")
    || +[SCDAUtilities isNano](SCDAUtilities, "isNano"))
  {
    v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v9 = 136315394;
      v10 = "-[SCDACoordinator heySiriStartedAdvertisingAt:timeStamp:]";
      v11 = 2048;
      Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(a4);
      _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v9, 0x16u);

    }
    -[SCDACoordinator _trackHeySiriStartedAdvertisingAt:](self, "_trackHeySiriStartedAdvertisingAt:", a4);
  }
  else
  {
    v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[SCDACoordinator heySiriStartedAdvertisingAt:timeStamp:]";
      _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s Not yet supported on this device.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)heySiriStartedAdvertising:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t Milliseconds;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman", a3)
    || +[SCDAUtilities isATV](SCDAUtilities, "isATV")
    || +[SCDAUtilities isNano](SCDAUtilities, "isNano"))
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SCDACoordinator heySiriStartedAdvertising:]";
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s No longer used by this device.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = mach_absolute_time();
    v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = 136315394;
      v9 = "-[SCDACoordinator heySiriStartedAdvertising:]";
      v10 = 2048;
      Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v5);
      _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v8, 0x16u);

    }
    -[SCDACoordinator _trackHeySiriStartedAdvertisingAt:](self, "_trackHeySiriStartedAdvertisingAt:", v5);
  }
}

- (void)_trackHeySiriStartedAdvertisingAt:(unint64_t)a3
{
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;

  kdebug_trace();
  if (self->_myriadState != 5)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    v6 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:");
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDAInstrumentation logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:", v6, v7, a3);

  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v10, "myriadCoordinatorBTLEDidStartAdvertising:", self);

  }
}

- (void)heySiriAdvertisingPending:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator heySiriAdvertisingPending:]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising overridden and now pending", (uint8_t *)&v4, 0xCu);
  }
}

- (void)heySiriStoppedAdvertising:(id)a3
{
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t Milliseconds;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    v5 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:");
    -[SCDASession sessionId](self->_myriadSession, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCDAInstrumentation logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:", v5, v6, mach_absolute_time());

  }
  v7 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = mach_absolute_time();
    v13 = 136315394;
    v14 = "-[SCDACoordinator heySiriStoppedAdvertising:]";
    v15 = 2048;
    Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v9);
    _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising ends at: %lld", (uint8_t *)&v13, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v12, "myriadCoordinatorBTLEDidEndAdvertising:", self);

  }
}

- (void)heySiri:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SCDACoordinator heySiri:failedToStartAdvertisingWithError:]";
    v8 = 2112;
    v9 = v4;
    _os_log_error_impl(&dword_246211000, v5, OS_LOG_TYPE_ERROR, "%s BTLE daemon failed to start advertising with error %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)heySiriStartedScanning:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SCDACoordinator heySiriStartedScanning:]";
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning begins", (uint8_t *)&v9, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v8, "myriadCoordinatorBTLEDidStartScanning:", self);

  }
}

- (void)heySiriStoppedScanning:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SCDACoordinator heySiriStoppedScanning:]";
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning ends", (uint8_t *)&v9, 0xCu);
  }
  -[SCDACoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v8, "myriadCoordinatorBTLEDidEndScanning:", self);

  }
}

- (void)heySiri:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  kdebug_trace();
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[SCDACoordinator heySiri:failedToStartScanningWithError:]";
    v9 = 2112;
    v10 = v5;
    _os_log_error_impl(&dword_246211000, v6, OS_LOG_TYPE_ERROR, "%s BTLE daemon failed to start scanning with error %@", (uint8_t *)&v7, 0x16u);
  }
  -[SCDACoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");

}

- (void)_signalEmergencyCallHandled
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SCDACoordinator _signalEmergencyCallHandled]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v6, "scdaCoordinatorDidHandleEmergency:", self);

  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  SCDANotifyObserver *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (SCDANotifyObserver *)a3;
  v7 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    -[SCDANotifyObserver name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[SCDACoordinator notifyObserver:didReceiveNotificationWithToken:]";
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a4;
    _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s Notification received: %@ (%d)", (uint8_t *)&v10, 0x1Cu);

  }
  if (self->_preferencesChangedNotification == v6)
  {
    -[SCDACoordinator _readDefaults](self, "_readDefaults");
  }
  else if (self->_myriadStateMachineForceNoActivityObserver == v6)
  {
    if (SCDAIsInternalInstall_onceToken != -1)
      dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
    if (SCDAIsInternalInstall_isInternal)
      -[SCDACoordinator _enterState:](self, "_enterState:", 0);
  }

}

- (void)injectAdvertisementForTesting:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    getWPHeySiriKeyManufacturerData();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v12 = v9;
      v13[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCDACoordinator heySiri:foundDevice:withInfo:](self, "heySiri:foundDevice:withInfo:", self->_heySiriBTLE, v8, v11);

    }
  }

}

- (void)startListeningToEmergencySignal
{
  -[SCDACoordinator _setupActionWindows](self, "_setupActionWindows");
  -[SCDACoordinator _enterState:](self, "_enterState:", 7);
}

- (BOOL)endWaitingForEmergency
{
  unint64_t myriadState;
  NSObject *v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman"))
    return 0;
  myriadState = self->_myriadState;
  if (myriadState != 5 && self->_nextState != 5)
  {
    v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      -[SCDACoordinator _stateAsString:](self, "_stateAsString:", myriadState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[SCDACoordinator endWaitingForEmergency]";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s endWaitingForEmergency called from invalid state: %@", (uint8_t *)&v10, 0x16u);

    }
    return 0;
  }
  -[SCDACoordinator resetStateMachine](self, "resetStateMachine");
  v4 = SCDALogContextCore;
  v5 = 1;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[SCDACoordinator endWaitingForEmergency]";
    _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s Ending Continuation Early", (uint8_t *)&v10, 0xCu);
  }
  return v5;
}

- (void)startAdvertisingEmergencySignal
{
  -[SCDACoordinator _setupActionWindows](self, "_setupActionWindows");
  -[SCDACoordinator _enterState:](self, "_enterState:", 8);
}

- (float)deviceTrumpDelay
{
  return self->_deviceTrumpDelay;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (void)myriadSession:(id)a3
{
  if (a3)
    (*((void (**)(id, SCDASession *))a3 + 2))(a3, self->_myriadSession);
}

- (void)resetMyriadCoordinator:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SCDACoordinator_resetMyriadCoordinator___block_invoke;
  v7[3] = &unk_25174ACA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWonBySmallAmountDate, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_currentMyriadContext, 0);
  objc_storeStrong(&self->_waitForWiproxReadinessToScan, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_myriadStateMachineForceNoActivityObserver, 0);
  objc_storeStrong((id *)&self->_preferencesChangedNotification, 0);
  objc_storeStrong((id *)&self->_electionRepostWinDecisionPublisher, 0);
  objc_storeStrong((id *)&self->_electionLossPublisher, 0);
  objc_storeStrong((id *)&self->_electionWinPublisher, 0);
  objc_storeStrong((id *)&self->_electionBeginPublisher, 0);
  objc_storeStrong((id *)&self->_myriadSession, 0);
  objc_storeStrong((id *)&self->_goodnessScoreEvaluator, 0);
  objc_storeStrong((id *)&self->_contextRecord, 0);
  objc_storeStrong((id *)&self->_advContextManager, 0);

  objc_storeStrong((id *)&self->_sfDiagnosticsTimer, 0);
  objc_storeStrong((id *)&self->_sfdiagnostics, 0);
  objc_storeStrong((id *)&self->_callPunchout, 0);
  objc_storeStrong((id *)&self->_triggerTime, 0);
  objc_storeStrong((id *)&self->_designatedSelfID, 0);
  objc_storeStrong((id *)&self->_electionParticipantIds, 0);
  objc_storeStrong((id *)&self->_electionParticipantIdVendor, 0);
  objc_storeStrong((id *)&self->_heySiriBTLE, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_maxSlowdownRecord, 0);
  objc_storeStrong((id *)&self->_overrideMyriadRecord, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_overallTimeout, 0);
  objc_storeStrong((id *)&self->_eventToken, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_myriadAdvertisementContextQueue, 0);
  objc_storeStrong((id *)&self->_myriadWorkQueue, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_deviceClassName, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_multipleContinuations, 0);
  objc_storeStrong((id *)&self->_incomingTrumps, 0);
  objc_storeStrong((id *)&self->_previousTrumps, 0);
  objc_storeStrong((id *)&self->_repliesBeforeDecision, 0);
  objc_storeStrong((id *)&self->_replyCounts, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_previousAdvertisedData, 0);
}

uint64_t __42__SCDACoordinator_resetMyriadCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __48__SCDACoordinator_heySiri_foundDevice_withInfo___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int i;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  int v63;
  const char *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "pHash");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 40);
  objc_msgSend(*(id *)(v3 + 376), "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  for (i = objc_msgSend(v6, "pHash") ^ v2; i; i &= i - 1)
    ++v7;

  v9 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD **)(a1 + 40);
    v11 = v10[1];
    v12 = v9;
    objc_msgSend(v10, "_stateAsString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 64);
    v63 = 136316418;
    v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
    v65 = 2112;
    v66 = v13;
    v67 = 2112;
    v68 = v14;
    v69 = 2112;
    v70 = v15;
    v71 = 2112;
    v72 = v16;
    v73 = 2112;
    v74 = v17;
    _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s #scda BTLE processing advert in state: %@ from: %@ BTLE address= %@ record= %@ advData= %@", (uint8_t *)&v63, 0x3Eu);

  }
  v18 = *(_QWORD **)(a1 + 40);
  switch(v18[1])
  {
    case 0:
    case 3:
    case 4:
    case 6:
    case 9:
    case 0xBLL:
    case 0xDLL:
    case 0x10:
      v19 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        objc_msgSend(v18, "_stateAsString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 48);
        v23 = *(_QWORD *)(a1 + 64);
        v63 = 136315906;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v65 = 2112;
        v66 = v21;
        v67 = 2112;
        v68 = v22;
        v69 = 2112;
        v70 = v23;
        _os_log_impl(&dword_246211000, v20, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert while in state %@: %@ data= %@", (uint8_t *)&v63, 0x2Au);

      }
      return;
    case 1:
    case 0xELL:
    case 0xFLL:
      if (!objc_msgSend(*(id *)(a1 + 40), "_testAndUpdateWedgeFilter:", *(_QWORD *)(a1 + 32)))
        return;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v25, "objectForKey:", *(_QWORD *)(a1 + 72));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v28, *(_QWORD *)(a1 + 72));

      }
      else
      {
        v46 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v47 = *(void **)(a1 + 48);
          v48 = *(_QWORD *)(a1 + 64);
          v63 = 136315650;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v65 = 2112;
          v66 = v47;
          v67 = 2112;
          v68 = v48;
          _os_log_impl(&dword_246211000, v46, OS_LOG_TYPE_INFO, "%s BTLE heard advert from: %@ data= %@", (uint8_t *)&v63, 0x20u);
        }
        v49 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKey:", v27, *(_QWORD *)(a1 + 72));
      }

      if (!objc_msgSend(*(id *)(a1 + 32), "isSlowdown"))
        goto LABEL_42;
      v50 = *(_QWORD *)(a1 + 40);
      v51 = *(void **)(v50 + 304);
      if (!v51)
        goto LABEL_39;
      v52 = objc_msgSend(v51, "slowdownDelay");
      if (v52 < (int)objc_msgSend(*(id *)(a1 + 32), "slowdownDelay"))
      {
        v50 = *(_QWORD *)(a1 + 40);
LABEL_39:
        objc_storeStrong((id *)(v50 + 304), *(id *)(a1 + 32));
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 327) = 1;
        v53 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v54 = *(_QWORD *)(a1 + 64);
          v55 = *(void **)(a1 + 48);
          v56 = *(void **)(*(_QWORD *)(a1 + 40) + 304);
          v57 = v53;
          v58 = objc_msgSend(v56, "slowdownDelay");
          v63 = 136315906;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v65 = 2112;
          v66 = v55;
          v67 = 2112;
          v68 = v54;
          v69 = 1024;
          LODWORD(v70) = v58;
          _os_log_impl(&dword_246211000, v57, OS_LOG_TYPE_INFO, "%s BTLE heard slowdown advert from: %@ data= %@, max delay is now %d msecs", (uint8_t *)&v63, 0x26u);

        }
        kdebug_trace();
      }
LABEL_42:
      if (v7 <= 16)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 608) = mach_absolute_time();
        goto LABEL_52;
      }
      v59 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v63 = 136315394;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v65 = 1024;
        LODWORD(v66) = v7;
        _os_log_impl(&dword_246211000, v59, OS_LOG_TYPE_INFO, "%s BTLE editDist: %d > allowed, ignoring this advert ", (uint8_t *)&v63, 0x12u);
      }
      return;
    case 2:
      v36 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v37 = *(void **)(a1 + 48);
        v38 = *(_QWORD *)(a1 + 64);
        v63 = 136315650;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v65 = 2112;
        v66 = v37;
        v67 = 2112;
        v68 = v38;
        _os_log_impl(&dword_246211000, v36, OS_LOG_TYPE_INFO, "%s BTLE suppressing straggler response to: %@ data= %@", (uint8_t *)&v63, 0x20u);
        v18 = *(_QWORD **)(a1 + 40);
      }
      v34 = v18;
      v35 = 3;
      goto LABEL_51;
    case 5:
      if (objc_msgSend(*(id *)(a1 + 32), "isAContinuation"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", *(_QWORD *)(a1 + 72));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v40 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            v41 = *(void **)(a1 + 48);
            v42 = *(_QWORD *)(a1 + 64);
            v63 = 136315650;
            v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
            v65 = 2112;
            v66 = v41;
            v67 = 2112;
            v68 = v42;
            _os_log_impl(&dword_246211000, v40, OS_LOG_TYPE_INFO, "%s BTLE heard another device sending continuation: %@ data= %@", (uint8_t *)&v63, 0x20u);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
      }
      return;
    case 7:
      if (objc_msgSend(*(id *)(a1 + 32), "isAnEmergency"))
        goto LABEL_49;
      return;
    case 8:
    case 0xCLL:
      v29 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v30 = *(void **)(a1 + 32);
        v63 = 136315394;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v65 = 2112;
        v66 = v30;
        _os_log_impl(&dword_246211000, v29, OS_LOG_TYPE_INFO, "%s BTLE heard a record waiting for a emergency handled notice: %@ ", (uint8_t *)&v63, 0x16u);
      }
      if (!objc_msgSend(*(id *)(a1 + 32), "isAnEmergencyHandled"))
        return;
      v31 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v32 = *(void **)(a1 + 48);
        v33 = *(_QWORD *)(a1 + 64);
        v63 = 136315650;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v65 = 2112;
        v66 = v32;
        v67 = 2112;
        v68 = v33;
        _os_log_impl(&dword_246211000, v31, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration was handled: %@ data= %@", (uint8_t *)&v63, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_signalEmergencyCallHandled");
      v34 = *(void **)(a1 + 40);
      v35 = 4;
      goto LABEL_51;
    case 0xALL:
      if (objc_msgSend(*(id *)(a1 + 32), "isAContinuation"))
      {
        v43 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v44 = *(void **)(a1 + 48);
          v45 = *(_QWORD *)(a1 + 64);
          v63 = 136315650;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v65 = 2112;
          v66 = v44;
          v67 = 2112;
          v68 = v45;
          _os_log_impl(&dword_246211000, v43, OS_LOG_TYPE_INFO, "%s BTLE heard a continuation: %@ data= %@", (uint8_t *)&v63, 0x20u);
        }
        objc_msgSend(*(id *)(a1 + 40), "_stopListening:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_enterState:", 7);
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isAnEmergency"))
      {
        v60 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v61 = *(void **)(a1 + 48);
          v62 = *(_QWORD *)(a1 + 64);
          v63 = 136315650;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v65 = 2112;
          v66 = v61;
          v67 = 2112;
          v68 = v62;
          _os_log_impl(&dword_246211000, v60, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration: %@ data= %@", (uint8_t *)&v63, 0x20u);
        }
LABEL_49:
        if (objc_msgSend(*(id *)(a1 + 40), "_shouldHandleEmergency"))
        {
          v34 = *(void **)(a1 + 40);
          v35 = 9;
LABEL_51:
          objc_msgSend(v34, "enterState:", v35);
        }
      }
      else
      {
LABEL_52:
        objc_msgSend(*(id *)(a1 + 40), "_updateRepliesWith:id:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
      }
      return;
    case 0x11:
      objc_msgSend(*(id *)(a1 + 40), "_testAndUpdateWedgeFilter:", *(_QWORD *)(a1 + 32));
      return;
    default:
      return;
  }
}

void __41__SCDACoordinator_heySiriDidUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 312) = objc_msgSend(*(id *)(a1 + 40), "state") == 3;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 312))
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SCDACoordinator heySiriDidUpdateState:]_block_invoke";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon wiprox state signalling", (uint8_t *)&v8, 0xCu);
      v2 = *(_QWORD *)(a1 + 32);
    }
    v4 = (void (**)(_QWORD))MEMORY[0x249555380](*(_QWORD *)(v2 + 472));
    objc_msgSend(*(id *)(a1 + 32), "_clearWiProxReadinessTimer");
    if (v4)
      v4[2](v4);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 600))
    {
      v5 = (void (**)(_QWORD))MEMORY[0x249555380]();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 600);
      *(_QWORD *)(v6 + 600) = 0;

      if (v5)
        v5[2](v5);

    }
  }
}

void __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v5 = 136315394;
      v6 = "-[SCDACoordinator _enterBLEDiagnosticMode]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s BTLE failed to enter diagnostic mode %@", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_leaveBLEDiagnosticMode");
  }

}

uint64_t __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke_350(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator _enterBLEDiagnosticMode]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE diagnostic mode timer fired", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_leaveBLEDiagnosticMode");
}

uint64_t __41__SCDACoordinator_waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_waitWiProx:andExecute:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __42__SCDACoordinator__waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  const char *label;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  const char *v17;
  const char *v18;
  _QWORD block[5];
  id v20;
  char v21;
  char v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 456);
  v4 = *(unsigned __int8 *)(v2 + 457);
  label = dispatch_queue_get_label(0);
  v6 = label;
  if (label && !strcmp(label, (const char *)scda_work_queue_label))
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
    v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v12 = "YES";
      if (v4)
        v13 = "YES";
      else
        v13 = "NO";
      v14 = *(_QWORD *)(a1 + 32);
      v24 = "-[SCDACoordinator _waitWiProx:andExecute:]_block_invoke";
      v15 = *(unsigned __int8 *)(v14 + 457);
      v16 = *(unsigned __int8 *)(v14 + 456);
      if (v15)
        v17 = "YES";
      else
        v17 = "NO";
      *(_DWORD *)buf = 136316162;
      if (v3)
        v18 = "YES";
      else
        v18 = "NO";
      v25 = 2080;
      v26 = v13;
      if (!v16)
        v12 = "NO";
      v27 = 2080;
      v28 = (uint64_t)v17;
      v29 = 2080;
      v30 = v18;
      v31 = 2080;
      v32 = v12;
      _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s #scda didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", buf, 0x34u);
    }
  }
  else
  {
    v7 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315651;
      v24 = "-[SCDACoordinator _waitWiProx:andExecute:]_block_invoke";
      v25 = 2081;
      v26 = v6;
      v27 = 2081;
      v28 = scda_work_queue_label;
      _os_log_error_impl(&dword_246211000, v7, OS_LOG_TYPE_ERROR, "%s #scda Method called on unexpected thread (curr:%{private}s expected:%{private}s)", buf, 0x20u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(NSObject **)(v2 + 176);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SCDACoordinator__waitWiProx_andExecute___block_invoke_344;
    block[3] = &unk_25174AAF8;
    v9 = *(id *)(a1 + 40);
    v21 = v4;
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = v9;
    v22 = v3;
    dispatch_async(v8, block);

  }
}

void __42__SCDACoordinator__waitWiProx_andExecute___block_invoke_344(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = "YES";
    if (*(_BYTE *)(a1 + 48))
      v5 = "YES";
    else
      v5 = "NO";
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 457))
      v7 = "YES";
    else
      v7 = "NO";
    if (*(_BYTE *)(a1 + 49))
      v8 = "YES";
    else
      v8 = "NO";
    if (!*(_BYTE *)(v6 + 456))
      v4 = "NO";
    v9 = 136316162;
    v10 = "-[SCDACoordinator _waitWiProx:andExecute:]_block_invoke";
    v11 = 2080;
    v12 = v5;
    v13 = 2080;
    v14 = v7;
    v15 = 2080;
    v16 = v8;
    v17 = 2080;
    v18 = v4;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", (uint8_t *)&v9, 0x34u);
  }
}

uint64_t __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_error_impl(&dword_246211000, v2, OS_LOG_TYPE_ERROR, "%s #scda BTLE WiProx readiness timer timed out, WiProx not called", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_clearWiProxReadinessTimer");
}

uint64_t __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke_343(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #scda BTLE done waiting on WiProx to execute", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __34__SCDACoordinator__ageWedgeFilter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(a3, "intValue");
  if (v5 >= 2)
  {
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v6 - 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, v10);

    }
  }

}

void __46__SCDACoordinator_notifyCurrentDecisionResult__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2 == 14 || v2 == 1)
  {
    v4 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      objc_msgSend((id)v1, "_stateAsString:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[SCDACoordinator notifyCurrentDecisionResult]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s BTLE ignoring decision result callback (state = %@)", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (*(_BYTE *)(v1 + 416))
  {
    v8 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_msgSend((id)v1, "_stateAsString:", v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[SCDACoordinator notifyCurrentDecisionResult]_block_invoke";
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s BTLE reposting result win (state = %@)", (uint8_t *)&v11, 0x16u);

      v1 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v1 + 560), "publishState:", objc_msgSend((id)v1, "_nextElectionPublisherState"));
  }
}

void __34__SCDACoordinator__sortedReplies___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "asAdvertisementData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isCollectedFromContextCollector"))
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
LABEL_4:

}

uint64_t __34__SCDACoordinator__sortedReplies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "deviceClass");
  if ((v8 == 10 || v8 == 6)
    && objc_msgSend(v6, "isATrump")
    && objc_msgSend(v7, "deviceClass") == 7
    && (objc_msgSend(v7, "isATrump") & 1) != 0)
  {
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "deviceClass") == 7)
  {
    if (objc_msgSend(v6, "isATrump"))
    {
      v9 = objc_msgSend(v7, "deviceClass");
      if ((v9 == 10 || v9 == 6) && (objc_msgSend(v7, "isATrump") & 1) != 0)
      {
        v10 = -1;
        goto LABEL_22;
      }
    }
  }
  v11 = objc_msgSend(v6, "goodness");
  if (v11 == objc_msgSend(v7, "goodness"))
  {
    v12 = objc_msgSend(v6, "userConfidence");
    v13 = objc_msgSend(v7, "userConfidence");
  }
  else
  {
    v12 = objc_msgSend(v6, "goodness");
    v13 = objc_msgSend(v7, "goodness");
  }
  v14 = v13;
  if (v12 == v13)
  {
    v12 = objc_msgSend(v6, "tieBreaker");
    v14 = objc_msgSend(v7, "tieBreaker");
    if (objc_msgSend(v6, "hasEqualAdvertismentData:", v7))
    {
      if (objc_msgSend(v6, "isCollectedFromContextCollector")
        && !objc_msgSend(v7, "isCollectedFromContextCollector"))
      {
LABEL_23:
        v10 = 1;
        goto LABEL_22;
      }
    }
  }
  if (v12 < v14)
    v10 = 1;
  else
    v10 = -1;
LABEL_22:

  return v10;
}

void __41__SCDACoordinator__shouldHandleEmergency__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[SCDACoordinator _shouldHandleEmergency]_block_invoke";
    v8 = 2048;
    v9 = a3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s BTLE EmergencyCallSummary %lu: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  double v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  char v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 323) = 0;
  v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v48 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]_block_invoke";
    v49 = 2112;
    v50 = v8;
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s #scda BTLE delay finished, advertising: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createElectionParticipantIdVendorIfRequired");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "fetchBTLEAddressIfRequired");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(v11, "myriadCoordinator:willStartAdvertisingUsingData:", *(_QWORD *)(a1 + 32), v5);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldUseContextCollector"))
    objc_msgSend(*(id *)(a1 + 32), "_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:", *(float *)(a1 + 48), *(float *)(a1 + 52));
  v12 = *(void **)(a1 + 32);
  v13 = MEMORY[0x24BDAC760];
  v14 = *(_DWORD *)(a1 + 48);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_327;
  v45[3] = &unk_25174ACA0;
  v45[4] = v12;
  v15 = v6;
  v46 = v15;
  LODWORD(v16) = v14;
  objc_msgSend(v12, "_startTimer:for:thenExecute:", CFSTR("advertise"), v45, v16);
  kdebug_trace();
  v17 = *(_QWORD **)(a1 + 32);
  if (v17[1] != 5)
  {
    v18 = (void *)v17[78];
    v19 = objc_msgSend(v17, "_myriadStateForSelf:");
    v21 = *(_DWORD *)(a1 + 48);
    v20 = *(_DWORD *)(a1 + 52);
    v22 = *(_DWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = mach_absolute_time();
    LODWORD(v25) = v20;
    LODWORD(v26) = v21;
    LODWORD(v27) = v22;
    objc_msgSend(v18, "logCDAElectionAdvertisingStarting:withDelay:withInterval:withVoiceTriggerLatency:withCdaId:withTimestamp:", v19, v23, v24, v25, v26, v27);

  }
  getWPHeySiriAdvertisingData();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = v29;
  if (v28)
    objc_msgSend(v29, "setObject:forKey:", v5, v28);
  objc_msgSend(*(id *)(a1 + 32), "_enterBLEDiagnosticMode");
  v31 = *(void **)(a1 + 32);
  v42[0] = v13;
  v42[1] = 3221225472;
  v42[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_2;
  v42[3] = &unk_25174A648;
  v42[4] = v31;
  v32 = v5;
  v43 = v32;
  v33 = v30;
  v44 = v33;
  objc_msgSend(v31, "_waitWiProxAndExecute:", v42);
  v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if (v34)
  {
    v35 = v34;
    v36 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    v37 = objc_opt_respondsToSelector();

    if ((v37 & 1) != 0)
    {
      v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
      objc_msgSend(v38, "scdaAdvertisingDidBegin:", *(_QWORD *)(a1 + 32));

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v39 = *(_QWORD *)(a1 + 32);
  v40 = *(void **)(v39 + 240);
  if (v40)
  {
    objc_msgSend(*(id *)(v39 + 368), "electionParticipantId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setElectionParticipantId:", v41);

  }
}

uint64_t __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_335(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 320) || *(_BYTE *)(v2 + 321)) && *(_QWORD *)(v2 + 8) == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingTimeInterval:", *(float *)(a1 + 64));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 488);
    *(_QWORD *)(v5 + 488) = v4;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", (float)(*(float *)(a1 + 64) + *(float *)(a1 + 68)));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 496);
    *(_QWORD *)(v9 + 496) = v8;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_327(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1] == 1)
  {
    v3 = (void *)v2[78];
    v4 = objc_msgSend(v2, "_myriadStateForSelf:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logCDAElectionTimerEnded:withCdaId:withTimestamp:", v4, v5, mach_absolute_time());

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_2(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t Milliseconds;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (_QWORD *)result;
  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 319) || *(_BYTE *)(v2 + 314))
  {
    v3 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      v5 = mach_absolute_time();
      Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v5);
      v7 = v1[5];
      v8 = 136315650;
      v9 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]_block_invoke_2";
      v10 = 2048;
      v11 = Milliseconds;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld %@", (uint8_t *)&v8, 0x20u);

      v2 = v1[4];
    }
    objc_msgSend(*(id *)(v2 + 352), "startScanningAndAdvertisingWithData:", v1[6]);
    *(_BYTE *)(v1[4] + 456) = 1;
    *(_BYTE *)(v1[4] + 457) = 1;
    return objc_msgSend(*(id *)(v1[4] + 360), "fetchBTLEAddressIfRequired");
  }
  return result;
}

uint64_t __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 7;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2;
  v6[3] = &unk_25174AD68;
  v6[4] = v4;
  return objc_msgSend(v4, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v3, v6, a2, a3, 0.0);
}

void __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3;
  block[3] = &unk_25174AD68;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAdvertisingAndListening");
}

uint64_t __33__SCDACoordinator_advertiseWith___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 7;
  LODWORD(a2) = 0;
  LODWORD(a3) = 0.5;
  LODWORD(a4) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", *(_QWORD *)(a1 + 40), 0, a2, a3, a4);
}

uint64_t __59__SCDACoordinator_startAdvertising_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return objc_msgSend(*(id *)(a1 + 32), "_startAdvertising:afterDelay:maxInterval:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __40__SCDACoordinator__advertiseIndefinite___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t Milliseconds;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  getWPHeySiriAdvertisingData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "asAdvertisementData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v3, "setObject:forKey:", v4, v2);
  objc_msgSend(*(id *)(a1 + 40), "_enterBLEDiagnosticMode");
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 319))
  {
    v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = mach_absolute_time();
      v9 = 136315650;
      v10 = "-[SCDACoordinator _advertiseIndefinite:]_block_invoke";
      v11 = 2048;
      Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v8);
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld %@", (uint8_t *)&v9, 0x20u);

      v5 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v5 + 352), "startScanningAndAdvertisingWithData:", v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 456) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 457) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_createElectionParticipantIdVendorIfRequired");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "fetchBTLEAddressIfRequired");
  }

}

uint64_t __83__SCDACoordinator__advertise_afterDelay_maxInterval_voiceTriggerLatency_andMoveTo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __52__SCDACoordinator__advertiseSuppressTriggerInOutput__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_endAdvertising:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetAudioData");
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 24);
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
    case 14:
      v5 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        v7 = v5;
        objc_msgSend((id)v3, "_stateAsString:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_stateAsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 330);
        v11 = 136315906;
        v12 = "-[SCDACoordinator _advertiseSuppressTriggerInOutput]_block_invoke";
        v13 = 2112;
        v14 = v8;
        v15 = 2112;
        v16 = v9;
        v17 = 1024;
        v18 = v10;
        _os_log_debug_impl(&dword_246211000, v7, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d", (uint8_t *)&v11, 0x26u);

        v3 = *(_QWORD *)(a1 + 32);
      }
      if (*(_BYTE *)(v3 + 330))
        objc_msgSend((id)v3, "_winElection");
LABEL_8:
      v2 = 2;
      break;
    case 2:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
      v2 = *(_QWORD *)(v3 + 24);
      break;
    case 3:
    case 4:
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "_winElection", 0);
      v2 = 4;
      break;
    case 7:
      v2 = 10;
      break;
    default:
      return objc_msgSend(*(id *)(a1 + 32), "enterState:", v2);
  }
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", v2);
}

uint64_t __37__SCDACoordinator__advertiseSlowdown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SCDACoordinator _advertiseSlowdown]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending slowdown advertising, 2nd pass not seen", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_endAdvertising:", 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 327) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 304);
  *(_QWORD *)(v3 + 304) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "enterState:", 0);
}

void __36__SCDACoordinator__advertiseTrigger__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  id *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[5];
  int v10;
  int v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 40);
  v11 = *(_DWORD *)(a1 + 44);
  v12 = v2;
  v10 = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:", &v12, &v11, &v10, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 300));
  objc_msgSend(*(id *)(a1 + 32), "_adjustActionWindowsFromSlowdown:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 300));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "generateTiebreaker");
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SCDACoordinator _advertiseTrigger]_block_invoke";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown finished, advertising delayed trigger", buf, 0xCu);
  }
  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[30], "asAdvertisementData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v11;
  LODWORD(v6) = v12;
  LODWORD(v8) = v10;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke_316;
  v9[3] = &unk_25174AD68;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:", v5, v9, v6, v7, v8);

}

void __36__SCDACoordinator__advertiseTrigger__block_invoke_320(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  objc_msgSend(v1, "_endAdvertisingWithDeviceProhibitions:", v2);

}

void __36__SCDACoordinator__advertiseTrigger__block_invoke_321(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  objc_msgSend(v1, "_endAdvertisingWithDeviceProhibitions:", v2);

}

void __36__SCDACoordinator__advertiseTrigger__block_invoke_316(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  objc_msgSend(v1, "_endAdvertisingWithDeviceProhibitions:", v2);

}

void __47__SCDACoordinator__duringNextWindowEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enterState:", *(_QWORD *)(a1 + 40));

}

void __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2;
  block[3] = &unk_25174A918;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 176);
  block[1] = 3221225472;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v16 = v5;
  v18 = *(_OWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

void __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDela"
          "y:]_block_invoke_2";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #scda Pushing Myriad advertisement context is complete", buf, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDe"
            "lay:]_block_invoke";
      v28 = 2112;
      v29 = v3;
      _os_log_error_impl(&dword_246211000, v4, OS_LOG_TYPE_ERROR, "%s #scda Error: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "currentElectionAdvertisementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    if (v6 && v5 && (objc_msgSend(v6, "isEqual:", v5) & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_shouldUseContextCollector"))
      {
        v20 = v5;
        objc_msgSend(*(id *)(a1 + 40), "_testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDispatchTime:advertisement:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if (objc_msgSend(*(id *)(a1 + 40), "_testAndUpdateWedgeFilter:", v12))
              {
                v13 = *(void **)(a1 + 40);
                objc_msgSend(v12, "deviceID");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "UUIDString");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "asAdvertisementData");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "_updateRepliesWith:id:data:", v12, v15, v16);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v9);
        }
        objc_msgSend(*(id *)(a1 + 40), "_suppressDeviceIfNeededWithVoiceTriggerEndTime:adverisementDispatchTime:", *(double *)(a1 + 72), *(double *)(a1 + 80));

        v5 = v20;
      }
      else
      {
        v19 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertiseme"
                "ntDelay:]_block_invoke";
          _os_log_debug_impl(&dword_246211000, v19, OS_LOG_TYPE_DEBUG, "%s #scda _shouldUseContextCollector is fslse", buf, 0xCu);
        }
      }
    }
    else
    {
      v17 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisement"
              "Delay:]_block_invoke";
        v28 = 2112;
        v29 = v18;
        v30 = 2112;
        v31 = v5;
        _os_log_impl(&dword_246211000, v17, OS_LOG_TYPE_INFO, "%s #scda current advId: %@ is different from the advId for which the myriad context was dispatched: %@", buf, 0x20u);
      }
    }

  }
}

void __91__SCDACoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a3, "isMe") & 1) == 0)
  {
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = a1[5];
      v8 = a1[6];
      v9 = a1[7];
      v10 = a1[8];
      v11 = 136316162;
      v12 = "-[SCDACoordinator _suppressDeviceIfNeededWithVoiceTriggerEndTime:adverisementDispatchTime:]_block_invoke";
      v13 = 2048;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda Suppressing the current device due to late trigger (voicetrigger endtime: %f, advertisement dispatch time: %f, advertisement delay: %f, myriad record count: %ld)", (uint8_t *)&v11, 0x34u);
    }
    *(_BYTE *)(a1[4] + 433) = 1;
    *a4 = 1;
  }
}

void __128__SCDACoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:", *(double *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 32) + 144)))
  {
    objc_msgSend(v6, "recordForDeviceId:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "deviceGroup") == *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 168))
      {
        objc_msgSend(v8, "deviceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376)) & 1) != 0)
        {

        }
        else
        {
          v15 = objc_msgSend(v6, "compareAdvertisementPayload:", *(_QWORD *)(a1 + 40));

          if ((v15 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
        }
      }
      else
      {
        v10 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v11 = v10;
          v12 = objc_msgSend(v8, "deviceGroup");
          objc_msgSend(v8, "deviceID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "advertisementPayload");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 136315906;
          v17 = "-[SCDACoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDisp"
                "atchTime:advertisement:]_block_invoke";
          v18 = 1024;
          v19 = v12;
          v20 = 2112;
          v21 = v13;
          v22 = 2112;
          v23 = v14;
          _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s #scda ignoring advert from other deviceGroup %d: %@ data=%@", (uint8_t *)&v16, 0x26u);

        }
      }
    }

  }
}

void __47__SCDACoordinator__stopAdvertisingAndListening__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator _stopAdvertisingAndListening]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising and scanning of HeySiri advertisements", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 319))
  {
    objc_msgSend(*(id *)(v3 + 352), "stopScanningAndAdvertising");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 457) = 0;
  }
}

uint64_t __33__SCDACoordinator_stopListening___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListening:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__SCDACoordinator_stopListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListening:", 0);
}

uint64_t __34__SCDACoordinator__stopListening___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SCDACoordinator _stopListening:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping to scan HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 319))
  {
    objc_msgSend(*(id *)(v3 + 352), "stopScanning");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __36__SCDACoordinator__stopAdvertising___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SCDACoordinator _stopAdvertising:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 319))
  {
    objc_msgSend(*(id *)(v3 + 352), "stopAdvertising");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 457) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __34__SCDACoordinator_startListening___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__SCDACoordinator_startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening:", 0);
}

void __72__SCDACoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 1);
    if (v4 == *(_QWORD *)(a1 + 48))
    {
      v5 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v6 = 136315394;
        v7 = "-[SCDACoordinator _startListeningAfterWiProxIsReady:inState:completion:]_block_invoke";
        v8 = 2048;
        v9 = v4;
        _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s starting to scan in state: %lu", (uint8_t *)&v6, 0x16u);
      }
      objc_msgSend(v3, "_startListening:", *(_QWORD *)(a1 + 32));
    }
  }

}

uint64_t __35__SCDACoordinator__startListening___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 319))
  {
    objc_msgSend(*(id *)(v2 + 352), "startScanning");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_createElectionParticipantIdVendorIfRequired");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "fetchBTLEAddressIfRequired");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __30__SCDACoordinator_enterState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", *(_QWORD *)(a1 + 40));
}

uint64_t __31__SCDACoordinator__enterState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loseElection");
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
}

uint64_t __37__SCDACoordinator__setOverallTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SCDACoordinator _setOverallTimeout]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE Coordinator hitting overall timeout, resetting to NoActivity and declaring loss", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[1])
  {
    objc_msgSend(v3, "_loseElection");
    v3 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v3, "_enterState:", 0);
}

void __50__SCDACoordinator__startTimer_for_thenEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_enterState:", *(_QWORD *)(a1 + 40));

}

uint64_t __47__SCDACoordinator__startTimer_for_thenExecute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
    v5 = 136315394;
    v6 = "-[SCDACoordinator _startTimer:for:thenExecute:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE %@ timer fires", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__SCDACoordinator__createDispatchTimerWithTime_toExecute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208);
    v6 = 136315650;
    v7 = "-[SCDACoordinator _createDispatchTimerWithTime:toExecute:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #scda Event token: %@, current event token: %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 208) && objc_msgSend(*(id *)(a1 + 32), "isEqual:"))
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

void __38__SCDACoordinator__clearMyriadSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[SCDACoordinator _clearMyriadSession]_block_invoke";
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda Election advertisement %@ -> %@", (uint8_t *)&v7, 0x20u);
  }

}

void __35__SCDACoordinator_updateRequestId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "-[SCDACoordinator updateRequestId:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_246211000, v2, OS_LOG_TYPE_DEBUG, "%s #scda requestIdNotification: %@", (uint8_t *)&v9, 0x16u);
  }
  v3 = *(void **)(a1 + 40);
  v4 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", v6);
  objc_msgSend(v3, "setCurrentRequestId:", v7);

}

void __49__SCDACoordinator__createMyriadSessionIfRequired__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDD1880];
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionId:", v4);

}

void __64__SCDACoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "_myriadSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "electionAdvertisementDataByIds");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v7);
  objc_msgSend(v6, "setObject:forKey:", a1[5], a1[6]);
  objc_msgSend(v4, "setCurrentElectionAdvertisementId:", a1[6]);
  objc_msgSend(v4, "setCurrentElectionAdvertisementData:", a1[5]);
  objc_msgSend(v4, "setElectionAdvertisementDataByIds:", v6);

}

uint64_t __37__SCDACoordinator__forceLocalWinner___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240);
    v16 = 136315650;
    v17 = "-[SCDACoordinator _forceLocalWinner:]_block_invoke";
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #scda force win on this device with context: %@, triggerRecord: %@", (uint8_t *)&v16, 0x20u);
  }
  v5 = *(_BYTE **)(a1 + 40);
  if (v5[319])
  {
    objc_msgSend(v5, "_createElectionParticipantIdVendorIfRequired");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "fetchBTLEAddressIfRequired");
    v5 = *(_BYTE **)(a1 + 40);
  }
  objc_msgSend(v5, "_winElection");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 330) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_setMyriadContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_createMyriadSessionIfRequired");
  v6 = *(_QWORD **)(a1 + 40);
  v7 = (void *)v6[78];
  v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "sessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 5, v9, mach_absolute_time());

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "updateIsTrump:withReason:", 1, 5);
  v10 = *(id **)(a1 + 40);
  v11 = v10[30];
  if (v11)
  {
    objc_msgSend(v11, "setRawAudioGoodnessScore:withBump:", objc_msgSend(v10[30], "rawAudioGoodnessScore"), 255);
  }
  else
  {
    objc_msgSend(v10, "directTriggerRecord");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 240);
    *(_QWORD *)(v13 + 240) = v12;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 320) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 40), "_enterState:", 14);
}

uint64_t __48__SCDACoordinator_faceDetectedBoostWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 434) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "rawAudioGoodnessScore"), 255);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "generateTiebreaker");
  v2 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    v5 = v2;
    LODWORD(v4) = objc_msgSend(v4, "rawAudioGoodnessScore");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "goodness");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "bump");
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "tieBreaker");
    objc_msgSend(*(id *)(a1 + 32), "_stateAsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136316418;
    v11 = "-[SCDACoordinator faceDetectedBoostWithContext:]_block_invoke";
    v12 = 1024;
    v13 = (int)v4;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s #scda attention is boosting goodness score, rawAudioGoodnessScore %u, goodness:%u bump: %u, tieBreaker:%u, _myriadState: %@", (uint8_t *)&v10, 0x2Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_forceLocalWinner:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateIsTrump:withReason:", 1, 8);
}

void __39__SCDACoordinator_setCurrentRequestId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 632), *(id *)(a1 + 40));
}

void __32__SCDACoordinator_setupEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "_stateAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[SCDACoordinator setupEnabled:]_block_invoke";
    v10 = 1024;
    v11 = v3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s #scda setupEnabled: %d, current state: %@", (uint8_t *)&v8, 0x1Cu);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(v7 + 318) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 318) = objc_msgSend(*(id *)(v7 + 592), "coordinationEnabled");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
  }
}

void __29__SCDACoordinator_setInTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[SCDACoordinator setInTask:]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s inTask=%d", (uint8_t *)&v4, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = *(_BYTE *)(a1 + 40);
}

uint64_t __25__SCDACoordinator_inTask__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 313);
  return result;
}

uint64_t __26__SCDACoordinator_endTask__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator endTask]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 434) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "releaseAllPowerAssertions");
}

uint64_t __56__SCDACoordinator_endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAdvertisingWithDeviceProhibitions:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__SCDACoordinator__endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 330) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", *(_QWORD *)(a1 + 40));
}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a2;
  v5 = [v3 alloc];
  v13[0] = CFSTR("dc");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "deviceClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = CFSTR("pt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "productType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("goodness");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v4, "goodness");

  objc_msgSend(v8, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithDictionary:", v11);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
}

uint64_t __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_192(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "deviceClass");
  if ((_DWORD)result == 7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_214(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "isMe"))
  {
    *a4 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v12, "rawAudioGoodnessScore");
    v6 = objc_alloc_init(MEMORY[0x24BE94A78]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDeviceClass:", objc_msgSend(v12, "deviceClass"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setProductType:", objc_msgSend(v12, "productType"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setGoodnessScore:", objc_msgSend(v12, "goodness"));
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v12, "electionParticipantId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SCDAToSISchemaUUID(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setElectionParticipantId:", v11);

  }
}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_215(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (objc_msgSend(v7, "isMe"))
  {
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "rawAudioGoodnessScore");
      v8 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        v14 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v15 = 136315394;
        v16 = "-[SCDACoordinator _endAdvertisingAnalyticsContext:]_block_invoke";
        v17 = 1024;
        v18 = v14;
        _os_log_debug_impl(&dword_246211000, v8, OS_LOG_TYPE_DEBUG, "%s #myriad lost with rawScore: %d", (uint8_t *)&v15, 0x12u);
      }
    }
  }
  v9 = objc_alloc_init(MEMORY[0x24BE94A78]);
  objc_msgSend(v9, "setDeviceClass:", objc_msgSend(v7, "deviceClass"));
  objc_msgSend(v9, "setProductType:", objc_msgSend(v7, "productType"));
  objc_msgSend(v9, "setGoodnessScore:", objc_msgSend(v7, "goodness"));
  v10 = objc_msgSend(v7, "isMe");
  objc_msgSend(v7, "electionParticipantId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
    goto LABEL_8;

  if (v12)
  {
    objc_msgSend(v7, "electionParticipantId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
LABEL_8:
    SCDAToSISchemaUUID(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setElectionParticipantId:", v13);

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "electionParticipantId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setElectionParticipantId:", v12);
LABEL_9:

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  if (a3 >= 9)
    *a4 = 1;

}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_216(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  objc_class *v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = (objc_class *)MEMORY[0x24BE94A00];
  v8 = a2;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setAudioHash:", objc_msgSend(v8, "pHash"));
  objc_msgSend(v10, "setGoodnessScore:", objc_msgSend(v8, "goodness"));
  objc_msgSend(v10, "setConfidenceScore:", objc_msgSend(v8, "userConfidence"));
  objc_msgSend(v10, "setDeviceClass:", objc_msgSend(v8, "deviceClass"));
  objc_msgSend(v10, "setDeviceGroup:", objc_msgSend(v8, "deviceGroup"));
  objc_msgSend(v10, "setProductType:", objc_msgSend(v8, "productType"));
  objc_msgSend(v10, "setTieBreaker:", objc_msgSend(v8, "tieBreaker"));
  objc_msgSend(v10, "setIsFromContextCollector:", objc_msgSend(v8, "isCollectedFromContextCollector") != 0);
  v9 = objc_msgSend(v8, "isMe");

  objc_msgSend(v10, "setIsSelf:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  if (a3 >= 9)
    *a4 = 1;

}

uint64_t __34__SCDACoordinator_endAdvertising___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAdvertising:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  _QWORD v4[5];
  int v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke_2;
  v4[3] = &unk_25174A698;
  v5 = v2;
  v4[4] = v1;
  return objc_msgSend(v1, "_startTimer:for:thenExecute:", CFSTR("end advert delay"), v4);
}

uint64_t __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  double v3;
  int v5;
  const char *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(float *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[SCDACoordinator endAdvertisingAfterDelay:]_block_invoke_2";
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending advertising after %f secs delay", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", 0);
}

uint64_t __44__SCDACoordinator_startAdvertisingSlowdown___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int16 *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[SCDACoordinator startAdvertisingSlowdown:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown: %d msecs", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = *(unsigned __int16 *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 327) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 16);
}

void __44__SCDACoordinator_startResponseAdvertising___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SCDACoordinator startResponseAdvertising:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing stragglers", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "responseObject:", *(unsigned __int16 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 324) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "_startAdvertising:afterDelay:maxInterval:", v3, v4, v5);

}

uint64_t __74__SCDACoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[SCDACoordinator startAdvertisingFromAlertFiringVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE voice trigger during alert heard", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[78];
  v5 = objc_msgSend(v3, "_myriadStateForSelf:", v3[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 8, v6, mach_absolute_time());

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateIsTrump:withReason:", 1, 2);
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

uint64_t __69__SCDACoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SCDACoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s BTLE voice trigger while inTask with context: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_setMyriadContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_updateVoiceTriggerTimeFromFile");
  return objc_msgSend(*(id *)(a1 + 40), "_startAdvertisingFromInTaskVoiceTrigger");
}

uint64_t __44__SCDACoordinator_startAdvertisingEmergency__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[SCDACoordinator startAdvertisingEmergency]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE sending emergency beacon", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[78];
  v5 = objc_msgSend(v3, "_myriadStateForSelf:", v3[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 7, v6, mach_absolute_time());

  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = 1;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemUptime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) = v8;

  return objc_msgSend(*(id *)(a1 + 32), "_duringNextWindowEnterState:", 8);
}

uint64_t __51__SCDACoordinator_startAdvertisingEmergencyHandled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDACoordinator startAdvertisingEmergencyHandled]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE handling emergency beacon", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 9);
}

uint64_t __53__SCDACoordinator_startAdvertisingFromCarPlayTrigger__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[SCDACoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in CarPlay trigger", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[78];
  v5 = objc_msgSend(v3, "_myriadStateForSelf:", v3[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 4, v6, mach_absolute_time());

  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", 0, 244);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 329) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 1;
  v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[SCDACoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_debug_impl(&dword_246211000, v10, OS_LOG_TYPE_DEBUG, "%s #myriad CarPlay override", (uint8_t *)&v12, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_forceLocalWinner:", 0);
}

uint64_t __51__SCDACoordinator_startAdvertisingFromInEarTrigger__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[SCDACoordinator startAdvertisingFromInEarTrigger]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in ear voice trigger", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[78];
  v5 = objc_msgSend(v3, "_myriadStateForSelf:", v3[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 3, v6, mach_absolute_time());

  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v7;

  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v10 + 313))
  {
    objc_msgSend(*(id *)(v10 + 240), "setRawAudioGoodnessScore:withBump:", 0, 248);
    v10 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v10 + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 6;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

uint64_t __66__SCDACoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[SCDACoordinator startAdvertisingFromOutgoingTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing trigger in audio output", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[78];
  v5 = objc_msgSend(v3, "_myriadStateForSelf:", v3[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 5, v6, mach_absolute_time());

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateIsTrump:withReason:", 1, 5);
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256);
    v13 = 136315394;
    v14 = "-[SCDACoordinator startAdvertisingFromOutgoingTriggerWithContext:]_block_invoke";
    v15 = 2048;
    v16 = v12;
    _os_log_debug_impl(&dword_246211000, v10, OS_LOG_TYPE_DEBUG, "%s #scda _voiceTriggerTime: %llu", (uint8_t *)&v13, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 14);
}

uint64_t __64__SCDACoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[SCDACoordinator startAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[78];
  v5 = objc_msgSend(v3, "_myriadStateForSelf:", v3[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 1, v6, mach_absolute_time());

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateIsTrump:withReason:", 1, 6);
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

uint64_t __69__SCDACoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[SCDACoordinator startWatchAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  if (objc_msgSend(*(id *)(a1 + 40), "activationSource") == 3)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[SCDACoordinator startWatchAdvertisingFromDirectTriggerWithContext:]_block_invoke";
      _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s Setting RAISE_TO_SPEAK Trump Reason for DirectTrigger", (uint8_t *)&v13, 0xCu);
    }
    v4 = 1;
  }
  else
  {
    v4 = 6;
  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[78];
  v7 = objc_msgSend(v5, "_myriadStateForSelf:", v5[1]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v7, 1, v8, mach_absolute_time());

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateIsTrump:withReason:", 1, v4);
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 240);
  *(_QWORD *)(v10 + 240) = v9;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 325) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

void __68__SCDACoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SCDAGoodnessScoreContext *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v20 = 136315138;
    *(_QWORD *)&v20[4] = "-[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s ", v20, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 313))
  {
    objc_msgSend((id)v3, "_startAdvertisingFromInTaskVoiceTrigger");
    return;
  }
  v4 = *(void **)(v3 + 624);
  v5 = objc_msgSend((id)v3, "_myriadStateForSelf:", *(_QWORD *)(v3 + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v5, 2, v6, mach_absolute_time());

  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v7;

  v10 = objc_alloc_init(SCDAGoodnessScoreContext);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceNow");
    if (v12 > -180.0)
      -[SCDAGoodnessScoreContext setRecentlyWonBySmallAmount:](v10, "setRecentlyWonBySmallAmount:", 1);
  }
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "getMyriadAdjustedBoostForGoodnessScoreContext:", v10);
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "rawAudioGoodnessScore");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", v14, v13);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  if ((v14 - 25) <= 0xE7u)
  {
    v15 = SCDALogContextCore;
    v16 = os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO);
    if ((_DWORD)v14)
    {
      if (v16)
      {
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = "-[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
        *(_WORD *)&v20[12] = 1024;
        *(_DWORD *)&v20[14] = v14;
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = 25;
        v17 = "%s #scda watch trumping due to threshold for rawAudioGoodnessScore: %u >= %u";
        v18 = v15;
        v19 = 24;
LABEL_14:
        _os_log_impl(&dword_246211000, v18, OS_LOG_TYPE_INFO, v17, v20, v19);
      }
    }
    else if (v16)
    {
      *(_DWORD *)v20 = 136315138;
      *(_QWORD *)&v20[4] = "-[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      v17 = "%s #scda watch trumping due to score being 0";
      v18 = v15;
      v19 = 12;
      goto LABEL_14;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setPHash:", 0xFFFFLL, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", 0, 244);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "updateIsTrump:withReason:", 1, 3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 326) = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 325) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 10;
  objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);

}

void __88__SCDACoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  double v6;
  NSObject *v7;
  int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  NSObject *v17;
  unsigned __int8 *v18;
  id v19;
  int v20;
  int v21;
  id v22;
  _BYTE *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  _BYTE v33[10];
  _BYTE v34[6];
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_setMyriadContext:", a1[5]);
  objc_msgSend(a1[6], "getOverridingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "overriddenAdjustedScore");
  }
  else
  {
    v5 = (void *)*((_QWORD *)a1[4] + 80);
    if (v5)
    {
      objc_msgSend(v5, "timeIntervalSinceNow");
      if (v6 > -180.0)
        objc_msgSend(a1[6], "setRecentlyWonBySmallAmount:", 1);
    }
    v4 = objc_msgSend(*((id *)a1[4] + 65), "getMyriadAdjustedBoostForGoodnessScoreContext:", a1[6]);
  }
  *((_BYTE *)a1[4] + 280) = v4;
  v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = *((unsigned __int8 *)a1[4] + 280);
    v30 = 136315650;
    v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    v32 = 2112;
    *(_QWORD *)v33 = v3;
    *(_WORD *)&v33[8] = 1024;
    *(_DWORD *)v34 = v8;
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s #scda overrideContext: %@, _incomingAdjustment %d", (uint8_t *)&v30, 0x1Cu);
  }
  v9 = a1[4];
  v10 = (void *)v9[36];
  v9[36] = 0;

  objc_msgSend(a1[5], "overrideState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v30 = 136315394;
      v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
      v32 = 2112;
      *(_QWORD *)v33 = v11;
      _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s #scda Goodness score override state %@", (uint8_t *)&v30, 0x16u);
    }
    v13 = objc_msgSend(v11, "overrideOption");
    if (v13 == 2)
    {
      objc_msgSend(a1[4], "startAdvertisingFromInEarTrigger");
    }
    else if (v13 == 1)
    {
      objc_msgSend(a1[4], "directTriggerRecord");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[4];
      v16 = (void *)v15[36];
      v15[36] = v14;

      objc_msgSend(*((id *)a1[4] + 78), "updateIsTrump:withReason:", 1, 6);
    }
  }
  v17 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v18 = (unsigned __int8 *)a1[4];
    v19 = a1[5];
    v20 = v18[313];
    v21 = v18[314];
    LODWORD(v18) = v18[280];
    v22 = a1[6];
    v30 = 136316418;
    v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    v32 = 1024;
    *(_DWORD *)v33 = v20;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v21;
    *(_WORD *)v34 = 1024;
    *(_DWORD *)&v34[2] = (_DWORD)v18;
    v35 = 2112;
    v36 = v19;
    v37 = 2112;
    v38 = v22;
    _os_log_impl(&dword_246211000, v17, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, incomingAdjustment=%d,  context=%@, goodnessScoreContext=%@", (uint8_t *)&v30, 0x32u);
  }
  v23 = a1[4];
  if (v23[313] || v23[314])
  {
    objc_msgSend(v23, "_startAdvertisingFromInTaskVoiceTrigger");
    goto LABEL_21;
  }
  if (!v11 || !a1[5])
  {
LABEL_31:
    objc_msgSend(v23, "_createMyriadSessionIfRequired");
    objc_msgSend(a1[4], "_startAdvertisingFromVoiceTrigger");
    goto LABEL_21;
  }
  objc_msgSend(v11, "reason");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("CarPlay request"));

  if ((v25 & 1) == 0)
  {
    v23 = a1[4];
    goto LABEL_31;
  }
  v26 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v30 = 136315394;
    v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    v32 = 2112;
    *(_QWORD *)v33 = v11;
    _os_log_debug_impl(&dword_246211000, v26, OS_LOG_TYPE_DEBUG, "%s #myriad CarPlay override %@", (uint8_t *)&v30, 0x16u);
  }
  objc_msgSend(a1[4], "_initializeTimer");
  objc_msgSend(a1[4], "voiceTriggerRecord");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = a1[4];
  v29 = (void *)v28[30];
  v28[30] = v27;

  if (!objc_msgSend(*((id *)a1[4] + 30), "pHash"))
    objc_msgSend(*((id *)a1[4] + 30), "setPHash:", 0xFFFFLL);
  *((_BYTE *)a1[4] + 329) = 1;
  objc_msgSend(a1[4], "_forceLocalWinner:", a1[5]);
LABEL_21:

}

uint64_t __63__SCDACoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned __int8 *v3;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_updateVoiceTriggerTimeFromFile");
  v3 = *(unsigned __int8 **)(a1 + 32);
  if (v3[329])
  {
    v3[329] = 0;
  }
  else
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v5 = v3[313];
      v6 = v3[314];
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136315906;
      v9 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      v10 = 1024;
      v11 = v5;
      v12 = 1024;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, context=%@", (uint8_t *)&v8, 0x22u);
      v3 = *(unsigned __int8 **)(a1 + 32);
    }
    objc_msgSend(v3, "_createMyriadSessionIfRequired");
    return objc_msgSend(*(id *)(a1 + 32), "_startAdvertisingFromVoiceTrigger");
  }
  return result;
}

uint64_t __32__SCDACoordinator_preheatWiProx__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 8))
  {
    v2 = result;
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v4 = *(_DWORD *)(v1 + 300);
      v5 = 136315394;
      v6 = "-[SCDACoordinator preheatWiProx]_block_invoke";
      v7 = 1024;
      v8 = v4;
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Preheat shows slowdown for this device as %d msecs", (uint8_t *)&v5, 0x12u);
      v1 = *(_QWORD *)(v2 + 32);
    }
    if (*(_DWORD *)(v1 + 300))
    {
      return objc_msgSend((id)v1, "startAdvertisingSlowdown:", (unsigned __int16)*(_DWORD *)(v1 + 300));
    }
    else
    {
      objc_msgSend((id)v1, "_initializeTimer");
      return objc_msgSend(*(id *)(v2 + 32), "enterState:", 15);
    }
  }
  return result;
}

uint64_t __31__SCDACoordinator_readDefaults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readDefaults");
}

uint64_t __36__SCDACoordinator_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 319))
  {
    objc_msgSend(*(id *)(v2 + 352), "stopScanningAndAdvertising");
    objc_msgSend(*(id *)(a1 + 32), "_createElectionParticipantIdVendorIfRequired");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "fetchBTLEAddressIfRequired");
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 456) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 457) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", 17);
}

+ (void)initialize
{
  if (SCDALogInitIfNeeded_once != -1)
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_512);
}

+ (id)currentCoordinator
{
  return (id)_currentCoordinator;
}

+ (void)didChangeDefaults
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.readdefaults"), 0, 0, 1u);
}

+ (void)clearCurrentCoordinator
{
  void *v2;

  v2 = (void *)_currentCoordinator;
  _currentCoordinator = 0;

}

@end
