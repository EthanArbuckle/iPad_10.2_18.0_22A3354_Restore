@implementation SCLSchoolModeCoordinator

- (SCLSchoolModeCoordinator)initWithConfiguration:(id)a3
{
  id v4;
  SCLSchoolModeCoordinator *v5;
  uint64_t v6;
  SCLSchoolModeCoordinatorConfiguration *configuration;
  NSMutableSet *v8;
  NSMutableSet *clients;
  uint64_t v10;
  NSURL *directoryURL;
  uint64_t v12;
  NSURL *scheduleURL;
  SCLState *v14;
  SCLState *currentState;
  SCLActiveDurationAnalyticsSource *v16;
  SCLActiveDurationAnalyticsSource *activeDurationAnalyticsSource;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id location;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SCLSchoolModeCoordinator;
  v5 = -[SCLSchoolModeCoordinator init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SCLSchoolModeCoordinatorConfiguration *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    clients = v5->_clients;
    v5->_clients = v8;

    -[SCLSchoolModeCoordinatorConfiguration directoryURL](v5->_configuration, "directoryURL");
    v10 = objc_claimAutoreleasedReturnValue();
    directoryURL = v5->_directoryURL;
    v5->_directoryURL = (NSURL *)v10;

    -[NSURL URLByAppendingPathComponent:](v5->_directoryURL, "URLByAppendingPathComponent:", CFSTR("ScheduleSettings.dat"));
    v12 = objc_claimAutoreleasedReturnValue();
    scheduleURL = v5->_scheduleURL;
    v5->_scheduleURL = (NSURL *)v12;

    v14 = -[SCLState initWithActiveState:scheduleEnabled:inSchedule:]([SCLState alloc], "initWithActiveState:scheduleEnabled:inSchedule:", 0, 0, 0);
    currentState = v5->_currentState;
    v5->_currentState = v14;

    v16 = -[SCLActiveDurationAnalyticsSource initWithInitialState:]([SCLActiveDurationAnalyticsSource alloc], "initWithInitialState:", v5->_currentState);
    activeDurationAnalyticsSource = v5->_activeDurationAnalyticsSource;
    v5->_activeDurationAnalyticsSource = v16;

    objc_msgSend(v4, "server");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "addObserver:", v5);
    -[SCLSchoolModeCoordinatorConfiguration transportController](v5->_configuration, "transportController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v5);

    -[SCLSchoolModeCoordinator _createSchoolTimeDirectoryIfNeeded](v5, "_createSchoolTimeDirectoryIfNeeded");
    -[SCLSchoolModeCoordinator _registerForFirstUnlockIfNeeded](v5, "_registerForFirstUnlockIfNeeded");
    objc_initWeak(&location, v5);
    objc_msgSend(v4, "targetQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v23, &location);
    v5->_stateHandle = os_state_add_handler();

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v5;
}

uint64_t __50__SCLSchoolModeCoordinator_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "stateDataWithHints:", a2);

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int firstUnlockToken;
  objc_super v6;

  -[SCLSchoolModeCoordinator _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObserver:", self);
  objc_msgSend(v4, "invalidate");
  firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1)
    notify_cancel(firstUnlockToken);
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)SCLSchoolModeCoordinator;
  -[SCLSchoolModeCoordinator dealloc](&v6, sel_dealloc);
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  os_state_data_s *v18;
  _QWORD v20[4];
  id v21;
  SCLSchoolModeCoordinator *v22;

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "NRDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairingID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "appendObject:withName:", v9, CFSTR("pairingID"));

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIDOverride");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v6, "appendObject:withName:", v13, CFSTR("IDSDeviceID"));

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __47__SCLSchoolModeCoordinator_stateDataWithHints___block_invoke;
  v20[3] = &unk_24E29BBB0;
  v21 = v6;
  v22 = self;
  v15 = v6;
  objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v20);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SCLSchooolModeCoordinator %p"), self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (os_state_data_s *)SCLSStateDataWithTitleDescriptionAndHints(v16, (uint64_t)v17);

  return v18;
}

