@implementation SVXSessionManager

- (void)preheatWithActivationSource:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 9)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D798[a3];
    v8 = v7;
    *(_DWORD *)buf = 136315394;
    v13 = "-[SVXSessionManager preheatWithActivationSource:]";
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s activationSource = %@", buf, 0x16u);

  }
  if (-[SVXAudioServicesUtils shouldPrewarmAudioServicesActivate](self->_audioServicesUtils, "shouldPrewarmAudioServicesActivate"))
  {
    -[SVXAudioServicesUtils audioServicesActivateWithTimeout](self->_audioServicesUtils, "audioServicesActivateWithTimeout");
  }
  -[SVXModule analytics](self->_module, "analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 1402, 0);

  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__SVXSessionManager_preheatWithActivationSource___block_invoke;
  v11[3] = &unk_24D24EA18;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v10, "performBlock:", v11);

}

- (void)fetchCurrentStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SVXSessionManager_fetchCurrentStateWithCompletion___block_invoke;
  v7[3] = &unk_24D24EF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)fetchCurrentActivityStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke;
  v7[3] = &unk_24D24EF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)fetchCurrentAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[SVXModule performer](self->_module, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SVXSessionManager_fetchCurrentAudioPowerWithType_completion___block_invoke;
  v9[3] = &unk_24D24EB40;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)fetchCurrentAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SVXSessionManager_fetchCurrentAlarmAndTimerFiringContextWithCompletion___block_invoke;
  v7[3] = &unk_24D24EF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)getCurrentSessionUsingBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[SVXModule performer](self->_module, "performer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__SVXSessionManager_getCurrentSessionUsingBlock___block_invoke;
    v6[3] = &unk_24D24EF28;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

- (void)getAudioSessionProviderWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[SVXModule performer](self->_module, "performer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__SVXSessionManager_getAudioSessionProviderWithCompletion___block_invoke;
    v6[3] = &unk_24D24EF28;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

- (void)addActivationListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SVXSessionManager_addActivationListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeActivationListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SVXSessionManager_removeActivationListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)addAudioPowerUpdateListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSessionManager_addAudioPowerUpdateListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeAudioPowerUpdateListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SVXSessionManager_removeAudioPowerUpdateListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)addActivityListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SVXSessionManager_addActivityListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeActivityListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SVXSessionManager_removeActivityListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)deviceLostMyriadElection
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = mach_absolute_time();
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SVXSessionManager deviceLostMyriadElection]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s BTLE Device should abort session", buf, 0xCu);
  }
  -[SVXModule analytics](self->_module, "analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 1403, 0);

  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SVXSessionManager_deviceLostMyriadElection__block_invoke;
  v8[3] = &unk_24D24ECE8;
  v9 = v6;
  v10 = v3;
  v8[4] = self;
  v7 = v6;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)deviceWonMyriadElection
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXSessionManager deviceWonMyriadElection]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s BTLE Device continues to interact", buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SVXSessionManager_deviceWonMyriadElection__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)unduckDevice
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXSessionManager unduckDevice]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s BTLE Device should unduck audio", buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__SVXSessionManager_unduckDevice__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)_myriadStereoPartnerDataChanged
{
  void *v3;
  _QWORD v4[5];

  -[SVXModule performer](self->_module, "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SVXSessionManager__myriadStereoPartnerDataChanged__block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (SVXSessionManager)initWithModule:(id)a3
{
  id v5;
  SVXSessionManager *v6;
  SVXSessionManager *v7;
  void *v8;
  SVXMyriadDeviceManager *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SVXMyriadDeviceManager *myriadDeviceManager;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *coreDuetQueue;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *biomeQueue;
  void *v24;
  SVXSessionManager *v25;
  SVXSessionActivationAnnouncer *v26;
  SVXSessionActivationAnnouncer *activationAnnouncer;
  SVXAudioPowerUpdateAnnouncer *v28;
  SVXAudioPowerUpdateAnnouncer *audioPowerUpdateAnnouncer;
  SVXSessionActivityAnnouncer *v30;
  SVXSessionActivityAnnouncer *activityAnnouncer;
  AFQueue *v32;
  AFQueue *queuedOperations;
  _QWORD v35[4];
  SVXSessionManager *v36;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SVXSessionManager;
  v6 = -[SVXSessionManager init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_module, a3);
    objc_msgSend(v5, "instanceContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (AFIsHorseman())
    {
      v9 = [SVXMyriadDeviceManager alloc];
      objc_msgSend(v5, "analytics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SVXMyriadDeviceManager initWithInstanceContext:analytics:preferences:delegate:](v9, "initWithInstanceContext:analytics:preferences:delegate:", v8, v10, v11, v7);
      myriadDeviceManager = v7->_myriadDeviceManager;
      v7->_myriadDeviceManager = (SVXMyriadDeviceManager *)v12;

      objc_msgSend(v5, "preferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_myriadDuckingAllowed = objc_msgSend(v14, "myriadDuckingEnabled");

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_myriadStereoPartnerDataChanged, (CFStringRef)*MEMORY[0x24BE094B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (objc_msgSend(v8, "isDefault"))
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create(0, v17);
      coreDuetQueue = v7->_coreDuetQueue;
      v7->_coreDuetQueue = (OS_dispatch_queue *)v18;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = dispatch_queue_create(0, v21);
      biomeQueue = v7->_biomeQueue;
      v7->_biomeQueue = (OS_dispatch_queue *)v22;

    }
    -[SVXModule performer](v7->_module, "performer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __36__SVXSessionManager_initWithModule___block_invoke;
    v35[3] = &unk_24D24EFF0;
    v25 = v7;
    v36 = v25;
    objc_msgSend(v24, "performBlock:", v35);

    v26 = objc_alloc_init(SVXSessionActivationAnnouncer);
    activationAnnouncer = v25->_activationAnnouncer;
    v25->_activationAnnouncer = v26;

    v28 = objc_alloc_init(SVXAudioPowerUpdateAnnouncer);
    audioPowerUpdateAnnouncer = v25->_audioPowerUpdateAnnouncer;
    v25->_audioPowerUpdateAnnouncer = v28;

    v30 = objc_alloc_init(SVXSessionActivityAnnouncer);
    activityAnnouncer = v25->_activityAnnouncer;
    v25->_activityAnnouncer = v30;

    v32 = (AFQueue *)objc_alloc_init(MEMORY[0x24BE09280]);
    queuedOperations = v25->_queuedOperations;
    v25->_queuedOperations = v32;

    -[AFQueue setDelegate:](v25->_queuedOperations, "setDelegate:", v25);
  }

  return v7;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  AFSiriTether *v10;
  AFSiriTether *tether;
  AFSiriTether *v12;
  SVXSpeechSynthesizer *v13;
  SVXSpeechSynthesizer *speechSynthesizer;
  SVXPowerLevelManager *v15;
  SVXModule *module;
  void *v17;
  SVXPowerLevelManager *v18;
  SVXPowerLevelManager *powerLevelManager;
  SVXServiceCommandHandler *v20;
  SVXServiceCommandHandler *serviceCommandHandler;
  void *v22;
  SVXDeviceSetupContext *deviceSetupContext;
  void *v24;
  id v25;
  AFDeviceContext *localDeviceContext;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  SVXSessionActivityAnnouncer *activityAnnouncer;
  void *v34;
  SVXAudioPowerUpdateAnnouncer *audioPowerUpdateAnnouncer;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE09170], "beginMonitoringAvailability");
  v7 = MEMORY[0x24BDAC760];
  if (!self->_tether)
  {
    v8 = objc_alloc(MEMORY[0x24BE092F8]);
    -[SVXModule instanceContext](self->_module, "instanceContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (AFSiriTether *)objc_msgSend(v8, "initWithInstanceContext:", v9);
    tether = self->_tether;
    self->_tether = v10;

    objc_initWeak(&location, self);
    v12 = self->_tether;
    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke;
    v48[3] = &unk_24D24D420;
    objc_copyWeak(&v49, &location);
    -[AFSiriTether setAttachmentStatusChangedHandler:](v12, "setAttachmentStatusChangedHandler:", v48);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  -[SVXSessionManager _attachToTether](self, "_attachToTether");
  objc_msgSend(v37, "speechSynthesizer");
  v13 = (SVXSpeechSynthesizer *)objc_claimAutoreleasedReturnValue();
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = v13;

  -[SVXSpeechSynthesizer addListener:](self->_speechSynthesizer, "addListener:", self);
  self->_speechSynthesisState = 1;
  v15 = [SVXPowerLevelManager alloc];
  module = self->_module;
  -[SVXSpeechSynthesizer ttsSession](self->_speechSynthesizer, "ttsSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SVXPowerLevelManager initWithModule:audioPowerProvider:](v15, "initWithModule:audioPowerProvider:", module, v17);
  powerLevelManager = self->_powerLevelManager;
  self->_powerLevelManager = v18;

  objc_msgSend(v37, "serviceCommandHandler");
  v20 = (SVXServiceCommandHandler *)objc_claimAutoreleasedReturnValue();
  serviceCommandHandler = self->_serviceCommandHandler;
  self->_serviceCommandHandler = v20;

  objc_initWeak(&location, self);
  -[SVXModule performer](self->_module, "performer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  deviceSetupContext = self->_deviceSetupContext;
  self->_deviceSetupContext = 0;

  objc_msgSend(v37, "deviceSetupManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addListener:", self);
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_2;
  v45[3] = &unk_24D24D448;
  v25 = v22;
  v46 = v25;
  objc_copyWeak(&v47, &location);
  objc_msgSend(v24, "getContextWithCompletion:", v45);
  localDeviceContext = self->_localDeviceContext;
  self->_localDeviceContext = 0;

  objc_msgSend(v37, "systemObserver");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addDeviceContextListener:", self);
  v42[0] = v7;
  v42[1] = 3221225472;
  v42[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_4;
  v42[3] = &unk_24D24D470;
  v36 = v25;
  v43 = v36;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v27, "getLocalDeviceContextWithCompletion:", v42);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = v6;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v32, "type") == 2)
        {
          activityAnnouncer = self->_activityAnnouncer;
          objc_msgSend(v32, "activityListener");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[SVXAnnouncer addListener:](activityAnnouncer, "addListener:", v34);
        }
        else
        {
          if (objc_msgSend(v32, "type") != 3)
            continue;
          audioPowerUpdateAnnouncer = self->_audioPowerUpdateAnnouncer;
          objc_msgSend(v32, "audioPowerUpdateListener");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[SVXAnnouncer addListener:](audioPowerUpdateAnnouncer, "addListener:", v34);
        }

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v29);
  }

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v47);

  objc_destroyWeak(&location);
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  AFSiriTether *tether;
  id v5;
  id v6;
  AFNotifyObserver *deviceProblemsNotifyObserver;
  SVXDeviceProblemsState *deviceProblemsState;
  SVXSpeechSynthesizer *speechSynthesizer;
  SVXPowerLevelManager *powerLevelManager;
  SVXDeviceSetupContext *deviceSetupContext;
  void *v12;
  AFDeviceContext *localDeviceContext;
  id v14;

  tether = self->_tether;
  self->_tether = 0;
  v5 = a3;

  v6 = (id)-[AFQueue dequeueAllObjects](self->_queuedOperations, "dequeueAllObjects");
  -[AFNotifyObserver invalidate](self->_deviceProblemsNotifyObserver, "invalidate");
  deviceProblemsNotifyObserver = self->_deviceProblemsNotifyObserver;
  self->_deviceProblemsNotifyObserver = 0;

  deviceProblemsState = self->_deviceProblemsState;
  self->_deviceProblemsState = 0;

  -[SVXSessionManager _invalidateCurrentSession](self, "_invalidateCurrentSession");
  -[SVXAnnouncer removeAllListeners](self->_activationAnnouncer, "removeAllListeners");
  -[SVXAnnouncer removeAllListeners](self->_audioPowerUpdateAnnouncer, "removeAllListeners");
  -[SVXAnnouncer removeAllListeners](self->_activityAnnouncer, "removeAllListeners");
  -[SVXSpeechSynthesizer removeListener:](self->_speechSynthesizer, "removeListener:", self);
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = 0;

  powerLevelManager = self->_powerLevelManager;
  self->_powerLevelManager = 0;

  objc_msgSend(v5, "deviceSetupManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeListener:", self);
  deviceSetupContext = self->_deviceSetupContext;
  self->_deviceSetupContext = 0;

  objc_msgSend(v5, "systemObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeDeviceContextListener:", self);
  localDeviceContext = self->_localDeviceContext;
  self->_localDeviceContext = 0;

  objc_msgSend(MEMORY[0x24BE09170], "stopMonitoringAvailability");
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  AFNotifyObserver *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  AFNotifyObserver *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (AFNotifyObserver *)a3;
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "-[SVXSessionManager notifyObserver:didChangeStateFrom:to:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2048;
    v18 = a4;
    v19 = 2048;
    v20 = a5;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s notifyObserver = %@, fromState = %llu, toState = %llu", buf, 0x2Au);
  }
  if (self->_deviceProblemsNotifyObserver == v8)
  {
    -[SVXModule performer](self->_module, "performer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__SVXSessionManager_notifyObserver_didChangeStateFrom_to___block_invoke;
    v11[3] = &unk_24D24F018;
    v11[4] = self;
    v12 = 0;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

- (void)session:(id)a3 willChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a3;
  -[SVXModule performer](self->_module, "performer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__SVXSessionManager_session_willChangeFromState_toState___block_invoke;
  v11[3] = &unk_24D24D498;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)session:(id)a3 didChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a3;
  -[SVXModule performer](self->_module, "performer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__SVXSessionManager_session_didChangeFromState_toState___block_invoke;
  v11[3] = &unk_24D24D498;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)session:(id)a3 willBeginUpdateAudioPowerWithType:(int64_t)a4 wrapper:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__SVXSessionManager_session_willBeginUpdateAudioPowerWithType_wrapper___block_invoke;
  v13[3] = &unk_24D24E358;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)session:(id)a3 didEndUpdateAudioPowerWithType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[SVXModule performer](self->_module, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SVXSessionManager_session_didEndUpdateAudioPowerWithType___block_invoke;
  v9[3] = &unk_24D24ECE8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)session:(id)a3 willStartSoundWithID:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[SVXModule performer](self->_module, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__SVXSessionManager_session_willStartSoundWithID___block_invoke;
  v9[3] = &unk_24D24ECE8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)session:(id)a3 didStartSoundWithID:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[SVXModule performer](self->_module, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__SVXSessionManager_session_didStartSoundWithID___block_invoke;
  v9[3] = &unk_24D24ECE8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)session:(id)a3 didStopSoundWithID:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__SVXSessionManager_session_didStopSoundWithID_error___block_invoke;
  v13[3] = &unk_24D24E358;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)session:(id)a3 willBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SVXModule performer](self->_module, "performer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__SVXSessionManager_session_willBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke;
  v19[3] = &unk_24D24E920;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "performBlock:", v19);

}

- (void)session:(id)a3 didBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SVXModule performer](self->_module, "performer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__SVXSessionManager_session_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke;
  v19[3] = &unk_24D24E920;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "performBlock:", v19);

}

