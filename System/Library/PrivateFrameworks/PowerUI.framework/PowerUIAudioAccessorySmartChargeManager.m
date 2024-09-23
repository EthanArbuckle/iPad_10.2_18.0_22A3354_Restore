@implementation PowerUIAudioAccessorySmartChargeManager

- (PowerUIAudioAccessorySmartChargeManager)init
{
  PowerUIAudioAccessorySmartChargeManager *v2;
  os_log_t v3;
  OS_os_log *accessoryLog;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableDictionary *latestAnalyticsForDevice;
  NSLock *v11;
  NSLock *deviceArrayLock;
  NSMutableDictionary *v13;
  NSMutableDictionary *accessoryStates;
  unint64_t v15;
  uint64_t v16;
  NSMutableArray *deviceArray;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSObject *v20;
  NSObject *v21;
  NSMutableArray *v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  uint64_t i;
  uint64_t v28;
  PowerUIAccessoryStatus *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  dispatch_time_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  NSMutableDictionary *v68;
  NSObject *v69;
  uint64_t v70;
  double v71;
  PowerUIMLAudioAccessoryModelPredictor *v72;
  PowerUIMLAudioAccessoryModelPredictor *predictor;
  uint64_t v74;
  NSXPCListener *listener;
  uint64_t v76;
  NSDistributedNotificationCenter *notificationCenter;
  dispatch_semaphore_t v78;
  OS_dispatch_semaphore *btConnectionSemaphore;
  uint64_t v80;
  PowerUIWalletSignalMonitor *walletMonitor;
  uint64_t v82;
  NSNumber *hardcodedTimeDelta;
  uint64_t v84;
  NSNumber *hardcodedTimeBetweenUpdates;
  void *v86;
  uint64_t v87;
  NSNumber *budSideToRecord;
  uint64_t v89;
  NSNumber *v90;
  void *v91;
  uint64_t v92;
  PowerUIAudioAccessorySmartChargeManager *v93;
  NSMutableDictionary *v94;
  NSMutableDictionary *acceptMessageFromRightBudForDevice;
  NSMutableDictionary *v96;
  NSMutableDictionary *acceptMessageFromLeftBudForDevice;
  PowerUIBluetoothHandler *v98;
  PowerUIBluetoothHandler *btHandler;
  NSObject *v100;
  PowerUIAudioAccessorySmartChargeManager *v101;
  NSObject *v102;
  PowerUIAudioAccessorySmartChargeManager *v103;
  NSObject *v104;
  __int128 v106;
  NSMutableArray *obj;
  id v108;
  uint64_t v109;
  PowerUIAudioAccessorySmartChargeManager *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[4];
  PowerUIAudioAccessorySmartChargeManager *v116;
  int v117;
  _QWORD v118[4];
  PowerUIAudioAccessorySmartChargeManager *v119;
  int out_token;
  _QWORD v121[4];
  PowerUIAudioAccessorySmartChargeManager *v122;
  _QWORD handler[4];
  PowerUIAudioAccessorySmartChargeManager *v124;
  _QWORD block[4];
  PowerUIAudioAccessorySmartChargeManager *v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  objc_super v132;
  uint8_t buf[4];
  uint64_t v134;
  __int16 v135;
  double v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v132.receiver = self;
  v132.super_class = (Class)PowerUIAudioAccessorySmartChargeManager;
  v2 = -[PowerUIAudioAccessorySmartChargeManager init](&v132, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.smartcharging.AudioAccessory", "main");
    accessoryLog = v2->_accessoryLog;
    v2->_accessoryLog = (OS_os_log *)v3;

    v5 = v2->_accessoryLog;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "PowerUIAudioAccessorySmartChargeManager initializing...", buf, 2u);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.PowerUIAgent.btQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    latestAnalyticsForDevice = v2->_latestAnalyticsForDevice;
    v2->_latestAnalyticsForDevice = (NSMutableDictionary *)v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    deviceArrayLock = v2->_deviceArrayLock;
    v2->_deviceArrayLock = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessoryStates = v2->_accessoryStates;
    v2->_accessoryStates = v13;

    v15 = 0x24D3FA000uLL;
    +[PowerUIAudioAccessorySmartChargeManager readArrayForPreferenceKey:](PowerUIAudioAccessorySmartChargeManager, "readArrayForPreferenceKey:", CFSTR("com.apple.smartcharging.audioaccessories.deviceArray"));
    v16 = objc_claimAutoreleasedReturnValue();
    deviceArray = v2->_deviceArray;
    v2->_deviceArray = (NSMutableArray *)v16;

    if (!v2->_deviceArray)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = v2->_deviceArray;
      v2->_deviceArray = v18;

      v20 = v2->_accessoryLog;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "No deviceArray loaded, set up new", buf, 2u);
      }
    }
    v21 = v2->_accessoryLog;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v2->_deviceArray;
      v23 = v21;
      v24 = -[NSMutableArray count](v22, "count");
      *(_DWORD *)buf = 134217984;
      v134 = v24;
      _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "Device array with %lu entries was loaded", buf, 0xCu);

    }
    v108 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    obj = v2->_deviceArray;
    v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
    if (v111)
    {
      v109 = *(_QWORD *)v129;
      v26 = 0x24BDBC000uLL;
      *(_QWORD *)&v25 = 138412546;
      v106 = v25;
      v110 = v2;
      do
      {
        for (i = 0; i != v111; ++i)
        {
          if (*(_QWORD *)v129 != v109)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i);
          v29 = objc_alloc_init(PowerUIAccessoryStatus);
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.currentState."), v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v31 = v2->_accessoryLog;
            v30 = &unk_24D443858;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v134 = v28;
              _os_log_error_impl(&dword_215A71000, v31, OS_LOG_TYPE_ERROR, "ERROR: No proper value stored for 'currentState' for device '%@'", buf, 0xCu);
            }
          }
          -[PowerUIAccessoryStatus setCurrentState:](v29, "setCurrentState:", objc_msgSend(v30, "unsignedIntegerValue", v106));
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.enabled."), v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            v33 = v2->_accessoryLog;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v134 = v28;
              _os_log_error_impl(&dword_215A71000, v33, OS_LOG_TYPE_ERROR, "ERROR: No proper value stored for 'enabled' for device '%@'", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v113 = v32;
          -[PowerUIAccessoryStatus setEnabled:](v29, "setEnabled:", objc_msgSend(v32, "BOOLValue"));
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.disabledUntilDate."), v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v34;
          if (v34)
          {
            v35 = *(void **)(v26 + 3680);
            objc_msgSend(v34, "doubleValue");
            objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "timeIntervalSinceNow");
            if (v37 >= 0.0)
            {
              v38 = v37;
              -[PowerUIAccessoryStatus setDisabledUntilDate:](v29, "setDisabledUntilDate:", v36);
              -[PowerUIAccessoryStatus setTemporarilyDisabled:](v29, "setTemporarilyDisabled:", 1);
              v39 = dispatch_walltime(0, (uint64_t)(v38 * 1000000000.0));
              v40 = v2->_queue;
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke;
              block[3] = &unk_24D3FC690;
              v126 = v2;
              v127 = v28;
              dispatch_after(v39, v40, block);
              v41 = v2->_accessoryLog;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v106;
                v134 = v28;
                v135 = 2048;
                v136 = v38 / 60.0;
                _os_log_impl(&dword_215A71000, v41, OS_LOG_TYPE_DEFAULT, "PowerUI restart: Re-enable device '%@' in %f minutes", buf, 0x16u);
              }

            }
            else
            {
              -[PowerUIAccessoryStatus setDisabledUntilDate:](v29, "setDisabledUntilDate:", 0);
              -[PowerUIAccessoryStatus setTemporarilyDisabled:](v29, "setTemporarilyDisabled:", 0);
            }

          }
          else
          {
            -[PowerUIAccessoryStatus setDisabledUntilDate:](v29, "setDisabledUntilDate:", 0);
            -[PowerUIAccessoryStatus setTemporarilyDisabled:](v29, "setTemporarilyDisabled:", 0);
          }
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.lastSentDate."), v28);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          v114 = v30;
          if (v42)
          {
            v44 = *(void **)(v26 + 3680);
            objc_msgSend(v42, "doubleValue");
            objc_msgSend(v44, "dateWithTimeIntervalSinceReferenceDate:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUIAccessoryStatus setLastSentDate:](v29, "setLastSentDate:", v45);

          }
          else
          {
            -[PowerUIAccessoryStatus setLastSentDate:](v29, "setLastSentDate:", 0);
          }
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.lastSeenDate."), v28);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (!v46)
          {
            -[PowerUIAccessoryStatus setLastSeenDate:](v29, "setLastSeenDate:", 0);
LABEL_36:
            objc_msgSend(v108, "addObject:", v28);
            goto LABEL_37;
          }
          v48 = *(void **)(v26 + 3680);
          objc_msgSend(v46, "doubleValue");
          objc_msgSend(v48, "dateWithTimeIntervalSinceReferenceDate:");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIAccessoryStatus setLastSeenDate:](v29, "setLastSeenDate:", v49);

          objc_msgSend(*(id *)(v26 + 3680), "date");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIAccessoryStatus lastSeenDate](v29, "lastSeenDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "timeIntervalSinceDate:", v51);
          v53 = v52;

          if (v53 > 2592000.0)
            goto LABEL_36;
LABEL_37:
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.lastTimeseriesDate."), v28);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54;
          v56 = *(void **)(v26 + 3680);
          if (v54)
          {
            objc_msgSend(v54, "doubleValue");
            objc_msgSend(v56, "dateWithTimeIntervalSinceReferenceDate:");
          }
          else
          {
            objc_msgSend(*(id *)(v26 + 3680), "distantPast");
          }
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIAccessoryStatus setLastTimeseriesDate:](v29, "setLastTimeseriesDate:", v57);

          v58 = v15;
          objc_msgSend(*(id *)(v15 + 3992), "readNumberForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.lastUnderchargeRecordedForPrediction."), v28);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v59;
          if (v59)
          {
            v61 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v59, "doubleValue");
            objc_msgSend(v61, "dateWithTimeIntervalSinceReferenceDate:");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUIAccessoryStatus setLastUnderchargeRecordedForPrediction:](v29, "setLastUnderchargeRecordedForPrediction:", v62);

          }
          else
          {
            -[PowerUIAccessoryStatus setLastUnderchargeRecordedForPrediction:](v29, "setLastUnderchargeRecordedForPrediction:", 0);
          }
          objc_msgSend(*(id *)(v58 + 3992), "readStringForPreferenceKeyPrefix:andDevice:", CFSTR("com.apple.smartcharging.audioaccessories.expectedHash."), v28);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v63);
          }
          else
          {
            v65 = v2->_accessoryLog;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v134 = v28;
              _os_log_impl(&dword_215A71000, v65, OS_LOG_TYPE_DEFAULT, "No proper value stored for 'expectedHash' for device '%@'", buf, 0xCu);
            }
            v64 = objc_alloc_init(MEMORY[0x24BDD1880]);
          }
          v66 = v64;
          -[PowerUIAccessoryStatus setExpectedHash:](v29, "setExpectedHash:", v64);

          v2 = v110;
          -[NSMutableDictionary setObject:forKey:](v110->_accessoryStates, "setObject:forKey:", v29, v28);

          v15 = v58;
          v26 = 0x24BDBC000;
        }
        v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
      }
      while (v111);
    }

    v67 = v2->_accessoryLog;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = v2->_accessoryStates;
      v69 = v67;
      v70 = -[NSMutableDictionary count](v68, "count");
      v71 = COERCE_DOUBLE(objc_msgSend(v108, "count"));
      *(_DWORD *)buf = 134218240;
      v134 = v70;
      v135 = 2048;
      v136 = v71;
      _os_log_impl(&dword_215A71000, v69, OS_LOG_TYPE_DEFAULT, "AccessoryStates dict with %lu entries was loaded, %lu devices are old", buf, 0x16u);

    }
    -[PowerUIAudioAccessorySmartChargeManager deleteRecordsForDevices:](v2, "deleteRecordsForDevices:", v108);
    v72 = objc_alloc_init(PowerUIMLAudioAccessoryModelPredictor);
    predictor = v2->_predictor;
    v2->_predictor = v72;

    -[PowerUIAudioAccessorySmartChargeManager attachToBluetoothSession](v2, "attachToBluetoothSession");
    v74 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.powerui.audioAccessorySmartChargeManager"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v74;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v76 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSDistributedNotificationCenter *)v76;

    v78 = dispatch_semaphore_create(0);
    btConnectionSemaphore = v2->_btConnectionSemaphore;
    v2->_btConnectionSemaphore = (OS_dispatch_semaphore *)v78;

    +[PowerUIWalletSignalMonitor monitorWithDelegate:](PowerUIWalletSignalMonitor, "monitorWithDelegate:", v2);
    v80 = objc_claimAutoreleasedReturnValue();
    walletMonitor = v2->_walletMonitor;
    v2->_walletMonitor = (PowerUIWalletSignalMonitor *)v80;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("com.apple.smartcharging.audioaccessories.hardcodedTimeDeltaInSeconds"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    v82 = objc_claimAutoreleasedReturnValue();
    hardcodedTimeDelta = v2->_hardcodedTimeDelta;
    v2->_hardcodedTimeDelta = (NSNumber *)v82;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("com.apple.smartcharging.audioaccessories.hardcodedTimeBetweenUpdatesInSeconds"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    v84 = objc_claimAutoreleasedReturnValue();
    hardcodedTimeBetweenUpdates = v2->_hardcodedTimeBetweenUpdates;
    v2->_hardcodedTimeBetweenUpdates = (NSNumber *)v84;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("firstNoteDisplayed"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_firstNotificationDisplayed = objc_msgSend(v86, "BOOLValue");

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("com.apple.smartcharging.audioaccessories.budSideToRecord"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    v87 = objc_claimAutoreleasedReturnValue();
    budSideToRecord = v2->_budSideToRecord;
    v2->_budSideToRecord = (NSNumber *)v87;

    if (!v2->_budSideToRecord)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", arc4random_uniform(2u) + 1);
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = v2->_budSideToRecord;
      v2->_budSideToRecord = (NSNumber *)v89;

      +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v2->_budSideToRecord, CFSTR("com.apple.smartcharging.audioaccessories.budSideToRecord"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    }
    v91 = (void *)*MEMORY[0x24BDAC5A0];
    v92 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_239;
    handler[3] = &unk_24D3FC490;
    v93 = v2;
    v124 = v93;
    xpc_activity_register("com.apple.poweruiagent.audioAccessoriesDailyMetrics", v91, handler);
    v94 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    acceptMessageFromRightBudForDevice = v93->_acceptMessageFromRightBudForDevice;
    v93->_acceptMessageFromRightBudForDevice = v94;

    v96 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    acceptMessageFromLeftBudForDevice = v93->_acceptMessageFromLeftBudForDevice;
    v93->_acceptMessageFromLeftBudForDevice = v96;

    v98 = objc_alloc_init(PowerUIBluetoothHandler);
    btHandler = v93->_btHandler;
    v93->_btHandler = v98;

    *(_DWORD *)buf = 0;
    v100 = v2->_queue;
    v121[0] = v92;
    v121[1] = 3221225472;
    v121[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_243;
    v121[3] = &unk_24D3FB748;
    v101 = v93;
    v122 = v101;
    notify_register_dispatch("com.apple.powerui.audioAccessoryFirstUseNote", (int *)buf, v100, v121);
    out_token = 0;
    v102 = v2->_queue;
    v118[0] = v92;
    v118[1] = 3221225472;
    v118[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_247;
    v118[3] = &unk_24D3FB748;
    v103 = v101;
    v119 = v103;
    notify_register_dispatch("com.apple.powerui.startBTScan", &out_token, v102, v118);
    v117 = 0;
    v104 = v2->_queue;
    v115[0] = v92;
    v115[1] = 3221225472;
    v115[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_255;
    v115[3] = &unk_24D3FB748;
    v116 = v103;
    notify_register_dispatch("com.apple.powerui.stopBTScan", &v117, v104, v115);

  }
  return v2;
}

uint64_t __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:forDevice:", 0, 0, *(_QWORD *)(a1 + 40));
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_239(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  uint8_t v5[16];

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportDailyMetrics");
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Daily metrics checking in!", v5, 2u);
    }
  }
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_243(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint8_t v6[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "First use note was called", v6, 2u);
  }
  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstUseNotificationRequestForDeviceType:", 8206);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "postNotificationWithRequest:", v4);

}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_247(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "startBTScan was called", buf, 2u);
  }
  v3 = objc_alloc_init(MEMORY[0x24BDBB250]);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 152);
  *(_QWORD *)(v4 + 152) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDiscoveryFlags:", 0x20000000);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_249;
  v24[3] = &unk_24D3FC6B8;
  objc_copyWeak(&v25, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDeviceFoundHandler:", v24);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_251;
  v22[3] = &unk_24D3FC6B8;
  objc_copyWeak(&v23, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDeviceLostHandler:", v22);
  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[19];
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_252;
  v20[3] = &unk_24D3FBB48;
  v21 = v7;
  objc_msgSend(v8, "activateWithCompletion:", v20);
  objc_msgSend(MEMORY[0x24BDBB250], "devicesWithDiscoveryFlags:error:", 0x20000000, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v15;
          _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "device array: %@", buf, 0xCu);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
    }
    while (v10);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessoryLog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "accessoryStatusOBCTime");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Device found: %@ - Reported time interval: %@", (uint8_t *)&v9, 0x16u);

  }
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_251(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessoryLog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "stableIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Device lost: %@", (uint8_t *)&v7, 0xCu);

  }
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_252(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_255(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "stopBTScan was called", v4, 2u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "invalidate");
}

