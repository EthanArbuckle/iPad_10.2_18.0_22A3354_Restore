@implementation VTUIEnrollTrainingViewController

- (id)init:(int64_t)a3 withAppDomain:(id)a4
{
  id v6;
  VTUIEnrollTrainingViewController *v7;
  NSObject *v8;
  id v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VTUIEnrollTrainingViewController;
  v7 = -[VTUIEnrollTrainingViewController init](&v11, sel_init);
  if (v7)
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[VTUIEnrollTrainingViewController init:withAppDomain:]";
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s init with enrollmentMode: %ld", buf, 0x16u);
    }
    if (v6)
      v9 = v6;
    else
      v9 = (id)*MEMORY[0x24BEAFEC0];
    -[VTUIEnrollTrainingViewController _configureTrainingWith:withAppDomain:](v7, "_configureTrainingWith:withAppDomain:", a3, v9);
  }

  return v7;
}

- (id)init:(int64_t)a3
{
  VTUIEnrollTrainingViewController *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollTrainingViewController;
  v4 = -[VTUIEnrollTrainingViewController init](&v7, sel_init);
  if (v4)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[VTUIEnrollTrainingViewController init:]";
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s init with enrollmentMode: %ld", buf, 0x16u);
    }
    -[VTUIEnrollTrainingViewController _configureTrainingWith:withAppDomain:](v4, "_configureTrainingWith:withAppDomain:", a3, *MEMORY[0x24BEAFEC0]);
  }
  return v4;
}

- (void)_configureTrainingWith:(int64_t)a3 withAppDomain:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  NSObject *v14;
  VTUISiriDataSharingOptInPresenter *v15;
  VTUISiriDataSharingOptInPresenter *siriDataSharingOptInPresenter;
  VTUISiriDataSharingOptInPresenter *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[VTUIEnrollTrainingViewController _initialSetup](self, "_initialSetup");
  v8 = 1;
  if (a3 != 1 && a3 != 7)
    v8 = PSIsRunningInAssistant();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsBuddyOrFollowUp:", v8);

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnrollmentMode:", a3);

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldShowVoiceTriggerConfirmationInBuddy");

  v13 = a3;
  if (v12)
  {
    v13 = a3;
    if ((_DWORD)v8)
    {
      v14 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[VTUIEnrollTrainingViewController _configureTrainingWith:withAppDomain:]";
        _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s enrollment mode set for VT confirmation", (uint8_t *)&v18, 0xCu);
      }
      v13 = 6;
    }
  }
  self->_enrollmentMode = v13;
  objc_storeStrong((id *)&self->_voiceProfileAppDomain, a4);
  if (self->_enrollmentMode == 2)
  {
    if (-[VTUIEnrollTrainingViewController _shouldPresentLanguageDisambiguation](self, "_shouldPresentLanguageDisambiguation"))
    {
      -[VTUIEnrollTrainingViewController _setLanguageOptionsAndContinue](self, "_setLanguageOptionsAndContinue");
    }
    else
    {
      -[VTUIEnrollTrainingViewController _continueToTrainingFromIntro](self, "_continueToTrainingFromIntro");
    }
  }
  v15 = objc_alloc_init(VTUISiriDataSharingOptInPresenter);
  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  self->_siriDataSharingOptInPresenter = v15;

  -[VTUISiriDataSharingOptInPresenter setPresentationDelegate:](self->_siriDataSharingOptInPresenter, "setPresentationDelegate:", self);
  v17 = self->_siriDataSharingOptInPresenter;
  if (a3 == 1)
  {
    -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](v17, "setSourceOfChange:", 7);
    -[VTUISiriDataSharingOptInPresenter setReasonForChange:](self->_siriDataSharingOptInPresenter, "setReasonForChange:", CFSTR("followup"));
  }
  else
  {
    -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](v17, "setSourceOfChange:", 1);
  }

}

- (VTUIEnrollTrainingViewController)init
{
  VTUIEnrollTrainingViewController *v2;
  NSObject *v3;
  void *v4;
  VTUISiriDataSharingOptInPresenter *v5;
  VTUISiriDataSharingOptInPresenter *siriDataSharingOptInPresenter;
  uint64_t v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)VTUIEnrollTrainingViewController;
  v2 = -[VTUIEnrollTrainingViewController init](&v9, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[VTUIEnrollTrainingViewController init]";
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    -[VTUIEnrollTrainingViewController _initialSetup](v2, "_initialSetup");
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsBuddyOrFollowUp:", PSIsRunningInAssistant());
    -[VTUIEnrollTrainingViewController _setupMode](v2, "_setupMode");
    objc_storeStrong((id *)&v2->_voiceProfileAppDomain, (id)*MEMORY[0x24BEAFEC0]);
    if (v2->_enrollmentMode == 2)
    {
      if (-[VTUIEnrollTrainingViewController _shouldPresentLanguageDisambiguation](v2, "_shouldPresentLanguageDisambiguation"))
      {
        -[VTUIEnrollTrainingViewController _setLanguageOptionsAndContinue](v2, "_setLanguageOptionsAndContinue");
      }
      else
      {
        -[VTUIEnrollTrainingViewController _continueToTrainingFromIntro](v2, "_continueToTrainingFromIntro");
      }
    }
    v5 = objc_alloc_init(VTUISiriDataSharingOptInPresenter);
    siriDataSharingOptInPresenter = v2->_siriDataSharingOptInPresenter;
    v2->_siriDataSharingOptInPresenter = v5;

    -[VTUISiriDataSharingOptInPresenter setPresentationDelegate:](v2->_siriDataSharingOptInPresenter, "setPresentationDelegate:", v2);
    if (objc_msgSend(v4, "isBuddyOrFollowUp"))
      v7 = 1;
    else
      v7 = 7;
    -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](v2->_siriDataSharingOptInPresenter, "setSourceOfChange:", v7);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  -[VTUIAnalytics logEvent](self->_analyticsEvent, "logEvent");
  if (-[VTUIEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "deleteUserVoiceProfile:", v4);

  }
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollTrainingViewController;
  -[VTUIEnrollTrainingViewController dealloc](&v7, sel_dealloc);
}

- (void)_initialSetup
{
  VTUIEnrollmentPageEligibilityProvider *v3;
  VTUIEnrollmentPageEligibilityProvider *pageEligibilityProvider;
  AFUISiriLanguage *v5;
  AFUISiriLanguage *siriLanguage;
  NSString *v7;
  NSString *spokenLanguageCode;
  VTUIAnalytics *v9;
  VTUIAnalytics *analyticsEvent;
  VTUIAnalytics *v11;
  void *v12;
  AFSettingsConnection *v13;
  AFSettingsConnection *settingsConnection;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *settingsQueue;
  void *v17;
  NSString *v18;
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
  uint64_t v33;
  VTUIAudioHintPlayer *v34;
  NSString *v35;
  void *v36;
  VTUIAudioHintPlayer *v37;
  VTUIAudioHintPlayer *audioHintPlayer;
  void *v39;
  uint64_t v40;
  int v41;
  const char *v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  VTUILogInitIfNeeded();
  v3 = objc_alloc_init(VTUIEnrollmentPageEligibilityProvider);
  pageEligibilityProvider = self->_pageEligibilityProvider;
  self->_pageEligibilityProvider = v3;

  v5 = (AFUISiriLanguage *)objc_msgSend(objc_alloc(MEMORY[0x24BE09528]), "initWithDelegate:", self);
  siriLanguage = self->_siriLanguage;
  self->_siriLanguage = v5;

  -[AFUISiriLanguage spokenLanguageCode](self->_siriLanguage, "spokenLanguageCode");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  spokenLanguageCode = self->_spokenLanguageCode;
  self->_spokenLanguageCode = v7;

  v9 = objc_alloc_init(VTUIAnalytics);
  analyticsEvent = self->_analyticsEvent;
  self->_analyticsEvent = v9;

  v11 = self->_analyticsEvent;
  -[VTUIEnrollTrainingViewController _getSetupModeString](self, "_getSetupModeString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIAnalytics setSetupMode:](v11, "setSetupMode:", v12);

  v13 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
  settingsConnection = self->_settingsConnection;
  self->_settingsConnection = v13;

  v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.voicetrigger.home", 0);
  settingsQueue = self->_settingsQueue;
  self->_settingsQueue = v15;

  if (!self->_spokenLanguageCode)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v18;

    v20 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_spokenLanguageCode;
      v41 = 136315394;
      v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
      v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_229EF7000, v20, OS_LOG_TYPE_DEFAULT, "%s No Siri language code found, falling back to: %@", (uint8_t *)&v41, 0x16u);
    }
  }
  v22 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_spokenLanguageCode;
    v41 = 136315394;
    v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
    v43 = 2112;
    v44 = v23;
    _os_log_impl(&dword_229EF7000, v22, OS_LOG_TYPE_DEFAULT, "%s Initializing with language code: %@", (uint8_t *)&v41, 0x16u);
  }
  if (self->_spokenLanguageCode)
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSiriLanguage:", self->_spokenLanguageCode);

    v25 = self->_spokenLanguageCode;
  }
  else
  {
    v25 = 0;
  }
  -[VTUIAnalytics setLanguageCode:](self->_analyticsEvent, "setLanguageCode:", v25);
  self->_shouldTurnOnMyriad = 1;
  v26 = (void *)*MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v27 = self->_spokenLanguageCode;
    v28 = v26;
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "heySiriTriggerPhrase");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 136315650;
    v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
    v43 = 2112;
    v44 = v27;
    v45 = 2112;
    v46 = v30;
    _os_log_impl(&dword_229EF7000, v28, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code: %@. (Trigger: '%@')", (uint8_t *)&v41, 0x20u);

  }
  v31 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 136315138;
    v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
    _os_log_impl(&dword_229EF7000, v31, OS_LOG_TYPE_DEFAULT, "%s Setting the current training state in VTUIEnrollTrainingViewController to kVTUITrainingStateNotStarted", (uint8_t *)&v41, 0xCu);
  }
  self->_currentTrainingState = -1;
  aboutTappedSender = self->_aboutTappedSender;
  self->_aboutTappedSender = 0;

  if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
    v33 = 1320;
  else
    v33 = 1312;
  if (!*(Class *)((char *)&self->super.super.super.isa + v33))
    -[VTUIEnrollTrainingViewController _setupMyriadCoordinator](self, "_setupMyriadCoordinator");
  v34 = [VTUIAudioHintPlayer alloc];
  v35 = self->_spokenLanguageCode;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[VTUIAudioHintPlayer initWithLanguage:isCompact:](v34, "initWithLanguage:isCompact:", v35, objc_msgSend(v36, "shouldSetupForMultipleTriggerPhrases"));
  audioHintPlayer = self->_audioHintPlayer;
  self->_audioHintPlayer = v37;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "userInterfaceIdiom");

  if ((v40 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x24BE6E3E0], "preferredContentSize");
    -[VTUIEnrollTrainingViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)_setupMode
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBuddyOrFollowUp");

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "isHeySiriAlwaysOn");

    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      v10 = 0;
    else
      v10 = 3;
    objc_msgSend(v8, "setEnrollmentMode:", v10);

    -[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode);
  }
  else
  {
    objc_msgSend(v5, "setEnrollmentMode:", 4);

  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  self->_enrollmentMode = objc_msgSend(v11, "enrollmentMode");

}

- (void)viewDidLoad
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  BOOL *p_skipToSiriDataSharingOptInForTesting;
  void *v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  VTUILogInitIfNeeded();
  v19.receiver = self;
  v19.super_class = (Class)VTUIEnrollTrainingViewController;
  -[VTUIEnrollTrainingViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[VTUIEnrollTrainingViewController _updateViewBackground](self, "_updateViewBackground");
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupForCurrentLocaleAndSiriLanguage");

  -[VTUIEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
  -[VTUIEnrollTrainingViewController _setupEnrollTrainingView](self, "_setupEnrollTrainingView");
  v4 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VTUIEnrollTrainingViewController viewDidLoad]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Main View Loaded", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__resignActive, *MEMORY[0x24BEBE010], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__becomeActive, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didEnterBackground, *MEMORY[0x24BEBDF98], 0);

  if (self->_skipToEndForTesting)
  {
    self->_currentTrainingState = 5;
    -[VTUITrainingViewMediator hideTrainingView:](self->_trainingViewMediator, "hideTrainingView:", 0);
    -[VTUIEnrollTrainingViewController _showEnrollmentSuccessView](self, "_showEnrollmentSuccessView");
  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldPresentDisclosureForCompactVoiceTrigger");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "assistantIsEnabled"))
  {
    if (self->_enrollmentMode)
      v11 = 0;
    else
      v11 = v9 ^ 1u;

    p_skipToSiriDataSharingOptInForTesting = &self->_skipToSiriDataSharingOptInForTesting;
    if (!self->_skipToSiriDataSharingOptInForTesting)
    {
      if (!(_DWORD)v11
        || !-[VTUIEnrollTrainingViewController _shouldShowSiriDataSharingOptInView](self, "_shouldShowSiriDataSharingOptInView"))
      {
        return;
      }
      v11 = 1;
    }
  }
  else
  {

    p_skipToSiriDataSharingOptInForTesting = &self->_skipToSiriDataSharingOptInForTesting;
    if (!self->_skipToSiriDataSharingOptInForTesting)
      return;
    v11 = 0;
  }
  v13 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = *p_skipToSiriDataSharingOptInForTesting;
    v16 = v13;
    objc_msgSend(v14, "numberWithBool:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[VTUIEnrollTrainingViewController viewDidLoad]";
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v18;
    _os_log_impl(&dword_229EF7000, v16, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Showing DataSharingOptIn. _skipToEndForTesting:%@, isBuddyForDataSharingOptIn:%@", buf, 0x20u);

  }
  self->_currentTrainingState = 5;
  -[VTUIEnrollTrainingViewController _showSiriDataSharingOptIn](self, "_showSiriDataSharingOptIn");
}

- (BOOL)_isGreyMatterAvailable
{
  return 0;
}

- (void)_setupEnrollTrainingView
{
  if (-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable"))
    -[VTUIEnrollTrainingViewController _setupEnrollmentWithIntelligentLight](self, "_setupEnrollmentWithIntelligentLight");
  else
    -[VTUIEnrollTrainingViewController _setupEnrollmentwithOrb](self, "_setupEnrollmentwithOrb");
}

- (void)_setupEnrollmentwithOrb
{
  NSObject *v3;
  VTUIEnrollTrainingView *v4;
  void *v5;
  VTUIEnrollTrainingView *v6;
  VTUIEnrollTrainingViewMediatorOrb *v7;
  VTUITrainingViewMediator *trainingViewMediator;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VTUIEnrollTrainingViewController _setupEnrollmentwithOrb]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting up enrollment using Orb", buf, 0xCu);
  }
  v4 = [VTUIEnrollTrainingView alloc];
  -[VTUIEnrollTrainingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = -[VTUIEnrollTrainingView initWithFrame:](v4, "initWithFrame:");

  -[VTUIEnrollTrainingView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIEnrollTrainingView setDelegate:](v6, "setDelegate:", self);
  v7 = -[VTUIEnrollTrainingViewMediatorOrb initWithTrainingView:]([VTUIEnrollTrainingViewMediatorOrb alloc], "initWithTrainingView:", v6);
  trainingViewMediator = self->_trainingViewMediator;
  self->_trainingViewMediator = (VTUITrainingViewMediator *)v7;

  if (self->_enrollmentMode == 4)
    -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
  -[VTUIEnrollTrainingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v6);
  v10 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("enrollTrainingView"), v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[enrollTrainingView]|"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraints:", v12);

  v13 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("enrollTrainingView"), v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[enrollTrainingView]|"), 0, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraints:", v15);

}

