@implementation VTUIProximityEnrollTrainingViewController

- (VTUIProximityEnrollTrainingViewController)init
{
  VTUIProximityEnrollTrainingViewController *v2;
  AFSettingsConnection *v3;
  AFSettingsConnection *settings;
  dispatch_queue_t v5;
  OS_dispatch_queue *settingsQueue;
  VTUIAnalytics *v7;
  VTUIAnalytics *analyticsEvent;
  VTUIAnalytics *v9;
  void *v10;
  VTUIEnrollmentPageEligibilityProvider *v11;
  VTUIEnrollmentPageEligibilityProvider *pageEligibilityProvider;
  uint64_t v13;
  AFUISiriLanguage *siriLanguage;
  uint64_t v15;
  NSString *spokenLanguageCode;
  void *v17;
  uint64_t v18;
  NSString *v19;
  NSObject *v20;
  NSString *v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  UIView *aboutTappedSender;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  VTUIAudioHintPlayer *v40;
  VTUIAudioHintPlayer *audioHintPlayer;
  VTUISiriDataSharingOptInPresenter *v42;
  VTUISiriDataSharingOptInPresenter *siriDataSharingOptInPresenter;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  NSString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  v2 = -[VTUIProximityEnrollTrainingViewController init](&v45, sel_init);
  if (v2)
  {
    VTUILogInitIfNeeded();
    v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    settings = v2->_settings;
    v2->_settings = v3;

    v5 = dispatch_queue_create("com.apple.siri.amnesia", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v5;

    -[VTUIProximityEnrollTrainingViewController _gatherAudioDeviceInfo](v2, "_gatherAudioDeviceInfo");
    v7 = objc_alloc_init(VTUIAnalytics);
    analyticsEvent = v2->_analyticsEvent;
    v2->_analyticsEvent = v7;

    v9 = v2->_analyticsEvent;
    -[VTUIProximityEnrollTrainingViewController _getSetupModeString](v2, "_getSetupModeString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIAnalytics setSetupMode:](v9, "setSetupMode:", v10);

    v11 = objc_alloc_init(VTUIEnrollmentPageEligibilityProvider);
    pageEligibilityProvider = v2->_pageEligibilityProvider;
    v2->_pageEligibilityProvider = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE09528]), "initWithDelegate:", v2);
    siriLanguage = v2->_siriLanguage;
    v2->_siriLanguage = (AFUISiriLanguage *)v13;

    -[AFUISiriLanguage spokenLanguageCode](v2->_siriLanguage, "spokenLanguageCode");
    v15 = objc_claimAutoreleasedReturnValue();
    spokenLanguageCode = v2->_spokenLanguageCode;
    v2->_spokenLanguageCode = (NSString *)v15;

    if (!v2->_spokenLanguageCode)
    {
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bestSupportedLanguageCodeForLanguageCode:", 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v2->_spokenLanguageCode;
      v2->_spokenLanguageCode = (NSString *)v18;

      v20 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v2->_spokenLanguageCode;
        *(_DWORD *)buf = 136315394;
        v47 = "-[VTUIProximityEnrollTrainingViewController init]";
        v48 = 2112;
        v49 = v21;
        _os_log_impl(&dword_229EF7000, v20, OS_LOG_TYPE_DEFAULT, "%s No Siri language code found, falling back to: %@", buf, 0x16u);
      }
    }
    v22 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v2->_spokenLanguageCode;
      *(_DWORD *)buf = 136315394;
      v47 = "-[VTUIProximityEnrollTrainingViewController init]";
      v48 = 2112;
      v49 = v23;
      _os_log_impl(&dword_229EF7000, v22, OS_LOG_TYPE_DEFAULT, "%s Initializing with language code: %@", buf, 0x16u);
    }
    if (v2->_spokenLanguageCode)
    {
      +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setSiriLanguage:", v2->_spokenLanguageCode);

      v25 = v2->_spokenLanguageCode;
    }
    else
    {
      v25 = 0;
    }
    -[VTUIAnalytics setLanguageCode:](v2->_analyticsEvent, "setLanguageCode:", v25);
    v2->_shouldTurnOnMyriad = 1;
    v26 = (void *)*MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v2->_spokenLanguageCode;
      v28 = v26;
      +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "heySiriTriggerPhrase");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v47 = "-[VTUIProximityEnrollTrainingViewController init]";
      v48 = 2112;
      v49 = v27;
      v50 = 2112;
      v51 = v30;
      _os_log_impl(&dword_229EF7000, v28, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code: %@. (Trigger: '%@')", buf, 0x20u);

    }
    v31 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[VTUIProximityEnrollTrainingViewController init]";
      _os_log_impl(&dword_229EF7000, v31, OS_LOG_TYPE_DEFAULT, "%s Setting the current training state in VTUIEnrollTrainingViewController to kVTUITrainingStateNotStarted", buf, 0xCu);
    }
    v2->_currentTrainingState = -1;
    aboutTappedSender = v2->_aboutTappedSender;
    v2->_aboutTappedSender = 0;

    if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
    {
      objc_msgSend(MEMORY[0x24BE92080], "currentCoordinator");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(MEMORY[0x24BE92080], "currentCoordinator");
        v34 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = objc_msgSend(objc_alloc(MEMORY[0x24BE92080]), "initWithDelegate:", v2);
      }
      v36 = 1264;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE09238], "currentCoordinator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(MEMORY[0x24BE09238], "currentCoordinator");
        v34 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = objc_msgSend(objc_alloc(MEMORY[0x24BE09238]), "initWithDelegate:", v2);
      }
      v36 = 1256;
    }
    v37 = *(Class *)((char *)&v2->super.super.super.isa + v36);
    *(Class *)((char *)&v2->super.super.super.isa + v36) = (Class)v34;

    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setIsBuddyOrFollowUp:", PSIsRunningInAssistant());
    v39 = objc_msgSend(v38, "proxAccessorySupportsCompactTrigger")
       && (objc_msgSend(v38, "shouldSetupForMultipleTriggerPhrases") & 1) != 0
       || -[VTUIProximityEnrollTrainingViewController simulateJSSupportingDeviceForTesting](v2, "simulateJSSupportingDeviceForTesting");
    v40 = -[VTUIAudioHintPlayer initWithLanguage:isCompact:]([VTUIAudioHintPlayer alloc], "initWithLanguage:isCompact:", v2->_spokenLanguageCode, v39);
    audioHintPlayer = v2->_audioHintPlayer;
    v2->_audioHintPlayer = v40;

    v42 = objc_alloc_init(VTUISiriDataSharingOptInPresenter);
    siriDataSharingOptInPresenter = v2->_siriDataSharingOptInPresenter;
    v2->_siriDataSharingOptInPresenter = v42;

    -[VTUISiriDataSharingOptInPresenter setPresentationDelegate:](v2->_siriDataSharingOptInPresenter, "setPresentationDelegate:", v2);
    -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](v2->_siriDataSharingOptInPresenter, "setSourceOfChange:", 3);
    -[VTUIProximityEnrollTrainingViewController _setupMode](v2, "_setupMode");

  }
  return v2;
}

- (VTUIProximityEnrollTrainingViewController)initWithEnrollmentMode:(int64_t)a3
{
  VTUIProximityEnrollTrainingViewController *result;

  result = -[VTUIProximityEnrollTrainingViewController init](self, "init");
  if (a3)
    result->_enrollmentMode = a3;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  -[VTUIAnalytics logEvent](self->_analyticsEvent, "logEvent");
  if (-[VTUIProximityEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "deleteUserVoiceProfile:", v4);

  }
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  -[VTUIProximityEnrollTrainingViewController dealloc](&v7, sel_dealloc);
}

- (void)_setupMode
{
  id v2;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnrollmentMode:", 4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  VTUILogInitIfNeeded();
  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  -[VTUIProximityEnrollTrainingViewController viewDidLoad](&v11, sel_viewDidLoad);
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupForCurrentLocaleAndSiriLanguage");

  -[VTUIProximityEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
  -[VTUIProximityEnrollTrainingViewController _setupEnrollTrainingView](self, "_setupEnrollTrainingView");
  -[VTUIProximityEnrollTrainingView skipButton](self->_enrollTrainingView, "skipButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_skipTraining_, 64);

  -[VTUIProximityEnrollTrainingView dismissButton](self->_enrollTrainingView, "dismissButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__dismiss_, 64);

  -[VTUIProximityEnrollTrainingView instructionPreludeLabel](self->_enrollTrainingView, "instructionPreludeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  v7 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[VTUIProximityEnrollTrainingViewController viewDidLoad]";
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Main View Loaded", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__resignActive, *MEMORY[0x24BEBE010], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__becomeActive, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__didEnterBackground, *MEMORY[0x24BEBDF98], 0);

  if (self->_skipToEndForTesting)
  {
    self->_currentTrainingState = 5;
    -[VTUIProximityEnrollTrainingViewController _showEnrollmentSuccessView](self, "_showEnrollmentSuccessView");
  }
  if (self->_skipToDataSharingForTesting)
  {
    self->_currentTrainingState = 5;
    -[VTUIProximityEnrollTrainingViewController _showSiriDataSharingOptInView](self, "_showSiriDataSharingOptInView");
  }
}

- (void)_setupEnrollTrainingView
{
  int64_t enrollmentMode;
  VTUIProximityEnrollTrainingView *v4;
  void *v5;
  VTUIProximityEnrollTrainingView *v6;
  VTUIProximityEnrollTrainingView *enrollTrainingView;
  id v8;

  enrollmentMode = self->_enrollmentMode;
  v4 = [VTUIProximityEnrollTrainingView alloc];
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  if (enrollmentMode == 5)
    v6 = -[VTUIProximityEnrollTrainingView initWithFrame:forEnrollmentStyle:](v4, "initWithFrame:forEnrollmentStyle:", 1);
  else
    v6 = -[VTUIProximityEnrollTrainingView initWithFrame:](v4, "initWithFrame:");
  enrollTrainingView = self->_enrollTrainingView;
  self->_enrollTrainingView = v6;

  -[VTUIProximityEnrollTrainingView setAutoresizingMask:](self->_enrollTrainingView, "setAutoresizingMask:", 18);
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_enrollTrainingView);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VTUIProximityEnrollTrainingViewController viewWillAppear:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillAppear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  -[VTUIProximityEnrollTrainingViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  -[VTUIProximityEnrollTrainingViewController _becomeActive](self, "_becomeActive");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  int *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VTUIProximityEnrollTrainingViewController viewWillDisappear:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillDisappear method called", buf, 0xCu);
  }
  v6 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v7 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
  if (v6)
    v7 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "resetStateMachine");
  -[VTUIAudioHintPlayer cleanup](self->_audioHintPlayer, "cleanup");
  v8.receiver = self;
  v8.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  -[VTUIProximityEnrollTrainingViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  -[VTUIProximityEnrollTrainingViewController _hideTrainingElements](self, "_hideTrainingElements");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VTUIProximityEnrollTrainingViewController viewDidDisappear:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s viewDidDisappear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  -[VTUIProximityEnrollTrainingViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  -[VTUIProximityEnrollTrainingViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[VTUIProximityEnrollTrainingViewController _updateCurrentConstraintsToSize:withTransitionCoordinator:](self, "_updateCurrentConstraintsToSize:withTransitionCoordinator:", 0, v4, v5);

}

- (void)setupNavigationBarStyleForAppearing:(BOOL)a3
{
  _BOOL4 v3;
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
  void *v16;
  id v17;

  v3 = a3;
  -[VTUIProximityEnrollTrainingViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    -[VTUIProximityEnrollTrainingViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[VTUIProximityEnrollTrainingViewController navigationController](self, "navigationController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v11, "setBackgroundImage:forBarMetrics:", v12, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v13);

    -[VTUIProximityEnrollTrainingViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    -[VTUIProximityEnrollTrainingViewController navigationController](self, "navigationController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundImage:forBarMetrics:", 0, 0);
  }

}

- (void)setSimulateJSSupportingDeviceForTesting:(BOOL)a3
{
  uint64_t v4;
  void *v5;

  self->_simulateJSSupportingDeviceForTesting = a3;
  if (a3)
    v4 = 8212;
  else
    v4 = 8206;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioProductID:", v4);

  -[VTUIProximityEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
}

- (void)_becomeActive
{
  NSObject *v3;
  int64_t currentTrainingState;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VTUIProximityEnrollTrainingViewController _becomeActive]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Making View Active", (uint8_t *)&v5, 0xCu);
  }
  -[VTUIProximityEnrollTrainingViewController _showTrainingElements](self, "_showTrainingElements");
  self->_badMicRetryCount = 0;
  self->_AVVCRetryCount = 0;
  self->_isResignedActive = 0;
  self->_cannotHearRetryCount = 0;
  self->_digitalZerosRetryCount = 0;
  currentTrainingState = self->_currentTrainingState;
  if (currentTrainingState == -1)
    -[VTUIProximityEnrollTrainingViewController _startEnrollment](self, "_startEnrollment");
  else
    -[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:](self, "_showTrainingInstruction:afterDelay:isRetry:animate:", currentTrainingState, 0, 1, 0.0);
}

- (void)_resignActive
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VTUIProximityEnrollTrainingViewController _resignActive]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Resigning Active", (uint8_t *)&v5, 0xCu);
  }
  self->_isResignedActive = 1;
  -[VTUIProximityEnrollTrainingViewController _hideTrainingElements](self, "_hideTrainingElements");
  -[VTUIProximityEnrollTrainingViewController _resetTrainingManager](self, "_resetTrainingManager");
  -[VTUIProximityEnrollTrainingViewController audioHintPlayer](self, "audioHintPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanup");

}

- (void)_didEnterBackground
{
  id v3;

  if (-[VTUIProximityEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    -[VTUIProximityEnrollTrainingViewController _resetEnrollment](self, "_resetEnrollment");
    -[VTUIProximityEnrollTrainingView instructionPagedLabel](self->_enrollTrainingView, "instructionPagedLabel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clear");

  }
}

- (void)_updateCurrentConstraintsToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  int64_t v7;
  void *v8;
  char v9;

  height = a3.height;
  width = a3.width;
  if (a3.width <= a3.height)
    v7 = 1;
  else
    v7 = 3;
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDeviceIPad");

  if ((v9 & 1) == 0 && v7 != -[VTUIProximityEnrollTrainingViewController orientation](self, "orientation"))
  {
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_introView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_tryAgainView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_enrollTrainingView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_successView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_languageOptionsView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIVoiceSelectionViewController updateContainerConstraintsForOrientationChangeToSize:](self->_voiceSelectionViewController, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    self->_orientation = v7;
  }
}

- (void)_hideTrainingElements
{
  void *v3;
  id v4;

  -[VTUIProximityEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[VTUIProximityEnrollTrainingView checkMark](self->_enrollTrainingView, "checkMark");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)_showTrainingElements
{
  void *v3;
  id v4;

  -[VTUIProximityEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[VTUIProximityEnrollTrainingView checkMark](self->_enrollTrainingView, "checkMark");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)_showBadMicAlertWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__VTUIProximityEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke;
  v6[3] = &unk_24F33D9D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", v6);

}

uint64_t __76__VTUIProximityEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController _showBadMicAlertWithCompletion:]_block_invoke";
    _os_log_impl(&dword_229EF7000, v2, OS_LOG_TYPE_DEFAULT, "%s Showing Bad Mic Alert", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_showBadMicAlertCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_retryAfterBadMicAlert
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController _retryAfterBadMicAlert]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_INFO, "%s Trying again after Bad Mic ALert", (uint8_t *)&v4, 0xCu);
  }
  -[VTUIProximityEnrollTrainingViewController _resumeTraining](self, "_resumeTraining");
}

- (BOOL)_isLocaleSupported:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  AFPreferencesSupportedLanguages();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)_showUnsupportedLocaleAlert
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VTUIProximityEnrollTrainingViewController _showUnsupportedLocaleAlert]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Showing Unsupported LocaleAlert", buf, 0xCu);
  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke;
  v4[3] = &unk_24F33DA00;
  objc_copyWeak(&v5, &location);
  -[VTUIProximityEnrollTrainingViewController _showUnsupportedLocaleAlertCompletion:](self, "_showUnsupportedLocaleAlertCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __72__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "trainingManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelTrainingForID:", objc_msgSend(v4, "sessionId"));

    objc_msgSend(v4, "trainingManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopRMS");

    objc_msgSend(v4, "skipTraining:", 0);
    WeakRetained = v4;
  }

}