- (void)session:(id)a3 willResignActiveWithOptions:(unint64_t)a4 duration:(double)a5 activityUUID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  double v19;

  v10 = a3;
  v11 = a6;
  -[SVXModule performer](self->_module, "performer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__SVXSessionManager_session_willResignActiveWithOptions_duration_activityUUID___block_invoke;
  v15[3] = &unk_24D24D4C0;
  v15[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v18 = a4;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "performBlock:", v15);

}

- (void)session:(id)a3 didResignActiveWithDeactivationContext:(id)a4 activityUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SVXModule performer](self->_module, "performer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__SVXSessionManager_session_didResignActiveWithDeactivationContext_activityUUID___block_invoke;
  v15[3] = &unk_24D24E638;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

- (void)session:(id)a3 willActivateWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__SVXSessionManager_session_willActivateWithContext___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)session:(id)a3 didActivateWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SVXSessionManager_session_didActivateWithContext___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)session:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SVXModule performer](self->_module, "performer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__SVXSessionManager_session_didNotActivateWithContext_error___block_invoke;
  v15[3] = &unk_24D24E638;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

- (void)session:(id)a3 willDeactivateWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SVXSessionManager_session_willDeactivateWithContext___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)session:(id)a3 didDeactivateWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__SVXSessionManager_session_didDeactivateWithContext___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)session:(id)a3 audioSessionWillBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[SVXModule performer](self->_module, "performer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __96__SVXSessionManager_session_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke;
  v17[3] = &unk_24D24D4E8;
  v17[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "performBlock:", v17);

}

- (void)session:(id)a3 audioSessionDidBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[SVXModule performer](self->_module, "performer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95__SVXSessionManager_session_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke;
  v17[3] = &unk_24D24D4E8;
  v17[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "performBlock:", v17);

}

