@implementation UNCEffectiveSettings

- (UNCEffectiveSettings)init
{
  void *v3;
  UNCBiometricResource *v4;
  UNCEffectiveSettings *v5;

  +[UNCBulletinDefaults standardDefaults](UNCBulletinDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(UNCBiometricResource);
  v5 = -[UNCEffectiveSettings initWithBulletinDefaults:biometricResource:](self, "initWithBulletinDefaults:biometricResource:", v3, v4);

  return v5;
}

- (UNCEffectiveSettings)initWithBulletinDefaults:(id)a3
{
  id v4;
  UNCBiometricResource *v5;
  UNCEffectiveSettings *v6;

  v4 = a3;
  v5 = objc_alloc_init(UNCBiometricResource);
  v6 = -[UNCEffectiveSettings initWithBulletinDefaults:biometricResource:](self, "initWithBulletinDefaults:biometricResource:", v4, v5);

  return v6;
}

- (UNCEffectiveSettings)initWithBulletinDefaults:(id)a3 biometricResource:(id)a4
{
  id v7;
  id v8;
  UNCEffectiveSettings *v9;
  UNCEffectiveSettings *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  NSObject *v19;
  dispatch_queue_t v20;
  UNCBulletinServerConnection *v21;
  UNCBulletinServerConnection *bbServerConnection;
  void *v23;
  NSObject *v24;
  _QWORD block[4];
  UNCEffectiveSettings *v27;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UNCEffectiveSettings;
  v9 = -[UNCEffectiveSettings init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bulletinDefaults, a3);
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_siriEnabled = objc_msgSend(v11, "assistantIsEnabled");

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_siriAllowedWhenLocked = objc_msgSend(v12, "disableAssistantWhilePasscodeLocked") ^ 1;

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_announceOnHearingAidsEnabled = objc_msgSend(v13, "announceNotificationsOnHearingAidsEnabled");

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_announceOnHearingAidsSupported = objc_msgSend(v14, "announceNotificationsOnHearingAidsSupported");

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_announceOnBuiltInSpeakerEnabled = objc_msgSend(v15, "announceNotificationsOnBuiltInSpeakerEnabled");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.usernotifications.effectiveSettingsQueue", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.usernotifications.effectiveSettingsGateway", v19);

    v21 = -[UNCBulletinServerConnection initWithQueue:]([UNCBulletinServerConnection alloc], "initWithQueue:", v20);
    bbServerConnection = v10->_bbServerConnection;
    v10->_bbServerConnection = v21;

    objc_storeStrong((id *)&v10->_biometricResource, a4);
    if (-[UNCBiometricResource hasPearlCapability](v10->_biometricResource, "hasPearlCapability"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:selector:name:object:", v10, sel__biometricResourceStateChanged, CFSTR("BBBiometricResourceStateChanged"), v10->_biometricResource);

    }
    v24 = v10->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__UNCEffectiveSettings_initWithBulletinDefaults_biometricResource___block_invoke;
    block[3] = &unk_251AE02A0;
    v27 = v10;
    dispatch_sync(v24, block);

  }
  return v10;
}

uint64_t __67__UNCEffectiveSettings_initWithBulletinDefaults_biometricResource___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadSiriCapabilities");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadCarPlayCapabilities");
}