- (BOOL)_isTrainingInProgress
{
  return self->_currentTrainingState < 5uLL;
}

- (void)_setupTrainingStates
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *trainingPageInstructions;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[5];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[7];

  v51[5] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v3;
  v4 = objc_msgSend(v3, "proxAccessorySupportsCompactTrigger")
    && (objc_msgSend(v3, "shouldSetupForMultipleTriggerPhrases") & 1) != 0
    || -[VTUIProximityEnrollTrainingViewController simulateJSSupportingDeviceForTesting](self, "simulateJSSupportingDeviceForTesting");
  -[VTUIAudioHintPlayer outputVoice](self->_audioHintPlayer, "outputVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v49[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT1"), 1, v5);
    v49[1] = CFSTR("RetryOnFail");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v27;
    v50[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v26;
    v47[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT2"), 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("RetryOnFail");
    v7 = MEMORY[0x24BDBD1C8];
    v24 = (void *)v6;
    v48[0] = v6;
    v48[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v23;
    v45[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT3"), 1, v5);
    v45[1] = CFSTR("RetryOnFail");
    v46[0] = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v46[0];
    v46[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v8;
    v43[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT4"), 0, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = CFSTR("RetryOnFail");
    v44[0] = v10;
    v44[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v11;
    v41[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT5"), 1, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = CFSTR("RetryOnFail");
    v42[0] = v13;
    v42[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v14;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v51;
  }
  else
  {
    v38[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT1"), 0, v5);
    v38[1] = CFSTR("RetryOnFail");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v27;
    v39[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v26;
    v36[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT2"), 0, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("RetryOnFail");
    v18 = MEMORY[0x24BDBD1C8];
    v24 = (void *)v17;
    v37[0] = v17;
    v37[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v23;
    v34[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT3"), 0, v5);
    v34[1] = CFSTR("RetryOnFail");
    v35[0] = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v35[0];
    v35[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v8;
    v32[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT4"), 0, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("RetryOnFail");
    v33[0] = v10;
    v33[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v11;
    v30[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT5"), 0, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("RetryOnFail");
    v31[0] = v13;
    v31[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v14;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v40;
  }
  objc_msgSend(v15, "arrayWithObjects:count:", v16, 5);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trainingPageInstructions = self->_trainingPageInstructions;
  self->_trainingPageInstructions = v19;

}

- (void)_animateCheckMark:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[VTUIProximityEnrollTrainingViewController _animateCheckMark:completion:]";
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Animate. For Success: %d", (uint8_t *)&v9, 0x12u);
  }
  -[VTUIProximityEnrollTrainingView checkMark](self->_enrollTrainingView, "checkMark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animateForSuccess:completion:", v4, v6);

}

- (void)_resetIdleTimer
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:", 1);

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdleTimerDisabled:", 0);

}

- (void)_showIntroView
{
  NSObject *v3;
  void *v4;
  VTUIProximityEnrollmentSetupIntroView *v5;
  void *v6;
  VTUIProximityEnrollmentSetupIntroView *v7;
  VTUIProximityEnrollmentSetupIntroView *introView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *siriLanguageOptions;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  AFEnablementFlowConfigurationProvider *v22;
  AFEnablementFlowConfigurationProvider *provider;
  NSArray *v24;
  NSArray *v25;
  AFEnablementFlowConfigurationProvider *v26;
  NSArray *v27;
  _QWORD v28[4];
  NSArray *v29;
  id v30;
  char v31;
  NSString *spokenLanguageCode;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[VTUIProximityEnrollTrainingViewController _showIntroView]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying Intro view", buf, 0xCu);
  }
  if (!self->_introView)
  {
    -[VTUIProximityEnrollTrainingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [VTUIProximityEnrollmentSetupIntroView alloc];
    -[VTUIProximityEnrollTrainingViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[VTUIProximityEnrollmentSetupIntroView initWithFrame:](v5, "initWithFrame:");
    introView = self->_introView;
    self->_introView = v7;

    -[VTUIProximityEnrollmentSetupIntroView setAutoresizingMask:](self->_introView, "setAutoresizingMask:", 18);
    -[VTUIProximityEnrollmentSetupIntroView setEnrollmentDelegate:](self->_introView, "setEnrollmentDelegate:", self);
    objc_msgSend(v4, "addSubview:", self->_introView);
    -[VTUIProximityEnrollmentSetupIntroView dismissButton](self->_introView, "dismissButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__dismiss_, 64);

    v31 = 0;
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allSiriLanguageCodesForSystemLanguageCode:isGoodFit:", v12, &v31);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    siriLanguageOptions = self->_siriLanguageOptions;
    self->_siriLanguageOptions = v13;

    if (self->_disambiguateLanguageOptionsForTesting)
    {
      v15 = self->_siriLanguageOptions;
      self->_siriLanguageOptions = (NSArray *)&unk_24F34DCD0;

    }
    -[VTUIProximityEnrollmentSetupIntroView setupButton](self->_introView, "setupButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__processIntroViewContinueAction_, 64);

    -[VTUIProximityEnrollmentSetupIntroView notNowButton](self->_introView, "notNowButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_skipAssistant_, 64);

    -[VTUIProximityEnrollTrainingView skipButton](self->_enrollTrainingView, "skipButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "enrollmentMode");

    v21 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[VTUIProximityEnrollTrainingViewController _showIntroView]";
      v35 = 2048;
      v36 = v20;
      _os_log_impl(&dword_229EF7000, v21, OS_LOG_TYPE_DEFAULT, "%s Enrollment mode: %ld", buf, 0x16u);
    }
    if (!self->_provider)
    {
      v22 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x24BE091D0]);
      provider = self->_provider;
      self->_provider = v22;

    }
    if (self->_enablementConfiguration)
    {
      -[VTUIAnalytics setIntroViewShown:](self->_analyticsEvent, "setIntroViewShown:", -[VTUIAnalytics introViewShown](self->_analyticsEvent, "introViewShown") + 1);
    }
    else
    {
      if (-[VTUIProximityEnrollTrainingViewController _shouldPresentLanguageDisambiguation](self, "_shouldPresentLanguageDisambiguation"))
      {
        v24 = self->_siriLanguageOptions;
      }
      else
      {
        spokenLanguageCode = self->_spokenLanguageCode;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &spokenLanguageCode, 1);
        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;
      objc_initWeak((id *)buf, self);
      self->_isEnablementConfigurationLoading = 1;
      v26 = self->_provider;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke;
      v28[3] = &unk_24F33DAA0;
      objc_copyWeak(&v30, (id *)buf);
      v27 = v25;
      v29 = v27;
      -[AFEnablementFlowConfigurationProvider configurationForEnablementFlow:recognitionLanguageCodes:completion:](v26, "configurationForEnablementFlow:recognitionLanguageCodes:completion:", 2, v27, v28);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);

    }
  }
}

void __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke_2;
  block[3] = &unk_24F33DA78;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(void);
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 136315650;
      v9 = "-[VTUIProximityEnrollTrainingViewController _showIntroView]_block_invoke_2";
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Enablement Configuration %@ for recognition languages %@", (uint8_t *)&v8, 0x20u);
    }
    objc_storeStrong(WeakRetained + 139, *(id *)(a1 + 32));
    *((_BYTE *)WeakRetained + 1128) = 0;
    v6 = (void (**)(void))WeakRetained[142];
    if (v6)
    {
      v6[2]();
      v7 = WeakRetained[142];
      WeakRetained[142] = 0;

    }
  }

}

- (BOOL)_siriLanguageIsIncompatibleWithPairedWatch
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  char v14;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPaired");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B3F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B3E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(MEMORY[0x24BE09170], "siriIsSupportedForLanguageCode:productName:productVersion:error:", self->_spokenLanguageCode, v10, v7, 0);
  v12 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("false");
    if (v11)
      v13 = CFSTR("true");
    v16 = 136315394;
    v17 = "-[VTUIProximityEnrollTrainingViewController _siriLanguageIsIncompatibleWithPairedWatch]";
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Is Siri Language Supported on watch ? - %@", (uint8_t *)&v16, 0x16u);
  }
  v14 = v11 ^ 1;

  return v14;
}

- (void)_warnForLanguageCompatibilityIfNecessary:(id)a3
{
  void (**v4)(_QWORD);
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
  _QWORD v15[4];
  void (**v16)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[VTUIProximityEnrollTrainingViewController _siriLanguageIsIncompatibleWithPairedWatch](self, "_siriLanguageIsIncompatibleWithPairedWatch"))
  {
    v5 = (void *)MEMORY[0x24BEBD3B0];
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiLocalizedStringForKey:", CFSTR("ALERT_TITLE_LANGUAGE_NOT_SUPPORTED_ON_WATCH"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiLocalizedStringForKey:", CFSTR("ALERT_MESSAGE_LANGUAGE_NOT_SUPPORTED_ON_WATCH"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEBD3A8];
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uiLocalizedStringForKey:", CFSTR("ALERT_BUTTON_CONTINUE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __86__VTUIProximityEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke;
    v15[3] = &unk_24F33DAC8;
    v16 = v4;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAction:", v14);
    -[VTUIProximityEnrollTrainingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __86__VTUIProximityEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setAssistantEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  AFEnablementConfiguration *enablementConfiguration;
  void (**v7)(id, _BOOL8);

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssistantIsEnabled:", v3);

  enablementConfiguration = self->_enablementConfiguration;
  if (enablementConfiguration)
  {
    -[AFEnablementConfiguration completionLoggingBlock](enablementConfiguration, "completionLoggingBlock");
    v7 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v3);

  }
}

- (void)_markEnrollmentSuccessForVoiceProfile:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "markSATEnrollmentSuccessForVoiceProfile:", v4);

  }
}

- (void)_setPHSEnrollmentPrefEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "markSATEnrollmentSuccessForVoiceProfile:", v6);

  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceTriggerEnabled:", v3);

}

- (void)_showEnrollmentSuccessView
{
  NSObject *v3;
  void *v4;
  VTUIProximityEnrollmentSuccessView *v5;
  void *v6;
  VTUIProximityEnrollmentSuccessView *v7;
  VTUIProximityEnrollmentSuccessView *successView;
  void *v9;
  void *v10;
  VTUIProximityEnrollTrainingView *enrollTrainingView;
  VTUIProximityEnrollTrainingView *v12;
  int v13;
  double v14;
  double v15;
  int *v16;
  VTUIAudioHintPlayer *audioHintPlayer;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VTUIProximityEnrollTrainingViewController _showEnrollmentSuccessView]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Enrollment completed", buf, 0xCu);
  }
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [VTUIProximityEnrollmentSuccessView alloc];
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[VTUIProximityEnrollmentSuccessView initWithFrame:](v5, "initWithFrame:");
  successView = self->_successView;
  self->_successView = v7;

  -[VTUIProximityEnrollmentSuccessView setAutoresizingMask:](self->_successView, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "addSubview:", self->_successView);
  -[VTUIProximityEnrollmentSuccessView dismissButton](self->_successView, "dismissButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__dismiss_, 64);

  -[VTUIProximityEnrollmentSuccessView continueButton](self->_successView, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__finishSiriSetup_, 64);

  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView)
  {
    -[VTUIProximityEnrollTrainingView removeFromSuperview](enrollTrainingView, "removeFromSuperview");
    v12 = self->_enrollTrainingView;
    self->_enrollTrainingView = 0;

  }
  if (-[VTUIProximityEnrollTrainingViewController _shouldSpeakAudioHint](self, "_shouldSpeakAudioHint"))
  {
    if (self->_shouldTurnOnMyriad)
    {
      v13 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
      v16 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
      if (v13)
        v16 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
      LODWORD(v14) = 0;
      LODWORD(v15) = 20.0;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v16), "startAdvertisingForPHSSetupAfterDelay:maxInterval:", v14, v15);
    }
    objc_initWeak((id *)buf, self);
    audioHintPlayer = self->_audioHintPlayer;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__VTUIProximityEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke;
    v18[3] = &unk_24F33DB30;
    objc_copyWeak(&v19, (id *)buf);
    -[VTUIAudioHintPlayer speakConfirmationDialog:](audioHintPlayer, "speakConfirmationDialog:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

void __71__VTUIProximityEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke(uint64_t a1)
{
  int v1;
  double v2;
  int *v3;
  char *WeakRetained;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
    v3 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
    if (v1)
      v3 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
    LODWORD(v2) = 0.5;
    objc_msgSend(*(id *)&WeakRetained[*v3], "endAdvertisingAfterDelay:", v2);
    objc_msgSend(WeakRetained, "_cleanupTrainingManagerWithCompletion:", 0);
  }

}

- (void)_startEnrollment
{
  NSObject *v3;
  NSString *spokenLanguageCode;
  VTUIProximityEnrollmentSetupIntroView *introView;
  UIView *aboutTappedSender;
  int v7;
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    spokenLanguageCode = self->_spokenLanguageCode;
    v7 = 136315394;
    v8 = "-[VTUIProximityEnrollTrainingViewController _startEnrollment]";
    v9 = 2112;
    v10 = spokenLanguageCode;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting Enrollment for language code: %@", (uint8_t *)&v7, 0x16u);
  }
  if (!-[VTUIProximityEnrollTrainingViewController _isLocaleSupported:](self, "_isLocaleSupported:", self->_spokenLanguageCode))-[VTUIProximityEnrollTrainingViewController _showUnsupportedLocaleAlert](self, "_showUnsupportedLocaleAlert");
  introView = self->_introView;
  if (introView)
  {
    self->_introView = 0;

  }
  aboutTappedSender = self->_aboutTappedSender;
  if (self->_languageOptionsView)
  {
    if (!aboutTappedSender)
      return;
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    goto LABEL_12;
  }
  if (aboutTappedSender)
    goto LABEL_11;
  if (self->_enrollmentMode == 5)
  {
    -[VTUIProximityEnrollTrainingViewController _continueToTrainingFromIntro](self, "_continueToTrainingFromIntro");
    return;
  }
LABEL_12:
  -[VTUIProximityEnrollTrainingViewController _showIntroView](self, "_showIntroView");
}

- (void)_resetEnrollment
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VTUIProximityEnrollTrainingViewController _resetEnrollment]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Resetting State to kVTUITrainingStateNotStarted", (uint8_t *)&v7, 0xCu);
  }
  self->_currentTrainingState = -1;
  -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
  -[VTUIProximityEnrollTrainingViewController _hideInstruction](self, "_hideInstruction");
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "deleteUserVoiceProfile:", v5);

}