- (void)sessionDidInvalidate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SVXSessionManager_sessionDidInvalidate___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)session:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__SVXSessionManager_session_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)session:(id)a3 didFailAppLaunchWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SVXSessionManager_session_didFailAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SVXSessionManager prewarmWithContext:completion:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (-[SVXAudioServicesUtils shouldPrewarmAudioServicesActivate](self->_audioServicesUtils, "shouldPrewarmAudioServicesActivate"))
  {
    -[SVXAudioServicesUtils audioServicesActivateWithTimeout](self->_audioServicesUtils, "audioServicesActivateWithTimeout");
  }
  -[SVXModule analytics](self->_module, "analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 1402, 0);

  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__SVXSessionManager_prewarmWithContext_completion___block_invoke;
  v13[3] = &unk_24D24EED8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)continuousVoiceTriggerDetectedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__SVXSessionManager_continuousVoiceTriggerDetectedWithCompletion___block_invoke;
  v7[3] = &unk_24D24EF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  SVXAudioServicesUtils *audioServicesUtils;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  SVXSessionOperation *v15;
  id v16;
  SVXSessionOperation *v17;
  void *v18;
  SVXSessionOperation *v19;
  _QWORD v20[5];
  SVXSessionOperation *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  audioServicesUtils = self->_audioServicesUtils;
  v8 = a3;
  -[SVXAudioServicesUtils audioServicesActivateWithTimeout](audioServicesUtils, "audioServicesActivateWithTimeout");
  v9 = objc_alloc(MEMORY[0x24BE09258]);
  v10 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __52__SVXSessionManager_activateWithContext_completion___block_invoke;
  v24[3] = &unk_24D24DCA0;
  v25 = v6;
  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = v6;
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithBlock:defaultValue:", v24, v13);

  v15 = [SVXSessionOperation alloc];
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __52__SVXSessionManager_activateWithContext_completion___block_invoke_28;
  v22[3] = &unk_24D24DCC8;
  v23 = v14;
  v16 = v14;
  v17 = -[SVXSessionOperation initWithActivationContext:completion:](v15, "initWithActivationContext:completion:", v8, v22);

  -[SVXModule performer](self->_module, "performer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __52__SVXSessionManager_activateWithContext_completion___block_invoke_2;
  v20[3] = &unk_24D24F018;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "performBlock:", v20);

}

- (void)stopSpeech
{
  -[SVXSession stopSpeech](self->_currentSession, "stopSpeech");
}

- (void)transitionToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  -[SVXSession transitSpeechToAutomaticEndpointingWithTimestamp:](self->_currentSession, "transitSpeechToAutomaticEndpointingWithTimestamp:", a3);
}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  SVXSessionOperation *v13;
  id v14;
  SVXSessionOperation *v15;
  void *v16;
  SVXSessionOperation *v17;
  _QWORD v18[5];
  SVXSessionOperation *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[SVXSessionManager deactivateWithContext:completion:]";
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v9 = objc_alloc(MEMORY[0x24BE09290]);
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __54__SVXSessionManager_deactivateWithContext_completion___block_invoke;
  v22[3] = &unk_24D24E950;
  v23 = v7;
  v11 = v7;
  v12 = (void *)objc_msgSend(v9, "initWithBlock:", v22);
  v13 = [SVXSessionOperation alloc];
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_2;
  v20[3] = &unk_24D24EFF0;
  v21 = v12;
  v14 = v12;
  v15 = -[SVXSessionOperation initWithDeactivationContext:completion:](v13, "initWithDeactivationContext:completion:", v6, v20);
  -[SVXModule performer](self->_module, "performer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_3;
  v18[3] = &unk_24D24F018;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "performBlock:", v18);

}

- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__SVXSessionManager_speechSynthesizerWillStartRequest_taskTracker___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)speechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SVXModule performer](self->_module, "performer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__SVXSessionManager_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke;
  v15[3] = &unk_24D24E638;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

- (void)speechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SVXModule performer](self->_module, "performer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __88__SVXSessionManager_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke;
  v19[3] = &unk_24D24E920;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "performBlock:", v19);

}

- (void)speechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__SVXSessionManager_speechSynthesizerDidCancelRequest_taskTracker___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)speechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__SVXSessionManager_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)speechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SVXModule performer](self->_module, "performer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SVXSessionManager_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke;
  v15[3] = &unk_24D24E638;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

- (void)deviceSetupManager:(id)a3 didUpdateContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__SVXSessionManager_deviceSetupManager_didUpdateContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)localDeviceContextDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSessionManager_localDeviceContextDidUpdate___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)queue:(id)a3 didEnqueueObjects:(id)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_queuedOperations == a3)
  {
    -[SVXModule performer](self->_module, "performer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke;
    v7[3] = &unk_24D24F018;
    v7[4] = self;
    v8 = v5;
    v6 = v5;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

- (void)attachToTether
{
  void *v3;
  _QWORD v4[5];

  -[SVXModule performer](self->_module, "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SVXSessionManager_attachToTether__block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (id)_currentSession:(BOOL)a3
{
  SVXSession *currentSession;
  BOOL v5;
  NSObject *v6;
  SVXSession *v7;
  void *v8;
  SVXServiceCommandHandler *serviceCommandHandler;
  SVXSpeechSynthesizer *speechSynthesizer;
  SVXPowerLevelManager *powerLevelManager;
  void *v12;
  void *v13;
  void *v14;
  SVXSession *v15;
  SVXSession *v16;
  os_log_t *v17;
  void *v18;
  SVXSession *v19;
  SVXModule *module;
  NSObject *v21;
  SVXDeviceProblemsState *v22;
  SVXServiceCommandHandler *v23;
  SVXSpeechSynthesizer *v24;
  os_log_t v25;
  SVXSession *v26;
  SVXDeviceSetupContext *deviceSetupContext;
  AFDeviceContext *localDeviceContext;
  SVXDeviceProblemsState *deviceProblemsState;
  NSObject *v30;
  SVXSpeechSynthesizer *v31;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  SVXSession *v36;
  __int16 v37;
  SVXDeviceProblemsState *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  SVXSpeechSynthesizer *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  currentSession = self->_currentSession;
  if (currentSession)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SVXSessionManager _currentSession:]";
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Creating new session...", buf, 0xCu);
    }
    v7 = [SVXSession alloc];
    -[SVXModule performer](self->_module, "performer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    speechSynthesizer = self->_speechSynthesizer;
    serviceCommandHandler = self->_serviceCommandHandler;
    powerLevelManager = self->_powerLevelManager;
    -[SVXModule instanceContext](self->_module, "instanceContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXModule preferences](self->_module, "preferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXModule analytics](self->_module, "analytics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SVXSession initWithPerformer:serviceCommandHandler:powerLevelManager:speechSynthesizer:instanceContext:preferences:analytics:delegate:](v7, "initWithPerformer:serviceCommandHandler:powerLevelManager:speechSynthesizer:instanceContext:preferences:analytics:delegate:", v8, serviceCommandHandler, powerLevelManager, speechSynthesizer, v12, v13, v14, self);
    v16 = self->_currentSession;
    self->_currentSession = v15;

    v17 = (os_log_t *)MEMORY[0x24BE08FB0];
    v18 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v19 = self->_currentSession;
      module = self->_module;
      v21 = v18;
      -[SVXModule performer](module, "performer");
      v22 = (SVXDeviceProblemsState *)objc_claimAutoreleasedReturnValue();
      v24 = self->_speechSynthesizer;
      v23 = self->_serviceCommandHandler;
      *(_DWORD *)buf = 136316162;
      v34 = "-[SVXSessionManager _currentSession:]";
      v35 = 2112;
      v36 = v19;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      v41 = 2112;
      v42 = v24;
      _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s New session %@ created with (%@, %@, %@), configuring...", buf, 0x34u);

    }
    -[SVXSession updateDeviceProblemsState:](self->_currentSession, "updateDeviceProblemsState:", self->_deviceProblemsState);
    -[SVXSession updateDeviceSetupContext:](self->_currentSession, "updateDeviceSetupContext:", self->_deviceSetupContext);
    -[SVXSession updateLocalDeviceContext:](self->_currentSession, "updateLocalDeviceContext:", self->_localDeviceContext);
    v25 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
    {
      v26 = self->_currentSession;
      deviceSetupContext = self->_deviceSetupContext;
      deviceProblemsState = self->_deviceProblemsState;
      localDeviceContext = self->_localDeviceContext;
      v30 = v25;
      -[AFDeviceContext identifier](localDeviceContext, "identifier");
      v31 = (SVXSpeechSynthesizer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v34 = "-[SVXSessionManager _currentSession:]";
      v35 = 2112;
      v36 = v26;
      v37 = 2112;
      v38 = deviceProblemsState;
      v39 = 2112;
      v40 = deviceSetupContext;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_214934000, v30, OS_LOG_TYPE_INFO, "%s New session %@ configured with (%@, %@, %@) and is ready to go.", buf, 0x34u);

    }
    currentSession = self->_currentSession;
  }
  return currentSession;
}

- (void)_invalidateCurrentSession
{
  SVXSession *currentSession;
  SVXSession *v4;

  currentSession = self->_currentSession;
  if (currentSession)
  {
    -[SVXSession invalidate](currentSession, "invalidate");
    v4 = self->_currentSession;
    self->_currentSession = 0;

  }
}

- (void)_attachToTether
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (AFDeviceSupportsSiriMUX())
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[SVXSessionManager _attachToTether]";
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s Setting _needsClearContext to YES for MUX", (uint8_t *)&v4, 0xCu);
    }
    self->_needsClearContext = 1;
  }
  -[AFSiriTether attach:](self->_tether, "attach:", 0);
}