- (void)_queue_loadSiriCapabilities
{
  AFSiriAnnouncementRequestCapabilityManager *v3;
  AFSiriAnnouncementRequestCapabilityManager *announcementCapabilityManagerForHeadphones;
  _BOOL4 v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  AFSiriAnnouncementRequestCapabilityManager *v9;
  AFSiriAnnouncementRequestCapabilityManager *v10;
  AFSiriAnnouncementRequestCapabilityManager *announcementCapabilityManagerForCarPlay;
  _BOOL4 v12;
  NSObject *v13;
  AFSiriAnnouncementRequestCapabilityManager *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 siriEnabled;
  _BOOL4 siriAllowedWhenLocked;
  _BOOL4 announceOnHearingAidsEnabled;
  _BOOL4 announceOnHearingAidsSupported;
  _BOOL4 announceOnBuiltInSpeakerEnabled;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (AFSiriAnnouncementRequestCapabilityManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE092D0]), "initWithPlatform:", 1);
  announcementCapabilityManagerForHeadphones = self->_announcementCapabilityManagerForHeadphones;
  self->_announcementCapabilityManagerForHeadphones = v3;

  v5 = -[UNCEffectiveSettings _queue_isAnnounceSupportedForHeadphones](self, "_queue_isAnnounceSupportedForHeadphones");
  v6 = (os_log_t *)MEMORY[0x24BDF89F8];
  v7 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v30 = v5;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Cached value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  v8 = MEMORY[0x24BDAC760];
  v9 = self->_announcementCapabilityManagerForHeadphones;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke;
  v28[3] = &unk_251AE1250;
  v28[4] = self;
  -[AFSiriAnnouncementRequestCapabilityManager fetchEligibleAnnouncementRequestTypesWithCompletion:](v9, "fetchEligibleAnnouncementRequestTypesWithCompletion:", v28);
  v10 = (AFSiriAnnouncementRequestCapabilityManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE092D0]), "initWithPlatform:", 2);
  announcementCapabilityManagerForCarPlay = self->_announcementCapabilityManagerForCarPlay;
  self->_announcementCapabilityManagerForCarPlay = v10;

  v12 = -[UNCEffectiveSettings _queue_isAnnounceSupportedForCarPlay](self, "_queue_isAnnounceSupportedForCarPlay");
  v13 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v30 = v12;
    _os_log_impl(&dword_2499A5000, v13, OS_LOG_TYPE_DEFAULT, "[UNCES] Cached value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  v14 = self->_announcementCapabilityManagerForCarPlay;
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_25;
  v27[3] = &unk_251AE1250;
  v27[4] = self;
  -[AFSiriAnnouncementRequestCapabilityManager fetchEligibleAnnouncementRequestTypesWithCompletion:](v14, "fetchEligibleAnnouncementRequestTypesWithCompletion:", v27);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_siriEnabled = objc_msgSend(v15, "assistantIsEnabled");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_siriAllowedWhenLocked = objc_msgSend(v16, "disableAssistantWhilePasscodeLocked") ^ 1;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_announceOnHearingAidsEnabled = objc_msgSend(v17, "announceNotificationsOnHearingAidsEnabled");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_announceOnHearingAidsSupported = objc_msgSend(v18, "announceNotificationsOnHearingAidsSupported");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_announceOnBuiltInSpeakerEnabled = objc_msgSend(v19, "announceNotificationsOnBuiltInSpeakerEnabled");

  v20 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    siriEnabled = self->_siriEnabled;
    siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    *(_DWORD *)buf = 67110144;
    v30 = siriEnabled;
    v31 = 1024;
    v32 = siriAllowedWhenLocked;
    v33 = 1024;
    v34 = announceOnHearingAidsEnabled;
    v35 = 1024;
    v36 = announceOnHearingAidsSupported;
    v37 = 1024;
    v38 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_2499A5000, v20, OS_LOG_TYPE_DEFAULT, "[UNCES] Siri preferences did load [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d Announce On Hearing Aids Enabled: %{BOOL}d, Announce on Hearing Aids Supported: %{BOOL}d, Announce on Built-In Speaker: %{BOOL}d]", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__siriPreferencesDidChange_, *MEMORY[0x24BE08EB8], 0);

  -[AFSiriAnnouncementRequestCapabilityManager addObserver:](self->_announcementCapabilityManagerForHeadphones, "addObserver:", self);
  -[AFSiriAnnouncementRequestCapabilityManager addObserver:](self->_announcementCapabilityManagerForCarPlay, "addObserver:", self);
}

void __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke(uint64_t a1, char a2)
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2 & 1;
  v4 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Fetched value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_23;
  v7[3] = &unk_251AE0C38;
  v7[4] = v5;
  v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAnnounceSupportedForHeadphones:", *(unsigned __int8 *)(a1 + 40));
}

void __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_25(uint64_t a1, char a2)
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2 & 1;
  v4 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Fetched value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_26;
  v7[3] = &unk_251AE0C38;
  v7[4] = v5;
  v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __51__UNCEffectiveSettings__queue_loadSiriCapabilities__block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAnnounceSupportedForCarPlay:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_siriPreferencesDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__UNCEffectiveSettings__siriPreferencesDidChange___block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__UNCEffectiveSettings__siriPreferencesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateSiriPreferences");
}

