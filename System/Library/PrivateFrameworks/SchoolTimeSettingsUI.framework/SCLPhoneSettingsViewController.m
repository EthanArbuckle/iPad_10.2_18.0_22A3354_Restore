@implementation SCLPhoneSettingsViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SCLPhoneSettingsViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPhoneSettingsViewController endObservingViewModel:](self, "endObservingViewModel:", v3);

  v4.receiver = self;
  v4.super_class = (Class)SCLPhoneSettingsViewController;
  -[SCLListViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLPhoneSettingsViewController;
  -[SCLPhoneSettingsViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SCLPhoneSettingsViewController schoolMode](self, "schoolMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteSignificantUserInteraction");

  if (!-[SCLPhoneSettingsViewController isObservingApplicationLifecycle](self, "isObservingApplicationLifecycle"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

    -[SCLPhoneSettingsViewController setObservingApplicationLifecycle:](self, "setObservingApplicationLifecycle:", 1);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCLPhoneSettingsViewController;
  -[SCLPhoneSettingsViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[SCLPhoneSettingsViewController isObservingApplicationLifecycle](self, "isObservingApplicationLifecycle"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);

    -[SCLPhoneSettingsViewController setObservingApplicationLifecycle:](self, "setObservingApplicationLifecycle:", 0);
  }
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCLPhoneSettingsViewController;
  v4 = a3;
  -[SCLPhoneSettingsViewController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("COSAssociatedDevice"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCLPhoneSettingsViewController setDevice:](self, "setDevice:", v5);
  }
  else if (v5)
  {
    scl_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCLPhoneSettingsViewController setSpecifier:].cold.1((uint64_t)v5, v6);

  }
}

- (NRDevice)device
{
  NRDevice *device;
  void *v4;
  void *v5;
  void *v6;
  NRDevice *v7;
  NRDevice *v8;

  device = self->_device;
  if (!device)
  {
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (NRDevice *)objc_claimAutoreleasedReturnValue();
    v8 = self->_device;
    self->_device = v7;

    device = self->_device;
  }
  return device;
}

- (void)loadSchoolModeIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  SCLSchoolMode *v11;
  SCLSchoolMode *schoolMode;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!self->_schoolMode)
  {
    -[SCLPhoneSettingsViewController device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global_1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      scl_framework_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        -[SCLPhoneSettingsViewController specifier](self, "specifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "propertyForKey:", CFSTR("COSAssociatedDevice"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v3;
        v17 = 2112;
        v18 = v14;
        v19 = 2112;
        v20 = v7;
        _os_log_fault_impl(&dword_22151E000, v8, OS_LOG_TYPE_FAULT, "Selected device is not a Tinker device: %@; Specifier Device: %@;\n%@",
          (uint8_t *)&v15,
          0x20u);

      }
    }
    objc_msgSend(v3, "pairingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BE84210]);
      objc_msgSend(v10, "setIdentifier:", CFSTR("SchoolTimeSettings"));
      objc_msgSend(v10, "setPairingID:", v9);
      objc_msgSend(v10, "setLoadsSynchronously:", 1);
      v11 = (SCLSchoolMode *)objc_msgSend(objc_alloc(MEMORY[0x24BE84208]), "initWithConfiguration:", v10);
      schoolMode = self->_schoolMode;
      self->_schoolMode = v11;

      -[SCLSchoolMode resume](self->_schoolMode, "resume");
    }

  }
}

uint64_t __56__SCLPhoneSettingsViewController_loadSchoolModeIfNeeded__block_invoke()
{
  return 1;
}