- (void)_setupEnrollmentWithIntelligentLight
{
  NSObject *v3;
  VTUIEnrollTrainingIntelligentLightView *v4;
  void *v5;
  VTUIEnrollTrainingIntelligentLightView *v6;
  VTUIEnrollTrainingViewMediatorGM *v7;
  VTUITrainingViewMediator *trainingViewMediator;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VTUIEnrollTrainingViewController _setupEnrollmentWithIntelligentLight]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting up enrollment using Intelligent Light", buf, 0xCu);
  }
  v4 = [VTUIEnrollTrainingIntelligentLightView alloc];
  -[VTUIEnrollTrainingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = -[VTUIEnrollTrainingIntelligentLightView initWithFrame:](v4, "initWithFrame:");

  -[VTUIEnrollTrainingIntelligentLightView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIEnrollTrainingIntelligentLightView setDelegate:](v6, "setDelegate:", self);
  v7 = -[VTUIEnrollTrainingViewMediatorGM initWithTrainingView:]([VTUIEnrollTrainingViewMediatorGM alloc], "initWithTrainingView:", v6);
  trainingViewMediator = self->_trainingViewMediator;
  self->_trainingViewMediator = (VTUITrainingViewMediator *)v7;

  if (self->_enrollmentMode == 4)
    -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
  -[VTUIEnrollTrainingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v6);
  v10 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("trainingView"), v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[trainingView]|"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraints:", v12);

  v13 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("trainingView"), v6, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[trainingView]|"), 0, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraints:", v15);

  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v16, "isDeviceIPad");

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingViewController _setColorForNavigationElements:](self, "_setColorForNavigationElements:", v17);

  }
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
    v8 = "-[VTUIEnrollTrainingViewController viewWillAppear:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillAppear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewController;
  -[VTUIEnrollTrainingViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  -[VTUIEnrollTrainingViewController _becomeActive](self, "_becomeActive");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  int *v7;
  int v8;
  NSObject *v9;
  unint64_t sessionId;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[VTUIEnrollTrainingViewController viewWillDisappear:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillDisappear method called", buf, 0xCu);
  }
  v6 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v7 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
  if (v6)
    v7 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "endAdvertising:", 0);
  -[VTUIAudioHintPlayer cleanup](self->_audioHintPlayer, "cleanup");
  -[VTUIEnrollTrainingViewController _hideTrainingElements](self, "_hideTrainingElements");
  v8 = -[SSRVTUITrainingManager cancelTrainingForID:](self->_trainingManager, "cancelTrainingForID:", self->_sessionId);
  v9 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    sessionId = self->_sessionId;
    *(_DWORD *)buf = 136315650;
    v13 = "-[VTUIEnrollTrainingViewController viewWillDisappear:]";
    v14 = 2048;
    v15 = sessionId;
    v16 = 1024;
    v17 = v8;
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Called cancel training for session %ld with result %d", buf, 0x1Cu);
  }
  v11.receiver = self;
  v11.super_class = (Class)VTUIEnrollTrainingViewController;
  -[VTUIEnrollTrainingViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
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
    v8 = "-[VTUIEnrollTrainingViewController viewDidDisappear:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s viewDidDisappear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewController;
  -[VTUIEnrollTrainingViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[VTUIEnrollTrainingViewController _cleanupAllViews](self, "_cleanupAllViews");
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;

  if (self->_enrollmentMode != 2)
  {
    -[VTUIEnrollmentSetupIntroViewControlling view](self->_introViewController, "view", a4, a3.width, a3.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdateConstraints");

  }
  -[VTUITrainingViewMediator setNeedsUpdateConstraints](self->_trainingViewMediator, "setNeedsUpdateConstraints");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewController;
  -[VTUIEnrollTrainingViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[VTUIEnrollTrainingViewController _updateViewBackground](self, "_updateViewBackground");
}

- (void)_updateViewBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[VTUIEnrollTrainingViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[VTUIEnrollTrainingViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)_becomeActive
{
  NSObject *v3;
  uint64_t v4;
  int64_t currentTrainingState;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VTUIEnrollTrainingViewController _becomeActive]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Making View Active", (uint8_t *)&v6, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _showTrainingElements](self, "_showTrainingElements");
  self->_badMicRetryCount = 0;
  self->_AVVCRetryCount = 0;
  self->_isResignedActive = 0;
  self->_cannotHearRetryCount = 0;
  self->_digitalZerosRetryCount = 0;
  if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
    v4 = 1320;
  else
    v4 = 1312;
  if (!*(Class *)((char *)&self->super.super.super.isa + v4))
    -[VTUIEnrollTrainingViewController _setupMyriadCoordinator](self, "_setupMyriadCoordinator");
  if (self->_enrollmentMode == 6)
  {
    -[VTUIEnrollTrainingViewController _showVTConfirmationView](self, "_showVTConfirmationView");
  }
  else
  {
    currentTrainingState = self->_currentTrainingState;
    if (currentTrainingState == -1)
      -[VTUIEnrollTrainingViewController _startEnrollment](self, "_startEnrollment");
    else
      -[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:](self, "_showTrainingInstruction:afterDelay:isRetry:animate:", currentTrainingState, 0, 1, 0.0);
  }
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
    v6 = "-[VTUIEnrollTrainingViewController _resignActive]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Resigning Active", (uint8_t *)&v5, 0xCu);
  }
  self->_isResignedActive = 1;
  -[VTUIEnrollTrainingViewController _hideTrainingElements](self, "_hideTrainingElements");
  -[VTUIEnrollTrainingViewController _resetTrainingManager](self, "_resetTrainingManager");
  -[VTUIEnrollTrainingViewController audioHintPlayer](self, "audioHintPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanup");

}

- (void)_didEnterBackground
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VTUIEnrollTrainingViewController _didEnterBackground]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Did Enter Background", (uint8_t *)&v4, 0xCu);
  }
  if (-[VTUIEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    -[VTUIEnrollTrainingViewController _resetEnrollment](self, "_resetEnrollment");
    -[VTUITrainingViewMediator clearInstructionLabel](self->_trainingViewMediator, "clearInstructionLabel");
  }
  if (self->_currentTrainingState <= 4)
    -[VTUIEnrollTrainingViewController _startEnrollment](self, "_startEnrollment");
}

- (void)_hideTrainingElements
{
  -[VTUITrainingViewMediator hideTrainingElements](self->_trainingViewMediator, "hideTrainingElements");
}

- (void)_showTrainingElements
{
  -[VTUITrainingViewMediator showTrainingElements](self->_trainingViewMediator, "showTrainingElements");
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
  v6[2] = __67__VTUIEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke;
  v6[3] = &unk_24F33D9D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", v6);

}

uint64_t __67__VTUIEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke(uint64_t a1)
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
    v5 = "-[VTUIEnrollTrainingViewController _showBadMicAlertWithCompletion:]_block_invoke";
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
    v5 = "-[VTUIEnrollTrainingViewController _retryAfterBadMicAlert]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_INFO, "%s Trying again after Bad Mic Alert", (uint8_t *)&v4, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _resumeTraining:](self, "_resumeTraining:", 1);
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
    v8 = "-[VTUIEnrollTrainingViewController _showUnsupportedLocaleAlert]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Showing Unsupported LocaleAlert", buf, 0xCu);
  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke;
  v4[3] = &unk_24F33DA00;
  objc_copyWeak(&v5, &location);
  -[VTUIEnrollTrainingViewController _showUnsupportedLocaleAlertCompletion:](self, "_showUnsupportedLocaleAlertCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke(uint64_t a1)
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
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  NSArray *trainingPageInstructions;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[5];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[7];

  v50[5] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v28, "shouldSetupForMultipleTriggerPhrases");
  -[VTUIAudioHintPlayer updateIfNeededForUsesMultipleTriggers:](self->_audioHintPlayer, "updateIfNeededForUsesMultipleTriggers:", v3);
  -[VTUIAudioHintPlayer outputVoice](self->_audioHintPlayer, "outputVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v48[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT1"), 1, v4);
    v48[1] = CFSTR("RetryOnFail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v26;
    v49[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v25;
    v46[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT2"), 0, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v46[1] = CFSTR("RetryOnFail");
    v6 = MEMORY[0x24BDBD1C8];
    v23 = (void *)v5;
    v47[0] = v5;
    v47[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v22;
    v44[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT3"), 1, v4);
    v44[1] = CFSTR("RetryOnFail");
    v45[0] = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v45[0];
    v45[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v7;
    v42[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT4"), 0, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("RetryOnFail");
    v43[0] = v9;
    v43[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v10;
    v40[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT5"), 1, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = CFSTR("RetryOnFail");
    v41[0] = v12;
    v41[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v13;
    v14 = (void *)MEMORY[0x24BDBCE30];
    v15 = v50;
  }
  else
  {
    v37[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT1"), 0, v4);
    v37[1] = CFSTR("RetryOnFail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v26;
    v38[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v25;
    v35[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT2"), 0, v4);
    v16 = objc_claimAutoreleasedReturnValue();
    v35[1] = CFSTR("RetryOnFail");
    v17 = MEMORY[0x24BDBD1C8];
    v23 = (void *)v16;
    v36[0] = v16;
    v36[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v22;
    v33[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT3"), 0, v4);
    v33[1] = CFSTR("RetryOnFail");
    v34[0] = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v34[0];
    v34[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v7;
    v31[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT4"), 0, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = CFSTR("RetryOnFail");
    v32[0] = v9;
    v32[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v10;
    v29[0] = CFSTR("Instruction");
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uiLocalizedStringForKey:usesMultipleTriggers:siriVoice:", CFSTR("TEXT_TITLE_UTT5"), 0, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("RetryOnFail");
    v30[0] = v12;
    v30[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v13;
    v14 = (void *)MEMORY[0x24BDBCE30];
    v15 = v39;
  }
  objc_msgSend(v14, "arrayWithObjects:count:", v15, 5);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trainingPageInstructions = self->_trainingPageInstructions;
  self->_trainingPageInstructions = v18;

}

- (void)_animateSuccessfulStep:(BOOL)a3 completion:(id)a4
{
  -[VTUITrainingViewMediator animateSuccessfulStep:completion:](self->_trainingViewMediator, "animateSuccessfulStep:completion:", a3, a4);
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

- (void)_showGMIntroView
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  VTUIGMEnrollmentViewController *v8;
  VTUIGMEnrollmentViewController *gmViewController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VTUIEnrollTrainingViewController _showGMIntroView]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying GM view", buf, 0xCu);
  }
  if (!self->_gmViewController)
  {
    -[VTUIEnrollTrainingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    -[VTUIEnrollTrainingViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalPresentationStyle:", 2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1));

    v8 = -[VTUIGMEnrollmentViewController initWithDelegate:]([VTUIGMEnrollmentViewController alloc], "initWithDelegate:", self);
    gmViewController = self->_gmViewController;
    self->_gmViewController = v8;

    -[VTUIGMEnrollmentViewController willMoveToParentViewController:](self->_gmViewController, "willMoveToParentViewController:", self);
    -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_gmViewController);
    -[VTUIGMEnrollmentViewController didMoveToParentViewController:](self->_gmViewController, "didMoveToParentViewController:", self);
    -[VTUIGMEnrollmentViewController view](self->_gmViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAutoresizesSubviews:", 0);
    -[VTUIEnrollTrainingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    v12 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("gmView"), v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[gmView]|"), 0, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v14);

    v15 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("gmView"), v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[gmView]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v17);

    -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
  }
}

- (void)siriGMIntroViewControllerContinuePressed:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VTUIEnrollTrainingViewController siriGMIntroViewControllerContinuePressed:]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s GM view Continue pressed", (uint8_t *)&v5, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _continueToIntroFromGM](self, "_continueToIntroFromGM");
}

- (void)_continueToIntroFromGM
{
  id v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id location;

  v3 = objc_initWeak(&location, self);
  if (self)
  {
    v4[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__VTUIEnrollTrainingViewController__continueToIntroFromGM__block_invoke;
    v5[3] = &unk_24F33DA28;
    v5[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__VTUIEnrollTrainingViewController__continueToIntroFromGM__block_invoke_2;
    v4[3] = &unk_24F33DA50;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v5, v4, 0.3);
    -[VTUIEnrollTrainingViewController _showIntroView](self, "_showIntroView");
  }

  objc_destroyWeak(&location);
}

void __58__VTUIEnrollTrainingViewController__continueToIntroFromGM__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __58__VTUIEnrollTrainingViewController__continueToIntroFromGM__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1112);
  *(_QWORD *)(v3 + 1112) = 0;

}

- (void)_showIntroView
{
  NSObject *v3;
  VTUISiriEducationViewController *educationViewController;
  void *v5;
  VTUISiriEducationViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *siriLanguageOptions;
  NSArray *v18;
  double Width;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  VTUIEnrollmentSetupIntroViewControllerGM *v36;
  VTUIEnrollmentSetupIntroViewControlling *introViewController;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  VTUIEnrollmentSetupIntroViewControllerOrb *v42;
  VTUIEnrollmentSetupIntroViewControlling *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  AFEnablementFlowConfigurationProvider *v55;
  AFEnablementFlowConfigurationProvider *provider;
  NSArray *v57;
  NSArray *v58;
  AFEnablementFlowConfigurationProvider *v59;
  NSArray *v60;
  _QWORD v61[4];
  NSArray *v62;
  id v63;
  _QWORD v64[5];
  _QWORD v65[4];
  id v66;
  char v67;
  NSString *spokenLanguageCode;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;
  CGRect v74;
  CGRect v75;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = "-[VTUIEnrollTrainingViewController _showIntroView]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying Intro view", buf, 0xCu);
  }
  educationViewController = self->_educationViewController;
  if (educationViewController)
  {
    -[VTUISiriEducationViewController view](educationViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    v6 = self->_educationViewController;
    self->_educationViewController = 0;

  }
  -[VTUIEnrollTrainingViewController setDidShowVoiceTriggerPrompt:](self, "setDidShowVoiceTriggerPrompt:", 1);
  if (!self->_introViewController)
  {
    -[VTUIEnrollTrainingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    -[VTUIEnrollTrainingViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v12 = 2;
    else
      v12 = 0;
    objc_msgSend(v10, "setModalPresentationStyle:", v12);

    -[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet](self, "_setInitialTriggerPhraseIfNotSet");
    -[VTUIEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
    v67 = 0;
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allSiriLanguageCodesForSystemLanguageCode:isGoodFit:", v15, &v67);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    siriLanguageOptions = self->_siriLanguageOptions;
    self->_siriLanguageOptions = v16;

    if (self->_disambiguateLanguageOptionsForTesting)
    {
      v18 = self->_siriLanguageOptions;
      self->_siriLanguageOptions = (NSArray *)&unk_24F34DCB8;

    }
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v74);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v21 = vabdd_f64(Width, CGRectGetWidth(v75)) > 2.22044605e-16;

    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setIsFloatingWithReducedWidth:", v21);

    if (-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable"))
    {
      -[VTUITrainingViewMediator hideTrainingView:](self->_trainingViewMediator, "hideTrainingView:", 0);
      -[VTUIEnrollTrainingViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "userInterfaceIdiom");

      if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(MEMORY[0x24BE6E3E0], "preferredContentSize");
        v29 = v34;
        v31 = v35;
        v25 = 0.0;
        v27 = 0.0;
      }
      v36 = -[VTUIEnrollmentSetupIntroViewControllerGM initWithFrame:delegate:]([VTUIEnrollmentSetupIntroViewControllerGM alloc], "initWithFrame:delegate:", self, v25, v27, v29, v31);
      introViewController = self->_introViewController;
      self->_introViewController = (VTUIEnrollmentSetupIntroViewControlling *)v36;

      -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_introViewController);
      -[VTUIEnrollmentSetupIntroViewControlling view](self->_introViewController, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAlpha:", 0.0);
      -[VTUIEnrollTrainingViewController view](self, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addSubview:", v38);

      v40 = (void *)MEMORY[0x24BEBDB00];
      v64[4] = self;
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke;
      v65[3] = &unk_24F33DA28;
      v66 = v38;
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke_2;
      v64[3] = &unk_24F33DA50;
      v41 = v38;
      objc_msgSend(v40, "animateWithDuration:animations:completion:", v65, v64, 0.3);

    }
    else
    {
      v42 = -[VTUIEnrollmentSetupIntroViewControllerOrb initWithDelegate:]([VTUIEnrollmentSetupIntroViewControllerOrb alloc], "initWithDelegate:", self);
      v43 = self->_introViewController;
      self->_introViewController = (VTUIEnrollmentSetupIntroViewControlling *)v42;

      -[VTUIEnrollmentSetupIntroViewControlling willMoveToParentViewController:](self->_introViewController, "willMoveToParentViewController:", self);
      -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_introViewController);
      -[VTUIEnrollmentSetupIntroViewControlling didMoveToParentViewController:](self->_introViewController, "didMoveToParentViewController:", self);
      -[VTUIEnrollmentSetupIntroViewControlling view](self->_introViewController, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v44, "setAutoresizesSubviews:", 0);
      -[VTUIEnrollTrainingViewController view](self, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addSubview:", v44);

      v46 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("introView"), v44, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[introView]|"), 0, 0, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addConstraints:", v48);

      v49 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("introView"), v44, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[introView]|"), 0, 0, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addConstraints:", v51);

    }
    -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
    -[VTUIAnalytics setIntroViewShown:](self->_analyticsEvent, "setIntroViewShown:", -[VTUIAnalytics introViewShown](self->_analyticsEvent, "introViewShown") + 1);
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "enrollmentMode");

    v54 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v70 = "-[VTUIEnrollTrainingViewController _showIntroView]";
      v71 = 2048;
      v72 = v53;
      _os_log_impl(&dword_229EF7000, v54, OS_LOG_TYPE_DEFAULT, "%s Enrollment mode: %ld", buf, 0x16u);
    }
    if (v53 != 2 && v53 != 4)
    {
      if (!self->_provider)
      {
        v55 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x24BE091D0]);
        provider = self->_provider;
        self->_provider = v55;

      }
      if (!self->_enablementConfiguration)
      {
        if (-[VTUIEnrollTrainingViewController _shouldPresentLanguageDisambiguation](self, "_shouldPresentLanguageDisambiguation"))
        {
          v57 = self->_siriLanguageOptions;
        }
        else
        {
          spokenLanguageCode = self->_spokenLanguageCode;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &spokenLanguageCode, 1);
          v57 = (NSArray *)objc_claimAutoreleasedReturnValue();
        }
        v58 = v57;
        objc_initWeak((id *)buf, self);
        self->_isEnablementConfigurationLoading = 1;
        v59 = self->_provider;
        v61[0] = MEMORY[0x24BDAC760];
        v61[1] = 3221225472;
        v61[2] = __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke_112;
        v61[3] = &unk_24F33DAA0;
        objc_copyWeak(&v63, (id *)buf);
        v60 = v58;
        v62 = v60;
        -[AFEnablementFlowConfigurationProvider configurationForEnablementFlow:recognitionLanguageCodes:completion:](v59, "configurationForEnablementFlow:recognitionLanguageCodes:completion:", 1, v60, v61);

        objc_destroyWeak(&v63);
        objc_destroyWeak((id *)buf);

      }
    }

  }
}

uint64_t __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "showTrainingView");
}

void __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke_112(uint64_t a1, void *a2)
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
  block[2] = __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke_2_113;
  block[3] = &unk_24F33DA78;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __50__VTUIEnrollTrainingViewController__showIntroView__block_invoke_2_113(uint64_t a1)
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
      v9 = "-[VTUIEnrollTrainingViewController _showIntroView]_block_invoke_2";
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Enablement Configuration %@ for recognition languages %@", (uint8_t *)&v8, 0x20u);
    }
    objc_storeStrong(WeakRetained + 146, *(id *)(a1 + 32));
    *((_BYTE *)WeakRetained + 1208) = 0;
    v6 = (void (**)(void))WeakRetained[152];
    if (v6)
    {
      v6[2]();
      v7 = WeakRetained[152];
      WeakRetained[152] = 0;

    }
  }

}

- (void)_showVTConfirmationView
{
  NSObject *v3;
  VTUISiriEducationViewController *educationViewController;
  void *v5;
  VTUISiriEducationViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double Width;
  void *v12;
  _BOOL8 v13;
  void *v14;
  VTUIVoiceTriggerConfirmationViewController *v15;
  VTUIVoiceTriggerConfirmationViewController *vtConfirmationViewController;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[VTUIEnrollTrainingViewController _showVTConfirmationView]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying Voice Trigger Confirmation view", buf, 0xCu);
  }
  educationViewController = self->_educationViewController;
  if (educationViewController)
  {
    -[VTUISiriEducationViewController view](educationViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    v6 = self->_educationViewController;
    self->_educationViewController = 0;

  }
  -[VTUIEnrollTrainingViewController setDidShowVoiceTriggerPrompt:](self, "setDidShowVoiceTriggerPrompt:", 1);
  if (!self->_vtConfirmationViewController)
  {
    -[VTUIEnrollTrainingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    -[VTUIEnrollTrainingViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setModalPresentationStyle:", 2 * ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1));

    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v28);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = vabdd_f64(Width, CGRectGetWidth(v29)) > 2.22044605e-16;

    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsFloatingWithReducedWidth:", v13);

    v15 = -[VTUIVoiceTriggerConfirmationViewController initWithDelegate:]([VTUIVoiceTriggerConfirmationViewController alloc], "initWithDelegate:", self);
    vtConfirmationViewController = self->_vtConfirmationViewController;
    self->_vtConfirmationViewController = v15;

    -[VTUIVoiceTriggerConfirmationViewController willMoveToParentViewController:](self->_vtConfirmationViewController, "willMoveToParentViewController:", self);
    -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_vtConfirmationViewController);
    -[VTUIVoiceTriggerConfirmationViewController didMoveToParentViewController:](self->_vtConfirmationViewController, "didMoveToParentViewController:", self);
    -[VTUIVoiceTriggerConfirmationViewController view](self->_vtConfirmationViewController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "setAutoresizesSubviews:", 0);
    -[VTUIEnrollTrainingViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v17);

    v19 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("vtView"), v17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[vtView]|"), 0, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v21);

    v22 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("vtView"), v17, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[vtView]|"), 0, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v24);

    -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
  }
}

- (void)_processVTConfirmationViewContinueAction:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[VTUIEnrollTrainingViewController _processVTConfirmationViewContinueAction:]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Enabling voice trigger - confirmation continued", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoiceTriggerEnabled:", 1);

  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "voiceTriggerRepromptFinished");

  -[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip](self, "_proceedAfterTrainingCompletionOrSkip");
}

- (void)_processVTConfirmationLaterAction:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[VTUIEnrollTrainingViewController _processVTConfirmationLaterAction:]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Disabling voice trigger - confirmation skipped", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoiceTriggerEnabled:", 0);

  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "voiceTriggerRepromptFinished");

  -[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip](self, "_proceedAfterTrainingCompletionOrSkip");
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
    v17 = "-[VTUIEnrollTrainingViewController _siriLanguageIsIncompatibleWithPairedWatch]";
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
  if (-[VTUIEnrollTrainingViewController _siriLanguageIsIncompatibleWithPairedWatch](self, "_siriLanguageIsIncompatibleWithPairedWatch"))
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
    v15[2] = __77__VTUIEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke;
    v15[3] = &unk_24F33DAC8;
    v16 = v4;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAction:", v14);
    -[VTUIEnrollTrainingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __77__VTUIEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke(uint64_t a1)
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

- (void)_setInitialTriggerPhraseIfNotSet
{
  void *v3;
  __CFString *v4;
  void *v5;
  NSString *disambiguatedLanguageOption;
  _BOOL4 v7;
  NSString *v8;
  int v9;
  NSString *v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  const char *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!_os_feature_enabled_impl())
    return;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  if (disambiguatedLanguageOption)
  {
    v7 = -[NSString isEqualToString:](disambiguatedLanguageOption, "isEqualToString:", v4);
    if (!v7)
    {
      v8 = self->_disambiguatedLanguageOption;

      v4 = (__CFString *)v8;
    }
    v9 = !v7;
    if (self->_disambiguatedLanguageOption)
      goto LABEL_12;
  }
  else
  {
    v9 = 0;
  }
  if (!-[NSString isEqualToString:](self->_spokenLanguageCode, "isEqualToString:", v4))
  {
    v10 = self->_spokenLanguageCode;

    v9 = 1;
    v4 = (__CFString *)v10;
  }
LABEL_12:
  v11 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet]";
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s setting initial trigger phrase based on langauge code: %@", (uint8_t *)&v22, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isCompactVoiceTriggerAvailableForLanguageCode:", v4))
    v13 = AFDeviceSupportsANE();
  else
    v13 = 0;

  v14 = (void *)CFPreferencesCopyAppValue(CFSTR("UserPreferredVoiceTriggerPhraseType"), CFSTR("com.apple.voicetrigger"));
  if (v14)
    v15 = v9;
  else
    v15 = 1;
  if ((v13 & 1) != 0 || v15)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isBuddyOrFollowUp");

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "setUserPreferredVoiceTriggerPhraseType:sender:deviceType:endpointId:", v13, self, 0, 0);

      v20 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v21 = CFSTR("Hey Siri");
        if (v13)
          v21 = CFSTR("Siri + Hey Siri");
        v22 = 136315394;
        v23 = "-[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet]";
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_229EF7000, v20, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger set to %@", (uint8_t *)&v22, 0x16u);
      }
      -[VTUIEnrollTrainingViewController _setInitialTriggerPhraseOnHome](self, "_setInitialTriggerPhraseOnHome");
    }
  }

}

