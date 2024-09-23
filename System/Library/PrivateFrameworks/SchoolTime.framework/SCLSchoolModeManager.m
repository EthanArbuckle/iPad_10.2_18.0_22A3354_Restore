@implementation SCLSchoolModeManager

- (SCLSchoolModeManager)initWithConfiguration:(id)a3
{
  id v4;
  SCLSchoolModeManager *v5;
  uint64_t v6;
  SCLSchoolModeManagerConfiguration *configuration;
  uint64_t v8;
  NSMapTable *coordinatorMap;
  NSMutableSet *v10;
  NSMutableSet *clients;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  SCLSuppressSchoolModeAssertionManager *v17;
  SCLSuppressSchoolModeAssertionManager *supppressionManager;
  SCLInterruptBehaviorResolver *v19;
  SCLInterruptBehaviorResolver *interruptBehaviorResolver;
  SCLTransportService *v21;
  OS_dispatch_queue *v22;
  void *v23;
  uint64_t v24;
  SCLTransportService *transportService;
  uint64_t v26;
  NSXPCListener *listener;
  id v29;
  id location;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SCLSchoolModeManager;
  v5 = -[SCLSchoolModeManager init](&v31, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SCLSchoolModeManagerConfiguration *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    coordinatorMap = v5->_coordinatorMap;
    v5->_coordinatorMap = (NSMapTable *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    clients = v5->_clients;
    v5->_clients = v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "workloop");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create_with_target_V2("com.apple.schooltime.manager", v13, v14);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;

    if (-[SCLSchoolModeManagerConfiguration managesSchoolTimeSession](v5->_configuration, "managesSchoolTimeSession"))
    {
      v17 = -[SCLSuppressSchoolModeAssertionManager initWithTargetQueue:]([SCLSuppressSchoolModeAssertionManager alloc], "initWithTargetQueue:", v5->_queue);
      supppressionManager = v5->_supppressionManager;
      v5->_supppressionManager = v17;

    }
    v19 = -[SCLInterruptBehaviorResolver initWithTargetQueue:]([SCLInterruptBehaviorResolver alloc], "initWithTargetQueue:", v5->_queue);
    interruptBehaviorResolver = v5->_interruptBehaviorResolver;
    v5->_interruptBehaviorResolver = v19;

    v21 = [SCLTransportService alloc];
    v22 = v5->_queue;
    objc_msgSend(v4, "service");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SCLTransportService initWithTargetQueue:service:](v21, "initWithTargetQueue:service:", v22, v23);
    transportService = v5->_transportService;
    v5->_transportService = (SCLTransportService *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.schooltime.schedule"));
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v26;

    -[NSXPCListener _setQueue:](v5->_listener, "_setQueue:", v5->_queue);
    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    objc_initWeak(&location, v5);
    objc_copyWeak(&v29, &location);
    v5->_stateHandle = os_state_add_handler();
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v5;
}

uint64_t __46__SCLSchoolModeManager_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "stateDataWithHints:", a2);

  return v4;
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  os_state_data_s *v11;
  _QWORD v13[4];
  id v14;
  SCLSchoolModeManager *v15;
  id v16;

  -[SCLSchoolModeManager configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global_11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_2;
  v13[3] = &unk_24E29C148;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v13);
  objc_msgSend(v9, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_state_data_s *)SCLSStateDataWithTitleDescriptionAndHints(CFSTR("SCLSchoolModeManager"), (uint64_t)v10);

  return v11;
}

uint64_t __43__SCLSchoolModeManager_stateDataWithHints___block_invoke()
{
  return 1;
}

uint64_t __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "coordinatorMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("coordinators"), 0);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("clients"), 0);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_3;
  v11[3] = &unk_24E29C298;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v9, CFSTR("devices"), 0, v11);
}

id __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "descriptionBuilderForNRDevice:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionBuilderForNRDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x24BE0BE08];
  v4 = a3;
  objc_msgSend(v3, "builderWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("pairingID"));

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B378]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "appendBool:withName:", v8 != 0, CFSTR("hasPairingStorePath"));

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B340]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v5, "appendBool:withName:", objc_msgSend(v10, "BOOLValue"), CFSTR("isAltAccount"));

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v5, "appendBool:withName:", objc_msgSend(v12, "BOOLValue"), CFSTR("isArchived"));
  return v5;
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_block_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD block[5];
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_21E4AD000, "Start School Mode Manager", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  scl_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Start School Mode Manager", (const char *)&unk_21E4DC639, buf, 2u);
  }

  -[SCLSchoolModeManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SCLSchoolModeManager_start__block_invoke;
  block[3] = &unk_24E29BB40;
  block[4] = self;
  v6 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_async(v5, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleDevicePairedNotification_, *MEMORY[0x24BE6B440], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleDeviceUnpairedNotification_, *MEMORY[0x24BE6B450], 0);

  -[SCLSchoolModeManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v9);

  -[SCLSchoolModeManager listener](self, "listener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SCLServerStartNotification"), 0, 0, 0);
  os_activity_scope_leave(&state);

}