- (void)_resumeTraining
{
  NSObject *v3;
  int64_t currentTrainingState;
  int v5;
  const char *v6;
  __int16 v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    currentTrainingState = self->_currentTrainingState;
    v5 = 136315394;
    v6 = "-[VTUIProximityEnrollTrainingViewController _resumeTraining]";
    v7 = 2048;
    v8 = currentTrainingState;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_INFO, "%s Resuming training from the previous state: %zd", (uint8_t *)&v5, 0x16u);
  }
  if (-[VTUIProximityEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    -[VTUIProximityEnrollTrainingViewController _createTrainingManagerIfNeeded](self, "_createTrainingManagerIfNeeded");
    -[VTUIProximityEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:", self->_currentTrainingState, 0);
  }
}

- (void)_startTraining
{
  NSObject *v3;
  int64_t v4;
  NSUUID *v5;
  NSUUID *trainingAttemptUUID;
  void *v7;
  NSUUID *v8;
  NSObject *v9;
  void *v10;
  int64_t currentTrainingState;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_currentTrainingState < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    trainingAttemptUUID = self->_trainingAttemptUUID;
    self->_trainingAttemptUUID = v5;

    v7 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_trainingAttemptUUID;
      v9 = v7;
      -[NSUUID UUIDString](v8, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      currentTrainingState = self->_currentTrainingState;
      v20 = 136315650;
      v21 = "-[VTUIProximityEnrollTrainingViewController _startTraining]";
      v22 = 2112;
      v23 = (int64_t)v10;
      v24 = 2048;
      v25 = currentTrainingState;
      _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Starting training attempt %@ - Moving from state: %zd to state 0", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "deleteUserVoiceProfile:", v13);

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logEventWithType:context:", 5502, 0);

    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, 0);

    if (v17)
      v18 = 2;
    else
      v18 = 1;
    +[VTUISELFLogger logSiriSetupPHSEnrollmentUIStarted:enrollmentMode:locale:voiceTriggerType:](VTUISELFLogger, "logSiriSetupPHSEnrollmentUIStarted:enrollmentMode:locale:voiceTriggerType:", self->_trainingAttemptUUID, self->_enrollmentMode, self->_spokenLanguageCode, v18);
    -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
    self->_currentTrainingState = 0;
    -[VTUIProximityEnrollTrainingView instructionPreludeLabel](self->_enrollTrainingView, "instructionPreludeLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

    -[VTUIProximityEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:", self->_currentTrainingState, 0);
  }
  else
  {
    v3 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
    {
      v4 = self->_currentTrainingState;
      v20 = 136315394;
      v21 = "-[VTUIProximityEnrollTrainingViewController _startTraining]";
      v22 = 2048;
      v23 = v4;
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_INFO, "%s Training has already started at state %zd - resuming.", (uint8_t *)&v20, 0x16u);
    }
    -[VTUIProximityEnrollTrainingViewController _resumeTraining](self, "_resumeTraining");
  }
}

- (void)_advanceState
{
  unint64_t currentTrainingState;
  NSObject *v4;
  int64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  currentTrainingState = self->_currentTrainingState;
  if (currentTrainingState >= -[NSArray count](self->_trainingPageInstructions, "count") - 1)
  {
    if (self->_currentTrainingState != 5)
    {
      self->_currentTrainingState = 5;
      -[VTUIAnalytics setVoiceTrainingCompleted:](self->_analyticsEvent, "setVoiceTrainingCompleted:", -[VTUIAnalytics voiceTrainingCompleted](self->_analyticsEvent, "voiceTrainingCompleted") + 1);
      if (self->_enrollmentMode == 5)
      {
        -[VTUIProximityEnrollTrainingViewController _markEnrollmentSuccessForVoiceProfile:](self, "_markEnrollmentSuccessForVoiceProfile:", 1);
        -[VTUIProximityEnrollTrainingViewController _finishSiriSetup:](self, "_finishSiriSetup:", 0);
        -[VTUIProximityEnrollTrainingViewController finish:](self, "finish:", 0);
      }
      else
      {
        -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 1);
        -[VTUIProximityEnrollTrainingView instructionPagedLabel](self->_enrollTrainingView, "instructionPagedLabel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __58__VTUIProximityEnrollTrainingViewController__advanceState__block_invoke;
        v12[3] = &unk_24F33DA28;
        v12[4] = self;
        objc_msgSend(v6, "slideInText:afterDelay:completion:", 0, v12, 0.0);

      }
      v7 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[VTUIProximityEnrollTrainingViewController _advanceState]";
        _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Completed Last stage in Training", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "newTurnBasedInstrumentationContext");

      v10 = objc_alloc_init(MEMORY[0x24BE95B28]);
      objc_msgSend(v10, "setInvocationSource:", 45);
      objc_msgSend(v9, "emitInstrumentation:", v10);
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventWithType:context:", 5503, 0);

      +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:](VTUISELFLogger, "logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:", self->_trainingAttemptUUID, self->_enrollmentMode, self->_spokenLanguageCode, 1, LODWORD(self->_currentTrainingState));
    }
  }
  else
  {
    self->_hasRetriedTraining = 0;
    ++self->_currentTrainingState;
    -[VTUIProximityEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:");
    v4 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_currentTrainingState;
      *(_DWORD *)buf = 136315394;
      v14 = "-[VTUIProximityEnrollTrainingViewController _advanceState]";
      v15 = 2048;
      v16 = v5;
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Advance to Next stage in Training - Current state : %zd", buf, 0x16u);
    }
  }
}

uint64_t __58__VTUIProximityEnrollTrainingViewController__advanceState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showEnrollmentSuccessView");
}

- (void)_showInstruction:(int64_t)a3 isRetry:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[VTUIProximityEnrollTrainingViewController _updatePageNumberForInstruction:](self, "_updatePageNumberForInstruction:", a3);
  -[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:](self, "_showTrainingInstruction:afterDelay:isRetry:animate:", self->_currentTrainingState, v4, 1, 0.0);
}