- (void)loadSpecifierSource
{
  void *v3;
  void *v4;
  SCLSettingsViewModel *v5;
  void *v6;
  SCLSpecifierDataSource *v7;
  SCLActiveSpecifierDataSource *v8;
  SCLHistoryDaysDataSource *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SCLActiveSpecifierDataSource *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  -[SCLPhoneSettingsViewController loadSchoolModeIfNeeded](self, "loadSchoolModeIfNeeded");
  -[SCLPhoneSettingsViewController schoolMode](self, "schoolMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SCLPhoneSettingsViewController schoolMode](self, "schoolMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleSettings");
    v5 = (SCLSettingsViewModel *)objc_claimAutoreleasedReturnValue();

    -[SCLPhoneSettingsViewController setScheduleSettings:](self, "setScheduleSettings:", v5);
    -[SCLPhoneSettingsViewController viewModelForSettings:](self, "viewModelForSettings:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLPhoneSettingsViewController setViewModel:](self, "setViewModel:", v6);
    -[SCLPhoneSettingsViewController beginObservingViewModel:](self, "beginObservingViewModel:", v6);
    v7 = -[SCLSpecifierDataSource initWithListController:viewModel:]([SCLSpecifierDataSource alloc], "initWithListController:viewModel:", self, v6);
    -[SCLSpecifierDataSource setActive:](v7, "setActive:", 1);
    v8 = -[SCLActiveSpecifierDataSource initWithListController:viewModel:]([SCLActiveSpecifierDataSource alloc], "initWithListController:viewModel:", self, v6);
    -[SCLSpecifierDataSource setActive:](v8, "setActive:", 1);
    -[SCLPhoneSettingsViewController setActiveSpecifierSource:](self, "setActiveSpecifierSource:", v8);
    v9 = -[SCLHistoryDaysDataSource initWithListController:viewModel:]([SCLHistoryDaysDataSource alloc], "initWithListController:viewModel:", self, v6);
    -[SCLSpecifierDataSource setActive:](v9, "setActive:", 1);
    v19[0] = v8;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSpecifierDataSource setChildDataSources:](v7, "setChildDataSources:", v10);

    -[SCLListViewController setSpecifierSource:](self, "setSpecifierSource:", v7);
    -[SCLPhoneSettingsViewController schoolMode](self, "schoolMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke;
    v16[3] = &unk_24E712248;
    v17 = v6;
    v12 = v6;
    objc_msgSend(v11, "fetchRecentUnlockHistoryItemsWithCompletion:", v16);

  }
  else
  {
    v5 = objc_alloc_init(SCLSettingsViewModel);
    v7 = -[SCLSpecifierDataSource initWithListController:viewModel:]([SCLSpecifierDataSource alloc], "initWithListController:viewModel:", self, v5);
    -[SCLSpecifierDataSource setActive:](v7, "setActive:", 1);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SCHOOLTIME_UNAVAILABLE_GROUP"));
    v8 = (SCLActiveSpecifierDataSource *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SCHOOLTIME_UNAVAILABLE_ERROR"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
    v9 = (SCLHistoryDaysDataSource *)objc_claimAutoreleasedReturnValue();

    if (os_variant_has_internal_ui())
    {
      -[SCLHistoryDaysDataSource stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("\n\n[Internal Only]\nBridge should have provided an NRDevice and users should not be able to reach the Schooltime settings UI in this state. See <rdar://problem/66326901>"));
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (SCLHistoryDaysDataSource *)v14;
    }
    -[SCLActiveSpecifierDataSource setProperty:forKey:](v8, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);
    v18 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSpecifierDataSource setSpecifiers:](v7, "setSpecifiers:", v15);

    -[SCLListViewController setSpecifierSource:](self, "setSpecifierSource:", v7);
  }

}

void __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  scl_framework_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_cold_1((uint64_t)v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v13 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_22151E000, v8, OS_LOG_TYPE_INFO, "Fetched %d history items", buf, 8u);
  }

  if (objc_msgSend(v5, "count"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_22;
    v9[3] = &unk_24E712220;
    v10 = *(id *)(a1 + 32);
    v11 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
}

uint64_t __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_22(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHistoryItems:", *(_QWORD *)(a1 + 40));
  return SCLLogHistoryViewed();
}

- (id)viewModelForSettings:(id)a3
{
  id v3;
  SCLSettingsViewModel *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SCLSettingsViewModel *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(SCLSettingsViewModel);
  -[SCLSettingsViewModel setEnabled:](v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_msgSend(v3, "schedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "scheduledDays");
  objc_msgSend(v5, "uniformTimeIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "SCL_nonWeekendDays");

      if (v6 == 127)
      {
        -[SCLSettingsViewModel setScheduleType:](v4, "setScheduleType:", 1);
        v11 = v4;
        v12 = 127;
      }
      else
      {
        if (v6 != v10)
        {
          -[SCLSettingsViewModel setScheduleType:](v4, "setScheduleType:", 3);
          goto LABEL_11;
        }
        -[SCLSettingsViewModel setScheduleType:](v4, "setScheduleType:", 2);
        v11 = v4;
        v12 = v6;
      }
      -[SCLSettingsViewModel setRepeatSchedule:](v11, "setRepeatSchedule:", v12);
LABEL_11:
      v23 = objc_alloc(MEMORY[0x24BE841D8]);
      objc_msgSend(v5, "recurrences");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithRecurrences:", v24);
      -[SCLSettingsViewModel setCustomSchedule:](v4, "setCustomSchedule:", v25);

      -[SCLSettingsViewModel setTimeIntervals:](v4, "setTimeIntervals:", v8);
      goto LABEL_12;
    }
    -[SCLSettingsViewModel setScheduleType:](v4, "setScheduleType:", 3);
    v18 = objc_alloc(MEMORY[0x24BE841D8]);
    objc_msgSend(v5, "recurrences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithRecurrences:", v19);
    -[SCLSettingsViewModel setCustomSchedule:](v4, "setCustomSchedule:", v20);

    +[SCLTimeIntervalModel defaultTimeInterval](SCLTimeIntervalModel, "defaultTimeInterval");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCLSettingsViewModel setTimeIntervals:](v4, "setTimeIntervals:", v22);
  }
  else
  {
    +[SCLTimeIntervalModel defaultTimeInterval](SCLTimeIntervalModel, "defaultTimeInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "SCL_nonWeekendDays");

    -[SCLSettingsViewModel setScheduleType:](v4, "setScheduleType:", 2);
    -[SCLSettingsViewModel setRepeatSchedule:](v4, "setRepeatSchedule:", v16);
    -[SCLSettingsViewModel setTimeIntervals:](v4, "setTimeIntervals:", v14);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841D8]), "initWithTimeIntervals:repeatSchedule:", v14, v16);
    -[SCLSettingsViewModel setCustomSchedule:](v4, "setCustomSchedule:", v17);

  }