- (id)returnAccessoryStatusForDevice:(id)a3
{
  id v4;
  PowerUIAccessoryStatus *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *accessoryLog;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_accessoryStates, "objectForKey:", v4);
    v5 = (PowerUIAccessoryStatus *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(PowerUIAccessoryStatus);
      -[NSMutableDictionary setObject:forKey:](self->_accessoryStates, "setObject:forKey:", v5, v4);
      v6 = -[PowerUIAccessoryStatus currentState](v5, "currentState");
      v7 = -[PowerUIAccessoryStatus enabled](v5, "enabled");
      -[PowerUIAccessoryStatus disabledUntilDate](v5, "disabledUntilDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v4, v6, v7, v8, -[PowerUIAccessoryStatus temporarilyDisabled](v5, "temporarilyDisabled"));

      -[NSLock lock](self->_deviceArrayLock, "lock");
      -[NSMutableArray addObject:](self->_deviceArray, "addObject:", v4);
      +[PowerUIAudioAccessorySmartChargeManager setArray:forPreferenceKey:](PowerUIAudioAccessorySmartChargeManager, "setArray:forPreferenceKey:", self->_deviceArray, CFSTR("com.apple.smartcharging.audioaccessories.deviceArray"));
      accessoryLog = self->_accessoryLog;
      if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Add new device '%@' to deviceArray", (uint8_t *)&v11, 0xCu);
      }
      -[NSLock unlock](self->_deviceArrayLock, "unlock");
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
      -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:].cold.1();
    v5 = objc_alloc_init(PowerUIAccessoryStatus);
  }

  return v5;
}

- (void)attachToBluetoothSession
{
  BTSessionAttachWithQueue();
}

- (void)addTimeSeriesDataToStream:(timeSeriesData *)a3 withSide:(unsigned __int8)a4 withFirmwareVersion:(unsigned __int16)a5 withLog:(id)a6
{
  int v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  timeSeriesData *v21;
  unsigned __int8 *p_var1;
  unint64_t v23;
  timeSeriesData *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  int v28;
  int v29;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[4];
  NSObject *v53;
  _QWORD v54[4];
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  _BYTE v61[14];
  uint64_t v62;

  v48 = a5;
  v6 = a4;
  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Charging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "AccessoryChargingSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithOptions:", v50);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke;
  v54[3] = &__block_descriptor_33_e22_B16__0__BMStoreEvent_8l;
  v55 = v6;
  objc_msgSend(v13, "filterWithIsIncluded:", v54);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v14;
  v52[1] = 3221225472;
  v52[2] = __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2;
  v52[3] = &unk_24D3FB6F8;
  v16 = v8;
  v53 = v16;
  v51[0] = v14;
  v51[1] = 3221225472;
  v51[2] = __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_274;
  v51[3] = &unk_24D3FBE98;
  v51[4] = &v56;
  v17 = (id)objc_msgSend(v15, "sinkWithCompletion:shouldContinue:", v52, v51);

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = v57[3];
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v61 = v18;
    *(_WORD *)&v61[8] = 1024;
    *(_DWORD *)&v61[10] = v6;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_INFO, "Previous end date set to %llu from previous record for bud side: %hhu.", buf, 0x12u);
  }
  v49 = 0;
  v19 = 0;
  v20 = v6 == 2;
  if (v6 == 1)
    v20 = 2;
  v47 = v20;
  while (1)
  {
    v21 = &a3[v19];
    p_var1 = &v21->var1;
    if (!v21->var1)
      break;
    if (v21->var2 && (v23 = v19 + 1, v24 = &a3[v19 + 1], v24->var2))
    {
      if (v21->var1 == 1)
      {
        if (a3[v23].var1 == 2)
        {
          if (v24->var0 >= v21->var0)
          {
            if (v57[3] > v21->var0)
            {
              v31 = v16;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)v57[3]);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v61 = v19;
                *(_WORD *)&v61[4] = 2112;
                *(_QWORD *)&v61[6] = v32;
                _os_log_impl(&dword_215A71000, v31, OS_LOG_TYPE_INFO, "Skipping event at i == %d because startDate is earlier than previous end date (%@)", buf, 0x12u);

              }
              goto LABEL_23;
            }
            if (v24->var0 - v21->var0 < 0x278D01)
            {
              v33 = objc_alloc(MEMORY[0x24BE0C300]);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v48);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21->var0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v24->var0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)objc_msgSend(v33, "initWithProductID:firmwareVersion:startTimestamp:endTimestamp:side:", &unk_24D4438A0, v34, v35, v36, v47);

              BiomeLibrary();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "Device");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "Charging");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "AccessoryChargingSession");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "source");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "sendEvent:", v37);

              ++v49;
              v19 = v23;
              goto LABEL_23;
            }
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v61 = v19;
              v25 = v16;
              v26 = "Skipping event at i == %d because charge duration was longer than 30 days";