void __29__SCLSchoolModeManager_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "supppressionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

  objc_msgSend(*(id *)(a1 + 32), "interruptBehaviorResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");

  objc_msgSend(*(id *)(a1 + 32), "loadPairedDevices");
  objc_msgSend(*(id *)(a1 + 32), "transportService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

  objc_msgSend(*(id *)(a1 + 32), "_updateActivityRegistration");
  scl_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Start School Mode Manager", (const char *)&unk_21E4DC639, v6, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)SCLSchoolModeManager;
  -[SCLSchoolModeManager dealloc](&v3, sel_dealloc);
}

- (void)loadPairedDevices
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SCLSchoolModeManager eligiblePairedDevices](self, "eligiblePairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  scl_pairing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "Loading devices %@", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SCLSchoolModeManager createControllerForDevice:](self, "createControllerForDevice:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)eligiblePairedDevices
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[SCLSchoolModeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SCLSchoolModeManager_eligiblePairedDevices__block_invoke;
  v7[3] = &unk_24E29C2C0;
  v7[4] = self;
  objc_msgSend(v4, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __45__SCLSchoolModeManager_eligiblePairedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isEligibleDevice:", v3);
  scl_pairing_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B378]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B348]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134219266;
    v13 = v3;
    v14 = 2112;
    v15 = v6;
    v16 = 1024;
    v17 = v7 != 0;
    v18 = 1024;
    v19 = v9;
    v20 = 1024;
    v21 = objc_msgSend(v10, "BOOLValue");
    v22 = 1024;
    v23 = v4;
    _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_DEFAULT, "<NRDevice %p; pairingID=%@; hasPairingPath=%{BOOL}d; isAltAccount=%{BOOL}d; isArchived=%{BOOL}d> isEligible:%{BOOL}d",
      (uint8_t *)&v12,
      0x2Eu);

  }
  return v4;
}

- (BOOL)isEligibleDevice:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SCLSchoolModeManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SCLIsNRDeviceEligibleForSchoolTime(v4, objc_msgSend(v5, "allowsNonTinkerPairing"));

  return v6;
}