- (void)_setInitialTriggerPhraseOnHome
{
  NSObject *settingsQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__VTUIEnrollTrainingViewController__setInitialTriggerPhraseOnHome__block_invoke;
  v4[3] = &unk_24F33DA00;
  objc_copyWeak(&v5, &location);
  dispatch_async(settingsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__VTUIEnrollTrainingViewController__setInitialTriggerPhraseOnHome__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[143], "setAllowJustSiriHomeKitSetting:withCompletion:", 1, &__block_literal_global);
    WeakRetained = v2;
  }

}

void __66__VTUIEnrollTrainingViewController__setInitialTriggerPhraseOnHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[VTUIEnrollTrainingViewController _setInitialTriggerPhraseOnHome]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger on HomeKit set to Siri + Hey Siri with error: %@", (uint8_t *)&v4, 0x16u);
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
  if (self->_enrollmentMode != 2)
  {
    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVoiceTriggerEnabled:", v3);

  }
}

- (void)_showEnrollmentSuccessView
{
  NSObject *v3;
  void *v4;
  void *v5;
  VTUIEnrollmentSetupIntroViewControlling *v6;
  VTUIEnrollmentSuccessViewing *successView;
  VTUIEnrollmentSuccessView *v8;
  VTUIEnrollmentSuccessView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
    v21 = "-[VTUIEnrollTrainingViewController _showEnrollmentSuccessView]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Enrollment completed", buf, 0xCu);
  }
  -[VTUIEnrollTrainingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", 0);

  if (-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable"))
  {
    v6 = self->_introViewController;
    successView = self->_successView;
    self->_successView = v6;
  }
  else
  {
    -[VTUIEnrollmentSuccessViewing prepareReInit](self->_successView, "prepareReInit");
    v8 = [VTUIEnrollmentSuccessView alloc];
    objc_msgSend(v4, "bounds");
    v9 = -[VTUIEnrollmentSuccessView initWithFrame:](v8, "initWithFrame:");
    -[VTUIEnrollmentSuccessView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v9);
    -[VTUIEnrollmentSuccessView addFinishButtonTarget:selector:](v9, "addFinishButtonTarget:selector:", self, sel__finishButtonTapped);
    v10 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("successView"), v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[successView]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v12);

    v13 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("successView"), v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[successView]|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v15);

    successView = self->_successView;
    self->_successView = (VTUIEnrollmentSuccessViewing *)v9;
  }

  -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
  -[VTUITrainingViewMediator hideTrainingView:](self->_trainingViewMediator, "hideTrainingView:", 1);
  -[VTUIEnrollmentSuccessViewing fadeIn](self->_successView, "fadeIn");
  -[VTUIEnrollTrainingViewController setDidShowVoiceTriggerPrompt:](self, "setDidShowVoiceTriggerPrompt:", 1);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompactVoiceTriggerDisclosurePresented:", 1);

  if (-[VTUIEnrollTrainingViewController _shouldSpeakAudioHint](self, "_shouldSpeakAudioHint"))
  {
    objc_initWeak((id *)buf, self);
    audioHintPlayer = self->_audioHintPlayer;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__VTUIEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke;
    v18[3] = &unk_24F33DB30;
    objc_copyWeak(&v19, (id *)buf);
    -[VTUIAudioHintPlayer speakConfirmationDialog:](audioHintPlayer, "speakConfirmationDialog:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  -[VTUIEnrollTrainingViewController _cleanupMyriad](self, "_cleanupMyriad");

}

void __62__VTUIEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupTrainingManagerWithCompletion:", 0);
    WeakRetained = v2;
  }

}

- (void)_finishButtonTapped
{
  void *v3;
  int v4;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBuddyOrFollowUp");

  if (v4)
    -[VTUIEnrollTrainingViewController finish:](self, "finish:", 0);
  else
    -[VTUIEnrollTrainingViewController _finishSiriSetup](self, "_finishSiriSetup");
}

- (void)_startEnrollment
{
  NSObject *v3;
  NSString *spokenLanguageCode;
  int64_t enrollmentMode;
  BOOL v6;
  VTUIEnrollmentSetupIntroViewControlling *introViewController;
  void *v8;
  VTUIEnrollmentSetupIntroViewControlling *v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    spokenLanguageCode = self->_spokenLanguageCode;
    v10 = 136315394;
    v11 = "-[VTUIEnrollTrainingViewController _startEnrollment]";
    v12 = 2112;
    v13 = spokenLanguageCode;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting Enrollment for language code: %@", (uint8_t *)&v10, 0x16u);
  }
  if (!-[VTUIEnrollTrainingViewController _isLocaleSupported:](self, "_isLocaleSupported:", self->_spokenLanguageCode))
    -[VTUIEnrollTrainingViewController _showUnsupportedLocaleAlert](self, "_showUnsupportedLocaleAlert");
  if (self->_siriDataSharingOptInView)
    -[VTUIEnrollTrainingViewController _tearDownDataSharingViews](self, "_tearDownDataSharingViews");
  enrollmentMode = self->_enrollmentMode;
  if (self->_languageOptionsView
    || (!self->_aboutTappedSender ? (v6 = (enrollmentMode & 0xFFFFFFFFFFFFFFFBLL) == 2) : (v6 = 1), v6))
  {
    if (enrollmentMode != 7)
    {
LABEL_18:
      introViewController = self->_introViewController;
      if (introViewController)
      {
        -[VTUIEnrollmentSetupIntroViewControlling view](introViewController, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        v9 = self->_introViewController;
        self->_introViewController = 0;

      }
      return;
    }
  }
  else if (enrollmentMode != 7)
  {
    if (!self->_voiceSelectionViewController)
    {
      -[VTUIEnrollTrainingViewController _showIntroView](self, "_showIntroView");
      return;
    }
    goto LABEL_18;
  }
  if (!self->_introViewController)
    -[VTUIEnrollTrainingViewController _showGMIntroView](self, "_showGMIntroView");
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
    v8 = "-[VTUIEnrollTrainingViewController _resetEnrollment]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Resetting State to kVTUITrainingStateNotStarted", (uint8_t *)&v7, 0xCu);
  }
  self->_currentTrainingState = -1;
  -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
  -[VTUIEnrollTrainingViewController _hideInstruction](self, "_hideInstruction");
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "deleteUserVoiceProfile:", v5);

  self->_badMicRetryCount = 0;
  -[VTUIEnrollTrainingViewController _cleanupMyriad](self, "_cleanupMyriad");
}