void __47__SCLSchoolModeCoordinator_stateDataWithHints___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "persistentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("schedule"));

  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "appendObject:withName:", v10, CFSTR("serverState"));

  }
}

- (void)_createSchoolTimeDirectoryIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "Could not create SchoolTime folder at %@; %@");
  OUTLINED_FUNCTION_2();
}

- (void)_lock_loadPersistentSchedule
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to load schedule settings from data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_requestRemoteScheduleSettingsIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E4AD000, v0, v1, "Already requested schedule settings for pairingID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_classCDataIsAvailable
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int firstUnlockToken;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint8_t v15[16];

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  scl_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_INFO, "Class C Data is available", v15, 2u);
  }

  self->_hasReceivedFirstUnlock = 1;
  firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1)
  {
    notify_cancel(firstUnlockToken);
    self->_firstUnlockToken = -1;
  }
  -[SCLSchoolModeCoordinator _lock_loadPersistentSchedule](self, "_lock_loadPersistentSchedule");
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "historyStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadStore");

  -[SCLSchoolModeCoordinator persistentSettings](self, "persistentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "scheduleSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sendsRemoteScheduleSettings");

  if (v14)
    -[SCLSchoolModeCoordinator activateSettingsSyncCoordinatorWithSettings:](self, "activateSettingsSyncCoordinatorWithSettings:", v12);
  -[SCLSchoolModeCoordinator _updateClientsWithSchedule:notify:](self, "_updateClientsWithSchedule:notify:", v12, 0);
  objc_msgSend(v11, "startWithScheduleSettings:shouldStartManuallyActive:", v12, objc_msgSend(v9, "isManualSchoolModeEnabled"));
  self->_ready = 1;

}

- (void)activateSettingsSyncCoordinatorWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SCLSettingsSyncCoordinator *v9;
  SCLSettingsSyncCoordinator *settingsSyncCoordinator;
  void *v11;
  void *v12;
  SCLSettingsSyncCoordinator *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NRDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SCLSettingsSyncCoordinator initWithFileURL:pairingID:schedule:queue:]([SCLSettingsSyncCoordinator alloc], "initWithFileURL:pairingID:schedule:queue:", self->_directoryURL, v16, v4, v8);
  settingsSyncCoordinator = self->_settingsSyncCoordinator;
  self->_settingsSyncCoordinator = v9;

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transportController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSettingsSyncCoordinator:", self->_settingsSyncCoordinator);

  v13 = self->_settingsSyncCoordinator;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transportController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncCoordinator setTransport:](v13, "setTransport:", v15);

  -[SCLSettingsSyncCoordinator activate](self->_settingsSyncCoordinator, "activate");
}

- (void)_checkIfClassCDataIsAvailable
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E4AD000, log, OS_LOG_TYPE_DEBUG, "Device has been unlocked. Immediately handling classC data", v1, 2u);
}

- (void)_registerForFirstUnlockIfNeeded
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "Could not register for first unlock notifications: %@", buf, 0xCu);

}

void __59__SCLSchoolModeCoordinator__registerForFirstUnlockIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  dispatch_block_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  scl_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  scl_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SchoolTimeMobileKeybagUnlock", (const char *)&unk_21E4DC639, buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SCLSchoolModeCoordinator__registerForFirstUnlockIfNeeded__block_invoke_33;
  block[3] = &unk_24E29BB40;
  v7 = WeakRetained;
  v12 = v7;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), v8);
  scl_framework_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v10, OS_SIGNPOST_INTERVAL_END, v3, "SchoolTimeMobileKeybagUnlock", (const char *)&unk_21E4DC639, buf, 2u);
  }

}

void __59__SCLSchoolModeCoordinator__registerForFirstUnlockIfNeeded__block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  scl_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  scl_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SchoolTimeClassCAvailable", (const char *)&unk_21E4DC639, buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_classCDataIsAvailable");
  scl_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v7, OS_SIGNPOST_INTERVAL_END, v3, "SchoolTimeClassCAvailable", (const char *)&unk_21E4DC639, v8, 2u);
  }

}