- (void)_processNextOperations
{
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SVXSessionManager _processNextOperations]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__SVXSessionManager__processNextOperations__block_invoke;
  v13[3] = &unk_24D24D7F0;
  v13[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199D950C](v13);
  -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v3;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SVXSessionManager _processNextOperations]";
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s currentSession = %@", buf, 0x16u);
  }
  if (v7)
  {
    -[SVXModule performer](self->_module, "performer");
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __43__SVXSessionManager__processNextOperations__block_invoke_35;
    v10[3] = &unk_24D24D588;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v9 = v11;
    objc_msgSend(v7, "getActivityStateWithCompletion:", v10);

  }
  else
  {
    v6[2](v6, 1);
  }

}

- (void)_preheatWithActivationSource:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    if ((unint64_t)a3 > 9)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24D798[a3];
    v9 = v8;
    v17 = 136315394;
    v18 = "-[SVXSessionManager _preheatWithActivationSource:]";
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s activationSource = %@", (uint8_t *)&v17, 0x16u);

  }
  if (a3 == 6)
  {
    -[SVXSessionManager _currentSession:](self, "_currentSession:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 2;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    -[SVXSessionManager _currentSession:](self, "_currentSession:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0;
LABEL_10:
    objc_msgSend(v10, "preheatWithStyle:", v12);

    return;
  }
  v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    if ((unint64_t)a3 > 9)
      v15 = CFSTR("(unknown)");
    else
      v15 = off_24D24D798[a3];
    v16 = v15;
    v17 = 136315394;
    v18 = "-[SVXSessionManager _preheatWithActivationSource:]";
    v19 = 2112;
    v20 = v16;
    _os_log_error_impl(&dword_214934000, v14, OS_LOG_TYPE_ERROR, "%s Ignored because activation source %@ does not support preheat.", (uint8_t *)&v17, 0x16u);

  }
}

- (void)_prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[SVXSessionManager _prewarmWithContext:completion:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v10, 0x16u);
  }
  -[SVXMyriadDeviceManager preheatMyriad](self->_myriadDeviceManager, "preheatMyriad");
  -[SVXSessionManager _currentSession:](self, "_currentSession:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prewarmWithContext:completion:", v6, v7);

}

- (void)_activateWithContext:(id)a3 activityState:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXSessionManager _activateWithContext:activityState:completion:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s context = %@, activityState = %ld", buf, 0x20u);
  }
  if (a4 == 1
    && ((objc_msgSend(MEMORY[0x24BDD1760], "processInfo"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v11, "systemUptime"),
         v13 = v12 - self->_lastSessionResignActiveTimestamp,
         v11,
         v13 > 60.0)
     || self->_needsClearContext))
  {
    self->_needsClearContext = 0;
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  -[SVXSessionManager _currentSession:](self, "_currentSession:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:completion:", v8, v14, self->_deviceSetupContext, self->_deviceProblemsState, self->_localDeviceContext, self->_speechSynthesisRecord, self->_speechSynthesisState, 0, v9);

}

- (void)_deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SVXSessionManager _deactivateWithContext:completion:]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v11, 0x16u);
  }
  -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "deactivateWithContext:completion:", v6, v7);
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_fetchCurrentStateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v7 = v4;
    -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "getStateWithCompletion:", v7);
    else
      v7[2](v7, 1);

    v4 = v7;
  }

}

- (void)_fetchCurrentActivityStateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v7 = v4;
    -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "getActivityStateWithCompletion:", v7);
    else
      v7[2](v7, 1);

    v4 = v7;
  }

}

- (void)_fetchCurrentAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    v9 = v6;
    -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "getAudioPowerWithType:completion:", a3, v9);
    else
      v9[2](v9, 0);

    v6 = v9;
  }

}

- (void)_handleSession:(id)a3 willChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  -[SVXSessionActivityAnnouncer sessionWillChangeFromState:toState:](self->_activityAnnouncer, "sessionWillChangeFromState:toState:", a4, a5);
}

- (void)_handleSession:(id)a3 didChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  -[SVXSessionActivityAnnouncer sessionDidChangeFromState:toState:](self->_activityAnnouncer, "sessionDidChangeFromState:toState:", a4, a5);
}

- (void)_handleSession:(id)a3 willBeginUpdateAudioPowerWithType:(int64_t)a4 wrapper:(id)a5
{
  -[SVXAudioPowerUpdateAnnouncer audioPowerWillBeginUpdateForType:wrapper:](self->_audioPowerUpdateAnnouncer, "audioPowerWillBeginUpdateForType:wrapper:", a4, a5);
}

- (void)_handleSession:(id)a3 didEndUpdateAudioPowerWithType:(int64_t)a4
{
  -[SVXAudioPowerUpdateAnnouncer audioPowerDidEndUpdateForType:](self->_audioPowerUpdateAnnouncer, "audioPowerDidEndUpdateForType:", a4);
}

- (void)_handleSession:(id)a3 willStartSoundWithID:(int64_t)a4
{
  -[SVXSessionActivityAnnouncer sessionWillStartSoundWithID:](self->_activityAnnouncer, "sessionWillStartSoundWithID:", a4);
}

- (void)_handleSession:(id)a3 didStartSoundWithID:(int64_t)a4
{
  -[SVXSessionActivityAnnouncer sessionDidStartSoundWithID:](self->_activityAnnouncer, "sessionDidStartSoundWithID:", a4);
}

- (void)_handleSession:(id)a3 didStopSoundWithID:(int64_t)a4 error:(id)a5
{
  -[SVXSessionActivityAnnouncer sessionDidStopSoundWithID:error:](self->_activityAnnouncer, "sessionDidStopSoundWithID:error:", a4, a5);
}

- (void)_handleSession:(id)a3 willBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v24[0] = CFSTR("sessionUUID");
  v12 = a5;
  objc_msgSend(a3, "sessionUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("unknown");
  v24[1] = CFSTR("activityUUID");
  v25[0] = v16;
  objc_msgSend(v12, "UUIDString");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = CFSTR("unknown");
  v25[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVXModule analytics](self->_module, "analytics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "logEventWithType:context:", 1406, v19);

  if (!v11)
  {
    v21 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_FAULT))
    {
      v22 = 136315138;
      v23 = "-[SVXSessionManager _handleSession:willBecomeActiveWithActivationContext:activityUUID:turnID:]";
      _os_log_fault_impl(&dword_214934000, v21, OS_LOG_TYPE_FAULT, "%s turnID is nil", (uint8_t *)&v22, 0xCu);
    }
  }
  -[SVXSessionActivityAnnouncer sessionWillBecomeActiveWithActivationContext:turnID:](self->_activityAnnouncer, "sessionWillBecomeActiveWithActivationContext:turnID:", v10, v11);

}

- (void)_handleSession:(id)a3 didBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  const char *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v29[0] = CFSTR("sessionUUID");
  v12 = a5;
  objc_msgSend(a3, "sessionUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("unknown");
  v29[1] = CFSTR("activityUUID");
  v30[0] = v16;
  objc_msgSend(v12, "UUIDString");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = CFSTR("unknown");
  v30[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v20 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[SVXSessionManager _handleSession:didBecomeActiveWithActivationContext:activityUUID:turnID:]";
      _os_log_fault_impl(&dword_214934000, v20, OS_LOG_TYPE_FAULT, "%s turnID is nil", buf, 0xCu);
    }
  }
  -[SVXModule analytics](self->_module, "analytics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logEventWithType:context:", 1407, v19);

  -[SVXModule instanceContext](self->_module, "instanceContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isDefault");

  if (v23)
  {
    AFRecordCoreDuetEvent();
    v24 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[SVXSessionManager _handleSession:didBecomeActiveWithActivationContext:activityUUID:turnID:]";
      _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s Donating Siri UI begin event to Biome Library", buf, 0xCu);
    }
    _recordStartEndBiomeEvent(self->_biomeQueue, CFSTR("com.apple.siri.ui.begin"), v19);
  }
  -[SVXSessionActivityAnnouncer sessionDidBecomeActiveWithActivationContext:turnID:](self->_activityAnnouncer, "sessionDidBecomeActiveWithActivationContext:turnID:", v10, v11);
  -[SVXModule performer](self->_module, "performer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __93__SVXSessionManager__handleSession_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke;
  v26[3] = &unk_24D24EFF0;
  v26[4] = self;
  objc_msgSend(v25, "performBlock:withOptions:", v26, 0);

}