- (void)_resumeTraining:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int64_t currentTrainingState;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    currentTrainingState = self->_currentTrainingState;
    v7 = 136315394;
    v8 = "-[VTUIEnrollTrainingViewController _resumeTraining:]";
    v9 = 2048;
    v10 = currentTrainingState;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_INFO, "%s Resuming training from the previous state: %zd", (uint8_t *)&v7, 0x16u);
  }
  if (-[VTUIEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    -[VTUIEnrollTrainingViewController _createTrainingManagerIfNeeded](self, "_createTrainingManagerIfNeeded");
    -[VTUIEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:", self->_currentTrainingState, v3);
  }
}

- (void)_startTraining
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  NSUUID *v8;
  NSUUID *trainingAttemptUUID;
  void *v10;
  NSUUID *v11;
  NSObject *v12;
  void *v13;
  int64_t currentTrainingState;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[VTUIEnrollTrainingViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VTUIEnrollTrainingViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willBeginVoiceTraining");

  }
  if (self->_currentTrainingState < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    trainingAttemptUUID = self->_trainingAttemptUUID;
    self->_trainingAttemptUUID = v8;

    v10 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_trainingAttemptUUID;
      v12 = v10;
      -[NSUUID UUIDString](v11, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      currentTrainingState = self->_currentTrainingState;
      v25 = 136315650;
      v26 = "-[VTUIEnrollTrainingViewController _startTraining]";
      v27 = 2112;
      v28 = (int64_t)v13;
      v29 = 2048;
      v30 = currentTrainingState;
      _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Starting training attempt %@ - Moving from state: %zd to state 0", (uint8_t *)&v25, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "deleteUserVoiceProfile:", v16);

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logEventWithType:context:", 3302, 0);

    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, 0);

    if (v20)
      v21 = 2;
    else
      v21 = 1;
    +[VTUISELFLogger logSiriSetupPHSEnrollmentUIStarted:enrollmentMode:locale:voiceTriggerType:](VTUISELFLogger, "logSiriSetupPHSEnrollmentUIStarted:enrollmentMode:locale:voiceTriggerType:", self->_trainingAttemptUUID, self->_enrollmentMode, self->_spokenLanguageCode, v21);
    -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
    self->_currentTrainingState = 0;
    -[VTUITrainingViewMediator hideContinuationAndPreludeLabel:](self->_trainingViewMediator, "hideContinuationAndPreludeLabel:", 0);
    -[VTUIEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:", self->_currentTrainingState, 0);
    +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isDeviceIPad");

    if (v23)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIEnrollTrainingViewController _setColorForNavigationElements:](self, "_setColorForNavigationElements:", v24);

    }
  }
  else
  {
    v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
    {
      v7 = self->_currentTrainingState;
      v25 = 136315394;
      v26 = "-[VTUIEnrollTrainingViewController _startTraining]";
      v27 = 2048;
      v28 = v7;
      _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_INFO, "%s Training has already stated at state %zd - resuming.", (uint8_t *)&v25, 0x16u);
    }
    -[VTUIEnrollTrainingViewController _resumeTraining:](self, "_resumeTraining:", 0);
  }
}

- (void)_advanceState
{
  unint64_t currentTrainingState;
  NSObject *v4;
  int64_t v5;
  int64_t v6;
  void *v8;
  void *v9;
  VTUITrainingViewMediator *trainingViewMediator;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  currentTrainingState = self->_currentTrainingState;
  if (currentTrainingState >= -[NSArray count](self->_trainingPageInstructions, "count") - 1)
  {
    v6 = self->_currentTrainingState;
    if (v6 != -1 && v6 != 5)
    {
      self->_currentTrainingState = 5;
      -[VTUIAnalytics setVoiceTrainingCompleted:](self->_analyticsEvent, "setVoiceTrainingCompleted:", -[VTUIAnalytics voiceTrainingCompleted](self->_analyticsEvent, "voiceTrainingCompleted") + 1);
      objc_msgSend(MEMORY[0x24BE85890], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didCompleteFlow:", *MEMORY[0x24BE85828]);

      -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", 0);

      -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 1);
      if (self->_enrollmentMode == 2)
      {
        -[VTUIEnrollTrainingViewController finish:](self, "finish:", 0);
      }
      else
      {
        objc_initWeak((id *)buf, self);
        trainingViewMediator = self->_trainingViewMediator;
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __49__VTUIEnrollTrainingViewController__advanceState__block_invoke;
        v16[3] = &unk_24F33DA00;
        objc_copyWeak(&v17, (id *)buf);
        -[VTUITrainingViewMediator slideInText:afterDelay:completion:](trainingViewMediator, "slideInText:afterDelay:completion:", 0, v16, 0.0);
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
      v11 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[VTUIEnrollTrainingViewController _advanceState]";
        _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Completed Last stage in Training", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "newTurnBasedInstrumentationContext");

      v14 = objc_alloc_init(MEMORY[0x24BE95B28]);
      objc_msgSend(v14, "setInvocationSource:", 44);
      objc_msgSend(v13, "emitInstrumentation:", v14);
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logEventWithType:context:", 3303, 0);

      +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:](VTUISELFLogger, "logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:", self->_trainingAttemptUUID, self->_enrollmentMode, self->_spokenLanguageCode, 1, LODWORD(self->_currentTrainingState));
    }
  }
  else
  {
    self->_hasRetriedTraining = 0;
    ++self->_currentTrainingState;
    -[VTUIEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:");
    v4 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_currentTrainingState;
      *(_DWORD *)buf = 136315394;
      v19 = "-[VTUIEnrollTrainingViewController _advanceState]";
      v20 = 2048;
      v21 = v5;
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Advance to Next stage in Training - Current state : %zd", buf, 0x16u);
    }
  }
}

void __49__VTUIEnrollTrainingViewController__advanceState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showEnrollmentSuccessView");

}

- (void)_showInstruction:(int64_t)a3 isRetry:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[VTUIEnrollTrainingViewController _updatePageNumberForInstruction:](self, "_updatePageNumberForInstruction:", a3);
  -[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:](self, "_showTrainingInstruction:afterDelay:isRetry:animate:", self->_currentTrainingState, v4, 1, 0.0);
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
    if (-[VTUIEnrollTrainingViewController cannotHearRetryCount](self, "cannotHearRetryCount") == 1)
      goto LABEL_7;
    if (-[VTUIEnrollTrainingViewController cannotHearRetryCount](self, "cannotHearRetryCount"))
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
    if (-[VTUIEnrollTrainingViewController digitalZerosRetryCount](self, "digitalZerosRetryCount") != 1)
    {
      if (!-[VTUIEnrollTrainingViewController digitalZerosRetryCount](self, "digitalZerosRetryCount"))
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
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VTUIEnrollTrainingViewController _retryInstruction:withStatusMessage:]";
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[VTUITrainingViewMediator hideContinuationAndPreludeLabel:](self->_trainingViewMediator, "hideContinuationAndPreludeLabel:", 1);
  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke;
  v11 = &unk_24F33DB58;
  objc_copyWeak(&v12, (id *)buf);
  v13 = a3;
  -[VTUIEnrollTrainingViewController _showStatusMessage:afterDelay:completion:](self, "_showStatusMessage:afterDelay:completion:", v6, &v8, 0.2);
  -[VTUIEnrollTrainingViewController _hideInstruction](self, "_hideInstruction", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2;
    v9[3] = &unk_24F33DA28;
    v9[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_showStatusMessage:afterDelay:completion:", 0, v9, 2.0);
    if ((objc_msgSend(v3, "currentTrainingState") & 0x8000000000000000) == 0
      && objc_msgSend(v3, "currentTrainingState") <= 4)
    {
      objc_msgSend(v3, "_showTrainingInstruction:afterDelay:isRetry:animate:", objc_msgSend(v3, "currentTrainingState"), *(_BYTE *)(a1 + 40) == 0, 1, 2.2);
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "currentTrainingState"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("currentTrainingState");
      v11[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logEventWithType:context:", 3311, v8);

    }
  }

}

uint64_t __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = objc_msgSend((id)result, "currentTrainingState");
    if ((result & 0x8000000000000000) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "currentTrainingState");
      if (result <= 4)
        return objc_msgSend(*(id *)(a1 + 32), "_updatePageNumberForInstruction:", objc_msgSend(*(id *)(a1 + 32), "currentTrainingState"));
    }
  }
  return result;
}

- (void)_updateTrainingLabelsForInstruction:(int64_t)a3
{
  void *v5;
  NSUInteger v6;
  VTUITrainingViewMediator *trainingViewMediator;
  void *v8;
  VTUITrainingViewMediator *v9;
  const __CFString *v10;
  VTUITrainingViewMediator *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  if (a3)
  {
    v6 = -[NSArray count](self->_trainingPageInstructions, "count") - 1;
    trainingViewMediator = self->_trainingViewMediator;
    if (v6 == a3)
    {
      objc_msgSend(v15, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_SAY_LAST"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUITrainingViewMediator setInstructionPreludeLabel:](trainingViewMediator, "setInstructionPreludeLabel:", v8);

      v9 = self->_trainingViewMediator;
      v10 = CFSTR("TEXT_LABEL_TO_LAST");
    }
    else
    {
      objc_msgSend(v15, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_SAY_MIDDLE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUITrainingViewMediator setInstructionPreludeLabel:](trainingViewMediator, "setInstructionPreludeLabel:", v13);

      v9 = self->_trainingViewMediator;
      v10 = CFSTR("TEXT_LABEL_TO_MIDDLE");
    }
  }
  else
  {
    v11 = self->_trainingViewMediator;
    objc_msgSend(v5, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_SAY_FIRST"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITrainingViewMediator setInstructionPreludeLabel:](v11, "setInstructionPreludeLabel:", v12);

    v9 = self->_trainingViewMediator;
    v10 = CFSTR("TEXT_LABEL_TO_FIRST");
  }
  objc_msgSend(v15, "VTUIDeviceSpecificString:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUITrainingViewMediator setInstructionContinuationLabel:](v9, "setInstructionContinuationLabel:", v14);

}

- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD);
  id v22;
  void (**v23)(_QWORD);
  int v24;
  double v25;
  double v26;
  int *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _BYTE *v33;
  id v34[2];
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[6];
  id v39[2];
  char v40;
  BOOL v41;
  _QWORD aBlock[4];
  id v43[2];
  BOOL v44;
  id location;
  const __CFString *v46;
  void *v47;
  _BYTE buf[24];
  _BOOL4 v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v6 = a6;
  v7 = a5;
  v52 = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 1024;
    v49 = v7;
    v50 = 1024;
    v51 = v6;
    _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Instruction Number %ld, isRetry %d, animate %d", buf, 0x22u);
  }
  v12 = -[NSArray count](self->_trainingPageInstructions, "count");
  if ((a3 & 0x8000000000000000) == 0 && v12 > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_trainingPageInstructions, "objectAtIndexedSubscript:", a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Instruction"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("RetryOnFail"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    -[VTUIEnrollTrainingViewController _updateTrainingLabelsForInstruction:](self, "_updateTrainingLabelsForInstruction:", a3);
    -[VTUITrainingViewMediator animateToOff](self->_trainingViewMediator, "animateToOff");
    -[VTUIEnrollTrainingViewController _createTrainingManagerIfNeeded](self, "_createTrainingManagerIfNeeded");
    if ((unint64_t)a3 <= 4)
    {
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("instruction");
      v47 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logEventWithType:context:", a3 + 3305, v16);

    }
    -[VTUIAudioHintPlayer synth](self->_audioHintPlayer, "synth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopSpeaking");

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v49) = 0;
    objc_initWeak(&location, self);
    v18 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke;
    aBlock[3] = &unk_24F33DB80;
    objc_copyWeak(v43, &location);
    v44 = v7;
    v43[1] = (id)a3;
    v19 = _Block_copy(aBlock);
    v38[0] = v18;
    v38[1] = 3221225472;
    v38[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2;
    v38[3] = &unk_24F33DBD0;
    objc_copyWeak(v39, &location);
    v39[1] = (id)a3;
    v40 = v14;
    v41 = v7;
    v38[4] = self;
    v38[5] = buf;
    v20 = _Block_copy(v38);
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_190;
    v35[3] = &unk_24F33DBF8;
    v21 = v19;
    v36 = v21;
    v22 = v20;
    v37 = v22;
    v23 = (void (**)(_QWORD))_Block_copy(v35);
    if (self->_shouldTurnOnMyriad)
    {
      v24 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
      v27 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
      if (v24)
        v27 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
      LODWORD(v26) = 1110704128;
      LODWORD(v25) = 0;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v27), "startAdvertisingForPHSSetupAfterDelay:maxInterval:", v25, v26);
    }
    if (-[VTUIEnrollTrainingViewController _shouldSpeakAudioHint](self, "_shouldSpeakAudioHint"))
    {
      if (v6)
        -[VTUITrainingViewMediator slideInText:afterDelay:completion:](self->_trainingViewMediator, "slideInText:afterDelay:completion:", v29, v21, a4);
      else
        v21[2](v21);
      -[VTUIEnrollTrainingViewController trainingManager](self, "trainingManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      v31[1] = 3221225472;
      v31[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_191;
      v31[3] = &unk_24F33DC48;
      objc_copyWeak(v34, &location);
      v34[1] = (id)a3;
      v33 = buf;
      v32 = v22;
      objc_msgSend(v28, "prepareWithCompletion:", v31);

      objc_destroyWeak(v34);
    }
    else if (v6)
    {
      -[VTUITrainingViewMediator slideInText:afterDelay:completion:](self->_trainingViewMediator, "slideInText:afterDelay:completion:", v29, v23, a4);
    }
    else
    {
      v23[2](v23);
    }

    objc_destroyWeak(v39);
    objc_destroyWeak(v43);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!*(_BYTE *)(a1 + 48))
      objc_msgSend(WeakRetained, "_updatePageNumberForInstruction:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3[155], "hidePreludeLabel:", 0);
    objc_msgSend(v3[155], "hideContinuationLabel:", (uint64_t)v3[140] > 0);
    WeakRetained = v3;
  }

}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  int *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24[2];
  char v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[155], "animateToListeningState");
    objc_msgSend(v4, "trainingManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startRMS");

    if (*((_BYTE *)v4 + 1228))
    {
      v6 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
      v9 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
      if (v6)
        v9 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
      LODWORD(v7) = 0;
      LODWORD(v8) = 20.0;
      objc_msgSend(*(id *)((char *)v4 + *v9), "startAdvertisingForPHSSetupAfterDelay:maxInterval:", v7, v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "trainingAttemptUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong(v4 + 129, v11);
    v12 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 56) + 1;
      *(_DWORD *)buf = 136315650;
      v28 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_2";
      v29 = 2112;
      v30 = v11;
      v31 = 2048;
      v32 = v13;
      _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Starting training attempt %@ for instruction %ld", buf, 0x20u);
    }
    v14 = MGGetBoolAnswer();
    v20 = v4[130];
    v15 = *(_QWORD *)(a1 + 56);
    v16 = objc_msgSend(*(id *)(a1 + 32), "_isGreyMatterAvailable");
    objc_msgSend(*(id *)(a1 + 32), "trainingAttemptUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_188;
    v21[3] = &unk_24F33DBA8;
    objc_copyWeak(v24, v2);
    v25 = *(_BYTE *)(a1 + 64);
    v18 = v11;
    v24[1] = *(id *)(a1 + 56);
    v26 = *(_BYTE *)(a1 + 65);
    v19 = *(_QWORD *)(a1 + 40);
    v22 = v18;
    v23 = v19;
    v4[128] = (id)objc_msgSend(v20, "trainUtterance:shouldUseASR:mhUUID:completionWithResult:", v15 + 1, v16 & v14 ^ 1u, v17, v21);

    objc_destroyWeak(v24);
  }

}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_188(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject **v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  unsigned int v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = (NSObject **)MEMORY[0x24BE09000];
    v8 = (void *)*MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = objc_msgSend(v5, "sessionId");
      v11 = WeakRetained[128];
      v12 = objc_msgSend(v5, "sessionStatus");
      v13 = *(unsigned __int8 *)(a1 + 64);
      v14 = WeakRetained[129];
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136316930;
      v39 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
      v40 = 2048;
      v41 = v10;
      v42 = 2048;
      v43 = v11;
      v44 = 1024;
      v45 = v12;
      v46 = 1024;
      v47 = a3;
      v48 = 1024;
      v49 = v13;
      v50 = 2112;
      v51 = v15;
      v52 = 2112;
      v53 = v14;
      _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Callback Session Id: %ld, Current Session Id: %ld, status: %d, success: %d, canRetry: %d, attempt Identifier: %@, latest attempt identifier: %@", buf, 0x46u);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", WeakRetained[129]) & 1) != 0)
    {
      v37 = a3;
      objc_msgSend(WeakRetained, "myriadCoordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 0.5;
      objc_msgSend(v16, "endAdvertisingAfterDelay:", v17);

      objc_msgSend(WeakRetained, "trainingManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stopRMS");

      objc_msgSend(WeakRetained, "trainingViewMediator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "animateToOff");

      objc_msgSend(WeakRetained, "_resetIdleTimer");
      if ((objc_msgSend(WeakRetained, "interpretSessionManagerResult:forInstruction:", v5, objc_msgSend(WeakRetained, "currentTrainingState")) & 0xFFFFFFFFFFFFFFFDLL) == 1)v20 = 1;
      else
        v20 = 3;
      objc_msgSend(WeakRetained, "trainingAttemptUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = WeakRetained[133];
      objc_msgSend(WeakRetained, "spokenLanguageCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(unsigned int *)(a1 + 56);
      v25 = *(unsigned __int8 *)(a1 + 65);
      v26 = objc_msgSend(WeakRetained, "_shouldSpeakAudioHint");
      BYTE1(v36) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      LOBYTE(v36) = v26;
      +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", v21, v22, v23, v20, v24, v25, v36);

      if (*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(WeakRetained, "setHasRetriedTraining:", *(unsigned __int8 *)(a1 + 65));
        objc_msgSend(WeakRetained, "_handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:", v5, v37);
      }
      else
      {
        objc_msgSend(WeakRetained, "_handleTrainingResultForNonRetryablePhraseWithResult:", v5);
      }
    }
    else
    {
      v27 = *v7;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = WeakRetained[129];
        v29 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v39 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
        v40 = 2112;
        v41 = v29;
        v42 = 2112;
        v43 = v28;
        _os_log_impl(&dword_229EF7000, v27, OS_LOG_TYPE_DEFAULT, "%s Callback for training attempt %@ does not match most recent attempt %@. Ignoring", buf, 0x20u);
      }
      objc_msgSend(WeakRetained, "trainingAttemptUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = WeakRetained[133];
      objc_msgSend(WeakRetained, "spokenLanguageCode");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(unsigned int *)(a1 + 56);
      v34 = *(unsigned __int8 *)(a1 + 65);
      v35 = objc_msgSend(WeakRetained, "_shouldSpeakAudioHint");
      BYTE1(v36) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      LOBYTE(v36) = v35;
      +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", v30, v31, v32, 0, v33, v34, v36);

    }
  }

}

uint64_t __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_190(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_191(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    if (WeakRetained)
    {
      v7 = (void *)*((_QWORD *)WeakRetained + 166);
      v8 = *(_QWORD *)(a1 + 56);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_192;
      v12[3] = &unk_24F33DC20;
      objc_copyWeak(&v14, v4);
      v11 = *(_OWORD *)(a1 + 32);
      v9 = (id)v11;
      v13 = v11;
      objc_msgSend(v7, "speakAudioHint:completion:", v8, v12);

      objc_destroyWeak(&v14);
    }
  }
  else
  {
    v10 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_2";
      _os_log_impl(&dword_229EF7000, v10, OS_LOG_TYPE_DEFAULT, "%s Error preparing audio session", buf, 0xCu);
    }
  }

}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_192(uint64_t a1, void *a2)
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
    objc_msgSend(WeakRetained[166], "synth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSpeaking");

    v9 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
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
  VTUIEnrollTrainingViewController *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  VTUIEnrollTrainingViewController *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  int64_t consecutiveTimeoutCount;
  void *v29;
  dispatch_time_t v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD block[5];
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  _BYTE v39[10];
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
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
    v37 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    v38 = 1024;
    *(_DWORD *)v39 = v8;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v9;
    v40 = 2048;
    v41 = badMicRetryCount;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, badMicRetryCount: %lu", buf, 0x22u);

  }
  v11 = -[VTUIEnrollTrainingViewController interpretSessionManagerResult:forInstruction:](self, "interpretSessionManagerResult:forInstruction:", v4, self->_currentTrainingState);
  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    v38 = 2048;
    *(_QWORD *)v39 = v11;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  switch(v11)
  {
    case 1:
      self->_consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      -[VTUIEnrollTrainingViewController _signalSingleEnrollmentSuccess](self, "_signalSingleEnrollmentSuccess");
      break;
    case 4:
      -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
      objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v15, "deleteUserVoiceProfile:", v16);

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke;
      v35[3] = &unk_24F33DA28;
      v35[4] = self;
      v18 = v35;
      v19 = self;
      v20 = 4;
      goto LABEL_13;
    case 5:
      ++self->_badMicRetryCount;
      if (-[VTUIEnrollTrainingViewController badMicRetryCount](self, "badMicRetryCount") >= 2)
      {
        -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v21, "deleteUserVoiceProfile:", v22);

        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4;
        v32[3] = &unk_24F33DA28;
        v32[4] = self;
        v18 = v32;
        v19 = self;
        v20 = 5;
        goto LABEL_13;
      }
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5;
      v31[3] = &unk_24F33DA28;
      v31[4] = self;
      -[VTUIEnrollTrainingViewController _showBadMicAlertCompletion:](self, "_showBadMicAlertCompletion:", v31);
      break;
    case 6:
      v24 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v24;
      if (v24 < 6)
      {
        v30 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3;
        block[3] = &unk_24F33DA28;
        block[4] = self;
        dispatch_after(v30, MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "deleteUserVoiceProfile:", v26);

        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2;
        v34[3] = &unk_24F33DA28;
        v34[4] = self;
        v18 = v34;
        v19 = self;
        v20 = 6;
LABEL_13:
        -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](v19, "_cleanupTrainingManagerWithCompletion:status:", v18, v20);
      }
      break;
    case 7:
      break;
    case 8:
      consecutiveTimeoutCount = self->_consecutiveTimeoutCount;
      self->_consecutiveTimeoutCount = consecutiveTimeoutCount + 1;
      if (consecutiveTimeoutCount >= 1)
        self->_shouldTurnOnMyriad = 0;
      v13 = self;
      v14 = 8;
      goto LABEL_19;
    case 9:
      ++self->_digitalZerosRetryCount;
      v13 = self;
      v14 = 9;
      goto LABEL_19;
    case 10:
      ++self->_cannotHearRetryCount;
      v13 = self;
      v14 = 10;
      goto LABEL_19;
    default:
      v13 = self;
      v14 = 0;