LABEL_12:

  return v4;
}

- (void)beginObservingViewModel:(id)a3
{
  id v4;

  v4 = a3;
  -[SCLPhoneSettingsViewController setObservingViewModel:](self, "setObservingViewModel:", 1);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("enabled"), 3, kScheduleContext);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("scheduleType"), 3, kScheduleContext);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("customSchedule"), 3, kScheduleContext);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("repeatSchedule"), 3, kScheduleContext);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeIntervals"), 3, kScheduleContext);

}

- (void)endObservingViewModel:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SCLPhoneSettingsViewController isObservingViewModel](self, "isObservingViewModel"))
  {
    -[SCLPhoneSettingsViewController setObservingViewModel:](self, "setObservingViewModel:", 0);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("enabled"), kScheduleContext);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("scheduleType"), kScheduleContext);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("customSchedule"), kScheduleContext);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("repeatSchedule"), kScheduleContext);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("timeIntervals"), kScheduleContext);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  if ((void *)kScheduleContext == a6)
  {
    v11 = *MEMORY[0x24BDD0E70];
    v12 = a5;
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqual:", v13) & 1) == 0)
      -[SCLPhoneSettingsViewController scheduleDidChange](self, "scheduleDidChange");

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SCLPhoneSettingsViewController;
    v10 = a5;
    -[SCLListViewController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_22151E000, "ApplicationDidBecomeActive", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  scl_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22151E000, v6, OS_LOG_TYPE_DEFAULT, "ApplicationDidBecomeActive", v8, 2u);
  }

  -[SCLPhoneSettingsViewController schoolMode](self, "schoolMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "noteSignificantUserInteraction");

  os_activity_scope_leave(&state);
}