LABEL_16:
              v27 = 8;
LABEL_22:
              _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_INFO, v26, buf, v27);
            }
          }
          else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v61 = v19;
            v25 = v16;
            v26 = "Skipping event at i == %d because startDate is later than endDate";
            goto LABEL_16;
          }
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v29 = *p_var1;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v61 = v19;
          *(_WORD *)&v61[4] = 1024;
          *(_DWORD *)&v61[6] = v29;
          v25 = v16;
          v26 = "Skipping event at i == %d because event data at i+1 is %hhu (!= 2).";
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v28 = *p_var1;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v61 = v19;
        *(_WORD *)&v61[4] = 1024;
        *(_DWORD *)&v61[6] = v28;
        v25 = v16;
        v26 = "Skipping event at i == %d because event data is %hhu (!= 1).";
LABEL_21:
        v27 = 14;
        goto LABEL_22;
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v61 = v19;
      v25 = v16;
      v26 = "Skipping event at i == %d because 'offset' is FALSE for i or i+1.";
      goto LABEL_16;
    }
LABEL_23:
    if (v19++ >= 0x60)
      goto LABEL_36;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v61 = v19;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_INFO, "Reached end of records at i == %d", buf, 8u);
  }
LABEL_36:
  v43 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v49 < 1)
  {
    if (v43)
    {
      *(_WORD *)buf = 0;
      v44 = "No valid charging time series events found for accessory.";
      v45 = v16;
      v46 = 2;
LABEL_41:
      _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_INFO, v44, buf, v46);
    }
  }
  else if (v43)
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v61 = v49;
    v44 = "Saved %d charging time series events to stream.";
    v45 = v16;
    v46 = 8;
    goto LABEL_41;
  }

  _Block_object_dispose(&v56, 8);
}

uint64_t __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "side") == 1)
  {
    v5 = *(unsigned __int8 *)(a1 + 32);

    if (v5 == 2)
    {
      v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "side") == 2)
  {
    v6 = *(unsigned __int8 *)(a1 + 32);

    if ((_DWORD)v6 == 1)
      goto LABEL_10;
  }
  else
  {

  }
  v6 = 0;
LABEL_10:

  return v6;
}

void __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2_cold_1(v4, v3);
  }

}

uint64_t __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_274(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endTimestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)v4;

  return 0;
}

- (void)recordBudMetricsLocallyForDevice:(id)a3 withTimeSpendAtLowerSoC:(unsigned __int16)a4 timeSpentAtHigherSoC:(unsigned __int16)a5 engagementEventsSinceLastReport:(unsigned __int8)a6 underchargeEventsSinceLastReport:(unsigned __int8)a7 chargingEventsSinceLastReport:(unsigned __int8)a8 budSocAtLastEngagement:(unsigned __int8)a9 successRatio:(unsigned __int16)a10
{
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  id v49;

  v47 = a7;
  v48 = a8;
  v45 = a5;
  v46 = a6;
  v44 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.budMetrics"), a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCED8];
  v49 = (id)v10;
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 4;
  do
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.timeSpentAtLowerSoC"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.timeSpentAtLowerSoC"), (v14 + 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v17);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.timeSpentAtHigherSoC"), v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.timeSpentAtHigherSoC"), (v14 + 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.engagementEventsSinceLastReport"), v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.engagementEventsSinceLastReport"), (v14 + 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v23);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.underchargeEventsSinceLastReport"), v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.underchargeEventsSinceLastReport"), (v14 + 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v26);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.chargingEventsSinceLastReport"), v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.chargingEventsSinceLastReport"), (v14 + 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, v29);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.budSocAtLastEngagement"), v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.budSocAtLastEngagement"), (v14 + 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, v32);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.successRatio"), v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.successRatio"), (v14 + 1));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, v35);

    v36 = (_DWORD)v14 != 0;
    v14 = (v14 - 1);
  }
  while ((_DWORD)v14 != 0 && v36);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, CFSTR("1.timeSpentAtLowerSoC"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v45);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v38, CFSTR("1.timeSpentAtHigherSoC"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v46);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v39, CFSTR("1.engagementEventsSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("1.underchargeEventsSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, CFSTR("1.chargingEventsSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, CFSTR("1.budSocAtLastEngagement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v43, CFSTR("1.successRatio"));

  +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v13, v49, CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
}

- (void)reportSessionMetricsForSide:(unsigned __int8)a3 withTimeSpendAtLowerSoC:(unsigned __int16)a4 timeSpentAtHigherSoC:(unsigned __int16)a5 engagementEventsSinceLastReport:(unsigned __int8)a6 underchargeEventsSinceLastReport:(unsigned __int8)a7 chargingEventsSinceLastReport:(unsigned __int8)a8 budSocAtLastEngagement:(unsigned __int8)a9 successRatio:(unsigned __int16)a10 deviceType:(id)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  id v19;
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
  NSObject *accessoryLog;
  id v32;
  NSObject *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v11 = a8;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v18 = (void *)MEMORY[0x24BDBCED8];
  v19 = a11;
  objc_msgSend(v18, "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("BudSide"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("TimeSpentAtLowerSoC"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("TimeSpentAtHigherSoC"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("EngagementEventsSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (_DWORD)v13 != 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("AtLeastOneEngagementEventSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("UnderchargeEventsSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (_DWORD)v12 != 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("AtLeastOneUnderchargeEventSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("ChargingEventsSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("BudSocAtLastEngagement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, CFSTR("SuccessRatio"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("AudioAccessoryType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v20;
      _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "In mocking mode, do not report session analytics: %@", buf, 0xCu);
    }
  }
  else
  {
    v32 = v20;
    AnalyticsSendEventLazy();
    v33 = self->_accessoryLog;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v32;
      _os_log_impl(&dword_215A71000, v33, OS_LOG_TYPE_DEFAULT, "Reported session metrics to CoreAnalytics %@", buf, 0xCu);
    }

  }
}

id __258__PowerUIAudioAccessorySmartChargeManager_reportSessionMetricsForSide_withTimeSpendAtLowerSoC_timeSpentAtHigherSoC_engagementEventsSinceLastReport_underchargeEventsSinceLastReport_chargingEventsSinceLastReport_budSocAtLastEngagement_successRatio_deviceType___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)runUpdateForDevice:(BTDeviceImpl *)a3 withHash:(id)a4
{
  return -[PowerUIAudioAccessorySmartChargeManager runUpdateForDevice:withHash:asInitialUpdate:](self, "runUpdateForDevice:withHash:asInitialUpdate:", a3, a4, 0);
}

- (BOOL)runUpdateForDevice:(BTDeviceImpl *)a3 withHash:(id)a4 asInitialUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSNumber *hardcodedTimeDelta;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *accessoryLog;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  char v79;
  NSObject *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  NSNumber *hardcodedTimeBetweenUpdates;
  dispatch_time_t v89;
  id v90;
  NSObject *queue;
  id v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  double v97;
  double v98;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD block[5];
  id v110;
  BTDeviceImpl *v111;
  uint8_t buf[4];
  double v113;
  __int16 v114;
  id v115;
  uint64_t v116;

  v5 = a5;
  v116 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a3)
  {
    v9 = (void *)os_transaction_create();
    hardcodedTimeDelta = self->_hardcodedTimeDelta;
    -[PowerUIBluetoothHandler getAddressStringForDevice:](self->_btHandler, "getAddressStringForDevice:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8)
    {
      objc_msgSend(v12, "expectedHash");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 != v8)
      {
        accessoryLog = self->_accessoryLog;
        LOBYTE(a3) = 0;
        if (!os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
        {
LABEL_37:

          goto LABEL_38;
        }
        *(_DWORD *)buf = 138412290;
        v113 = *(double *)&v8;
        _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "runUpdate hash '%@' does not match, this message must be old.", buf, 0xCu);
LABEL_16:
        LOBYTE(a3) = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v17 = self->_accessoryLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "runUpdate called without hash, proceed.", buf, 2u);
      }
    }
    if (!-[PowerUIBluetoothHandler isDeviceConnected:forSession:](self->_btHandler, "isDeviceConnected:forSession:", a3, self->_session))
    {
      v22 = self->_accessoryLog;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = *(double *)&v11;
        _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Device with address '%@' is not connected to AACP, do not run OBC update.", buf, 0xCu);
      }
      objc_msgSend(v13, "setManagerState:", 4);
      goto LABEL_16;
    }
    v108 = v9;
    -[PowerUIWalletSignalMonitor requiredFullChargeDate](self->_walletMonitor, "requiredFullChargeDate");
    v18 = objc_claimAutoreleasedReturnValue();
    v107 = (void *)v18;
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToDate:", v20);

    }
    else
    {
      v21 = 0;
    }
    -[PowerUIAudioAccessorySmartChargeManager btHandler](self, "btHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "protocolForDevice:", a3);

    if (v24 == 3)
    {
      if (v21)
      {
        v25 = self->_accessoryLog;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "A boarding pass was found within 24 hours, temporarily disable OBC via v2 protocol", buf, 2u);
        }
        LOBYTE(a3) = -[PowerUIAudioAccessorySmartChargeManager setStateViaV2Protocol:forDevice:](self, "setStateViaV2Protocol:forDevice:", 3, a3);
      }
      else
      {
        LOBYTE(a3) = 1;
      }
      goto LABEL_36;
    }
    if (objc_msgSend(v13, "temporarilyDisabled"))
    {
      v26 = self->_accessoryLog;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = *(double *)&v11;
        v27 = "Device with address '%@' has OBC temporarily disabled, do not run OBC update.";
LABEL_34:
        _os_log_impl(&dword_215A71000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    if ((objc_msgSend(v13, "enabled") & 1) == 0)
    {
      v26 = self->_accessoryLog;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = *(double *)&v11;
        v27 = "Device with address '%@' has OBC disabled, do not run OBC update.";
        goto LABEL_34;
      }
LABEL_35:
      objc_msgSend(v13, "setManagerState:", 2);
      LOBYTE(a3) = 0;
LABEL_36:
      v9 = v108;

      goto LABEL_37;
    }
    if (v21)
    {
      v28 = self->_accessoryLog;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v28, OS_LOG_TYPE_DEFAULT, "A boarding pass was found within 24 hours, temporarily disable OBC", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIAudioAccessorySmartChargeManager defaultDateToDisableUntilGivenDate:](self, "defaultDateToDisableUntilGivenDate:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a3) = 1;
      -[PowerUIAudioAccessorySmartChargeManager setTemporarilyDisabled:until:forDevice:](self, "setTemporarilyDisabled:until:forDevice:", 1, v30, v11);

      objc_msgSend(v13, "setManagerState:", 5);
      goto LABEL_36;
    }
    objc_msgSend(v13, "lastSentDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self->_accessoryLog;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v113 = *(double *)&v11;
      v114 = 2112;
      v115 = v8;
      _os_log_impl(&dword_215A71000, v33, OS_LOG_TYPE_DEFAULT, "runUpdate called for device '%@', hash: %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v34 = objc_claimAutoreleasedReturnValue();
    v106 = (void *)v34;
    if (v5)
    {
      v35 = self->_accessoryLog;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v35, OS_LOG_TYPE_DEFAULT, "This is the initial update, re-send last prediction.", buf, 2u);
      }
      v36 = v32;
      objc_msgSend(v32, "timeIntervalSinceDate:", v34);
      v38 = v37;
      v39 = _os_feature_enabled_impl();
      v40 = 0;
      if (v39 && v38 > 0.0)
        v40 = -[PowerUIAudioAccessorySmartChargeManager sendTimeDeltaInSeconds:toAccessory:](self, "sendTimeDeltaInSeconds:toAccessory:", v38, a3);
      v105 = v40;
      objc_msgSend(v13, "setManagerState:", 1);
      v41 = 60;
LABEL_85:
      v89 = dispatch_walltime(0, 1000000000 * v41);
      v90 = objc_alloc_init(MEMORY[0x24BDD1880]);
      -[PowerUIAudioAccessorySmartChargeManager persistentlySetExpectedHash:forDevice:](self, "persistentlySetExpectedHash:forDevice:", v90, v11);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __87__PowerUIAudioAccessorySmartChargeManager_runUpdateForDevice_withHash_asInitialUpdate___block_invoke;
      block[3] = &unk_24D3FC728;
      block[4] = self;
      v111 = a3;
      v92 = v90;
      v110 = v92;
      dispatch_after(v89, queue, block);
      v93 = self->_accessoryLog;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        v94 = (void *)MEMORY[0x24BDD16E0];
        v95 = v93;
        objc_msgSend(v94, "numberWithDouble:", (double)v41 / 60.0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v113 = *(double *)&v96;
        _os_log_impl(&dword_215A71000, v95, OS_LOG_TYPE_DEFAULT, "Next update queued in %@ minutes", buf, 0xCu);

      }
      LOBYTE(a3) = v105 == 0;

      goto LABEL_36;
    }
    -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:](self->_predictor, "chargingDecisionForDate:forAudioAccessory:", v34, v11);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "state") != 1 || hardcodedTimeDelta)
    {
      if (objc_msgSend(v104, "state") != 2 || hardcodedTimeDelta)
      {
        if (objc_msgSend(v104, "state") != 3 || hardcodedTimeDelta)
        {
          if (!objc_msgSend(v104, "state") || hardcodedTimeDelta)
          {
            objc_msgSend(v104, "smartChargeDuration");
            if (hardcodedTimeDelta)
            {
              v98 = (double)-[NSNumber integerValue](self->_hardcodedTimeDelta, "integerValue");
              v99 = self->_accessoryLog;
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v113 = v98;
                _os_log_impl(&dword_215A71000, v99, OS_LOG_TYPE_DEFAULT, "Applied manual override for prediction, it is now: %f", buf, 0xCu);
              }
            }
            else
            {
              v98 = v97 * 60.0;
            }
            if (_os_feature_enabled_impl())
            {
              v105 = -[PowerUIAudioAccessorySmartChargeManager sendTimeDeltaInSeconds:toAccessory:](self, "sendTimeDeltaInSeconds:toAccessory:", v98, a3);
            }
            else
            {
              v100 = self->_accessoryLog;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_215A71000, v100, OS_LOG_TYPE_DEFAULT, "FeatureFlag not enabled or device type not supported, do not send message.", buf, 2u);
              }
              v105 = 0;
            }
            objc_msgSend(v13, "setManagerState:", 6);
            goto LABEL_65;
          }
          if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
            -[PowerUIAudioAccessorySmartChargeManager runUpdateForDevice:withHash:asInitialUpdate:].cold.1();