- (id)_retryStringForStatus:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiLocalizedStringForKey:", CFSTR("TRY_AGAIN_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    if (-[VTUIProximityEnrollTrainingViewController cannotHearRetryCount](self, "cannotHearRetryCount") == 1)
      goto LABEL_7;
    if (-[VTUIProximityEnrollTrainingViewController cannotHearRetryCount](self, "cannotHearRetryCount"))
    {
LABEL_9:
      +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("TRY_AGAIN_STILL_CANNOT_HEAR_MESSAGE");
      goto LABEL_10;
    }
  }
  else if (a3 == 9)
  {
    if (-[VTUIProximityEnrollTrainingViewController digitalZerosRetryCount](self, "digitalZerosRetryCount") != 1)
    {
      if (!-[VTUIProximityEnrollTrainingViewController digitalZerosRetryCount](self, "digitalZerosRetryCount"))
        return v6;
      goto LABEL_9;
    }
LABEL_7:
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("TRY_AGAIN_CANNOT_HEAR_MESSAGE");
LABEL_10:
    objc_msgSend(v7, "uiLocalizedStringForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  return v6;
}

- (void)_retryInstruction:(BOOL)a3 withStatusMessage:(id)a4
{
  id v6;
  NSObject *v7;
  VTUIProximityTryAgainView *v8;
  void *v9;
  VTUIProximityTryAgainView *v10;
  VTUIProximityTryAgainView *tryAgainView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:]";
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v8 = [VTUIProximityTryAgainView alloc];
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = -[VTUIProximityTryAgainView initWithFrame:](v8, "initWithFrame:");
  tryAgainView = self->_tryAgainView;
  self->_tryAgainView = v10;

  -[VTUIProximityTryAgainView setAutoresizingMask:](self->_tryAgainView, "setAutoresizingMask:", 18);
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_tryAgainView);

  -[VTUIProximityTryAgainView dismissButton](self->_tryAgainView, "dismissButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__dismiss_, 64);

  objc_initWeak((id *)buf, self);
  v14 = (void *)MEMORY[0x24BEBDB00];
  -[VTUIProximityEnrollTrainingViewController enrollTrainingView](self, "enrollTrainingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingViewController tryAgainView](self, "tryAgainView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke;
  v17[3] = &unk_24F33DD58;
  objc_copyWeak(&v18, (id *)buf);
  v19 = a3;
  objc_msgSend(v14, "transitionFromView:toView:duration:options:completion:", v15, v16, 5242880, v17, 0.4);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2;
  v3[3] = &unk_24F33DB58;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = *(_BYTE *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
}

void __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_autoContinueFromRetry:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_autoContinueFromRetry:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  -[VTUIProximityEnrollTrainingViewController _hideInstruction](self, "_hideInstruction");
  if ((-[VTUIProximityEnrollTrainingViewController currentTrainingState](self, "currentTrainingState") & 0x8000000000000000) == 0
    && -[VTUIProximityEnrollTrainingViewController currentTrainingState](self, "currentTrainingState") <= 4)
  {
    -[VTUIProximityEnrollTrainingViewController _updatePageNumberForInstruction:](self, "_updatePageNumberForInstruction:", -[VTUIProximityEnrollTrainingViewController currentTrainingState](self, "currentTrainingState"));
  }
  v5 = (void *)MEMORY[0x24BEBDB00];
  -[VTUIProximityEnrollTrainingViewController tryAgainView](self, "tryAgainView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingViewController enrollTrainingView](self, "enrollTrainingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__VTUIProximityEnrollTrainingViewController__autoContinueFromRetry___block_invoke;
  v8[3] = &unk_24F33DD80;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "transitionFromView:toView:duration:options:completion:", v6, v7, 5242880, v8, 0.4);

}

void __68__VTUIProximityEnrollTrainingViewController__autoContinueFromRetry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "currentTrainingState") & 0x8000000000000000) == 0
    && objc_msgSend(*(id *)(a1 + 32), "currentTrainingState") <= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showTrainingInstruction:afterDelay:isRetry:animate:", objc_msgSend(*(id *)(a1 + 32), "currentTrainingState"), *(_BYTE *)(a1 + 40) == 0, 1, 0.0);
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "currentTrainingState"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("currentTrainingState");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEventWithType:context:", 5511, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "tryAgainView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "tryAgainView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "setTryAgainView:", 0);
  }
}

- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD);
  id v24;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _BYTE *v34;
  id v35[2];
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[6];
  id v40[2];
  BOOL v41;
  BOOL v42;
  char v43;
  _QWORD aBlock[4];
  id v45[2];
  id location;
  const __CFString *v47;
  void *v48;
  _BYTE buf[24];
  _BOOL4 v50;
  __int16 v51;
  _BOOL4 v52;
  uint64_t v53;

  v6 = a6;
  v7 = a5;
  v53 = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 1024;
    v50 = v7;
    v51 = 1024;
    v52 = v6;
    _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Instruction Number %ld, isRetry %d, animate %d", buf, 0x22u);
  }
  v12 = -[NSArray count](self->_trainingPageInstructions, "count");
  if ((a3 & 0x8000000000000000) == 0 && v12 > a3)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_trainingPageInstructions, "objectAtIndexedSubscript:", a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Instruction"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "VTUIDeviceSpecificString:", v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("RetryOnFail"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[VTUIProximityEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "animateToOffWithCompletion:", 0);

    -[VTUIProximityEnrollTrainingViewController _createTrainingManagerIfNeeded](self, "_createTrainingManagerIfNeeded");
    if ((unint64_t)a3 <= 4)
    {
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("instruction");
      v48 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logEventWithType:context:", a3 + 5505, v18);

    }
    -[VTUIAudioHintPlayer synth](self->_audioHintPlayer, "synth");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopSpeaking");

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v50) = 0;
    objc_initWeak(&location, self);
    v20 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke;
    aBlock[3] = &unk_24F33DDA8;
    objc_copyWeak(v45, &location);
    v45[1] = (id)a3;
    v21 = _Block_copy(aBlock);
    v39[0] = v20;
    v39[1] = 3221225472;
    v39[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2;
    v39[3] = &unk_24F33DDF8;
    objc_copyWeak(v40, &location);
    v40[1] = (id)a3;
    v41 = v7;
    v42 = v6;
    v39[4] = self;
    v39[5] = buf;
    v43 = v15;
    v22 = _Block_copy(v39);
    v36[0] = v20;
    v36[1] = 3221225472;
    v36[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_123;
    v36[3] = &unk_24F33DBF8;
    v23 = v21;
    v37 = v23;
    v24 = v22;
    v38 = v24;
    v25 = (void (**)(_QWORD))_Block_copy(v36);
    if (-[VTUIProximityEnrollTrainingViewController _shouldSpeakAudioHint](self, "_shouldSpeakAudioHint"))
    {
      if (v6)
      {
        -[VTUIProximityEnrollTrainingView instructionPagedLabel](self->_enrollTrainingView, "instructionPagedLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "slideInText:afterDelay:completion:", v29, v23, a4);

      }
      else
      {
        v23[2](v23);
      }
      -[VTUIProximityEnrollTrainingViewController trainingManager](self, "trainingManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v20;
      v32[1] = 3221225472;
      v32[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_124;
      v32[3] = &unk_24F33DC48;
      objc_copyWeak(v35, &location);
      v35[1] = (id)a3;
      v34 = buf;
      v33 = v24;
      objc_msgSend(v28, "prepareWithCompletion:", v32);

      objc_destroyWeak(v35);
    }
    else if (v6)
    {
      -[VTUIProximityEnrollTrainingView instructionPagedLabel](self->_enrollTrainingView, "instructionPagedLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "slideInText:afterDelay:completion:", v29, v25, a4);

    }
    else
    {
      v25[2](v25);
    }

    objc_destroyWeak(v40);
    objc_destroyWeak(v45);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updatePageNumberForInstruction:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  int *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[8];
  char v17;
  __int16 v18;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "enrollTrainingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orbView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMode:", 1);

    objc_msgSend(v3, "trainingManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startRMS");

    if (v3[1148])
    {
      v7 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
      v10 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
      if (v7)
        v10 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
      LODWORD(v8) = 0;
      LODWORD(v9) = 20.0;
      objc_msgSend(*(id *)&v3[*v10], "startAdvertisingForPHSSetupAfterDelay:maxInterval:", v8, v9);
    }
    v11 = (void *)*((_QWORD *)v3 + 129);
    v12 = *(_QWORD *)(a1 + 56) + 1;
    objc_msgSend(*(id *)(a1 + 32), "trainingAttemptUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_3;
    v16[3] = &unk_24F33DDD0;
    v14 = *(_QWORD *)(a1 + 56);
    v17 = *(_BYTE *)(a1 + 64);
    v18 = *(_WORD *)(a1 + 65);
    v15 = *(_QWORD *)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = v3;
    v16[6] = v15;
    v16[7] = v14;
    *((_QWORD *)v3 + 128) = objc_msgSend(v11, "trainUtterance:shouldUseASR:mhUUID:completionWithResult:", v12, 1, v13, v16);

  }
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)*MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "sessionId");
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(unsigned __int8 *)(a1 + 64);
    v11 = *(unsigned __int8 *)(a1 + 65);
    objc_msgSend(*(id *)(a1 + 32), "trainingAttemptUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v32 = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_3";
    v33 = 2048;
    v34 = v8;
    v35 = 2048;
    v36 = v9;
    v37 = 1024;
    v38 = v10;
    v39 = 1024;
    v40 = v11;
    v41 = 2112;
    v42 = v13;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s SessionID: %ld, Instruction Number %ld, isRetry %d, animate %d attemptUUID: %@", buf, 0x36u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v14 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
    v15 = *(void **)(a1 + 40);
    if (v14)
      objc_msgSend(v15, "scdaCoordinator");
    else
      objc_msgSend(v15, "myriadCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 0.5;
    objc_msgSend(v16, "endAdvertisingAfterDelay:", v17);

    objc_msgSend(*(id *)(a1 + 40), "trainingManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stopRMS");

    objc_msgSend(*(id *)(a1 + 40), "enrollTrainingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "orbView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "animateToOffWithCompletion:", 0);

    objc_msgSend(*(id *)(a1 + 40), "_resetIdleTimer");
    if (objc_msgSend(*(id *)(a1 + 40), "interpretSessionManagerResult:forInstruction:", v5, objc_msgSend(*(id *)(a1 + 40), "currentTrainingState")) == 1)v21 = 1;
    else
      v21 = 3;
    objc_msgSend(*(id *)(a1 + 40), "trainingAttemptUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD **)(a1 + 40);
    v24 = v23[131];
    objc_msgSend(v23, "spokenLanguageCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(unsigned int *)(a1 + 56);
    v27 = *(unsigned __int8 *)(a1 + 64);
    v28 = objc_msgSend(*(id *)(a1 + 40), "_shouldSpeakAudioHint");
    BYTE1(v30) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    LOBYTE(v30) = v28;
    +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", v22, v24, v25, v21, v26, v27, v30);

    v29 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 66))
    {
      objc_msgSend(v29, "setHasRetriedTraining:", *(unsigned __int8 *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "_handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:", v5, a3);
    }
    else
    {
      objc_msgSend(v29, "_handleTrainingResultForNonRetryablePhraseWithResult:", v5);
    }
  }

}

uint64_t __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_123(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_124(uint64_t a1, char a2)
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    v3 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_2";
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Error preparing audio session", buf, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 159);
    v7 = *(_QWORD *)(a1 + 56);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_125;
    v10[3] = &unk_24F33DC20;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    v9 = *(_OWORD *)(a1 + 32);
    v8 = (id)v9;
    v11 = v9;
    objc_msgSend(v6, "speakAudioHint:completion:", v7, v10);

    objc_destroyWeak(&v12);
  }

}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  char v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v6 = *((unsigned __int8 *)WeakRetained + 979);
    objc_msgSend(WeakRetained[159], "synth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSpeaking");

    v9 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
      v13 = 1024;
      v14 = v8;
      v15 = 1024;
      v16 = v6 == 0;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Audio Hint Synthesized. Synthesizer isSpeaking %d, view active: %d, error:%@ ", (uint8_t *)&v11, 0x22u);
    }
    if (v6)
      v10 = 1;
    else
      v10 = v8;
    if ((v10 & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_handleTrainingResultForNonRetryablePhraseWithResult:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  unint64_t badMicRetryCount;
  int64_t v11;
  NSObject *v12;
  void *v13;
  int64_t consecutiveTimeoutCount;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD block[5];
  _QWORD v35[5];
  _QWORD v36[5];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  _BYTE v40[10];
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE09000];
  v6 = (void *)*MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = objc_msgSend(v4, "sessionStatus");
    v9 = objc_msgSend(v4, "audioStatus");
    badMicRetryCount = self->_badMicRetryCount;
    *(_DWORD *)buf = 136315906;
    v38 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    v39 = 1024;
    *(_DWORD *)v40 = v8;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v9;
    v41 = 2048;
    v42 = badMicRetryCount;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, badMicRetryCount: %lu", buf, 0x22u);

  }
  v11 = -[VTUIProximityEnrollTrainingViewController interpretSessionManagerResult:forInstruction:](self, "interpretSessionManagerResult:forInstruction:", v4, self->_currentTrainingState);
  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    v39 = 2048;
    *(_QWORD *)v40 = v11;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  switch(v11)
  {
    case 1:
      self->_consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_6;
      v30[3] = &unk_24F33DA00;
      objc_copyWeak(&v31, (id *)buf);
      -[VTUIProximityEnrollTrainingViewController _animateCheckMark:completion:](self, "_animateCheckMark:completion:", 1, v30);
      objc_destroyWeak(&v31);
      break;
    case 4:
      -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
      objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v16, "deleteUserVoiceProfile:", v17);

      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke;
      v36[3] = &unk_24F33DA28;
      v36[4] = self;
      -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](self, "_cleanupTrainingManagerWithCompletion:status:", v36, 4);
      break;
    case 5:
      v19 = self->_badMicRetryCount + 1;
      self->_badMicRetryCount = v19;
      if (v19 < 6)
      {
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5;
        v32[3] = &unk_24F33DA28;
        v32[4] = self;
        -[VTUIProximityEnrollTrainingViewController _showBadMicAlertCompletion:](self, "_showBadMicAlertCompletion:", v32);
      }
      else
      {
        -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v20, "deleteUserVoiceProfile:", v21);

        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4;
        v33[3] = &unk_24F33DA28;
        v33[4] = self;
        -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](self, "_cleanupTrainingManagerWithCompletion:status:", v33, 5);
      }
      break;
    case 6:
      v23 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v23;
      if (v23 < 6)
      {
        v29 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3;
        block[3] = &unk_24F33DA28;
        block[4] = self;
        dispatch_after(v29, MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v24, "deleteUserVoiceProfile:", v25);

        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2;
        v35[3] = &unk_24F33DA28;
        v35[4] = self;
        -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](self, "_cleanupTrainingManagerWithCompletion:status:", v35, 6);
      }
      break;
    case 7:
      break;
    case 8:
      consecutiveTimeoutCount = self->_consecutiveTimeoutCount;
      self->_consecutiveTimeoutCount = consecutiveTimeoutCount + 1;
      if (consecutiveTimeoutCount >= 1)
        self->_shouldTurnOnMyriad = 0;
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v15);

      break;
    case 9:
      ++self->_digitalZerosRetryCount;
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v27);

      break;
    case 10:
      ++self->_cannotHearRetryCount;
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v28);

      break;
    default:
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v13);

      break;
  }
  objc_destroyWeak((id *)buf);

}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipSetup");
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipSetup");
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeTraining");
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipSetup");
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryAfterBadMicAlert");
}