- (void)addClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  v4 = a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v4, "setCoordinator:", self);
  -[SCLSchoolModeCoordinator _checkIfClassCDataIsAvailable](self, "_checkIfClassCDataIsAvailable");
  -[SCLSchoolModeCoordinator clients](self, "clients");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  v4 = a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v4, "setCoordinator:", 0);
  -[SCLSchoolModeCoordinator clients](self, "clients");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

}

- (BOOL)applySchedule:(id)a3 error:(id *)a4
{
  return -[SCLSchoolModeCoordinator applySchedule:forInitialSync:error:](self, "applySchedule:forInitialSync:error:", a3, 0, a4);
}

- (BOOL)applySchedule:(id)a3 forInitialSync:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v6 = a4;
  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_msgSend(v8, "copy");
  if (self->_hasReceivedFirstUnlock)
  {
    if (v6
      && (-[SCLPersistentSettings scheduleSettings](self->_persistentSettings, "scheduleSettings"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "schedule"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()),
          v13,
          v12,
          (v14 & 1) == 0))
    {
      if (a5)
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        v38 = *MEMORY[0x24BDD0FC8];
        v39 = CFSTR("Cannot overwrite existing schedule for initial sync.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v29;
        v27 = 7;
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v11, "schedule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isValid");

      if (v16)
      {
        scl_persistence_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[SCLSchoolModeCoordinator applySchedule:forInitialSync:error:].cold.1();

        v31 = MEMORY[0x24BDAC760];
        v32 = 3221225472;
        v33 = __63__SCLSchoolModeCoordinator_applySchedule_forInitialSync_error___block_invoke;
        v34 = &unk_24E29BE88;
        v18 = v11;
        v35 = v18;
        -[SCLSchoolModeCoordinator _lock_updatePersistentSettingsWithBlock:](self, "_lock_updatePersistentSettingsWithBlock:", &v31);
        -[SCLSchoolModeCoordinator server](self, "server", v31, v32, v33, v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "applySchedule:", v18);

        -[SCLSchoolModeCoordinator configuration](self, "configuration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "sendsRemoteScheduleSettings");

        if (v21 && !v6)
        {
          -[SCLSchoolModeCoordinator settingsSyncCoordinator](self, "settingsSyncCoordinator");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "applySchedule:", v18);

        }
        v23 = 1;
        -[SCLSchoolModeCoordinator _updateClientsWithSchedule:notify:](self, "_updateClientsWithSchedule:notify:", v18, 1);
        v24 = v35;
        goto LABEL_18;
      }
      if (a5)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v36 = *MEMORY[0x24BDD0FC8];
        v37 = CFSTR("The schedule is invalid");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v28;
        v27 = 3;
        goto LABEL_17;
      }
    }
LABEL_19:
    v23 = 0;
    goto LABEL_20;
  }
  if (!a5)
    goto LABEL_19;
  v25 = (void *)MEMORY[0x24BDD1540];
  v40 = *MEMORY[0x24BDD0FC8];
  v41[0] = CFSTR("Schedule cannot be set before first unlock.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = 6;
LABEL_17:
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), v27, v24);
  v23 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_20:
  return v23;
}

uint64_t __63__SCLSchoolModeCoordinator_applySchedule_forInitialSync_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScheduleSettings:", *(_QWORD *)(a1 + 32));
}

- (void)_updateClientsWithSchedule:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SCLSchoolModeCoordinator clients](self, "clients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "didUpdateScheduleSettings:notify:", v6, v4, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SCLSchoolModeCoordinator historyStore](self, "historyStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "insertItem:", v13);

  v6[2](v6, v10, 0);
  -[SCLSchoolModeCoordinator _noteHistoryDidUpdate](self, "_noteHistoryDidUpdate");
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "sendsRemoteHistoryItems");

  if ((_DWORD)v9)
  {
    -[SCLSchoolModeCoordinator transportController](self, "transportController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addUnlockHistoryItem:", v13);

  }
}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void (**)(_QWORD))a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SCLSchoolModeCoordinator historyStore](self, "historyStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentHistoryItems");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)v8;
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v9;
  v4[2](v4);

}