LABEL_64:
          v105 = 0;
LABEL_65:
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIAudioAccessorySmartChargeManager btHandler](self, "btHandler");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIAudioAccessorySmartChargeManager nameForProductID:](self, "nameForProductID:", objc_msgSend(v48, "productIDForDevice:", a3));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, CFSTR("AudioAccessoryType"));

          v50 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v104, "engagementConfidence");
          objc_msgSend(v50, "numberWithDouble:");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v51, CFSTR("EngagementModelPrediction"));

          v52 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v104, "engagementConfidence");
          objc_msgSend(v52, "numberWithInt:", (5 * ((int)(v53 * 100.0) / 5)));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:");
          v54 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v104, "smartChargeDuration");
          objc_msgSend(v54, "numberWithDouble:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v55, CFSTR("DurationModelPrediction"));

          v56 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v104, "smartChargeDuration");
          v58 = 30 * (int)(v57 / 30.0);
          if (v58 < 0)
            v59 = 0xFFFFFFFFLL;
          else
            v59 = v58;
          objc_msgSend(v56, "numberWithInt:", v59);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:");
          objc_msgSend(v104, "modelVersion");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v60, CFSTR("ModelVersion"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v104, "state"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v61, CFSTR("PredictionContainerState"));

          objc_msgSend(v13, "lastSeenDate");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "timeIntervalSinceDate:", v32);
          v64 = v63;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v65, CFSTR("PredictionRealityDelta"));

          v66 = v64 / 3600.0;
          if (v64 / 3600.0 > 48.0)
            v66 = 48.0;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v66);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:");
          objc_msgSend(v32, "timeIntervalSinceDate:", v106);
          v68 = v67;
          -[NSMutableDictionary objectForKey:](self->_latestAnalyticsForDevice, "objectForKey:", v11);
          v69 = objc_claimAutoreleasedReturnValue();
          v36 = v32;
          if (!v69)
            goto LABEL_104;
          v70 = (void *)v69;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_latestAnalyticsForDevice, "objectForKeyedSubscript:", v11);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectForKey:", CFSTR("UnderchargeHappened"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_latestAnalyticsForDevice, "objectForKeyedSubscript:", v11);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectForKey:", CFSTR("UnderchargeHappened"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setObject:forKeyedSubscript:", v74, CFSTR("UnderchargeHappened"));

            v75 = self->_accessoryLog;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              v76 = v75;
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("UnderchargeHappened"));
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v113 = *(double *)&v77;
              _os_log_impl(&dword_215A71000, v76, OS_LOG_TYPE_DEFAULT, "Undercharge decision already made, it was: %@", buf, 0xCu);

            }
          }
          else
          {
LABEL_104:
            if (v68 <= 0.0
              || (objc_msgSend(v13, "lastUnderchargeRecordedForPrediction"),
                  v78 = (void *)objc_claimAutoreleasedReturnValue(),
                  v79 = objc_msgSend(v36, "isEqualToDate:", v78),
                  v78,
                  (v79 & 1) != 0))
            {
              v80 = self->_accessoryLog;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                v81 = (void *)MEMORY[0x24BDD16E0];
                v82 = v80;
                objc_msgSend(v81, "numberWithDouble:", v68);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v113 = *(double *)&v83;
                v114 = 2112;
                v115 = v36;
                _os_log_impl(&dword_215A71000, v82, OS_LOG_TYPE_DEFAULT, "Not an undercharge, either last prediciton delta  %@ < 0 or already recorded for last prediction %@", buf, 0x16u);

              }
              objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("UnderchargeHappened"));
            }
            else
            {
              v84 = self->_accessoryLog;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                v85 = (void *)MEMORY[0x24BDD16E0];
                v86 = v84;
                objc_msgSend(v85, "numberWithDouble:", v68);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v113 = *(double *)&v87;
                v114 = 2112;
                v115 = v36;
                _os_log_impl(&dword_215A71000, v86, OS_LOG_TYPE_DEFAULT, "New undercharge, last prediciton delta %@ > 0 and not already recorded for last prediction %@", buf, 0x16u);

              }
              objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("UnderchargeHappened"));
              -[PowerUIAudioAccessorySmartChargeManager persistentlySetLastUnderchargeRecordedForPrediction:forDevice:](self, "persistentlySetLastUnderchargeRecordedForPrediction:forDevice:", v36, v11);
            }
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_latestAnalyticsForDevice, "setObject:forKeyedSubscript:", v47, v11);

          hardcodedTimeBetweenUpdates = self->_hardcodedTimeBetweenUpdates;
          if (hardcodedTimeBetweenUpdates)
            v41 = -[NSNumber integerValue](hardcodedTimeBetweenUpdates, "integerValue");
          else
            v41 = 3600;
          goto LABEL_85;
        }
        v46 = self->_accessoryLog;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v46, OS_LOG_TYPE_DEFAULT, "Model prediction timeDelta is below zero, do not send timeDelta.", buf, 2u);
        }
        v43 = v13;
        v44 = 11;
      }
      else
      {
        v45 = self->_accessoryLog;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Model did not engage, do not send a timeDelta.", buf, 2u);
        }
        v43 = v13;
        v44 = 3;
      }
    }
    else
    {
      v42 = self->_accessoryLog;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v42, OS_LOG_TYPE_DEFAULT, "Not enough data, do not send a timeDelta.", buf, 2u);
      }
      v43 = v13;
      v44 = 10;
    }
    objc_msgSend(v43, "setManagerState:", v44);
    -[PowerUIAudioAccessorySmartChargeManager setOBCState:forDevice:](self, "setOBCState:forDevice:", 0, v11);
    goto LABEL_64;
  }
  v16 = self->_accessoryLog;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "runUpdate called for nil device.", buf, 2u);
    LOBYTE(a3) = 0;
  }
LABEL_38:

  return (char)a3;
}

uint64_t __87__PowerUIAudioAccessorySmartChargeManager_runUpdateForDevice_withHash_asInitialUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runUpdateForDevice:withHash:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)nameForProductID:(unsigned int)a3
{
  id result;

  result = CFSTR("B768E");
  switch(a3)
  {
    case 0x200Eu:
      result = CFSTR("B298");
      break;
    case 0x200Fu:
      result = CFSTR("B288");
      break;
    case 0x2010u:
    case 0x2011u:
    case 0x2012u:
    case 0x2015u:
    case 0x2016u:
    case 0x2017u:
    case 0x2018u:
    case 0x201Au:
    case 0x201Cu:
    case 0x201Du:
    case 0x201Fu:
      goto LABEL_6;
    case 0x2013u:
      result = CFSTR("B688");
      break;
    case 0x2014u:
      result = CFSTR("B698");
      break;
    case 0x2019u:
      return result;
    case 0x201Bu:
      result = CFSTR("B768M");
      break;
    case 0x201Eu:
      result = CFSTR("B768CHE");
      break;
    case 0x2020u:
      result = CFSTR("B768CHM");
      break;
    default:
      if (a3 == 8194)
      {
        result = CFSTR("B188");
      }
      else if (a3 == 8228)
      {
        result = CFSTR("B698c");
      }
      else
      {
LABEL_6:
        if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
          -[PowerUIAudioAccessorySmartChargeManager nameForProductID:].cold.1();
        result = CFSTR("Unknown");
      }
      break;
  }
  return result;
}