- (void)_handleSession:(id)a3 willResignActiveWithOptions:(unint64_t)a4 duration:(double)a5 activityUUID:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("sessionUUID");
  v10 = a6;
  objc_msgSend(a3, "sessionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("unknown");
  v19[1] = CFSTR("activityUUID");
  v20[0] = v14;
  objc_msgSend(v10, "UUIDString");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v15;
  else
    v16 = CFSTR("unknown");
  v20[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVXModule analytics](self->_module, "analytics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logEventWithType:context:", 1408, v17);

  -[SVXSessionActivityAnnouncer sessionWillResignActiveWithOptions:duration:](self->_activityAnnouncer, "sessionWillResignActiveWithOptions:duration:", a4, a5);
}

- (void)_handleSession:(id)a3 didResignActiveWithDeactivationContext:(id)a4 activityUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  double v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  const char *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v27[0] = CFSTR("sessionUUID");
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("unknown");
  v27[1] = CFSTR("activityUUID");
  v28[0] = v13;
  objc_msgSend(v8, "UUIDString");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = CFSTR("unknown");
  v28[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVXModule analytics](self->_module, "analytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logEventWithType:context:", 1409, v16);

  -[SVXModule instanceContext](self->_module, "instanceContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isDefault");

  if (v19)
  {
    AFRecordCoreDuetEvent();
    v20 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SVXSessionManager _handleSession:didResignActiveWithDeactivationContext:activityUUID:]";
      _os_log_impl(&dword_214934000, v20, OS_LOG_TYPE_INFO, "%s Donating Siri UI end event to Biome Library", buf, 0xCu);
    }
    _recordStartEndBiomeEvent(self->_biomeQueue, CFSTR("com.apple.siri.ui.end"), v16);
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "systemUptime");
  self->_lastSessionResignActiveTimestamp = v22;

  -[SVXMyriadDeviceManager resetMyriad](self->_myriadDeviceManager, "resetMyriad");
  -[SVXSessionActivityAnnouncer sessionDidResignActiveWithDeactivationContext:](self->_activityAnnouncer, "sessionDidResignActiveWithDeactivationContext:", v9);

  -[SVXModule performer](self->_module, "performer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__SVXSessionManager__handleSession_didResignActiveWithDeactivationContext_activityUUID___block_invoke;
  v24[3] = &unk_24D24EFF0;
  v24[4] = self;
  objc_msgSend(v23, "performBlock:withOptions:", v24, 0);

}

- (void)_handleSession:(id)a3 willActivateWithContext:(id)a4
{
  id v5;

  v5 = a4;
  -[SVXSessionManager _handleMyriadForActivationContext:](self, "_handleMyriadForActivationContext:", v5);
  -[SVXSessionActivationAnnouncer sessionManager:willActivateWithContext:](self->_activationAnnouncer, "sessionManager:willActivateWithContext:", self, v5);

}

- (void)_handleSession:(id)a3 didActivateWithContext:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[SVXSessionActivationAnnouncer sessionManager:didActivateWithContext:](self->_activationAnnouncer, "sessionManager:didActivateWithContext:", self, a4);
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SVXSessionManager__handleSession_didActivateWithContext___block_invoke;
  v6[3] = &unk_24D24EFF0;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:withOptions:", v6, 0);

}

- (void)_handleSession:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5
{
  SVXMyriadDeviceManager *myriadDeviceManager;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  myriadDeviceManager = self->_myriadDeviceManager;
  v8 = a5;
  v9 = a4;
  -[SVXMyriadDeviceManager resetMyriad](myriadDeviceManager, "resetMyriad");
  -[SVXSessionActivationAnnouncer sessionManager:didNotActivateWithContext:error:](self->_activationAnnouncer, "sessionManager:didNotActivateWithContext:error:", self, v9, v8);

  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__SVXSessionManager__handleSession_didNotActivateWithContext_error___block_invoke;
  v11[3] = &unk_24D24EFF0;
  v11[4] = self;
  objc_msgSend(v10, "performBlock:withOptions:", v11, 0);

}

- (void)_handleSession:(id)a3 willDeactivateWithContext:(id)a4
{
  -[SVXSessionActivationAnnouncer sessionManager:willDeactivateWithContext:](self->_activationAnnouncer, "sessionManager:willDeactivateWithContext:", self, a4);
}

- (void)_handleSession:(id)a3 didDeactivateWithContext:(id)a4
{
  SVXSessionActivationAnnouncer *activationAnnouncer;
  id v6;
  void *v7;
  _QWORD v8[5];

  activationAnnouncer = self->_activationAnnouncer;
  v6 = a4;
  -[SVXSessionActivationAnnouncer sessionManager:didDeactivateWithContext:](activationAnnouncer, "sessionManager:didDeactivateWithContext:", self, v6);
  -[SVXSessionActivityAnnouncer sessionDidDeactivateWithContext:](self->_activityAnnouncer, "sessionDidDeactivateWithContext:", v6);

  -[SVXModule performer](self->_module, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__SVXSessionManager__handleSession_didDeactivateWithContext___block_invoke;
  v8[3] = &unk_24D24EFF0;
  v8[4] = self;
  objc_msgSend(v7, "performBlock:withOptions:", v8, 0);

}

- (void)_handleSession:(id)a3 audioSessionWillBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
  -[SVXSessionActivityAnnouncer audioSessionWillBecomeActive:activationContext:deactivationContext:](self->_activityAnnouncer, "audioSessionWillBecomeActive:activationContext:deactivationContext:", a4, a5, a6);
}

- (void)_handleSession:(id)a3 audioSessionDidBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
  -[SVXSessionActivityAnnouncer audioSessionDidBecomeActive:activationContext:deactivationContext:](self->_activityAnnouncer, "audioSessionDidBecomeActive:activationContext:deactivationContext:", a4, a5, a6);
}

- (void)_fetchStereoPartnerLastMyriadWinDate
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 *p_buf;
  id v10;
  id location;
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SVXSessionManager _fetchStereoPartnerLastMyriadWinDate]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8215;
  v15 = __Block_byref_object_dispose__8216;
  v16 = objc_alloc_init(MEMORY[0x24BE092B8]);
  objc_initWeak(&location, self);
  v5 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke;
  v7[3] = &unk_24D24D5B0;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v10, &location);
  p_buf = &buf;
  objc_msgSend(v5, "getStereoPartnerLastMyriadWinDate:", v7);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

- (void)_handleFetchedStereoPartnerLastMyriadWinDate:(id)a3
{
  NSDate *v4;
  NSObject *v5;
  NSDate *lastStereoPartnerMyriadWin;
  int v7;
  const char *v8;
  __int16 v9;
  NSDate *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (NSDate *)a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXSessionManager _handleFetchedStereoPartnerLastMyriadWinDate:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s lastWin = %@", (uint8_t *)&v7, 0x16u);
  }
  lastStereoPartnerMyriadWin = self->_lastStereoPartnerMyriadWin;
  self->_lastStereoPartnerMyriadWin = v4;

}

- (void)_fetchStereoPairStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SVXSessionManager _fetchStereoPairStateWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (v4)
  {
    -[SVXModule performer](self->_module, "performer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__8215;
    v16 = __Block_byref_object_dispose__8216;
    v17 = objc_alloc_init(MEMORY[0x24BE092B8]);
    v7 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke;
    v9[3] = &unk_24D24D600;
    v8 = v6;
    v10 = v8;
    v11 = v4;
    p_buf = &buf;
    objc_msgSend(v7, "getStereoPairState:", v9);

    _Block_object_dispose(&buf, 8);
  }

}

- (void)_handleSessionDidInvalidate:(id)a3
{
  SVXSession *v4;
  SVXSession *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (SVXSession *)a3;
  v5 = v4;
  if (self->_currentSession == v4)
  {
    self->_currentSession = 0;

  }
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSessionManager__handleSessionDidInvalidate___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  objc_msgSend(v6, "performBlock:withOptions:", v7, 0);

}