- (void)createControllerForDevice:(id)a3
{
  id v4;
  SCLSchoolModeCoordinatorConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  SCLTransportController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SCLTransportController *v30;
  void *v31;
  SCLUnlockHistoryPersistentStore *v32;
  NSObject *v33;
  void *v34;
  int v35;
  SCLSchoolModeServer *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SCLSchoolModeServer *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  SCLSchoolModeCoordinator *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = objc_alloc_init(SCLSchoolModeCoordinatorConfiguration);
  -[SCLSchoolModeCoordinatorConfiguration setNRDevice:](v5, "setNRDevice:", v4);
  objc_msgSend(v4, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B378]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("SchoolTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSchoolModeCoordinatorConfiguration setDirectoryURL:](v5, "setDirectoryURL:", v9);
  -[SCLSchoolModeCoordinatorConfiguration setSendsRemoteScheduleSettings:](v5, "setSendsRemoteScheduleSettings:", 1);
  -[SCLSchoolModeCoordinatorConfiguration setSendsRemoteHistoryItems:](v5, "setSendsRemoteHistoryItems:", 0);
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B340]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v54 = v7;
    v55 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeManager configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "linkedDevicesWithRelationship:", 2);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v12, "addObjectsFromArray:", v15);
    v52 = (void *)v15;
    -[SCLSchoolModeManager configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "devices");
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v12, "addObjectsFromArray:", v18);
    v51 = (void *)v18;
    v53 = v9;
    -[SCLSchoolModeManager configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceRegistry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deviceForNRDevice:fromIDSDevices:", v4, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v4;
    if (!v21)
    {
      scl_pairing_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[SCLSchoolModeManager createControllerForDevice:].cold.1();

      v22 = v4;
    }
    v49 = v22;
    v50 = v12;
    -[SCLSchoolModeCoordinatorConfiguration setIdsDevice:](v5, "setIdsDevice:", v21);
    v24 = [SCLTransportController alloc];
    -[SCLSchoolModeManager configuration](self, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "deviceRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeManager configuration](self, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "service");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIDOverride");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[SCLTransportController initWithNRDevice:deviceRegistry:service:deviceIdentifier:](v24, "initWithNRDevice:deviceRegistry:service:deviceIdentifier:", v22, v26, v28, v29);

    -[SCLSchoolModeCoordinatorConfiguration setTransportController:](v5, "setTransportController:", v30);
    v9 = v53;
    objc_msgSend(v53, "URLByAppendingPathComponent:", CFSTR("UnlockHistory.sqlite3"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[SCLUnlockHistoryPersistentStore initWithURL:]([SCLUnlockHistoryPersistentStore alloc], "initWithURL:", v31);
    -[SCLSchoolModeCoordinatorConfiguration setHistoryStore:](v5, "setHistoryStore:", v32);

    v4 = v49;
    v7 = v54;
    v6 = v55;
  }
  else
  {
    scl_pairing_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[SCLSchoolModeManager createControllerForDevice:].cold.2(v33);

    -[SCLSchoolModeCoordinatorConfiguration setSendsRemoteHistoryItems:](v5, "setSendsRemoteHistoryItems:", 0);
    -[SCLSchoolModeCoordinatorConfiguration setSendsRemoteScheduleSettings:](v5, "setSendsRemoteScheduleSettings:", 0);
    -[SCLSchoolModeCoordinatorConfiguration setManuallyManagedOnly:](v5, "setManuallyManagedOnly:", 1);
  }
  -[SCLSchoolModeManager configuration](self, "configuration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "managesSchoolTimeSession");

  if (v35)
  {
    v36 = [SCLSchoolModeServer alloc];
    -[SCLSchoolModeManager queue](self, "queue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeManager supppressionManager](self, "supppressionManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v9;
    v40 = (void *)objc_opt_new();
    v41 = -[SCLSchoolModeServer initWithQueue:suppressionManager:wakeScheduler:](v36, "initWithQueue:suppressionManager:wakeScheduler:", v37, v38, v40);

    v9 = v39;
    -[SCLSchoolModeCoordinatorConfiguration setServer:](v5, "setServer:", v41);
    -[SCLSchoolModeManager interruptBehaviorResolver](self, "interruptBehaviorResolver");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeServer addObserver:](v41, "addObserver:", v42);

  }
  -[SCLSchoolModeCoordinatorConfiguration transportController](v5, "transportController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[SCLSchoolModeManager transportService](self, "transportService");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeCoordinatorConfiguration transportController](v5, "transportController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addTransportController:", v45);

  }
  -[SCLSchoolModeManager queue](self, "queue");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setTargetQueue:](v5, "setTargetQueue:", v46);

  v47 = -[SCLSchoolModeCoordinator initWithConfiguration:]([SCLSchoolModeCoordinator alloc], "initWithConfiguration:", v5);
  -[NSMapTable setObject:forKey:](self->_coordinatorMap, "setObject:forKey:", v47, v6);
  scl_pairing_log();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v6;
    _os_log_impl(&dword_21E4AD000, v48, OS_LOG_TYPE_DEFAULT, "Created pairing for pairingID %@", buf, 0xCu);
  }

}

- (void)handleDevicePairedNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCLSchoolModeManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke;
  v7[3] = &unk_24E29BBB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = _os_activity_create(&dword_21E4AD000, "Handle Device Paired", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v2, &v19);
  scl_pairing_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_21E4AD000, v3, OS_LOG_TYPE_DEFAULT, "Device paired: %@", buf, 0xCu);
  }

  v5 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE6B418]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    scl_pairing_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_1(v5, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "coordinatorMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    scl_pairing_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_2();
LABEL_9:

    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEligibleDevice:", v7))
    objc_msgSend(*(id *)(a1 + 40), "createControllerForDevice:", v7);
  objc_msgSend(*(id *)(a1 + 40), "_updateActivityRegistration");
LABEL_13:

  os_activity_scope_leave(&v19);
}