void __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_advanceState");

}

- (void)_handleTrainingResultForRetryablePhraseWithResult:(id)a3 shouldShowCheckMark:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  unint64_t badMicRetryCount;
  int64_t v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  int64_t consecutiveTimeoutCount;
  void *v28;
  void *v29;
  void *v30;
  dispatch_time_t v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  _BYTE v42[10];
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE09000];
  v8 = (void *)*MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = objc_msgSend(v6, "sessionStatus");
    v11 = objc_msgSend(v6, "audioStatus");
    badMicRetryCount = self->_badMicRetryCount;
    *(_DWORD *)buf = 136316162;
    v40 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    v41 = 1024;
    *(_DWORD *)v42 = v10;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v11;
    v43 = 1024;
    v44 = v4;
    v45 = 2048;
    v46 = badMicRetryCount;
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, shouldShowCheckMark:%d, badMicRetryCount: %lu", buf, 0x28u);

  }
  v13 = -[VTUIProximityEnrollTrainingViewController interpretSessionManagerResult:forInstruction:](self, "interpretSessionManagerResult:forInstruction:", v6, self->_currentTrainingState);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    v41 = 2048;
    *(_QWORD *)v42 = v13;
    _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  switch(v13)
  {
    case 2:
      self->_consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      -[VTUIAnalytics setAsrError:](self->_analyticsEvent, "setAsrError:", -[VTUIAnalytics asrError](self->_analyticsEvent, "asrError") + 1);
      if (self->_hasRetriedTraining)
        goto LABEL_10;
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 0, 0);
      break;
    case 3:
      self->_consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      if (v4)
      {
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_6;
        v32[3] = &unk_24F33DA00;
        objc_copyWeak(&v33, (id *)buf);
        -[VTUIProximityEnrollTrainingViewController _animateCheckMark:completion:](self, "_animateCheckMark:completion:", 1, v32);
        objc_destroyWeak(&v33);
      }
      else
      {
LABEL_10:
        -[VTUIProximityEnrollTrainingViewController _advanceState](self, "_advanceState");
      }
      break;
    case 4:
      -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
      objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v20, "deleteUserVoiceProfile:", v21);

      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke;
      v38[3] = &unk_24F33DA28;
      v38[4] = self;
      -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](self, "_cleanupTrainingManagerWithCompletion:status:", v38, 4);
      break;
    case 5:
      v15 = self->_badMicRetryCount + 1;
      self->_badMicRetryCount = v15;
      if (v15 < 6)
      {
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5;
        v34[3] = &unk_24F33DA28;
        v34[4] = self;
        -[VTUIProximityEnrollTrainingViewController _showBadMicAlertCompletion:](self, "_showBadMicAlertCompletion:", v34);
      }
      else
      {
        -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v16, "deleteUserVoiceProfile:", v17);

        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4;
        v35[3] = &unk_24F33DA28;
        v35[4] = self;
        -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](self, "_cleanupTrainingManagerWithCompletion:status:", v35, 5);
      }
      break;
    case 6:
      v23 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v23;
      if (v23 < 6)
      {
        v31 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3;
        block[3] = &unk_24F33DA28;
        block[4] = self;
        dispatch_after(v31, MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v24, "deleteUserVoiceProfile:", v25);

        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2;
        v37[3] = &unk_24F33DA28;
        v37[4] = self;
        -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](self, "_cleanupTrainingManagerWithCompletion:status:", v37, 6);
      }
      break;
    case 7:
      break;
    case 8:
      consecutiveTimeoutCount = self->_consecutiveTimeoutCount;
      self->_consecutiveTimeoutCount = consecutiveTimeoutCount + 1;
      if (consecutiveTimeoutCount >= 1)
        self->_shouldTurnOnMyriad = 0;
      -[VTUIAnalytics setVtError:](self->_analyticsEvent, "setVtError:", -[VTUIAnalytics vtError](self->_analyticsEvent, "vtError") + 1);
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v28);

      break;
    case 9:
      ++self->_digitalZerosRetryCount;
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v29);

      break;
    case 10:
      ++self->_cannotHearRetryCount;
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v30);

      break;
    default:
      -[VTUIAnalytics setVtError:](self->_analyticsEvent, "setVtError:", -[VTUIAnalytics vtError](self->_analyticsEvent, "vtError") + 1);
      -[VTUIProximityEnrollTrainingViewController _retryStringForStatus:](self, "_retryStringForStatus:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v19);

      break;
  }
  objc_destroyWeak((id *)buf);

}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipSetup");
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipSetup");
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeTraining");
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipSetup");
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryAfterBadMicAlert");
}

void __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_advanceState");

}

- (void)_showBadMicAlertCompletion:(id)a3
{
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
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v19 = a3;
  -[VTUIProximityEnrollTrainingViewController interpretAudioSource:](self, "interpretAudioSource:", -[SSRVTUITrainingManager audioSource](self->_trainingManager, "audioSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD3B0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiLocalizedStringForKey:", CFSTR("ALERT_TITLE_BAD_MIC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiLocalizedStringForKey:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiLocalizedStringForKey:", CFSTR("ALERT_MAIN_BAD_MIC"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uiLocalizedStringForKey:", CFSTR("ALERT_BUTTON_BAD_MIC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __72__VTUIProximityEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke;
  v21[3] = &unk_24F33DAC8;
  v22 = v19;
  v17 = v19;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v18);
  -[VTUIProximityEnrollTrainingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __72__VTUIProximityEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showUnsupportedLocaleAlertCompletion:(id)a3
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
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiLocalizedStringForKey:", CFSTR("ALERT_TITLE_UNSUPPORTED_LOCALE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiLocalizedStringForKey:", CFSTR("ALERT_MAIN_UNSUPPORTED_LOCALE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3A8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uiLocalizedStringForKey:", CFSTR("ALERT_BUTTON_UNSUPPORTED_LOCALE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke;
  v16[3] = &unk_24F33DAC8;
  v17 = v4;
  v14 = v4;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v15);
  -[VTUIProximityEnrollTrainingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

uint64_t __83__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updatePageNumberForInstruction:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiLocalizedStringForKey:", CFSTR("PAGE_PROGRESS_FORMAT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_trainingPageInstructions, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIProximityEnrollTrainingView pageLabel](self->_enrollTrainingView, "pageLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

}

- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke;
  v13[3] = &unk_24F33DD10;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke(id *a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void (**v12)(void);
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = objc_msgSend(a1[4], "length");
    objc_msgSend(WeakRetained[145], "statusLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "setAlpha:", 0.0);

      objc_msgSend(WeakRetained[145], "statusLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", a1[4]);

      v7 = (void *)MEMORY[0x24BEBDB00];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_2;
      v18[3] = &unk_24F33DA28;
      v18[4] = WeakRetained;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_3;
      v16[3] = &unk_24F33DE20;
      v17 = a1[5];
      objc_msgSend(v7, "animateWithDuration:animations:completion:", v18, v16, 0.3);
      v8 = v17;
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v4, "alpha");
    v10 = v9;

    if (v10 > 0.0)
    {
      v11 = (void *)MEMORY[0x24BEBDB00];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_4;
      v15[3] = &unk_24F33DA28;
      v15[4] = WeakRetained;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_5;
      v13[3] = &unk_24F33DE48;
      v13[4] = WeakRetained;
      v14 = a1[5];
      objc_msgSend(v11, "animateWithDuration:animations:completion:", v15, v13, 0.3);
      v8 = v14;
      goto LABEL_6;
    }
    v12 = (void (**)(void))a1[5];
    if (v12)
      v12[2]();
  }
LABEL_7:

}

void __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "statusLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "statusLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "statusLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_hideInstruction
{
  void *v3;
  id v4;

  -[VTUIProximityEnrollTrainingView instructionPagedLabel](self->_enrollTrainingView, "instructionPagedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

  -[VTUIProximityEnrollTrainingViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", 0);

}

- (void)_createTrainingManagerIfNeeded
{
  SSRVTUITrainingManager *v3;
  SSRVTUITrainingManager *trainingManager;

  if (!self->_trainingManager)
  {
    objc_msgSend(MEMORY[0x24BEAFEA8], "trainingManagerWithLocaleID:withAppDomain:", self->_spokenLanguageCode, *MEMORY[0x24BEAFEC0]);
    v3 = (SSRVTUITrainingManager *)objc_claimAutoreleasedReturnValue();
    trainingManager = self->_trainingManager;
    self->_trainingManager = v3;

    -[SSRVTUITrainingManager setDelegate:](self->_trainingManager, "setDelegate:", self);
  }
}

- (void)_resetTrainingManager
{
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
}

- (void)_cleanupTrainingManagerWithCompletion:(id)a3 status:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:]";
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);

  }
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", v6);

}

- (void)_cleanupTrainingManagerWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  SSRVTUITrainingManager *trainingManager;
  id v6;
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  trainingManager = self->_trainingManager;
  if (trainingManager)
  {
    v7 = v4;
    -[SSRVTUITrainingManager cancelTrainingForID:](trainingManager, "cancelTrainingForID:", self->_sessionId);
    -[SSRVTUITrainingManager stopRMS](self->_trainingManager, "stopRMS");
    v6 = (id)-[SSRVTUITrainingManager cleanupWithCompletion:](self->_trainingManager, "cleanupWithCompletion:", v7);
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (v4)
  {
    v7 = v4;
    v4[2](v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_shouldSpeakAudioHint
{
  return -[VTUIAudioHintPlayer shouldSpeakAudioHint](self->_audioHintPlayer, "shouldSpeakAudioHint");
}

- (id)interpretAudioSource:(unint64_t)a3
{
  if (a3 - 2 > 3)
    return CFSTR("ALERT_HEADPHONE_BAD_MIC");
  else
    return off_24F33DED0[a3 - 2];
}

- (void)_gatherAudioDeviceInfo
{
  NSObject *settingsQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__VTUIProximityEnrollTrainingViewController__gatherAudioDeviceInfo__block_invoke;
  v4[3] = &unk_24F33DA00;
  objc_copyWeak(&v5, &location);
  dispatch_async(settingsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__VTUIProximityEnrollTrainingViewController__gatherAudioDeviceInfo__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[136], "getConnectedBluetoothDeviceInfoArrayWithCompletion:", &__block_literal_global_0);
    WeakRetained = v2;
  }

}

void __67__VTUIProximityEnrollTrainingViewController__gatherAudioDeviceInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = a2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "productID", (_QWORD)v13);
        +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "audioProductID");

        if (v10 == v8)
        {
          objc_msgSend(v7, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAudioAccessoryName:", v11);

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (int64_t)interpretSessionManagerResult:(id)a3 forInstruction:(int64_t)a4
{
  id v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int64_t v17;

  v6 = a3;
  v7 = objc_msgSend(v6, "sessionStatus");
  v8 = objc_msgSend(v6, "audioStatus");

  v9 = v7 - 4;
  if (v9 < 3)
    return v9 + 5;
  if (a4 < 0
    || (-[VTUIProximityEnrollTrainingViewController trainingPageInstructions](self, "trainingPageInstructions"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v12 <= a4))
  {
    v16 = 0;
  }
  else
  {
    -[VTUIProximityEnrollTrainingViewController trainingPageInstructions](self, "trainingPageInstructions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RetryOnFail"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

  }
  if (v7 == 3)
    return 4;
  if ((v16 & 1) != 0)
  {
    if (v8 == 1)
    {
      return 9;
    }
    else if (v8 == 2)
    {
      return 10;
    }
    else if (v7 >= 8)
    {
      return 0;
    }
    else
    {
      return qword_229F4FDC8[v7];
    }
  }
  else
  {
    v17 = 8;
    if (v7 != 7)
      v17 = 1;
    if (v7 == 2)
      return 0;
    else
      return v17;
  }
}

- (id)_getSetupModeString
{
  void *v2;
  int v3;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBuddyOrFollowUp");

  if (v3)
    return CFSTR("buddy");
  else
    return CFSTR("prefs");
}

- (void)VTUITrainingManagerFeedLevel:(float)a3
{
  double v4;
  id v5;

  -[VTUIProximityEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPowerLevel:", v4);

}

- (void)aboutTapped:(id)a3
{
  UIView *v4;
  UIView *aboutTappedSender;
  id v6;

  v4 = (UIView *)a3;
  -[VTUIAnalytics setAboutViewShown:](self->_analyticsEvent, "setAboutViewShown:", -[VTUIAnalytics aboutViewShown](self->_analyticsEvent, "aboutViewShown") + 1);
  aboutTappedSender = self->_aboutTappedSender;
  self->_aboutTappedSender = v4;

  -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showLearnMore");

}

- (void)siriLanguageSpokenLanguageCodeDidChange:(id)a3
{
  NSString *v4;
  NSString *spokenLanguageCode;
  void *v6;
  NSString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "spokenLanguageCode");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  spokenLanguageCode = self->_spokenLanguageCode;
  self->_spokenLanguageCode = v4;

  -[VTUIAnalytics setLanguageCode:](self->_analyticsEvent, "setLanguageCode:", self->_spokenLanguageCode);
  v6 = (void *)*MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_spokenLanguageCode;
    v8 = v6;
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heySiriTriggerPhrase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[VTUIProximityEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code changed: %@. (Trigger: '%@')", (uint8_t *)&v14, 0x20u);

  }
  -[SSRVTUITrainingManager setLocaleIdentifier:](self->_trainingManager, "setLocaleIdentifier:", self->_spokenLanguageCode);
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSiriLanguage:", self->_spokenLanguageCode);

  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_spokenLanguageCode;
    v14 = 136315394;
    v15 = "-[VTUIProximityEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v14, 0x16u);
  }
  -[VTUIAudioHintPlayer setLanguage:](self->_audioHintPlayer, "setLanguage:", self->_spokenLanguageCode);
  -[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode);
}

- (void)skipAssistant:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isEnablementConfigurationLoading)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VTUIProximityEnrollTrainingViewController skipAssistant:]";
      _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip Assistant requested while Enablement configuration loading", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__VTUIProximityEnrollTrainingViewController_skipAssistant___block_invoke;
    v15[3] = &unk_24F33DC70;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v4;
    -[VTUIProximityEnrollTrainingViewController _setIntroViewActionOnEnablementConfigurationDidLoad:](self, "_setIntroViewActionOnEnablementConfigurationDidLoad:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VTUIProximityEnrollTrainingViewController skipAssistant:]";
      _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping Setup / Assistant", buf, 0xCu);
    }
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isBuddyOrFollowUp");

    if (v8)
    {
      +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "enrollmentMode") == 0;

      if (v10)
      {
        -[VTUIAnalytics setSkippedFromIntroAOP:](self->_analyticsEvent, "setSkippedFromIntroAOP:", -[VTUIAnalytics skippedFromIntroAOP](self->_analyticsEvent, "skippedFromIntroAOP") + 1);
      }
      else
      {
        +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "enrollmentMode") == 3;

        if (v12)
          -[VTUIAnalytics setSkippedFromIntroNonAOP:](self->_analyticsEvent, "setSkippedFromIntroNonAOP:", -[VTUIAnalytics skippedFromIntroNonAOP](self->_analyticsEvent, "skippedFromIntroNonAOP") + 1);
      }
    }
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "enrollmentMode") == 3;

    if (!v14)
      -[VTUIProximityEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
    -[VTUIProximityEnrollTrainingViewController skipTraining:](self, "skipTraining:", v4);
  }

}