LABEL_19:
      -[VTUIEnrollTrainingViewController _retryStringForStatus:](v13, "_retryStringForStatus:", v14);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v29);

      break;
  }

}

void __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "skipSetup");

}

void __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "skipSetup");

}

uint64_t __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeTraining:", 1);
}

void __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "skipSetup");

}

uint64_t __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryAfterBadMicAlert");
}

- (void)_signalSingleEnrollmentSuccess
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__VTUIEnrollTrainingViewController__signalSingleEnrollmentSuccess__block_invoke;
  v3[3] = &unk_24F33DA00;
  objc_copyWeak(&v4, &location);
  -[VTUIEnrollTrainingViewController _animateSuccessfulStep:completion:](self, "_animateSuccessfulStep:completion:", 1, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__VTUIEnrollTrainingViewController__signalSingleEnrollmentSuccess__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  int v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_advanceState");

  v3 = objc_loadWeakRetained(v1);
  v4 = objc_msgSend(v3, "_isGreyMatterAvailable");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "_playSoundForStageAfterDelay:", 0.0);

  }
}

- (void)_playSoundForStageAfterDelay:(double)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__VTUIEnrollTrainingViewController__playSoundForStageAfterDelay___block_invoke;
  block[3] = &unk_24F33DA28;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __65__VTUIEnrollTrainingViewController__playSoundForStageAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120);
  if (v2 != -1)
  {
    if (v2 == 5)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v3 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "resourcePath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/Siri+ Buddy V1 F 240321_ML.caf"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1848]), "initWithContentsOfURL:error:", v6, 0);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 1352);
      *(_QWORD *)(v8 + 1352) = v7;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1352), "play");
    }
    else
    {
      NSLog(CFSTR("_playSoundForStageAfterDelay. trainingState: %d"), (__int16)v2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "playSoundsEffect:", (__int16)v2);
    }
  }
}

- (void)restartFromIntroView
{
  id v3;

  -[VTUIEnrollTrainingViewController _resetEnrollment](self, "_resetEnrollment");
  if (self->_enrollmentMode != 2)
    -[VTUIEnrollTrainingViewController _showIntroView](self, "_showIntroView");
  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", 0);

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
  VTUIEnrollTrainingViewController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  VTUIEnrollTrainingViewController *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  int64_t consecutiveTimeoutCount;
  void *v31;
  dispatch_time_t v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD block[5];
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  _BYTE v41[10];
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
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
    v39 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    v40 = 1024;
    *(_DWORD *)v41 = v10;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v11;
    v42 = 1024;
    v43 = v4;
    v44 = 2048;
    v45 = badMicRetryCount;
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, shouldShowCheckMark:%d, badMicRetryCount: %lu", buf, 0x28u);

  }
  v13 = -[VTUIEnrollTrainingViewController interpretSessionManagerResult:forInstruction:](self, "interpretSessionManagerResult:forInstruction:", v6, self->_currentTrainingState);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    v40 = 2048;
    *(_QWORD *)v41 = v13;
    _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  switch(v13)
  {
    case 2:
      self->_consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      -[VTUIAnalytics setAsrError:](self->_analyticsEvent, "setAsrError:", -[VTUIAnalytics asrError](self->_analyticsEvent, "asrError") + 1);
      if (self->_hasRetriedTraining)
        -[VTUIEnrollTrainingViewController _advanceState](self, "_advanceState");
      else
        -[VTUIEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 0, 0);
      break;
    case 3:
      self->_consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      -[VTUIEnrollTrainingViewController _signalSingleEnrollmentSuccess](self, "_signalSingleEnrollmentSuccess");
      break;
    case 4:
      -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
      objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v17, "deleteUserVoiceProfile:", v18);

      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke;
      v37[3] = &unk_24F33DA28;
      v37[4] = self;
      v20 = v37;
      v21 = self;
      v22 = 4;
      goto LABEL_15;
    case 5:
      ++self->_badMicRetryCount;
      if (-[VTUIEnrollTrainingViewController badMicRetryCount](self, "badMicRetryCount") >= 2)
      {
        -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v23, "deleteUserVoiceProfile:", v24);

        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4;
        v34[3] = &unk_24F33DA28;
        v34[4] = self;
        v20 = v34;
        v21 = self;
        v22 = 5;
        goto LABEL_15;
      }
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5;
      v33[3] = &unk_24F33DA28;
      v33[4] = self;
      -[VTUIEnrollTrainingViewController _showBadMicAlertCompletion:](self, "_showBadMicAlertCompletion:", v33);
      break;
    case 6:
      v26 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v26;
      if (v26 < 6)
      {
        v32 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3;
        block[3] = &unk_24F33DA28;
        block[4] = self;
        dispatch_after(v32, MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
        objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v27, "deleteUserVoiceProfile:", v28);

        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2;
        v36[3] = &unk_24F33DA28;
        v36[4] = self;
        v20 = v36;
        v21 = self;
        v22 = 6;
LABEL_15:
        -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:](v21, "_cleanupTrainingManagerWithCompletion:status:", v20, v22);
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
      v15 = self;
      v16 = 8;
      goto LABEL_21;
    case 9:
      ++self->_digitalZerosRetryCount;
      v15 = self;
      v16 = 9;
      goto LABEL_21;
    case 10:
      ++self->_cannotHearRetryCount;
      v15 = self;
      v16 = 10;
      goto LABEL_21;
    default:
      -[VTUIAnalytics setAsrError:](self->_analyticsEvent, "setAsrError:", -[VTUIAnalytics asrError](self->_analyticsEvent, "asrError") + 1);
      v15 = self;
      v16 = 0;
LABEL_21:
      -[VTUIEnrollTrainingViewController _retryStringForStatus:](v15, "_retryStringForStatus:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIEnrollTrainingViewController _retryInstruction:withStatusMessage:](self, "_retryInstruction:withStatusMessage:", 1, v31);

      break;
  }

}

void __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "skipSetup");

}

void __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "skipSetup");

}

uint64_t __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeTraining:", 1);
}

void __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "skipSetup");

}

uint64_t __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryAfterBadMicAlert");
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
  -[VTUIEnrollTrainingViewController interpretAudioSource:](self, "interpretAudioSource:", -[SSRVTUITrainingManager audioSource](self->_trainingManager, "audioSource"));
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
  v21[2] = __63__VTUIEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke;
  v21[3] = &unk_24F33DAC8;
  v22 = v19;
  v17 = v19;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v18);
  -[VTUIEnrollTrainingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __63__VTUIEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke(uint64_t a1)
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
  v16[2] = __74__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke;
  v16[3] = &unk_24F33DAC8;
  v17 = v4;
  v14 = v4;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v15);
  -[VTUIEnrollTrainingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

uint64_t __74__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setColorForNavigationElements:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEBD788];
  v5 = a3;
  objc_msgSend(v4, "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BEBB368];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleTextAttributes:", v7);

  -[VTUIEnrollTrainingViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v5);

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

  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v12);

}

- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  -[VTUITrainingViewMediator showStatusMessage:afterDelay:completion:](self->_trainingViewMediator, "showStatusMessage:afterDelay:completion:", a3, a5, a4);
}

- (void)_hideInstruction
{
  id v3;

  -[VTUITrainingViewMediator clearInstructionLabel](self->_trainingViewMediator, "clearInstructionLabel");
  -[VTUITrainingViewMediator hideContinuationAndPreludeLabel:](self->_trainingViewMediator, "hideContinuationAndPreludeLabel:", 1);
  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", 0);

}

- (void)_createTrainingManagerIfNeeded
{
  SSRVTUITrainingManager *v3;
  SSRVTUITrainingManager *trainingManager;

  if (!self->_trainingManager)
  {
    objc_msgSend(MEMORY[0x24BEAFEA8], "trainingManagerWithLocaleID:withAppDomain:", self->_spokenLanguageCode, self->_voiceProfileAppDomain);
    v3 = (SSRVTUITrainingManager *)objc_claimAutoreleasedReturnValue();
    trainingManager = self->_trainingManager;
    self->_trainingManager = v3;

    -[SSRVTUITrainingManager setDelegate:](self->_trainingManager, "setDelegate:", self);
  }
}

- (void)_resetTrainingManager
{
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
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
    v12 = "-[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:]";
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);

  }
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", v6);

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

- (void)_cleanupAllViews
{
  NSObject *v3;
  void *v4;
  VTUISiriEducationViewController *educationViewController;
  VTUIEnrollmentLanguageOptionsView *languageOptionsView;
  void *v7;
  VTUIVoiceSelectionViewController *voiceSelectionViewController;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[VTUIEnrollTrainingViewController _cleanupAllViews]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[VTUISiriEducationViewController view](self->_educationViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  educationViewController = self->_educationViewController;
  self->_educationViewController = 0;

  if (self->_siriDataSharingOptInView)
  {
    -[UIViewController viewDidDisappear:](self->_siriDataSharingViewController, "viewDidDisappear:", 0);
    -[VTUIEnrollTrainingViewController _tearDownDataSharingViews](self, "_tearDownDataSharingViews");
  }
  -[VTUIEnrollmentLanguageOptionsView removeFromSuperview](self->_languageOptionsView, "removeFromSuperview");
  languageOptionsView = self->_languageOptionsView;
  self->_languageOptionsView = 0;

  -[VTUIVoiceSelectionViewController removeFromParentViewController](self->_voiceSelectionViewController, "removeFromParentViewController");
  -[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = 0;

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
    return off_24F33DD30[a3 - 2];
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
    || (-[VTUIEnrollTrainingViewController trainingPageInstructions](self, "trainingPageInstructions"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v12 <= a4))
  {
    v16 = 0;
  }
  else
  {
    -[VTUIEnrollTrainingViewController trainingPageInstructions](self, "trainingPageInstructions");
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
      return qword_229F4FD40[v7];
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

- (void)_showRadarExitButton
{
  void *v3;
  void *v4;
  int v5;
  char **v6;
  id v7;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[VTUIEnrollmentSuccessViewing isSuccessViewReady](self->_successView, "isSuccessViewReady"))
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiLocalizedStringForKey:", CFSTR("BUTTON_DONE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("BUTTON_SET_UP_LATER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VTUITrainingViewMediator showRadarExitButton:](self->_trainingViewMediator, "showRadarExitButton:", v4);
  v5 = -[VTUIEnrollmentSuccessViewing isSuccessViewReady](self->_successView, "isSuccessViewReady");
  v6 = &selRef_finish_;
  if (!v5)
    v6 = &selRef_skipTraining_;
  -[VTUITrainingViewMediator addTargetToRadarExitButton:action:forControlEvents:](self->_trainingViewMediator, "addTargetToRadarExitButton:action:forControlEvents:", self, *v6, 64);

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
  -[VTUITrainingViewMediator setPowerLevel:](self->_trainingViewMediator, "setPowerLevel:");
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

  -[VTUIEnrollTrainingViewController delegate](self, "delegate");
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
  NSString *disambiguatedLanguageOption;
  int v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    v15 = 136315650;
    v16 = "-[VTUIEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code changed: %@. (Trigger: '%@')", (uint8_t *)&v15, 0x20u);

  }
  -[SSRVTUITrainingManager setLocaleIdentifier:](self->_trainingManager, "setLocaleIdentifier:", self->_spokenLanguageCode);
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSiriLanguage:", self->_spokenLanguageCode);

  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_spokenLanguageCode;
    v15 = 136315394;
    v16 = "-[VTUIEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v15, 0x16u);
  }
  -[VTUIAudioHintPlayer setLanguage:](self->_audioHintPlayer, "setLanguage:", self->_spokenLanguageCode);
  -[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode);
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  self->_disambiguatedLanguageOption = 0;

}

- (void)skipAssistant:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isEnablementConfigurationLoading)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VTUIEnrollTrainingViewController skipAssistant:]";
      _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip Assistant requested while Enablement configuration loading", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __50__VTUIEnrollTrainingViewController_skipAssistant___block_invoke;
    v16[3] = &unk_24F33DC70;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    -[VTUIEnrollTrainingViewController _setIntroViewActionOnEnablementConfigurationDidLoad:](self, "_setIntroViewActionOnEnablementConfigurationDidLoad:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    goto LABEL_17;
  }
  v6 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VTUIEnrollTrainingViewController skipAssistant:]";
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping Setup / Assistant", buf, 0xCu);
  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBuddyOrFollowUp");

  if (v8)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "enrollmentMode"))
    {
      +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "enrollmentMode") == 1;

      if (!v11)
      {
        +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "enrollmentMode") == 3;

        if (v13)
          -[VTUIAnalytics setSkippedFromIntroNonAOP:](self->_analyticsEvent, "setSkippedFromIntroNonAOP:", -[VTUIAnalytics skippedFromIntroNonAOP](self->_analyticsEvent, "skippedFromIntroNonAOP") + 1);
        goto LABEL_14;
      }
    }
    else
    {

    }
    -[VTUIAnalytics setSkippedFromIntroAOP:](self->_analyticsEvent, "setSkippedFromIntroAOP:", -[VTUIAnalytics skippedFromIntroAOP](self->_analyticsEvent, "skippedFromIntroAOP") + 1);
  }