- (void)handleDeviceUnpairedNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCLSchoolModeManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke;
  v7[3] = &unk_24E29BBB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  os_activity_scope_state_s state;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v34 = _os_activity_create(&dword_21E4AD000, "Handle Device Unpaired", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v34, &state);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE6B418]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "pairingID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    scl_pairing_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo", v34);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v37;
      v51 = 2112;
      v52 = v4;
      _os_log_impl(&dword_21E4AD000, v3, OS_LOG_TYPE_DEFAULT, "Device unpaired: %{public}@ - %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "coordinatorMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeCoordinator:");
    }
    else
    {
      scl_pairing_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v37;
        _os_log_impl(&dword_21E4AD000, v13, OS_LOG_TYPE_DEFAULT, "No coordinator was found for pairingID %{public}@; attempting to manually remove unpaired coordinators",
          buf,
          0xCu);
      }

      v14 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(*(id *)(a1 + 40), "coordinatorMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "keyEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "eligiblePairedDevices");
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v43 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v23, "pairingID", v34);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v18, "removeObject:", v24);
            }
            else
            {
              scl_pairing_log();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v23;
                _os_log_error_impl(&dword_21E4AD000, v25, OS_LOG_TYPE_ERROR, "%@ is missing a pairingID", buf, 0xCu);
              }

            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v20);
      }

      if (objc_msgSend(v18, "count"))
      {
        scl_pairing_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_2();

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v27 = v18;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v39 != v29)
                objc_enumerationMutation(v27);
              v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
              objc_msgSend(*(id *)(a1 + 40), "coordinatorMap", v34);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKey:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(a1 + 40), "removeCoordinator:", v33);
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v28);
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateActivityRegistration", v34);
  }
  else
  {
    scl_pairing_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v35 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_1(a1 + 32, v6, v7, v8, v9, v10, v11, v12);
  }

  os_activity_scope_leave(&state);
}

- (void)removeCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  NSObject *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NRDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_2:
    -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v7);

    scl_pairing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      _os_log_impl(&dword_21E4AD000, v9, OS_LOG_TYPE_DEFAULT, "Removing coordinator for pairingID %{public}@", buf, 0xCu);
    }

    objc_msgSend(v4, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transportController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SCLSchoolModeManager transportService](self, "transportService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeTransportController:", v11);

    }
  }
  else
  {
    scl_pairing_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCLSchoolModeManager removeCoordinator:].cold.2(v4, v13);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
LABEL_11:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v20);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        if (v22 == v4)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          if (v17)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v7 = v20;

      if (v7)
        goto LABEL_2;
    }
    else
    {
LABEL_17:

    }
    scl_pairing_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCLSchoolModeManager removeCoordinator:].cold.1((uint64_t)v4, self, v7);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  SCLSchoolModeClientProxy *v8;
  void *v9;

  v5 = a4;
  -[SCLSchoolModeManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SCLSchoolModeManager queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v7);

  v8 = -[SCLSchoolModeClientProxy initWithConnection:]([SCLSchoolModeClientProxy alloc], "initWithConnection:", v5);
  -[SCLSchoolModeClientProxy setDelegate:](v8, "setDelegate:", self);
  -[SCLSchoolModeManager clients](self, "clients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  objc_msgSend(v5, "resume");
  return 1;
}

- (void)clientProxyDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SCLSchoolModeManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "coordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeClient:", v4);
  -[SCLSchoolModeManager clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)clientProxy:(id)a3 didConnectWithPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  -[SCLSchoolModeManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      SCLAutoUpdatingPairingID();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
      -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectEnumerator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 >= 2)
      {
        scl_pairing_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SCLSchoolModeManager clientProxy:didConnectWithPairingID:].cold.3(v10, v17);

      }
      if (!v10)
      {
LABEL_9:
        scl_pairing_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SCLSchoolModeManager clientProxy:didConnectWithPairingID:].cold.2();

        v10 = 0;
      }
    }
    -[NSObject addClient:](v10, "addClient:", v6);
  }
  else
  {
    scl_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCLSchoolModeManager clientProxy:didConnectWithPairingID:].cold.1(v10, v19, v20, v21, v22, v23, v24, v25);
  }

}

- (id)activityCriteria
{
  xpc_object_t v2;
  int64_t v3;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 1);
  v3 = *MEMORY[0x24BDAC600];
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5B8], *MEMORY[0x24BDAC600]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5D8], v3);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  return v2;
}