void __59__VTUIProximityEnrollTrainingViewController_skipAssistant___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "skipAssistant:", *(_QWORD *)(a1 + 32));

  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController skipAssistant:]_block_invoke";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Skip Assistant processed after Enablement configuration loaded", (uint8_t *)&v4, 0xCu);
  }
}

- (void)cancelTraining
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VTUIProximityEnrollTrainingViewController cancelTraining]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_INFO, "%s Cancel Training", buf, 0xCu);
  }
  -[VTUIAudioHintPlayer cleanup](self->_audioHintPlayer, "cleanup");
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("currentTrainingState");
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_currentTrainingState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 5504, v8);

  -[VTUIAnalytics setVoiceTrainingCancelledStep:](self->_analyticsEvent, "setVoiceTrainingCancelledStep:", LODWORD(self->_currentTrainingState));
  -[VTUIAnalytics setVoiceTrainingCancelled:](self->_analyticsEvent, "setVoiceTrainingCancelled:", -[VTUIAnalytics voiceTrainingCancelled](self->_analyticsEvent, "voiceTrainingCancelled") + 1);
  +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:](VTUISELFLogger, "logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:", self->_trainingAttemptUUID, self->_enrollmentMode, self->_spokenLanguageCode, 2, LODWORD(self->_currentTrainingState));
  -[VTUIProximityEnrollTrainingViewController _cleanupHelper](self, "_cleanupHelper");
}

- (void)skipTraining:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSUUID *trainingAttemptUUID;
  int64_t enrollmentMode;
  NSString *spokenLanguageCode;
  uint64_t currentTrainingState_low;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VTUIProximityEnrollTrainingViewController skipTraining:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_INFO, "%s Skipping Training", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("currentTrainingState");
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_currentTrainingState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventWithType:context:", 5510, v10);

  self->_hasSkippedTraining = 1;
  trainingAttemptUUID = self->_trainingAttemptUUID;
  enrollmentMode = self->_enrollmentMode;
  spokenLanguageCode = self->_spokenLanguageCode;
  currentTrainingState_low = LODWORD(self->_currentTrainingState);
  LOWORD(v16) = -[VTUIProximityEnrollTrainingViewController _shouldSpeakAudioHint](self, "_shouldSpeakAudioHint");
  +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", trainingAttemptUUID, enrollmentMode, spokenLanguageCode, 2, currentTrainingState_low, 0, v16);
  -[VTUIProximityEnrollTrainingViewController _cleanupHelper](self, "_cleanupHelper");
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(trainingAttemptUUID) = objc_msgSend(v15, "assistantIsEnabled");

  if ((_DWORD)trainingAttemptUUID
    && -[VTUIProximityEnrollTrainingViewController _shouldShowSiriDataSharingOptInView](self, "_shouldShowSiriDataSharingOptInView"))
  {
    -[VTUIProximityEnrollTrainingViewController _showSiriDataSharingOptInView](self, "_showSiriDataSharingOptInView");
  }
  else
  {
    -[VTUIProximityEnrollTrainingViewController _skipSetup](self, "_skipSetup");
  }

}

- (void)_skipSetup
{
  void *v3;
  int v4;
  NSObject *v5;
  AFEnablementConfiguration *enablementConfiguration;
  AFEnablementConfiguration *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AFEnablementConfiguration *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    enablementConfiguration = self->_enablementConfiguration;
    v10 = 136315650;
    v11 = "-[VTUIProximityEnrollTrainingViewController _skipSetup]";
    v12 = 1024;
    v13 = v4;
    v14 = 2112;
    v15 = enablementConfiguration;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Ending setup, assistant enabled %d enablementConfiguration:%@", (uint8_t *)&v10, 0x1Cu);
  }
  if ((v4 & 1) == 0)
  {
    v7 = self->_enablementConfiguration;
    if (v7)
    {
      -[AFEnablementConfiguration completionLoggingBlock](v7, "completionLoggingBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0);

    }
  }
  -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "skipSetup");

}

- (void)_dismiss:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  AFEnablementConfiguration *enablementConfiguration;
  AFEnablementConfiguration *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  AFEnablementConfiguration *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VTUIProximityEnrollTrainingViewController _dismiss:]";
      _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_INFO, "%s Dismissing", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("currentTrainingState");
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_currentTrainingState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logEventWithType:context:", 5512, v11);

    -[VTUIProximityEnrollTrainingViewController _cleanupHelper](self, "_cleanupHelper");
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "assistantIsEnabled");

    v14 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      enablementConfiguration = self->_enablementConfiguration;
      *(_DWORD *)buf = 136315650;
      v20 = "-[VTUIProximityEnrollTrainingViewController _dismiss:]";
      v21 = 1024;
      v22 = v13;
      v23 = 2112;
      v24 = enablementConfiguration;
      _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s Ending setup, assistant enabled %d enablementConfiguration:%@", buf, 0x1Cu);
    }
    if ((v13 & 1) == 0)
    {
      v16 = self->_enablementConfiguration;
      if (v16)
      {
        -[AFEnablementConfiguration completionLoggingBlock](v16, "completionLoggingBlock");
        v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v17[2](v17, 0);

      }
    }
    -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissSetup");

  }
}

- (void)_cleanupHelper
{
  int v3;
  int *v4;

  v3 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v4 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
  if (v3)
    v4 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "resetStateMachine");
  -[VTUIProximityEnrollTrainingViewController _resetEnrollment](self, "_resetEnrollment");
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
  -[VTUIProximityEnrollTrainingViewController setTrainingAttemptUUID:](self, "setTrainingAttemptUUID:", 0);
}

- (BOOL)_shouldPresentLanguageDisambiguation
{
  return -[VTUIEnrollmentPageEligibilityProvider shouldShowLanguageDisambiguationForBestFittingSiriLanguages:](self->_pageEligibilityProvider, "shouldShowLanguageDisambiguationForBestFittingSiriLanguages:", self->_siriLanguageOptions);
}

- (void)_setLanguageOptionsAndContinue
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__VTUIProximityEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke;
  v3[3] = &unk_24F33DC70;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[VTUIProximityEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __75__VTUIProximityEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  VTUIProximityEnrollmentLanguageOptionsView *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(WeakRetained[147], "removeFromSuperview");
    v3 = v12[147];
    v12[147] = 0;

    WeakRetained = v12;
    if (!v12[155])
    {
      objc_msgSend(v12, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = [VTUIProximityEnrollmentLanguageOptionsView alloc];
      objc_msgSend(v12, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v7 = -[VTUIProximityEnrollmentLanguageOptionsView initWithFrame:languageOptions:](v5, "initWithFrame:languageOptions:", v12[126]);
      v8 = v12[155];
      v12[155] = (id)v7;

      objc_msgSend(v12[155], "setAutoresizingMask:", 18);
      objc_msgSend(v4, "addSubview:", v12[155]);
      objc_msgSend(v12[155], "continueButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__processLanguageSelectionAction_, 64);

      objc_msgSend(v12[155], "dismissButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__dismiss_, 64);

      objc_msgSend(v12[145], "skipButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      WeakRetained = v12;
    }
  }

}

- (void)_checkForPHSCloudDataIfNecessary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  dispatch_block_t v10;
  id hasPHSInCloudFetchBlock;
  NSObject *hasPHSInCloudFetchQueue;
  NSObject *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4
    && (+[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "enrollmentMode"),
        v5,
        !v6))
  {
    v9 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__VTUIProximityEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke;
    v16[3] = &unk_24F33DC70;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v16);
    hasPHSInCloudFetchBlock = self->_hasPHSInCloudFetchBlock;
    self->_hasPHSInCloudFetchBlock = v10;

    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    if (!hasPHSInCloudFetchQueue)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (OS_dispatch_queue *)dispatch_queue_create(0, v13);
      v15 = self->_hasPHSInCloudFetchQueue;
      self->_hasPHSInCloudFetchQueue = v14;

      hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    }
    dispatch_async(hasPHSInCloudFetchQueue, self->_hasPHSInCloudFetchBlock);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v7 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Clearing fetch block", buf, 0xCu);
    }
    v8 = self->_hasPHSInCloudFetchBlock;
    self->_hasPHSInCloudFetchBlock = 0;

  }
}

