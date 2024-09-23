@implementation PBBGatewayManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6);
  return (id)sharedManager___sharedManager;
}

void __34__PBBGatewayManager_sharedManager__block_invoke()
{
  PBBGatewayManager *v0;
  void *v1;

  v0 = objc_alloc_init(PBBGatewayManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

- (PBBGatewayManager)init
{
  PBBGatewayManager *v2;
  void *v3;
  objc_class *v4;
  id v5;
  dispatch_queue_t v6;
  uint64_t v7;
  BBSettingsGateway *settingsGateway;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v12.receiver = self;
  v12.super_class = (Class)PBBGatewayManager;
  v2 = -[PBBGatewayManager init](&v12, sel_init);
  if (v2)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v3 = (void *)getBBSettingsGatewayClass_softClass;
    v17 = getBBSettingsGatewayClass_softClass;
    if (!getBBSettingsGatewayClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getBBSettingsGatewayClass_block_invoke;
      v13[3] = &unk_24CBBDC30;
      v13[4] = &v14;
      __getBBSettingsGatewayClass_block_invoke((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v14, 8);
    v5 = [v4 alloc];
    v6 = dispatch_queue_create("com.apple.Bridge.BBSettingsGateway", 0);
    v7 = objc_msgSend(v5, "initWithQueue:", v6);
    settingsGateway = v2->_settingsGateway;
    v2->_settingsGateway = (BBSettingsGateway *)v7;

    objc_msgSend(MEMORY[0x24BE2D658], "serviceForClientIdentifier:", CFSTR("com.apple.Bridge-PBBridgeGateway"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBGatewayManager setGlobalConfigurationService:](v2, "setGlobalConfigurationService:", v9);

    -[PBBGatewayManager globalConfigurationService](v2, "globalConfigurationService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addListener:withCompletionHandler:", v2, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BBSettingsGateway invalidate](self->_settingsGateway, "invalidate");
  -[PBBGatewayManager globalConfigurationService](self, "globalConfigurationService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)PBBGatewayManager;
  -[PBBGatewayManager dealloc](&v4, sel_dealloc);
}

- (void)loadBBSections
{
  dispatch_semaphore_t v3;
  BBSettingsGateway *settingsGateway;
  NSObject *v5;
  _QWORD v6[5];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  settingsGateway = self->_settingsGateway;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__PBBGatewayManager_loadBBSections__block_invoke;
  v6[3] = &unk_24CBBE8E0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[BBSettingsGateway getSectionInfoForActiveSectionsWithCompletion:](settingsGateway, "getSectionInfoForActiveSectionsWithCompletion:", v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

void __35__PBBGatewayManager_loadBBSections__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)dateComponentsFromDNDScheduleTime:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDBCE68];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setHour:", objc_msgSend(v4, "hour"));
    v6 = objc_msgSend(v4, "minute");

    objc_msgSend(v5, "setMinute:", v6);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)loadDNDState
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSDateComponents *v9;
  NSDateComponents *dndFromComponents;
  void *v11;
  void *v12;
  NSDateComponents *v13;
  NSDateComponents *dndToComponents;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  NSString *v20;
  NSString *doNotDisturbPrivilegedSenderTypeGroupIdentifier;
  id v22;
  id v23;

  objc_msgSend(MEMORY[0x24BE2D730], "serviceForClientIdentifier:", CFSTR("com.apple.Bridge-PBBridgeGateway"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v3, "scheduleSettingsReturningError:", &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;
  objc_msgSend(v4, "scheduleEnabledSetting");
  v6 = DNDResolvedScheduleEnabledSetting();
  if (v5)
    NSLog(CFSTR("DNDScheduleSettings Error: %@"), v5);
  self->_isScheduled = v6 == 2;
  objc_msgSend(v4, "timePeriod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBBGatewayManager dateComponentsFromDNDScheduleTime:](PBBGatewayManager, "dateComponentsFromDNDScheduleTime:", v8);
  v9 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  dndFromComponents = self->_dndFromComponents;
  self->_dndFromComponents = v9;

  objc_msgSend(v4, "timePeriod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBBGatewayManager dateComponentsFromDNDScheduleTime:](PBBGatewayManager, "dateComponentsFromDNDScheduleTime:", v12);
  v13 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  dndToComponents = self->_dndToComponents;
  self->_dndToComponents = v13;

  v22 = v5;
  objc_msgSend(v3, "phoneCallBypassSettingsReturningError:", &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;

  if (v16)
    NSLog(CFSTR("DNDSettingsService phoneCallBypassSettingsReturningError Error: %@"), v16);
  if (v15)
  {
    v17 = objc_msgSend(v15, "immediateBypassEventSourceType");
    if ((unint64_t)(v17 - 1) >= 5)
      v18 = 0;
    else
      v18 = v17;
    self->_doNotDisturbPrivilegedSenderType = v18;
    objc_msgSend(v15, "immediateBypassCNGroupIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSString *)objc_msgSend(v19, "copy");
    doNotDisturbPrivilegedSenderTypeGroupIdentifier = self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier;
    self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier = v20;

    self->_repeatedCallsEnabled = objc_msgSend(v15, "repeatEventSourceBehaviorEnabledSetting");
  }

}

- (BOOL)repeatedCalls
{
  return self->_repeatedCallsEnabled == 2;
}

- (BOOL)pairSyncStateEditable
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PBBGatewayManager globalConfigurationService](self, "globalConfigurationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "getPairSyncStateReturningError:", &v9);
  v4 = v9;

  if (v4)
  {
    pbb_bridge_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Error getting pair sync state editable value: %{public}@", buf, 0xCu);

    }
    v7 = 0;
  }
  else
  {
    v7 = (~v3 & 3) == 0;
  }

  return v7;
}

- (BOOL)pairSyncEnabled
{
  void *v2;
  unint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PBBGatewayManager globalConfigurationService](self, "globalConfigurationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = objc_msgSend(v2, "getPairSyncStateReturningError:", &v8);
  v4 = v8;

  if (v4)
  {
    pbb_bridge_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Error getting pair sync enabled value: %{public}@", buf, 0xCu);

    }
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = ((v3 >> 2) & 1);
  }

  return (char)v5;
}

- (void)setPairSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  -[PBBGatewayManager globalConfigurationService](self, "globalConfigurationService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "setPairSyncPreferenceEnabled:error:", v3, &v10);
  v6 = v10;

  pbb_bridge_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Error setting pair sync enabled value: %{public}@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v12) = v3;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Successfully updated pair sync enabled value to %i", buf, 8u);
  }

}

- (void)globalConfigurationService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__PBBGatewayManager_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke;
  v4[3] = &unk_24CBBE908;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

void __79__PBBGatewayManager_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pbb_bridge_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 136315394;
    v8 = "-[PBBGatewayManager globalConfigurationService:didReceiveUpdatedPairSyncState:]_block_invoke";
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "%s - pairSyncState: %lu", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gatewayManagerDidUpdateFocusPairSyncValue");

  }
}

- (NSArray)bbSections
{
  return self->_bbSections;
}

- (void)setBbSections:(id)a3
{
  objc_storeStrong((id *)&self->_bbSections, a3);
}

- (unint64_t)repeatedCallsEnabled
{
  return self->_repeatedCallsEnabled;
}

- (void)setRepeatedCallsEnabled:(unint64_t)a3
{
  self->_repeatedCallsEnabled = a3;
}

- (DNDGlobalConfigurationService)globalConfigurationService
{
  return self->_globalConfigurationService;
}

- (void)setGlobalConfigurationService:(id)a3
{
  objc_storeStrong((id *)&self->_globalConfigurationService, a3);
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
  objc_storeStrong((id *)&self->_settingsGateway, a3);
}

- (PBBGatewayManagerDelegate)delegate
{
  return (PBBGatewayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)allowedGroupName
{
  return self->_allowedGroupName;
}

- (unint64_t)doNotDisturbPrivilegedSenderType
{
  return self->_doNotDisturbPrivilegedSenderType;
}

- (NSString)doNotDisturbPrivilegedSenderTypeGroupIdentifier
{
  return self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier;
}

- (BOOL)isScheduled
{
  return self->_isScheduled;
}

- (NSDateComponents)dndFromComponents
{
  return self->_dndFromComponents;
}

- (NSDateComponents)dndToComponents
{
  return self->_dndToComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndToComponents, 0);
  objc_storeStrong((id *)&self->_dndFromComponents, 0);
  objc_storeStrong((id *)&self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_globalConfigurationService, 0);
  objc_storeStrong((id *)&self->_bbSections, 0);
}

@end