- (unint64_t)sendTimeDeltaInSeconds:(unsigned int)a3 toAccessory:(BTDeviceImpl *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *accessoryLog;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  BTAccessoryManagerGetDefault();
  -[PowerUIBluetoothHandler getAddressStringForDevice:](self->_btHandler, "getAddressStringForDevice:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v27 = 0;
  -[PowerUIAudioAccessorySmartChargeManager btHandler](self, "btHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  prepare9ByteMessage(&v27, 1000 * v5, objc_msgSend(v8, "protocolForDevice:", a4));

  v9 = -[PowerUIBluetoothHandler sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:](self->_btHandler, "sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:", 0, 0x20000, a4, &v27, 9);
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = accessoryLog;
    objc_msgSend(v11, "numberWithUnsignedInt:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5 / 0xE10uLL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "... custom message sent - timeDelta: %@ seconds (%@ hours) - Error code: %@", buf, 0x20u);

  }
  if (!(_DWORD)v9)
  {
    v16 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateWithTimeInterval:sinceDate:", v17, (double)v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PowerUIAudioAccessorySmartChargeManager persistentlySetLastSentDate:forDevice:](self, "persistentlySetLastSentDate:forDevice:", v18, v7);
    v19 = self->_accessoryLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "Update AccessoryStatus with last sent date: %@", buf, 0xCu);
    }
    -[NSDistributedNotificationCenter postNotificationName:object:](self->_notificationCenter, "postNotificationName:object:", CFSTR("com.apple.powerui.audioaccessorysmartchargedeadlinechanged"), v7);

  }
  return v9;
}

- (void)reportDailyMetrics
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *accessoryLog;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    -[NSLock lock](self->_deviceArrayLock, "lock");
    if (-[NSMutableArray count](self->_deviceArray, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v3 = self->_deviceArray;
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v4)
      {
        v5 = v4;
        LODWORD(v6) = 0;
        LODWORD(v7) = 0;
        LODWORD(v8) = 0;
        v9 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v3);
            -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "enabled");
            v7 = v7 + (v12 ^ 1);
            v8 = (v8 + v12);
            v6 = v6 + objc_msgSend(v11, "temporarilyDisabled");

          }
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v5);
      }
      else
      {
        v6 = 0;
        v7 = 0;
        v8 = 0;
      }

      -[NSLock unlock](self->_deviceArrayLock, "unlock");
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("NumberOfEnabledDevices"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("NumberOfDisabledDevices"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("NumberOfTemporarilyDisabledDevices"));

      v17 = v13;
      AnalyticsSendEventLazy();
      accessoryLog = self->_accessoryLog;
      if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v17;
        _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Reported daily metrics to CoreAnalytics %@", buf, 0xCu);
      }

    }
    else
    {
      -[NSLock unlock](self->_deviceArrayLock, "unlock");
    }
  }
}

id __61__PowerUIAudioAccessorySmartChargeManager_reportDailyMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)firstUseNotificationRequestForDeviceType:(unsigned int)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OBC_FEATURE_ENABLED_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v9);

  objc_msgSend(v8, "setNumberStyle:", 3);
  objc_msgSend(v8, "setMaximumFractionDigits:", 0);
  objc_msgSend(v8, "setMultiplier:", &unk_24D443870);
  objc_msgSend(v8, "stringFromNumber:", &unk_24D4438B8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 8206 <= 0x16 && ((1 << (a3 - 14)) & 0x400041) != 0)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("Localizable");
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("Localizable-B688");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUDIOACCESSORY_OBC_FIRST_USE_BODY"), &stru_24D3FD658, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v14);

  objc_msgSend(v4, "setCategoryIdentifier:", CFSTR("firstTimeCategory"));
  objc_msgSend(v4, "setShouldHideDate:", 1);
  objc_msgSend(v4, "setShouldHideTime:", 1);
  objc_msgSend(v4, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:", v15);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 21600.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpirationDate:", v16);

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("audioAccessoryFirstUseNotification"), v4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDestinations:", 6);

  return v17;
}

- (void)client:(id)a3 connectAndDisableOBCforDevice:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessoryLog;
  BTDeviceImpl *v12;
  BTDeviceImpl *v13;
  OS_dispatch_semaphore *v14;
  OS_dispatch_semaphore *btConnectionSemaphore;
  int v16;
  NSObject *v17;
  dispatch_time_t v18;
  intptr_t v19;
  intptr_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v9;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Request connectAndDisableOBCforDevice for address: %@", (uint8_t *)&v27, 0xCu);
  }
  v12 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v9, self->_session);
  if (!v12)
  {
    v22 = self->_accessoryLog;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "No device for connectAndDisableOBCforDevice.", (uint8_t *)&v27, 2u);
    }
    goto LABEL_12;
  }
  v13 = v12;
  if (!-[PowerUIBluetoothHandler isDeviceConnected:forSession:](self->_btHandler, "isDeviceConnected:forSession:", v12, self->_session))
  {
    v14 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    btConnectionSemaphore = self->_btConnectionSemaphore;
    self->_btConnectionSemaphore = v14;

    v16 = -[PowerUIBluetoothHandler deviceConnectWrapper:](self->_btHandler, "deviceConnectWrapper:", v13);
    v17 = self->_btConnectionSemaphore;
    v18 = dispatch_time(0, 15000000000);
    v19 = dispatch_semaphore_wait(v17, v18);
    v20 = v19;
    if (v16 || v19)
    {
      v23 = self->_accessoryLog;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = v23;
        objc_msgSend(v24, "numberWithLong:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v9;
        v29 = 2112;
        v30 = v26;
        _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Connecting device '%@' was not successful. timeout = %@", (uint8_t *)&v27, 0x16u);

      }
LABEL_12:
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      goto LABEL_13;
    }
  }
  -[PowerUIAudioAccessorySmartChargeManager client:setState:forDevice:withHandler:](self, "client:setState:forDevice:withHandler:", v8, 3, v9, v10);
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setManagerState:", 8);

LABEL_13:
}

- (void)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  NSObject *accessoryLog;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v6)
  {
    -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = accessoryLog;
      objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v8, "currentState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Returning current state: %@", (uint8_t *)&v13, 0xCu);

    }
    v7[2](v7, objc_msgSend(v8, "currentState"), 0);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
      -[PowerUIAudioAccessorySmartChargeManager isSmartChargingCurrentlyEnabledForDevice:withHandler:].cold.1();
    v7[2](v7, 0, 0);
  }

}

- (BOOL)setOBCState:(BOOL)a3 forDevice:(id)a4
{
  _BOOL4 v4;
  id v6;
  BTDeviceImpl *v7;
  BOOL v8;
  NSObject *accessoryLog;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_session)
  {
    v7 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v6);
    BTAccessoryManagerGetDefault();
    v8 = -[PowerUIBluetoothHandler isDeviceConnected:forSession:](self->_btHandler, "isDeviceConnected:forSession:", v7, self->_session);
    accessoryLog = self->_accessoryLog;
    v10 = os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v4)
      {
        if (v10)
        {
          v11 = (void *)MEMORY[0x24BDD16E0];
          v12 = accessoryLog;
          objc_msgSend(v11, "numberWithBool:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v31 = v13;
          v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Sending enabling state '%@' to device with address '%@'.", buf, 0x16u);

        }
        -[PowerUIAudioAccessorySmartChargeManager runUpdateForDevice:withHash:](self, "runUpdateForDevice:withHash:", v7, 0);
LABEL_18:
        v15 = 1;
        goto LABEL_19;
      }
      if (v10)
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = accessoryLog;
        objc_msgSend(v18, "numberWithBool:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        v32 = 2112;
        v33 = v6;
        _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "Sending disabling state '%@' to device with address '%@'.", buf, 0x16u);

      }
      v29 = 0;
      v28 = 0;
      -[PowerUIAudioAccessorySmartChargeManager btHandler](self, "btHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      prepare9ByteMessage(&v28, 0, objc_msgSend(v21, "protocolForDevice:", v7));

      v22 = -[PowerUIBluetoothHandler sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:](self->_btHandler, "sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:", 0, 0x20000, v7, &v28, 9);
      v23 = self->_accessoryLog;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = v23;
        objc_msgSend(v24, "numberWithUnsignedLong:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v6;
        v32 = 2112;
        v33 = v26;
        _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Message sent to disable OBC for device '%@' - Error code: %@", buf, 0x16u);

      }
      if (!v22)
        goto LABEL_18;
      goto LABEL_17;
    }
    if (!v10)
    {
LABEL_17:
      v15 = 0;
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    v16 = "Device with address '%@' is not connected to AACP, do not try to set OBC state.";
    v17 = accessoryLog;
LABEL_11:
    _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_17;
  }
  v14 = self->_accessoryLog;
  v15 = 0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    v16 = "Bluetooth session has not been intialized, device with address '%@' is not connected, do not try to set OBC state.";
    v17 = v14;
    goto LABEL_11;
  }
LABEL_19:

  return v15;
}

- (void)client:(id)a3 setState:(unint64_t)a4 forDevice:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  BTDeviceImpl *v13;
  BTDeviceImpl *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  NSObject *accessoryLog;
  void *v26;
  uint64_t v27;
  PowerUIAudioAccessorySmartChargeManager *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  PowerUIAudioAccessorySmartChargeManager *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v13 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v11, self->_session);
  if (!v13)
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 138412546;
      v41 = v10;
      v42 = 2048;
      v43 = a4;
      _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "No device for client '%@' setState '%lu' request.", (uint8_t *)&v40, 0x16u);
    }
LABEL_12:
    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = 1;
LABEL_28:
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), v27, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v35);

    goto LABEL_36;
  }
  v14 = v13;
  v15 = -[PowerUIBluetoothHandler protocolForDevice:](self->_btHandler, "protocolForDevice:", v13);
  v16 = self->_accessoryLog;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    -[PowerUIAudioAccessorySmartChargeManager stringFromState:](self, "stringFromState:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138412802;
    v41 = v10;
    v42 = 2112;
    v43 = (unint64_t)v18;
    v44 = 1024;
    v45 = v15;
    _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "%@ requests state %@. Using protocol: %hhu", (uint8_t *)&v40, 0x1Cu);

  }
  if ((v15 - 1) > 1)
  {
    if (v15)
    {
      if (v15 == 3)
      {
        switch(a4)
        {
          case 0uLL:
            -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v11, 0, 0, 0, 0);
            v28 = self;
            v29 = 0;
            goto LABEL_39;
          case 3uLL:
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 86400.0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUIAudioAccessorySmartChargeManager setTemporarilyDisabled:until:forDevice:](self, "setTemporarilyDisabled:until:forDevice:", 1, v39, v11);

            v28 = self;
            v29 = 3;
            goto LABEL_39;
          case 1uLL:
            -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v11, 1, 1, 0, 0);
            v28 = self;
            v29 = 1;
LABEL_39:
            ((void (**)(id, BOOL, void *))v12)[2](v12, -[PowerUIAudioAccessorySmartChargeManager setStateViaV2Protocol:forDevice:](v28, "setStateViaV2Protocol:forDevice:", v29, v14), 0);
            goto LABEL_36;
        }
        goto LABEL_12;
      }
      v34 = self->_accessoryLog;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v40 = 67109120;
        LODWORD(v41) = v15;
        _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "protocol %hhu is unsupported, do nothing", (uint8_t *)&v40, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
    {
      -[PowerUIAudioAccessorySmartChargeManager client:setState:forDevice:withHandler:].cold.1();
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = 4;
    goto LABEL_28;
  }
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "currentState");
  v21 = self->_accessoryLog;
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20 == a4)
  {
    if (v22)
    {
      v23 = v21;
      -[PowerUIAudioAccessorySmartChargeManager stringFromState:](self, "stringFromState:", a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138412546;
      v41 = v10;
      v42 = 2112;
      v43 = (unint64_t)v24;
      _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "%@ requests state %@, but this is already the current state. Do nothing.", (uint8_t *)&v40, 0x16u);

    }
    v12[2](v12, 1, 0);
  }
  else
  {
    if (v22)
    {
      v30 = v21;
      -[PowerUIAudioAccessorySmartChargeManager stringFromState:](self, "stringFromState:", a4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138412546;
      v41 = v10;
      v42 = 2112;
      v43 = (unint64_t)v31;
      _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "%@ requests state: %@", (uint8_t *)&v40, 0x16u);

    }
    switch(a4)
    {
      case 0uLL:
        -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v11, 0, 0, 0, 0);
        v32 = self;
        v33 = 0;
        goto LABEL_30;
      case 1uLL:
        -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v11, 1, 1, 0, 0);
        v32 = self;
        v33 = 1;