- (void)_queue_updateSiriPreferences
{
  void *v3;
  int v4;
  int siriEnabled;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 siriAllowedWhenLocked;
  _BOOL4 announceOnHearingAidsEnabled;
  _BOOL4 announceOnHearingAidsSupported;
  _BOOL4 announceOnBuiltInSpeakerEnabled;
  _DWORD v21[2];
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  siriEnabled = self->_siriEnabled;
  v6 = siriEnabled != v4;
  if (siriEnabled != v4)
    self->_siriEnabled = v4;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "disableAssistantWhilePasscodeLocked") ^ 1;

  if (self->_siriAllowedWhenLocked != v8)
  {
    self->_siriAllowedWhenLocked = v8;
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "announceNotificationsOnHearingAidsEnabled");

  if (self->_announceOnHearingAidsEnabled != v10)
  {
    self->_announceOnHearingAidsEnabled = v10;
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "announceNotificationsOnHearingAidsSupported");

  if (self->_announceOnHearingAidsSupported != v12)
  {
    self->_announceOnHearingAidsSupported = v12;
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "announceNotificationsOnBuiltInSpeakerEnabled");

  if (self->_announceOnBuiltInSpeakerEnabled == v14)
  {
    if (!v6)
      return;
  }
  else
  {
    self->_announceOnBuiltInSpeakerEnabled = v14;
  }
  v15 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_siriEnabled;
    siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    v21[0] = 67110144;
    v21[1] = v16;
    v22 = 1024;
    v23 = siriAllowedWhenLocked;
    v24 = 1024;
    v25 = announceOnHearingAidsEnabled;
    v26 = 1024;
    v27 = announceOnHearingAidsSupported;
    v28 = 1024;
    v29 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_2499A5000, v15, OS_LOG_TYPE_DEFAULT, "[UNCES] Siri preferences did change [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d, Announce on hearing aids enabled: %{BOOL}d, Announce on hearing aids supported: %{BOOL}d, Announce on built in speaker enabled: %{BOOL}d]", (uint8_t *)v21, 0x20u);
  }
  -[UNCEffectiveSettings _queue_updateAnnounceSettings](self, "_queue_updateAnnounceSettings");
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  char v6;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__UNCEffectiveSettings_availableAnnouncementRequestTypesChanged_onPlatform___block_invoke;
  block[3] = &unk_251AE1278;
  v6 = a3 & 1;
  block[4] = self;
  block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __76__UNCEffectiveSettings_availableAnnouncementRequestTypesChanged_onPlatform___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v1 = result;
  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(result + 40);
  if (v2 == 2)
  {
    v5 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(v1 + 48);
      v7 = 67109120;
      v8 = v6;
      _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Changed value of eligible setup for announce for CarPlay: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_queue_setAnnounceSupportedForCarPlay:", *(unsigned __int8 *)(v1 + 48));
  }
  else if (v2 == 1)
  {
    v3 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(v1 + 48);
      v7 = 67109120;
      v8 = v4;
      _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "[UNCES] Changed value of eligible setup for announce for headphones: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_queue_setAnnounceSupportedForHeadphones:", *(unsigned __int8 *)(v1 + 48));
  }
  return result;
}

- (void)_queue_updateAnnounceSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCBulletinServerConnection refreshAnnounceSettings](self->_bbServerConnection, "refreshAnnounceSettings");
}

- (void)_queue_updateGlobalSettings
{
  -[UNCBulletinServerConnection refreshGlobalSettings](self->_bbServerConnection, "refreshGlobalSettings");
}

- (void)_queue_updateAllSectionInfos
{
  -[UNCBulletinServerConnection refreshSectionInfo](self->_bbServerConnection, "refreshSectionInfo");
}