- (void)_updateActivityRegistration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SCLSchoolModeManager coordinatorMap](self, "coordinatorMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "configuration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isManuallyManagedOnly");

          v9 &= v12 ^ 1;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);

      if ((v9 & 1) == 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[SCLSchoolModeManager activityCriteria](self, "activityCriteria");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __51__SCLSchoolModeManager__updateActivityRegistration__block_invoke;
    v16[3] = &unk_24E29C1B0;
    v15 = v14;
    v17 = v15;
    objc_copyWeak(&v18, (id *)buf);
    xpc_activity_register("com.apple.schooltime.database.maintenance", (xpc_object_t)*MEMORY[0x24BDAC5A0], v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
    return;
  }
LABEL_10:
  scl_persistence_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "com.apple.schooltime.database.maintenance";
    _os_log_impl(&dword_21E4AD000, v13, OS_LOG_TYPE_DEFAULT, "No tinker-paired devices available. Unregistering %s", buf, 0xCu);
  }

  xpc_activity_unregister("com.apple.schooltime.database.maintenance");
}

void __51__SCLSchoolModeManager__updateActivityRegistration__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  NSObject *v5;
  xpc_object_t v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  _xpc_activity_s *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_handleActivityStarted:", v3);

  }
  else
  {
    scl_persistence_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_DEFAULT, "Checked in with activity %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = xpc_activity_copy_criteria(v3);
    scl_persistence_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_DEFAULT, "using old criteria", (uint8_t *)&v9, 2u);
      }

    }
    else
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_DEFAULT, "Old criteria doesn't exist - setting new criteria", (uint8_t *)&v9, 2u);
      }

      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
    }

  }
}

- (void)_handleActivityStarted:(id)a3
{
  _xpc_activity_s *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _xpc_activity_s *v16;
  _QWORD v17[5];
  _xpc_activity_s *v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _xpc_activity_s *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (_xpc_activity_s *)a3;
  v5 = _os_activity_create(&dword_21E4AD000, "Database Maintenance", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  scl_persistence_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Performing database maintenance: %@", buf, 0xCu);
  }

  if (!xpc_activity_set_state(v4, 4))
  {
    scl_persistence_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCLSchoolModeManager _handleActivityStarted:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  -[SCLSchoolModeManager queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __47__SCLSchoolModeManager__handleActivityStarted___block_invoke;
  v17[3] = &unk_24E29BBB0;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  dispatch_async(v15, v17);

  os_activity_scope_leave(&state);
}

void __47__SCLSchoolModeManager__handleActivityStarted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "coordinatorMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "purgeOldHistoryItems");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  scl_persistence_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21E4AD000, v8, OS_LOG_TYPE_DEFAULT, "Completed database maintenance", v17, 2u);
  }

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    scl_persistence_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __47__SCLSchoolModeManager__handleActivityStarted___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (SCLSchoolModeManagerConfiguration)configuration
{
  return self->_configuration;
}

- (SCLTransportService)transportService
{
  return self->_transportService;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (SCLSuppressSchoolModeAssertionManager)supppressionManager
{
  return self->_supppressionManager;
}

- (SCLInterruptBehaviorResolver)interruptBehaviorResolver
{
  return self->_interruptBehaviorResolver;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)coordinatorMap
{
  return self->_coordinatorMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interruptBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_supppressionManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_transportService, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)createControllerForDevice:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_21E4AD000, v0, OS_LOG_TYPE_FAULT, "No linked IDS device for NRDevice with pairingID %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)createControllerForDevice:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E4AD000, log, OS_LOG_TYPE_DEBUG, "Device is not tinker-paired. Allowing manual SchoolTime", v1, 2u);
  OUTLINED_FUNCTION_6();
}

void __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, a2, a3, "Missing pairingID for device paired notification %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Got pairing notification for pairingID %{public}@ but we already have an SCLDPairing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, a2, a3, "Missing pairingID for device unpaired notification %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Coordinators have no valid pairingID, but were not the unpaired devices: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeCoordinator:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "coordinatorMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_21E4AD000, a3, OS_LOG_TYPE_FAULT, "Coordinator %@ is not in the coordinator map: %@", v5, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)removeCoordinator:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NRDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "%@ is missing a pairingID - %@", v5, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)clientProxy:(uint64_t)a3 didConnectWithPairingID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, a1, a3, "No pairing for client with pairingID %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)clientProxy:didConnectWithPairingID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "No coordinator for pairingID %@. Pending client until pairing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)clientProxy:(void *)a1 didConnectWithPairingID:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NRDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "AutoUpdatingPairingID used when multiple pairings are present. Linking to %@", v6, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

- (void)_handleActivityStarted:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21E4AD000, a1, a3, "Failed to move activity to CONTINUE state", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __47__SCLSchoolModeManager__handleActivityStarted___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21E4AD000, a1, a3, "Failed to move activity to DONE state", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