LABEL_30:
        -[PowerUIAudioAccessorySmartChargeManager setOBCState:forDevice:](v32, "setOBCState:forDevice:", v33, v11);
        goto LABEL_33;
      case 2uLL:
        v12[2](v12, 0, 0);
        break;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUIAudioAccessorySmartChargeManager defaultDateToDisableUntilGivenDate:](self, "defaultDateToDisableUntilGivenDate:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUIAudioAccessorySmartChargeManager setTemporarilyDisabled:until:forDevice:](self, "setTemporarilyDisabled:until:forDevice:", 1, v37, v11);

LABEL_33:
        v12[2](v12, 1, 0);
        -[NSDistributedNotificationCenter postNotificationName:object:](self->_notificationCenter, "postNotificationName:object:", CFSTR("com.apple.powerui.audioaccessorysmartchargestatuschanged"), v11);
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 1, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, 0, v38);

        break;
    }
  }

LABEL_36:
}

- (BOOL)setStateViaV2Protocol:(unint64_t)a3 forDevice:(BTDeviceImpl *)a4
{
  int v7;
  NSObject *accessoryLog;
  _BOOL4 v9;
  _BOOL4 v10;
  const char *v11;
  _BOOL4 v12;
  int v13;
  uint64_t i;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!self->_session)
  {
    accessoryLog = self->_accessoryLog;
    v9 = os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v10) = 0;
    if (!v9)
      return v10;
    *(_WORD *)buf = 0;
    v11 = "Bluetooth session has not been intialized, device  is not connected, do not try to set OBC state.";
    goto LABEL_11;
  }
  BTAccessoryManagerGetDefault();
  if (!-[PowerUIBluetoothHandler isDeviceConnected:forSession:](self->_btHandler, "isDeviceConnected:forSession:", a4, self->_session))
  {
    accessoryLog = self->_accessoryLog;
    v12 = os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v10) = 0;
    if (!v12)
      return v10;
    *(_WORD *)buf = 0;
    v11 = "Device is not connected to AACP, do not try to set OBC state.";
LABEL_11:
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_12:
    LOBYTE(v10) = 0;
    return v10;
  }
  v22 = 0;
  v21 = 0;
  if (a3 == 3)
  {
    v7 = 254;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    v7 = 253;
    goto LABEL_15;
  }
  if (a3)
  {
    v10 = os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    -[PowerUIAudioAccessorySmartChargeManager setStateViaV2Protocol:forDevice:].cold.1();
    goto LABEL_12;
  }
  v7 = 255;
LABEL_15:
  prepare9ByteMessage(&v21, v7, 3);
  v13 = -[PowerUIBluetoothHandler sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:](self->_btHandler, "sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:", 0, 0x20000, a4, &v21, 9);
  for (i = 0; i != 9; ++i)
  {
    v15 = self->_accessoryLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = *((unsigned __int8 *)&v21 + i);
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v16;
      _os_log_debug_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEBUG, "  var: %u", buf, 8u);
    }
  }
  v17 = self->_accessoryLog;
  if (v13)
  {
    v10 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    -[PowerUIAudioAccessorySmartChargeManager setStateViaV2Protocol:forDevice:].cold.2(v17, v13);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = a3;
    _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "OBC Message (%lu) sent to device", buf, 0xCu);
  }
  LOBYTE(v10) = 1;
  return v10;
}

- (id)getOBCDeadlineFromCBDevice:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  CBDiscovery *v6;
  CBDiscovery *discovery;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  CBDiscovery *v11;
  dispatch_time_t v12;
  intptr_t v13;
  NSObject *accessoryLog;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = (CBDiscovery *)objc_alloc_init(MEMORY[0x24BDBB250]);
  discovery = self->_discovery;
  self->_discovery = v6;

  -[CBDiscovery setDiscoveryFlags:](self->_discovery, "setDiscoveryFlags:", 0x20000000);
  v35[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBDiscovery setDeviceFilter:](self->_discovery, "setDeviceFilter:", v8);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v9 = MEMORY[0x24BDAC760];
  v30 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke;
  v22[3] = &unk_24D3FC750;
  v24 = &v25;
  v10 = v5;
  v23 = v10;
  -[CBDiscovery setDeviceFoundHandler:](self->_discovery, "setDeviceFoundHandler:", v22);
  v11 = self->_discovery;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke_2;
  v21[3] = &unk_24D3FBB48;
  v21[4] = self;
  -[CBDiscovery activateWithCompletion:](v11, "activateWithCompletion:", v21);
  v12 = dispatch_time(0, 3000000000);
  v13 = dispatch_semaphore_wait(v10, v12);
  accessoryLog = self->_accessoryLog;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
      -[PowerUIAudioAccessorySmartChargeManager getOBCDeadlineFromCBDevice:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v26[5];
    *(_DWORD *)buf = 138412546;
    v32 = v4;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Got deadline from device (%@): %@", buf, 0x16u);
  }
  -[CBDiscovery invalidate](self->_discovery, "invalidate");
  v16 = (void *)v26[5];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "laterDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = v18 == (void *)v26[5];

  if ((_DWORD)v16)
    v19 = (id)v26[5];
  else
    v19 = 0;

  _Block_object_dispose(&v25, 8);
  return v19;
}

intptr_t __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke(intptr_t result, void *a2)
{
  intptr_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v2 = result;
    objc_msgSend(a2, "accessoryStatusOBCTime");
    if (v3 <= 0.0)
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 32));
  }
  return result;
}

void __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)fullChargeDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *accessoryLog;
  int v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[PowerUIAudioAccessorySmartChargeManager btHandler](self, "btHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "getDeviceForAddressString:forSession:", v6, self->_session);

  -[PowerUIAudioAccessorySmartChargeManager btHandler](self, "btHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "protocolForDevice:", v9);

  if (v11 == 3)
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_DEBUG))
      -[PowerUIAudioAccessorySmartChargeManager fullChargeDeadlineForDevice:withHandler:].cold.1();
    -[PowerUIAudioAccessorySmartChargeManager getOBCDeadlineFromCBDevice:](self, "getOBCDeadlineFromCBDevice:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[PowerUISmartChargeUtilities roundedDateFromDate:](PowerUISmartChargeUtilities, "roundedDateFromDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v13, 0);

    }
    else
    {
      v7[2](v7, 0, 0);
    }
  }
  else if ((v11 + 1) > 1u)
  {
    -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastSentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUISmartChargeUtilities roundedDateFromDate:](PowerUISmartChargeUtilities, "roundedDateFromDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "timeIntervalSinceNow");
    if (v17 <= 0.0)
    {

      v16 = 0;
    }
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v16;
      _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "fullChargeDeadline requested, returning: %@", (uint8_t *)&v19, 0xCu);
    }
    v7[2](v7, v16, 0);

  }
  else
  {
    v14 = self->_accessoryLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v6;
      v21 = 1024;
      v22 = v11;
      _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Query for OBC deadline for device %@, but protocol is: %hhu", (uint8_t *)&v19, 0x12u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);
  }

}

- (void)unfilteredDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  NSObject *accessoryLog;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastSentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Unfiltered deadline requested, returning: %@", (uint8_t *)&v10, 0xCu);
  }
  v6[2](v6, v8, 0);

}

- (void)client:(id)a3 updateOBCDeadline:(id)a4 forDevice:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *accessoryLog;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  int v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend(v11, "timeIntervalSinceDate:", v14), v15 <= 172800.0))
  {
    -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastSentDate");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18
      && (v19 = (void *)v18,
          objc_msgSend(v17, "lastSentDate"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "compare:", v11),
          v20,
          v19,
          v21 == 1))
    {
      accessoryLog = self->_accessoryLog;
      if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = accessoryLog;
        objc_msgSend(v17, "lastSentDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138413058;
        v34 = v10;
        v35 = 2112;
        v36 = v11;
        v37 = 2112;
        v38 = v12;
        v39 = 2112;
        v40 = v24;
        _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "%@ requests deadline update '%@' for device '%@', but on device deadline (%@) is newer", (uint8_t *)&v33, 0x2Au);

      }
      -[NSDistributedNotificationCenter postNotificationName:object:](self->_notificationCenter, "postNotificationName:object:", CFSTR("com.apple.powerui.audioaccessorysmartchargedeadlinechanged"), v12);
    }
    else
    {
      objc_msgSend(v17, "lastSentDate");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25
        || (v26 = (void *)v25,
            objc_msgSend(v17, "lastSentDate"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "compare:", v11),
            v27,
            v26,
            v28 == -1))
      {
        v30 = self->_accessoryLog;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v30;
          objc_msgSend(v17, "lastSentDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138413058;
          v34 = v10;
          v35 = 2112;
          v36 = v11;
          v37 = 2112;
          v38 = v12;
          v39 = 2112;
          v40 = v32;
          _os_log_impl(&dword_215A71000, v31, OS_LOG_TYPE_DEFAULT, "%@ requests deadline update '%@' for device '%@'. Update on device deadline (%@)", (uint8_t *)&v33, 0x2Au);

        }
        -[PowerUIAudioAccessorySmartChargeManager persistentlySetLastSentDate:forDevice:](self, "persistentlySetLastSentDate:forDevice:", v11, v12);
      }
      else
      {
        v29 = self->_accessoryLog;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 138412802;
          v34 = v10;
          v35 = 2112;
          v36 = v11;
          v37 = 2112;
          v38 = v12;
          _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "%@ requests deadline update '%@' for device '%@', but dates are equal", (uint8_t *)&v33, 0x20u);
        }
      }
    }
    objc_msgSend(v17, "setManagerState:", 9);
    v13[2](v13, 1, 0);
  }
  else
  {
    v16 = self->_accessoryLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412802;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "ERROR: %@ requests invalid deadline update '%@' for device '%@'", (uint8_t *)&v33, 0x20u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v17);
  }

}