- (void)scheduleDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  scl_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22151E000, v3, OS_LOG_TYPE_DEFAULT, "Schedule did change", v4, 2u);
  }

  -[SCLPhoneSettingsViewController updateSchedule](self, "updateSchedule");
}

- (void)updateSchedule
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  scl_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_22151E000, v3, OS_LOG_TYPE_DEFAULT, "Commit schedule update if needed", (uint8_t *)&buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BE841D0];
  -[SCLPhoneSettingsViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleSettingsWithViewModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLPhoneSettingsViewController scheduleSettings](self, "scheduleSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    scl_framework_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_22151E000, v9, OS_LOG_TYPE_DEFAULT, "Updated schedule: %@", (uint8_t *)&buf, 0xCu);
    }

    -[SCLPhoneSettingsViewController setScheduleSettings:](self, "setScheduleSettings:", v6);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = *MEMORY[0x24BDF7608];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke;
    v16[3] = &unk_24E712270;
    v16[4] = &buf;
    v12 = objc_msgSend(v10, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Commit Schooltime Schedule"), v16);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v12;

    -[SCLPhoneSettingsViewController schoolMode](self, "schoolMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_55;
    v15[3] = &unk_24E712298;
    v15[4] = &buf;
    objc_msgSend(v13, "applyScheduleSettings:completion:", v6, v15);

    -[SCLPhoneSettingsViewController viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SCLLogViewModelCommit(v14, v6);

    _Block_object_dispose(&buf, 8);
  }

}

void __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  scl_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_cold_1(v2);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BDF7608];
}

void __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_55(uint64_t a1, int a2, void *a3)
{
  id v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
    v6 = OS_LOG_TYPE_INFO;
  else
    v6 = OS_LOG_TYPE_ERROR;
  scl_framework_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, v6))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_22151E000, v7, v6, "Applied settings: %{BOOL}u; %@", (uint8_t *)v9, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (SCLSchoolMode)schoolMode
{
  return self->_schoolMode;
}

- (void)setSchoolMode:(id)a3
{
  objc_storeStrong((id *)&self->_schoolMode, a3);
}

- (SCLActiveSpecifierDataSource)activeSpecifierSource
{
  return self->_activeSpecifierSource;
}

- (void)setActiveSpecifierSource:(id)a3
{
  objc_storeStrong((id *)&self->_activeSpecifierSource, a3);
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleSettings, a3);
}

- (BOOL)isObservingViewModel
{
  return self->_observingViewModel;
}

- (void)setObservingViewModel:(BOOL)a3
{
  self->_observingViewModel = a3;
}

- (BOOL)isObservingApplicationLifecycle
{
  return self->_observingApplicationLifecycle;
}

- (void)setObservingApplicationLifecycle:(BOOL)a3
{
  self->_observingApplicationLifecycle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_activeSpecifierSource, 0);
  objc_storeStrong((id *)&self->_schoolMode, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setSpecifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_22151E000, a2, OS_LOG_TYPE_FAULT, "Associated device is not an NRDevice: %@", (uint8_t *)&v2, 0xCu);
}

void __53__SCLPhoneSettingsViewController_loadSpecifierSource__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22151E000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch items with error %@", (uint8_t *)&v2, 0xCu);
}

void __48__SCLPhoneSettingsViewController_updateSchedule__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22151E000, log, OS_LOG_TYPE_ERROR, "Failed to apply schedule settings before background task handler fired.", v1, 2u);
}

@end