- (BOOL)setActive:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6;
  _BOOL8 v7;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v20[1] = *MEMORY[0x24BDAC8D0];
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[SCLSchoolModeCoordinator server](self, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) != 0 && v7 && (objc_msgSend(v12, "isInSchedule") & 1) == 0)
  {
    if (!a5)
    {
      v16 = 0;
      goto LABEL_12;
    }
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("Activation was rejected because Schooltime is no longer in schedule.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), 8, v15);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SCLSchoolModeCoordinator server](self, "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", v7);

    -[SCLSchoolModeCoordinator configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "NRDevice");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 1;
    if (v7 && v15 && !objc_msgSend(v12, "activeState") && (objc_msgSend(v12, "isInSchedule") & 1) == 0)
    {
      v15 = v15;
      v18 = v12;
      AnalyticsSendEventLazy();

    }
  }

LABEL_12:
  return v16;
}

id __52__SCLSchoolModeCoordinator_setActive_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("isAltAccount");
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B340]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("scheduleEnabled");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isScheduleEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deleteHistoryWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SCLSchoolModeCoordinator historyStore](self, "historyStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = objc_msgSend(v7, "deleteHistory:", &v10);
  v9 = v10;

  v4[2](v4, v8, v9);
  -[SCLSchoolModeCoordinator _noteHistoryDidUpdate](self, "_noteHistoryDidUpdate");
}

- (void)purgeOldHistoryItems
{
  void *v3;
  NSObject *v4;
  id v5;

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SCLSchoolModeCoordinator historyStore](self, "historyStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeOldItems");

}

- (void)_noteHistoryDidUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)-[NSMutableSet copy](self->_clients, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "unlockHistoryDidChange", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_lock_updatePersistentSettingsWithBlock:(id)a3
{
  void (**v4)(id, SCLPersistentSettings *);
  void *v5;
  NSObject *v6;
  uint64_t v7;
  SCLPersistentSettings *v8;
  void *v9;
  SCLPersistentSettings *persistentSettings;

  v4 = (void (**)(id, SCLPersistentSettings *))a3;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SCLSchoolModeCoordinator persistentSettings](self, "persistentSettings");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (SCLPersistentSettings *)objc_msgSend((id)v7, "copy");

  v4[2](v4, v8);
  -[SCLSchoolModeCoordinator persistentSettings](self, "persistentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = -[SCLPersistentSettings isEqual:](v8, "isEqual:", v9);

  if ((v7 & 1) == 0)
    -[SCLSchoolModeCoordinator _persistSettings:](self, "_persistSettings:", v8);
  persistentSettings = self->_persistentSettings;
  self->_persistentSettings = v8;

}

- (void)_persistSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSURL *scheduleURL;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  scl_persistence_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SCLSchoolModeCoordinator _persistSettings:].cold.3(v4, v7);

  if (!v5)
  {
    scl_persistence_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCLSchoolModeCoordinator _persistSettings:].cold.1();
    v10 = v6;
    goto LABEL_10;
  }
  scheduleURL = self->_scheduleURL;
  v12 = v6;
  v9 = objc_msgSend(v5, "writeToURL:options:error:", scheduleURL, 1073741825, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    scl_persistence_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCLSchoolModeCoordinator _persistSettings:].cold.2();
LABEL_10:

  }
}

- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
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
  SCLUnlockHistoryItem *v27;
  SCLUnlockHistoryItem *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  SCLUnlockHistoryItem *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  SCLUnlockHistoryItem *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_storeStrong((id *)&self->_currentState, a4);
  -[SCLSchoolModeCoordinator clients](self, "clients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  -[SCLSchoolModeCoordinator pendingUnlockItem](self, "pendingUnlockItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else if (SCLIsStateTransitionStartOfUnlockPeriod(v9, v8))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLPersistentSettings scheduleSettings](self->_persistentSettings, "scheduleSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recurrenceForActiveScheduleOnOrAfterDate:calendar:", v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "timeInterval");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startTime");
      v61 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "timeInterval");
      v58 = v17;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v15, 0.0);
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v57 = v15;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v16;
      v27 = -[SCLUnlockHistoryItem initWithInterval:calendar:timeZone:startTime:endTime:]([SCLUnlockHistoryItem alloc], "initWithInterval:calendar:timeZone:startTime:endTime:", v24, v16, v25, v21, v23);
      -[SCLSchoolModeCoordinator setPendingUnlockItem:](self, "setPendingUnlockItem:", v27);

      v16 = v26;
      v15 = v57;

      v17 = v58;
      v19 = v61;
    }
    else
    {
      scl_framework_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v17, "schedule");
        v53 = v15;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "recurrences");
        v60 = v17;
        v55 = v16;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v72 = v53;
        v73 = 2112;
        v74 = v55;
        v75 = 2112;
        v76 = v56;
        _os_log_fault_impl(&dword_21E4AD000, v45, OS_LOG_TYPE_FAULT, "Failed to find active schedule recurrence for unlock period at date %@ in calendar %@: %@", buf, 0x20u);

        v15 = v53;
        v16 = v55;
        v17 = v60;
      }

    }
LABEL_15:
    v28 = 0;
    goto LABEL_16;
  }
  -[SCLSchoolModeCoordinator pendingUnlockItem](self, "pendingUnlockItem");
  v28 = (SCLUnlockHistoryItem *)objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_16;
  v29 = SCLIsStateTransitionEndOfUnlockPeriod(v9, v8);

  if (!v29)
    goto LABEL_15;
  -[SCLSchoolModeCoordinator pendingUnlockItem](self, "pendingUnlockItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "unlockedInterval");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceDate:", v33);
  v35 = v34;

  if (v35 < 0.0)
    v35 = 0.0;
  v36 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(v30, "unlockedInterval");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "startDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v36, "initWithStartDate:duration:", v38, v35);

  v39 = [SCLUnlockHistoryItem alloc];
  objc_msgSend(v30, "calendar");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeZone");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "scheduleStartTime");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "scheduleEndTime");
  v42 = v8;
  v43 = v13;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SCLUnlockHistoryItem initWithInterval:calendar:timeZone:startTime:endTime:](v39, "initWithInterval:calendar:timeZone:startTime:endTime:", v62, v59, v40, v41, v44);

  v13 = v43;
  v8 = v42;

  -[SCLSchoolModeCoordinator setPendingUnlockItem:](self, "setPendingUnlockItem:", 0);
LABEL_16:
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __60__SCLSchoolModeCoordinator_server_didUpdateState_fromState___block_invoke;
  v68[3] = &unk_24E29BE88;
  v46 = v8;
  v69 = v46;
  -[SCLSchoolModeCoordinator _lock_updatePersistentSettingsWithBlock:](self, "_lock_updatePersistentSettingsWithBlock:", v68);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v47 = v13;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v65 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "didUpdateState:fromState:", v46, v9, v57);
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v49);
  }

  if (v28)
  {
    -[SCLSchoolModeCoordinator addUnlockHistoryItem:completion:](self, "addUnlockHistoryItem:completion:", v28, &__block_literal_global_7);
    v63 = v28;
    AnalyticsSendEventLazy();

  }
  -[SCLSchoolModeCoordinator activeDurationAnalyticsSource](self, "activeDurationAnalyticsSource", v57);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setCurrentState:", v46);

}

void __60__SCLSchoolModeCoordinator_server_didUpdateState_fromState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
    v3 = objc_msgSend(*(id *)(a1 + 32), "isInSchedule") ^ 1;
  else
    v3 = 0;
  objc_msgSend(v4, "setManualSchoolModeEnabled:", v3);

}

id __60__SCLSchoolModeCoordinator_server_didUpdateState_fromState___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("UnlockDuration");
  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "unlockedInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  *(float *)&v3 = v3;
  *(float *)&v3 = roundf(*(float *)&v3);
  objc_msgSend(v1, "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SCLScheduleSettings)scheduleSettings
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SCLPersistentSettings scheduleSettings](self->_persistentSettings, "scheduleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return (SCLScheduleSettings *)v6;
}