void __78__VTUIProximityEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained[977] = objc_msgSend(v3, "hasVoiceProfileIniCloudForLanguageCode:", *(_QWORD *)(a1 + 32));

    v4 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v5 = WeakRetained[977];
      v6 = 136315394;
      v7 = "-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]_block_invoke";
      v8 = 1024;
      v9 = v5;
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s set cloud value %d", (uint8_t *)&v6, 0x12u);
    }
  }

}

- (BOOL)_hasPHSCloudDataForSpokenLanguage
{
  NSObject *v3;
  NSObject *hasPHSInCloudFetchQueue;
  char v5;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (self->_hasPHSInCloudFetchBlock
    || (-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode), self->_hasPHSInCloudFetchBlock))
  {
    v3 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[VTUIProximityEnrollTrainingViewController _hasPHSCloudDataForSpokenLanguage]";
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Waiting on block", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __78__VTUIProximityEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke;
    v7[3] = &unk_24F33DC98;
    objc_copyWeak(&v8, (id *)buf);
    v7[4] = &v9;
    dispatch_sync(hasPHSInCloudFetchQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __78__VTUIProximityEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[977];

}

- (void)_finishSiriSetup:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__VTUIProximityEnrollTrainingViewController__finishSiriSetup___block_invoke;
  v5[3] = &unk_24F33DA00;
  objc_copyWeak(&v6, &location);
  -[VTUIProximityEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __62__VTUIProximityEnrollTrainingViewController__finishSiriSetup___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[134], "setTurnOnSiriNonAOP:", 1);
    objc_msgSend(v2, "_setAssistantEnabled:", 1);
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[VTUIProximityEnrollTrainingViewController _finishSiriSetup:]_block_invoke";
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    if (objc_msgSend(v2, "_shouldShowSiriDataSharingOptInView"))
    {
      objc_msgSend(v2, "_showSiriDataSharingOptInView");
    }
    else
    {
      objc_msgSend(v2, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "continueSetup");

    }
  }

}

- (void)finish:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VTUIProximityEnrollTrainingViewController finish:]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "continueSetup");

}

- (void)shouldAbortAnotherDeviceBetter:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController shouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s BTLE Device abort ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)shouldContinue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController shouldContinue:]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s BTLE Device continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController scdaShouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda abort ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scdaShouldContinue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController scdaShouldContinue:]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_showSiriDataSharingOptInView
{
  VTUISiriDataSharingOptInPresenter *siriDataSharingOptInPresenter;
  UIView *v4;
  UIView *siriDataSharingProximityView;
  VTUIProximityEnrollTrainingView *enrollTrainingView;
  VTUIProximityEnrollTrainingView *v7;
  VTUIProximityEnrollmentSuccessView *successView;
  VTUIProximityEnrollmentSuccessView *v9;
  id v10;

  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  objc_msgSend(v10, "bounds");
  -[VTUISiriDataSharingOptInPresenter dataSharingOptInViewForFrame:viewStyle:](siriDataSharingOptInPresenter, "dataSharingOptInViewForFrame:viewStyle:", 1);
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  siriDataSharingProximityView = self->_siriDataSharingProximityView;
  self->_siriDataSharingProximityView = v4;

  -[UIView setAutoresizingMask:](self->_siriDataSharingProximityView, "setAutoresizingMask:", 18);
  objc_msgSend(v10, "addSubview:", self->_siriDataSharingProximityView);
  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView)
  {
    -[VTUIProximityEnrollTrainingView removeFromSuperview](enrollTrainingView, "removeFromSuperview");
    v7 = self->_enrollTrainingView;
    self->_enrollTrainingView = 0;

  }
  successView = self->_successView;
  if (successView)
  {
    -[VTUIProximityEnrollmentSuccessView removeFromSuperview](successView, "removeFromSuperview");
    v9 = self->_successView;
    self->_successView = 0;

  }
}

- (BOOL)_shouldShowSiriDataSharingOptInView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeviceIPad");

  v5 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "activeInterfaceOrientation");
  v6 = -[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView](self->_siriDataSharingOptInPresenter, "shouldShowSiriDataSharingOptInView");
  v7 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "-[VTUIProximityEnrollTrainingViewController _shouldShowSiriDataSharingOptInView]";
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: isIpad:%@ isPortrait: %@, unspecifiedState:%@", (uint8_t *)&v15, 0x2Au);

  }
  if (v5 == 1)
    v13 = 1;
  else
    v13 = v4;
  return v13 & v6;
}

- (void)siriDataSharingOptInViewDismissButtonTappedFromPresenter:(id)a3
{
  VTUISiriDataSharingOptInPresenter *siriDataSharingOptInPresenter;
  UIView *siriDataSharingProximityView;

  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  self->_siriDataSharingOptInPresenter = 0;

  siriDataSharingProximityView = self->_siriDataSharingProximityView;
  self->_siriDataSharingProximityView = 0;

  -[VTUIProximityEnrollTrainingViewController _dismiss:](self, "_dismiss:", 0);
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  VTUISiriDataSharingOptInPresenter *siriDataSharingOptInPresenter;
  UIView *siriDataSharingProximityView;
  id v6;

  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  self->_siriDataSharingOptInPresenter = 0;

  siriDataSharingProximityView = self->_siriDataSharingProximityView;
  self->_siriDataSharingProximityView = 0;

  if (self->_hasSkippedTraining)
  {
    -[VTUIProximityEnrollTrainingViewController _skipSetup](self, "_skipSetup");
  }
  else
  {
    -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "continueSetup");

  }
}

- (void)_processIntroViewContinueAction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  VTUIProximityEnrollmentSetupIntroView *introView;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isEnablementConfigurationLoading)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[VTUIProximityEnrollTrainingViewController _processIntroViewContinueAction:]";
      _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Intro view continue requested while Enablement configuration loading", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__VTUIProximityEnrollTrainingViewController__processIntroViewContinueAction___block_invoke;
    v8[3] = &unk_24F33DC70;
    objc_copyWeak(&v10, (id *)buf);
    v9 = v4;
    -[VTUIProximityEnrollTrainingViewController _setIntroViewActionOnEnablementConfigurationDidLoad:](self, "_setIntroViewActionOnEnablementConfigurationDidLoad:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else if (-[VTUIProximityEnrollTrainingViewController _shouldPresentLanguageDisambiguation](self, "_shouldPresentLanguageDisambiguation"))
  {
    -[VTUIProximityEnrollTrainingViewController _setLanguageOptionsAndContinue](self, "_setLanguageOptionsAndContinue");
  }
  else if (-[AFEnablementConfiguration requiresVoiceSelectionForRecognitionLanguage:](self->_enablementConfiguration, "requiresVoiceSelectionForRecognitionLanguage:", self->_spokenLanguageCode))
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[VTUIProximityEnrollTrainingViewController _processIntroViewContinueAction:]";
      _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    -[VTUIProximityEnrollmentSetupIntroView removeFromSuperview](self->_introView, "removeFromSuperview");
    introView = self->_introView;
    self->_introView = 0;

    -[VTUIProximityEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:](self, "_showVoiceSelectionViewForRecognitionLanguage:", self->_spokenLanguageCode);
  }
  else
  {
    -[VTUIProximityEnrollTrainingViewController _continueToTrainingFromIntro](self, "_continueToTrainingFromIntro");
  }

}

void __77__VTUIProximityEnrollTrainingViewController__processIntroViewContinueAction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_processIntroViewContinueAction:", *(_QWORD *)(a1 + 32));

  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIProximityEnrollTrainingViewController _processIntroViewContinueAction:]_block_invoke";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Intro view continue processed after Enablement configuration loaded", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_setIntroViewActionOnEnablementConfigurationDidLoad:(id)a3
{
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
  id v15;
  id v16;
  void *v17;
  id onEnablementConfigurationDidLoad;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  id v26;
  id location;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "startAnimating");
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollmentSetupIntroView setupButton](self->_introView, "setupButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  objc_msgSend(v4, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollmentSetupIntroView setupButton](self->_introView, "setupButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v12);

  -[VTUIProximityEnrollmentSetupIntroView setupButton](self->_introView, "setupButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[VTUIProximityEnrollmentSetupIntroView notNowButton](self->_introView, "notNowButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__VTUIProximityEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke;
  aBlock[3] = &unk_24F33DEB0;
  v25 = v22;
  v15 = v22;
  objc_copyWeak(&v26, &location);
  v24 = v4;
  v16 = v4;
  v17 = _Block_copy(aBlock);
  onEnablementConfigurationDidLoad = self->_onEnablementConfigurationDidLoad;
  self->_onEnablementConfigurationDidLoad = v17;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

uint64_t __97__VTUIProximityEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "introView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "introView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notNowButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_processLanguageSelectionAction:(id)a3
{
  NSArray *siriLanguageOptions;
  void *v5;
  VTUIProximityEnrollmentLanguageOptionsView *languageOptionsView;
  NSString *disambiguatedLanguageOption;
  NSString *v8;
  id obj;

  siriLanguageOptions = self->_siriLanguageOptions;
  -[VTUIProximityEnrollmentLanguageOptionsView languagesPickerView](self->_languageOptionsView, "languagesPickerView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](siriLanguageOptions, "objectAtIndexedSubscript:", objc_msgSend(v5, "selectedRowInComponent:", 0));
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    objc_storeStrong((id *)&self->_spokenLanguageCode, obj);
    objc_storeStrong((id *)&self->_disambiguatedLanguageOption, self->_spokenLanguageCode);
    -[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode);
  }
  if (-[AFEnablementConfiguration requiresVoiceSelectionForRecognitionLanguage:](self->_enablementConfiguration, "requiresVoiceSelectionForRecognitionLanguage:", self->_spokenLanguageCode))
  {
    -[VTUIProximityEnrollmentLanguageOptionsView removeFromSuperview](self->_languageOptionsView, "removeFromSuperview");
    languageOptionsView = self->_languageOptionsView;
    self->_languageOptionsView = 0;

    -[VTUIProximityEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:](self, "_showVoiceSelectionViewForRecognitionLanguage:", self->_spokenLanguageCode);
  }
  else
  {
    disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
    if (disambiguatedLanguageOption)
    {
      -[VTUIProximityEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:](self, "_processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:", disambiguatedLanguageOption, 1);
      v8 = self->_disambiguatedLanguageOption;
      self->_disambiguatedLanguageOption = 0;

    }
    -[VTUIProximityEnrollTrainingViewController _continueToTrainingFromLanguageOptions](self, "_continueToTrainingFromLanguageOptions");
  }

}

- (void)_processDisambiguatedLanguageOption:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSString *disambiguatedLanguageOption;
  int v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[VTUIProximityEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
    _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enrollmentMode");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLanguageCode:", self->_disambiguatedLanguageOption);

  }
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSiriLanguage:", self->_disambiguatedLanguageOption);

  if (v10 != 3)
  {
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
      v15 = 136315394;
      v16 = "-[VTUIProximityEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
      v17 = 2112;
      v18 = disambiguatedLanguageOption;
      _os_log_impl(&dword_229EF7000, v13, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v15, 0x16u);
    }
    -[VTUIAudioHintPlayer setLanguage:](self->_audioHintPlayer, "setLanguage:", self->_disambiguatedLanguageOption);
  }

}

- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  VTUIVoiceSelectionViewController *v8;
  VTUIVoiceSelectionViewController *voiceSelectionViewController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[VTUIProximityEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Showing voice selection view for recognitionLanguage %@", buf, 0x16u);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v7 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[VTUIProximityEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s No recognition language used, falling back to %@", buf, 0x16u);
    }
  }
  v8 = -[VTUIVoiceSelectionViewController initCompactWithRecognitionLanguage:allowsRandomSelection:customVoicePreviewer:delegate:]([VTUIVoiceSelectionViewController alloc], "initCompactWithRecognitionLanguage:allowsRandomSelection:customVoicePreviewer:delegate:", v4, -[AFEnablementConfiguration voiceSelectionAllowsRandomSelection](self->_enablementConfiguration, "voiceSelectionAllowsRandomSelection", v4), 0, self);
  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = v8;

  -[VTUIVoiceSelectionViewController willMoveToParentViewController:](self->_voiceSelectionViewController, "willMoveToParentViewController:", self);
  -[VTUIProximityEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_voiceSelectionViewController);
  -[VTUIVoiceSelectionViewController didMoveToParentViewController:](self->_voiceSelectionViewController, "didMoveToParentViewController:", self);
  -[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setAutoresizesSubviews:", 0);
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  v23 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v27;
  objc_msgSend(v10, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  objc_msgSend(v10, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v15;
  objc_msgSend(v10, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v20);

}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSString *disambiguatedLanguageOption;
  NSString *v12;
  void *v13;
  void *v14;
  VTUIVoiceSelectionViewController *voiceSelectionViewController;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315650;
    v17 = "-[VTUIProximityEnrollTrainingViewController voiceSelectionController:didSelectVoice:]";
    v18 = 2112;
    v19 = v7;
    v20 = 2048;
    v21 = objc_msgSend(v10, "enrollmentMode");
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s voice: %@, enrollment: %ld", (uint8_t *)&v16, 0x20u);

  }
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  if (disambiguatedLanguageOption)
  {
    -[VTUIProximityEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:](self, "_processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:", disambiguatedLanguageOption, 0);
    v12 = self->_disambiguatedLanguageOption;
    self->_disambiguatedLanguageOption = 0;

  }
  -[VTUIAudioHintPlayer setOutputVoice:](self->_audioHintPlayer, "setOutputVoice:", v7);
  -[VTUIProximityEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLanguageCode:outputVoice:", self->_spokenLanguageCode, v7);

  -[VTUIVoiceSelectionViewController removeFromParentViewController](self->_voiceSelectionViewController, "removeFromParentViewController");
  -[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = 0;

  -[VTUIProximityEnrollTrainingViewController _continueToTrainingFromVoiceSelection](self, "_continueToTrainingFromVoiceSelection");
}

- (void)voiceSelectionControllerRequestsDismissal:(id)a3
{
  -[VTUIProximityEnrollTrainingViewController _dismiss:](self, "_dismiss:", 0);
}

- (void)_continueToTrainingFromIntro
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[VTUIProximityEnrollTrainingViewController _continueToTrainingFromIntro]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__VTUIProximityEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke;
  v4[3] = &unk_24F33DA00;
  objc_copyWeak(&v5, (id *)buf);
  -[VTUIProximityEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __73__VTUIProximityEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[147], "removeFromSuperview");
    v2 = v4[147];
    v4[147] = 0;

    objc_msgSend(v4, "_setAssistantEnabled:", 1);
    objc_msgSend(v4[145], "skipButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

    objc_msgSend(v4[134], "setVoiceTrainingStarted:", objc_msgSend(v4[134], "voiceTrainingStarted") + 1);
    objc_msgSend(v4, "_startTrainingIfNecessary");
    WeakRetained = v4;
  }

}

- (void)_continueToTrainingFromLanguageOptions
{
  NSObject *v3;
  VTUIProximityEnrollmentLanguageOptionsView *languageOptionsView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[VTUIProximityEnrollTrainingViewController _continueToTrainingFromLanguageOptions]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  -[VTUIProximityEnrollmentLanguageOptionsView removeFromSuperview](self->_languageOptionsView, "removeFromSuperview");
  languageOptionsView = self->_languageOptionsView;
  self->_languageOptionsView = 0;

  -[VTUIProximityEnrollTrainingViewController _setAssistantEnabled:](self, "_setAssistantEnabled:", 1);
  v5 = (void *)objc_msgSend(CFSTR("BUTTON_SET_UP_LATER"), "copy");
  -[VTUIProximityEnrollTrainingView skipButton](self->_enrollTrainingView, "skipButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[VTUIProximityEnrollTrainingView skipButton](self->_enrollTrainingView, "skipButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "VTUIDeviceSpecificString:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  -[VTUIAnalytics setVoiceTrainingStarted:](self->_analyticsEvent, "setVoiceTrainingStarted:", -[VTUIAnalytics voiceTrainingStarted](self->_analyticsEvent, "voiceTrainingStarted") + 1);
  -[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary](self, "_startTrainingIfNecessary");

}

- (void)_continueToTrainingFromVoiceSelection
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[VTUIProximityEnrollTrainingViewController _continueToTrainingFromVoiceSelection]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v4 = (void *)objc_msgSend(CFSTR("BUTTON_SET_UP_LATER"), "copy");
  -[VTUIProximityEnrollTrainingView skipButton](self->_enrollTrainingView, "skipButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[VTUIProximityEnrollTrainingView skipButton](self->_enrollTrainingView, "skipButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "VTUIDeviceSpecificString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  -[VTUIProximityEnrollTrainingViewController _setAssistantEnabled:](self, "_setAssistantEnabled:", 1);
  -[VTUIAnalytics setVoiceTrainingStarted:](self->_analyticsEvent, "setVoiceTrainingStarted:", -[VTUIAnalytics voiceTrainingStarted](self->_analyticsEvent, "voiceTrainingStarted") + 1);
  -[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary](self, "_startTrainingIfNecessary");

}

- (void)_startTrainingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v5))
  {
    v6 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary]";
      _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data locally", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("type");
    v19 = CFSTR("local");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logEventWithType:context:", 5501, v8);

    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVoiceTriggerEnabled:", 1);

LABEL_9:
    if (-[VTUIProximityEnrollTrainingViewController _shouldShowSiriDataSharingOptInView](self, "_shouldShowSiriDataSharingOptInView"))
    {
      -[VTUIProximityEnrollTrainingViewController _showSiriDataSharingOptInView](self, "_showSiriDataSharingOptInView");
    }
    else
    {
      -[VTUIProximityEnrollTrainingViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "continueSetup");

    }
    goto LABEL_15;
  }
  v10 = -[VTUIProximityEnrollTrainingViewController _hasPHSCloudDataForSpokenLanguage](self, "_hasPHSCloudDataForSpokenLanguage");
  v11 = *MEMORY[0x24BE09000];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary]";
      _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data in cloud", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("type");
    v17 = CFSTR("cloud");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEventWithType:context:", 5501, v14);

    objc_msgSend(v3, "enableVoiceTriggerUponVoiceProfileSyncForLanguage:", self->_spokenLanguageCode);
    goto LABEL_9;
  }
  if (v12)
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary]";
    _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting training due to no PHS data locally or in cloud", buf, 0xCu);
  }
  -[VTUIProximityEnrollTrainingViewController _startTraining](self, "_startTraining");
LABEL_15:

}

- (VTUIEnrollTrainingViewControllerDelegate)delegate
{
  return (VTUIEnrollTrainingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSRVTUITrainingManager)trainingManager
{
  return self->_trainingManager;
}

- (void)setTrainingManager:(id)a3
{
  objc_storeStrong((id *)&self->_trainingManager, a3);
}

- (unint64_t)sessionId
{
  return self->_sessionId;
}

- (int64_t)currentTrainingState
{
  return self->_currentTrainingState;
}

- (void)setCurrentTrainingState:(int64_t)a3
{
  self->_currentTrainingState = a3;
}

- (BOOL)hasRetriedTraining
{
  return self->_hasRetriedTraining;
}

- (void)setHasRetriedTraining:(BOOL)a3
{
  self->_hasRetriedTraining = a3;
}

- (BOOL)skipToEndForTesting
{
  return self->_skipToEndForTesting;
}

- (void)setSkipToEndForTesting:(BOOL)a3
{
  self->_skipToEndForTesting = a3;
}

- (BOOL)skipToDataSharingForTesting
{
  return self->_skipToDataSharingForTesting;
}

- (void)setSkipToDataSharingForTesting:(BOOL)a3
{
  self->_skipToDataSharingForTesting = a3;
}

- (BOOL)disambiguateLanguageOptionsForTesting
{
  return self->_disambiguateLanguageOptionsForTesting;
}

- (void)setDisambiguateLanguageOptionsForTesting:(BOOL)a3
{
  self->_disambiguateLanguageOptionsForTesting = a3;
}

- (BOOL)simulateJSSupportingDeviceForTesting
{
  return self->_simulateJSSupportingDeviceForTesting;
}

- (VTUIProximityEnrollTrainingView)enrollTrainingView
{
  return self->_enrollTrainingView;
}

- (void)setEnrollTrainingView:(id)a3
{
  objc_storeStrong((id *)&self->_enrollTrainingView, a3);
}

- (VTUIProximityEnrollmentSuccessView)successView
{
  return self->_successView;
}

- (void)setSuccessView:(id)a3
{
  objc_storeStrong((id *)&self->_successView, a3);
}

- (VTUIProximityEnrollmentSetupIntroView)introView
{
  return self->_introView;
}

- (void)setIntroView:(id)a3
{
  objc_storeStrong((id *)&self->_introView, a3);
}

- (VTUIProximityTryAgainView)tryAgainView
{
  return self->_tryAgainView;
}

- (void)setTryAgainView:(id)a3
{
  objc_storeStrong((id *)&self->_tryAgainView, a3);
}

- (unint64_t)badMicRetryCount
{
  return self->_badMicRetryCount;
}

- (void)setBadMicRetryCount:(unint64_t)a3
{
  self->_badMicRetryCount = a3;
}

- (unint64_t)AVVCRetryCount
{
  return self->_AVVCRetryCount;
}

- (void)setAVVCRetryCount:(unint64_t)a3
{
  self->_AVVCRetryCount = a3;
}

- (unint64_t)digitalZerosRetryCount
{
  return self->_digitalZerosRetryCount;
}

- (void)setDigitalZerosRetryCount:(unint64_t)a3
{
  self->_digitalZerosRetryCount = a3;
}

- (unint64_t)cannotHearRetryCount
{
  return self->_cannotHearRetryCount;
}

- (void)setCannotHearRetryCount:(unint64_t)a3
{
  self->_cannotHearRetryCount = a3;
}

- (NSString)spokenLanguageCode
{
  return self->_spokenLanguageCode;
}

- (void)setSpokenLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_spokenLanguageCode, a3);
}

- (NSString)disambiguatedLanguageOption
{
  return self->_disambiguatedLanguageOption;
}

- (void)setDisambiguatedLanguageOption:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguatedLanguageOption, a3);
}

- (VTUIProximityEnrollmentLanguageOptionsView)languageOptionsView
{
  return self->_languageOptionsView;
}

- (void)setLanguageOptionsView:(id)a3
{
  objc_storeStrong((id *)&self->_languageOptionsView, a3);
}

- (UIView)aboutTappedSender
{
  return self->_aboutTappedSender;
}

- (void)setAboutTappedSender:(id)a3
{
  objc_storeStrong((id *)&self->_aboutTappedSender, a3);
}

- (BOOL)shouldTurnOnMyriad
{
  return self->_shouldTurnOnMyriad;
}

- (void)setShouldTurnOnMyriad:(BOOL)a3
{
  self->_shouldTurnOnMyriad = a3;
}

- (AFMyriadCoordinator)myriadCoordinator
{
  return self->_myriadCoordinator;
}

- (void)setMyriadCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_myriadCoordinator, a3);
}

- (SCDACoordinator)scdaCoordinator
{
  return self->_scdaCoordinator;
}

- (void)setScdaCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_scdaCoordinator, a3);
}

- (NSArray)trainingPageInstructions
{
  return self->_trainingPageInstructions;
}

- (void)setTrainingPageInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_trainingPageInstructions, a3);
}

- (VTUIAudioHintPlayer)audioHintPlayer
{
  return self->_audioHintPlayer;
}

- (void)setAudioHintPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioHintPlayer, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NSUUID)trainingAttemptUUID
{
  return self->_trainingAttemptUUID;
}

- (void)setTrainingAttemptUUID:(id)a3
{
  objc_storeStrong((id *)&self->_trainingAttemptUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingAttemptUUID, 0);
  objc_storeStrong((id *)&self->_audioHintPlayer, 0);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_myriadCoordinator, 0);
  objc_storeStrong((id *)&self->_aboutTappedSender, 0);
  objc_storeStrong((id *)&self->_languageOptionsView, 0);
  objc_storeStrong((id *)&self->_disambiguatedLanguageOption, 0);
  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
  objc_storeStrong((id *)&self->_tryAgainView, 0);
  objc_storeStrong((id *)&self->_introView, 0);
  objc_storeStrong((id *)&self->_successView, 0);
  objc_storeStrong((id *)&self->_enrollTrainingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_onEnablementConfigurationDidLoad, 0);
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_pageEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_siriDataSharingProximityView, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptions, 0);
  objc_storeStrong((id *)&self->_trainingPageInstructions, 0);
  objc_storeStrong((id *)&self->_hasPHSInCloudFetchQueue, 0);
  objc_storeStrong(&self->_hasPHSInCloudFetchBlock, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

@end