- (void)persistentlySetStatusForDevice:(id)a3 withCurrentState:(unint64_t)a4 withEnabled:(BOOL)a5 withDisabledUntilDate:(id)a6 withTemporarilyDisabled:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v7 = a7;
  v8 = a5;
  v12 = a6;
  v13 = a3;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v13);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCurrentState:", a4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v14, CFSTR("com.apple.smartcharging.audioaccessories.currentState."), v13);

  objc_msgSend(v24, "setEnabled:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v15, CFSTR("com.apple.smartcharging.audioaccessories.enabled."), v13);

  objc_msgSend(v24, "setDisabledUntilDate:", v12);
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v18 = v17;

  objc_msgSend(v16, "numberWithDouble:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v19, CFSTR("com.apple.smartcharging.audioaccessories.disabledUntilDate."), v13);

  objc_msgSend(v24, "setTemporarilyDisabled:", v7);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLastSeenDate:", v20);

  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v24, "lastSeenDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  objc_msgSend(v21, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v23, CFSTR("com.apple.smartcharging.audioaccessories.lastSeenDate."), v13);

}

- (void)persistentlySetLastSentDate:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastSentDate:", v7);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v11, CFSTR("com.apple.smartcharging.audioaccessories.lastSentDate."), v6);

  -[NSDistributedNotificationCenter postNotificationName:object:](self->_notificationCenter, "postNotificationName:object:", CFSTR("com.apple.powerui.audioaccessorysmartchargedeadlinechanged"), v6);
}

- (void)persistentlySetLastTimeseriesDate:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastTimeseriesDate:", v7);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v11, CFSTR("com.apple.smartcharging.audioaccessories.lastTimeseriesDate."), v6);

}

- (void)persistentlySetLastUnderchargeRecordedForPrediction:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastUnderchargeRecordedForPrediction:", v7);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v11, CFSTR("com.apple.smartcharging.audioaccessories.lastUnderchargeRecordedForPrediction."), v6);

}

- (void)persistentlyHandleSeeingDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastSeenDate:", v5);

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "lastSeenDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAudioAccessorySmartChargeManager setNumber:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setNumber:forPreferenceKeyPrefix:andDevice:", v8, CFSTR("com.apple.smartcharging.audioaccessories.lastSeenDate."), v4);

}

- (void)persistentlySetExpectedHash:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpectedHash:", v7);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PowerUIAudioAccessorySmartChargeManager setString:forPreferenceKeyPrefix:andDevice:](PowerUIAudioAccessorySmartChargeManager, "setString:forPreferenceKeyPrefix:andDevice:", v8, CFSTR("com.apple.smartcharging.audioaccessories.expectedHash."), v6);
}

+ (void)setNumber:(id)a3 forPreferenceKeyPrefix:(id)a4 andDevice:(id)a5
{
  id value;

  value = a3;
  CFPreferencesSetAppValue((CFStringRef)objc_msgSend(a4, "stringByAppendingString:", a5), value, CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));

}

+ (id)readNumberForPreferenceKeyPrefix:(id)a3 andDevice:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)objc_msgSend(a3, "stringByAppendingString:", a4), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
}

+ (void)setString:(id)a3 forPreferenceKeyPrefix:(id)a4 andDevice:(id)a5
{
  id value;

  value = a3;
  CFPreferencesSetAppValue((CFStringRef)objc_msgSend(a4, "stringByAppendingString:", a5), value, CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));

}

+ (id)readStringForPreferenceKeyPrefix:(id)a3 andDevice:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)objc_msgSend(a3, "stringByAppendingString:", a4), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
}

+ (void)setArray:(id)a3 forPreferenceKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
}

+ (id)readArrayForPreferenceKey:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)bulkDeleteDefaultsEntries:(id)a3
{
  CFPreferencesSetMultiple(0, (CFArrayRef)a3, CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
}

- (id)stringFromState:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown state");
  else
    return off_24D3FC790[a3];
}

- (id)defaultDateToDisableUntilGivenDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *accessoryLog;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (defaultDateToDisableUntilGivenDate__onceToken != -1)
    dispatch_once(&defaultDateToDisableUntilGivenDate__onceToken, &__block_literal_global_12);
  objc_msgSend((id)defaultDateToDisableUntilGivenDate__calendar, "components:fromDate:", 60, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hour") >= 6)
    objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  objc_msgSend(v5, "setHour:", 6);
  objc_msgSend((id)defaultDateToDisableUntilGivenDate__calendar, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Feature disabled until: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

void __78__PowerUIAudioAccessorySmartChargeManager_defaultDateToDisableUntilGivenDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultDateToDisableUntilGivenDate__calendar;
  defaultDateToDisableUntilGivenDate__calendar = v0;

}

- (void)setTemporarilyDisabled:(BOOL)a3 until:(id)a4 forDevice:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  BTDeviceImpl *v13;
  int v14;
  int v15;
  char v16;
  void *v17;
  char v18;
  NSObject *accessoryLog;
  dispatch_time_t v20;
  NSObject *queue;
  id v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v6 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (v8)
    {
      objc_msgSend(v8, "timeIntervalSinceNow");
      v11 = v10;
      if (v10 < 0.0)
        v6 = 0;
    }
    else
    {
      v11 = 0.0;
    }
    -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v9, self->_session);
    if (!v13 && os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
      -[PowerUIAudioAccessorySmartChargeManager setTemporarilyDisabled:until:forDevice:].cold.1();
    v14 = -[PowerUIBluetoothHandler protocolForDevice:](self->_btHandler, "protocolForDevice:", v13);
    v15 = objc_msgSend(v12, "temporarilyDisabled");
    if (v6)
    {
      v16 = v15 ^ 1;
      if (!v8)
        v16 = 1;
      if ((v16 & 1) != 0
        || (objc_msgSend(v12, "disabledUntilDate"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v8, "isEqualToDate:", v17),
            v17,
            (v18 & 1) == 0))
      {
        -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v9, 3, 1, v8, 1);
        if ((v14 - 1) <= 1)
          -[PowerUIAudioAccessorySmartChargeManager setOBCState:forDevice:](self, "setOBCState:forDevice:", 0, v9);
        -[NSDistributedNotificationCenter postNotificationName:object:](self->_notificationCenter, "postNotificationName:object:", CFSTR("com.apple.powerui.audioaccessorysmartchargestatuschanged"), v9);
        accessoryLog = self->_accessoryLog;
        if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v9;
          _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Set state to temporarilyDisabled for device '%@'", buf, 0xCu);
        }
        v20 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
        queue = self->_queue;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __82__PowerUIAudioAccessorySmartChargeManager_setTemporarilyDisabled_until_forDevice___block_invoke;
        v26[3] = &unk_24D3FC690;
        v26[4] = self;
        v22 = v9;
        v27 = v22;
        dispatch_after(v20, queue, v26);
        v23 = self->_accessoryLog;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v22;
          v30 = 2048;
          v31 = v11 / 60.0;
          _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "Re-enable device '%@' in %f minutes", buf, 0x16u);
        }

      }
      goto LABEL_29;
    }
    if (v15)
    {
      -[PowerUIAudioAccessorySmartChargeManager persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:](self, "persistentlySetStatusForDevice:withCurrentState:withEnabled:withDisabledUntilDate:withTemporarilyDisabled:", v9, 1, 1, 0, 0);
      if ((v14 - 1) <= 1)
        -[PowerUIAudioAccessorySmartChargeManager setOBCState:forDevice:](self, "setOBCState:forDevice:", 1, v9);
      -[NSDistributedNotificationCenter postNotificationName:object:](self->_notificationCenter, "postNotificationName:object:", CFSTR("com.apple.powerui.audioaccessorysmartchargestatuschanged"), v9);
      v24 = self->_accessoryLog;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      v25 = "Re-enable device '%@' (previously temporarily disabled)";
    }
    else
    {
      v24 = self->_accessoryLog;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:

        goto LABEL_30;
      }
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      v25 = "Attempted to re-enable device '%@', but it was not temporarily disabled";
    }
    _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
    goto LABEL_29;
  }
LABEL_30:

}

uint64_t __82__PowerUIAudioAccessorySmartChargeManager_setTemporarilyDisabled_until_forDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:forDevice:", 0, 0, *(_QWORD *)(a1 + 40));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSObject *accessoryLog;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v6 = a4;
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Received new connection: %@", buf, 0xCu);
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.powerui.smartcharging.AudioAccessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((!v8 || (objc_msgSend(v8, "BOOLValue") & 1) == 0)
    && os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIAudioAccessorySmartChargeManager listener:shouldAcceptNewConnection:].cold.1();
  }
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E011B0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getAvailableDevicesWithHandler_, 0, 1);

  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_getStatusForDevice_withHandler_, 0, 1);

  objc_msgSend(v6, "setExportedInterface:", v10);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)engageUntil:(id)a3 forDevice:(id)a4 overrideAllSignals:(BOOL)a5 withHandler:(id)a6
{
  PowerUIBluetoothHandler *btHandler;
  BTSessionImpl *session;
  void (**v11)(id, BOOL, _QWORD);
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  id v16;

  btHandler = self->_btHandler;
  session = self->_session;
  v11 = (void (**)(id, BOOL, _QWORD))a6;
  v12 = a3;
  v13 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](btHandler, "getDeviceForAddressString:forSession:", a4, session);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v16);
  v15 = v14;

  v11[2](v11, -[PowerUIAudioAccessorySmartChargeManager sendTimeDeltaInSeconds:toAccessory:](self, "sendTimeDeltaInSeconds:toAccessory:", v15, v13) == 0, 0);
}

- (void)getAvailableDevicesWithHandler:(id)a3
{
  NSLock *deviceArrayLock;
  void (**v5)(id, void *);
  void *v6;
  NSObject *accessoryLog;
  void *v8;
  NSMutableArray *deviceArray;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  deviceArrayLock = self->_deviceArrayLock;
  v5 = (void (**)(id, void *))a3;
  -[NSLock lock](deviceArrayLock, "lock");
  v6 = (void *)-[NSMutableArray copy](self->_deviceArray, "copy");
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    deviceArray = self->_deviceArray;
    v10 = accessoryLog;
    objc_msgSend(v8, "numberWithUnsignedInteger:", -[NSMutableArray count](deviceArray, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "Available devices were requested, available: %@ - copy count: %@", (uint8_t *)&v13, 0x16u);

  }
  -[NSLock unlock](self->_deviceArrayLock, "unlock");
  v5[2](v5, v6);

}

- (void)getStatusForDevice:(id)a3 withHandler:(id)a4
{
  void *v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *accessoryLog;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = (void (**)(id, void *))a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "enabled"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v9, "setValue:forKey:", v11, CFSTR("enabled"));
  if (objc_msgSend(v10, "temporarilyDisabled"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v9, "setValue:forKey:", v12, CFSTR("temporarilyDisabled"));
  v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v13, "setDateFormat:", CFSTR("yyyy-MM-dd 'at' HH:mm"));
  objc_msgSend(v10, "lastSentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("lastSentDate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v10, "minutesSavedSinceLastReport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v17, CFSTR("minutesSavedSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v10, "underchargesSinceLastReport"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v19, CFSTR("underchargesSinceLastReport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v10, "chargingEventsSinceLastReport"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v21, CFSTR("chargingEventsSinceLastReport"));

  objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("deviceName"));
  v22 = (void *)objc_msgSend(v9, "copy");
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v22;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Status Requested: %@", (uint8_t *)&v24, 0xCu);
  }
  v7[2](v7, v22);

}