- (void)_queue_updateAnnounceControlCenterModuleAvailability
{
  int64_t v3;
  CFPropertyListRef *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[UNCEffectiveSettings _queue_effectiveGlobalAnnounceSetting](self, "_queue_effectiveGlobalAnnounceSetting");
  if ((v3 == 2) == (CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), CFSTR("com.apple.siri.SpokenNotificationsModule"), 0) == 0))
  {
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
    if (v3 != 2)
      v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
    CFPreferencesSetAppValue(CFSTR("SBIconVisibility"), *v4, CFSTR("com.apple.siri.SpokenNotificationsModule"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
  }
}

- (int64_t)_queue_globalAnnounceSetting
{
  int64_t result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = -[UNCBulletinDefaultsInterface globalAnnounceSetting](self->_bulletinDefaults, "globalAnnounceSetting");
  if (result == -1)
  {
    -[UNCEffectiveSettings _queue_setGlobalAnnounceSetting:](self, "_queue_setGlobalAnnounceSetting:", 0);
    return 0;
  }
  return result;
}

- (void)_queue_setGlobalAnnounceSetting:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[UNCBulletinDefaultsInterface globalAnnounceSetting](self->_bulletinDefaults, "globalAnnounceSetting");
  if (a3 != -1 && v5 != a3)
  {
    v6 = (void *)*MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      UNCStringFromUNCAnnounceSetting(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Set effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[UNCBulletinDefaultsInterface setGlobalAnnounceSetting:](self->_bulletinDefaults, "setGlobalAnnounceSetting:", a3);
    -[UNCEffectiveSettings _queue_updateAnnounceControlCenterModuleAvailability](self, "_queue_updateAnnounceControlCenterModuleAvailability");
    if (a3 == 2)
      -[UNCEffectiveSettings _saveGlobalAnnounceSettingEnabledEvent](self, "_saveGlobalAnnounceSettingEnabledEvent");
    -[UNCEffectiveSettings _queue_updateGlobalSettings](self, "_queue_updateGlobalSettings");
    -[UNCEffectiveSettings _queue_updateAllSectionInfos](self, "_queue_updateAllSectionInfos");
  }
}

- (int64_t)_queue_effectiveGlobalAnnounceSetting
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_isAnnounceSupportedForHeadphones](self, "_queue_isAnnounceSupportedForHeadphones")
    || -[UNCEffectiveSettings _queue_isAnnounceSupportedForCarPlay](self, "_queue_isAnnounceSupportedForCarPlay")
    && -[UNCEffectiveSettings _queue_hasPairedVehiclesForCarPlay](self, "_queue_hasPairedVehiclesForCarPlay")
    || self->_announceOnHearingAidsSupported
    || self->_announceOnBuiltInSpeakerEnabled)
  {
    if (self->_siriEnabled && self->_siriAllowedWhenLocked)
    {
      v3 = -[UNCEffectiveSettings _queue_globalAnnounceSetting](self, "_queue_globalAnnounceSetting");
      if (v3 <= 1)
        v4 = 1;
      else
        v4 = v3;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = -1;
  }
  v5 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    UNCStringFromUNCAnnounceSetting(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  return v4;
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__UNCEffectiveSettings_effectiveGlobalAnnounceSetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__UNCEffectiveSettings_effectiveGlobalAnnounceSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalAnnounceSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__UNCEffectiveSettings_setGlobalAnnounceSetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __49__UNCEffectiveSettings_setGlobalAnnounceSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceSetting:", *(_QWORD *)(a1 + 40));
}

- (void)_saveGlobalAnnounceSettingEnabledEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B090], "eventStreamWithName:", CFSTR("/discoverability/signals"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFF8], "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B098], "identifierWithString:type:", CFSTR("com.apple.siri.spoken-notifications.enabled"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B080], "eventWithStream:startDate:endDate:value:confidence:metadata:", v2, v5, v5, v4, 0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveObjects:responseQueue:withCompletion:", v8, 0, &__block_literal_global_22);

    v9 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "[UNCES] Told CoreDuet about global announce setting change", v10, 2u);
    }

  }
}

void __62__UNCEffectiveSettings__saveGlobalAnnounceSettingEnabledEvent__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      __62__UNCEffectiveSettings__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1((uint64_t)v4, v5);
  }
  else if (a2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("com.apple.siri.spoken-notifications.enabled"), CFSTR("signalIdentifier"));
    objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/discoverability/signals/dataDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (BOOL)_queue_isAnnounceSupportedForHeadphones
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[UNCBulletinDefaultsInterface isAnnounceSupportedForHeadphones](self->_bulletinDefaults, "isAnnounceSupportedForHeadphones");
}