LABEL_14:
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "enrollmentMode") == 3;

  if (!v15)
    -[VTUIEnrollTrainingViewController _setPHSEnrollmentPrefEnabled:](self, "_setPHSEnrollmentPrefEnabled:", 0);
  -[VTUIEnrollTrainingViewController _proceedAfterVoiceSelectionOrSkip](self, "_proceedAfterVoiceSelectionOrSkip");
LABEL_17:

}

void __50__VTUIEnrollTrainingViewController_skipAssistant___block_invoke(uint64_t a1)
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
    v5 = "-[VTUIEnrollTrainingViewController skipAssistant:]_block_invoke";
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
    v12 = "-[VTUIEnrollTrainingViewController cancelTraining]";
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
  objc_msgSend(v4, "logEventWithType:context:", 3304, v8);

  -[VTUIAnalytics setVoiceTrainingCancelled:](self->_analyticsEvent, "setVoiceTrainingCancelled:", -[VTUIAnalytics voiceTrainingCancelled](self->_analyticsEvent, "voiceTrainingCancelled") + 1);
  -[VTUIAnalytics setVoiceTrainingCancelledStep:](self->_analyticsEvent, "setVoiceTrainingCancelledStep:", LODWORD(self->_currentTrainingState));
  +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:](VTUISELFLogger, "logSiriSetupPHSEnrollmentUICompleted:enrollmentMode:locale:enrollmentSessionOutcome:pageNumber:", self->_trainingAttemptUUID, self->_enrollmentMode, self->_spokenLanguageCode, 2, LODWORD(self->_currentTrainingState));
  -[VTUIEnrollTrainingViewController _cleanupHelper](self, "_cleanupHelper");
}

- (void)skipTraining:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSUUID *trainingAttemptUUID;
  int64_t enrollmentMode;
  NSString *spokenLanguageCode;
  uint64_t currentTrainingState_low;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[VTUIEnrollTrainingViewController skipTraining:]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_INFO, "%s Skipping Training", buf, 0xCu);
  }
  self->_hasSkippedTraining = 1;
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("currentTrainingState");
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_currentTrainingState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 3310, v9);

  trainingAttemptUUID = self->_trainingAttemptUUID;
  enrollmentMode = self->_enrollmentMode;
  spokenLanguageCode = self->_spokenLanguageCode;
  currentTrainingState_low = LODWORD(self->_currentTrainingState);
  LOWORD(v14) = -[VTUIEnrollTrainingViewController _shouldSpeakAudioHint](self, "_shouldSpeakAudioHint");
  +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", trainingAttemptUUID, enrollmentMode, spokenLanguageCode, 2, currentTrainingState_low, 0, v14);
  -[VTUIEnrollTrainingViewController _cleanupHelper](self, "_cleanupHelper");
  -[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip](self, "_proceedAfterTrainingCompletionOrSkip");
}

- (void)_cleanupHelper
{
  int v3;
  int *v4;

  v3 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v4 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
  if (v3)
    v4 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "resetStateMachine");
  -[VTUIEnrollTrainingViewController _resetEnrollment](self, "_resetEnrollment");
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
  -[VTUIEnrollTrainingViewController setTrainingAttemptUUID:](self, "setTrainingAttemptUUID:", 0);
}

- (void)_cleanupMyriad
{
  NSObject *v3;
  AFMyriadCoordinator **p_myriadCoordinator;
  AFMyriadCoordinator *myriadCoordinator;
  id *v6;
  AFMyriadCoordinator *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[VTUIEnrollTrainingViewController _cleanupMyriad]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #myriad needs to be cleaned up", (uint8_t *)&v8, 0xCu);
  }
  if (!objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
  {
    p_myriadCoordinator = &self->_myriadCoordinator;
    myriadCoordinator = self->_myriadCoordinator;
    v6 = (id *)0x24BE09238;
    if (!myriadCoordinator)
      goto LABEL_6;
    goto LABEL_5;
  }
  p_myriadCoordinator = &self->_scdaCoordinator;
  myriadCoordinator = self->_scdaCoordinator;
  v6 = (id *)0x24BE92080;
  if (myriadCoordinator)
  {
LABEL_5:
    -[AFMyriadCoordinator endAdvertising:](myriadCoordinator, "endAdvertising:", 0);
    -[AFMyriadCoordinator stopListening:](*p_myriadCoordinator, "stopListening:", 0);
    -[AFMyriadCoordinator setupEnabled:](*p_myriadCoordinator, "setupEnabled:", 0);
    v7 = *p_myriadCoordinator;
    *p_myriadCoordinator = 0;

  }
LABEL_6:
  objc_msgSend(*v6, "clearCurrentCoordinator");
}

- (void)_setupMyriadCoordinator
{
  NSObject *v3;
  id *p_scdaCoordinator;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)&v10[4] = "-[VTUIEnrollTrainingViewController _setupMyriadCoordinator]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #myriad needs to be set up", v10, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
  {
    p_scdaCoordinator = (id *)&self->_scdaCoordinator;
    if (self->_scdaCoordinator)
    {
      v5 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v10 = 136315138;
        *(_QWORD *)&v10[4] = "-[VTUIEnrollTrainingViewController _setupMyriadCoordinator]";
LABEL_10:
        _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad was already set up", v10, 0xCu);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x24BE92080], "currentCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (objc_class *)MEMORY[0x24BE92080];
LABEL_16:
      v8 = (id)objc_msgSend([v7 alloc], "initWithDelegate:", self);
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  p_scdaCoordinator = (id *)&self->_myriadCoordinator;
  if (!self->_myriadCoordinator)
  {
    objc_msgSend(MEMORY[0x24BE09238], "currentCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (objc_class *)MEMORY[0x24BE09238];
      goto LABEL_16;
    }
LABEL_14:
    v8 = v6;
LABEL_17:
    v9 = *p_scdaCoordinator;
    *p_scdaCoordinator = v8;

    goto LABEL_18;
  }
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)&v10[4] = "-[VTUIEnrollTrainingViewController _setupMyriadCoordinator]";
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(*p_scdaCoordinator, "setupEnabled:", 1, *(_OWORD *)v10);
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

  -[VTUITrainingViewMediator hideContinuationAndPreludeLabel:](self->_trainingViewMediator, "hideContinuationAndPreludeLabel:", 1);
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__VTUIEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke;
  v3[3] = &unk_24F33DC70;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[VTUIEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__VTUIEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  VTUIEnrollmentLanguageOptionsView *v8;
  void *v9;
  VTUIEnrollmentLanguageOptionsView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[135], "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    v5 = v3[135];
    v3[135] = 0;

    v6 = v3 + 162;
    if (!v3[162])
    {
      objc_msgSend(v3, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [VTUIEnrollmentLanguageOptionsView alloc];
      objc_msgSend(v3, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v10 = -[VTUIEnrollmentLanguageOptionsView initWithFrame:](v8, "initWithFrame:");

      objc_storeStrong(v3 + 162, v10);
      objc_msgSend(*v6, "setEnrollmentDelegate:", v3);
      objc_msgSend(*v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (objc_msgSend(v3[126], "count"))
        objc_msgSend(*v6, "setContinueButtonLanguages:", v3[126]);
      objc_msgSend(v7, "addSubview:", *v6);
      v11 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("languageOptionsView"), v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[languageOptionsView]|"), 0, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addConstraints:", v13);

      v14 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("languageOptionsView"), v10, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[languageOptionsView]|"), 0, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      objc_msgSend(v7, "addConstraints:", v16);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(*v6, "continueButtons");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__processLanguageSelectionAction_, 64);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v19);
      }

      objc_msgSend(v3[155], "hideSkipButton:", 1);
      objc_msgSend(*v6, "fadeInSubviews");

    }
  }

}

- (void)_checkForPHSCloudDataIfNecessary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  dispatch_block_t v9;
  id hasPHSInCloudFetchBlock;
  NSObject *hasPHSInCloudFetchQueue;
  NSObject *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *v14;
  id v15;
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
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enrollmentMode");

  v7 = *MEMORY[0x24BE09000];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v4 && v6 <= 1)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__VTUIEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke;
    v16[3] = &unk_24F33DC70;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v16);
    hasPHSInCloudFetchBlock = self->_hasPHSInCloudFetchBlock;
    self->_hasPHSInCloudFetchBlock = v9;

    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    if (!hasPHSInCloudFetchQueue)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (OS_dispatch_queue *)dispatch_queue_create(0, v12);
      v14 = self->_hasPHSInCloudFetchQueue;
      self->_hasPHSInCloudFetchQueue = v13;

      hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    }
    dispatch_async(hasPHSInCloudFetchQueue, self->_hasPHSInCloudFetchBlock);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Clearing fetch block", buf, 0xCu);
    }
    v15 = self->_hasPHSInCloudFetchBlock;
    self->_hasPHSInCloudFetchBlock = 0;

  }
}

void __69__VTUIEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke(uint64_t a1)
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
      v7 = "-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]_block_invoke";
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
    || (-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode), self->_hasPHSInCloudFetchBlock))
  {
    v3 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[VTUIEnrollTrainingViewController _hasPHSCloudDataForSpokenLanguage]";
      _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Waiting on block", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__VTUIEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke;
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

void __69__VTUIEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[977];

}

- (void)_showEducationView
{
  NSObject *v3;
  int64_t enrollmentMode;
  void *v5;
  void *v6;
  VTUISiriEducationViewController *v7;
  void *v8;
  VTUISiriEducationViewController *v9;
  VTUISiriEducationViewController *educationViewController;
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
  _QWORD v33[4];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    enrollmentMode = self->_enrollmentMode;
    *(_DWORD *)buf = 136315394;
    v35 = "-[VTUIEnrollTrainingViewController _showEducationView]";
    v36 = 2048;
    v37 = enrollmentMode;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Showing Education view for enrollment mode %ld", buf, 0x16u);
  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "educationViewTitleText");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "educationViewDetailText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VTUISiriEducationViewController alloc];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VTUISiriEducationViewController initWithTitle:detailText:style:delegate:](v7, "initWithTitle:detailText:style:delegate:", v32, v31, v8, self);
  educationViewController = self->_educationViewController;
  self->_educationViewController = v9;

  -[VTUISiriEducationViewController willMoveToParentViewController:](self->_educationViewController, "willMoveToParentViewController:", self);
  -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_educationViewController);
  -[VTUISiriEducationViewController didMoveToParentViewController:](self->_educationViewController, "didMoveToParentViewController:", self);
  -[VTUISiriEducationViewController view](self->_educationViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setAutoresizesSubviews:", 0);
  -[VTUIEnrollTrainingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  v23 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v11, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  objc_msgSend(v11, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v22;
  objc_msgSend(v11, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  objc_msgSend(v11, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v20);

  -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
}

- (void)_finishSiriSetup
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__VTUIEnrollTrainingViewController__finishSiriSetup__block_invoke;
  v3[3] = &unk_24F33DA00;
  objc_copyWeak(&v4, &location);
  -[VTUIEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__VTUIEnrollTrainingViewController__finishSiriSetup__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[141], "setTurnOnSiriNonAOP:", objc_msgSend(WeakRetained[141], "turnOnSiriNonAOP") + 1);
    objc_msgSend(v2, "_setAssistantEnabled:", 1);
    objc_msgSend(MEMORY[0x24BE85890], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didCompleteFlow:", *MEMORY[0x24BE85828]);

    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[VTUIEnrollTrainingViewController _finishSiriSetup]_block_invoke";
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(v2, "_proceedAfterTrainingCompletionOrSkip");
  }

}

- (void)finish:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", 0);
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VTUIEnrollTrainingViewController finish:]";
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip](self, "_proceedAfterTrainingCompletionOrSkip");
}

- (void)enrollTrainingViewRadarButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  VTUIEnrollmentSetupIntroViewControlling *introViewController;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VTUIEnrollTrainingViewController enrollTrainingViewRadarButtonPressed:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Tapped on radar button", buf, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _showRadarExitButton](self, "_showRadarExitButton");
  -[VTUIEnrollmentSuccessViewing setHidden:](self->_successView, "setHidden:", 1);
  introViewController = self->_introViewController;
  if (introViewController)
  {
    -[VTUIEnrollmentSetupIntroViewControlling view](introViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
  -[VTUIEnrollmentLanguageOptionsView setHidden:](self->_languageOptionsView, "setHidden:", 1);
  -[VTUITrainingViewMediator hideRadarButton:](self->_trainingViewMediator, "hideRadarButton:", 1);
  -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
  if (-[VTUIEnrollTrainingViewController _isTrainingInProgress](self, "_isTrainingInProgress"))
  {
    -[VTUIEnrollTrainingViewController _resetEnrollment](self, "_resetEnrollment");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__VTUIEnrollTrainingViewController_enrollTrainingViewRadarButtonPressed___block_invoke;
    v8[3] = &unk_24F33DA28;
    v8[4] = self;
    -[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:](self, "_cleanupTrainingManagerWithCompletion:", v8);
  }
  else
  {
    -[VTUIEnrollTrainingViewController _presentRadarView](self, "_presentRadarView");
  }

}

uint64_t __73__VTUIEnrollTrainingViewController_enrollTrainingViewRadarButtonPressed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentRadarView");
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
    v5 = "-[VTUIEnrollTrainingViewController shouldAbortAnotherDeviceBetter:]";
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
    v5 = "-[VTUIEnrollTrainingViewController shouldContinue:]";
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
    v5 = "-[VTUIEnrollTrainingViewController scdaShouldAbortAnotherDeviceBetter:]";
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
    v5 = "-[VTUIEnrollTrainingViewController scdaShouldContinue:]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_tearDownDataSharingViews
{
  UIView *siriDataSharingOptInView;
  UIViewController *siriDataSharingViewController;

  -[VTUISiriDataSharingOptInPresenter tearDownPresentedViews](self->_siriDataSharingOptInPresenter, "tearDownPresentedViews");
  siriDataSharingOptInView = self->_siriDataSharingOptInView;
  self->_siriDataSharingOptInView = 0;

  -[VTUIEnrollTrainingViewController removeChildViewController:](self, "removeChildViewController:", self->_siriDataSharingViewController);
  siriDataSharingViewController = self->_siriDataSharingViewController;
  self->_siriDataSharingViewController = 0;

}

- (void)_showSiriDataSharingOptIn
{
  NSObject *v3;
  void *v4;
  UIViewController *v5;
  UIViewController *siriDataSharingViewController;
  UIView *v7;
  UIView *siriDataSharingOptInView;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VTUIEnrollTrainingViewController _showSiriDataSharingOptIn]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Displaying SiriDataSharingOptIn", buf, 0xCu);
  }
  -[VTUIEnrollTrainingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUISiriDataSharingOptInPresenter dataSharingOptInTextWelcomeControllerForViewStyle:](self->_siriDataSharingOptInPresenter, "dataSharingOptInTextWelcomeControllerForViewStyle:", 0);
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  siriDataSharingViewController = self->_siriDataSharingViewController;
  self->_siriDataSharingViewController = v5;

  -[UIViewController view](self->_siriDataSharingViewController, "view");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  siriDataSharingOptInView = self->_siriDataSharingOptInView;
  self->_siriDataSharingOptInView = v7;
  v9 = v7;

  -[UIViewController willMoveToParentViewController:](self->_siriDataSharingViewController, "willMoveToParentViewController:", self);
  -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_siriDataSharingViewController);
  -[UIViewController didMoveToParentViewController:](self->_siriDataSharingViewController, "didMoveToParentViewController:", self);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAutoresizesSubviews:](v9, "setAutoresizesSubviews:", 0);
  objc_msgSend(v4, "addSubview:", v9);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 3, 0, v4, 3, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v4, 4, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 1, 0, v4, 1, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 2, 0, v4, 2, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  v15[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraints:", v14);

  -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 1);
}