- (void)deleteRecordsForDevices:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t i;
  uint64_t v7;
  NSObject *accessoryLog;
  NSMutableArray *deviceArray;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PowerUIAudioAccessorySmartChargeManager *v19;
  void *v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[8];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_deviceArrayLock, "lock");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v27;
    *(_QWORD *)&v5 = 138412546;
    v21 = v5;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        accessoryLog = self->_accessoryLog;
        if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
        {
          deviceArray = self->_deviceArray;
          v10 = accessoryLog;
          v11 = -[NSMutableArray count](deviceArray, "count");
          *(_DWORD *)buf = v21;
          v32 = v7;
          v33 = 2048;
          v34 = v11;
          _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "Delete device '%@' from known devices (%lu).", buf, 0x16u);

        }
        -[NSMutableArray removeObject:](self->_deviceArray, "removeObject:", v7, v21);
        -[NSMutableDictionary removeObjectForKey:](self->_accessoryStates, "removeObjectForKey:", v7);
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.currentState."), "stringByAppendingString:", v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v25;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.enabled."), "stringByAppendingString:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v12;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.disabledUntilDate."), "stringByAppendingString:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2] = v13;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.temporarilyDisabled."), "stringByAppendingString:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v30[3] = v14;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.lastSentDate."), "stringByAppendingString:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30[4] = v15;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.lastSeenDate."), "stringByAppendingString:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30[5] = v16;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.lastTimeseriesDate."), "stringByAppendingString:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30[6] = v17;
        objc_msgSend(CFSTR("com.apple.smartcharging.audioaccessories.lastUnderchargeRecordedForPrediction."), "stringByAppendingString:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30[7] = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 8);
        v19 = self;
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        +[PowerUIAudioAccessorySmartChargeManager bulkDeleteDefaultsEntries:](PowerUIAudioAccessorySmartChargeManager, "bulkDeleteDefaultsEntries:", v20);
        self = v19;
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v24);
  }

  +[PowerUIAudioAccessorySmartChargeManager setArray:forPreferenceKey:](PowerUIAudioAccessorySmartChargeManager, "setArray:forPreferenceKey:", self->_deviceArray, CFSTR("com.apple.smartcharging.audioaccessories.deviceArray"));
  -[NSLock unlock](self->_deviceArrayLock, "unlock");

}

- (void)lastActionForDevice:(id)a3 withHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  id v7;

  v6 = (void (**)(id, uint64_t))a4;
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, objc_msgSend(v7, "managerState"));

}

- (void)clearLastActionForDevice:(id)a3
{
  id v3;

  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setManagerState:", 0);

}

- (void)startMockingBluetoothForFakeDevice:(id)a3
{
  id v4;
  NSObject *accessoryLog;
  void *v6;
  id v7;
  PowerUIBluetoothHandler *v8;
  PowerUIBluetoothHandler *btHandler;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIAudioAccessorySmartChargeManager startMockingBluetoothForFakeDevice:].cold.1();
  }
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Start mocking bluetooth for fake device name: %@", (uint8_t *)&v10, 0xCu);
  }
  -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:](self, "returnAccessoryStatusForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "setExpectedHash:", v7);

  v8 = -[PowerUIBluetoothHandlerFake init:]([PowerUIBluetoothHandlerFake alloc], "init:", v4);
  btHandler = self->_btHandler;
  self->_btHandler = v8;

}

- (void)stopMockingBluetooth
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: Not in mocking mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)fakeConnectionForDevice:(id)a3
{
  id v4;
  BTDeviceImpl *v5;
  uint64_t v6;
  NSObject *accessoryLog;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[2];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v4, self->_session);
    btConnectionUpdateCallback((uint64_t)v5, v6, 0, 11, 0, self);
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "Connection callback called with fake event";
      v9 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Abort faking connections: Not in mocking mode";
      v9 = buf;
      goto LABEL_6;
    }
  }

}

- (void)setFakeConnectionStatusTo:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *accessoryLog;
  uint8_t v6[16];

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PowerUIBluetoothHandler setFakeDeviceConnected:](self->_btHandler, "setFakeDeviceConnected:", v3);
  }
  else
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Abort setting fake connection status: Not in mocking mode", v6, 2u);
    }
  }
}

- (void)currentLeewayWithHandler:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  -[PowerUIAudioAccessorySmartChargeManager predictor](self, "predictor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastUsedLeeway");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v6, v7, 0);

}

- (void)timeSeriesForDevice:(id)a3
{
  id v4;
  NSObject *accessoryLog;
  BTDeviceImpl *v6;
  BTDeviceImpl *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[15];
  char v13;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138412290;
    *(_QWORD *)((char *)buf + 4) = v4;
    _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Triggering time series response for device '%@'.", (uint8_t *)buf, 0xCu);
  }
  buf[0] = 0;
  BTAccessoryManagerGetDefault();
  v6 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v4, self->_session);
  if (v6)
  {
    v7 = v6;
    v13 = 0;
    v8 = self->_accessoryLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "memset done, about to send message...", v12, 2u);
    }
    v9 = -[PowerUIBluetoothHandler sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:](self->_btHandler, "sendCustomMessageWrapperWithManager:withMessageType:withDeviceHandle:withData:withDataSize:", buf[0], 0x80000, v7, &v13, 1);
    v10 = self->_accessoryLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "timeseries message sent...", v12, 2u);
    }
    if ((_DWORD)v9)
    {
      v11 = self->_accessoryLog;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PowerUIAudioAccessorySmartChargeManager timeSeriesForDevice:].cold.2(v11, v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIAudioAccessorySmartChargeManager timeSeriesForDevice:].cold.1();
  }

}

- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *accessoryLog;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v7 & 1) == 0)
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_215A71000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Force reevaluation, signal monitor sent a new deadline: %@", buf, 0xCu);
    }
    -[NSLock lock](self->_deviceArrayLock, "lock");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_deviceArray;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v15 = self->_accessoryLog;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v14;
            _os_log_debug_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEBUG, "  handling device %@...", buf, 0xCu);
          }
          -[PowerUIAudioAccessorySmartChargeManager runUpdateForDevice:withHash:](self, "runUpdateForDevice:withHash:", -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v14, self->_session), 0);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    -[NSLock unlock](self->_deviceArrayLock, "unlock");
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PowerUIMLAudioAccessoryModelPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_predictor, a3);
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (OS_os_log)accessoryLog
{
  return self->_accessoryLog;
}

- (void)setAccessoryLog:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLog, a3);
}

- (NSMutableArray)deviceArray
{
  return self->_deviceArray;
}

- (void)setDeviceArray:(id)a3
{
  objc_storeStrong((id *)&self->_deviceArray, a3);
}

- (NSLock)deviceArrayLock
{
  return self->_deviceArrayLock;
}

- (void)setDeviceArrayLock:(id)a3
{
  objc_storeStrong((id *)&self->_deviceArrayLock, a3);
}

- (NSMutableDictionary)accessoryStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccessoryStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)hardcodedTimeDelta
{
  return self->_hardcodedTimeDelta;
}

- (void)setHardcodedTimeDelta:(id)a3
{
  objc_storeStrong((id *)&self->_hardcodedTimeDelta, a3);
}

- (NSNumber)hardcodedTimeBetweenUpdates
{
  return self->_hardcodedTimeBetweenUpdates;
}

- (void)setHardcodedTimeBetweenUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_hardcodedTimeBetweenUpdates, a3);
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (OS_dispatch_semaphore)btConnectionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBtConnectionSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PowerUIWalletSignalMonitor)walletMonitor
{
  return self->_walletMonitor;
}

- (void)setWalletMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_walletMonitor, a3);
}

- (NSMutableDictionary)acceptMessageFromRightBudForDevice
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAcceptMessageFromRightBudForDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)acceptMessageFromLeftBudForDevice
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAcceptMessageFromLeftBudForDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PowerUIBluetoothHandler)btHandler
{
  return (PowerUIBluetoothHandler *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBtHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)firstNotificationDisplayed
{
  return self->_firstNotificationDisplayed;
}

- (void)setFirstNotificationDisplayed:(BOOL)a3
{
  self->_firstNotificationDisplayed = a3;
}

- (NSMutableDictionary)latestAnalyticsForDevice
{
  return self->_latestAnalyticsForDevice;
}

- (void)setLatestAnalyticsForDevice:(id)a3
{
  objc_storeStrong((id *)&self->_latestAnalyticsForDevice, a3);
}

- (NSNumber)budSideToRecord
{
  return self->_budSideToRecord;
}

- (void)setBudSideToRecord:(id)a3
{
  objc_storeStrong((id *)&self->_budSideToRecord, a3);
}

- (CBDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_budSideToRecord, 0);
  objc_storeStrong((id *)&self->_latestAnalyticsForDevice, 0);
  objc_storeStrong((id *)&self->_btHandler, 0);
  objc_storeStrong((id *)&self->_acceptMessageFromLeftBudForDevice, 0);
  objc_storeStrong((id *)&self->_acceptMessageFromRightBudForDevice, 0);
  objc_storeStrong((id *)&self->_walletMonitor, 0);
  objc_storeStrong((id *)&self->_btConnectionSemaphore, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_hardcodedTimeBetweenUpdates, 0);
  objc_storeStrong((id *)&self->_hardcodedTimeDelta, 0);
  objc_storeStrong((id *)&self->_accessoryStates, 0);
  objc_storeStrong((id *)&self->_deviceArrayLock, 0);
  objc_storeStrong((id *)&self->_deviceArray, 0);
  objc_storeStrong((id *)&self->_accessoryLog, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)returnAccessoryStatusForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: accessory status requested for nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v3, v6, "Error getting accessory charging event: %@", v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)runUpdateForDevice:withHash:asInitialUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Unknown prediction container state!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)nameForProductID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Audio accessory type is unknown.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)isSmartChargingCurrentlyEnabledForDevice:withHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: smart charging status requested for nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)client:setState:forDevice:withHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: Failure when determining device protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)setStateViaV2Protocol:forDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: setStateViaV2Protocol is trying to set unsupported state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)setStateViaV2Protocol:(void *)a1 forDevice:(uint64_t)a2 .cold.2(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedLong:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7(&dword_215A71000, v5, v6, "Failed to send OBC Message (%lu) to device - Error code: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)getOBCDeadlineFromCBDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Error: Timeout occurred to obtain device deadline", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)fullChargeDeadlineForDevice:withHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_215A71000, v0, OS_LOG_TYPE_DEBUG, "Query CB OBC deadline from device %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)setTemporarilyDisabled:until:forDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "No device for setTemporarilyDisabled request, proceed anyways", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Client does not have necessary entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)startMockingBluetoothForFakeDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: Not an internal build, mocking mode is forbidden.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)timeSeriesForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "Error: No device with address '%@' can be found.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)timeSeriesForDevice:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_215A71000, v6, v7, "Error code '%@' sending OBCv2 message to device '%@'.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

@end