- (void)_handleWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  -[SVXSessionActivityAnnouncer sessionWillProcessAppLaunchWithBundleIdentifier:](self->_activityAnnouncer, "sessionWillProcessAppLaunchWithBundleIdentifier:", a3);
}

- (void)_handleDidFailAppLaunchWithBundleIdentifier:(id)a3
{
  -[SVXSessionActivityAnnouncer sessionDidFailAppLaunchWithBundleIdentifier:](self->_activityAnnouncer, "sessionDidFailAppLaunchWithBundleIdentifier:", a3);
}

- (void)_handleSpeechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "context", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SVXSessionActivityAnnouncer sessionWillPresentFeedbackWithDialogIdentifier:](self->_activityAnnouncer, "sessionWillPresentFeedbackWithDialogIdentifier:", v6);
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = CFSTR("speaking");
    v10 = 136315394;
    v11 = "-[SVXSessionManager _handleSpeechSynthesizerWillStartRequest:taskTracker:]";
    v12 = 2112;
    v13 = CFSTR("speaking");
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v10, 0x16u);

  }
  self->_speechSynthesisState = 2;

}

- (void)_handleSpeechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  AFSpeechSynthesisRecord *v15;
  AFSpeechSynthesisRecord *speechSynthesisRecord;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  v11 = (NSObject **)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = CFSTR("speaking");
    v17 = 136315394;
    v18 = "-[SVXSessionManager _handleSpeechSynthesizerDidStartRequest:record:taskTracker:]";
    v19 = 2112;
    v20 = CFSTR("speaking");
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v17, 0x16u);

    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v17 = 136315394;
    v18 = "-[SVXSessionManager _handleSpeechSynthesizerDidStartRequest:record:taskTracker:]";
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s speechSynthesisRecord = %@", (uint8_t *)&v17, 0x16u);
  }
  self->_speechSynthesisState = 2;
  v15 = (AFSpeechSynthesisRecord *)-[__CFString copy](v9, "copy");
  speechSynthesisRecord = self->_speechSynthesisRecord;
  self->_speechSynthesisRecord = v15;

}

- (void)_handleSpeechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  NSObject **v14;
  NSObject *v15;
  NSObject *v16;
  __CFString *v17;
  AFSpeechSynthesisRecord *v18;
  AFSpeechSynthesisRecord *speechSynthesisRecord;
  int v20;
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = (NSObject **)MEMORY[0x24BE08FB0];
  v15 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = CFSTR("idle");
    v20 = 136315394;
    v21 = "-[SVXSessionManager _handleSpeechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:]";
    v22 = 2112;
    v23 = CFSTR("idle");
    _os_log_impl(&dword_214934000, v16, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v20, 0x16u);

    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "-[SVXSessionManager _handleSpeechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:]";
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s speechSynthesisRecord = %@", (uint8_t *)&v20, 0x16u);
  }
  self->_speechSynthesisState = 1;
  v18 = (AFSpeechSynthesisRecord *)-[__CFString copy](v12, "copy");
  speechSynthesisRecord = self->_speechSynthesisRecord;
  self->_speechSynthesisRecord = v18;

}

- (void)_handleSpeechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = CFSTR("idle");
    v8 = 136315394;
    v9 = "-[SVXSessionManager _handleSpeechSynthesizerDidCancelRequest:taskTracker:]";
    v10 = 2112;
    v11 = CFSTR("idle");
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v8, 0x16u);

  }
  self->_speechSynthesisState = 1;
}

- (void)_handleSpeechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = CFSTR("idle");
    v8 = 136315394;
    v9 = "-[SVXSessionManager _handleSpeechSynthesizerDidInterruptRequest:taskTracker:]";
    v10 = 2112;
    v11 = CFSTR("idle");
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v8, 0x16u);

  }
  self->_speechSynthesisState = 1;
}

- (void)_handleSpeechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  void *v6;
  NSObject *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = CFSTR("idle");
    v9 = 136315394;
    v10 = "-[SVXSessionManager _handleSpeechSynthesizerDidFailRequest:taskTracker:error:]";
    v11 = 2112;
    v12 = CFSTR("idle");
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v9, 0x16u);

  }
  self->_speechSynthesisState = 1;
}

- (void)_handleDeviceProblemsStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  SVXDeviceProblemsState *v6;
  SVXDeviceProblemsState *deviceProblemsState;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[SVXSessionManager _handleDeviceProblemsStateChanged:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s deviceProblemsState = %@", (uint8_t *)&v9, 0x16u);
  }
  v6 = (SVXDeviceProblemsState *)objc_msgSend(v4, "copy");
  deviceProblemsState = self->_deviceProblemsState;
  self->_deviceProblemsState = v6;

  -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateDeviceProblemsState:", v4);

}

- (void)_handleDeviceSetupContextChanged:(id)a3
{
  id v4;
  NSObject *v5;
  SVXDeviceSetupContext *v6;
  SVXDeviceSetupContext *deviceSetupContext;
  void *v8;
  void *v9;
  uint64_t IsActive;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[SVXSessionManager _handleDeviceSetupContextChanged:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@", (uint8_t *)&v12, 0x16u);
  }
  v6 = (SVXDeviceSetupContext *)objc_msgSend(v4, "copy");
  deviceSetupContext = self->_deviceSetupContext;
  self->_deviceSetupContext = v6;

  self->_needsClearContext = 1;
  objc_msgSend(v4, "beginDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsActive = AFDeviceSetupIsActive();

  -[SVXMyriadDeviceManager setupEnabled:](self->_myriadDeviceManager, "setupEnabled:", IsActive);
  -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateDeviceSetupContext:", v4);

}

- (void)_handleLocalDeviceContextChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  AFDeviceContext *v8;
  AFDeviceContext *localDeviceContext;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SVXSessionManager _handleLocalDeviceContextChanged:]";
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", (uint8_t *)&v11, 0x16u);

  }
  v8 = (AFDeviceContext *)objc_msgSend(v4, "copy");
  localDeviceContext = self->_localDeviceContext;
  self->_localDeviceContext = v8;

  -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateLocalDeviceContext:", v4);

}

- (void)_handleMyriadForActivationContext:(id)a3
{
  __CFString *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  SVXMyriadDeviceManager *myriadDeviceManager;
  os_log_t v17;
  NSObject *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  id myriadToken;
  NSObject *v23;
  __CFString *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __CFString *v50;
  id v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  __CFString *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  __CFString *v69;
  __CFString *v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  __CFString *v74;
  __int16 v75;
  __CFString *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
    v73 = 2112;
    v74 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  -[__CFString requestInfo](v4, "requestInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speechRequestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "myriadContext");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scdaContext");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  switch(-[__CFString source](v4, "source"))
  {
    case 1:
    case 2:
    case 9:
      -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 6:
      -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 7:
      if ((objc_msgSend(v7, "isSpeechRequest") & 1) == 0)
        goto LABEL_48;
      v36 = objc_msgSend(v8, "isVoiceTrigger");
      -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v36 & 1) != 0)
      {
LABEL_17:
        v69 = v9;
        objc_msgSend(v11, "beginWaitingForMyriadDecision");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        myriadToken = self->_myriadToken;
        self->_myriadToken = v21;

        v23 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          v24 = (__CFString *)self->_myriadToken;
          *(_DWORD *)buf = 136315394;
          v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
          v73 = 2112;
          v74 = v24;
          _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_INFO, "%s Begin waiting for Myriad token %@.", buf, 0x16u);
        }
        -[AFDeviceContext playbackStateSnapshot](self->_localDeviceContext, "playbackStateSnapshot");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v65, "playbackState");
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "systemUptime");
        v27 = v26;
        -[AFDeviceContext playbackStateMetadata](self->_localDeviceContext, "playbackStateMetadata");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "deliveryDate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "timeIntervalSinceNow");
        v29 = v28;
        -[AFDeviceContext alarmSnapshot](self->_localDeviceContext, "alarmSnapshot");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFDeviceContext timerSnapshot](self->_localDeviceContext, "timerSnapshot");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v30;
        v33 = v31;
        v70 = (__CFString *)objc_alloc_init(MEMORY[0x24BE09240]);
        v34 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v35 = v34;
        if (v25 == 4)
        {
          objc_msgSend(v34, "addObject:", &unk_24D26F040);
          -[__CFString setMediaPlaybackInterruptedTime:](v70, "setMediaPlaybackInterruptedTime:", v27 + v29);
        }
        else if (v25 == 1)
        {
          objc_msgSend(v34, "addObject:", &unk_24D26F028);
        }
        v67 = v10;
        v68 = v7;
        objc_msgSend(v32, "notifiedFiringAlarmIDs");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "count"))
        {

        }
        else
        {
          objc_msgSend(v33, "notifiedFiringTimerIDs");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (!v39)
            goto LABEL_30;
        }
        objc_msgSend(v35, "addObject:", &unk_24D26F058);