- (void)_queue_setAnnounceSupportedForHeadphones:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_isAnnounceSupportedForHeadphones](self, "_queue_isAnnounceSupportedForHeadphones") != v3)
  {
    -[UNCBulletinDefaultsInterface setAnnounceSupportedForHeadphones:](self->_bulletinDefaults, "setAnnounceSupportedForHeadphones:", v3);
    -[UNCEffectiveSettings _queue_updateAnnounceSettings](self, "_queue_updateAnnounceSettings");
  }
}

- (int64_t)_queue_globalAnnounceHeadphonesSetting
{
  int64_t result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = -[UNCBulletinDefaultsInterface globalAnnounceHeadphonesSetting](self->_bulletinDefaults, "globalAnnounceHeadphonesSetting");
  if (result == -1)
  {
    -[UNCEffectiveSettings _queue_setGlobalAnnounceHeadphonesSetting:](self, "_queue_setGlobalAnnounceHeadphonesSetting:", 0);
    return 0;
  }
  return result;
}

- (void)_queue_setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[UNCBulletinDefaultsInterface globalAnnounceHeadphonesSetting](self->_bulletinDefaults, "globalAnnounceHeadphonesSetting");
  if (a3 != -1 && v5 != a3)
  {
    v6 = (void *)*MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      UNCStringFromUNCAnnounceSetting(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Set setEffectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[UNCBulletinDefaultsInterface setGlobalAnnounceHeadphonesSetting:](self->_bulletinDefaults, "setGlobalAnnounceHeadphonesSetting:", a3);
    -[UNCEffectiveSettings _queue_updateGlobalSettings](self, "_queue_updateGlobalSettings");
  }
}

- (int64_t)_queue_effectiveGlobalAnnounceHeadphoneSetting
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_isAnnounceSupportedForHeadphones](self, "_queue_isAnnounceSupportedForHeadphones"))
  {
    if (self->_siriEnabled
      && self->_siriAllowedWhenLocked
      && -[UNCEffectiveSettings _queue_effectiveGlobalAnnounceSetting](self, "_queue_effectiveGlobalAnnounceSetting") == 2)
    {
      v3 = -[UNCEffectiveSettings _queue_globalAnnounceHeadphonesSetting](self, "_queue_globalAnnounceHeadphonesSetting");
      if (v3)
        v4 = v3;
      else
        v4 = 2;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = -1;
  }
  v5 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    UNCStringFromUNCAnnounceSetting(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  return v4;
}

- (int64_t)effectiveGlobalAnnounceHeadphoneSetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__UNCEffectiveSettings_effectiveGlobalAnnounceHeadphoneSetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__UNCEffectiveSettings_effectiveGlobalAnnounceHeadphoneSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalAnnounceHeadphoneSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceHeadphoneSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__UNCEffectiveSettings_setGlobalAnnounceHeadphoneSetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __58__UNCEffectiveSettings_setGlobalAnnounceHeadphoneSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalAnnounceHeadphonesSetting:", *(_QWORD *)(a1 + 40));
}

- (void)_pairedVehiclesForCarPlayDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__UNCEffectiveSettings__pairedVehiclesForCarPlayDidChange___block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__UNCEffectiveSettings__pairedVehiclesForCarPlayDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAllVehiclesForCarPlay");
}

- (void)_queue_loadCarPlayCapabilities
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = -[UNCEffectiveSettings _queue_hasPairedVehiclesForCarPlay](self, "_queue_hasPairedVehiclesForCarPlay");
  v4 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Cached value of vehicles for CarPlay: %{BOOL}d", (uint8_t *)v6, 8u);
  }
  -[UNCEffectiveSettings _fetchAllVehiclesForCarPlay](self, "_fetchAllVehiclesForCarPlay");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__pairedVehiclesForCarPlayDidChange_, CFSTR("CRPairedVehiclesDidChangeNotification"), 0);

}

- (void)_fetchAllVehiclesForCarPlay
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getCRPairedVehicleManagerClass_softClass_0;
  v12 = getCRPairedVehicleManagerClass_softClass_0;
  v4 = MEMORY[0x24BDAC760];
  if (!getCRPairedVehicleManagerClass_softClass_0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getCRPairedVehicleManagerClass_block_invoke_0;
    v8[3] = &unk_251AE0138;
    v8[4] = &v9;
    __getCRPairedVehicleManagerClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v6 = objc_alloc_init(v5);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke;
  v7[3] = &unk_251AE12E8;
  v7[4] = self;
  objc_msgSend(v6, "fetchAllVehiclesWithCompletion:", v7);

}