- (void)transportController:(id)a3 didReceiveSchedule:(id)a4 forInitialSync:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v5 = a5;
  v7 = a4;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "targetQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v13 = 0;
  LOBYTE(v8) = -[SCLSchoolModeCoordinator applySchedule:forInitialSync:error:](self, "applySchedule:forInitialSync:error:", v7, v5, &v13);
  v10 = v13;
  scl_transport_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SCLSchoolModeCoordinator transportController:didReceiveSchedule:forInitialSync:].cold.1();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[SCLSchoolModeCoordinator transportController:didReceiveSchedule:forInitialSync:].cold.2();
  }

}

- (void)transportController:(id)a3 didReceiveUnlockHistoryItem:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  -[SCLSchoolModeCoordinator configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke;
  v9[3] = &unk_24E29BF20;
  v10 = v5;
  v8 = v5;
  -[SCLSchoolModeCoordinator addUnlockHistoryItem:completion:](self, "addUnlockHistoryItem:completion:", v8, v9);

}

void __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  scl_transport_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (id)transportController
{
  return -[SCLSchoolModeCoordinatorConfiguration transportController](self->_configuration, "transportController");
}

- (id)nrDevice
{
  return -[SCLSchoolModeCoordinatorConfiguration NRDevice](self->_configuration, "NRDevice");
}

- (id)idsDevice
{
  return -[SCLSchoolModeCoordinatorConfiguration idsDevice](self->_configuration, "idsDevice");
}

- (id)server
{
  return -[SCLSchoolModeCoordinatorConfiguration server](self->_configuration, "server");
}

- (id)historyStore
{
  return -[SCLSchoolModeCoordinatorConfiguration historyStore](self->_configuration, "historyStore");
}

- (id)_configuration
{
  return self->_configuration;
}

- (SCLSchoolModeCoordinatorConfiguration)configuration
{
  return self->_configuration;
}

- (SCLState)currentState
{
  return self->_currentState;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSURL)scheduleURL
{
  return self->_scheduleURL;
}

- (SCLUnlockHistoryItem)pendingUnlockItem
{
  return self->_pendingUnlockItem;
}

- (void)setPendingUnlockItem:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUnlockItem, a3);
}

- (SCLPersistentSettings)persistentSettings
{
  return self->_persistentSettings;
}

- (void)setPersistentSettings:(id)a3
{
  objc_storeStrong((id *)&self->_persistentSettings, a3);
}

- (SCLSettingsSyncCoordinator)settingsSyncCoordinator
{
  return self->_settingsSyncCoordinator;
}

- (void)setSettingsSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_settingsSyncCoordinator, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (SCLActiveDurationAnalyticsSource)activeDurationAnalyticsSource
{
  return self->_activeDurationAnalyticsSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDurationAnalyticsSource, 0);
  objc_storeStrong((id *)&self->_settingsSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentSettings, 0);
  objc_storeStrong((id *)&self->_pendingUnlockItem, 0);
  objc_storeStrong((id *)&self->_scheduleURL, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)applySchedule:forInitialSync:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E4AD000, v0, v1, "Apply schedule: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_persistSettings:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "Failed to create data for settings: %@ %@");
  OUTLINED_FUNCTION_2();
}

- (void)_persistSettings:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to write data for schedule: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_persistSettings:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "isManualSchoolModeEnabled");
  objc_msgSend(a1, "scheduleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_DEBUG, "Persist settings - manualSchoolModeEnabled: %{BOOL}u; schedule: %@",
    (uint8_t *)v6,
    0x12u);

}

- (void)transportController:didReceiveSchedule:forInitialSync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E4AD000, v0, v1, "Applied remote schedule: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)transportController:didReceiveSchedule:forInitialSync:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "Failed to apply schedule %@ from remote source with error: %@");
  OUTLINED_FUNCTION_2();
}

void __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21E4AD000, a2, a3, "Added remote history item: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to add incoming remote history item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