LABEL_30:
        -[__CFString setReasons:](v70, "setReasons:", v35);

        v40 = *MEMORY[0x24BE08FB0];
        v9 = v69;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
          v73 = 2112;
          v74 = v70;
          v75 = 2112;
          v76 = v69;
          _os_log_impl(&dword_214934000, v40, OS_LOG_TYPE_INFO, "%s Myriad configured for Voice Trigger with goodness score context %@ and myriadContext %@.", buf, 0x20u);
        }
        if (!objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
        {
          -[SVXMyriadDeviceManager startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:](self->_myriadDeviceManager, "startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:", 0, v70, v69, 0);
          v53 = v70;
          v10 = v67;
          v7 = v68;
LABEL_45:

          goto LABEL_49;
        }
        -[AFDeviceContext playbackStateSnapshot](self->_localDeviceContext, "playbackStateSnapshot");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v66, "playbackState");
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "systemUptime");
        v43 = v42;
        -[AFDeviceContext playbackStateMetadata](self->_localDeviceContext, "playbackStateMetadata");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "deliveryDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "timeIntervalSinceNow");
        v45 = v44;
        -[AFDeviceContext alarmSnapshot](self->_localDeviceContext, "alarmSnapshot");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFDeviceContext timerSnapshot](self->_localDeviceContext, "timerSnapshot");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v46;
        v49 = v47;
        v50 = (__CFString *)objc_alloc_init(MEMORY[0x24BE92088]);
        v51 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v52 = v51;
        if (v41 == 4)
        {
          objc_msgSend(v51, "addObject:", &unk_24D26F040);
          -[__CFString setMediaPlaybackInterruptedTime:](v50, "setMediaPlaybackInterruptedTime:", v43 + v45);
        }
        else if (v41 == 1)
        {
          objc_msgSend(v51, "addObject:", &unk_24D26F028);
        }
        objc_msgSend(v48, "notifiedFiringAlarmIDs");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "count"))
        {

        }
        else
        {
          objc_msgSend(v49, "notifiedFiringTimerIDs");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v55, "count");

          if (!v58)
          {
LABEL_42:
            -[__CFString setReasons:](v50, "setReasons:", v52);

            v56 = *MEMORY[0x24BE08FB0];
            v10 = v67;
            v7 = v68;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
              v73 = 2112;
              v74 = v50;
              v75 = 2112;
              v76 = v67;
              _os_log_impl(&dword_214934000, v56, OS_LOG_TYPE_INFO, "%s Myriad configured for Voice Trigger with scdaGoodnessScoreContext: %@ and scdaContext: %@.", buf, 0x20u);
            }
            -[SVXMyriadDeviceManager startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:](self->_myriadDeviceManager, "startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:", 0, v50, v67, 0);

            v9 = v69;
            v53 = v70;
            goto LABEL_45;
          }
        }
        objc_msgSend(v52, "addObject:", &unk_24D26F058);
        goto LABEL_42;
      }
LABEL_5:
      v12 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
        v73 = 2112;
        v74 = v9;
        _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s Myriad configured for Direct Trigger with myriadContext %@.", buf, 0x16u);
      }
      objc_msgSend(v11, "beginWaitingForMyriadDecision");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
        v73 = 2112;
        v74 = v10;
        _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s Myriad configured for Direct Trigger with scdaContext %@.", buf, 0x16u);
      }
      v15 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
      myriadDeviceManager = self->_myriadDeviceManager;
      if (v15)
        -[SVXMyriadDeviceManager startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:](myriadDeviceManager, "startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:", 1, 0, v10, 0);
      else
        -[SVXMyriadDeviceManager startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:](myriadDeviceManager, "startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:", 1, 0, v9, 0);
      objc_msgSend(v11, "endWaitingForMyriadDecisionWithToken:result:", v13, 1);

LABEL_49:
      return;
    default:
      v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        v19 = -[__CFString source](v4, "source");
        if (v19 > 9)
          v20 = CFSTR("(unknown)");
        else
          v20 = off_24D24D798[v19];
        v57 = v20;
        *(_DWORD *)buf = 136315394;
        v72 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
        v73 = 2112;
        v74 = v57;
        _os_log_error_impl(&dword_214934000, v18, OS_LOG_TYPE_ERROR, "%s Ignored because Myriad behavior undefined for Unspecified Activation Source: %@", buf, 0x16u);

      }
LABEL_48:
      -[SVXSessionManager _currentSession:](self, "_currentSession:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
  }
}

- (void)initiateEmergency:(id)a3
{
  void *v4;
  int v5;
  SVXMyriadDeviceManager *myriadDeviceManager;
  id v7;

  v4 = (void *)MEMORY[0x24BE091E0];
  v7 = a3;
  v5 = objc_msgSend(v4, "isSCDAFrameworkEnabled");
  myriadDeviceManager = self->_myriadDeviceManager;
  if (v5)
    -[SVXMyriadDeviceManager startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:](myriadDeviceManager, "startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:", 4, 0, 0, v7);
  else
    -[SVXMyriadDeviceManager startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:](myriadDeviceManager, "startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:", 4, 0, 0, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_coreDuetQueue, 0);
  objc_storeStrong((id *)&self->_localDeviceContext, 0);
  objc_storeStrong((id *)&self->_deviceProblemsState, 0);
  objc_storeStrong((id *)&self->_speechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_deviceSetupContext, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_activityAnnouncer, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdateAnnouncer, 0);
  objc_storeStrong((id *)&self->_activationAnnouncer, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_tether, 0);
  objc_storeStrong((id *)&self->_lastStereoPartnerMyriadWin, 0);
  objc_storeStrong((id *)&self->_currentMyriadCoordinatedRequestAssertion, 0);
  objc_storeStrong((id *)&self->_myriadDeviceManager, 0);
  objc_storeStrong(&self->_myriadToken, 0);
  objc_storeStrong((id *)&self->_audioServicesUtils, 0);
  objc_storeStrong((id *)&self->_serviceCommandHandler, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_powerLevelManager, 0);
  objc_storeStrong((id *)&self->_deviceProblemsNotifyObserver, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

uint64_t __49__SVXSessionManager__handleSessionDidInvalidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

void __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SVXSessionManager _fetchStereoPairStateWithCompletion:]_block_invoke";
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke_48;
  v10[3] = &unk_24D24D5D8;
  v7 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  objc_msgSend(v7, "performBlock:", v10);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

uint64_t __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[SVXSessionManager _fetchStereoPartnerLastMyriadWinDate]_block_invoke";
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke_46;
    v11[3] = &unk_24D24F0E0;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = v5;
    objc_msgSend(v8, "performBlock:", v11);

    objc_destroyWeak(&v13);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke_46(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleFetchedStereoPartnerLastMyriadWinDate:", *(_QWORD *)(a1 + 32));

}

uint64_t __61__SVXSessionManager__handleSession_didDeactivateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

uint64_t __68__SVXSessionManager__handleSession_didNotActivateWithContext_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

uint64_t __59__SVXSessionManager__handleSession_didActivateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

uint64_t __88__SVXSessionManager__handleSession_didResignActiveWithDeactivationContext_activityUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

uint64_t __93__SVXSessionManager__handleSession_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

void __43__SVXSessionManager__processNextOperations__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "dequeueObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXSessionManager _processNextOperations]_block_invoke";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s dequeuedOperation = %@", buf, 0x16u);
  }
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__SVXSessionManager__processNextOperations__block_invoke_32;
    v7[3] = &unk_24D24D510;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__SVXSessionManager__processNextOperations__block_invoke_2;
    v6[3] = &unk_24D24D538;
    v6[4] = v8;
    objc_msgSend(v4, "handleOperationUsingActivationBlock:deactivationBlock:", v7, v6);
  }

}

void __43__SVXSessionManager__processNextOperations__block_invoke_35(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    if (a2 > 4)
      v6 = CFSTR("(unknown)");
    else
      v6 = off_24D24D0D0[a2];
    v7 = v6;
    *(_DWORD *)buf = 136315394;
    v13 = "-[SVXSessionManager _processNextOperations]_block_invoke";
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s activityState = %@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__SVXSessionManager__processNextOperations__block_invoke_36;
  v9[3] = &unk_24D24D560;
  v11 = a2;
  v8 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "performBlock:", v9);

}