void __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "count");
  v4 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3 != 0;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Changed value of vehicles for CarPlay: %{BOOL}d", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke_59;
  v7[3] = &unk_251AE0C38;
  v7[4] = v5;
  v8 = v3 != 0;
  dispatch_async(v6, v7);
}

uint64_t __51__UNCEffectiveSettings__fetchAllVehiclesForCarPlay__block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setPairedVehiclesForCarPlay:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_queue_hasPairedVehiclesForCarPlay
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[UNCBulletinDefaultsInterface hasPairedVehiclesForCarPlay](self->_bulletinDefaults, "hasPairedVehiclesForCarPlay");
}

- (void)_queue_setPairedVehiclesForCarPlay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_hasPairedVehiclesForCarPlay](self, "_queue_hasPairedVehiclesForCarPlay") != v3)
  {
    -[UNCBulletinDefaultsInterface setPairedVehiclesForCarPlay:](self->_bulletinDefaults, "setPairedVehiclesForCarPlay:", v3);
    -[UNCEffectiveSettings _queue_updateAnnounceSettings](self, "_queue_updateAnnounceSettings");
  }
}

- (BOOL)_queue_isAnnounceSupportedForCarPlay
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[UNCBulletinDefaultsInterface isAnnounceSupportedForCarPlay](self->_bulletinDefaults, "isAnnounceSupportedForCarPlay");
}

- (void)_queue_setAnnounceSupportedForCarPlay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_isAnnounceSupportedForCarPlay](self, "_queue_isAnnounceSupportedForCarPlay") != v3)
  {
    -[UNCBulletinDefaultsInterface setAnnounceSupportedForCarPlay:](self->_bulletinDefaults, "setAnnounceSupportedForCarPlay:", v3);
    -[UNCEffectiveSettings _queue_updateAnnounceSettings](self, "_queue_updateAnnounceSettings");
  }
}

- (int64_t)_queue_globalAnnounceCarPlaySetting
{
  int64_t result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = -[UNCBulletinDefaultsInterface globalAnnounceCarPlaySetting](self->_bulletinDefaults, "globalAnnounceCarPlaySetting");
  if (result == -1)
  {
    -[UNCEffectiveSettings _queue_setGlobalAnnounceCarPlaySetting:](self, "_queue_setGlobalAnnounceCarPlaySetting:", 0);
    return 0;
  }
  return result;
}

- (void)_queue_setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[UNCBulletinDefaultsInterface globalAnnounceCarPlaySetting](self->_bulletinDefaults, "globalAnnounceCarPlaySetting");
  if (a3 != -1 && v5 != a3)
  {
    v6 = (void *)*MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      UNCStringFromUNCAnnounceCarPlaySetting(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[UNCES] Set GlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[UNCBulletinDefaultsInterface setGlobalAnnounceCarPlaySetting:](self->_bulletinDefaults, "setGlobalAnnounceCarPlaySetting:", a3);
    -[UNCEffectiveSettings _queue_updateGlobalSettings](self, "_queue_updateGlobalSettings");
  }
}

- (int64_t)_queue_effectiveGlobalAnnounceCarPlaySetting
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_isAnnounceSupportedForCarPlay](self, "_queue_isAnnounceSupportedForCarPlay")
    && -[UNCEffectiveSettings _queue_hasPairedVehiclesForCarPlay](self, "_queue_hasPairedVehiclesForCarPlay"))
  {
    if (self->_siriEnabled
      && self->_siriAllowedWhenLocked
      && -[UNCEffectiveSettings _queue_effectiveGlobalAnnounceSetting](self, "_queue_effectiveGlobalAnnounceSetting") == 2)
    {
      v3 = -[UNCEffectiveSettings _queue_globalAnnounceCarPlaySetting](self, "_queue_globalAnnounceCarPlaySetting");
      if (v3)
        v4 = v3;
      else
        v4 = 3;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = -1;
  }
  v5 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    UNCStringFromUNCAnnounceCarPlaySetting(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  return v4;
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__UNCEffectiveSettings_effectiveGlobalAnnounceCarPlaySetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__UNCEffectiveSettings_effectiveGlobalAnnounceCarPlaySetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalAnnounceCarPlaySetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__UNCEffectiveSettings_setGlobalAnnounceCarPlaySetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __56__UNCEffectiveSettings_setGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "globalAnnounceCarPlaySetting");
  v3 = *(_QWORD *)(a1 + 40);
  if (result != v3 && v3 != -1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setGlobalAnnounceCarPlaySetting:");
    return objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
  }
  return result;
}