- (BOOL)_shouldShowSiriDataSharingOptInView
{
  int64_t enrollmentMode;
  void *v4;
  char v5;

  enrollmentMode = self->_enrollmentMode;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  if (enrollmentMode == 2)
    return 0;
  else
    return -[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView](self->_siriDataSharingOptInPresenter, "shouldShowSiriDataSharingOptInView") & v5;
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 hasSkippedTraining;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    hasSkippedTraining = self->_hasSkippedTraining;
    v7 = v4;
    objc_msgSend(v5, "numberWithBool:", hasSkippedTraining);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[VTUIEnrollTrainingViewController siriDataSharingOptInRequestsDismissalFromPresenter:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Dismissing DataSharingOptIn sheet. _hasSkippedTraining:%@", (uint8_t *)&v9, 0x16u);

  }
  -[VTUIEnrollTrainingViewController _endSetup](self, "_endSetup");
}

- (void)_proceedAfterVoiceSelectionOrSkip
{
  void *v3;
  int v4;
  NSObject *v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[VTUIEnrollTrainingViewController _proceedAfterVoiceSelectionOrSkip]";
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Enabled: %d", (uint8_t *)&v9, 0x12u);
  }
  if (self->_hasSkippedTraining)
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    goto LABEL_11;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldPresentEducationView");

  if (v8)
  {
    -[VTUIEnrollmentSuccessViewing setHidden:](self->_successView, "setHidden:", 1);
    -[VTUIEnrollTrainingViewController _showEducationView](self, "_showEducationView");
    return;
  }
  if (-[VTUIEnrollTrainingViewController _shouldShowSiriDataSharingOptInView](self, "_shouldShowSiriDataSharingOptInView"))
  {
    -[VTUIEnrollmentSuccessViewing setHidden:](self->_successView, "setHidden:", 1);
    -[VTUIEnrollTrainingViewController _showSiriDataSharingOptIn](self, "_showSiriDataSharingOptIn");
  }
  else
  {
LABEL_11:
    -[VTUIEnrollTrainingViewController _endSetup](self, "_endSetup");
  }
}

- (void)_endSetup
{
  void *v3;
  int v4;
  NSObject *v5;
  AFEnablementConfiguration *enablementConfiguration;
  AFEnablementConfiguration *v7;
  void (**v8)(_QWORD, _QWORD);
  id WeakRetained;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  AFEnablementConfiguration *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_hasSkippedTraining)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "assistantIsEnabled");

    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      enablementConfiguration = self->_enablementConfiguration;
      *(_DWORD *)buf = 136315650;
      v16 = "-[VTUIEnrollTrainingViewController _endSetup]";
      v17 = 1024;
      v18 = v4;
      v19 = 2112;
      v20 = enablementConfiguration;
      _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Ending setup, assistant enabled %d enablementConfiguration:%@", buf, 0x1Cu);
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
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "skipSetup");

  }
  else
  {
    -[VTUIEnrollTrainingViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    -[VTUIEnrollTrainingViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    if ((v11 & 1) != 0)
    {
      -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "continueSetupWithVoiceProfile:", v13);

    }
    else
    {
      objc_msgSend(v12, "continueSetup");
    }

  }
}

- (void)siriEducationViewControllerContinuePressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  VTUISiriEducationViewController *educationViewController;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[VTUIEnrollTrainingViewController siriEducationViewControllerContinuePressed:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Education view continue pressed", (uint8_t *)&v8, 0xCu);
  }
  if (-[VTUIEnrollTrainingViewController _shouldShowSiriDataSharingOptInView](self, "_shouldShowSiriDataSharingOptInView"))
  {
    -[VTUISiriEducationViewController view](self->_educationViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    educationViewController = self->_educationViewController;
    self->_educationViewController = 0;

    -[VTUIEnrollTrainingViewController _showSiriDataSharingOptIn](self, "_showSiriDataSharingOptIn");
  }
  else
  {
    -[VTUIEnrollTrainingViewController _endSetup](self, "_endSetup");
  }

}

- (void)siriIntroViewControllerLaterPressed:(id)a3
{
  self->_hasSkippedTraining = 1;
  -[VTUIEnrollTrainingViewController skipAssistant:](self, "skipAssistant:", a3);
}

- (void)siriIntroViewControllerPrivacyLinkTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable"))
  {
    objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.siri"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPresentingViewController:", self);
    objc_msgSend(v10, "splashController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsOpeningSafari:", 1);

    objc_msgSend(v10, "splashController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnderlineLinks:", 0);

    objc_msgSend(v10, "splashController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayDeviceType:", 1);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "splashController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayLanguage:", v7);

    objc_msgSend(v10, "setModalPresentationStyle:", -[VTUIEnrollTrainingViewController modalPresentationStyle](self, "modalPresentationStyle"));
    -[VTUIEnrollTrainingViewController presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSupportedInterfaceOrientations:", objc_msgSend(v9, "supportedInterfaceOrientations"));

    objc_msgSend(v10, "present");
  }
}

- (BOOL)allLanguageOptionsSupportCompactTrigger
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_siriLanguageOptions;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v8, "isCompactVoiceTriggerAvailableForLanguageCode:", v7);

        if (!(_DWORD)v7)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)_processIntroViewContinueAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_isEnablementConfigurationLoading)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enrollmentMode");

    if (v7 == 4)
    {
LABEL_6:
      -[VTUIEnrollTrainingViewController _continueToTrainingFromIntro](self, "_continueToTrainingFromIntro");
      goto LABEL_16;
    }
    if (-[VTUIEnrollTrainingViewController _shouldPresentLanguageDisambiguation](self, "_shouldPresentLanguageDisambiguation"))
    {
      -[VTUIEnrollTrainingViewController _setLanguageOptionsAndContinue](self, "_setLanguageOptionsAndContinue");
      goto LABEL_16;
    }
    if (v7 != 3)
    {
      if (v7 > 1
        || (+[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "shouldPresentDisclosureForCompactVoiceTrigger"),
            v8,
            !v9))
      {
        if (!-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable"))
        {
          -[VTUIEnrollTrainingViewController _continueToVoiceSelectionFromIntro](self, "_continueToVoiceSelectionFromIntro");
          goto LABEL_16;
        }
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompactVoiceTriggerDisclosurePresented:", 1);

    }
    -[VTUIEnrollTrainingViewController _finishSiriSetup](self, "_finishSiriSetup");
    goto LABEL_16;
  }
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VTUIEnrollTrainingViewController _processIntroViewContinueAction:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Intro view continue requested while Enablement configuration loading", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__VTUIEnrollTrainingViewController__processIntroViewContinueAction___block_invoke;
  v11[3] = &unk_24F33DC70;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v4;
  -[VTUIEnrollTrainingViewController _setIntroViewActionOnEnablementConfigurationDidLoad:](self, "_setIntroViewActionOnEnablementConfigurationDidLoad:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
LABEL_16:

}

void __68__VTUIEnrollTrainingViewController__processIntroViewContinueAction___block_invoke(uint64_t a1)
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
    v5 = "-[VTUIEnrollTrainingViewController _processIntroViewContinueAction:]_block_invoke";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Intro view continue processed after Enablement configuration loaded", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_proceedAfterTrainingCompletionOrSkip
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  _BOOL4 voiceSelected;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[VTUIEnrollTrainingViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VTUIEnrollTrainingViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didCompleteOrSkipVoiceTraining");

  }
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    voiceSelected = self->_voiceSelected;
    *(_DWORD *)buf = 136315394;
    v11 = "-[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip]";
    v12 = 1024;
    v13 = voiceSelected;
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Voice already selected in the session: %d", buf, 0x12u);
  }
  if (self->_voiceSelected
    || !-[AFEnablementConfiguration requiresVoiceSelectionForRecognitionLanguage:](self->_enablementConfiguration, "requiresVoiceSelectionForRecognitionLanguage:", self->_spokenLanguageCode))
  {
    -[VTUIEnrollTrainingViewController _proceedAfterVoiceSelectionOrSkip](self, "_proceedAfterVoiceSelectionOrSkip");
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__VTUIEnrollTrainingViewController__proceedAfterTrainingCompletionOrSkip__block_invoke;
    v8[3] = &unk_24F33DA00;
    objc_copyWeak(&v9, (id *)buf);
    -[VTUIEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __73__VTUIEnrollTrainingViewController__proceedAfterTrainingCompletionOrSkip__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[135], "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    v3 = v4[135];
    v4[135] = 0;

    objc_msgSend(v4, "_showVoiceSelectionViewForRecognitionLanguage:", v4[160]);
    WeakRetained = v4;
  }

}

- (void)_processLanguageSelectionAction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSString *v8;
  NSString *spokenLanguageCode;
  NSString *v10;
  VTUIEnrollmentLanguageOptionsView *languageOptionsView;
  NSString *disambiguatedLanguageOption;
  VTUIEnrollmentLanguageOptionsView *v13;
  id v14;

  v14 = a3;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enrollmentMode");

  -[VTUITrainingViewMediator hideContinuationAndPreludeLabel:](self->_trainingViewMediator, "hideContinuationAndPreludeLabel:", 0);
  -[VTUIEnrollmentLanguageOptionsView continueButtons](self->_languageOptionsView, "continueButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v14);

  if ((v7 & 1) != 0)
  {
    -[VTUIEnrollmentLanguageOptionsView languageSelectionOfContinueButton:](self->_languageOptionsView, "languageSelectionOfContinueButton:", v14);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    spokenLanguageCode = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v8;
    v10 = v8;

    objc_storeStrong((id *)&self->_disambiguatedLanguageOption, self->_spokenLanguageCode);
    -[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:](self, "_checkForPHSCloudDataIfNecessary:", self->_spokenLanguageCode);

  }
  if (-[AFEnablementConfiguration requiresVoiceSelectionForRecognitionLanguage:](self->_enablementConfiguration, "requiresVoiceSelectionForRecognitionLanguage:", self->_spokenLanguageCode))
  {
    -[VTUIEnrollmentLanguageOptionsView removeFromSuperview](self->_languageOptionsView, "removeFromSuperview");
    languageOptionsView = self->_languageOptionsView;
    self->_languageOptionsView = 0;

    -[VTUIEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:](self, "_showVoiceSelectionViewForRecognitionLanguage:", self->_spokenLanguageCode);
  }
  else
  {
    disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
    if (disambiguatedLanguageOption)
      -[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:](self, "_processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:", disambiguatedLanguageOption, 1);
    if (v5 == 3)
    {
      -[VTUIEnrollmentLanguageOptionsView removeFromSuperview](self->_languageOptionsView, "removeFromSuperview");
      v13 = self->_languageOptionsView;
      self->_languageOptionsView = 0;

      -[VTUIEnrollTrainingViewController _finishSiriSetup](self, "_finishSiriSetup");
    }
    else
    {
      -[VTUIEnrollTrainingViewController _continueToTrainingFromLanguageOptions](self, "_continueToTrainingFromLanguageOptions");
    }
  }

}

- (void)_setIntroViewActionOnEnablementConfigurationDidLoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id onEnablementConfigurationDidLoad;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v5, "startAnimating");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v5);
  -[VTUIEnrollTrainingViewController _setRightBarButtonItem:](self, "_setRightBarButtonItem:", v6);
  -[VTUIEnrollmentSetupIntroViewControlling setContinueButtonEnabled:](self->_introViewController, "setContinueButtonEnabled:", 0);
  -[VTUIEnrollmentSetupIntroViewControlling setLaterButtonEnabled:](self->_introViewController, "setLaterButtonEnabled:", 0);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VTUIEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke;
  aBlock[3] = &unk_24F33DCC0;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v7 = v4;
  v8 = _Block_copy(aBlock);
  onEnablementConfigurationDidLoad = self->_onEnablementConfigurationDidLoad;
  self->_onEnablementConfigurationDidLoad = v8;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __88__VTUIEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_resetRightBarButtonItems");
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    objc_msgSend(v4[135], "setContinueButtonEnabled:", 1);
    objc_msgSend(v4[135], "setLaterButtonEnabled:", 1);
    WeakRetained = v4;
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
  NSObject *v14;
  NSString *disambiguatedLanguageOption;
  int v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
    _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v16, 0xCu);
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

  if (v4)
  {
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
      _os_log_impl(&dword_229EF7000, v13, OS_LOG_TYPE_DEFAULT, "%s resetting trigger phrase and training hints", (uint8_t *)&v16, 0xCu);
    }
    -[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet](self, "_setInitialTriggerPhraseIfNotSet");
    -[VTUIEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
  }
  if (v10 != 3)
  {
    v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
      v16 = 136315394;
      v17 = "-[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
      v18 = 2112;
      v19 = disambiguatedLanguageOption;
      _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v16, 0x16u);
    }
    -[VTUIAudioHintPlayer setLanguage:](self->_audioHintPlayer, "setLanguage:", self->_disambiguatedLanguageOption);
  }

}

- (void)_continueToVoiceSelectionFromIntro
{
  -[VTUIEnrollTrainingViewController _hideIntroView](self, "_hideIntroView");
  -[VTUIEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:](self, "_showVoiceSelectionViewForRecognitionLanguage:", self->_spokenLanguageCode);
}

- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t enrollmentMode;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *overriddenBackItemBackBarButtonItem;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  VTUIVoiceSelectionViewController *v26;
  VTUIVoiceSelectionViewController *voiceSelectionViewController;
  void *v28;
  void *v29;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    enrollmentMode = self->_enrollmentMode;
    *(_DWORD *)buf = 136315650;
    v51 = "-[VTUIEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
    v52 = 2048;
    v53 = enrollmentMode;
    v54 = 2112;
    v55 = v4;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Showing voice selection view for enrollment mode %ld, recognitionLanguage %@", buf, 0x20u);
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[VTUIEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
      v52 = 2112;
      v53 = (int64_t)v4;
      _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s No recognition language used, falling back to %@", buf, 0x16u);
    }
  }
  v9 = -[AFEnablementConfiguration voiceSelectionAllowsRandomSelection](self->_enablementConfiguration, "voiceSelectionAllowsRandomSelection");
  -[VTUIEnrollTrainingViewController _setRightBarButtonItem:](self, "_setRightBarButtonItem:", 0);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "enrollmentMode");

  if (v11 != 2 && v11 != 4)
  {
    -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->didOverrideHiddenBackButtonVisibility = objc_msgSend(v13, "hidesBackButton");

    -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidesBackButton:", 0);

    objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 1);
    -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backBarButtonItem");
    v18 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    overriddenBackItemBackBarButtonItem = self->overriddenBackItemBackBarButtonItem;
    self->overriddenBackItemBackBarButtonItem = v18;

    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "VTUIDeviceSpecificString:", CFSTR("BUTTON_NAV_BACK"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v21, 0, self, sel_returnFromVoiceSelectionToIntroView_);
    -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navigationBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "backItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackBarButtonItem:", v22);

  }
  v26 = -[VTUIVoiceSelectionViewController initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:]([VTUIVoiceSelectionViewController alloc], "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", v4, v9, 0, 0, self);
  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = v26;

  -[VTUIVoiceSelectionViewController willMoveToParentViewController:](self->_voiceSelectionViewController, "willMoveToParentViewController:", self);
  -[VTUIEnrollTrainingViewController addChildViewController:](self, "addChildViewController:", self->_voiceSelectionViewController);
  -[VTUIVoiceSelectionViewController didMoveToParentViewController:](self->_voiceSelectionViewController, "didMoveToParentViewController:", self);
  -[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v28, "setAutoresizesSubviews:", 0);
  -[VTUIEnrollTrainingViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v28);

  v40 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v28, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v45;
  objc_msgSend(v28, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leftAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v39;
  objc_msgSend(v28, "rightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v33;
  objc_msgSend(v28, "bottomAnchor");
  v42 = v4;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v38);

}