uint64_t __43__SVXSessionManager__processNextOperations__block_invoke_36(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1 == 4 || v1 == 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __43__SVXSessionManager__processNextOperations__block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithContext:activityState:completion:", a2, *(_QWORD *)(a1 + 40), a3);
}

uint64_t __43__SVXSessionManager__processNextOperations__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateWithContext:completion:", a2, a3);
}

uint64_t __35__SVXSessionManager_attachToTether__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attachToTether");
}

uint64_t __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count");
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SVXSessionManager queue:didEnqueueObjects:]_block_invoke";
    v9 = 2048;
    v10 = v2;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s numberOfQueuedOperations = %lu", buf, 0x16u);
  }
  if (v2 < 2)
    return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke_30;
  v6[3] = &unk_24D24EFF0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "performBlock:withOptions:", v6, 0);
}

uint64_t __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextOperations");
}

uint64_t __49__SVXSessionManager_localDeviceContextDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLocalDeviceContextChanged:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__SVXSessionManager_deviceSetupManager_didUpdateContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceSetupContextChanged:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__SVXSessionManager_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidFailRequest:taskTracker:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __70__SVXSessionManager_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidInterruptRequest:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __67__SVXSessionManager_speechSynthesizerDidCancelRequest_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidCancelRequest:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __88__SVXSessionManager_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __73__SVXSessionManager_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidStartRequest:record:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __67__SVXSessionManager_speechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerWillStartRequest:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54__SVXSessionManager_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

uint64_t __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "enqueueObject:", *(_QWORD *)(a1 + 40));
}

void __52__SVXSessionManager_activateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = (void *)MEMORY[0x2199D950C](v5);
    v9 = 136315394;
    v10 = "-[SVXSessionManager activateWithContext:completion:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_DEFAULT, "%s completion:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

uint64_t __52__SVXSessionManager_activateWithContext_completion___block_invoke_28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

uint64_t __52__SVXSessionManager_activateWithContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "enqueueObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__SVXSessionManager_continuousVoiceTriggerDetectedWithCompletion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t result;

  v2 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
    objc_msgSend(v3, "startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:", 3, 0, 0, 0);
  else
    objc_msgSend(v3, "startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:", 3, 0, 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__SVXSessionManager_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prewarmWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__SVXSessionManager_session_didFailAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFailAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__SVXSessionManager_session_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWillProcessAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__SVXSessionManager_sessionDidInvalidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionDidInvalidate:", *(_QWORD *)(a1 + 40));
}

uint64_t __95__SVXSessionManager_session_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:audioSessionDidBecomeActive:activationContext:deactivationContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __96__SVXSessionManager_session_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:audioSessionWillBecomeActive:activationContext:deactivationContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __54__SVXSessionManager_session_didDeactivateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didDeactivateWithContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55__SVXSessionManager_session_willDeactivateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willDeactivateWithContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61__SVXSessionManager_session_didNotActivateWithContext_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didNotActivateWithContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __52__SVXSessionManager_session_didActivateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didActivateWithContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53__SVXSessionManager_session_willActivateWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willActivateWithContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81__SVXSessionManager_session_didResignActiveWithDeactivationContext_activityUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didResignActiveWithDeactivationContext:activityUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __79__SVXSessionManager_session_willResignActiveWithOptions_duration_activityUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willResignActiveWithOptions:duration:activityUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
}

uint64_t __86__SVXSessionManager_session_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didBecomeActiveWithActivationContext:activityUUID:turnID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __87__SVXSessionManager_session_willBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willBecomeActiveWithActivationContext:activityUUID:turnID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __54__SVXSessionManager_session_didStopSoundWithID_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didStopSoundWithID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __49__SVXSessionManager_session_didStartSoundWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didStartSoundWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__SVXSessionManager_session_willStartSoundWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willStartSoundWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __60__SVXSessionManager_session_didEndUpdateAudioPowerWithType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didEndUpdateAudioPowerWithType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71__SVXSessionManager_session_willBeginUpdateAudioPowerWithType_wrapper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willBeginUpdateAudioPowerWithType:wrapper:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __56__SVXSessionManager_session_didChangeFromState_toState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:didChangeFromState:toState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __57__SVXSessionManager_session_willChangeFromState_toState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSession:willChangeFromState:toState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __58__SVXSessionManager_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceProblemsStateChanged:", *(_QWORD *)(a1 + 40));
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "attachToTether");

  }
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_3;
  v6[3] = &unk_24D24F0E0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

  objc_destroyWeak(&v8);
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_5;
  v6[3] = &unk_24D24F0E0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

  objc_destroyWeak(&v8);
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleLocalDeviceContextChanged:", *(_QWORD *)(a1 + 32));

}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDeviceSetupContextChanged:", *(_QWORD *)(a1 + 32));

}

uint64_t __36__SVXSessionManager_initWithModule___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStereoPartnerLastMyriadWinDate");
}

uint64_t __52__SVXSessionManager__myriadStereoPartnerDataChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStereoPartnerLastMyriadWinDate");
}

void __33__SVXSessionManager_unduckDevice__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  if (v2)
  {
    *(_QWORD *)(v1 + 72) = 0;

    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[SVXSessionManager unduckDevice]_block_invoke";
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s BTLE released audio session tracker", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __44__SVXSessionManager_deviceWonMyriadElection__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[7];
  if (v2)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[SVXSessionManager deviceWonMyriadElection]_block_invoke";
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s End waiting for Myriad token %@ as won.", (uint8_t *)&v8, 0x16u);
      v1 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v1, "_currentSession:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endWaitingForMyriadDecisionWithToken:result:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 1);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = 0;

  }
}

void __45__SVXSessionManager_deviceLostMyriadElection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SVXActivationContext *v9;
  uint64_t v10;
  void *v11;
  SVXActivationContext *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  SVXDeactivationContext *v24;
  uint64_t v25;
  SVXDeactivationContext *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  v4 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v3)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s End waiting for Myriad token %@ as lost.", buf, 0x16u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "_currentSession:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endWaitingForMyriadDecisionWithToken:result:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 0);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 80))
  {
    v9 = [SVXActivationContext alloc];
    v10 = *(_QWORD *)(a1 + 48);
    SVXClientInfoGetCurrent();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v9, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 3, v10, 0, 0, v11, 0, 0);

    v13 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s BTLE willObtainTracker", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_currentSession:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_10;
    v27[3] = &unk_24D24DED0;
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v28 = v15;
    v29 = v16;
    objc_msgSend(v14, "activateWithContext:completion:", v12, v27);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 72);
    *(_QWORD *)(v18 + 72) = v17;

    v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      *(_DWORD *)buf = 136315394;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_214934000, v20, OS_LOG_TYPE_INFO, "%s BTLE didObtainTracker = %@", buf, 0x16u);
    }
    v22 = v28;
  }
  else
  {
    v23 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_INFO, "%s BTLE deactivate", buf, 0xCu);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "_currentSession:", 0);
    v12 = (SVXActivationContext *)objc_claimAutoreleasedReturnValue();
    v24 = [SVXDeactivationContext alloc];
    v25 = *(_QWORD *)(a1 + 48);
    SVXClientInfoGetCurrent();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:](v24, "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", 3, v25, 0, v22, 0, 0);
    -[SVXActivationContext deactivateWithContext:completion:](v12, "deactivateWithContext:completion:", v26, 0);

  }
}

void __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_2;
  v7[3] = &unk_24D24F018;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 72);
    *(_QWORD *)(v2 + 72) = 0;

    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315394;
      v7 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke_2";
      v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s BTLE released audio session tracker (error = %@)", (uint8_t *)&v6, 0x16u);
    }
  }
}

uint64_t __44__SVXSessionManager_removeActivityListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__SVXSessionManager_addActivityListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__SVXSessionManager_removeAudioPowerUpdateListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__SVXSessionManager_addAudioPowerUpdateListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__SVXSessionManager_removeActivationListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__SVXSessionManager_addActivationListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addListener:", *(_QWORD *)(a1 + 40));
}

void __59__SVXSessionManager_getAudioSessionProviderWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_currentSession:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __49__SVXSessionManager_getCurrentSessionUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_currentSession:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__SVXSessionManager_fetchCurrentAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_currentSession:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAlarmAndTimerFiringContextWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __63__SVXSessionManager_fetchCurrentAudioPowerWithType_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentAudioPowerWithType:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke_2;
  v2[3] = &unk_24D24E950;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_fetchCurrentActivityStateWithCompletion:", v2);

}

uint64_t __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 4);
}

uint64_t __53__SVXSessionManager_fetchCurrentStateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentStateWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__SVXSessionManager_preheatWithActivationSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preheatWithActivationSource:", *(_QWORD *)(a1 + 40));
}

@end