- (int64_t)_queue_globalScheduledDeliverySetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[UNCBulletinDefaultsInterface globalScheduledDeliverySetting](self->_bulletinDefaults, "globalScheduledDeliverySetting");
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__UNCEffectiveSettings_effectiveGlobalScheduledDeliverySetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __63__UNCEffectiveSettings_effectiveGlobalScheduledDeliverySetting__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting");
  else
    v2 = -1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  v3 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v5 = v3;
    UNCStringFromUNCScheduledDeliverySetting(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__UNCEffectiveSettings_setGlobalScheduledDeliverySetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __58__UNCEffectiveSettings_setGlobalScheduledDeliverySetting___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliverySetting");
  if (result != *(_QWORD *)(a1 + 40))
  {
    v3 = (void *)*MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = v3;
      UNCStringFromUNCScheduledDeliverySetting(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Set setEffectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setGlobalScheduledDeliverySetting:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
  }
  return result;
}

- (id)_encodedScheduledDeliveryTimesForDeliveryTimes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "hour", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "minute"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_scheduledDeliveryTimesForEncodedDeliveryTimes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i < v6; i += 2)
    {
      if (v6 <= i + 1)
        break;
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v3, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHour:", objc_msgSend(v9, "integerValue"));

      objc_msgSend(v3, "objectAtIndex:", i + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "integerValue"));

      objc_msgSend(v4, "addObject:", v8);
    }
  }

  return v4;
}

- (id)_queue_globalScheduledDeliveryTimes
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCBulletinDefaultsInterface globalScheduledDeliveryTimes](self->_bulletinDefaults, "globalScheduledDeliveryTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCEffectiveSettings _scheduledDeliveryTimesForEncodedDeliveryTimes:](self, "_scheduledDeliveryTimesForEncodedDeliveryTimes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCEffectiveSettings _queue_globalScheduledDeliveryTimes](self, "_queue_globalScheduledDeliveryTimes");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "[UNCES] setEffectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    -[UNCEffectiveSettings _encodedScheduledDeliveryTimesForDeliveryTimes:](self, "_encodedScheduledDeliveryTimesForDeliveryTimes:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCBulletinDefaultsInterface setGlobalScheduledDeliveryTimes:](self->_bulletinDefaults, "setGlobalScheduledDeliveryTimes:", v7);
    -[UNCEffectiveSettings _queue_updateGlobalSettings](self, "_queue_updateGlobalSettings");

  }
}

- (NSArray)effectiveGlobalScheduledDeliveryTimes
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryTimes__block_invoke;
  v6[3] = &unk_251AE0178;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __61__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryTimes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_globalScheduledDeliveryTimes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__UNCEffectiveSettings_setGlobalScheduledDeliveryTimes___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __56__UNCEffectiveSettings_setGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setGlobalScheduledDeliveryTimes:", *(_QWORD *)(a1 + 40));
}

- (int64_t)_queue_effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = -[UNCBulletinDefaultsInterface globalScheduledDeliveryShowNextSummarySetting](self->_bulletinDefaults, "globalScheduledDeliveryShowNextSummarySetting");
  v3 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    UNCStringFromUNCSystemSetting(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Got effectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return v2;
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__UNCEffectiveSettings_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_effectiveGlobalScheduledDeliveryShowNextSummarySetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__UNCEffectiveSettings_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __73__UNCEffectiveSettings_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = v2;
    UNCStringFromUNCSystemSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "[UNCES] Set setEffectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setGlobalScheduledDeliveryShowNextSummarySetting:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
}

- (BOOL)_supportsFaceID
{
  return -[UNCBiometricResource hasPearlCapability](self->_biometricResource, "hasPearlCapability");
}

- (BOOL)_isFaceIDEnrolled
{
  return -[UNCBiometricResource isPearlEnabledAndEnrolled](self->_biometricResource, "isPearlEnabledAndEnrolled");
}