- (void)returnFromVoiceSelectionToIntroView:(id)a3
{
  void *v4;
  VTUIVoiceSelectionViewController *voiceSelectionViewController;
  void *v6;
  NSArray *existingRightBarButtonItems;

  -[VTUIEnrollTrainingViewController _resetBackBarButtonItem](self, "_resetBackBarButtonItem", a3);
  -[VTUIVoiceSelectionViewController removeFromParentViewController](self->_voiceSelectionViewController, "removeFromParentViewController");
  -[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = 0;

  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItems:", self->_existingRightBarButtonItems);

  existingRightBarButtonItems = self->_existingRightBarButtonItems;
  self->_existingRightBarButtonItems = 0;

  -[VTUIEnrollTrainingViewController _showIntroView](self, "_showIntroView");
}

- (void)_resetBackBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *overriddenBackItemBackBarButtonItem;

  if (self->didOverrideHiddenBackButtonVisibility)
  {
    -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidesBackButton:", 1);

    self->didOverrideHiddenBackButtonVisibility = 0;
  }
  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackBarButtonItem:", self->overriddenBackItemBackBarButtonItem);

  overriddenBackItemBackBarButtonItem = self->overriddenBackItemBackBarButtonItem;
  self->overriddenBackItemBackBarButtonItem = 0;

  objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 0);
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4 randomlySelected:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *disambiguatedLanguageOption;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  v11 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315650;
    v25 = "-[VTUIEnrollTrainingViewController voiceSelectionController:didSelectVoice:randomlySelected:]";
    v26 = 2112;
    v27 = v9;
    v28 = 2048;
    v29 = objc_msgSend(v13, "enrollmentMode");
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s voice: %@, enrollment: %ld", (uint8_t *)&v24, 0x20u);

  }
  -[VTUIEnrollTrainingViewController _resetBackBarButtonItem](self, "_resetBackBarButtonItem");
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  if (disambiguatedLanguageOption)
    -[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:](self, "_processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:", disambiguatedLanguageOption, 0);
  -[VTUIAudioHintPlayer setOutputVoice:](self->_audioHintPlayer, "setOutputVoice:", v9);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLanguageCode:outputVoice:", self->_spokenLanguageCode, v9);

  v16 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315138;
    v25 = "-[VTUIEnrollTrainingViewController voiceSelectionController:didSelectVoice:randomlySelected:]";
    _os_log_impl(&dword_229EF7000, v16, OS_LOG_TYPE_DEFAULT, "%s resetting trigger phrase and training hints - voiceSelection", (uint8_t *)&v24, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet](self, "_setInitialTriggerPhraseIfNotSet");
  -[VTUIEnrollTrainingViewController _setupTrainingStates](self, "_setupTrainingStates");
  -[VTUIEnrollTrainingViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[VTUIEnrollTrainingViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectedVoice:recognitionLanguageCode:", v9, self->_spokenLanguageCode);

  }
  -[VTUIEnrollTrainingViewController _logVoiceSelection:randomlySelected:](self, "_logVoiceSelection:randomlySelected:", v9, v5);
  self->_voiceSelected = 1;
  -[VTUIEnrollTrainingViewController _resetRightBarButtonItems](self, "_resetRightBarButtonItems");
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "enrollmentMode");

  if (v21 == 3)
  {
    -[VTUIEnrollTrainingViewController _finishSiriSetup](self, "_finishSiriSetup");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "assistantIsEnabled");

    if ((v23 & 1) != 0)
      -[VTUIEnrollTrainingViewController _proceedAfterVoiceSelectionOrSkip](self, "_proceedAfterVoiceSelectionOrSkip");
    else
      -[VTUIEnrollTrainingViewController _continueToTrainingFromVoiceSelection](self, "_continueToTrainingFromVoiceSelection");
  }

}

- (void)_logVoiceSelection:(id)a3 randomlySelected:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __72__VTUIEnrollTrainingViewController__logVoiceSelection_randomlySelected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageCode"));

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("voiceName"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("randomlySelected"));

  return v2;
}

- (void)_hideIntroView
{
  void *v3;
  VTUIEnrollmentSetupIntroViewControlling *introViewController;
  _QWORD v5[5];
  _QWORD v6[5];

  if (-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable"))
  {
    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke;
    v6[3] = &unk_24F33DA28;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke_2;
    v5[3] = &unk_24F33DA50;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v6, v5, 0.3, 0.0);
  }
  else
  {
    -[VTUIEnrollmentSetupIntroViewControlling view](self->_introViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    introViewController = self->_introViewController;
    self->_introViewController = 0;

  }
}

void __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)_continueToTrainingFromIntro
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  VTUIEnrollTrainingViewController *v11;
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VTUIEnrollTrainingViewController _continueToTrainingFromIntro]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v4 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke;
  aBlock[3] = &unk_24F33DA00;
  objc_copyWeak(&v15, (id *)buf);
  v5 = _Block_copy(aBlock);
  v7 = v4;
  v8 = 3221225472;
  v9 = __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke_2;
  v10 = &unk_24F33DD10;
  objc_copyWeak(&v13, (id *)buf);
  v11 = self;
  v6 = v5;
  v12 = v6;
  -[VTUIEnrollTrainingViewController _warnForLanguageCompatibilityIfNecessary:](self, "_warnForLanguageCompatibilityIfNecessary:", &v7);
  if (-[VTUIEnrollTrainingViewController _isGreyMatterAvailable](self, "_isGreyMatterAvailable", v7, v8, v9, v10, v11))
    -[VTUIEnrollTrainingViewController _playSoundForStageAfterDelay:](self, "_playSoundForStageAfterDelay:", 0.3);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_hideIntroView");
    WeakRetained = v2;
  }

}

void __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (objc_msgSend(WeakRetained[135], "isLaterButtonAvailable"))
    {
      v3 = v7;
      v4 = v7[133] == (id)4;
    }
    else
    {
      v4 = 1;
      v3 = v7;
    }
    objc_msgSend(v3[155], "hideSkipButton:", v4);
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "enrollmentMode");

    if (v6 != 4)
      objc_msgSend(v7, "_setAssistantEnabled:", 1);
    objc_msgSend(v7[141], "setVoiceTrainingStarted:", objc_msgSend(v7[141], "voiceTrainingStarted") + 1);
    objc_msgSend(*(id *)(a1 + 32), "_startTrainingIfNecessaryWithViewCleanupBlock:", *(_QWORD *)(a1 + 40));
    WeakRetained = v7;
  }

}

- (void)_continueToTrainingFromLanguageOptions
{
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD aBlock[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VTUIEnrollTrainingViewController _continueToTrainingFromLanguageOptions]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__VTUIEnrollTrainingViewController__continueToTrainingFromLanguageOptions__block_invoke;
  aBlock[3] = &unk_24F33DA00;
  objc_copyWeak(&v8, (id *)buf);
  v4 = _Block_copy(aBlock);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enrollmentMode") == 4;

  if (!v6)
    -[VTUIEnrollTrainingViewController _setAssistantEnabled:](self, "_setAssistantEnabled:", 1);
  -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 0);
  -[VTUIAnalytics setVoiceTrainingStarted:](self->_analyticsEvent, "setVoiceTrainingStarted:", -[VTUIAnalytics voiceTrainingStarted](self->_analyticsEvent, "voiceTrainingStarted") + 1);
  -[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:](self, "_startTrainingIfNecessaryWithViewCleanupBlock:", v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __74__VTUIEnrollTrainingViewController__continueToTrainingFromLanguageOptions__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[162], "removeFromSuperview");
    v2 = v3[162];
    v3[162] = 0;

    WeakRetained = v3;
  }

}

- (void)_continueToTrainingFromVoiceSelection
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VTUIEnrollTrainingViewController _continueToTrainingFromVoiceSelection]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[VTUITrainingViewMediator hideSkipButton:](self->_trainingViewMediator, "hideSkipButton:", 0);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enrollmentMode") == 4;

  if (!v5)
    -[VTUIEnrollTrainingViewController _setAssistantEnabled:](self, "_setAssistantEnabled:", 1);
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__VTUIEnrollTrainingViewController__continueToTrainingFromVoiceSelection__block_invoke;
  aBlock[3] = &unk_24F33DA00;
  objc_copyWeak(&v8, (id *)buf);
  v6 = _Block_copy(aBlock);
  -[VTUIAnalytics setVoiceTrainingStarted:](self->_analyticsEvent, "setVoiceTrainingStarted:", -[VTUIAnalytics voiceTrainingStarted](self->_analyticsEvent, "voiceTrainingStarted") + 1);
  -[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:](self, "_startTrainingIfNecessaryWithViewCleanupBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __73__VTUIEnrollTrainingViewController__continueToTrainingFromVoiceSelection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[147], "removeFromParentViewController");
    objc_msgSend(v4[147], "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    v3 = v4[147];
    v4[147] = 0;

    WeakRetained = v4;
  }

}

- (void)_startTrainingIfNecessary
{
  -[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:](self, "_startTrainingIfNecessaryWithViewCleanupBlock:", 0);
}

- (void)_startTrainingIfNecessaryWithViewCleanupBlock:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  os_log_t *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  NSString *spokenLanguageCode;
  int v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_enrollmentMode != 2)
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v9))
    {
      v10 = (os_log_t *)MEMORY[0x24BE09000];
      v11 = *MEMORY[0x24BE09000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315138;
        v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data locally", (uint8_t *)&v22, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logEventWithType:context:", 3301, &unk_24F34DDF0);

      v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315138;
        v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        _os_log_impl(&dword_229EF7000, v13, OS_LOG_TYPE_DEFAULT, "%s Enabling voice trigger", (uint8_t *)&v22, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVoiceTriggerEnabled:", 1);

    }
    else
    {
      v15 = -[VTUIEnrollTrainingViewController _hasPHSCloudDataForSpokenLanguage](self, "_hasPHSCloudDataForSpokenLanguage");
      v16 = (os_log_t *)MEMORY[0x24BE09000];
      v17 = *MEMORY[0x24BE09000];
      v18 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (v18)
        {
          v22 = 136315138;
          v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
          _os_log_impl(&dword_229EF7000, v17, OS_LOG_TYPE_DEFAULT, "%s Starting training due to no PHS data locally or in cloud", (uint8_t *)&v22, 0xCu);
        }
        if (v5)
          v5[2](v5);
        -[VTUIEnrollTrainingViewController setDidShowVoiceTriggerPrompt:](self, "setDidShowVoiceTriggerPrompt:", 1);
        -[VTUIEnrollTrainingViewController _startTraining](self, "_startTraining");
        goto LABEL_25;
      }
      if (v18)
      {
        v22 = 136315138;
        v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        _os_log_impl(&dword_229EF7000, v17, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data in cloud", (uint8_t *)&v22, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logEventWithType:context:", 3301, &unk_24F34DE18);

      v20 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        spokenLanguageCode = self->_spokenLanguageCode;
        v22 = 136315394;
        v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        v24 = 2112;
        v25 = spokenLanguageCode;
        _os_log_impl(&dword_229EF7000, v20, OS_LOG_TYPE_DEFAULT, "%s Enabling voice trigger upon profile sync for %@", (uint8_t *)&v22, 0x16u);
      }
      objc_msgSend(v7, "enableVoiceTriggerUponVoiceProfileSyncForLanguage:", self->_spokenLanguageCode);
    }
    -[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip](self, "_proceedAfterTrainingCompletionOrSkip");
LABEL_25:

    goto LABEL_26;
  }
  if (v4)
    v4[2](v4);
  v6 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315138;
    v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Starting training since we are in kVTUIEnrollmentModeTrainingUIOnly", (uint8_t *)&v22, 0xCu);
  }
  -[VTUIEnrollTrainingViewController _startTraining](self, "_startTraining");
LABEL_26:

}

- (void)_setRightBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *existingRightBarButtonItems;
  id v8;

  v4 = a3;
  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItems");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  existingRightBarButtonItems = self->_existingRightBarButtonItems;
  self->_existingRightBarButtonItems = v6;

  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v4);

}

- (void)_resetRightBarButtonItems
{
  void *v3;
  NSArray *existingRightBarButtonItems;

  -[VTUIEnrollTrainingViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItems:", self->_existingRightBarButtonItems);

  existingRightBarButtonItems = self->_existingRightBarButtonItems;
  self->_existingRightBarButtonItems = 0;

}

- (VTUIEnrollTrainingViewControllerDelegate)delegate
{
  return (VTUIEnrollTrainingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didShowVoiceTriggerPrompt
{
  return self->_didShowVoiceTriggerPrompt;
}

- (void)setDidShowVoiceTriggerPrompt:(BOOL)a3
{
  self->_didShowVoiceTriggerPrompt = a3;
}

- (VTUITrainingViewMediator)trainingViewMediator
{
  return self->_trainingViewMediator;
}

- (void)setTrainingViewMediator:(id)a3
{
  objc_storeStrong((id *)&self->_trainingViewMediator, a3);
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

- (BOOL)skipToSiriDataSharingOptInForTesting
{
  return self->_skipToSiriDataSharingOptInForTesting;
}

- (void)setSkipToSiriDataSharingOptInForTesting:(BOOL)a3
{
  self->_skipToSiriDataSharingOptInForTesting = a3;
}

- (BOOL)disambiguateLanguageOptionsForTesting
{
  return self->_disambiguateLanguageOptionsForTesting;
}

- (void)setDisambiguateLanguageOptionsForTesting:(BOOL)a3
{
  self->_disambiguateLanguageOptionsForTesting = a3;
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

- (VTUIEnrollmentLanguageOptionsView)languageOptionsView
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

- (NSString)voiceProfileAppDomain
{
  return self->_voiceProfileAppDomain;
}

- (void)setVoiceProfileAppDomain:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfileAppDomain, a3);
}

- (NSUUID)trainingAttemptUUID
{
  return self->_trainingAttemptUUID;
}

- (void)setTrainingAttemptUUID:(id)a3
{
  objc_storeStrong((id *)&self->_trainingAttemptUUID, a3);
}

- (AVAudioPlayer)audioPlayer
{
  return (AVAudioPlayer *)objc_getProperty(self, a2, 1352, 1);
}

- (void)setAudioPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1352);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_trainingAttemptUUID, 0);
  objc_storeStrong((id *)&self->_voiceProfileAppDomain, 0);
  objc_storeStrong((id *)&self->_audioHintPlayer, 0);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_myriadCoordinator, 0);
  objc_storeStrong((id *)&self->_aboutTappedSender, 0);
  objc_storeStrong((id *)&self->_languageOptionsView, 0);
  objc_storeStrong((id *)&self->_disambiguatedLanguageOption, 0);
  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
  objc_storeStrong((id *)&self->_trainingViewMediator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_onEnablementConfigurationDidLoad, 0);
  objc_storeStrong((id *)&self->overriddenBackItemBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_existingRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_pageEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_gmViewController, 0);
  objc_storeStrong((id *)&self->_educationViewController, 0);
  objc_storeStrong((id *)&self->_vtConfirmationViewController, 0);
  objc_storeStrong((id *)&self->_successView, 0);
  objc_storeStrong((id *)&self->_introViewController, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInView, 0);
  objc_storeStrong((id *)&self->_siriDataSharingViewController, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_storeStrong((id *)&self->_latestTrainingAttemptIdentifier, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptions, 0);
  objc_storeStrong((id *)&self->_trainingPageInstructions, 0);
  objc_storeStrong((id *)&self->_hasPHSInCloudFetchQueue, 0);
  objc_storeStrong(&self->_hasPHSInCloudFetchBlock, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

@end