- (void)_biometricResourceStateChanged
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UNCEffectiveSettings__biometricResourceStateChanged__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __54__UNCEffectiveSettings__biometricResourceStateChanged__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalContentPreviewsSetting");
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
    return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllSectionInfos");
  }
  return result;
}

- (int64_t)_queue_defaultGlobalContentPreviewSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _supportsFaceID](self, "_supportsFaceID")
    && -[UNCEffectiveSettings _isFaceIDEnrolled](self, "_isFaceIDEnrolled"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (int64_t)_queue_globalContentPreviewsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[UNCBulletinDefaultsInterface globalContentPreviewSetting](self->_bulletinDefaults, "globalContentPreviewSetting");
}

- (void)_queue_setGlobalContentPreviewsSetting:(int64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[UNCEffectiveSettings _queue_globalContentPreviewsSetting](self, "_queue_globalContentPreviewsSetting") != a3)
  {
    v5 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Set effectiveGlobalContentPreviewsSetting", v6, 2u);
    }
    -[UNCBulletinDefaultsInterface setGlobalContentPreviewSetting:](self->_bulletinDefaults, "setGlobalContentPreviewSetting:", a3);
    -[UNCEffectiveSettings _queue_updateGlobalSettings](self, "_queue_updateGlobalSettings");
    -[UNCEffectiveSettings _queue_updateAllSectionInfos](self, "_queue_updateAllSectionInfos");
  }
}

- (int64_t)effectiveGlobalContentPreviewSetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__UNCEffectiveSettings_effectiveGlobalContentPreviewSetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__UNCEffectiveSettings_effectiveGlobalContentPreviewSetting__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_globalContentPreviewsSetting");
  v3 = *(void **)(a1 + 32);
  if (v2)
    result = objc_msgSend(v3, "_queue_globalContentPreviewsSetting");
  else
    result = objc_msgSend(v3, "_queue_defaultGlobalContentPreviewSetting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalContentPreviewSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__UNCEffectiveSettings_setGlobalContentPreviewSetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __55__UNCEffectiveSettings_setGlobalContentPreviewSetting___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == objc_msgSend(v2, "_queue_defaultGlobalContentPreviewSetting"))
    v4 = 0;
  else
    v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_queue_setGlobalContentPreviewsSetting:", v4);
  v5 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[UNCES] Set effectiveGlobalContentPreviewsSetting", v6, 2u);
  }
}

- (int64_t)_queue_globalNotificationListDisplayStyleSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[UNCBulletinDefaultsInterface globalNotificationListDisplayStyleSetting](self->_bulletinDefaults, "globalNotificationListDisplayStyleSetting");
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__UNCEffectiveSettings_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __74__UNCEffectiveSettings_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "_queue_globalNotificationListDisplayStyleSetting"))
    result = objc_msgSend(*(id *)(a1 + 32), "_queue_globalNotificationListDisplayStyleSetting");
  else
    result = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__UNCEffectiveSettings_setGlobalNotificationListDisplayStyleSetting___block_invoke;
  v4[3] = &unk_251AE12A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __69__UNCEffectiveSettings_setGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "globalNotificationListDisplayStyleSetting");
  if (result != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setGlobalNotificationListDisplayStyleSetting:");
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateGlobalSettings");
    return objc_msgSend(*(id *)(a1 + 32), "_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0CDB0], "discoverabilitySignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE0CB70]);
  v10 = CFSTR("notificationListDisplayStyleSetting");
  UNCStringFromUNCNotificationListDisplayStyleSetting(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.SpringBoard.notificationListDisplayStyleSetting.changed"), CFSTR("com.apple.SpringBoard"), CFSTR("NotificationListDisplayStyleSetting"), v8);

  objc_msgSend(v5, "sendEvent:", v9);
}

- (BOOL)hasPairedVehiclesForCarPlay
{
  return self->_hasPairedVehiclesForCarPlay;
}

- (BOOL)hasDestinationForRemoteNotifications
{
  return self->_hasDestinationForRemoteNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bbServerConnection, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForCarPlay, 0);
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForHeadphones, 0);
  objc_storeStrong((id *)&self->_bulletinDefaults, 0);
}

void __62__UNCEffectiveSettings__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2499A5000, a2, OS_LOG_TYPE_ERROR, "[UNCES] Error saving spoken notification setting change to Duet: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
